import copy
import io
import json
from pathlib import Path
import sys
import tempfile
import types
import unittest
from unittest import mock
import xml.etree.ElementTree as ET
from test_pcb_import import row,fixture,pack
sys.path.insert(0,str(Path(__file__).resolve().parents[1]/'interface'))
from pcb_import import load_bytes
from pcb_import.schematic import transform

def design_lines():
    lines=fixture()
    lines.extend([row('DOCHEAD',None,dict(docType='SYMBOL',uuid='sym')),
      row('PART','part',dict(title='R',BBOX=[-20,-10,20,10])),
      row('RECT','body',dict(partId='part',dotX1=-10,dotY1=-5,dotX2=10,dotY2=5)),
      row('PIN','pin1',dict(partId='part',x=-20,y=0,length=10,rotation=0,display=True)),
      row('ATTR','pn1',dict(parentId='pin1',key='Pin Number',value='1')),
      row('DOCHEAD',None,dict(docType='SCH_PAGE',uuid='page')),
      row('META','META',dict(title='P1')),
      row('COMPONENT','schR',dict(partId='part',x=100,y=100,rotation=90,isMirror=False)),
      row('ATTR','symbol',dict(parentId='schR',key='Symbol',value='sym')),
      row('ATTR','designator',dict(parentId='schR',key='Designator',value='R1',valueVisible=True,x=100,y=90)),
      row('WIRE','wire',{}),row('LINE','line',dict(startX=100,startY=120,endX=100,endY=140,lineGroup='wire'))])
    return lines

class SchematicTests(unittest.TestCase):
    def test_rotated_pin_matches_wire_and_pcb_net(self):
        d=load_bytes(pack(design_lines()));page=d['schematic']['pages'][0]
        self.assertEqual(len(page['components']),1);pin=page['components'][0]['pins'][0]
        self.assertAlmostEqual(pin['x'],100);self.assertAlmostEqual(pin['y'],120)
        self.assertEqual(pin['net'],'GND');self.assertEqual(page['linked_wire_segments'],1)
        self.assertEqual(page['wire_conflicts'],0);ET.fromstring(page['svg'])
    def test_symbol_graphic_and_absolute_label_are_transformed_once(self):
        page=load_bytes(pack(design_lines()))['schematic']['pages'][0]
        self.assertIn('translate(100 100) rotate(-90)',page['svg'])
        self.assertIn('<text x="100" y="90"',page['svg'])
        self.assertIn('class="sch-hit"',page['svg'])
    def test_text_is_escaped_and_cannot_become_executable_svg(self):
        lines=design_lines()+[row('TEXT','evil',dict(x=100,y=100,value='<script>alert(1)</script>'))]
        svg=load_bytes(pack(lines))['schematic']['pages'][0]['svg'];root=ET.fromstring(svg)
        self.assertFalse(any(e.tag.endswith('script') for e in root.iter()));self.assertIn('&lt;script&gt;',svg)
    def test_mirror_is_applied_before_rotation(self):
        x,y=transform(10,20,dict(x=100,y=200,isMirror=True,rotation=90))
        self.assertAlmostEqual(x,120);self.assertAlmostEqual(y,210)
    def test_deleted_symbol_graphic_not_rendered(self):
        lines=design_lines();i=next(i for i,s in enumerate(lines) if '"type":"RECT"' in s)
        lines.insert(i+1,row('RECT','body',None,ticket=2))
        self.assertNotIn('<rect x="-10"',load_bytes(pack(lines))['schematic']['pages'][0]['svg'])
    def test_device_inherited_name_expression_keeps_component_value_visible(self):
        lines=design_lines()+[row('ATTR','dev',dict(parentId='schR',key='Device',value='dev')),
            row('ATTR','value',dict(parentId='schR',key='Value',value='10K')),
            row('ATTR','name',dict(parentId='schR',key='Name',value=None,valueVisible=True,x=100,y=110)),
            row('DOCHEAD',None,dict(docType='DEVICE',uuid='dev')),row('META','META',dict(attributes={'Name':'={Value}','Value':'1K'}))]
        svg=load_bytes(pack(lines))['schematic']['pages'][0]['svg'];self.assertIn('>10K</text>',svg)

    def test_missing_schematic_is_explicit_not_fake_image(self):
        d=load_bytes(pack(fixture()));self.assertEqual(d['schematic']['pages'],[])

