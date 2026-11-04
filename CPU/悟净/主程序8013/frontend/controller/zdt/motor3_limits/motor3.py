"""Motor 3 X-firmware controller. Angle values remain authoritative.

No command runs on import. A saved coordinate is invalid after power loss,
manual displacement, or use of a different controller that resets coordinates.
"""
import argparse
import json
import math
import struct
import time
from datetime import datetime
from pathlib import Path

ROOT = Path(__file__).resolve().parent
CALIBRATION = ROOT / "calibration.json"
MOTION_PROFILE = ROOT / "motion_profile.json"
CONNECTION = ROOT / "connection.json"
MAX_MOVE_RPM = 200
MAX_ACCEL_RPM_S = 240


def u16(n):
    return struct.pack(">H", n)


def u32(n):
    return struct.pack(">I", n)


def signed_value(reply, scale=1):
    if reply[2] not in (0, 1):
        raise ValueError("Invalid sign byte")
    return (-1 if reply[2] else 1) * int.from_bytes(reply[3:-1], "big") / scale


def position_packet(degrees, rpm=15, current_ma=1500, mode=1, acceleration_rpm_s=60):
    if not math.isfinite(degrees) or not 0 < rpm <= MAX_MOVE_RPM or not 0 < current_ma <= 3000:
        raise ValueError("Invalid bounded position parameters")
    if not math.isfinite(acceleration_rpm_s) or not 1 <= acceleration_rpm_s <= MAX_ACCEL_RPM_S:
        raise ValueError(f"Acceleration must be 1 .. {MAX_ACCEL_RPM_S} RPM/s")
    acceleration = u16(round(acceleration_rpm_s))
    return (bytes([0xCD, int(degrees < 0)]) + acceleration + acceleration
            + u16(round(rpm * 10)) + u32(round(abs(degrees) * 10))
            + bytes([mode, 0]) + u16(current_ma))


def movement_rpm(requested=None):
    rpm = requested
    if rpm is None:
        profile = json.loads(MOTION_PROFILE.read_text(encoding="utf-8")) if MOTION_PROFILE.exists() else {}
        rpm = profile.get("default_rpm", 15)
    if not math.isfinite(rpm) or not 0 < rpm <= MAX_MOVE_RPM or round(rpm * 10) == 0:
        raise ValueError(f"Move speed must be 0.1 .. {MAX_MOVE_RPM} RPM")
    return round(rpm * 10) / 10


def movement_acceleration():
    profile = json.loads(MOTION_PROFILE.read_text(encoding="utf-8")) if MOTION_PROFILE.exists() else {}
    value = profile.get("acceleration_rpm_s", 60)
    if not math.isfinite(value) or not 1 <= value <= MAX_ACCEL_RPM_S:
        raise ValueError(f"Acceleration must be 1 .. {MAX_ACCEL_RPM_S} RPM/s")
    return round(value)


def bounded_target(value, limits):
    if not math.isfinite(value):
        raise ValueError("Target must be finite")
    wire = round(value * 10) / 10
    if not limits["min_deg"] <= value <= limits["max_deg"] or not limits["min_deg"] <= wire <= limits["max_deg"]:
        raise ValueError(f"Target {value} outside soft limits {limits['min_deg']} .. {limits['max_deg']} deg")
    return wire


def check_reference(sample, calibration):
    if sample["motor_flags"] & 0x80:
        raise RuntimeError("Motor has lost power since homing; run home 1 before moving")
    phase = (sample["encoder"] * 360 / 65536 - sample["position_deg"]) % 360
    error = abs((phase - calibration["origin_encoder_deg"] + 180) % 360 - 180)
    if error > 1:
        raise RuntimeError("Coordinate reference changed; repeat verified CCW homing")


