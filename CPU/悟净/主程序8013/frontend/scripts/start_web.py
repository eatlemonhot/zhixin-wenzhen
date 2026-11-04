#!/usr/bin/env python3
"""Start offline locally, or automatically initialize explicitly attached hardware."""
import argparse
import importlib.util
import json
import os
from pathlib import Path
import secrets
import sys

ROOT = Path(__file__).resolve().parents[1]
LOCAL_DEPS=ROOT/'.deps'
if LOCAL_DEPS.is_dir():sys.path.insert(0,str(LOCAL_DEPS))


def configure(args):
    data = Path(args.data_dir).expanduser().resolve() if args.data_dir else ROOT / 'runtime'
    data.mkdir(parents=True, exist_ok=True)
    secret_file = data / 'web-secret'
    secret = os.environ.get('FDW_WEB_SECRET')
    if not secret:
        try:
            with secret_file.open('x', encoding='utf-8') as handle:
                os.chmod(str(secret_file), 0o600)
                handle.write(secrets.token_hex(32))
        except FileExistsError:
            pass
        secret = secret_file.read_text().strip()
    if not secret or secret == 'dev':
        raise ValueError('Use a nonempty private FDW_WEB_SECRET or remove an invalid local web-secret file')
    upload = data / 'uploads'
    instance = data / 'instance'
    upload.mkdir(exist_ok=True)
    instance.mkdir(exist_ok=True)
    if args.motor_root:
        motor = Path(args.motor_root).expanduser().resolve()
        if not (motor / 'zdt/wujing_usb_probe/motorctl.py').is_file():
            raise ValueError('--motor-root must contain zdt/wujing_usb_probe/motorctl.py')
    else:
        motor = data / 'offline-controller-disabled'
        if (motor / 'zdt/wujing_usb_probe/motorctl.py').exists():
            raise ValueError('Offline placeholder unexpectedly contains a controller; choose another data directory')
    environment = dict(os.environ)
    environment.update(FDW_WEB_SECRET=secret, FDW_UPLOAD_FOLDER=str(upload),
                       FDW_INSTANCE_FOLDER=str(instance), WUJING_MOTOR_ROOT=str(motor),
                       PYTHONDONTWRITEBYTECODE='1',
                       FDW_AUTO_INITIALIZE='1' if args.motor_root and not getattr(args,'no_auto_initialize',False) else '0')
    if LOCAL_DEPS.is_dir():environment['PYTHONPATH']=str(LOCAL_DEPS)+os.pathsep+environment.get('PYTHONPATH','')
    command = [sys.executable, '-m', 'gunicorn', '--chdir', str(ROOT / 'web'),
               '--worker-class', 'gthread', '--workers', '1', '--threads', '8',
               '--bind', '%s:%s' % (args.host, args.port), '--timeout', '600',
               '--graceful-timeout', '30', 'interface:app']
    return environment, command, dict(url='http://%s:%s/' % (args.host,args.port),
            uploads=str(upload), instance=str(instance), motor_root=str(motor),
            hardware_backend_available=bool(args.motor_root),
            automatic_initialization=environment["FDW_AUTO_INITIALIZE"]=="1",
            motion_enabled_on_new_session=False, workers=1)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--host', default='127.0.0.1')
    parser.add_argument('--port', type=int, default=8001)
    parser.add_argument('--data-dir')
    parser.add_argument('--motor-root', help='实机控制器目录；服务启动后默认自动抬针和重建，维护请配合--no-auto-initialize')
    parser.add_argument('--no-auto-initialize',action='store_true',help='维护时禁用自动初始化；正常实机启动默认启用')
    parser.add_argument('--print-config', action='store_true', help='Print paths only; never print the secret or start a server')
    args = parser.parse_args()
    if not 1 <= args.port <= 65535:
        parser.error('port must be in 1..65535')
    try:
        environment, command, public = configure(args)
    except (OSError,ValueError) as error:
        parser.exit(2, str(error)+'\n')
    print(json.dumps(public, ensure_ascii=False, indent=2), flush=True)
    if args.print_config:
        return
    if os.name=='nt':
        if args.motor_root:parser.exit(2,'Windows本地预览不启用电机控制，请在悟净/Linux按原方式部署。\n')
        os.environ.update(environment);sys.path.insert(0,str(ROOT/'web'))
        from interface import app,sio
        app.config['TEMPLATES_AUTO_RELOAD']=True
        sio.run(app,host=args.host,port=args.port,use_reloader=False,allow_unsafe_werkzeug=True)
        return
    if importlib.util.find_spec('gunicorn') is None:
        parser.exit(2, 'Install web/requirements.lock.txt in this Python environment first.\n')
    os.execve(sys.executable, command, environment)


if __name__ == '__main__':
    main()
