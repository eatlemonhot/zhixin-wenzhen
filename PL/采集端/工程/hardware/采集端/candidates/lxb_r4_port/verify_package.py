from pathlib import Path
import hashlib
import json
import shutil
import zipfile
from review_boot import review

ROOT = Path(__file__).resolve().parents[4]
BASE = ROOT / 'outputs/checkpoint_110_hellofpga_migration_audit'
PACKAGE = BASE / 'package_lxb_r4_port1_a3'
OUT = BASE / 'package_verify_01'


def main():
    OUT.mkdir(exist_ok=False)
    manifest = json.loads((PACKAGE / 'package_manifest.json').read_text(encoding='utf-8'))
    for row in manifest['files']:
        path = PACKAGE / row['name']
        if hashlib.sha256(path.read_bytes()).hexdigest() != row['sha256'] or path.stat().st_size != row['bytes']:
            raise ValueError('候选包文件摘要不符：' + row['name'])
    with zipfile.ZipFile(BASE / (PACKAGE.name + '.zip')) as archive:
        if archive.testzip() is not None:
            raise ValueError('ZIP内部CRC错误')
        if set(archive.namelist()) != {path.name for path in PACKAGE.iterdir()}:
            raise ValueError('ZIP文件集合不同')
        for name in archive.namelist():
            if archive.read(name) != (PACKAGE / name).read_bytes():
                raise ValueError('ZIP内容与目录不同：' + name)
    boot = (PACKAGE / 'BOOT.bin').read_bytes()
    valid = json.loads((PACKAGE / 'boot_review.json').read_text(encoding='utf-8'))
    mutations = [('valid', None), ('bad_boot_header', 0x20),
                 ('bad_partition_header', valid['partitions'][0]['header_offset']),
                 ('bad_fsbl_payload', valid['partitions'][0]['offset']),
                 ('bad_pl_payload', valid['partitions'][1]['offset']),
                 ('bad_application_second_segment', valid['partitions'][-1]['offset'])]
    cases = []
    for name, position in mutations:
        folder = OUT / name
        folder.mkdir()
        for source in ['fsbl.elf', 'application.elf', 'system.bit']:
            shutil.copyfile(PACKAGE / source, folder / source)
        data = bytearray(boot)
        if position is not None:
            data[position] ^= 1
        (folder / 'BOOT.bin').write_bytes(data)
        rejected, error = False, ''
        try:
            review(folder)
        except ValueError as exc:
            rejected, error = True, str(exc)
        passed = rejected == (position is not None)
        cases.append({'case': name, 'passed': passed, 'rejected': rejected, 'reason': error})
        if not passed:
            raise ValueError('启动检查损坏注入结果不符合预期：' + name)
    result = {'passed': True, 'package': str(PACKAGE), 'file_count': len(manifest['files']),
              'zip_crc_and_exact_content_passed': True, 'boot_corruption_cases': cases,
              'new_board_programmed': False, 'flash_written': False}
    (OUT / 'verification.json').write_text(json.dumps(result, ensure_ascii=False, indent=2)+'\n', encoding='utf-8')
    print('LXB_PACKAGE_AND_BOOT_CORRUPTION_CHECKS_PASS')


if __name__ == '__main__':
    main()
