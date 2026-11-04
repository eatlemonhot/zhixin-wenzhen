"""Offline motor-control regression tests; no original controller or USB imports.

Run with ``python3 -m unittest discover -s tests -v`` from Software-master.
The synthetic package deliberately bypasses interface/__init__.py and its Flask
and hardware dependencies. Every machine path and controller is a temporary fake.
"""
import copy
import importlib.util
import json
import math
from pathlib import Path
import subprocess
import sys
import tempfile
import types
import unittest
from unittest import mock


PACKAGE = '_offline_motor_test_interface'
INTERFACE = Path(__file__).resolve().parents[1] / 'interface'
package = types.ModuleType(PACKAGE)
package.__path__ = [str(INTERFACE)]
sys.modules[PACKAGE] = package


def load_module(name):
    qualified = PACKAGE + '.' + name
    spec = importlib.util.spec_from_file_location(qualified, INTERFACE / (name + '.py'))
    module = importlib.util.module_from_spec(spec)
    sys.modules[qualified] = module
    spec.loader.exec_module(module)
    return module


worker = load_module('motor_worker')
service_module = load_module('motor_service')
HAS_FLASK = importlib.util.find_spec('flask') is not None


def jog(probe='left', direction='right', step_mm=1):
    return dict(probe=probe, direction=direction, step_mm=step_mm)


class FakeSerial:
    def __init__(self):
        self.validated = []
        self.emitted = []
        self.packet_validator = self.validate

    def validate(self, packet):
        self.validated.append(packet)
        if len(packet) != 3 or packet[0] not in (1, 2, 3, 4) or packet[1] not in (0x36, 0xCD):
            raise ValueError('original transport validator rejected packet')

    def emit(self, packet):
        self.packet_validator(packet)
        self.emitted.append(packet)


class FakeSession:
    def __init__(self, controller, label):
        self.controller = controller
        self.label = label
        self.report = {'passed': False}
        self.motor = types.SimpleNamespace(ser=FakeSerial())
        self.closed = 0
        self.initialized = False
        self.stop_checks = 0

    def initialize(self):
        self.initialized = True
        if self.controller.initialize_hook:
            self.controller.initialize_hook(self)

    def check_stop(self):
        self.stop_checks += 1
        if self.controller.core.STOP_FILE.exists():
            raise KeyboardInterrupt('fake stop requested')

    def close(self):
        self.closed += 1
        if self.controller.close_error:
            raise RuntimeError(self.controller.close_error)
        if self.controller.cleanup_errors:
            self.report['cleanup_errors'] = self.controller.cleanup_errors
        self.report['passed'] = 'error' not in self.report and not self.controller.cleanup_errors


class FakeController:
    def __init__(self, directory):
        self.core = types.SimpleNamespace(STOP_FILE=Path(directory) / 'stop.request')
        self.positions = {'1': 10.0, '2': 20.0, '3': 30.0, '4': 40.0}
        self.coordinates = {
            'valid': True,
            'axes': {str(a): dict(soft_min_mm=2.0, soft_max_mm=100.0) for a in range(1, 5)},
            'joint_x_limit': {'max_combined_inward_mm': 150.0},
        }
        self.sessions = []
        self.read_sessions = []
        self.moves = []
        self.initialize_hook = None
        self.read_hook = None
        self.move_hook = None
        self.open_error = None
        self.close_error = None
        self.cleanup_errors = []
        self.reference_valid = True
        self.speed = 0
        self.status_error = None

    def Session(self, label, active_axes=None):
        if self.open_error:
            raise RuntimeError(self.open_error)
        session = FakeSession(self, label)
        session.active_axes = active_axes
        self.sessions.append(session)
        return session

    def load_coordinates(self):
        return copy.deepcopy(self.coordinates)

    def read_positions(self, session, coordinates):
        if not self.reference_valid:
            raise RuntimeError('参考无效')
        self.read_sessions.append(session)
        if self.read_hook:
            self.read_hook(session, len(self.read_sessions))
        return dict(self.positions), {a: dict(speed_rpm=self.speed) for a in self.positions}

    def move_to(self, session, coordinates, address, target):
        self.moves.append((session, address, target))
        if self.move_hook:
            self.move_hook(session)
        session.motor.ser.emit(bytes([address, 0xCD, 0x6B]))
        self.positions[str(address)] = target
        return {'address': address, 'target_mm': target}

    def move_group(self, session, coordinates, targets):
        geometry, _ = worker.pcb_modules()
        session.report['move_groups'] = geometry.plan_move_groups(self.positions, targets, coordinates)
        original = session.motor.ser.packet_validator
        def guarded(packet):
            original(packet)
            session.check_stop()
        session.motor.ser.packet_validator = guarded
        for move in geometry.plan_moves(self.positions, targets, coordinates):
            session.check_stop()
            self.move_to(session, coordinates, move['address'], move['target_mm'])
            self.read_positions(session, coordinates)
        session.check_stop()
        return dict(self.positions)

    def Machine(self, run_id):
        def status():
            if self.status_error:
                raise RuntimeError(self.status_error)
            return {
                'all_references_valid': self.reference_valid,
                'motors': {address: {'millimetres': value, 'sample': {'speed_rpm': self.speed}}
                           for address, value in self.positions.items()},
            }
        return types.SimpleNamespace(status=status)


