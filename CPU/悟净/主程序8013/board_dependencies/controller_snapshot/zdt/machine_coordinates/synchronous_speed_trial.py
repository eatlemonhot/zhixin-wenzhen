"""四轴同步速度测试。

    缓存四轴位置命令后，通过CRC-8广播同步启动。
    X轴使用矩形运动包络；Y轴采用200 RPM，并与X轴梯形运动时长匹配。
    串口在显式执行时打开。"""
import argparse
import csv
import json
import math
import time

from coordinate_setup import (Session, CoordinateMotor, AXES, ROOT, U16, U32,
                              DEG_PER_MM, now, save, setup_motor2)
from machine_control import load_coordinates, local_mm

setup_motor2.LENGTHS.update({0x43: 37, 0xFF: 4})
STAGES = ((150, 750), (200, 1200), (250, 1600), (300, 2200), (350, 1800),
          (400, 1800))
Y_RPM = 200
Y_ACCEL = 2000
CAPS = {1: 3000, 2: 3000, 3: 1500, 4: 1500}


def decode_system(reply):
    if len(reply) != 37 or reply[1:4] != bytes([0x43, 37, 12]):
        raise RuntimeError('Unexpected X system status layout')
    def sig(index, count, scale=1):
        if reply[index] not in (0, 1):
            raise RuntimeError('Invalid system status sign')
        return (-1 if reply[index] else 1) * int.from_bytes(
            reply[index + 1:index + 1 + count], 'big') / scale
    return dict(voltage_v=int.from_bytes(reply[4:6], 'big') / 1000,
                bus_current_ma=int.from_bytes(reply[6:8], 'big'),
                phase_current_ma=int.from_bytes(reply[8:10], 'big'),
                raw_encoder=int.from_bytes(reply[10:12], 'big'),
                encoder=int.from_bytes(reply[12:14], 'big'),
                target_deg=sig(14, 4, 10), speed_rpm=sig(19, 2, 10),
                position_deg=sig(22, 4, 10), position_error_deg=sig(27, 4, 100),
                temperature_c=sig(32, 1), home_flags=reply[34], motor_flags=reply[35])


def profile_time(distance_mm, rpm, acceleration):
    if min(distance_mm, rpm, acceleration) <= 0:
        raise ValueError('Positive distance, speed and acceleration required')
    if distance_mm < rpm * rpm / (1.5 * acceleration):
        raise ValueError('Stroke cannot attain the requested RPM')
    return distance_mm / (rpm * 2 / 3) + rpm / acceleration


def stage_plan(rpm, acceleration):
    duration = profile_time(80, rpm, acceleration)
    if duration < 2 * Y_RPM / Y_ACCEL:
        raise ValueError('Y cannot reach 200 RPM in this duration')
    y_stroke = Y_RPM * 2 / 3 * (duration - Y_RPM / Y_ACCEL)
    if not 15 <= y_stroke <= 135:
        raise ValueError('Y stroke outside the trial envelope')
    high_y = round((10 + y_stroke) * 90) / 90
    return dict(x_rpm=rpm, x_acceleration_rpm_s=acceleration,
                y_rpm=Y_RPM, y_acceleration_rpm_s=Y_ACCEL,
                expected_motion_s=duration, low_mm={str(a): 10 for a in AXES},
                high_mm={'1': 90, '2': 90, '3': high_y, '4': high_y},
                x_stroke_mm=80, y_stroke_mm=high_y - 10)


