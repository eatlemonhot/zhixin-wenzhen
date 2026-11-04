"""悟净CPU控制两路舵机；导入不访问硬件，默认命令仅查询。"""
import argparse
import json
import time

BASE = 0x400C0200
DSP_ABI = 0x20261014
SERVO_ID = 0x53525633
PINS = ("J17-21/W13", "J17-23/AE13")


class ServoPair:

    def __init__(self, registers, clock=time.monotonic, sleep=time.sleep):
        self.registers, self.clock, self.sleep = registers, clock, sleep

    def _read(self, offset):
        return self.registers.read(BASE + offset, False) & 0xFFFFFFFF

    def _write(self, offset, value):
        self.registers.write(BASE + offset, value, False)

    def require_version(self):
        if self.registers.read(0x400C00C0, False) & 0xFFFFFFFF != DSP_ABI:
            raise RuntimeError("当前不是配套的主测量位流，未写寄存器")
        if self._read(0) != SERVO_ID or self._read(0x14) != 124 or self._read(0x68) != 1:
            raise RuntimeError("当前PL不含124两路舵机控制接口，未写寄存器")
        if (self._read(0x10), self._read(0x0C), self._read(0x60), self._read(0x64), self._read(0x6C)) != (100000000, 300300, 900, 2100, 3):
            raise RuntimeError("舵机时钟、周期或允许范围与软件不匹配")

    @staticmethod
    def _mask(channels):
        if type(channels) is not int or channels not in (1, 2, 3):
            raise ValueError("通道掩码只能是1、2或3；3表示同时控制两路")
        return channels

    @staticmethod
    def _pulse(value):
        if type(value) is not int or not 900 <= value <= 2100:
            raise ValueError("位置脉宽必须为900～2100之间的整数微秒")
        return value

    def status(self):
        self.require_version()
        flags = self._read(4)
        channels = []
        for index, pin in enumerate(PINS):
            offset = 0x20 + index * 0x20
            channels.append({"channel": index + 1, "pin": pin,
                "enabled": bool(flags & (1 << index)),
                "pending": bool(flags & (1 << (8 + index))),
                "selected_position": "down" if flags & (1 << (16 + index)) else "up",
                "up_us": self._read(offset), "down_us": self._read(offset + 4),
                "requested_us": self._read(offset + 8), "active_us": self._read(offset + 12),
                "frame_count": self._read(offset + 24)})
        return {"revision": 124, "frequency_hz": 100000000 / 300300,
            "error_code": self._read(0x70), "command_sequence": self._read(0x78),
            "channels": channels, "position_feedback_available": False}

    def configure(self, channels, *, up_us, down_us):
        mask = self._mask(channels)
        self._pulse(up_us)
        self._pulse(down_us)
        self.require_version()
        if self._read(0x70):
            raise RuntimeError("PL存在未清除错误，请先查询并执行clear-error")
        for index in range(2):
            if mask & (1 << index):
                offset = 0x20 + index * 0x20
                self._write(offset, up_us)
                self._write(offset + 4, down_us)
                if (self._read(offset), self._read(offset + 4)) != (up_us, down_us):
                    raise RuntimeError("舵机端点写回不一致")
        if self._read(0x70):
            raise RuntimeError("PL拒绝了位置参数")
        return self.status()

    def command(self, position, channels=3):
        mask = self._mask(channels)
        if position not in ("up", "down", "stop"):
            raise ValueError("命令只能是up、down或stop")
        self.require_version()
        if position != "stop" and self._read(0x70):
            raise RuntimeError("PL存在未清除错误，请先查询并执行clear-error")
        sequence = self._read(0x78)
        opcode = {"stop": 0, "up": 1, "down": 2}[position]
        self._write(8, (opcode << 8) | mask)
        deadline = self.clock() + 0.1
        while True:
            flags = self._read(4)
            expected_enable = 0 if position == "stop" else mask
            accepted = self._read(0x78) == ((sequence + 1) & 0xFFFFFFFF)
            ready = (flags & mask) == expected_enable and ((flags >> 8) & mask) == 0
            if accepted and ready:
                state = self.status()
                if position != "stop":
                    if state["error_code"]:
                        raise RuntimeError("PL拒绝了位置命令")
                    for ch in state["channels"]:
                        if mask & (1 << (ch["channel"] - 1)) and (ch["selected_position"] != position or ch["active_us"] != ch[position + "_us"]):
                            raise RuntimeError("目标位置或周期边界提交核对失败")
                return state
            if self.clock() >= deadline:
                raise TimeoutError("等待PL接受命令和周期边界更新超时")
            self.sleep(0.001)

    def up(self, channels=3):
        return self.command("up", channels)

    def down(self, channels=3):
        return self.command("down", channels)

    def stop(self, channels=3):
        return self.command("stop", channels)

    def clear_error(self):
        self.require_version()
        self._write(0x70, 1)
        return self.status()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("command", nargs="?", default="status", choices=("status", "configure", "up", "down", "stop", "clear-error"))
    parser.add_argument("--channel", choices=("1", "2", "both"), default="both")
    parser.add_argument("--up-us", type=int)
    parser.add_argument("--down-us", type=int)
    args = parser.parse_args()
    if args.command == "configure":
        if args.up_us is None or args.down_us is None:
            parser.error("configure需要同时指定--up-us和--down-us")
        try:
            ServoPair._pulse(args.up_us)
            ServoPair._pulse(args.down_us)
        except ValueError as exc:
            parser.error(str(exc))
    elif args.up_us is not None or args.down_us is not None:
        parser.error("脉宽参数仅用于configure")
    import fcntl
    from icraft import xrt, zg330backend
    with open("/run/lock/fdw-servo-pair124.lock", "a") as lock:
        fcntl.flock(lock, fcntl.LOCK_EX)
        device = xrt.Device.Open("axi://zg330aiu?npu=0x40000000&dma=0x80000000")
        try:
            servo = ServoPair(device.defaultRegRegion())
            mask = {"1": 1, "2": 2, "both": 3}[args.channel]
            if args.command == "configure":
                state = servo.configure(mask, up_us=args.up_us, down_us=args.down_us)
            elif args.command in ("up", "down", "stop"):
                state = servo.command(args.command, mask)
            elif args.command == "clear-error":
                state = servo.clear_error()
            else:
                state = servo.status()
            print(json.dumps(state, ensure_ascii=False, indent=2))
        finally:
            xrt.Device.Close(device)


if __name__ == "__main__":
    main()
