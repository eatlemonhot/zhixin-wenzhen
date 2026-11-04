"""Offline regression of physical-coordinate conversions and calibration transactions."""
import copy
import importlib
import json
from pathlib import Path
import tempfile
import unittest
from unittest.mock import Mock,patch
import test_pcb_integration as base

M=base.bundle()
frames=M.load('reference_frame');contacts=M.load('pad_contact');cal=M.load('calibration')

class ReferenceTests(unittest.TestCase):
    def setUp(self):
        self.tmp=tempfile.TemporaryDirectory();self.addCleanup(self.tmp.cleanup)
        self.controller=base.PCBController(Path(self.tmp.name));self.coordinates=self.controller.load_coordinates()
        self.old=frames.reference_frame(self.coordinates)
        self.anchor=dict(x=10.,y=20.,reference_id=self.old['reference_id'],reference_frame=self.old)

    def changed(self,**changes):
        c=copy.deepcopy(self.coordinates)
        for a,v in changes.items():c['axes'][a]['origin']['origin_encoder_deg']+=v
        return frames.reference_frame(c)

    def test_left_rebase_preserves_absolute_encoder_target_with_y_sign(self):
        current=self.changed(**{'1':.9,'3':-.45})
        a=frames.rebase_anchor(self.anchor,current,'left')
        self.assertAlmostEqual(a['x'],9.9);self.assertAlmostEqual(a['y'],19.95)
        for axis,address in {'x':'1','y':'3'}.items():
            old_target=self.anchor[axis]
            self.assertAlmostEqual(self.old['origins'][address]+self.old['signs'][address]*old_target*9,
                                   current['origins'][address]+current['signs'][address]*a[axis]*9)

    def test_right_rebase_and_wrap(self):
        current=self.changed(**{'2':-.9,'4':.45})
        a=frames.rebase_anchor(self.anchor,current,'right')
        self.assertAlmostEqual(a['x'],10.1);self.assertAlmostEqual(a['y'],19.95)
        current['origins']['2']+=360
        self.assertAlmostEqual(frames.rebase_anchor(self.anchor,current,'right')['x'],10.1)

    def test_excess_or_structural_change_never_rebinds_old_hash(self):
        self.assertIsNone(frames.rebase_anchor(self.anchor,self.changed(**{'1':2.01}),'left'))
        for change in ('limit','pitch','mapping','baseline'):
            c=copy.deepcopy(self.coordinates)
            if change=='limit':c['axes']['1']['soft_max_mm']+=1
            if change=='pitch':c['mm_per_rev']+=1
            if change=='baseline':c['origin_recommissioning']={'performed_at_utc':'new'}
            if change=='mapping':
                with patch.object(frames,'PROBE_MAPPING_VERSION',999):current=frames.reference_frame(c)
            else:current=frames.reference_frame(c)
            self.assertIsNone(frames.rebase_anchor(self.anchor,current,'left'))

    def test_legacy_needs_exact_saved_frame_not_only_close_origin(self):
        old=dict(self.anchor);old.pop('reference_frame')
        current=self.changed(**{'1':.1})
        self.assertIsNone(frames.rebase_anchor(old,current,'left'))
        self.assertIsNotNone(frames.rebase_anchor(old,current,'left',lambda signature:self.old))
        fake=dict(self.old,reference_id='wrong')
        self.assertIsNone(frames.rebase_anchor(old,current,'left',lambda signature:fake))

    def test_boards_and_versions_are_independent_and_restore_preserves_frame(self):
        store=M.alignment.AlignmentStore(Path(self.tmp.name)/'align.json')
        store.record('left',self.anchor,'A',0,0)
        store.record('right',dict(self.anchor,x=90),'B',90,1)
        self.assertTrue(store.view('A',0,self.old)['alignment']['left'])
        store.record('left',dict(self.anchor,x=11),'A',0,2)
        store.restore('left','A',0,3)
        self.assertEqual(store.view('A',0,self.old)['anchors']['left']['x'],10)
        self.assertTrue(store.view('B',90,self.old)['alignment']['right'])
        self.assertTrue(store.path.with_suffix('.legacy-backup.json').exists())

