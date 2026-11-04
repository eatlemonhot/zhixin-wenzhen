from functools import lru_cache
import copy
import math
import numpy as np
from .common import ROOT,need,FlowError,load_module,digest
from .physics_forward import PreparedAction
from .physics_batch import PreparedBatch

RC=load_module('_integrated_rc_forward',ROOT/'teammate_pl/software/wujing/candidates/rc_network_cpu_v1/rc_network.py')
PROFILE=dict(profile_id='SYNTHETIC_HIGHZ_100_10K_V1',source_peak_V=.1,source_R_ohm=50.,
             wire_C_F=50e-12,input_R_ohm=1000.,buffer_R_ohm=1e7,buffer_C_F=5e-12,
             adc_V_per_count=.0001,adc_noise_counts=.35,calibration_id='SYNTHETIC_CAL_ONLY',
             hardware_qualified=False)
FREQUENCIES=(2000,10000,50000)
MODES=('low','high','open','short')
MAX_PARTS=64
MAX_CIRCUIT_NODES=59
MAX_ACTIONS=192
MAX_PREDICTIONS=100000
MAX_MATRIX_WORK=64000000
MAX_ESTIMATED_MEMORY=64*1024*1024

def parts_from_job(job):
    need(job['power']['mode']=='unpowered','该入口要求unpowered模式及无源R/C输入。')
    parts=[]
    for part in job['circuit']['components']:
        if part.get('assembly')=='dnp':continue
        if part['type'] in ('connector','other') and not part.get('nominal'):continue
        need(part['type'] in ('resistor','capacitor'),'模型器件类型校验：'+part['ref']+'：'+part['type'])
        pins=part['pins'];need(len(pins)==2,'R/C必须有两个确定端点：'+part['ref'])
        a,b=list(pins.values());need(a!=b,'元件两端同网：'+part['ref'])
        value=part['nominal']['value'];need(type(value) in (int,float) and math.isfinite(value) and value>0,'标称值无效')
        parts.append(dict(id=part['ref'],kind='R' if part['type']=='resistor' else 'C',a=a,b=b,value=value))
    need(1<=len(parts)<=MAX_PARTS,'纯RC实验模块支持1～64个R/C，仍需满足节点和计算预算。')
    identifiers=[p['id'] for p in parts]
    nodes={p[k] for p in parts for k in ('a','b')}
    need(all(isinstance(v,str) and v and not v.startswith('$') for v in identifiers),'元件身份缺失或使用内部保留前缀')
    need(len(set(identifiers))==len(identifiers),'元件身份重复')
    need(all(isinstance(v,str) and v and v not in ('$VS','$VA','$HA','$HB','$HC') for v in nodes),'网络身份缺失或与仪器内部网络重名')
    need(len(nodes-{job['circuit']['ground_net']})<=MAX_CIRCUIT_NODES,'非地网络过多，须为仪器模型保留5个节点')
    return parts

def fault_parts(parts,event=None,factor=1.):
    result=copy.deepcopy(parts)
    if not event or event['mode']=='normal':return result
    selected=next(p for p in result if p['id']==event['ref'])
    if event['mode'] in ('low','high'):selected['value']*=factor
    elif event['mode']=='open':result.remove(selected)
    elif event['mode']=='short':selected.update(kind='R',value=.1)
    else:raise FlowError('不支持该故障模式')
    return result

def model_for(parts,ground,action,profile=PROFILE):
    nodes=sorted(({p[k] for p in parts for k in ('a','b')}|{action['excitation_net'],action['measurement_net']})-{ground})
    items=copy.deepcopy(parts)
    def resistor(name,a,b,value):items.append(dict(id=name,kind='R',a=a,b=b,value=value))
    def capacitor(name,a,b,value):items.append(dict(id=name,kind='C',a=a,b=b,value=value))
    for index,node in enumerate(nodes):resistor('$gmin'+str(index),node,ground,1e12)
    resistor('$source','$VS','$VA',profile['source_R_ohm'])
    resistor('$Rs','$VA',action['excitation_net'],action['rs_ohm'])
    for name,node in (('A','$VA'),('B',action['excitation_net']),('C',action['measurement_net'])):
        capacitor('$wire'+name,node,ground,profile['wire_C_F'])
        resistor('$protect'+name,node,'$H'+name,profile['input_R_ohm'])
        resistor('$bias'+name,'$H'+name,ground,profile['buffer_R_ohm'])
        capacitor('$buffer'+name,'$H'+name,ground,profile['buffer_C_F'])
    return dict(schema='FDW_RC_NETWORK_V1',model_id='derived-normal-netlist',nodes=nodes+['$VS','$VA','$HA','$HB','$HC'],ground=ground,
                reference_node='$VS',boundary_voltages_relative={'$VS':[1.,0.]},elements=items)

def solve(parts,ground,action,profile=PROFILE):
    result=RC.solve_frequency(model_for(parts,ground,action,profile),action['frequency_hz'])
    values={k:complex(*v)*profile['source_peak_V'] for k,v in result['transfer_real_imag'].items()}
    a,b,c=[values['$H'+k] for k in ('A','B','C')]
    return np.array([(c/a).real,(c/a).imag,0.,0.,(b/a).real,(b/a).imag]),dict(A=a,B=b,C=c)

