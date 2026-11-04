
from pathlib import Path
import hashlib
import json
import shutil
import re

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[3]
BASE = ROOT / "outputs/r4b99_a4/sources"
AUDIT = ROOT / "outputs/checkpoint_110_hellofpga_migration_audit"
BUILD = ROOT / "outputs/lxb110_a1"
FW = ROOT / "software/7020/candidates/lxb_r4_port/src"


def main():
    marker = HERE / "source_manifest.json"
    if marker.exists():
        raise RuntimeError("迁移副本已存在，禁止重新覆盖修改。")
    source_records = []
    for folder, pattern in [("rtl", "*.v"), ("rtl", "*.mem"), ("constrs", "*_timing.xdc")]:
        destination = HERE / folder
        destination.mkdir(parents=True, exist_ok=True)
        for source in (BASE / folder).glob(pattern):
            shutil.copy2(source, destination / source.name)
            source_records.append({"source": str(source), "copy": str(destination / source.name), "sha256": hashlib.sha256(source.read_bytes()).hexdigest()})
    bd = json.loads((BASE / "system.bd").read_text(encoding="utf-8"))
    bd["design"]["design_info"]["device"] = "xc7z020clg484-2"
    bd["design"]["design_info"]["gen_directory"] = (BUILD / "p/generated_system").as_posix()
    (HERE / "system.bd").write_text(json.dumps(bd, indent=2) + "\n", encoding="utf-8")
    FW.mkdir(parents=True, exist_ok=True)
    for source in (ROOT / "software/7020/candidates/dig5_r4_lowrate_bulk/src").iterdir():
        if source.is_file():
            shutil.copy2(source, FW / source.name)
            source_records.append({"source": str(source), "copy": str(FW / source.name), "sha256": hashlib.sha256(source.read_bytes()).hexdigest()})

    # 原单独 PWM 管脚改为内部波形，真正的三态缓冲集中在双向探针接口。
    router = HERE / "rtl/fdw_probe_router.v"
    text = router.read_text(encoding="utf-8")
    old = "OBUFT pwm_pad (.I(selected_pwm), .T(!output_enabled), .O(pwm_out));"
    assert text.count(old) == 1
    text = text.replace(old, "assign pwm_out = selected_pwm;")
    router.write_text(text, encoding="utf-8")

    received = (AUDIT / "reference/new_pins_received.xdc").read_text(encoding="utf-8-sig")
    pins = ["# 鹿小班 CLG484 新板引脚；Bank33 的 3.3V 已由用户确认。",
            "# 数字 A/B 改为双向探针端口，默认高阻；本文件不代替时序约束。"]
    for line in received.splitlines():
        match = re.search(r"PACKAGE_PIN\s+(\w+).*?\[get_ports\s+\{([^}]+)\}\]", line)
        if not match:
            continue
        pin, port = match.groups()
        port = {"fpga_in_a": "probe_io[0]", "fpga_in_b": "probe_io[1]"}.get(port, port)
        pins.append(f"set_property -dict {{ PACKAGE_PIN {pin} IOSTANDARD LVCMOS33 }} [get_ports {{{port}}}]")
    onboard = {
        "eth_txd[0]": "E21", "eth_txd[1]": "F21", "eth_txd[2]": "F22", "eth_txd[3]": "G20",
        "eth_rxd[0]": "A22", "eth_rxd[1]": "A18", "eth_rxd[2]": "A19", "eth_rxd[3]": "B20",
        "eth_txc": "D21", "eth_rxc": "B19", "eth_tx_ctl": "G22", "eth_rx_ctl": "A21",
        "eth_mdio": "H22", "eth_mdc": "G21", "uart_tx": "L17", "uart_rx": "M17",
    }
    for port, pin in onboard.items():
        pins.append(f"set_property -dict {{ PACKAGE_PIN {pin} IOSTANDARD LVCMOS33 }} [get_ports {{{port}}}]")
    (HERE / "constrs/lxb_board_pins.xdc").write_text("\n".join(pins) + "\n", encoding="utf-8")
    digital = HERE / "constrs/digital_async_timing.xdc"
    digital.write_text(digital.read_text(encoding="utf-8").replace("[get_ports {digital_in[*]}]", "[get_ports {probe_io[*]}]"), encoding="utf-8")
    marker.write_text(json.dumps({"baseline": "R4-P1-IRQFP", "user_confirmed_bank33_v": 3.3,
        "dual_io_pwm_requested": True, "files": source_records}, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print("FDW_LXB_SOURCES_PREPARED=" + str(HERE))


if __name__ == "__main__":
    main()