class ContactTests(unittest.TestCase):
    def pad(self,shape='rect',angle=0,sx=2,sy=1):
        return dict(footprint_x=10,footprint_y=20,footprint_angle=angle,pad_x=0,pad_y=0,
                    relative_angle=0,size_x=sx,size_y=sy,shape=shape,roundrect_ratio=.25)
    def dims(self,orientation=0):return dict(width=100,height=60,orientation=orientation)
    def test_center_never_gets_edge_bias(self):
        for p in ('left','right'):
            c=contacts.contact_point(self.pad(),self.dims(),p,center=True)
            self.assertEqual((c['x'],c['y']),(10,20))
    def test_edges_are_on_installed_board_horizontal_centerline(self):
        for angle in (0,30,45,90,180,270):
            for orientation in (0,90,180,270):
                a=contacts.contact_point(self.pad(angle=angle),self.dims(orientation),'left')
                b=contacts.contact_point(self.pad(angle=angle),self.dims(orientation),'right')
                self.assertLess(a['x'],a['center']['x']);self.assertGreater(b['x'],b['center']['x'])
                self.assertEqual(a['y'],b['y']);self.assertAlmostEqual(a['center']['x']-a['x'],b['x']-b['center']['x'])
    def test_rectangle_rotation_has_correct_intersection(self):
        a=contacts.contact_point(self.pad(angle=90),self.dims(),'left')
        self.assertAlmostEqual(a['x'],9.6)
    def test_ellipse_and_capsule_use_different_real_boundaries(self):
        a=contacts.contact_point(dict(self.pad('oval',45),contact_shape='ellipse'),self.dims(),'left')
        b=contacts.contact_point(self.pad('oval',45),self.dims(),'left')
        self.assertNotAlmostEqual(a['x'],b['x'])
    def test_hole_tiny_unknown_and_invalid_inset_fail_before_motion(self):
        for p,inset in [(self.pad(sx=.1),.1),(self.pad('polygon'),.1),(self.pad(),float('nan')),
                        (dict(self.pad(),hole_size_mm={'x':1.9,'y':.8}),.1)]:
            with self.assertRaises(ValueError):contacts.contact_point(p,self.dims(),'left',inset)

class FitTests(unittest.TestCase):
    def samples(self,probe='left',error=None):
        rows=[]
        for i in range(5):
            point=dict(x=10+i*7,y=5+i*11);axes=cal.PROBE_AXES[probe]
            positions={str(a):2. for a in range(1,5)}
            positions[axes['x']]=30+(1 if probe=='left' else -1)*point['x']+(error if i==4 and error else 0)
            positions[axes['y']]=100-point['y']
            rows.append(dict(pad_id=str(i),point=point,positions_mm=positions))
        return rows
    def test_five_center_samples_fit_only_translation_both_probes(self):
        for p in ('left','right'):
            fit=cal.fit_translation(p,self.samples(p),dict(x=29,y=102))
            self.assertEqual(fit['new'],dict(x=30,y=100));self.assertEqual(fit['delta'],dict(x=1,y=-2))
            self.assertEqual(fit['max_error_mm'],0);self.assertTrue(fit['acceptable'])
    def test_outlier_reported_not_silently_removed_or_saved(self):
        fit=cal.fit_translation('left',self.samples(error=1),dict(x=30,y=100))
        self.assertFalse(fit['acceptable']);self.assertEqual(len(fit['samples']),5)
        self.assertAlmostEqual(fit['max_error_mm'],.8)
    def test_duplicate_and_nonfinite_rejected(self):
        rows=self.samples();rows[4]['pad_id']='0'
        with self.assertRaises(ValueError):cal.fit_translation('left',rows,dict(x=0,y=0))
        rows=self.samples();rows[4]['positions_mm']['1']=float('nan')
        with self.assertRaises(ValueError):cal.fit_translation('left',rows,dict(x=0,y=0))
    def test_draft_owner_cancel_and_immutable_seed(self):
        with tempfile.TemporaryDirectory() as tmp:
            store=cal.CalibrationStore(Path(tmp));profile=dict(revision=1,anchors={'left':dict(x=10,y=20)},offsets=base.zero_offsets())
            points=[dict(pad_id=str(i),x=i,y=i) for i in range(5)]
            d=store.start('A','left',points,profile,dict(reference_id='ref'),'board',0,.1)
            profile['anchors']['left']['x']=999
            self.assertEqual(store.read('A')['base_profile']['anchors']['left']['x'],10)
            with self.assertRaises(ValueError):store.owned('B',d['id'])
            before=store.read('A');store.write('A',dict(before,state='cancelled'))
            with self.assertRaises(ValueError):store.owned('A',d['id'])
            self.assertEqual(before['samples'],{})

