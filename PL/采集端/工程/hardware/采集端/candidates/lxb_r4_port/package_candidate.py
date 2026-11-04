from pathlib import Path
import argparse
import csv
import hashlib
import importlib
import json
import os
import re
import shutil
import subprocess
import sys
import zipfile

ROOT = Path(__file__).resolve().parents[4]
BASE = ROOT / 'outputs/checkpoint_110_hellofpga_migration_audit'
HW = Path(__file__).resolve().parent
FW = ROOT / 'software/7020/candidates/lxb_r4_port/src'


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--implementation', required=True)
    parser.add_argument('--package', default='package_lxb_r4_port1')
    parser.add_argument('--audit-only', action='store_true')
    args = parser.parse_args()
    if not re.fullmatch(r'implementation_\d+', args.implementation) or not re.fullmatch(r'package_[a-z0-9_]+', args.package):
        raise ValueError('目录标识不合法')
    impl = BASE / args.implementation
    package = BASE / args.package
    if package.exists():
        raise FileExistsError('候选包目录已存在，禁止覆盖')
    for path in ['platform_01/构建记录.json', 'firmware_05/build_manifest.json',
                 'firmware_05/irq_and_memory_audit.json', 'probe_rtl_test_01/verification.json',
                 'native_test_05/verification.json']:
        if not json.loads((BASE / path).read_text(encoding='utf-8'))['passed']:
            raise ValueError('缺少验证通过证据：' + path)
    metrics = dict(line.split('=') for line in (impl / 'timing_metrics.txt').read_text().splitlines())
    metrics = {key: float(value) for key, value in metrics.items()}
    if min(metrics.values()) <= 0.2:
        raise ValueError('实际时序余量尚未超过0.2ns')
    timing = (impl / 'timing_summary.rpt').read_text(encoding='utf-8')
    for line in timing[timing.index('WNS(ns)'):].splitlines():
        fields = line.split()
        if len(fields) == 12:
            try:
                values = [float(field) for field in fields]
            except ValueError:
                continue
            metrics['WPWS'] = values[8]
            break
    if metrics.get('WPWS', 0) <= 0.2:
        raise ValueError('脉宽余量不足0.2ns')
    for condition in ['checking no_clock (0)', 'checking unconstrained_internal_endpoints (0)',
                      'checking partial_input_delay (0)', 'checking partial_output_delay (0)',
                      'All user specified timing constraints are met.']:
        if condition not in timing:
            raise ValueError('时序完整性不满足：' + condition)
    drc = (impl / 'drc.rpt').read_text(encoding='utf-8')
    if re.search(r'^\|\s*\S+\s*\|\s*(?:Error|Critical Warning)\s*\|', drc, re.M):
        raise ValueError('DRC仍有错误或严重警告')
    cdc = (impl / 'cdc.rpt').read_text(encoding='utf-8')
    critical = {key: int(value) for key, value in re.findall(r'^(CDC-\d+)\s+Critical\s+(\d+)\s', cdc, re.M)}
    if critical != {'CDC-1': 2, 'CDC-10': 1, 'CDC-11': 2, 'CDC-13': 6}:
        raise ValueError('跨域告警超出已检查的官方网口IP范围：' + str(critical))
    expected = {}
    pattern = r'PACKAGE_PIN\s+(\S+)\s+IOSTANDARD\s+(\S+)\s*\}\s*\[get_ports\s+\{([^}]+)\}\]'
    for pin, standard, name in re.findall(pattern, (HW / 'constrs/lxb_board_pins.xdc').read_text(encoding='utf-8')):
        expected[name] = {'pin': pin, 'iostandard': standard}
    actual = {re.sub(r'^(k[1-7]_ctrl)\[0\]$', r'\1', row['port']): row for row in csv.DictReader((impl / 'actual_pins.csv').open(encoding='utf-8'))}
    pl_actual = {name: row for name, row in actual.items() if not name.startswith(('DDR_', 'FIXED_IO_'))}
    if len(expected) != 52 or set(expected) != set(pl_actual):
        raise ValueError('PL端口数量或名称不符')
    for name, wanted in expected.items():
        if any(actual[name][key] != value for key, value in wanted.items()):
            raise ValueError('实际引脚与新XDC不同：' + name)
    if actual['probe_io[0]']['direction'] != 'INOUT' or actual['probe_io[1]']['direction'] != 'INOUT':
        raise ValueError('两路探针不是双向IO')
    counts = dict(line.split('=') for line in (impl / 'endpoint_counts.txt').read_text().splitlines())
    if any(counts[key] != value for key, value in {'digital_sync_first_stage': '2', 'adc_sample_inputs': '13', 'rgmii_rx_primary_clock': 'lxb_rgmii_rxc', 'rgmii_rx_period': '8.000', 'probe_iobufs': '2'}.items()):
        raise ValueError('输入采样、三态缓冲或PHY主时钟对象不符')
    firmware = json.loads((BASE / 'firmware_05/build_manifest.json').read_text(encoding='utf-8'))
    for name, digest in firmware['source_sha256'].items():
        if sha(FW / name) != digest:
            raise ValueError('固件编译后源码发生变化：' + name)
    baseline = json.loads((HW / 'source_manifest.json').read_text(encoding='utf-8'))
    allowed = {'fdw_probe_router.v', 'digital_async_timing.xdc', 'fdw_probe_control.c', 'lscript.ld', 'tcp_server.c'}
    comparisons = []
    for item in baseline['files']:
        path = Path(item['copy'])
        changed = sha(path) != item['sha256']
        if changed and path.name not in allowed:
            raise ValueError('R4核心通路意外变化：' + str(path))
        if path.name == 'fdw_probe_router.v':
            wanted = Path(item['source']).read_text(encoding='utf-8').replace('OBUFT pwm_pad (.I(selected_pwm), .T(!output_enabled), .O(pwm_out));', 'assign pwm_out = selected_pwm;')
            if path.read_text(encoding='utf-8') != wanted:
                raise ValueError('探针路由出现了三态位置调整以外的变更')
        if path.name == 'digital_async_timing.xdc':
            wanted = Path(item['source']).read_text(encoding='utf-8').replace('digital_in[*]', 'probe_io[*]')
            if path.read_text(encoding='utf-8') != wanted:
                raise ValueError('数字异步约束出现了端口重命名以外的变更')
        comparisons.append({'file': str(path), 'sha256': sha(path), 'changed_for_board_port': changed})
    for item in json.loads((BASE / 'protected_sources_before.json').read_text(encoding='utf-8')):
        if sha(Path(item['file'])) != item['sha256']:
            raise ValueError('原冻结保护文件改变：' + item['file'])
    frozen = ROOT / 'outputs/checkpoint_99_7020_r4_lowrate_bulk/package_irqfp01'
    for item in json.loads((frozen / 'package_manifest.json').read_text(encoding='utf-8'))['files']:
        if sha(frozen / item['name']) != item['sha256']:
            raise ValueError('原正式包改变：' + item['name'])
    platform = json.loads((BASE / 'platform_01/构建记录.json').read_text(encoding='utf-8'))
    if sha(Path(platform['xsa'])) != platform['xsa_sha256'] or firmware['xsa_sha256'] != platform['xsa_sha256']:
        raise ValueError('新硬件导出与固件不配套')
    with zipfile.ZipFile(platform['xsa']) as archive:
        if b'PART="xc7z020clg484-2"' not in archive.read('hwdef.xml'):
            raise ValueError('XSA目标器件不是新板CLG484')
        inside = archive.read('ps7_init.tcl').decode('utf-8').replace('\r\n', '\n')
        exported = (Path(platform['export']) / 'hw/sdt/ps7_init.tcl').read_text(encoding='utf-8')
        if inside != exported:
            raise ValueError('新PS初始化与XSA导出不同')
    report = {'passed': True, 'timing_ns': metrics, 'pl_ports_checked': 52,
              'original_r4_package_unchanged': True, 'original_protected_sources_unchanged': True,
              'cdc_overall_clean': False, 'retained_official_ip_cdc_critical_counts': critical,
              'board_tested': False, 'source_comparisons': comparisons}
    if args.audit_only:
        destination = impl / 'offline_checks.json'
        if destination.exists():
            raise FileExistsError('离线审查记录已存在')
        destination.write_text(json.dumps(report, ensure_ascii=False, indent=2)+'\n', encoding='utf-8')
        print('LXB_INDEPENDENT_OFFLINE_CHECKS_PASS')
        return
    bit = (impl / 'LXB_R4_PORT1.bit').read_bytes()
    if b'7z020clg484' not in bit[:512].lower():
        raise ValueError('位流头不是新板CLG484封装')
    package.mkdir()
    export = Path(platform['export'])
    for source, name in [
        (impl / 'LXB_R4_PORT1.bit', 'system.bit'),
        (impl / 'LXB_R4_PORT1.ltx', 'system.ltx'),
        (Path(firmware['elf']), 'application.elf'),
        (Path(platform['xsa']), 'hardware.xsa'),
        (export / 'hw/sdt/ps7_init.tcl', 'ps7_init.tcl'),
        (export / 'sw/boot/fsbl.elf', 'fsbl.elf'),
        (impl / 'actual_pins.csv', 'actual_pins.csv'),
        (HW / 'constrs/lxb_board_pins.xdc', 'board_pins.xdc')
    ]:
        shutil.copyfile(source, package / name)
    (package / 'boot.bif').write_text('the_ROM_image:\n{\n [bootloader] fsbl.elf\n system.bit\n application.elf\n}\n', encoding='utf-8')
    env = dict(os.environ, PROCESSOR_ARCHITECTURE='AMD64')
    env['PATH'] = 'D:/Xilinx/2025.1/Vitis/lib/win64.o;D:/Xilinx/2025.1/Vitis/bin/unwrapped/win64.o;' + env['PATH']
    bootgen = 'D:/Xilinx/2025.1/Vitis/bin/unwrapped/win64.o/bootgen.exe'
    result = subprocess.run([bootgen, '-arch', 'zynq', '-image', 'boot.bif', '-o', 'BOOT.bin', '-w', 'off'], cwd=package, env=env, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    (package / 'bootgen_build.log').write_bytes(result.stdout)
    if result.returncode:
        raise ValueError('官方Bootgen构建失败')
    result = subprocess.run([bootgen, '-arch', 'zynq', '-read', 'BOOT.bin'], cwd=package, env=env, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    (package / 'bootgen_read.log').write_bytes(result.stdout)
    if result.returncode:
        raise ValueError('官方Bootgen重新读取失败')
    from review_boot import review
    review(package)
    (package / 'README.md').write_text((HW / 'README_candidate.md').read_text(encoding='utf-8'), encoding='utf-8')
    (package / 'source_comparison.json').write_text(json.dumps(comparisons, ensure_ascii=False, indent=2)+'\n', encoding='utf-8')
    manifest = {
        'board_revision': 'LXB-R4-PORT1', 'part': 'xc7z020clg484-2',
        'baseline_logic': 'DIG5-R4-LOWRATE-BULK', 'baseline_firmware': 'R4-P1-IRQFP',
        'adc_clock_hz': 25000000, 'frame_samples': 8192, 'max_decimation_log2': 16,
        'filter': 'cic3', 'phase_metadata_version': 2, 'pipeline_tick_compensation': 2,
        'timing_ns': metrics, 'physical_pl_pins': 52, 'independent_pwm_channels': 2,
        'new_bsp_used': True, 'ddr_bytes': 536870912, 'offline_checks_passed': True,
        'cdc_overall_clean': False, 'retained_official_ip_cdc_critical_counts': critical,
        'cdc_note': '告警限于官方网口IP复位同步、专用时钟复用及全双工未用COL/CRS；原始报告保留，不能宣称CDC零严重告警',
        'new_board_programmed': False, 'new_board_tested': False, 'flash_written': False,
        'ddr_board_tested': False, 'ethernet_board_tested': False, 'analog_calibrated': False,
        'evidence_directory': str(BASE), 'implementation_directory': str(impl),
        'firmware_directory': str(BASE / 'firmware_05'), 'files': []
    }
    for path in sorted(package.iterdir()):
        manifest['files'].append({'name': path.name, 'bytes': path.stat().st_size, 'sha256': sha(path)})
    (package / 'package_manifest.json').write_text(json.dumps(manifest, ensure_ascii=False, indent=2)+'\n', encoding='utf-8')
    with zipfile.ZipFile(BASE / (args.package + '.zip'), 'x', zipfile.ZIP_DEFLATED) as archive:
        for path in sorted(package.iterdir()):
            archive.write(path, path.name)
    print('LXB_OFFLINE_CANDIDATE_PACKAGED=' + str(package))


if __name__ == '__main__':
    main()
