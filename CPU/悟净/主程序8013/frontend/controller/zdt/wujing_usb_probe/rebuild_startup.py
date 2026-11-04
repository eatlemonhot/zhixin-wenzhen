import copy
import json
import math
import time


AXIS_SPEC = {
    1: ('right_x', 1, 1, 199.2, 235),
    2: ('left_x', 1, 1, 199.2, 235),
    3: ('left_y', 0, -1, 157.1, 185),
    4: ('right_y', 1, 1, 157.0, 185),
}


def finite(value):
    return (not isinstance(value, bool) and isinstance(value, (int, float))
            and math.isfinite(value))


def validate_geometry(coordinates):
    if not isinstance(coordinates, dict) or type(coordinates.get('valid')) is not bool:
        raise ValueError('Saved coordinate validity flag is malformed')
    if not finite(coordinates.get('mm_per_rev')) or coordinates['mm_per_rev'] != 40:
        raise ValueError('Expected the measured 40 mm/revolution geometry')
    axes = coordinates.get('axes')
    if not isinstance(axes, dict) or set(axes) != {'1', '2', '3', '4'}:
        raise ValueError('Expected saved four-axis calibration')
    for address, (name, direction, sign, maximum, homing_bound) in AXIS_SPEC.items():
        axis = axes[str(address)]
        if (not isinstance(axis, dict) or axis.get('name') != name
                or type(axis.get('home_direction')) is not int
                or axis['home_direction'] != direction
                or type(axis.get('positive_mm_sign')) is not int
                or axis['positive_mm_sign'] != sign):
            raise ValueError('Axis %s geometry/direction differs from calibrated assembly' % address)
        low, high = axis.get('soft_min_mm'), axis.get('soft_max_mm')
        if not finite(low) or low != 2 or not finite(high) or not low < high <= maximum:
            raise ValueError('Axis %s soft limits exceed saved profile' % address)
        reference = axis.get('origin')
        origin = reference.get('origin_encoder_deg') if isinstance(reference, dict) else None
        if not finite(origin) or not 0 <= origin < 360:
            raise ValueError('Axis %s mechanical origin signature is missing' % address)
        span = axis.get('measured_full_span_mm')
        if span is not None and (not finite(span) or not high < span <= homing_bound):
            raise ValueError('Axis %s measured span is inconsistent' % address)
        if address >= 3 and span is None:
            raise ValueError('Y-axis measured span is required')
    joint = coordinates.get('joint_x_limit', {})
    if not isinstance(joint, dict):
        raise ValueError('Combined X calibration is missing')
    limit = joint.get('max_combined_inward_mm')
    if (not finite(limit) or not 4 < limit <= 201.2
            or joint.get('min_each_inward_mm') != 2):
        raise ValueError('Combined X limit differs from calibrated assembly')
    return coordinates


def validate_release_packet(packet, address):
    """Only a just-homed axis may make this exact 2 mm / 5 rpm retreat."""
    if address not in AXIS_SPEC:
        raise ValueError('No cold-start release axis is armed')
    sign = AXIS_SPEC[address][2]
    body = (bytes([address, 0xCD, int(sign < 0)]) + (20).to_bytes(2, 'big')
            + (20).to_bytes(2, 'big') + (50).to_bytes(2, 'big')
            + (180).to_bytes(4, 'big') + bytes([2, 0]) + (700).to_bytes(2, 'big'))
    if bytes(packet[:-1]) != body or len(packet) != 18:
        raise ValueError('Cold-start release must be the exact calibrated 2 mm retreat')


def verify_parameter_readback(motor, payload):
    packet = bytes(payload)
    code = packet[0] if packet else None
    if code == 0x45 and len(packet) == 5 and packet[:3] == b'\x45\x66\x00':
        expected = packet[3:]
        actual = motor.config()[16:18]
    elif code == 0x4C and len(packet) == 18 and packet[:3] == b'\x4c\xae\x00':
        expected = packet[3:]
        actual = motor.consistent([0x22])[2:-1]
    elif code == 0x5C and len(packet) == 5 and packet[:3] == b'\x5c\xac\x00':
        expected = packet[3:]
        actual = motor.consistent([0x3F])[2:-1]
    elif code == 0x68 and len(packet) == 7 and packet[:3] == b'\x68\x38\x00':
        expected = packet[3:]
        actual = motor.consistent([0x16])[2:-1]
    else:
        return False
    if bytes(actual) != bytes(expected):
        raise RuntimeError('Temporary parameter %02x ACK missing and readback differs' % code)
    motor.event(parameter_ack_missing_readback_verified=code,
                address=motor.address, action_sent_once=True)
    return True


