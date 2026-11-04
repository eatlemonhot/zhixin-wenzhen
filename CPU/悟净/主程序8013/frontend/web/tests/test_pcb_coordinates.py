"""Pure offline geometry tests. No interface package, Flask, or hardware import."""
import copy
import importlib.util
import math
from pathlib import Path
import sys
import unittest


MODULE_PATH = Path(__file__).resolve().parents[1] / 'interface/pcb_coordinates.py'
spec = importlib.util.spec_from_file_location('_offline_pcb_coordinates', MODULE_PATH)
geometry = importlib.util.module_from_spec(spec)
spec.loader.exec_module(geometry)


def offsets(left=(0, 0), right=(0, 0)):
    return {'left': {'x': left[0], 'y': left[1]}, 'right': {'x': right[0], 'y': right[1]}}


def positions(a=20, b=30, c=40, d=50):
    return {'1': a, '2': b, '3': c, '4': d}


def coordinates(low=2, high=120, joint=150):
    return {'valid': True,
            'axes': {str(a): {'soft_min_mm': low, 'soft_max_mm': high} for a in range(1, 5)},
            'joint_x_limit': {'max_combined_inward_mm': joint}}


class PadPositionTests(unittest.TestCase):
    def setUp(self):
        self.pad = {'footprint_x': 10, 'footprint_y': 20, 'footprint_angle': 0,
                    'pad_x': 3, 'pad_y': 4, 'relative_angle': 0.7}
        self.dimensions = {'width': 100, 'height': 60, 'orientation': 0}

    def test_all_quarter_turns_on_non_square_board(self):
        expected = {0: (13, 24), 90: (36, 13), 180: (87, 36), 270: (24, 87)}
        for angle, point in expected.items():
            with self.subTest(angle=angle):
                self.dimensions['orientation'] = angle
                actual = geometry.pad_position(self.pad, self.dimensions)
                self.assertAlmostEqual(actual[0], point[0])
                self.assertAlmostEqual(actual[1], point[1])
                self.assertEqual(actual[2], 0.7)

    def test_footprint_rotation_precedes_board_rotation(self):
        self.pad['footprint_angle'] = 90
        expected = {0: (14, 17), 90: (43, 14), 180: (86, 43), 270: (17, 86)}
        for angle, point in expected.items():
            with self.subTest(angle=angle):
                self.dimensions['orientation'] = angle
                result = geometry.pad_position(self.pad, self.dimensions)
                self.assertAlmostEqual(result[0], point[0])
                self.assertAlmostEqual(result[1], point[1])

    def test_270_uses_width_for_y_normalization(self):
        self.dimensions['orientation'] = 270
        for point, expected in [((0, 0), (0, 100)), ((100, 60), (60, 0))]:
            self.pad.update(footprint_x=point[0], footprint_y=point[1], pad_x=0, pad_y=0)
            self.assertEqual(geometry.pad_position(self.pad, self.dimensions)[:2], expected)

    def test_arbitrary_footprint_angle_and_local_relative_angle(self):
        self.pad.update(footprint_angle=45, pad_x=math.sqrt(2), pad_y=0, relative_angle=-1.2)
        result = geometry.pad_position(self.pad, self.dimensions)
        self.assertAlmostEqual(result[0], 11)
        self.assertAlmostEqual(result[1], 19)
        self.assertEqual(result[2], -1.2)

    def test_invalid_dimensions_and_pad_values_raise_chinese_value_error(self):
        for dimensions in (None, {}, dict(self.dimensions, width=0), dict(self.dimensions, height=-1),
                           dict(self.dimensions, orientation=45), dict(self.dimensions, orientation=True),
                           dict(self.dimensions, width=math.nan)):
            with self.subTest(dimensions=dimensions), self.assertRaises(ValueError):
                geometry.pad_position(self.pad, dimensions)
        for key in self.pad:
            invalid = dict(self.pad, **{key: math.inf})
            with self.subTest(key=key), self.assertRaises(ValueError):
                geometry.pad_position(invalid, self.dimensions)


