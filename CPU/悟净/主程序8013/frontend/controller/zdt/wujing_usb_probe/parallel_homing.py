"""Four concurrent homes over one serial scheduler; no hardware on import."""
import json
import math
import time
from power_profile import DEFAULT_PROFILE, voltage_in_profile

AXES = (1, 2, 3, 4)
DIRECTIONS = {1: 1, 2: 1, 3: 0, 4: 1}
TRAVEL_MM = {1: 235, 2: 235, 3: 185, 4: 185}
SAMPLE_GAP_S = 0.65
HOME_TIMEOUT_S = 47.0
STABLE_S = 0.3


def validate_cached_home_packet(packet, armed, crc8):
    if (len(packet) != 5 or packet[0] not in armed
            or packet[1:4] != b'\x9a\x02\x01'
            or packet[-1] not in (0x6B, crc8(packet[:-1]))):
        raise ValueError('Only an armed, one-shot cached sensorless home is allowed')


def abort_parallel_homing(session):
    """Attempt every stop even when another axis loses its acknowledgement."""
    if getattr(session, 'parallel_abort_attempted', False):
        return
    session.parallel_abort_attempted = True
    report = session.report.setdefault('parallel_homing', {})
    report['abort_requested'] = True
    results = report.setdefault('stop_results', {})
    errors = []
    try:
        motor = session.select(1)
        motor.send([0xFE, 0x98, 0], address=0)
        try:
            motor.receive(0xFE, timeout=0.05)
        except Exception:
            pass
        time.sleep(0.003)
    except BaseException as exc:
        errors.append('Broadcast stop: %s' % exc)
    for address in AXES:
        item = results[str(address)] = dict(commands_attempted=[], errors=[])
        for payload in ([0x9C, 0x48], [0xFE, 0x98, 0]):
            item['commands_attempted'].append(payload[0])
            # Only STOP/ABORT may be retried. A delayed homing firmware reply
            # must not leave one axis running, or skip another axis's stop.
            for attempt in range(2):
                try:
                    motor = session.select(address)
                    if attempt:
                        motor.buffer.clear()
                        motor.pending.clear()
                        motor.ser.reset_input_buffer()
                    motor.action(payload, ack_timeout=0.2)
                    break
                except BaseException as exc:
                    if attempt:
                        item['errors'].append('%02x: %s' % (payload[0], exc))
                        errors.append('Motor %s %02x: %s' % (address, payload[0], exc))
                    else:
                        time.sleep(0.003)
    deadline = time.monotonic()+1.0
    stable = None
    unresolved = set(AXES)
    last_errors, encoders, travel_deg = {}, {}, {a:0.0 for a in AXES}
    for address in AXES:
        previous = report.get('axes', {}).get(str(address), {}).get('samples', [])
        if previous:
            encoders[address] = previous[-1]['encoder']
    while True:
        unresolved = set()
        for address in AXES:
            try:
                sample = session.read_sample(address)
                results[str(address)]['final'] = sample
                if address in encoders:
                    delta = ((sample['encoder']-encoders[address]+32768) % 65536)-32768
                    travel_deg[address] += abs(delta*360/65536)
                encoders[address] = sample['encoder']
                results[str(address)]['stop_travel_mm'] = travel_deg[address]/9
                if travel_deg[address] > 45:
                    raise RuntimeError('Motion exceeded 5 mm after stop request')
                if (not math.isfinite(sample['speed_rpm']) or abs(sample['speed_rpm']) >= 0.6
                        or sample['home_flags'] & 4):
                    raise RuntimeError('Standstill/home abort not verified')
                last_errors.pop(address, None)
            except BaseException as exc:
                unresolved.add(address)
                last_errors[address] = str(exc)
        clock = time.monotonic()
        if not unresolved:
            if stable is None:
                stable = clock
            if clock-stable >= 0.1:
                break
        else:
            stable = None
        if clock >= deadline:
            if not unresolved:
                unresolved = set(AXES)
                last_errors = {a:'Stable standstill window not verified' for a in AXES}
            break
        time.sleep(0.01)
    for address in sorted(unresolved):
        errors.append('Motor %s stop verification: %s' % (address,last_errors.get(address,'Unverified')))
    session.homing_pending = unresolved
    session.homing_active = unresolved.copy()
    report['unverified_stop_axes'] = sorted(unresolved)
    report['all_stops_verified'] = not unresolved
    if errors:
        session.report.setdefault('stop_errors', []).extend(errors)
        # Session.close must never publish coordinates after uncertain stopping.
        session.report.setdefault('error', 'Parallel homing stop/abort verification failed')


