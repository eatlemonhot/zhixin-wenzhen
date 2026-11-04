from .common import need

MECHANICAL = {'left': {'servo_channel': 1, 'header_pin': 'J17-21'},
              'right': {'servo_channel': 2, 'header_pin': 'J17-23'}}


def terminal_map(left_terminal):
    need(left_terminal in ('TP_A', 'TP_B'), '必须核对左针实际连接TP_A还是TP_B，不能由舵机通道推断')
    return {'left': left_terminal, 'right': 'TP_B' if left_terminal == 'TP_A' else 'TP_A'}


def roles(dac_probe, left_terminal):
    need(dac_probe in MECHANICAL, 'DAC角色必须分配给left或right实体针')
    adc_probe = 'right' if dac_probe == 'left' else 'left'
    terminals = terminal_map(left_terminal)
    return dict(dac_probe=dac_probe, adc_probe=adc_probe,
                dac_channel=MECHANICAL[dac_probe]['servo_channel'],
                adc_channel=MECHANICAL[adc_probe]['servo_channel'],
                dac_terminal=terminals[dac_probe], adc_terminal=terminals[adc_probe],
                terminal_by_probe=terminals, relay_role_bits=1 if terminals[dac_probe] == 'TP_A' else 4)


def choose(action, current, profile, coordinates, geometry, left_terminal=None, allowed_role_bits=(1,4)):
    """使用行程与路径校验器比较两种合法探针分配。

    代价为各轴总行程，单位为毫米。软限位校验与针尖、器件避让分别处理。
    调用方传入实际接线映射、坐标参考与校准配置。"""
    need(isinstance(allowed_role_bits,(tuple,list)) and allowed_role_bits and all(type(v) is int and v in (1,4) for v in allowed_role_bits),'缺少合法的固件探针角色能力')
    candidates, rejected = [], []
    for dac_probe in ('left', 'right'):
        assignment = roles(dac_probe, left_terminal)
        if assignment['relay_role_bits'] not in allowed_role_bits:
            rejected.append(dict(dac_probe=dac_probe,reason='固件未声明支持此角色组合'));continue
        points = {dac_probe: action['excitation']['position_mm'],
                  assignment['adc_probe']: action['measurement']['position_mm']}
        try:
            targets = geometry.build_targets(points, profile)
            moves = geometry.plan_moves(current, targets, coordinates)
            distance = sum(abs(row['target_mm'] - current[str(row['address'])]) for row in moves)
            candidates.append(dict(assignment=assignment, targets=targets, moves=moves, axis_travel_mm=distance))
        except ValueError as exc:
            rejected.append(dict(dac_probe=dac_probe, reason=str(exc)))
    need(candidates, '两个探针角色分配均不可达：'+str(rejected))
    best = min(candidates, key=lambda row: (row['axis_travel_mm'], row['assignment']['dac_probe'] != 'left'))
    best['considered'] = [dict(dac_probe=row['assignment']['dac_probe'], axis_travel_mm=row['axis_travel_mm']) for row in candidates]
    best['rejected'] = rejected
    best['collision_clearance_verified'] = False
    return best