class WorkbenchHTTPTests(unittest.TestCase):
    def setUp(self):
        from interface import create_app,kicad
        self.app=create_app({'TESTING':True,'SECRET_KEY':'v3-offline-test'});self.client=self.app.test_client();self.client.get('/')
        self.tmp=tempfile.TemporaryDirectory();self.addCleanup(self.tmp.cleanup)
        p=mock.patch.object(kicad,'UPLOAD_FOLDER',self.tmp.name);p.start();self.addCleanup(p.stop)
        self.service=types.SimpleNamespace(root=Path(self.tmp.name)/'motor',status=lambda:dict(busy=False,ready=False,available=False,stopped=False),start=mock.Mock(side_effect=AssertionError('hardware forbidden')))
        self.app.extensions['motor_service']=self.service
        self.headers={'X-Requested-With':'XMLHttpRequest','Origin':'http://localhost'}
        r=self.client.post('/kicad/process_files',data={'layout_file':(io.BytesIO(pack(design_lines())),'test.epro2')});self.assertEqual(r.status_code,200)
        self.design=self.client.get('/workbench/design').get_json();self.pad=next(iter(self.design['pads']))
    def payload(self):return dict(layout_id=self.design['layout_id'],orientation=0,pairs=[dict(id='R1',left=self.pad,right=None)])
    def post(self,data):return self.client.post('/workbench/plan',json=data,headers=self.headers)
    def test_offline_plan_returns_board_targets_and_never_dispatches(self):
        with mock.patch('subprocess.Popen',side_effect=AssertionError('no subprocess')):
            r=self.post(self.payload());self.assertEqual(r.status_code,200,r.data)
        d=r.get_json();self.assertFalse(d['execution']['executable']);self.assertFalse(d['execution']['z_supported'])
        self.assertEqual(d['pairs'][0]['targets']['left']['net'],'GND');self.service.start.assert_not_called()
    def test_stale_design_orientation_unknown_pad_and_duplicate_ids_refused(self):
        for changes in [dict(layout_id='other'),dict(orientation=90),dict(pairs=[dict(id='R1',left='forged',right=None)]),dict(pairs=[dict(id='a',left=self.pad,right=None)]*2)]:
            p=self.payload();p.update(changes);self.assertIn(self.post(p).status_code,(400,409))
    def test_same_pad_cannot_be_used_by_both_probes(self):
        p=self.payload();p['pairs'][0]['right']=self.pad;self.assertEqual(self.post(p).status_code,400)
    def test_default_offline_blocks_every_hardware_entry(self):
        for route,payload in [('check',{}),('rebuild',{}),('circle',{}),('jog',{}),('clear-stop',{}),('pcb/move',{}),('pcb/teach',{})]:
            r=self.client.post('/motor/'+route,json=payload,headers=self.headers);self.assertEqual(r.status_code,409,route)
        self.service.start.assert_not_called()
    def test_cross_origin_plan_refused(self):
        r=self.client.post('/workbench/plan',json=self.payload(),headers=dict(self.headers,Origin='http://evil.example'));self.assertEqual(r.status_code,403)
    def test_v3_only_upload_refuses_kicad_and_ad(self):
        for name in ['x.kicad_pcb','x.PcbDoc','x.zip']:
            r=self.client.post('/kicad/process_files',data={'layout_file':(io.BytesIO(b'x'),name)});self.assertEqual(r.status_code,400)
