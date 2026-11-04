"""Fixed top-left fixture reuse across unrelated boards; no hardware access."""
import copy
import json
from pathlib import Path
import unittest
import test_pcb_integration as base

M=base.bundle()
frames=M.load('reference_frame')


class FixtureTests(base.OfflineFixture):
    def setUp(self):
        super().setUp()
        self.store=M.alignment.AlignmentStore(self.directory/'alignment.json')
        self.frame=frames.reference_frame(self.controller.coordinates)

    def anchor(self,x=10,y=100):
        return dict(x=x,y=y,pcb_frame_version=2,reference_id=self.frame['reference_id'],
                    reference_frame=copy.deepcopy(self.frame),pad_id='old-A-pad',taught_point=dict(x=20,y=30))

    def install(self):
        self.store.install_fixture({'left':self.anchor(),'right':self.anchor(90,110)},'board-A',0,0)

    def view(self,board='board-B',angle=0,frame=None):
        return self.store.view(board,angle,self.frame if frame is None else frame,use_fixture=True)

    def test_different_board_sizes_and_all_rotations_share_fixed_slot_intercepts(self):
        self.install();raw=self.store.path.read_bytes()
        for board,w,h in [('A',60,30),('B',180,100),('C',100,80)]:
            pad=base.PCBRouteTests.pad(15,10,'new-pad')
            for angle in (0,90,180,270):
                with self.subTest(board=board,angle=angle):
                    value=self.view(board,angle)
                    self.assertEqual(value['registration_scope'],'fixed_fixture')
                    self.assertEqual(value['alignment'],dict(left=True,right=True))
                    point=dict(zip(('x','y'),M.geometry.pad_position(pad,dict(width=w,height=h,orientation=angle))[:2]))
                    target=M.geometry.build_targets({'left':point,'right':point},value)
                    self.assertEqual(target,{'1':10+point['x'],'2':90-point['x'],'3':100-point['y'],'4':110-point['y']})
        self.assertEqual(self.store.path.read_bytes(),raw)

    def test_new_board_uses_shared_anchor_without_looking_up_old_pad_on_new_board(self):
        self.install()
        def wrong_lookup(_):raise AssertionError('A source pad must not be resolved in board B')
        value=self.store.view('board-B',270,self.frame,point_lookup=wrong_lookup,use_fixture=True)
        self.assertTrue(value['alignment']['left'])
        self.assertEqual(value['anchors']['left']['y'],100)
        self.assertEqual(value['anchors']['left']['source_layout_id'],'board-A')

    def test_explicit_legacy_promotion_preserves_original_profile_and_reference_target(self):
        old=dict(self.anchor(),y=40);old.pop('pcb_frame_version');old.pop('taught_point')
        self.store.record('left',old,'old-board',0,0)
        root=self.store.read();root['anchors']['left'].pop('pcb_frame_version')
        root['offsets']['left']=dict(x=2,y=3);self.store.path.write_text(json.dumps(root))
        converted=M.alignment.pcb_anchor(root['anchors']['left'],lambda _:dict(x=20,y=30))
        converted['x']+=2;converted['y']+=3
        original=copy.deepcopy(root)
        self.store.install_fixture({'left':converted},'old-board',0,1)
        value=self.view('new-board')
        self.assertEqual(M.geometry.build_targets({'left':dict(x=20,y=30)},value),{'1':32,'3':73})
        self.assertEqual(self.store.read()['anchors'],original['anchors'])
        self.assertEqual(self.store.read()['offsets'],original['offsets'])
        self.assertEqual(value['offsets'],base.zero_offsets())
        self.assertEqual(value['revision'],2)

    def test_unknown_legacy_geometry_and_duplicate_promotion_are_rejected(self):
        bad=self.anchor();bad.pop('pcb_frame_version')
        with self.assertRaises(ValueError):self.store.install_fixture({'left':bad},'A',0,0)
        self.assertFalse(self.store.path.exists())
        self.install();raw=self.store.path.read_bytes()
        with self.assertRaises(ValueError):self.store.install_fixture({'left':self.anchor(99)},'B',0,1)
        self.assertEqual(self.store.path.read_bytes(),raw)

    def test_reference_rebasing_and_original_two_degree_boundary_still_apply(self):
        self.install();coords=copy.deepcopy(self.controller.coordinates)
        coords['axes']['1']['origin']['origin_encoder_deg']+=.9
        current=frames.reference_frame(coords)
        self.assertAlmostEqual(self.view(frame=current)['anchors']['left']['x'],9.9)
        coords['axes']['1']['origin']['origin_encoder_deg']+=1.2
        self.assertEqual(self.view(frame=frames.reference_frame(coords))['anchors'],{})

    def test_mechanical_identity_change_does_not_reuse_device_registration(self):
        self.install();coords=copy.deepcopy(self.controller.coordinates)
        coords['axes']['1']['soft_max_mm']+=1
        self.assertEqual(self.view(frame=frames.reference_frame(coords))['alignment'],dict(left=False,right=False))

    def test_saving_on_new_board_updates_device_probe_and_preserves_other_probe(self):
        self.install()
        self.store.record('left',self.anchor(12,101),'board-B',90,1,consolidate=True,fixture=True)
        for board in ('board-A','board-B','board-C'):
            value=self.view(board)
            self.assertEqual(value['anchors']['left']['x'],12)
            self.assertEqual(value['anchors']['right']['x'],90)
            self.assertEqual(value['anchors']['left']['source_layout_id'],'board-B')

    def test_offsets_and_consolidation_are_shared_once_without_double_counting(self):
        self.install();offsets=base.zero_offsets();offsets['left']=dict(x=2,y=3)
        self.store.save_offsets(offsets,1,'B',90,fixture=True)
        value=self.view('C')
        target=M.geometry.build_targets({'left':dict(x=20,y=30)},value)
        self.assertEqual(target,{'1':32,'3':73})
        self.store.record('left',self.anchor(12,103),'B',90,2,consolidate=True,fixture=True)
        self.assertEqual(M.geometry.build_targets({'left':dict(x=20,y=30)},self.view('D')),target)
        self.assertEqual(self.view()['offsets']['left'],dict(x=0,y=0))

    def test_restore_uses_device_history_across_boards(self):
        self.install();self.store.record('right',self.anchor(88,112),'B',0,1,consolidate=True,fixture=True)
        self.store.restore('right','C',270,2,fixture=True)
        self.assertEqual(self.view('D')['anchors']['right']['x'],90)
        self.assertEqual(self.view('D')['anchors']['left']['x'],10)

    def test_probe_invalidation_is_global_and_archived_board_cannot_resurrect_it(self):
        self.store.record('left',self.anchor(33),'old',0,0)
        self.store.install_fixture({'left':self.anchor(),'right':self.anchor(90,110)},'old',0,1)
        self.store.invalidate('left','new',0,2,fixture=True)
        for board in ('old','new','third'):
            value=self.view(board);self.assertFalse(value['alignment']['left']);self.assertTrue(value['alignment']['right'])
            self.assertFalse(value['can_restore']['left'])
        with self.assertRaises(ValueError):self.store.restore('left','old',0,3,fixture=True)
        self.assertIn('left',self.store.read()['anchors'])

    def test_empty_upload_never_exposes_executable_registration(self):
        self.install();self.assertEqual(self.view(board=None)['anchors'],{})