class ExternalPointTests(unittest.TestCase):
    def test_external_point_transform_does_not_mutate_inputs(self):
        point = {'x': 12.5, 'y': 40}
        dimensions = {'width': 100, 'height': 60, 'orientation': 270}
        original = copy.deepcopy((point, dimensions))
        self.assertEqual(geometry.pcb_point_position(point, dimensions, 'pcb_mm'), {'x': 40, 'y': 87.5})
        self.assertEqual((point, dimensions), original)

    def test_external_points_reject_invalid_geometry_and_numeric_overflow(self):
        dimensions = {'width': 100, 'height': 60, 'orientation': 0}
        for invalid in (None, {}, dict(dimensions, width=0), dict(dimensions, height=-1),
                        dict(dimensions, width=math.nan), dict(dimensions, orientation=True),
                        dict(dimensions, orientation=90.0), dict(dimensions, orientation=45)):
            with self.subTest(dimensions=invalid), self.assertRaises(ValueError):
                geometry.pcb_point_position({'x': 1, 'y': 2}, invalid, 'pcb_mm')
        with self.assertRaises(ValueError):
            geometry.pcb_point_position({'x': 10 ** 1000, 'y': 2}, dimensions, 'pcb_mm')


class AnchorTests(unittest.TestCase):
    def test_offsets_normalize_without_mutating_input(self):
        source = offsets(left=(100, -100), right=(0.5, -0.5))
        actual = geometry.validate_offsets(source)
        self.assertEqual(actual, source)
        self.assertIsNot(actual, source)
        self.assertIsInstance(actual['left']['x'], float)
        actual['left']['x'] = 0
        self.assertEqual(source['left']['x'], 100)

    def test_offsets_reject_wrong_shapes_types_and_bounds(self):
        for value in (None, {}, {'left': {'x': 0, 'y': 0}}, dict(offsets(), third={}),
                      {'left': {'x': 0}, 'right': {'x': 0, 'y': 0}},
                      {'left': {'x': 0, 'y': 0, 'z': 0}, 'right': {'x': 0, 'y': 0}}):
            with self.subTest(value=value), self.assertRaises(ValueError):
                geometry.validate_offsets(value)
        for number in (True, False, '0', None, math.nan, math.inf, -100.01, 100.01, 10 ** 1000):
            with self.subTest(number=repr(number)), self.assertRaises(ValueError):
                geometry.validate_offsets(offsets(left=(number, 0)))

    def test_left_and_right_signs_keep_probe_identity(self):
        profile = {'anchors': {'left': {'x': 10, 'y': 15}, 'right': {'x': 100, 'y': 18}},
                   'offsets': offsets(left=(2, -3), right=(-4, 5))}
        actual = geometry.build_targets({'left': {'x': 20, 'y': 30}, 'right': {'x': 40, 'y': 50}}, profile)
        self.assertEqual(actual, {'1': 32, '3': -18, '2': 64, '4': -27})
        actual = geometry.build_targets({'left': {'x': 80, 'y': 30}, 'right': {'x': 10, 'y': 50}}, profile)
        self.assertEqual(actual['1'], 92)
        self.assertEqual(actual['2'], 94)

    def test_teach_round_trip_with_nonzero_per_probe_offsets(self):
        current = positions()
        compensation = offsets(left=(2.5, -3), right=(-4, 5.5))
        points = {'left': {'x': 12, 'y': 17}, 'right': {'x': 23, 'y': 19}}
        anchors = {probe: geometry.teach_anchor(probe, point, current, compensation)
                   for probe, point in points.items()}
        self.assertEqual(anchors['left'], {'x': 5.5, 'y': 60})
        self.assertEqual(anchors['right'], {'x': 49, 'y': 63.5})
        self.assertEqual(geometry.build_targets(points, {'anchors': anchors, 'offsets': compensation}), current)

    def test_single_probe_requires_only_its_own_anchor(self):
        profile = {'anchors': {'left': {'x': 7, 'y': 8}}, 'offsets': offsets()}
        self.assertEqual(geometry.build_targets({'left': {'x': 4, 'y': 5}}, profile), {'1': 11, '3': 3})
        with self.assertRaises(ValueError):
            geometry.build_targets({'right': {'x': 4, 'y': 5}}, profile)

    def test_anchor_allows_reference_signature_and_teaching_metadata(self):
        profile = {'anchors': {'left': {'x': 7, 'y': 8, 'reference_id': 'verified123',
                                       'taught_pad': {'id': 'R1.1'}}}, 'offsets': offsets()}
        self.assertEqual(geometry.build_targets({'left': {'x': 4, 'y': 5}}, profile), {'1': 11, '3': 3})

    def test_confirmed_arm_addresses_and_common_x_direction(self):
        current = positions()
        point = {'x': 10, 'y': 12}
        anchors = {probe: geometry.teach_anchor(probe, point, current, offsets())
                   for probe in ('left', 'right')}
        profile = {'anchors': anchors, 'offsets': offsets()}
        actual = geometry.build_targets({'left': {'x': 11, 'y': 13},
                                         'right': {'x': 11, 'y': 13}}, profile)
        self.assertEqual(actual, {'1': 21, '2': 29, '3': 39, '4': 49})
        self.assertEqual(geometry.build_targets({'right': point}, profile), {'2': 30, '4': 50})

    def test_bad_points_anchors_and_teach_inputs_rejected(self):
        profile = {'anchors': {'left': {'x': 7, 'y': 8}}, 'offsets': offsets()}
        for value in ({}, None, {'middle': {'x': 0, 'y': 0}}, {'left': {'x': math.nan, 'y': 0}},
                      {'left': {'x': 1, 'y': 2, 'z': 3}}):
            with self.subTest(points=value), self.assertRaises(ValueError):
                geometry.build_targets(value, profile)
        for probe, point, current in [('middle', {'x': 0, 'y': 0}, positions()),
                                      ('left', {'x': True, 'y': 0}, positions()),
                                      ('right', {'x': 0, 'y': 0}, {'1': 5, '4': 6})]:
            with self.subTest(probe=probe, point=point), self.assertRaises(ValueError):
                geometry.teach_anchor(probe, point, current, offsets())
        with self.assertRaises(ValueError):
            geometry.build_targets({'left': {'x': 0, 'y': 0}}, {'anchors': {'left': None}, 'offsets': offsets()})


