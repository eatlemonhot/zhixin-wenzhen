import copy
from flask import Blueprint, current_app, jsonify, request, session
from . import kicad
from .motor_service import ControlError
from .pcb_web import layout,resolve_pad,profile
from .pcb_coordinates import PROBE_AXES

workbench_bp=Blueprint('workbench',__name__,url_prefix='/workbench')

@workbench_bp.before_request
def validate_request():
    from .motor_web import require_same_origin_json
    if request.content_length and request.content_length>32768:return jsonify(error='规划请求超过32 KB。'),413
    if request.method=='POST':
        from urllib.parse import urlsplit
        origin=request.headers.get('Origin')
        if origin and (urlsplit(origin).scheme,urlsplit(origin).netloc)!=(request.scheme,request.host):return jsonify(error='仅接受同源规划请求。'),403
        if not request.is_json or request.headers.get('X-Requested-With')!='XMLHttpRequest':return jsonify(error='请使用JSON规划接口。'),403

@workbench_bp.errorhandler(ControlError)
def error(exc):return jsonify(error=str(exc)),exc.status

@workbench_bp.get('/design')
def design():
    user,dimensions,pads=layout(required=False)
    if not dimensions:return jsonify(loaded=False,pages=[])
    with kicad.cache_lock:board=copy.deepcopy(kicad.layouts_data[user])
    return jsonify(loaded=True,layout_id=dimensions['layout_id'],dimensions=dimensions,pads=pads,
                   schematic=board.get('schematic',{}),graphics=board.get('graphics',[]),components=board.get('components',[]),
                   step_model=board.get('step_model'))

@workbench_bp.post('/plan')
def plan():
    p=request.get_json();user,dimensions,pads=layout()
    if not isinstance(p,dict) or set(p)!={'layout_id','orientation','pairs'}:raise ControlError('规划需要layout_id、orientation和pairs。',400)
    if p['layout_id']!=dimensions['layout_id'] or type(p['orientation']) is not int or p['orientation']!=dimensions['orientation']:raise ControlError('工程或方向已变化，请重新规划。',409)
    if not isinstance(p['pairs'],list) or not 1<=len(p['pairs'])<=128:raise ControlError('一次规划需包含1至128组双针测点。',400)
    output=[];ids=set()
    for pair in p['pairs']:
        if not isinstance(pair,dict) or set(pair)!={'id','left','right'} or not isinstance(pair['id'],str) or not 1<=len(pair['id'])<=80 or pair['id'] in ids:raise ControlError('测点组编号无效或重复。',400)
        ids.add(pair['id']);points={}
        for probe in ('left','right'):
            if pair[probe] is not None:
                points[probe]=resolve_pad(pair[probe],pads,dimensions)
                pad=pads[pair[probe]];points[probe].update(reference=pad.get('reference',''),pin=pad.get('pad_number',''),axes=PROBE_AXES[probe])
        if not points:raise ControlError('每组至少指定一个焊盘。',400)
        if pair['left'] is not None and pair['left']==pair['right']:raise ControlError('双针不能选择同一焊盘中心。',400)
        output.append(dict(id=pair['id'],targets=points,sequence=['await_probes_raised','position_xy','await_contact','measurement_handoff','await_probes_raised']))
    return jsonify(schema='circuitscout.probe-plan/v1',layout_id=dimensions['layout_id'],orientation=dimensions['orientation'],
        coordinate_frame='rotated_pcb_mm',pairs=output,calibration=profile(dimensions),
        execution=dict(executable=False,mode='offline',z_supported=False,collision_checked=False,
                       requirements=['电机上电并坐标重建','左右探针实物对准标定','确认探针已抬起','重新生成实时运动预览']),
        interfaces=dict(preview='/motor/pcb/preview',execute='/motor/pcb/move',status='/motor/status',stop='/motor/stop'),
        notes=['此接口仅规划，不连接串口。','器件高度、针体及挡板避让尚未实测，图中路径仅为XY示意。','下探、接触检测及测量完成握手由后续执行器实现。'])