def group_bounds(coordinates, start, targets):
    if set(targets) != {str(a) for a in AXES}:
        raise ValueError('All four axes must receive a target')
    for a in AXES:
        key = str(a)
        axis = coordinates['axes'][key]
        value = targets[key]
        if isinstance(value, bool) or not isinstance(value, (int, float)) or not math.isfinite(value):
            raise ValueError('Targets must be finite numbers')
        wire = round(value * 90) / 90
        if not (axis['soft_min_mm'] <= value <= axis['soft_max_mm']
                and axis['soft_min_mm'] <= wire <= axis['soft_max_mm']):
            raise ValueError('Target violates calibrated soft limit')
        if abs(start[key] - value) < 0.2:
            raise ValueError('Every axis must have a nonzero simultaneous move')
    worst_sum = max(start['1'], targets['1']) + max(start['2'], targets['2'])
    if worst_sum > coordinates['joint_x_limit']['max_combined_inward_mm'] - 10:
        raise ValueError('Independent X trajectories lack 10 mm extra clearance')
    return worst_sum


def position_packet(address, mm, rpm, acceleration):
    if (address not in AXES or not math.isfinite(mm) or not 2 <= mm <= 199.2
            or not math.isfinite(rpm) or not 0 < rpm <= 400
            or not math.isfinite(acceleration) or not 1 <= acceleration <= 3500):
        raise ValueError('运动指令超出配置的边界范围。')
    degrees = AXES[address]['positive_mm_sign'] * mm * DEG_PER_MM
    return (bytes([0xCD, int(degrees < 0)]) + U16(round(acceleration)) * 2
            + U16(round(rpm * 10)) + U32(round(abs(degrees) * 10))
            + bytes([1, 1]) + U16(CAPS[address]))


class SyncMotor(CoordinateMotor):
    def action(self, payload, ack_timeout=0.20):
        self.send(payload)
        reply = self.receive(payload[0], ack_timeout)
        if reply[2] != 2:
            raise RuntimeError(f'Action rejected: {reply.hex(" ")}')
        time.sleep(0.003)
        return reply


