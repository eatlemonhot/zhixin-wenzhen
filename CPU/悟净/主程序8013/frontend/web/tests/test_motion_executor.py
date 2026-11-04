import ast
import json
from pathlib import Path
import queue
import subprocess
import sys
import threading
import time
import types
import unittest
from unittest import mock

import test_motor_control as base

client_module = base.load_module('motion_executor')


CHILD = r'''
import json, os, pathlib, signal, sys, time
root=pathlib.Path(sys.argv[1])
def terminate(*args):
    raise KeyboardInterrupt('fake terminate')
signal.signal(signal.SIGTERM, terminate)
(root/('started-'+str(os.getpid()))).write_text('ready')
try:
    for raw in sys.stdin.buffer:
        req=json.loads(raw)
        with (root/'requests.jsonl').open('a') as h:
            h.write(json.dumps(req)+'\n')
        action=req['payload']['action']
        behavior=(root/'behavior').read_text() if (root/'behavior').exists() else 'ok'
        while behavior=='gate' and not (root/'gate').exists():
            time.sleep(.005)
        if behavior=='eof':
            break
        response={'request_id':req['request_id'], 'result':{
            'passed':True,'connected':True,'ready':True,'pid':os.getpid(),
            'positions_mm':{'1':10,'2':10,'3':10,'4':10}},'warm_active':action!='release'}
        if action=='release':
            response['result']['parameters_restored']=True
        if behavior=='mismatch':
            response['request_id']='wrong-id'
        elif behavior=='bad_result':
            response['result']['passed']='true'
        elif behavior=='failed':
            response['result'].update(passed=False,error='fake controller fault')
        elif behavior=='cold_read_failed' and action in ('probe','teach'):
            response['warm_active']=False
            response['result'].update(passed=False,connected=False,ready=False,error='power off',
                read_only_failure=True,parameters_retained=False,motion_commands_sent=0,motor_parameter_writes=0)
        elif behavior=='release_missing' and action=='release':
            del response['result']['parameters_restored']
        elif behavior=='release_warm' and action=='release':
            response['warm_active']=True
        elif behavior=='release_missing_warm' and action=='release':
            del response['warm_active']
        if behavior=='json':
            sys.stdout.buffer.write(b'{invalid\n')
        else:
            sys.stdout.buffer.write((json.dumps(response)+'\n').encode())
        sys.stdout.buffer.flush()
        if action=='release':
            break
except (KeyboardInterrupt,BrokenPipeError):
    pass
finally:
    time.sleep(.12)
    (root/('cleanup-'+str(os.getpid()))).write_text('restored')
'''


def until(predicate, timeout=3):
    deadline = time.monotonic() + timeout
    while not predicate():
        if time.monotonic() >= deadline:
            raise AssertionError('fake child/thread did not reach the expected state')
        time.sleep(.005)


class PipeProxy:
    def __init__(self, stream, partial=False, close_error=False):
        self.stream, self.partial, self.close_error = stream, partial, close_error
        self.closes = 0

    def write(self, raw):
        count = self.stream.write(raw)
        return count - 1 if self.partial else count

    def flush(self):
        return self.stream.flush()

    def close(self):
        self.closes += 1
        self.stream.close()
        if self.close_error and self.closes == 1:
            raise BrokenPipeError('fake close failure after EOF')

    @property
    def closed(self):
        return self.stream.closed


