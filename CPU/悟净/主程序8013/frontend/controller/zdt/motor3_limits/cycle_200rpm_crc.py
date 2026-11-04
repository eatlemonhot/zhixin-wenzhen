
import argparse
import json
import time
from pathlib import Path

from cycle_200rpm import CycleMotor, run_cycles, validate_plan
from motor3 import ROOT, u16


def table_entry(value):
    for _ in range(8):
        value = (value >> 1) ^ (0x8C if value & 1 else 0)
    return value


def crc8(data):
    if not data:
        raise ValueError("CRC needs at least one byte")
    value = data[0]
    for byte in data[1:]:
        value = table_entry(value ^ byte)
    return value


def frame(data, mode):
    data = bytes(data)
    return data + bytes([0x6B if mode == 0 else crc8(data)])


def valid_reply(reply, length, command, mode, address=1):
    return (len(reply) == length and reply[:2] == bytes([address, command])
            and reply[-1] == (0x6B if mode == 0 else crc8(reply[:-1])))


class CRCMotor(CycleMotor):
    def __init__(self, limits, stop_file=None):
        self.checksum_mode = 0
        self.original_checksum_mode = None
        self.bad_frames = 0
        self._transport_started = False
        self.stop_file = stop_file
        super().__init__(limits)

    def check_sample(self, sample):
        super().check_sample(sample)
        if self.stop_file is not None and self.stop_file.exists():
            raise KeyboardInterrupt(f"Stop requested by {self.stop_file}")

    def exchange(self, payload, length, mode, accept_modes=None):
        tx = frame(bytes([self.address]) + bytes(payload), mode)
        self.ser.reset_input_buffer()
        self.ser.write(tx)
        reply = self.ser.read(length)
        valid = any(valid_reply(reply, length, payload[0], candidate, self.address)
                    for candidate in (accept_modes if accept_modes is not None else (mode,)))
        self.event(tx=tx.hex(" "), rx=reply.hex(" "), checksum_mode=mode,
                   checksum_valid=valid)
        if not valid:
            self.bad_frames += 1
        return reply, valid

    def detect_mode(self, preferred=None):
        first = self.checksum_mode if preferred is None else preferred
        for mode in (first, 2 if first == 0 else 0):
            for _ in range(2):
                reply, valid = self.exchange([0x1F], 7, mode)
                if valid:
                    self.checksum_mode = mode
                    return
        raise RuntimeError("Cannot establish fixed-6B or CRC-8 communication")

    def command(self, payload, length=4):
        payload = bytes(payload)
        for attempt in range(3 if length > 4 else 1):
            reply, valid = self.exchange(payload, length, self.checksum_mode)
            if valid:
                break
            time.sleep(0.01)
        if not valid:
            raise RuntimeError(f"No validated reply to {payload.hex(' ')} after {attempt + 1} attempts")
        if length == 4 and reply[2] != 2:
            raise RuntimeError(f"Command rejected: {reply.hex(' ')}")
        time.sleep(0.05 if length == 4 else 0.005)
        return reply

    def read_config(self):
        replies = [self.command([0x42, 0x6C], 37) for _ in range(3)]
        if any(reply != replies[0] for reply in replies[1:]):
            raise RuntimeError("Configuration readbacks disagree")
        config = replies[0]
        if (config[2:4] != b"\x25\x18" or config[5] != 1
                or config[7] != 2 or config[22] != 5 or config[24] != self.checksum_mode
                or config[25] != 1 or config[26] != 0 or config[27] != 1):
            raise RuntimeError(f"Unexpected X-firmware configuration: {config.hex(' ')}")
        return config

    def set_checksum(self, config, mode):
        if mode not in (0, 2):
            raise ValueError("Only fixed-6B and CRC-8 are supported")
        expected = bytearray(config[4:-1])
        expected[20] = mode
        self.event(checksum_transition=dict(from_mode=self.checksum_mode, to_mode=mode,
                                            original_config=config.hex(" "), save=0))
        self.exchange(b"\x48\xd1\x00" + expected, 4, self.checksum_mode,
                      accept_modes=(self.checksum_mode, mode))
        time.sleep(0.05)
        self.detect_mode(preferred=mode)
        if self.checksum_mode != mode:
            raise RuntimeError("Checksum change did not take effect")
        observed = self.read_config()
        if observed[4:-1] != bytes(expected):
            raise RuntimeError("Configuration changed unexpectedly; no motion permitted")

    def prepare(self):
        self.detect_mode()
        config = self.read_config()
        self.original_checksum_mode = self.checksum_mode
        self._transport_started = True
        if self.checksum_mode != 2:
            self.set_checksum(config, 2)
        self.event(transport_ready="CRC-8 verified; all other configuration bytes match")
        super().prepare()

    def close(self):
        if self.closed:
            return
        try:
            self.stop()
            if self.temporary_current:
                self.command(b"\x45\x66\x00" + u16(3000))
            if self._transport_started and self.original_checksum_mode != self.checksum_mode:
                self.set_checksum(self.read_config(), self.original_checksum_mode)
            if self.heartbeat_original is not None:
                self.command(b"\x68\x38\x00" + self.heartbeat_original)
            self.event(transport_closed=True, bad_frames=self.bad_frames,
                       restored_checksum_mode=self.checksum_mode)
        finally:
            self.ser.close()
            self.log.close()
            self.closed = True


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--cycles", type=int, default=100)
    parser.add_argument("--dry-run", action="store_true")
    parser.add_argument("--stop-file", type=Path, default=ROOT / "cycle_stop.request")
    args = parser.parse_args()
    calibration = json.loads((ROOT / "calibration.json").read_text(encoding="utf-8"))
    plan = validate_plan(calibration, args.cycles)
    if args.dry_run:
        print(json.dumps(dict(**plan, transport="temporary CRC-8, save=0"), indent=2))
        return 0
    report = run_cycles(calibration, args.cycles,
                        motor_factory=lambda limits: CRCMotor(limits, args.stop_file))
    print(f"{'PASS' if report['passed'] else 'STOPPED'}: {report['completed_cycles']}/{args.cycles} cycles")
    for key in ("error", "cleanup_error"):
        if key in report:
            print(report[key])
    print(f"Summary: {report['summary_file']}")
    return 0 if report["passed"] else 1


if __name__ == "__main__":
    raise SystemExit(main())