class InputTests(unittest.TestCase):
    def test_all_eight_physical_direction_mappings(self):
        expected = {
            ('left', 'left'): (1, -1.0), ('left', 'right'): (1, 1.0),
            ('right', 'left'): (2, 1.0), ('right', 'right'): (2, -1.0),
            ('left', 'up'): (3, 1.0), ('left', 'down'): (3, -1.0),
            ('right', 'up'): (4, 1.0), ('right', 'down'): (4, -1.0),
        }
        for (probe, direction), result in expected.items():
            with self.subTest(probe=probe, direction=direction):
                self.assertEqual(worker.validate_jog(jog(probe, direction)), result)

    def test_four_supported_step_sizes(self):
        for step in (0.1, 0.5, 1, 1.0, 10, 10.0):
            with self.subTest(step=step):
                self.assertEqual(worker.validate_jog(jog(step_mm=step)), (1, float(step)))

    def test_invalid_steps_are_rejected(self):
        for step in (True, False, None, '1', -1, 0, 0.2, 2, math.nan, math.inf, -math.inf, [], {}):
            with self.subTest(step=repr(step)), self.assertRaises(ValueError):
                worker.validate_jog(jog(step_mm=step))

    def test_unknown_probe_vertical_probe_motion_and_bad_shapes_rejected(self):
        for value in (None, [], {}, {'probe': 'left'}, dict(jog(), extra=1),
                      jog(probe='middle'), jog(direction='lower'), jog(direction='z_down'),
                      jog(probe=[]), jog(direction={})):
            with self.subTest(payload=value), self.assertRaises(ValueError):
                worker.validate_jog(value)


