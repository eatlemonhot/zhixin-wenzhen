"""Virtual serial bus verifies cache/trigger/stop and all-axis monitoring."""
import copy
import importlib.util
from pathlib import Path
import sys
import tempfile
import types
import unittest
from unittest.mock import Mock, patch

ROOT = Path(__file__).resolve().parents[1] / 'interface'
PACKAGE = '_offline_group_motion'
package = types.ModuleType(PACKAGE)
package.__path__ = [str(ROOT)]
sys.modules[PACKAGE] = package

def load(name):
    spec = importlib.util.spec_from_file_location(PACKAGE+'.'+name, ROOT/(name+'.py'))
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module

motion, geometry = load('motor_motion'), load('pcb_coordinates')

def crc8(data):
    value = data[0]
    for byte in data[1:]:
        value ^= byte
        for _ in range(8):
            value = (value >> 1) ^ (0x8c if value & 1 else 0)
    return value

class Clock:
    def __init__(self): self.now = 100.0
    def monotonic(self): return self.now
    def sleep(self, seconds): self.now += seconds

class Bus:
    def __init__(self, directory, clock):
        self.clock = clock
        self.coordinates = dict(axes={str(a): dict(soft_min_mm=2., soft_max_mm=199.) for a in range(1,5)},
                                joint_x_limit={'max_combined_inward_mm': 201.2})
        self.core = types.SimpleNamespace(STOP_FILE=directory/'stop.request',
                      AXES={a: {'positive_mm_sign': -1 if a == 3 else 1} for a in range(1,5)})
        self.crc8 = crc8
        self.positions = {str(a): 10. for a in range(1,5)}
        self.cache, self.running, self.sent, self.stops, self.reads = {}, {}, [], [], []
        self.speeds, self.accels, self.live_speeds = {}, {}, {}
        self.on_send, self.on_read = None, None
        self.bad_ack = None
        self.stop_failure = None
        self.session = types.SimpleNamespace(modes={a:2 for a in range(1,5)}, report={})
        self.session.prepare_group_currents = Mock()
        self.session.check_stop = self.check_stop
        self.session.motor = types.SimpleNamespace(ser=types.SimpleNamespace(packet_validator=self.base_validate))
        self.session.select = self.select
        self.session.stop = self.stop
        self.session.read_sample = self.read_sample
        self.session.verify_reference = self.verify
        self.runner = motion.GroupMotion(self.session, self.coordinates, self, geometry)

    def base_validate(self, packet):
        if packet[1] not in (0xfe, 0x3a, 0x43):
            raise ValueError('base transport rejected')
    def check_stop(self):
        if self.core.STOP_FILE.exists(): raise KeyboardInterrupt('STOP')
    def select(self, address):
        return types.SimpleNamespace(action=lambda payload: self.action(address,payload),
            send=lambda payload,address=address:self.send(address,payload),
            receive=lambda code, timeout:self.receive(code))
    def receive(self, code):
        if self.bad_ack == code: raise TimeoutError('lost ACK')
        return bytes([1,code,2,0x6b])
    def send(self, address, payload):
        self.session.motor.ser.packet_validator(motion.packet(payload,address,crc8))
        self.sent.append((address,bytes(payload)))
        if payload[0] == 0xcd:
            sign = -1 if payload[1] else 1
            deg = sign*int.from_bytes(payload[8:12],'big')/10
            self.cache[str(address)] = deg/9*self.core.AXES[address]['positive_mm_sign']
            self.speeds[str(address)] = int.from_bytes(payload[6:8], 'big')/10
            self.accels[str(address)] = int.from_bytes(payload[2:4], 'big')
            self.live_speeds[str(address)] = 0
        elif payload[0] == 0xff:
            self.running.update(self.cache)
            self.cache.clear()
        elif payload[0] == 0xfe:
            self.running.pop(str(address),None)
            self.cache.pop(str(address),None)
        if self.on_send: self.on_send(address,bytes(payload))
    def action(self, address, payload):
        self.send(address,payload)
        self.receive(payload[0])
        self.clock.sleep(.003)
    def stop(self, address):
        self.stops.append(address)
        if self.stop_failure == address: raise RuntimeError('unreachable stop')
        self.action(address,b'\xfe\x98\x00')
    def read_sample(self, address):
        self.clock.sleep(.0075)
        a = str(address)
        if self.on_read: self.on_read(address)
        speed = 0.
        if a in self.running:
            distance = self.running[a]-self.positions[a]
            velocity = min(self.speeds[a], self.live_speeds[a] + self.accels[a]*.03)
            self.live_speeds[a] = velocity
            step = velocity*2/3*.03
            delta = min(abs(distance), step)*(1 if distance>=0 else -1)
            self.positions[a] += delta
            if abs(distance) > step: speed = velocity
            else: self.running.pop(a)
        self.reads.append((address,self.clock.now))
        return dict(position_deg=self.positions[a]*9*self.core.AXES[address]['positive_mm_sign'],
                    speed_rpm=speed, phase_current_ma=100, home_flags=3, motor_flags=3,
                    monotonic_s=self.clock.now)
    def verify(self, address, item): return self.read_sample(address)
    def run(self, targets): return self.runner.run(targets)

