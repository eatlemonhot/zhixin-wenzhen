#!/usr/bin/env python3
import argparse
import json
from pathlib import Path
import re
import shutil

ROOT = Path(__file__).resolve().parents[1]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--name', required=True)
    parser.add_argument('--base-root', default='/root/fdw_circuitscout')
    parser.add_argument('--venv', help='Existing Python venv on the target host; defaults to current/venv')
    parser.add_argument('--instance-dir', help='Existing persistent instance directory to share; default creates a new empty instance')
    args = parser.parse_args()
    if not re.fullmatch(r'[A-Za-z0-9_-]{1,64}', args.name):
        parser.error('name must be 1..64 letters, digits, underscores or hyphens')
    base = Path(args.base_root).expanduser().resolve()
    releases = base / 'releases'
    if not releases.is_dir():
        parser.error('Expected an existing Wujing releases directory')
    venv = Path(args.venv).expanduser().resolve() if args.venv else (base / 'current/venv').resolve()
    if not (venv / 'bin/python').is_file():
        parser.error('Expected an existing target-host Python virtual environment')
    uploads = base / 'data/uploads'
    if not uploads.is_dir():
        parser.error('Expected an existing persistent uploads directory')
    instance = Path(args.instance_dir).expanduser().resolve() if args.instance_dir else None
    if instance is not None and not instance.is_dir():
        parser.error('--instance-dir must already exist; it will not be created or copied')
    target = releases / args.name
    if target.exists() or target.is_symlink():
        parser.error('Release already exists; choose a new name')
    target.mkdir()
    try:
        shutil.copytree(ROOT / 'web', target / 'app',
                        ignore=shutil.ignore_patterns('__pycache__','*.pyc','instance','uploads','.git','*.log'))
        (target / 'venv').symlink_to(venv, target_is_directory=True)
        (target / 'app/interface/static/uploads').symlink_to(uploads, target_is_directory=True)
        if instance is None:
            (target / 'app/instance').mkdir()
        else:
            (target / 'app/instance').symlink_to(instance, target_is_directory=True)
        metadata = ROOT / 'PACKAGE_INFO.json'
        if metadata.exists():
            shutil.copy2(metadata, target / 'HANDOVER_VERSION.json')
    except BaseException:
        shutil.rmtree(target)
        raise
    print(json.dumps(dict(prepared_release=str(target), current_unchanged=True,
            service_restarted=False, motor_controller_unchanged=True,
            instance=str(instance) if instance else 'new empty instance; calibration must be established',
            next_step='Review candidate, then follow docs/部署说明.md for an explicit offline-to-live switch.'),
            ensure_ascii=False, indent=2))


if __name__ == '__main__':
    main()