def restore_aborted_home_parameters(session):
    """恢复已停止且中断的回零状态。

    诊断记录保留回零失败标记，坐标基准由独立验证流程更新。
    电流恢复结合遥测和过压检查，提升失败时回退。"""
    errors = []
    detail = session.report.setdefault('abort_parameter_restore', {})
    profile = getattr(getattr(session, 'motor', None), 'supply_profile', DEFAULT_PROFILE)

    def stopped(address):
        begin = time.monotonic()
        first = None
        while True:
            sample = session.read_sample(address)
            if (not math.isfinite(sample['speed_rpm']) or abs(sample['speed_rpm']) > 5
                    or sample['home_flags'] & 4 or sample['home_flags'] & 3 != 3
                    or sample['motor_flags'] & 8 or not math.isfinite(sample['voltage_v'])):
                raise RuntimeError('Motor %s cannot restore parameters before verified standstill' % address)
            encoder = sample.get('encoder')
            if first is None:
                first = encoder
            if encoder is not None and first is not None:
                drift = abs(((encoder-first+32768) % 65536)-32768) * 360 / 65536
                if drift > 3:
                    raise RuntimeError('Motor %s moved >3 degrees during cleanup settling' % address)
            if abs(sample['speed_rpm']) < 0.6:
                return sample
            if time.monotonic()-begin > 0.5:
                raise TimeoutError('Motor %s cleanup did not settle within 0.5 s' % address)
            time.sleep(0.02)

    for address in sorted(session.started):
        item = detail[str(address)] = dict(restored=False)
        try:
            item['before'] = stopped(address)
            if address in session.home_touched:
                session.restore_home(address)
            original = session.original[address]
            current_restored = False
            before_current = {a: stopped(a) for a in AXES}
            if all(voltage_in_profile(s['voltage_v'], profile)
                   for s in before_current.values()):
                try:
                    session.select(address).action(b'\x45\x66\x00\x0b\xb8')
                    # Changing the current ceiling can cause a brief rotor
                    # settling response. Check supply immediately, then check
                    # standstill after checksum/config restoration's settling
                    # delay. Never mistake a restarted home for settling.
                    after = {a: session.read_sample(a) for a in AXES}
                    item['after_current_restore'] = after
                    if any(s['home_flags'] & 4 for s in after.values()):
                        raise RuntimeError('Homing resumed during parameter restoration')
                    if not all(math.isfinite(s['voltage_v']) for s in after.values()):
                        raise RuntimeError('Supply verification was not finite')
                    if not all(voltage_in_profile(s['voltage_v'], profile)
                               for s in after.values()):
                        raise RuntimeError('Supply outside selected profile while restoring 3 A')
                except BaseException:
                    session.select(address).action(b'\x45\x66\x00\x03\xe8')
                    raise
                current_restored = True
            motor = session.select(address)
            try:
                motor.set_checksum(motor.config(), 0)
            finally:
                session.modes[address] = motor.mode
            if current_restored:
                motor.action(b'\x68\x38\x00' + bytes.fromhex(original['heartbeat'])[2:-1])
                if motor.consistent([0x16])[2:-1] != bytes.fromhex(original['heartbeat'])[2:-1]:
                    raise RuntimeError('Original heartbeat not restored')
            if motor.config()[4:-1] != bytes.fromhex(original['config'])[4:-1]:
                raise RuntimeError('Original current/configuration not restored; check supply before retry')
            item['final'] = stopped(address)
            if not voltage_in_profile(item['final']['voltage_v'], profile):
                session.select(address).action(b'\x45\x66\x00\x03\xe8')
                raise RuntimeError('Supply dropped during cleanup; rolled back to temporary 1 A')
            item['restored'] = True
            session.report.setdefault('final', {})[str(address)] = item['final']
        except BaseException as exc:
            item['error'] = str(exc)
            errors.append('Motor %s aborted-home cleanup: %s' % (address, exc))
    if errors:
        session.report.setdefault('cleanup_errors', []).extend(errors)
    return not errors


