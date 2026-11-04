"""计算PCB到滑台的坐标映射，并规划有界顺序XY运动。

    坐标单位为毫米；X轴向内为正，Y轴向后为正。锚点表示当前机械基准。"""
import math


AXES = ('1', '2', '3', '4')
PROBES = ('left', 'right')
# Confirmed on hardware: homing address 1 moves the physical left X arm.
# Each X carriage still increases inward; Y ownership is unchanged.
PROBE_AXES = {'left': {'x': '1', 'y': '3'}, 'right': {'x': '2', 'y': '4'}}
PROBE_MAPPING_VERSION = 2
# PCB X grows right, PCB Y down; machine Y grows toward the rear.
PCB_FRAME_VERSION = 2
CURRENT_TOLERANCE_MM = 0.15
SETTLED_TOLERANCE_MM = 0.05
POSITION_UNITS_PER_MM = 90


def _number(value, label):
    if isinstance(value, bool) or not isinstance(value, (int, float)):
        raise ValueError('%s必须是有限数字。' % label)
    try:
        number = float(value)
    except (OverflowError, ValueError):
        raise ValueError('%s必须是有限数字。' % label) from None
    if not math.isfinite(number):
        raise ValueError('%s必须是有限数字。' % label)
    return number


def _field(value, key, label):
    if not isinstance(value, dict) or key not in value:
        raise ValueError('缺少%s。' % label)
    return value[key]


def _point(value, label, allow_metadata=False):
    if (not isinstance(value, dict) or not {'x', 'y'}.issubset(value)
            or not allow_metadata and set(value) != {'x', 'y'}):
        required = '必须包含x、y' if allow_metadata else '必须且只能包含x、y'
        raise ValueError('%s%s。' % (label, required))
    return {axis: _number(value[axis], '%s的%s' % (label, axis)) for axis in ('x', 'y')}


def _positions(value):
    if not isinstance(value, dict) or set(value) != set(AXES):
        raise ValueError('必须提供以字符串1、2、3、4为键的完整四轴位置。')
    return {axis: _number(value[axis], '轴%s位置' % axis) for axis in AXES}


def _probe(value):
    if not isinstance(value, str) or value not in PROBES:
        raise ValueError('探针必须是left或right。')
    return value


def pad_position(pad, dimensions):
    """Return rotated board millimetres and the unchanged local relative angle.

    The input footprint position is already relative to the unrotated board
    origin, as produced by kicad.get_pads(). KiCad footprint rotation uses the
    existing negative-angle convention. The quarter-turn board transform then
    moves its bounding box back into nonnegative board coordinates.
    """
    width = _number(_field(dimensions, 'width', 'PCB宽度'), 'PCB宽度')
    height = _number(_field(dimensions, 'height', 'PCB高度'), 'PCB高度')
    if width <= 0 or height <= 0:
        raise ValueError('PCB宽度和高度必须大于0。')
    orientation = _number(_field(dimensions, 'orientation', 'PCB方向'), 'PCB方向')
    if orientation not in (0, 90, 180, 270):
        raise ValueError('PCB方向仅支持0、90、180、270度。')
    footprint_x = _number(_field(pad, 'footprint_x', '封装X位置'), '封装X位置')
    footprint_y = _number(_field(pad, 'footprint_y', '封装Y位置'), '封装Y位置')
    footprint_angle = _number(_field(pad, 'footprint_angle', '封装角度'), '封装角度')
    pad_x = _number(_field(pad, 'pad_x', '焊盘局部X位置'), '焊盘局部X位置')
    pad_y = _number(_field(pad, 'pad_y', '焊盘局部Y位置'), '焊盘局部Y位置')
    relative_angle = _number(_field(pad, 'relative_angle', '焊盘相对角度'), '焊盘相对角度')

    angle = math.radians(-(footprint_angle % 360))
    local_x = footprint_x + pad_x * math.cos(angle) - pad_y * math.sin(angle)
    local_y = footprint_y + pad_x * math.sin(angle) + pad_y * math.cos(angle)
    if orientation == 0:
        x, y = local_x, local_y
    elif orientation == 90:
        x, y = height - local_y, local_x
    elif orientation == 180:
        x, y = width - local_x, height - local_y
    else:
        x, y = local_y, width - local_x
    return _number(x, '焊盘X坐标'), _number(y, '焊盘Y坐标'), relative_angle


