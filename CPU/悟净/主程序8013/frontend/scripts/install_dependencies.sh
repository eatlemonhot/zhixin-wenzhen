#!/bin/sh
set -eu
package_root=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
task_python=${PYTHON_BIN:-python3}
task_venv="$package_root/.venv"
"$task_python" -m venv "$task_venv"
if [ "$#" -gt 0 ]; then
    if [ "$#" -ne 2 ] || [ "$1" != '--wheelhouse' ]; then
        printf '%s\n' 'Usage: bash scripts/install_dependencies.sh [--wheelhouse /absolute/wheelhouse]' >&2
        exit 2
    fi
    "$task_venv/bin/python" -m pip install --no-index --find-links "$2" -r "$package_root/web/requirements.lock.txt"
else
    "$task_venv/bin/python" -m pip install -r "$package_root/web/requirements.lock.txt"
fi
printf '%s\n' 'Dependencies installed. Start with: .venv/bin/python scripts/start_web.py'
