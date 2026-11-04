"""Pure four-axis mirrored circle plan, in millimetres and monotonic seconds.

The 2 s entry and exit are quintic Hermite curves matching position, velocity
and acceleration at the circle.  Sampling has no hardware or file side effects.
Individual motors naturally reverse at circle extrema; each XY carriage keeps
moving continuously between the overall start and finish.
"""
import math


AXES = (1, 2, 3, 4)
MM_PER_REV = 40.0
RPM_PER_MM_S = 60.0 / MM_PER_REV


def _quintic(p0, v0, a0, p1, v1, a1, duration):
    c0, c1, c2 = p0, v0 * duration, 0.5 * a0 * duration ** 2
    dp = p1 - c0 - c1 - c2
    dv = v1 * duration - c1 - 2 * c2
    da = a1 * duration ** 2 - 2 * c2
    return (c0, c1, c2, 10 * dp - 4 * dv + 0.5 * da,
            -15 * dp + 7 * dv - da, 6 * dp - 3 * dv + 0.5 * da)


def _evaluate(coefficients, u, duration):
    c0, c1, c2, c3, c4, c5 = coefficients
    position = c0 + u * (c1 + u * (c2 + u * (c3 + u * (c4 + u * c5))))
    velocity = (c1 + u * (2 * c2 + u * (3 * c3 + u * (4 * c4 + u * 5 * c5)))) / duration
    acceleration = (2 * c2 + u * (6 * c3 + u * (12 * c4 + u * 20 * c5))) / duration ** 2
    return position, velocity, acceleration


class CircleTrajectory:
    def __init__(self, center_x=50.0, center_y=78.0, radius=40.0,
                 period=5.0, turns=2, transition_s=2.0, park_mm=2.0):
        values = (center_x, center_y, radius, period, transition_s, park_mm)
        if any(isinstance(value, bool) or not math.isfinite(value) for value in values):
            raise ValueError('Trajectory parameters must be finite numbers')
        if min(radius, period, transition_s) <= 0:
            raise ValueError('Radius, period and transition must be positive')
        if isinstance(turns, bool) or not isinstance(turns, int) or turns < 1:
            raise ValueError('Turns must be a positive integer')
        self.center_x, self.center_y = float(center_x), float(center_y)
        self.radius, self.period = float(radius), float(period)
        self.turns, self.transition_s, self.park_mm = turns, float(transition_s), float(park_mm)
        self.angular_speed = 2 * math.pi / self.period
        self.circle_start = self.transition_s
        self.circle_end = self.circle_start + self.period * self.turns
        self.duration = self.circle_end + self.transition_s
        self.circle_parameters = dict(center_x_mm=self.center_x, center_y_mm=self.center_y,
                                      radius_mm=self.radius, period_s=self.period,
                                      turns=self.turns)
        boundary = self._circle(0.0)
        self._entry = {a: _quintic(self.park_mm, 0, 0, boundary[0][a], boundary[1][a],
                                  boundary[2][a], self.transition_s) for a in AXES}
        self._exit = {a: _quintic(boundary[0][a], boundary[1][a], boundary[2][a],
                                 self.park_mm, 0, 0, self.transition_s) for a in AXES}

    def _circle(self, elapsed):
        theta = self.angular_speed * elapsed
        c, s = math.cos(theta), math.sin(theta)
        r, w = self.radius, self.angular_speed
        return ({1: self.center_x + r * c, 2: self.center_x - r * c,
                 3: self.center_y + r * s, 4: self.center_y - r * s},
                {1: -r * w * s, 2: r * w * s, 3: r * w * c, 4: -r * w * c},
                {1: -r * w * w * c, 2: r * w * w * c,
                 3: -r * w * w * s, 4: r * w * w * s})

    def sample(self, t):
        if isinstance(t, bool) or not math.isfinite(t):
            raise ValueError('Sample time must be finite')
        if t <= 0 or t >= self.duration:
            return ({a: self.park_mm for a in AXES}, {a: 0.0 for a in AXES},
                    {a: 0.0 for a in AXES})
        if self.circle_start <= t <= self.circle_end:
            return self._circle(t - self.circle_start)
        coefficients, elapsed = ((self._entry, t) if t < self.circle_start
                                 else (self._exit, t - self.circle_end))
        values = {a: _evaluate(coefficients[a], elapsed / self.transition_s,
                               self.transition_s) for a in AXES}
        return tuple({a: values[a][index] for a in AXES} for index in range(3))


