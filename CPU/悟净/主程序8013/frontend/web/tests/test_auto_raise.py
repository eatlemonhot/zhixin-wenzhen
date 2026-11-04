"""Automatic UP -> verified registers -> wait -> XY. All hardware is fake."""
import copy
import json
import os
from pathlib import Path
import threading
import unittest
from unittest import mock

import test_motor_control as base

servo_module = base.load_module('servo_service')


class FakeServo:
    def __init__(self):
        self.calls = []
        self.state = dict(available=True, revision=124, error_code=0, boot_id='test-boot',
                          command_sequence=42, min_us=900, max_us=2100,
                          channels=[dict(channel=c, up_us=900, down_us=2100, active_us=2100,
                                         requested_us=2100, selected_position='down', pending=False,
                                         enabled=False) for c in (1, 2)])
        self.hook = lambda payload, state: None

    def __call__(self, payload):
        self.calls.append(dict(payload))
        if payload['action'] == 'configure':
            for row in self.state['channels']:
                if payload['channel'] & row['channel']:
                    row.update(up_us=payload['up_us'], down_us=payload['down_us'])
        if payload['action'] in ('up', 'down', 'stop'):
            self.state['command_sequence'] = (self.state['command_sequence'] + 1) & 0xFFFFFFFF
            for row in self.state['channels']:
                if payload['channel'] & row['channel']:
                    if payload['action'] == 'stop':
                        row['enabled'] = False
                    else:
                        row.update(selected_position=payload['action'], enabled=True,
                                   active_us=row[payload['action'] + '_us'],
                                   requested_us=row[payload['action'] + '_us'])
        self.hook(payload, self.state)
        return copy.deepcopy(self.state)


class FakeClock:
    def __init__(self):
        self.now = 0
        self.on_sleep = lambda: None

    def monotonic(self):
        return self.now

    def sleep(self, seconds):
        self.now += seconds
        self.on_sleep()