class FixtureRouteTests(base.PCBRouteTests):
    def fixture(self):
        signature=self.modules.alignment.reference_id(self.controller.coordinates)
        anchors={p:dict(x=2 if p=='left' else 90,y=100,reference_id=signature,pcb_frame_version=2)
                 for p in ('left','right')}
        self.pcb.store.install_fixture(anchors,'old-layout',0,0)

    def test_upload_identity_change_keeps_both_probes_previewable_without_teach(self):
        self.fixture();self.ready();before=self.pcb.store.path.read_bytes()
        for identifier in ('board-A','different-engineering-file','edited-board-file'):
            self.dimensions['layout_id']=identifier
            response=self.client.get('/motor/pcb/config');self.assertEqual(response.status_code,200)
            profile=response.get_json();self.assertEqual(profile['alignment'],dict(left=True,right=True))
            self.assertEqual(profile['layout_id'],identifier)
            result=self.preview(left='pad-L',right='pad-R').get_json();self.assertTrue(result['can_move'],result)
        self.assertEqual(self.pcb.store.path.read_bytes(),before)
        self.assertEqual(self.started,[])


for name in dir(base.PCBRouteTests):
    if name.startswith('test_') and name not in FixtureRouteTests.__dict__:setattr(FixtureRouteTests,name,None)

if __name__=='__main__':unittest.main()
