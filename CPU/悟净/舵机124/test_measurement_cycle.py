import unittest
import json
import os
from pathlib import Path
import tempfile
from unittest import mock
from contextlib import nullcontext
from measurement_cycle import MeasurementCycle


class FakeServo:
    def __init__(self):
        self.events = []

    def _mask(self, channels):
        return channels

    def status(self):
        return {'revision': 124, 'error_code': 0, 'channels': [
            {'channel': 1, 'up_us': 960, 'down_us': 1980},
            {'channel': 2, 'up_us': 960, 'down_us': 1980}]}

    def down(self, channels):
        self.events.append(('down', channels))
        return {'position': 'down'}

    def up(self, channels):
        self.events.append(('up', channels))
        return {'position': 'up'}


class MeasurementCycleTests(unittest.TestCase):
    def setUp(self):
        folder = tempfile.TemporaryDirectory()
        self.addCleanup(folder.cleanup)
        path = Path(folder.name) / "servo_positions.json"
        path.write_text(json.dumps(dict(channels={str(c): dict(up_us=960, down_us=1980) for c in (1, 2)})))
        environment = mock.patch.dict(os.environ, FDW_INSTANCE_FOLDER=folder.name)
        environment.start()
        self.addCleanup(environment.stop)

    def test_measure_runs_between_confirmed_down_and_up(self):
        servo = FakeServo(); events = []
        cycle = MeasurementCycle(servo, lambda _: True, lambda _: True, lock=nullcontext)
        result = cycle.run(lambda: events.append('measure') or 42, 2)
        self.assertEqual(result, 42)
        self.assertEqual(servo.events, [('down', 2), ('up', 2)])
        self.assertEqual(events, ['measure'])

    def test_unconfirmed_down_blocks_measure_and_commands_lift(self):
        servo = FakeServo(); measured = []
        cycle = MeasurementCycle(servo, lambda _: False, lambda _: True, lock=nullcontext)
        with self.assertRaises(RuntimeError): cycle.run(lambda: measured.append(True), 2)
        self.assertEqual(measured, [])
        self.assertEqual(servo.events, [('down', 2), ('up', 2)])

    def test_measure_exception_still_commands_lift(self):
        servo = FakeServo()
        cycle = MeasurementCycle(servo, lambda _: True, lambda _: True, lock=nullcontext)
        def fail(): raise ValueError('测量失败')
        with self.assertRaisesRegex(ValueError, '测量失败'): cycle.run(fail, 2)
        self.assertEqual(servo.events, [('down', 2), ('up', 2)])

    def test_unconfirmed_lift_is_reported(self):
        servo = FakeServo()
        cycle = MeasurementCycle(servo, lambda _: True, lambda _: False, lock=nullcontext)
        with self.assertRaisesRegex(RuntimeError, '未确认探针已抬起'):
            cycle.run(lambda: 1, 2)

    def test_wrong_profile_blocks_cycle(self):
        servo = FakeServo(); servo.status = lambda: {'revision': 123, 'error_code': 0, 'channels': []}
        cycle = MeasurementCycle(servo, lambda _: True, lambda _: True, lock=nullcontext)
        with self.assertRaisesRegex(RuntimeError, '版本或错误状态'):
            cycle.run(lambda: 1, 2)


if __name__ == '__main__': unittest.main()
