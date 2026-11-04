import argparse
import json
import math
from pathlib import Path
import signal
import sys
import time
from types import SimpleNamespace

STEPS = (0.1, 0.5, 1.0)
PROGRESS_PATH = None
JOB_ID = None


def progress(phase, message):
    if PROGRESS_PATH is not None:
        try:
            data = dict(job_id=JOB_ID, phase=phase, message=message)
            temporary = PROGRESS_PATH.with_suffix('.tmp')
            temporary.write_text(json.dumps(data, ensure_ascii=False), encoding='utf-8')
            temporary.replace(PROGRESS_PATH)
        except OSError as exc:
            try:
                print('Progress update unavailable: %s' % exc, file=sys.stderr)
            except OSError:
                pass
DIRECTIONS = {
    ('left', 'left'): (1, -1), ('left', 'right'): (1, 1),
    ('right', 'left'): (2, 1), ('right', 'right'): (2, -1),
    ('left', 'up'): (3, 1), ('left', 'down'): (3, -1),
    ('right', 'up'): (4, 1), ('right', 'down'): (4, -1),
}


class JogLimitError(ValueError):
    pass


def jog_target(coordinates, positions, address, delta):
    axis = coordinates['axes'][str(address)]
    current = positions[str(address)]
    requested = current + delta
    low, high = axis['soft_min_mm'], axis['soft_max_mm']
    degrees_per_mm = coordinates.get('degrees_per_mm', 9)
    tolerance = 0.5 / degrees_per_mm + 1e-9
    if requested < low:
        if delta < 0 and current > low and low - requested <= tolerance:
            requested = low
        else:
            raise JogLimitError('%s号电机已到或将超过前/外侧软限位；本次未运动，允许范围为%g～%g mm，可向相反方向点动。' %
                                (address, low, high))
    elif requested > high:
        if delta > 0 and current < high and requested - high <= tolerance:
            requested = high
        else:
            raise JogLimitError('%s号电机已到或将超过后/内侧软限位；本次未运动，允许范围为%g～%g mm，可向相反方向点动。' %
                                (address, low, high))
    ticks = round(requested * degrees_per_mm * 10)
    target = (ticks / 10) / degrees_per_mm
    if target < low:
        target = ((ticks + 1) / 10) / degrees_per_mm
    elif target > high:
        target = ((ticks - 1) / 10) / degrees_per_mm
    if not low <= target <= high or (target - current) * delta <= 0:
        raise JogLimitError('%s号电机已到当前方向的软限位；本次未运动，可向相反方向点动。' % address)
    if address in (1, 2) and target + positions[str(3 - address)] > coordinates['joint_x_limit']['max_combined_inward_mm']:
        raise JogLimitError('两臂X内移总量将超过联合软限位；本次未运动，请先将任一臂向外移动。')
    return target


def validate_jog(payload):
    if not isinstance(payload, dict) or set(payload) != {'probe', 'direction', 'step_mm'}:
        raise ValueError('点动请求必须包含探针、方向及步长。')
    probe, direction, step = (payload.get(k) for k in ('probe', 'direction', 'step_mm'))
    if not isinstance(probe, str) or not isinstance(direction, str) or (probe, direction) not in DIRECTIONS:
        raise ValueError('点动参数须为左/右探针及XY方向。')
    if isinstance(step, bool) or not isinstance(step, (int, float)) or not math.isfinite(step) or step not in STEPS:
        raise ValueError('点动步长仅支持0.1、0.5、1 mm。')
    address, sign = DIRECTIONS[(probe, direction)]
    return address, sign * float(step)


