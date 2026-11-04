import os
import uuid

from flask import Flask, send_from_directory, render_template, session, request, abort
from flask_cors import CORS
from flask_socketio import SocketIO

UPLOAD_FOLDER = os.environ.get("FDW_UPLOAD_FOLDER", "interface/static/uploads/")
sio = SocketIO(
        async_mode="threading",
        logger=False,
        engineio_logger=False,
        cors_allowed_origins="*",
        path=f"/socket.io",
    )


def generate_id():
    if "user_id" not in session:
        session["user_id"] = str(uuid.uuid4())

def create_app(test_config=None):
    instance_path = os.environ.get("FDW_INSTANCE_FOLDER")
    if instance_path is not None and not os.path.isabs(instance_path):
        raise ValueError("FDW_INSTANCE_FOLDER必须是绝对路径。")
    app = Flask(__name__, instance_relative_config=True, instance_path=instance_path)
    app.config.from_mapping(SECRET_KEY=os.environ.get("FDW_WEB_SECRET", "dev"),
                            MAX_CONTENT_LENGTH=128 * 1024 * 1024)

    if test_config is None:
        app.config.from_pyfile("config.py", silent=True)
    else:
        app.config.from_mapping(test_config)

    try:
        os.makedirs(app.instance_path)
    except OSError:
        pass

    CORS(app)

    @app.before_request
    def private_step_uploads():
        path = request.path
        if path.startswith('/static/uploads/') and ('/step/' in path or
                path.rsplit('/', 1)[-1].startswith(('step_bind','diagnostic_'))):
            abort(404)

    @app.route("/static/<path:path>")
    def global_static(path):
        return send_from_directory("static", path)

    @app.route("/")
    def home():
        generate_id()
        return render_template("base.html")

    from interface.kicad import kicad_bp
    app.register_blueprint(kicad_bp)

    from interface.motor_web import register_motor_control
    register_motor_control(app)

    from interface.workbench import workbench_bp
    app.register_blueprint(workbench_bp)
    from interface.design_web import design_bp
    app.register_blueprint(design_bp)

    from interface.servo_web import register as register_servo
    register_servo(app)

    from interface.diagnostic_web import register
    register(app)

    sio.init_app(app)
    from interface.auto_initialize import register as register_auto_initialize
    register_auto_initialize(app)

    return app

app = create_app()

if __name__ == "__main__":
    sio.run(app, host="0.0.0.0", port=5000)