def pcb_point_position(point, dimensions, coordinate_frame):
    """校验外部PCB点并返回旋转后的板面毫米坐标。

    两种坐标均采用外框左上角为原点、X向右、屏幕Y向下。
    pcb_mm表示原始板面坐标，rotated_pcb_mm包含当前四分之一圈旋转。
    本函数检查外框范围，焊盘、开槽、器件及Z方向由对应流程校验。"""
    point = _point(point, 'PCB目标点')
    if not isinstance(coordinate_frame, str) or coordinate_frame not in ('pcb_mm', 'rotated_pcb_mm'):
        raise ValueError('coordinate_frame仅支持pcb_mm或rotated_pcb_mm。')
    width = _number(_field(dimensions, 'width', 'PCB宽度'), 'PCB宽度')
    height = _number(_field(dimensions, 'height', 'PCB高度'), 'PCB高度')
    if width <= 0 or height <= 0:
        raise ValueError('PCB宽度和高度必须大于0。')
    orientation = _field(dimensions, 'orientation', 'PCB方向')
    if type(orientation) is not int or orientation not in (0, 90, 180, 270):
        raise ValueError('PCB方向仅支持整数0、90、180、270度。')
    bounds = (width, height)
    if coordinate_frame == 'rotated_pcb_mm' and orientation in (90, 270):
        bounds = (height, width)
    x, y = point['x'], point['y']
    if not (0 <= x <= bounds[0] and 0 <= y <= bounds[1]):
        raise ValueError('PCB目标点超出当前坐标系的板框包围盒。')
    if coordinate_frame == 'pcb_mm':
        if orientation == 90:
            x, y = height - y, x
        elif orientation == 180:
            x, y = width - x, height - y
        elif orientation == 270:
            x, y = y, width - x
    return dict(x=x, y=y)


def validate_offsets(value):
    if not isinstance(value, dict) or set(value) != set(PROBES):
        raise ValueError('探针补偿必须且只能包含left和right。')
    result = {}
    for probe in PROBES:
        result[probe] = _point(value[probe], '%s探针补偿' % probe)
        if any(abs(number) > 100 for number in result[probe].values()):
            raise ValueError('每项探针XY补偿必须在-100至100 mm内。')
    return result


def teach_anchor(probe, point_mm, positions_mm, offsets):
    """Infer one anchor from a known PCB point at the current carriage position."""
    probe = _probe(probe)
    point = _point(point_mm, 'PCB基准点')
    positions = _positions(positions_mm)
    offset = validate_offsets(offsets)[probe]
    axes = PROBE_AXES[probe]
    x_sign = 1 if probe == 'left' else -1
    x = positions[axes['x']] - x_sign * (point['x'] + offset['x'])
    y = positions[axes['y']] + point['y'] - offset['y']
    return {'x': _number(x, '机械基准X'), 'y': _number(y, '机械基准Y')}


def build_targets(points_by_probe, profile):
    """Map selected left/right PCB points to independent carriage axis targets."""
    if (not isinstance(points_by_probe, dict) or not points_by_probe
            or not set(points_by_probe).issubset(PROBES)):
        raise ValueError('至少提供一个left或right探针的PCB目标点。')
    anchors = _field(profile, 'anchors', '机械基准配置')
    if not isinstance(anchors, dict) or not set(anchors).issubset(PROBES):
        raise ValueError('机械基准配置只能包含left和right。')
    offsets = validate_offsets(_field(profile, 'offsets', '探针补偿配置'))
    targets = {}
    for probe in PROBES:
        if probe not in points_by_probe:
            continue
        point = _point(points_by_probe[probe], '%s探针PCB目标点' % probe)
        if probe not in anchors or anchors[probe] is None:
            raise ValueError('%s探针尚未建立机械基准。' % probe)
        anchor = _point(anchors[probe], '%s探针机械基准' % probe, allow_metadata=True)
        offset = offsets[probe]
        axes = PROBE_AXES[probe]
        x_sign = 1 if probe == 'left' else -1
        targets[axes['x']] = anchor['x'] + x_sign * (point['x'] + offset['x'])
        targets[axes['y']] = anchor['y'] - point['y'] + offset['y']
    return {axis: _number(value, '轴%s目标' % axis) for axis, value in targets.items()}