class AutoRaiseServoTests(base.ServiceFixture):
    def setUp(self):
        super().setUp()
        self.hardware = FakeServo()
        self.profile = Path(self.temporary.name) / 'servo_positions.json'
        self.profile.write_text(json.dumps(dict(channels={str(c): dict(up_us=960, down_us=1980) for c in (1, 2)})))
        environment = mock.patch.dict(os.environ, FDW_INSTANCE_FOLDER=self.temporary.name)
        environment.start()
        self.addCleanup(environment.stop)
        self.servo = servo_module.ServoService(self.hardware, settings_path=self.profile)
        self.clock = FakeClock()
        patch = mock.patch.object(servo_module, 'time', self.clock)
        patch.start()
        self.addCleanup(patch.stop)

    def raise_once(self):
        return self.servo.raise_for_motion(self.service.stop_file.exists)

    def assert_no_up(self):
        self.assertFalse(any(p['action'] == 'up' for p in self.hardware.calls))

    def test_both_960_1980_up_once_then_read(self):
        receipt = self.raise_once()
        self.assertEqual([p['action'] for p in self.hardware.calls], ['read', 'configure', 'configure', 'up', 'read'])
        self.assertEqual(self.hardware.calls[1], dict(action='configure', channel=1, up_us=960, down_us=1980))
        self.assertEqual(self.hardware.calls[3], dict(action='up', channel=3))
        self.assertEqual(receipt['up_us'], {'1': 960, '2': 960})
        self.assertTrue(receipt['command_verified'])
        self.assertFalse(receipt['position_feedback_available'])
        self.assertGreaterEqual(self.clock.now, .6)
        self.assertEqual(self.hardware.state['channels'][1]['down_us'], 1980)
        self.assertEqual(self.servo.status()['probe_state'], 'up')

    def test_verified_settled_up_is_reused_after_fresh_read_without_delay(self):
        self.raise_once()
        self.hardware.calls.clear()
        before = self.clock.now
        receipt = self.raise_once()
        self.assertEqual([p['action'] for p in self.hardware.calls], ['read'])
        self.assertEqual(self.clock.now, before)
        self.assertEqual(receipt['settle_ms'], 0)
        self.assertTrue(receipt['reused_verified_up'])
        self.assertFalse(receipt['up_command_sent'])

    def test_restart_with_up_state_waits_once_without_redundant_up(self):
        self.raise_once()
        hardware = self.hardware
        hardware.calls.clear()
        fresh = servo_module.ServoService(hardware, settings_path=self.profile)
        before = self.clock.now
        receipt = fresh.raise_for_motion(lambda: False)
        self.assertFalse(receipt['up_command_sent'])
        self.assertGreaterEqual(self.clock.now-before, .599)
        self.assertEqual([p['action'] for p in hardware.calls], ['read', 'read'])

    def test_external_down_or_disabled_up_cannot_reuse_old_receipt(self):
        for action in ('down', 'stop'):
            with self.subTest(action=action):
                self.raise_once()
                self.hardware(dict(action=action, channel=1))
                self.hardware.calls.clear()
                receipt = self.raise_once()
                self.assertTrue(receipt['up_command_sent'])
                self.assertEqual([p['action'] for p in self.hardware.calls], ['read', 'up', 'read'])

    def test_external_up_sequence_or_boot_change_requires_fresh_wait(self):
        for key in ('command_sequence', 'boot_id'):
            with self.subTest(key=key):
                self.raise_once()
                if key == 'command_sequence': self.hardware.state[key] += 1
                else: self.hardware.state[key] = 'new-boot'
                before = self.clock.now
                receipt = self.raise_once()
                self.assertFalse(receipt['up_command_sent'])
                self.assertGreaterEqual(self.clock.now-before, .599)

    def test_stop_before_task_never_reads_or_writes_hardware(self):
        self.service.stop()
        with self.assertRaisesRegex(servo_module.ServoError, '停车'):
            self.raise_once()
        self.assertEqual(self.hardware.calls, [])

    def test_bad_revision_error_duplicate_channels_pending_block_before_up(self):
        variants = [dict(revision=123), dict(error_code=1), dict(boot_id=''), dict(command_sequence=None)]
        for change in variants:
            with self.subTest(change=change):
                hardware = FakeServo()
                hardware.state.update(change)
                servo = servo_module.ServoService(hardware)
                with self.assertRaises(servo_module.ServoError):
                    servo.raise_for_motion(lambda: False)
                self.assertEqual([p['action'] for p in hardware.calls], ['read'])
        for key, value in [('channel', 1), ('pending', True), ('up_us', 850)]:
            with self.subTest(key=key):
                hardware = FakeServo()
                hardware.state['channels'][1][key] = value
                with self.assertRaises(servo_module.ServoError):
                    servo_module.ServoService(hardware).raise_for_motion(lambda: False)
                self.assertEqual([p['action'] for p in hardware.calls], ['read'])

    def test_configure_readback_failure_never_up(self):
        def hook(payload, state):
            if payload['action'] == 'configure':
                state['channels'][0]['up_us'] = 900
        self.hardware.hook = hook
        with self.assertRaisesRegex(servo_module.ServoError, '写回'):
            self.raise_once()
        self.assert_no_up()

    def test_stop_after_configure_never_up(self):
        def hook(payload, state):
            if payload['action'] == 'configure':
                self.service.stop()
        self.hardware.hook = hook
        with self.assertRaisesRegex(servo_module.ServoError, '停车'):
            self.raise_once()
        self.assert_no_up()

    def test_up_ack_or_driver_timeout_never_retries(self):
        for error in ('driver_timeout', 'disabled', 'wrong_active', 'wrong_request', 'sequence', 'boot'):
            with self.subTest(error=error):
                hardware = FakeServo()
                def hook(payload, state):
                    if payload['action'] == 'up':
                        if error == 'driver_timeout': raise servo_module.ServoError('timeout', 503)
                        if error == 'disabled': state['channels'][1]['enabled'] = False
                        if error == 'wrong_active': state['channels'][1]['active_us'] = 2100
                        if error == 'wrong_request': state['channels'][1]['requested_us'] = 2100
                        if error == 'sequence': state['command_sequence'] += 1
                        if error == 'boot': state['boot_id'] = 'other-boot'
                hardware.hook = hook
                with self.assertRaises(servo_module.ServoError):
                    servo_module.ServoService(hardware).raise_for_motion(lambda: False)
                self.assertEqual(sum(p['action'] == 'up' for p in hardware.calls), 1)

    def test_sequence_wrap_is_supported(self):
        self.hardware.state['command_sequence'] = 0xFFFFFFFF
        self.assertEqual(self.raise_once()['command_sequence'], 0)

    def test_stop_during_settle_aborts_without_second_read(self):
        self.clock.on_sleep = self.service.stop
        with self.assertRaisesRegex(servo_module.ServoError, '停车'):
            self.raise_once()
        self.assertEqual([p['action'] for p in self.hardware.calls], ['read', 'configure', 'configure', 'up'])
        self.assertLess(self.clock.now, .6)

    def test_external_command_or_disabled_pwm_during_settle_aborts(self):
        for change in ('sequence', 'down', 'disabled'):
            with self.subTest(change=change):
                hardware = FakeServo()
                def interfere():
                    if change == 'sequence': hardware.state['command_sequence'] += 1
                    if change == 'down': hardware.state['channels'][0].update(selected_position='down', active_us=1980)
                    if change == 'disabled': hardware.state['channels'][0]['enabled'] = False
                self.clock.on_sleep = interfere
                with self.assertRaises(servo_module.ServoError):
                    servo_module.ServoService(hardware).raise_for_motion(lambda: False)

    def test_saved_preset_survives_service_restart_without_startup_hardware_access(self):
        self.servo.run(dict(action='configure', channel=1, up_us=965, down_us=1975))
        self.hardware.calls.clear()
        new_hardware = FakeServo()
        fresh = servo_module.ServoService(new_hardware, settings_path=self.profile)
        self.assertEqual(new_hardware.calls, [])
        receipt = fresh.raise_for_motion(lambda: False)
        self.assertEqual(receipt['up_us'], {'1': 965, '2': 960})
        self.assertEqual(new_hardware.state['channels'][0]['down_us'], 1975)

    def test_saved_right_preset_used_only_after_explicit_save(self):
        self.servo.run(dict(action='configure', channel=2, up_us=980, down_us=1990))
        hardware = FakeServo()
        servo = servo_module.ServoService(hardware, settings_path=self.profile)
        self.assertEqual(servo.raise_for_motion(lambda: False)['up_us'], {'1': 960, '2': 980})

    def test_corrupt_saved_profile_fails_closed_without_hardware_access(self):
        self.profile.write_text('{invalid')
        servo = servo_module.ServoService(self.hardware, settings_path=self.profile)
        with self.assertRaisesRegex(servo_module.ServoError, '端点'):
            servo.raise_for_motion(lambda: False)
        self.assertEqual(self.hardware.calls, [])

    def test_profile_write_failure_prevents_automatic_motion(self):
        with mock.patch.object(Path, 'write_text', side_effect=OSError('full')):
            with self.assertRaisesRegex(servo_module.ServoError, '保存失败'):
                self.servo.run(dict(action='configure', channel=1, up_us=960, down_us=1980))
        self.hardware.calls.clear()
        with self.assertRaises(servo_module.ServoError): self.raise_once()
        self.assertEqual(self.hardware.calls, [])