def validate_trajectory(coordinates, trajectory=None, step_s=0.001, maximum_rpm=200):
    """以不超过5 ms的间隔检查规划坐标及导数，并覆盖各轨迹分段边界。

    检查对象为规划几何；电机基准与实测跟踪误差由相应执行流程处理。"""
    trajectory = trajectory or CircleTrajectory()
    if type(maximum_rpm) is not int or maximum_rpm not in (200,300):
        raise ValueError('Trajectory speed ceiling must be 200 or 300 RPM')
    if (isinstance(step_s, bool) or not math.isfinite(step_s)
            or not 0 < step_s <= 0.005):
        raise ValueError('Validation interval must be positive and no greater than 5 ms')
    if trajectory.duration >= 30:
        raise ValueError('Trajectory alone must leave time within the 30 s rebuild budget')
    count = math.ceil(trajectory.duration / step_s)
    times = {trajectory.duration * index / count for index in range(count + 1)}
    times.update((0.0, trajectory.circle_start, trajectory.circle_end, trajectory.duration))
    minimum = {a: math.inf for a in AXES}
    maximum = {a: -math.inf for a in AXES}
    peak_rpm = {a: 0.0 for a in AXES}
    peak_accel = {a: 0.0 for a in AXES}
    max_sum = 0.0
    vector_min = {'left': math.inf, 'right': math.inf}
    circular_min = {'left': math.inf, 'right': math.inf}
    tolerance = 1e-8
    for t in sorted(times):
        positions, velocities, accelerations = trajectory.sample(t)
        for a in AXES:
            p, v, acceleration = positions[a], velocities[a], accelerations[a]
            if not all(math.isfinite(value) for value in (p, v, acceleration)):
                raise ValueError('Nonfinite trajectory state at t=%s' % t)
            item = coordinates['axes'][str(a)]
            if not item['soft_min_mm'] - tolerance <= p <= item['soft_max_mm'] + tolerance:
                raise ValueError('Axis %s exceeds soft limits at t=%.6f: %.9f mm' % (a, t, p))
            rpm, accel_rpm_s = abs(v) * RPM_PER_MM_S, abs(acceleration) * RPM_PER_MM_S
            if rpm > maximum_rpm + tolerance or accel_rpm_s > (1200 if a in (1, 2) else 2000) + tolerance:
                raise ValueError('Axis %s exceeds validated velocity/acceleration at t=%s' % (a, t))
            minimum[a], maximum[a] = min(minimum[a], p), max(maximum[a], p)
            peak_rpm[a], peak_accel[a] = max(peak_rpm[a], rpm), max(peak_accel[a], accel_rpm_s)
        max_sum = max(max_sum, positions[1] + positions[2])
        for name, x, y in (('left', 2, 3), ('right', 1, 4)):
            speed = math.hypot(velocities[x], velocities[y])
            if 0 < t < trajectory.duration:
                vector_min[name] = min(vector_min[name], speed)
                if speed <= 1e-9:
                    raise ValueError('%s XY carriage has an internal stop at t=%s' % (name, t))
            if trajectory.circle_start <= t <= trajectory.circle_end:
                circular_min[name] = min(circular_min[name], speed)
    independent_max = maximum[1] + maximum[2]
    joint_limit = coordinates['joint_x_limit']['max_combined_inward_mm']
    if independent_max > joint_limit - 10 + tolerance:
        raise ValueError('The full independent-X envelope lacks the required 10 mm reserve')
    return dict(passed=True, duration_s=trajectory.duration, sample_count=len(times),
                validation_interval_s=trajectory.duration / count,
                circle_start_s=trajectory.circle_start, circle_end_s=trajectory.circle_end,
                circle_parameters=trajectory.circle_parameters,
                position_min_mm=minimum, position_max_mm=maximum,
                peak_rpm=peak_rpm, peak_acceleration_rpm_s=peak_accel,
                max_simultaneous_x_sum_mm=max_sum,
                independent_x_max_sum_mm=independent_max,
                independent_x_clearance_mm=joint_limit - independent_max,
                minimum_interior_xy_speed_mm_s=vector_min,
                minimum_circle_xy_speed_mm_s=circular_min,
                planned_path_only=True, actual_tracking_verified=False)


validate_plan = validate_trajectory
