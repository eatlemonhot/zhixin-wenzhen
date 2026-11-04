"""配置COM7上的空载42电机。

    只读查询支持重试，动作命令单次发送，沿用当前标定与电流设置。"""
import argparse
import json
import time
from datetime import datetime, timezone
from pathlib import Path

ROOT = Path(__file__).resolve().parent
LENGTHS = {0x06: 4, 0xD5: 4, 0xFE: 4, 0x1F: 7, 0x1A: 5,
           0x3B: 4, 0x3A: 4, 0x35: 6, 0x31: 5, 0x24: 5,
           0x27: 5, 0x39: 5, 0x16: 7, 0x20: 7, 0x36: 8}


def utc_now():
    return datetime.now(timezone.utc).isoformat()


def signed(reply):
    if reply[2] not in (0, 1):
        raise RuntimeError("Invalid sign byte")
    return (-1 if reply[2] else 1) * int.from_bytes(reply[3:-1], "big")


class SetupMotor:
    def __init__(self, port, journal):
        import serial
        self.ser = serial.Serial(port, 115200, timeout=0.05, write_timeout=0.2)
        self.journal = journal
        self.buffer = bytearray()
        self.pending = []
        self.emm = True

    def event(self, **data):
        self.journal.write(json.dumps(dict(time_utc=utc_now(), **data)) + "\n")
        self.journal.flush()

    def send(self, payload):
        packet = b"\x01" + bytes(payload) + b"\x6b"
        self.event(tx=packet.hex(" "))
        self.ser.write(packet)

    def receive(self, command, timeout=0.5):
        deadline = time.monotonic() + timeout
        while True:
            for index, reply in enumerate(self.pending):
                if reply[1] == command:
                    return self.pending.pop(index)
            while len(self.buffer) >= 2:
                if self.buffer[0] != 1:
                    self.event(discarded_byte=self.buffer.pop(0))
                    continue
                code = self.buffer[1]
                if code == 0x42:
                    if len(self.buffer) < 4:
                        break
                    length = self.buffer[2]
                    if length not in (33, 37):
                        self.event(discarded_byte=self.buffer.pop(0))
                        continue
                else:
                    length = LENGTHS.get(code)
                    if length is None:
                        self.event(discarded_byte=self.buffer.pop(0))
                        continue
                if len(self.buffer) < length:
                    break
                reply = bytes(self.buffer[:length])
                del self.buffer[:length]
                self.event(rx=reply.hex(" "), valid_framing=reply[-1] == 0x6B)
                if reply[-1] != 0x6B:
                    raise RuntimeError("Damaged reply framing")
                if code == command:
                    return reply
                self.pending.append(reply)
            if time.monotonic() >= deadline:
                raise TimeoutError(f"No reply for {command:02x}")
            self.buffer.extend(self.ser.read(self.ser.in_waiting or 1))

    def query(self, payload):
        for attempt in range(3):
            self.send(payload)
            try:
                return self.receive(payload[0])
            except TimeoutError:
                if attempt == 2:
                    raise

    def consistent(self, payload):
        replies = [self.query(payload) for _ in range(3)]
        if len(set(replies)) != 1:
            raise RuntimeError(f"Inconsistent repeated readback: {payload}")
        return replies[0]

    def action(self, payload, ack_timeout=1):
        self.send(payload)  # Never retry calibration or configuration commands.
        reply = self.receive(payload[0], ack_timeout)
        if reply[2] != 2:
            raise RuntimeError(f"Action rejected: {reply.hex(' ')}")
        return reply

    def options(self):
        reply = self.consistent([0x1A])
        value = int.from_bytes(reply[2:4], "big")
        self.emm = bool(value & 2)
        if not value & 4 or (value >> 8) & 3 >= 2:
            raise RuntimeError("Calibration requires closed loop and unlocked parameters")
        return dict(raw=reply.hex(" "), firmware="Emm" if self.emm else "X",
                    closed_loop=True, step_angle_deg=0.9 if value & 1 else 1.8)

    def snapshot(self, require_ready=False):
        home = self.query([0x3B])[2]
        flags = self.query([0x3A])[2]
        sample = dict(home_flags=home, motor_flags=flags,
                      encoder=int.from_bytes(self.query([0x31])[2:4], "big"),
                      speed_rpm=signed(self.query([0x35])) / (1 if self.emm else 10),
                      phase_current_ma=int.from_bytes(self.query([0x27])[2:4], "big"),
                      voltage_v=int.from_bytes(self.query([0x24])[2:4], "big") / 1000,
                      temperature_c=signed(self.query([0x39])))
        self.event(sample=sample)
        if home & 0x30 or flags & 8:
            raise RuntimeError(f"Protection active: {sample}")
        if not 10.5 <= sample["voltage_v"] <= 13.5 or not -20 <= sample["temperature_c"] < 60:
            raise RuntimeError(f"Supply/temperature outside this 12 V session: {sample}")
        if not 0 <= sample["phase_current_ma"] <= 3100:
            raise RuntimeError(f"Current exceeds existing 3 A setting: {sample}")
        if require_ready and (home != 3 or not flags & 1):
            raise RuntimeError(f"Expected calibrated, enabled motor: {sample}")
        return sample

    def idle(self, seconds=1, timeout=8):
        deadline = time.monotonic() + timeout
        stable = None
        while time.monotonic() < deadline:
            sample = self.snapshot(require_ready=True)
            if abs(sample["speed_rpm"]) <= 1:
                stable = time.monotonic() if stable is None else stable
                if time.monotonic() - stable >= seconds:
                    return sample
            else:
                stable = None
            time.sleep(0.1)
        raise TimeoutError("Motor did not settle")

    def calibrate(self, before):
        started = time.monotonic()
        self.event(calibration_started=True)
        self.send([0x06, 0x45])
        ack = None
        samples = []
        activity = False
        stable = None
        last_encoder = before["encoder"]
        travel = 0.0
        while time.monotonic() - started < 120:
            if ack is None:
                try:
                    ack = self.receive(0x06, timeout=0.2)
                    if ack[2] != 2:
                        raise RuntimeError(f"Calibration rejected: {ack.hex(' ')}")
                except TimeoutError:
                    pass
            try:
                sample = self.snapshot()
            except TimeoutError:
                self.event(calibration_query_temporarily_unavailable=True)
                # Firmware may be busy in its autonomous calibration routine.
                # Never resend calibration; keep the total deadline bounded.
                time.sleep(0.2)
                continue
            samples.append(sample)
            delta = ((sample["encoder"] - last_encoder + 32768) % 65536) - 32768
            travel += abs(delta) * 360 / 65536
            last_encoder = sample["encoder"]
            activity |= travel > 5 or abs(sample["speed_rpm"]) > 1 or sample["home_flags"] & 3 != 3
            elapsed = time.monotonic() - started
            if ack is not None and activity and elapsed > 5 and sample["home_flags"] == 3 and abs(sample["speed_rpm"]) <= 1:
                stable = time.monotonic() if stable is None else stable
                if time.monotonic() - stable >= 1:
                    return dict(ack=ack.hex(" "), elapsed_s=elapsed,
                                observed_encoder_travel_deg=travel,
                                observed_activity=activity, samples=samples,
                                final=self.idle())
            else:
                stable = None
            time.sleep(0.1)
        raise TimeoutError("Calibration completion not verified within 120 seconds")


