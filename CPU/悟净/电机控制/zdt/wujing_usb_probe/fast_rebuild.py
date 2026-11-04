"""通过同步镜像圆轨迹重建坐标。

    顺序为首次回零、平滑进入、两圈运动与平滑返回；支持其他分段轨迹。
    物理边界回零使用有限的10、20或25 RPM配置。"""
import argparse
import json
import math
from pathlib import Path
import signal
import sys
import time

from motorctl import Machine, USBMotor, MACHINE, HERE
from ch340_serial import CH340Serial, validate_packet, crc8
import coordinate_setup as core
from coordinate_setup import Session, AXES, U16, save
from synchronous_speed_trial import decode_system, position_packet, CAPS
from rebuild_startup import (validate_geometry, validate_release_packet,
                             verify_parameter_readback, establish_reference, bounded_home)
from parallel_homing import (bounded_parallel_home, abort_parallel_homing,
                             validate_cached_home_packet, restore_aborted_home_parameters,
                             settle_parallel_release)
from power_profile import validate_power_temperature, DEFAULT_PROFILE

SPEEDS = {1: 200, 2: 200, 3: 200, 4: 200}
ACCELS = {1: 1200, 2: 1200, 3: 2000, 4: 2000}
X_CENTER_MM = 80.0
PAIR_HEARTBEAT_MS = 150
PAIR_SPEED_BOUND_RPM = 220


def motion_corridor(axis, start, target):
    return (min(start - 0.3, max(axis['soft_min_mm'] - 0.3, min(start, target) - 1)),
            min(axis['soft_max_mm'] + 0.3, max(start, target) + 1))


def continuous_pair_envelope(coordinates, start, targets):

    for a, value in targets.items():
        axis = coordinates['axes'][str(a)]
        if not math.isfinite(value) or not axis['soft_min_mm'] <= value <= axis['soft_max_mm']:
            raise ValueError('Target outside calibrated soft limits')
    if not {1, 2} <= set(targets):
        raise ValueError('Continuous pair requires two X targets')
    d1, d2 = targets[1] - start[1], targets[2] - start[2]
    if d1*d2 >= 0 or abs(d1+d2) > 0.2:
        raise ValueError('Continuous X pair must translate equal distances in opposite local signs')
    speed = PAIR_SPEED_BOUND_RPM * 2 / 3
    braking_mm = speed*speed/(2*ACCELS[1]*2/3)
    stop_reserve = speed*PAIR_HEARTBEAT_MS/1000 + braking_mm + 5
    nominal_sum = max(start[1]+start[2],targets[1]+targets[2])
    if nominal_sum + stop_reserve > coordinates['joint_x_limit']['max_combined_inward_mm']:
        raise ValueError('Continuous pair lacks heartbeat/braking clearance')
    return dict(nominal_sum_mm=nominal_sum, stopping_reserve_mm=stop_reserve,
                heartbeat_ms=PAIR_HEARTBEAT_MS, speed_bound_rpm=PAIR_SPEED_BOUND_RPM,
                braking_distance_is_model=True)


def validate_fast_packet(packet, maximum_rpm=200):
    if len(packet) >= 3 and packet[0] == 0:
        body = packet[1:-1]
        if body not in (b'\xff\x66', b'\xfe\x98\x00'):
            raise ValueError('Only synchronization/stop broadcasts allowed')
        if packet[-1] not in (0x6B, crc8(packet[:-1])):
            raise ValueError('Invalid broadcast checksum')
        return
    if len(packet) >= 3 and packet[1] == 0xCD:
        a = packet[0]
        if a not in AXES or len(packet) != 18 or packet[2] not in (0, 1):
            raise ValueError('Malformed cached position command')
        if packet[-1] not in (0x6B, crc8(packet[:-1])):
            raise ValueError('Invalid position checksum')
        maximum = {1: 199.2, 2: 199.2, 3: 157.1, 4: 157.0}[a]
        mode_ok = (packet[13:15] == b'\x01\x01' or
                   a in (3,4) and packet[13:15] == b'\x01\x00')
        if (not mode_ok
                or not 0 < int.from_bytes(packet[7:9], 'big') <= maximum_rpm * 10
                or not 0 < int.from_bytes(packet[3:5], 'big') <= ACCELS[a]
                or not 0 < int.from_bytes(packet[5:7], 'big') <= ACCELS[a]
                or not 180 <= int.from_bytes(packet[9:13], 'big') <= round(maximum * 90)
                or not 0 < int.from_bytes(packet[15:17], 'big') <= CAPS[a]):
            raise ValueError('Position packet exceeds validated profile/soft limits')
        if packet[2] != (1 if a == 3 else 0):
            raise ValueError('Unexpected absolute coordinate sign')
        return
    validate_packet(packet)  # Retains no-flash/no-address/no-calibration guards.


