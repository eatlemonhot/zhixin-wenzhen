import os
for k in ('OPENBLAS_NUM_THREADS','OMP_NUM_THREADS','MKL_NUM_THREADS'):os.environ[k]='1'
from pathlib import Path
import argparse,json,hashlib
import numpy as np
import onnxruntime as ort
from network_runtime import Model

p=argparse.ArgumentParser();p.add_argument('--model',type=Path,required=True);p.add_argument('--vectors',type=Path,required=True);p.add_argument('--out',type=Path,required=True);a=p.parse_args()
d=np.load(a.vectors);x=d['F'];ids=np.linspace(0,len(x)-1,min(512,len(x)),dtype=int);model=Model(a.model,'cpu')
options=ort.SessionOptions();options.intra_op_num_threads=1;options.inter_op_num_threads=1
session=ort.InferenceSession(str(a.model/'ranker_npu.onnx'),sess_options=options,providers=['CPUExecutionProvider'])
rows=[]
for i in ids:
    z=((x[i]-model.norm['mean'])*model.norm['inv_std']).astype(np.float32)[None]
    ref=model.reference(z)[0];raw=session.run(None,{'Z':z})[0][0]
    order=np.argsort(-ref,kind='stable');other=np.argsort(-raw,kind='stable')
    passed=bool(np.allclose(raw,ref,rtol=1e-4,atol=1e-4));same=bool(np.array_equal(order,other));selected=raw if passed and same else ref
    rows.append(dict(index=int(i),raw_numerical_passed=passed,all_order_same=same,top1_same=bool(order[0]==other[0]),top3_same=bool(np.array_equal(order[:3],other[:3])),max_abs_error=float(abs(raw-ref).max()),
                     CPU_guard_used=not(passed and same),selected_numerical_passed=bool(np.allclose(selected,ref,rtol=1e-4,atol=1e-4))))
result=dict(cases=len(rows),raw_numeric_passed=sum(r['raw_numerical_passed'] for r in rows),top1_same=sum(r['top1_same'] for r in rows),top3_same=sum(r['top3_same'] for r in rows),
            selected_passed=sum(r['selected_numerical_passed'] for r in rows),CPU_guard_cases=sum(r['CPU_guard_used'] for r in rows),max_abs_error=max(r['max_abs_error'] for r in rows),
            rtol=1e-4,atol=1e-4,NPU_executed=False,scope='NumPy CPU FP32 vs ONNXRuntime CPU FP32; not ZG330 FP16 accuracy',rows=rows)
a.out.write_text(json.dumps(result,indent=2),encoding='utf-8');print({k:v for k,v in result.items() if k!='rows'})
if result['selected_passed']!=len(rows):raise SystemExit(1)