def load_controller(root):
    directory = Path(root) / 'zdt' / 'wujing_usb_probe'
    if not (directory / 'motorctl.py').is_file():
        raise RuntimeError('悟净电机控制程序不存在。')
    sys.path.insert(0, str(directory))
    import motorctl
    if __package__:
        from .web_motor_runtime import create_session_class
    else:
        from web_motor_runtime import create_session_class
    import machine_control
    from ch340_serial import crc8
    if __package__:
        from .motor_motion import move_verified, GroupMotion
    else:
        from motor_motion import move_verified, GroupMotion

    def read_positions(session, coordinates):
        positions, samples = motorctl.read_positions(session, coordinates)
        # A frame belongs to exactly this held USB session and coordinate object.
        session._web_verified_frame = dict(owner=session, coordinates=coordinates,
                                          positions=dict(positions), samples=samples,
                                          stamp=time.monotonic())
        return positions, samples

    def move_to(session, coordinates, address, requested):
        frame = session._web_verified_frame
        session._web_verified_frame = None
        return move_verified(session, coordinates, address, requested, frame, machine_control)

    controller = SimpleNamespace(Machine=motorctl.Machine, Session=create_session_class(motorctl),
                                 core=motorctl.core, load_coordinates=motorctl.load_coordinates,
                                 read_positions=read_positions, move_to=move_to, crc8=crc8,
                                 directory=directory)

    def move_group(session, coordinates, targets):
        geometry, _ = pcb_modules()
        return GroupMotion(session, coordinates, controller, geometry).run(targets)

    controller.move_group = move_group
    return controller


def run_motion_task(controller, action, run_id):
    if controller.core.STOP_FILE.exists():
        raise RuntimeError('停车锁定中，请先解除停车。')
    import fast_rebuild
    session = None
    error = None
    try:
        progress('preflight', '正在检查驱动及机械标定。')
        if action == 'circle':
            park_for_circle(controller, run_id)
        session = fast_rebuild.FastRebuild(run_id, home_rpm=25, speed_boost=100,
                                          circle_only=action == 'circle')
        announce = session.announce

        def announce_progress(label):
            announce(label)
            messages = {
                'cold_start_single_outer_and_front_homing_pass': '正在以25 rpm逐轴找边，随后退让到2 mm。',
                'cold_start_parallel_outer_and_front_homing_pass': '四轴正在以25 rpm同时找边，分别监控行程、状态及超时。',
                'parallel_homes_verified_retreating_to_park': '四轴找边及新原点核验通过，正在依次退让到2 mm。',
                'parallel_homes_settling_before_zero': '四轴已找到边，正在恢复保持状态并确认停稳，随后建立新原点。',
                'reference_verified_at_park': '参考检查通过，正在准备移动测试。',
                'continuous_entry_two_mirrored_circles_and_return': '正在画圆并返回起点，不重复碰边。',
            }
            message = messages.get(label, '正在执行电机任务。')
            if label.startswith('parallel_home_completed_'):
                address = label.rsplit('_', 1)[-1]
                message = '%s号已找到边并停稳，继续监控其余轴。' % address
            progress(label, message)

        session.announce = announce_progress
        if action == 'rebuild':
            session.run_home_only()
        elif action == 'circle':
            session.run()
        else:
            raise ValueError('Unsupported motion task')
    except BaseException as exc:
        error = '%s: %s' % (type(exc).__name__, exc)
        if session is not None:
            session.report['error'] = error
    finally:
        if session is not None:
            try:
                progress('restoring', '动作结束，正在确认停车并恢复驱动参数。')
            finally:
                try:
                    session.close()
                except BaseException as exc:
                    error = error or '恢复参数失败：%s' % exc
    if session is None:
        raise RuntimeError(error or '无法打开电机USB接口。')
    report = session.report
    if error or not report.get('passed') or not report.get('motion_completed') or report.get('cleanup_errors'):
        raise RuntimeError('; '.join([error or '电机任务失败'] + (report.get('cleanup_errors') or [])))
    return dict(passed=True, connected=True, ready=True, positions_mm=report['positions_mm'],
                summary_file=report.get('summary_file'), motion_completed=True,
                message=('坐标重建完成，四轴已停在约2 mm。' if action == 'rebuild' else
                         '移动测试完成，已返回约2 mm；未重复碰边。'))


