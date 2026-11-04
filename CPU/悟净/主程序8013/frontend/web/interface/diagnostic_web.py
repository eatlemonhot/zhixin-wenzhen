import copy,sys,threading
from pathlib import Path
from flask import Blueprint,current_app,request,jsonify,session,g,send_file
from . import kicad
from .pcb_web import layout
from . import pcb_coordinates
from .design_import import build_job as build_draft_job
from .motor_service import ControlError
from .unpowered_measurements import UnpoweredMeasurements,FREQUENCIES,RANGES
ROOT=Path(__file__).resolve().parents[3]
sys.path.insert(0,str(ROOT))
from probe_system.common import FlowError

diagnostic_bp=Blueprint('diagnostic',__name__,url_prefix='/diagnosis')
def register(app):
    app.extensions['measurement_lock']=threading.RLock()
    from .r4_capture_client import command,capture_job
    from .closed_loop_measurements import ClosedLoopMeasurements
    app.extensions['unpowered_measurements']=ClosedLoopMeasurements(Path(app.instance_path)/'unpowered_measurements',
        app.extensions['motor_service'],app.extensions['servo_service'],app.extensions['pcb_control'],command,capture_job)
    app.register_blueprint(diagnostic_bp)
    from .unpowered_model_web import register as register_unpowered_model
    register_unpowered_model(app)
    @app.before_request
    def exclusive_station():
        if request.method=='POST':
            current_app.extensions['measurement_lock'].acquire();g.diagnostic_mutation_lock=current_app.extensions['measurement_lock']
        measurements=current_app.extensions['unpowered_measurements']
        if request.method=='POST' and measurements.busy:
            if request.path in ('/motor/stop','/motor/servo/stop'):
                measurements.cancel(emergency=True)
            elif request.path!='/motor/servo/read' and not (request.path.startswith('/diagnosis/unpowered/') and request.path.endswith(('/cancel','/confirm-clearance'))):
                return jsonify(error='断电实测正在执行，工程与手动动作已锁定；可以取消测量或停车。'),409
        cycle=current_app.extensions.get('servo_cycle_service')
        if request.method=='POST' and cycle and cycle.busy and request.path=='/motor/stop':
            cycle.cancel(cycle.current['owner'],stop=True)
        if request.method=='POST' and cycle and cycle.busy and request.path not in ('/motor/stop','/motor/servo/stop','/motor/servo/cycle/cancel','/motor/servo/cycle/confirm'):
            return jsonify(error='落针测量周期进行中，请先完成、取消或停波。'),409
    @app.teardown_request
    def release_station(exc):
        lock=getattr(g,'diagnostic_mutation_lock',None)
        if lock:lock.release()

@diagnostic_bp.before_request
def authorize():
    if request.method=='POST' and (not kicad.same_origin_upload() or request.headers.get('X-Requested-With')!='XMLHttpRequest' or not request.is_json):return jsonify(error='请使用当前页面JSON请求。'),403
    limit=2097152 if request.path.endswith('/calibration') else 32768
    if request.content_length and request.content_length>limit:return jsonify(error='请求过大。'),413
    if not session.get('user_id'):return jsonify(error='请先打开主页。'),403

@diagnostic_bp.errorhandler(ValueError)
def invalid(exc):return jsonify(error=str(exc)),422

@diagnostic_bp.errorhandler(ControlError)
def controller_failure(exc):return jsonify(error=str(exc)),exc.status



