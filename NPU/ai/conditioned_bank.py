from pathlib import Path
from collections import OrderedDict
import copy
import numpy as np
from model_spec import *
from physical_bank import Bank as ABBank
from ne5532_expert.bank_ne import Bank as NEBank
from phase_kernel import features as waveform_features
from phase_kernel import kernel,real_coefficients
from wave_projection import project

UNIFORM=np.broadcast_to(np.arange(64)[None,None,:],(36,3,64))
FREQ=np.array(AB.FREQS*6)
_BASE_CACHE={}

def cached_base(path,family,single):
    artifact=Path(path)/'physical_bank.npz';stat=artifact.stat()
    wave_path=Path(path)/'waveform_bank.npz'
    stamps=[]
    for name in ('physical_bank.npz','waveform_bank.npz','source_amplitude_context.json','legacy_physical_bank.npz','context_features.json','admittance_bank.npz','knowledge_rules.json'):
        f=Path(path)/name
        if f.exists():s=f.stat();stamps.append((name,s.st_mtime_ns,s.st_size))
    key=(str(artifact.resolve()),family,single,tuple(stamps))
    if key not in _BASE_CACHE:
        if (Path(path)/'source_amplitude_context.json').is_file():
            from hybrid_source_bank import Bank as SourceBank
            base=SourceBank.load(artifact)
        else:base=(NEBank if single else ABBank).load(artifact)
        if family=='NE' and (Path(path)/'knowledge_rules.json').is_file():
            from knowledge_rules import KnowledgeBank
            import json
            base=KnowledgeBank(base,json.loads((Path(path)/'knowledge_rules.json').read_text())['labels'])
        waves={} if single or family!='B' else dict(np.load(wave_path))
        _BASE_CACHE[key]=(base,waves)
        if len(_BASE_CACHE)>6:_BASE_CACHE.pop(next(iter(_BASE_CACHE)))
    return _BASE_CACHE[key]

