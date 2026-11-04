import copy
import json
import threading
import time
import uuid
from pathlib import Path

from flask import current_app, jsonify, request, session

from . import kicad
from .motor_service import ControlError
from .motor_web import motor_bp, service
from .pcb_alignment import AlignmentStore, reference_id, effective
from .reference_frame import reference_frame, find_legacy_frame
from .pad_contact import contact_point
from .calibration import CalibrationStore
from .pcb_coordinates import build_targets, pad_position, pcb_point_position, plan_moves, plan_move_groups


class PCBControl:
    def __init__(self, path):
        self.store = AlignmentStore(path)
        self.lock = threading.RLock()
        self.previews = {}
        self.calibration = CalibrationStore(Path(path).parent / "calibration_sessions")


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
        signature = reference_frame(coordinates())
    except (OSError, ValueError, KeyError, TypeError):
        signature = None
    def point_lookup(identifier):
        if not dimensions:return None
        with kicad.cache_lock:
            pad=copy.deepcopy(kicad.pads_data.get(session.get('user_id'),{}).get(identifier))
        if not pad:return None
        x,y,_=pad_position(pad,dimensions)
        return dict(x=x,y=y)
    return control().store.view(dimensions.get('layout_id') if dimensions else None,
                                dimensions['orientation'] if dimensions else 0, signature,
                                lambda old:find_legacy_frame(str(service().root),old),point_lookup=point_lookup,
                                use_fixture=True)


def require_orientation(payload, dimensions):
    orientation = payload.get('orientation')
    if isinstance(orientation, bool) or orientation not in (0, 90, 180, 270):
        raise ControlError('PCB方向仅支持0、90、180、270度。', 400)
    if orientation != dimensions['orientation']:
        raise ControlError('PCB方向正在更新，请重新预览。')


def resolve_pad(pad_id, pads, dimensions, probe=None, inset_mm=.1):
    if not isinstance(pad_id, str) or pad_id not in pads:
        raise ControlError('所选焊盘不属于当前PCB，请重新选择。', 400)
    pad = pads[pad_id]
    if not pad.get('is_allowed'):
        raise ControlError('该焊盘不是当前可定位的顶面导电焊盘。', 400)
    try:
        point=contact_point(pad,dimensions,probe or 'left',inset_mm,center=probe is None)
    except ValueError as exc:raise ControlError(str(exc),400)
    return dict(point,pad_id=pad_id,net=pad.get('net',''),reference=pad.get('reference',''),
                pad_number=pad.get('pad_number',''),package=pad.get('package',''))


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
        control().store.save_offsets(payload['offsets'], payload['revision'],layout()[1]['layout_id'],layout()[1]['orientation'],fixture=True)
    except ValueError as exc:
        raise ControlError(str(exc), 409 if '版本' in str(exc) or '变化' in str(exc) else 400)
    return pcb_config()


@motor_bp.post('/pcb/preview')
def pcb_preview():
    payload = request.get_json()
    if not isinstance(payload, dict) or not {'pads','orientation'}.issubset(payload) or set(payload)-{'pads','orientation','inset_mm','purpose','layout_id'}:
        raise ControlError('预览请求需包含pads及orientation。', 400)
    if payload.get('purpose','normal') not in ('normal','calibration'):
        raise ControlError('目标用途无效。',400)
    selected = payload['pads']
    if not isinstance(selected, dict) or set(selected) != {'left', 'right'}:
        raise ControlError('请选择左针或右针的焊盘。', 400)
    user, dimensions, pads = layout()
    if 'layout_id' in payload and payload['layout_id']!=dimensions['layout_id']:
        raise ControlError('工程已变化，请重新选择测点并预览。',409)
    require_orientation(payload, dimensions)
    points = {probe: resolve_pad(pad_id, pads, dimensions,None if payload.get('purpose')=='calibration' else probe,payload.get('inset_mm',.1)) for probe, pad_id in selected.items()
              if pad_id is not None}
    if not points:
        raise ControlError('至少选择一个焊盘。', 400)
    return create_preview(user, dimensions, points)


@motor_bp.post('/pcb/preview-xy')
def pcb_preview_xy():
    payload = request.get_json()
    if not isinstance(payload, dict) or set(payload) != {'layout_id', 'orientation', 'coordinate_frame', 'points'}:
        raise ControlError('坐标预览需包含layout_id、orientation、coordinate_frame及points。', 400)
    if not isinstance(payload['layout_id'], str) or not payload['layout_id']:
        raise ControlError('layout_id必须是当前工程编号。', 400)
    if type(payload['orientation']) is not int or payload['orientation'] not in (0, 90, 180, 270):
        raise ControlError('PCB方向仅支持整数0、90、180、270度。', 400)
    frame = payload['coordinate_frame']
    if not isinstance(frame, str) or frame not in ('pcb_mm', 'rotated_pcb_mm'):
        raise ControlError('coordinate_frame仅支持pcb_mm或rotated_pcb_mm。', 400)
    selected = payload['points']
    if not isinstance(selected, dict) or set(selected) != {'left', 'right'}:
        raise ControlError('points需包含left和right，未使用的探针填null。', 400)
    user, dimensions, _ = layout()
    if payload['layout_id'] != dimensions['layout_id'] or payload['orientation'] != dimensions['orientation']:
        raise ControlError('工程或方向已变化，请重新读取工程并预览。', 409)
    try:
        points = {probe: pcb_point_position(point, dimensions, frame)
                  for probe, point in selected.items() if point is not None}
    except ValueError as exc:
        raise ControlError(str(exc), 400) from None
    if not points:
        raise ControlError('至少提供一个探针目标点。', 400)
    return create_preview(user, dimensions, points, input_coordinate_frame=frame,
                          coordinate_frame='rotated_pcb_mm', z_supported=False, collision_checked=False)


