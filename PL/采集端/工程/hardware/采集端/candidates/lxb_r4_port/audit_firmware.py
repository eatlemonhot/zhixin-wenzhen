from pathlib import Path
import hashlib
import json
import re
import subprocess
import argparse

ROOT = Path(__file__).resolve().parents[4]
BASE = ROOT / 'outputs/checkpoint_110_hellofpga_migration_audit'
FIRMWARE = None
SRC = ROOT / 'software/7020/candidates/lxb_r4_port/src'
PLATFORM = ROOT / 'software/7020/vitis/fdw_pwm_lxb110_platform'


def main():
    global FIRMWARE
    parser = argparse.ArgumentParser()
    parser.add_argument('--firmware', required=True)
    args = parser.parse_args()
    if not re.fullmatch(r'firmware_\d+', args.firmware):
        raise ValueError('固件目录标识不合法')
    FIRMWARE = BASE / args.firmware
    destination = FIRMWARE / 'irq_and_memory_audit.json'
    if destination.exists():
        raise FileExistsError('审查结果已存在，避免覆盖历史证据')
    tool = 'D:/Xilinx/2025.1/Vitis/gnu/aarch32/nt/gcc-arm-none-eabi/bin/arm-none-eabi-objdump.exe'
    elf = FIRMWARE / 'fdw_pwm_app.elf'
    full = subprocess.check_output([tool, '-d', str(elf)]).decode().replace('\r\n', '\n')
    (FIRMWARE / 'full_disassembly.txt').write_text(full, encoding='utf-8')
    checks = {}
    for name, end in [('IRQHandler', 'FIQHandler'), ('FIQHandler', 'Undefined')]:
        match = re.search(r'<' + name + r'>:\n(.*?)^[0-9a-f]+ <' + end + r'>:', full, flags=re.M | re.S)
        if not match:
            raise ValueError('异常入口范围不完整：' + name)
        body = match.group(1).lower()
        checks[name] = all(item in body for item in ['vpush', 'vpop', 'd0-d7', 'd16-d31', 'fpscr', 'fpexc'])
    vendor = PLATFORM / 'ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/standalone/src/arm/cortexa9/gcc/asm_vectors.S'
    prefix = '/* R4-P1：官方IRQ/FIQ入口保存浮点现场，避免中断破坏硬浮点memcpy。 */\n#define FPU_HARD_FLOAT_ABI_ENABLED 1\n'
    checks['official_body_byte_exact'] = (SRC / 'fdw_irq_vectors.S').read_bytes() == prefix.encode('utf-8') + vendor.read_bytes()
    checks['ddr_512_mib_linker'] = 'LENGTH = 0x1ff00000' in (SRC / 'lscript.ld').read_text(encoding='utf-8')
    sections = subprocess.check_output([tool, '-h', str(elf)]).decode()
    (FIRMWARE / 'elf_sections.txt').write_text(sections, encoding='utf-8')
    mapped = []
    for line in sections.splitlines():
        match = re.match(r'\s*\d+\s+(\S+)\s+([0-9a-fA-F]+)\s+([0-9a-fA-F]+)\s+([0-9a-fA-F]+)', line)
        if match:
            name, length, vma, lma = match.groups()
            if int(vma, 16):
                mapped.append({'section': name, 'vma': int(vma, 16), 'size': int(length, 16)})
    checks['elf_sections_within_ddr'] = bool(mapped) and all(0x100000 <= x['vma'] and x['vma'] + x['size'] <= 0x20000000 for x in mapped)
    protected = json.loads((BASE / 'protected_sources_before.json').read_text(encoding='utf-8'))
    changed = [item['file'] for item in protected if hashlib.sha256(Path(item['file']).read_bytes()).hexdigest() != item['sha256']]
    checks['protected_sources_unchanged'] = not changed
    if (SRC / 'fdw_lxb_physpeed.c').exists():
        checks['phy_configuration_called'] = bool(re.search(r'bl\s+[0-9a-f]+ <fdw_lxb_phy_delays>', full))
        vendor_phy = PLATFORM / 'ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/lwip220/src/lwip-2.2.0/contrib/ports/xilinx/netif/xemacpsif_physpeed.c'
        local = (SRC / 'fdw_lxb_physpeed.c').read_text(encoding='utf-8')
        hook = '''
    /* 新板收发延时必须在每次官方软复位后重新配置，包含断线重连。 */
    if (fdw_lxb_phy_delays(xemacpsp, phy_addr) != 0) {
        xil_printf("LXB PHY delay configuration failed\\r\\n");
        return XST_FAILURE;
    }
'''
        unused = '#ifdef SDT\n    /* SDT 分支不使用分频参数，显式标注以保持严格警告编译。 */\n    (void)mac_baseaddr;\n    (void)speed;\n#endif\n'
        assert local.count('\n' + hook) == 1 and local.count(unused) == 1
        restored = local.removeprefix('#include "fdw_lxb_phy.h"\n').replace('\n' + hook, '', 1).replace(unused, '', 1)
        full_duplex = '\t/* 新板桥接 IP 使用全双工，禁止协商成半双工。 */\n\tcontrol = fdw_lxb_phy_full_duplex(control, 0U);\n'
        restored = restored.replace(full_duplex, '', 1).replace('\tcontrol = fdw_lxb_phy_full_duplex(control, 1U);\n', '', 1)
        checks['remaining_official_phy_code_unchanged'] = restored == vendor_phy.read_text(encoding='utf-8')
    report = {'passed': all(checks.values()), 'checks': checks, 'mapped_sections': mapped,
              'protected_file_count': len(protected), 'changed_protected_files': changed,
              'elf_sha256': hashlib.sha256(elf.read_bytes()).hexdigest(), 'new_board_tested': False}
    destination.write_text(json.dumps(report, ensure_ascii=False, indent=2) + '\n', encoding='utf-8')
    if not report['passed']:
        raise ValueError('审查未通过，请查看输出记录')
    print('LXB_FIRMWARE_AUDIT_PASS')


if __name__ == '__main__':
    main()
