from urllib.parse import urlsplit

from pathlib import Path
from flask import Blueprint, current_app, jsonify, request, session, send_file

from .servo_service import ServoError, ServoService
from .servo_cycle_service import ServoCycleService
from .servo_positions import require_cycle_positions
from .motor_service import ControlError

servo_bp = Blueprint('servo', __name__, url_prefix='/motor/servo')


def register(app):
    app.extensions['servo_service'] = ServoService(settings_path=Path(app.instance_path) / 'servo_positions.json')
    app.extensions['servo_cycle_service'] = ServoCycleService(Path(app.instance_path) / 'servo_cycles')
    def prepare_motion(stop_requested):
        if app.extensions['servo_cycle_service'].busy:
            raise ServoError('落针测量周期正在运行，XY未启动。')
        return app.extensions['servo_service'].raise_for_motion(stop_requested)
    app.extensions['motor_service'].prepare_motion = prepare_motion
    app.register_blueprint(servo_bp)


def service():
    return current_app.extensions['servo_service']


@servo_bp.before_request
def authorize():
    if not session.get('user_id'):
        return jsonify(error='请先打开主页。'), 403
    if request.method == 'POST':
        origin = request.headers.get('Origin')
        if origin and (urlsplit(origin).scheme, urlsplit(origin).netloc) != (request.scheme, request.host):
            return jsonify(error='仅接受当前网页发起的舵机操作。'), 403
        if request.headers.get('X-Requested-With') != 'XMLHttpRequest' or not request.is_json:
            return jsonify(error='请使用当前网页的JSON接口。'), 403
        if request.content_length and request.content_length > 2048:
            return jsonify(error='请求过大。'), 413
        if request.path not in ('/motor/servo/read', '/motor/servo/stop', '/motor/servo/cycle/cancel', '/motor/servo/cycle/confirm') and not session.get('motion_enabled', False):
            return jsonify(error='请先切换到实机模式，再操作舵机。'), 409


@servo_bp.errorhandler(ServoError)
def failure(exc):
    return jsonify(error=str(exc), state=service().status()), exc.status


@servo_bp.errorhandler(ControlError)
def controller_failure(exc):
    return jsonify(error=str(exc)), exc.status


@servo_bp.after_request
def no_cache(response):
    response.headers['Cache-Control'] = 'no-store'
    return response


@servo_bp.get('/status')
def status():
    return jsonify(service().status())


def perform(action):
    payload = request.get_json()
    if not isinstance(payload, dict) or 'action' in payload:
        raise ServoError('舵机参数格式不正确。', 400)
    motor = current_app.extensions['motor_service']
    with motor._lock:
        cycle = current_app.extensions['servo_cycle_service']
        if cycle.busy:
            if action == 'stop':
                return jsonify(cycle.cancel(cycle.current['owner'], stop=True))
            raise ServoError('落针测量周期正在持有舵机，请使用周期中的取消或停波。')
        if action != 'stop' and motor.status()['busy']:
            raise ServoError('XY电机任务运行中，请等待结束。')
        if action == 'stop' and motor.status()['busy']:
            motor.stop()
        elif action != 'read':
            try:
                motor.release_idle()
            except ControlError:
                if action != 'stop':
                    raise
                # An emergency PWM stop remains available after a USB fault.
                motor.stop()
        return jsonify(service().run(dict(payload, action=action)))


@servo_bp.post('/read')
def read():
    return perform('read')


@servo_bp.post('/up')
def up():
    return perform('up')


@servo_bp.post('/down')
def down():
    return perform('down')


@servo_bp.post('/stop')
def stop():
    return perform('stop')


@servo_bp.post('/configure')
def configure():
    return perform('configure')


@servo_bp.post('/clear-error')
def clear_error():
    return perform('clear-error')


@servo_bp.get('/cycle')
def cycle_status():
    return jsonify(current_app.extensions['servo_cycle_service'].status(session['user_id']))


@servo_bp.post('/cycle/start')
def cycle_start():
    motor = current_app.extensions['motor_service']
    with motor._lock:
        if motor.status()['busy']:
            raise ServoError('XY任务运行中，请等待结束。')
        current_app.extensions['servo_cycle_service'].validate_payload(request.get_json())
        motor.release_idle()
        state = service().prepare_cycle()
        if state.get('revision') != 124 or state.get('error_code'):
            raise ServoError('落针测量周期需要加载124位流，并清除舵机错误。')
        try:
            require_cycle_positions(state, presets=service()._presets)
        except RuntimeError as exc:
            raise ServoError(str(exc))
        service()._up_observed = None
        return jsonify(current_app.extensions['servo_cycle_service'].start(session['user_id'], request.get_json())), 202


@servo_bp.post('/cycle/confirm')
def cycle_confirm():
    return jsonify(current_app.extensions['servo_cycle_service'].confirm(session['user_id'], request.get_json()))


@servo_bp.post('/cycle/cancel')
def cycle_cancel():
    if request.get_json() != {}:
        raise ServoError('取消周期不接受其他参数。', 400)
    return jsonify(current_app.extensions['servo_cycle_service'].cancel(session['user_id']))


@servo_bp.get('/cycle/files/<name>')
def cycle_file(name):
    return send_file(str(current_app.extensions['servo_cycle_service'].capture_file(session['user_id'], name)), as_attachment=True)

