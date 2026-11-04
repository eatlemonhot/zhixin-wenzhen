from functools import lru_cache
import numpy as np
from lsq_contract import capture_settings,mean_exp,cic

H=24;K=np.arange(-H,H+1);D=2*H+1
BASIS=np.zeros((D,D),complex);BASIS[0,H]=1
for h in range(1,H+1):
    BASIS[2*h-1,H+h]=BASIS[2*h-1,H-h]=.5
    BASIS[2*h,H+h]=-.5j;BASIS[2*h,H-h]=.5j

def real_coefficients(coef):
    coef=np.asarray(coef);out=np.empty(coef.shape[:-1]+(D,),float);out[...,0]=coef[...,H].real
    for h in range(1,H+1):out[...,2*h-1]=2*coef[...,H+h].real;out[...,2*h]=-2*coef[...,H+h].imag
    return out

@lru_cache(maxsize=32)
def frequency_operator(frequency):
    s=capture_settings(frequency);step=s['step'];u=mean_exp(np.arange(-2,3),step)
    gram=np.array([[1,u[3].real,u[3].imag],[u[3].real,(1+u[4].real)/2,u[4].imag/2],[u[3].imag,u[4].imag/2,(1-u[4].real)/2]])
    filtered=BASIS*cic(K,s)[None]
    t=np.stack([mean_exp(K,step),(mean_exp(K+1,step)+mean_exp(K-1,step))/2,
                (mean_exp(K+1,step)-mean_exp(K-1,step))/(2j)])
    projected=np.linalg.solve(gram,t)
    kk=K[:,None]+K[None]
    residual=mean_exp(kk,step)-t.T@projected
    return filtered,projected,residual,cic(np.array([1]),s)[0]

@lru_cache(maxsize=1024)
def kernel(frequency,phase_tuple):
    phases=np.asarray(phase_tuple);filtered,projected,residual,cic1=frequency_operator(frequency)
    moments=np.exp(1j*phases[:,None]*np.arange(-2*H,2*H+1)[None]).mean(0)
    dc=(filtered@(projected[0]*moments[K+2*H])).real
    phasor=filtered@((projected[1]-1j*projected[2])*1j/cic1*moments[K-1+2*H])
    q=(filtered@(residual*moments[K[:,None]+K[None]+2*H])@filtered.T).real
    return dc,phasor,(q+q.T)/2

def channel_statistics(coef,frequency,phases):
    values=real_coefficients(coef);dc,v,q=kernel(int(frequency),tuple(map(float,phases)))
    return np.stack([values@dc,(values@v).real,(values@v).imag,
                     np.maximum(0,np.einsum('...i,ij,...j->...',values,q,values,optimize=True))],axis=-1)

def features(coef,frequencies,phase_indices,noise_rms_V=.00005):
    coef=np.asarray(coef);single=coef.ndim==3
    if single:coef=coef[None]
    stats=np.empty(coef.shape[:3]+(4,),float)
    for i,f in enumerate(frequencies):
        for channel in range(3):
            phases=np.asarray(phase_indices[i][channel],float)*2*np.pi/64
            stats[:,i,channel]=channel_statistics(coef[:,i,channel],f,phases)
    z=stats[:,:,:,1]+1j*stats[:,:,:,2];a,b,c=z[:,:,0],z[:,:,1],z[:,:,2]
    result=np.stack([(c/a).real,(c/a).imag,stats[:,:,2,0]/abs(a),np.sqrt(stats[:,:,2,3]+noise_rms_V**2)/abs(a),(b/a).real,(b/a).imag],axis=-1)
    return result[0] if single else result
