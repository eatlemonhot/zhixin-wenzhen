from spec_highz import *
from physical_bank import Bank
import time
RESERVE=[9,34]
INITIAL=[2,8,14,20,26,32]
def softmax(x):
    y=np.exp(x-np.max(x));return y/y.sum()
class Ranker:
    def __init__(self,path):
        self.path=Path(path);self.norm=dict(np.load(self.path/'normalization.npz'));self.w=dict(np.load(self.path/'cpu_weights.npz'))
    def __call__(self,b,obs,ref,mask):
        z=(encode(b,obs,ref,mask)-self.norm['mean'])*self.norm['inv_std'];z=z.astype(np.float32)
        for j in range(3):
            z=z@self.w['W'+str(j)].T+self.w['b'+str(j)]
            if j<2:z=np.maximum(z,np.float32(0))
        return softmax(z)
def costs(b,i,last):
    r,p,f=actions(b)[i];old=actions(b)[last] if last is not None else None
    # 动作代价用于调度估算；2 kHz按8倍抽取计算记录时间，实际耗时需结合硬件配置测量。
    ratio=8 if f==2000 else 1
    return 1000*8192/(25e6/ratio)*16+2+(200 if old is None or old[1]!=p else 0)+(2 if old and old[0]!=r else 0)
class Engine:
    def __init__(self,bank,reference,board,scales,class_scales=None):
        self.bank=bank;self.ref=np.array(reference,float);self.board=board;self.curves=bank.curves(board,self.ref)
        self.noise=.0005+.0012*abs(reference)
        for k in (0,4):
            amplitude=abs(reference[:,k]+1j*reference[:,k+1])
            self.noise[:,k]=self.noise[:,k+1]=.0005+.0012*amplitude
        self.scale=np.maximum(np.asarray(scales,float),self.noise)
        self.class_scale=np.sqrt(np.asarray(class_scales if class_scales is not None else [scales]*26)**2+self.noise[None]**2)
        self.cm=AVAILABLE[board]
    def adjust(self,pred,obs,mask,scale=None):
        one=pred.ndim==2;out=np.array(pred[None] if one else pred,copy=True)
        scale=self.noise if scale is None else scale
        # Residual calibration errors are explicit nuisance parameters, not
        # tolerance inflation. Fitted ONLY on already acquired fit conditions.
        for k in (0,4):
            p=out[:,:,k]+1j*out[:,:,k+1];o=obs[:,k]+1j*obs[:,k+1]
            weights=2/(scale[mask,k]**2+scale[mask,k+1]**2)
            denom=np.sum(abs(p[:,mask])**2*weights,axis=1)
            g=np.divide(np.sum(p[:,mask].conj()*o[mask]*weights,axis=1),denom,
                out=np.ones(len(out),complex),where=denom>1e-10)
            g=np.clip(abs(g),.996,1.004)*np.exp(1j*np.clip(np.angle(g),-.004,.004))
            z=p*g[:,None];out[:,:,k]=z.real;out[:,:,k+1]=z.imag
            if k==0 and self.board=='B':out[:,:,2:4]*=abs(g)[:,None,None]
        if self.board=='B':
            offset=np.clip(np.mean(obs[mask,2]-out[:,mask,2],axis=1),-.001,.001)
            out[:,:,2]+=offset[:,None]
        return out[0] if one else out
    def fit(self,obs,mask):
        rows=[]
        for label,(grid,pred) in enumerate(self.curves):
            adjusted=self.adjust(pred,obs,mask,self.class_scale[label])
            residual=((adjusted[:,mask]-obs[mask])/self.class_scale[label,mask])[:,:,self.cm]
            scores=np.mean(residual**2,axis=(1,2));j=int(scores.argmin());factor=float(grid[j]);best=adjusted[j]
            if len(grid)>1 and scores[j]<4:
                lo=grid[max(0,j-1)];hi=grid[min(len(grid)-1,j+1)]
                def objective(f):
                    p=self.adjust(self.bank.predict(self.board,label,self.ref,f),obs,mask,self.class_scale[label])
                    return float(np.mean((((p[mask]-obs[mask])/self.class_scale[label,mask])[:,self.cm])**2))
                q=minimize_scalar(objective,bounds=(lo,hi),method='bounded',options={'xatol':1e-5})
                if q.fun<scores[j]:factor=float(q.x);best=self.adjust(self.bank.predict(self.board,label,self.ref,factor),obs,mask,self.class_scale[label])
            mse=float(np.mean((((best[mask]-obs[mask])/self.class_scale[label,mask])[:,self.cm])**2))
            common=float(np.sum((((best[mask]-obs[mask])/self.noise[mask])[:,self.cm])**2))
            rows.append(dict(label=label,factor=factor,fit_MSE=mse,deviance=common,prediction=best))
        return sorted(rows,key=lambda r:r['deviance'])
    def compatible(self,rows,obs,mask,q=4.):
        winner=rows[0];pw=winner['prediction'][mask][:,self.cm];target=obs[mask][:,self.cm];s=self.noise[mask][:,self.cm]
        rw=(pw-target)/s;result=[]
        for row in rows:
            p=row['prediction'][mask][:,self.cm];direction=(p-pw)/s
            difference=float(np.sum(((p-target)/s)**2-rw**2))
            v=(self.class_scale[row['label'],mask][:,self.cm]/s)**2+(self.class_scale[winner['label'],mask][:,self.cm]/s)**2
            var=float(4*np.sum(direction**2*v));z=difference/max(np.sqrt(var),1e-9)
            row['predictive_contrast_z']=z
            if row['fit_MSE']<=1 and z<=q:result.append(row)
        return result
