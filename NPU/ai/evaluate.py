import os
for key in ('OPENBLAS_NUM_THREADS','OMP_NUM_THREADS','MKL_NUM_THREADS'):os.environ[key]='1'
from pathlib import Path
import argparse,json,time
import numpy as np
from model_spec import *
from network_runtime import Model
from controller import diagnose

def main():
    p=argparse.ArgumentParser();p.add_argument('--family',choices=FAMILIES,required=True);p.add_argument('--data',type=Path,required=True)
    p.add_argument('--model',type=Path,required=True);p.add_argument('--bank',type=Path,required=True);p.add_argument('--out',type=Path,required=True)
    p.add_argument('--repeat',type=int,default=2);p.add_argument('--limit',type=int);a=p.parse_args();a.out.mkdir(parents=True,exist_ok=False)
    data=dict(np.load(a.data));ids=np.flatnonzero(data['family']==a.family)
    if a.limit:ids=ids[:a.limit]
    model=Model(a.model,'cpu');cal=json.loads((a.bank/'calibration.json').read_text());results=[];nnrows=[];started=time.perf_counter()
    for number,index in enumerate(ids,1):
        for repeat in range(a.repeat):
            rng=np.random.default_rng(2026102611+int(data['group'][index])*104729+int(index)*503+repeat*37)
            ref_index=int(data['reference_index'][index]);reference,reference_phases=sampled(data['statistics'][ref_index],rng,256,linear=a.family!='B')
            acquired=[]
            def reader(action,frames,role):
                value,phases=sampled(data['statistics'][index],rng,frames,linear=a.family!='B')
                acquired.append(dict(action=action,frames=frames,role=role,physical_capture_id=len(acquired)))
                return value[action],phases[action]
            reference_amplitudes=abs(source_phasors(data['statistics'][ref_index],reference_phases))
            amp_rng=np.random.default_rng(2026102703+int(data['group'][index])*997+repeat)
            reference_amplitudes=reference_amplitudes*amp_rng.normal(1,.0002)*amp_rng.normal(1,.0001,36)
            result=diagnose(a.family,reference,reference_phases,reader,model.probabilities,a.bank,cal,reference_amplitudes=reference_amplitudes)
            full,phases=sampled(data['statistics'][index],rng,16,linear=a.family!='B');mask=np.ones(36,bool);mask[[9,34]]=False
            logits=model.probabilities(encode(a.family,full,reference,mask));order=np.argsort(-logits)
            truth=int(data['label'][index]);case=f'{a.family}_g{int(data["group"][index])}_e{truth}_r{repeat}'
            dump(a.out/(case+'.json'),dict(truth_for_evaluation_only=truth,result=result,acquisition_audit=acquired))
            unique=result['candidate_ids']==[truth] and result['confirmed'];wrong=result['confirmed'] and result['candidate_ids']!=[truth]
            results.append(dict(case=case,group=int(data['group'][index]),label=truth,repeat=repeat,unique_correct=unique,wrong_unique=wrong,
                 truth_retained=truth in result['candidate_ids'],state=result['state'],candidates=result['candidate_ids'],conditions=len(result['trace']),CPU_ms=result['CPU_seconds']*1000,
                 fit_ms=sum(result['timing']['fit_ms']),selection_ms=sum(result['timing']['selection_ms']),network_ms=sum(result['timing']['network_ms'])))
            nnrows.append(dict(case=case,label=truth,top1=int(order[0]),top3=list(map(int,order[:3]))))
        if number%26==0:print('BOARD',a.family,int(data['group'][index]),'unique',sum(r['unique_correct'] for r in results),'/',len(results),'wrong',sum(r['wrong_unique'] for r in results),flush=True)
    report=dict(completed=True,family=a.family,cases=len(results),physical_states=len(ids),unique_correct=sum(r['unique_correct'] for r in results),
                wrong_unique=sum(r['wrong_unique'] for r in results),truth_retained=sum(r['truth_retained'] for r in results),
                unique_accuracy=float(np.mean([r['unique_correct'] for r in results])),ANN_top1=float(np.mean([r['top1']==r['label'] for r in nnrows])),
                ANN_top3=float(np.mean([r['label'] in r['top3'] for r in nnrows])),seconds=time.perf_counter()-started,
                feature_contract=CONTRACT,Rs_ohm=list(RS),same_DUT_healthy_reference=True,NPU_executed=False,hardware_tested=False,
                scope='SPICE periodic waveform/AC small-signal + LSQ simulation with statistical calibrated errors; not raw RTL/ADC or board accuracy')
    for metric in ('conditions','CPU_ms','fit_ms','selection_ms','network_ms'):
        report[metric]=dict(mean=float(np.mean([r[metric] for r in results])),p95=float(np.percentile([r[metric] for r in results],95)))
    report['per_class']=[dict(label=k,cases=sum(r['label']==k for r in results),unique_correct=sum(r['label']==k and r['unique_correct'] for r in results),wrong_unique=sum(r['label']==k and r['wrong_unique'] for r in results)) for k in range(26)]
    dump(a.out/'rows.json',results);dump(a.out/'neural.json',nnrows);dump(a.out/'report.json',report)
    print(json.dumps(report,ensure_ascii=False),flush=True)
if __name__=='__main__':main()
