from .core import *
class OptimizedController(Controller):
 def diagnose(self,measure,cancel=None):
  start=time.perf_counter();used=[];history=[];obs=np.zeros((36,6));mask=np.zeros(36,bool)
  active=np.arange(len(self.curves));retained=list(range(len(self.names)));sse=np.zeros(len(self.curves));plan_ms=[];nn_ms=[];fit_ms=[];confirmations=[];reason='action_budget'
  channels=[0,1,4,5];pred=self.curves[:,:,channels]
  for step in range(36):
   if cancel:cancel()
   t=time.perf_counter();remaining=np.flatnonzero(~mask);cur=pred[active][:,remaining,:]
   if len(retained)>1 and step>=3 and np.max(np.ptp(cur,axis=0))<.0001:
    reason='predicted_candidate_separation_below_resolution';break
   score=np.var(cur,axis=0).sum(1)
   if used:score/=(1+.03*(np.array([ACTIONS[i][0] for i in remaining])!=ACTIONS[used[-1]][0]))
   index=int(remaining[np.argmax(score)]);plan_ms.append(1000*(time.perf_counter()-t))
   fresh=np.asarray(measure(index,16),float)
   if fresh.shape!=(6,) or not np.isfinite(fresh).all():raise ValueError('Invalid calibrated F6')
   obs[index]=fresh;mask[index]=True;used.append(index)
   t=time.perf_counter();order=np.argsort(-self.ranker(encode(obs,self.reference,mask))[:len(self.names)]);nn_ms.append(1000*(time.perf_counter()-t))
   t=time.perf_counter();sse+=np.sum(((pred[:,index,:]-fresh[channels])/.0007)**2,axis=1);err=sse/(4*len(used));best=float(err.min())
   active=np.flatnonzero((err<=9)&(err<=best+4));retained=list(dict.fromkeys(int(self.labels[i]) for i in active));fit_ms.append(1000*(time.perf_counter()-t))
   history.append(dict(round=step+1,action=index,remaining_candidates=retained,network_order=list(map(int,order[:3])),best_weighted_mse=best))
   if not retained:reason='no_compatible_hypothesis';break
   if len(retained)==1 and step>=2:
    prediction=self.curves[int(np.argmin(err))].copy();checks=[]
    for q in used[-2:]:
     if cancel:cancel()
     confirm=np.asarray(measure(q,256),float)
     if confirm.shape!=(6,) or not np.isfinite(confirm).all():raise ValueError('Invalid independent confirmation')
     checks.append(float(np.mean(((prediction[q,channels]-confirm[channels])/.0007)**2)))
    confirmations.append(dict(frozen_prediction=True,indices=used[-2:],mse=checks))
    if max(checks)<=9:reason='fresh_independent_confirmation';break
  confirmed=len(retained)==1 and bool(confirmations) and max(confirmations[-1]['mse'])<=9
  return dict(status='confirmed' if confirmed else 'compatible_set' if len(retained)>1 else 'insufficient_evidence',candidates=retained,conditions=len(used),history=history,confirmations=confirmations,stop_reason=reason,initialization_ms=self.init_ms,reference_mse=self.reference_mse,diagnostic_ms=1000*(time.perf_counter()-start),planning_ms=plan_ms,network_ms=nn_ms,fitting_ms=fit_ms,NPU_executed=False)
