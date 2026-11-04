
import argparse
import json
import sys
import time
from datetime import datetime, timezone
from pathlib import Path

ROOT = Path(__file__).resolve().parent
sys.path.insert(0, str(ROOT.parent / "motor1_setup"))
from calibrate_motor1 import SetupMotor

sys.path.insert(0, str(ROOT.parent / "motor3_limits"))
from cycle_200rpm_crc import crc8

LENGTHS = {0x06: 4, 0xD5: 4, 0x46: 4, 0x48: 4, 0xAE: 4, 0xFE: 4,
           0x15: 4, 0x1F: 7, 0x1A: 5, 0x3B: 4, 0x3A: 4, 0x35: 6,
           0x31: 5, 0x24: 5, 0x27: 5, 0x39: 5, 0x16: 7, 0x20: 7, 0x36: 8}


def now():
    return datetime.now(timezone.utc).isoformat()


class Motor2(SetupMotor):
    def __init__(self, port, journal):
        super().__init__(port, journal)
        self.address = 1
        self.mode = 0
        self.accept_modes = None
        self.accept_addresses = None
        self.bad_frames = 0

    def send(self, payload, address=None):
        data = bytes([self.address if address is None else address]) + bytes(payload)
        packet = data + bytes([0x6B if self.mode == 0 else crc8(data)])
        self.event(tx=packet.hex(" "), checksum_mode=self.mode)
        self.ser.write(packet)

    def receive(self, command, timeout=0.5):
        deadline = time.monotonic() + timeout
        while True:
            for index, reply in enumerate(self.pending):
                if reply[1] == command:
                    return self.pending.pop(index)
            while len(self.buffer) >= 2:
                addresses = self.accept_addresses or (self.address,)
                modes = self.accept_modes or (self.mode,)
                if self.buffer[0] not in addresses:
                    self.event(discarded_byte=self.buffer.pop(0))
                    continue
                code = self.buffer[1]
                if code == 0x42:
                    if len(self.buffer) < 4:
                        break
                    length = self.buffer[2]
                    if length != 37:
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
                valid = any(reply[-1] == (0x6B if mode == 0 else crc8(reply[:-1])) for mode in modes)
                self.event(rx=reply.hex(" "), checksum_valid=valid)
                if not valid:
                    self.bad_frames += 1
                    continue
                if code == command:
                    return reply
                self.pending.append(reply)
            if time.monotonic() >= deadline:
                raise TimeoutError(f"No validated reply for {command:02x}")
            self.buffer.extend(self.ser.read(self.ser.in_waiting or 1))

    def action(self, payload, ack_timeout=1):
        reply = super().action(payload, ack_timeout)
        time.sleep(0.1)
        return reply

    def config(self):
        result = self.consistent([0x42, 0x6C])
        if (result[2:4] != bytes.fromhex("25 18") or result[5] not in (0, 1)
                or result[7] != 2 or result[22] != 5 or result[24] != self.mode):
            raise RuntimeError("Unexpected X42 configuration format")
        return result

    def set_checksum(self, config, mode, save=False):
        body = bytearray(config[4:-1])
        body[20] = mode
        previous = self.mode
        self.accept_modes = (previous, mode)
        self.send(bytes([0x48, 0xD1, int(save)]) + body)
        ack = None
        try:
            ack = self.receive(0x48, timeout=1)
        except TimeoutError:
            self.event(checksum_ack_missing=True)
        finally:
            self.accept_modes = None
        time.sleep(0.15)
        self.mode = mode
        observed = self.config()
        if observed[4:-1] != body:
            raise RuntimeError("Checksum transition changed other parameters")
        return dict(ack=None if ack is None else ack.hex(" "), save=save, mode=mode)

    def read_address(self):
        replies = []
        for _ in range(3):
            for attempt in range(3):
                self.send([0x15], address=0)
                try:
                    reply = self.receive(0x15)
                    break
                except TimeoutError:
                    if attempt == 2:
                        raise
            if reply[0] != self.address or reply[2] != self.address:
                raise RuntimeError("Broadcast address readback differs from selected motor")
            replies.append(reply.hex(" "))
        return replies

    def save_closed_loop(self):
        config = self.config()
        body = bytearray(config[4:-1])
        body[1] = 1
        ack = self.action(bytes([0x48, 0xD1, 1]) + body)
        observed = self.config()
        if observed[4:-1] != body:
            raise RuntimeError("Closed-loop configuration readback mismatch")
        return dict(ack=ack.hex(" "), save=True, only_changed_parameter="control_mode")

    def save_address2(self):
        self.accept_addresses = (1, 2)
        self.send([0xAE, 0x4B, 1, 2])
        ack = None
        try:
            ack = self.receive(0xAE, timeout=1)
            if ack[2] != 2:
                raise RuntimeError(f"Address command rejected: {ack.hex(' ')}")
            self.address = 2
        except TimeoutError:
            self.event(address_ack_missing=True)
            self.address = 2
        finally:
            self.accept_addresses = None
        time.sleep(0.2)
        verified = self.read_address()
        if ack is None:
            raise RuntimeError("Address is 2, but the save ACK was not validated; no action retry")
        return dict(ack=ack.hex(" "), readbacks=verified, save=True)