def _stationary(sample):
    if (not math.isfinite(sample['speed_rpm']) or abs(sample['speed_rpm']) >= 0.6
            or sample['home_flags'] & 4):
        raise RuntimeError('Parallel home needs stationary axes outside homing')


def settle_parallel_release(session):
    """在建立新零点前恢复回零控制器配置。

    先还原保存的回零参数，再应用相同的临时CRC与电流配置，并执行2度机械检查。"""
    if (not session.report.get('parallel_homing', {}).get('completed')
            or session.homing_pending or session.homing_active):
        raise RuntimeError('All four homes must complete before release normalization')
    if any(session.modes[a] != 2 for a in AXES):
        raise RuntimeError('Release normalization requires the existing CRC mode')
    report = dict(passed=False, maximum_encoder_drift_deg=3, maximum_elapsed_s=5,
                  restored_axes=[], config_reapplied_axes=[])
    session.report['release_normalization'] = report
    start = time.monotonic()
    try:
        before = session.scan()
        report['before'] = before

        def observed():
            session.check_stop()
            values = session.scan()
            for a, sample in values.items():
                delta = ((sample['encoder']-before[a]['encoder']+32768) % 65536)-32768
                if (abs(delta*360/65536) > 3 or not math.isfinite(sample['speed_rpm'])
                        or abs(sample['speed_rpm']) > 5):
                    raise RuntimeError('Motor %s exceeded release settling bound' % a)
                if sample['home_flags'] != 3:
                    raise RuntimeError('Motor %s home state changed during release settling' % a)
            if time.monotonic()-start > 5:
                raise TimeoutError('Release normalization did not settle within 5 s')
            return values

        for a in AXES:
            session.check_stop()
            session.restore_home(a)
            report['restored_axes'].append(a)
            motor = session.select(a)
            try:
                motor.set_checksum(motor.config(), 2)
            finally:
                session.modes[a] = motor.mode
            if motor.mode != 2:
                raise RuntimeError('CRC changed during release normalization')
            report['config_reapplied_axes'].append(a)
            observed()
        stable = None
        while True:
            values = observed()
            clock = time.monotonic()
            if all(abs(s['speed_rpm']) < 0.6 for s in values.values()):
                if stable is None:
                    stable = clock
                if clock-stable >= 0.3:
                    report.update(passed=True, final=values, elapsed_s=clock-start)
                    return
            else:
                stable = None
            time.sleep(0.01)
    except BaseException as exc:
        report['error'] = '%s: %s' % (type(exc).__name__, exc)
        try:
            session.latch_parallel_stop(report['error'])
        finally:
            abort_parallel_homing(session)
        raise