def park_for_circle(controller, run_id):
    """Return valid, stationary coordinates to the start without contact homing."""
    progress('circle_start_check', '正在核验已有坐标，必要时先返回画圆起点，不碰边。')
    checked = check_machine(controller, run_id + '_circle_start')
    coordinates = controller.load_coordinates()
    geometry, _ = pcb_modules()
    targets = {str(a): coordinates['axes'][str(a)]['soft_min_mm'] for a in range(1, 5)}
    plan = geometry.plan_moves(checked['positions_mm'], targets, coordinates)
    if not plan:
        return
    selected = tuple(sorted({move['address'] for move in plan}))
    session = None
    error = None
    try:
        session = controller.Session(run_id + '_circle_park', active_axes=selected)
        session.initialize()
        session.check_stop()
        positions, _ = controller.read_positions(session, coordinates)
        validate_positions(coordinates, positions)
        # Rebuild the plan from live feedback under USB ownership. An external
        # controller moving an unprepared axis is rejected, never guessed.
        plan = geometry.plan_moves(positions, targets, coordinates)
        if not {move['address'] for move in plan}.issubset(selected):
            raise RuntimeError('画圆起点位置已变化，请重新检查后再试。')
        original_validator = session.motor.ser.packet_validator

        def guarded_validator(packet):
            original_validator(packet)
            if packet[1] == 0xCD:
                session.check_stop()

        session.motor.ser.packet_validator = guarded_validator
        for move in plan:
            session.check_stop()
            progress('circle_return_to_start', '正在按已有坐标返回画圆起点，不执行机械找边。')
            controller.move_to(session, coordinates, move['address'], move['target_mm'])
        positions, _ = controller.read_positions(session, coordinates)
        validate_positions(coordinates, positions)
        if any(abs(positions[a]-target) > 0.12 for a, target in targets.items()):
            raise RuntimeError('画圆起点尚未到位。')
        session.report.update(positions_mm=positions, circle_start_park=True)
    except BaseException as exc:
        error = '%s: %s' % (type(exc).__name__, exc)
        if session is not None:
            session.report['error'] = error
    finally:
        if session is not None:
            try:
                session.close()
            except BaseException as exc:
                error = error or '恢复参数失败：%s' % exc
    if (session is None or error or not session.report.get('passed')
            or session.report.get('cleanup_errors')):
        raise RuntimeError(error or '画圆起点准备失败。')


def pcb_modules():
    if __package__:
        from . import pcb_coordinates, pcb_alignment
    else:
        sys.path.insert(0, str(Path(__file__).resolve().parent.parent))
        import types
        package = types.ModuleType('_pcb_worker')
        package.__path__ = [str(Path(__file__).resolve().parent)]
        sys.modules['_pcb_worker'] = package
        from _pcb_worker import pcb_coordinates, pcb_alignment
    return pcb_coordinates, pcb_alignment


def teach_machine(controller, context, run_id):
    geometry, alignment = pcb_modules()
    result = check_machine(controller, run_id)
    anchor = geometry.teach_anchor(context['probe'], context['point'], result['positions_mm'], context['offsets'])
    anchor['reference_id'] = alignment.reference_id(controller.load_coordinates())
    anchor['pad_id'] = context['pad_id']
    result.update(anchor=anchor, message='已读取当前位置并记录焊盘对准基准，未发送运动。')
    return result


def move_pads(controller, context, run_id):
    started = time.monotonic()
    geometry, alignment = pcb_modules()
    if controller.core.STOP_FILE.exists():
        raise RuntimeError('停车锁定中，请先解除停车并重新检查。')
    session = None
    error = None
    positions = {}
    try:
        coordinates = controller.load_coordinates()
        signature = alignment.reference_id(coordinates)
        for probe in context['points']:
            if context['profile']['anchors'][probe].get('reference_id') != signature:
                raise RuntimeError('回零参考已经改变或电机映射已更新，请重新记录对应探针的焊盘对准位置。')
        targets = geometry.build_targets(context['points'], context['profile'])
        session = controller.Session(run_id + '_pads', active_axes=(1, 2, 3, 4))
        progress('preflight', '正在核验四轴参考与焊盘目标。')
        session.initialize()
        session.check_stop()
        positions, _ = controller.read_positions(session, coordinates)
        validate_positions(coordinates, positions)
        plan = geometry.plan_moves(positions, targets, coordinates)
        session.report['pcb_targets'] = dict(context=context, axes_mm=targets, plan=plan)
        progress('moving', '正在同步移动到焊盘目标，四轴持续监控；间距不足时分段让位。')
        session.check_stop()
        positions = controller.move_group(session, coordinates, targets)
        validate_positions(coordinates, positions)
        for address, target in targets.items():
            if abs(positions[address] - round(target * 90) / 90) > 0.06:
                raise RuntimeError('轴%s的最终焊盘目标位置未核实。' % address)
        session.report['positions_mm'] = positions
        session.check_stop()
    except BaseException as exc:
        error = '%s: %s' % (type(exc).__name__, exc)
        if session is not None:
            session.report['error'] = error
    finally:
        if session is not None:
            try:
                session.close()
            except BaseException as exc:
                error = error or '恢复参数失败：%s' % exc
    if session is None:
        raise RuntimeError(error or '无法打开电机USB接口。')
    report = session.report
    if error or not report.get('passed') or report.get('cleanup_errors'):
        raise RuntimeError('; '.join([error or '焊盘定位失败'] + (report.get('cleanup_errors') or [])))
    timing = dict(report.get('timing', {}), worker_elapsed_s=time.monotonic()-started)
    first = getattr(session, 'first_motion_monotonic_s', None)
    if first is not None:
        timing['before_first_motion_s'] = first-started
    return dict(passed=True, connected=True, ready=True, positions_mm=positions, timing=timing,
                summary_file=report.get('summary_file'), message='焊盘XY定位完成，未执行下探。')