def execute(port):
    stamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    raw_path = ROOT / f"{stamp}_setup_serial.jsonl"
    summary_path = ROOT / f"{stamp}_setup_summary.json"
    report = dict(started_at_utc=now(), motor_name="motor2_42", port=port, baud=115200,
                  initial_address=1, requested_address=2, passed=False, stage="identify",
                  raw_serial_file=str(raw_path), summary_file=str(summary_path),
                  reboot_tested=False, mechanical_endstops_calibrated=False)
    original = None
    temporary_crc = False
    actions_started = False
    with raw_path.open("x", encoding="utf-8") as journal:
        motor = Motor2(port, journal)
        try:
            version = motor.consistent([0x1F])
            options = motor.consistent([0x1A])
            if version[2:6] != bytes.fromhex("00 ce 23 14") or options[2:4] != bytes.fromhex("00 00"):
                raise RuntimeError("Connected drive differs from identified motor 2 (42, X, open loop)")
            original = motor.config()
            if original[16:18] != bytes.fromhex("0b b8"):
                raise RuntimeError("Expected existing 3 A current cap")
            report.update(version=version.hex(" "), original_options=options.hex(" "),
                          original_configuration=original.hex(" "),
                          original_heartbeat=motor.consistent([0x16]).hex(" "),
                          original_rl=motor.consistent([0x20]).hex(" "),
                          address_before=motor.read_address())
            before = motor.snapshot()
            if abs(before["speed_rpm"]) > 1:
                raise RuntimeError("Expected stationary unloaded motor before setup")
            report["initial"] = before
            backup = ROOT / f"{stamp}_original_parameters.json"
            backup.write_text(json.dumps(report, indent=2), encoding="utf-8")
            report["original_parameters_file"] = str(backup)

            report["stage"] = "temporary_crc"
            temporary_crc = True
            report["temporary_crc"] = motor.set_checksum(original, 2)
            report["stage"] = "enable_closed_loop"
            actions_started = True
            report["closed_loop_save"] = motor.save_closed_loop()
            report["closed_options"] = motor.options()
            motor.idle()
            report["stage"] = "calibrate"
            print("Starting unloaded motor 2 encoder calibration", flush=True)
            report["calibration"] = motor.calibrate(motor.snapshot(require_ready=True))
            print("Calibration verified; saving X firmware and address 2", flush=True)
            report["stage"] = "save_x"
            motor.idle()
            report["x_save_ack"] = motor.action([0xD5, 0x69, 1, 0]).hex(" ")
            options = motor.options()
            if options["firmware"] != "X":
                raise RuntimeError("Expected X firmware")
            report["final_options"] = options
            report["stage"] = "save_address2"
            motor.idle()
            report["address_saved"] = motor.save_address2()
            report["stage"] = "verify_crc"
            report["samples"] = []
            for _ in range(30):
                sample = motor.snapshot(require_ready=True)
                if sample["motor_flags"] != 3 or abs(sample["speed_rpm"]) > 1:
                    raise RuntimeError(f"Motor not healthy and stationary: {sample}")
                report["samples"].append(sample)
                time.sleep(0.05)
            report["final_rl"] = motor.consistent([0x20]).hex(" ")
            if any(int.from_bytes(bytes.fromhex(report["final_rl"])[index:index+2], "big") == 0 for index in (2, 4)):
                raise RuntimeError("R/L parameter readback is zero")
            report["setup_actions_completed"] = True
        except (Exception, KeyboardInterrupt) as exc:
            report["error"] = f"{type(exc).__name__}: {exc}"
        finally:
            if actions_started:
                try:
                    motor.action([0xFE, 0x98, 0])
                    report["stationary_before_restore"] = motor.idle()
                except (Exception, KeyboardInterrupt) as exc:
                    report["stop_error"] = f"{type(exc).__name__}: {exc}"
            if temporary_crc:
                try:
                    current = motor.config()
                    report["checksum_restore"] = motor.set_checksum(current, 0, save=True)
                    restored = motor.config()
                    expected = bytearray(original[4:-1])
                    expected[1] = current[5]
                    if restored[4:-1] != expected:
                        raise RuntimeError("Restored configuration differs from original plus closed loop")
                    report["final_configuration"] = restored.hex(" ")
                    report["final_address_readbacks"] = motor.read_address()
                    report["final_options_fixed6b"] = motor.options()
                    report["final_heartbeat"] = motor.consistent([0x16]).hex(" ")
                    if (bytes.fromhex(report["final_heartbeat"])[2:-1]
                            != bytes.fromhex(report["original_heartbeat"])[2:-1]):
                        raise RuntimeError("Heartbeat differs from original")
                    report["final"] = motor.idle(seconds=1)
                    report["final_address"] = motor.address
                except (Exception, KeyboardInterrupt) as exc:
                    report["cleanup_error"] = f"{type(exc).__name__}: {exc}"
            motor.ser.close()
            report["passed"] = (report.get("setup_actions_completed", False)
                                and "error" not in report and "stop_error" not in report
                                and "cleanup_error" not in report and report.get("final_address") == 2)
            report["rejected_frames"] = motor.bad_frames
            report["finished_at_utc"] = now()
            summary_path.write_text(json.dumps(report, ensure_ascii=False, indent=2), encoding="utf-8")
    return report


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--execute", action="store_true")
    parser.add_argument("--port", default="COM7")
    args = parser.parse_args()
    if not args.execute:
        print("No serial access. --execute calibrates an unloaded motor and saves X / address 2.")
        return 0
    report = execute(args.port)
    print(json.dumps({k: v for k, v in report.items() if k not in ("calibration", "samples")}, indent=2), flush=True)
    return 0 if report["passed"] else 1


if __name__ == "__main__":
    raise SystemExit(main())