def establish_reference(session, save, coordinate_path, backup_path, utc_now):
    validate_geometry(session.coordinates)
    previous = copy.deepcopy(session.coordinates)
    save(backup_path, previous)
    session.report.update(starting_coordinate_file_valid=previous['valid'],
                          startup_position_reference_trusted=False,
                          coordinates_candidate=session.coordinates,
                          startup_reference_mode='cold_start_bounded_homing',
                          endstop_homing_passes=1, repeated_endstop_contacts=False,
                          homing_mode='four_axis_parallel')
    session.coordinates['valid'] = False
    save(coordinate_path, session.coordinates)
    session.initialize()
    session.caps = {address: 1000 for address in AXIS_SPEC}
    session.cold_start_begin = time.monotonic()
    session.cold_start_active = True
    session.announce('cold_start_parallel_outer_and_front_homing_pass')
    try:
        results = session.home_all()
        session.settle_home_release()
        for address, (_, direction, _, _, bound) in AXIS_SPEC.items():
            session.check_stop()
            result = results[address]
            reference = session.zero_reference(address)
            old = previous['axes'][str(address)]['origin']['origin_encoder_deg']
            error = abs((reference['origin_encoder_deg'] - old + 180) % 360 - 180)
            session.report.setdefault('reference_comparison', {})[str(address)] = dict(
                previous_origin_deg=old, measured_origin_deg=reference['origin_encoder_deg'],
                repeat_error_deg=error)
            if error > 2:
                raise RuntimeError('Motor %s mechanical home changed by %.3f degrees (>2); remeasure limits'
                                   % (address, error))
            session.coordinates['axes'][str(address)]['origin'] = reference
            entry = dict(
                address=address, stage='cold_start', travel_mm=result['travel_mm'],
                elapsed_s=result['elapsed_s'], maximum_mm=bound, repeat_error_deg=error,
                park=None)
            session.report.setdefault('homes', []).append(entry)
        # Every axis must finish, and ALL new signatures must pass, before any
        # inward retreat. Never use an unhomed partner's old position.
        session.announce('parallel_homes_verified_retreating_to_park')
        for entry in session.report['homes']:
            session.check_stop()
            address = entry['address']
            entry['park'] = session.release_to_park(address)
            session.select(address).action([0x50, 0])
            save(session.path, session.report)
        final = {address: session.verify_reference(
            address, session.coordinates['axes'][str(address)]) for address in AXIS_SPEC}
        if any(abs(sample['position_mm'] - 2) > 0.15 or abs(sample['speed_rpm']) > 0.6
               for sample in final.values()):
            raise RuntimeError('Cold-start 2 mm stationary park was not verified')
        session.coordinates['last_rehomed_at_utc'] = utc_now()
        session.report.update(cold_start_reference_established=True,
                              preflight_reference_verified=True,
                              cold_start_positions_mm={a: s['position_mm'] for a, s in final.items()})
    finally:
        session.report['cold_homing_elapsed_s'] = time.monotonic() - session.cold_start_begin
        session.cold_start_active = False


def bounded_home(session, address, direction, maximum_mm, rpm, watch_address=None):
    if (type(address) is not int or address not in AXIS_SPEC
            or type(direction) is not int or direction != AXIS_SPEC[address][1]
            or not finite(maximum_mm) or not 0 < maximum_mm <= AXIS_SPEC[address][4]
            or type(rpm) is not int or rpm not in (10, 20, 25)
            or watch_address is not None and watch_address not in AXIS_SPEC):
        raise ValueError('Invalid bounded homing parameters')
    U16 = lambda value: int(value).to_bytes(2, 'big')
    U32 = lambda value: int(value).to_bytes(4, 'big')
    before = session.sample(address)
    m = session.select(address)
    m.action([0x50, 1])
    session.home_touched.add(address)
    parameters = (bytes([2, direction]) + U16(rpm) + U32(45000)
        + U16(8) + U16(800) + U16(150) + bytes([0]))
    m.action(bytes([0x4C, 0xAE, 0]) + parameters)
    if m.consistent([0x22])[2:-1] != parameters:
        raise RuntimeError('Temporary homing parameters not verified')
    m.action(bytes([0x5C, 0xAC, 0]) + U16(50))
    if m.consistent([0x3F])[2:-1] != U16(50):
        raise RuntimeError('Homing release angle not verified')
    session.active = address
    session.report['home_active'] = True
    print(json.dumps(dict(homing_address=address, direction=direction,
        speed_rpm=rpm, maximum_mm=maximum_mm)), flush=True)
    m.action([0x9A, 2, 0])
    start = last_sample = last_print = time.monotonic()
    last_encoder = before['encoder']
    travel_deg = 0
    running = False
    stable = None
    result = dict(before=before, direction=direction, speed_rpm=rpm,
        release_deg=5, maximum_mm=maximum_mm, samples=[])
    watched_before = None if watch_address is None else session.sample(watch_address)
    session.select(address)
    result['watched_axis_before'] = watched_before
    while time.monotonic() - start < 47:
        session.check_stop()
        s = session.sample(address, allow_home=True)
        clock = time.monotonic()
        if clock - last_sample > 0.65:
            raise RuntimeError('Encoder sampling gap exceeds bound')
        delta = ((s['encoder'] - last_encoder + 32768) % 65536) - 32768
        travel_deg += delta * 360 / 65536
        last_encoder, last_sample = s['encoder'], clock
        s.update(unwrapped_deg=travel_deg, elapsed_s=clock-start)
        result['samples'].append(s)
        if watch_address is not None:
            other = session.select(watch_address)
            reply = other.query([0x36])
            if reply[2] not in (0, 1):
                raise RuntimeError('Invalid watched-axis sign')
            watched_position = (-1 if reply[2] else 1) * int.from_bytes(reply[3:-1], 'big') / 10
            if abs(watched_position - watched_before['position_deg']) > 3:
                raise RuntimeError('Stationary arm was displaced during contact measurement')
            session.select(address)
            s['watched_axis_position_deg'] = watched_position
        if abs(travel_deg) > maximum_mm * 9.0:
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
                    travel_mm=travel_deg / 9.0, elapsed_s=clock-start,
                    observed_running=True)
                session.active = None
                session.report['home_active'] = False
                print(json.dumps(dict(home_complete=address, travel_mm=result['travel_mm'], final=s)), flush=True)
                return result
        else:
            stable = None
        if clock - last_print >= 4:
            print(json.dumps(dict(homing_address=address, travel_mm=round(travel_deg/9.0, 2),
                speed_rpm=s['speed_rpm'], current_ma=s['phase_current_ma'])), flush=True)
            last_print = clock
        time.sleep(0.02)
    raise TimeoutError('Homing completion not verified')