def unpowered_job():
    payload=request.get_json()
    if not isinstance(payload,dict):raise ValueError('任务设置应为JSON对象。')
    if payload.get('power_mode')!='unpowered':raise ValueError('断电入口只接受断电测试；请勿填写带电设置。')
    user,dims,_=layout(required=False)
    if not dims or payload.get('layout_id')!=dims['layout_id']:
        raise ControlError('工程已变化，请重新生成方案。',409)
    if current_app.extensions['unpowered_measurements'].busy:raise ControlError('已有诊断正在执行，请等待结束。',409)
    motor=current_app.extensions['motor_service']
    with motor._lock:
        if motor.status()['busy']:raise ControlError('电机任务忙，请等待结束。',409)
        with kicad.cache_lock:board=copy.deepcopy(kicad.layouts_data[user])
        job=build_draft_job(board,dims,payload)
        from .pcb_web import profile,resolve_pad,coordinates
        from .r4_capture_client import command
        import math
        mechanical=profile(dims);state=motor.status();blockers=[];limits=None;raw_available=False
        if not all(mechanical.get('alignment',{}).get(k) for k in ('left','right')):
            blockers.append(dict(code='alignment_missing',message='两针设备对准记录不完整；方案可查看，启动前须完成对准。'))
        try:limits=coordinates()
        except (ValueError,OSError,KeyError) as exc:blockers.append(dict(code='coordinates_unavailable',message=str(exc)))
        if not state['ready'] or state['stopped']:
            blockers.append(dict(code='motor_not_ready',message='机械控制当前未就绪或保护停车。完整方案已生成，实际移动尚未获准。'))
        diagnostic=board['diagnostic_import'];by_net={}
        for identifier,pad in board['pads'].items():
            net=diagnostic['net_aliases'].get(pad.get('net'))
            if net is not None and pad.get('is_allowed'):by_net.setdefault(net,[]).append(identifier)
        drive=payload['excitation_net'];ground=payload['ground_net']
        requested=payload.get('measurement_nets')
        if requested is None:requested=[]
        if not requested:requested=[n for n in by_net if n.startswith('TP_') and n not in (drive,ground)]
        if not requested and payload.get('analysis_mode','measurement')!='measurement':
            requested=[n for n in by_net if n not in (drive,ground)]
        if not isinstance(requested,list) or not 1<=len(requested)<=8 or len(set(requested))!=len(requested):
            raise ValueError('请选择1～8个互不重复的测量网络。')
        if any(not isinstance(n,str) or n not in by_net or n in (drive,ground) for n in requested):raise ValueError('测量网络无效。')
        anchors=mechanical.get('anchors',{})
        def choose(net,probe):
            candidates=by_net[net];preferred=(anchors.get(probe) or {}).get('pad_id')
            if preferred in candidates:identifier=preferred
            else:identifier=sorted(candidates,key=lambda key:(not str(board['pads'][key].get('reference','')).startswith(('R','C','TP','H','J')),key))[0]
            return resolve_pad(identifier,board['pads'],dims,probe,.1)
        source=choose(drive,'left');actions=[];points=[]
        for net in requested:
            measured=choose(net,'right');points.append(measured)
            motion_points={k:dict(x=p['x'],y=p['y']) for k,p in [('left',source),('right',measured)]}
            try:
                targets=pcb_coordinates.build_targets(motion_points,mechanical)
                if limits is not None and state['ready'] and state['positions_mm']:
                    pcb_coordinates.plan_moves(state['positions_mm'],targets,limits)
            except (ValueError,KeyError) as exc:blockers.append(dict(code='motion_preview_blocked',message=net+'：'+str(exc)))
            for rs in RANGES:
                for frequency in FREQUENCIES:
                    actions.append(dict(action_id=len(actions),excitation=source,measurement=measured,measurement_net=net,
                                        frequency_hz=frequency,rs_ohm=rs,motion_points=motion_points))
        peak=job['test_constraints']['max_dut_input_peak_V'];gain=min(64,math.floor(peak*640+1e-9))
        if gain<1:raise ValueError('本入口激励峰值上限过低，无法使用已验证的小幅DDS配置。')
        selected={k:payload[k] for k in ('layout_id','ground_net','excitation_net','power_mode','rails','max_input_peak_V')}
        for key in ('measurement_nets','reference_label','analysis_mode','calibration_id','reference_id','dut_id'):
            if key in payload:selected[key]=payload[key]
        reference=payload.get('reference_label','unknown')
        if reference not in ('unknown','user_declared_normal','suspected_fault'):raise ValueError('板况记录无效。')
        job.update(schema='pcbdiag-unpowered-measurement-job/1.0',planning_payload=selected,actions=actions,
                   mechanical=mechanical,movement_profile='measurement_slow_v1',frames_per_path=16,decimation_log2=4,gain_q11=gain,
                   reference_label=reference,scope=dict(excitation_net=drive,measurement_nets=requested,
                         frequencies_hz=list(FREQUENCIES),rs_nominal_ohm=list(RANGES),paths=['VA','VB','PROBE','VA_check']),
                   limitations=['结果尺度：ADC码、通路比值与名义Rs阻抗估算。',
                                '针位信息来源：控制指令回读。',
                                '当前任务输出断电测量结果，模型分析使用对应输入合同。',
                                '测量顺序使用任务ID、相对时间和采样tick。'])
        job['execution'].update(mode='hardware_measurement',hardware_qualified=False,actions_executed=False)
        job['plan_source']='导入工程的网络/焊盘连接及本次扫频条件'
        job['operator_clearance_required']=True
        job['unpowered_readiness']=dict(hardware_execution_available=False,raw_capture_available=None,hardware_checked=False,
            automatic_fault_diagnosis_available=False,measurement_only=True,blockers=blockers,
            warnings=job['limitations'],total_conditions=len(actions),frames_per_path=16)
        service=current_app.extensions['unpowered_measurements']
        if payload.get('analysis_mode','measurement')!='measurement':
            job=service.prepare_job(session['user_id'],job,payload,choose)
        job=service.create(session['user_id'],job)
        return job


