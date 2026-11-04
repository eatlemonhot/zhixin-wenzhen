import ctypes as C
import unittest
from unittest.mock import Mock
from ch340_serial import CH340Serial, validate_packet, crc8


def frame(hex_body):
    body = bytes.fromhex(hex_body)
    return body + bytes([crc8(body)])


class TransportTests(unittest.TestCase):
    def test_encoder_calibration_address_changes_and_flash_writes_are_blocked(self):
        for body in ('01 06 45', '01 ae 4b 01 02', '01 d5 69 01 00',
                     '01 45 66 01 03 e8', '00 ff 66'):
            with self.subTest(body=body), self.assertRaises(ValueError):
                validate_packet(frame(body))

    def test_bounded_relative_position_accepted_but_fast_or_absolute_blocked(self):
        packet = bytearray.fromhex('01 cd 00 00 14 00 14 00 32 00 00 00 b4 02 00 02 bc 6b')
        validate_packet(packet)
        for index, value in ((8, 51), (13, 1), (14, 1)):
            candidate = bytearray(packet)
            candidate[index] = value
            with self.subTest(index=index), self.assertRaises(ValueError):
                validate_packet(candidate)

    def test_invalid_checksum_is_blocked(self):
        with self.assertRaises(ValueError):
            validate_packet(bytes.fromhex('01 1f 00'))

    def test_partial_action_write_is_never_replayed(self):
        usb = Mock()
        def partial(handle, endpoint, buffer, length, actual, timeout):
            actual._obj.value = 2
            return 0
        usb.lib.libusb_bulk_transfer.side_effect = partial
        ser = CH340Serial('usb://ch340', usb_factory=lambda *a, **k: usb)
        with self.assertRaises(RuntimeError):
            ser.write(bytes.fromhex('01 9a 02 00 6b'))
        self.assertEqual(usb.lib.libusb_bulk_transfer.call_count, 1)
        ser.close()

    def test_packet_fragments_remain_buffered_without_discard(self):
        usb = Mock()
        usb.read.side_effect = [bytes.fromhex('01 1f 00'), bytes.fromhex('ce 23 14 6b')]
        ser = CH340Serial('usb://ch340', usb_factory=lambda *a, **k: usb)
        self.assertEqual(ser.read(1), bytes.fromhex('01'))
        self.assertEqual(ser.in_waiting, 2)
        self.assertEqual(ser.read(6), bytes.fromhex('1f 00 ce 23 14 6b'))
        self.assertEqual(ser.in_waiting, 0)
        ser.close()


if __name__ == '__main__':
    unittest.main()