class MotionExecutorClientTests(base.ServiceFixture):
    def setUp(self):
        super().setUp()
        self.children = []
        self.partial = False
        self.close_error = False
        self.client = client_module.MotionExecutor(self.root, self.runtime,
                                                   popen=self.spawn, idle_seconds=30)
        self.addCleanup(self.cleanup_children)

    def spawn(self, command, **options):
        # Replace the executable, not a hardware module. All IPC is genuine.
        self.assertIn('--execute', command)
        child = subprocess.Popen([sys.executable, '-u', '-c', CHILD, str(self.root)], **options)
        self.children.append(child)
        until(lambda: (self.root / ('started-' + str(child.pid))).exists())
        if self.partial or self.close_error:
            child.stdin = PipeProxy(child.stdin, partial=self.partial, close_error=self.close_error)
        return child

    def cleanup_children(self):
        self.client.close()
        for child in self.children:
            if child.poll() is None:
                try:
                    child.stdin.close()
                except (OSError, ValueError):
                    pass
                child.terminate()
            child.wait(timeout=3)
            for stream in (child.stdin, child.stdout):
                try:
                    stream.close()
                except (OSError, ValueError):
                    pass
        self.client.close()

    def requests(self):
        file = self.root / 'requests.jsonl'
        return [json.loads(line) for line in file.read_text().splitlines()] if file.exists() else []

    def payload(self, action='jog'):
        return dict(action=action, run_id='web_test_request', jog=base.jog())

    def behavior(self, name):
        (self.root / 'behavior').write_text(name)

    def assert_cleaned(self):
        self.assertTrue(self.children)
        for child in self.children:
            self.assertIsNotNone(child.poll(), 'client returned before child exit')
            self.assertTrue((self.root / ('cleanup-' + str(child.pid))).exists(),
                            'client returned before parameter restoration finished')

    def test_consecutive_moves_and_readonly_teach_reuse_one_owner_with_unique_ids(self):
        results = [self.client.run(self.payload(action)) for action in ('jog', 'pads', 'teach', 'probe')]
        self.assertEqual(len(self.children), 1)
        self.assertEqual({r['pid'] for r in results}, {self.children[0].pid})
        requests = self.requests()
        self.assertEqual([r['payload']['action'] for r in requests], ['jog', 'pads', 'teach', 'probe'])
        self.assertEqual(len({r['request_id'] for r in requests}), 4)
        self.assertTrue(all(isinstance(r['request_id'], str) and len(r['request_id']) == 32 for r in requests))
        self.assertEqual([r['payload']['timeout_s'] for r in requests], [90, 600, 90, 5])

    def test_proven_cold_read_failure_does_not_latch_stop_or_destroy_owner(self):
        self.behavior('cold_read_failed')
        result = self.client.run(self.payload('probe'))
        self.assertFalse(result['passed'])
        self.assertFalse(result['connected'])
        self.assertTrue(self.client.running)
        self.assertFalse(self.client.stop_file.exists())
        self.assertIsNone(self.client.fault())
        self.behavior('ok')
        self.assertTrue(self.client.run(self.payload('probe'))['passed'])
        self.assertEqual(len(self.children), 1)
        self.assertFalse(self.client.stop_file.exists())

    def test_fault_log_disk_error_cannot_skip_waiting_for_real_cleanup(self):
        self.behavior('mismatch')
        with mock.patch.object(Path, 'write_text', side_effect=OSError('disk full')):
            with self.assertRaises(RuntimeError):
                self.client.run(self.payload())
        self.assert_cleaned()
        self.assertTrue(self.client.stop_file.exists())

    def test_release_requires_restore_receipt_and_child_exit(self):
        self.client.run(self.payload())
        result = self.client.release()
        self.assertIs(result['parameters_restored'], True)
        self.assertIs(result['warm_active'], False)
        self.assertFalse(self.client.running)
        self.assert_cleaned()
        self.assertEqual([r['payload']['action'] for r in self.requests()], ['jog', 'release'])
        self.assertFalse(self.client.fault_path.exists())

    def test_cold_release_never_spawns_a_child(self):
        result = self.client.release()
        self.assertEqual(result, dict(passed=True, parameters_restored=True, warm_active=False))
        self.assertEqual(self.children, [])

    def test_inflight_request_rejects_second_immediately_without_queueing(self):
        self.behavior('gate')
        results, errors = [], []
        def first():
            try:
                results.append(self.client.run(self.payload()))
            except BaseException as error:
                errors.append(error)
        thread = threading.Thread(target=first)
        thread.start()
        try:
            until(lambda: len(self.requests()) == 1)
            started = time.monotonic()
            with self.assertRaisesRegex(RuntimeError, '排队'):
                self.client.run(self.payload('pads'))
            self.assertLess(time.monotonic() - started, .25)
            self.assertEqual(len(self.requests()), 1)
        finally:
            (self.root / 'gate').touch()
            thread.join(timeout=3)
        self.assertFalse(thread.is_alive())
        self.assertEqual(errors, [])
        self.assertEqual(len(results), 1)
        self.assertFalse(self.client.stop_file.exists())

    def test_protocol_errors_latch_stop_wait_for_cleanup_and_never_resend(self):
        for name in ('json', 'mismatch', 'bad_result', 'failed', 'eof'):
            with self.subTest(behavior=name):
                self.behavior(name)
                self.client = client_module.MotionExecutor(self.root, self.runtime / name,
                                                           popen=self.spawn)
                before = len(self.requests())
                with self.assertRaises(BaseException):
                    self.client.run(self.payload())
                self.assertTrue(self.client.stop_file.exists())
                self.assertIsNotNone(self.client.fault())
                self.assert_cleaned()
                with self.assertRaises(RuntimeError):
                    self.client.run(self.payload())
                self.assertEqual(len(self.requests()), before + 1)
                self.client.close()

    def test_partial_write_is_uncertain_and_never_retries(self):
        self.partial = True
        with self.assertRaisesRegex(RuntimeError, '部分'):
            self.client.run(self.payload())
        self.assertTrue(self.client.stop_file.exists())
        self.assertIsNotNone(self.client.fault())
        self.assert_cleaned()
        self.assertEqual(len(self.requests()), 1)
        with self.assertRaises(RuntimeError):
            self.client.run(self.payload())
        self.assertEqual(len(self.requests()), 1)

    def test_response_timeout_requests_stop_and_waits_for_cleanup_without_resend(self):
        with mock.patch.object(client_module.queue.Queue, 'get', side_effect=queue.Empty):
            with self.assertRaisesRegex(RuntimeError, '超时'):
                self.client.run(self.payload())
        self.assertTrue(self.client.stop_file.exists())
        self.assertIsNotNone(self.client.fault())
        self.assert_cleaned()
        self.assertEqual(len(self.children), 1)
        self.assertLessEqual(len(self.requests()), 1)
        with self.assertRaises(RuntimeError):
            self.client.run(self.payload())
        self.assertEqual(len(self.children), 1)

    def test_close_error_cannot_skip_waiting_for_child_restoration(self):
        self.partial = True
        self.close_error = True
        with self.assertRaises(BaseException):
            self.client.run(self.payload())
        self.assert_cleaned()
        self.assertTrue(self.client.stop_file.exists())
        self.assertEqual(len(self.requests()), 1)

    def test_release_with_missing_restore_receipt_latches_fault(self):
        self.client.run(self.payload())
        self.behavior('release_missing')
        with self.assertRaises(RuntimeError):
            self.client.release()
        self.assert_cleaned()
        self.assertTrue(self.client.stop_file.exists())
        self.assertIsNotNone(self.client.fault())

    def test_release_with_warm_owner_is_rejected_even_when_passed(self):
        self.client.run(self.payload())
        self.behavior('release_warm')
        with self.assertRaises(RuntimeError):
            self.client.release()
        self.assert_cleaned()
        self.assertTrue(self.client.stop_file.exists())
        self.assertIsNotNone(self.client.fault())

    def test_release_without_explicit_cold_flag_cannot_claim_restored(self):
        self.client.run(self.payload())
        self.behavior('release_missing_warm')
        with self.assertRaises(RuntimeError):
            self.client.release()
        self.assert_cleaned()
        self.assertTrue(self.client.stop_file.exists())
        self.assertIsNotNone(self.client.fault())

    def test_fault_survives_recreation_and_requires_explicit_verified_clear(self):
        self.behavior('failed')
        with self.assertRaises(RuntimeError):
            self.client.run(self.payload())
        replacement = client_module.MotionExecutor(self.root, self.runtime, popen=self.spawn)
        self.assertIsNotNone(replacement.fault())
        with self.assertRaises(RuntimeError):
            replacement.clear_fault()
        with self.assertRaises(RuntimeError):
            replacement.run(self.payload())
        self.assertEqual(len(self.requests()), 1)
        fault = replacement.fault()
        fault['cleanup_verified'] = True
        replacement.fault_path.write_text(json.dumps(fault))
        replacement.clear_fault()
        self.assertIsNone(replacement.fault())
        self.assertTrue(replacement.stop_file.exists(), 'fault clear must not clear emergency STOP')
        replacement.close()