@diagnostic_bp.post('/unpowered/plan')
def unpowered_plan():
    return jsonify(unpowered_job())


@diagnostic_bp.post('/unpowered/start')
def unpowered_start():
    data=request.get_json()
    if not isinstance(data,dict):raise ValueError('启动参数无效。')
    if data.get('fixed_ground_connected') is not True:raise ControlError('整板节点扫频需独立固定共地，请接好DUT GND后明确确认；不能用ADC针替代回流。',409)
    if not session.get('motion_enabled'):raise ControlError('请先切换到实机模式，再开始移动落针测量。',409)
    service=current_app.extensions['unpowered_measurements'];folder=service.owned(session['user_id'],data.get('job_id'))
    import json
    job=json.loads((folder/'job.json').read_text(encoding='utf-8'));_,dims,_=layout(required=False)
    if not dims or dims['layout_id']!=job['import_provenance']['layout_id'] or dims['orientation']!=job['mechanical']['orientation']:
        raise ControlError('工程或方向已变化，请重新生成方案。',409)
    if {k:v for k,v in data.items() if k not in ('job_id','fixed_ground_connected')}!=job['planning_payload']:raise ValueError('测量设置与已保存方案不同，请重新生成。')
    motor_state=current_app.extensions['motor_service'].status()
    if current_app.extensions['unpowered_measurements'].busy or motor_state['busy']:raise ControlError('已有任务正在执行。',409)
    if motor_state['stopped'] or not motor_state['ready']:raise ControlError('完整方案已生成；当前机械保护停车或未就绪，尚不能执行移动。',409)
    if current_app.extensions['pcb_control'].store.read()['revision']!=job['mechanical']['revision']:raise ValueError('对准配置已变化，请重新生成方案。')
    job['fixed_common_ground']=dict(connected=True,confirmation_source='operator',hardware_verified=False,dut_net=job['planning_payload']['ground_net'])
    from .unpowered_measurements import write_json
    write_json(folder/'job.json',job)
    return jsonify(service.start(session['user_id'],job['job_id'])),202


@diagnostic_bp.get('/unpowered/readiness')
def unpowered_readiness():
    """只读准备状态；不解除停车、不回零、不落针。"""
    user,dims,_=layout(required=False);motor=current_app.extensions['motor_service'].status()
    servo=current_app.extensions['servo_service'].status();checks=[]
    checks.append(dict(id='project',ok=bool(dims),message='当前工程已载入。' if dims else '当前浏览器会话尚未导入工程。'))
    checks.append(dict(id='mode',ok=bool(session.get('motion_enabled')),message='实机模式已开启。' if session.get('motion_enabled') else '需要开启实机模式；选择断电测试本身不会开启电机控制。'))
    checks.append(dict(id='motor',ok=bool(motor['ready'] and not motor['stopped'] and not motor['busy']),
                       message='四轴已检查并就绪。' if motor['ready'] and not motor['stopped'] else '软件停车锁仍在；请先检查设备，再通过本区解除停车。' if motor['stopped'] else '请点击检查设备，核验静止状态与现有参考。'))
    checks.append(dict(id='servo',ok=bool(servo.get('checked') and servo.get('available') and not servo.get('error_code')),
                       message='双针PWM状态已读；每次移位前仍需目视确认离板。' if servo.get('checked') and servo.get('available') else '尚未读取双针状态。'))
    from .r4_capture_client import command
    try:
        info=command('INFO');adc=command('ADC_JOB_STATUS');dac=command('DAC_STATUS');mode=command('MODE_STATUS')
        ready=bool(info.get('implementation_revision')=='DIG5-R4-LOWRATE-BULK' and info.get('adc_ready') and info.get('dds_ready'))
        if request.args.get('analysis_mode','measurement')!='measurement':
            ready=ready and info.get('board_revision')=='LXB-R4-SENSE117' and info.get('sense_protocol')==1
        checks.append(dict(id='acquisition',ok=ready,message='7020采集板已连接，R4原码接口可用。' if ready else '采集板配套或ADC/DDS状态不满足。'))
        idle=adc.get('state')!=1 and not dac.get('enabled') and not dac.get('busy') and mode.get('mode')==0 and not mode.get('output_enabled')
        checks.append(dict(id='idle',ok=idle,message='激励关闭，采集空闲。' if idle else '已有激励或采集活动，请先停止当前任务。'))
    except Exception:
        checks.append(dict(id='acquisition',ok=False,message='7020采集板192.168.126.50:5001未响应；网页服务器能访问不代表采集板已连接。'))
    return jsonify(checks=checks,ready=all(c['ok'] for c in checks),motor=motor,servo=servo,
                   layout_id=dims['layout_id'] if dims else None,motion_enabled=bool(session.get('motion_enabled')))


