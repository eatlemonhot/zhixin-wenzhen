import time,hashlib,json
import numpy as np
from model_spec import *
from controller_highz import Engine as ParentEngine
from conditioned_bank import ConditionedBank

RESERVE=(9,34);INITIAL=(2,8,14,20,26,32)

class Engine(ParentEngine):
    def __init__(self,bank,ref,family,calibration):
        self.family=family;self.calibration=calibration;self.frames=np.full(36,16)
        super().__init__(bank,ref,'A' if family=='NE' else family,np.asarray(calibration['scale'][family]),calibration['class_scale'][family])
        self.curves_version=bank.version
    def fit(self,obs,mask):
        if self.bank.waves and self.curves_version!=self.bank.version:
            self.curves=self.bank.curves(self.board,self.ref);self.curves_version=self.bank.version
        self.update_noise()
        return super().fit(obs,mask)
    def update_noise(self):
        for i,n in enumerate(self.frames):
            floor,relative=(.0005,.0012) if n==16 else (.00015,.0003)
            self.noise[i]=floor+relative*abs(self.ref[i])
            for k in (0,4):self.noise[i,k]=self.noise[i,k+1]=floor+relative*abs(complex(*self.ref[i,k:k+2]))
        model=np.asarray(self.calibration['class_scale'][self.family])
        self.class_scale=np.sqrt(model**2+self.noise[None]**2)
        self.scale=np.sqrt(np.asarray(self.calibration['scale'][self.family])**2+self.noise**2)

