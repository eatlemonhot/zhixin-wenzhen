#!/bin/bash
# 配置板端运行环境变量。
TASK_ROOT=/root/probe_algorithm_validation_v5b_20261028
DEPENDENCY_VENV=/root/probe_diagnosis_v3_20261027/venv
source "$DEPENDENCY_VENV/bin/activate"
export PATH="$DEPENDENCY_VENV/bin:/root/icraft3361_test/runtime/usr/bin:$PATH"
export LD_LIBRARY_PATH="/root/icraft3361_test/runtime/usr/lib/aarch64-linux-gnu${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
export OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1 MKL_NUM_THREADS=1 MALLOC_ARENA_MAX=2 PYTHONDONTWRITEBYTECODE=1
export PROBE_NODE_ROLE=board PROBE_INFERENCE_BACKEND=guarded
