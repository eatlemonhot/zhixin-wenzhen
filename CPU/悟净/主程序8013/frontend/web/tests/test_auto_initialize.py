"""Automatic boot/power cycles use a fake service, clock and PWM backend."""
import json
from pathlib import Path
import tempfile
import unittest
from unittest.mock import Mock
import test_motor_control as base

module=base.load_module('auto_initialize')
class Motor:
    def __init__(self,path):
        self.runtime=path/'jobs';self.runtime.mkdir();self.stop_file=path/'stop.request'
        self.value=dict(busy=False,ready=False,connected=False,stopped=False,last_job=None)
        self.inspect_idle=Mock(return_value=dict(connected=True,reference_valid=True))
        self.starts=[]
    def status(self):return dict(self.value,stopped=self.stop_file.exists())
    def start(self,action):
        identifier='web_auto'+str(len(self.starts));self.starts.append(action)
        self.value.update(busy=True,last_job=dict(job_id=identifier,action=action,state='running'))
        return identifier
    def finish(self,passed=True):
        job=self.value['last_job'];job['state']='completed' if passed else 'failed';job['error']='test failure'
        self.value.update(busy=False,ready=passed)
        (self.runtime/(job['job_id']+'.json')).write_text(json.dumps(dict(passed=passed,ready=passed)))

class InitializerTests(unittest.TestCase):
    def setUp(self):
        self.tmp=tempfile.TemporaryDirectory();self.addCleanup(self.tmp.cleanup);self.path=Path(self.tmp.name)
        self.motor=Motor(self.path);self.servo=Mock();self.servo.run.return_value={}
        self.init=module.AutoInitializer(self.motor,self.servo,self.path/'init','bootA')
    def test_power_ready_without_browser_lifts_via_rebuild_once(self):
        self.init.tick();self.assertEqual(self.motor.starts,['rebuild']);self.assertEqual(self.init.value['phase'],'running')
        self.motor.finish();self.init.tick();self.init.tick()
        self.assertEqual(self.motor.starts,['rebuild']);self.assertEqual(self.init.value['phase'],'ready')
    def test_late_motor_or_sdk_does_not_start_until_both_ready(self):
        self.motor.inspect_idle.return_value=dict(connected=False)
        self.init.tick();self.init.tick();self.assertEqual(self.motor.starts,[])
        self.motor.inspect_idle.return_value=dict(connected=True,reference_valid=False)
        self.servo.run.side_effect=RuntimeError('SDK not ready');self.init.tick();self.assertEqual(self.motor.starts,[])
        self.servo.run.side_effect=None;self.init.tick();self.assertEqual(self.motor.starts,['rebuild'])
    def test_worker_reload_same_boot_restores_without_contact_homing(self):
        self.init.tick();self.motor.finish();self.init.tick()
        fresh=module.AutoInitializer(self.motor,self.servo,self.path/'init','bootA');fresh.tick()
        self.assertEqual(self.motor.starts,['rebuild'])
    def test_new_os_boot_runs_initialization_even_if_disk_coordinates_valid(self):
        self.init.tick();self.motor.finish();self.init.tick()
        fresh=module.AutoInitializer(self.motor,self.servo,self.path/'init','bootB');self.motor.value['last_job']=None
        fresh.tick();self.assertEqual(self.motor.starts,['rebuild','rebuild'])
    def test_power_marker_invalid_reference_reinitializes_once(self):
        self.init.tick();self.motor.finish();self.init.tick()
        self.motor.inspect_idle.return_value=dict(connected=True,reference_valid=False)
        self.init.tick();self.init.tick();self.assertEqual(self.motor.starts,['rebuild','rebuild'])
        self.motor.finish();self.motor.inspect_idle.return_value=dict(connected=True,reference_valid=True)
        self.init.tick();self.init.tick();self.assertEqual(len(self.motor.starts),2)
    def test_transient_read_failure_does_not_rehome(self):
        self.init.tick();self.motor.finish();self.init.tick()
        self.motor.inspect_idle.return_value=dict(connected=False);self.init.tick()
        self.motor.inspect_idle.return_value=dict(connected=True,reference_valid=True);self.init.tick()
        self.assertEqual(len(self.motor.starts),1)
    def test_transport_reconnect_with_intact_reference_does_not_rehome(self):
        self.init.tick();self.motor.finish();self.init.tick()
        self.motor.inspect_idle.return_value=dict(connected=False)
        for _ in range(4):self.init.tick()
        self.motor.inspect_idle.return_value=dict(connected=True,reference_valid=True);self.init.tick()
        self.assertEqual(len(self.motor.starts),1)

    def test_failure_latches_without_automatic_retry(self):
        self.init.tick();self.motor.finish(False)
        for _ in range(5):self.init.tick()
        self.assertEqual(self.motor.starts,['rebuild']);self.assertEqual(self.init.value['phase'],'fault')
    def test_stop_and_measurement_ownership_prevent_any_start(self):
        self.motor.stop_file.write_text('user stop');self.init.tick()
        self.assertEqual(self.motor.starts,[]);self.servo.run.assert_not_called()
        self.motor.stop_file.unlink();self.init.idle=lambda:False;self.init.tick();self.assertEqual(self.motor.starts,[])
    def test_existing_busy_or_unknown_usb_owner_does_not_count_as_power_loss(self):
        self.motor.value['busy']=True;self.init.tick();self.motor.inspect_idle.assert_not_called()
        self.motor.value['busy']=False;self.motor.inspect_idle.return_value=None;self.init.tick()
        self.assertEqual(self.init.losses,0);self.assertEqual(self.motor.starts,[])

if __name__=='__main__':unittest.main()
