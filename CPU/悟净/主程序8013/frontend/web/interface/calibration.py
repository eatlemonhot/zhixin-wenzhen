import copy
import hashlib
import json
import math
from pathlib import Path
import threading
import uuid
from .pcb_alignment import effective
from .pcb_coordinates import PROBE_AXES, PCB_FRAME_VERSION


def fit_translation(probe, samples, old_effective, tolerance_mm=.1):
    if probe not in PROBE_AXES or len(samples)!=5 or len({s['pad_id'] for s in samples})!=5:
        raise ValueError('需要5个不同焊盘的中心对准记录。')
    translations=[]
    xsign=1 if probe=='left' else -1
    for row in samples:
        point,positions=row['point'],row['positions_mm'];axes=PROBE_AXES[probe]
        item=dict(x=positions[axes['x']]-xsign*point['x'],y=positions[axes['y']]+point['y'])
        if any(not math.isfinite(v) for v in item.values()):raise ValueError('标定记录包含非有限数值。')
        translations.append(item)
    new={a:sum(p[a] for p in translations)/5 for a in ('x','y')}
    residuals=[dict(pad_id=row['pad_id'],dx_mm=t['x']-new['x'],dy_mm=t['y']-new['y'],
                    error_mm=math.hypot(t['x']-new['x'],t['y']-new['y'])) for row,t in zip(samples,translations)]
    maximum=max(r['error_mm'] for r in residuals)
    return dict(model='translation_xy',old=old_effective,new=new,
                delta={a:new[a]-old_effective[a] for a in new},residuals=residuals,
                max_error_mm=maximum,rms_error_mm=math.sqrt(sum(r['error_mm']**2 for r in residuals)/5),
                tolerance_mm=tolerance_mm,acceptable=maximum<=tolerance_mm,
                samples=copy.deepcopy(samples))


class CalibrationStore:
    def __init__(self,path):
        self.path=Path(path);self.lock=threading.RLock()

    def _file(self,owner):
        return self.path/(hashlib.sha256(owner.encode()).hexdigest()+'.json')

    def read(self,owner):
        p=self._file(owner)
        with self.lock:return json.loads(p.read_text()) if p.exists() else dict(state='idle')

    def write(self,owner,value):
        with self.lock:
            self.path.mkdir(parents=True,exist_ok=True);p=self._file(owner);t=p.with_suffix('.tmp')
            t.write_text(json.dumps(value,ensure_ascii=False,allow_nan=False)+'\n');t.replace(p)
            return copy.deepcopy(value)

    def start(self,owner,probe,points,profile,frame,layout_id,orientation,tolerance):
        with self.lock:
            if self.read(owner)['state'] not in ('idle','saved','cancelled'):
                raise ValueError('请先完成或取消当前五点标定。')
            if probe not in PROBE_AXES or len(points)!=5 or len({p['pad_id'] for p in points})!=5:
                raise ValueError('请选择5个不同焊盘。')
            if effective(profile,probe) is None:raise ValueError('请先完成该针的一点中心标定，作为五点初值。')
            if type(tolerance) not in (float,int) or not math.isfinite(tolerance) or not .02<=tolerance<=.5:
                raise ValueError('允许点间残差应在0.02至0.5mm范围内。')
            return self.write(owner,dict(id=uuid.uuid4().hex,state='ready',pcb_frame_version=PCB_FRAME_VERSION,probe=probe,points=points,
                layout_id=layout_id,orientation=orientation,base_revision=profile['revision'],
                base_profile=copy.deepcopy(profile),reference=frame,index=0,samples={},tolerance_mm=tolerance))

    def owned(self,owner,identifier):
        v=self.read(owner)
        if v.get('id')!=identifier or v['state'] in ('idle','cancelled','saved'):
            raise ValueError('标定会话已失效，请重新开始。')
        return v

    def bind_job(self,owner,identifier,job_id):
        with self.lock:
            value=self.read(owner)
            if value.get('id')==identifier:
                value['pending_job_id']=job_id
                self.write(owner,value)

    def valid(self,value,layout_id,orientation,revision,frame):
        if value.get('pcb_frame_version') != PCB_FRAME_VERSION:
            raise ValueError('PCB的Y方向换算已修正，请重新开始五点标定；旧补偿未覆盖。')
        if (value['layout_id']!=layout_id or value['orientation']!=orientation or value['base_revision']!=revision
                or value['reference']['reference_id']!=frame['reference_id']):
            raise ValueError('工程、方向、补偿或机械参考已改变，本轮未覆盖原值，请重新开始标定。')

    def choose(self,owner,identifier,index):
        with self.lock:
            v=self.owned(owner,identifier)
            if type(index) is not int or not 0<=index<5:raise ValueError('标定点序号应为0至4。')
            if v['state'] in ('moving','recording'):raise ValueError('当前标定任务尚未结束。')
            v.update(index=index,state='ready');return self.write(owner,v)

    def phase(self,owner,identifier,state,expected=None):
        with self.lock:
            v=self.owned(owner,identifier)
            if expected and v['state'] not in expected:raise ValueError('标定步骤已变化，请刷新。')
            v['state']=state;return self.write(owner,v)

    def record(self,owner,identifier,result):
        with self.lock:
            v=self.owned(owner,identifier)
            if v['state']!='recording':raise ValueError('标定已中止，本点未保存。')
            if result['anchor'].get('reference_id')!=v['reference']['reference_id']:
                raise ValueError('记录时机械参考已变化，本轮未保存。')
            point=v['points'][v['index']]
            v['samples'][str(v['index'])]=dict(pad_id=point['pad_id'],point={a:point[a] for a in ('x','y')},
                                              positions_mm=result['positions_mm'])
            if len(v['samples'])==5:
                v['result']=fit_translation(v['probe'],[v['samples'][str(i)] for i in range(5)],
                                            effective(v['base_profile'],v['probe']),v['tolerance_mm'])
                v['state']='complete'
            else:
                v['index']=next(i for i in range(5) if str(i) not in v['samples']);v['state']='ready'
            return self.write(owner,v)
