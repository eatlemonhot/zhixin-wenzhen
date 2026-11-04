"""自动抬针与测量周期共用各通道已保存的机械端点。"""
import json
import os
from pathlib import Path


def load_presets(settings_path=None):
    presets = {}
    if settings_path is None:
        folder = os.environ.get('FDW_INSTANCE_FOLDER')
        settings_path = Path(folder) / 'servo_positions.json' if folder else None
    if settings_path is not None and Path(settings_path).exists():
        saved = json.loads(Path(settings_path).read_text(encoding='utf-8'))
        if not isinstance(saved, dict) or set(saved) != {'channels'} or not isinstance(saved['channels'], dict):
            raise ValueError('舵机端点文件格式错误')
        for channel, preset in saved['channels'].items():
            if channel not in ('1', '2') or not isinstance(preset, dict) or set(preset) != {'up_us', 'down_us'}:
                raise ValueError('舵机通道或端点字段错误')
            if any(type(v) is not int or not 900 <= v <= 2100 for v in preset.values()):
                raise ValueError('舵机端点超出硬件允许范围')
            presets[int(channel)] = dict(preset)
    return presets


def require_cycle_positions(state, channels=3, presets=None):
    """只校验寄存器回读，不配置端点、不发送位置命令。"""
    if state.get('revision') != 124 or state.get('error_code'):
        raise RuntimeError('舵机版本或错误状态不允许启动测量周期')
    try:
        expected = load_presets() if presets is None else presets
    except (OSError, ValueError, TypeError) as exc:
        raise RuntimeError('已保存的舵机端点无法读取，请重新校准并保存。') from exc
    if any(channel not in expected for channel in (1, 2) if channels & channel):
        raise RuntimeError('请先校准并保存所选通道的抬落端点。')
    rows = state.get('channels', [])
    if len(rows) != 2 or {r.get('channel') for r in rows} != {1, 2}:
        raise RuntimeError('测量周期缺少双路舵机身份')
    for row in rows:
        if channels & (1 << (row['channel'] - 1)):
            target = expected[row['channel']]
            if any(row.get(k) != v for k, v in target.items()):
                raise RuntimeError('测量周期端点与自动抬针的已保存边界不一致')
