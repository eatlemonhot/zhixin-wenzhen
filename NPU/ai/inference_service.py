
import os
for key in ('OPENBLAS_NUM_THREADS','OMP_NUM_THREADS','MKL_NUM_THREADS'):os.environ[key]='1'
from pathlib import Path
import argparse, hashlib, json, socket, struct, sys, time
import numpy as np

LIMIT=65536
def identity(path):
    path=Path(path)
    return {name:hashlib.sha256((path/name).read_bytes()).hexdigest()
            for name in ('ranker_npu.onnx','normalization.npz','cpu_weights.npz')}

def expected_identity(path):
    path=Path(path);manifest=path.parent.parent/'FROZEN_RUNTIME_SHA256.json'
    if not manifest.is_file():return identity(path)
    frozen=json.loads(manifest.read_text(encoding='utf-8'));result={}
    for name in ('ranker_npu.onnx','normalization.npz','cpu_weights.npz'):
        value=frozen.get('models/'+path.name+'/'+name)
        if not isinstance(value,str) or len(value)!=64 or any(c not in '0123456789abcdef' for c in value):
            raise RuntimeError('Missing valid expected model digest')
        result[name]=value
    return result

def exact(sock,count):
    chunks=[]
    while count:
        data=sock.recv(count)
        if not data:raise RuntimeError('Inference socket closed before full message')
        chunks.append(data);count-=len(data)
    return b''.join(chunks)

def receive(sock):
    length=struct.unpack('!I',exact(sock,4))[0]
    if not 0<length<=LIMIT:raise ValueError('Invalid inference message length')
    return json.loads(exact(sock,length).decode('utf-8'))

def send(sock,obj):
    payload=json.dumps(obj,allow_nan=False,separators=(',',':')).encode('utf-8')
    if len(payload)>LIMIT:raise ValueError('Inference payload too large')
    sock.sendall(struct.pack('!I',len(payload))+payload)

def request(path,obj,timeout=30.):
    with socket.socket(socket.AF_UNIX,socket.SOCK_STREAM) as sock:
        sock.settimeout(timeout);sock.connect(str(path));send(sock,obj);response=receive(sock)
    if not response.get('ok'):raise RuntimeError('Persistent inference failed: '+response.get('error','unknown'))
    return response

def serve(app,path,stop_after=0):
    app=Path(app).resolve();path=Path(path).resolve()
    if path.exists() or path.is_symlink():raise RuntimeError('Socket path already exists')
    if path.parent.stat().st_mode & 0o077:raise RuntimeError('Socket directory must be owner-only (0700)')
    sys.path.insert(0,str(app/'ai'))
    os.environ.pop('PROBE_NPU_SOCKET',None)
    from network_runtime import Model
    models={};bindings={};stamps={};count=0;pid=os.getpid()
    with socket.socket(socket.AF_UNIX,socket.SOCK_STREAM) as server:
        server.bind(str(path));os.chmod(path,0o600);server.listen(4)
        try:
            while not stop_after or count<stop_after:
                conn,_=server.accept()
                with conn:
                    conn.settimeout(30.)
                    try:
                        body=receive(conn);family=body.get('family')
                        if family not in ('A','B','NE'):raise ValueError('Unsupported family')
                        model_path=app/'ai/models'/family
                        metadata=tuple((n,(model_path/n).stat().st_size,(model_path/n).stat().st_mtime_ns,(model_path/n).stat().st_ctime_ns) for n in ('ranker_npu.onnx','normalization.npz','cpu_weights.npz'))
                        cached=family in bindings and stamps.get(family)==metadata
                        current=bindings[family] if cached else identity(model_path)
                        if body.get('model_identity')!=current:raise ValueError('Client/server model identity mismatch')
                        vector=np.asarray(body.get('features'),np.float32)
                        if vector.shape!=(470,) or not np.isfinite(vector).all():raise ValueError('Expected 470 finite features')
                        if family in bindings and bindings[family]!=current:raise RuntimeError('Loaded model changed; restart private worker')
                        cold=family not in models
                        if cold:
                            compiled=list((app/'compiled'/family/'generated').glob('*.json'))
                            if len(compiled)!=1:raise RuntimeError('Missing unique compiled model')
                            models[family]=Model(model_path,'guarded',compiled[0]);bindings[family]=current
                        stamps[family]=metadata
                        tick=time.perf_counter();logits=models[family].logits(vector);count+=1
                        record=dict(models[family].calls[-1],backend='guarded_persistent',server_pid=pid,
                                    request_sequence=count,cold_model=cold,persistent_session=True,identity_hash_reused=cached,
                                    server_total_ms=1000*(time.perf_counter()-tick))
                        models[family].calls.clear()
                        send(conn,dict(ok=True,logits=logits.tolist(),record=record))
                    except Exception as exc:
                        send(conn,dict(ok=False,error=str(exc),error_type=type(exc).__name__))
        finally:
            path.unlink(missing_ok=True)

if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--app',type=Path,required=True);p.add_argument('--socket',type=Path,required=True);p.add_argument('--stop-after',type=int,default=0);a=p.parse_args()
    serve(a.app,a.socket,a.stop_after)