class RouteTests(base.PCBRouteTests):
    setUp=base.PCBRouteTests.setUp
    pad=staticmethod(base.PCBRouteTests.pad)
    ready=base.PCBRouteTests.ready
    aligned=base.PCBRouteTests.aligned
    post=base.PCBRouteTests.post
    def setUp(self):
        base.PCBRouteTests.setUp(self);self.ready();self.aligned()
        for i in range(5):self.pads['c'+str(i)]=self.pad(10+i*3,10+i*5,'c'+str(i))
    def begin(self):
        return self.post('calibration/start',dict(probe='left',pad_ids=['c'+str(i) for i in range(5)],orientation=0,tolerance_mm=.1))
    def complete(self):
        value=self.begin().get_json();store=self.pcb.calibration
        for i in range(5):
            store.phase('user-A',value['id'],'moving',('ready',));store.phase('user-A',value['id'],'aligning',('moving',));store.phase('user-A',value['id'],'recording',('aligning',))
            point=value['points'][i];positions={'1':2+point['x'],'2':20,'3':100-point['y'],'4':40}
            store.record('user-A',value['id'],dict(positions_mm=positions,anchor={'reference_id':value['reference']['reference_id']}))
        return store.read('user-A')
    def test_start_does_not_move_and_preview_uses_center(self):
        r=self.begin();self.assertEqual(r.status_code,200);d=r.get_json();self.assertEqual(self.started,[])
        preview=self.post('calibration/preview',{'id':d['id']}).get_json()
        self.assertEqual(preview['points']['left']['x'],10);self.assertTrue(preview['can_move'])
    def test_record_requires_arrival_and_explicit_actual_alignment(self):
        d=self.begin().get_json()
        self.assertEqual(self.post('calibration/record',{'id':d['id']}).status_code,409)
        self.assertEqual(self.started,[])
    def test_save_and_restore_are_atomic_and_cancel_preserves_original(self):
        d=self.complete();old=self.pcb.store.read()
        self.assertEqual(self.post('calibration/save',{'id':d['id']}).status_code,200)
        self.assertEqual(self.pcb.store.read()['anchors']['left']['x'],2)
        self.assertEqual(self.pcb.store.read()['revision'],old['revision']+1)
        response=self.post('restore',dict(probe='left',revision=old['revision']+1));self.assertEqual(response.status_code,200)
        before=self.pcb.store.path.read_bytes();d=self.begin().get_json()
        self.assertEqual(self.post('calibration/cancel',{'id':d['id']}).status_code,200)
        self.assertEqual(self.pcb.store.path.read_bytes(),before)
    def test_duplicate_and_revision_change_fail_without_motion(self):
        response=self.post('calibration/start',dict(probe='left',pad_ids=['c0']*5,orientation=0,tolerance_mm=.1));self.assertEqual(response.status_code,409)
        d=self.begin().get_json();self.pcb.store.save_offsets(base.zero_offsets(),2)
        self.assertEqual(self.post('calibration/preview',{'id':d['id']}).status_code,409)
        self.assertEqual(self.started,[])
    def test_external_xy_remains_explicit_contact_coordinate(self):
        response=self.post('preview-xy',dict(layout_id='board-A',orientation=0,coordinate_frame='pcb_mm',points={'left':dict(x=10,y=20),'right':None}))
        self.assertEqual(response.status_code,200);self.assertEqual(response.get_json()['points']['left']['x'],10)

    def finish_job(self,passed=True,positions=None):
        payload,handle,callback=self.started[-1]
        result=dict(passed=passed,ready=passed,connected=passed,
                    positions_mm=positions or self.controller.positions,
                    anchor={'reference_id':frames.reference_id(self.controller.coordinates)},error='simulated failure')
        def communicate(*args,**kwargs):
            (self.service.runtime/(payload['run_id']+'.json')).write_text(json.dumps(result))
        process=Mock(returncode=0 if passed else 1);process.communicate.side_effect=communicate
        with patch.object(self.service,'_popen',return_value=process):self.service._run(payload,handle,callback)

    def test_http_five_point_move_record_save_round_trip(self):
        d=self.begin().get_json();original=self.pcb.store.path.read_bytes()
        for i in range(5):
            pre=self.post('calibration/preview',{'id':d['id']}).get_json()
            self.assertTrue(pre['can_move'])
            self.assertEqual(self.post('move',{'preview_id':pre['preview_id']}).status_code,202)
            self.assertEqual(self.pcb.calibration.read('user-A')['state'],'moving')
            self.finish_job()
            self.assertEqual(self.pcb.calibration.read('user-A')['state'],'aligning')
            self.assertEqual(self.post('calibration/record',{'id':d['id']}).status_code,202)
            point=d['points'][i]
            self.finish_job(positions={'1':2.02+point['x'],'2':20,'3':100.03-point['y'],'4':40})
            self.assertEqual(self.pcb.store.path.read_bytes(),original)
        self.assertEqual(self.pcb.calibration.read('user-A')['state'],'complete')
        self.assertEqual(self.post('calibration/save',{'id':d['id']}).status_code,200)
        value=self.pcb.store.read()
        self.assertAlmostEqual(value['anchors']['left']['x'],2.02)
        self.assertAlmostEqual(value['anchors']['left']['y'],100.03)
        self.assertEqual(value['anchors']['right']['x'],90)

    def test_failed_arrival_is_retriable_only_by_new_explicit_preview(self):
        d=self.begin().get_json();pre=self.post('calibration/preview',{'id':d['id']}).get_json()
        self.post('move',{'preview_id':pre['preview_id']});self.finish_job(False)
        state=self.client.get('/motor/pcb/calibration').get_json()
        self.assertEqual(state['state'],'ready');self.assertEqual(state['samples'],{})
        self.assertEqual(self.post('move',{'preview_id':pre['preview_id']}).status_code,409)
        self.assertEqual(len(self.started),1)

    def test_cancel_during_motion_blocks_late_callback_and_preserves_alignment(self):
        d=self.begin().get_json();original=self.pcb.store.path.read_bytes()
        pre=self.post('calibration/preview',{'id':d['id']}).get_json();self.post('move',{'preview_id':pre['preview_id']})
        self.assertEqual(self.post('calibration/cancel',{'id':d['id']}).status_code,200)
        self.finish_job()
        self.assertTrue(self.service.stop_file.exists())
        self.assertEqual(self.pcb.calibration.read('user-A')['state'],'cancelled')
        self.assertEqual(self.pcb.store.path.read_bytes(),original)

    def test_reclamp_invalidates_only_selected_probe_and_prevents_old_restore(self):
        self.pcb.store.record('left',dict(x=3,y=4,reference_id=frames.reference_id(self.controller.coordinates)),'board-A',0,2)
        response=self.post('invalidate',{'probe':'left','revision':3});self.assertEqual(response.status_code,200)
        state=response.get_json();self.assertFalse(state['alignment']['left']);self.assertTrue(state['alignment']['right'])
        self.assertFalse(state['can_restore']['left'])
        self.assertEqual(self.post('restore',{'probe':'left','revision':4}).status_code,409)
        self.assertEqual(self.started,[])

for name in dir(base.PCBRouteTests):
    if name.startswith('test_') and name not in RouteTests.__dict__:setattr(RouteTests,name,None)

if __name__=='__main__':unittest.main()
