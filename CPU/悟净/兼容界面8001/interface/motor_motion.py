"""Bounded cached XY groups on one serial scheduler; no hardware on import."""
import math
import struct
import time

U16 = lambda value: struct.pack('>H', value)
U32 = lambda value: struct.pack('>I', value)


def decode_system(reply):
    if len(reply) != 37 or reply[1:4] != bytes([0x43, 37, 12]):
        raise RuntimeError('Unexpected X system status layout')
    def signed(index, size, scale=1):
        if reply[index] not in (0, 1):
            raise RuntimeError('Invalid system status sign')
        return (-1 if reply[index] else 1) * int.from_bytes(
            reply[index+1:index+1+size], 'big') / scale
    return dict(voltage_v=int.from_bytes(reply[4:6], 'big')/1000,
                bus_current_ma=int.from_bytes(reply[6:8], 'big'),
                phase_current_ma=int.from_bytes(reply[8:10], 'big'),
                raw_encoder=int.from_bytes(reply[10:12], 'big'),
                encoder=int.from_bytes(reply[12:14], 'big'),
                target_deg=signed(14, 4, 10), speed_rpm=signed(19, 2, 10),
                position_deg=signed(22, 4, 10), position_error_deg=signed(27, 4, 100),
                temperature_c=signed(32, 1), home_flags=reply[34], motor_flags=reply[35])


def move_verified(session, coordinates, address, requested, frame, controller):
    """Use only a fresh four-axis frame from this same exclusive USB session."""
    if (frame is None or frame['owner'] is not session or frame['coordinates'] is not coordinates
            or time.monotonic()-frame['stamp'] > 0.25):
        return controller.move_to(session, coordinates, address, requested)
    if any(abs(s['speed_rpm']) > 0.6 for s in frame['samples'].values()):
        raise RuntimeError('Verified frame must be stationary')
    current = dict(frame['positions'])
    target = controller.bounded_target(coordinates, current, address, requested)
    initial = current[str(address)]
    segments = []
    while abs(target-current[str(address)]) > 0.05:
        session.check_stop()
        distance = max(-50, min(50, target-current[str(address)]))
        segments.append(session.move_relative(address,
            controller.AXES[address]['positive_mm_sign']*distance*controller.DEG_PER_MM,
            maximum_mm=50))
        sample = session.verify_reference(address, coordinates['axes'][str(address)])
        previous = current[str(address)]
        current[str(address)] = controller.local_mm(address, sample)
        if abs(current[str(address)]-previous) < min(0.02, abs(distance)/2):
            raise RuntimeError('Coordinate move made no measured progress')
        if len(segments) > 8:
            raise RuntimeError('Coordinate move exceeded segment bound')
    return dict(address=address, requested_mm=requested, target_mm=target,
                initial_mm=initial, final_mm=current[str(address)], segments=segments)


def cached_position(address, target, sign):
    degrees = sign * target * 9
    return (bytes([0xCD, int(degrees < 0)]) + U16(20)*2 + U16(50)
            + U32(round(abs(degrees)*10)) + bytes([1, 1]) + U16(700))


def packet(payload, address, crc8):
    body = bytes([address]) + bytes(payload)
    return body + bytes([crc8(body)])


