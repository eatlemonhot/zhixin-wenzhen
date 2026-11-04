import hashlib
import json
import math
from functools import lru_cache
from pathlib import Path
from .pcb_coordinates import PROBE_AXES, PROBE_MAPPING_VERSION


def digest(value):
    return hashlib.sha256(json.dumps(value, sort_keys=True, allow_nan=False).encode()).hexdigest()


def reference_id(coordinates):
    frame = {str(a): coordinates['axes'][str(a)]['origin']['origin_encoder_deg'] for a in range(1, 5)}
    frame['mm_per_rev'] = coordinates['mm_per_rev']
    frame['probe_mapping'] = dict(version=PROBE_MAPPING_VERSION, axes=PROBE_AXES)
    return digest(frame)


def reference_frame(coordinates):
    if not coordinates.get('valid'):
        raise ValueError('机械坐标无效，请完成坐标重建。')
    mm=coordinates.get('mm_per_rev')
    if isinstance(mm,bool) or not isinstance(mm,(int,float)) or not math.isfinite(mm) or mm<=0:
        raise ValueError('机械传动比例无效。')
    axes = coordinates['axes']
    origins = {a: axes[a]['origin']['origin_encoder_deg'] for a in ('1','2','3','4')}
    if any(isinstance(v, bool) or not isinstance(v, (float,int)) or not math.isfinite(v) for v in origins.values()):
        raise ValueError('机械原点数值无效。')
    identity = dict(mm_per_rev=coordinates['mm_per_rev'],
                    degrees_per_mm=coordinates.get('degrees_per_mm', 360/coordinates['mm_per_rev']),
                    mapping=dict(version=PROBE_MAPPING_VERSION, axes=PROBE_AXES),
                    axes={a:{k:axes[a].get(k) for k in ('soft_min_mm','soft_max_mm','positive_mm_sign','home_direction')}
                          for a in origins}, joint=coordinates['joint_x_limit'],
                    recommissioning=coordinates.get('origin_recommissioning',{}).get('performed_at_utc'))
    ratio=identity['degrees_per_mm']
    signs={a:axes[a].get('positive_mm_sign', -1 if a == '3' else 1) for a in origins}
    if isinstance(ratio,bool) or not isinstance(ratio,(int,float)) or not math.isfinite(ratio) or ratio<=0:
        raise ValueError('机械角度比例无效。')
    if any(type(v) not in (int,float) or v not in (-1,1) for v in signs.values()):
        raise ValueError('机械坐标方向无效。')
    return dict(reference_id=reference_id(coordinates), mechanical_id=digest(identity),
                origins=origins, degrees_per_mm=identity['degrees_per_mm'],
                signs=signs)


def rebase_anchor(anchor, current, probe, lookup=None):
    if isinstance(current, str):
        return dict(anchor) if anchor.get('reference_id') == current else None
    if not current:
        return None
    previous = anchor.get('reference_frame')
    if previous is None and lookup:
        previous = lookup(anchor.get('reference_id'))
    if previous and previous['mechanical_id'] != current['mechanical_id']:
        return None
    if anchor.get('reference_id') == current['reference_id']:
        return dict(anchor, reference_frame=current)
    if not previous or previous['reference_id'] != anchor.get('reference_id'):
        return None
    deltas = {a:(current['origins'][a]-previous['origins'][a]+180)%360-180 for a in current['origins']}
    if any(abs(d) > 2 for d in deltas.values()):
        return None
    result = dict(anchor, reference_id=current['reference_id'], reference_frame=current,
                  rebased_from=previous['reference_id'])
    for axis, address in PROBE_AXES[probe].items():
        result[axis] = anchor[axis] - current['signs'][address]*deltas[address]/current['degrees_per_mm']
    return result


@lru_cache(maxsize=64)
def find_legacy_frame(root, signature):
    if not isinstance(signature, str) or len(signature) != 64:
        return None
    folder = Path(root)/'zdt/wujing_usb_probe'
    files = sorted(folder.glob('*coordinates_before.json'), key=lambda p:p.stat().st_mtime, reverse=True)[:256]
    for path in files:
        try:
            if path.stat().st_size > 2*1024*1024:
                continue
            value = json.loads(path.read_text())
            if reference_id(value) == signature:
                return reference_frame(value)
        except (OSError, ValueError, KeyError, TypeError):
            continue
    return None
