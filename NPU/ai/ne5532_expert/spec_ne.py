import os
for key in ('OMP_NUM_THREADS','MKL_NUM_THREADS','OPENBLAS_NUM_THREADS'):os.environ[key]='1'
from pathlib import Path
import json,hashlib
import numpy as np
ROOT=Path(__file__).resolve().parent;PROJECT=ROOT.parent
DESIGN=json.loads((ROOT/'design.json').read_text());CATALOG=json.loads((ROOT/'catalog.json').read_text())
SEED=2026102407;FREQS=[2000,5000,10000,20000,50000,100000];RS=[100,10000]
N=36;K=6;FEATURES=470;AVAILABLE=np.array([True,True,False,False,True,True])
VARIANT='A_NE5532_PL_LSQ_100_10K_V1';GROUPS=dict(train=list(range(24)),validation=list(range(100,106)),calibration=list(range(200,206)),final=list(range(800,808)))
def dump(path,obj):
    path=Path(path);path.parent.mkdir(parents=True,exist_ok=True);path.write_text(json.dumps(obj,ensure_ascii=False,indent=2,allow_nan=False)+'\n',encoding='utf8')
def sha(path):return hashlib.sha256(Path(path).read_bytes()).hexdigest()
def actions():return [(r,p,f) for r in RS for p in DESIGN['main_probes'] for f in FREQS]
def sample(group):
    rng=np.random.default_rng(SEED+int(group)*1009)
    values={p['ref']:float(p['value']*rng.uniform(1-(.01 if p['kind']=='R' else .05),1+(.01 if p['kind']=='R' else .05))) for p in DESIGN['parts'] if p['kind'] in ('R','C')}
    nuisance=dict(source=float(.1*rng.uniform(.99,1.01)),supply=float(rng.uniform(5.,5.1)),rs_factor=float(rng.uniform(.999,1.001)),rout=float(rng.uniform(45,55)),wire_c=float(rng.uniform(20e-12,100e-12)),rprot=1000.,rin=float(rng.uniform(8e6,12e6)),buffer_c=float(rng.uniform(3e-12,8e-12)))
    common=dict(A0=float(rng.uniform(5e4,2e5)),GBW=float(rng.uniform(8e6,12e6)),FP2=30e6,SRATE=float(rng.uniform(5e6,9e6)),ROUT=float(rng.uniform(25,75)),CIN=float(rng.uniform(1e-12,5e-12)),HEAD=float(rng.uniform(1.5,2.5)),ILIM=float(rng.uniform(.025,.05)))
    nuisance['amplifiers']=[dict(common,VOS=float(rng.uniform(-.004,.004)),IBP=float(rng.uniform(.1e-6,.8e-6)),IBM=float(rng.uniform(.1e-6,.8e-6)),GBW=float(common['GBW']*rng.uniform(.97,1.03))) for _ in range(2)]
    return values,nuisance
def state(group,label):
    values,nuisance=sample(group);event=CATALOG[label];extra=[];factor=1.;rng=np.random.default_rng(SEED+int(group)*7919+int(label)*97)
    if event['mode']=='normal':return values,nuisance,extra,factor
    part=next(p for p in DESIGN['parts'] if p['ref']==event['ref']);ref=part['ref'];mode=event['mode']
    if mode in ('low','high'):
        lo,hi=(.10,.35) if part['kind']=='R' else (.20,.50);factor=float(1+(-1 if mode=='low' else 1)*rng.uniform(lo,hi));values[ref]=part['value']*factor
    elif mode=='open':
        if part['kind']=='R':values[ref]=1e9
        else:values[ref]=None;extra.append(f'ROPEN_{ref} {part["a"]} {part["b"]} 1e9')
    elif mode=='short':
        if part['kind']=='R':values[ref]=.1
        else:values[ref]=None;extra.append(f'RSHORT_{ref} {part["a"]} {part["b"]} .1')
    return values,nuisance,extra,factor
def encode(obs,ref,mask):
    mask=np.asarray(mask,bool);clean=np.zeros((N,K));clean[mask]=np.asarray(obs)[mask]-ref[mask];clean[:,~AVAILABLE]=0;normal=np.array(ref,copy=True);normal[:,~AVAILABLE]=0
    return np.r_[1,0,clean.ravel(),normal.ravel(),mask].astype(np.float32)
def noisy(x,rng,frames=16):
    out=np.array(x,float,copy=True)
    for k in (0,4):
        z=out[:,k]+1j*out[:,k+1];z*=rng.normal(1,.0007)*np.exp(1j*rng.normal(0,.0007));z*=rng.normal(1,.0002,N)*np.exp(1j*rng.normal(0,.0002,N));sig=rng.uniform(.0003,.0015)/np.sqrt(frames);z+=rng.normal(0,sig,N)+1j*rng.normal(0,sig,N);out[:,k]=z.real;out[:,k+1]=z.imag
    out[:,2]+=rng.normal(0,.0002)+rng.normal(0,.0005/np.sqrt(frames),N);out[:,3]=np.maximum(0,out[:,3]+rng.normal(0,.0005/np.sqrt(frames),N));return out
