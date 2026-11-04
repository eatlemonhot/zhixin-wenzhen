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
        from native_ps import fit_enabled,fit_engine
        if fit_enabled():return fit_engine(self,obs,mask)
        return super().fit(obs,mask)
    def adjust(self,pred,obs,mask,scale=None):
        from native_ps import fit_enabled,adjust
        if fit_enabled():return adjust(pred,obs,mask,self.noise if scale is None else scale,self.family=='B')
        # The current PL statistical contract calibrates the phasor gain,
        # DC offset and residual RMS separately. A fitted complex gain must
        # not silently rescale the independent DC/residual channels.
        if self.family!='B':return super().adjust(pred,obs,mask,scale)
        one=pred.ndim==2;out=np.array(pred[None] if one else pred,copy=True)
        scale=self.noise if scale is None else scale
        for k in (0,4):
            p=out[:,:,k]+1j*out[:,:,k+1];o=obs[:,k]+1j*obs[:,k+1]
            weights=2/(scale[mask,k]**2+scale[mask,k+1]**2)
            denom=np.sum(abs(p[:,mask])**2*weights,axis=1)
            g=np.divide(np.sum(p[:,mask].conj()*o[mask]*weights,axis=1),denom,out=np.ones(len(out),complex),where=denom>1e-10)
            g=np.clip(abs(g),.996,1.004)*np.exp(1j*np.clip(np.angle(g),-.004,.004))
            z=p*g[:,None];out[:,:,k]=z.real;out[:,:,k+1]=z.imag
        offset=np.clip(np.mean(obs[mask,2]-out[:,mask,2],axis=1),-.001,.001)
        out[:,:,2]+=offset[:,None]
        return out[0] if one else out
    def update_noise(self):
        for i,n in enumerate(self.frames):
            floor,relative=(.0005,.0012) if n==16 else (.00015,.0003)
            self.noise[i]=floor+relative*abs(self.ref[i])
            for k in (0,4):self.noise[i,k]=self.noise[i,k+1]=floor+relative*abs(complex(*self.ref[i,k:k+2]))
            if self.family in ('B','NE'):
                from measurement_uncertainty import noise
                self.noise[i]=noise(self.ref[i],int(n))
        model=np.asarray(self.calibration['class_scale'][self.family])
        self.class_scale=np.sqrt(model**2+self.noise[None]**2)
        self.scale=np.sqrt(np.asarray(self.calibration['scale'][self.family])**2+self.noise**2)
        if self.family=='NE':
            from measurement_uncertainty import noise
            for label,(_,pred) in enumerate(self.curves):
                expected=np.median(pred,axis=0)
                sigma=np.array([noise(expected[i],int(n)) for i,n in enumerate(self.frames)])
                self.class_scale[label]=np.sqrt(model[label]**2+sigma**2)