class FakeExecutor:
    def __init__(self, events):
        self.events = events
        self.running = True
        self.failure = None
        self.run_failure = None
        self._fault = None

    def fault(self):
        return self._fault

    def run(self, payload):
        self.events.append(('execute', payload['action']))
        if self.run_failure:
            raise RuntimeError(self.run_failure)
        return dict(passed=True, ready=True, connected=True,
                    positions_mm={'1': 10, '2': 10, '3': 10, '4': 10},
                    parameters_retained=True, session_reused=True)

    def release(self):
        self.events.append(('release',))
        if self.failure:
            raise RuntimeError(self.failure)
        self.running = False
        return dict(passed=True, parameters_restored=True, warm_active=False)

    def clear_fault(self):
        self.events.append(('clear-fault',))
        self._fault = None


class MotionExecutorServiceTests(base.ServiceFixture):
    def setUp(self):
        super().setUp()
        self.events = []
        self.executor = FakeExecutor(self.events)
        self.service.executor = self.executor
        self.service._state.update(ready=True, connected=True)
        self.service.prepare_motion = self.prepare

    def prepare(self, stop):
        self.events.append(('raise',))
        self.assertFalse(stop())
        return dict(command_verified=True, reused_verified_up=True, settle_ms=0)

    def run_action(self, action, callback=None):
        self.runtime.mkdir(exist_ok=True)
        handle = (self.runtime / 'active.lock').open('a')
        payload = dict(action=action, run_id='web_test_' + action)
        if action == 'jog':
            payload['jog'] = base.jog()
        self.service._state.update(busy=True, last_job={'job_id': payload['run_id'], 'action': action})
        self.service._run(payload, handle, callback)
        self.assertTrue(handle.closed)
        return self.service.status()

    def test_every_warm_jog_and_pad_move_still_verifies_up_before_dispatch(self):
        for action in ('jog', 'pads', 'jog', 'pads'):
            state = self.run_action(action)
            self.assertEqual(state['last_job']['state'], 'completed')
            self.assertTrue(state['ready'])
            self.assertFalse(state['busy'])
            self.assertTrue(state['last_job']['probe_raise']['command_verified'])
        self.assertEqual(self.events, [('raise',), ('execute', 'jog'), ('raise',), ('execute', 'pads'),
                                       ('raise',), ('execute', 'jog'), ('raise',), ('execute', 'pads')])
        self.popen.assert_not_called()

    def test_teach_reads_warm_owner_without_raising_or_resending_motion(self):
        callback = mock.Mock()
        state = self.run_action('teach', callback)
        self.assertEqual(self.events, [('execute', 'teach')])
        callback.assert_called_once()
        self.assertTrue(state['ready'])
        self.popen.assert_not_called()

    def test_unverified_up_blocks_executor_and_clears_ready(self):
        self.service.prepare_motion = lambda stop: {'command_verified': False}
        state = self.run_action('pads')
        self.assertEqual(self.events, [])
        self.assertEqual(state['last_job']['state'], 'failed')
        self.assertFalse(state['ready'])
        self.popen.assert_not_called()

    def test_stop_during_raise_blocks_executor(self):
        def raise_then_stop(stop):
            self.service.stop()
            return dict(command_verified=True)
        self.service.prepare_motion = raise_then_stop
        state = self.run_action('jog')
        self.assertEqual(self.events, [])
        self.assertTrue(state['stopped'])
        self.assertEqual(state['last_job']['state'], 'failed')
        self.popen.assert_not_called()

    def test_special_jobs_release_owner_before_lift_and_one_shot_worker(self):
        def once(payload, output, log):
            self.events.append(('once', payload['action']))
            return dict(passed=True, ready=True, connected=True)
        with mock.patch.object(self.service, '_run_once', side_effect=once):
            for action in ('check', 'rebuild', 'circle'):
                self.events.clear()
                self.executor.running = True
                state = self.run_action(action)
                expected = [('release',)] + ([] if action == 'check' else [('raise',)]) + [('once', action)]
                if action == 'check':
                    expected.append(('clear-fault',))
                self.assertEqual(self.events, expected)
                self.assertEqual(state['last_job']['state'], 'completed')

    def test_failed_release_blocks_special_job_before_lift_or_spawn(self):
        self.executor.failure = 'restoration not verified'
        with mock.patch.object(self.service, '_run_once') as once:
            for action in ('check', 'rebuild', 'circle'):
                self.events.clear()
                state = self.run_action(action)
                self.assertEqual(self.events, [('release',)])
                self.assertEqual(state['last_job']['state'], 'failed')
                self.assertFalse(state['ready'])
            once.assert_not_called()
        self.popen.assert_not_called()

    def test_idle_probe_reuses_warm_owner_without_spawn_or_lift(self):
        result = self.service.inspect_idle()
        self.assertTrue(result['ready'])
        self.assertEqual(self.events, [('execute', 'probe')])
        self.assertTrue(self.service.status()['ready'])
        self.assertTrue(self.service._background_done.is_set())
        self.popen.assert_not_called()

    def test_idle_probe_with_latched_fault_never_touches_usb_or_clears_fault(self):
        self.executor._fault = dict(error='fault', cleanup_verified=False)
        result = self.service.inspect_idle()
        self.assertFalse(result['ready'])
        self.assertEqual(self.events, [])
        self.assertIsNotNone(self.executor.fault())
        self.assertFalse(self.service.status()['ready'])
        self.popen.assert_not_called()

    def test_idle_probe_does_not_compete_with_an_active_job(self):
        self.service._state['busy'] = True
        self.assertIsNone(self.service.inspect_idle())
        self.assertEqual(self.events, [])
        self.popen.assert_not_called()

    def test_status_polls_only_cached_session_state_without_ipc(self):
        for _ in range(20):
            status = self.service.status()
            self.assertTrue(status['control_session']['process_active'])
        self.assertEqual(self.events, [])
        self.popen.assert_not_called()

    def test_service_remains_busy_until_executor_cleanup_finishes(self):
        entered, release = threading.Event(), threading.Event()
        original = self.executor.run
        def blocked(payload):
            entered.set()
            release.wait(3)
            raise RuntimeError('execution failed after cleanup')
        self.executor.run = blocked
        self.runtime.mkdir()
        handle = (self.runtime / 'active.lock').open('a')
        self.service._state.update(busy=True, last_job={'job_id':'web_cleanup','action':'jog'})
        thread = threading.Thread(target=self.service._run,
                                  args=(dict(action='jog',run_id='web_cleanup',jog=base.jog()),handle))
        thread.start()
        try:
            self.assertTrue(entered.wait(2))
            self.assertTrue(self.service.status()['busy'])
            self.assertFalse(handle.closed)
            with self.assertRaises(base.service_module.ControlError):
                self.service.start('jog', base.jog())
        finally:
            release.set()
            thread.join(3)
            self.executor.run = original
        self.assertFalse(thread.is_alive())
        self.assertTrue(handle.closed)
        self.assertFalse(self.service.status()['busy'])
        self.assertEqual(self.service.status()['last_job']['state'], 'failed')


