import unittest
from unittest.mock import Mock

import machine_control as c
from coordinate_setup import Session, CoordinateMotor


class CoordinateTests(unittest.TestCase):
    def setUp(self):
        self.coordinates = dict(axes={str(a): dict(soft_min_mm=2, soft_max_mm=150) for a in range(1,5)},
            joint_x_limit=dict(max_combined_inward_mm=200))
        self.current = {'1': 70, '2': 80, '3': 20, '4': 30}

    def test_mirrored_y_mapping(self):
        self.assertEqual(c.local_mm(3, dict(position_deg=-450)), 50)
        self.assertEqual(c.local_mm(4, dict(position_deg=450)), 50)

    def test_joint_collision_rejected_inside_individual_limits(self):
        with self.assertRaises(ValueError):
            c.bounded_target(self.coordinates, self.current, 1, 121)

    def test_joint_boundary_and_retreat(self):
        self.assertEqual(c.bounded_target(self.coordinates, self.current, 1, 120), 120)
        self.assertEqual(c.bounded_target(self.coordinates, self.current, 2, 2), 2)

    def test_nonfinite_and_boolean_values(self):
        for value in (float('nan'), float('inf'), float('-inf'), True):
            with self.subTest(value=value), self.assertRaises(ValueError):
                c.bounded_target(self.coordinates, self.current, 3, value)

    def test_wire_rounding_must_not_cross_limit(self):
        self.coordinates['axes']['3']['soft_max_mm'] = 10.006
        with self.assertRaises(ValueError):
            c.bounded_target(self.coordinates, self.current, 3, 10.006)

    def test_power_cycle_invalidates_reference(self):
        session = Session.__new__(Session)
        session.sample = lambda a: dict(motor_flags=0x83, encoder=0, position_deg=0)
        with self.assertRaises(RuntimeError):
            session.verify_reference(1, dict(origin=dict(origin_encoder_deg=0)))

    def test_manual_displacement_invalidates_reference(self):
        session = Session.__new__(Session)
        session.sample = lambda a: dict(motor_flags=3, encoder=32768, position_deg=0)
        with self.assertRaises(RuntimeError):
            session.verify_reference(1, dict(origin=dict(origin_encoder_deg=0)))

    def test_reference_wrap_at_360_degrees(self):
        session = Session.__new__(Session)
        session.sample = lambda a: dict(motor_flags=3, encoder=0, position_deg=0)
        self.assertIsNotNone(session.verify_reference(1, dict(origin=dict(origin_encoder_deg=359.9))))

    def test_oversized_move_rejected_before_reading_hardware(self):
        session = Session.__new__(Session)
        with self.assertRaises(ValueError):
            session.move_relative(1, 451, maximum_mm=50)

    def test_uncertain_action_is_not_repeated(self):
        motor = CoordinateMotor.__new__(CoordinateMotor)
        motor.send = Mock()
        motor.receive = Mock(side_effect=TimeoutError('Damaged ACK'))
        with self.assertRaises(TimeoutError):
            motor.action(bytes.fromhex('cd 00 00 14 00 14 00 32 00 00 00 5a 02 00 02 bc'))
        self.assertEqual(motor.send.call_count, 1)

    def test_read_retry_has_short_timeout_and_discards_partial_frame(self):
        motor = CoordinateMotor.__new__(CoordinateMotor)
        motor.buffer = bytearray(b'partial')
        motor.pending = [b'stale']
        motor.ser = Mock()
        motor.send = Mock()
        motor.receive = Mock(side_effect=[TimeoutError(), bytes.fromhex('01 35 00 00 00 00')])
        reply = motor.query([0x35])
        self.assertEqual(reply[1], 0x35)
        self.assertEqual(motor.receive.call_count, 2)
        self.assertTrue(all(call.kwargs['timeout'] == 0.12 for call in motor.receive.call_args_list))
        self.assertEqual(motor.buffer, bytearray())
        self.assertEqual(motor.pending, [])


if __name__ == '__main__':
    unittest.main()
