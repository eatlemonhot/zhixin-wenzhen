
import copy
import hashlib
import importlib.util
import json
from pathlib import Path
import sys
import tempfile
import types
import unittest
import uuid
from unittest import mock

import test_motor_control as motor_fakes


INTERFACE = Path(__file__).resolve().parents[1] / 'interface'
HAS_FLASK = importlib.util.find_spec('flask') is not None


def bundle():
    name = '_offline_pcb_integration_' + uuid.uuid4().hex
    package = types.ModuleType(name)
    package.__path__ = [str(INTERFACE)]
    sys.modules[name] = package

    def load(module_name):
        qualified = name + '.' + module_name
        spec = importlib.util.spec_from_file_location(qualified, INTERFACE / (module_name + '.py'))
        module = importlib.util.module_from_spec(spec)
        sys.modules[qualified] = module
        setattr(package, module_name, module)
        spec.loader.exec_module(module)
        return module

    geometry = load('pcb_coordinates')
    alignment = load('pcb_alignment')
    worker = load('motor_worker')
    service = load('motor_service')
    return types.SimpleNamespace(name=name, package=package, load=load, geometry=geometry,
                                 alignment=alignment, worker=worker, service=service)


MODULES = bundle()


def zero_offsets():
    return {'left': {'x': 0, 'y': 0}, 'right': {'x': 0, 'y': 0}}


def legacy_reference_id(coordinates):
    frame = {str(a): coordinates['axes'][str(a)]['origin']['origin_encoder_deg']
             for a in range(1, 5)}
    frame['mm_per_rev'] = coordinates['mm_per_rev']
    return hashlib.sha256(json.dumps(frame, sort_keys=True, allow_nan=False).encode()).hexdigest()


class PCBController(motor_fakes.FakeController):
    def __init__(self, directory):
        super().__init__(directory)
        self.coordinates['mm_per_rev'] = 40.0
        for address in range(1, 5):
            self.coordinates['axes'][str(address)]['origin'] = {'origin_encoder_deg': address * 10.0}
        self.status_calls = []

    def Machine(self, run_id):
        self.status_calls.append(run_id)
        return super().Machine(run_id)


class OfflineFixture(unittest.TestCase):
    def setUp(self):
        self.temporary = tempfile.TemporaryDirectory()
        self.addCleanup(self.temporary.cleanup)
        self.directory = Path(self.temporary.name)
        self.controller = PCBController(self.directory)

    def context(self, desired=None, probes=('left', 'right')):
        desired = dict(self.controller.positions, **(desired or {}))
        offsets = zero_offsets()
        points = {probe: {'x': 5, 'y': 7} for probe in probes}
        signature = MODULES.alignment.reference_id(self.controller.coordinates)
        anchors = {}
        for probe, point in points.items():
            anchor = MODULES.geometry.teach_anchor(probe, point, desired, offsets)
            anchor.update(reference_id=signature, pad_id='fake-' + probe,pcb_frame_version=MODULES.geometry.PCB_FRAME_VERSION)
            anchors[probe] = anchor
        return {'points': points, 'profile': {'anchors': anchors, 'offsets': offsets, 'revision': 2}}


