"""Format-independent PCB geometry in millimetres, with no hardware imports."""
import hashlib
import math


class ImportError(ValueError):
    pass


def number(value, label):
    if isinstance(value, bool) or not isinstance(value, (int, float)) or not math.isfinite(value):
        raise ImportError('%s必须是有限数字。' % label)
    if abs(value) > 1e8:
        raise ImportError('%s超出文件坐标范围。' % label)
    return float(value)


def rotate(x, y, degrees):
    angle = math.radians(number(degrees, '旋转角度') % 360)
    c, s = math.cos(angle), math.sin(angle)
    return c*x-s*y, s*x+c*y


def outline(segments):
    if not 3 <= len(segments) <= 20000:
        raise ImportError('缺少闭合板框，或板框过于复杂。')
    # Match at 1 micrometre; do not heal millimetre-sized gaps silently.
    def key(p): return round(p[0], 6), round(p[1], 6)
    adjacency = {}
    for i, (a, b) in enumerate(segments):
        if key(a) == key(b):
            raise ImportError('板框包含零长度边。')
        for p in (a, b): adjacency.setdefault(key(p), []).append(i)
    if any(len(v) != 2 for v in adjacency.values()):
        raise ImportError('板框未闭合或存在分叉，请检查导出的板框。')
    remaining = set(range(len(segments)))
    loops = []
    while remaining:
        index = min(remaining); a, b = segments[index]
        points = [a, b]; remaining.remove(index)
        while key(points[-1]) != key(points[0]):
            choices = [i for i in adjacency[key(points[-1])] if i in remaining]
            if len(choices) != 1: raise ImportError('无法还原闭合板框。')
            index = choices[0]; u, v = segments[index]
            points.append(v if key(u) == key(points[-1]) else u)
            remaining.remove(index)
        loops.append(points)
    def area(points):
        return abs(sum(a[0]*b[1]-b[0]*a[1] for a,b in zip(points, points[1:]))/2)
    loops.sort(key=area, reverse=True)
    if not loops or area(loops[0]) <= 1e-6: raise ImportError('板框面积无效。')
    # Internal cutouts do not change the outer-board coordinate origin. Refuse
    # separate boards instead of arbitrarily choosing one panel member.
    outer = loops[0]
    def inside(p):
        x,y=p; result=False
        for (ax,ay),(bx,by) in zip(outer,outer[1:]):
            if (ay>y)!=(by>y) and x < (bx-ax)*(y-ay)/(by-ay)+ax:result=not result
        return result
    if any(not inside(loop[0]) for loop in loops[1:]):
        raise ImportError('检测到多个独立板框；请导出单块PCB。')
    return outer, len(loops)-1


def normalize(pads, segments, source_format, metadata=None, warnings=None):
    if not 1 <= len(pads) <= 50000: raise ImportError('PCB焊盘数量无效。')
    points, cutouts = outline(segments)
    low_x, low_y = min(p[0] for p in points), min(p[1] for p in points)
    width, height = max(p[0] for p in points)-low_x, max(p[1] for p in points)-low_y
    if min(width,height) <= 0 or max(width,height) > 10000: raise ImportError('PCB尺寸无效。')
    result = {}
    for p in pads:
        uid = str(p['id'])
        if uid in result: raise ImportError('焊盘编号重复：'+uid)
        x,y = number(p['x'],'焊盘X')-low_x, number(p['y'],'焊盘Y')-low_y
        sx,sy = number(p['width'],'焊盘宽度'),number(p['height'],'焊盘高度')
        if min(sx,sy)<=0: raise ImportError('焊盘尺寸必须大于0。')
        if not -sx <= x <= width+sx or not -sy <= y <= height+sy:
            raise ImportError('焊盘位于板框外，请核对单位和坐标。')
        angle=number(p.get('angle',0),'焊盘角度') % 360
        result[uid]=dict(id=uid,footprint_x=x,footprint_y=y,footprint_angle=angle,
            pad_x=0.,pad_y=0.,pad_angle=0.,size_x=sx,size_y=sy,size_angle=0.,
            grav_center_x=0.,grav_center_y=0.,relative_angle=0.,
            net=str(p.get('net','')),shape=p.get('shape','rect'),
            roundrect_ratio=p.get('roundrect_ratio',0.),is_allowed=p.get('allowed',False),
            tags=[],reference=p.get('reference',''),pad_number=p.get('number',''),
            source_id=p.get('source_id',uid),side=p.get('side','top'),
            package=p.get('package',''),contact_shape=p.get('contact_shape',p.get('shape','rect')),
            hole_size_mm=p.get('hole_size_mm'))
    notes=list(warnings or [])
    if cutouts:notes.append('板框含%d个内部开孔；当前视图只绘制外轮廓。' % cutouts)
    return dict(format=source_format,pads=result,
        nets=sorted({p['net'] for p in result.values() if p['net']}),
        edges=[dict(start=dict(x=a[0]-low_x,y=a[1]-low_y,angle=0),
                    end=dict(x=b[0]-low_x,y=b[1]-low_y,angle=0)) for a,b in zip(points,points[1:])],
        dimensions=dict(origin=[low_x,low_y],width=width,height=height,orientation=0),
        metadata=metadata or {},warnings=notes)


def stable_id(*values):
    return 'eda_'+hashlib.sha256('\0'.join(map(str,values)).encode()).hexdigest()[:32]
