
from spec_highz import *
from scipy.optimize import least_squares
from functools import lru_cache

@lru_cache(maxsize=64)
def parameters(reference_bytes):
    ref=np.frombuffer(reference_bytes,np.float64).reshape(N,K)
    x=ref.reshape(2,3,6,K);hb=np.mean(x[:,:,:,4]+1j*x[:,:,:,5],axis=1)
    rs=np.array(RS)[:,None];omega=2*np.pi*np.array(FREQS)[None]
    z=rs*hb/(1-hb)
    def response(q):
        r7,r1,c6=np.array([100,1000,10e-9])*np.exp(q)
        return r7+r1/(1+1j*omega*r1*c6)
    scale=np.maximum(abs(z),100)
    def residual(q):
        v=(response(q)-z)/scale;return np.r_[v.real.ravel(),v.imag.ravel()]
    fit=least_squares(residual,np.zeros(3),bounds=(np.log([.8,.8,.7]),np.log([1.2,1.2,1.3])),max_nfev=30)
    r7,r1,c6=np.array([100,1000,10e-9])*np.exp(fit.x)
    return float(r7),float(r1),float(c6)

def correct(board,event,ref,pred,factor):
    if board!='B' or event['mode']=='normal':return np.array(pred,copy=True)
    out=np.array(pred,copy=True);rx=np.asarray(ref).reshape(2,3,6,K);px=out.reshape(2,3,6,K)
    refname=event['ref'];mode=event['mode'];w=2*np.pi*np.array(FREQS)
    hc=rx[:,:,:,0]+1j*rx[:,:,:,1]
    pc=px[:,:,:,0]+1j*px[:,:,:,1]
    if refname=='C3':
        t0=hc[:,2]/hc[:,1];inv=1/t0
        ratio=0 if mode=='open' else factor
        inv_new=inv.real+1j*inv.imag*(.0055+.9945*ratio)
        pc[:,2]=pc[:,1]/inv_new
        dc_ratio=rx[:,2,:,2]/np.maximum(rx[:,1,:,2],1e-5)
        px[:,2,:,2]=px[:,1,:,2]*dc_ratio
    elif refname in ('C6','R1'):
        r7,r1,c6=parameters(np.asarray(ref,np.float64).tobytes())
        ff=(0 if mode=='open' else factor)
        newr1=(1e9 if mode=='open' else r1*factor) if refname=='R1' else r1
        newc6=c6*ff if refname=='C6' else c6
        zin0=r7+r1/(1+1j*w*r1*c6);zin=r7+newr1/(1+1j*w*newr1*newc6)
        for ri,r in enumerate(RS):
            hb=zin/(r+zin);hb0=zin0/(r+zin0)
            for pi in range(3):
                px[ri,pi,:,4]=hb.real;px[ri,pi,:,5]=hb.imag
            if not (refname=='R1' and mode=='open'):
                q0=hb0*(zin0-r7)/zin0/r1;q=hb*(zin-r7)/zin/newr1;gain=q/q0
                pc[ri]=hc[ri]*gain[None]
                px[ri,:,:,2:4]=rx[ri,:,:,2:4]*abs(gain)[None,:,None]
    elif refname in ('R3','C1'):
        t0=hc[:,1]/hc[:,0];r0=np.mean(rx[:,0,:,2]/np.maximum(rx[:,1,:,2],1e-5),axis=1)
        for ri in range(2):
            inv=1/t0[ri];constant=r0[ri]
            tau=float(np.median((inv.imag/w)[:4]));g0=3.;a0=constant*g0
            if refname=='C1':
                f=0 if mode=='open' else factor
                rnew=np.full(6,np.inf+0j) if mode=='short' else constant+1j*w*tau*f
            elif mode=='open':rnew=np.full(6,np.inf+0j)
            elif mode=='short':rnew=np.full(6,1/g0+0j)
            else:rnew=(1+(a0-1)*factor)/g0+1j*w*tau*factor
            amp_delay=inv/(constant+1j*w*tau)
            inv_new=rnew*amp_delay
            pc[ri,1]=np.divide(pc[ri,0],inv_new,out=np.zeros(6,complex),where=np.isfinite(inv_new))
            out_t=hc[ri,2]/hc[ri,1];pc[ri,2]=pc[ri,1]*out_t
            dcgain=0 if (refname=='R3' and mode=='open') or (refname=='C1' and mode=='short') else (g0 if refname=='R3' and mode=='short' else 1/(constant if refname=='C1' else (1+(a0-1)*factor)/g0))
            px[ri,1,:,2]=px[ri,0,:,2]*dcgain
            px[ri,2,:,2]=px[ri,1,:,2]*rx[ri,2,:,2]/np.maximum(rx[ri,1,:,2],1e-5)
    px[:,:,:,0]=pc.real;px[:,:,:,1]=pc.imag
    return out
