import numpy as np
from model_spec import AB
from physical_bank import Bank as Parent

class Bank(Parent):
    def __init__(self,data,dimension=5,ridge=.1):
        self.models={};self.parameters={};self.rule_enabled=set();self.reference_amplitudes=None
        normal=data['label']==0;refs=data['reference'][normal];amps=data['amplitudes'][normal]
        features=self.embedding(refs,amps);mean=features.mean(0);scale=np.maximum(features.std(0),.003)
        _,_,v=np.linalg.svd((features-mean)/scale,full_matrices=False);dim=min(dimension,len(refs)-1)
        basis=v[:dim].T;pcs=(features-mean)/scale@basis;pscale=np.maximum(pcs.std(0),1)
        self.parameters['B']=(mean,scale,basis,pscale)
        for label,event in enumerate(AB.CATALOGS['B']):
            ids=np.flatnonzero(data['label']==label);ctx=self.context_with_amplitude(data['reference'][ids],data['amplitudes'][ids]);x=self.design(event,ctx,data['factor'][ids])
            target=self.relative(data['obs'][ids],data['reference'][ids]).reshape(len(ids),-1);reg=np.eye(x.shape[1])*ridge;reg[0,0]*=.01
            self.models['B',label]=np.linalg.solve(x.T@x+reg,x.T@target)
    @staticmethod
    def embedding(ref,amplitudes):
        ref=np.asarray(ref).reshape(-1,216);amps=np.asarray(amplitudes).reshape(-1,36)
        if len(amps)!=len(ref) or not np.isfinite(amps).all() or np.any(amps<=0):raise ValueError('Calibrated healthy VA amplitudes missing or invalid')
        return np.column_stack([ref,amps/.1])
    def context_with_amplitude(self,ref,amplitudes):
        mean,scale,basis,pscale=self.parameters['B'];return ((self.embedding(ref,amplitudes)-mean)/scale@basis)/pscale
    def context(self,board,ref):
        if self.reference_amplitudes is None:raise ValueError('This physical bank requires calibrated healthy VA amplitude metadata')
        return self.context_with_amplitude(ref,self.reference_amplitudes)
    def save(self,path):
        arr={}
        for key,value in zip(('mean','scale','basis','pscale'),self.parameters['B']):arr[key]=value
        for (_,label),coef in self.models.items():arr['coef_'+str(label)]=coef
        arr['rule_enabled']=np.array([k for b,k in self.rule_enabled],np.int32);np.savez_compressed(path,**arr)
    @classmethod
    def load(cls,path):
        d=dict(np.load(path));o=cls.__new__(cls);o.reference_amplitudes=None;o.models={('B',i):d['coef_'+str(i)] for i in range(26)};o.parameters={'B':tuple(d[k] for k in ('mean','scale','basis','pscale'))};o.rule_enabled={('B',int(i)) for i in d['rule_enabled']};return o
