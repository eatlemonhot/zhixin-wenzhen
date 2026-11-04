from array import array
from datetime import timedelta
import hashlib
import json
import os
from pathlib import Path
import threading
import time

import numpy as np


class NeuralRanker:
    def __init__(self, folder, backend=None, compiled=None, device=None):
        self.folder = Path(folder)
        self.backend = backend or os.environ.get('PROBE_PASSIVE_INFERENCE_BACKEND', 'cpu')
        if self.backend not in ('cpu', 'npu', 'guarded'):
            raise ValueError('推理后端错误')
        self.weights = dict(np.load(self.folder / 'cpu_weights.npz'))
        self.normalization = dict(np.load(self.folder / 'normalization.npz'))
        self.compiled = Path(compiled or os.environ.get('PROBE_PASSIVE_COMPILED_MODEL', str(self.folder / 'compiled/ranker_ZG.json')))
        self.device = device
        self.session = None
        self.network = None
        self.calls = []
        self.lock = threading.RLock()

    def reference(self, features):
        value = np.asarray(features, np.float32)
        if value.shape != (470,) or not np.isfinite(value).all():
            raise ValueError('模型输入错误')
        value = (value - self.normalization['mean']) * self.normalization['inv_std']
        if not np.isfinite(value).all():
            raise ValueError('模型归一化错误')
        for index in range(3):
            value = value @ self.weights['W' + str(index)].T + self.weights['b' + str(index)]
            if index < 2:
                value = np.maximum(value, np.float32(0))
        return value

    def _open(self):
        from icraft import xir, xrt, host_backend, zg330backend
        graph = json.loads(self.compiled.read_text(encoding='utf-8'))
        operations = [op for op in graph['ops'] if op['_type_key'] not in ('icraft::xir::Input', 'icraft::xir::Output')]
        if not operations or any(op['_type_key'] != 'icraft::xir::HardOp' or op.get('compile_target') != '@zhuget(330)' for op in operations):
            raise ValueError('NPU算子部署错误')
        binding = json.loads(self.compiled.with_name('binding.json').read_text(encoding='utf-8'))
        for name, expected in binding['sha256'].items():
            source = (self.compiled.parent / name).resolve()
            if hashlib.sha256(source.read_bytes()).hexdigest() != expected:
                raise ValueError('模型文件版本错误')
        weight_hash = hashlib.sha256((self.folder / 'cpu_weights.npz').read_bytes()).hexdigest()
        if binding['weights_sha256'] != weight_hash:
            raise ValueError('模型权重版本错误')
        if self.device is None:
            self.device = xrt.Device.Open('axi://zg330aiu?npu=0x40000000&dma=0x80000000')
        self.network = xir.Network.CreateFromJsonFile(str(self.compiled))
        self.network.loadParamsFromFile(str(self.compiled.with_suffix('.raw')))
        self.session = xrt.Session.Create([zg330backend.ZG330Backend, host_backend.HostBackend], self.network.view(0), [self.device, xrt.HostDevice.Default()])
        self.session.apply()

    def __call__(self, features):
        with self.lock:
            started = time.perf_counter()
            if self.backend == 'cpu':
                result = self.reference(features)
                record = dict(NPU_executed=False, CPU_scores_used=True)
            else:
                from icraft import xrt
                if self.session is None:
                    self._open()
                value = np.asarray(features, np.float32)
                if value.shape != (470,) or not np.isfinite(value).all():
                    raise ValueError('模型输入错误')
                normalized = ((value - self.normalization['mean']) * self.normalization['inv_std']).astype(np.float32)[None]
                if not np.isfinite(normalized).all():
                    raise ValueError('模型归一化错误')
                output = self.session.forward([xrt.Tensor(np.ascontiguousarray(normalized), self.network.inputs()[0].tensorType())])[0]
                if not output.waitForReady(timedelta(seconds=5)):
                    raise TimeoutError('NPU推理超时')
                buffer = array('f', [0.]) * len(self.weights['b2'])
                output.read(buffer, 0, len(buffer) * 4)
                result = np.asarray(buffer, np.float32)
                if not np.isfinite(result).all():
                    raise ValueError('NPU输出错误')
                record = dict(NPU_executed=True, CPU_scores_used=False)
                if self.backend == 'guarded':
                    reference = self.reference(features)
                    error = float(np.max(abs(result - reference)))
                    same = bool(np.array_equal(np.argsort(-result, kind='stable'), np.argsort(-reference, kind='stable')))
                    numeric = bool(np.allclose(result, reference, rtol=1e-4, atol=1e-4))
                    matched = numeric and same
                    record.update(raw_max_abs_error=error, raw_numeric_match=numeric, raw_order_match=same,
                                  raw_top1_same=bool(result.argmax() == reference.argmax()), CPU_scores_used=not matched)
                    if not matched:
                        result = reference
            record.update(backend=self.backend, wall_ms=1000 * (time.perf_counter() - started))
            self.calls.append(record)
            return result

    def evidence(self):
        with self.lock:
            calls = list(self.calls)
        total = len(calls)
        return dict(backend=self.backend, calls=calls, NPU_executed=any(c['NPU_executed'] for c in calls),
                    actual_NPU_calls=sum(c['NPU_executed'] for c in calls),
                    CPU_fallback_calls=sum(c['NPU_executed'] and c['CPU_scores_used'] for c in calls),
                    CPU_fallback_rate=sum(c['NPU_executed'] and c['CPU_scores_used'] for c in calls) / max(1, sum(c['NPU_executed'] for c in calls)),
                    mean_ms=float(np.mean([c['wall_ms'] for c in calls])) if total else 0.,
                    p95_ms=float(np.percentile([c['wall_ms'] for c in calls], 95)) if total else 0.)