class Motor:
    def __init__(self, label="session"):
        import serial
        settings = json.loads(CONNECTION.read_text(encoding="utf-8")) if CONNECTION.exists() else {}
        self.port = settings.get("port", "COM5")
        if not isinstance(self.port, str) or not self.port.upper().startswith("COM") or not self.port[3:].isdigit():
            raise ValueError("connection.json port must be an explicit Windows COM port")
        self.address = settings.get("address", 1)
        if isinstance(self.address, bool) or not isinstance(self.address, int) or not 1 <= self.address <= 255:
            raise ValueError("connection.json address must be an integer from 1 to 255")
        self.ser = serial.Serial(self.port, 115200, timeout=0.12, write_timeout=0.15)
        self.log = (ROOT / (datetime.now().strftime("%Y%m%d_%H%M%S_") + label + ".jsonl")).open("a", encoding="utf-8")
        self.heartbeat_original = None
        self.temporary_current = False
        self.closed = False

    def event(self, **data):
        self.log.write(json.dumps({"t": time.time(), **data}, ensure_ascii=False) + "\n")
        self.log.flush()

    def command(self, payload, length=4):
        tx = bytes([self.address]) + bytes(payload) + b"\x6b"
        for attempt in range(3 if length > 4 else 1):
            self.ser.reset_input_buffer()
            self.ser.write(tx)
            rx = self.ser.read(length)
            self.event(tx=tx.hex(" "), rx=rx.hex(" "), attempt=attempt)
            valid = len(rx) == length and rx[0] == self.address and rx[1] == payload[0] and rx[-1] == 0x6B
            if valid:
                break
            time.sleep(0.01)
        if not valid:
            raise RuntimeError(f"Unexpected serial reply: {rx.hex(' ')} to {tx.hex(' ')}")
        if length == 4 and rx[2] != 2:
            raise RuntimeError(f"Command rejected: {rx.hex(' ')}")
        if length == 4:
            saved_parameter = payload[0] in (0x48, 0x4C, 0x5C, 0x45, 0x68) and payload[2] == 1
            time.sleep(0.25 if saved_parameter else 0.05)
        else:
            time.sleep(0.005)
        return rx

    def snapshot(self):
        enc = int.from_bytes(self.command([0x31], 5)[2:4], "big")
        pos = signed_value(self.command([0x36], 8), 10)
        rpm = signed_value(self.command([0x35], 6), 10)
        ma = int.from_bytes(self.command([0x27], 5)[2:4], "big")
        flags = self.command([0x3C], 5)
        result = dict(encoder=enc, position_deg=pos, speed_rpm=rpm, current_ma=ma,
                      home_flags=flags[2], motor_flags=flags[3])
        self.event(sample=result)
        return result

    def identity(self):
        ver = self.command([0x1F], 7)
        opt = self.command([0x1A], 5)
        if int.from_bytes(opt[2:4], "big") & 0x82 or not (opt[3] & 4):
            raise RuntimeError("Expected unscaled X firmware and closed loop")
        return dict(version=ver.hex(" "), options=opt.hex(" "))

    def stop(self):
        failures = []
        try:
            flags = self.command([0x3C], 5)
            if flags[3] & 8:
                self.event(stop="Collision protection remains latched")
                return
            payloads = [[0xFE, 0x98, 0]]
            if flags[2] & 4:
                payloads.insert(0, [0x9C, 0x48])
        except Exception:
            payloads = [[0x9C, 0x48], [0xFE, 0x98, 0]]
        for payload in payloads:
            try:
                self.command(payload)
            except Exception as exc:
                failures.append(str(exc))
        if failures:
            self.event(stop_errors=failures)

    def prepare(self):
        self.identity()
        s = self.snapshot()
        if s["home_flags"] != 3 or s["motor_flags"] & 0x0C or abs(s["speed_rpm"]) > 1:
            raise RuntimeError(f"Motor is not idle/healthy: {s}")
        self.heartbeat_original = self.command([0x16], 7)[2:6]
        self.command(b"\x68\x38\x00" + u32(1000))
        self.temporary_current = True
        self.command(b"\x45\x66\x00" + u16(1500))
        if self.command([0x42, 0x6C], 37)[16:18] != u16(1500):
            raise RuntimeError("Current cap readback mismatch")

    @staticmethod
    def check_sample(s):
        if s["home_flags"] & 0x30 or s["motor_flags"] & 8:
            raise RuntimeError(f"Motor protection triggered: {s}")
        if s["current_ma"] > 1800:
            raise RuntimeError(f"Current exceeds probing cap: {s}")

    def move(self, degrees, rpm=15, mode=1, current_ma=1500, acceleration_rpm_s=60):
        self.command(position_packet(degrees, rpm, current_ma, mode, acceleration_rpm_s))
        return self.wait_for_position(degrees, rpm, mode)

    def wait_for_position(self, degrees, rpm, mode=1):
        start = time.monotonic()
        timeout = abs(degrees) / (rpm * 6) + 5 if mode != 1 else 40
        samples = []
        stable_since = None
        while time.monotonic() - start < timeout:
            s = self.snapshot()
            self.check_sample(s)
            samples.append(s)
            if s["current_ma"] > 1200 and abs(s["speed_rpm"]) < 3 and time.monotonic() - start > 0.5:
                raise RuntimeError("Unexpected obstacle during position movement")
            if time.monotonic() - start > 0.2 and s["motor_flags"] & 2 and abs(s["speed_rpm"]) < 0.6:
                stable_since = stable_since or time.monotonic()
                if time.monotonic() - stable_since < 0.2:
                    time.sleep(0.025)
                    continue
                if mode == 1 and abs(s["position_deg"] - degrees) > 1:
                    raise RuntimeError("Reached flag disagrees with target coordinate")
                return samples
            else:
                stable_since = None
            time.sleep(0.025)
        raise TimeoutError("Position movement timeout")

    def home(self, direction, save=False, timeout_ms=30000):
        config = (b"\x4c\xae" + bytes([int(save), 2, direction]) + u16(15)
                  + u32(timeout_ms) + u16(10) + u16(800) + u16(100) + b"\x00")
        self.command(config)
        self.command(b"\x5c\xac\x00" + u16(50))
        before = self.snapshot()
        self.command([0x9A, 2, 0])
        start = time.monotonic()
        prev_enc = before["encoder"]
        prev_time = time.monotonic()
        unwrapped = 0.0
        samples = []
        saw_running = False
        finished_at = None
        stable_since = None
        last_print = start
        while time.monotonic() - start < timeout_ms / 1000 + 2:
            s = self.snapshot()
            now = time.monotonic()
            if now - prev_time > 0.65:
                raise RuntimeError("Encoder sampling gap too long")
            delta = ((s["encoder"] - prev_enc + 32768) % 65536) - 32768
            unwrapped += delta * 360 / 65536
            prev_enc, prev_time = s["encoder"], now
            s["unwrapped_deg"] = unwrapped
            s["elapsed_s"] = now - start
            samples.append(s)
            self.check_sample(s)
            if s["home_flags"] & 8:
                raise RuntimeError("Firmware reports homing failure")
            if s["home_flags"] & 4:
                saw_running = True
            elif saw_running:
                if finished_at is None:
                    finished_at = now
                if abs(s["speed_rpm"]) < 0.6:
                    stable_since = stable_since or now
                else:
                    stable_since = None
                if stable_since is None or now - stable_since < 0.25:
                    if now - finished_at > 2:
                        raise RuntimeError("Homing release did not settle")
                    time.sleep(0.02)
                    continue
                self.event(home_complete=dict(direction=direction, displacement_deg=unwrapped))
                print(json.dumps(dict(home_complete=True, direction=direction, displacement_deg=unwrapped, final=s)), flush=True)
                return {"direction": direction, "displacement_deg": unwrapped, "before": before, "samples": samples}
            if abs(unwrapped) > 3000:
                raise RuntimeError("Probe travel exceeds 8.33 revolutions")
            if now - last_print > 1:
                print(json.dumps(s), flush=True)
                last_print = now
            time.sleep(0.02)
        raise TimeoutError("Homing did not finish")

    def close(self):
        if self.closed:
            return
        try:
            self.stop()
            if self.temporary_current:
                self.command(b"\x45\x66\x00" + u16(3000))
            if self.heartbeat_original is not None:
                self.command(b"\x68\x38\x00" + self.heartbeat_original)
        finally:
            self.ser.close()
            self.log.close()
            self.closed = True


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("action", choices=["status", "jog", "home", "stop", "move-deg", "move-percent"])
    p.add_argument("value", type=float, nargs="?", default=0)
    p.add_argument("--rpm", type=float, help="Ordinary move speed; defaults to verified motion profile")
    args = p.parse_args()
    if args.rpm is not None and args.action not in ("move-deg", "move-percent"):
        p.error("--rpm is supported for move-deg and move-percent only; homing stays at 15 RPM")
    if args.action in ("move-deg", "move-percent"):
        if not CALIBRATION.exists():
            p.error("No validated limits file")
        offline_calibration = json.loads(CALIBRATION.read_text(encoding="utf-8"))
        limits = offline_calibration["limits"]
        try:
            target = args.value
            if args.action == "move-percent":
                if not 0 <= target <= 100:
                    raise ValueError("Percent must be between 0 and 100")
                target = limits["min_deg"] + target / 100 * (limits["max_deg"] - limits["min_deg"])
            bounded_target(target, limits)
            movement_rpm(args.rpm)
            movement_acceleration()
        except ValueError as exc:
            p.error(str(exc))
    m = Motor(args.action)
    try:
        if args.action == "status":
            print(json.dumps({**m.identity(), **m.snapshot()}, indent=2))
        elif args.action == "stop":
            m.stop()
        else:
            if args.action == "home":
                if args.value not in (0, 1):
                    raise ValueError("Homing direction must be 0 (CW) or 1 (CCW)")
                # Invalidate BEFORE any operation that can reset the coordinate.
                m.command([0x50, 1])
                state = m.snapshot()
                if state["home_flags"] & 0x30:
                    raise RuntimeError("Overcurrent/overheat must be resolved before homing")
                if state["motor_flags"] & 8:
                    m.temporary_current = True
                    m.command(b"\x45\x66\x00" + u16(1500))
                    m.command([0x0E, 0x52])
                    m.command([0xFE, 0x98, 0])
                    m.command([0xF3, 0xAB, 1, 0])
                    m.command([0xFE, 0x98, 0])
            m.prepare()
            calibration = json.loads(CALIBRATION.read_text(encoding="utf-8")) if CALIBRATION.exists() else None
            if args.action == "jog":
                if abs(args.value) > 90:
                    raise ValueError("Diagnostic jog is limited to 90 degrees")
                if calibration:
                    sample = m.snapshot()
                    check_reference(sample, calibration)
                    target = bounded_target(sample["position_deg"] + args.value, calibration["limits"])
                    samples = m.move(target, current_ma=1200)
                else:
                    samples = m.move(args.value, rpm=15, mode=2, current_ma=1200)
                print(json.dumps(samples[-1], indent=2))
            elif args.action in ("move-deg", "move-percent"):
                if not calibration:
                    raise RuntimeError("No validated limits file")
                limits = calibration["limits"]
                target = args.value
                if args.action == "move-percent":
                    if not 0 <= target <= 100:
                        raise ValueError("Percent must be between 0 and 100")
                    target = limits["min_deg"] + target / 100 * (limits["max_deg"] - limits["min_deg"])
                target = bounded_target(target, limits)
                check_reference(m.snapshot(), calibration)
                samples = m.move(target, rpm=movement_rpm(args.rpm), acceleration_rpm_s=movement_acceleration())
                print(json.dumps(samples[-1], indent=2))
            else:
                if args.value not in (0, 1):
                    raise ValueError("Homing direction must be 0 (CW) or 1 (CCW)")
                result = m.home(int(args.value))
                result_path = ROOT / (f"rehome_{int(args.value)}.json" if calibration else f"home_{int(args.value)}.json")
                result_path.write_text(json.dumps(result, indent=2), encoding="utf-8")
                if calibration:
                    if args.value == 1:
                        sample = m.snapshot()
                        phase = (sample["encoder"] * 360 / 65536 - sample["position_deg"]) % 360
                        error = abs((phase - calibration["origin_encoder_deg"] + 180) % 360 - 180)
                        if error > 3:
                            raise RuntimeError("Homing repeat differs by >3 degrees; recalibration required")
                        calibration["origin_encoder_deg"] = phase
                        calibration["last_verified_home"] = datetime.now().isoformat()
                        CALIBRATION.write_text(json.dumps(calibration, ensure_ascii=False, indent=2), encoding="utf-8")
                        m.command([0x50, 0])
                        m.move(bounded_target(calibration["limits"]["min_deg"], calibration["limits"]))
    finally:
        m.close()


if __name__ == "__main__":
    main()