def validate_positions(coordinates, positions):
    if set(positions) != {'1', '2', '3', '4'}:
        raise RuntimeError('缺少完整四轴位置。')
    for address, value in positions.items():
        axis = coordinates['axes'][address]
        if not math.isfinite(value) or not axis['soft_min_mm'] - 0.15 <= value <= axis['soft_max_mm'] + 0.15:
            raise RuntimeError('轴%s当前位置超出已标定工作区，需核验参考。' % address)
    if positions['1'] + positions['2'] > coordinates['joint_x_limit']['max_combined_inward_mm']:
        raise RuntimeError('两X轴当前位置超出联合限位。')


def validate_stationary_samples(samples):
    if set(samples) != {'1', '2', '3', '4'} or any(
            not math.isfinite(s['speed_rpm']) or abs(s['speed_rpm']) > 0.6 for s in samples.values()):
        raise RuntimeError('未确认四轴全部停稳，请检查电机。')


def check_machine(controller, run_id):
    result = controller.Machine(run_id=run_id).status()
    motors = result['motors']
    positions = {str(a): motors[str(a)]['millimetres'] for a in range(1, 5)}
    if not result.get('all_references_valid'):
        raise RuntimeError('四轴坐标参考无效，请先使用现有坐标重建程序重建，再检查电机。')
    if any(abs(item['sample']['speed_rpm']) > 0.6 for item in motors.values()):
        raise RuntimeError('四轴尚未停稳。')
    validate_positions(controller.load_coordinates(), positions)
    return dict(passed=True, connected=True, ready=True, positions_mm=positions,
                motion_commands_sent=0, message='四轴通信、静止状态及参考检查通过。')


