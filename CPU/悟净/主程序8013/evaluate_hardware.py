import argparse
import json
from pathlib import Path

import numpy as np


def evaluate(cases):
    if not isinstance(cases, list) or not cases:
        raise ValueError('评测样本为空')
    rows = []
    seen = set()
    for case in cases:
        identity = (case['dut_id'], case['case_id'])
        if identity in seen:
            raise ValueError('评测样本重复')
        seen.add(identity)
        result = json.loads(Path(case['result']).read_text(encoding='utf-8'))
        diagnosis = result.get('diagnosis', result)
        if diagnosis.get('hardware_executed') is not True or not diagnosis.get('records') or diagnosis.get('dut_id') != case['dut_id']:
            raise ValueError('评测输入错误')
        candidates = diagnosis['candidate_names']
        confirmed = diagnosis['status'] == 'confirmed'
        truth = case['truth']
        elapsed = result.get('elapsed_seconds', diagnosis['elapsed_seconds'])
        rows.append(dict(dut_id=case['dut_id'], case_id=case['case_id'], truth=truth,
                         correct=confirmed and candidates == [truth],
                         false_positive=confirmed and truth == 'normal' and candidates != ['normal'],
                         false_negative=confirmed and truth != 'normal' and candidates == ['normal'],
                         wrong_confirmed=confirmed and candidates != [truth],
                         rejected=not confirmed, elapsed_seconds=elapsed,
                         conditions=diagnosis['conditions'], neural_execution=diagnosis.get('neural_execution', {})))
    faults = [row for row in rows if row['truth'] != 'normal']
    normal = [row for row in rows if row['truth'] == 'normal']
    report = dict(samples=len(rows), boards=len({row['dut_id'] for row in rows}),
                  accuracy=float(np.mean([row['correct'] for row in rows])),
                  wrong_confirmation_rate=float(np.mean([row['wrong_confirmed'] for row in rows])),
                  rejection_rate=float(np.mean([row['rejected'] for row in rows])),
                  false_positive_rate=sum(row['false_positive'] for row in normal) / len(normal) if normal else None,
                  false_negative_rate=sum(row['false_negative'] for row in faults) / len(faults) if faults else None,
                  elapsed_seconds=dict(mean=float(np.mean([row['elapsed_seconds'] for row in rows])),
                                       p95=float(np.percentile([row['elapsed_seconds'] for row in rows], 95))),
                  conditions=dict(mean=float(np.mean([row['conditions'] for row in rows])),
                                  p95=float(np.percentile([row['conditions'] for row in rows], 95))), rows=rows)
    return report


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--cases', type=Path, required=True)
    args = parser.parse_args()
    print(json.dumps(evaluate(json.loads(args.cases.read_text(encoding='utf-8'))), ensure_ascii=False, allow_nan=False))


if __name__ == '__main__':
    main()
