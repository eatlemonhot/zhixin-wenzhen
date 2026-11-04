"""根据已知网表、正常参考与校准特征执行诊断分析。"""
import itertools,threading,collections
from .core import *
from .controller import OptimizedController
LOCK=threading.RLock()
CACHE=collections.OrderedDict()
def normalize(job):
 if not isinstance(job,dict) or not isinstance(job.get('power'),dict) or not isinstance(job.get('circuit',{}),dict):raise ValueError('任务/电源/电路结构错误')
 power=job.get('power',{});ground=job.get('circuit',{}).get('ground_net',job.get('ground_net','0'))
 if power.get('mode')!='unpowered' or power.get('rails') not in ('disconnected',[],{}):raise ValueError('断电模型要求电源线断开、供电轨浮置。')
 if job.get('fixed_common_ground',{}).get('connected') is not True and power.get('fixed_ground') is not True:raise ValueError('需要确认独立固定共地。')
 components=job.get('circuit',{}).get('components',job.get('components'))
 if not isinstance(components,list) or not 4<=len(components)<=32:raise ValueError('断电模型只验证4～5个R/C；连接器可忽略。')
 parts=[]
 for p in components:
  if isinstance(p,(list,tuple)):
   if len(p)!=5:raise ValueError('元件格式错误')
   parts.append(tuple(p));continue
  if p.get('assembly')=='dnp':continue
  kind=p.get('type')
  if kind in ('connector','other') and not p.get('nominal'):continue
  if kind not in ('resistor','capacitor'):raise ValueError('模型输入器件须为电阻或电容：'+str(p.get('ref'))+'。')
  pins=list(p.get('pins',{}).values())
  if len(pins)!=2:raise ValueError('R/C需有两个端点')
  parts.append((p['ref'],'R' if kind=='resistor' else 'C',*pins,p.get('nominal',{}).get('value')))
 if not 4<=len(parts)<=5 or len(set(p[0] for p in parts))!=len(parts):raise ValueError('需4～5个唯一位号的R/C')
 if any(p[1] not in ('R','C') or isinstance(p[4],bool) or not isinstance(p[4],(int,float)) or not np.isfinite(p[4]) or p[4]<=0 or p[2]==p[3] for p in parts):raise ValueError('元件种类/参数/端点无效')
 drive=job.get('excitation_net')
 if drive is None:
  ports=job.get('access',{}).get('excitation_ports',[])
  if len(ports)==1:drive=ports[0]['positive_net']
  else:drive='P'
 nodes={v for p in parts for v in p[2:4]}
 if ground not in nodes or drive not in nodes or ground==drive or len(nodes)!=4:raise ValueError('需确定GND、激励网络及两个内部观测网络')
 others=sorted(nodes-{ground,drive});matches=[]
 for internal in itertools.permutations(others):
  mapping={ground:'0',drive:'P',internal[0]:'N1',internal[1]:'OUT'}
  for name,template in TEMPLATES.items():
   if len(template)!=len(parts):continue
   selected=[];available=list(parts);valid=True
   for ref,kind,a,b,value in template:
    options=[p for p in available if p[1]==kind and {mapping[p[2]],mapping[p[3]]}=={a,b} and abs(np.log(p[4]/value))<1e-6]
    if not options:valid=False;break
    best=min(options,key=lambda p:abs(np.log(p[4]/value)));available.remove(best);selected.append((ref,kind,a,b,best[4],best[0]))
   if valid:matches.append((name,mapping,selected))
 if len(matches)!=1:raise ValueError('网表未唯一匹配已验收无源模板；不猜板型。')
 name,mapping,selected=matches[0]
 return dict(template=name,parts=[p[:5] for p in selected],ref_mapping={p[0]:p[5] for p in selected},net_mapping={v:k for k,v in mapping.items()})
def prepare(job,reference):
 normalized=normalize(job);ref=np.asarray(reference,float)
 if ref.shape!=(36,6) or not np.isfinite(ref).all() or abs(ref[:,2:4]).max()>.001:raise ValueError('需要36×6的配套线性无源正常参考，DC/非线性残差超域。')
 key=hashlib.sha256(json.dumps(normalized,sort_keys=True).encode()+np.ascontiguousarray(ref).tobytes()).hexdigest()
 with LOCK:
  if key in CACHE:
   c=CACHE.pop(key);CACHE[key]=c
  else:
   c=OptimizedController(normalized['parts'],ref,Ranker(ROOT/'model'))
   if not np.isfinite(c.reference_mse) or c.reference_mse>9:raise ValueError('正常参考无法通过物理拟合；请检查负载、标定和网表。')
   if len(CACHE)>=4:CACHE.popitem(last=False)
   CACHE[key]=c
 return c,normalized
def action(index,frames,norm):
 r,p,f=ACTIONS[index]
 return dict(action_id=index,rs_ohm=int(r),frequency_hz=int(f),measurement_net=norm['net_mapping'][p],excitation_net=norm['net_mapping']['P'],frames=frames,internal_vb_only=p=='P',adc_probe_lowered=p!='P')
def run_saved(job,reference,observations,confirmations):
 """Return a pending exact action when calibrated data has not arrived yet."""
 for rows in (observations,confirmations):
  if not isinstance(rows,dict) or len(rows)>36 or any(not isinstance(k,str) or not k.isdecimal() or not 0<=int(k)<36 for k in rows):raise ValueError('观测索引必须是0～35，且数量有界。')
 if any(not isinstance(v,list) or len(v)>72 for v in confirmations.values()):raise ValueError('独立确认须为有界的新观测列表。')
 with LOCK:
  c,norm=prepare(job,reference);events=[];confirm_count={}
  class Missing(Exception):pass
  def receive(index,frames):
   requested=action(index,frames,norm);events.append(requested)
   if frames==16:record=observations.get(str(index))
   else:
    k=str(index);pos=confirm_count.get(k,0);confirm_count[k]=pos+1;records=confirmations.get(k,[]);record=records[pos] if pos<len(records) else None
   if record is None:raise Missing()
   if not isinstance(record,dict) or record.get('quality_passed') is not True or record.get('calibrated') is not True or record.get('frames')!=frames:raise ValueError('模型只接受质量通过、帧数匹配的校准特征，不直接接受ADC counts。')
   if record.get('action_id')!=index:raise ValueError('测量action_id错配')
   x=np.asarray(record.get('features'),float)
   if x.shape!=(6,) or not np.isfinite(x).all():raise ValueError('F6形状或有限值错误')
   return x
  try:result=c.diagnose(receive)
  except Missing:result=dict(status='needs_measurement',next_measurement=events[-1],hardware_executed=False)
  result.update(template=norm['template'],candidate_names=[('normal' if i==0 else norm['ref_mapping'][c.names[i].split(':')[0]]+':'+c.names[i].split(':')[1]) for i in result.get('candidates',[])],requests=events,source='saved_calibrated_features',hardware_executed=False,NPU_executed=False)
  return result
