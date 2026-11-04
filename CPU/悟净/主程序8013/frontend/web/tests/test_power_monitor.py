"""使用模拟子进程验证电源轮询与运动任务的隔离。"""
import json
from pathlib import Path
import subprocess
import tempfile
import unittest
from unittest.mock import Mock
import test_motor_control as base

module=base.service_module

class PowerMonitorTests(unittest.TestCase):
    def setUp(self):
        self.tmp=tempfile.TemporaryDirectory();self.addCleanup(self.tmp.cleanup);self.path=Path(self.tmp.name)
        root=self.path/'controller';(root/'zdt/wujing_usb_probe').mkdir(parents=True)
        (root/'zdt/wujing_usb_probe/motorctl.py').touch();(root/'zdt/machine_coordinates').mkdir()
        self.prepare=Mock(side_effect=AssertionError('read-only polling cannot raise probes'))
        self.popen=Mock();self.service=module.MotorService(root,self.path/'jobs',popen=self.popen,prepare_motion=self.prepare)
    def process(self,result,hook=None):
        def launch(command,**kwargs):
            output=Path(command[command.index('--result')+1]);p=Mock(returncode=0)
            def communicate(payload,**options):
                self.assertEqual(json.loads(payload)['action'],'probe')
                self.assertNotIn('--progress',command)
                if hook:hook()
                output.write_text(json.dumps(result))
            p.communicate.side_effect=communicate;return p
        self.popen.side_effect=launch
    def test_health_reads_restore_cache_without_changing_foreground_job(self):
        last={'job_id':'old','state':'completed'};self.service._state['last_job']=last
        self.process(dict(passed=True,connected=True,ready=True,reference_valid=True,positions_mm={'1':2}))
        self.assertTrue(self.service.inspect_idle()['ready'])
        state=self.service.status();self.assertTrue(state['ready']);self.assertEqual(state['last_job'],last)
        self.assertEqual(list(self.service.runtime.glob('web_*.json')),[])
        self.prepare.assert_not_called();self.assertFalse(self.service.stop_file.exists())
    def test_status_and_busy_or_foreign_job_do_not_launch_probe(self):
        self.service.status();self.service._state['busy']=True;self.assertIsNone(self.service.inspect_idle())
        self.service._state['busy']=False;self.service.runtime.mkdir()
        with (self.service.runtime/'active.lock').open('a') as held:
            module.fcntl.flock(held,module.fcntl.LOCK_EX|module.fcntl.LOCK_NB)
            self.assertIsNone(self.service.inspect_idle())
        self.popen.assert_not_called();self.prepare.assert_not_called()
    def test_usb_busy_is_not_reported_as_power_loss(self):
        self.process(dict(passed=False,error='电机USB接口正被其他程序占用。'))
        self.assertIsNone(self.service.inspect_idle())
    def test_stop_during_read_is_not_cleared_by_successful_probe(self):
        self.process(dict(connected=True,ready=True),self.service.stop)
        self.service.inspect_idle();self.assertTrue(self.service.stop_file.exists());self.assertFalse(self.service.status()['ready'])
    def test_probe_timeout_terminates_only_probe_and_releases_job_lock(self):
        process=Mock(returncode=-15);process.communicate.side_effect=[subprocess.TimeoutExpired('probe',5),None]
        self.popen.return_value=process
        self.assertFalse(self.service.inspect_idle()['connected']);process.terminate.assert_called_once();process.kill.assert_not_called()
        self.assertTrue(self.service._background_done.is_set());self.assertFalse(self.service.stop_file.exists())
        with (self.service.runtime/'active.lock').open('a') as handle:
            module.fcntl.flock(handle,module.fcntl.LOCK_EX|module.fcntl.LOCK_NB)

if __name__=='__main__':unittest.main()
