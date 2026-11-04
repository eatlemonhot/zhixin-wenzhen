import copy
import importlib.util
from pathlib import Path
import struct
import tempfile
import types
import unittest
from unittest import mock


SOURCE = Path(__file__).resolve().parents[1] / 'interface/web_motor_runtime.py'
import sys
package = types.ModuleType('_offline_web_runtime')
package.__path__ = [str(SOURCE.parent)]
sys.modules[package.__name__] = package
spec = importlib.util.spec_from_file_location('_offline_web_runtime.web_motor_runtime', SOURCE)
runtime = importlib.util.module_from_spec(spec)
spec.loader.exec_module(runtime)
U16 = lambda value: struct.pack('>H', value)
U32 = lambda value: struct.pack('>I', value)


class Fixture(unittest.TestCase):
    def setUp(self):
        self.temporary = tempfile.TemporaryDirectory()
        self.addCleanup(self.temporary.cleanup)
        self.directory = Path(self.temporary.name)
        self.stop_file = self.directory / 'stop.request'
        self.writes = []
        self.reads = []
        self.events = []
        self.samples = []
        self.opens = []
        self.saves = []
        self.next_timeout = False
        self.next_ack = 2
        self.write_hook = None
        self.checksum_hook = None
        self.bad_identity = None
        self.sample_error = None
        self.moving = None
        self.disabled = None
        self.states = {}
        for address in range(1, 5):
            body = bytearray(32)
            body[12:14] = U16(3000)
            self.states[address] = dict(body=body, heartbeat=U32(0),
                                        home=b'original-home', release=U16(50))
        self.original_states = copy.deepcopy(self.states)
        fixture = self

        class FakeMotor:
            def __init__(self, port, journal):
                fixture.opens.append(port)
                self.address = 1
                self.mode = 0
                self.ser = types.SimpleNamespace(closed=False, reset_input_buffer=lambda: None)
                self.buffer = bytearray()
                self.pending = []
                self.supply_profile = dict(minimum_v=10, maximum_v=13.5)

            def event(self, **data):
                fixture.events.append(data)

            def send(self, payload, address=None):
                destination = self.address if address is None else address
                payload = bytes(payload)
                if payload[0] == 0x43:
                    fixture.reads.append((destination, payload))
                    return
                fixture.writes.append((destination, payload))
                if destination == 0:
                    return
                state = fixture.states[destination]
                if payload[:3] == b'\x45\x66\x00':
                    state['body'][12:14] = payload[3:]
                if payload[:3] == b'\x68\x38\x00':
                    state['heartbeat'] = payload[3:]
                if fixture.write_hook:
                    fixture.write_hook(destination, payload)

            def query(self, payload):
                fixture.reads.append((self.address, bytes(payload)))
                return bytes([self.address, payload[0], 3, 0x6b])

            def receive(self, code, timeout):
                if fixture.next_timeout:
                    fixture.next_timeout = False
                    raise TimeoutError('no ACK')
                if code == 0x43:
                    fixture.samples.append(self.address)
                    reply = bytearray(37)
                    reply[:4] = bytes([self.address, 0x43, 37, 12])
                    reply[4:6] = U16(11800)
                    reply[8:10] = U16(100)
                    reply[20:22] = U16(20 if fixture.moving == self.address else 0)
                    reply[33:37] = bytes([30, 3, 8 if fixture.sample_error == self.address else
                                                    2 if fixture.disabled == self.address else 3, 0x6b])
                    return bytes(reply)
                return bytes([self.address, code, fixture.next_ack, 0x6B])

            def consistent(self, payload):
                fixture.reads.append((self.address, bytes(payload)))
                state = fixture.states[self.address]
                if payload[0] == 0x1F:
                    expected = bytes.fromhex('00 ce 23 14' if self.address <= 2 else '00 ce 21 14')
                    return bytes([self.address, 0x1F]) + (
                        b'bad!' if fixture.bad_identity == self.address else expected) + b'\x6b'
                field = {0x16: 'heartbeat', 0x22: 'home', 0x3F: 'release'}[payload[0]]
                return bytes([self.address, payload[0]]) + bytes(state[field]) + b'\x6b'

            def options(self):
                fixture.reads.append((self.address, b'\x1a'))
                return {'firmware': 'X'}

            def config(self):
                fixture.reads.append((self.address, b'\x42\x6c'))
                return bytes([self.address, 0x42, 0x25, 0x18]) + bytes(
                    fixture.states[self.address]['body']) + b'\x6b'

            def set_checksum(self, config, mode):
                fixture.writes.append((self.address, b'\x48' + bytes([mode])))
                fixture.states[self.address]['body'][20] = mode
                self.mode = mode
                if fixture.checksum_hook:
                    fixture.checksum_hook(self.address, mode)

        class CoreSession:
            def __init__(self, label, port, motor_factory):
                self.path = fixture.directory / (label + '.json')
                self.motor = motor_factory(port, None)
                self.modes = {a: 0 for a in range(1, 5)}
                self.original = {}
                self.active = None
                self.started = set()
                self.home_touched = set()
                self.report = {'passed': False}

            def select(self, address):
                self.motor.address = address
                self.motor.mode = self.modes[address]
                return self.motor

            def sample(self, address):
                fixture.samples.append(address)
                if fixture.sample_error == address:
                    raise RuntimeError('driver protection active')
                return {'speed_rpm': 2 if fixture.moving == address else 0,
                        'home_flags': 3, 'motor_flags': 2 if fixture.disabled == address else 3}

            def check_stop(self):
                if fixture.stop_file.exists():
                    raise KeyboardInterrupt('stop requested')

            def close(self):
                for address in sorted(self.started):
                    motor = self.select(address)
                    if abs(self.sample(address)['speed_rpm']) > 0.6:
                        raise RuntimeError('standstill unverified')
                    original = self.original[address]
                    motor.action(b'\x45\x66\x00' + U16(3000))
                    motor.set_checksum(motor.config(), 0)
                    self.modes[address] = motor.mode
                    motor.action(b'\x68\x38\x00' + bytes.fromhex(original['heartbeat'])[2:-1])
                    if motor.config()[4:-1] != bytes.fromhex(original['config'])[4:-1]:
                        raise RuntimeError('configuration restore failed')
                self.motor.ser.closed = True
                self.report['passed'] = 'error' not in self.report

        class USBSession(CoreSession):
            pass

        self.core_session = CoreSession
        self.controller = types.SimpleNamespace(
            core=types.SimpleNamespace(Session=CoreSession, U16=U16, U32=U32,
                                       setup_motor2=types.SimpleNamespace(LENGTHS={}),
                                       save=lambda path, data: fixture.saves.append(copy.deepcopy(data))),
            USBSession=USBSession, USBMotor=FakeMotor,
            validate_power_temperature=lambda sample, profile: self.assertTrue(
                profile['minimum_v'] <= sample['voltage_v'] <= profile['maximum_v']
                and -20 <= sample['temperature_c'] < 60))
        self.Session = runtime.create_session_class(self.controller)
        self.sleep_patch = mock.patch.object(runtime.time, 'sleep')
        self.sleep = self.sleep_patch.start()
        self.addCleanup(self.sleep_patch.stop)

    def session(self, axes=(2,)):
        return self.Session('offline', active_axes=axes)