def run(port):
    stamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    path = ROOT / f"{stamp}_setup_summary.json"
    raw_path = ROOT / f"{stamp}_setup_serial.jsonl"
    report = dict(started_at_utc=utc_now(), user_motor_name="motor 1 (42)", port=port,
                  protocol_address=1, baud=115200, passed=False, stage="identify",
                  summary_file=str(path), raw_serial_file=str(raw_path))
    with raw_path.open("x", encoding="utf-8") as journal:
        motor = SetupMotor(port, journal)
        action_started = False
        try:
            version = motor.consistent([0x1F])
            if version[2:6] != bytes.fromhex("00 ce 23 14"):
                raise RuntimeError("Connected drive differs from the identified 42 motor")
            report["version"] = version.hex(" ")
            report["initial_options"] = motor.options()
            config = motor.consistent([0x42, 0x6C])
            expected_length = 33 if motor.emm else 37
            if len(config) != expected_length or config[2] != expected_length:
                raise RuntimeError("Configuration format does not match firmware options")
            report["original_configuration"] = config.hex(" ")
            report["original_heartbeat"] = motor.consistent([0x16]).hex(" ")
            report["original_rl"] = motor.consistent([0x20]).hex(" ")
            backup = ROOT / f"{stamp}_original_parameters.json"
            backup.write_text(json.dumps(report, indent=2), encoding="utf-8")
            report["original_parameters_file"] = str(backup)
            current_slice = slice(14, 16) if motor.emm else slice(16, 18)
            if int.from_bytes(config[current_slice], "big") != 3000:
                raise RuntimeError("Unexpected current configuration; no action sent")
            report["initial"] = motor.idle()
            report["stage"] = "calibrate"
            print("Starting unloaded encoder calibration (one command)", flush=True)
            action_started = True
            report["calibration"] = motor.calibrate(report["initial"])
            print("Encoder calibration completed and stationary", flush=True)
            report["stage"] = "switch_to_x"
            report["before_switch"] = motor.idle()
            if motor.emm:
                report["switch_ack"] = motor.action([0xD5, 0x69, 1, 0]).hex(" ")
                time.sleep(0.3)
            report["final_options"] = motor.options()
            if motor.emm:
                raise RuntimeError("X firmware readback was not verified")
            report["final_configuration"] = motor.consistent([0x42, 0x6C]).hex(" ")
            report["final_rl"] = motor.consistent([0x20]).hex(" ")
            report["final_heartbeat"] = motor.consistent([0x16]).hex(" ")
            report["stage"] = "verify_x"
            report["final"] = motor.idle(seconds=2, timeout=15)
            report["x_selection_saved"] = True
            report["reboot_tested"] = False
            report["passed"] = True
        except (Exception, KeyboardInterrupt) as exc:
            report["error"] = f"{type(exc).__name__}: {exc}"
        finally:
            try:
                if action_started:
                    motor.action([0xFE, 0x98, 0])
                    report["exit_speed_rpm"] = signed(motor.query([0x35])) / (1 if motor.emm else 10)
                    if abs(report["exit_speed_rpm"]) > 1:
                        raise RuntimeError("Standstill not verified on exit")
            except (Exception, KeyboardInterrupt) as exc:
                report["cleanup_error"] = f"{type(exc).__name__}: {exc}"
                report["passed"] = False
            motor.ser.close()
            report["finished_at_utc"] = utc_now()
            path.write_text(json.dumps(report, ensure_ascii=False, indent=2), encoding="utf-8")
    return report


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--port", default="COM7")
    parser.add_argument("--execute", action="store_true", help="Perform calibration and save X selection")
    args = parser.parse_args()
    if not args.execute:
        print("No serial port opened. Use --execute only for the identified, unloaded motor 1.")
        return 0
    report = run(args.port)
    print(json.dumps({k: v for k, v in report.items() if k != "calibration"}, indent=2), flush=True)
    return 0 if report["passed"] else 1


if __name__ == "__main__":
    raise SystemExit(main())
