import os
from urllib.parse import urlsplit

from flask import Blueprint, current_app, jsonify, request, session

from .motor_service import ControlError, MotorService
from .motion_executor import MotionExecutor

motor_bp = Blueprint('motor', __name__, url_prefix='/motor')


def register_motor_control(app):
    root = os.environ.get('WUJING_MOTOR_ROOT', '/root/wujing_motor_control')
    runtime = os.path.join(app.instance_path, 'motor_jobs')
    app.extensions['motor_service'] = MotorService(
        root, runtime, executor=None if app.config.get('TESTING') else MotionExecutor(root, runtime))
    from .pcb_web import PCBControl
    app.extensions['pcb_control'] = PCBControl(os.path.join(app.instance_path, 'pcb_alignment.json'))
    app.register_blueprint(motor_bp)


def service():
    return current_app.extensions['motor_service']


@motor_bp.before_request
def require_same_origin_json():
    if request.method == 'POST':
        origin = request.headers.get('Origin')
        if origin and (urlsplit(origin).scheme, urlsplit(origin).netloc) != (request.scheme, request.host):
            return jsonify(error='仅接受本页面发起的电机操作。'), 403
        if request.headers.get('X-Requested-With') != 'XMLHttpRequest' or not request.is_json:
            return jsonify(error='电机操作需使用页面JSON接口。'), 403
        if request.content_length is not None and request.content_length > 2048:
            return jsonify(error='请求过大。'), 413
        if (session.get('motion_enabled', False)
                and request.path in ('/motor/jog', '/motor/pcb/move')
                and current_app.extensions.get('servo_service') is None):
            raise ControlError('舵机服务未注册，XY未启动。', 503)
        if request.path in ('/motor/check','/motor/rebuild','/motor/circle','/motor/jog','/motor/clear-stop','/motor/pcb/move','/motor/pcb/teach') and not session.get('motion_enabled',False):
            return jsonify(error='当前为离线规划模式，请确认电机上电后切换到实机模式。'),409


@motor_bp.errorhandler(ControlError)
def control_error(exc):
    return jsonify(error=str(exc)), exc.status


@motor_bp.after_request
def no_cache(response):
    response.headers['Cache-Control'] = 'no-store'
    return response


@motor_bp.get('/status')
def status():
    return jsonify(dict(service().status(),motion_enabled=session.get('motion_enabled',False)))


@motor_bp.post('/check')
def check():
    request.get_json()
    return jsonify(job_id=service().start('check')), 202


def empty_task(action):
    if request.get_json() != {}:
        raise ControlError('该操作不接受自定义运动参数。', 400)
    return jsonify(job_id=service().start(action)), 202


@motor_bp.post('/rebuild')
def rebuild():
    return empty_task('rebuild')


@motor_bp.post('/circle')
def circle():
    return empty_task('circle')


@motor_bp.post('/jog')
def jog():
    return jsonify(job_id=service().start('jog', request.get_json())), 202


@motor_bp.post('/stop')
def stop():
    request.get_json()
    return jsonify(service().stop())


@motor_bp.post('/clear-stop')
def clear_stop():
    request.get_json()
    return jsonify(service().clear_stop())


@motor_bp.post('/mode')
def execution_mode():
    payload=request.get_json()
    if not isinstance(payload,dict) or set(payload)!={'enabled'} or type(payload['enabled']) is not bool:
        raise ControlError('模式请求需要布尔值enabled。',400)
    if service().status()['busy']:raise ControlError('任务运行中请先停车，再更换模式。',409)
    if not payload['enabled']:
        with service()._lock:
            if service().status()['busy']:
                raise ControlError('任务运行中，请等待结束。')
            service().release_idle()
    session['motion_enabled']=payload['enabled']
    return jsonify(motion_enabled=payload['enabled'])

