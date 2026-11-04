import copy
import json
import threading
import time
import uuid

from flask import current_app, jsonify, request, session

from . import kicad
from .motor_service import ControlError
from .motor_web import motor_bp, service
from .pcb_alignment import AlignmentStore, reference_id
from .pcb_coordinates import build_targets, pad_position, plan_moves, plan_move_groups


class PCBControl:
    def __init__(self, path):
        self.store = AlignmentStore(path)
        self.lock = threading.RLock()
        self.previews = {}


def control():
    return current_app.extensions['pcb_control']


def layout(required=True):
    user = session.get('user_id')
    with kicad.cache_lock:
        kicad.load_files()
        dimensions = copy.deepcopy(kicad.dimensions_data.get(user))
        pads = kicad.pads_data.get(user)
    if not dimensions or not dimensions.get('layout_id') or not pads:
        if required:
            raise ControlError('请先上传PCB或嘉立创工程文件。', 400)
        return user, None, None
    return user, copy.deepcopy(dimensions), pads


def coordinates():
    path = service().root / 'zdt/machine_coordinates/coordinates.json'
    value = json.loads(path.read_text(encoding='utf-8'))
    if not value.get('valid'):
        raise ValueError('机械坐标无效，请先重建坐标。')
    return value


def profile(dimensions):
    try:
        signature = reference_id(coordinates())
    except (OSError, ValueError, KeyError, TypeError):
        signature = None
    return control().store.view(dimensions.get('layout_id') if dimensions else None,
                                dimensions['orientation'] if dimensions else 0, signature)


def require_orientation(payload, dimensions):
    orientation = payload.get('orientation')
    if isinstance(orientation, bool) or orientation not in (0, 90, 180, 270):
        raise ControlError('PCB方向仅支持0、90、180、270度。', 400)
    if orientation != dimensions['orientation']:
        raise ControlError('PCB方向正在更新，请重新预览。')


def resolve_pad(pad_id, pads, dimensions):
    if not isinstance(pad_id, str) or pad_id not in pads:
        raise ControlError('所选焊盘不属于当前PCB，请重新选择。', 400)
    pad = pads[pad_id]
    if not pad.get('is_allowed'):
        raise ControlError('该焊盘不是当前可定位的顶面导电焊盘。', 400)
    x, y, _ = pad_position(pad, dimensions)
    return dict(x=x, y=y, pad_id=pad_id, net=pad.get('net', ''))


@motor_bp.get('/pcb/config')
def pcb_config():
    _, dimensions, _ = layout(required=False)
    return jsonify(profile(dimensions))


@motor_bp.post('/pcb/config')
def pcb_save_config():
    payload = request.get_json()
    if not isinstance(payload, dict) or set(payload) != {'offsets', 'revision'}:
        raise ControlError('补偿请求需包含offsets及revision。', 400)
    if service().status()['busy']:
        raise ControlError('电机任务执行期间不能修改补偿。')
    try:
        control().store.save_offsets(payload['offsets'], payload['revision'])
    except ValueError as exc:
        raise ControlError(str(exc), 409 if '版本' in str(exc) or '变化' in str(exc) else 400)
    return pcb_config()


@motor_bp.post('/pcb/preview')
def pcb_preview():
    payload = request.get_json()
    if not isinstance(payload, dict) or set(payload) != {'pads', 'orientation'}:
        raise ControlError('预览请求需包含pads及orientation。', 400)
    selected = payload['pads']
    if not isinstance(selected, dict) or set(selected) != {'left', 'right'}:
        raise ControlError('请选择左针或右针的焊盘。', 400)
    user, dimensions, pads = layout()
    require_orientation(payload, dimensions)
    points = {probe: resolve_pad(pad_id, pads, dimensions) for probe, pad_id in selected.items()
              if pad_id is not None}
    if not points:
        raise ControlError('至少选择一个焊盘。', 400)
    current_profile = profile(dimensions)
    simple_points = {probe: dict(x=point['x'], y=point['y']) for probe, point in points.items()}
    errors, targets, plan, groups = [], {}, [], []
    try:
        targets = build_targets(simple_points, current_profile)
        state = service().status()
        if not state['ready'] or state['busy'] or state['stopped']:
            raise ValueError('请先检查电机并等待空闲，再重新预览。')
        machine_coordinates = coordinates()
        plan = plan_moves(state['positions_mm'], targets, machine_coordinates)
        groups = plan_move_groups(state['positions_mm'], targets, machine_coordinates)
    except (ValueError, OSError, KeyError) as exc:
        errors.append(str(exc))
    preview_id = uuid.uuid4().hex
    result = dict(preview_id=preview_id, points=points, targets=targets, plan=plan, move_groups=groups,
                  can_move=not errors, errors=errors, revision=current_profile['revision'])
    record = dict(user=user, layout_id=dimensions['layout_id'], orientation=dimensions['orientation'],
                  created=time.monotonic(), profile=current_profile, points=simple_points, result=result)
    with control().lock:
        control().previews = {key: item for key, item in control().previews.items()
                              if time.monotonic() - item['created'] < 120}
        if len(control().previews) >= 64:
            control().previews.pop(next(iter(control().previews)))
        control().previews[preview_id] = record
    return jsonify(result)


@motor_bp.post('/pcb/move')
def pcb_move():
    payload = request.get_json()
    if not isinstance(payload, dict) or set(payload) != {'preview_id'} or not isinstance(payload['preview_id'], str):
        raise ControlError('请先生成测点预览。', 400)
    user, dimensions, _ = layout()
    with control().lock:
        record = control().previews.get(payload['preview_id'])
        if (not record or record['user'] != user or time.monotonic() - record['created'] >= 120
                or record['layout_id'] != dimensions['layout_id']
                or record['orientation'] != dimensions['orientation']
                or record['profile']['revision'] != control().store.read()['revision']):
            raise ControlError('测点预览已失效，请重新预览。')
        if not record['result']['can_move']:
            raise ControlError('预览未通过基准或限位检查，不能移动。')
        context = dict(points=record['points'], profile=record['profile'])
        job_id = service().start('pads', context=context)
        del control().previews[payload['preview_id']]
    return jsonify(job_id=job_id), 202


@motor_bp.post('/pcb/teach')
def pcb_teach():
    payload = request.get_json()
    if not isinstance(payload, dict) or set(payload) != {'probe', 'pad_id', 'orientation', 'revision'}:
        raise ControlError('记录对准请求格式无效。', 400)
    if payload['probe'] not in ('left', 'right'):
        raise ControlError('未知探针。', 400)
    _, dimensions, pads = layout()
    require_orientation(payload, dimensions)
    point = resolve_pad(payload['pad_id'], pads, dimensions)
    value = control().store.read()
    try:
        control().store._check_revision(value, payload['revision'])
    except ValueError as exc:
        raise ControlError(str(exc))
    store = control().store
    context = dict(probe=payload['probe'], point=dict(x=point['x'], y=point['y']),
                   offsets=value['offsets'], pad_id=point['pad_id'])

    def save_anchor(result):
        if service_object.stop_file.exists():
            raise ValueError('已停车，取消本次对准记录。')
        store.record(payload['probe'], result['anchor'], dimensions['layout_id'],
                     dimensions['orientation'], payload['revision'])

    service_object = service()
    job_id = service_object.start('teach', context=context, on_success=save_anchor)
    return jsonify(job_id=job_id), 202