class AutoRaiseJobTests(base.ServiceFixture):
    def setUp(self):
        super().setUp()
        (self.root / 'zdt/wujing_usb_probe/fast_rebuild.py').write_text('# fake')
        self.calls = []
        def prepare(stopped):
            self.calls.append('raise')
            self.assertTrue(self.service.status()['busy'])
            with (self.runtime / 'active.lock').open('a') as other:
                with self.assertRaises(BlockingIOError):
                    base.service_module.fcntl.flock(other, base.service_module.fcntl.LOCK_EX | base.service_module.fcntl.LOCK_NB)
            return dict(command_verified=True, position_feedback_available=False, settle_ms=600)
        self.service.prepare_motion = prepare

    def run_job(self, action='rebuild'):
        self.service._state['ready'] = True
        captured = []
        with mock.patch.object(base.service_module.threading, 'Thread', side_effect=lambda **kw: captured.append(kw) or mock.Mock()):
            job_id = self.service.start(action, jog=base.jog() if action == 'jog' else None)
        process = mock.Mock(returncode=0)
        def communicate(payload, timeout):
            self.calls.append('xy')
            (self.runtime / (job_id + '.json')).write_text(json.dumps(dict(passed=True, ready=True, connected=True)))
        process.communicate.side_effect = communicate
        self.service._popen = mock.Mock(return_value=process)
        captured[0]['target'](*captured[0]['args'])
        return self.service.status()

    def test_all_xy_tasks_raise_under_exclusive_job_lock_before_xy(self):
        for action in ('rebuild', 'circle', 'jog', 'pads'):
            self.calls.clear()
            state = self.run_job(action)
            self.assertEqual(self.calls, ['raise', 'xy'])
            self.assertEqual(state['last_job']['state'], 'completed')
            self.assertTrue(state['last_job']['probe_raise']['command_verified'])
            self.assertFalse(state['last_job']['probe_raise']['position_feedback_available'])

    def test_raise_failure_or_missing_receipt_never_creates_xy_worker(self):
        for error in (True, False):
            def prepare(stopped):
                if error: raise servo_module.ServoError('raise failed')
            self.service.prepare_motion = prepare
            state = self.run_job()
            self.service._popen.assert_not_called()
            self.assertFalse(state['busy'])
            self.assertFalse(state['ready'])
            self.assertEqual(state['last_job']['state'], 'failed')

    def test_stop_just_after_raise_blocks_worker_and_preserves_stop(self):
        def prepare(stopped):
            self.service.stop()
            return dict(command_verified=True)
        self.service.prepare_motion = prepare
        state = self.run_job()
        self.service._popen.assert_not_called()
        self.assertTrue(state['stopped'])
        self.assertIn('停车', state['last_job']['error'])

    def test_busy_stop_and_unready_circle_do_not_raise_or_create_job(self):
        callback = mock.Mock()
        self.service.prepare_motion = callback
        with self.assertRaises(base.service_module.ControlError): self.service.start('circle')
        self.service._state['busy'] = True
        with self.assertRaises(base.service_module.ControlError): self.service.start('rebuild')
        self.service._state['busy'] = False
        self.service.stop()
        with self.assertRaises(base.service_module.ControlError): self.service.start('rebuild')
        callback.assert_not_called()
        self.popen.assert_not_called()

    def test_no_automatic_raise_provider_rejected(self):
        self.service.prepare_motion = None
        with self.assertRaises(base.service_module.ControlError): self.service.start('rebuild')
        self.popen.assert_not_called()


