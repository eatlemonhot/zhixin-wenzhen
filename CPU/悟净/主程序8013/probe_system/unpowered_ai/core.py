import os
for key in ('OPENBLAS_NUM_THREADS','MKL_NUM_THREADS','OMP_NUM_THREADS'):os.environ[key]='1'
from pathlib import Path
import json,time,hashlib,copy
import numpy as np
from scipy.optimize import least_squares
ROOT=Path(__file__).resolve().parent
FREQ=np.array([2000,5000,10000,20000,50000,100000])
ACTIONS=[(r,p,f) for r in (100,10000) for p in ('P','N1','OUT') for f in FREQ]
# Fixed injection at P, fixed GND. Slot P reads internal VB with ADC probe UP;
# it never commands two probes onto one pad. N1/OUT use the moving ADC probe.
TEMPLATES={
 'rc_ladder':[('R1','R','P','N1',1000),('C1','C','N1','0',1e-8),('R2','R','N1','OUT',2200),('C2','C','OUT','0',4.7e-9)],
 'cr_ladder':[('C1','C','P','N1',1e-8),('R1','R','N1','0',1000),('C2','C','N1','OUT',4.7e-9),('R2','R','OUT','0',2200)],
 'rc_bandpass':[('C1','C','P','N1',1e-8),('R1','R','N1','0',2200),('R2','R','N1','OUT',1000),('C2','C','OUT','0',4.7e-9)],
 'r_divider':[('R1','R','P','N1',1000),('R2','R','N1','0',2200),('R3','R','N1','OUT',3300),('R4','R','OUT','0',4700)],
 'loaded_lowpass':[('R1','R','P','N1',1000),('C1','C','N1','0',1e-8),('R2','R','N1','OUT',2200),('C2','C','OUT','0',4.7e-9),('R3','R','OUT','0',10000)],
 'bridged_rc':[('R1','R','P','N1',1000),('R2','R','N1','OUT',2200),('R3','R','OUT','0',4700),('C1','C','N1','0',1e-8),('C2','C','P','OUT',2.2e-9)],
 'parallel_rc':[('R1','R','P','N1',1000),('C1','C','P','N1',1e-8),('R2','R','N1','OUT',2200),('C2','C','N1','OUT',4.7e-9),('R3','R','OUT','0',10000)],
 'shunted_highpass':[('C1','C','P','N1',1e-8),('R1','R','N1','0',2200),('C2','C','N1','OUT',4.7e-9),('R2','R','OUT','0',4700),('R3','R','P','0',10000)]}
MODES=('low','high','open','short')
def dump(p,x):Path(p).write_text(json.dumps(x,ensure_ascii=False,indent=2,allow_nan=False),encoding='utf8')
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def catalogue(parts):return ['normal']+[p[0]+':'+m for p in parts for m in MODES]
def solve(parts,label=0,factor=1.,rs_values=None):
 nmap={n:i for i,n in enumerate(('SRC','VA','P','N1','OUT'))};a=np.zeros((36,5,5),complex);b=np.zeros((36,5),complex)
 fs=np.array([v[2] for v in ACTIONS]);w=2j*np.pi*fs
 def stamp(x,y,ad):
  if x!='0':a[:,nmap[x],nmap[x]]+=ad
  if y!='0':a[:,nmap[y],nmap[y]]+=ad
  if x!='0' and y!='0':a[:,nmap[x],nmap[y]]-=ad;a[:,nmap[y],nmap[x]]-=ad
 for idx,(_,kind,x,y,value) in enumerate(parts):
  mode=MODES[(label-1)%4] if label and (label-1)//4==idx else None
  if mode=='open':continue
  if mode=='short':stamp(x,y,10.);continue
  if mode in ('low','high'):value*=factor
  stamp(x,y,1/value if kind=='R' else w*value)
 stamp('SRC','VA',1/50);stamp('VA','P',1/np.array([(rs_values or {}).get(str(v[0]),v[0]) for v in ACTIONS]))
 for n in ('P','N1','OUT'):stamp(n,'0',1e-12)
 adm=1/(1000+1/(1/1e7+w*5e-12))+w*50e-12
 for n in ('VA','P'):stamp(n,'0',adm)
 for n in ('N1','OUT'):
  mask=np.array([v[1]==n for v in ACTIONS]);stamp(n,'0',mask*adm)
 a[:,0,:]=0;a[:,0,0]=1;b[:,0]=1
 v=np.linalg.solve(a,b[...,None])[...,0];va=v[:,1];vb=v[:,2];vc=np.array([v[i,nmap[t[1]]] for i,t in enumerate(ACTIONS)])
 c=vc/va;h=vb/va
 return np.column_stack((c.real,c.imag,np.zeros(36),np.zeros(36),h.real,h.imag))
def perturb(parts,rng):return [(*p[:4],p[4]*rng.uniform(1-(.01 if p[1]=='R' else .05),1+(.01 if p[1]=='R' else .05))) for p in parts]
def noise(x,rng,frames):
 y=x.copy();sd=.00008+.0003/np.sqrt(frames)
 for q in (0,4):
  z=(y[:,q]+1j*y[:,q+1])*rng.normal(1,.00015)*np.exp(1j*rng.normal(0,.00015))
  z+=rng.normal(0,sd,36)+1j*rng.normal(0,sd,36);y[:,q]=z.real;y[:,q+1]=z.imag
 return y