class WorkerTests(unittest.TestCase):
    def setUp(self):
        self.temporary = tempfile.TemporaryDirectory()
        self.addCleanup(self.temporary.cleanup)
        self.controller = FakeController(self.temporary.name)

    def run_jog(self, payload=None):
        return worker.jog_machine(self.controller, payload or jog(), 'web_offline123')

    def test_relative_target_uses_live_position_and_one_session_then_restores(self):
        result = self.run_jog(jog(step_mm=0.5))
        session = self.controller.sessions[0]
        self.assertEqual(self.controller.moves, [(session, 1, 10.5)])
        self.assertEqual(session.active_axes, (1,))
        self.assertEqual(self.controller.read_sessions, [session, session])
        self.assertEqual(session.closed, 1)
        self.assertTrue(session.initialized)
        self.assertTrue(result['passed'])
        self.assertEqual(result['positions_mm']['1'], 10.5)
        self.assertEqual(session.report['web_jog']['target_mm'], 10.5)

    def test_confirmed_left_and_right_arm_motor_assignments(self):
        cases = (('left', 'right', 1), ('right', 'left', 2),
                 ('left', 'up', 3), ('right', 'up', 4))
        for probe, direction, address in cases:
            with self.subTest(probe=probe, direction=direction):
                before = dict(self.controller.positions)
                result = self.run_jog(jog(probe, direction))
                session = self.controller.sessions[-1]
                self.assertEqual(self.controller.moves[-1],
                                 (session, address, before[str(address)] + 1.0))
                self.assertEqual(session.active_axes, (address,))
                for other in before:
                    expected = before[other] + (1.0 if other == str(address) else 0)
                    self.assertEqual(result['positions_mm'][other], expected)

    def test_left_y_up_and_down_use_coordinate_sign_without_double_negation(self):
        # Controller conversion owns motor 3's positive_mm_sign=-1. Web targets
        # remain carriage coordinates: toward rear means increasing millimetres.
        self.run_jog(jog('left', 'up'))
        self.assertEqual(self.controller.moves[-1][1:], (3, 31.0))
        self.run_jog(jog('left', 'down'))
        self.assertEqual(self.controller.moves[-1][1:], (3, 30.0))

    def test_reference_failure_never_moves_and_always_closes(self):
        def invalid_reference(session, number):
            raise RuntimeError('reference differs')
        self.controller.read_hook = invalid_reference
        with self.assertRaisesRegex(RuntimeError, 'reference differs'):
            self.run_jog()
        self.assertEqual(self.controller.moves, [])
        self.assertEqual(self.controller.sessions[0].closed, 1)

    def test_existing_stop_does_not_even_open_a_session(self):
        self.controller.core.STOP_FILE.write_text('stop')
        with self.assertRaises(RuntimeError):
            self.run_jog()
        self.assertEqual(self.controller.sessions, [])
        self.assertEqual(self.controller.moves, [])

    def test_stop_during_initialize_blocks_move_and_closes(self):
        self.controller.initialize_hook = lambda session: self.controller.core.STOP_FILE.write_text('stop')
        with self.assertRaisesRegex(RuntimeError, 'stop requested'):
            self.run_jog()
        self.assertEqual(self.controller.moves, [])
        self.assertEqual(self.controller.read_sessions, [])
        self.assertEqual(self.controller.sessions[0].closed, 1)

    def test_stop_during_live_reference_read_blocks_move_and_closes(self):
        self.controller.read_hook = lambda session, number: self.controller.core.STOP_FILE.write_text('stop')
        with self.assertRaisesRegex(RuntimeError, 'stop requested'):
            self.run_jog()
        self.assertEqual(self.controller.moves, [])
        self.assertEqual(self.controller.sessions[0].closed, 1)

    def test_stop_between_move_entry_and_position_packet_blocks_wire_command(self):
        self.controller.move_hook = lambda session: self.controller.core.STOP_FILE.write_text('stop')
        with self.assertRaisesRegex(RuntimeError, 'stop requested'):
            self.run_jog()
        serial = self.controller.sessions[0].motor.ser
        self.assertEqual(len(self.controller.moves), 1)
        self.assertEqual(serial.emitted, [])
        self.assertEqual(len(serial.validated), 1)
        self.assertEqual(self.controller.positions['1'], 10.0)
        self.assertEqual(self.controller.sessions[0].closed, 1)

    def test_guard_preserves_original_transport_validation(self):
        def invalid_packet(session):
            session.motor.ser.emit(b'\x00\xcd\x6b')
        self.controller.move_hook = invalid_packet
        with self.assertRaisesRegex(RuntimeError, 'original transport validator rejected'):
            self.run_jog()
        self.assertEqual(self.controller.sessions[0].motor.ser.emitted, [])
        self.assertEqual(self.controller.sessions[0].closed, 1)

    def test_guard_does_not_block_read_or_cleanup_packets_when_stopped(self):
        self.run_jog()
        serial = self.controller.sessions[0].motor.ser
        self.controller.core.STOP_FILE.write_text('stop')
        serial.emit(b'\x01\x36\x6b')
        self.assertEqual(serial.emitted[-1], b'\x01\x36\x6b')
        with self.assertRaises(KeyboardInterrupt):
            serial.emit(b'\x01\xcd\x6b')

    def test_cleanup_failure_is_never_reported_as_success(self):
        self.controller.cleanup_errors = ['Motor 3 cleanup failed']
        with self.assertRaisesRegex(RuntimeError, 'Motor 3 cleanup failed'):
            self.run_jog()
        self.assertEqual(self.controller.sessions[0].closed, 1)

    def test_close_exception_is_never_reported_as_success(self):
        self.controller.close_error = 'USB close failed'
        with self.assertRaisesRegex(RuntimeError, 'USB close failed'):
            self.run_jog()
        self.assertEqual(self.controller.sessions[0].closed, 1)

    def test_missing_usb_is_a_readable_failure_without_a_move(self):
        self.controller.open_error = 'Exactly one 1a86:7523 device must be connected'
        with self.assertRaisesRegex(RuntimeError, 'Exactly one'):
            self.run_jog()
        self.assertEqual(self.controller.moves, [])

    def test_invalid_current_positions_block_movement(self):
        cases = ({'1': 100.0, '2': 60.0, '3': 30.0, '4': 40.0},
                 {'1': math.nan, '2': 20.0, '3': 30.0, '4': 40.0},
                 {'1': 10.0, '2': 200.0, '3': 30.0, '4': 40.0},
                 {'1': 10.0, '2': 20.0, '3': 30.0})
        for positions in cases:
            with self.subTest(positions=positions):
                self.controller.positions = positions
                with self.assertRaises(RuntimeError):
                    self.run_jog()
                self.assertEqual(self.controller.moves, [])
                self.assertEqual(self.controller.sessions[-1].closed, 1)

    def test_successful_check_has_no_motion_or_control_session(self):
        result = worker.check_machine(self.controller, 'web_offline123')
        self.assertTrue(result['ready'])
        self.assertEqual(result['motion_commands_sent'], 0)
        self.assertEqual(self.controller.sessions, [])
        self.assertEqual(self.controller.moves, [])

    def test_check_rejects_stale_reference_moving_axes_and_missing_device(self):
        self.controller.reference_valid = False
        with self.assertRaisesRegex(RuntimeError, '参考无效'):
            worker.check_machine(self.controller, 'web_offline123')
        self.controller.reference_valid = True
        self.controller.speed = 1
        with self.assertRaisesRegex(RuntimeError, '尚未停稳'):
            worker.check_machine(self.controller, 'web_offline123')

    def test_communication_check_can_report_connected_without_motion_ready(self):
        self.controller.reference_valid = False
        result = worker.check_machine(self.controller, 'web_offlinecheck', allow_invalid_reference=True)
        self.assertTrue(result['connected']);self.assertFalse(result['ready'])
        self.assertEqual(result['motor_parameter_writes'],0)
        self.assertEqual(self.controller.moves,[])
        self.controller.status_error = 'missing CH340'
        with self.assertRaisesRegex(RuntimeError, 'missing CH340'):
            worker.check_machine(self.controller, 'web_offline123')


