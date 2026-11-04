-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
-- Date        : Thu Oct 22 00:41:41 2026
-- Host        : xiaojun running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/33525/FDW_NEXT/outputs/lxb110_a2/p/generated_system/ip/system_adc_trigger_gate_0/system_adc_trigger_gate_0_stub.vhdl
-- Design      : system_adc_trigger_gate_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg484-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity system_adc_trigger_gate_0 is
  Port ( 
    control_clk : in STD_LOGIC;
    control_resetn : in STD_LOGIC;
    sample_clk : in STD_LOGIC;
    sample_resetn : in STD_LOGIC;
    capture_control : in STD_LOGIC_VECTOR ( 2 downto 0 );
    trigger_event : in STD_LOGIC;
    legacy_control : out STD_LOGIC_VECTOR ( 1 downto 0 );
    trigger_status : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of system_adc_trigger_gate_0 : entity is "system_adc_trigger_gate_0,fdw_adc_trigger_gate,{}";
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of system_adc_trigger_gate_0 : entity is "system_adc_trigger_gate_0,fdw_adc_trigger_gate,{x_ipProduct=Vivado 2025.1,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=fdw_adc_trigger_gate,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of system_adc_trigger_gate_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of system_adc_trigger_gate_0 : entity is "module_ref";
end system_adc_trigger_gate_0;

architecture stub of system_adc_trigger_gate_0 is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "control_clk,control_resetn,sample_clk,sample_resetn,capture_control[2:0],trigger_event,legacy_control[1:0],trigger_status[3:0]";
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of control_clk : signal is "xilinx.com:signal:clock:1.0 control_clk CLK";
  attribute X_INTERFACE_MODE : string;
  attribute X_INTERFACE_MODE of control_clk : signal is "slave";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of control_clk : signal is "XIL_INTERFACENAME control_clk, ASSOCIATED_RESET control_resetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of control_resetn : signal is "xilinx.com:signal:reset:1.0 control_resetn RST";
  attribute X_INTERFACE_MODE of control_resetn : signal is "slave";
  attribute X_INTERFACE_PARAMETER of control_resetn : signal is "XIL_INTERFACENAME control_resetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of sample_clk : signal is "xilinx.com:signal:clock:1.0 sample_clk CLK";
  attribute X_INTERFACE_MODE of sample_clk : signal is "slave";
  attribute X_INTERFACE_PARAMETER of sample_clk : signal is "XIL_INTERFACENAME sample_clk, ASSOCIATED_RESET sample_resetn, FREQ_HZ 25000000, FREQ_TOLERANCE_HZ 0, PHASE 180.0, CLK_DOMAIN /adc_clk_wiz_clk_out1, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of sample_resetn : signal is "xilinx.com:signal:reset:1.0 sample_resetn RST";
  attribute X_INTERFACE_MODE of sample_resetn : signal is "slave";
  attribute X_INTERFACE_PARAMETER of sample_resetn : signal is "XIL_INTERFACENAME sample_resetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of stub : architecture is "fdw_adc_trigger_gate,Vivado 2025.1";
begin
end;