@diagnostic_bp.post('/unpowered/check-devices')
def unpowered_check_devices():
    if request.get_json()!={}:raise ValueError('检查设备不接受自定义运动参数。')
    if not session.get('motion_enabled'):raise ControlError('请先开启实机模式，再检查机械设备。',409)
    motor=current_app.extensions['motor_service'];initializer=current_app.extensions.get('auto_initializer')
    if initializer:initializer.save(phase='fault',attempted=True,message='正在按网页请求检查设备，不自动回零。')
    def finish(result):
        if initializer and result.get('reference_valid') and result.get('ready'):
            initializer.save(phase='ready',attempted=True,message='网页只读检查通过，沿用现有机械参考。')
    return jsonify(job_id=motor.start('check',on_success=finish)),202


@diagnostic_bp.post('/unpowered/clear-stop')
def unpowered_clear_stop():
    data=request.get_json()
    if not isinstance(data,dict) or set(data)!={'confirm_probes_raised'} or data['confirm_probes_raised'] is not True:
        raise ValueError('请先目视确认双针已离板。')
    if not session.get('motion_enabled'):raise ControlError('请先开启实机模式。',409)
    motor=current_app.extensions['motor_service'];state=motor.status();last=state.get('last_job') or {}
    if state['busy'] or last.get('action')!='check' or last.get('state')!='completed':
        raise ControlError('请先点击检查设备，完成四轴停稳和参考核验。',409)
    import json,time
    path=motor.runtime/(last['job_id']+'.json')
    result=json.loads(path.read_text(encoding='utf-8'))
    if time.time()-path.stat().st_mtime>60 or result.get('reference_valid') is not True or result.get('motion_commands_sent')!=0:
        raise ControlError('没有最近一分钟内通过的只读参考检查；保持停车，请重新检查。',409)
    initializer=current_app.extensions.get('auto_initializer')
    if initializer:initializer.save(phase='fault',attempted=True,message='解除软件停车后等待只读检查，不自动回零。')
    motor.clear_stop()
    def finish(checked):
        if initializer and checked.get('reference_valid') and checked.get('ready'):
            initializer.save(phase='ready',attempted=True,message='现有参考检查通过，未重新回零。')
    return jsonify(job_id=motor.start('check',on_success=finish)),202


@diagnostic_bp.get('/unpowered/<key>/report')
def unpowered_report(key):
    folder=current_app.extensions['unpowered_measurements'].owned(session['user_id'],key)
    if not (folder/'report.html').exists():
        if not (folder/'report.json').exists():raise ControlError('任务尚未生成网页报告。',409)
        import json
        from flask import Response
        from .unpowered_report import render_report
        result=json.loads((folder/'report.json').read_text(encoding='utf-8'))
        return Response(render_report(result,download_base='/diagnosis/unpowered/'+key+'/files/'),mimetype='text/html',headers={'Cache-Control':'no-store'})
    return send_file(str(folder/'report.html'),mimetype='text/html',max_age=0)


@diagnostic_bp.get('/unpowered/<key>/plan')
def unpowered_saved_plan(key):
    import json
    folder=current_app.extensions['unpowered_measurements'].owned(session['user_id'],key)
    state=json.loads((folder/'status.json').read_text(encoding='utf-8'))
    if state['state']!='planned':raise ControlError('该方案已执行，请生成新的测量方案。',409)
    return jsonify(json.loads((folder/'job.json').read_text(encoding='utf-8')))


@diagnostic_bp.post('/unpowered/<key>/confirm-clearance')
def unpowered_confirm_clearance(key):
    data=request.get_json()
    if not isinstance(data,dict) or set(data)!={'token','confirmed'} or data['confirmed'] is not True:
        raise ValueError('需要对当前阶段目视确认双针已离板。')
    return jsonify(current_app.extensions['unpowered_measurements'].confirm_clearance(session['user_id'],key,data['token']))