class AlignmentStoreTests(OfflineFixture):
    def setUp(self):
        super().setUp()
        self.path = self.directory / 'alignment.json'
        self.store = MODULES.alignment.AlignmentStore(self.path)
        self.signature = MODULES.alignment.reference_id(self.controller.coordinates)

    def record_both(self):
        self.store.record('left', {'x': 2, 'y': 3, 'reference_id': self.signature}, 'board-A', 0, 0)
        self.store.record('right', {'x': 90, 'y': 4, 'reference_id': self.signature}, 'board-A', 0, 1)

    def test_four_offsets_persist_with_revision_and_no_controller_access(self):
        self.assertFalse(self.path.exists())
        self.assertEqual(self.store.read()['revision'], 0)
        offsets = {'left': {'x': 1.5, 'y': -2.5}, 'right': {'x': 3.5, 'y': -4.5}}
        saved = self.store.save_offsets(offsets, 0)
        self.assertEqual(saved['revision'], 1)
        self.assertEqual(MODULES.alignment.AlignmentStore(self.path).read()['offsets'], offsets)
        self.assertFalse(self.path.with_suffix('.tmp').exists())
        self.assertEqual(self.controller.status_calls, [])
        self.assertEqual(self.controller.sessions, [])
        self.assertEqual(self.controller.moves, [])

    def test_stale_or_bool_revision_cannot_overwrite_current_profile(self):
        self.store.save_offsets(zero_offsets(), 0)
        for revision in (0, True, '1'):
            with self.subTest(revision=revision), self.assertRaises(ValueError):
                self.store.save_offsets(zero_offsets(), revision)
        self.assertEqual(self.store.read()['revision'], 1)

    def test_board_orientation_and_reference_changes_hide_anchors_without_erasing_them(self):
        self.record_both()
        self.assertEqual(self.store.view('board-A', 0, self.signature)['alignment'], {'left': True, 'right': True})
        for board, angle, signature in [('board-B', 0, self.signature), ('board-A', 90, self.signature),
                                        ('board-A', 0, 'changed-reference'), ('board-A', 0, None)]:
            with self.subTest(board=board, angle=angle, signature=signature):
                view = self.store.view(board, angle, signature)
                self.assertEqual(view['anchors'], {})
                self.assertEqual(view['alignment'], {'left': False, 'right': False})
        self.assertEqual(set(self.store.read()['anchors']), {'left', 'right'})

    def test_record_on_new_board_or_orientation_discards_previous_board_anchors(self):
        self.record_both()
        result = self.store.record('left', {'x': 5, 'y': 6, 'reference_id': self.signature}, 'board-A', 90, 2)
        self.assertEqual(set(result['anchors']), {'left'})
        self.assertEqual(result['revision'], 3)
        result = self.store.record('right', {'x': 90, 'y': 7, 'reference_id': self.signature}, 'board-B', 90, 3)
        self.assertEqual(set(result['anchors']), {'right'})

    def test_reference_signature_tracks_origin_and_scale_not_current_position(self):
        baseline = self.controller.load_coordinates()
        changed = copy.deepcopy(baseline)
        changed['final_positions_mm'] = {'1': 50}
        changed['last_verified_at_utc'] = 'new-time'
        self.assertEqual(MODULES.alignment.reference_id(changed), self.signature)
        changed['axes']['3']['origin']['origin_encoder_deg'] += 0.1
        self.assertNotEqual(MODULES.alignment.reference_id(changed), self.signature)
        changed = copy.deepcopy(baseline)
        changed['mm_per_rev'] = 41
        self.assertNotEqual(MODULES.alignment.reference_id(changed), self.signature)

    def test_legacy_arm_mapping_anchors_are_hidden_with_unchanged_origins(self):
        old_signature = legacy_reference_id(self.controller.coordinates)
        self.assertNotEqual(old_signature, self.signature)
        for revision, probe in enumerate(('left', 'right')):
            self.store.record(probe, {'x': 2, 'y': 3, 'reference_id': old_signature},
                              'board-A', 0, revision)
        view = self.store.view('board-A', 0, self.signature)
        self.assertEqual(view['anchors'], {})
        self.assertEqual(view['alignment'], {'left': False, 'right': False})
        self.assertEqual(set(self.store.read()['anchors']), {'left', 'right'})
        self.store.record('left', {'x': 2, 'y': 3, 'reference_id': self.signature},
                          'board-A', 0, 2)
        self.assertEqual(self.store.view('board-A', 0, self.signature)['alignment'],
                         {'left': True, 'right': False})

    def test_reference_signature_includes_mapping_version_and_axis_assignment(self):
        with mock.patch.object(__import__(MODULES.alignment.reference_id.__module__,fromlist=['x']), 'PROBE_MAPPING_VERSION', 999):
            self.assertNotEqual(MODULES.alignment.reference_id(self.controller.coordinates), self.signature)
        old_axes = {'left': {'x': '2', 'y': '3'}, 'right': {'x': '1', 'y': '4'}}
        with mock.patch.object(__import__(MODULES.alignment.reference_id.__module__,fromlist=['x']), 'PROBE_AXES', old_axes):
            self.assertNotEqual(MODULES.alignment.reference_id(self.controller.coordinates), self.signature)


