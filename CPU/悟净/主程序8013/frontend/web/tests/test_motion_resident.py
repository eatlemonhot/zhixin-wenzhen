import copy
import io
import json
import os
from pathlib import Path
import sys
import tempfile
import types
import unittest
from unittest import mock

import test_motor_control as base

resident = base.load_module('motion_resident')
worker = resident.worker


class Clock:
    def __init__(self): self.value = 10.0
    def __call__(self): return self.value
    def advance(self, seconds): self.value += seconds


class Session(base.FakeSession):
    def __init__(self, controller, label):
        super().__init__(controller, label)
        self.active = None
        self.modes = {a: 0 for a in range(1, 5)}
        self.started = set()
        self.original = {}
        self.current_caps = {}
        self.motor.mode = 0
        self.motor.config = self.config
        self.report['timing'] = {}

    def config(self):
        data = bytearray(37)
        data[24] = self.controller.cold_checksum_mode
        data[16:18] = self.controller.cold_current.to_bytes(2, 'big')
        return bytes(data)

    def select(self, address):
        self.motor.address = address
        self.motor.mode = self.modes[address]
        return self.motor

    def initialize(self):
        self.controller.initialize_count += 1
        super().initialize()
        self.started = {1, 2, 3, 4}
        self.modes = {a: 2 for a in range(1, 5)}
        self.original = {a: {'current': 3000, 'heartbeat': 0} for a in range(1, 5)}
        self.current_caps = {a: 1000 for a in range(1, 5)}
        self.report['original'] = copy.deepcopy(self.original)
        print('{"ready": true, "crc": true}')


class Controller(base.FakeController):
    def __init__(self, path):
        super().__init__(path)
        self.initialize_count = 0
        self.cold_checksum_mode = 0
        self.cold_current = 3000
        self.coordinates['mm_per_rev'] = 40.0
        for address in range(1, 5):
            self.coordinates['axes'][str(address)]['origin'] = {'origin_encoder_deg': address * 10.0}

    def Session(self, label, active_axes=None):
        if self.open_error: raise RuntimeError(self.open_error)
        session = Session(self, label)
        session.active_axes = active_axes
        self.sessions.append(session)
        return session