class InitializationTests(Fixture):
    def test_factory_has_no_hardware_side_effects(self):
        self.assertEqual(self.opens, [])
        self.assertEqual(self.writes, [])

    def test_invalid_axes_fail_before_opening_transport(self):
        for axes in ((), (True,), (0,), (5,), ('2',), (2, 2), None):
            with self.subTest(axes=axes), self.assertRaises(ValueError):
                self.session(axes)
        self.assertEqual(self.opens, [])

    def test_all_four_identities_and_samples_but_only_selected_axis_changes(self):
        session = self.session()
        session.initialize()
        self.assertEqual(self.samples, [1, 2, 3, 4])
        self.assertEqual([a for a, p in self.reads if p == b'\x1f'], [1, 2, 3, 4])
        self.assertEqual([a for a, p in self.reads if p == b'\x1a'], [1, 2, 3, 4])
        self.assertEqual({address for address, payload in self.writes}, {2})
        self.assertEqual(session.started, {2})
        self.assertEqual(set(session.original), {2})
        self.assertEqual(set(session.original[2]), {'config', 'home', 'release', 'heartbeat', 'before'})
        self.assertEqual(self.states[2]['body'][12:14], U16(1000))
        self.assertEqual(self.states[2]['heartbeat'], U32(1000))
        for address in (1, 3, 4):
            self.assertEqual(self.states[address], self.original_states[address])
        self.assertTrue(session.report['timing']['initialize_completed'])
        self.assertEqual(len(self.saves), 1)
        self.assertEqual(self.saves[0]['original'], session.original)

    def test_circle_caps_set_readback_and_restore_original_all_axes(self):
        session = self.session((1,2,3,4))
        session.initialize()
        session.prepare_group_currents((1,3))
        self.assertEqual(session.current_caps, {1:3000,2:1000,3:1500,4:1000})
        self.assertEqual(self.states[1]['body'][12:14], U16(3000))
        self.assertEqual(self.states[3]['body'][12:14], U16(1500))
        session.close()
        self.assertEqual(session.current_caps, {1:3000,2:3000,3:3000,4:3000})
        self.assertEqual(self.states, self.original_states)
        self.assertTrue(session.report['passed'])

    def test_group_current_refuses_unprepared_axis(self):
        session = self.session((1,))
        session.initialize()
        before = len(self.writes)
        with self.assertRaisesRegex(RuntimeError, 'prepared axis'):
            session.prepare_group_currents((3,))
        self.assertEqual(len(self.writes), before)
        session.close()

    def test_group_current_missing_ack_uses_exact_readback_once(self):
        session = self.session((3,))
        session.initialize()
        self.next_timeout = True
        before=len(self.writes)
        session.prepare_group_currents((3,))
        self.assertEqual(len(self.writes)-before, 1)
        self.assertEqual(session.current_caps[3], 1500)
        session.close()

    def test_multiple_axes_only_restore_modified_axes_and_use_inherited_close(self):
        session = self.session((4, 2))
        self.assertTrue(issubclass(self.Session, self.core_session))
        session.initialize()
        self.assertEqual(session.active_axes, (2, 4))
        self.assertEqual({address for address, payload in self.writes}, {2, 4})
        session.close()
        self.assertEqual(self.states, self.original_states)
        self.assertTrue(session.motor.ser.closed)
        self.assertTrue(session.report['passed'])

    def test_stop_before_initialize_never_writes(self):
        session = self.session()
        self.stop_file.write_text('stop')
        with self.assertRaises(KeyboardInterrupt):
            session.initialize()
        self.assertEqual(self.writes, [])

    def test_identity_protection_and_stationary_failures_on_unselected_axis_never_write(self):
        for attribute in ('bad_identity', 'sample_error', 'moving', 'disabled'):
            with self.subTest(attribute=attribute):
                setattr(self, attribute, 4)
                session = self.session()
                with self.assertRaises(RuntimeError):
                    session.initialize()
                self.assertEqual(self.writes, [])
                self.assertEqual(session.started, set())
                setattr(self, attribute, None)

    def test_stop_after_checksum_tracks_transition_and_allows_restoration(self):
        session = self.session((1, 2))
        self.checksum_hook = lambda address, mode: self.stop_file.write_text('stop') if mode == 2 else None
        with self.assertRaises(KeyboardInterrupt):
            session.initialize()
        self.assertEqual(session.started, {1})
        self.assertEqual(session.modes[1], 2)
        self.assertFalse(session.report['timing']['initialize_completed'])
        session.close()
        self.assertTrue(self.stop_file.exists())
        self.assertEqual(self.states, self.original_states)
        self.assertEqual({address for address, payload in self.writes}, {1})

    def test_partial_initialize_failure_restores_all_started_axes(self):
        session = self.session((1, 2))
        def fail(address, payload):
            if address == 2 and payload[:3] == b'\x45\x66\x00' and payload[3:] == U16(1000):
                raise RuntimeError('write failed after possible transfer')
        self.write_hook = fail
        with self.assertRaisesRegex(RuntimeError, 'write failed'):
            session.initialize()
        self.assertEqual(session.started, {1, 2})
        self.assertEqual(self.states[2]['body'][12:14], U16(1000))
        session.close()
        self.assertEqual(self.states, self.original_states)

    def test_rejects_nonbaseline_config_before_any_write(self):
        self.states[2]['body'][12:14] = U16(1400)
        session = self.session()
        with self.assertRaisesRegex(RuntimeError, 'original 3 A'):
            session.initialize()
        self.assertEqual(self.writes, [])

    def test_readback_mismatch_is_not_accepted(self):
        session = self.session()
        def ignore_current(address, payload):
            if payload[:3] == b'\x45\x66\x00':
                self.states[address]['body'][12:14] = U16(3000)
        self.write_hook = ignore_current
        with self.assertRaisesRegex(RuntimeError, 'current cap not verified'):
            session.initialize()
        session.close()
        self.assertEqual(self.states, self.original_states)


