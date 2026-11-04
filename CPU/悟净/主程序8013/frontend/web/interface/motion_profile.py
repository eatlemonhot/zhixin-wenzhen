import math

MAX_RPM = 300
ACCEL_RPM_S = 900
CURRENT_MA = {1: 3000, 2: 3000, 3: 1500, 4: 1500}
MM_PER_REV = 40.0


def axis_profiles(start, targets, max_rpm=MAX_RPM, accel_rpm_s=ACCEL_RPM_S):

    if any(isinstance(value,bool) or not isinstance(value,(int,float)) or not math.isfinite(value) or value<=0
           for value in (max_rpm,accel_rpm_s)) or max_rpm>MAX_RPM or accel_rpm_s>ACCEL_RPM_S:
        raise ValueError('运动包络必须为正数，且不能超过现有300RPM/900RPM/s上限。')
    longest = max(abs(goal - start[a]) for a, goal in targets.items())
    profiles = {}
    for a, goal in targets.items():
        ratio = abs(goal - start[a]) / longest
        profiles[a] = dict(speed_tenths=max(1, round(max_rpm * 10 * ratio)),
                           accel=max(1, round(accel_rpm_s * ratio)),
                           current_ma=CURRENT_MA[int(a)])
    return profiles


def travel_seconds(distance_mm, profile):
    speed = profile['speed_tenths'] / 10 * MM_PER_REV / 60
    accel = profile['accel'] * MM_PER_REV / 60
    distance = abs(distance_mm)
    return (2 * math.sqrt(distance / accel) if distance <= speed * speed / accel else
            distance / speed + speed / accel)