def plan_moves(current, targets, coordinates):
    """按向外X、Y、向内X的顺序校验并排列运动。

    目标在控制器0.1度量化前后均满足机械限位；当前反馈采用0.15 mm测量容差。"""
    current = _positions(current)
    axes = _field(coordinates, 'axes', '四轴软限位')
    if not isinstance(axes, dict) or set(axes) != set(AXES):
        raise ValueError('机械配置必须包含完整四轴软限位。')
    bounds = {}
    for axis in AXES:
        lower = _number(_field(axes[axis], 'soft_min_mm', '轴%s下限' % axis), '轴%s下限' % axis)
        upper = _number(_field(axes[axis], 'soft_max_mm', '轴%s上限' % axis), '轴%s上限' % axis)
        if lower > upper:
            raise ValueError('轴%s软限位范围无效。' % axis)
        bounds[axis] = lower, upper
        if not lower - CURRENT_TOLERANCE_MM <= current[axis] <= upper + CURRENT_TOLERANCE_MM:
            raise ValueError('轴%s当前位置超出已标定范围，需核验参考。' % axis)
    joint = _field(coordinates, 'joint_x_limit', '双X联合限位')
    joint_limit = _number(_field(joint, 'max_combined_inward_mm', '双X联合限位值'), '双X联合限位值')
    if current['1'] + current['2'] > joint_limit:
        raise ValueError('当前双X位置超过联合限位，需核验参考。')
    if not isinstance(targets, dict) or not targets or not set(targets).issubset(AXES):
        raise ValueError('目标必须包含至少一个以字符串1、2、3、4为键的轴。')

    normalized = {}
    for axis, value in targets.items():
        requested = _number(value, '轴%s目标' % axis)
        lower, upper = bounds[axis]
        if not lower <= requested <= upper:
            raise ValueError('轴%s目标超出已标定软限位。' % axis)
        units = _number(requested * POSITION_UNITS_PER_MM, '轴%s量化目标' % axis)
        quantized = round(units) / POSITION_UNITS_PER_MM
        if not lower <= quantized <= upper:
            raise ValueError('轴%s目标量化后超出已标定软限位。' % axis)
        normalized[axis] = quantized
    final = dict(current, **normalized)
    if final['1'] + final['2'] > joint_limit:
        raise ValueError('最终双X位置超过联合限位，无法移动到所选测点。')

    changed = {axis: value for axis, value in normalized.items()
               if abs(value - current[axis]) > SETTLED_TOLERANCE_MM}
    outward = [axis for axis in ('1', '2') if axis in changed and changed[axis] < current[axis]]
    y_axes = [axis for axis in ('3', '4') if axis in changed]
    inward = [axis for axis in ('1', '2') if axis in changed and changed[axis] > current[axis]]
    simulated = dict(current)
    result = []
    for axis in outward + y_axes + inward:
        simulated[axis] = changed[axis]
        if simulated['1'] + simulated['2'] > joint_limit:
            raise ValueError('顺序移动的中间位置超过双X联合限位。')
        result.append({'address': int(axis), 'target_mm': changed[axis]})
    return result


def plan_move_groups(current, targets, coordinates):
    moves = plan_moves(current, targets, coordinates)
    if not moves:
        return []
    goals = {str(m['address']): m['target_mm'] for m in moves}
    limit = coordinates['joint_x_limit']['max_combined_inward_mm']
    envelope = sum(max(current[a], goals.get(a, current[a])) for a in ('1', '2'))
    if not {'1', '2'}.issubset(goals) or envelope <= limit - 10:
        return [sorted(moves, key=lambda m: m['address'])]
    order = sorted(('1', '2'), key=lambda a: (goals[a] >= current[a], int(a)))
    return [[m for m in moves if str(m['address']) in (a, str(int(a)+2))] for a in order]