def encode(obs,ref,mask):
 ref=np.array(ref,copy=True);d=np.zeros_like(ref);d[mask]=obs[mask]-ref[mask]
 d[:,2:4]=0;ref[:,2:4]=0
 return np.r_[1.,0.,d.ravel(),ref.ravel(),mask].astype(np.float32)
def group(name,gid):
 rng=np.random.default_rng(2026110201+gid*997+list(TEMPLATES).index(name)*100007)
 return perturb(TEMPLATES[name],rng)
def dataset(groups,repeats,seed):
 rng=np.random.default_rng(seed);xx=[];yy=[]
 for name,nominal in TEMPLATES.items():
  for gid in groups:
   parts=group(name,gid);normal=solve(parts)
   for label in range(len(catalogue(parts))):
    factor=rng.uniform(.76,.94) if label and (label-1)%4==0 else rng.uniform(1.06,1.24)
    raw=solve(parts,label,factor)
    for rep in range(repeats):
     ref=noise(normal,rng,256);obs=noise(raw,rng,16);mask=np.zeros(36,bool)
     count=36 if rep%4==0 else int(rng.choice([4,8,12,18,24,30]));mask[rng.choice(36,count,False)]=1
     xx.append(encode(obs,ref,mask));yy.append(label)
 return np.asarray(xx),np.asarray(yy,dtype=np.int64)
from ..neural_ranker import NeuralRanker
class Ranker(NeuralRanker):
 pass
class Controller:
 def __init__(self,nominal,reference,ranker,rs_values=None):
  start=time.perf_counter();self.nominal=copy.deepcopy(nominal);self.reference=reference;self.ranker=ranker;self.names=catalogue(nominal);self.rs_values=rs_values
  def residual(z):
   parts=[(*p[:4],p[4]*np.exp(v)) for p,v in zip(nominal,z)]
   return ((solve(parts,rs_values=rs_values)-reference)[:,[0,1,4,5]]/.0005).ravel()
  fit=least_squares(residual,np.zeros(len(nominal)),bounds=(-.08,.08),max_nfev=80)
  self.parts=[(*p[:4],p[4]*np.exp(v)) for p,v in zip(nominal,fit.x)]
  self.reference_mse=float(np.mean(fit.fun**2));self.curves=[];self.labels=[]
  for label in range(len(self.names)):
   mode=(label-1)%4 if label else 2
   factors=np.linspace(.75,.95,21) if label and mode==0 else np.linspace(1.05,1.25,21) if label and mode==1 else [1.]
   for factor in factors:self.curves.append(solve(self.parts,label,factor,rs_values=rs_values));self.labels.append(label)
  self.curves=np.array(self.curves);self.labels=np.array(self.labels);self.init_ms=1000*(time.perf_counter()-start)
 def diagnose(self,measure):
  start=time.perf_counter();used=[];history=[];obs=np.zeros((36,6));mask=np.zeros(36,bool);retained=list(range(len(self.names)));plan_ms=[];nn_ms=[];fit_ms=[];confirmations=[]
  active=np.arange(len(self.curves))
  for step in range(36):
   t=time.perf_counter();remaining=np.flatnonzero(~mask)
   score=np.var(self.curves[active][:,remaining,:][:,:,[0,1,4,5]],axis=0).sum(1)
   if used:score/=(1+.03*(np.array([ACTIONS[i][0] for i in remaining])!=ACTIONS[used[-1]][0]))
   index=int(remaining[np.argmax(score)]);plan_ms.append(1000*(time.perf_counter()-t))
   fresh=measure(index,16);obs[index]=fresh;mask[index]=True;used.append(index)
   t=time.perf_counter();logits=self.ranker(encode(obs,self.reference,mask));order=np.argsort(-logits[:len(self.names)]);nn_ms.append(1000*(time.perf_counter()-t))
   t=time.perf_counter();diff=(self.curves[:,mask,:][:,:,[0,1,4,5]]-obs[mask][:,[0,1,4,5]])/.0007
   err=np.mean(diff**2,axis=(1,2));best=float(err.min());active=np.flatnonzero((err<=9)&(err<=best+4))
   retained=list(dict.fromkeys(int(self.labels[i]) for i in active));fit_ms.append(1000*(time.perf_counter()-t))
   history.append(dict(round=step+1,action=index,remaining_candidates=retained,network_order=list(map(int,order[:3])),best_weighted_mse=best))
   if not retained:break
   if len(retained)==1 and step>=2:
    # Fresh independent confirmation at two observed conditions; excluded from fitting.
    prediction=self.curves[int(np.argmin(err))].copy();checks=[]
    for q in used[-2:]:
     confirm=measure(q,256);mse=float(np.mean(((prediction[q,[0,1,4,5]]-confirm[[0,1,4,5]])/.0007)**2));checks.append(mse)
    confirmations.append(dict(frozen_prediction=True,indices=used[-2:],mse=checks))
    if max(checks)<=9:break
  confirmed=len(retained)==1 and bool(confirmations) and max(confirmations[-1]['mse'])<=9
  return dict(status='confirmed' if confirmed else 'compatible_set' if retained else 'insufficient_evidence',candidates=retained,conditions=len(used),history=history,confirmations=confirmations,initialization_ms=self.init_ms,reference_mse=self.reference_mse,diagnostic_ms=1000*(time.perf_counter()-start),planning_ms=plan_ms,network_ms=nn_ms,fitting_ms=fit_ms)