class MovePlanTests(unittest.TestCase):
    def test_outward_x_before_y_before_inward_x_avoids_intermediate_collision(self):
        current = positions(a=80, b=20)
        targets = {'2': 80, '4': 60, '1': 30, '3': 45}
        original = copy.deepcopy((current, targets))
        result = geometry.plan_moves(current, targets, coordinates(joint=110))
        self.assertEqual([item['address'] for item in result], [1, 3, 4, 2])
        simulated = dict(current)
        self.assertGreater(current['1'] + targets['2'], 110)
        for move in result:
            simulated[str(move['address'])] = move['target_mm']
            self.assertLessEqual(simulated['1'] + simulated['2'], 110)
        self.assertEqual(simulated, targets)
        self.assertEqual((current, targets), original)

    def test_single_probe_target_leaves_other_arm_unchanged(self):
        result = geometry.plan_moves(positions(), {'1': 35, '3': 45}, coordinates())
        self.assertEqual(result, [{'address': 3, 'target_mm': 45.0}, {'address': 1, 'target_mm': 35.0}])

    def test_position_quantization_matches_existing_controller(self):
        result = geometry.plan_moves(positions(), {'3': 40.1234}, coordinates())
        self.assertEqual(result, [{'address': 3, 'target_mm': round(40.1234 * 90) / 90}])

    def test_settled_axes_are_skipped(self):
        self.assertEqual(geometry.plan_moves(positions(), {'1': 20.04, '3': 40}, coordinates()), [])

    def test_current_position_tolerance_does_not_relax_target_limits(self):
        self.assertEqual(geometry.plan_moves(positions(a=1.86), {'3': 41}, coordinates()),
                         [{'address': 3, 'target_mm': 41.0}])
        with self.assertRaises(ValueError):
            geometry.plan_moves(positions(a=1.84), {'3': 41}, coordinates())
        for target in (1.99, 120.01):
            with self.subTest(target=target), self.assertRaises(ValueError):
                geometry.plan_moves(positions(), {'3': target}, coordinates())

    def test_quantization_cannot_round_outside_soft_limits(self):
        custom = coordinates()
        custom['axes']['3']['soft_min_mm'] = 2.001
        with self.assertRaisesRegex(ValueError, '量化'):
            geometry.plan_moves(positions(), {'3': 2.002}, custom)
        custom = coordinates()
        custom['axes']['3']['soft_max_mm'] = 119.999
        with self.assertRaisesRegex(ValueError, '量化'):
            geometry.plan_moves(positions(), {'3': 119.998}, custom)

    def test_final_combined_x_limit_includes_untargeted_arm(self):
        with self.assertRaisesRegex(ValueError, '最终双X'):
            geometry.plan_moves(positions(a=80, b=20), {'2': 31}, coordinates(joint=110))
        with self.assertRaisesRegex(ValueError, '最终双X'):
            geometry.plan_moves(positions(), {'1': 80, '2': 80}, coordinates(joint=150))

    def test_initial_combined_x_limit_is_also_required(self):
        with self.assertRaisesRegex(ValueError, '当前双X'):
            geometry.plan_moves(positions(a=80, b=40), {'1': 20}, coordinates(joint=110))

    def test_skipped_tiny_outward_move_cannot_hide_intermediate_collision(self):
        current = positions(a=50, b=49.97777777777778)
        with self.assertRaisesRegex(ValueError, '中间位置'):
            geometry.plan_moves(current, {'1': 49.955555555555556, '2': 50.044444444444444},
                                coordinates(joint=100))

    def test_invalid_targets_and_current_values_are_rejected(self):
        for targets in ({}, None, [], {'5': 10}, {1: 10}, {'1': True}, {'1': math.nan},
                        {'2': math.inf}, {'3': '10'}, {'4': 10 ** 1000}):
            with self.subTest(targets=targets), self.assertRaises(ValueError):
                geometry.plan_moves(positions(), targets, coordinates())
        for current in ({}, {1: 20, '2': 30, '3': 40, '4': 50}, positions(a=True),
                        positions(c=math.nan), positions(d=121)):
            with self.subTest(current=current), self.assertRaises(ValueError):
                geometry.plan_moves(current, {'3': 41}, coordinates())

    def test_invalid_limit_profiles_raise_value_error(self):
        for custom in (None, {}, {'axes': {}}, dict(coordinates(), joint_x_limit={})):
            with self.subTest(profile=custom), self.assertRaises(ValueError):
                geometry.plan_moves(positions(), {'3': 41}, custom)
        for lower, upper in [(10, 2), (True, 120), (2, math.inf)]:
            custom = coordinates()
            custom['axes']['2'].update(soft_min_mm=lower, soft_max_mm=upper)
            with self.subTest(lower=lower, upper=upper), self.assertRaises(ValueError):
                geometry.plan_moves(positions(), {'3': 41}, custom)

    def test_module_does_not_import_web_or_hardware_dependencies(self):
        self.assertEqual(set(name for name, value in vars(geometry).items()
                             if isinstance(value, type(sys))), {'math'})


if __name__ == '__main__':
    unittest.main()