class ConditionedBank:
    def __new__(cls,path,family,reference_phases=None,reference_amplitudes=None):
        if (Path(path)/'hybrid_selection.json').is_file():
            from hybrid_conditioned import HybridConditionedBank
            return HybridConditionedBank(path,family,reference_phases,reference_amplitudes)
        return super().__new__(cls)
    def __init__(self,path,family,reference_phases=None,reference_amplitudes=None):
        self.family=family;self.ne=family=='NE' or (Path(path)/'single_family.json').is_file();self.base,self.waves=cached_base(path,family,self.ne)
        if (Path(path)/'source_amplitude_context.json').is_file():
            self.base=copy.copy(self.base)
            amps=np.asarray(reference_amplitudes)
            if amps.shape!=(36,) or not np.isfinite(amps).all() or np.any(amps<=0):raise ValueError('Calibrated healthy VA amplitude metadata required by source-conditioned B model')
            self.base.reference_amplitudes=amps
        self.phases={};self.version=0;self.reference_phases=reference_phases;self._reference_cache={}
        if reference_phases is not None:
            p=np.asarray(reference_phases)
            if p.shape!=(36,3,256) or p.dtype.kind not in 'iuf' or not np.isfinite(p).all() or np.any((p<0)|(p>=64)):
                raise ValueError('Invalid normal-reference first-phase metadata; expected 36x3x256 values in [0,64).')
        self._operator_cache={};self._latent_complex={}
        self._active_wave_columns={}
        self._packed_operators=OrderedDict()
        self._base_curve_cache={}
        self._phase_delta_cache=OrderedDict()
        self._delta_labels=set(map(int,self.waves.get('normal_plus_delta_labels',[])))
        self._legacy_wave_labels=set(map(int,self.waves.get('legacy_wave_labels',[])))

    def _wave_context(self,label,ref):
        return self.base.legacy.context('B',ref) if label in self._legacy_wave_labels else self.base.context('B',ref)

    def set_phase(self,index,phases,frames=None):
        value=np.asarray(phases)
        if type(index) is not int or not 0<=index<36:raise ValueError('Invalid action index')
        if value.ndim!=2 or value.shape[0]!=3 or value.shape[1] not in (16,256) or value.dtype.kind not in 'iuf' or not np.isfinite(value).all() or np.any((value<0)|(value>=64)):
            raise ValueError('Invalid first-phase metadata')
        if frames is not None and value.shape[1]!=frames:raise ValueError('First-phase frame count differs from requested capture')
        self.phases[int(index)]=value;self.version+=1

    def _wave_coefs(self,label,ref,factors):
        ctx=np.repeat(self._wave_context(label,ref),len(factors),axis=0)
        x=self.base.design(AB.CATALOGS['B'][label],ctx,np.asarray(factors))
        coef=x@self.waves['coef_'+str(label)]
        if label and (label in self._delta_labels or str(self.waves.get('representation',''))=='normal_plus_delta'):
            coef+=self.base.design(AB.CATALOGS['B'][0],ctx,np.ones(len(factors)))@self.waves['coef_0']
        return coef.reshape(len(factors),36,3,-1)

    def _window_features(self,label,ref,factors,indices,phases):
        from native_ps import wave_enabled,wave_predict
        native_wave=wave_enabled()
        coefficients=self.waves['coef_'+str(label)]
        ctx=np.repeat(self._wave_context(label,ref),len(factors),axis=0)
        x=self.base.design(AB.CATALOGS['B'][label],ctx,np.asarray(factors))
        delta_model=label and (label in self._delta_labels or str(self.waves.get('representation',''))=='normal_plus_delta')
        if delta_model:
            x=np.concatenate([self.base.design(AB.CATALOGS['B'][0],ctx,np.ones(len(factors))),x],axis=1)
        if label not in self._latent_complex:
            if delta_model:coefficients=np.concatenate([self.waves['coef_0'],coefficients],axis=0)
            active=np.flatnonzero(np.any(coefficients!=0,axis=1))
            self._active_wave_columns[label]=active
            coefficients=coefficients[active]
            self._latent_complex[label]=coefficients.reshape(len(coefficients),36,3,-1)
        x=x[:,self._active_wave_columns[label]]
        signature=(label,tuple(indices),tuple((np.asarray(p).dtype.str,np.asarray(p).shape,np.asarray(p).tobytes()) for p in phases))
        if signature not in self._packed_operators:
            operators=[]
            for row,i in enumerate(indices):
                channels=[]
                for ch in range(3):
                    phase=np.asarray(phases[row][ch]);key=(label,i,ch,phase.dtype.str,phase.tobytes())
                    if key not in self._operator_cache:
                        if native_wave and ch<2:
                            from wave_projection import project_phasor_only
                            self._operator_cache[key]=project_phasor_only(self._latent_complex[label][:,i,ch],int(FREQ[i]),phase)
                        else:self._operator_cache[key]=project(self._latent_complex[label][:,i,ch],int(FREQ[i]),phase)
                    channels.append(self._operator_cache[key])
                operators.append(channels)
            dc=np.array([[v[0] for v in row] for row in operators]);v=np.array([[v[1] for v in row] for row in operators]);q=np.array([[v[2] for v in row] for row in operators])
            self._packed_operators[signature]=(dc,v,q)
            if len(self._packed_operators)>80:self._packed_operators.popitem(last=False)
        dc,v,q=self._packed_operators[signature]
        if native_wave:return wave_predict(x,dc,v,q)
        z=np.einsum('fl,icl->fic',x,v,optimize=False)
        residual=np.maximum(0,np.einsum('fl,iclk,fk->fic',x,q,x,optimize=False))
        stats=np.stack([np.einsum('fl,icl->fic',x,dc,optimize=False),z.real,z.imag,residual],axis=-1)
        z=stats[:,:,:,1]+1j*stats[:,:,:,2];a,b,c=z[:,:,0],z[:,:,1],z[:,:,2]
        return np.stack([(c/a).real,(c/a).imag,stats[:,:,2,0]/abs(a),np.sqrt(stats[:,:,2,3]+.00005**2)/abs(a),(b/a).real,(b/a).imag],axis=-1)

    def _balanced_reference(self,ref):
        if not self.waves or self.reference_phases is None:return ref
        key=np.asarray(ref).tobytes()
        if key not in self._reference_cache:
            balanced=np.array(ref,copy=True)
            for _ in range(2):
                actual=self._window_features(0,balanced,[1.],list(range(36)),self.reference_phases)[0]
                periodic=self._window_features(0,balanced,[1.],list(range(36)),UNIFORM)[0]
                bias=actual-periodic
                balanced=np.asarray(ref)-bias
            self._reference_cache[key]=balanced
        return self._reference_cache[key]

    def _phase_correct(self,label,ref,factors,pred):
        if not self.waves or not self.phases:return pred
        indices=sorted(self.phases);phased=[self.phases[i] for i in indices]
        if len(factors)>1 or np.array_equal(np.asarray(factors),[1.]):
            signature=(label,np.asarray(ref).tobytes(),np.asarray(factors).tobytes())
            keys=[];missing=[]
            for j,i in enumerate(indices):
                p=np.asarray(phased[j]);key=(signature,i,p.dtype.str,p.shape,p.tobytes());keys.append(key)
                if key not in self._phase_delta_cache:missing.append((j,i,key))
            if missing:
                selected=[i for j,i,key in missing];phases=[phased[j] for j,i,key in missing]
                actual=self._window_features(label,ref,factors,selected,phases)
                mean=self._window_features(label,ref,factors,selected,UNIFORM[selected])
                for k,(j,i,key) in enumerate(missing):self._phase_delta_cache[key]=(actual-mean)[:,k]
            out=np.array(pred,copy=True)
            for i,key in zip(indices,keys):out[:,i]+=self._phase_delta_cache[key]
            while len(self._phase_delta_cache)>2048:self._phase_delta_cache.popitem(last=False)
            out[:,:,3]=np.maximum(0,out[:,:,3]);return out
        actual=self._window_features(label,ref,factors,indices,phased)
        mean=self._window_features(label,ref,factors,indices,UNIFORM[indices])
        out=np.array(pred,copy=True);out[:,indices]+=actual-mean;out[:,:,3]=np.maximum(0,out[:,:,3]);return out

    def predict(self,board,label,ref,factor):
        balanced=self._balanced_reference(ref)
        pred=self.base.predict(label,balanced,factor) if self.ne else self.base.predict(self.family,label,balanced,factor)
        return self._phase_correct(label,balanced,[factor],pred[None])[0]

    def curves(self,board,ref,labels=None):
        balanced=self._balanced_reference(ref)
        key=np.asarray(balanced).tobytes()
        if key not in self._base_curve_cache:
            self._base_curve_cache={key:self.base.curves(balanced) if self.ne else self.base.curves(self.family,balanced)}
        rows=self._base_curve_cache[key]
        selected=range(len(rows)) if labels is None else labels
        return [(rows[label][0],self._phase_correct(label,balanced,rows[label][0],rows[label][1])) for label in selected]