@unittest.skipUnless(base.HAS_FLASK, 'Flask required')
class AutoRaiseRouteTests(AutoRaiseJobTests):
    def setUp(self):
        super().setUp()
        from flask import Flask
        self.app = Flask('auto_raise_offline', instance_path=str(Path(self.temporary.name) / 'instance'))
        self.app.config.update(TESTING=True, SECRET_KEY='test-only')
        self.app.extensions['motor_service'] = self.service
        self.manual = mock.Mock(side_effect=servo_module.ServoError('manual required'))
        self.app.extensions['servo_service'] = base.types.SimpleNamespace(require_raised=self.manual)
        self.app.register_blueprint(base.load_module('motor_web').motor_bp)
        self.client = self.app.test_client()
        self.headers = {'X-Requested-With': 'XMLHttpRequest', 'Origin': 'http://localhost'}
        with self.client.session_transaction() as session:
            session['motion_enabled'] = True
            session['user_id'] = 'test'

    def test_rebuild_and_circle_accept_without_manual_confirmation(self):
        self.hold_jobs()
        for action in ('rebuild', 'circle'):
            self.service._state.update(busy=False, ready=True)
            for handle in self.handles: handle.close()
            response = self.client.post('/motor/' + action, json={}, headers=self.headers)
            self.assertEqual(response.status_code, 202)
        self.manual.assert_not_called()

    def test_malformed_offline_or_foreign_request_never_raises(self):
        prepare = mock.Mock()
        self.service.prepare_motion = prepare
        self.assertEqual(self.client.post('/motor/rebuild', json={'speed': 99}, headers=self.headers).status_code, 400)
        self.assertEqual(self.client.post('/motor/rebuild', json={}, headers=dict(self.headers, Origin='http://bad')).status_code, 403)
        with self.client.session_transaction() as session: session['motion_enabled'] = False
        self.assertEqual(self.client.post('/motor/rebuild', json={}, headers=self.headers).status_code, 409)
        prepare.assert_not_called()
        self.popen.assert_not_called()

    def test_jog_uses_automatic_preflight_without_manual_gate(self):
        self.hold_jobs()
        self.service._state['ready'] = True
        response = self.client.post('/motor/jog', json=base.jog(), headers=self.headers)
        self.assertEqual(response.status_code, 202)
        self.manual.assert_not_called()
        self.popen.assert_not_called()

    def test_servo_register_wires_real_callback_without_hardware_access(self):
        web = base.load_module('servo_web')
        profile = Path(self.temporary.name) / 'servo_positions.json'
        profile.write_text(json.dumps(dict(channels={str(c): dict(up_us=960, down_us=1980) for c in (1, 2)})))
        with mock.patch.object(self.app, 'instance_path', self.temporary.name):
            web.register(self.app)
        servo = self.app.extensions['servo_service']
        hardware = FakeServo()
        servo._runner = hardware
        clock = FakeClock()
        with mock.patch.object(servo_module, 'time', clock):
            state = self.run_job()
        self.assertEqual(state['last_job']['state'], 'completed')
        self.assertEqual([p['action'] for p in hardware.calls], ['read', 'configure', 'configure', 'up', 'read'])

    def test_busy_measurement_blocks_automatic_lift(self):
        web = base.load_module('servo_web')
        web.register(self.app)
        self.app.extensions['servo_cycle_service'] = base.types.SimpleNamespace(busy=True)
        hardware = FakeServo()
        self.app.extensions['servo_service']._runner = hardware
        state = self.run_job()
        self.assertEqual(state['last_job']['state'], 'failed')
        self.assertEqual(hardware.calls, [])
        self.service._popen.assert_not_called()

    def test_pwm_stop_cancels_pending_xy_before_stopping_pwm(self):
        web = base.load_module('servo_web')
        web.register(self.app)
        hardware = FakeServo()
        self.app.extensions['servo_service']._runner = hardware
        self.service._state['busy'] = True
        response = self.client.post('/motor/servo/stop', json={'channel': 3}, headers=self.headers)
        self.assertEqual(response.status_code, 200)
        self.assertTrue(self.service.stop_file.exists())
        self.assertEqual(hardware.calls, [dict(action='stop', channel=3)])


if __name__ == '__main__':
    unittest.main()