def create_preview(user, dimensions, points, calibration_record=None, **metadata):
    """Share calibration, planning and expiring single-use tokens for all targets."""
    current_profile = (copy.deepcopy(calibration_record["base_profile"]) if calibration_record else profile(dimensions))
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
                  can_move=not errors, errors=errors, revision=current_profile['revision'],
                  layout_id=dimensions['layout_id'],orientation=dimensions['orientation'])
    result.update(metadata)
    record = dict(user=user, layout_id=dimensions['layout_id'], orientation=dimensions['orientation'],
                  created=time.monotonic(), profile=current_profile, points=simple_points, result=result,
                  calibration_id=calibration_record['id'] if calibration_record else None,
                  calibration_index=calibration_record['index'] if calibration_record else None)
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
        callback=None
        if record.get('calibration_id'):
            draft=checked_calibration(user,record['calibration_id'],dimensions)
            if draft['index']!=record['calibration_index'] or draft['state']!='ready':
                raise ControlError('标定点已变化，请重新预览。')
            calibration=control().calibration
            calibration.phase(user,draft['id'],'moving',expected=('ready',))
            def callback(result):
                calibration.phase(user,draft['id'],'aligning',expected=('moving',))
        try:job_id = service().start('pads', context=context,on_success=callback)
        except BaseException:
            if record.get('calibration_id'):control().calibration.phase(user,record['calibration_id'],'ready',expected=('moving',))
            raise
        if record.get('calibration_id'):
            control().calibration.bind_job(user,record['calibration_id'],job_id)
        del control().previews[payload['preview_id']]
    return jsonify(job_id=job_id), 202


@motor_bp.post('/pcb/teach')
def pcb_teach():
    payload = request.get_json()
    required = {'probe', 'pad_id', 'orientation', 'revision'}
    if not isinstance(payload, dict) or not required.issubset(payload) or set(payload) - required - {'layout_id'}:
        raise ControlError('记录对准请求格式无效。', 400)
    if payload['probe'] not in ('left', 'right'):
        raise ControlError('未知探针。', 400)
    _, dimensions, pads = layout()
    if 'layout_id' in payload and payload['layout_id'] != dimensions['layout_id']:
        raise ControlError('工程已变化，请重新选择焊盘并对准中心。', 409)
    require_orientation(payload, dimensions)
    point = resolve_pad(payload['pad_id'], pads, dimensions)
    value = profile(dimensions)
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
        anchor=dict(result['anchor'])
        offset=value['offsets'][payload['probe']]
        anchor['x']+=offset['x'] if payload['probe']=='left' else -offset['x']
        anchor['y']+=offset['y']
        store.record(payload['probe'], anchor, dimensions['layout_id'],
                     dimensions['orientation'], payload['revision'],consolidate=True,fixture=True,seed_fixture=value)

    service_object = service()
    job_id = service_object.start('teach', context=context, on_success=save_anchor)
    return jsonify(job_id=job_id), 202


def checked_calibration(user,identifier,dimensions):
    try:
        value=control().calibration.owned(user,identifier)
        control().calibration.valid(value,dimensions['layout_id'],dimensions['orientation'],
                                    control().store.read()['revision'],reference_frame(coordinates()))
        return value
    except (ValueError,OSError,KeyError) as exc:raise ControlError(str(exc))


def calibration_payload(keys):
    if not session.get('user_id'):raise ControlError('请先打开主页。',403)
    value=request.get_json()
    if not isinstance(value,dict) or set(value)!=set(keys):raise ControlError('标定请求参数无效。',400)
    return value


@motor_bp.get('/pcb/calibration')
def calibration_status():
    user,dimensions,_=layout(required=False)
    if not user:return jsonify(state='idle')
    value=control().calibration.read(user)
    if value.get('id') and value['state'] not in ('saved','cancelled'):
        try:
            if dimensions is None:raise ControlError('请先载入当前标定工程。')
            checked_calibration(user,value['id'],dimensions)
            last=service().status().get('last_job') or {}
            if value['state'] in ('moving','recording') and last.get('job_id')==value.get('pending_job_id') and last.get('state')=='failed':
                value=dict(value,state='ready' if value['state']=='moving' else 'aligning',last_error=last.get('error'))
                control().calibration.write(user,value)
        except ControlError as exc:value=dict(value,invalid_reason=str(exc))
    return jsonify(value)


