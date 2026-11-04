
import ctypes as C
import time


def crc8(data):
    if not data:
        raise ValueError('Empty CRC body')
    value = data[0]
    for byte in data[1:]:
        value ^= byte
        for _ in range(8):
            value = (value >> 1) ^ (0x8C if value & 1 else 0)
    return value


READ_LENGTHS = {0x1F: 3, 0x1A: 3, 0x42: 4, 0x22: 3, 0x3F: 3,
                0x16: 3, 0x3A: 3, 0x3B: 3, 0x3C: 3, 0x24: 3,
                0x27: 3, 0x31: 3, 0x35: 3, 0x36: 3, 0x39: 3, 0x43: 4}


def validate_packet(packet):
    if len(packet) < 3 or packet[0] not in (1, 2, 3, 4):
        raise ValueError('Only individually addressed motor packets are allowed')
    if packet[-1] not in (0x6B, crc8(packet[:-1])):
        raise ValueError('Invalid fixed/CRC checksum')
    code = packet[1]
    if code in READ_LENGTHS:
        if len(packet) != READ_LENGTHS[code] or (code == 0x42 and packet[2] != 0x6C):
            raise ValueError('Malformed read command')
        if code == 0x43 and packet[2] != 0x7A:
            raise ValueError('Malformed aggregate status query')
        return
    if code in (0x48, 0x45, 0x68, 0x4C, 0x5C):
        lengths = {0x48: 37, 0x45: 7, 0x68: 9, 0x4C: 20, 0x5C: 7}
        helpers = {0x48: 0xD1, 0x45: 0x66, 0x68: 0x38, 0x4C: 0xAE, 0x5C: 0xAC}
        if len(packet) != lengths[code] or packet[2] != helpers[code] or packet[3] != 0:
            raise ValueError('Only temporary, well-formed parameter writes are allowed')
        if code == 0x45 and not 0 < int.from_bytes(packet[4:6], 'big') <= 3000:
            raise ValueError('Current cap exceeds the existing 3 A setting')
        return
    if code == 0xCD:
        if (len(packet) != 18 or packet[2] not in (0, 1)
                or packet[13:15] != bytes([2, 0])
                or not 0 < int.from_bytes(packet[7:9], 'big') <= 50
                or int.from_bytes(packet[9:13], 'big') > 4500
                or not 0 < int.from_bytes(packet[15:17], 'big') <= 1000):
            raise ValueError('Position command must be immediate relative, <=5 rpm and <=50 mm')
        return
    simple = {0xFE: (5, bytes([0x98, 0])), 0x9A: (5, bytes([2, 0])),
              0x9C: (4, bytes([0x48])), 0x0A: (4, bytes([0x6D]))}
    if code in simple:
        length, payload = simple[code]
        if len(packet) == length and packet[2:-1] == payload:
            return
    if code == 0x50 and len(packet) == 4 and packet[2] in (0, 1):
        return
    raise ValueError('Command not permitted by the bounded USB controller')


class CH340Serial:
    def __init__(self, port, baudrate=115200, timeout=0.05, write_timeout=0.2,
                 event=None, usb_factory=None, packet_validator=validate_packet):
        if port != 'usb://ch340' or baudrate != 115200:
            raise ValueError('Expected the CH340 115200/8N1 transport')
        self.timeout, self.write_timeout = timeout, write_timeout
        self.event = event or (lambda **data: None)
        self.packet_validator = packet_validator
        self.buffer = bytearray()
        self.closed = False
        if usb_factory is None:
            from ch340_readonly_probe import USB
            usb_factory = USB
        def usb_event(**values):
            if 'usb' in values:
                values['usb']['uart_commands'] = 'bounded reads and temporary low-speed control'
            self.event(**values)
        self.usb = usb_factory(usb_event, initialization='vendor')
        try:
            self.usb.open()
        except BaseException:
            self.usb.close()
            raise

    @property
    def in_waiting(self):
        return len(self.buffer)

    def write(self, packet):
        if self.closed:
            raise RuntimeError('Transport is closed')
        packet = bytes(packet)
        self.packet_validator(packet)
        buffer, count = C.create_string_buffer(packet), C.c_int()
        status = self.usb.lib.libusb_bulk_transfer(self.usb.handle, 0x02, buffer,
            len(packet), C.byref(count), max(1, round(self.write_timeout * 1000)))
        self.event(usb_write_result=status, requested=len(packet), transferred=count.value)
        self.usb.check(status)
        if count.value != len(packet):
            raise RuntimeError('Partial USB write: action is uncertain and will not be repeated')
        return count.value

    def read(self, size=1):
        if self.closed:
            raise RuntimeError('Transport is closed')
        if size <= 0:
            return b''
        deadline = time.monotonic() + self.timeout
        while len(self.buffer) < size:
            remaining = deadline - time.monotonic()
            if remaining <= 0:
                break
            self.buffer.extend(self.usb.read(max(1, round(remaining * 1000))))
        data = bytes(self.buffer[:size])
        del self.buffer[:size]
        return data

    def reset_input_buffer(self):
        self.buffer.clear()
        for _ in range(8):
            if not self.usb.read(1):
                return
        raise RuntimeError('Continuous unexpected UART traffic; cannot establish quiet bus')

    def close(self):
        if not self.closed:
            self.closed = True
            self.usb.close()
