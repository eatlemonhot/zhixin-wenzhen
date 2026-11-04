from pathlib import Path
import os,sys,ctypes,json,hashlib,time,platform
import numpy as np
ROOT=Path(__file__).resolve().parents[1]/'native_ops';_lib=None;_binding=None
_stats=dict(wave_calls=0,fit_calls=0,adjust_calls=0,wall_ms=0.)
D=ctypes.POINTER(ctypes.c_double);U=ctypes.POINTER(ctypes.c_uint8);I=ctypes.POINTER(ctypes.c_int32)
def mode():
    value=os.environ.get('PROBE_PS_NATIVE','0')
    if value not in ('0','wave','fit','both'):raise ValueError('PROBE_PS_NATIVE must be 0/wave/fit/both')
    return value
def wave_enabled():return mode() in ('wave','both')
def fit_enabled():return mode() in ('fit','both')
def _load():
    global _lib,_binding
    if _lib is None:
        arch='windows' if sys.platform=='win32' else platform.machine()
        manifest=json.loads((ROOT/('build_manifest_'+arch+'.json')).read_text());file=ROOT/manifest['library']
        if manifest['ABI']!=1 or hashlib.sha256((ROOT/'ps_diagnostic.cpp').read_bytes()).hexdigest()!=manifest['source_sha256'] or hashlib.sha256(file.read_bytes()).hexdigest()!=manifest['library_sha256']:raise RuntimeError('Native PS artifact provenance mismatch; rebuild for this source/platform')
        _lib=ctypes.CDLL(str(file));_lib.psdiag_abi.restype=ctypes.c_int
        if _lib.psdiag_abi()!=1:raise RuntimeError('Native PS ABI mismatch')
        _lib.ps_wave_predict.argtypes=[ctypes.c_int,ctypes.c_int,ctypes.c_int,D,D,D,D,ctypes.c_double,D]
        _lib.ps_adjust.argtypes=[ctypes.c_int,ctypes.c_int,ctypes.c_int,D,D,D,U,D]
        _lib.ps_fit_batch.argtypes=[ctypes.c_int,ctypes.c_int,ctypes.c_int,ctypes.c_int,I,D,D,D,D,U,U,D,D,I,D]
        _binding=manifest
    return _lib
def _ptr(a,t=D):return a.ctypes.data_as(t)
def _double(a):return np.ascontiguousarray(a,dtype=np.float64)
def _check(result):
    if result:raise ValueError('Native PS kernel rejected input, status={}'.format(result))
def _record(kind,t):_stats[kind+'_calls']+=1;_stats['wall_ms']+=1000*(time.perf_counter()-t)
def statistics():return dict(_stats)
def evidence(before):
    now=statistics();return dict(mode=mode(),calls={k:now[k]-before[k] for k in now},ABI=1 if _binding else None,library_sha256=_binding['library_sha256'] if _binding else None,source_sha256=_binding['source_sha256'] if _binding else None)
def wave_predict(x,dc,v,q):
    t=time.perf_counter();lib=_load();x=_double(x);dc=_double(dc);v=np.ascontiguousarray(v,np.complex128);q=_double(q)
    if x.ndim!=2 or dc.ndim!=3:raise ValueError('Wave kernel shape')
    F,L=x.shape;N=dc.shape[0]
    if dc.shape!=(N,3,L) or v.shape!=dc.shape or q.shape!=(N,3,L,L):raise ValueError('Wave kernel dimensions differ')
    out=np.empty((F,N,6),np.float64);_check(lib.ps_wave_predict(F,N,L,_ptr(x),_ptr(dc),_ptr(v.view(np.float64)),_ptr(q),.00005,_ptr(out)));_record('wave',t);return out
def adjust(pred,obs,mask,scale,is_B):
    t=time.perf_counter();lib=_load();single=np.asarray(pred).ndim==2;p=_double(np.asarray(pred)[None] if single else pred);obs=_double(obs);scale=_double(scale);mask=np.ascontiguousarray(mask,np.uint8)
    if p.ndim!=3 or p.shape[2]!=6 or obs.shape!=p.shape[1:] or scale.shape!=obs.shape or mask.shape!=(p.shape[1],):raise ValueError('Adjustment shape mismatch')
    out=np.empty_like(p);_check(lib.ps_adjust(p.shape[0],p.shape[1],int(is_B),_ptr(p),_ptr(obs),_ptr(scale),_ptr(mask,U),_ptr(out)));_record('adjust',t);return out[0] if single else out
def fit_batch(curves,obs,mask,scale,noise,cm,is_B):
    t=time.perf_counter();lib=_load();counts=[len(row[0]) for row in curves];offsets=np.ascontiguousarray(np.r_[0,np.cumsum(counts)],np.int32)
    pred=_double(np.concatenate([row[1] for row in curves],axis=0));obs=_double(obs);scale=_double(scale);noise=_double(noise);mask=np.ascontiguousarray(mask,np.uint8);cm=np.ascontiguousarray(cm,np.uint8)
    C=len(counts);R,N,K=pred.shape
    if K!=6 or obs.shape!=(N,6) or scale.shape!=(C,N,6) or noise.shape!=obs.shape or mask.shape!=(N,) or cm.shape!=(6,):raise ValueError('Fit kernel shape mismatch')
    scores=np.empty(R);deviations=np.empty(R);index=np.empty(C,np.int32);best=np.empty((C,N,6))
    _check(lib.ps_fit_batch(C,R,N,int(is_B),_ptr(offsets,I),_ptr(pred),_ptr(obs),_ptr(scale),_ptr(noise),_ptr(mask,U),_ptr(cm,U),_ptr(scores),_ptr(deviations),_ptr(index,I),_ptr(best)))
    _record('fit',t);return dict(scores=scores,deviations=deviations,index=index,best=best,offsets=offsets)

def fit_engine(engine,obs,mask):
    from scipy.optimize import minimize_scalar
    data=fit_batch(engine.curves,obs,mask,engine.class_scale,engine.noise,engine.cm,engine.family=='B');rows=[]
    for label,(grid,pred) in enumerate(engine.curves):
        j=int(data['index'][label]);k=int(data['offsets'][label])+j;factor=float(grid[j]);best=data['best'][label];mse=float(data['scores'][k]);deviance=float(data['deviations'][k])
        if len(grid)>1 and mse<4:
            lo=grid[max(0,j-1)];hi=grid[min(len(grid)-1,j+1)]
            def objective(f):
                p=engine.adjust(engine.bank.predict(engine.board,label,engine.ref,f),obs,mask,engine.class_scale[label]);return float(np.mean((((p[mask]-obs[mask])/engine.class_scale[label,mask])[:,engine.cm])**2))
            refined=minimize_scalar(objective,bounds=(lo,hi),method='bounded',options={'xatol':1e-5})
            if refined.fun<mse:
                factor=float(refined.x);best=engine.adjust(engine.bank.predict(engine.board,label,engine.ref,factor),obs,mask,engine.class_scale[label]);mse=float(np.mean((((best[mask]-obs[mask])/engine.class_scale[label,mask])[:,engine.cm])**2));deviance=float(np.sum((((best[mask]-obs[mask])/engine.noise[mask])[:,engine.cm])**2))
        rows.append(dict(label=label,factor=factor,fit_MSE=mse,deviance=deviance,prediction=best))
    return sorted(rows,key=lambda row:row['deviance'])
