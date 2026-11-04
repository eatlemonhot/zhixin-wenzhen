import copy
import io
import json
from pathlib import Path
import sys
import unittest
import zipfile

sys.path.insert(0,str(Path(__file__).resolve().parents[1]/'interface'))
from pcb_import import load_bytes,ImportError
from pcb_import.easyeda_pro import read_documents,rows
from pcb_import.geometry import arc,paths


def row(kind,uid,data,ticket=1):
    head=dict(type=kind,ticket=ticket)
    if uid is not None:head['id']=uid
    return json.dumps(head,separators=(',',':'))+'||'+(json.dumps(data,separators=(',',':')) if data is not None else '')+'|'

def fixture(display='mm',angle=0,bottom=False):
    pad=dict(centerX=50,centerY=20,padAngle=0,layerId=1,num='1',defaultPad=dict(padType='RECT',width=40,height=20,radius=0),hole=None,plated=True,specialPad=[])
    return [row('DOCHEAD',None,dict(docType='FOOTPRINT',uuid='fp')),
            row('CANVAS','CANVAS',dict(originX=0,originY=0,unit=display)),row('PAD','p',pad),
            row('DOCHEAD',None,dict(docType='PCB',uuid='pcb')),
            row('CANVAS','CANVAS',dict(originX=100,originY=300,unit=display)),
            row('LAYER','["LAYER",11]',dict(layerType='OUTLINE')),
            row('POLY','edge',dict(layerId=11,path=['R',0,0,1000,800,0])),
            row('NET','["NET","GND"]',{}),
            row('COMPONENT','c',dict(layerId=2 if bottom else 1,x=500,y=-300,angle=angle)),
            row('ATTR','af',dict(parentId='c',key='Footprint',value='fp')),
            row('ATTR','ad',dict(parentId='c',key='Designator',value='R1')),
            row('PAD_NET','["PAD_NET","c","1","p"]',dict(padNet='GND'))]

def pack(lines,extra=None):
    stream=io.BytesIO()
    with zipfile.ZipFile(stream,'w',zipfile.ZIP_DEFLATED) as z:
        z.writestr('project2.json','{}');z.writestr('example.epru','\n'.join(lines))
        for k,v in (extra or {}).items():z.writestr(k,v)
    return stream.getvalue()

def only(board):return next(iter(board['pads'].values()))

class ProTests(unittest.TestCase):
    def test_display_mm_does_not_scale_geometry_or_move_origin(self):
        a=load_bytes(pack(fixture('mm')));b=load_bytes(pack(fixture('mil')))
        self.assertAlmostEqual(a['dimensions']['width'],25.4)
        self.assertAlmostEqual(a['dimensions']['height'],20.32)
        self.assertEqual(a['pads'],b['pads'])
        self.assertAlmostEqual(only(a)['footprint_x'],550*.0254)
        self.assertAlmostEqual(only(a)['footprint_y'],280*.0254)
    def test_all_quarter_rotations_have_independent_expected_centres(self):
        for angle,dx,dy in ((0,50,20),(90,-20,50),(180,-50,-20),(270,20,-50)):
            with self.subTest(angle=angle):
                pad=only(load_bytes(pack(fixture(angle=angle))))
                self.assertAlmostEqual(pad['footprint_x'],(500+dx)*.0254)
                self.assertAlmostEqual(pad['footprint_y'],(300-dy)*.0254)
    def test_bottom_mirrors_y_before_rotation_and_stays_unselectable(self):
        pad=only(load_bytes(pack(fixture(angle=90,bottom=True))))
        self.assertAlmostEqual(pad['footprint_x'],520*.0254)
        self.assertAlmostEqual(pad['footprint_y'],250*.0254)
        self.assertFalse(pad['is_allowed']);self.assertEqual(pad['side'],'bottom')
    def test_larger_ticket_wins_independent_of_record_order(self):
        lines=fixture();lines.append(row('COMPONENT','c',dict(layerId=1,x=600,y=-300,angle=0),ticket=5))
        lines.append(row('COMPONENT','c',dict(layerId=1,x=800,y=-300,angle=0),ticket=2))
        self.assertAlmostEqual(only(load_bytes(pack(lines)))['footprint_x'],650*.0254)
    def test_tombstones_remove_deleted_pads_and_keep_deleted_net_assignment_out(self):
        lines=fixture();lines.insert(3,row('PAD','deleted',dict(centerX=0),ticket=2));lines.insert(4,row('PAD','deleted',None,ticket=3))
        result=load_bytes(pack(lines));self.assertEqual(len(result['pads']),1)
    def test_equal_ticket_conflict_is_rejected(self):
        lines=fixture()+[row('COMPONENT','c',dict(layerId=1,x=999,y=-300,angle=0))]
        with self.assertRaisesRegex(ImportError,'冲突'):load_bytes(pack(lines))
    def test_nonmetal_hole_remains_visible_but_not_selectable(self):
        lines=fixture()
        p=json.loads(lines[2].split('||')[1][:-1]);p['hole']=dict(width=10,height=10);p['plated']=False
        lines[2]=row('PAD','p',p)
        self.assertFalse(only(load_bytes(pack(lines)))['is_allowed'])
    def test_pad_stack_overrides_disable_selection(self):
        lines=fixture();p=json.loads(lines[2].split('||')[1][:-1]);p['specialPad']=[{'startLayer':1}];lines[2]=row('PAD','p',p)
        self.assertFalse(only(load_bytes(pack(lines)))['is_allowed'])
    def test_missing_footprint_is_an_error_not_empty_success(self):
        lines=fixture();lines[9]=row('ATTR','af',dict(parentId='c',key='Footprint',value='missing'))
        with self.assertRaisesRegex(ImportError,'缺少封装'):load_bytes(pack(lines))
    def test_unknown_net_refuses_import(self):
        lines=fixture();lines[-1]=row('PAD_NET','["PAD_NET","c","1","p"]',dict(padNet='Other'))
        with self.assertRaisesRegex(ImportError,'未声明'):load_bytes(pack(lines))
    def test_multiple_boards_require_explicit_selection(self):
        lines=fixture()+[row('DOCHEAD',None,dict(docType='PCB',uuid='other'))]
        with self.assertRaisesRegex(ImportError,'2块PCB'):load_bytes(pack(lines))
        self.assertEqual(len(load_bytes(pack(lines),board_id='pcb')['pads']),1)
    def test_deleted_document_not_selected(self):
        lines=fixture()+[row('DOCHEAD',None,dict(docType='PCB',uuid='deleted')),row('DELETE_DOC',None,dict(isDelete=True))]
        self.assertEqual(len(load_bytes(pack(lines))['pads']),1)
    def test_bad_numeric_values_and_unknown_geometry_fail(self):
        for changes in ({'x':True},{'x':float('nan')},{'layerId':True},{'layerId':9}):
            lines=fixture();lines[8]=row('COMPONENT','c',dict(dict(layerId=1,x=500,y=-300,angle=0),**changes))
            with self.subTest(changes=changes),self.assertRaises(ImportError):load_bytes(pack(lines))
    def test_blank_lines_crlf_bom_and_pipes_in_network_names(self):
        lines=[line.replace('GND','A||B') for line in fixture()]
        raw='\ufeff\r\n'+'\r\n\r\n'.join(lines)
        self.assertEqual(only(load_bytes(raw.encode(),'board.epru'))['net'],'A||B')
    def test_geometry_identity_changes_with_source(self):
        a=load_bytes(pack(fixture()));lines=fixture()+[row('META','META',{'title':'new'})]
        b=load_bytes(pack(lines));self.assertNotEqual(a['dimensions']['layout_id'],b['dimensions']['layout_id'])