class AggregateTests(Fixture):
    def test_one_aggregate_read_per_sample_and_no_individual_position_query(self):
        session = self.session()
        session.sample(4)
        self.assertEqual(self.reads, [(4, b'\x43\x7a')])
        self.assertEqual(self.writes, [])
        self.assertTrue(self.events[-1]['aggregate_status'])

    def test_only_read_query_can_retry_after_timeout(self):
        session = self.session()
        self.next_timeout = True
        session.sample(1)
        self.assertEqual(self.reads, [(1, b'\x43\x7a')]*2)
        self.assertTrue(any(e.get('read_only_fast_retry') == 1 for e in self.events))

    def test_idle_prepared_axes_receive_proven_heartbeat_refreshes(self):
        session = self.session((1,2,3,4))
        session.initialize()
        self.reads.clear()
        session._web_refresh.clear()
        session.sample(3)
        self.assertEqual([(a,p) for a,p in self.reads if p==b'\x3a'],
                         [(a,b'\x3a') for a in range(1,5)])
        self.assertEqual(self.reads[-1],(3,b'\x43\x7a'))

    def test_aggregate_keeps_fault_home_enable_and_current_guards(self):
        session = self.session()
        base = session.sample(1)
        for change in ({'home_flags':0},{'home_flags':7},{'home_flags':0x23},
                       {'motor_flags':0},{'motor_flags':9},{'phase_current_ma':3101}):
            with self.subTest(change=change),mock.patch.object(session,'read_sample',return_value=dict(base,**change)):
                with self.assertRaises(RuntimeError):session.sample(1)
        session.started.add(1)
        with mock.patch.object(session,'read_sample',return_value=dict(base,phase_current_ma=1151)):
            with self.assertRaises(RuntimeError):session.sample(1)

    def test_aggregate_delegates_power_temperature_to_original_profile_validator(self):
        session = self.session()
        with mock.patch.object(self.controller,'validate_power_temperature',side_effect=RuntimeError('low voltage')) as guard:
            with self.assertRaisesRegex(RuntimeError,'low voltage'):session.sample(1)
        guard.assert_called_once()
        self.assertEqual(guard.call_args[0][1],session.motor.supply_profile)



