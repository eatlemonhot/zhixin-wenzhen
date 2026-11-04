import argparse
import hashlib
import json
import os
from pathlib import Path
import shutil
import subprocess
import tempfile
from verify import review


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--toolchain', type=Path, default=Path('D:/Xilinx/2025.1/gnu/aarch32/nt/gcc-arm-none-eabi/bin'))
    parser.add_argument('--bootgen', type=Path, default=Path('D:/Xilinx/2025.1/Vivado/bin/unwrapped/win64.o/bootgen.exe'))
    args = parser.parse_args()
    root = Path(__file__).resolve().parent
    package = root.parents[1]
    src = package / 'CPU/悟净/主程序8013/integration_firmware/sense117_probe_roles/src'
    bsp = root / '配套平台/sw/standalone_ps7_cortexa9_0'
    cc = args.toolchain / ('arm-none-eabi-gcc.exe' if os.name == 'nt' else 'arm-none-eabi-gcc')
    libraries = args.bootgen.parents[3] / 'lib/win64.o'
    env = dict(os.environ, PATH=str(args.toolchain) + os.pathsep + str(libraries) + os.pathsep + os.environ['PATH'])
    env.setdefault('SOURCE_DATE_EPOCH', str(int(max(p.stat().st_mtime for p in src.iterdir() if p.is_file()))))
    with tempfile.TemporaryDirectory(prefix='probe_firmware_') as temporary:
        work = Path(temporary)
        shutil.copytree(src, work / 'src')
        shutil.copytree(bsp / 'include', work / 'include')
        shutil.copytree(bsp / 'lib', work / 'lib')
        flags = ['-mcpu=cortex-a9', '-mfpu=vfpv3', '-mfloat-abi=hard', '-DSDT', '-O2', '-g',
                 '-Wall', '-Wextra', '-ffunction-sections', '-fdata-sections', '-ffile-prefix-map=' + str(work) + '=.', '-Iinclude', '-Isrc']
        objects = []
        for source in sorted((work / 'src').glob('*')):
            if source.suffix not in ('.c', '.S'):
                continue
            target = source.with_suffix('.o').name
            command = [str(cc), *flags, '-c', str(source.relative_to(work)), '-o', target]
            subprocess.run(command, cwd=work, env=env, check=True)
            objects.append(target)
        startup = {}
        for name in ('crti.o', 'crtbegin.o', 'crtend.o', 'crtn.o'):
            startup[name] = subprocess.check_output([str(cc), *flags[:3], '-print-file-name=' + name], env=env, text=True).strip()
        command = [str(cc), *flags, '-nostartfiles', '-Wl,-u,_vector_table', '-Wl,--gc-sections', '-Wl,-Map=application.map', '-Tsrc/lscript.ld',
                   '-Llib', '-o', 'application.elf', startup['crti.o'], startup['crtbegin.o'], *objects, '-Wl,--start-group', '-llwip220', '-lxil',
                   '-lxiltimer', '-lxilstandalone', '-lgcc', '-lc', '-lm', '-Wl,--end-group', startup['crtend.o'], startup['crtn.o'], '-specs=nosys.specs']
        subprocess.run(command, cwd=work, env=env, check=True)
        shutil.copy2(root / '发布文件/fsbl.elf', work / 'fsbl.elf')
        shutil.copy2(package / 'PL/采集端/发布文件/system.bit', work / 'system.bit')
        (work / 'boot.bif').write_text('the_ROM_image:\n{\n[bootloader] fsbl.elf\nsystem.bit\napplication.elf\n}\n', encoding='ascii')
        subprocess.run([str(args.bootgen), '-arch', 'zynq', '-image', 'boot.bif', '-o', 'BOOT.bin', '-w', 'on'], cwd=work, env=env, check=True)
        for target in (root / '发布文件', package / 'PL/采集端/发布文件'):
            target.mkdir(parents=True, exist_ok=True)
            for name in ('application.elf', 'BOOT.bin', 'boot.bif', 'fsbl.elf', 'system.bit'):
                shutil.copy2(work / name, target / name)
            verified = review(target)
            (target / 'boot_review.json').write_text(json.dumps(verified, ensure_ascii=False, indent=2), encoding='utf-8')
        for source in src.iterdir():
            if source.is_file():
                shutil.copy2(source, root / '固件源码' / source.name)
        manifest = dict(schema='probe-firmware-build/1.0', board_revision='LXB-R4-SENSE117', sense_protocol=1,
                        role_masks=[1, 4], source_sha256={p.name: hashlib.sha256(p.read_bytes()).hexdigest() for p in src.iterdir() if p.is_file()},
                        files={name: hashlib.sha256((work / name).read_bytes()).hexdigest() for name in ('application.elf', 'BOOT.bin', 'system.bit')})
        (root / '构建来源.json').write_text(json.dumps(manifest, ensure_ascii=False, indent=2), encoding='utf-8')
        print(json.dumps(manifest['files']))


if __name__ == '__main__':
    main()
