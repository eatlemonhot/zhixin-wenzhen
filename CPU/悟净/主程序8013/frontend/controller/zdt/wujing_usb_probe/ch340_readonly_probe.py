
import argparse
import ctypes as C
import fcntl
import json
import os
from pathlib import Path
import time
from datetime import datetime, timezone

READS = {0x1F: ([], 7), 0x1A: ([], 5), 0x42: ([0x6C], 37),
         0x3C: ([], 5), 0x24: ([], 5), 0x27: ([], 5),
         0x35: ([], 6), 0x36: ([], 8), 0x39: ([], 5),
         0x16: ([], 7), 0x31: ([], 5)}


def crc8(data):
    value = data[0]
    for byte in data[1:]:
        value ^= byte
        for _ in range(8):
            value = (value >> 1) ^ (0x8C if value & 1 else 0)
    return value


class USB:
    def __init__(self, event, initialization='vendor'):
        self.event = event
        self.initialization = initialization
        self.ctx = C.c_void_p()
        self.handle = None
        self.claimed = False
        self.lock = None
        self.lib = C.CDLL('libusb-1.0.so.0')
        definitions = {
            'libusb_init': ([C.POINTER(C.c_void_p)], C.c_int),
            'libusb_exit': ([C.c_void_p], None),
            'libusb_open_device_with_vid_pid': ([C.c_void_p, C.c_uint16, C.c_uint16], C.c_void_p),
            'libusb_get_device': ([C.c_void_p], C.c_void_p),
            'libusb_get_bus_number': ([C.c_void_p], C.c_uint8),
            'libusb_get_device_address': ([C.c_void_p], C.c_uint8),
            'libusb_kernel_driver_active': ([C.c_void_p, C.c_int], C.c_int),
            'libusb_claim_interface': ([C.c_void_p, C.c_int], C.c_int),
            'libusb_release_interface': ([C.c_void_p, C.c_int], C.c_int),
            'libusb_close': ([C.c_void_p], None),
            'libusb_error_name': ([C.c_int], C.c_char_p),
            'libusb_control_transfer': ([C.c_void_p, C.c_uint8, C.c_uint8,
                C.c_uint16, C.c_uint16, C.c_void_p, C.c_uint16, C.c_uint], C.c_int),
            'libusb_bulk_transfer': ([C.c_void_p, C.c_ubyte, C.c_void_p, C.c_int,
                C.POINTER(C.c_int), C.c_uint], C.c_int),
        }
        for name, (args, result) in definitions.items():
            function = getattr(self.lib, name)
            function.argtypes, function.restype = args, result

    def check(self, result):
        if result < 0:
            raise RuntimeError(self.lib.libusb_error_name(result).decode())
        return result

    def open(self):
        devices = []
        for path in Path('/sys/bus/usb/devices').iterdir():
            if (path / 'idVendor').exists():
                if ((path / 'idVendor').read_text().strip() == '1a86'
                        and (path / 'idProduct').read_text().strip() == '7523'):
                    devices.append(path)
        if len(devices) != 1:
            raise RuntimeError('Exactly one 1a86:7523 device must be connected')
        path = devices[0]
        interface = Path(str(path) + ':1.0')
        if (interface / 'driver').exists():
            raise RuntimeError('Kernel driver owns interface; use its tty instead')
        for endpoint, direction in [('ep_02', 'out'), ('ep_82', 'in')]:
            if ((interface / endpoint / 'type').read_text().strip() != 'Bulk'
                    or (interface / endpoint / 'direction').read_text().strip() != direction):
                raise RuntimeError('Unexpected CH340 bulk endpoint layout')
        self.lock = open('/tmp/wujing_zdt_ch340.lock', 'a')
        fcntl.flock(self.lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
        self.check(self.lib.libusb_init(C.byref(self.ctx)))
        self.handle = self.lib.libusb_open_device_with_vid_pid(self.ctx, 0x1A86, 0x7523)
        if not self.handle:
            raise RuntimeError('Cannot open CH340')
        device = self.lib.libusb_get_device(self.handle)
        bus, number = (self.lib.libusb_get_bus_number(device),
                       self.lib.libusb_get_device_address(device))
        if (bus != int((path / 'busnum').read_text())
                or number != int((path / 'devnum').read_text())):
            raise RuntimeError('USB identity changed while opening')
        if self.lib.libusb_kernel_driver_active(self.handle, 0) != 0:
            raise RuntimeError('USB interface has a driver or cannot be inspected')
        self.check(self.lib.libusb_claim_interface(self.handle, 0))
        self.claimed = True
        self.event(usb=dict(path=str(path), bus=bus, device=number, baud=115200,
                            framing='8N1', initialization=self.initialization,
                            uart_commands='read-only allowlist'))
        self.event(chip_version=self.control(0xC0, 0x5F, 0, 0, 2).hex(' '))
        self.control(0x40, 0xA1, 0, 0)
        factor, divisor = 1532620800 // 115200, 3
        while factor > 0xFFF0 and divisor:
            factor >>= 3
            divisor -= 1
        register = ((0x10000 - factor) & 0xFF00) | divisor | 0x80
        if self.initialization == 'vendor':
            self.control(0x40, 0x9A, 0x1312, 0xD982)
            self.control(0x40, 0x9A, 0x0F2C, 7)
            self.control(0xC0, 0x95, 0x2518, 0, 2)
            self.control(0xC0, 0x95, 0x0706, 0, 2)
            self.control(0x40, 0x9A, 0x2727, 0)
            self.control(0x40, 0xA1, 0xC39C, register)
            self.control(0x40, 0x9A, 0x0F2C, 7)
            self.control(0x40, 0x9A, 0x2727, 0)  # Hardware flow control off.
        else:
            self.control(0x40, 0x9A, 0x1312, register)
            self.control(0x40, 0x9A, 0x2518, 0xC3)
        self.control(0x40, 0xA4, (~0x60) & 0xFFFF, 0)
        self.event(adapter_registers={hex(reg): self.control(0xC0, 0x95, reg, 0, 2).hex(' ')
                                      for reg in (0x1312, 0x2518, 0x2727)})
        time.sleep(0.05)

    def control(self, direction, request, value, index, length=0):
        buffer = C.create_string_buffer(max(1, length))
        count = self.check(self.lib.libusb_control_transfer(self.handle,
            direction, request, value, index, buffer, length, 1000))
        if count != length:
            raise RuntimeError('Short USB control transfer')
        return buffer.raw[:count]

    def read(self, timeout_ms=30):
        buffer, count = C.create_string_buffer(32), C.c_int()
        status = self.lib.libusb_bulk_transfer(self.handle, 0x82, buffer, 32,
                                              C.byref(count), timeout_ms)
        if status != -7:
            self.check(status)
        data = buffer.raw[:count.value]
        if data:
            self.event(rx=data.hex(' '))
        return data

    def query(self, address, code, mode):
        if address not in (1, 2, 3, 4) or code not in READS or mode not in (0, 2):
            raise ValueError('Only individual read commands in fixed/CRC mode are allowed')
        payload, length = READS[code]
        body = bytes([address, code] + payload)
        packet = body + bytes([0x6B if mode == 0 else crc8(body)])
        for _ in range(2):
            for _ in range(8):
                if not self.read(10):
                    break
            buffer = C.create_string_buffer(packet)
            count = C.c_int()
            self.event(tx=packet.hex(' '), checksum_mode=mode, function=hex(code))
            status = self.lib.libusb_bulk_transfer(self.handle, 0x02, buffer,
                len(packet), C.byref(count), 500)
            self.check(status)
            if count.value != len(packet):
                raise RuntimeError('Short USB write; no automatic action retry')
            self.event(usb_write_completed=count.value)
            end, received = time.monotonic() + 0.35, bytearray()
            while time.monotonic() < end:
                received.extend(self.read())
                while len(received) >= 2:
                    if received[:2] != bytes([address, code]):
                        del received[0]
                        continue
                    if len(received) < length:
                        break
                    reply = bytes(received[:length])
                    valid = reply[-1] == (0x6B if mode == 0 else crc8(reply[:-1]))
                    if code == 0x42:
                        valid = valid and reply[2:4] == b'\x25\x18'
                    if valid:
                        self.event(validated=reply.hex(' '), checksum_mode=mode)
                        return reply
                    self.event(rejected=reply.hex(' '))
                    del received[0]
        raise TimeoutError('No validated reply from address %s function %02x mode %s'
                           % (address, code, mode))

    def close(self):
        if self.claimed:
            self.lib.libusb_release_interface(self.handle, 0)
        if self.handle:
            self.lib.libusb_close(self.handle)
        if self.ctx.value:
            self.lib.libusb_exit(self.ctx)
        if self.lock:
            self.lock.close()


def signed(reply):
    if reply[2] not in (0, 1):
        raise ValueError('Invalid sign')
    return (-1 if reply[2] else 1) * int.from_bytes(reply[3:-1], 'big')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--execute', action='store_true')
    parser.add_argument('--initialization', choices=('linux', 'vendor'), default='vendor')
    parser.add_argument('--output', default='probe_results.json')
    args = parser.parse_args()
    if not args.execute:
        print('No USB access. Use --execute for read-only queries.')
        return 0
    output = Path(args.output)
    journal = output.with_suffix('.jsonl').open('x', encoding='utf-8')
    report = dict(host_time_utc=datetime.now(timezone.utc).isoformat(),
                  kernel=os.uname().release, motors={}, motion_commands_sent=0,
                  motor_configuration_writes=0, initialization=args.initialization)

    def event(**values):
        journal.write(json.dumps(dict(monotonic_s=time.monotonic(), **values)) + '\n')
        journal.flush()

    usb = USB(event, initialization=args.initialization)
    try:
        usb.open()
        for address in range(1, 5):
            result = report['motors'][str(address)] = {'replies': {}, 'errors': []}
            mode = None
            for candidate in (0, 2):
                try:
                    version = usb.query(address, 0x1F, candidate)
                    result['replies']['1f'] = version.hex(' ')
                    if version[2:-1] != bytes.fromhex('00 ce 23 14' if address <= 2 else '00 ce 21 14'):
                        raise RuntimeError('Version differs from the handover identity')
                    mode = candidate
                    break
                except TimeoutError as exc:
                    result['errors'].append(str(exc))
            result['checksum_mode'] = mode
            if mode is not None:
                for code in (0x1A, 0x42, 0x16, 0x3C, 0x24, 0x27, 0x35, 0x36, 0x39, 0x31):
                    try:
                        reply = usb.query(address, code, mode)
                        result['replies']['%02x' % code] = reply.hex(' ')
                    except TimeoutError as exc:
                        result['errors'].append(str(exc))
                replies = {code: bytes.fromhex(data) for code, data in result['replies'].items()}
                fields = {}
                for code, name, scale in [('24', 'voltage_v', 1000), ('27', 'phase_current_ma', 1)]:
                    if code in replies:
                        fields[name] = int.from_bytes(replies[code][2:4], 'big') / scale
                for code, name, scale in [('35', 'speed_rpm', 10), ('36', 'position_deg', 10), ('39', 'temperature_c', 1)]:
                    if code in replies:
                        fields[name] = signed(replies[code]) / scale
                if '3c' in replies:
                    fields.update(home_flags=replies['3c'][2], motor_flags=replies['3c'][3])
                result['decoded'] = fields
            print(json.dumps(dict(address=address, **result)), flush=True)
        report['responding_addresses'] = [int(a) for a, r in report['motors'].items()
                                          if r.get('checksum_mode') is not None]
        report['communication_verified'] = len(report['responding_addresses']) == 4
    except Exception as exc:
        report['error'] = '%s: %s' % (type(exc).__name__, exc)
        print(report['error'], flush=True)
    finally:
        usb.close()
        journal.close()
        output.write_text(json.dumps(report, indent=2), encoding='utf-8')
    print(json.dumps(report, indent=2), flush=True)
    return 0 if report.get('communication_verified') else 1


if __name__ == '__main__':
    raise SystemExit(main())
