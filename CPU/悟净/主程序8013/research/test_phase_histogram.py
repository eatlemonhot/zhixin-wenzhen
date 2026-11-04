from pathlib import Path
import sys,time
import numpy as np
ROOT=Path(__file__).resolve().parent;sys.path.insert(0,str(ROOT/'candidate_app/ai'))
from histogram_phase_moments import phase_moments
from model_spec import dump
rng=np.random.default_rng(4821);worst=0;checks=0;slow=0;fast=0
for h in (24,48,96):
    for n in (16,64,256):
        for trial in range(30):
            indices=rng.integers(0,64,n).astype(float)
            if trial==0:indices=np.linspace(0,63,n)
            if trial==1:indices+=.125
            t=time.perf_counter();old=np.exp(1j*indices[:,None]*(2*np.pi/64)*np.arange(-2*h,2*h+1)[None]).mean(0);slow+=time.perf_counter()-t
            t=time.perf_counter();new=phase_moments(h,tuple(indices));fast+=time.perf_counter()-t
            worst=max(worst,float(abs(old-new).max()));checks+=1
assert worst<1e-12,worst
dump(ROOT/'PHASE_HISTOGRAM_AUDIT.json',dict(passed=True,checks=checks,max_complex_abs_error=worst,original_seconds=slow,histogram_seconds=fast,integer_fast_path=True,fractional_not_rounded=True,scope='Fourier moments on already qualified 64-grid phase metadata; exact algebra, not a new phase quantizer'))
print(checks,worst,slow,fast)
