"""验证两针共享校准端点、周期互锁与异常抬针；全部使用模拟设备。"""
import copy
from contextlib import nullcontext
import json
import os
from pathlib import Path
import tempfile
import threading
import types
import unittest
from unittest import mock

import test_auto_raise as auto
import test_motor_control as base

positions = base.load_module('servo_positions')
cycle = base.load_module('measurement_cycle')
servo_module = auto.servo_module


class CyclePresetTests(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        self.addCleanup(self.tmp.cleanup)
        self.profile = Path(self.tmp.name) / 'servo_positions.json'
        self.profile.write_text(json.dumps(dict(channels={str(c): dict(up_us=960, down_us=1980) for c in (1, 2)})))
        patch = mock.patch.dict(os.environ, FDW_INSTANCE_FOLDER=self.tmp.name)
        patch.start()
        self.addCleanup(patch.stop)
        self.hardware = auto.FakeServo()
        self.servo = servo_module.ServoService(self.hardware, settings_path=self.profile)

    def driver(self):
        """周期使用直接读取寄存器的驱动，不使用网页状态缓存。"""
        return types.SimpleNamespace(
            status=lambda: self.hardware(dict(action='read')), _mask=lambda value: value,
            down=lambda mask: self.servo.run(dict(action='down', channel=mask)),
            up=lambda mask: self.servo.run(dict(action='up', channel=mask)))

    def test_saved_positions_and_constructor_have_no_hardware_calls(self):
        self.assertEqual(positions.load_presets(), {i: dict(up_us=960, down_us=1980) for i in (1, 2)})
        self.assertEqual(self.hardware.calls, [])

    def test_missing_positions_block_automatic_actions_without_hardware(self):
        self.profile.unlink()
        fresh = servo_module.ServoService(self.hardware, settings_path=self.profile)
        self.assertEqual(positions.load_presets(), {})
        self.assertIn('先校准', fresh.status()['automatic_raise']['profile_error'])
        for action in (fresh.prepare_cycle, lambda: fresh.raise_for_motion(lambda: False)):
            with self.assertRaisesRegex(servo_module.ServoError, '校准'):
                action()
        self.assertEqual(self.hardware.calls, [])

    def test_partial_save_never_creates_other_channel_defaults(self):
        self.profile.unlink()
        fresh = servo_module.ServoService(self.hardware, settings_path=self.profile)
        fresh.run(dict(action='configure', channel=1, up_us=970, down_us=1970))
        self.assertEqual(positions.load_presets(), {1: dict(up_us=970, down_us=1970)})
        self.hardware.calls.clear()
        with self.assertRaisesRegex(servo_module.ServoError, '两针'):
            fresh.prepare_cycle()
        self.assertEqual(self.hardware.calls, [])
        fresh.run(dict(action='configure', channel=2, up_us=985, down_us=1955))
        fresh = servo_module.ServoService(self.hardware, settings_path=self.profile)
        state = fresh.prepare_cycle()
        positions.require_cycle_positions(state)
        self.assertEqual(state['channels'][0]['up_us'], 970)
        self.assertEqual(state['channels'][1]['up_us'], 985)

    def test_cycle_prepare_updates_both_presets_without_motion(self):
        state = self.servo.prepare_cycle()
        self.assertEqual([p['action'] for p in self.hardware.calls], ['read', 'configure', 'configure'])
        self.assertEqual(state['command_sequence'], 42)
        self.assertTrue(all(not r['enabled'] for r in state['channels']))
        positions.require_cycle_positions(state)
        self.assertEqual(json.loads(self.profile.read_text())['channels']['2'], dict(up_us=960, down_us=1980))

    def test_matching_presets_require_no_configuration(self):
        self.servo.prepare_cycle()
        self.hardware.calls.clear()
        self.servo.prepare_cycle()
        self.assertEqual(self.hardware.calls, [dict(action='read')])

    def test_saved_calibration_is_shared_after_restart(self):
        self.profile.write_text(json.dumps(dict(channels={'1': dict(up_us=970, down_us=1970), '2': dict(up_us=980, down_us=1960)})))
        fresh = servo_module.ServoService(self.hardware, settings_path=self.profile)
        state = fresh.prepare_cycle()
        positions.require_cycle_positions(state)
        self.assertEqual(state['channels'][1]['up_us'], 980)

    def test_corrupt_profile_blocks_before_hardware(self):
        self.profile.write_text('{invalid')
        fresh = servo_module.ServoService(self.hardware, settings_path=self.profile)
        with self.assertRaises(servo_module.ServoError): fresh.prepare_cycle()
        self.assertEqual(self.hardware.calls, [])

    def test_stale_900_2100_rejected_before_any_motion(self):
        with self.assertRaisesRegex(RuntimeError, '已保存边界'):
            cycle.MeasurementCycle(self.driver(), lambda _: True, lambda _: True, lock=nullcontext).run(lambda: 1, 3)
        self.assertEqual(self.hardware.calls, [dict(action='read')])

    def test_exception_still_raises_both_using_current_endpoints(self):
        self.servo.prepare_cycle()
        self.hardware.calls.clear()
        def failure(): raise ValueError('模拟采集失败')
        with self.assertRaisesRegex(ValueError, '模拟采集失败'):
            cycle.MeasurementCycle(self.driver(), lambda _: True, lambda _: True, lock=nullcontext).run(failure, 3)
        self.assertEqual([p['action'] for p in self.hardware.calls], ['read', 'down', 'up'])
        self.assertTrue(all(r['active_us'] == 960 for r in self.hardware.state['channels']))

    def test_unconfirmed_lowering_never_measures_and_still_raises(self):
        self.servo.prepare_cycle()
        measured = mock.Mock()
        with self.assertRaisesRegex(RuntimeError, '未确认探针落下'):
            cycle.MeasurementCycle(self.driver(), lambda _: False, lambda _: True, lock=nullcontext).run(measured, 3)
        measured.assert_not_called()

    def test_invalid_cycle_request_does_not_open_hardware(self):
        from flask import Flask
        web = base.load_module('servo_web')
        app = Flask('周期端点离线测试', instance_path=self.tmp.name)
        app.config.update(TESTING=True, SECRET_KEY='仅用于离线测试')
        app.extensions['motor_service'] = types.SimpleNamespace(_lock=threading.RLock(), status=lambda: {'busy': False}, release_idle=mock.Mock())
        web.register(app)
        app.extensions['servo_service'] = self.servo
        client = app.test_client()
        with client.session_transaction() as session:
            session.update(user_id='测试', motion_enabled=True)
        response = client.post('/motor/servo/cycle/start', json={'channel': True, 'decimation_log2': 0}, headers={'X-Requested-With': 'XMLHttpRequest'})
        self.assertEqual(response.status_code, 400)
        self.assertEqual(self.hardware.calls, [])

    def test_valid_cycle_route_syncs_both_before_scheduling_worker(self):
        from flask import Flask
        web = base.load_module('servo_web')
        app = Flask('周期启动离线测试', instance_path=self.tmp.name)
        app.config.update(TESTING=True, SECRET_KEY='仅用于离线测试')
        app.extensions['motor_service'] = types.SimpleNamespace(_lock=threading.RLock(), status=lambda: {'busy': False}, release_idle=mock.Mock())
        web.register(app)
        app.extensions['servo_service'] = self.servo
        service = app.extensions['servo_cycle_service']
        client = app.test_client()
        with client.session_transaction() as session:
            session.update(user_id='测试', motion_enabled=True)
        with mock.patch.object(service, 'start', return_value={'state': 'preparing', 'busy': True}) as start:
            response = client.post('/motor/servo/cycle/start', json={'channel': 3, 'decimation_log2': 0}, headers={'X-Requested-With': 'XMLHttpRequest'})
        self.assertEqual(response.status_code, 202)
        app.extensions['motor_service'].release_idle.assert_called_once_with()
        start.assert_called_once_with('测试', {'channel': 3, 'decimation_log2': 0})
        self.assertEqual([p['action'] for p in self.hardware.calls], ['read', 'configure', 'configure'])
        self.assertTrue(all(not r['enabled'] for r in self.hardware.state['channels']))


if __name__ == '__main__': unittest.main()