def choose(board,rows,mask,scale,scores,last):
    plausible=[r for r in rows if r['deviance']<=rows[0]['deviance']+25]
    if len(plausible)<2:plausible=rows[:4]
    predictions=np.array([r['prediction'] for r in plausible]);pairs=[]
    for a in range(len(plausible)):
        for b in range(a+1,len(plausible)):
            d=np.mean((((predictions[a]-predictions[b])/scale)[:,AVAILABLE[board]])**2,axis=1)
            hint=.75+.25*(scores[plausible[a]['label']]+scores[plausible[b]['label']])
            pairs.append(d*hint)
    utility=np.mean(pairs,axis=0)
    ids=np.array([i for i in range(N) if not mask[i] and i not in RESERVE])
    return int(ids[np.argmax(utility[ids]/np.sqrt([costs(board,i,last) for i in ids]))])
def diagnose(request,bank,ranker,calibration,full_scan=False):
    tic=time.perf_counter();meta=request['metadata']
    if request.get('schema')!='ab-pl-lsq-100-10k-v1':raise ValueError('measurement schema does not match this model')
    for name,state in (('contact_ok','reacquire_contact'),('quality_ok','reacquire_quality'),('range_ok','reacquire_range')):
        if not meta.get(name,False):return dict(state=state,confirmed=False,candidate_ids=[],trace=[],CPU_seconds=time.perf_counter()-tic)
    if not meta.get('simulation_only',False) and not (meta.get('frontend_calibrated') and meta.get('phase_calibrated')):
        return dict(state='needs_frontend_and_phase_calibration',confirmed=False,candidate_ids=[],trace=[],CPU_seconds=time.perf_counter()-tic)
    ref=np.asarray(request['reference'],float)
    if ref.shape!=(N,K) or not np.isfinite(ref).all():raise ValueError('invalid same-DUT normal reference')
    routing=[]
    for b in 'AB':
        mean,scale,basis,ps=bank.parameters[b];x=ref.ravel()
        physical=.01+.05*abs(mean.reshape(N,K))
        for k in (0,4):
            mag=abs(mean.reshape(N,K)[:,k]+1j*mean.reshape(N,K)[:,k+1]);physical[:,k]=physical[:,k+1]=.01+.05*mag
        routing.append((float(np.mean(((x-mean)/physical.ravel())**2)),b))
    routing_score,board=min(routing)
    if routing_score>1.:
        return dict(state='outside_supported_normal_references',confirmed=False,candidate_ids=[],trace=[],CPU_seconds=time.perf_counter()-tic)
    engine=Engine(bank,ref,board,np.array(calibration['scale'][board]),calibration.get('class_scale',{}).get(board));obs=np.zeros((N,K));mask=np.zeros(N,bool);trace=[];last=None
    def acquire(i,role):
        nonlocal last
        if mask[i]:raise RuntimeError('duplicate acquisition')
        value=np.asarray(request['measurements'][str(i)],float)
        if value.shape!=(K,) or not np.isfinite(value).all():raise ValueError('invalid acquired features')
        obs[i]=value;mask[i]=True;trace.append(dict(action=int(i),configuration=actions(board)[i],role=role,frames=16,modeled_ms=costs(board,i,last)));last=i
    for i in INITIAL:acquire(i,'initial_fit')
    history=[];network_calls=0
    while True:
        rows=engine.fit(obs,mask);best=rows[0];compatible=engine.compatible(rows,obs,mask,calibration.get('predictive_contrast_q',4.))
        history.append(dict(fit_count=int(mask.sum()),compatible=[r['label'] for r in compatible],best_MSE=best['fit_MSE']))
        if int(mask.sum())>=N-2 or (not full_scan and mask.sum()>=12 and len(compatible)==1):break
        score=ranker(board,obs,ref,mask);network_calls+=1
        for _ in range(min(4,N-2-int(mask.sum()))):
            i=next(i for i in range(N) if not mask[i] and i not in RESERVE) if full_scan else choose(board,rows,mask,engine.scale,score,last)
            acquire(i,'adaptive_fit' if not full_scan else 'full_scan_fit')
    fitted=np.flatnonzero(mask).tolist();frozen=[dict(r,prediction=np.array(r['prediction'],copy=True)) for r in compatible]
    frozen_hash=hashlib.sha256(np.array([r['prediction'] for r in frozen]).tobytes()).hexdigest()
    for i in RESERVE:acquire(i,'independent_confirmation')
    accepted=[];audit=[]
    for row in frozen:
        mse=float(np.mean((((row['prediction'][RESERVE]-obs[RESERVE])/engine.class_scale[row['label'],RESERVE])[:,engine.cm])**2));audit.append(dict(label=row['label'],fit_MSE=row['fit_MSE'],confirmation_MSE=mse,factor=row['factor']))
        if mse<=2.25:accepted.append(row['label'])
    return dict(board_inferred=board,state='confirmed_single_catalog_fault' if len(accepted)==1 else 'compatible_set' if accepted else 'unsupported_or_model_mismatch',
        confirmed=len(accepted)==1,candidate_ids=accepted,trace=trace,fit_indices=fitted,confirmation_indices=RESERVE,
        predictions_frozen_before_confirmation=True,frozen_prediction_sha256=frozen_hash,all_catalog_candidates_checked=26,
        audit=audit,rounds=history,network_calls=network_calls,measured_actions=len(trace),modeled_ms=sum(t['modeled_ms'] for t in trace),
        CPU_seconds=time.perf_counter()-tic,NPU_executed=False,scope='original A/B 26-class single-fault catalog, calibrated-linear-highZ simulation',
        predictor='SPICE response surrogate with held-out interpolation-error calibration; NOT online exact SPICE')

from scipy.optimize import minimize_scalar