def diagnose(family,reference,reference_phases,reader,ranker,bank_path,calibration,max_conditions=80,emit=None):
    """reader接收动作编号、帧数与角色，返回校准F6及首样点相位索引。

    适配器完成质量与身份检查；独立确认数据与拟合、增益估计分开使用。"""
    from action_policy import policy
    action_policy=policy(family);RESERVE=tuple(action_policy["reserve"]);allowed=action_policy["allowed"];maximum_fit=len(allowed)-len(RESERVE)
    begin=time.perf_counter();ref=np.asarray(reference,float)
    if ref.shape!=(36,6) or not np.isfinite(ref).all():raise ValueError('完整健康参考缺失或形状错误')
    bank=ConditionedBank(bank_path,family,reference_phases)
    engine=Engine(bank,ref,family,calibration);obs=np.zeros((36,6));mask=np.zeros(36,bool);trace=[];timing=dict(fit_ms=[],network_ms=[],selection_ms=[])
    def event(kind,**data):
        if emit:emit(kind,**data)
    def acquire(index,frames,role,fit=False):
        if index not in allowed:raise ValueError('Condition outside device action domain')
        if len(trace)>=max_conditions:raise RuntimeError('测量条件预算已用完')
        started=time.perf_counter();value,phases=reader(int(index),int(frames),role)
        value=np.asarray(value,float)
        if value.shape!=(6,) or not np.isfinite(value).all() or value[3]<0:raise ValueError('接收特征无效')
        bank.set_phase(index,phases)
        trace.append(dict(action=int(index),configuration=AB.actions('A' if family=='NE' else family)[index],frames=frames,role=role,wall_ms=1000*(time.perf_counter()-started)))
        if fit:obs[index]=value;mask[index]=True;engine.frames[index]=frames
        event('observation',action=int(index),frames=int(frames),role=role,value=value.tolist(),capture_index=len(trace),fit_actions=np.flatnonzero(mask).tolist(),quality='receiver_validated')
        return value
    event('decision',phase='initial',actions=list(INITIAL),frames=16,reason='先采集六个基础条件，形成跨测点与Rs的初步证据；完成后联合分析。',evidence_version=0)
    for i in INITIAL:acquire(i,16,'fit',True)
    rounds=[];precision=False;last_candidates=[];all_confirmations=[]
    def elapsed():
        wall=time.perf_counter()-begin;acquisition=sum(row['wall_ms'] for row in trace)/1000
        return dict(CPU_seconds=max(0.,wall-acquisition),total_wall_seconds=wall,acquisition_callback_seconds=acquisition,
                    timing_scope='CPU_seconds excludes measurement callback wall time; no real motor/ADC/NPU time measured by simulation.')
    while True:
        started=time.perf_counter();rows=engine.fit(obs,mask);compatible=engine.compatible(rows,obs,mask,4.);timing['fit_ms'].append(1000*(time.perf_counter()-started))
        started=time.perf_counter();scores=np.asarray(ranker(encode(family,obs,ref,mask)));timing['network_ms'].append(1000*(time.perf_counter()-started))
        if scores.shape!=(26,) or not np.isfinite(scores).all() or np.any(scores<0) or scores.sum()<=0:raise ValueError('Invalid neural candidate probability vector')
        rounds.append(dict(fit_count=int(mask.sum()),precision=precision,compatible=[r['label'] for r in compatible],best_fit_MSE=float(rows[0]['fit_MSE'])))
        if emit:
            event('analysis',round=len(rounds),compatible=[r['label'] for r in compatible],network_top1=int(scores.argmax()),fit_count=int(mask.sum()),
                  fit_actions=np.flatnonzero(mask).tolist(),evidence_version=len(trace),precision=precision,
                  evidence_sha256=hashlib.sha256(np.r_[obs.ravel(),mask].tobytes()).hexdigest(),
                  network_top=[dict(label=int(i),probability=float(scores[i])) for i in np.argsort(-scores,kind='stable')[:5]],
                  physical=[dict(label=r['label'],fit_MSE=r['fit_MSE'],factor=r['factor'],contrast_z=r['predictive_contrast_z']) for r in rows],
                  best_fit_MSE=rows[0]['fit_MSE'],neural_physical_agreement=bool(int(scores.argmax()) in [r['label'] for r in compatible]),
                  newly_excluded=sorted(set(rounds[-2]['compatible'])-{r['label'] for r in compatible}) if len(rounds)>1 else [],
                  newly_compatible=sorted({r['label'] for r in compatible}-set(rounds[-2]['compatible'])) if len(rounds)>1 else [],
                  CPU_ms=elapsed()['CPU_seconds']*1000,fit_ms=sum(timing['fit_ms']),network_ms=sum(timing['network_ms']),selection_ms=sum(timing['selection_ms']))
        final_ready=(len(compatible)==1 and (int(scores.argmax())==compatible[0]['label'] or mask.sum()>=12)) or mask.sum()>=maximum_fit
        if final_ready and len(trace)<=max_conditions-2:
            frozen=[dict(label=r['label'],factor=r['factor']) for r in compatible]
            fit_obs=np.array(obs,copy=True);fit_mask=np.array(mask,copy=True)
            frozen_hash=hashlib.sha256(np.r_[fit_obs.ravel(),fit_mask].tobytes()+json.dumps(frozen,sort_keys=True).encode()).hexdigest()
            event('decision',phase='independent_confirmation',actions=list(RESERVE),frames=256 if precision else 16,evidence_version=len(trace),frozen_sha256=frozen_hash,reason='当前证据满足确认条件：冻结候选和拟合参数，在预留条件上重新采集独立确认。')
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
                    if family in ('B','NE'):
                        from measurement_uncertainty import noise
                        scales=np.sqrt(model**2+noise(raw[selected] if family=='NE' else ref[selected],256)**2)
                mse=float(np.mean((((pred[selected]-actual)/scales)[:,engine.cm])**2))
                audits.append(dict(label=label,factor=frozen_row['factor'],confirmation_MSE=mse))
                if mse<=2.25:accepted.append(label)
            all_confirmations.append(dict(frozen_sha256=frozen_hash,fit_indices=np.flatnonzero(fit_mask).tolist(),confirmation_indices=list(RESERVE),audits=audits))
            event('confirmation',accepted=accepted,audits=audits,threshold=2.25,frozen_sha256=frozen_hash,fit_actions=np.flatnonzero(fit_mask).tolist(),actions=list(RESERVE),evidence_version=len(trace))
            if len(accepted)==1:
                return dict(state='confirmed_single_catalog_fault',confirmed=True,candidate_ids=accepted,trace=trace,rounds=rounds,confirmation_audits=all_confirmations,
                     all_catalog_candidates_checked=26,predictions_frozen_before_confirmation=True,timing=timing,**elapsed(),
                     feature_contract=CONTRACT,Rs_ohm=list(RS),family=family,NPU_executed=False,scope='New-contract SPICE simulation with matched healthy reference; not hardware qualification')
            last_candidates=accepted
        if len(trace)>=max_conditions-2:break
        if not precision and (mask.sum()>=14 or (mask.sum()>=10 and len(compatible)>1)):
            if len(trace)+len(INITIAL)>max_conditions-2:break
            precision=True
            event('decision',phase='precision',actions=list(INITIAL),frames=256,evidence_version=len(trace),reason='16帧证据尚未充分区分候选，升级256帧并重新采集基础条件；原独立确认帧不用于拟合。')
            for i in INITIAL:acquire(i,256,'fit',True)
            continue
        remaining=[i for i in allowed if i not in RESERVE and (not mask[i] or precision and engine.frames[i]!=256)]
        if not remaining:break
        plausible=compatible if len(compatible)>1 else rows[:4]
        started=time.perf_counter();predictions=np.array([r['prediction'] for r in plausible]);pairs=[];pair_hints=[]
        for a in range(len(plausible)):
            for b in range(a+1,len(plausible)):
                difference=np.mean((((predictions[a]-predictions[b])/engine.scale)[:,engine.cm])**2,axis=1)
                hint=.75+.25*(scores[plausible[a]['label']]+scores[plausible[b]['label']])
                pair_hints.append(float(hint))
                pairs.append(difference*hint)
        utility=np.mean(pairs,axis=0) if pairs else np.ones(36)
        index=max(remaining,key=lambda i:utility[i]);timing['selection_ms'].append(1000*(time.perf_counter()-started))
        if emit:
            priority=sorted(remaining,key=lambda i:(-float(utility[i]),i))
            event('decision',phase='adaptive',actions=[int(index)],frames=256 if precision else 16,evidence_version=len(trace),
                  reason='用全部已测拟合证据更新候选，比较候选预测差异与噪声；结合网络排序，选择当前区分度最高的合法条件。',
                  policy='max_normalized_pairwise_separation_with_soft_neural_hint',eligible_actions=remaining,
                  candidate_pool=[r['label'] for r in plausible],priority=[dict(action=int(i),utility=float(utility[i])) for i in priority],
                  selected_scale=engine.scale[index].tolist(),active_features=engine.cm.tolist(),prior_scores=[float(scores[r['label']]) for r in plausible],pair_hints=pair_hints,
                  predicted_selected=[dict(label=r['label'],value=r['prediction'][index].tolist()) for r in plausible])
        acquire(index,256 if precision else 16,'fit',True)
    event('stop',state='compatible_set' if last_candidates else 'unsupported_or_model_mismatch',candidate_ids=last_candidates,reason='可用补测条件或测量预算已用尽，现有证据不足以唯一确认。',evidence_version=len(trace))
    return dict(state='compatible_set' if last_candidates else 'unsupported_or_model_mismatch',confirmed=False,candidate_ids=last_candidates,
                trace=trace,rounds=rounds,confirmation_audits=all_confirmations,timing=timing,**elapsed(),
                feature_contract=CONTRACT,Rs_ohm=list(RS),NPU_executed=False,all_catalog_candidates_checked=26)