class PCBWorkerTests(OfflineFixture):
    def run_pads(self, context):
        return MODULES.worker.move_pads(self.controller, context, 'web_offlinepads')

    def test_teach_uses_readonly_machine_status_and_records_reference_without_session_or_motion(self):
        context = {'probe': 'right', 'point': {'x': 5, 'y': 7}, 'offsets': zero_offsets(), 'pad_id': 'pad-R'}
        result = MODULES.worker.teach_machine(self.controller, context, 'web_offlineteach')
        self.assertEqual(self.controller.status_calls, ['web_offlineteach'])
        self.assertEqual(self.controller.sessions, [])
        self.assertEqual(self.controller.moves, [])
        self.assertEqual(result['motion_commands_sent'], 0)
        self.assertEqual(result['anchor']['x'], 25)
        self.assertEqual(result['anchor']['y'], 47)
        self.assertEqual(result['anchor']['pad_id'], 'pad-R')
        self.assertEqual(result['anchor']['reference_id'], MODULES.alignment.reference_id(self.controller.coordinates))

    def test_teach_rejects_invalid_live_reference_without_motion(self):
        self.controller.reference_valid = False
        context = {'probe': 'left', 'point': {'x': 5, 'y': 7}, 'offsets': zero_offsets(), 'pad_id': 'pad-L'}
        with self.assertRaisesRegex(RuntimeError, '参考无效'):
            MODULES.worker.teach_machine(self.controller, context, 'web_offlineteach')
        self.assertEqual(self.controller.sessions, [])
        self.assertEqual(self.controller.moves, [])

    def test_two_probe_move_uses_one_session_and_outward_x_before_inward_x(self):
        self.controller.positions.update({'1': 80, '2': 20})
        self.controller.coordinates['joint_x_limit']['max_combined_inward_mm'] = 110
        result = self.run_pads(self.context({'1': 30, '2': 80, '3': 35, '4': 45}))
        session = self.controller.sessions[0]
        self.assertEqual(len(self.controller.sessions), 1)
        self.assertEqual([move[1] for move in self.controller.moves], [1, 3, 4, 2])
        self.assertTrue(all(move[0] is session for move in self.controller.moves))
        self.assertTrue(all(item is session for item in self.controller.read_sessions))
        self.assertEqual(session.closed, 1)
        self.assertTrue(result['passed'])
        self.assertEqual(result['positions_mm'], {'1': 30, '2': 80, '3': 35, '4': 45})

    def test_single_probe_moves_only_its_axes(self):
        result = self.run_pads(self.context({'1': 15, '3': 35}, probes=('left',)))
        self.assertEqual(set(move[1] for move in self.controller.moves), {1, 3})
        self.assertEqual(self.controller.sessions[0].active_axes, (1, 2, 3, 4))
        self.assertEqual(result['positions_mm']['2'], 20)
        self.assertEqual(result['positions_mm']['4'], 40)

    def test_right_probe_moves_only_confirmed_x2_and_unchanged_y4(self):
        result = self.run_pads(self.context({'2': 25, '4': 45}, probes=('right',)))
        self.assertEqual(set(move[1] for move in self.controller.moves), {2, 4})
        self.assertEqual(self.controller.sessions[0].active_axes, (1, 2, 3, 4))
        self.assertEqual(result['positions_mm']['1'], 10)
        self.assertEqual(result['positions_mm']['3'], 30)

    def test_all_destinations_are_checked_before_the_first_motion(self):
        with self.assertRaisesRegex(RuntimeError, '软限位'):
            self.run_pads(self.context({'2': 25, '3': 35, '4': 101}))
        self.assertEqual(self.controller.moves, [])
        self.assertEqual(self.controller.sessions[0].motor.ser.emitted, [])
        self.assertEqual(self.controller.sessions[0].closed, 1)

    def test_changed_reference_rejects_old_anchor_before_initialization_or_motion(self):
        context = self.context({'2': 25, '3': 35})
        self.controller.coordinates['axes']['1']['origin']['origin_encoder_deg'] += 1
        with self.assertRaisesRegex(RuntimeError, '回零参考已经改变'):
            self.run_pads(context)
        self.assertEqual(self.controller.moves, [])
        self.assertEqual(self.controller.sessions, [])

    def test_legacy_mapping_anchor_cannot_move_even_when_origins_unchanged(self):
        context = self.context({'1': 15, '3': 35}, probes=('left',))
        context['profile']['anchors']['left']['reference_id'] = legacy_reference_id(self.controller.coordinates)
        with self.assertRaisesRegex(RuntimeError, '回零参考已经改变'):
            self.run_pads(context)
        self.assertEqual(self.controller.moves, [])
        self.assertEqual(self.controller.sessions, [])

    def test_reference_read_failure_closes_without_motion(self):
        def failed_reference(session, count):
            raise RuntimeError('fake invalid live reference')
        self.controller.read_hook = failed_reference
        with self.assertRaisesRegex(RuntimeError, 'invalid live reference'):
            self.run_pads(self.context({'2': 25}))
        self.assertEqual(self.controller.moves, [])
        self.assertEqual(self.controller.sessions[0].closed, 1)

    def test_existing_stop_does_not_open_session(self):
        self.controller.core.STOP_FILE.write_text('stop')
        with self.assertRaises(RuntimeError):
            self.run_pads(self.context({'2': 25}))
        self.assertEqual(self.controller.sessions, [])

    def test_stop_during_initialize_or_first_read_prevents_any_motion(self):
        for stage in ('initialize', 'read'):
            with self.subTest(stage=stage):
                self.controller = PCBController(self.directory)
                self.controller.core.STOP_FILE.unlink(missing_ok=True)
                if stage == 'initialize':
                    self.controller.initialize_hook = lambda session: self.controller.core.STOP_FILE.write_text('stop')
                else:
                    self.controller.read_hook = lambda session, count: self.controller.core.STOP_FILE.write_text('stop')
                with self.assertRaisesRegex(RuntimeError, 'stop requested'):
                    self.run_pads(self.context({'2': 25, '3': 35}))
                self.assertEqual(self.controller.moves, [])
                self.assertEqual(self.controller.sessions[0].closed, 1)

    def test_stop_at_position_packet_guard_prevents_wire_motion_and_closes(self):
        self.controller.move_hook = lambda session: self.controller.core.STOP_FILE.write_text('stop')
        with self.assertRaisesRegex(RuntimeError, 'stop requested'):
            self.run_pads(self.context({'2': 25, '3': 35}))
        self.assertEqual(self.controller.sessions[0].motor.ser.emitted, [])
        self.assertEqual(self.controller.sessions[0].closed, 1)

    def test_stop_after_first_move_prevents_remaining_plan(self):
        def stop_on_feedback(session, count):
            if count == 2:
                self.controller.core.STOP_FILE.write_text('stop')
        self.controller.read_hook = stop_on_feedback
        with self.assertRaisesRegex(RuntimeError, 'stop requested'):
            self.run_pads(self.context({'2': 25, '3': 35, '4': 45}))
        self.assertEqual(len(self.controller.sessions[0].motor.ser.emitted), 1)
        self.assertEqual(self.controller.sessions[0].closed, 1)

    def test_cleanup_error_cannot_be_reported_as_success(self):
        self.controller.cleanup_errors = ['fake restore failure']
        with self.assertRaisesRegex(RuntimeError, 'fake restore failure'):
            self.run_pads(self.context({'1': 15}, probes=('left',)))
        self.assertEqual(self.controller.sessions[0].closed, 1)


