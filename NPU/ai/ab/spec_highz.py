"""A/B high-impedance retraining, provisional calibrated-linear front end.

The hardware proposals are not a finalized or qualified schematic. This model
describes a linear calibrated buffered path; it does not pretend that the
proposed small-signal clamp is linear for all A/B output voltages.
"""
import os
for k in ('OPENBLAS_NUM_THREADS','OMP_NUM_THREADS','MKL_NUM_THREADS'):os.environ[k]='1'
from pathlib import Path
import sys,json,hashlib
import numpy as np
ROOT=Path(__file__).resolve().parent
BASE=ROOT.parent
DEPENDENCY=ROOT/'legacy'
sys.path.insert(0,str(DEPENDENCY))
from spec import DESIGNS,CATALOGS,fault_values,MODEL
SEED=2026102207
FREQS=[2000,5000,10000,20000,50000,100000]
RS=[100,10000]
CHANNELS=['Re_VC_over_VA','Im_VC_over_VA','DC_C_over_abs_VA','residual_RMS_C_over_abs_VA','Re_VB_over_VA','Im_VB_over_VA']
AVAILABLE={'A':np.array([True,True,False,False,True,True]),'B':np.ones(6,bool)}
GROUPS={'train':list(range(8)),'validation':[100,101],'calibration':[200,201],'test':[800,801]}
SPLIT={g:i for i,name in enumerate(GROUPS) for g in GROUPS[name]}
def actions(board):return [(r,p,f) for r in RS for p in DESIGNS[board]['main_probes'] for f in FREQS]
N=36;K=len(CHANNELS);FEATURES=2+N*K*2+N
def dump(p,x):
    p=Path(p);p.parent.mkdir(parents=True,exist_ok=True)
    p.write_text(json.dumps(x,ensure_ascii=False,indent=2,allow_nan=False)+'\n',encoding='utf8')
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def sample(board,group):
    rng=np.random.default_rng(SEED+group*1009+(400000 if board=='B' else 0))
    v={p['ref']:float(p['value']*rng.uniform(1-(.01 if p['kind']=='R' else .05),1+(.01 if p['kind']=='R' else .05)))
       for p in DESIGNS[board]['parts'] if p['kind'] in ('R','C')}
    n=dict(source=float(.1*rng.uniform(.99,1.01)),supply=float(5*rng.uniform(.99,1.01)),
           rs_factor=float(rng.uniform(.999,1.001)),rout=float(rng.uniform(45,55)),
           rin=float(rng.uniform(8e6,12e6)),wire_c=float(rng.uniform(20e-12,100e-12)),
           buffer_c=float(rng.uniform(3e-12,8e-12)),rprot=1000.,
           diode_Is=float(2.52e-9*np.exp(rng.normal(0,.08))),diode_N=float(1.752*rng.uniform(.99,1.01)))
    return v,n
def event_state(board,group,label):
    v,n=sample(board,group);e=CATALOGS[board][label]
    vv,extra,factor=fault_values(board,e,v,SEED+group*7919+label*97+(800000 if board=='B' else 0))
    return vv,n,extra,factor
def encode(board,obs,ref,mask):
    mask=np.asarray(mask,bool);clean=np.zeros((N,K));clean[mask]=np.asarray(obs)[mask]-ref[mask]
    if not np.isfinite(clean).all() or not np.isfinite(ref).all():raise ValueError('invalid observed features/reference')
    clean[:,~AVAILABLE[board]]=0;reference=np.array(ref,copy=True);reference[:,~AVAILABLE[board]]=0
    return np.r_[board=='A',board=='B',clean.ravel(),reference.ravel(),mask].astype(np.float32)
def noisy(x,rng,frames=16,systematic=True):
    y=np.array(x,float,copy=True)
    # Provisional feature-level uncertainty AFTER gain/phase calibration.
    # Systematic terms remain regardless of frame averaging.
    for offset in (0,4):
        z=y[:,offset]+1j*y[:,offset+1]
        if systematic:
            z*=rng.normal(1,.0007)*np.exp(1j*rng.normal(0,.0007))
            z*=rng.normal(1,.0002,(N,))*np.exp(1j*rng.normal(0,.0002,(N,)))
        sigma=rng.uniform(.0003,.0015)/np.sqrt(frames)
        z+=rng.normal(0,sigma,N)+1j*rng.normal(0,sigma,N)
        y[:,offset]=z.real;y[:,offset+1]=z.imag
    y[:,2]+=rng.normal(0,.0002 if systematic else 0)+rng.normal(0,.0005/np.sqrt(frames),N)
    y[:,3]=np.maximum(0,y[:,3]+rng.normal(0,.0005/np.sqrt(frames),N))
    return y
def metadata():return dict(schema='ab-highz-calibrated-linear-v1',boards=['A','B'],catalogs=CATALOGS,
    supply_V=[5,-5],frequencies_Hz=FREQS,Rs_ohm=RS,actions={b:actions(b) for b in 'AB'},
    feature_channels=CHANNELS,available_channels={b:AVAILABLE[b].tolist() for b in 'AB'},input_shape=[1,FEATURES],output_shape=[1,26],
    normal_reference='same DUT with matching fixture and algorithm',groups=GROUPS,
    frontend_status='SIMULATION ASSUMPTIONS, NOT hardware calibrated/qualified',
    frontend_assumptions=dict(rin_range_ohm=[8e6,12e6],wire_C_range_F=[20e-12,100e-12],buffer_C_range_F=[3e-12,8e-12],
        input_series_R_ohm=1000,source_R_range_ohm=[45,55],buffer_output='gain/phase corrected linear path',
        clamp_model_included=False,OPA810_vendor_macro_used=False,
        limitation='Hardware small-signal clamp and range must pass A/B normal+fault outputs before this model is used on hardware.'),
    acquisition='periodic SPICE response and statistical 16-frame feature uncertainty, NOT raw CIC/ADC simulation',
    reliable_phase_required=True,H2_H3_fields_required=False,real_hardware_data=False,NPU_executed=False)