class LeaseTests(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        self.addCleanup(self.tmp.cleanup)
        self.path = Path(self.tmp.name)
        self.controller = Controller(self.path)
        self.clock = Clock()
        self.owner = True
        self.executor = resident.ResidentExecutor(self.controller, self.path/'runtime', 1234,
                            clock=self.clock, owner_alive=lambda: self.owner)
        self.addCleanup(lambda: self.executor.close('test_cleanup') if not self.executor.closed else None)
        self.counter = 0
        self.stdout = mock.patch('sys.stdout', new_callable=io.StringIO)
        self.stdout.start()
        self.addCleanup(self.stdout.stop)

    def call(self, action='jog', **details):
        self.counter += 1
        payload = dict(action=action, run_id='web_test%s' % self.counter, timeout_s=90)
        if action == 'jog': payload['jog'] = base.jog(step_mm=.1)
        payload.update(details)
        return self.executor.handle(dict(request_id='request_%s' % self.counter, payload=payload))

    def pad_context(self, targets):
        geometry, alignment = worker.pcb_modules()
        positions = dict(self.controller.positions, **targets)
        points = {'left': {'x': 5, 'y': 7}}
        offsets = {p: {'x': 0, 'y': 0} for p in ('left','right')}
        anchor = geometry.teach_anchor('left', points['left'], positions, offsets)
        anchor.update(reference_id=alignment.reference_id(self.controller.coordinates),
                      pcb_frame_version=geometry.PCB_FRAME_VERSION)
        return dict(points=points, profile=dict(anchors={'left': anchor}, offsets=offsets))

    def teach_context(self):
        return dict(probe='left', point={'x': 5, 'y': 7}, pad_id='C7.1',
                    offsets={p:{'x':0,'y':0} for p in ('left','right')})

    def test_two_jogs_really_reuse_one_initialized_session(self):
        first, second = self.call(), self.call()
        self.assertTrue(first['result']['passed'])
        self.assertFalse(first['result']['session_reused'])
        self.assertTrue(second['result']['session_reused'])
        self.assertEqual(len(self.controller.sessions), 1)
        session = self.controller.sessions[0]
        self.assertEqual(session.active_axes, (1,2,3,4))
        self.assertEqual(session.closed, 0)
        self.assertEqual(self.controller.initialize_count, 1)
        self.assertEqual(len(self.controller.moves), 2)
        self.assertTrue(all(item[0] is session for item in self.controller.moves))
        self.assertEqual(session.started, {1,2,3,4})
        self.assertEqual(session.original[1]['current'], 3000)
        self.assertEqual(self.controller.positions['1'], 10.2)

    def test_each_job_has_independent_audit_and_no_nested_validator(self):
        original = None
        for _ in range(3):
            response = self.call()
            session = self.controller.sessions[0]
            current = session.motor.ser.packet_validator
            original = original or current
            self.assertEqual(current, original)
            value = json.loads(Path(response['result']['summary_file']).read_text())
            self.assertEqual(value['run_id'], 'web_test%s' % self.counter)
            self.assertTrue(value['passed'])
            self.assertTrue(value['parameters_retained'])
        self.assertEqual(len(list((self.path/'runtime').glob('web_test*.resident.json'))), 3)

    def test_pads_and_jog_share_real_session_and_four_axis_checks(self):
        self.call()
        result = self.call('pads', context=self.pad_context({'1':15., '3':35.}))
        self.assertTrue(result['result']['passed'])
        self.assertTrue(result['result']['session_reused'])
        self.assertEqual(len(self.controller.sessions), 1)
        self.assertEqual(result['result']['positions_mm']['3'],35.)
        self.assertTrue(all(s is self.controller.sessions[0] for s in self.controller.read_sessions))

    def test_probe_and_teach_are_read_only_and_preserve_warm_session(self):
        self.call()
        count = len(self.controller.moves)
        before_original = copy.deepcopy(self.controller.sessions[0].original)
        probe = self.call('probe')
        teach = self.call('teach', context=self.teach_context())
        for response in (probe, teach):
            self.assertTrue(response['warm_active'])
            self.assertTrue(response['result']['reference_valid'])
            self.assertEqual(response['result']['motion_commands_sent'], 0)
            self.assertEqual(response['result']['motor_parameter_writes'], 0)
        self.assertEqual(len(self.controller.moves), count)
        self.assertEqual(len(self.controller.sessions), 1)
        self.assertEqual(self.controller.sessions[0].original, before_original)
        self.assertEqual(teach['result']['anchor']['pad_id'],'C7.1')
        self.assertEqual(teach['result']['anchor']['y'],37.)

    def test_cold_teach_keeps_original_readonly_path_without_usb_session(self):
        response = self.call('teach', context=self.teach_context())
        self.assertTrue(response['result']['passed'])
        self.assertFalse(response['warm_active'])
        self.assertEqual(self.controller.sessions, [])
        self.assertEqual(self.controller.moves, [])

    def test_cold_probe_uses_original_readonly_function(self):
        read = dict(passed=True, connected=True, ready=True, reference_valid=True,
                    positions_mm=dict(self.controller.positions), motion_commands_sent=0)
        with mock.patch.object(worker, 'probe_machine', return_value=read) as probe:
            response=self.call('probe')
        self.assertFalse(response['warm_active'])
        probe.assert_called_once()
        self.assertEqual(self.controller.sessions, [])

    def test_power_loss_after_ttl_keeps_readonly_reconnect_path_without_stop(self):
        self.call()
        self.clock.advance(30)
        self.executor.idle_tick()
        with mock.patch.object(worker, 'probe_machine', side_effect=TimeoutError('power off')):
            response = self.call('probe')
        self.assertFalse(response['result']['connected'])
        self.assertTrue(response['result']['read_only_failure'])
        self.assertFalse(response['warm_active'])
        self.assertFalse(self.executor.stop_file.exists())
        self.assertFalse(self.executor.fault_path.exists())
        self.assertFalse(self.executor.closed)

    def test_ttl_restores_usb_but_keeps_light_process_available(self):
        self.call()
        first = self.controller.sessions[0]
        self.clock.advance(30)
        self.assertTrue(self.executor.idle_tick())
        self.assertFalse(self.executor.warm_active)
        self.assertFalse(self.executor.closed)
        self.assertEqual(first.closed, 1)
        audit = json.loads(self.executor.lease_path.read_text())
        self.assertEqual(audit['phase'],'cold')
        self.assertTrue(audit['parameters_restored'])
        result = self.call()
        self.assertTrue(result['result']['passed'])
        self.assertFalse(result['result']['session_reused'])
        self.assertEqual(len(self.controller.sessions),2)

    def test_probe_does_not_extend_motion_ttl_or_idle_drift_origin(self):
        self.call()
        start = self.executor.last_business
        origin = dict(self.executor.idle_origin)
        self.clock.advance(20)
        self.controller.positions['1'] += .1
        self.call('probe')
        self.assertEqual(self.executor.last_business,start)
        self.assertEqual(self.executor.idle_origin,origin)
        self.clock.advance(10)
        self.assertTrue(self.executor.idle_tick())
        self.assertFalse(self.executor.warm_active)
        self.assertEqual(self.controller.sessions[0].closed,1)

    def test_release_waits_for_real_cleanup_and_reports_verified(self):
        self.call()
        result=self.call('release')
        self.assertTrue(result['result']['passed'])
        self.assertTrue(result['result']['parameters_restored'])
        self.assertTrue(result['result']['cleanup_verified'])
        self.assertFalse(result['warm_active'])
        self.assertEqual(self.controller.sessions[0].closed,1)
        self.assertTrue(self.executor.closed)

    def test_release_before_any_motion_is_safe_no_hardware(self):
        result=self.call('release')
        self.assertTrue(result['result']['passed'])
        self.assertTrue(result['result']['parameters_restored'])
        self.assertEqual(self.controller.sessions,[])

    def test_owner_death_while_idle_stops_restores_and_faults(self):
        self.call()
        self.owner=False
        self.assertFalse(self.executor.idle_tick())
        self.assertTrue(self.executor.stop_file.exists())
        self.assertTrue(self.executor.fault_path.exists())
        self.assertEqual(self.controller.sessions[0].closed,1)
        self.assertTrue(json.loads(self.executor.fault_path.read_text())['cleanup_verified'])

    def test_owner_death_during_motion_guard_blocks_packet_and_does_not_retry(self):
        self.controller.move_hook=lambda session:setattr(self,'owner',False)
        result=self.call()
        self.assertFalse(result['result']['passed'])
        self.assertEqual(len(self.controller.moves),1)
        self.assertEqual(self.controller.sessions[0].motor.ser.emitted,[])
        self.assertEqual(self.controller.sessions[0].closed,1)
        self.assertTrue(self.executor.closed)

    def test_stop_idle_preserves_existing_stop_reason(self):
        self.call()
        self.executor.stop_file.write_text('User STOP')
        self.assertFalse(self.executor.idle_tick())
        self.assertEqual(self.executor.stop_file.read_text(),'User STOP')
        self.assertEqual(self.controller.sessions[0].closed,1)

    def test_deadline_is_checked_inside_motion_packet_guard(self):
        self.controller.move_hook=lambda session:self.clock.advance(91)
        result=self.call()
        self.assertFalse(result['result']['passed'])
        self.assertIn('deadline',result['result']['error'])
        self.assertEqual(self.controller.sessions[0].motor.ser.emitted,[])
        self.assertTrue(self.executor.stop_file.exists())

    def test_idle_drift_or_external_motion_faults(self):
        for kind in ('position','speed'):
            with self.subTest(kind=kind):
                if self.executor.closed:
                    self.executor.stop_file.unlink()
                    self.executor.fault_path.unlink()
                    self.executor=resident.ResidentExecutor(self.controller,self.path/'runtime',1234,
                                      clock=self.clock,owner_alive=lambda:self.owner)
                    self.controller.speed=0
                self.call()
                if kind=='position': self.controller.positions['3']+=.2
                else:self.controller.speed=1
                self.clock.advance(.11)
                self.assertFalse(self.executor.idle_tick())
                self.assertTrue(self.executor.fault_path.exists())

    def test_four_axis_reference_failure_during_idle_is_not_cached_away(self):
        self.call()
        self.controller.reference_valid=False
        self.clock.advance(.11)
        self.assertFalse(self.executor.idle_tick())
        self.assertEqual(len(self.controller.moves),1)
        self.assertTrue(self.executor.stop_file.exists())

    def test_reference_file_change_blocks_next_move_before_packet(self):
        self.call()
        self.controller.coordinates['axes']['1']['origin']['origin_encoder_deg']+=.1
        result=self.call()
        self.assertFalse(result['result']['passed'])
        self.assertEqual(len(self.controller.moves),1)
        self.assertIn('reference changed',result['result']['error'])

    def test_cleanup_failure_is_faulted_before_failure_response(self):
        self.call()
        self.controller.cleanup_errors=['Motor 3 original config not restored']
        result=self.call('release')
        self.assertFalse(result['result']['passed'])
        self.assertFalse(result['result']['cleanup_verified'])
        self.assertEqual(self.controller.sessions[0].closed,1)
        self.assertFalse(json.loads(self.executor.fault_path.read_text())['cleanup_verified'])
        self.assertTrue(self.executor.stop_file.exists())

    def test_action_failure_plus_cleanup_failure_preserves_both_causes(self):
        self.controller.move_hook=lambda session:(_ for _ in ()).throw(RuntimeError('uncertain CD'))
        self.controller.cleanup_errors=['Heartbeat not restored']
        result=self.call()
        self.assertFalse(result['result']['passed'])
        fault=json.loads(self.executor.fault_path.read_text())
        self.assertIn('uncertain CD',fault['error'])
        self.assertFalse(fault['cleanup_verified'])
        self.assertIn('Heartbeat not restored',fault['cleanup_errors'])
        self.assertEqual(len(self.controller.moves),1)

    def test_existing_fault_is_preserved_and_never_claims_new_cleanup_verified(self):
        previous=dict(error='Unresolved crash',cleanup_verified=False)
        resident.atomic_json(self.executor.fault_path,previous)
        result=self.call()
        self.assertFalse(result['result']['passed'])
        self.assertEqual(json.loads(self.executor.fault_path.read_text()),previous)
        self.assertEqual(self.controller.sessions,[])

    def test_unrestored_crc_is_rejected_before_initialize_or_motion(self):
        self.controller.cold_checksum_mode=2
        result=self.call()
        self.assertFalse(result['result']['passed'])
        self.assertIn('checksum mode',result['result']['error'])
        self.assertEqual(self.controller.initialize_count,0)
        self.assertEqual(self.controller.moves,[])
        self.assertEqual(self.controller.sessions[0].closed,1)
        self.assertFalse(json.loads(self.executor.fault_path.read_text())['cleanup_verified'])

    def test_unrestored_current_cannot_become_a_new_baseline(self):
        self.controller.cold_current = 1000
        result = self.call()
        self.assertFalse(result['result']['passed'])
        self.assertFalse(result['result']['cleanup_verified'])
        self.assertEqual(self.controller.initialize_count, 0)
        self.assertEqual(self.controller.moves, [])
        self.assertEqual(self.controller.sessions[0].closed, 1)

    def test_release_with_existing_stop_restores_without_overwriting_stop(self):
        self.call()
        self.executor.stop_file.write_text('User STOP')
        result = self.call('release')
        self.assertTrue(result['result']['passed'])
        self.assertTrue(result['result']['parameters_restored'])
        self.assertEqual(self.executor.stop_file.read_text(), 'User STOP')
        self.assertEqual(self.controller.sessions[0].closed, 1)

    def test_cold_process_owner_exit_does_not_create_stop_or_fault(self):
        self.owner = False
        self.assertFalse(self.executor.idle_tick())
        self.assertFalse(self.executor.stop_file.exists())
        self.assertFalse(self.executor.fault_path.exists())

    def test_disk_error_during_fault_still_runs_real_cleanup(self):
        self.call()
        self.controller.move_hook=lambda session:(_ for _ in ()).throw(RuntimeError('uncertain CD'))
        with mock.patch.object(resident, 'atomic_json', side_effect=OSError('disk full')):
            result = self.call()
        self.assertFalse(result['result']['passed'])
        self.assertEqual(self.controller.sessions[0].closed, 1)
        self.assertTrue(self.executor.stop_file.exists())

    def test_audit_error_after_motion_still_restores_and_fails_closed(self):
        self.call()
        with mock.patch.object(resident, 'atomic_json', side_effect=OSError('disk full')):
            result = self.call()
        self.assertFalse(result['result']['passed'])
        self.assertEqual(self.controller.sessions[0].closed, 1)
        self.assertTrue(self.executor.stop_file.exists())

    def test_recoverable_soft_limit_retains_ready_and_warm_without_replay(self):
        self.controller.positions['1']=100.
        result=self.call()
        self.assertTrue(result['result']['passed'])
        self.assertEqual(result['result']['outcome'],'limited')
        self.assertTrue(result['warm_active'])
        self.assertEqual(self.controller.moves,[])

    def test_cli_eof_restores_and_protocol_has_no_controller_prints(self):
        read_fd,write_fd=os.pipe()
        request=dict(request_id='request_eof',payload=dict(action='jog',run_id='web_eof',jog=base.jog()))
        os.write(write_fd,(json.dumps(request)+'\n').encode())
        os.close(write_fd)
        output, errors=io.StringIO(),io.StringIO()
        with os.fdopen(read_fd,'r') as incoming, mock.patch.object(worker,'load_controller',return_value=self.controller), \
                mock.patch.object(sys,'stdin',incoming), mock.patch.object(sys,'stdout',output), \
                mock.patch.object(sys,'stderr',errors):
            result=resident.main(['--root',str(self.path),'--runtime',str(self.path/'cli_runtime'),
                                  '--parent-pid',str(os.getppid()),'--execute'])
        self.assertEqual(result,0)
        messages=[json.loads(line) for line in output.getvalue().splitlines()]
        self.assertEqual(len(messages),1)
        self.assertEqual(messages[0]['request_id'],'request_eof')
        self.assertTrue(messages[0]['result']['passed'])
        self.assertIn('"ready": true',errors.getvalue())
        self.assertEqual(self.controller.sessions[0].closed,1)
        audit=json.loads((self.path/'cli_runtime/motion_executor.lease.json').read_text())
        self.assertTrue(audit['parameters_restored'])
        self.assertEqual(audit['reason'],'parent_eof')


if __name__=='__main__':
    unittest.main()