class GroupMotion:
    def __init__(self, session, coordinates, controller, geometry):
        self.session, self.coordinates = session, coordinates
        self.controller, self.geometry = controller, geometry
        self.pending = set()
        self.latest = {}
        self.abort_attempted = False
        self.original_validator = session.motor.ser.packet_validator
        self.allowed = set()
        self.session._web_group_motion = self
        self.entries = session.report.setdefault('groups', [])

    def scan(self, stopping=False):
        session = self.session
        samples = {}
        for address in range(1, 5):
            if not stopping:
                session.check_stop()
            sample = (session.read_sample(address) if stopping else
                      session.verify_reference(address, self.coordinates['axes'][str(address)]))
            samples[str(address)] = sample
        positions = {a: self.controller.core.AXES[int(a)]['positive_mm_sign']*s['position_deg']/9
                     for a, s in samples.items()}
        self.latest = samples
        return positions, samples

    def validate_frame(self, positions, samples):
        for a, value in positions.items():
            axis = self.coordinates['axes'][a]
            if not math.isfinite(value) or not axis['soft_min_mm']-0.15 <= value <= axis['soft_max_mm']+0.15:
                raise RuntimeError('Axis %s left calibrated workspace' % a)
        if positions['1']+positions['2'] > self.coordinates['joint_x_limit']['max_combined_inward_mm']:
            raise RuntimeError('Live X joint limit exceeded')
        if any(not math.isfinite(s['speed_rpm']) for s in samples.values()):
            raise RuntimeError('Non-finite speed feedback')

    def authorize(self, payloads):
        crc8 = self.controller.crc8
        self.allowed = {packet(payload, a, crc8) for a, payload in payloads.items()}
        self.allowed.add(packet(b'\xff\x66', 0, crc8))
        def guarded(data):
            data = bytes(data)
            if data[1] in (0xCD, 0xFF):
                self.session.check_stop()
                if data[1] == 0xFF and any(p[1] == 0xCD for p in self.allowed):
                    raise ValueError('All planned targets must be cached before launch')
                if data not in self.allowed:
                    raise ValueError('Unplanned or repeated cached motion packet')
                self.allowed.remove(data)
            else:
                self.original_validator(data)
        self.session.motor.ser.packet_validator = guarded

    def run(self, targets):
        try:
            positions, samples = self.scan()
            self.validate_frame(positions, samples)
            if any(abs(s['speed_rpm']) > 0.6 for s in samples.values()):
                raise RuntimeError('Group requires four stationary axes')
            planned = self.geometry.plan_move_groups(positions, targets, self.coordinates)
            self.session.report['move_groups'] = planned
            for group in planned:
                goals = {str(m['address']): m['target_mm'] for m in group}
                for segment in range(8):
                    positions, samples = self.scan()
                    self.validate_frame(positions, samples)
                    moving = {a: target for a, target in goals.items()
                              if abs(target-positions[a]) > 0.05}
                    if not moving:
                        break
                    bounded = {a: round((positions[a]+max(-50, min(50, target-positions[a])))*90)/90
                               for a, target in moving.items()}
                    self.geometry.plan_moves(positions, bounded, self.coordinates)
                    worst = sum(max(positions[a], bounded.get(a, positions[a])) for a in ('1', '2'))
                    margin = 10 if {'1', '2'}.issubset(bounded) else 0
                    if worst > self.coordinates['joint_x_limit']['max_combined_inward_mm']-margin:
                        raise RuntimeError('Live independent X envelope lacks clearance')
                    self.leg(positions, bounded)
                else:
                    raise RuntimeError('Group exceeded segment bound')
            positions, samples = self.scan()
            self.validate_frame(positions, samples)
            if any(abs(s['speed_rpm']) > 0.6 for s in samples.values()):
                raise RuntimeError('Final standstill unverified')
            if any(abs(positions[a]-round(v*90)/90) > 0.06 for a, v in targets.items()):
                raise RuntimeError('Final PCB targets unverified')
            self.session.check_stop()
            return positions
        except BaseException as exc:
            if self.pending:
                self.session.report.setdefault('error', '%s: %s' % (type(exc).__name__, exc))
                self.abort(str(exc))
            raise
        finally:
            self.allowed.clear()
            self.session.motor.ser.packet_validator = self.original_validator

    def leg(self, start, targets):
        session = self.session
        if any(session.modes[a] != 2 for a in range(1, 5)):
            raise RuntimeError('All four CRC modes must be prepared before broadcast')
        payloads = {int(a): cached_position(int(a), target,
                    self.controller.core.AXES[int(a)]['positive_mm_sign']) for a, target in targets.items()}
        self.authorize(payloads)
        self.pending = set(range(1, 5))
        entry = dict(start_mm=start, targets_mm=targets, passed=False, samples=[])
        self.entries.append(entry)
        for address, payload in sorted(payloads.items()):
            session.check_stop()
            session.select(address).action(payload)
        cached, samples = self.scan()
        if any(abs(samples[a]['speed_rpm']) > 0.6 or abs(cached[a]-start[a]) > 0.15 for a in start):
            raise RuntimeError('Unexpected motion before synchronization')
        session.check_stop()
        clock = time.monotonic()
        session.select(1).send(b'\xff\x66', address=0)
        reply = session.select(1).receive(0xFF, 0.2)
        if reply[2] != 2:
            raise RuntimeError('Synchronous start rejected')
        entry['launch_monotonic_s'] = clock
        stable, stalled, last_times = None, {}, {a: clock for a in start}
        deadline = clock + max(abs(target-start[a])/3 for a, target in targets.items()) + 4
        while time.monotonic() < deadline:
            positions, samples = self.scan()
            self.validate_frame(positions, samples)
            now = time.monotonic()
            entry['samples'].append(dict(monotonic_s=now, positions_mm=positions, motors=samples))
            if positions['1']+positions['2'] > self.coordinates['joint_x_limit']['max_combined_inward_mm']:
                raise RuntimeError('Live X joint limit exceeded')
            for a, sample in samples.items():
                stamp = sample['monotonic_s']
                if stamp-last_times[a] > 0.35:
                    raise RuntimeError('Axis %s telemetry gap exceeded 0.35 s' % a)
                last_times[a] = stamp
                goal = targets.get(a, start[a])
                low, high = sorted((start[a], goal))
                if not low-0.15 <= positions[a] <= high+0.15 or abs(sample['speed_rpm']) > 8:
                    raise RuntimeError('Axis %s left bounded motion corridor' % a)
                if (a in targets and now-clock > 0.35 and abs(sample['speed_rpm']) < 1
                        and sample['phase_current_ma'] > 700*0.85
                        and abs(positions[a]-goal)*9 > 1):
                    stalled.setdefault(a, now)
                    if now-stalled[a] >= 0.15:
                        raise RuntimeError('Unexpected obstacle at axis %s' % a)
                else:
                    stalled.pop(a, None)
            done = all(abs(samples[a]['speed_rpm']) < 0.6 for a in start) and all(
                abs(positions[a]-goal)*9 <= 0.5 for a, goal in targets.items())
            if done:
                stable = stable if stable is not None else now
                if now-stable >= 0.2:
                    for a in sorted(payloads):
                        session.stop(a)
                    entry.update(passed=True, elapsed_s=time.monotonic()-clock, final_mm=positions)
                    self.pending.clear()
                    return
            else:
                stable = None
            time.sleep(0.02)
        raise TimeoutError('Synchronized XY move did not settle')

    def abort(self, reason):
        if self.abort_attempted:
            return
        self.abort_attempted = True
        session = self.session
        try:
            with self.controller.core.STOP_FILE.open('x') as handle:
                handle.write('PCB synchronous motion aborted: %s\n' % reason)
        except FileExistsError:
            pass
        detail = session.report.setdefault('group_abort', {})
        errors = detail.setdefault('errors', [])
        last = dict(self.latest)
        session.motor.ser.packet_validator = self.original_validator
        for a in range(1, 5):
            try:
                session.stop(a)
            except BaseException as exc:
                errors.append('Motor %s stop: %s' % (a, exc))
        deadline, stable = time.monotonic()+1, None
        stopped = False
        while time.monotonic() < deadline:
            samples = {}
            for a in range(1, 5):
                try:
                    sample = session.read_sample(a)
                    if (str(a) in last and
                            abs(sample['position_deg']-last[str(a)]['position_deg'])/9 > 5):
                        raise RuntimeError('Stop travel exceeded 5 mm')
                    samples[str(a)] = sample
                except BaseException as exc:
                    errors.append('Motor %s stop verification: %s' % (a, exc))
            now = time.monotonic()
            if len(samples) == 4 and all(abs(s['speed_rpm']) < 0.6 and not s['home_flags'] & 4
                                         for s in samples.values()):
                stable = stable if stable is not None else now
                if now-stable >= 0.1:
                    stopped = True
                    detail['final'] = samples
                    break
            else:
                stable = None
        detail['all_stops_verified'] = stopped
        if stopped:
            self.pending.clear()
        else:
            errors.append('Four-axis standstill not verified; heartbeat retained on unresolved axes')
        session.report.setdefault('error', 'Synchronous PCB movement aborted')
