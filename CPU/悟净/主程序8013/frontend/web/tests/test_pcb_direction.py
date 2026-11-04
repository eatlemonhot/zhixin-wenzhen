"""用独立坐标样例校验PCB向下与手动向下的一致性。

    使用模拟位置与控制器检查坐标镜像及映射方向。"""
import copy
import json
from pathlib import Path
import tempfile
import unittest
import test_pcb_integration as base

M=base.bundle()
g=M.geometry
frame=M.load('reference_frame')
cal=M.load('calibration')


class PhysicalDirectionTests(unittest.TestCase):
    def test_single_teach_transfers_to_other_points_in_physical_directions(self):
        start={'1':60.,'2':40.,'3':80.,'4':90.}
        for probe in ('left','right'):
            axis=g.PROBE_AXES[probe]
            anchor=g.teach_anchor(probe,dict(x=20,y=30),start,base.zero_offsets())
            profile=dict(anchors={probe:anchor},offsets=base.zero_offsets())
            for point,dx,dy in [(dict(x=20,y=30),0,0),(dict(x=30,y=30),10,0),
                                (dict(x=20,y=40),0,-10),(dict(x=20,y=20),0,10)]:
                with self.subTest(probe=probe,point=point):
                    targets=g.build_targets({probe:point},profile)
                    self.assertEqual(targets[axis['x']],start[axis['x']]+(dx if probe=='left' else -dx))
                    self.assertEqual(targets[axis['y']],start[axis['y']]+dy)
            address,delta=M.worker.validate_jog(dict(probe=probe,direction='down',step_mm=10))
            target=g.build_targets({probe:dict(x=20,y=40)},profile)
            self.assertEqual(target[str(address)]-start[str(address)],delta)

    def test_rotation_occurs_before_physical_down_conversion(self):
        pad=base.PCBRouteTests.pad(10,15,'A')
        second=base.PCBRouteTests.pad(10,25,'B')
        start={'1':60.,'2':40.,'3':80.,'4':90.}
        for angle,(dx,dy) in {0:(0,-10),90:(-10,0),180:(0,10),270:(10,0)}.items():
            dims=dict(width=100,height=60,orientation=angle)
            a=dict(zip(('x','y'),g.pad_position(pad,dims)[:2]))
            b=dict(zip(('x','y'),g.pad_position(second,dims)[:2]))
            anchor=g.teach_anchor('left',a,start,base.zero_offsets())
            target=g.build_targets({'left':b},dict(anchors={'left':anchor},offsets=base.zero_offsets()))
            self.assertAlmostEqual(target['1'],60+dx)
            self.assertAlmostEqual(target['3'],80+dy)

    def test_legacy_one_point_round_trip_hides_mirroring_error(self):
        old_anchor=dict(x=40,y=50,pad_id='A',pcb_frame_version=1)
        new=M.alignment.pcb_anchor(old_anchor,lambda _:dict(x=20,y=30))
        profile=dict(anchors={'left':new},offsets=base.zero_offsets())
        self.assertEqual(g.build_targets({'left':dict(x=20,y=30)},profile),{'1':60,'3':80})
        self.assertEqual(g.build_targets({'left':dict(x=20,y=40)},profile),{'1':60,'3':70})
        self.assertEqual(old_anchor['y'],50)
        self.assertEqual(M.alignment.pcb_anchor(new)['y'],110)