@diagnostic_bp.get('/unpowered/<key>')
def unpowered_status(key):
    return jsonify(current_app.extensions['unpowered_measurements'].status(session['user_id'],key))


@diagnostic_bp.post('/unpowered/<key>/cancel')
def unpowered_cancel(key):
    service=current_app.extensions['unpowered_measurements'];service.owned(session['user_id'],key)
    if not service.active or service.active['key']!=key:raise ValueError('该测量任务没有在执行。')
    service.cancel(session['user_id']);return jsonify(state='cancelling')


@diagnostic_bp.post('/unpowered/<key>/resume')
def unpowered_resume(key):
    if request.get_json()!={'fixed_ground_connected':True}:raise ValueError('续测需要重新确认DUT固定共地，且不接受其他设置修改。')
    if not session.get('motion_enabled'):raise ControlError('请先切换实机模式。',409)
    service=current_app.extensions['unpowered_measurements'];folder=service.owned(session['user_id'],key)
    import json
    job=json.loads((folder/'job.json').read_text(encoding='utf-8'));_,dims,_=layout(required=False)
    if not dims or dims['layout_id']!=job['import_provenance']['layout_id'] or dims['orientation']!=job['mechanical']['orientation']:
        raise ValueError('工程或方向已变化，不能续测。')
    motor_state=current_app.extensions['motor_service'].status()
    if current_app.extensions['unpowered_measurements'].busy or motor_state['busy']:raise ControlError('已有其他任务。',409)
    if motor_state['stopped'] or not motor_state['ready']:raise ControlError('机械保护尚未解除或未通过检查，不能续测。',409)
    return jsonify(service.start(session['user_id'],key,resume=True)),202


@diagnostic_bp.post('/unpowered/<key>/verify-motion')
def unpowered_verify_motion(key):
    """只抬针低速定位到方案测点，不落针、不启激励、不采集。"""
    data=request.get_json()
    if not isinstance(data,dict) or set(data)!={'action_id'} or type(data['action_id']) is not int:
        raise ValueError('抬针验证需要方案中的整数action_id。')
    if not session.get('motion_enabled'):raise ControlError('请先切换实机模式。',409)
    service=current_app.extensions['unpowered_measurements'];folder=service.owned(session['user_id'],key)
    import json
    job=json.loads((folder/'job.json').read_text(encoding='utf-8'));_,dims,_=layout(required=False)
    if not dims or dims['layout_id']!=job['import_provenance']['layout_id'] or dims['orientation']!=job['mechanical']['orientation']:
        raise ValueError('工程或方向已变化，不能验证旧方案。')
    if not 0<=data['action_id']<len(job['actions']):raise ValueError('action_id超出方案范围。')
    motor=current_app.extensions['motor_service'];state=motor.status()
    if current_app.extensions['unpowered_measurements'].busy or service.busy or state['busy'] or state['stopped'] or not state['ready']:
        raise ControlError('需要空闲、停稳且参考有效的机械状态。',409)
    if current_app.extensions['pcb_control'].store.read()['revision']!=job['mechanical']['revision']:
        raise ValueError('机械对准配置已变化。')
    from .r4_capture_client import command
    if command('DAC_STATUS').get('enabled'):raise ValueError('请先关闭激励，再验证移位。')
    action=job['actions'][data['action_id']]
    context=dict(points=action['motion_points'],profile=job['mechanical'],movement_profile='measurement_slow_v1')
    return jsonify(job_id=motor.start('pads',context=context),movement_profile='measurement_slow_v1',
                   lowered=False,excitation_enabled=False),202


@diagnostic_bp.get('/unpowered/<key>/files/<name>')
def unpowered_file(key,name):
    if name not in ('report.json','report.md','report.html','measurements.csv','measurement_bundle.zip','job.json','features.json','reference.json','diagnosis.json'):
        raise ControlError('文件不存在。',404)
    folder=current_app.extensions['unpowered_measurements'].owned(session['user_id'],key)
    if not (folder/name).is_file():raise ControlError('文件尚未生成。',409)
    return send_file(str(folder/name),as_attachment=True,download_name=name)


@diagnostic_bp.get('/unpowered/assets')
def unpowered_assets():
    return jsonify(current_app.extensions['unpowered_measurements'].catalog(session['user_id']))


@diagnostic_bp.post('/unpowered/calibration')
def unpowered_calibration():
    payload=request.get_json()
    if not isinstance(payload,dict):raise ValueError('校准数据错误')
    return jsonify(current_app.extensions['unpowered_measurements'].put_calibration(session['user_id'],payload)),201