def motion_time(distance, rpm, accel):
    velocity = rpm * 2 / 3
    acceleration = accel * 2 / 3
    return (2 * math.sqrt(distance / acceleration)
            if distance < velocity * velocity / acceleration
            else distance / velocity + velocity / acceleration)


def independent_envelope(coordinates, start, targets):
    for a, value in targets.items():
        item = coordinates['axes'][str(a)]
        wire = round(value * 90) / 90
        if not math.isfinite(value) or not (item['soft_min_mm'] <= wire <= item['soft_max_mm']):
            raise ValueError('Target outside calibrated soft limits')
    end = dict(start)
    end.update(targets)
    worst = max(start[1], end[1]) + max(start[2], end[2])
    if worst > coordinates['joint_x_limit']['max_combined_inward_mm'] - 10:
        raise ValueError('X segment unsafe if either motor independently stops')
    return worst


def immediate_y_packet(address, target):
    if address not in (3,4):
        raise ValueError('Only a Y relay follower may start without a broadcast')
    payload = bytearray(position_packet(address,target,SPEEDS[address],ACCELS[address]))
    payload[13] = 0
    return bytes(payload)


def relay_direction(start, targets, relay):
    leader,follower = relay['leader'],relay['follower']
    threshold = relay['trigger_mm']
    if ((leader,follower) != (3,4) or not {leader,follower} <= set(targets)
            or abs(targets[follower]-start[follower]) <= 0.08
            or not math.isfinite(threshold)
            or not min(start[leader],targets[leader])+5 < threshold < max(start[leader],targets[leader])-5):
        raise ValueError('Relay requires moving Y3/Y4 and an interior midpoint trigger')
    return 1 if targets[leader]>start[leader] else -1


def showcase_plan(coordinates):
    y3 = coordinates['axes']['3']['soft_max_mm']
    y4 = coordinates['axes']['4']['soft_max_mm']
    midpoint = (coordinates['axes']['3']['soft_min_mm']+y3)/2
    relay = dict(leader=3,follower=4,trigger_mm=midpoint)
    return [
        dict(name='center_and_y_outbound',targets={1:80,2:80,3:y3,4:y4}),
        dict(name='continuous_left_and_y_return',targets={1:158,2:2,3:2,4:2},continuous_pair=True),
        dict(name='continuous_right_with_y_relay',targets={1:2,2:158,3:y3,4:y4},continuous_pair=True,relay=relay),
        dict(name='outer_return_with_reverse_y_relay',targets={1:2,2:2,3:2,4:2},relay=relay),
        dict(name='diagonal_open',targets={1:60,2:60,3:120,4:40}),
        dict(name='diagonal_exchange',targets={1:35,2:85,3:40,4:120}),
        dict(name='all_return_to_park',targets={1:2,2:2,3:2,4:2}),
    ]