class ActionTests(Fixture):
    def test_fast_actions_wait_3ms_and_home_parameters_keep_100ms(self):
        motor = self.session().motor
        motor.action(b'\xfe\x98\x00')
        motor.action(b'\x4c\xae\x00')
        motor.action(b'\x5c\xac\x00')
        self.assertEqual(self.sleep.call_args_list, [mock.call(0.003), mock.call(0.1), mock.call(0.1)])

    def test_missing_current_ack_is_read_back_without_resending(self):
        motor = self.session().motor
        self.next_timeout = True
        self.assertIsNone(motor.action(b'\x45\x66\x00' + U16(1000)))
        self.assertEqual(self.writes, [(1, b'\x45\x66\x00' + U16(1000))])
        self.assertTrue(self.events[-1]['action_sent_once'])
        self.assertEqual(self.sleep.call_args_list, [mock.call(0.02)])

    def test_missing_ack_different_readback_fails_without_retry(self):
        motor = self.session().motor
        self.next_timeout = True
        self.write_hook = lambda address, payload: self.states[address]['body'].__setitem__(slice(12, 14), U16(3000))
        with self.assertRaisesRegex(RuntimeError, 'readback differs'):
            motor.action(b'\x45\x66\x00' + U16(1000))
        self.assertEqual(len(self.writes), 1)
        self.sleep.assert_not_called()

    def test_missing_heartbeat_ack_requires_exact_readback_without_retry(self):
        motor = self.session().motor
        self.next_timeout = True
        self.write_hook = lambda address, payload: self.states[address].__setitem__('heartbeat', U32(0))
        with self.assertRaisesRegex(RuntimeError, 'readback differs'):
            motor.action(b'\x68\x38\x00' + U32(1000))
        self.assertEqual(len(self.writes), 1)
        self.assertEqual(self.reads, [(1, b'\x16')])
        self.sleep.assert_not_called()

    def test_unknown_current_or_heartbeat_value_never_uses_readback_fallback(self):
        for payload in (b'\x45\x66\x00' + U16(1700), b'\x68\x38\x00' + U32(2000)):
            with self.subTest(payload=payload):
                motor = self.session().motor
                self.next_timeout = True
                before = len(self.reads)
                with self.assertRaises(TimeoutError):
                    motor.action(payload)
                self.assertEqual(len(self.reads), before)

    def test_saved_original_heartbeat_can_be_verified_on_restore(self):
        self.states[2]['heartbeat'] = U32(2500)
        session = self.session()
        session.initialize()
        motor = session.select(2)
        self.next_timeout = True
        self.assertIsNone(motor.action(b'\x68\x38\x00' + U32(2500)))
        self.assertEqual(self.states[2]['heartbeat'], U32(2500))
        session.close()

    def test_motion_timeout_is_never_retried_or_inferred_from_readback(self):
        motor = self.session().motor
        self.next_timeout = True
        with self.assertRaises(TimeoutError):
            motor.action(b'\xcd\x00')
        self.assertEqual(self.writes, [(1, b'\xcd\x00')])
        self.assertEqual(self.reads, [])
        self.sleep.assert_not_called()

    def test_rejected_ack_fails_after_one_action(self):
        motor = self.session().motor
        self.next_ack = 1
        with self.assertRaisesRegex(RuntimeError, 'Action rejected'):
            motor.action(b'\xfe\x98\x00')
        self.assertEqual(len(self.writes), 1)
        self.sleep.assert_not_called()

    def test_first_motion_timing_tracks_only_successful_first_write(self):
        session = self.session()
        session.initialize()
        self.assertIsNone(session.first_motion_monotonic_s)
        motor = session.select(2)
        def rejected(address, payload):
            raise ValueError('transport rejected')
        self.write_hook = rejected
        with self.assertRaises(ValueError):
            motor.send(b'\xcd\x00')
        self.assertIsNone(session.first_motion_monotonic_s)
        self.write_hook = None
        with mock.patch.object(runtime.time, 'monotonic', return_value=12345):
            motor.send(b'\xcd\x00')
        with mock.patch.object(runtime.time, 'monotonic', return_value=12346):
            motor.send(b'\xcd\x00')
        self.assertEqual(session.first_motion_monotonic_s, 12345)
        self.assertEqual(session.report['timing']['first_motion_monotonic_s'], 12345)
        self.assertEqual(len([event for event in self.events if event.get('web_first_motion')]), 1)


if __name__ == '__main__':
    unittest.main()