class MigrationTests(unittest.TestCase):
    def setUp(self):
        self.tmp=tempfile.TemporaryDirectory();self.addCleanup(self.tmp.cleanup)
        self.controller=base.PCBController(Path(self.tmp.name))
        self.ref=frame.reference_frame(self.controller.coordinates)
        self.anchor=dict(x=40,y=50,pad_id='A',reference_id=self.ref['reference_id'],reference_frame=self.ref)
        self.point=dict(x=20,y=30)
        self.store=M.alignment.AlignmentStore(Path(self.tmp.name)/'alignment.json')

    def raw_profile(self):
        return dict(layout_id='board-A',orientation=0,revision=7,anchors={'left':copy.deepcopy(self.anchor)},offsets=base.zero_offsets())

    def test_readonly_view_migrates_current_and_restore_history_without_erasing_original(self):
        root=self.raw_profile();root['history']={'board-A:0:left':[dict(anchor=copy.deepcopy(self.anchor),offset=dict(x=0,y=0))]}
        self.store.path.write_text(json.dumps(root));before=self.store.path.read_bytes()
        for _ in range(2):
            view=self.store.view('board-A',0,self.ref,point_lookup=lambda _:self.point)
            self.assertEqual(view['anchors']['left']['y'],110)
            self.assertEqual(view['anchors']['left']['pcb_frame_version'],g.PCB_FRAME_VERSION)
            self.assertEqual(view['revision'],7)
            self.assertEqual(self.store.path.read_bytes(),before)
        self.store.restore('left','board-A',0,7)
        self.assertEqual(self.store.view('board-A',0,self.ref,point_lookup=lambda _:self.point)['anchors']['left']['y'],110)

    def test_new_records_are_versioned_and_never_get_double_compensation(self):
        self.store.record('left',dict(self.anchor,y=110),'board-A',0,0)
        raw=self.store.read()['anchors']['left']
        self.assertEqual(raw['pcb_frame_version'],g.PCB_FRAME_VERSION)
        view=self.store.view('board-A',0,self.ref,point_lookup=lambda _:self.point)
        self.assertEqual(view['anchors']['left']['y'],110)
        self.assertNotIn('y_direction_migration',view['anchors']['left'])

    def test_missing_pad_unknown_model_and_invalid_point_cannot_be_guessed(self):
        for anchor,lookup in [(self.anchor,None),(dict(self.anchor,pcb_frame_version=999),lambda _:self.point),
                              (self.anchor,lambda _:dict(x=20,y=float('nan')))]:
            root=self.raw_profile();root['anchors']['left']=anchor;self.store.path.write_text(json.dumps(root))
            view=self.store.view('board-A',0,self.ref,point_lookup=lookup)
            self.assertFalse(view['alignment']['left'])
            self.assertTrue(view['alignment_reasons']['left'])
            self.assertNotEqual(view['alignment_reasons']['left'],'已记录')
            self.assertIn('left',self.store.read()['anchors'])

    def test_rebase_and_y_conversion_preserve_same_absolute_taught_location(self):
        root=self.raw_profile();self.store.path.write_text(json.dumps(root))
        coordinates=copy.deepcopy(self.controller.coordinates);coordinates['axes']['3']['origin']['origin_encoder_deg']+=.9
        current=frame.reference_frame(coordinates)
        view=self.store.view('board-A',0,current,point_lookup=lambda _:self.point)
        target=g.build_targets({'left':self.point},view)['3']
        old_target=self.anchor['y']+self.point['y']
        address='3'
        self.assertAlmostEqual(self.ref['origins'][address]+self.ref['signs'][address]*old_target*9,
                               current['origins'][address]+current['signs'][address]*target*9)

    def test_old_five_point_data_reconstructs_the_correct_intercept(self):
        samples=[dict(pad_id=str(i),point=dict(x=20,y=y),positions_mm={'1':60,'2':40,'3':150-y,'4':80}) for i,y in enumerate((10,20,30,40,50))]
        anchor=dict(self.anchor,y=90,calibration={'samples':samples});anchor.pop('pad_id')
        migrated=M.alignment.pcb_anchor(anchor)
        self.assertEqual(migrated['y'],150)
        fitted=cal.fit_translation('left',samples,dict(x=40,y=150))
        self.assertEqual(fitted['new']['y'],150)
        self.assertTrue(fitted['acceptable'])

    def test_old_inflight_five_point_session_is_invalidated_without_saving(self):
        store=cal.CalibrationStore(Path(self.tmp.name)/'draft')
        profile=dict(self.raw_profile(),anchors={'left':dict(self.anchor,y=110,pcb_frame_version=g.PCB_FRAME_VERSION)})
        draft=store.start('A','left',[dict(pad_id=str(i),x=i,y=i) for i in range(5)],profile,self.ref,'board-A',0,.1)
        draft.pop('pcb_frame_version')
        with self.assertRaisesRegex(ValueError,'Y方向'):
            store.valid(draft,'board-A',0,7,self.ref)

    def test_unversioned_queued_motion_is_rejected_before_opening_controller(self):
        context=dict(points={'left':self.point},profile=dict(anchors={'left':self.anchor},offsets=base.zero_offsets()))
        with self.assertRaisesRegex(RuntimeError,'Y方向模型'):
            M.worker.move_pads(self.controller,context,'offline_stale_token')
        self.assertEqual(self.controller.sessions,[])


class LegacyRouteTests(base.PCBRouteTests):
    setUp=base.PCBRouteTests.setUp
    context=base.OfflineFixture.context
    pad=staticmethod(base.PCBRouteTests.pad)
    post=base.PCBRouteTests.post
    def test_current_board_resolves_saved_pad_before_y_migration_and_binds_new_token(self):
        base.PCBRouteTests.ready(self)
        signature=self.modules.alignment.reference_id(self.controller.coordinates)
        root=dict(layout_id='board-A',orientation=0,revision=4,anchors={'left':dict(x=2,y=60,pad_id='pad-L',reference_id=signature)},offsets=base.zero_offsets())
        self.pcb.store.path.parent.mkdir(parents=True,exist_ok=True)
        self.pcb.store.path.write_text(json.dumps(root));before=self.pcb.store.path.read_bytes()
        first=self.post('preview',dict(pads={'left':'pad-L','right':None},purpose='calibration',orientation=0,layout_id='board-A')).get_json()
        self.assertTrue(first['can_move'],first['errors']);self.assertEqual(first['targets']['3'],80)
        self.pads['below']=self.pad(10,30,'below')
        second=self.post('preview',dict(pads={'left':'below','right':None},purpose='calibration',orientation=0,layout_id='board-A')).get_json()
        self.assertTrue(second['can_move'],second['errors']);self.assertEqual(second['targets']['3'],70)
        self.assertEqual(self.pcb.store.path.read_bytes(),before)
        self.assertEqual(self.post('move',{'preview_id':second['preview_id']}).status_code,202)
        self.assertEqual(self.started[-1][0]['context']['profile']['anchors']['left']['pcb_frame_version'],g.PCB_FRAME_VERSION)


def load_tests(loader, tests, pattern):
    suite=unittest.TestSuite()
    for cls in (PhysicalDirectionTests,MigrationTests,LegacyRouteTests):
        for name in sorted(cls.__dict__):
            if name.startswith('test_'):suite.addTest(cls(name))
    return suite
