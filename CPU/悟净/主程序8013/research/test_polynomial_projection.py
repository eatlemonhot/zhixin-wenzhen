import os
for k in ('OPENBLAS_NUM_THREADS','OMP_NUM_THREADS','MKL_NUM_THREADS'):os.environ[k]='1'
from pathlib import Path
import sys,time
import numpy as np
ROOT=Path(__file__).resolve().parent;sys.path.insert(0,str(ROOT/'candidate_app/ai'))
from conditioned_bank import ConditionedBank
from polynomial_projection import window_features
from model_spec import sampled,dump
d=np.load(ROOT.parent/'b_ne5532_20261028/validation_physics/physics.npz');rng=np.random.default_rng(7361);checks=0;maximum=0.;oldtime=0.;newtime=0.
for group in (0,26,52):
    ref,rph=sampled(d['statistics'][group],rng,256);bank=ConditionedBank(ROOT/'candidate_app/ai/banks/B','B',rph)
    for i in (2,8,14,20,26,32):_,p=sampled(d['statistics'][group],rng,16);bank.set_phase(i,p[i])
    for child in bank.children.values():
        indices=sorted(child.phases);phase=[child.phases[i] for i in indices]
        for label,(grid,pred) in enumerate(child.base.curves('B',ref)):
            if 'coef_'+str(label) not in child.waves:continue
            for factors in (grid,np.array([float(grid[len(grid)//2])])):
                t=time.perf_counter();old=child._window_features(label,ref,factors,indices,phase);oldtime+=time.perf_counter()-t
                t=time.perf_counter();new=window_features(child,label,ref,factors,indices,phase);newtime+=time.perf_counter()-t
                maximum=max(maximum,float(abs(new-old).max()));checks+=1
assert maximum<1e-10,maximum
dump(ROOT/'POLYNOMIAL_PROJECTION_AUDIT.json',dict(passed=True,checks=checks,max_abs_error=maximum,original_seconds=oldtime,polynomial_seconds=newtime,scope='All existing B waveform hypotheses, 3 held-out normal references, grids and single refined factors; exact algebra in FP64, not physical tolerance change'))
print(checks,maximum,oldtime,newtime)
