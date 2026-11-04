-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
-- Date        : Thu Oct 22 00:42:10 2026
-- Host        : xiaojun running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/33525/FDW_NEXT/outputs/lxb110_a2/p/generated_system/ip/system_adc_capture_0/system_adc_capture_0_stub.vhdl
-- Design      : system_adc_capture_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg484-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity system_adc_capture_0 is
  Port ( 
    sample_clk : in STD_LOGIC;
    adc_clk_0 : in STD_LOGIC;
    control_clk : in STD_LOGIC;
    control_resetn : in STD_LOGIC;
    phase_command_word : in STD_LOGIC_VECTOR ( 31 downto 0 );
    legacy_status : in STD_LOGIC_VECTOR ( 6 downto 0 );
    phase_status_word : out STD_LOGIC_VECTOR ( 31 downto 0 );
    reference_valid : in STD_LOGIC;
    reference_inverted : in STD_LOGIC;
    reference_phase : in STD_LOGIC_VECTOR ( 31 downto 0 );
    reference_ftw : in STD_LOGIC_VECTOR ( 31 downto 0 );
    reference_tag : in STD_LOGIC_VECTOR ( 31 downto 0 );
    aresetn : in STD_LOGIC;
    adc_data : in STD_LOGIC_VECTOR ( 11 downto 0 );
    adc_otr : in STD_LOGIC;
    adc_clk : out STD_LOGIC;
    capture_control : in STD_LOGIC_VECTOR ( 1 downto 0 );
    capture_start_sampled : out STD_LOGIC;
    capture_clear_ack : out STD_LOGIC;
    fifo_aresetn : out STD_LOGIC;
    capture_active : out STD_LOGIC;
    capture_done : out STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tlast : out STD_LOGIC
  );

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of system_adc_capture_0 : entity is "system_adc_capture_0,fdw_adc_phase_axis_source,{}";
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of system_adc_capture_0 : entity is "system_adc_capture_0,fdw_adc_phase_axis_source,{x_ipProduct=Vivado 2025.1,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=fdw_adc_phase_axis_source,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,FRAME_SAMPLES=8192}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of system_adc_capture_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of system_adc_capture_0 : entity is "module_ref";
end system_adc_capture_0;

architecture stub of system_adc_capture_0 is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "sample_clk,adc_clk_0,control_clk,control_resetn,phase_command_word[31:0],legacy_status[6:0],phase_status_word[31:0],reference_valid,reference_inverted,reference_phase[31:0],reference_ftw[31:0],reference_tag[31:0],aresetn,adc_data[11:0],adc_otr,adc_clk,capture_control[1:0],capture_start_sampled,capture_clear_ack,fifo_aresetn,capture_active,capture_done,m_axis_tdata[15:0],m_axis_tvalid,m_axis_tready,m_axis_tlast";
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of sample_clk : signal is "xilinx.com:signal:clock:1.0 sample_clk CLK";
  attribute X_INTERFACE_MODE : string;
  attribute X_INTERFACE_MODE of sample_clk : signal is "slave";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of sample_clk : signal is "XIL_INTERFACENAME sample_clk, ASSOCIATED_BUSIF M_AXIS, ASSOCIATED_RESET aresetn, FREQ_HZ 25000000, FREQ_TOLERANCE_HZ 0, PHASE 180.0, CLK_DOMAIN /adc_clk_wiz_clk_out1, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of control_clk : signal is "xilinx.com:signal:clock:1.0 control_clk CLK";
  attribute X_INTERFACE_MODE of control_clk : signal is "slave";
  attribute X_INTERFACE_PARAMETER of control_clk : signal is "XIL_INTERFACENAME control_clk, ASSOCIATED_RESET control_resetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of control_resetn : signal is "xilinx.com:signal:reset:1.0 control_resetn RST";
  attribute X_INTERFACE_MODE of control_resetn : signal is "slave";
  attribute X_INTERFACE_PARAMETER of control_resetn : signal is "XIL_INTERFACENAME control_resetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of aresetn : signal is "xilinx.com:signal:reset:1.0 aresetn RST";
  attribute X_INTERFACE_MODE of aresetn : signal is "slave";
  attribute X_INTERFACE_PARAMETER of aresetn : signal is "XIL_INTERFACENAME aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of adc_clk : signal is "xilinx.com:signal:clock:1.0 adc_clk CLK";
  attribute X_INTERFACE_MODE of adc_clk : signal is "master";
  attribute X_INTERFACE_PARAMETER of adc_clk : signal is "XIL_INTERFACENAME adc_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_adc_capture_0_adc_clk, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of fifo_aresetn : signal is "xilinx.com:signal:reset:1.0 fifo_aresetn RST";
  attribute X_INTERFACE_MODE of fifo_aresetn : signal is "master";
  attribute X_INTERFACE_PARAMETER of fifo_aresetn : signal is "XIL_INTERFACENAME fifo_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of m_axis_tdata : signal is "xilinx.com:interface:axis:1.0 M_AXIS TDATA";
  attribute X_INTERFACE_MODE of m_axis_tdata : signal is "master";
  attribute X_INTERFACE_PARAMETER of m_axis_tdata : signal is "XIL_INTERFACENAME M_AXIS, TDATA_NUM_BYTES 2, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 25000000, PHASE 180.0, CLK_DOMAIN /adc_clk_wiz_clk_out1, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of m_axis_tvalid : signal is "xilinx.com:interface:axis:1.0 M_AXIS TVALID";
  attribute X_INTERFACE_INFO of m_axis_tready : signal is "xilinx.com:interface:axis:1.0 M_AXIS TREADY";
  attribute X_INTERFACE_INFO of m_axis_tlast : signal is "xilinx.com:interface:axis:1.0 M_AXIS TLAST";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of stub : architecture is "fdw_adc_phase_axis_source,Vivado 2025.1";
begin
end;