def make_actions(job):
    points=job['access']['measurement_points'];by_net={}
    for point in points:by_net.setdefault(point['net'],point)
    permitted={p['net'] for p in job['access']['excitation_policy']['candidate_points']}
    actions=[]
    for source in sorted(permitted):
        for sense in sorted(by_net):
            if source==sense:continue
            for rs in (100,10000):
                for frequency in FREQUENCIES:
                    actions.append(dict(action_id='a'+str(len(actions)),excitation_net=source,measurement_net=sense,
                                        excitation=by_net[source],measurement=by_net[sense],rs_ohm=rs,frequency_hz=frequency,
                                        requested_peak_V=min(.1,job['test_constraints']['max_dut_input_peak_V']),frames=16))
    need(actions,'当前端点配置没有可执行的两针激励/采样组合。')
    need(len(actions)<=MAX_ACTIONS,'候选动作超过192项资源预算。')
    return actions

def hypotheses(parts):
    rows=[dict(candidate_id='normal',ref=None,mode='normal',factor=1.)]
    for part in parts:
        for mode in MODES:
            for factor in ((.6,.75,.9) if mode=='low' else (1.1,1.25,1.4) if mode=='high' else (1.,)):
                rows.append(dict(candidate_id=part['id']+':'+mode,ref=part['id'],mode=mode,factor=factor))
    return rows

class PhysicsBank:
    def __init__(self,job):
        self.job=job;self.ground=job['circuit']['ground_net'];self.parts=parts_from_job(job);self.actions=make_actions(job)
        self.hypotheses=hypotheses(self.parts);self.class_ids=list(dict.fromkeys(h['candidate_id'] for h in self.hypotheses))
        count=len(self.hypotheses)*len(self.actions)
        nodes=({p[k] for p in self.parts for k in ('a','b')}|
               {a[k] for a in self.actions for k in ('excitation_net','measurement_net')})-{self.ground}
        need(len(nodes)<=MAX_CIRCUIT_NODES,'测量网络与仪器模型合并后超过节点预算')
        need(count<=MAX_PREDICTIONS and count*(len(nodes)+4)**2<=MAX_MATRIX_WORK,
             '纯RC候选预测超过计算预算，请减少候选测点或分区分析。')
        memory_estimate=len(self.actions)*(len(nodes)+4)**2*16*32
        need(memory_estimate<=MAX_ESTIMATED_MEMORY,'纯RC批量方程超过内存预算，请减少候选测点或分区分析。')
        self.prepared=[PreparedAction(model_for(self.parts,self.ground,a),a['frequency_hz'],PROFILE['source_peak_V'],RC) for a in self.actions]
        batch=PreparedBatch(self.prepared)
        self.predictions=np.array([batch.evaluate(h,h['factor']) for h in self.hypotheses])
        self.batch_cache={tuple(range(len(self.actions))):batch}
        self.cache={};self.forward_calls=count
        self.resource_usage=dict(parts=len(self.parts),circuit_nodes=len(nodes),actions=len(self.actions),
                                 hypotheses=len(self.hypotheses),predictions=count,
                                 estimated_workspace_bytes=memory_estimate,
                                 algorithm='balanced_node_solve_plus_rank_one_single_fault',
                                 hardware_qualified=False,integrated_api_dispatch=False)

    def _predict(self,candidate,action_index):
        key=(action_index,candidate.get('ref'),candidate['mode'],float(candidate.get('factor',1.)))
        if key not in self.cache:
            if len(self.cache)>=8192:self.cache.clear()
            self.cache[key]=self.prepared[action_index].evaluate(candidate,key[-1])
            self.forward_calls+=1
        return self.cache[key].copy()

    def fitting(self,observations):
        indices=list(observations);obs=np.array([observations[i] for i in indices])[:,[0,1,4,5]]
        batch_key=tuple(indices)
        if batch_key not in self.batch_cache:
            if len(self.batch_cache)>=2:self.batch_cache.clear()
            self.batch_cache[batch_key]=PreparedBatch([self.prepared[i] for i in indices])
        batch=self.batch_cache[batch_key]
        pred=self.predictions[:,indices,:][:,:,[0,1,4,5]]
        sigma=.0007+.0012*np.maximum(abs(pred),abs(obs))
        error=np.mean(((pred-obs)/sigma)**2,axis=(1,2))
        best={}
        for index,hypothesis in enumerate(self.hypotheses):
            cid=hypothesis['candidate_id']
            if cid not in best or error[index]<best[cid]['mse']:
                best[cid]=dict(hypothesis,variant_index=index,mse=float(error[index]))
        from scipy.optimize import minimize_scalar
        for cid,item in best.items():
            if item['mode'] not in ('low','high'):continue
            bounds=(.5,.94) if item['mode']=='low' else (1.06,1.6)
            def objective(factor):
                prediction=batch.evaluate(item,float(factor))[:,[0,1,4,5]]
                self.forward_calls+=len(indices)
                s=.0007+.0012*np.maximum(abs(prediction),abs(obs));return float(np.mean(((prediction-obs)/s)**2))
            fitted=minimize_scalar(objective,bounds=bounds,method='bounded',options={'xatol':1e-4,'maxiter':24})
            item.update(factor=float(fitted.x),mse=float(fitted.fun))
        return best

    def predict_candidate(self,candidate,action_index):
        return self._predict(candidate,action_index)

    def select(self,candidates,used):
        remaining=[i for i in range(len(self.actions)) if i not in used]
        if not remaining:return None
        if not candidates:return remaining[0]
        predictions=np.array([[self.predict_candidate(c,i)[[0,1,4,5]] for i in remaining] for c in candidates])
        if len(candidates)>1:scores=np.var(predictions,axis=0).sum(axis=1)
        else:scores=np.linalg.norm(predictions[0],axis=1)
        scores=scores/(1+.002*np.array([abs(self.actions[i]['excitation']['position_mm']['x']-self.actions[i]['measurement']['position_mm']['x']) for i in remaining]))
        return remaining[int(np.argmax(scores))]
