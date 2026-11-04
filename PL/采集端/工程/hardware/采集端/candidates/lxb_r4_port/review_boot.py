from pathlib import Path
import hashlib
import json
import struct
import sys

ROOT = Path(__file__).resolve().parents[4]
sys.path.insert(0, str(ROOT / 'tools'))
from review_7020_boot99 import elf_loads
from review_wujing_boot96 import bit_payload


def review(package):
    image = (package / 'BOOT.bin').read_bytes()
    u32 = lambda offset: struct.unpack_from('<I', image, offset)[0]
    if u32(32) != 0xaa995566 or u32(36) != 0x584c4e58:
        raise ValueError('启动头标识错误')
    if sum(struct.unpack_from('<11I', image, 32)) & 0xffffffff != 0xffffffff:
        raise ValueError('启动头校验和错误')
    iht, pht = u32(0x98), u32(0x9c)
    total = u32(iht + 4)
    if not 3 <= total <= 8 or u32(iht + 8) * 4 != pht:
        raise ValueError('分区总数或首偏移不合理')
    headers, images = [], []
    cursor = u32(iht + 12) * 4
    while cursor:
        if cursor in [row['offset'] for row in images] or len(images) >= 3:
            raise ValueError('镜像头链表重复或数量错误')
        raw = image[cursor + 16:cursor + 48]
        name = b''.join(raw[k:k + 4][::-1] for k in range(0, len(raw), 4)).split(b'\0')[0].decode('ascii')
        images.append({'offset': cursor, 'name': name, 'first_partition_header': u32(cursor + 4) * 4,
                       'partition_count': u32(cursor + 12)})
        cursor = u32(cursor) * 4
    if [row['name'] for row in images] != ['fsbl.elf', 'system.bit', 'application.elf']:
        raise ValueError('镜像名或顺序错误')
    if sum(row['partition_count'] for row in images) != total:
        raise ValueError('镜像分区数与总数不同')
    for i in range(total):
        words = struct.unpack_from('<16I', image, pht + 64 * i)
        if sum(words) & 0xffffffff != 0xffffffff:
            raise ValueError('分区头校验和错误')
        begin, length = words[5] * 4, words[1] * 4
        if not length or begin + length > len(image) or words[0] != words[1] or words[2] != words[1]:
            raise ValueError('分区长度、范围或加密属性错误')
        group = [row for row in images if row['offset'] == words[9] * 4]
        if len(group) != 1:
            raise ValueError('分区没有唯一所属镜像')
        headers.append({'header_offset': pht + 64 * i, 'image': group[0]['name'],
                        'offset': begin, 'bytes': length, 'load_address': words[3],
                        'entry_address': words[4], 'attributes': words[6],
                        'source_bytes_verified': 0, 'payload': image[begin:begin + length]})
    ranges = sorted((row['offset'], row['offset'] + row['bytes']) for row in headers)
    if any(left[1] > right[0] for left, right in zip(ranges, ranges[1:])):
        raise ValueError('分区负载重叠')
    for info in images:
        parts = [row for row in headers if row['image'] == info['name']]
        if len(parts) != info['partition_count'] or parts[0]['header_offset'] != info['first_partition_header']:
            raise ValueError('镜像分区分组错误')
        if info['name'].endswith('.elf'):
            entry, loads = elf_loads(package / info['name'])
            if any(row['attributes'] != 0x10 for row in parts) or parts[0]['entry_address'] != entry or any(row['entry_address'] != 0 for row in parts[1:]):
                raise ValueError('CPU执行地址或分区属性错误')
            for address, data in loads:
                matches = [row for row in parts if row['load_address'] <= address and address + len(data) <= row['load_address'] + row['bytes']]
                if len(matches) != 1:
                    raise ValueError('ELF装载段没有唯一对应分区')
                part = matches[0]
                offset = address - part['load_address']
                if part['payload'][offset:offset + len(data)] != data:
                    raise ValueError('ELF装载字节与BOOT不同')
                part['source_bytes_verified'] += len(data)
            if any(row['source_bytes_verified'] == 0 for row in parts):
                raise ValueError('发现无ELF装载来源的CPU分区')
        else:
            data = bit_payload(package / info['name'])
            swapped = b''.join(data[k:k + 4][::-1] for k in range(0, len(data), 4))
            if len(parts) != 1 or parts[0]['attributes'] != 0x20:
                raise ValueError('PL分区数量或属性错误')
            payload = parts[0]['payload']
            if not payload.startswith(swapped) or payload[len(swapped):] not in (b'', swapped[-4:]):
                raise ValueError('PL负载与位流不同')
            parts[0]['source_bytes_verified'] = len(swapped)
    for row in headers:
        row['sha256'] = hashlib.sha256(row.pop('payload')).hexdigest()
    result = {'passed': True, 'boot_bytes': len(image), 'boot_sha256': hashlib.sha256(image).hexdigest(),
              'image_count': len(images), 'partition_count': total, 'images': images, 'partitions': headers,
              'flash_written': False, 'coldstart_verified': False}
    (package / 'boot_review.json').write_text(json.dumps(result, ensure_ascii=False, indent=2)+'\n', encoding='utf-8')
    return result
