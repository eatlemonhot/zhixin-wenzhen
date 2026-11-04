import os
for _key in ('OPENBLAS_NUM_THREADS','OMP_NUM_THREADS','MKL_NUM_THREADS'):os.environ[_key]='1'
from pathlib import Path
import sys,json
import numpy as np
from lsq_contract import aggregate,CONTRACT

ROOT=Path(__file__).resolve().parent
sys.path.insert(0,str(ROOT/'ab'))
import spec_highz as AB
from ne5532_expert import spec_ne as NE

FAMILIES=('A','B','NE');RS=(100,10000);N=36;K=6;FEATURES=470
VARIANTS=dict(A='A_OPA2197_PL_LSQ_100_10K_V1',B='B_NE5532_1N4148_PL_LSQ_100_10K_V1',NE='A_NE5532_PL_LSQ_100_10K_V1')
AVAILABLE={family:(np.ones(6,bool) if family=='B' else np.array([1,1,0,0,1,1],bool)) for family in FAMILIES}
PREPROCESSING={family:('raw-delta-reference-v1' if family=='NE' else 'asinh-complex-relative-v1') for family in FAMILIES}
PREPROCESSING['B']='asinh-relative-interstage-v2'

def dump(path,value):
    path=Path(path);path.parent.mkdir(parents=True,exist_ok=True);path.write_text(json.dumps(value,ensure_ascii=False,indent=2,allow_nan=False),encoding='utf-8')

def encode(family,obs,ref,mask):
    obs=np.asarray(obs);ref=np.array(ref,copy=True);mask=np.asarray(mask,bool)
    from action_policy import policy
    if any(mask[i] for i in policy(family)['excluded']):raise ValueError('Features include an unqualified device condition')
    clean=np.zeros((N,K));clean[mask]=obs[mask]-ref[mask];clean[:,~AVAILABLE[family]]=0;ref[:,~AVAILABLE[family]]=0
    if PREPROCESSING[family] in ('asinh-complex-relative-v1','asinh-relative-interstage-v2'):
        for k in (0,4):
            base=ref[:,k]+1j*ref[:,k+1];denom=np.where(abs(base)>.01,base,.01+0j)
            relative=(clean[:,k]+1j*clean[:,k+1])/denom;clean[:,k]=relative.real;clean[:,k+1]=relative.imag
        clean[:,2:4]/=(.01+abs(ref[:,2:4]))
        if family=='B':
            o=np.asarray(obs).reshape(2,3,6,6);r=ref.reshape(2,3,6,6);m=mask.reshape(2,3,6)
            delta=clean.reshape(2,3,6,6)
            for stage in (1,2):
                z=o[:,stage,:,0]+1j*o[:,stage,:,1];den=o[:,stage-1,:,0]+1j*o[:,stage-1,:,1]
                zr=r[:,stage,:,0]+1j*r[:,stage,:,1];dr=r[:,stage-1,:,0]+1j*r[:,stage-1,:,1]
                base=zr/np.where(abs(dr)>.001,dr,.001+0j)
                observed=z/np.where(abs(den)>.001,den,.001+0j)
                change=(observed-base)/np.where(abs(base)>.001,base,.001+0j)
                present=m[:,stage]&m[:,stage-1]
                delta[:,stage,:,4]=np.where(present,change.real,0.);delta[:,stage,:,5]=np.where(present,change.imag,0.)
                r[:,stage,:,4]=base.real;r[:,stage,:,5]=base.imag
        clean=np.arcsinh(clean);ref=np.arcsinh(ref/.1)
    return np.r_[family!='B',family=='B',clean.ravel(),ref.ravel(),mask].astype(np.float32)

def sampled(stats,rng,frames=16,systematic=True,phases=None,linear=False):
    phases=(np.zeros((N,3,frames),np.uint8) if linear else rng.integers(0,64,(N,3,frames))) if phases is None else np.asarray(phases)
    if linear:
        averaged=np.asarray(stats[:,:,0],float);z=averaged[:,:,1]+1j*averaged[:,:,2];a,b,c=z[:,0],z[:,1],z[:,2]
        result=np.column_stack([(c/a).real,(c/a).imag,averaged[:,2,0]/abs(a),np.sqrt(np.maximum(0,averaged[:,2,3])+.00005**2)/abs(a),(b/a).real,(b/a).imag])
    else:result=aggregate(stats,phases,noise_rms_V=.00005)
    if systematic:
        for k in (0,4):
            z=result[:,k]+1j*result[:,k+1]
            z*=rng.normal(1,.0007)*np.exp(1j*rng.normal(0,.0007))
            z*=rng.normal(1,.0002,N)*np.exp(1j*rng.normal(0,.0002,N))
            sigma=rng.uniform(.0003,.0015)/np.sqrt(frames)
            z+=rng.normal(0,sigma,N)+1j*rng.normal(0,sigma,N)
            result[:,k]=z.real;result[:,k+1]=z.imag
        result[:,2]+=rng.normal(0,.0002)+rng.normal(0,.0005/np.sqrt(frames),N)
        result[:,3]*=rng.normal(1,.0005,N)
    return result,phases

def metadata(family):
    from action_policy import policy
    return dict(device_signature={'opamp':'NE5532','diodes':['1N4148','1N4148']} if family=='B' else None,action_policy=policy(family),schema='ab-pl-lsq-100-10k-v1',family=family,variant=VARIANTS[family],feature_contract=CONTRACT,
                preprocessing_id=PREPROCESSING[family],
                Rs_ohm=list(RS),input_shape=[1,FEATURES],output_shape=[1,26],frequencies_hz=list(AB.FREQS),
                fixed_input_model_domain='P only; a movable source must stay within each expert electrical domain.',
                available_features=AVAILABLE[family].tolist(),normal_reference_frames=256,measurement_frames=[16,256],
                phase_policy='Coherent DDS; random first phases aggregated using per-frame LSQ; phase evidence retained for CPU prediction.',
                approximation='64-point phase grid; B features use 96 waveform harmonics and CPU phase correction uses 24 with held-out error calibration; floating-point LSQ/CIC3, not bit-exact RTL or ADC quantization.',
                same_DUT_normal_reference_required=True,real_hardware=False,NPU_executed=False)

def source_phasors(statistics,phase_indices):
    raw=np.asarray(statistics)[:,0,:,1:3];phase=np.asarray(phase_indices)[:,0]
    selected=np.take_along_axis(raw,phase[...,None],axis=1).mean(axis=1)
    return selected[:,0]+1j*selected[:,1]
