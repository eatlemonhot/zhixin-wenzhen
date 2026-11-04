"""以正常参考为条件，对独立SPICE故障仿真响应进行插值。

    插值结果用于候选响应比较，全部目录候选参与物理对照；
    插值误差通过独立数据评估与校准。"""
from spec_highz import *
import time
from scipy.optimize import minimize_scalar

def factor_bounds(e):
    if e['mode']=='low':return (.65,.90) if e['ref'][0]=='R' else (.50,.80)
    if e['mode']=='high':return (1.10,1.35) if e['ref'][0]=='R' else (1.20,1.50)
    return (1.,1.)
class Bank:
    def __init__(self,data,dimension=3,ridge=.03):
        self.data=data;self.models={};self.parameters={};self.rule_enabled=set()
        for b in 'AB':
            normal=(data['board']==b)&(data['label']==0);refs=data['reference'][normal].reshape(-1,N*K)
            if b=='B':
                from action_policy import policy
                refs=np.array(refs,copy=True);refs.reshape(-1,N,K)[:,policy('B')['excluded']]=0.
            mean=refs.mean(0);scale=np.maximum(refs.std(0),.003);_,sing,v=np.linalg.svd((refs-mean)/scale,full_matrices=False)
            dim=min(dimension,max(0,len(refs)-3));basis=v[:dim].T;pcs=(refs-mean)/scale@basis
            pscale=np.maximum(pcs.std(0),1);self.parameters[b]=(mean,scale,basis,pscale)
            for label,e in enumerate(CATALOGS[b]):
                ids=np.where((data['board']==b)&(data['label']==label))[0]
                ctx=self.context(b,data['reference'][ids]);factor=data['factor'][ids]
                X=self.design(e,ctx,factor);target=self.relative(data['obs'][ids],data['reference'][ids]).reshape(len(ids),-1)
                lam=ridge;reg=np.eye(X.shape[1])*lam;reg[0,0]=lam*.01
                coef=np.linalg.solve(X.T@X+reg,X.T@target)
                self.models[b,label]=coef
    def context(self,b,ref):
        mean,scale,basis,pscale=self.parameters[b]
        x=np.asarray(ref);flat=x.reshape(-1,N*K)
        if b=='B' and np.all(mean.reshape(N,K)[__import__('action_policy').policy('B')['excluded']]==0):
            from action_policy import policy
            flat=np.array(flat,copy=True);flat.reshape(-1,N,K)[:,policy('B')['excluded']]=0.
        return ((flat-mean)/scale@basis)/pscale
    @staticmethod
    def relative(obs,ref):
        out=(np.asarray(obs)-ref)/(.05+abs(ref))
        for k in (0,4):
            a=obs[...,k]+1j*obs[...,k+1];b=ref[...,k]+1j*ref[...,k+1]
            denom=np.where(abs(b)>.001,b,.001+0j)
            z=(a-b)/denom;out[...,k]=z.real;out[...,k+1]=z.imag
        return out
    @staticmethod
    def absolute(relative,ref):
        out=ref+relative*(.05+abs(ref))
        for k in (0,4):
            b=ref[...,k]+1j*ref[...,k+1];denom=np.where(abs(b)>.001,b,.001+0j)
            z=b+(relative[...,k]+1j*relative[...,k+1])*denom
            out[...,k]=z.real;out[...,k+1]=z.imag
        return out
    def design(self,e,ctx,factor):
        ctx=np.atleast_2d(ctx);factor=np.broadcast_to(np.asarray(factor),len(ctx))
        if e['mode'] in ('low','high'):
            u=(factor-1)/.25
            return np.column_stack([u,u[:,None]*ctx,u*u,u*u*u])
        return np.column_stack([np.ones(len(ctx)),ctx])
    def predict(self,b,label,ref,factor):
        if label==0:return np.array(ref,copy=True)
        ctx=self.context(b,ref);x=self.design(CATALOGS[b][label],ctx,[factor])
        pred=self.absolute((x@self.models[b,label]).reshape(N,K),ref)
        if (b,label) in self.rule_enabled:
            from physical_rules import correct
            pred=correct(b,CATALOGS[b][label],ref,pred,factor)
        return pred
    def curves(self,b,ref):
        result=[]
        for k,e in enumerate(CATALOGS[b]):
            lo,hi=factor_bounds(e);grid=np.linspace(lo,hi,49) if lo!=hi else np.array([1.])
            ctx=np.repeat(self.context(b,ref),len(grid),axis=0)
            pred=np.repeat(ref[None],len(grid),axis=0) if k==0 else self.absolute((self.design(e,ctx,grid)@self.models[b,k]).reshape(len(grid),N,K),ref[None])
            if (b,k) in self.rule_enabled:
                from physical_rules import correct
                pred=np.array([correct(b,e,ref,p,f) for p,f in zip(pred,grid)])
            result.append((grid,pred))
        return result
    def save(self,path):
        arr={}
        for b,p in self.parameters.items():
            for key,value in zip(('mean','scale','basis','pscale'),p):arr[b+'_'+key]=value
        for (b,k),v in self.models.items():arr[b+'_coef_'+str(k)]=v
        for b in 'AB':arr[b+'_rule_enabled']=np.array([k for bb,k in self.rule_enabled if bb==b],np.int32)
        np.savez_compressed(path,**arr)
    @classmethod
    def load(cls,path):
        d=dict(np.load(path));obj=cls.__new__(cls);obj.models={};obj.parameters={};obj.data=None;obj.rule_enabled=set()
        for b in 'AB':
            obj.parameters[b]=tuple(d[b+'_'+k] for k in ('mean','scale','basis','pscale'))
            for k in range(26):obj.models[b,k]=d[b+'_coef_'+str(k)]
            for k in d.get(b+'_rule_enabled',[]):obj.rule_enabled.add((b,int(k)))
        return obj
