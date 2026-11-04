import hashlib
import json
import math
import re
import struct
from pathlib import Path

MAX_STEP_BYTES = 32 * 1024 * 1024
MAX_MESH_BYTES = 64 * 1024 * 1024
MAX_MANIFEST_BYTES = 2 * 1024 * 1024
AUXILIARY = {'TopCopper', 'BottomCopper', 'TopSilkscreen', 'BottomSilkscreen',
             'TopFpcStiffener', 'BottomFpcStiffener'}


def finite(value):
    return isinstance(value, (int, float)) and not isinstance(value, bool) and math.isfinite(value)


def save_upload(upload, path, maximum):
    size = 0
    digest = hashlib.sha256()
    with Path(path).open('wb') as target:
        while True:
            chunk = upload.stream.read(65536)
            if not chunk:
                break
            size += len(chunk)
            if size > maximum:
                raise ValueError('文件超过允许大小（%d MB）。' % (maximum // 1048576))
            digest.update(chunk)
            target.write(chunk)
    if not size:
        raise ValueError('上传文件为空。')
    return size, digest.hexdigest()


def entities(path):
    record = []
    quoted = False
    with Path(path).open('r', encoding='utf-8-sig') as source:
        for line in source:
            if len(line) > 1048576:
                raise ValueError('STEP记录过长。')
            for char in line:
                record.append(char)
                if char == "'":
                    quoted = not quoted
                if char == ';' and not quoted:
                    value = ''.join(record).strip()
                    record = []
                    if value.startswith('#'):
                        match = re.fullmatch(r'#(\d+)\s*=\s*(.*);', value, re.S)
                        if not match:
                            raise ValueError('STEP实体记录损坏。')
                        yield int(match.group(1)), match.group(2).strip()
            if len(record) > 1048576:
                raise ValueError('STEP记录过长。')
    if quoted or ''.join(record).strip():
        raise ValueError('STEP记录未结束。')


def refs(value):
    return [int(n) for n in re.findall(r'#(\d+)', re.sub(r"'(?:[^']|'')*'", "''", value))]


def step_placements(path):
    """解析EasyEDA AP214装配位置。

    内存中保留产品与位置关系图，后续流式读取轴与点坐标以控制内存占用。"""
    with Path(path).open('rb') as handle:
        if not handle.read(64).lstrip().startswith(b'ISO-10303-21;'):
            raise ValueError('不是有效的STEP文件。')
        handle.seek(max(0, Path(path).stat().st_size - 256))
        if b'END-ISO-10303-21;' not in handle.read():
            raise ValueError('STEP文件未完整导出。')
    keep = ('PRODUCT(', 'PRODUCT_DEFINITION(', 'PRODUCT_DEFINITION_FORMATION(',
            'PRODUCT_DEFINITION_SHAPE(', 'NEXT_ASSEMBLY_USAGE_OCCURRENCE(',
            'CONTEXT_DEPENDENT_SHAPE_REPRESENTATION(', 'ITEM_DEFINED_TRANSFORMATION(')
    graph = {}
    units = 0
    for key, value in entities(path):
        if 'LENGTH_UNIT()' in value:
            if not re.search(r'SI_UNIT\(\s*\.MILLI\.\s*,\s*\.METRE\.\s*\)', value):
                raise ValueError('请使用嘉立创导出的毫米单位STEP装配。')
            units += 1
        if value.startswith(keep) or 'REPRESENTATION_RELATIONSHIP_WITH_TRANSFORMATION(' in value:
            graph[key] = value
            if len(graph) > 20000:
                raise ValueError('STEP装配层级过于复杂。')
    if not units:
        raise ValueError('无法确认STEP毫米单位。')

    def product_name(definition):
        formation = refs(graph[definition])[0]
        product = refs(graph[formation])[0]
        match = re.match(r"PRODUCT\(\s*'((?:[^']|'')*)'", graph[product])
        if not match:
            raise ValueError('STEP产品名称无法读取。')
        name=match.group(1).replace("''", "'")
        for prefix,encoding in [('X2','utf-16-be'),('X4','utf-32-be')]:
            name=re.sub(r'\\'+prefix+r'\\([0-9A-Fa-f]+)\\X0\\',lambda m:bytes.fromhex(m.group(1)).decode(encoding),name)
        return name

    links = []
    for value in graph.values():
        if not value.startswith('CONTEXT_DEPENDENT_SHAPE_REPRESENTATION('):
            continue
        relation, shape = refs(value)
        usage = graph[refs(graph[shape])[-1]]
        if not usage.startswith('NEXT_ASSEMBLY_USAGE_OCCURRENCE('):
            continue
        parent, child = refs(usage)
        transform = graph[refs(graph[relation])[-1]]
        if not transform.startswith('ITEM_DEFINED_TRANSFORMATION('):
            raise ValueError('STEP装配变换不支持。')
        source_axis, target_axis = refs(transform)
        links.append((parent, child, product_name(child), source_axis, target_axis))
    boards = [link for link in links if link[2].split('~')[0] == 'Board']
    if len(boards) != 1:
        raise ValueError('请导出单块PCB的STEP装配，并保留PCB基板。')
    root = boards[0][0]
    links = [link for link in links if link[0] == root]
    needed_axes = {axis for link in links for axis in link[3:]}
    axes = {key: refs(value) for key, value in entities(path)
            if key in needed_axes and value.startswith('AXIS2_PLACEMENT_3D(')}
    needed_vectors = {key for values in axes.values() for key in values}
    needed_points = {values[0] for values in axes.values()}
    vectors = {}
    for key, value in entities(path):
        if key not in needed_vectors:
            continue
        if not value.startswith('CARTESIAN_POINT(' if key in needed_points else 'DIRECTION('):
            raise ValueError('STEP装配点或方向类型错误。')
        match = re.search(r',\s*\(([^()]*)\)\s*\)', value)
        if not match:
            raise ValueError('STEP装配坐标无法读取。')
        numbers = [float(n.strip()) for n in match.group(1).split(',')]
        if len(numbers) != 3 or not all(finite(n) for n in numbers):
            raise ValueError('STEP装配坐标无效。')
        vectors[key] = numbers
    placements = {}
    for _, _, name, source, target in links:
        origin, z_axis, x_axis = [vectors[key] for key in axes[source]]
        if any(abs(a-b) > 1e-7 for a, b in zip(origin+z_axis+x_axis, [0, 0, 0, 0, 0, 1, 1, 0, 0])):
            raise ValueError('STEP装配使用了非标准基准，请从嘉立创重新导出。')
        point, z_axis, x_axis = [vectors[key] for key in axes[target]]
        reference = name.split('~')[0]
        if reference in placements:
            raise ValueError('STEP位号重复：' + reference)
        title=name.split('~')
        placements[reference] = dict(point=point, z_axis=z_axis, x_axis=x_axis, footprint=title[1] if len(title)>1 else '')
    board = placements.pop('Board')
    if any(abs(a-b) > 1e-7 for a, b in zip(board['point']+board['z_axis']+board['x_axis'], [0, 0, 0, 0, 0, 1, 1, 0, 0])):
        raise ValueError('STEP基板坐标与嘉立创原工程基准不同。')
    return {key: value for key, value in placements.items() if key not in AUXILIARY}


def match_placements(placements, board):
    expected = {c['reference']: c for c in board['components']}
    unknown = set(placements) - set(expected)
    if unknown:
        raise ValueError('STEP包含工程中不存在的位号：' + '、'.join(sorted(unknown)[:8]))
    if not placements:
        raise ValueError('STEP没有可匹配的元件装配，请勾选导出元件模型。')
    ox, oy = board['dimensions']['origin']
    maximum = 0.
    for ref, placement in placements.items():
        component = expected[ref]
        if component.get('footprint') and placement.get('footprint') != component['footprint']:
            raise ValueError('STEP与工程的%s封装不同，请导出同一版文件。' % ref)
        x, y, z = placement['point']
        delta = math.hypot(x-ox-component['x'], -y-oy-component['y'])
        if delta > .05:
            raise ValueError('STEP与工程的%s位置不同（相差%.3f mm），请导出同一版文件。' % (ref, delta))
        maximum = max(maximum, delta)
        za, xa = placement['z_axis'], placement['x_axis']
        sign = 1 if component['side'] == 'top' else -1
        if abs(za[0])+abs(za[1])+abs(za[2]-sign)+abs(xa[2]) > 1e-5:
            raise ValueError('STEP与工程的%s安装面或方向不同。' % ref)
        angle = math.degrees(math.atan2(xa[1], xa[0]))
        error = (angle-component['angle']+180) % 360-180
        if abs(error) > .1:
            raise ValueError('STEP与工程的%s旋转角度不同。' % ref)
    return maximum


def validate_mesh(model, binary_path, board, placements, source_name, source_sha, binary_sha):
    d = board['dimensions']
    if not isinstance(model, dict) or model.get('schema') != 'circuitscout.step-mesh/v1' or model.get('layout_id') != d['layout_id'] or model.get('units') != 'mm':
        raise ValueError('转换后的STEP没有绑定当前工程。')
    if model.get('coordinate_frame') != 'unrotated_pcb_mm_z_from_board_bottom' or model.get('source_origin_mm') != d['origin']:
        raise ValueError('STEP显示坐标基准错误。')
    for field, expected in [('width_mm', d['width']), ('height_mm', d['height'])]:
        if not finite(model.get(field)) or abs(model[field]-expected) > .001:
            raise ValueError('STEP与PCB板尺寸不同。')
    parts = model.get('parts')
    if not isinstance(parts, list) or not 2 <= len(parts) <= 2001:
        raise ValueError('STEP零件数量无效。')
    size = Path(binary_path).stat().st_size
    if size != model.get('binary_bytes') or not 0 < size <= MAX_MESH_BYTES:
        raise ValueError('STEP展示网格长度错误。')
    expected = {c['reference'] for c in board['components']}
    seen = set()
    cursor = 0
    substrate = None
    with Path(binary_path).open('rb') as source:
        for part in parts:
            if not isinstance(part, dict):
                raise ValueError('STEP零件记录无效。')
            reference, kind = part.get('reference'), part.get('kind')
            if not isinstance(reference, str) or reference in seen or kind not in ('board', 'component'):
                raise ValueError('STEP零件位号或类型无效。')
            if kind == 'board':
                if reference != 'Board' or substrate is not None:
                    raise ValueError('STEP基板重复或缺失。')
                substrate = part
            elif reference not in expected or reference not in placements:
                raise ValueError('STEP模型位号没有原始装配对应关系。')
            seen.add(reference)
            colors = part.get('colors')
            if not isinstance(colors, list) or not 1 <= len(colors) <= 256 or any(not isinstance(c, list) or len(c) != 3 or any(not finite(n) or not 0 <= n <= 1 for n in c) for c in colors):
                raise ValueError('STEP颜色数据无效。')
            extrema = [[float('inf')]*3, [float('-inf')]*3]
            for field, dtype in [('position', 'f32'), ('normal', 'f32'), ('index', 'u32')]:
                spec = part.get(field, {})
                if not isinstance(spec, dict):
                    raise ValueError('STEP网格记录无效。')
                count = spec.get('count')
                if type(count) is not int or count <= 0 or count % 3 or type(spec.get('offset')) is not int or spec.get('offset') != cursor or spec.get('type') != dtype or cursor+count*4 > size:
                    raise ValueError('STEP网格区间无效。')
                if field == 'normal' and count != part['position']['count']:
                    raise ValueError('STEP法线数量无效。')
                remaining = count
                position_index = 0
                while remaining:
                    chunk = source.read(min(remaining, 12288)*4)
                    if not chunk:
                        raise ValueError('STEP网格不完整。')
                    for (value,) in struct.iter_unpack('<I' if dtype == 'u32' else '<f', chunk):
                        if field == 'index':
                            if value >= part['position']['count']//3:
                                raise ValueError('STEP三角形索引越界。')
                        elif not finite(value) or abs(value) > (1e6 if field == 'position' else 1.01):
                            raise ValueError('STEP顶点或法线无效。')
                        if field == 'position':
                            axis = position_index % 3
                            extrema[0][axis] = min(extrema[0][axis], value)
                            extrema[1][axis] = max(extrema[1][axis], value)
                            position_index += 1
                    remaining -= len(chunk)//4
                cursor += count*4
            box = part.get('bounds', {})
            if not isinstance(box, dict):
                raise ValueError('STEP包围范围无效。')
            for label, measured in zip(['min', 'max'], extrema):
                declared = box.get(label)
                if not isinstance(declared, list) or len(declared) != 3 or any(not finite(n) or abs(n-measured[i]) > .0001 for i, n in enumerate(declared)):
                    raise ValueError('STEP包围范围与实际网格不同。')
            groups = part.get('groups')
            if not isinstance(groups, list) or not 1 <= len(groups) <= 256:
                raise ValueError('STEP材质分组无效。')
            covered = 0
            for group in groups:
                if not isinstance(group, dict):
                    raise ValueError('STEP材质记录无效。')
                count, material = group.get('count'), group.get('material')
                if group.get('start') != covered or type(count) is not int or count <= 0 or count % 3 or type(material) is not int or not 0 <= material < len(colors):
                    raise ValueError('STEP材质索引无效。')
                covered += count
            if covered != part['index']['count']:
                raise ValueError('STEP材质分组不完整。')
    if cursor != size or substrate is None:
        raise ValueError('STEP网格含未识别内容或没有基板。')
    box = substrate['bounds']
    if any(abs(n) > .05 for n in box['min']) or abs(box['max'][0]-d['width']) > .05 or abs(box['max'][1]-d['height']) > .05:
        raise ValueError('STEP基板与PCB板框或原点不同。')
    thickness = box['max'][2]-box['min'][2]
    if not .2 <= thickness <= 10:
        raise ValueError('STEP板厚不在0.2至10mm范围。')
    model.update(source=source_name, source_sha256=source_sha, binary_sha256=binary_sha,
                 binary='meshes.bin', board_thickness_mm=thickness, component_count=len(seen)-1,
                 missing_references=sorted(expected-(seen-{'Board'})))
    return model
