"""Conductive pad targets in the installed PCB frame; calibration uses centres."""
import math
from .pcb_coordinates import pad_position

DEFAULT_INSET_MM = .1


def contact_point(pad, dimensions, probe, inset_mm=DEFAULT_INSET_MM, center=False):
    if probe not in ('left', 'right'):
        raise ValueError('未知探针。')
    x, y, _ = pad_position(pad, dimensions)
    result = dict(x=x, y=y, center=dict(x=x, y=y),
                  contact_mode='center' if center else probe + '_edge', inset_mm=0 if center else inset_mm)
    if center:
        return result
    if isinstance(inset_mm, bool) or not isinstance(inset_mm, (float, int)) or not math.isfinite(inset_mm) or not 0 < inset_mm <= 1:
        raise ValueError('靠边内缩量需在0至1mm之间且大于0。')
    sx, sy = pad.get('size_x'), pad.get('size_y')
    if any(isinstance(v, bool) or not isinstance(v, (float, int)) or not math.isfinite(v) or v <= 0 for v in (sx, sy)):
        raise ValueError('焊盘缺少有效尺寸，不能计算接触点。')
    angle = math.radians(-float(pad.get('footprint_angle', 0)) +
                         float(pad.get('pad_angle', 0)) + dimensions['orientation'])
    c, s = math.cos(angle), math.sin(angle)
    half_x, half_y = sx/2, sy/2
    shape = pad.get('contact_shape', pad.get('shape', 'rect'))
    if shape not in ('rect', 'roundrect', 'oval', 'circle', 'ellipse'):
        raise ValueError('该焊盘轮廓暂不能计算靠边接触点，请使用受支持焊盘。')
    radius = min(half_x, half_y)
    if shape == 'roundrect':
        ratio = pad.get('roundrect_ratio', 0)
        if not isinstance(ratio, (int, float)) or not math.isfinite(ratio) or not 0 <= ratio <= .5:
            raise ValueError('焊盘圆角参数无效。')
        radius = min(sx, sy)*ratio
    elif shape == 'rect':
        radius = 0
    def inside(t):
        u, v = abs(c*t), abs(s*t)
        if shape in ('ellipse', 'circle'):
            return (u/half_x)**2 + (v/half_y)**2 <= 1
        if shape == 'oval':
            if sx >= sy:
                return max(0, u-(half_x-radius))**2 + v*v <= radius*radius
            return u*u + max(0, v-(half_y-radius))**2 <= radius*radius
        if u > half_x or v > half_y:
            return False
        return max(0, u-(half_x-radius))**2 + max(0, v-(half_y-radius))**2 <= radius*radius
    low, high = 0., math.hypot(half_x, half_y)
    for _ in range(48):
        middle = (low+high)/2
        if inside(middle): low = middle
        else: high = middle
    if low <= inset_mm:
        raise ValueError('焊盘太窄，当前内缩量没有有效左右接触点。')
    offset = low-inset_mm
    hole = pad.get('hole_size_mm')
    if hole:
        hx, hy = hole['x']/2, hole['y']/2
        if hx > 0 and hy > 0:
            hole_radius = max(hx,hy)
            if offset <= hole_radius + .02:
                raise ValueError('靠边接触点落入孔口或其余量内，请更换焊盘。')
    result['x'] += -offset if probe == 'left' else offset
    result['edge_offset_mm'] = result['x']-x
    return result