class SyncTrial(Session):
    def __init__(self, coordinates, maximum_rpm, cycles, label='synchronous_speed'):
        super().__init__(label)
        self.motor.__class__ = SyncMotor
        self.motor.ser.timeout = 0.015
        self.coordinates = coordinates
        self.armed = set()
        self.last_times = {}
        self.last_refresh = {}
        self.last_voltage_check = {}
        self.telemetry_path = self.path.with_name(self.path.stem.replace('_summary', '_telemetry') + '.csv')
        self.telemetry = self.telemetry_path.open('x', encoding='utf-8', newline='')
        self.writer = csv.DictWriter(self.telemetry, fieldnames=[
            'time_utc', 'monotonic_s', 'leg', 'address', 'position_mm',
            'speed_rpm', 'phase_current_ma', 'bus_current_ma', 'voltage_v',
            'temperature_c', 'motor_flags', 'home_flags', 'sample_gap_s'])
        self.writer.writeheader()
        self.report.update(telemetry_csv=str(self.telemetry_path), legs=[], completed_stages=[],
            maximum_requested_x_rpm=maximum_rpm, round_trips_per_stage=cycles,
            current_caps_ma=CAPS, nominal_supply_v=12,
            sampled_phase_current_peak_only=True,
            bus_current_is_driver_estimate=True, default_profile_modified=False,
            synchronous_trigger='cached CD commands followed by one CRC8 00 FF 66 broadcast')
        self.label = 'initialization'

    def sample(self, address, allow_home=False):
        motor = self.select(address)
        if time.monotonic() - self.last_refresh.get(address, 0) >= 0.15:
            motor.query([0x3A])
            self.last_refresh[address] = time.monotonic()
        s = decode_system(motor.query([0x43, 0x7A]))
        if time.monotonic() - self.last_voltage_check.get(address, 0) >= 0.15:
            voltage = int.from_bytes(motor.query([0x24])[2:4], 'big') / 1000
            self.last_voltage_check[address] = time.monotonic()
            s['independent_voltage_v'] = voltage
        clock = time.monotonic()
        gap = None if address not in self.last_times else clock - self.last_times[address]
        self.last_times[address] = clock
        s.update(time_utc=now(), monotonic_s=clock, sample_gap_s=gap,
                 position_mm=local_mm(address, s), address=address)
        self.motor.event(leg=self.label, sample=s)
        self.writer.writerow(dict(time_utc=s['time_utc'], monotonic_s=clock,
            leg=self.label, address=address, position_mm=s['position_mm'],
            **{k: s[k] for k in ('speed_rpm', 'phase_current_ma', 'bus_current_ma',
                'voltage_v', 'temperature_c', 'motor_flags', 'home_flags', 'sample_gap_s')}))
        self.telemetry.flush()
        if s['home_flags'] != 3 or s['motor_flags'] & 0x8C or not s['motor_flags'] & 1:
            raise RuntimeError(f'Motor {address} not ready or reference lost: {s}')
        if not 10.5 <= s['voltage_v'] <= 13.5 or not -20 <= s['temperature_c'] < 60:
            raise RuntimeError(f'Motor {address} supply/temperature outside test range: {s}')
        if 'independent_voltage_v' in s and not 10.5 <= s['independent_voltage_v'] <= 13.5:
            raise RuntimeError(f'Motor {address} independent voltage query outside range: {s}')
        cap = CAPS[address] if address in self.started else 3000
        if not 0 <= s['phase_current_ma'] <= cap + 100:
            raise RuntimeError(f'Motor {address} exceeded current envelope: {s}')
        return s

    def prepare(self):
        self.initialize()
        for a in AXES:
            self.verify_reference(a, self.coordinates['axes'][str(a)])
            m = self.select(a)
            full = self.sample(a)
            basic = m.snapshot()
            if (abs(full['voltage_v'] - basic['voltage_v']) > 0.4
                    or abs(full['encoder'] - basic['encoder']) > 500
                    or abs(full['speed_rpm'] - basic['speed_rpm']) > 1
                    or full['home_flags'] != basic['home_flags']):
                raise RuntimeError('Full system reply disagrees with individual queries')
            m.action(bytes([0x45, 0x66, 0]) + U16(CAPS[a]))
            if m.config()[16:18] != U16(CAPS[a]):
                raise RuntimeError('Trial current limit not verified')
        self.report['compact_telemetry_cross_checked'] = True
        self.last_times.clear()

    def stop_all(self):
        errors = []
        m = self.select(1)
        try:
            m.send([0xFE, 0x98, 0], address=0)
            if m.receive(0xFE, timeout=0.15)[2] != 2:
                raise RuntimeError('Broadcast stop rejected')
        except Exception as exc:
            errors.append(str(exc))
        for a in AXES:
            try:
                self.stop(a)
            except Exception as exc:
                errors.append(f'{a}: {exc}')
        self.armed.clear()
        if errors:
            self.report.setdefault('stop_ack_errors', []).extend(errors)

    def group_move(self, targets, speeds, accelerations, label, validate_speed=True):
        self.label = label
        before = {str(a): self.verify_reference(a, self.coordinates['axes'][str(a)]) for a in AXES}
        start = {a: s['position_mm'] for a, s in before.items()}
        if any(abs(s['speed_rpm']) > 0.8 for s in before.values()):
            raise RuntimeError('Group move requires standstill')
        worst_sum = group_bounds(self.coordinates, start, targets)
        expected = max(profile_time(abs(targets[str(a)] - start[str(a)]), speeds[a],
                                     accelerations[a]) for a in AXES)
        entry = dict(label=label, target_mm=targets, before=before,
            requested_rpm=speeds, acceleration_rpm_s=accelerations,
            expected_motion_s=expected, worst_independent_x_sum_mm=worst_sum,
            passed=False, samples={str(a): [] for a in AXES})
        self.report['legs'].append(entry)
        for a in AXES:
            self.check_stop()
            self.armed.add(a)
            self.select(a).action(position_packet(a, targets[str(a)], speeds[a], accelerations[a]))
        cached = {str(a): self.sample(a) for a in AXES}
        if any(abs(s['speed_rpm']) > 0.8 or abs(s['position_mm'] - start[a]) > 0.1
               for a, s in cached.items()):
            raise RuntimeError('Motion occurred before synchronous broadcast')
        self.last_times.clear()
        m = self.select(1)
        started = time.monotonic()
        m.send([0xFF, 0x66], address=0)
        ack = m.receive(0xFF, timeout=0.15)
        if ack[2] != 2:
            raise RuntimeError('Synchronous broadcast rejected')
        entry['broadcast_ack'] = ack.hex(' ')
        entry['started_monotonic_s'] = started
        stable = None
        saw_all_moving = False
        while time.monotonic() - started < expected + 3:
            self.check_stop()
            scan = {}
            for a in AXES:
                s = self.sample(a)
                entry['samples'][str(a)].append(s)
                scan[str(a)] = s
                if s['sample_gap_s'] is not None and s['sample_gap_s'] > 0.35:
                    raise RuntimeError('Telemetry gap exceeds concurrent-motion bound')
                axis = self.coordinates['axes'][str(a)]
                if (s['position_mm'] < max(axis['soft_min_mm'] - 0.3, min(start[str(a)], targets[str(a)]) - 1)
                        or s['position_mm'] > min(axis['soft_max_mm'] + 0.3, max(start[str(a)], targets[str(a)]) + 1)):
                    raise RuntimeError(f'Motor {a} exceeded motion corridor')
                if abs(s['speed_rpm']) > max(speeds[a] * 1.2, speeds[a] + 15):
                    raise RuntimeError(f'Motor {a} excessive speed')
            if scan['1']['position_mm'] + scan['2']['position_mm'] > self.coordinates['joint_x_limit']['max_combined_inward_mm']:
                raise RuntimeError('Measured joint X clearance violated')
            if all(abs(s['speed_rpm']) > 5 for s in scan.values()):
                saw_all_moving = True
            reached = all(abs(scan[str(a)]['position_mm'] - targets[str(a)]) <= 0.10
                          and abs(scan[str(a)]['speed_rpm']) <= 0.8 for a in AXES)
            clock = time.monotonic()
            if reached:
                stable = stable or clock
                if clock - stable >= 0.12:
                    break
            else:
                stable = None
        else:
            raise TimeoutError('Synchronous group failed to settle')
        entry['elapsed_including_settle_s'] = time.monotonic() - started
        entry['all_four_moving_in_same_scan'] = saw_all_moving
        entry['metrics'] = {}
        for a in AXES:
            samples = entry['samples'][str(a)]
            final = samples[-1]
            gaps = [s['sample_gap_s'] for s in samples if s['sample_gap_s'] is not None]
            moving = [s for s in samples if abs(s['speed_rpm']) > speeds[a] * 0.1]
            peaks = dict(sample_count=len(samples), moving_sample_count=len(moving),
                peak_rpm=max(abs(s['speed_rpm']) for s in samples),
                peak_phase_current_ma=max(s['phase_current_ma'] for s in samples),
                peak_bus_current_ma=max(s['bus_current_ma'] for s in samples),
                minimum_voltage_v=min(s['voltage_v'] for s in samples),
                maximum_temperature_c=max(s['temperature_c'] for s in samples),
                final_error_mm=final['position_mm'] - targets[str(a)],
                mean_sample_interval_s=sum(gaps) / len(gaps) if gaps else None,
                maximum_sample_interval_s=max(gaps) if gaps else None,
                final=final)
            entry['metrics'][str(a)] = peaks
            if validate_speed and peaks['peak_rpm'] < speeds[a] * 0.95:
                raise RuntimeError(f'Motor {a} did not verify commanded speed: {peaks["peak_rpm"]}')
        if not saw_all_moving:
            raise RuntimeError('No telemetry scan observed all four moving')
        entry['passed'] = True
        self.armed.clear()
        save(self.path, self.report)
        print(json.dumps(dict(leg=label, passed=True,
            rpm={a: v['peak_rpm'] for a, v in entry['metrics'].items()},
            peak_phase_ma={a: v['peak_phase_current_ma'] for a, v in entry['metrics'].items()})), flush=True)
        return entry

    def run(self, maximum_rpm, cycles, minimum_rpm=150):
        self.prepare()
        initial = {str(a): self.sample(a)['position_mm'] for a in AXES}
        self.report['initial_positions_mm'] = initial
        if not all(abs(mm - 10) <= 0.10 for mm in initial.values()):
            self.group_move({str(a): 10 for a in AXES}, {a: 30 for a in AXES},
                            {a: 100 for a in AXES}, 'concurrent_positioning', False)
        for rpm, acceleration in STAGES:
            if rpm > maximum_rpm:
                break
            if rpm < minimum_rpm:
                continue
            plan = stage_plan(rpm, acceleration)
            speeds = {1: rpm, 2: rpm, 3: Y_RPM, 4: Y_RPM}
            accels = {1: acceleration, 2: acceleration, 3: Y_ACCEL, 4: Y_ACCEL}
            for index in range(cycles):
                self.group_move(plan['high_mm'], speeds, accels, f'{rpm}rpm_{index+1}_out')
                self.group_move(plan['low_mm'], speeds, accels, f'{rpm}rpm_{index+1}_back')
                self.report['completed_round_trips'] = index + 1
                self.report['completed_round_trips_x_rpm'] = rpm
                save(self.path, self.report)
                if (index + 1) % 10 == 0:
                    print(json.dumps(dict(completed_round_trips=index + 1,
                        planned_round_trips=cycles, x_rpm=rpm, y_rpm=Y_RPM)), flush=True)
            self.report['completed_stages'].append(plan)
            save(self.path, self.report)
        self.report['final_positions_mm'] = {str(a): self.sample(a)['position_mm'] for a in AXES}

    def close(self):
        if self.armed or 'error' in self.report:
            self.stop_all()
            stable = None
            deadline = time.monotonic() + 2
            while time.monotonic() < deadline:
                try:
                    states = [self.sample(a) for a in AXES]
                    if all(abs(s['speed_rpm']) <= 0.6 for s in states):
                        stable = stable or time.monotonic()
                        if time.monotonic() - stable >= 0.15:
                            self.report['abort_standstill_verified'] = True
                            break
                    else:
                        stable = None
                except Exception as exc:
                    stable = None
                    self.motor.event(braking_sample_error=str(exc))
                time.sleep(0.02)
        self.label = 'cleanup'
        try:
            super().close()
        finally:
            self.telemetry.close()


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--max-rpm', type=int, default=350, choices=[v[0] for v in STAGES])
    p.add_argument('--min-rpm', type=int, default=150, choices=[v[0] for v in STAGES])
    p.add_argument('--cycles', type=int, default=3, choices=range(1, 101))
    p.add_argument('--execute', action='store_true')
    args = p.parse_args()
    if args.min_rpm > args.max_rpm:
        p.error('min-rpm exceeds max-rpm')
    coordinates = load_coordinates()
    plans = [stage_plan(rpm, accel) for rpm, accel in STAGES if args.min_rpm <= rpm <= args.max_rpm]
    if not args.execute:
        print(json.dumps(dict(serial_access=False, stages=plans), indent=2))
        return 0
    trial = SyncTrial(coordinates, args.max_rpm, args.cycles)
    try:
        trial.run(args.max_rpm, args.cycles, args.min_rpm)
    except (Exception, KeyboardInterrupt) as exc:
        trial.report['error'] = f'{type(exc).__name__}: {exc}'
        print(trial.report['error'], flush=True)
    finally:
        trial.close()
    print(json.dumps({k: trial.report.get(k) for k in (
        'passed', 'error', 'cleanup_errors', 'summary_file', 'telemetry_csv', 'rejected_frames')}, indent=2))
    return 0 if trial.report['passed'] else 1


if __name__ == '__main__':
    raise SystemExit(main())
