import hashlib
from pathlib import Path
import struct


def elf_loads(path):
    data = path.read_bytes()
    if data[:7] != b'\x7fELF\x01\x01\x01':
        raise ValueError('ELF格式错误')
    entry, offset = struct.unpack_from('<II', data, 24)
    size, count = struct.unpack_from('<HH', data, 42)
    parts = []
    for index in range(count):
        kind, begin, _, physical, length, _, _, _ = struct.unpack_from('<8I', data, offset + index * size)
        if kind == 1 and length:
            parts.append((physical, data[begin:begin + length]))
    return entry, parts


def bit_payload(path):
    data = path.read_bytes()
    size = struct.unpack_from('>H', data)[0]
    position = 2 + size
    if data[position:position + 2] != b'\x00\x01':
        raise ValueError('位流格式错误')
    position += 2
    for key in b'abcd':
        if data[position] != key:
            raise ValueError('位流字段错误')
        length = struct.unpack_from('>H', data, position + 1)[0]
        position += 3 + length
    if data[position] != ord('e'):
        raise ValueError('位流字段错误')
    length = struct.unpack_from('>I', data, position + 1)[0]
    payload = data[position + 5:]
    if len(payload) != length or length % 4:
        raise ValueError('位流长度错误')
    return b''.join(payload[index:index + 4][::-1] for index in range(0, length, 4))


def review(package):
    package = Path(package)
    data = (package / 'BOOT.bin').read_bytes()
    u32 = lambda offset: struct.unpack_from('<I', data, offset)[0]
    if u32(32) != 0xaa995566 or u32(36) != 0x584c4e58 or sum(struct.unpack_from('<11I', data, 32)) & 0xffffffff != 0xffffffff:
        raise ValueError('启动头错误')
    iht, pht = u32(0x98), u32(0x9c)
    count = u32(iht + 4)
    if not 3 <= count <= 8 or u32(iht + 8) * 4 != pht:
        raise ValueError('分区数量错误')
    cursor = u32(iht + 12) * 4
    images = []
    while cursor:
        if len(images) >= 3 or cursor in [row['offset'] for row in images]:
            raise ValueError('镜像头错误')
        raw = data[cursor + 16:cursor + 48]
        name = b''.join(raw[index:index + 4][::-1] for index in range(0, 32, 4)).split(b'\0')[0].decode('ascii')
        images.append(dict(offset=cursor, name=name, first_partition_header=u32(cursor + 4) * 4, partition_count=u32(cursor + 12)))
        cursor = u32(cursor) * 4
    if [row['name'] for row in images] != ['fsbl.elf', 'system.bit', 'application.elf'] or sum(row['partition_count'] for row in images) != count:
        raise ValueError('镜像顺序错误')
    parts = []
    for index in range(count):
        offset = pht + 64 * index
        words = struct.unpack_from('<16I', data, offset)
        if sum(words) & 0xffffffff != 0xffffffff:
            raise ValueError('分区校验错误')
        begin, length = words[5] * 4, words[1] * 4
        matches = [row for row in images if row['offset'] == words[9] * 4]
        if len(matches) != 1 or not length or begin + length > len(data) or words[0] != words[1] or words[2] != words[1]:
            raise ValueError('分区范围错误')
        parts.append(dict(header_offset=offset, image=matches[0]['name'], offset=begin, bytes=length,
                          load_address=words[3], entry_address=words[4], attributes=words[6], source_bytes_verified=0,
                          payload=data[begin:begin + length]))
    spans = sorted((row['offset'], row['offset'] + row['bytes']) for row in parts)
    if any(left[1] > right[0] for left, right in zip(spans, spans[1:])):
        raise ValueError('分区重叠')
    for image in images:
        selected = [row for row in parts if row['image'] == image['name']]
        if len(selected) != image['partition_count'] or selected[0]['header_offset'] != image['first_partition_header']:
            raise ValueError('分区分组错误')
        if image['name'].endswith('.elf'):
            entry, loads = elf_loads(package / image['name'])
            if selected[0]['entry_address'] != entry or any(row['attributes'] != 16 for row in selected):
                raise ValueError('CPU入口错误')
            for address, payload in loads:
                matches = [row for row in selected if row['load_address'] <= address and address + len(payload) <= row['load_address'] + row['bytes']]
                if len(matches) != 1:
                    raise ValueError('CPU装载段错误')
                row = matches[0]
                offset = address - row['load_address']
                if row['payload'][offset:offset + len(payload)] != payload:
                    raise ValueError('CPU装载内容错误')
                row['source_bytes_verified'] += len(payload)
            if any(not row['source_bytes_verified'] for row in selected):
                raise ValueError('CPU装载内容错误')
        else:
            payload = bit_payload(package / image['name'])
            if len(selected) != 1 or selected[0]['attributes'] != 32 or not selected[0]['payload'].startswith(payload) or selected[0]['payload'][len(payload):] not in (b'', payload[-4:]):
                raise ValueError('PL装载内容错误')
            selected[0]['source_bytes_verified'] = len(payload)
    for row in parts:
        row['sha256'] = hashlib.sha256(row.pop('payload')).hexdigest()
    return dict(boot_bytes=len(data), boot_sha256=hashlib.sha256(data).hexdigest(), image_count=len(images),
                partition_count=count, images=images, partitions=parts)


if __name__ == '__main__':
    import json
    import sys
    print(json.dumps(review(Path(sys.argv[1])), ensure_ascii=False))
