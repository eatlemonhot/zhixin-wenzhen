
import numpy as np
from model_spec import AB
from conditioned_bank import FREQ
from wave_projection import project

def window_features(self,label,ref,factors,indices,phases):
    factors=np.asarray(factors,float);ctx=np.repeat(self._wave_context(label,ref),len(factors),axis=0);event=AB.CATALOGS['B'][label]
    x=self.base.design(event,ctx,factors)
    delta=label and (label in self._delta_labels or str(self.waves.get('representation',''))=='normal_plus_delta')
    if delta:x=np.concatenate([self.base.design(AB.CATALOGS['B'][0],ctx,np.ones(len(factors))),x],axis=1)
    key=(label,np.asarray(ref).tobytes())
    if not hasattr(self,'_polynomial_latent'):self._polynomial_latent={}
    if key not in self._polynomial_latent:
        coef=self.waves['coef_'+str(label)]
        if delta:coef=np.concatenate([self.waves['coef_0'],coef],axis=0)
        if event['mode'] in ('low','high'):
            u=np.array([0.,1.,-1.,2.]);probe=1+.25*u;c=np.repeat(self._wave_context(label,ref),4,axis=0);xp=self.base.design(event,c,probe)
            if delta:xp=np.concatenate([self.base.design(AB.CATALOGS['B'][0],c,np.ones(4)),xp],axis=1)
            transform=np.linalg.solve(np.column_stack([u**j for j in range(4)]),xp)
        else:transform=x[:1]
        combined=(transform@coef).reshape(len(transform),36,3,-1)
        self._polynomial_latent[key]=(transform,combined)
        if len(self._polynomial_latent)>64:self._polynomial_latent.pop(next(iter(self._polynomial_latent)))
    transform,latent=self._polynomial_latent[key]
    u=(factors-1)/.25;poly=np.column_stack([u**j for j in range(4)]) if len(transform)==4 else np.ones((len(factors),1))
    if not np.allclose(poly@transform,x,rtol=1e-12,atol=1e-14):raise RuntimeError('Waveform bank is not the qualified degree-three polynomial')
    signature=('polynomial-v1',key,tuple(indices),tuple((np.asarray(p).dtype.str,np.asarray(p).shape,np.asarray(p).tobytes()) for p in phases))
    if signature not in self._packed_operators:
        operators=[]
        for row,i in enumerate(indices):
            channels=[]
            for ch in range(3):
                phase=np.asarray(phases[row][ch]);opkey=('polynomial-v1',key,i,ch,phase.dtype.str,phase.tobytes())
                if opkey not in self._operator_cache:self._operator_cache[opkey]=project(latent[:,i,ch],int(FREQ[i]),phase)
                channels.append(self._operator_cache[opkey])
            operators.append(channels)
        dc=np.array([[v[0] for v in row] for row in operators]);v=np.array([[v[1] for v in row] for row in operators]);q=np.array([[v[2] for v in row] for row in operators]);self._packed_operators[signature]=(dc,v,q)
        if len(self._packed_operators)>80:self._packed_operators.popitem(last=False)
    dc,v,q=self._packed_operators[signature];z=np.einsum('fl,icl->fic',poly,v,optimize=False);residual=np.maximum(0,np.einsum('fl,iclk,fk->fic',poly,q,poly,optimize=False))
    stats=np.stack([np.einsum('fl,icl->fic',poly,dc,optimize=False),z.real,z.imag,residual],axis=-1);z=stats[:,:,:,1]+1j*stats[:,:,:,2];a,b,c=z[:,:,0],z[:,:,1],z[:,:,2]
    return np.stack([(c/a).real,(c/a).imag,stats[:,:,2,0]/abs(a),np.sqrt(stats[:,:,2,3]+.00005**2)/abs(a),(b/a).real,(b/a).imag],axis=-1)
