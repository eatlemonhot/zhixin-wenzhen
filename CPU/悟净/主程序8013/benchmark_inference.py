import argparse
import json
from pathlib import Path
import time

import numpy as np

from probe_system.neural_ranker import NeuralRanker


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--model', type=Path, default=Path(__file__).parent / 'probe_system/unpowered_ai/model')
    parser.add_argument('--vectors', type=Path, required=True)
    parser.add_argument('--backend', choices=('cpu', 'npu', 'guarded'), default='npu')
    parser.add_argument('--compiled', type=Path)
    parser.add_argument('--repeat', type=int, default=3)
    parser.add_argument('--power-path', type=Path)
    args = parser.parse_args()
    data = np.load(args.vectors)
    vectors = data['F']
    if vectors.ndim != 2 or vectors.shape[1] != 470 or len(vectors) == 0 or not np.isfinite(vectors).all() or not 1 <= args.repeat <= 100:
        raise ValueError('基准输入错误')
    cpu = NeuralRanker(args.model, 'cpu')
    target = NeuralRanker(args.model, args.backend, args.compiled)
    sample = vectors[:min(32, len(vectors))]
    for value in sample:
        cpu(value)
        target(value)
    cpu.calls.clear()
    target.calls.clear()
    references, actuals = [], []
    powers = dict(cpu=[], target=[])
    begin = time.perf_counter()
    for _ in range(args.repeat):
        for value in vectors:
            if args.power_path is not None:
                powers['cpu'].append(float(args.power_path.read_text().strip()) / 1e6)
            references.append(cpu(value))
    cpu_seconds = time.perf_counter() - begin
    begin = time.perf_counter()
    for _ in range(args.repeat):
        for value in vectors:
            if args.power_path is not None:
                powers['target'].append(float(args.power_path.read_text().strip()) / 1e6)
            actuals.append(target(value))
    target_seconds = time.perf_counter() - begin
    results = [dict(max_abs_error=float(np.max(abs(actual - reference))),
                                numeric_match=bool(np.allclose(actual, reference, rtol=1e-4, atol=1e-4)),
                                top1_match=bool(actual.argmax() == reference.argmax())) for actual, reference in zip(actuals, references)]
    report = dict(backend=args.backend, samples=len(results), cpu_seconds=cpu_seconds, target_seconds=target_seconds,
                  speedup=cpu_seconds / target_seconds,
                  numeric_match_rate=float(np.mean([v['numeric_match'] for v in results])),
                  top1_match_rate=float(np.mean([v['top1_match'] for v in results])),
                  max_abs_error=max(v['max_abs_error'] for v in results), cpu=cpu.evidence(), target=target.evidence())
    if args.backend == 'guarded':
        report['raw_numeric_match_rate'] = float(np.mean([call['raw_numeric_match'] for call in target.calls]))
        report['raw_top1_match_rate'] = float(np.mean([call['raw_top1_same'] for call in target.calls]))
    if powers['cpu']:
        report['mean_power_W'] = {key: float(np.mean(values)) for key, values in powers.items()}
    print(json.dumps(report, ensure_ascii=False, allow_nan=False))


if __name__ == '__main__':
    main()