class FastMotor(USBMotor):
    def __init__(self, port, journal, motion_rpm=200):
        self.startup_release_axis = None
        self.homing_cache_axes = set()
        self.parallel_home_guard = None
        self.motion_rpm = motion_rpm
        super().__init__(port, journal, serial_factory=lambda p, event:
            CH340Serial(p, timeout=0.015, event=event, packet_validator=self.validate_packet))

    def validate_packet(self, packet):
        if len(packet) >= 4 and packet[1:4] == b'\x9a\x02\x01':
            validate_cached_home_packet(packet, self.homing_cache_axes, crc8)
            if self.parallel_home_guard is None:
                raise ValueError('Parallel homing guard is not armed')
            self.parallel_home_guard()
            self.homing_cache_axes.remove(packet[0])
            return
        if (len(packet) >= 3 and packet[0:3] == b'\x00\xff\x66'
                and self.parallel_home_guard is not None):
            self.parallel_home_guard()
        if len(packet) >= 2 and packet[1] == 0xCD and self.startup_release_axis is not None:
            validate_packet(packet)
            validate_release_packet(packet, self.startup_release_axis)
            return
        validate_fast_packet(packet, getattr(self, 'motion_rpm', 200))

    def query(self, payload):
        if bytes(payload) != b'\x43\x7a':
            return super().query(payload)
        for attempt in range(3):
            self.buffer.clear()
            self.pending.clear()
            self.ser.reset_input_buffer()
            self.send(payload)
            try:
                return self.receive(0x43, timeout=0.025)
            except TimeoutError:
                self.event(read_only_fast_retry=attempt + 1, command=0x43)
                if attempt == 2:
                    raise

    def action(self, payload, ack_timeout=0.2):
        self.send(payload)
        try:
            reply = self.receive(payload[0], ack_timeout)
        except TimeoutError:
            if not verify_parameter_readback(self, payload):
                raise
            time.sleep(0.1 if payload[0] in (0x4C,0x5C) else
                       0.02 if payload[0] in (0x45,0x68) else 0.003)
            return None
        if reply[2] != 2:
            raise RuntimeError('Action rejected: ' + reply.hex(' '))
        time.sleep(0.1 if payload[0] in (0x4C,0x5C) else
                   0.02 if payload[0] in (0x45,0x68) else 0.003)
        return reply


