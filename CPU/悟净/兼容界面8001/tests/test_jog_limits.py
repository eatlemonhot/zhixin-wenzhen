import json
import tempfile
import unittest
from unittest import mock

import test_motor_control as base

worker = base.worker


class JogLimitTests(unittest.TestCase):
    def setUp(self):
        self.temporary = tempfile.TemporaryDirectory()
        self.addCleanup(self.temporary.cleanup)
        self.controller = base.FakeController(self.temporary.name)
        self.controller.coordinates['degrees_per_mm'] = 9
        self.controller.coordinates['axes']['4']['soft_max_mm'] = 157.0

    def run_jog(self, payload=None):
        return worker.jog_machine(self.controller, payload or base.jog(), 'web_offline123')

    def test_actual_failed_return_target_snaps_to_two_mm(self):
        self.controller.positions['4'] = 2.977777777777778
        result = self.run_jog(base.jog('right', 'down'))
        self.assertEqual(self.controller.moves[-1][1:], (4, 2.0))
        self.assertTrue(result['ready'])
        self.assertNotIn('outcome', result)
        self.assertAlmostEqual(self.controller.sessions[-1].report['web_jog']['requested_mm'],
                               1.9777777777777779)

    def test_up_then_feedback_relaxation_then_down_returns_to_endpoint(self):
        self.controller.positions['4'] = 2.0
        self.run_jog(base.jog('right', 'up'))
        self.controller.positions['4'] -= 4 / 90
        result = self.run_jog(base.jog('right', 'down'))
        self.assertEqual(result['positions_mm']['4'], 2.0)
        self.assertEqual([move[2] for move in self.controller.moves], [3.0, 2.0])

    def test_pure_binary_float_return_is_not_a_false_limit(self):
        self.controller.positions['4'] = 18.9 / 9
        self.assertLess(self.controller.positions['4'] - 0.1, 2.0)
        self.run_jog(base.jog('right', 'down', 0.1))
        self.assertEqual(self.controller.moves[-1][2], 2.0)

    def test_upper_endpoint_return_stays_within_strict_wire_guard(self):
        self.controller.positions['4'] = 156.04444444444445
        self.run_jog(base.jog('right', 'up'))
        self.assertEqual(self.controller.moves[-1][2], 157.0)
        self.controller.coordinates['axes']['3']['soft_max_mm'] = 157.1
        self.controller.positions['3'] = 156.1
        self.run_jog(base.jog('left', 'up'))
        target = self.controller.moves[-1][2]
        self.assertLessEqual(target, 157.1)
        self.assertLessEqual(round(target * 90) / 10 / 9, 157.1)

    def test_true_outside_targets_never_move_or_reverse_direction(self):
        for current, direction in ((2.0, 'down'), (1.98, 'down'), (2.9, 'down'),
                                   (157.0, 'up'), (157.02, 'up')):
            with self.subTest(current=current, direction=direction):
                self.controller.positions['4'] = current
                result = self.run_jog(base.jog('right', direction))
                session = self.controller.sessions[-1]
                self.assertEqual(self.controller.moves, [])
                self.assertEqual(session.motor.ser.emitted, [])
                self.assertEqual(result['outcome'], 'limited')
                self.assertEqual(result['motion_commands_sent'], 0)
                self.assertTrue(result['ready'])
                self.assertEqual(session.closed, 1)

    def test_inward_escape_from_small_feedback_undershoot_is_allowed(self):
        self.controller.positions['4'] = 1.9777777777777779
        result = self.run_jog(base.jog('right', 'up'))
        self.assertTrue(result['ready'])
        self.assertAlmostEqual(self.controller.moves[-1][2], 2.977777777777778)

    def test_combined_x_limit_still_rejects_without_disabling_valid_coordinates(self):
        self.controller.positions.update({'1': 70.0, '2': 80.0})
        result = self.run_jog(base.jog('left', 'right'))
        self.assertEqual(self.controller.moves, [])
        self.assertEqual(result['outcome'], 'limited')
        self.assertIn('联合软限位', result['message'])

    def test_limited_target_still_requires_fresh_reference_stop_and_cleanup(self):
        for failure in ('reference', 'moving', 'stop', 'cleanup', 'close'):
            with self.subTest(failure=failure):
                self.controller = base.FakeController(self.temporary.name)
                self.controller.positions['4'] = 2.0

                def fail_second_read(session, number):
                    if number == 2:
                        if failure == 'reference':
                            raise RuntimeError('reference changed after rejection')
                        if failure == 'moving':
                            self.controller.speed = 1.0
                        if failure == 'stop':
                            self.controller.core.STOP_FILE.write_text('stop')

                self.controller.read_hook = fail_second_read
                if failure == 'cleanup':
                    self.controller.cleanup_errors = ['restore failed']
                if failure == 'close':
                    self.controller.close_error = 'close failed'
                with self.assertRaises(RuntimeError):
                    self.run_jog(base.jog('right', 'down'))
                self.assertEqual(self.controller.moves, [])
                self.assertEqual(self.controller.sessions[-1].closed, 1)
                self.controller.core.STOP_FILE.unlink(missing_ok=True)

    def test_value_error_from_move_is_never_misclassified_as_a_limit(self):
        self.controller.move_hook = lambda session: (_ for _ in ()).throw(ValueError('Target outside'))
        with self.assertRaisesRegex(RuntimeError, 'Target outside'):
            self.run_jog()


class LimitedServiceTests(base.ServiceFixture):
    def test_incomplete_limited_result_never_retains_ready(self):
        for field, value in (('ready', False), ('motion_commands_sent', 1),
                             ('error_code', 'other'), ('connected', False)):
            with self.subTest(field=field):
                self.runtime.mkdir(exist_ok=True)
                run_id = 'web_badlimited'
                result = dict(passed=True, connected=True, ready=True, outcome='limited',
                              error_code='jog_soft_limit', motion_commands_sent=0, message='limit')
                result[field] = value
                (self.runtime / (run_id + '.json')).write_text(json.dumps(result))
                self.service._popen = mock.Mock(return_value=mock.Mock(returncode=0))
                with (self.runtime / 'active.lock').open('a') as handle:
                    self.service._run(dict(action='jog', run_id=run_id), handle)
                self.assertFalse(self.service.status()['ready'])
                self.assertEqual(self.service.status()['last_job']['state'], 'failed')

    def test_verified_limited_worker_retains_ready_but_stop_still_wins(self):
        for stopped in (False, True):
            with self.subTest(stopped=stopped):
                self.runtime.mkdir(exist_ok=True)
                run_id = 'web_limited' + str(int(stopped))
                result = dict(passed=True, connected=True, ready=True, outcome='limited',
                              error_code='jog_soft_limit', motion_commands_sent=0,
                              positions_mm={'1': 2, '2': 2, '3': 2, '4': 2},
                              message='4号已到前软限位，本次未运动。')
                (self.runtime / (run_id + '.json')).write_text(json.dumps(result))
                process = mock.Mock(returncode=0)
                self.service._popen = mock.Mock(return_value=process)
                if stopped:
                    self.service.stop()
                with (self.runtime / 'active.lock').open('a') as handle:
                    self.service._run(dict(action='jog', run_id=run_id), handle)
                state = self.service.status()
                self.assertEqual(state['ready'], not stopped)
                self.assertTrue(state['connected'])
                self.assertFalse(state['busy'])
                self.assertEqual(state['last_job']['state'], 'limited')
                self.assertNotIn('error', state['last_job'])
                self.assertEqual(state['last_job']['notice'], state['message'])


if __name__ == '__main__':
    unittest.main()
