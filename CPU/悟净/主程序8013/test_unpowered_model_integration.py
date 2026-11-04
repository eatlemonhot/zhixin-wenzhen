import sys,types,unittest,tempfile,importlib.util,copy
from pathlib import Path
ROOT=Path(__file__).resolve().parent;sys.path.insert(0,str(ROOT))
from probe_system.unpowered_ai.core import *
from probe_system.unpowered_ai.service import normalize,prepare,run_saved
from probe_system.unpowered_ai.controller import OptimizedController
ROOT=Path(__file__).resolve().parent
class ModelTests(unittest.TestCase):
 def job(self,name='rc_ladder'):return dict(power=dict(mode='unpowered',rails='disconnected',fixed_ground=True),ground_net='0',excitation_net='P',components=list(TEMPLATES[name]))
 def test_all_template_matching(self):
  for name in TEMPLATES:self.assertEqual(normalize(self.job(name))['template'],name)
 def test_bom_net_renaming(self):
  j=self.job();nodes={'0':'GND','P':'IN','N1':'MID','OUT':'TP3'};parts=[]
  for i,p in enumerate(j['components']):parts.append(dict(ref='X'+str(i),type='resistor' if p[1]=='R' else 'capacitor',pins={'1':nodes[p[2]],'2':nodes[p[3]]},nominal=dict(value=p[4])))
  j.update(components=list(reversed(parts)),ground_net='GND',excitation_net='IN');r=normalize(j);self.assertEqual(r['net_mapping']['N1'],'MID');self.assertEqual(r['ref_mapping']['R1'],'X0')
 def test_powered_rejected(self):
  j=self.job();j['power']['mode']='powered'
  with self.assertRaises(ValueError):normalize(j)
 def test_rail_clamped_rejected(self):
  j=self.job();j['power']['rails']='clamped'
  with self.assertRaises(ValueError):normalize(j)
 def test_ground_required(self):
  j=self.job();j['power']['fixed_ground']=False
  with self.assertRaises(ValueError):normalize(j)
 def test_active_rejected(self):
  j=self.job();j['components'].append(dict(type='opamp',ref='U1'))
  with self.assertRaises(ValueError):normalize(j)
 def test_unknown_topology_rejected(self):
  j=self.job();j['components'][0]=('R1','R','P','OUT',1000)
  with self.assertRaises(ValueError):normalize(j)
 def test_negative_value_rejected(self):
  j=self.job();p=j['components'][0];j['components'][0]=(*p[:4],-1)
  with self.assertRaises(ValueError):normalize(j)
 def test_pending_action(self):
  j=self.job();r=run_saved(j,solve(j['components']),{},{});self.assertEqual(r['status'],'needs_measurement');self.assertIn(r['next_measurement']['rs_ohm'],[100,10000])
 def test_changed_nominal_domain_rejected(self):
  j=self.job();p=j['components'][0];j['components'][0]=(*p[:4],p[4]*1.07)
  with self.assertRaises(ValueError):normalize(j)
 def test_unknown_observation_index_rejected(self):
  j=self.job()
  with self.assertRaises(ValueError):run_saved(j,solve(j['components']),{'36':{}},{})
 def test_raw_record_rejected(self):
  j=self.job();ref=solve(j['components']);r=run_saved(j,ref,{},{});i=r['next_measurement']['action_id']
  with self.assertRaises(ValueError):run_saved(j,ref,{str(i):dict(action_id=i,frames=16,quality_passed=True,calibrated=False,features=[0]*6)},{})
 def test_nonfinite_reference_rejected(self):
  with self.assertRaises(ValueError):prepare(self.job(),np.full((36,6),np.nan))
 def test_out_of_domain_reference_rejected(self):
  with self.assertRaises(ValueError):prepare(self.job(),np.full((36,6),10.))
 def test_saved_calibrated_loop(self):
  j=self.job();ref=solve(j['components']);raw=solve(j['components'],1,.85);obs={};conf={}
  for _ in range(45):
   r=run_saved(j,ref,obs,conf)
   if r['status']!='needs_measurement':break
   a=r['next_measurement'];i=a['action_id'];record=dict(action_id=i,frames=a['frames'],calibrated=True,quality_passed=True,features=raw[i].tolist())
   if a['frames']==16:obs[str(i)]=record
   else:conf.setdefault(str(i),[]).append(record)
  self.assertEqual(r['status'],'confirmed');self.assertEqual(r['candidate_names'],['R1:low'])
 def test_cancel_hook(self):
  j=self.job();c,_=prepare(j,solve(j['components']))
  def cancelled():raise RuntimeError('cancelled')
  with self.assertRaises(RuntimeError):c.diagnose(lambda i,n:None,cancel=cancelled)
class WebTests(unittest.TestCase):
 @classmethod
 def setUpClass(cls):
  from flask import Flask
  folder=ROOT/'frontend/web/interface';pkg=types.ModuleType('isolated_offweb');pkg.__path__=[str(folder)];sys.modules[pkg.__name__]=pkg
  dummy=types.ModuleType('isolated_offweb.kicad');dummy.same_origin_upload=lambda:True;sys.modules[dummy.__name__]=dummy
  spec=importlib.util.spec_from_file_location('isolated_offweb.unpowered_model_web',folder/'unpowered_model_web.py');module=importlib.util.module_from_spec(spec);sys.modules[spec.name]=module;spec.loader.exec_module(module)
  cls.app=Flask(__name__);cls.app.config.update(TESTING=True,SECRET_KEY='offline-test-key');module.register(cls.app)
 def setUp(self):
  self.client=self.app.test_client()
  with self.client.session_transaction() as s:s['user_id']='test-owner'
 def post(self,path,value):return self.client.post('/diagnosis/unpowered/model/'+path,json=value,headers={'X-Requested-With':'XMLHttpRequest'})
 def test_info_domain(self):
  r=self.client.get('/diagnosis/unpowered/model/info');self.assertEqual(r.status_code,200);self.assertFalse(r.json['hardware_fault_diagnosis_available']);self.assertFalse(r.json['active_AB_available'])
 def test_auth(self):
  r=self.app.test_client().get('/diagnosis/unpowered/model/info');self.assertEqual(r.status_code,403)
 def test_lab(self):
  r=self.client.get('/diagnosis/unpowered/model/lab');self.assertEqual(r.status_code,200);self.assertIn('needs_measurement',r.get_data(as_text=True))
if __name__=='__main__':unittest.main()