def jog_machine(controller, payload, run_id):
    started = time.monotonic()
    address, delta = validate_jog(payload)
    if controller.core.STOP_FILE.exists():
        raise RuntimeError('停车锁定中，请先解除停车并重新检查。')
    session = None
    error = None
    limit_notice = None
    positions = {}
    try:
        session = controller.Session(run_id + '_jog', active_axes=(address,))
        coordinates = controller.load_coordinates()
        progress('preflight', '正在检查四轴参考并准备本次点动。')
        session.initialize()
        session.check_stop()
        positions, samples = controller.read_positions(session, coordinates)
        validate_positions(coordinates, positions)
        validate_stationary_samples(samples)
        session.check_stop()
        original_validator = session.motor.ser.packet_validator

        def guarded_validator(packet):
            original_validator(packet)
            if packet[1] == 0xCD:
                session.check_stop()

        session.motor.ser.packet_validator = guarded_validator
        session.report['web_jog'] = dict(payload, address=address, delta_mm=delta,
                                         requested_mm=positions[str(address)] + delta)
        try:
            target = jog_target(coordinates, positions, address, delta)
        except JogLimitError as exc:
            limit_notice = str(exc)
            session.report['web_jog_limit'] = limit_notice
            session.report['motion_commands_sent'] = 0
        else:
            session.report['web_jog']['target_mm'] = target
            progress('moving', '正在点动%s臂，电机地址%s。' % ('左' if payload['probe'] == 'left' else '右', address))
            session.check_stop()
            session.report['movement'] = controller.move_to(session, coordinates, address, target)
        positions, samples = controller.read_positions(session, coordinates)
        session.report['positions_mm'] = positions
        validate_positions(coordinates, positions)
        validate_stationary_samples(samples)
        session.check_stop()
    except BaseException as exc:
        error = '%s: %s' % (type(exc).__name__, exc)
        if session is not None:
            session.report['error'] = error
    finally:
        if session is not None:
            try:
                session.close()
            except BaseException as exc:
                error = error or '恢复参数失败：%s' % exc
    if session is None:
        raise RuntimeError(error or '无法打开电机USB接口。')
    report = session.report
    if error or not report.get('passed') or report.get('cleanup_errors'):
        details = report.get('cleanup_errors') or []
        raise RuntimeError('; '.join([error or '点动未成功'] + details))
    timing = dict(report.get('timing', {}), worker_elapsed_s=time.monotonic()-started)
    first = getattr(session, 'first_motion_monotonic_s', None)
    if first is not None:
        timing['before_first_motion_s'] = first-started
    if limit_notice is not None:
        return dict(passed=True, connected=True, ready=True, positions_mm=positions,
                    timing=timing, jog=dict(payload, address=address), outcome='limited',
                    error_code='jog_soft_limit', motion_commands_sent=0,
                    summary_file=report.get('summary_file'), message=limit_notice)
    return dict(passed=True, connected=True, ready=True, positions_mm=positions,
                timing=timing, jog=dict(payload, address=address),
                summary_file=report.get('summary_file'),
                message='%s臂%s号电机点动完成，四轴已停稳且临时参数已恢复。' %
                        ('左' if payload['probe'] == 'left' else '右', address))


def main():
    global PROGRESS_PATH, JOB_ID
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--root', required=True)
    parser.add_argument('--result', required=True)
    parser.add_argument('--progress')
    parser.add_argument('--execute', action='store_true')
    args = parser.parse_args()
    if not args.execute:
        print('No USB access. Add --execute to run a bounded operation.')
        return 0
    payload = json.loads(sys.stdin.read(16384))
    action, run_id = payload['action'], payload['run_id']
    if action not in ('check', 'jog', 'pads', 'teach', 'rebuild', 'circle') or not run_id.startswith('web_') or not run_id[4:].isalnum():
        raise ValueError('Invalid bounded operation')
    if action == 'jog':
        validate_jog(payload['jog'])
    root = Path(args.root)
    JOB_ID = run_id
    PROGRESS_PATH = Path(args.progress) if args.progress else None
    stop = root / 'zdt/machine_coordinates/stop.request'

    def request_stop(signum, frame):
        stop.write_text('Web controller signal %s\n' % signum)

    signal.signal(signal.SIGTERM, request_stop)
    signal.signal(signal.SIGINT, request_stop)
    try:
        controller = load_controller(root)
        if action == 'check':
            result = check_machine(controller, run_id)
        elif action in ('rebuild', 'circle'):
            result = run_motion_task(controller, action, run_id)
        elif action == 'jog':
            result = jog_machine(controller, payload['jog'], run_id)
        elif action == 'teach':
            result = teach_machine(controller, payload['context'], run_id)
        else:
            result = move_pads(controller, payload['context'], run_id)
    except BaseException as exc:
        message = '%s: %s' % (type(exc).__name__, exc)
        if 'Exactly one 1a86:7523 device must be connected' in str(exc):
            message = '未检测到唯一的电机USB转接器（CH340），请检查连接。'
        elif isinstance(exc, BlockingIOError) or 'LIBUSB_ERROR_BUSY' in str(exc):
            message = '电机USB接口正被坐标重建等控制程序占用，请等待后重新检查。'
        result = dict(passed=False, connected=False, ready=False, error=message)
    output = Path(args.result)
    temporary = output.with_suffix('.tmp')
    temporary.write_text(json.dumps(result, ensure_ascii=False, allow_nan=False), encoding='utf-8')
    temporary.replace(output)
    return 0 if result['passed'] else 1


if __name__ == '__main__':
    raise SystemExit(main())