class GroupTests(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory(); self.addCleanup(self.tmp.cleanup)
        self.clock = Clock()
        self.monotonic = patch.object(motion.time,'monotonic',self.clock.monotonic); self.monotonic.start()
        self.sleep = patch.object(motion.time,'sleep',self.clock.sleep); self.sleep.start()
        self.addCleanup(self.monotonic.stop); self.addCleanup(self.sleep.stop)
        self.bus = Bus(Path(self.tmp.name),self.clock)
    def test_four_cached_targets_then_exactly_one_broadcast(self):
        result = self.bus.run({str(a):12. for a in range(1,5)})
        commands = [(a,p[0]) for a,p in self.bus.sent]
        self.assertEqual(commands[:5],[(1,0xcd),(2,0xcd),(3,0xcd),(4,0xcd),(0,0xff)])
        self.assertEqual(commands.count((0,0xff)),1)
        self.assertTrue(all(abs(v-12)<.06 for v in result.values()))
        self.assertTrue(self.bus.runner.entries[0]['passed'])
        samples = self.bus.runner.entries[0]['samples']
        self.assertTrue(any(all(s['speed_rpm']>0 for s in frame['motors'].values()) for frame in samples))
        self.assertEqual(self.bus.runner.pending,set())
    def test_one_probe_does_not_command_other_axes_but_monitors_four(self):
        result = self.bus.run({'1':12.,'3':13.})
        self.assertEqual({a for a,p in self.bus.sent if p[0]==0xcd},{1,3})
        self.assertEqual((result['2'],result['4']),(10.,10.))
        self.assertEqual(set(a for a,_ in self.bus.reads),{1,2,3,4})
    def test_invalid_late_target_prevents_all_motion(self):
        with self.assertRaises(ValueError): self.bus.run({'1':12,'4':300})
        self.assertEqual(self.bus.sent,[])
    def test_unsafe_opposing_x_targets_are_phased_outward_first(self):
        self.bus.positions.update({'1':100.,'2':80.})
        self.bus.run({'1':40.,'2':120.,'3':12.,'4':12.})
        groups=self.bus.session.report['move_groups']
        self.assertNotIn(2,{m['address'] for m in groups[0]})
        self.assertIn(1,{m['address'] for m in groups[0]})
        self.assertIn(2,{m['address'] for m in groups[1]})
    def test_long_xy_move_uses_one_launch_and_full_absolute_endpoints(self):
        self.bus.run({'1':130.,'3':140.})
        self.assertEqual(len(self.bus.runner.entries), 1)
        self.assertEqual(sum(p[0] == 0xff for a,p in self.bus.sent), 1)
        self.assertEqual(self.bus.runner.entries[0]['targets_mm'], {'1':130.,'3':140.})
        self.bus.session.prepare_group_currents.assert_called_once_with((1,3))

    def test_speed_and_acceleration_scale_together_with_distance(self):
        self.bus.run({'1':110., '3':60.})
        rows = {a:p for a,p in self.bus.sent if p[0] == 0xcd}
        self.assertEqual(int.from_bytes(rows[1][6:8], 'big'), 3000)
        self.assertEqual(int.from_bytes(rows[3][6:8], 'big'), 1500)
        self.assertEqual(int.from_bytes(rows[1][2:4], 'big'), 900)
        self.assertEqual(int.from_bytes(rows[3][2:4], 'big'), 450)
        self.assertEqual(int.from_bytes(rows[1][14:16], 'big'), 3000)
        self.assertEqual(int.from_bytes(rows[3][14:16], 'big'), 1500)
        self.assertEqual(rows[1][12:14], bytes([1,1]))

    def test_clearance_phasing_keeps_each_arms_xy_together(self):
        self.bus.positions.update({'1':100.,'2':80.})
        self.bus.run({'1':40.,'2':120.,'3':20.,'4':30.})
        groups=self.bus.session.report['move_groups']
        self.assertEqual([{m['address'] for m in group} for group in groups], [{1,3},{2,4}])

    def test_current_setup_failure_stops_all_without_launch_or_cache(self):
        self.bus.session.prepare_group_currents.side_effect = RuntimeError('cap readback failed')
        with self.assertRaisesRegex(RuntimeError, 'cap readback'):
            self.bus.run({'1':50.,'3':80.})
        self.assertFalse(any(p[0] in (0xcd,0xff) for a,p in self.bus.sent))
        self.assertEqual(set(self.bus.stops), {1,2,3,4})
        self.assertTrue(self.bus.session.report['group_abort']['all_stops_verified'])

    def test_high_speed_overspeed_still_aborts_all(self):
        original = self.bus.session.verify_reference
        def overspeed(a, axis):
            row=original(a, axis)
            if self.bus.running and a == 1: row['speed_rpm'] = 350
            return row
        self.bus.session.verify_reference=overspeed
        with self.assertRaisesRegex(RuntimeError, 'corridor'):
            self.bus.run({'1':100.,'3':80.})
        self.assertEqual(set(self.bus.stops), {1,2,3,4})

    def test_stop_after_cache_never_launches_and_stops_all_preserving_user_stop(self):
        def hook(a,p):
            if a==2 and p[0]==0xcd:self.bus.core.STOP_FILE.write_text('user stop')
        self.bus.on_send=hook
        with self.assertRaises(KeyboardInterrupt):self.bus.run({'1':12,'2':12,'3':12,'4':12})
        self.assertFalse(any(p[0]==0xff for a,p in self.bus.sent))
        self.assertEqual(set(self.bus.stops),{1,2,3,4})
        self.assertEqual(self.bus.core.STOP_FILE.read_text(),'user stop')
        self.assertTrue(self.bus.session.report['group_abort']['all_stops_verified'])
    def test_lost_cache_ack_is_never_retried(self):
        self.bus.bad_ack=0xcd
        with self.assertRaises(TimeoutError):self.bus.run({'1':12,'2':12})
        self.assertEqual(len([p for a,p in self.bus.sent if p[0]==0xcd]),1)
        self.assertFalse(any(p[0]==0xff for a,p in self.bus.sent))
        self.assertTrue(self.bus.core.STOP_FILE.exists())
        self.assertEqual(set(self.bus.stops),{1,2,3,4})
    def test_lost_broadcast_ack_stops_all_without_repeating_launch(self):
        self.bus.bad_ack=0xff
        with self.assertRaises(TimeoutError):self.bus.run({'1':12,'2':12,'3':12,'4':12})
        self.assertEqual(len([p for a,p in self.bus.sent if p[0]==0xff]),1)
        self.assertEqual(set(self.bus.stops),{1,2,3,4})
        self.assertTrue(self.bus.session.report['group_abort']['all_stops_verified'])
    def test_partial_cache_write_is_uncertain_and_not_repeated(self):
        def hook(a,p):
            if p[0]==0xcd:raise RuntimeError('Partial USB write')
        self.bus.on_send=hook
        with self.assertRaisesRegex(RuntimeError,'Partial'):self.bus.run({'1':12,'2':12})
        self.assertEqual(len([p for a,p in self.bus.sent if p[0]==0xcd]),1)
        self.assertEqual(set(self.bus.stops),{1,2,3,4})
    def test_idle_axis_drift_aborts_all(self):
        def hook(a):
            if self.bus.running and a==4:self.bus.positions['4']+=1
        self.bus.on_read=hook
        with self.assertRaisesRegex(RuntimeError,'corridor'):self.bus.run({'1':12,'3':12})
        self.assertEqual(set(self.bus.stops),{1,2,3,4})
    def test_telemetry_gap_aborts(self):
        def hook(a):
            if self.bus.running and a==1:self.clock.sleep(.4)
        self.bus.on_read=hook
        with self.assertRaisesRegex(RuntimeError,'gap'):self.bus.run({'1':12,'2':12})
        self.assertEqual(set(self.bus.stops),{1,2,3,4})
    def test_one_stop_failure_never_skips_other_drives(self):
        self.bus.stop_failure=1
        self.bus.bad_ack=0xff
        with self.assertRaises(TimeoutError):self.bus.run({'1':30,'2':30})
        self.assertEqual(set(self.bus.stops),{1,2,3,4})
        self.assertFalse(self.bus.session.report['group_abort']['all_stops_verified'])
    def test_motion_validator_rejects_duplicate_or_unplanned_packets(self):
        payload=motion.cached_position(1,12,1)
        self.bus.runner.authorize({1:payload})
        validator=self.bus.session.motor.ser.packet_validator
        validator(motion.packet(payload,1,crc8))
        with self.assertRaises(ValueError):validator(motion.packet(payload,1,crc8))
        with self.assertRaises(ValueError):validator(motion.packet(payload,2,crc8))
    def test_launch_is_forbidden_until_all_planned_targets_cached(self):
        self.bus.runner.authorize({1:motion.cached_position(1,12,1)})
        with self.assertRaisesRegex(ValueError,'cached before launch'):
            self.bus.session.motor.ser.packet_validator(motion.packet(b'\xff\x66',0,crc8))

    def test_nothing_to_move_sends_no_motion(self):
        self.bus.run({'1':10.,'3':10.})
        self.assertEqual(self.bus.sent,[])

class DecoderTests(unittest.TestCase):
    def test_rejects_wrong_layout_and_sign(self):
        for size in (36,38):
            with self.assertRaises(RuntimeError):motion.decode_system(bytes(size))
        packet=bytearray(37);packet[1:4]=bytes([0x43,37,12]);packet[19]=2
        with self.assertRaises(RuntimeError):motion.decode_system(packet)
    def test_signed_fields_units_and_state_offsets(self):
        data=bytearray(37);data[1:4]=bytes([0x43,37,12]);data[4:6]=motion.U16(10200)
        data[8:10]=motion.U16(700);data[12:14]=motion.U16(65500)
        data[19:22]=bytes([1])+motion.U16(50)
        data[22:27]=bytes([1])+motion.U32(900)
        data[27:32]=bytes([1])+motion.U32(125)
        data[32:36]=bytes([1,12,3,129])
        result=motion.decode_system(data)
        self.assertEqual((result['speed_rpm'],result['position_deg'],result['position_error_deg']),(-5,-90,-1.25))
        self.assertEqual((result['voltage_v'],result['temperature_c'],result['motor_flags']),(10.2,-12,129))

class VerifiedFrameTests(unittest.TestCase):
    def setUp(self):
        self.session=types.SimpleNamespace(check_stop=Mock(),move_relative=Mock(),verify_reference=Mock())
        self.coords={'axes':{'1':{}}}
        self.frame=dict(owner=self.session,coordinates=self.coords,stamp=100.,positions={'1':10.,'2':20.,'3':30.,'4':40.},
                        samples={str(a):{'speed_rpm':0} for a in range(1,5)})
        self.controller=types.SimpleNamespace(move_to=Mock(return_value='fallback'),bounded_target=Mock(return_value=11),
                    AXES={1:{'positive_mm_sign':1}},DEG_PER_MM=9,local_mm=lambda a,s:s['mm'])
        self.session.verify_reference.return_value={'mm':11}
    def test_fresh_owned_frame_skips_duplicate_full_read(self):
        with patch.object(motion.time,'monotonic',return_value=100.05):
            result=motion.move_verified(self.session,self.coords,1,11,self.frame,self.controller)
        self.controller.move_to.assert_not_called()
        self.session.move_relative.assert_called_once_with(1,9,maximum_mm=50)
        self.assertEqual(result['final_mm'],11)
    def test_expired_foreign_session_or_coordinates_falls_back_to_live_check(self):
        for change in ({'stamp':99.},{'owner':object()},{'coordinates':copy.deepcopy(self.coords)}):
            with self.subTest(change=change),patch.object(motion.time,'monotonic',return_value=100.05):
                self.assertEqual(motion.move_verified(self.session,self.coords,1,11,dict(self.frame,**change),self.controller),'fallback')
        self.session.move_relative.assert_not_called()
    def test_moving_frame_cannot_skip_validation(self):
        self.frame['samples']['4']['speed_rpm']=3
        with patch.object(motion.time,'monotonic',return_value=100.05),self.assertRaises(RuntimeError):
            motion.move_verified(self.session,self.coords,1,11,self.frame,self.controller)
        self.session.move_relative.assert_not_called()

if __name__=='__main__':unittest.main()