def bounded_parallel_home(session, rpm, save_report=lambda: None):
    if type(rpm) is not int or rpm not in (10, 20, 25):
        raise ValueError('Parallel homing speed must be 10, 20 or 25 RPM')
    if getattr(session, 'homing_pending', set()):
        raise RuntimeError('Previous homing group has not been cleared')
    session.check_stop()
    session.parallel_abort_attempted = False
    report = dict(mode='cached_broadcast', speed_rpm=rpm, timeout_s=HOME_TIMEOUT_S,
                  maximum_sample_gap_s=SAMPLE_GAP_S, axes={}, cached_axes=[],
                  sync_sent=False, completed=False)
    session.report['parallel_homing'] = report
    U16 = lambda value: int(value).to_bytes(2, 'big')
    U32 = lambda value: int(value).to_bytes(4, 'big')
    try:
        # Finish all parameter writes before caching anything. sample() refreshes
        # every drive's watchdog and checks voltage/current/temperature/status.
        for address in AXES:
            session.check_stop()
            _stationary(session.sample(address))
            session.select(address).action([0x50, 1])
            session.home_touched.add(address)
            parameters = (bytes([2, DIRECTIONS[address]]) + U16(rpm) + U32(45000)
                          + U16(8) + U16(800) + U16(150) + b'\x00')
            session.select(address).action(b'\x4c\xae\x00' + parameters)
            if session.select(address).consistent([0x22])[2:-1] != parameters:
                raise RuntimeError('Motor %s temporary home parameters differ' % address)
            session.check_stop()
            _stationary(session.sample(address))
            session.select(address).action(b'\x5c\xac\x00' + U16(50))
            if session.select(address).consistent([0x3F])[2:-1] != U16(50):
                raise RuntimeError('Motor %s release angle differs' % address)
        before = {a: session.sample(a) for a in AXES}
        for sample in before.values():
            _stationary(sample)
        # Arm ALL potential axes before the first one-shot write: an ACK loss
        # or partial USB write can leave that axis holding a cached command.
        session.homing_pending = set(AXES)
        session.homing_active = set()
        session.motor.homing_cache_axes = set(AXES)
        session.motor.parallel_home_guard = session.check_stop
        for address in AXES:
            session.check_stop()
            session.select(address).action([0x9A, 2, 1])
            report['cached_axes'].append(address)
        cached = {a: session.sample(a) for a in AXES}
        for address, sample in cached.items():
            _stationary(sample)
            delta = ((sample['encoder'] - before[address]['encoder'] + 32768) % 65536) - 32768
            if abs(delta * 360 / 65536) > 3:
                raise RuntimeError('Motor %s moved before synchronization' % address)
            report['axes'][str(address)] = dict(
                before=sample, direction=DIRECTIONS[address], maximum_mm=TRAVEL_MM[address],
                speed_rpm=rpm, samples=[], status='cached', peak_rpm=0.0,
                minimum_voltage_v=sample['voltage_v'], maximum_phase_current_ma=sample['phase_current_ma'],
                maximum_observed_sample_gap_s=0.0)
        save_report()
        session.check_stop()
        session.allow_failed_home_preflight = False
        motor = session.select(1)
        motor.pending = [reply for reply in motor.pending if reply[1] != 0xFF]
        start = time.monotonic()
        report['start_monotonic_s'] = start
        session.homing_active = set(AXES)
        report['sync_sent'] = True
        motor.send([0xFF, 0x66], address=0)
        reply = motor.receive(0xFF, timeout=0.05)
        if reply[2] != 2:
            raise RuntimeError('Homing synchronization rejected; will not repeat')
        state = {a: dict(last_encoder=cached[a]['encoder'], last_sample=start,
                         net_deg=0.0, total_deg=0.0, running=False, stable=None,
                         completed=False) for a in AXES}
        last_print = start
        while True:
            for address in AXES:
                session.check_stop()
                s = session.sample(address, allow_home=True)
                clock = time.monotonic()
                item, previous = report['axes'][str(address)], state[address]
                gap = clock - previous['last_sample']
                item['maximum_observed_sample_gap_s'] = max(item['maximum_observed_sample_gap_s'], gap)
                if gap > SAMPLE_GAP_S:
                    raise TimeoutError('Motor %s homing sample gap exceeded 0.65 s' % address)
                change = ((s['encoder'] - previous['last_encoder'] + 32768) % 65536) - 32768
                change_deg = change * 360 / 65536
                previous['net_deg'] += change_deg
                previous['total_deg'] += abs(change_deg)
                previous.update(last_encoder=s['encoder'], last_sample=clock)
                s.update(elapsed_s=clock-start, unwrapped_deg=previous['net_deg'],
                         total_travel_mm=previous['total_deg']/9)
                item['samples'].append(s)
                item['peak_rpm'] = max(item['peak_rpm'], abs(s['speed_rpm']))
                item['minimum_voltage_v'] = min(item['minimum_voltage_v'], s['voltage_v'])
                item['maximum_phase_current_ma'] = max(item['maximum_phase_current_ma'], s['phase_current_ma'])
                if not math.isfinite(s['speed_rpm']) or abs(s['speed_rpm']) > rpm + 10:
                    raise RuntimeError('Motor %s homing feedback speed exceeded bound' % address)
                if previous['total_deg'] > TRAVEL_MM[address] * 9:
                    raise RuntimeError('Motor %s homing exceeded cumulative travel bound' % address)
                if s['home_flags'] & 8:
                    raise RuntimeError('Motor %s firmware reports homing failure' % address)
                if previous['completed']:
                    drift = abs(previous['net_deg'] - item['unwrapped_deg'])
                    if s['home_flags'] & 4 or abs(s['speed_rpm']) >= 0.6 or drift > 3:
                        raise RuntimeError('Completed home axis %s moved again' % address)
                    continue
                if clock-start > HOME_TIMEOUT_S:
                    raise TimeoutError('Motor %s homing completion exceeded 47 s' % address)
                if s['home_flags'] & 4:
                    previous['running'] = True
                    previous['stable'] = None
                    item['status'] = 'homing'
                elif previous['running'] and abs(s['speed_rpm']) < 0.6:
                    if previous['stable'] is None:
                        previous['stable'] = clock
                    if clock - previous['stable'] >= STABLE_S:
                        previous['completed'] = True
                        session.homing_active.discard(address)
                        item.update(status='completed', final=s, observed_running=True,
                                    unwrapped_deg=previous['net_deg'], travel_mm=previous['net_deg']/9,
                                    total_travel_mm=previous['total_deg']/9, elapsed_s=clock-start)
                        print(json.dumps(dict(home_complete=address, parallel=True,
                                              travel_mm=item['travel_mm'], elapsed_s=item['elapsed_s'])), flush=True)
                        session.announce('parallel_home_completed_%s' % address)
                else:
                    previous['stable'] = None
            if all(item['completed'] for item in state.values()):
                break
            if time.monotonic() - last_print >= 2:
                print(json.dumps(dict(parallel_homing={a: dict(
                    status=v['status'], travel_mm=v['samples'][-1]['total_travel_mm'])
                    for a, v in report['axes'].items()})), flush=True)
                last_print = time.monotonic()
            time.sleep(0.01)
        report.update(completed=True, elapsed_s=time.monotonic()-start)
        session.homing_pending.clear()
        session.homing_active.clear()
        save_report()
        return {a: report['axes'][str(a)] for a in AXES}
    except BaseException as exc:
        report['error'] = '%s: %s' % (type(exc).__name__, exc)
        try:
            latch = getattr(session, 'latch_parallel_stop', None)
            if latch is not None:
                latch(report['error'])
        except BaseException as lock_error:
            session.report.setdefault('stop_errors', []).append('Stop lock: %s' % lock_error)
        # Every failure of this group stops every axis, including setup/cache
        # failures before the broadcast. Never zero or retreat after rejection.
        abort_parallel_homing(session)
        raise
    finally:
        session.motor.homing_cache_axes = set()
        session.motor.parallel_home_guard = None
