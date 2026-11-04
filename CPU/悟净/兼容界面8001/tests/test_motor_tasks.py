import json
from pathlib import Path
import sys
import tempfile
import types
import unittest
from unittest import mock

import test_motor_control as base

worker = base.worker


class MotionTaskTests(unittest.TestCase):
    def setUp(self):
        self.directory = tempfile.TemporaryDirectory()
        self.addCleanup(self.directory.cleanup)
        self.controller = base.FakeController(self.directory.name)
        self.calls = []
        self.sessions = []
        fixture = self

        class Profile:
            def __init__(self, run_id, **kwargs):
                fixture.calls.append(('create',kwargs))
                self.report = dict(passed=False,positions_mm={str(a):2 for a in range(1,5)})
                self.announce = lambda label: None
                fixture.sessions.append(self)
            def run_home_only(self):
                fixture.calls.append(('home',))
                self.report['motion_completed'] = True
            def run(self):
                fixture.calls.append(('circle',))
                self.report['motion_completed'] = True
            def close(self):
                fixture.calls.append(('close',))
                self.report['passed'] = 'error' not in self.report

        self.profile = Profile
        patch = mock.patch.dict(sys.modules, {'fast_rebuild':types.SimpleNamespace(FastRebuild=Profile)})
        patch.start()
        self.addCleanup(patch.stop)

    def test_rebuild_only_homes_at_25rpm(self):
        result = worker.run_motion_task(self.controller,'rebuild','web_testhome')
        self.assertTrue(result['passed'])
        self.assertEqual(self.calls,[('create',dict(home_rpm=25,speed_boost=100,circle_only=False)),('home',),('close',)])

    def test_circle_uses_existing_reference_and_never_calls_home(self):
        result = worker.run_motion_task(self.controller,'circle','web_testcircle')
        self.assertTrue(result['passed'])
        self.assertEqual(self.calls,[('create',dict(home_rpm=25,speed_boost=100,circle_only=True)),('circle',),('close',)])

    def test_stop_prevents_profile_creation(self):
        self.controller.core.STOP_FILE.write_text('stop')
        with self.assertRaisesRegex(RuntimeError,'停车'):
            worker.run_motion_task(self.controller,'rebuild','web_teststop')
        self.assertEqual(self.calls,[])

    def test_failed_profile_still_closes_and_reports_failure(self):
        def fail(session):
            raise RuntimeError('fake lost ACK')
        with mock.patch.object(self.profile,'run',fail):
            with self.assertRaisesRegex(RuntimeError,'lost ACK'):
                worker.run_motion_task(self.controller,'circle','web_testfail')
        self.assertEqual(self.calls[-1],('close',))

    def test_failed_cleanup_never_publishes_success(self):
        def fail(session):
            raise RuntimeError('fake restore failure')
        with mock.patch.object(self.profile,'close',fail):
            with self.assertRaisesRegex(RuntimeError,'restore failure'):
                worker.run_motion_task(self.controller,'circle','web_testfail')

    def test_progress_file_failure_does_not_prevent_cleanup(self):
        with mock.patch.object(worker,'PROGRESS_PATH',Path(self.directory.name)/'missing'/'progress.json'):
            result = worker.run_motion_task(self.controller,'rebuild','web_testprogress')
        self.assertTrue(result['passed'])
        self.assertEqual(self.calls[-1],('close',))

    def test_full_disk_and_failed_diagnostic_still_close(self):
        with mock.patch.object(worker,'PROGRESS_PATH',Path(self.directory.name)/'missing'/'progress.json'), \
                mock.patch.object(worker.sys,'stderr',types.SimpleNamespace(write=mock.Mock(side_effect=OSError('disk full')))):
            result=worker.run_motion_task(self.controller,'rebuild','web_testdiskfull')
        self.assertTrue(result['passed'])
        self.assertEqual(self.calls.count(('close',)),1)

    def test_unexpected_progress_failure_cannot_skip_restoration(self):
        def display(phase,message):
            if phase=='restoring':
                raise RuntimeError('display failure')
        with mock.patch.object(worker,'progress',side_effect=display):
            with self.assertRaisesRegex(RuntimeError,'display failure'):
                worker.run_motion_task(self.controller,'rebuild','web_testdisplay')
        self.assertEqual(self.calls.count(('close',)),1)

    def test_jog_initializes_only_selected_address_and_returns_address(self):
        result=worker.jog_machine(self.controller,base.jog(probe='right',direction='left'), 'web_jogright')
        self.assertEqual(self.controller.sessions[0].active_axes,(2,))
        self.assertEqual(result['jog']['address'],2)
        self.assertIn('timing',result)

    def test_circle_prepares_start_from_valid_nonparked_positions_without_homing(self):
        result=worker.run_motion_task(self.controller,'circle','web_circlepark')
        self.assertTrue(result['passed'])
        self.assertEqual(self.controller.positions,{str(a):2 for a in range(1,5)})
        self.assertEqual([call[0] for call in self.calls],['create','circle','close'])

    def test_invalid_reference_never_moves_or_constructs_circle(self):
        self.controller.reference_valid=False
        with self.assertRaisesRegex(RuntimeError,'参考无效'):
            worker.run_motion_task(self.controller,'circle','web_invalidcircle')
        self.assertEqual(self.controller.moves,[])
        self.assertEqual(self.calls,[])

    def test_failed_return_to_start_prevents_circle(self):
        self.controller.move_hook=lambda session: (_ for _ in ()).throw(RuntimeError('park failure'))
        with self.assertRaisesRegex(RuntimeError,'park failure'):
            worker.run_motion_task(self.controller,'circle','web_invalidpark')
        self.assertEqual(self.calls,[])
        self.assertEqual(self.controller.sessions[0].closed,1)

    def test_stop_during_park_read_prevents_position_packet(self):
        self.controller.move_hook=lambda session: self.controller.core.STOP_FILE.write_text('stop before CD')
        with self.assertRaisesRegex(RuntimeError,'stop requested'):
            worker.run_motion_task(self.controller,'circle','web_stopduringpark')
        self.assertEqual(self.calls,[])
        session=self.controller.sessions[0]
        self.assertEqual(session.motor.ser.emitted,[])
        self.assertEqual(session.closed,1)