@unittest.skipUnless(HAS_FLASK, 'Flask is unavailable; run route tests in the board venv')
class PCBRouteTests(OfflineFixture):
    def setUp(self):
        super().setUp()
        from flask import Flask
        self.modules = bundle()
        self.fake_kicad = types.ModuleType(self.modules.name + '.kicad')
        self.dimensions = {'layout_id': 'board-A', 'orientation': 0, 'width': 100, 'height': 60}
        self.pads = {
            'pad-L': self.pad(10, 20, 'pad-L'),
            'pad-R': self.pad(50, 30, 'pad-R'),
            'blocked': self.pad(15, 25, 'blocked', allowed=False),
        }
        self.fake_kicad.dimensions_data = {'user-A': self.dimensions, 'user-B': self.dimensions}
        self.fake_kicad.pads_data = {'user-A': self.pads, 'user-B': self.pads}
        self.fake_kicad.load_files = mock.Mock()
        self.fake_kicad.cache_lock = __import__("threading").RLock()
        sys.modules[self.fake_kicad.__name__] = self.fake_kicad
        self.modules.package.kicad = self.fake_kicad
        self.web = self.modules.load('motor_web')
        self.app = Flask('offline_pcb_routes_' + uuid.uuid4().hex,
                         instance_path=str(self.directory / 'instance'))
        self.app.config.update(TESTING=True, SECRET_KEY='offline-test-secret')
        self.root = self.directory / 'controller'
        (self.root / 'zdt/wujing_usb_probe').mkdir(parents=True)
        (self.root / 'zdt/wujing_usb_probe/motorctl.py').write_text('# fake; never imported\n')
        self.coordinates_path = self.root / 'zdt/machine_coordinates/coordinates.json'
        self.coordinates_path.parent.mkdir()
        self.coordinates_path.write_text(json.dumps(self.controller.coordinates))
        with mock.patch.dict('os.environ', {'WUJING_MOTOR_ROOT': str(self.root)}):
            self.web.register_motor_control(self.app)
        self.popen = mock.Mock(side_effect=AssertionError('unexpected subprocess'))
        self.service = self.modules.service.MotorService(self.root, self.directory / 'jobs',
                                                        popen=self.popen, usb_lock_file=self.directory / 'usb.lock',
                                                        prepare_motion=lambda stopped: dict(command_verified=True))
        self.app.extensions['motor_service'] = self.service
        self.app.extensions['servo_service'] = types.SimpleNamespace()
        self.pcb = self.app.extensions['pcb_control']
        self.client = self.app.test_client()
        with self.client.session_transaction() as session:
            session['user_id'] = 'user-A'
            session['motion_enabled']=True
        self.headers = {'X-Requested-With': 'XMLHttpRequest', 'Origin': 'http://localhost'}
        self.started = []

        def deferred_thread(**kwargs):
            self.started.append(kwargs['args'])
            return mock.Mock()
        patch = mock.patch.object(self.modules.service.threading, 'Thread', side_effect=deferred_thread)
        patch.start()
        self.addCleanup(patch.stop)
        self.addCleanup(lambda: [args[1].close() for args in self.started])

    @staticmethod
    def pad(x, y, identifier, allowed=True):
        return dict(id=identifier, footprint_x=x, footprint_y=y, footprint_angle=0,
                    pad_x=0, pad_y=0, relative_angle=0, is_allowed=allowed, net='GND',size_x=1.,size_y=1.,shape='rect')

    def ready(self):
        self.service._state.update(connected=True, ready=True, busy=False,
                                   positions_mm=dict(self.controller.positions))

    def aligned(self):
        signature = self.modules.alignment.reference_id(self.controller.coordinates)
        self.pcb.store.record('left', {'x': 2, 'y': 100, 'reference_id': signature}, 'board-A', 0, 0)
        self.pcb.store.record('right', {'x': 90, 'y': 100, 'reference_id': signature}, 'board-A', 0, 1)

    def post(self, path, payload):
        return self.client.post('/motor/pcb/' + path, json=payload, headers=self.headers)

    def preview(self, left='pad-L', right=None):
        return self.post('preview', {'pads': {'left': left, 'right': right}, 'orientation': self.dimensions['orientation']})

    def preview_xy(self, left=None, right=None, frame='pcb_mm'):
        return self.post('preview-xy', {'layout_id': self.dimensions['layout_id'],
                                      'orientation': self.dimensions['orientation'],
                                      'coordinate_frame': frame,
                                      'points': {'left': left, 'right': right}})

    def test_xy_dual_preview_uses_existing_geometry_without_launching_worker(self):
        self.ready()
        self.aligned()
        response = self.preview_xy({'x': 20, 'y': 30}, {'x': 40, 'y': 50})
        self.assertEqual(response.status_code, 200)
        result = response.get_json()
        self.assertTrue(result['can_move'])
        self.assertEqual(result['targets'], {'1': 22, '3': 70, '2': 50, '4': 50})
        self.assertEqual(result['input_coordinate_frame'], 'pcb_mm')
        self.assertEqual(result['coordinate_frame'], 'rotated_pcb_mm')
        self.assertFalse(result['z_supported'])
        self.assertFalse(result['collision_checked'])
        self.assertEqual(self.started, [])
        self.popen.assert_not_called()

    def test_xy_original_frame_rotates_exactly_once_in_all_four_directions(self):
        self.ready()
        signature = self.modules.alignment.reference_id(self.controller.coordinates)
        expected = {0: {'x': 10, 'y': 20}, 90: {'x': 40, 'y': 10},
                    180: {'x': 90, 'y': 40}, 270: {'x': 20, 'y': 90}}
        for orientation, point in expected.items():
            with self.subTest(orientation=orientation):
                self.dimensions['orientation'] = orientation
                self.pcb.store.record('left', {'x': 2, 'y': 100, 'reference_id': signature},
                                      'board-A', orientation, self.pcb.store.read()['revision'])
                result = self.preview_xy({'x': 10, 'y': 20}).get_json()
                self.assertTrue(result['can_move'], result['errors'])
                self.assertEqual(result['points'], {'left': point})
                self.assertEqual(result['targets'], {'1': point['x'] + 2, '3': 100 - point['y']})
                already_rotated = self.preview_xy(point, frame='rotated_pcb_mm').get_json()
                self.assertEqual(already_rotated['points'], result['points'])
                self.assertEqual(already_rotated['targets'], result['targets'])
        self.assertEqual(self.started, [])

    def test_xy_frame_bounds_use_original_or_rotated_size_and_include_edges(self):
        self.ready()
        self.dimensions['orientation'] = 90
        self.assertEqual(self.preview_xy({'x': 100, 'y': 60}).status_code, 200)
        self.assertEqual(self.preview_xy({'x': 60, 'y': 100}, frame='rotated_pcb_mm').status_code, 200)
        self.assertEqual(self.preview_xy({'x': 61, 'y': 0}, frame='rotated_pcb_mm').status_code, 400)
        self.assertEqual(self.preview_xy({'x': 0, 'y': 61}).status_code, 400)
        self.assertEqual(self.preview_xy({'x': 0, 'y': 0}).get_json()['points'], {'left': {'x': 60, 'y': 0}})
        self.assertEqual(self.started, [])

    def test_xy_rejects_malformed_contract_and_nonfinite_or_boolean_coordinates(self):
        self.ready()
        self.aligned()
        valid = {'layout_id': 'board-A', 'orientation': 0, 'coordinate_frame': 'pcb_mm',
                 'points': {'left': {'x': 10, 'y': 20}, 'right': None}}
        invalid = [None, [], dict(valid, extra=True)]
        invalid.extend({k: v for k, v in valid.items() if k != missing} for missing in valid)
        invalid.extend(dict(valid, layout_id=value) for value in (True, None, 123, ''))
        invalid.extend(dict(valid, orientation=value) for value in (True, False, 0.0, 45, '0', None))
        invalid.extend(dict(valid, coordinate_frame=value) for value in (None, [], True, 'machine_mm', ''))
        invalid.extend(dict(valid, points=value) for value in (
            None, [], {'left': {'x': 10, 'y': 20}},
            {'left': None, 'right': None}, {'left': None, 'right': None, 'third': None}))
        bad_points = [False, [], 10, {'x': 1}, {'x': 1, 'y': 2, 'pad_id': 'pad-L'},
                      {'x': True, 'y': 2}, {'x': 1, 'y': False}, {'x': '10', 'y': 2},
                      {'x': float('nan'), 'y': 2}, {'x': 1, 'y': float('inf')},
                      {'x': -0.001, 'y': 2}, {'x': 100.001, 'y': 2}, {'x': 1, 'y': 60.001}]
        for probe in ('left', 'right'):
            for point in bad_points:
                item = copy.deepcopy(valid)
                item['points'][probe] = point
                invalid.append(item)
        for payload in invalid:
            with self.subTest(payload=payload):
                response = (self.client.post('/motor/pcb/preview-xy', data='null',
                                             content_type='application/json', headers=self.headers)
                            if payload is None else self.post('preview-xy', payload))
                self.assertEqual(response.status_code, 400)
        self.assertEqual(self.pcb.previews, {})
        self.assertEqual(self.started, [])
        self.popen.assert_not_called()

    def test_xy_rejects_stale_board_or_direction_before_creating_a_token(self):
        payload = {'layout_id': 'board-A', 'orientation': 0, 'coordinate_frame': 'pcb_mm',
                   'points': {'left': {'x': 10, 'y': 20}, 'right': None}}
        for change in ({'layout_id': 'board-B'}, {'orientation': 90}):
            with self.subTest(change=change):
                self.assertEqual(self.post('preview-xy', dict(payload, **change)).status_code, 409)
        self.assertEqual(self.pcb.previews, {})
        self.assertEqual(self.started, [])

    def test_xy_unaligned_or_unready_preview_is_not_executable(self):
        self.ready()
        result = self.preview_xy({'x': 10, 'y': 20}).get_json()
        self.assertFalse(result['can_move'])
        self.assertEqual(self.post('move', {'preview_id': result['preview_id']}).status_code, 409)
        self.aligned()
        self.service._state['ready'] = False
        result = self.preview_xy({'x': 10, 'y': 20}).get_json()
        self.assertFalse(result['can_move'])
        self.assertEqual(self.post('move', {'preview_id': result['preview_id']}).status_code, 409)
        self.assertEqual(self.started, [])

    def test_xy_board_bbox_does_not_override_machine_soft_limits(self):
        self.ready()
        self.aligned()
        # Valid PCB point, but the right carriage target would be 90-100=-10.
        result = self.preview_xy(right={'x': 100, 'y': 20}).get_json()
        self.assertFalse(result['can_move'])
        self.assertTrue(any('软限位' in error for error in result['errors']))
        self.assertEqual(self.post('move', {'preview_id': result['preview_id']}).status_code, 409)
        self.assertEqual(self.started, [])

    def test_xy_preview_keeps_same_origin_json_and_size_transport_guards(self):
        payload = {'layout_id': 'board-A', 'orientation': 0, 'coordinate_frame': 'pcb_mm',
                   'points': {'left': {'x': 10, 'y': 20}, 'right': None}}
        path = '/motor/pcb/preview-xy'
        self.assertEqual(self.client.post(path, json=payload).status_code, 403)
        headers = dict(self.headers, Origin='http://other-host')
        self.assertEqual(self.client.post(path, json=payload, headers=headers).status_code, 403)
        self.assertEqual(self.client.post(path, data='{}', content_type='text/plain',
                                         headers=self.headers).status_code, 403)
        self.assertEqual(self.client.post(path, json=dict(payload, padding='x' * 2048),
                                         headers=self.headers).status_code, 413)
        self.assertEqual(self.pcb.previews, {})
        self.assertEqual(self.started, [])

    def test_xy_move_reuses_single_use_token_and_server_rotated_context(self):
        self.ready()
        signature = self.modules.alignment.reference_id(self.controller.coordinates)
        self.dimensions['orientation'] = 90
        self.pcb.store.record('right', {'x': 90, 'y': 100, 'reference_id': signature}, 'board-A', 90, 0)
        result = self.preview_xy(right={'x': 10, 'y': 20}).get_json()
        self.assertTrue(result['can_move'], result['errors'])
        token = {'preview_id': result['preview_id']}
        self.assertEqual(self.post('move', dict(token, x=99)).status_code, 400)
        self.assertEqual(self.post('move', token).status_code, 202)
        self.assertEqual(self.started[0][0]['action'], 'pads')
        self.assertEqual(self.started[0][0]['context']['points'], {'right': {'x': 40, 'y': 10}})
        self.assertEqual(self.post('move', token).status_code, 409)
        self.assertEqual(len(self.started), 1)
        self.popen.assert_not_called()

    def test_xy_token_keeps_expiry_session_and_revision_constraints(self):
        self.ready()
        self.aligned()
        for change in ('expired', 'session', 'revision'):
            with self.subTest(change=change):
                result = self.preview_xy({'x': 10, 'y': 20}).get_json()
                self.assertTrue(result['can_move'])
                if change == 'expired':
                    self.pcb.previews[result['preview_id']]['created'] -= 121
                elif change == 'session':
                    with self.client.session_transaction() as session:
                        session['user_id'] = 'user-B'
                else:
                    self.pcb.store.save_offsets(zero_offsets(), result['revision'])
                self.assertEqual(self.post('move', {'preview_id': result['preview_id']}).status_code, 409)
                with self.client.session_transaction() as session:
                    session['user_id'] = 'user-A'
        self.assertEqual(self.started, [])

    def test_xy_token_keeps_board_orientation_mode_stop_and_readiness_constraints(self):
        self.ready()
        self.aligned()
        for change in ('layout', 'orientation', 'offline', 'stop', 'unready'):
            with self.subTest(change=change):
                result = self.preview_xy({'x': 10, 'y': 20}).get_json()
                self.assertTrue(result['can_move'])
                if change == 'layout':
                    self.dimensions['layout_id'] = 'board-B'
                elif change == 'orientation':
                    self.dimensions['orientation'] = 90
                elif change == 'offline':
                    with self.client.session_transaction() as session:
                        session['motion_enabled'] = False
                elif change == 'stop':
                    self.service.stop()
                else:
                    self.service._state['ready'] = False
                self.assertEqual(self.post('move', {'preview_id': result['preview_id']}).status_code, 409)
                self.dimensions.update(layout_id='board-A', orientation=0)
                with self.client.session_transaction() as session:
                    session['motion_enabled'] = True
                if self.service.stop_file.exists():
                    self.service.stop_file.unlink()
                self.ready()
        self.assertEqual(self.started, [])

    def test_get_config_and_four_offset_save_never_launch_a_worker(self):
        response = self.client.get('/motor/pcb/config')
        self.assertEqual(response.status_code, 200)
        value = {'left': {'x': 1, 'y': 2}, 'right': {'x': -3, 'y': -4}}
        response = self.post('config', {'offsets': value, 'revision': 0})
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.get_json()['offsets'], value)
        self.assertEqual(response.get_json()['revision'], 1)
        self.assertEqual(self.started, [])
        self.popen.assert_not_called()

    def test_unaligned_board_can_preview_but_cannot_move(self):
        self.ready()
        response = self.preview()
        self.assertEqual(response.status_code, 200)
        result = response.get_json()
        self.assertAlmostEqual(result['points']['left']['x'], 9.6)
        self.assertFalse(result['can_move'])
        self.assertEqual(self.post('move', {'preview_id': result['preview_id']}).status_code, 409)
        self.assertEqual(self.started, [])
        self.popen.assert_not_called()

    def test_preview_is_server_resolved_single_probe_and_has_no_motion(self):
        self.ready()
        self.aligned()
        response = self.preview(left='pad-L', right=None)
        self.assertEqual(response.status_code, 200)
        result = response.get_json()
        self.assertTrue(result['can_move'])
        self.assertEqual(set(result['points']), {'left'})
        self.assertAlmostEqual(result['points']['left']['x'], 9.6)
        self.assertEqual(result['points']['left']['y'], 20)
        self.assertAlmostEqual(result['targets']['1'],11.6)
        self.assertEqual(result['targets']['3'],80)
        self.assertEqual(self.started, [])
        self.popen.assert_not_called()

    def test_client_coordinates_unknown_pad_and_blocked_pad_are_rejected(self):
        self.ready()
        self.aligned()
        for left in ('not-in-this-board', 'blocked', {'pad_id': 'pad-L', 'x': 99, 'y': 99}):
            with self.subTest(left=left):
                self.assertEqual(self.preview(left=left).status_code, 400)
        self.assertEqual(self.post('preview', {'pads': {'left': 'pad-L', 'right': None}, 'orientation': 0,
                                               'x': 99}).status_code, 400)
        self.assertEqual(self.started, [])

    def test_move_dispatches_only_server_context_and_preview_is_single_use(self):
        self.ready()
        self.aligned()
        preview = self.preview().get_json()
        response = self.post('move', {'preview_id': preview['preview_id']})
        self.assertEqual(response.status_code, 202)
        payload = self.started[0][0]
        self.assertEqual(payload['action'], 'pads')
        self.assertAlmostEqual(payload['context']['points']['left']['x'],9.6)
        self.assertEqual(payload['context']['points']['left']['y'],20)
        self.assertEqual(set(payload['context']['profile']['anchors']), {'left', 'right'})
        self.assertNotIn(preview['preview_id'], self.pcb.previews)
        response = self.post('move', {'preview_id': preview['preview_id']})
        self.assertEqual(response.status_code, 409)
        self.assertIn('失效', response.get_json()['error'])
        self.assertEqual(len(self.started), 1)
        self.popen.assert_not_called()

    def test_move_cannot_override_preview_with_coordinates(self):
        self.ready()
        self.aligned()
        preview = self.preview().get_json()
        self.assertEqual(self.post('move', {'preview_id': preview['preview_id'], 'x': 99, 'y': 99}).status_code, 400)
        self.assertEqual(self.started, [])

    def test_expired_preview_cannot_move(self):
        self.ready()
        self.aligned()
        preview = self.preview().get_json()
        self.pcb.previews[preview['preview_id']]['created'] -= 121
        self.assertEqual(self.post('move', {'preview_id': preview['preview_id']}).status_code, 409)
        self.assertEqual(self.started, [])

    def test_cross_user_preview_cannot_move(self):
        self.ready()
        self.aligned()
        preview = self.preview().get_json()
        with self.client.session_transaction() as session:
            session['user_id'] = 'user-B'
        self.assertEqual(self.post('move', {'preview_id': preview['preview_id']}).status_code, 409)
        self.assertEqual(self.started, [])

    def test_offset_revision_change_invalidates_preview(self):
        self.ready()
        self.aligned()
        preview = self.preview().get_json()
        response = self.post('config', {'offsets': zero_offsets(), 'revision': preview['revision']})
        self.assertEqual(response.status_code, 200)
        self.assertEqual(self.post('move', {'preview_id': preview['preview_id']}).status_code, 409)
        self.assertEqual(self.started, [])

    def test_board_or_orientation_change_invalidates_preview(self):
        for change in ({'layout_id': 'board-B'}, {'orientation': 90}):
            with self.subTest(change=change):
                self.dimensions.update(layout_id='board-A', orientation=0)
                self.ready()
                if not self.pcb.store.read()['anchors']:
                    self.aligned()
                preview = self.preview().get_json()
                self.dimensions.update(change)
                self.assertEqual(self.post('move', {'preview_id': preview['preview_id']}).status_code, 409)
                self.assertEqual(self.client.get('/motor/pcb/config').get_json()['anchors'], {})
        self.assertEqual(self.started, [])

    def test_reference_change_hides_anchors_and_prevents_new_move_preview(self):
        self.ready()
        self.aligned()
        changed = self.controller.load_coordinates()
        changed['axes']['4']['origin']['origin_encoder_deg'] += 1
        self.coordinates_path.write_text(json.dumps(changed))
        self.assertEqual(self.client.get('/motor/pcb/config').get_json()['anchors'], {})
        self.assertFalse(self.preview().get_json()['can_move'])
        self.assertEqual(self.started, [])

    def test_legacy_mapping_profile_cannot_preview_motion_with_unchanged_origins(self):
        self.ready()
        old_signature = legacy_reference_id(self.controller.coordinates)
        for revision, probe in enumerate(('left', 'right')):
            self.pcb.store.record(probe, {'x': 2 if probe == 'left' else 90, 'y': 2,
                                          'reference_id': old_signature}, 'board-A', 0, revision)
        self.assertEqual(self.client.get('/motor/pcb/config').get_json()['anchors'], {})
        result = self.preview().get_json()
        self.assertFalse(result['can_move'])
        self.assertEqual(self.post('move', {'preview_id': result['preview_id']}).status_code, 409)
        self.assertEqual(self.started, [])

    def test_unchecked_machine_cannot_teach_or_move_even_with_valid_old_preview(self):
        self.aligned()
        response = self.post('teach', {'probe': 'left', 'pad_id': 'pad-L', 'orientation': 0, 'revision': 2})
        self.assertEqual(response.status_code, 409)
        self.ready()
        preview = self.preview().get_json()
        self.service._state['ready'] = False
        self.assertEqual(self.post('move', {'preview_id': preview['preview_id']}).status_code, 409)
        self.assertEqual(self.started, [])

    def test_teach_dispatches_readonly_job_with_server_point_and_persists_success_anchor(self):
        self.ready()
        response = self.post('teach', {'probe': 'left', 'pad_id': 'pad-L', 'orientation': 0, 'revision': 0})
        self.assertEqual(response.status_code, 202)
        payload, handle, on_success = self.started[0]
        self.assertEqual(payload['action'], 'teach')
        self.assertEqual(payload['context']['point'], {'x': 10, 'y': 20})
        self.assertEqual(self.pcb.store.read()['anchors'], {})
        anchor = {'x': 10, 'y': 10, 'reference_id': self.modules.alignment.reference_id(self.controller.coordinates),
                  'pad_id': 'pad-L','pcb_frame_version':2}
        on_success({'anchor': anchor})
        self.assertEqual(self.pcb.store.read()['anchors']['left'], anchor)
        self.assertEqual(self.pcb.store.read()['revision'], 1)
        self.popen.assert_not_called()

    def test_teach_rejects_an_explicitly_stale_layout_before_starting_read_job(self):
        response = self.post('teach', {'probe': 'left', 'pad_id': 'pad-L', 'orientation': 0,
                                       'revision': 0, 'layout_id': 'board-old'})
        self.assertEqual(response.status_code, 409)
        self.assertEqual(self.started, [])
        self.assertEqual(self.pcb.store.read()['revision'], 0)

    def test_teach_accepts_current_layout_and_keeps_centre_semantics(self):
        self.ready()
        response = self.post('teach', {'probe': 'left', 'pad_id': 'pad-L', 'orientation': 0,
                                       'revision': 0, 'layout_id': 'board-A'})
        self.assertEqual(response.status_code, 202)
        self.assertEqual(self.started[0][0]['action'], 'teach')
        self.assertEqual(self.started[0][0]['context']['point'], {'x': 10, 'y': 20})

    def test_stop_before_teach_callback_cancels_anchor_save(self):
        self.ready()
        response = self.post('teach', {'probe': 'left', 'pad_id': 'pad-L', 'orientation': 0, 'revision': 0})
        self.assertEqual(response.status_code, 202)
        self.service.stop()
        on_success = self.started[0][2]
        with self.assertRaisesRegex(ValueError, '停车'):
            on_success({'anchor': {'x': 10, 'y': 10}})
        self.assertEqual(self.pcb.store.read()['anchors'], {})


if __name__ == '__main__':
    unittest.main()