class ServiceFixture(unittest.TestCase):
    def setUp(self):
        self.temporary = tempfile.TemporaryDirectory()
        self.addCleanup(self.temporary.cleanup)
        self.root = Path(self.temporary.name) / 'controller'
        (self.root / 'zdt/wujing_usb_probe').mkdir(parents=True)
        (self.root / 'zdt/wujing_usb_probe/motorctl.py').write_text('# fake; never imported\n')
        (self.root / 'zdt/machine_coordinates').mkdir()
        self.runtime = Path(self.temporary.name) / 'runtime'
        self.usb_lock = Path(self.temporary.name) / 'usb.lock'
        self.popen = mock.Mock(side_effect=AssertionError('unexpected subprocess'))
        self.service = service_module.MotorService(self.root, self.runtime, popen=self.popen,
                                                  usb_lock_file=self.usb_lock,
                                                  prepare_motion=lambda stop: dict(command_verified=True))
        self.handles = []
        self.addCleanup(self.close_handles)

    def close_handles(self):
        for handle in self.handles:
            handle.close()

    def hold_jobs(self):
        def create_thread(**kwargs):
            self.handles.append(kwargs['args'][1])
            return mock.Mock()
        patch = mock.patch.object(service_module.threading, 'Thread', side_effect=create_thread)
        patch.start()
        self.addCleanup(patch.stop)

    def clear_without_global_lock(self):
        return self.service.clear_stop()