class TaskServiceTests(base.ServiceFixture):
    def setUp(self):
        super().setUp()
        (self.root/'zdt/wujing_usb_probe/fast_rebuild.py').write_text('# offline fake\n')

    def test_rebuild_is_available_before_old_reference_check(self):
        self.hold_jobs()
        job=self.service.start('rebuild')
        self.assertTrue(job.startswith('web_'))
        self.assertEqual(self.service.status()['last_job']['action'],'rebuild')

    def test_circle_requires_ready(self):
        with self.assertRaises(base.service_module.ControlError):
            self.service.start('circle')
        self.hold_jobs()
        self.service._state['ready']=True
        self.service.start('circle')
        self.assertTrue(self.service.status()['busy'])

    def test_stop_blocks_both_new_motion_actions(self):
        self.service.stop()
        self.service._state['ready']=True
        for action in ('rebuild','circle'):
            with self.assertRaises(base.service_module.ControlError):
                self.service.start(action)
        self.assertTrue(self.service.stop_file.exists())

    def test_missing_profile_rejects_without_worker(self):
        (self.root/'zdt/wujing_usb_probe/fast_rebuild.py').unlink()
        with self.assertRaises(base.service_module.ControlError) as result:
            self.service.start('rebuild')
        self.assertEqual(result.exception.status,503)
        self.popen.assert_not_called()

    def test_progress_poll_reads_only_matching_job_file(self):
        self.runtime.mkdir()
        self.service._state.update(busy=True,last_job=dict(job_id='web_test',action='rebuild'))
        path=self.runtime/'web_test.progress.json'
        path.write_text(json.dumps(dict(job_id='web_test',phase='homing',message='正在找边')))
        self.assertEqual(self.service.status()['last_job']['phase'],'homing')
        path.write_text(json.dumps(dict(job_id='web_other',phase='wrong',message='错误任务')))
        self.assertNotEqual(self.service.status()['message'],'错误任务')
        self.popen.assert_not_called()

    def test_rebuild_worker_timeout_covers_full_bounded_homing(self):
        self.runtime.mkdir()
        handle=(self.runtime/'active.lock').open('a')
        self.handles.append(handle)
        self.service._state.update(busy=True)
        process=mock.Mock(returncode=0)
        payload=dict(action='rebuild',run_id='web_testtimeout')
        def communicate(data,timeout):
            self.assertGreaterEqual(timeout,250)
            (self.runtime/'web_testtimeout.json').write_text(json.dumps(dict(passed=True,positions_mm={})))
            return b'',b''
        process.communicate.side_effect=communicate
        self.service._popen=mock.Mock(return_value=process)
        self.service._run(payload,handle)
        self.assertTrue(handle.closed)
        self.assertEqual(self.service.status()['last_job']['state'],'completed')

    def test_circle_timeout_allows_bounded_return_from_far_positions(self):
        self.runtime.mkdir()
        handle=(self.runtime/'active.lock').open('a')
        self.handles.append(handle)
        process=mock.Mock(returncode=0)
        def communicate(data,timeout):
            self.assertGreaterEqual(timeout,250)
            (self.runtime/'web_circlefar.json').write_text(json.dumps(dict(passed=True,positions_mm={})))
            return b'',b''
        process.communicate.side_effect=communicate
        self.service._popen=mock.Mock(return_value=process)
        self.service._run(dict(action='circle',run_id='web_circlefar'),handle)
        self.assertTrue(handle.closed)
        self.assertEqual(self.service.status()['last_job']['state'],'completed')


@unittest.skipUnless(base.HAS_FLASK,'Run Flask routes in board venv')
class TaskRouteTests(TaskServiceTests):
    def setUp(self):
        super().setUp()
        from flask import Flask
        web=base.load_module('motor_web')
        self.app=Flask('offline_task_routes')
        self.app.config.update(TESTING=True,SECRET_KEY='offline-tasks')
        self.app.extensions['motor_service']=self.service
        self.app.register_blueprint(web.motor_bp)
        self.client=self.app.test_client()
        with self.client.session_transaction() as session:session["motion_enabled"]=True
        self.headers={'X-Requested-With':'XMLHttpRequest','Origin':'http://localhost'}

    def test_routes_dispatch_only_fixed_tasks(self):
        self.hold_jobs()
        response=self.client.post('/motor/rebuild',json={},headers=self.headers)
        self.assertEqual(response.status_code,202)
        self.assertEqual(self.client.post('/motor/circle',json={},headers=self.headers).status_code,409)

    def test_new_routes_reject_arbitrary_parameters_and_bad_origin(self):
        for route in ('rebuild','circle'):
            self.assertEqual(self.client.post('/motor/'+route,json={'home_rpm':100},headers=self.headers).status_code,400)
            self.assertEqual(self.client.post('/motor/'+route,json={}).status_code,403)
            self.assertEqual(self.client.post('/motor/'+route,json={},headers=dict(self.headers,Origin='http://foreign.invalid')).status_code,403)
        self.popen.assert_not_called()


if __name__=='__main__':
    unittest.main()
