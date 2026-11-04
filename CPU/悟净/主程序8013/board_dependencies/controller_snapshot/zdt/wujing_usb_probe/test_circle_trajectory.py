import math
import unittest

from circle_trajectory import CircleTrajectory, validate_trajectory


def geometry():
    return dict(axes={str(a): dict(soft_min_mm=2, soft_max_mm=(199.2 if a < 3 else 157.1))
                      for a in (1, 2, 3, 4)},
                joint_x_limit=dict(max_combined_inward_mm=201.2))


class CircleTrajectoryTests(unittest.TestCase):
    def test_start_and_finish_are_stationary_at_park(self):
        trajectory = CircleTrajectory()
        self.assertEqual(trajectory.duration, 14)
        self.assertEqual((trajectory.circle_start, trajectory.circle_end), (2, 12))
        for t in (-1, 0, 14, 20):
            p, v, a = trajectory.sample(t)
            self.assertEqual(p, {axis: 2 for axis in (1, 2, 3, 4)})
            self.assertEqual(v, {axis: 0 for axis in (1, 2, 3, 4)})
            self.assertEqual(a, v)

    def test_c2_connections(self):
        trajectory = CircleTrajectory()
        epsilon = 1e-8
        for seam in (trajectory.circle_start, trajectory.circle_end):
            left, actual, right = (trajectory.sample(seam + delta) for delta in (-epsilon, 0, epsilon))
            for component in range(3):
                for axis in (1, 2, 3, 4):
                    self.assertAlmostEqual(left[component][axis], actual[component][axis], delta=0.0001)
                    self.assertAlmostEqual(right[component][axis], actual[component][axis], delta=0.0001)
        epsilon = 1e-6
        for t in (0.7, 1.4, 2, 3.2, 7.5, 12, 12.6, 13.3):
            p0, v0, _ = trajectory.sample(t - epsilon)
            p1, v1, _ = trajectory.sample(t + epsilon)
            _, v, a = trajectory.sample(t)
            for axis in (1, 2, 3, 4):
                self.assertAlmostEqual((p1[axis] - p0[axis]) / (2 * epsilon), v[axis], delta=0.001)
                self.assertAlmostEqual((v1[axis] - v0[axis]) / (2 * epsilon), a[axis], delta=0.001)

    def test_radius_and_nonzero_xy_speed(self):
        trajectory = CircleTrajectory()
        for index in range(1001):
            t = trajectory.circle_start + index * trajectory.period * trajectory.turns / 1000
            p, v, _ = trajectory.sample(t)
            for x, y in ((1, 4), (2, 3)):
                self.assertAlmostEqual(math.hypot(p[x] - 50, p[y] - 78), 40, places=10)
                self.assertAlmostEqual(math.hypot(v[x], v[y]), 40 * 2 * math.pi / 5, places=10)
            self.assertAlmostEqual(p[1] + p[2], 100, places=10)

    def test_all_paths_within_actual_geometry(self):
        result = validate_trajectory(geometry())
        self.assertTrue(result['passed'])
        self.assertGreaterEqual(result['sample_count'], 14001)
        self.assertAlmostEqual(result['independent_x_max_sum_mm'], 180)
        self.assertAlmostEqual(result['independent_x_clearance_mm'], 21.2)
        self.assertLess(max(result['peak_rpm'].values()), 200)
        for value in result['minimum_interior_xy_speed_mm_s'].values():
            self.assertGreater(value, 0)

    def test_unsafe_geometry_and_sampling_rejected(self):
        small = geometry()
        small['axes']['3']['soft_max_mm'] = 110
        with self.assertRaisesRegex(ValueError, 'soft limits'):
            validate_trajectory(small)
        narrow = geometry()
        narrow['joint_x_limit']['max_combined_inward_mm'] = 189
        with self.assertRaisesRegex(ValueError, 'independent-X'):
            validate_trajectory(narrow)
        for interval in (0, -1, 0.006, math.nan, math.inf, True):
            with self.assertRaises(ValueError):
                validate_trajectory(geometry(), step_s=interval)

    def test_invalid_inputs_rejected(self):
        for kwargs in (dict(radius=0), dict(period=-1), dict(turns=1.5), dict(turns=True),
                       dict(center_x=math.inf), dict(transition_s=0), dict(park_mm=True)):
            with self.assertRaises(ValueError):
                CircleTrajectory(**kwargs)
        for t in (math.nan, math.inf, True):
            with self.assertRaises(ValueError):
                CircleTrajectory().sample(t)


if __name__ == '__main__':
    unittest.main()
