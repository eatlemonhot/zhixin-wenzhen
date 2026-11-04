import csv
import io
import re

from .design_import import analyze_parts, parse_bom, header, ALIASES
from .pcb_import.model import ImportError


def analyze_native(board, project_name):
    blocking = []
    notes = []
    components = board.get('components', [])
    schematic = board.get('schematic', {}).get('components', [])
    by_pcb = {}
    for item in schematic:
        if item.get('pcb_component_id'):
            by_pcb.setdefault(item['pcb_component_id'], []).append(item)
        elif item.get('reference'):
            blocking.append('原理图器件未唯一关联PCB：' + str(item['reference']))
    pins = {}
    nets = {}
    for pad in board['pads'].values():
        ref, pin, net = str(pad.get('reference', '')).upper(), str(pad.get('pad_number', '')), str(pad.get('net', ''))
        if not ref or not pin or not net:
            continue
        key = (ref, pin)
        if key in pins and pins[key] != net:
            blocking.append('同编号焊盘连接冲突：%s.%s' % key)
            continue
        if key not in pins:
            nets.setdefault(net, []).append([ref, pin])
        pins[key] = net
    output = io.StringIO()
    writer = csv.writer(output)
    writer.writerow(['Designator', 'Value', 'Manufacturer Part', 'Manufacturer', 'Footprint', 'Tolerance', 'Supplier Part', 'DNP'])
    seen = set()
    for component in components:
        ref = str(component.get('reference', '')).upper()
        if not re.fullmatch(r'[\w.#-]+', ref) or ref in seen:
            blocking.append('PCB位号缺失、无效或重复：' + ref)
            continue
        seen.add(ref)
        matches = by_pcb.get(component['id'], [])
        attrs = {}
        for item in matches:
            attrs.update({k: v for k, v in item.get('attributes', {}).items() if v != ''})
        attrs.update(component.get('attributes', {}))
        lookup = {header(k): str(v) for k, v in attrs.items()}
        def field(key):
            return next((lookup[header(k)] for k in ALIASES[key] if lookup.get(header(k))), '')
        value = field('value') or component.get('value') or next((m.get('value') for m in matches if m.get('value')), '')
        tolerance = field('tolerance')
        if tolerance:
            normalized = tolerance.replace('±', '').replace('+/-', '').strip()
            try:
                relative = float(normalized[:-1]) / 100 if normalized.endswith('%') else float(normalized)
                if not 0 <= relative <= 1:
                    raise ValueError()
            except ValueError:
                blocking.append('工程容差无法解析：' + ref)
                tolerance = ''
        writer.writerow([ref, value, field('part'), field('manufacturer'), component.get('footprint', ''),
                         tolerance, field('lcsc'), field('dnp')])
    names = dict(project=project_name, parameters='epro2器件属性', connectivity='epro2 PCB PAD_NET')
    bom = parse_bom(output.getvalue().encode('utf-8'), 'native.csv') if seen else {}
    netlist = dict(nets=nets, pins=pins, components={})
    try:
        data = analyze_parts(board, netlist, bom, names, native=True)
    except ImportError as exc:
        blocking.append(str(exc))
        data = dict(schema='design-import/1.0', components=[], nets=sorted(nets),
                    net_aliases={n: n for n in nets}, bom=list(bom.values()), source_files=names, source_hashes={},
                    report=dict(connectivity_consistent=False, checked_pins=0, component_count=len(bom),
                                net_count=len(nets), missing_nominal_values=[], missing_tolerances=[], warnings=[],
                                blocking_issues=[], diagnostic_ready=False, hardware_execution_available=False))
    if not pins:
        blocking.append('工程没有可用于诊断的元件引脚网络。')
    for page in board.get('schematic', {}).get('pages', []):
        if page.get('wire_conflicts'):
            blocking.append('原理图导线与PCB关联存在冲突，请在嘉立创核对后重新导出。')
    report = data['report']
    report['blocking_issues'] = sorted(set(report.get('blocking_issues', []) + blocking))
    report['diagnostic_ready'] = not report['blocking_issues'] and not report['missing_nominal_values']
    report['connectivity_consistent'] = not report['blocking_issues']
    report['connectivity_source'] = 'native_pcb_pad_net'
    report['independent_netlist_checked'] = False
    notes.append('连接与器件参数均提取自同一epro2工程；未另行导入独立网表交叉校验。')
    report['warnings'] = list(dict.fromkeys([s.replace('BOM未给出','工程未给出').replace('BOM有','工程有')
                                           for s in report['warnings']] + notes + report['blocking_issues']))
    data['source_mode'] = 'native_epro2'
    return data