@motor_bp.post('/pcb/calibration/start')
def calibration_start():
    p=calibration_payload(('probe','pad_ids','orientation','tolerance_mm'))
    user,dimensions,pads=layout();require_orientation(p,dimensions)
    if service().status()['busy']:raise ControlError('电机任务执行中，请等待。')
    if not isinstance(p['pad_ids'],list) or len(p['pad_ids'])!=5 or any(not isinstance(i,str) for i in p['pad_ids']):
        raise ControlError('请选择5个不同焊盘。',400)
    points=[resolve_pad(i,pads,dimensions) for i in p['pad_ids']]
    try:
        value=control().calibration.start(user,p['probe'],points,profile(dimensions),
                    reference_frame(coordinates()),dimensions['layout_id'],dimensions['orientation'],p['tolerance_mm'])
    except (ValueError,OSError,KeyError) as exc:raise ControlError(str(exc))
    return jsonify(value)


@motor_bp.post('/pcb/calibration/preview')
def calibration_preview():
    p=calibration_payload(('id',));user,dimensions,_=layout()
    value=checked_calibration(user,p['id'],dimensions)
    if value['state']!='ready':raise ControlError('请先结束当前步骤或选择重测点。')
    return create_preview(user,dimensions,{value['probe']:value['points'][value['index']]},calibration_record=value)


@motor_bp.post('/pcb/calibration/record')
def calibration_record():
    p=calibration_payload(('id',));user,dimensions,_=layout()
    if not session.get('motion_enabled'):raise ControlError('请先切换实机模式。')
    value=checked_calibration(user,p['id'],dimensions)
    if value['state']!='aligning':raise ControlError('请先移动到本点，再微调并对准中心。')
    calibration=control().calibration;point=value['points'][value['index']]
    context=dict(probe=value['probe'],point={a:point[a] for a in ('x','y')},
                 offsets=value['base_profile']['offsets'],pad_id=point['pad_id'])
    calibration.phase(user,p['id'],'recording',expected=('aligning',))
    def save(result):
        if service_object.stop_file.exists():raise ValueError('已停车，本点未记录。')
        calibration.record(user,p['id'],result)
    service_object=service()
    try:job=service_object.start('teach',context=context,on_success=save)
    except BaseException:
        calibration.phase(user,p['id'],'aligning',expected=('recording',));raise
    calibration.bind_job(user,p['id'],job)
    return jsonify(job_id=job),202


@motor_bp.post('/pcb/calibration/select')
def calibration_select():
    p=calibration_payload(('id','index'));user,dimensions,_=layout()
    checked_calibration(user,p['id'],dimensions)
    if service().status()['busy']:raise ControlError('请等待当前运动结束。')
    try:return jsonify(control().calibration.choose(user,p['id'],p['index']))
    except ValueError as exc:raise ControlError(str(exc))


@motor_bp.post('/pcb/calibration/cancel')
def calibration_cancel():
    p=calibration_payload(('id',));user=session['user_id']
    try:
        value=control().calibration.owned(user,p['id'])
        if service().status()['busy']:service().stop()
        return jsonify(control().calibration.write(user,dict(value,state='cancelled')))
    except ValueError as exc:raise ControlError(str(exc))


@motor_bp.post('/pcb/calibration/save')
def calibration_save():
    p=calibration_payload(('id',));user,dimensions,_=layout()
    value=checked_calibration(user,p['id'],dimensions)
    if service().status()['busy']:raise ControlError('电机任务执行中，不能保存补偿。')
    if value['state']!='complete' or not value['result']['acceptable']:
        raise ControlError('五点未完成或点间残差超出设置，请重测异常点。')
    anchor=dict(value['result']['new'],reference_id=value['reference']['reference_id'],
                reference_frame=value['reference'],calibration=value['result'])
    try:control().store.record(value['probe'],anchor,dimensions['layout_id'],dimensions['orientation'],
                                value['base_revision'],consolidate=True,fixture=True,seed_fixture=value['base_profile'])
    except ValueError as exc:raise ControlError(str(exc))
    control().calibration.write(user,dict(value,state='saved'))
    return pcb_config()


@motor_bp.post('/pcb/restore')
def pcb_restore():
    p=calibration_payload(('probe','revision'));_,dimensions,_=layout()
    if service().status()['busy']:raise ControlError('电机任务执行中，不能恢复补偿。')
    try:control().store.restore(p['probe'],dimensions['layout_id'],dimensions['orientation'],p['revision'],fixture=True)
    except ValueError as exc:raise ControlError(str(exc))
    return pcb_config()


@motor_bp.post('/pcb/invalidate')
def pcb_invalidate():
    p=calibration_payload(('probe','revision'));_,dimensions,_=layout()
    if service().status()['busy']:raise ControlError('电机任务执行中，不能清除对准。')
    try:control().store.invalidate(p['probe'],dimensions['layout_id'],dimensions['orientation'],p['revision'],fixture=True)
    except ValueError as exc:raise ControlError(str(exc))
    return pcb_config()
