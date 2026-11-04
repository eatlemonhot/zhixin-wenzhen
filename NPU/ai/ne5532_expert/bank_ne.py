from .spec_ne import *
def factor_bounds(event):
    if event['mode']=='low':return (.65,.90) if event['ref'].startswith('R') else (.50,.80)
    if event['mode']=='high':return (1.10,1.35) if event['ref'].startswith('R') else (1.20,1.50)
    return (1.,1.)
class Bank:
    def __init__(self,data,dimension=6,ridge=.001):
        self.models={};self.rules=set();refs=np.array(data['reference'][data['label']==0],copy=True);refs[:,:,~AVAILABLE]=0;flat=refs.reshape(len(refs),-1);mean=flat.mean(0);scale=np.maximum(flat.std(0),.003);_,_,v=np.linalg.svd((flat-mean)/scale,full_matrices=False);dim=min(dimension,max(0,len(refs)-3));basis=v[:dim].T;pcs=(flat-mean)/scale@basis;pscale=np.maximum(pcs.std(0),1);self.parameters=(mean,scale,basis,pscale)
        for label,event in enumerate(CATALOG):
            ids=np.flatnonzero(data['label']==label);ctx=self.context(data['reference'][ids]);X=self.design(event,ctx,data['factor'][ids]);target=self.relative(data['obs'][ids],data['reference'][ids]).reshape(len(ids),-1);reg=np.eye(X.shape[1])*ridge;reg[0,0]*=.01;self.models[label]=np.linalg.solve(X.T@X+reg,X.T@target)
    def context(self,ref):
        mean,scale,basis,pscale=self.parameters;x=np.array(ref,copy=True);x[...,~AVAILABLE]=0
        return ((x.reshape(-1,N*K)-mean)/scale@basis)/pscale
    @staticmethod
    def design(event,ctx,factor):
        ctx=np.atleast_2d(ctx);factor=np.broadcast_to(np.asarray(factor),len(ctx))
        if event['mode'] in ('low','high'):
            u=(factor-1)/.25;return np.column_stack([u,u[:,None]*ctx,u*u,u*u*u])
        return np.column_stack([np.ones(len(ctx)),ctx])
    @staticmethod
    def relative(obs,ref):
        out=np.zeros_like(obs)
        for k in (0,4):
            a=obs[...,k]+1j*obs[...,k+1];b=ref[...,k]+1j*ref[...,k+1];z=(a-b)/np.where(abs(b)>.001,b,.001+0j);out[...,k]=z.real;out[...,k+1]=z.imag
        return out
    @staticmethod
    def absolute(relative,ref):
        out=np.array(ref+np.zeros_like(relative),copy=True)
        for k in (0,4):
            b=ref[...,k]+1j*ref[...,k+1];d=np.where(abs(b)>.001,b,.001+0j);z=b+(relative[...,k]+1j*relative[...,k+1])*d;out[...,k]=z.real;out[...,k+1]=z.imag
        return out
    def predict(self,label,ref,factor):
        if label==0:return np.array(ref,copy=True)
        x=self.design(CATALOG[label],self.context(ref),[factor]);pred=self.absolute((x@self.models[label]).reshape(N,K),ref)
        return self.correct(label,ref,pred,factor) if label in self.rules else pred
    def correct(self,label,ref,pred,factor):
        event=CATALOG[label];out=np.array(pred,copy=True);r=ref.reshape(2,3,6,K);p=out.reshape(2,3,6,K);normal=r[:,:,:,0]+1j*r[:,:,:,1];actual=p[:,:,:,0]+1j*p[:,:,:,1];inverse=normal[:,1]/normal[:,2]
        if event['ref']=='C3':
            f=0. if event['mode']=='open' else factor;new_inverse=inverse.real+1j*inverse.imag*(.0055+.9945*f)
        elif event['ref']=='R8':
            f=1e9/22 if event['mode']=='open' else .1/22;new_inverse=1+(inverse-1)*f
        else:return out
        actual[:,2]=actual[:,1]/new_inverse;p[:,:,:,0]=actual.real;p[:,:,:,1]=actual.imag;return out
    def curves(self,ref,points=49):
        ctx=self.context(ref);result=[]
        for label,event in enumerate(CATALOG):
            lo,hi=factor_bounds(event);grid=np.linspace(lo,hi,points) if lo!=hi else np.array([1.]);pred=np.repeat(ref[None],len(grid),axis=0) if label==0 else self.absolute((self.design(event,np.repeat(ctx,len(grid),axis=0),grid)@self.models[label]).reshape(len(grid),N,K),ref[None])
            if label in self.rules:pred=np.array([self.correct(label,ref,p,f) for p,f in zip(pred,grid)])
            result.append((grid,pred))
        return result
    def save(self,path):
        out={k:v for k,v in zip(('mean','scale','basis','pscale'),self.parameters)};out.update({'coef_'+str(k):v for k,v in self.models.items()});out['rules']=np.array(sorted(self.rules),np.int32);np.savez_compressed(path,**out)
    @classmethod
    def load(cls,path):
        d=dict(np.load(path));obj=cls.__new__(cls);obj.parameters=tuple(d[k] for k in ('mean','scale','basis','pscale'));obj.models={k:d['coef_'+str(k)] for k in range(26)};obj.rules=set(map(int,d.get('rules',[])));return obj
