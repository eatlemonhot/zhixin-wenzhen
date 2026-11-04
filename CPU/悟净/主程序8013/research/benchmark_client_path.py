import os
for k in ('OPENBLAS_NUM_THREADS','OMP_NUM_THREADS','MKL_NUM_THREADS'):os.environ[k]='1'
from pathlib import Path
import sys,json,time,subprocess,importlib.util
import numpy as np
ROOT=Path(__file__).resolve().parent;APP=Path('/root/probe_diagnosis_bne_v4_20261028/app');sys.path.insert(0,str(ROOT))
spec=importlib.util.spec_from_file_location('optimized_network',ROOT/'client_network_runtime.py');module=importlib.util.module_from_spec(spec);spec.loader.exec_module(module)
endpoint=ROOT/'client_test.sock';env=dict(os.environ);env.pop('PROBE_NPU_SOCKET',None)
log=(ROOT/'client_server.log').open('w');proc=subprocess.Popen([sys.executable,'-B',str(ROOT/'inference_service.py'),'--app',str(APP),'--socket',str(endpoint),'--stop-after','16'],env=env,stdout=log,stderr=subprocess.STDOUT)
try:
    deadline=time.monotonic()+15
    while not endpoint.exists():
        assert proc.poll() is None
        if time.monotonic()>deadline:raise RuntimeError('Start timeout')
        time.sleep(.05)
    data=np.load(ROOT/'npu_vectors.npz');rows=[]
    os.environ['PROBE_NPU_SOCKET']=str(endpoint)
    for family in ('B','NE'):
        for i in range(8):
            compiled=next((APP/'compiled'/family/'generated').glob('*.json'));model=module.Model(APP/'ai/models'/family,'guarded',compiled)
            got=model.logits(data[family][i]);cpu=module.Model(APP/'ai/models'/family,'cpu').logits(data[family][i]);assert np.array_equal(got,cpu)
            call=model.calls[-1];assert call['NPU_executed'] and call['backend']=='guarded_persistent'
            rows.append(dict(family=family,index=i,wall_ms=call['wall_ms'],NPU_executed=call['NPU_executed'],CPU_scores_used=call['CPU_scores_used'],server_pid=call['server_pid'],cold_model=call['cold_model']))
    assert proc.wait(timeout=10)==0
    report=dict(passed=True,cases=len(rows),all_final_logits_exact_CPU=True,single_server_pid=len({r['server_pid'] for r in rows})==1,actual_NPU_calls=sum(r['NPU_executed'] for r in rows),guards=sum(r['CPU_scores_used'] for r in rows),rows=rows,hardware_operator_created=False)
    (ROOT/'CLIENT_PATH_ACCEPTANCE.json').write_text(json.dumps(report,indent=2));print(json.dumps(report,indent=2))
finally:
    os.environ.pop('PROBE_NPU_SOCKET',None)
    if proc.poll() is None:proc.terminate();proc.wait(timeout=10)
