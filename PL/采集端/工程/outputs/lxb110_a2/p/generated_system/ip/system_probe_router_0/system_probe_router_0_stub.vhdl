-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
-- Date        : Thu Oct 22 00:36:55 2026
-- Host        : xiaojun running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/33525/FDW_NEXT/outputs/lxb110_a2/p/generated_system/ip/system_probe_router_0/system_probe_router_0_stub.vhdl
-- Design      : system_probe_router_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg484-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity system_probe_router_0 is
  Port ( 
    clk : in STD_LOGIC;
    resetn : in STD_LOGIC;
    control_word : in STD_LOGIC_VECTOR ( 31 downto 0 );
    status_word : out STD_LOGIC_VECTOR ( 31 downto 0 );
    digital_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    continuous_pwm : in STD_LOGIC;
    continuous_event : in STD_LOGIC;
    finite_pwm : in STD_LOGIC;
    finite_event : in STD_LOGIC;
    pwm_active : in STD_LOGIC;
    capture_active : in STD_LOGIC;
    sample_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    trigger_out : out STD_LOGIC;
    invalidate_capture : out STD_LOGIC;
    pwm_out : out STD_LOGIC
  );

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of system_probe_router_0 : entity is "system_probe_router_0,fdw_probe_router,{}";
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of system_probe_router_0 : entity is "system_probe_router_0,fdw_probe_router,{x_ipProduct=Vivado 2025.1,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=fdw_probe_router,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of system_probe_router_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of system_probe_router_0 : entity is "module_ref";
end system_probe_router_0;

architecture stub of system_probe_router_0 is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "clk,resetn,control_word[31:0],status_word[31:0],digital_in[1:0],continuous_pwm,continuous_event,finite_pwm,finite_event,pwm_active,capture_active,sample_out[1:0],trigger_out,invalidate_capture,pwm_out";
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute X_INTERFACE_MODE : string;
  attribute X_INTERFACE_MODE of clk : signal is "slave";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME clk, ASSOCIATED_RESET resetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of resetn : signal is "xilinx.com:signal:reset:1.0 resetn RST";
  attribute X_INTERFACE_MODE of resetn : signal is "slave";
  attribute X_INTERFACE_PARAMETER of resetn : signal is "XIL_INTERFACENAME resetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of stub : architecture is "fdw_probe_router,Vivado 2025.1";
begin
end;