def diagnose(family,reference,reference_phases,reader,ranker,bank_path,calibration,max_conditions=80,emit=None,reference_amplitudes=None):
    """reader接收动作编号、帧数与角色，返回校准F6及首样点相位索引。

    适配器完成质量与身份检查；独立确认数据与拟合、增益估计分开使用。"""
    begin=time.perf_counter();ref=np.asarray(reference,float)
    if ref.shape!=(36,6) or not np.isfinite(ref).all():raise ValueError('完整健康参考缺失或形状错误')
    bank=ConditionedBank(bank_path,family,reference_phases,reference_amplitudes)
    engine=Engine(bank,ref,family,calibration);obs=np.zeros((36,6));mask=np.zeros(36,bool);trace=[];timing=dict(fit_ms=[],network_ms=[],selection_ms=[])
    def event(kind,**data):
        if emit:emit(kind,**data)
    def acquire(index,frames,role,fit=False):
        if len(trace)>=max_conditions:raise RuntimeError('测量条件预算已用完')
        started=time.perf_counter();value,phases=reader(int(index),int(frames),role)
        value=np.asarray(value,float)
        if value.shape!=(6,) or not np.isfinite(value).all() or value[3]<0:raise ValueError('接收特征无效')
        bank.set_phase(index,phases,frames)
        trace.append(dict(action=int(index),configuration=AB.actions('A' if family=='NE' else family)[index],frames=frames,role=role,wall_ms=1000*(time.perf_counter()-started)))
        if fit:obs[index]=value;mask[index]=True;engine.frames[index]=frames
        return value
    for i in INITIAL:acquire(i,16,'fit',True)
    rounds=[];precision=False;last_candidates=[];all_confirmations=[];model_conflict=[]
    def elapsed():
        wall=time.perf_counter()-begin;acquisition=sum(row['wall_ms'] for row in trace)/1000
        return dict(CPU_seconds=max(0.,wall-acquisition),total_wall_seconds=wall,acquisition_callback_seconds=acquisition,
                    timing_scope='CPU_seconds excludes measurement callback wall time; no real motor/ADC/NPU time measured by simulation.')
    while True:
        started=time.perf_counter();rows=engine.fit(obs,mask);compatible=engine.compatible(rows,obs,mask,4.);timing['fit_ms'].append(1000*(time.perf_counter()-started))
        started=time.perf_counter();scores=np.asarray(ranker(encode(family,obs,ref,mask)));timing['network_ms'].append(1000*(time.perf_counter()-started))
        if scores.shape!=(26,) or not np.isfinite(scores).all() or np.any(scores<0) or scores.sum()<=0:raise ValueError('Invalid neural candidate probability vector')
        scores=scores/scores.sum();neural_top=int(scores.argmax());strong_neural=bool(scores[neural_top]>=.90)
        rounds.append(dict(fit_count=int(mask.sum()),precision=precision,compatible=[r['label'] for r in compatible],best_fit_MSE=float(rows[0]['fit_MSE'])))
        event('analysis',compatible=[r['label'] for r in compatible],network_top1=int(scores.argmax()),fit_count=int(mask.sum()))
        pair={7:18,18:7} if family in ('A','NE') else {}
        difficult_pair=bool(len(compatible)==1 and compatible[0]['label'] in pair)
        final_ready=(len(compatible)==1 and (neural_top==compatible[0]['label'] or not strong_neural)) or mask.sum()>=34
        if difficult_pair and (not precision or mask.sum()<34):final_ready=False
        if final_ready and len(trace)<=max_conditions-2:
            frozen=[dict(label=r['label'],factor=r['factor']) for r in compatible]
            fit_obs=np.array(obs,copy=True);fit_mask=np.array(mask,copy=True)
            frozen_hash=hashlib.sha256(np.r_[fit_obs.ravel(),fit_mask].tobytes()+json.dumps(frozen,sort_keys=True).encode()).hexdigest()
            confirmation={i:acquire(i,256 if precision else 16,'confirmation') for i in RESERVE}
            engine.update_noise();audits=[];accepted=[]
            for frozen_row in frozen:
                label=frozen_row['label'];raw=bank.predict(engine.board,label,ref,frozen_row['factor'])
                pred=engine.adjust(raw,fit_obs,fit_mask,engine.class_scale[label])
                actual=np.array([confirmation[i] for i in RESERVE]);selected=np.array(RESERVE)
                scales=np.array(engine.class_scale[label,selected],copy=True)
                if precision:
                    model=np.asarray(calibration['class_scale'][family])[label,selected]
                    low=.00015+.0003*abs(ref[selected]);scales=np.sqrt(model**2+low**2)
                mse=float(np.mean((((pred[selected]-actual)/scales)[:,engine.cm])**2))
                audits.append(dict(label=label,factor=frozen_row['factor'],confirmation_MSE=mse))
                if mse<=2.25:accepted.append(label)
            all_confirmations.append(dict(frozen_sha256=frozen_hash,fit_indices=np.flatnonzero(fit_mask).tolist(),confirmation_indices=list(RESERVE),audits=audits))
            conflict=len(accepted)==1 and (strong_neural or accepted[0] in pair) and neural_top!=accepted[0]
            if conflict:
                model_conflict=sorted(set(accepted+[neural_top]));event('model_disagreement',physical=accepted,neural_top=neural_top,neural_probability=float(scores[neural_top]))
            if len(accepted)==1 and not conflict:
                return dict(state='confirmed_single_catalog_fault',confirmed=True,candidate_ids=accepted,trace=trace,rounds=rounds,confirmation_audits=all_confirmations,
                     all_catalog_candidates_checked=26,predictions_frozen_before_confirmation=True,timing=timing,**elapsed(),
                     feature_contract=CONTRACT,Rs_ohm=list(RS),family=family,NPU_executed=False,scope='New-contract SPICE simulation with matched healthy reference; not hardware qualification')
            last_candidates=accepted
        if len(trace)>=max_conditions-2:break
        if not precision and (mask.sum()>=14 or (mask.sum()>=10 and len(compatible)>1)):
            if len(trace)+len(INITIAL)>max_conditions-2:break
            precision=True
            for i in INITIAL:acquire(i,256,'fit',True)
            continue
        remaining=[i for i in range(36) if i not in RESERVE and (not mask[i] or precision and engine.frames[i]!=256)]
        if not remaining:break
        plausible=compatible if len(compatible)>1 else rows[:4]
        if len(compatible)==1 and strong_neural and neural_top!=compatible[0]['label']:
            plausible=list(plausible)
            for label in np.argsort(-scores)[:3]:
                row=next(r for r in rows if r['label']==int(label))
                if all(r['label']!=row['label'] for r in plausible):plausible.append(row)
        started=time.perf_counter();predictions=np.array([r['prediction'] for r in plausible]);pairs=[]
        for a in range(len(plausible)):
            for b in range(a+1,len(plausible)):
                difference=np.mean((((predictions[a]-predictions[b])/engine.scale)[:,engine.cm])**2,axis=1)
                hint=.75+.25*(scores[plausible[a]['label']]+scores[plausible[b]['label']])
                pairs.append(difference*hint)
        utility=np.mean(pairs,axis=0) if pairs else np.ones(36)
        index=max(remaining,key=lambda i:utility[i]);timing['selection_ms'].append(1000*(time.perf_counter()-started))
        acquire(index,256 if precision else 16,'fit',True)
    pending=sorted(set(last_candidates+model_conflict))
    return dict(state='model_disagreement' if model_conflict else 'compatible_set' if last_candidates else 'unsupported_or_model_mismatch',confirmed=False,candidate_ids=pending,
                unresolved_neural_hypotheses=model_conflict,neural_hypotheses_are_not_physical_confirmations=True,
                trace=trace,rounds=rounds,confirmation_audits=all_confirmations,timing=timing,**elapsed(),
                feature_contract=CONTRACT,Rs_ohm=list(RS),NPU_executed=False,all_catalog_candidates_checked=26)