@unittest.skipUnless(base.HAS_FLASK, 'Flask unavailable')
class MotionExecutorHandoffRouteTests(base.ServiceFixture):
    def setUp(self):
        super().setUp()
        from flask import Flask
        self.events = []
        self.executor = FakeExecutor(self.events)
        self.service.executor = self.executor
        self.service._state.update(ready=True, connected=True)
        self.app = Flask('offline_executor_handoff')
        self.app.config.update(TESTING=True, SECRET_KEY='fake')
        self.app.extensions['motor_service'] = self.service
        self.servo = types.SimpleNamespace(
            status=lambda: {}, run=self.servo_run, prepare_cycle=self.prepare_cycle,
            _presets={1:{'up_us':960,'down_us':1980},2:{'up_us':960,'down_us':1980}},
            _up_observed=None)
        self.cycle = types.SimpleNamespace(busy=False, validate_payload=self.validate_cycle,
                                           start=self.start_cycle)
        self.app.extensions.update(servo_service=self.servo, servo_cycle_service=self.cycle)
        self.app.register_blueprint(base.load_module('motor_web').motor_bp)
        self.app.register_blueprint(base.load_module('servo_web').servo_bp)
        self.http = self.app.test_client()
        with self.http.session_transaction() as session:
            session.update(user_id='fake-user', motion_enabled=True)
        self.headers = {'X-Requested-With':'XMLHttpRequest'}

    def servo_run(self, payload):
        self.events.append(('servo',payload['action']))
        return dict(available=True)

    def validate_cycle(self, payload):
        self.events.append(('cycle-validate',))
        if payload != {'test':True}:
            raise ValueError('fake invalid cycle')

    def prepare_cycle(self):
        self.events.append(('cycle-prepare',))
        return dict(revision=124,error_code=0,channels=[dict(channel=c,up_us=960,down_us=1980)
                                                       for c in (1,2)])

    def start_cycle(self, owner, payload):
        self.events.append(('cycle-start',))
        return dict(owner=owner)

    def test_readonly_servo_read_keeps_owner_but_every_servo_write_releases_first(self):
        response = self.http.post('/motor/servo/read',json={},headers=self.headers)
        self.assertEqual(response.status_code,200)
        self.assertEqual(self.events,[('servo','read')])
        for action in ('up','down','configure','clear-error','stop'):
            self.events.clear()
            response = self.http.post('/motor/servo/'+action,json={},headers=self.headers)
            self.assertEqual(response.status_code,200, response.get_json())
            self.assertEqual(self.events,[('release',),('servo',action)])

    def test_servo_handoff_failure_blocks_lowering(self):
        self.executor.failure = 'restore failed'
        response = self.http.post('/motor/servo/down',json={},headers=self.headers)
        self.assertEqual(response.status_code,409)
        self.assertEqual(self.events,[('release',)])

    def test_pwm_stop_is_available_even_if_usb_restoration_faulted(self):
        self.executor.failure = 'restore failed'
        response = self.http.post('/motor/servo/stop',json={},headers=self.headers)
        self.assertEqual(response.status_code,200)
        self.assertEqual(self.events,[('release',),('servo','stop')])
        self.assertTrue(self.service.stop_file.exists())

    def test_leaving_online_mode_releases_first_and_failed_release_keeps_mode(self):
        self.executor.failure = 'restore failed'
        response = self.http.post('/motor/mode',json={'enabled':False},headers=self.headers)
        self.assertEqual(response.status_code,409)
        with self.http.session_transaction() as session:
            self.assertTrue(session['motion_enabled'])
        self.executor.failure = None
        response = self.http.post('/motor/mode',json={'enabled':False},headers=self.headers)
        self.assertEqual(response.status_code,200)
        with self.http.session_transaction() as session:
            self.assertFalse(session['motion_enabled'])
        self.assertEqual(self.events,[('release',),('release',)])

    def test_measurement_cycle_releases_before_prepare_or_start(self):
        response = self.http.post('/motor/servo/cycle/start',json={'test':True},headers=self.headers)
        self.assertEqual(response.status_code,202,response.get_json())
        self.assertEqual(self.events,[('cycle-validate',),('release',),('cycle-prepare',),('cycle-start',)])

    def test_failed_cycle_handoff_never_configures_or_lowers_servo(self):
        self.executor.failure='restore failed'
        response = self.http.post('/motor/servo/cycle/start',json={'test':True},headers=self.headers)
        self.assertEqual(response.status_code,409)
        self.assertEqual(self.events,[('cycle-validate',),('release',)])


    def test_diagnosis_handoff_releases_before_station_start_and_failure_blocks_it(self):
        # Execute the actual route body without importing diagnosis AI/PL modules.
        # The route's layout and station are deliberately fake, as is all hardware.
        from flask import current_app, jsonify, request, session
        source = ast.parse((base.INTERFACE / 'diagnostic_web.py').read_text())
        function = next(node for node in source.body if isinstance(node, ast.FunctionDef) and node.name == 'start')
        function.decorator_list = []
        module = ast.fix_missing_locations(ast.Module(body=[function], type_ignores=[]))
        station = types.SimpleNamespace(
            lock=threading.RLock(),
            owned=lambda owner, key: {'job':{'import_provenance':{'layout_id':'board'}}},
            start=lambda *args: self.events.append(('diagnosis-start',)))
        namespace = dict(current_app=current_app,jsonify=jsonify,request=request,session=session,
                         station=lambda:station,layout=lambda **kwargs:(None,{'layout_id':'board'},None))
        exec(compile(module,str(base.INTERFACE / 'diagnostic_web.py'),'exec'),namespace)
        with self.app.test_request_context('/diagnosis/fake/start',method='POST',json={}):
            session['user_id']='fake-user'
            response, status = namespace['start']('fake')
            self.assertEqual(status,202)
            self.assertEqual(self.events,[('release',),('diagnosis-start',)])
            self.events.clear()
            self.executor.failure='restore failed'
            with self.assertRaises(base.service_module.ControlError):
                namespace['start']('fake')
            self.assertEqual(self.events,[('release',)])


if __name__ == '__main__':
    unittest.main()