class ServiceTests(ServiceFixture):

    def test_status_polling_never_spawns_a_worker(self):
        for _ in range(20):
            state = self.service.status()
            self.assertTrue(state['available'])
            self.assertFalse(state['ready'])
        self.popen.assert_not_called()
        self.assertFalse(self.runtime.exists())

    def test_busy_rejects_repeated_requests_without_queueing(self):
        self.hold_jobs()
        self.service.start('check')
        with self.assertRaises(service_module.ControlError) as caught:
            self.service.start('jog', jog())
        self.assertEqual(caught.exception.status, 409)
        self.assertEqual(len(self.handles), 1)
        self.popen.assert_not_called()

    def test_runtime_lock_excludes_a_second_service_instance(self):
        self.hold_jobs()
        self.service.start('check')
        other = service_module.MotorService(self.root, self.runtime, popen=self.popen,
                                            usb_lock_file=self.usb_lock)
        with self.assertRaises(service_module.ControlError) as caught:
            other.start('check')
        self.assertEqual(caught.exception.status, 409)
        self.assertEqual(len(self.handles), 1)

    def test_jog_requires_an_explicit_successful_check(self):
        with self.assertRaises(service_module.ControlError):
            self.service.start('jog', jog())
        self.popen.assert_not_called()

    def test_stop_is_persistent_and_clear_still_requires_recheck(self):
        self.service._state.update(ready=True, connected=True, positions_mm={'2': 20})
        state = self.service.stop()
        self.assertTrue(state['stopped'])
        self.assertFalse(state['ready'])
        other = service_module.MotorService(self.root, self.runtime, popen=self.popen,
                                            usb_lock_file=self.usb_lock)
        self.assertTrue(other.status()['stopped'])
        with self.assertRaises(service_module.ControlError):
            self.service.start('jog', jog())
        state = self.clear_without_global_lock()
        self.assertFalse(state['stopped'])
        self.assertFalse(state['ready'])
        self.assertFalse(state['connected'])
        self.assertEqual(state['positions_mm'], {})
        with self.assertRaises(service_module.ControlError):
            self.service.start('jog', jog())
        self.popen.assert_not_called()

    def test_clear_stop_rejects_busy_and_external_usb_ownership(self):
        self.service.stop()
        self.service._state['busy'] = True
        with self.assertRaises(service_module.ControlError):
            self.service.clear_stop()
        self.service._state['busy'] = False
        with self.usb_lock.open('a') as external_controller:
            service_module.fcntl.flock(external_controller,
                                       service_module.fcntl.LOCK_EX | service_module.fcntl.LOCK_NB)
            with self.assertRaises(service_module.ControlError):
                self.service.clear_stop()
        self.assertTrue(self.service.stop_file.exists())

    def test_invalid_jog_and_unknown_action_never_launch(self):
        for action, payload in [('rehome', None), ('jog', jog(step_mm=2)), ('jog', jog(direction='lower'))]:
            with self.subTest(action=action, payload=payload):
                with self.assertRaises(service_module.ControlError) as caught:
                    self.service.start(action, payload)
                self.assertEqual(caught.exception.status, 400)
        self.popen.assert_not_called()

    def run_fake_process(self, *, timed_out=False, passed=True, returncode=0, ready=True):
        self.runtime.mkdir()
        handle = (self.runtime / 'active.lock').open('a')
        self.handles.append(handle)
        self.service._state.update(busy=True, ready=False)
        payload = dict(action='check', run_id='web_offline123')
        result_path = self.runtime / (payload['run_id'] + '.json')
        process = mock.Mock(returncode=returncode)
        received = []

        def communicate(data=None, timeout=None):
            received.append((data, timeout))
            if timed_out and len(received) == 1:
                raise subprocess.TimeoutExpired('fake worker', timeout)
            if timed_out:
                self.assertTrue(self.service.stop_file.exists())
                self.assertTrue(self.service.status()['busy'])
                self.assertFalse(self.service.status()['ready'])
            result_path.write_text(json.dumps(dict(passed=passed, connected=True, ready=ready, positions_mm={'2': 20}, error='fake failure')))
            return b'', b''

        process.communicate.side_effect = communicate
        self.service._popen = mock.Mock(return_value=process)
        self.service._run(payload, handle)
        return process, received, handle

    def test_successful_worker_result_enables_control_and_releases_busy_lock(self):
        process, received, handle = self.run_fake_process()
        state = self.service.status()
        self.assertFalse(state['busy'])
        self.assertTrue(state['ready'])
        self.assertEqual(state['last_job']['state'], 'completed')
        self.assertEqual(json.loads(received[0][0])['action'], 'check')
        self.assertTrue(handle.closed)

    def test_worker_failure_does_not_retain_ready_or_stale_positions(self):
        self.run_fake_process(passed=False, returncode=1)
        state = self.service.status()
        self.assertFalse(state['busy'])
        self.assertFalse(state['ready'])
        self.assertEqual(state['positions_mm'], {})
        self.assertEqual(state['last_job']['state'], 'failed')

    def test_successful_communication_does_not_override_not_ready_result(self):
        self.run_fake_process(ready=False)
        state=self.service.status()
        self.assertTrue(state['connected']);self.assertFalse(state['ready'])
        self.assertEqual(state['last_job']['state'],'completed')

    def test_timeout_latches_stop_and_waits_for_cleanup_without_killing(self):
        process, received, handle = self.run_fake_process(timed_out=True)
        self.assertEqual(len(received), 2)
        self.assertIsNone(received[1][1])
        self.assertTrue(self.service.status()['stopped'])
        self.assertFalse(self.service.status()['ready'])
        self.assertFalse(self.service.status()['busy'])
        self.assertTrue(handle.closed)
        process.kill.assert_not_called()
        process.terminate.assert_not_called()


