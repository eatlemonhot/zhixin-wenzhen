"""Explicit, sequential coordinate setup for four addressed X-firmware motors.
No serial access on import. All movement is bounded, CRC checked and logged.
"""
import argparse
import json
import math
import struct
import sys
import time
from datetime import datetime, timezone
from pathlib import Path

ROOT = Path(__file__).resolve().parent
sys.path.insert(0, str(ROOT.parent / 'motor2_setup'))
import setup_motor2
from setup_motor2 import Motor2
from cycle_200rpm_crc import crc8

setup_motor2.LENGTHS.update({0x0A: 4, 0x50: 4, 0xCD: 4, 0x4C: 4,
    0x5C: 4, 0x68: 4, 0x45: 4, 0x9A: 4, 0x9C: 4, 0x22: 18, 0x3F: 5})
U16 = lambda v: struct.pack('>H', v)
U32 = lambda v: struct.pack('>I', v)
STOP_FILE = ROOT / 'stop.request'
MM_PER_REV = 40.0
DEG_PER_MM = 360 / MM_PER_REV
AXES = {
    1: dict(name='right_x', axis='X', arm='right', home_direction=1, positive_mm_sign=1),
    2: dict(name='left_x', axis='X', arm='left', home_direction=1, positive_mm_sign=1),
    3: dict(name='left_y', axis='Y', arm='left', home_direction=0, positive_mm_sign=-1),
    4: dict(name='right_y', axis='Y', arm='right', home_direction=1, positive_mm_sign=1),
}

def now():
    return datetime.now(timezone.utc).isoformat()

def save(path, value):
    path.write_text(json.dumps(value, ensure_ascii=False, indent=2), encoding='utf-8')

def signed(reply, scale=1):
    if reply[2] not in (0, 1):
        raise RuntimeError('Invalid sign byte')
    return (-1 if reply[2] else 1) * int.from_bytes(reply[3:-1], 'big') / scale

class CoordinateMotor(Motor2):
    def query(self, payload):
        for attempt in range(3):
            self.buffer.clear()
            self.pending.clear()
            self.ser.reset_input_buffer()
            self.send(payload)
            try:
                return self.receive(payload[0], timeout=0.12)
            except TimeoutError:
                if attempt == 2:
                    raise

    def consistent(self, payload):
        for group in range(3):
            try:
                return super().consistent(payload)
            except (RuntimeError, TimeoutError) as exc:
                self.event(read_only_group_retry=group + 1, query=list(payload), error=str(exc))
                if group == 2:
                    raise

