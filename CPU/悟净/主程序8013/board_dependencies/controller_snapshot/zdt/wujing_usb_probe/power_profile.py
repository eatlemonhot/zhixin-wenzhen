"""电机母线电压上限检查；软件欠压切断关闭。"""
import json
import math
from pathlib import Path

PROFILE_FILE = Path(__file__).with_name('motor_power.json')
# Project operating guard, not a firmware undervoltage setting. The vendor
# specifies 10..29 V at V+; telemetry is measured after the reverse-polarity
# diode. None explicitly disables the user-selected software lower cutoff.
# The documented V+ rating and drive firmware protections are unchanged.
PROFILES = {12: dict(nominal_v=12, minimum_v=None, maximum_v=13.5),
            16: dict(nominal_v=16, minimum_v=None, maximum_v=17.5)}
DEFAULT_PROFILE = PROFILES[12]


def load_power_profile(path=PROFILE_FILE):
    try:
        data = Path(path).read_text(encoding='utf-8')
    except FileNotFoundError:
        return dict(DEFAULT_PROFILE)
    setting = json.loads(data)
    if (not isinstance(setting, dict) or set(setting) != {'nominal_v'}
            or type(setting['nominal_v']) is not int or setting['nominal_v'] not in PROFILES):
        raise ValueError('Motor power profile must explicitly select nominal_v 12 or 16')
    return dict(PROFILES[setting['nominal_v']])


def voltage_in_profile(voltage_v, profile):
    """Keep valid nonnegative telemetry and overvoltage checks without a floor."""
    minimum = profile['minimum_v']
    return (math.isfinite(voltage_v) and 0 <= voltage_v <= profile['maximum_v']
            and (minimum is None or minimum <= voltage_v))


def validate_power_temperature(sample, profile):
    if (not voltage_in_profile(sample['voltage_v'], profile)
            or not -20 <= sample['temperature_c'] < 60):
        bounds = ('software undervoltage disabled; maximum %s V' % profile['maximum_v']
                  if profile['minimum_v'] is None else
                  '%s..%s V' % (profile['minimum_v'], profile['maximum_v']))
        raise RuntimeError('Supply/temperature outside %s V profile (%s): %s' %
                           (profile['nominal_v'], bounds, sample))
