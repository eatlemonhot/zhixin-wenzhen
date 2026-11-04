"""Isolated board benchmark; no web/ADC/motor/BOOT changes. Worker exits on completion."""
import os
for key in ('OPENBLAS_NUM_THREADS','OMP_NUM_THREADS','MKL_NUM_THREADS'):os.environ[key]='1'
from pathlib import Path
import sys,time,json,subprocess,socket
import numpy as np
ROOT=Path(__file__).resolve().parent
APP=Path('/root/probe_diagnosis_bne_v4_20261028/app')
sys.path.insert(0,str(ROOT));sys.path.insert(0,str(APP/'ai'))
from network_runtime import Model
from inference_service import identity,request
data=dict(np.load(ROOT/'npu_vectors.npz'));rows=[];outputs={};daemon=None;started=time.perf_counter()
def compiled(family):return next((APP/'compiled'/family/'generated').glob('*.json'))
def record(mode,family,index,model,vector):
    tick=time.perf_counter();got=model.logits(vector);wall=1000*(time.perf_counter()-tick);e=model.calls[-1];ref=model.reference(((vector-model.norm['mean'])*model.norm['inv_std']).astype(np.float32)[None])[0]
    assert np.allclose(got,ref,rtol=1e-4,atol=1e-4)
    assert np.array_equal(np.argsort(-got,kind='stable'),np.argsort(-ref,kind='stable'))
    assert e['NPU_executed'];outputs[family,index]=got
    rows.append(dict(mode=mode,family=family,index=index,wall_ms=wall,FP32_guard=e['CPU_scores_used'],raw_error=e.get('raw_max_abs_error'),actual_NPU=True))
try:
    for family in ('B','NE'):
        for i in range(4):record('cold_job',family,i,Model(APP/'ai/models'/family,'guarded',compiled(family)),data[family][i])
    for family in ('B','NE'):
        model=Model(APP/'ai/models'/family,'guarded',compiled(family))
        for i,vector in enumerate(data[family][:16]):record('resident_in_job',family,i,model,vector)
    log=(ROOT/'persistent_server.log').open('w')
    endpoint=ROOT/'benchmark.sock'
    daemon=subprocess.Popen([sys.executable,'-B',str(ROOT/'inference_service.py'),'--app',str(APP),'--socket',str(endpoint),'--stop-after','64'],stdout=log,stderr=subprocess.STDOUT)
    deadline=time.monotonic()+15
    while not endpoint.exists():
        if daemon.poll() is not None:raise RuntimeError('Daemon failed; inspect log')
        if time.monotonic()>deadline:raise RuntimeError('Daemon start timeout')
        time.sleep(.05)
    rejected=[]
    for body in ({'family':'../../elsewhere'}, {'family':'B','model_identity':{}},
                 {'family':'B','model_identity':identity(APP/'ai/models/B'),'features':[0.]}):
        try:request(endpoint,body)
        except RuntimeError as exc:rejected.append(str(exc))
        else:raise AssertionError('Invalid request accepted')
    for family in ('B','NE'):
        binding=identity(APP/'ai/models'/family)
        for i,vector in enumerate(data[family]):
            tick=time.perf_counter();response=request(endpoint,dict(family=family,model_identity=binding,features=vector.tolist()));wall=1000*(time.perf_counter()-tick)
            got=np.asarray(response['logits'],np.float32);e=response['record'];norm=dict(np.load(APP/'ai/models'/family/'normalization.npz'));cpu=Model(APP/'ai/models'/family,'cpu');ref=cpu.logits(vector)
            assert np.array_equal(got,ref),(family,i,got,ref)
            assert e['NPU_executed'] and e['persistent_session'];rows.append(dict(mode='persistent_across_jobs',family=family,index=i,wall_ms=wall,server_ms=e['server_total_ms'],cold_model=e['cold_model'],FP32_guard=e['CPU_scores_used'],raw_error=e['raw_max_abs_error'],actual_NPU=True))
    assert daemon.wait(timeout=10)==0;assert not endpoint.exists()
    summary={}
    for mode in ('cold_job','resident_in_job','persistent_across_jobs'):
        for family in ('B','NE'):
            selected=[r for r in rows if r['mode']==mode and r['family']==family]
            summary[mode+'_'+family]=dict(cases=len(selected),mean_ms=float(np.mean([r['wall_ms'] for r in selected])),p95_ms=float(np.percentile([r['wall_ms'] for r in selected],95)),first_ms=selected[0]['wall_ms'],excluding_first_mean_ms=float(np.mean([r['wall_ms'] for r in selected[1:]])))
    report=dict(passed=True,cases=len(rows),actual_NPU_calls=len(rows),FP32_guards=sum(r['FP32_guard'] for r in rows),all_final_scores_equal_CPU=True,rejected_invalid_requests=len(rejected),summary=summary,rows=rows,seconds=time.perf_counter()-started,weights_changed=False,custom_hardware_operator_created=False,web_service_changed=False,hardware_measurement=False,pure_NPU_precision_qualified=False,scope='Model-call microbenchmark only. Direct modes measured before daemon; no whole-system speed ratio claimed.')
    (ROOT/'NPU_SESSION_BENCHMARK.json').write_text(json.dumps(report,indent=2));print(json.dumps({k:v for k,v in report.items() if k!='rows'},indent=2))
finally:
    if daemon is not None and daemon.poll() is None:daemon.terminate();daemon.wait(timeout=10)