class Session:
    def __init__(self, label, port='COM7', motor_factory=CoordinateMotor):
        stamp = datetime.now().strftime('%Y%m%d_%H%M%S')
        self.path = ROOT / f'{stamp}_{label}_summary.json'
        self.raw = ROOT / f'{stamp}_{label}_serial.jsonl'
        self.journal = self.raw.open('x', encoding='utf-8')
        self.motor = motor_factory(port, self.journal)
        self.motor.emm = False
        self.modes = {a: 0 for a in range(1, 5)}
        self.original = {}
        self.active = None
        self.started = set()
        self.home_touched = set()
        self.report = dict(started_at_utc=now(), stage=label, port=port,
            baud=115200, passed=False, mm_per_rev=MM_PER_REV,
            raw_serial_file=str(self.raw), summary_file=str(self.path), motors={})

    def select(self, address):
        self.motor.address = address
        self.motor.mode = self.modes[address]
        return self.motor

    def sample(self, address, allow_home=False):
        m = self.select(address)
        s = m.snapshot()
        s['position_deg'] = signed(m.query([0x36]), 10)
        if (s['home_flags'] & 3) != 3 or s['motor_flags'] & 8:
            raise RuntimeError(f'Motor {address} not ready: {s}')
        if not allow_home and s['home_flags'] & 0x0C:
            raise RuntimeError(f'Motor {address} unexpected homing state: {s}')
        if address in self.started and s['phase_current_ma'] > 1150:
            raise RuntimeError(f'Motor {address} exceeded temporary current bound: {s}')
        return s

    def initialize(self):
        if STOP_FILE.exists():
            raise RuntimeError(f'Stop request exists: {STOP_FILE}')
        for a in range(1, 5):
            m = self.select(a)
            version = m.consistent([0x1F])
            expected = bytes.fromhex('00 ce 23 14' if a <= 2 else '00 ce 21 14')
            if version[2:-1] != expected or m.options()['firmware'] != 'X':
                raise RuntimeError(f'Identity mismatch at address {a}')
            config = m.config()
            if config[16:18] != U16(3000) or config[26] != 0:
                raise RuntimeError('Expected original 3 A and unscaled X angle input')
            original = dict(config=config.hex(' '), home=m.consistent([0x22]).hex(' '),
                release=m.consistent([0x3F]).hex(' '),
                heartbeat=m.consistent([0x16]).hex(' '), before=self.sample(a))
            if abs(original['before']['speed_rpm']) > 0.6:
                raise RuntimeError(f'Motor {a} must be stationary')
            self.original[a] = original
        self.report['original'] = self.original
        save(self.path, self.report)
        for a in range(1, 5):
            m = self.select(a)
            config = bytes.fromhex(self.original[a]['config'])
            self.modes[a] = 2
            self.started.add(a)
            m.set_checksum(config, 2)
            m.action(b'\x45\x66\x00' + U16(1000))
            m.action(b'\x68\x38\x00' + U32(1000))
            if m.config()[16:18] != U16(1000):
                raise RuntimeError('Temporary current cap not verified')
            if m.consistent([0x16])[2:-1] != U32(1000):
                raise RuntimeError('Heartbeat was not verified')
        print(json.dumps(dict(ready=True, crc=True, current_cap_ma=1000, heartbeat_ms=1000)), flush=True)

    def stop(self, address, abort_home=False):
        m = self.select(address)
        if abort_home:
            m.action([0x9C, 0x48])
        m.action([0xFE, 0x98, 0])

    def check_stop(self):
        if STOP_FILE.exists():
            raise KeyboardInterrupt(f'Stop requested: {STOP_FILE}')

    def move_relative(self, address, delta_deg, expect_contact=False, cap_ma=700, maximum_mm=5):
        if (maximum_mm not in (5, 50) or not math.isfinite(delta_deg)
                or abs(delta_deg) > maximum_mm * DEG_PER_MM):
            raise ValueError('Probe exceeds the explicitly selected distance bound')
        before = self.sample(address)
        m = self.select(address)
        target = before['position_deg'] + delta_deg
        payload = (bytes([0xCD, int(delta_deg < 0)]) + U16(20) + U16(20)
            + U16(50) + U32(round(abs(delta_deg) * 10)) + bytes([2, 0]) + U16(cap_ma))
        self.active = address
        m.action(payload)
        start = time.monotonic()
        stalled = None
        stable = None
        result = dict(before=before, requested_delta_deg=delta_deg, requested_mm=delta_deg / DEG_PER_MM,
            speed_rpm=5, current_cap_ma=cap_ma, samples=[])
        last_print = start
        while time.monotonic() - start < abs(delta_deg) / 30 + 4:
            self.check_stop()
            s = self.sample(address)
            result['samples'].append(s)
            if time.monotonic() - last_print >= 2:
                print(json.dumps(dict(address=address, progress_mm=round((s['position_deg'] - before['position_deg']) / DEG_PER_MM, 2),
                    speed_rpm=s['speed_rpm'], current_ma=s['phase_current_ma'])), flush=True)
                last_print = time.monotonic()
            elapsed = time.monotonic() - start
            travel = s['position_deg'] - before['position_deg']
            if abs(travel) > abs(delta_deg) + 3:
                raise RuntimeError('Probe exceeded commanded travel')
            if abs(s['position_deg'] - target) <= 0.5 and abs(s['speed_rpm']) < 0.6:
                stable = stable or time.monotonic()
                if time.monotonic() - stable >= 0.2:
                    result['outcome'] = 'reached'
                    break
            else:
                stable = None
            if (elapsed > 0.35 and abs(s['speed_rpm']) < 1
                    and s['phase_current_ma'] > cap_ma * 0.85
                    and abs(s['position_deg'] - target) > 1):
                stalled = stalled or time.monotonic()
                if time.monotonic() - stalled >= 0.15:
                    if not expect_contact:
                        raise RuntimeError('Unexpected obstacle')
                    result['outcome'] = 'contact'
                    break
            else:
                stalled = None
            time.sleep(0.02)
        else:
            raise TimeoutError('Probe did not settle or identify contact')
        self.stop(address)
        result['final'] = self.sample(address)
        self.active = None
        return result

    def observe50(self):
        # User explicitly requested 50 mm observations. Initial confirmed
        # geometry: X arms at opposing outer stops, Y carriages at mid-travel.
        # Prior 1 mm probes completed positively on all axes.
        self.initialize()
        for address in (1, 2, 3, 4):
            print(json.dumps(dict(starting_address=address, distance_mm=50, speed_rpm=5)), flush=True)
            result = self.move_relative(address, 450, maximum_mm=50)
            result['encoder_feedback_travel_mm'] = (result['final']['position_deg'] - result['before']['position_deg']) / DEG_PER_MM
            self.report['motors'][str(address)] = result
            save(self.path, self.report)
            print(json.dumps(dict(completed_address=address, travel_mm=result['encoder_feedback_travel_mm'],
                final=result['final'])), flush=True)
            time.sleep(0.5)

    def home(self, address, direction, maximum_mm, watch_address=None):
        if direction not in (0, 1) or not 0 < maximum_mm <= 270:
            raise ValueError('Invalid bounded homing parameters')
        before = self.sample(address)
        m = self.select(address)
        m.action([0x50, 1])
        self.home_touched.add(address)
        parameters = (bytes([2, direction]) + U16(10) + U32(45000)
            + U16(8) + U16(800) + U16(150) + bytes([0]))
        m.action(bytes([0x4C, 0xAE, 0]) + parameters)
        if m.consistent([0x22])[2:-1] != parameters:
            raise RuntimeError('Temporary homing parameters not verified')
        m.action(bytes([0x5C, 0xAC, 0]) + U16(50))
        if m.consistent([0x3F])[2:-1] != U16(50):
            raise RuntimeError('Homing release angle not verified')
        self.active = address
        self.report['home_active'] = True
        print(json.dumps(dict(homing_address=address, direction=direction,
            speed_rpm=10, maximum_mm=maximum_mm)), flush=True)
        m.action([0x9A, 2, 0])
        start = last_sample = last_print = time.monotonic()
        last_encoder = before['encoder']
        travel_deg = 0
        running = False
        stable = None
        result = dict(before=before, direction=direction, speed_rpm=10,
            release_deg=5, maximum_mm=maximum_mm, samples=[])
        watched_before = None if watch_address is None else self.sample(watch_address)
        self.select(address)
        result['watched_axis_before'] = watched_before
        while time.monotonic() - start < 47:
            self.check_stop()
            s = self.sample(address, allow_home=True)
            clock = time.monotonic()
            if clock - last_sample > 0.65:
                raise RuntimeError('Encoder sampling gap exceeds bound')
            delta = ((s['encoder'] - last_encoder + 32768) % 65536) - 32768
            travel_deg += delta * 360 / 65536
            last_encoder, last_sample = s['encoder'], clock
            s.update(unwrapped_deg=travel_deg, elapsed_s=clock-start)
            result['samples'].append(s)
            if watch_address is not None:
                other = self.select(watch_address)
                watched_position = signed(other.query([0x36]), 10)
                if abs(watched_position - watched_before['position_deg']) > 3:
                    raise RuntimeError('Stationary arm was displaced during contact measurement')
                self.select(address)
                s['watched_axis_position_deg'] = watched_position
            if abs(travel_deg) > maximum_mm * DEG_PER_MM:
                raise RuntimeError('Homing exceeded travel bound')
            if s['home_flags'] & 8:
                raise RuntimeError('Firmware reports homing failure')
            if s['home_flags'] & 4:
                running = True
                stable = None
            elif running and abs(s['speed_rpm']) < 0.6:
                stable = stable or clock
                if clock - stable >= 0.3:
                    result.update(final=s, unwrapped_deg=travel_deg,
                        travel_mm=travel_deg / DEG_PER_MM, elapsed_s=clock-start,
                        observed_running=True)
                    self.active = None
                    self.report['home_active'] = False
                    print(json.dumps(dict(home_complete=address, travel_mm=result['travel_mm'], final=s)), flush=True)
                    return result
            else:
                stable = None
            if clock - last_print >= 4:
                print(json.dumps(dict(homing_address=address, travel_mm=round(travel_deg/DEG_PER_MM, 2),
                    speed_rpm=s['speed_rpm'], current_ma=s['phase_current_ma'])), flush=True)
                last_print = clock
            time.sleep(0.02)
        raise TimeoutError('Homing completion not verified')

    def zero_reference(self, address):
        m = self.select(address)
        if abs(self.sample(address)['speed_rpm']) > 0.6:
            raise RuntimeError('Cannot zero a moving axis')
        m.action([0x0A, 0x6D])
        s = self.sample(address)
        if abs(s['position_deg']) > 0.5:
            raise RuntimeError('Zero position was not verified')
        phase = (s['encoder'] * 360 / 65536 - s['position_deg']) % 360
        return dict(origin_encoder_deg=phase, reference_sample=s, zero_acknowledged=True)

    def verify_reference(self, address, item):
        sample = self.sample(address)
        if sample['motor_flags'] & 0x80:
            raise RuntimeError(f'Motor {address} reference invalidated or power cycled')
        phase = (sample['encoder'] * 360 / 65536 - sample['position_deg']) % 360
        error = abs((phase - item['origin']['origin_encoder_deg'] + 180) % 360 - 180)
        if error > 1:
            raise RuntimeError(f'Motor {address} coordinate reference differs by {error} degrees')
        return sample

    def origins(self):
        self.initialize()
        self.establish_origins((1, 2, 3, 4))

    def origins_y(self):
        previous_path = ROOT / '20261019_220711_origins_summary.json'
        previous = json.loads(previous_path.read_text(encoding='utf-8'))
        if previous.get('cleanup_errors') or set(previous['motors']) != {'1', '2'}:
            raise RuntimeError('Expected completed X origins with verified cleanup')
        self.initialize()
        self.report['x_origin_source'] = str(previous_path)
        for a in (1, 2):
            self.verify_reference(a, previous['motors'][str(a)])
            self.report['motors'][str(a)] = previous['motors'][str(a)]
        self.establish_origins((3, 4))

    def establish_origins(self, addresses):
        for address in addresses:
            axis = AXES[address]
            result = self.home(address, axis['home_direction'], 180 if address >= 3 else 90)
            reference = self.zero_reference(address)
            result2 = self.move_relative(address, axis['positive_mm_sign'] * 18)
            repeat = self.home(address, axis['home_direction'], 8)
            second_reference = self.zero_reference(address)
            error = abs((second_reference['origin_encoder_deg'] - reference['origin_encoder_deg'] + 180) % 360 - 180)
            if error > 2:
                raise RuntimeError(f'Motor {address} homing repeat differs by >2 degrees')
            park = self.move_relative(address, axis['positive_mm_sign'] * 18)
            self.select(address).action([0x50, 0])
            item = dict(**axis, address=address, home=result, repeat_home=repeat,
                intermediate_park=result2, origin=second_reference,
                homing_repeat_error_deg=error, homing_repeat_error_mm=error/DEG_PER_MM,
                parked_mm=2, park=park, mechanical_coordinate_valid=True)
            self.report['motors'][str(address)] = item
            save(self.path, self.report)
        self.report['coordinate_convention'] = dict(X='left-to-right', Y='front-to-back',
            local_x='inward distance from each outer homing release',
            local_y='distance backward from front homing release',
            homing_release_mm=5/DEG_PER_MM, mm_per_rev=MM_PER_REV)

    def load_origins(self):
        path = ROOT / 'origins_y_results.json'
        previous = json.loads(path.read_text(encoding='utf-8'))
        if not previous['passed'] or set(previous['motors']) != {'1', '2', '3', '4'}:
            raise RuntimeError('Complete origin verification is required')
        self.report['origin_source'] = str(path)
        self.report['axes'] = {a: dict(item) for a, item in previous['motors'].items()}
        for address in range(1, 5):
            self.verify_reference(address, previous['motors'][str(address)])
        return previous

    def return_to_reference(self, address, item, maximum_mm):
        result = self.home(address, item['home_direction'], maximum_mm)
        ref = self.zero_reference(address)
        error = abs((ref['origin_encoder_deg'] - item['origin']['origin_encoder_deg'] + 180) % 360 - 180)
        if error > 2:
            raise RuntimeError(f'Origin repeat after full travel differs by {error} degrees')
        self.select(address).action([0x50, 0])
        return result, ref, error

    def measure_limits(self):
        self.initialize()
        origins = self.load_origins()
        self.report['measurements'] = {}
        for address in (3, 4):
            item = origins['motors'][str(address)]
            start = self.verify_reference(address, item)
            far = self.home(address, 1 - item['home_direction'], 185)
            span = item['positive_mm_sign'] * (start['position_deg'] / DEG_PER_MM + far['travel_mm'])
            if not 70 <= span <= 180:
                raise RuntimeError(f'Unexpected Y {address} measured span: {span}')
            back, reference, error = self.return_to_reference(address, item, 185)
            reverse_span = abs(back['travel_mm'])
            if abs(span - reverse_span) > 1:
                raise RuntimeError('Y forward and return spans differ by more than one mm')
            park = self.move_relative(address, item['positive_mm_sign'] * 18)
            measurement = dict(far_home=far, return_home=back, span_mm=span,
                reverse_span_mm=reverse_span, origin_repeat_error_deg=error,
                origin=reference, soft_min_mm=2, soft_max_mm=min(span, reverse_span)-2,
                park=park)
            self.report['measurements'][str(address)] = measurement
            self.report['axes'][str(address)]['origin'] = reference
            save(self.path, self.report)
            print(json.dumps(dict(measured_address=address, span_mm=span,
                reverse_span_mm=reverse_span, soft_max_mm=measurement['soft_max_mm'])), flush=True)
        for address, other_address in ((1, 2), (2, 1)):
            item = origins['motors'][str(address)]
            start = self.verify_reference(address, item)
            other = self.verify_reference(other_address, self.report['axes'][str(other_address)])
            if not 1.5 < other['position_deg']/DEG_PER_MM < 2.5:
                raise RuntimeError('Other arm must be parked near its outer reference')
            passive = self.select(other_address)
            passive.action(bytes([0x45, 0x66, 0]) + U16(1500))
            if passive.config()[16:18] != U16(1500):
                raise RuntimeError('Stationary arm current cap not verified')
            try:
                far = self.home(address, 0, 235, watch_address=other_address)
            finally:
                self.select(other_address).action(bytes([0x45, 0x66, 0]) + U16(1000))
            local_far = start['position_deg']/DEG_PER_MM + far['travel_mm']
            sum_release = local_far + other['position_deg']/DEG_PER_MM
            if not 80 < sum_release < 230:
                raise RuntimeError(f'Unexpected combined X travel: {sum_release}')
            back, reference, error = self.return_to_reference(address, item, 235)
            park = self.move_relative(address, 18)
            measurement = dict(far_home=far, return_home=back, origin=reference,
                origin_repeat_error_deg=error, local_far_release_mm=local_far,
                other_arm_inward_mm=other['position_deg']/DEG_PER_MM,
                combined_inward_at_release_mm=sum_release, park=park)
            self.report['measurements'][str(address)] = measurement
            self.report['axes'][str(address)]['origin'] = reference
            save(self.path, self.report)
            print(json.dumps(dict(measured_address=address, combined_x_inward_mm=sum_release)), flush=True)
        x1 = self.report['measurements']['1']['combined_inward_at_release_mm']
        x2 = self.report['measurements']['2']['combined_inward_at_release_mm']
        if abs(x1-x2) > 1:
            raise RuntimeError('X contact measurements differ by more than one mm')
        self.report['joint_x_limit'] = dict(min_each_inward_mm=2,
            max_combined_inward_mm=min(x1, x2)-2,
            measured_release_sums_mm=[x1, x2], additional_clearance_mm=2,
            nominal_rail_length_mm=300, approximate_block_length_mm=45,
            nominal_free_length_mm=210,
            constraint='right_x_inward_mm + left_x_inward_mm <= max_combined_inward_mm')

    def restore_home(self, address):
        original = self.original[address]
        m = self.select(address)
        home = bytes.fromhex(original['home'])
        release = bytes.fromhex(original['release'])
        m.action(bytes([0x4C, 0xAE, 0]) + home[2:-1])
        m.action(bytes([0x5C, 0xAC, 0]) + release[2:-1])
        if m.consistent([0x22])[2:-1] != home[2:-1] or m.consistent([0x3F])[2:-1] != release[2:-1]:
            raise RuntimeError('Original homing parameters not restored')

    def verify_coordinates(self):
        from machine_control import local_mm, move_to
        source_path = ROOT / 'measure_limits_results.json'
        measured = json.loads(source_path.read_text(encoding='utf-8'))
        if not measured['passed']:
            raise RuntimeError('Verified measurements are required')
        coordinates = dict(valid=False, established_at_utc=now(), port='COM7', baud=115200,
            mm_per_rev=40, degrees_per_mm=9, coordinate_type='independent_carriage_reference',
            conventions=dict(X='each arm inward from its own outer homing release',
                Y='front to back from each front homing release',
                machine_x_positive='right', machine_y_positive='back',
                right_x_increasing_value_moves='left', left_x_increasing_value_moves='right'),
            common_probe_tip_frame_calibrated=False, external_position_accuracy_measured=False,
            home_release_mm=5/9, soft_margin_from_release_mm=2,
            homing_speed_rpm=10, ordinary_speed_rpm=5,
            joint_x_limit=dict(measured['joint_x_limit']), axes={},
            measurement_file=str(source_path), verification_file=str(self.path))
        joint = coordinates['joint_x_limit']
        joint['max_combined_inward_mm'] = math.floor(joint['max_combined_inward_mm']*10)/10
        for a in range(1, 5):
            measured_axis = measured['axes'][str(a)]
            measurement = measured['measurements'][str(a)]
            soft_max = joint['max_combined_inward_mm']-2 if a <= 2 else measurement['soft_max_mm']
            coordinates['axes'][str(a)] = dict(**AXES[a], address=a,
                origin=measurement['origin'], soft_min_mm=2,
                soft_max_mm=math.floor(soft_max*10)/10,
                measured_full_span_mm=measurement.get('span_mm'),
                origin_repeat_error_deg=measurement['origin_repeat_error_deg'])
        self.report['coordinates_candidate'] = coordinates
        self.initialize()
        for a in range(1, 5):
            s = self.verify_reference(a, coordinates['axes'][str(a)])
            start = local_mm(a, s)
            if not 1.8 < start < 2.2:
                raise RuntimeError('Expected all axes at their two mm park positions')
            outbound = move_to(self, coordinates, a, 12)
            inbound = move_to(self, coordinates, a, 2)
            self.report['motors'][str(a)] = dict(outbound=outbound, inbound=inbound)
            save(self.path, self.report)
            print(json.dumps(dict(verified_address=a, target_out_mm=12,
                measured_out_mm=outbound['final_mm'], target_back_mm=2,
                measured_back_mm=inbound['final_mm'])), flush=True)

    def rehome(self):
        path = ROOT / 'coordinates.json'
        coordinates = json.loads(path.read_text(encoding='utf-8'))
        if set(coordinates['axes']) != {'1', '2', '3', '4'}:
            raise RuntimeError('Expected saved four-axis calibration')
        save(ROOT / (datetime.now().strftime('%Y%m%d_%H%M%S') + '_coordinates_before_rehome.json'), coordinates)
        coordinates['valid'] = False
        save(path, coordinates)
        self.report['coordinates_candidate'] = coordinates
        self.initialize()
        for a in range(1, 5):
            item = coordinates['axes'][str(a)]
            home = self.home(a, item['home_direction'], 235 if a <= 2 else 185)
            ref = self.zero_reference(a)
            error = abs((ref['origin_encoder_deg'] - item['origin']['origin_encoder_deg'] + 180) % 360 - 180)
            if error > 2:
                raise RuntimeError(f'Motor {a} home changed by >2 degrees; remeasure limits')
            item['origin'] = ref
            park = self.move_relative(a, item['positive_mm_sign'] * 18)
            self.select(a).action([0x50, 0])
            self.report['motors'][str(a)] = dict(home=home, park=park, repeat_error_deg=error)
            save(self.path, self.report)
        coordinates['last_rehomed_at_utc'] = now()

    def probe(self):
        self.initialize()
        for address in (1, 2):
            m = self.select(address)
            m.action([0x50, 1])
            positive = self.move_relative(address, 9, expect_contact=True)
            item = dict(positive_probe=positive)
            if positive['outcome'] == 'reached':
                item['inward_sign'] = 1
            else:
                negative = self.move_relative(address, -9)
                item.update(negative_probe=negative, inward_sign=-1)
            self.report['motors'][str(address)] = item
            save(self.path, self.report)
            print(json.dumps(dict(address=address, inward_sign=item['inward_sign'],
                probe_result=positive['outcome'], final=self.sample(address))), flush=True)
        for address in (3, 4):
            result = self.move_relative(address, 9)
            self.report['motors'][str(address)] = dict(positive_probe=result, physical_direction='pending_user_observation')
            save(self.path, self.report)
            print(json.dumps(dict(address=address, positive_one_mm_probe=True, final=result['final'])), flush=True)

    def close(self):
        errors = []
        if self.active is not None:
            try:
                self.stop(self.active, abort_home=self.report.get('home_active', False))
            except Exception as exc:
                errors.append(f'Stop: {exc}')
        for a in sorted(self.started):
            try:
                m = self.select(a)
                s = self.sample(a)
                if abs(s['speed_rpm']) > 0.6:
                    self.stop(a)
                    s = self.sample(a)
                if abs(s['speed_rpm']) > 0.6:
                    raise RuntimeError('Standstill unverified; keep heartbeat')
                original = self.original[a]
                if a in self.home_touched:
                    self.restore_home(a)
                m.action(b'\x45\x66\x00' + U16(3000))
                try:
                    m.set_checksum(m.config(), 0)
                finally:
                    self.modes[a] = m.mode
                m.action(b'\x68\x38\x00' + bytes.fromhex(original['heartbeat'])[2:-1])
                if m.config()[4:-1] != bytes.fromhex(original['config'])[4:-1]:
                    raise RuntimeError('Original driver configuration not restored')
                self.report.setdefault('final', {})[str(a)] = self.sample(a)
            except Exception as exc:
                errors.append(f'Motor {a} cleanup: {exc}')
        self.motor.ser.close()
        self.journal.close()
        if errors:
            self.report['cleanup_errors'] = errors
        self.report['rejected_frames'] = self.motor.bad_frames
        self.report['finished_at_utc'] = now()
        self.report['passed'] = 'error' not in self.report and not errors
        if self.report['passed'] and 'coordinates_candidate' in self.report:
            coordinates = self.report['coordinates_candidate']
            coordinates['valid'] = True
            coordinates['last_verified_at_utc'] = now()
            coordinates['last_verification_file'] = str(self.path)
            coordinates['final_positions_mm'] = {
                a: AXES[int(a)]['positive_mm_sign'] * s['position_deg']/DEG_PER_MM
                for a, s in self.report.get('final', {}).items()}
            save(ROOT / 'coordinates.json', coordinates)
        save(self.path, self.report)
        if self.report['passed']:
            save(ROOT / (self.report['stage'] + '_results.json'), self.report)

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('stage', choices=['probe', 'observe50', 'origins', 'origins_y', 'measure_limits', 'verify_coordinates', 'rehome'])
    parser.add_argument('--execute', action='store_true')
    args = parser.parse_args()
    if not args.execute:
        print('No serial access. Use --execute only for the confirmed machine arrangement.')
        return 0
    session = Session(args.stage)
    try:
        getattr(session, args.stage)()
    except (Exception, KeyboardInterrupt) as exc:
        session.report['error'] = f'{type(exc).__name__}: {exc}'
        print(session.report['error'], flush=True)
    finally:
        session.close()
    print(json.dumps(dict(passed=session.report['passed'], summary_file=str(session.path),
        error=session.report.get('error'), cleanup_errors=session.report.get('cleanup_errors'))), flush=True)
    return 0 if session.report['passed'] else 1

if __name__ == '__main__':
    raise SystemExit(main())
