from pathlib import Path
from datetime import timedelta
from array import array
import json,time,os
import numpy as np
ROOT=Path(__file__).resolve().parent
DEVICE_POOL={}
class Model:
    def __init__(self,path,backend='cpu',compiled=None):
        self.path=Path(path);self.backend=backend;self.norm=dict(np.load(self.path/'normalization.npz'));self.w=dict(np.load(self.path/'cpu_weights.npz'))
        self.compiled=Path(compiled) if compiled else None;self.calls=[];self.session=None;self.device=None
        self._service_identity=None
    def reference(self,z):
        single=np.asarray(z).shape[0]==1;y=np.array(z[0] if single else z,np.float32)
        for j in range(3):
            y=y@self.w['W'+str(j)].T+self.w['b'+str(j)]
            if j<2:y=np.maximum(y,np.float32(0))
        return y[None] if single else y
    def logits(self,features):
        private_socket=os.environ.get('PROBE_NPU_SOCKET')
        if self.backend=='guarded' and private_socket:
            tick=time.perf_counter()
            from inference_service import request,expected_identity
            if self._service_identity is None:self._service_identity=expected_identity(self.path)
            vector=np.asarray(features,np.float32)
            if vector.shape!=(470,) or not np.isfinite(vector).all():raise ValueError('Expected 470 finite features')
            response=request(private_socket,dict(family=self.path.name,model_identity=self._service_identity,features=vector.tolist()))
            y=np.asarray(response['logits'],np.float32);record=response['record']
            if y.shape!=(26,) or not np.isfinite(y).all() or not record.get('NPU_executed'):raise RuntimeError('Invalid persistent inference response')
            record['wall_ms']=1000*(time.perf_counter()-tick);self.calls.append(record);return y
        z=((np.asarray(features,np.float32)-self.norm['mean'])*self.norm['inv_std']).astype(np.float32)[None]
        if not np.isfinite(z).all():raise ValueError('invalid normalized neural input')
        tic=time.perf_counter();record=dict(NPU_executed=False,CPU_scores_used=True,backend=self.backend)
        if self.backend=='cpu':y=self.reference(z)
        elif self.backend in ('guarded','npu'):
            from icraft import xir,xrt,host_backend,zg330backend
            if self.session is None:
                if self.compiled is None:raise RuntimeError('compiled model not configured')
                graph=json.loads(self.compiled.read_text());ops=[o for o in graph['ops'] if o['_type_key'] not in ('icraft::xir::Input','icraft::xir::Output')]
                if not ops or not all(o['_type_key']=='icraft::xir::HardOp' and o.get('compile_target')=='@zhuget(330)' for o in ops):raise RuntimeError('NPU arithmetic placement not verified')
                url='axi://zg330aiu?npu=0x40000000&dma=0x80000000'
                if url not in DEVICE_POOL:DEVICE_POOL[url]=xrt.Device.Open(url)
                self.device=DEVICE_POOL[url]
                self.net=xir.Network.CreateFromJsonFile(str(self.compiled));self.net.loadParamsFromFile(str(self.compiled.with_suffix('.raw')))
                self.session=xrt.Session.Create([zg330backend.ZG330Backend,host_backend.HostBackend],self.net.view(0),[self.device,xrt.HostDevice.Default()]);self.session.apply()
            output=self.session.forward([xrt.Tensor(np.ascontiguousarray(z),self.net.inputs()[0].tensorType())])[0]
            if not output.waitForReady(timedelta(seconds=5)):raise RuntimeError('NPU output readiness timeout')
            size=len(self.w['b2']);buf=array('f',[0.])*size;output.read(buf,0,size*4);raw=np.asarray(buf,np.float32)[None]
            if not np.isfinite(raw).all():raise RuntimeError('NPU produced nonfinite output')
            y=raw
            record.update(NPU_executed=True,CPU_scores_used=False,device_version=dict(self.device.version()),output_waited=True)
            if self.backend=='guarded':
                ref=self.reference(z);close=bool(np.allclose(raw,ref,rtol=1e-4,atol=1e-4));order=bool(np.array_equal(np.argsort(-raw[0],kind='stable'),np.argsort(-ref[0],kind='stable')))
                y=raw if close and order else ref
                record.update(CPU_scores_used=not(close and order),raw_max_abs_error=float(abs(raw-ref).max()),guard_rtol=1e-4,guard_atol=1e-4)
        else:raise ValueError('推理后端错误')
        record['wall_ms']=1000*(time.perf_counter()-tic);self.calls.append(record);return y[0]
    def probabilities(self,features):
        y=self.logits(features);p=np.exp(y-y.max());return p/p.sum()
    def evidence(self):
        npu=sum(c['NPU_executed'] for c in self.calls)
        fallback=sum(c['NPU_executed'] and c['CPU_scores_used'] for c in self.calls)
        return dict(backend=self.backend,calls=self.calls,actual_NPU_calls=npu,CPU_guard_used=sum(c['CPU_scores_used'] for c in self.calls),CPU_fallback_calls=fallback,CPU_fallback_rate=fallback/max(1,npu))
