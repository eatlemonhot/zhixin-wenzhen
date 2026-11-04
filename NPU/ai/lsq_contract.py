"""Steady-periodic Fourier -> exact rectangular-window LSQ moments.

Not FPGA fixed-point emulation. Validated against explicit 8192-sample LSQ.
The actual transmitter's public contract is retained without relabeling.
"""
import os
for _key in ('OPENBLAS_NUM_THREADS','OMP_NUM_THREADS','MKL_NUM_THREADS'):os.environ[_key]='1'
import numpy as np

N=8192
FREQUENCIES=(2000,5000,10000,20000,50000,100000)
CONTRACT='pl-lsq8192-dds-mean-v1'

def capture_settings(frequency):
    ratio=next(r for r in (1,2,4,8,16,32) if (N-1)*frequency*r/25e6>=5)
    ftw=round(frequency/25e6*2**32)
    actual=ftw*25e6/2**32
    step=2*np.pi*ftw*ratio/2**32
    return dict(requested_frequency_hz=frequency,actual_frequency_hz=actual,dds_ftw=ftw,
                interval_ticks=ratio,sample_rate_hz=25e6/ratio,step=step,
                captured_cycles=(N-1)*actual*ratio/25e6)

def mean_exp(k,step):
    k=np.asarray(k)
    return np.exp(1j*k*step*(N-1)/2)*np.sinc(k*step*N/(2*np.pi))/np.sinc(k*step/(2*np.pi))

def cic(harmonics,settings):
    k=np.asarray(harmonics);r=settings['interval_ticks']
    if r==1:return np.ones(k.shape,complex)
    x=np.pi*settings['actual_frequency_hz']/25e6*k
    amp=(np.sinc(x*r/np.pi)/np.sinc(x/np.pi))**3
    return amp*np.exp(-1j*x*3*(r-1))

def frame_statistics(coefficients,frequency,phases):
    """coefficients are c[-H..H] for y(theta)=sum c[h] exp(jh theta).

    theta is DDS sine phase; returned V1 follows DDS-relative sin convention.
    All channels are in volts. Phases are actual first-input-sample DDS phase.
    """
    coef=np.asarray(coefficients,complex);phases=np.asarray(phases,float)
    half=(coef.shape[-1]-1)//2;k=np.arange(-half,half+1);s=capture_settings(frequency);step=s['step']
    filtered=coef*cic(k,s)
    h=mean_exp(np.arange(-2,3),step)
    gram=np.array([[1,h[3].real,h[3].imag],
                   [h[3].real,(1+h[4].real)/2,h[4].imag/2],
                   [h[3].imag,h[4].imag/2,(1-h[4].real)/2]])
    phase=np.exp(1j*phases[:,None]*k[None])
    weighted=phase*filtered[None]
    cross=np.stack([(weighted*mean_exp(k,step)).sum(-1),
                    (weighted*(mean_exp(k+1,step)+mean_exp(k-1,step))/2).sum(-1),
                    (weighted*(mean_exp(k+1,step)-mean_exp(k-1,step))/(2j)).sum(-1)],axis=-1).real
    beta=cross@np.linalg.inv(gram)
    square=np.convolve(filtered,filtered)
    kk=np.arange(-2*half,2*half+1)
    power=(np.exp(1j*phases[:,None]*kk[None])*square[None]*mean_exp(kk,step)).sum(-1).real
    residual=np.maximum(0,power-np.sum(beta*cross,axis=-1))
    v=(beta[:,1]-1j*beta[:,2])*1j*np.exp(-1j*phases)/cic(np.array([1]),s)[0]
    return np.column_stack([beta[:,0],v.real,v.imag,residual])

def harmonic_coefficients(time,waves,frequency,source_phase_deg=73,harmonics=24):
    end=float(time[-1]);grid=end-1/frequency+np.arange(2048)/(2048*frequency)
    y=np.column_stack([np.interp(grid,time,waves[:,j]) for j in range(3)])
    phase=2*np.pi*frequency*grid+np.deg2rad(source_phase_deg)
    k=np.arange(-harmonics,harmonics+1)
    return (np.exp(-1j*phase[:,None]*k[None]).T@y/len(y)).T

def linear_coefficients(phasors,dc=None):
    values=np.asarray(phasors,complex);out=np.zeros((3,3),complex)
    out[:,1]=0 if dc is None else dc
    out[:,2]=-.5j*values;out[:,0]=np.conj(out[:,2]);return out

def aggregate(stats,phase_indices,noise_rms_V=0.):
    picked=np.take_along_axis(stats,phase_indices[...,None],axis=2).mean(axis=2)
    z=picked[:,:,1]+1j*picked[:,:,2];a,b,c=z[:,0],z[:,1],z[:,2]
    return np.column_stack([(c/a).real,(c/a).imag,picked[:,2,0]/abs(a),
                            np.sqrt(np.maximum(0,picked[:,2,3])+noise_rms_V**2)/abs(a),(b/a).real,(b/a).imag])
