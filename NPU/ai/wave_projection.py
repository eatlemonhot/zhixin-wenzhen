
from functools import lru_cache
import numpy as np
from lsq_contract import capture_settings,mean_exp,cic

@lru_cache(maxsize=24)
def frequency(h,frequency):
    k=np.arange(-h,h+1);s=capture_settings(frequency);step=s['step'];u=mean_exp(np.arange(-2,3),step)
    gram=np.array([[1,u[3].real,u[3].imag],[u[3].real,(1+u[4].real)/2,u[4].imag/2],[u[3].imag,u[4].imag/2,(1-u[4].real)/2]])
    t=np.stack([mean_exp(k,step),(mean_exp(k+1,step)+mean_exp(k-1,step))/2,(mean_exp(k+1,step)-mean_exp(k-1,step))/(2j)])
    projected=np.linalg.solve(gram,t);residual=mean_exp(k[:,None]+k[None],step)-t.T@projected
    return k,cic(k,s),projected,residual,cic(np.array([1]),s)[0]

@lru_cache(maxsize=768)
def phase_moments(h,phase_tuple):
    indices=np.asarray(phase_tuple,dtype=float)
    if np.all((indices>=0)&(indices<64)&(indices==np.floor(indices))):
        # Current simulation metadata already uses an exact 64-point grid.
        # Its empirical Fourier moments are the IFFT of the phase histogram;
        # no per-frame complex exponentials or new phase rounding are needed.
        hist=np.bincount(indices.astype(np.intp),minlength=64)
        moments=np.fft.ifft(hist)*(64./len(indices))
        return moments[np.arange(-2*h,2*h+1)%64]
    p=np.asarray(phase_tuple)*2*np.pi/64
    return np.exp(1j*p[:,None]*np.arange(-2*h,2*h+1)[None]).mean(0)

def project(coef,f,phases):
    h=(coef.shape[-1]-1)//2;k,gain,beta,residual,gain1=frequency(h,int(f));mom=phase_moments(h,tuple(map(float,phases)))
    filtered=coef*gain[None]
    dc=(filtered@(beta[0]*mom[k+2*h])).real
    v=filtered@((beta[1]-1j*beta[2])*1j/gain1*mom[k-1+2*h])
    q=(filtered@(residual*mom[k[:,None]+k[None]+2*h])@filtered.T).real
    return dc,v,(q+q.T)/2

def project_phasor_only(coef,f,phases):
    h=(coef.shape[-1]-1)//2;k,gain,beta,residual,gain1=frequency(h,int(f));mom=phase_moments(h,tuple(map(float,phases)))
    filtered=coef*gain[None]
    v=filtered@((beta[1]-1j*beta[2])*1j/gain1*mom[k-1+2*h])
    return np.zeros(len(coef)),v,np.zeros((len(coef),len(coef)))