class BoundaryTests(unittest.TestCase):
    def test_binary_ad_is_rejected(self):
        with self.assertRaisesRegex(ImportError,'仅支持'):load_bytes(bytes.fromhex('d0cf11e0a1b11ae1'),'x.PcbDoc')
    def test_unsafe_archive_path_and_duplicate_name_are_rejected(self):
        for extra in ({'../outside':'x'},{'/absolute':'x'},{'PROJECT2.JSON':'{}'}):
            with self.subTest(extra=extra),self.assertRaises(ImportError):load_bytes(pack(fixture(),extra))
    def test_truncated_and_wrong_archive_cannot_import(self):
        for raw in (b'',b'PKbad',b'<html>Error</html>'):
            with self.subTest(raw=raw),self.assertRaises(ImportError):load_bytes(raw)
    def test_outline_must_be_closed(self):
        lines=fixture();lines[6]=row('POLY','edge',dict(layerId=11,path=[0,0,'L',1000,0,1000,-800]))
        with self.assertRaisesRegex(ImportError,'闭合'):load_bytes(pack(lines))
    def test_round_rectangle_keeps_exact_extrema(self):
        lines=fixture();lines[6]=row('POLY','edge',dict(layerId=11,path=['R',0,0,1000,800,0,50]))
        result=load_bytes(pack(lines));self.assertAlmostEqual(result['dimensions']['width'],25.4)
        self.assertAlmostEqual(result['dimensions']['height'],20.32)
    def test_rotated_unsupported_rectangle_is_rejected(self):
        with self.assertRaises(ImportError):paths(['R',0,0,100,100,37])

AD='''|RECORD=Board|KIND=Protel_Advanced_PCB|VERSION=5.0|VX0=0mm|VY0=0mm|VX1=100mm|VY1=0mm|VX2=100mm|VY2=80mm|VX3=0mm|VY3=80mm
|RECORD=Net|NAME=GND
|RECORD=Component|SOURCEDESIGNATOR=R1|ROTATION=90
|RECORD=Pad|COMPONENT=0|NET=0|NAME=1|LAYER=TOP|X=10mm|Y=20mm|XSIZE=40mil|YSIZE=20mil|SHAPE=RECTANGLE|ROTATION=37
'''
class RetiredFormatTests(unittest.TestCase):
    def test_non_v3_files_refused(self):
        for raw,name in [(AD.encode(),'b.PcbDoc'),(b'(kicad_pcb)','b.kicad_pcb')]:
            with self.subTest(name=name),self.assertRaises(ImportError):load_bytes(raw,name)

if __name__=='__main__':unittest.main()