class FastRebuild(Session):
    def __init__(self, run_id, deadline=30.0, home_rpm=25, speed_boost=100,
                 circle_only=False):
        if type(home_rpm) is not int or home_rpm not in (10, 20, 25):
            raise ValueError('Homing speed must be 10, 20 or 25 RPM')
        if type(speed_boost) is not int or speed_boost not in (0, 100):
            raise ValueError('Speed boost must be 0 or 100 RPM')
        self.home_rpm, self.speed_boost = home_rpm, speed_boost
        self.motion_rpm = 200 + speed_boost
        self.time_scale = self.motion_rpm / 200.0
        self.stream_accel = 900 if speed_boost else 600
        self.circle_only = bool(circle_only)
        self.coordinates = json.loads((MACHINE/'coordinates.json').read_text())
        validate_geometry(self.coordinates)
        self.caps = {a: 3000 for a in AXES}
        self.refresh = {}
        self.last_sample = {}
        self.motion_start = None
        self.motion_end = None
        self.deadline = deadline
        self.moving = set()
        self.homing_pending = set()
        self.homing_active = set()
        self.parallel_abort_attempted = False
        self.allow_failed_home_preflight = False
        self.pair_guard = False
        self.label = 'prepare'
        self.run_id = run_id
        self.whole_start = time.monotonic()
        self.cold_start_begin = None
        self.cold_start_active = False
        super().__init__(run_id+'_fast_rebuild', port='usb://ch340',
            motor_factory=lambda p, j: FastMotor(p, j, self.motion_rpm))
        self.report.update(stages=[], groups=[], maximum_x_rpm=self.motion_rpm, maximum_y_rpm=self.motion_rpm,
                           supply_profile=dict(self.motor.supply_profile),
                           contact_rpm=home_rpm, speed_boost_rpm=speed_boost,
                           display_time_scale=self.time_scale,
                           motion_budget_s=deadline, continuous_pair_motion=True,
                           center_inward_each_mm=X_CENTER_MM, cold_start_budget_s=220.0,
                           motion_budget_scope='post_homing_trajectory')

    def check_stop(self):
        super().check_stop()
        if (self.cold_start_active and self.cold_start_begin is not None
                and time.monotonic()-self.cold_start_begin > 220):
            raise TimeoutError('Cold-start homing exceeded the bounded 220 second budget')
        if self.motion_start is not None and time.monotonic()-self.motion_start > self.deadline:
            raise TimeoutError('Motion exceeded the 30 second budget; stop and preserve evidence')

    def read_sample(self, address):
        for a in AXES:
            if time.monotonic()-self.refresh.get(a, 0) > (0.03 if self.pair_guard else 0.25):
                self.select(a).query([0x3A])
                self.refresh[a] = time.monotonic()
        m = self.select(address)
        sample = decode_system(m.query([0x43, 0x7A]))
        sample['position_mm'] = AXES[address]['positive_mm_sign']*sample['position_deg']/9
        sample['monotonic_s'] = time.monotonic()
        sample['sample_gap_s'] = (sample['monotonic_s']-self.last_sample[address]
                                  if address in self.last_sample else None)
        self.last_sample[address] = sample['monotonic_s']
        self.motor.event(stage=self.label, address=address, sample=sample)
        return sample

    def sample(self, address, allow_home=False):
        sample = self.read_sample(address)
        if (sample['home_flags'] & 3 != 3 or sample['home_flags'] & 0x30
                or sample['motor_flags'] & 8 or not sample['motor_flags'] & 1):
            raise RuntimeError('Axis not ready/protected: %s %s' % (address, sample))
        forbidden_home = 4 if self.allow_failed_home_preflight else 0x0C
        if not allow_home and sample['home_flags'] & forbidden_home:
            raise RuntimeError('Unexpected homing state')
        validate_power_temperature(sample, getattr(self.motor, 'supply_profile', DEFAULT_PROFILE))
        if sample['phase_current_ma'] > self.caps[address] + 150:
            raise RuntimeError('Axis outside current envelope: %s %s' % (address, sample))
        return sample

    def scan(self):
        return {a: self.sample(a) for a in AXES}

    def announce(self, label):
        self.label = label
        entry = dict(stage=label, elapsed_motion_s=None if self.motion_start is None
                     else time.monotonic()-self.motion_start)
        self.report['stages'].append(entry)
        print(json.dumps(entry), flush=True)

    def set_cap(self, address, cap):
        if self.caps[address] == cap and address in self.started:
            return
        self.select(address).action(b'\x45\x66\x00'+U16(cap))
        self.caps[address] = cap
        if self.select(address).config()[16:18] != U16(cap):
            raise RuntimeError('Temporary current cap not confirmed')

    def prepare(self):
        if not self.coordinates['valid']:
            raise RuntimeError('Legacy style requires a valid reference; use the default cold-start rebuild')
        self.initialize()
        self.caps = {a: 1000 for a in AXES}
        for a in AXES:
            compact = self.verify_reference(a, self.coordinates['axes'][str(a)])
            basic = self.select(a).snapshot(require_ready=True)
            if (abs(compact['voltage_v']-basic['voltage_v']) > 0.4
                    or abs(compact['encoder']-basic['encoder']) > 500
                    or compact['home_flags'] != basic['home_flags']):
                raise RuntimeError('Compact telemetry differs from proven individual reads')
            if not 1.5 <= compact['position_mm'] <= 3:
                raise RuntimeError('This first trial requires all axes at the verified 2 mm park')
        save(HERE/(self.run_id+'_coordinates_before.json'), self.coordinates)
        self.coordinates['valid'] = False
        self.report['coordinates_candidate'] = self.coordinates
        save(MACHINE/'coordinates.json', self.coordinates)
        self.report['preflight_reference_verified'] = True

    def prepare_cold_start(self):
        self.allow_failed_home_preflight = True
        try:
            establish_reference(self, save, MACHINE/'coordinates.json',
                                HERE/(self.run_id+'_coordinates_before.json'), core.now)
        finally:
            self.allow_failed_home_preflight = False

    def release_to_park(self, address):
        self.motor.startup_release_axis = address
        try:
            return self.move_relative(address, AXES[address]['positive_mm_sign'] * 18)
        finally:
            self.motor.startup_release_axis = None

    def home(self, address, direction, maximum_mm, watch_address=None):
        return bounded_home(self, address, direction, maximum_mm, self.home_rpm, watch_address)

    def home_all(self):
        return bounded_parallel_home(self, self.home_rpm,
                                     save_report=lambda: save(self.path, self.report))

    def settle_home_release(self):
        self.announce('parallel_homes_settling_before_zero')
        settle_parallel_release(self)

    def latch_parallel_stop(self, reason):
        try:
            handle = core.STOP_FILE.open('x', encoding='utf-8')
        except FileExistsError:
            return
        with handle:
            handle.write('Parallel homing aborted: %s\n' % reason)

    def run_home_only(self):
        self.report.update(style='homing_only', circle_stream_frames=0)
        self.prepare_cold_start()
        self.motion_end = time.monotonic()
        self.report.update(motion_completed=True,
            motion_elapsed_s=self.motion_end-self.cold_start_begin,
            positions_mm=self.report['cold_start_positions_mm'])

    def home_near(self, a):
        self.check_stop()
        self.set_cap(a, 1000)
        initial = self.sample(a)
        if not -0.4 <= initial['position_mm'] <= 8:
            raise RuntimeError('Final contact homing must start within 8 mm of outer/front origin')
        result = self.home(a, AXES[a]['home_direction'], 10)
        reference = self.zero_reference(a)
        old = self.coordinates['axes'][str(a)]['origin']['origin_encoder_deg']
        error = abs((reference['origin_encoder_deg']-old+180)%360-180)
        if error > 2:
            raise RuntimeError('Origin shifted by >2 degrees; full geometry needs remeasurement')
        self.coordinates['axes'][str(a)]['origin'] = reference
        self.select(a).action([0x50, 0])
        self.report.setdefault('homes', []).append(dict(address=a, stage=self.label,
            elapsed_s=result['elapsed_s'], travel_mm=result['travel_mm'], repeat_error_deg=error))
        return result

    def pair_heartbeat(self, milliseconds):
        for a in (1, 2):
            self.select(a).action(b'\x68\x38\x00'+core.U32(milliseconds))
            if self.select(a).query([0x16])[2:-1] != core.U32(milliseconds):
                raise RuntimeError('Pair heartbeat not confirmed')
        for a in (1, 2):
            self.select(a).query([0x3A])
            self.refresh[a] = time.monotonic()

    def group(self, requested, name, continuous_pair=False, relay=None):
        self.check_stop()
        before = self.scan()
        start = {a:s['position_mm'] for a,s in before.items()}
        targets = {a:round(v*90)/90 for a,v in requested.items()}
        envelope = (continuous_pair_envelope(self.coordinates,start,targets) if continuous_pair
                    else dict(independent_x_envelope_mm=independent_envelope(self.coordinates,start,targets)))
        moving = {a for a,v in targets.items() if abs(v-start[a]) > 0.08}
        if not moving:
            return
        direction = relay_direction(start,targets,relay) if relay else None
        follower = relay['follower'] if relay else None
        if any(abs(s['speed_rpm']) > 0.8 or s['motor_flags'] & 0x80 for s in before.values()):
            raise RuntimeError('Group needs stationary axes with established references')
        for a in moving:
            self.set_cap(a, CAPS[a])
        expected = max(motion_time(abs(targets[a]-start[a]), SPEEDS[a], ACCELS[a]) for a in moving)
        if relay:
            leader = relay['leader']
            expected = max(expected,
                motion_time(abs(relay['trigger_mm']-start[leader]),SPEEDS[leader],ACCELS[leader])
                + motion_time(abs(targets[follower]-start[follower]),SPEEDS[follower],ACCELS[follower]))
        entry = dict(name=name, start_mm=start, targets_mm=targets, expected_s=expected,
                     envelope=envelope, continuous_pair=continuous_pair,
                     peak_rpm={a:0 for a in moving}, passed=False)
        self.report['groups'].append(entry)
        if relay:
            entry['relay'] = dict(relay,direction=direction,triggered=False)
        self.moving = set(moving)
        if continuous_pair:
            self.pair_guard = True
            self.pair_heartbeat(PAIR_HEARTBEAT_MS)
        for a in sorted(moving-{follower}):
            self.select(a).action(position_packet(a, targets[a], SPEEDS[a], ACCELS[a]))
            if continuous_pair:
                self.sample(a)
        cached = self.scan()
        if any(abs(s['speed_rpm']) > 2.0 or abs(s['position_mm']-start[a]) > 0.15
               for a,s in cached.items()):
            raise RuntimeError('Unexpected motion before synchronization')
        self.last_sample.clear()
        clock = time.monotonic()
        self.select(min(moving)).send([0xFF,0x66],address=0)
        stable = None
        while time.monotonic()-clock < expected+1.3:
            self.check_stop()
            current = self.scan()
            if current[1]['position_mm']+current[2]['position_mm'] > self.coordinates['joint_x_limit']['max_combined_inward_mm']-5:
                raise RuntimeError('Live X clearance reduced below reserve')
            for a,s in current.items():
                goal = targets.get(a,start[a])
                if s['sample_gap_s'] is not None and s['sample_gap_s'] > (0.12 if continuous_pair else 0.35):
                    raise RuntimeError('Motion telemetry gap exceeded bound')
                low,high = motion_corridor(self.coordinates['axes'][str(a)],start[a],goal)
                if not low <= s['position_mm'] <= high:
                    raise RuntimeError('Axis %s left corridor [%.3f, %.3f]: %.3f mm'%(a,low,high,s['position_mm']))
                if continuous_pair and a in (1,2) and abs(s['speed_rpm']) > PAIR_SPEED_BOUND_RPM:
                    raise RuntimeError('Continuous pair exceeded guarded speed')
                if a in moving:
                    entry['peak_rpm'][a] = max(entry['peak_rpm'][a],abs(s['speed_rpm']))
            if relay and not entry['relay']['triggered']:
                if (abs(current[follower]['position_mm']-start[follower]) > 0.15
                        or abs(current[follower]['speed_rpm']) > 2):
                    raise RuntimeError('Relay follower moved before the midpoint trigger')
                leader_mm = current[relay['leader']]['position_mm']
                if direction*(leader_mm-relay['trigger_mm']) >= 0:
                    event=dict(leader_position_mm=leader_mm,trigger_elapsed_s=time.monotonic()-clock,
                               follower_before_mm=current[follower]['position_mm'])
                    entry['relay'].update(triggered=True,**event)
                    self.select(follower).action(immediate_y_packet(follower,targets[follower]))
                    self.motor.event(relay_start=dict(name=name,**entry['relay']))
                    print(json.dumps(dict(relay_started=name,**event)),flush=True)
            done = all(abs(current[a]['position_mm']-targets[a]) <= 0.12
                       and abs(current[a]['speed_rpm']) < 0.6 and current[a]['motor_flags'] & 2
                       for a in moving)
            if relay:
                done = done and entry['relay']['triggered']
            if done:
                stable = stable or time.monotonic()
                if time.monotonic()-stable > 0.035:
                    entry.update(passed=True, elapsed_s=time.monotonic()-clock,
                        final_mm={a:s['position_mm'] for a,s in current.items()})
                    self.moving.clear()
                    if continuous_pair:
                        self.pair_heartbeat(1000)
                        self.pair_guard = False
                    return
            else:
                stable = None
        raise TimeoutError('Synchronized leg did not settle')

    def shift(self, left, return_y=False):
        start_samples = self.scan()
        start = {a:s['position_mm'] for a,s in start_samples.items()}
        # Preserve the pair's current spacing, including encoder quantization.
        combined = start[1]+start[2]
        target = {1:combined-2,2:2.0} if left else {1:2.0,2:combined-2}
        if return_y:
            target.update({3:2.0,4:2.0})
        self.group(target,'continuous_pair_'+('left' if left else 'right'),continuous_pair=True)

    def run_classic(self):
        self.prepare()
        self.motion_start = time.monotonic()
        self.announce('initial_outer_and_front_homes')
        for a in AXES:
            self.home_near(a)
        self.group({a:2.0 for a in AXES},'initial_park')
        self.announce('x_toward_center_and_y_outbound')
        self.group({1:X_CENTER_MM,2:X_CENTER_MM,
                    3:self.coordinates['axes']['3']['soft_max_mm'],
                    4:self.coordinates['axes']['4']['soft_max_mm']},'center_y_far')
        self.announce('pair_left_and_y_return')
        self.shift(True,return_y=True)
        self.announce('find_left_outer_boundary')
        self.home_near(2)
        self.group({2:2.0},'park_left')
        self.announce('pair_right')
        self.shift(False)
        self.announce('find_right_outer_boundary')
        self.home_near(1)
        self.group({1:2.0},'park_right')
        self.announce('left_arm_returns_to_outer_right_arm_holds')
        self.group({2:2.0},'final_outer_park')
        final = {a:self.verify_reference(a,self.coordinates['axes'][str(a)]) for a in AXES}
        if any(abs(s['position_mm']-2) > 0.2 or abs(s['speed_rpm']) > 0.6 for s in final.values()):
            raise RuntimeError('Final outer/front park not confirmed')
        self.motion_end = time.monotonic()
        self.report.update(motion_elapsed_s=self.motion_end-self.motion_start,
            positions_mm={a:s['position_mm'] for a,s in final.items()},
            motion_completed=True, x_outer_boundaries_touched=True,
            y_round_trip_to_calibrated_soft_limits=True,
            full_travel_limits_remeasured=False)
        self.coordinates['last_rehomed_at_utc'] = core.now()

    def run_showcase(self):
        self.report.update(style='relay_showcase',endstop_homing_passes=1,
                           repeated_endstop_contacts=False)
        self.prepare()
        plan = showcase_plan(self.coordinates)
        current = {a:2.0 for a in AXES}
        for step in plan:
            targets = step['targets']
            if step.get('continuous_pair'):
                continuous_pair_envelope(self.coordinates,current,targets)
            else:
                independent_envelope(self.coordinates,current,targets)
            if step.get('relay'):
                relay_direction(current,targets,step['relay'])
            current.update(targets)
        self.report['showcase_plan'] = plan
        self.motion_start = time.monotonic()
        self.announce('single_initial_outer_and_front_homing_pass')
        for a in AXES:
            self.home_near(a)
        self.group({a:2.0 for a in AXES},'initial_park')
        for step in plan:
            self.announce(step['name'])
            self.group(step['targets'],step['name'],
                       continuous_pair=step.get('continuous_pair',False),relay=step.get('relay'))
        final = {a:self.verify_reference(a,self.coordinates['axes'][str(a)]) for a in AXES}
        if any(abs(s['position_mm']-2)>0.2 or abs(s['speed_rpm'])>0.6 for s in final.values()):
            raise RuntimeError('Showcase final outer/front park not confirmed')
        self.motion_end = time.monotonic()
        self.report.update(motion_elapsed_s=self.motion_end-self.motion_start,
            positions_mm={a:s['position_mm'] for a,s in final.items()},motion_completed=True,
            x_outer_boundaries_touched=True,y_round_trip_to_calibrated_soft_limits=True,
            full_travel_limits_remeasured=False)
        self.coordinates['last_rehomed_at_utc'] = core.now()

    def run(self):
        from circle_motion import run_circle
        run_circle(self)

    def close(self):
        if self.homing_pending:
            abort_parallel_homing(self)
        if self.motion_start is not None and self.motion_end is None:
            self.motion_end = time.monotonic()
        if self.moving or self.active is not None:
            try:
                self.select(1).send([0xFE,0x98,0],address=0)
            except Exception as exc:
                self.report.setdefault('stop_errors',[]).append(str(exc))
            for a in AXES:
                try:
                    self.stop(a,abort_home=(a==self.active and self.report.get('home_active',False)))
                except Exception as exc:
                    self.report.setdefault('stop_errors',[]).append('%s: %s'%(a,exc))
        if self.report.get('stop_errors'):
            self.report.setdefault('error', 'Stopping was not fully verified')
        if self.report.get('parallel_homing', {}).get('abort_requested'):
            self.label = 'parallel_home_abort_cleanup'
            try:
                restore_aborted_home_parameters(self)
            finally:
                try:
                    self.motor.ser.close()
                finally:
                    self.journal.close()
            self.report.update(passed=False, finished_at_utc=core.now(),
                               rejected_frames=self.motor.bad_frames)
            save(self.path, self.report)
        else:
            super().close()
        self.report['total_elapsed_s'] = time.monotonic()-self.whole_start
        if self.motion_start is not None and 'motion_elapsed_s' not in self.report:
            self.report['motion_elapsed_s'] = self.motion_end-self.motion_start
        if self.cold_start_begin is not None:
            self.report['overall_motion_elapsed_s'] = (
                self.motion_end if self.motion_end is not None else time.monotonic()) - self.cold_start_begin
        save(self.path,self.report)
        save(HERE/(self.run_id+'_result.json'),self.report)


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--execute',action='store_true')
    parser.add_argument('--run-id',default='fast_rebuild')
    parser.add_argument('--controller-time')
    styles=parser.add_mutually_exclusive_group()
    styles.add_argument('--classic',action='store_true',help='Use the previously validated repeated-contact sequence')
    styles.add_argument('--showcase',action='store_true',help='Use the previous midpoint-relay showcase')
    styles.add_argument('--circle-only',action='store_true',help='Use valid references and draw without contact homing')
    styles.add_argument('--home-only',action='store_true',help='Establish references without drawing')
    parser.add_argument('--home-rpm',type=int,choices=(10,20,25),default=25)
    parser.add_argument('--speed-boost',type=int,choices=(0,100),default=100)
    args=parser.parse_args()
    if not args.execute:
        style=('classic boundary sweep' if args.classic else 'midpoint relays and diagonal poses'
               if args.showcase else 'cold-start bounded homing from any in-range stop, '
               'continuous entry, two mirrored 80 mm circles, smooth return')
        if args.circle_only:style='verify existing reference and park; draw without contact homing'
        if args.home_only:style='bounded cold-start homing only'
        print('No USB access. Plan: '+style+'. Homing %s RPM; display boost +%s RPM, ceiling %s RPM.'
              %(args.home_rpm,args.speed_boost,200+args.speed_boost))
        return 0
    Machine(args.run_id,args.controller_time)
    signal.signal(signal.SIGTERM,lambda *unused: (_ for _ in ()).throw(KeyboardInterrupt('Stop requested')))
    session=FastRebuild(args.run_id,home_rpm=args.home_rpm,
                        speed_boost=args.speed_boost,circle_only=args.circle_only)
    try:
        if args.home_only:
            session.run_home_only()
        elif args.classic:
            session.run_classic()
        elif args.showcase:
            session.run_showcase()
        else:
            session.run()
    except BaseException as exc:
        session.report['error']='%s: %s'%(type(exc).__name__,exc)
        print(json.dumps({'error':session.report['error'],'stage':session.label}),flush=True)
    finally:
        session.close()
    print(json.dumps({k:session.report.get(k) for k in ('passed','motion_completed','motion_elapsed_s',
        'total_elapsed_s','positions_mm','error','cleanup_errors','summary_file','rejected_frames')},indent=2),flush=True)
    return 0 if session.report['passed'] else 1


if __name__=='__main__':
    raise SystemExit(main())