@unittest.skipUnless(HAS_FLASK, 'Flask is unavailable; run this class in the board venv')
class FlaskRouteTests(ServiceFixture):
    def setUp(self):
        super().setUp()
        from flask import Flask
        web = load_module('motor_web')
        self.app = Flask('offline_motor_routes')
        self.app.config.update(TESTING=True,SECRET_KEY='offline-test')
        self.app.extensions['motor_service'] = self.service
        self.app.extensions['servo_service'] = types.SimpleNamespace(require_raised=lambda:None)
        self.app.register_blueprint(web.motor_bp)
        self.client = self.app.test_client()
        with self.client.session_transaction() as session:session['motion_enabled']=True
        self.headers = {'X-Requested-With': 'XMLHttpRequest', 'Origin': 'http://localhost'}

    def test_get_status_does_not_open_usb_or_launch_worker(self):
        response = self.client.get('/motor/status')
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.headers['Cache-Control'], 'no-store')
        self.assertFalse(response.get_json()['ready'])
        self.popen.assert_not_called()

    def test_cross_origin_and_non_json_requests_are_rejected(self):
        response = self.client.post('/motor/check', json={}, headers=dict(self.headers, Origin='http://foreign.invalid'))
        self.assertEqual(response.status_code, 403)
        self.assertEqual(self.client.post('/motor/check', json={}).status_code, 403)
        self.assertEqual(self.client.post('/motor/check', data='{}', headers=self.headers).status_code, 403)
        self.popen.assert_not_called()

    def test_jog_invalid_payload_is_400_and_unchecked_machine_is_409(self):
        response = self.client.post('/motor/jog', json=jog(step_mm=3), headers=self.headers)
        self.assertEqual(response.status_code, 400)
        response = self.client.post('/motor/jog', json=jog(), headers=self.headers)
        self.assertEqual(response.status_code, 409)
        self.popen.assert_not_called()

    def test_explicit_check_returns_a_job_id_and_busy_rejects_duplicate(self):
        self.hold_jobs()
        response = self.client.post('/motor/check', json={}, headers=self.headers)
        self.assertEqual(response.status_code, 202)
        self.assertTrue(response.get_json()['job_id'].startswith('web_'))
        response = self.client.post('/motor/check', json={}, headers=self.headers)
        self.assertEqual(response.status_code, 409)

    def test_absent_servo_service_blocks_xy_before_worker(self):
        del self.app.extensions['servo_service']
        response=self.client.post('/motor/jog',json=jog(),headers=self.headers)
        self.assertEqual(response.status_code,503)
        self.popen.assert_not_called()

    def test_stop_route_persists_stop_without_worker(self):
        response = self.client.post('/motor/stop', json={}, headers=self.headers)
        self.assertEqual(response.status_code, 200)
        self.assertTrue(response.get_json()['stopped'])
        self.assertTrue(self.service.stop_file.exists())
        self.popen.assert_not_called()


if __name__ == '__main__':
    unittest.main()

