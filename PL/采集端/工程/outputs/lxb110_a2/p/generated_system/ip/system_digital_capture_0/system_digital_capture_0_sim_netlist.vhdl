-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
-- Date        : Thu Oct 22 00:38:11 2026
-- Host        : xiaojun running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/33525/FDW_NEXT/outputs/lxb110_a2/p/generated_system/ip/system_digital_capture_0/system_digital_capture_0_sim_netlist.vhdl
-- Design      : system_digital_capture_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg484-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_digital_capture_0_fdw_digital_capture is
  port (
    trigger_sticky_0 : out STD_LOGIC;
    cancelled : out STD_LOGIC;
    cfg_error : out STD_LOGIC;
    trigger_seen : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 31 downto 0 );
    rd_valid_reg_0 : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    \shadow_count_reg[24]\ : out STD_LOGIC;
    capture_active : out STD_LOGIC;
    p_0_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    memory_pending_reg : out STD_LOGIC;
    \s_axi_araddr[3]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_rvalid_reg : out STD_LOGIC;
    arm_valid_reg : out STD_LOGIC;
    \write_data_reg[1]\ : out STD_LOGIC;
    \write_data_reg[2]\ : out STD_LOGIC;
    \write_address_reg[3]\ : out STD_LOGIC;
    memory_request : in STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    \captured_count_reg[0]_0\ : in STD_LOGIC;
    \s_axi_rdata_reg[0]\ : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \s_axi_rdata_reg[10]\ : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 29 downto 0 );
    arm_valid_reg_0 : in STD_LOGIC;
    \s_axi_rdata_reg[31]\ : in STD_LOGIC_VECTOR ( 29 downto 0 );
    trigger_sticky : in STD_LOGIC;
    shadow_wait : in STD_LOGIC;
    \s_axi_rdata_reg[31]_0\ : in STD_LOGIC_VECTOR ( 29 downto 0 );
    sample_memory_reg_0 : in STD_LOGIC;
    trigger_in : in STD_LOGIC;
    busy_reg_0 : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    invalidate_in : in STD_LOGIC;
    memory_index_1 : in STD_LOGIC;
    memory_pending_reg_0 : in STD_LOGIC;
    arm_wait_reg : in STD_LOGIC;
    arm_wait_reg_0 : in STD_LOGIC;
    arm_wait_reg_1 : in STD_LOGIC;
    arm_wait_reg_2 : in STD_LOGIC;
    arm_wait_reg_3 : in STD_LOGIC;
    arm_valid_reg_1 : in STD_LOGIC;
    arm_valid_reg_2 : in STD_LOGIC;
    arm_wait_reg_4 : in STD_LOGIC;
    \s_axi_bresp[1]_i_3_0\ : in STD_LOGIC;
    \s_axi_bresp[1]_i_3_1\ : in STD_LOGIC;
    \active_sample_count_reg[31]_0\ : in STD_LOGIC_VECTOR ( 31 downto 0 );
    \active_interval_ticks_reg[31]_0\ : in STD_LOGIC_VECTOR ( 31 downto 0 );
    capture_active_0 : in STD_LOGIC;
    \s_axi_rdata_reg[0]_0\ : in STD_LOGIC;
    \s_axi_rdata_reg[0]_1\ : in STD_LOGIC;
    \s_axi_rdata_reg[1]\ : in STD_LOGIC;
    s_axi_arvalid : in STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    \s_axi_rdata_reg[0]_2\ : in STD_LOGIC;
    \s_axi_rdata_reg[4]\ : in STD_LOGIC;
    \rd_error1_carry__2_0\ : in STD_LOGIC_VECTOR ( 31 downto 0 );
    error_sticky : in STD_LOGIC;
    cancel_sticky : in STD_LOGIC;
    arm_valid_reg_3 : in STD_LOGIC;
    arm_valid_reg_4 : in STD_LOGIC;
    cancel_pulse_reg : in STD_LOGIC;
    soft_trigger_reg : in STD_LOGIC_VECTOR ( 1 downto 0 );
    cancel_pulse_reg_0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    address_pending0 : in STD_LOGIC;
    \s_axi_bresp_reg[1]\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \s_axi_bresp_reg[1]_0\ : in STD_LOGIC;
    s_axi_bresp : in STD_LOGIC_VECTOR ( 0 to 0 );
    sample_in : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_digital_capture_0_fdw_digital_capture : entity is "fdw_digital_capture";
end system_digital_capture_0_fdw_digital_capture;

architecture STRUCTURE of system_digital_capture_0_fdw_digital_capture is
  signal \^e\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal active_interval_ticks : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \active_interval_ticks[31]_i_10_n_0\ : STD_LOGIC;
  signal \active_interval_ticks[31]_i_11_n_0\ : STD_LOGIC;
  signal \active_interval_ticks[31]_i_12_n_0\ : STD_LOGIC;
  signal \active_interval_ticks[31]_i_13_n_0\ : STD_LOGIC;
  signal \active_interval_ticks[31]_i_14_n_0\ : STD_LOGIC;
  signal \active_interval_ticks[31]_i_15_n_0\ : STD_LOGIC;
  signal \active_interval_ticks[31]_i_16_n_0\ : STD_LOGIC;
  signal \active_interval_ticks[31]_i_17_n_0\ : STD_LOGIC;
  signal \active_interval_ticks[31]_i_18_n_0\ : STD_LOGIC;
  signal \active_interval_ticks[31]_i_19_n_0\ : STD_LOGIC;
  signal \active_interval_ticks[31]_i_2_n_0\ : STD_LOGIC;
  signal \active_interval_ticks[31]_i_3_n_0\ : STD_LOGIC;
  signal \active_interval_ticks[31]_i_4_n_0\ : STD_LOGIC;
  signal \active_interval_ticks[31]_i_5_n_0\ : STD_LOGIC;
  signal \active_interval_ticks[31]_i_6_n_0\ : STD_LOGIC;
  signal \active_interval_ticks[31]_i_7_n_0\ : STD_LOGIC;
  signal \active_interval_ticks[31]_i_8_n_0\ : STD_LOGIC;
  signal \active_interval_ticks[31]_i_9_n_0\ : STD_LOGIC;
  signal active_sample_count : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \arm_interval[31]_i_4_n_0\ : STD_LOGIC;
  signal armed : STD_LOGIC;
  signal armed7_out : STD_LOGIC;
  signal armed_i_1_n_0 : STD_LOGIC;
  signal armed_i_2_n_0 : STD_LOGIC;
  signal busy : STD_LOGIC;
  signal busy0 : STD_LOGIC;
  signal \busy0_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \busy0_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \busy0_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \busy0_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \busy0_carry__0_i_5_n_0\ : STD_LOGIC;
  signal \busy0_carry__0_i_5_n_1\ : STD_LOGIC;
  signal \busy0_carry__0_i_5_n_2\ : STD_LOGIC;
  signal \busy0_carry__0_i_5_n_3\ : STD_LOGIC;
  signal \busy0_carry__0_i_6_n_0\ : STD_LOGIC;
  signal \busy0_carry__0_i_6_n_1\ : STD_LOGIC;
  signal \busy0_carry__0_i_6_n_2\ : STD_LOGIC;
  signal \busy0_carry__0_i_6_n_3\ : STD_LOGIC;
  signal \busy0_carry__0_i_7_n_0\ : STD_LOGIC;
  signal \busy0_carry__0_i_7_n_1\ : STD_LOGIC;
  signal \busy0_carry__0_i_7_n_2\ : STD_LOGIC;
  signal \busy0_carry__0_i_7_n_3\ : STD_LOGIC;
  signal \busy0_carry__0_n_0\ : STD_LOGIC;
  signal \busy0_carry__0_n_1\ : STD_LOGIC;
  signal \busy0_carry__0_n_2\ : STD_LOGIC;
  signal \busy0_carry__0_n_3\ : STD_LOGIC;
  signal \busy0_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \busy0_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \busy0_carry__1_i_3_n_0\ : STD_LOGIC;
  signal \busy0_carry__1_i_4_n_2\ : STD_LOGIC;
  signal \busy0_carry__1_i_4_n_3\ : STD_LOGIC;
  signal \busy0_carry__1_i_5_n_0\ : STD_LOGIC;
  signal \busy0_carry__1_i_5_n_1\ : STD_LOGIC;
  signal \busy0_carry__1_i_5_n_2\ : STD_LOGIC;
  signal \busy0_carry__1_i_5_n_3\ : STD_LOGIC;
  signal \busy0_carry__1_n_2\ : STD_LOGIC;
  signal \busy0_carry__1_n_3\ : STD_LOGIC;
  signal busy0_carry_i_1_n_0 : STD_LOGIC;
  signal busy0_carry_i_2_n_0 : STD_LOGIC;
  signal busy0_carry_i_3_n_0 : STD_LOGIC;
  signal busy0_carry_i_4_n_0 : STD_LOGIC;
  signal busy0_carry_i_5_n_0 : STD_LOGIC;
  signal busy0_carry_i_5_n_1 : STD_LOGIC;
  signal busy0_carry_i_5_n_2 : STD_LOGIC;
  signal busy0_carry_i_5_n_3 : STD_LOGIC;
  signal busy0_carry_i_6_n_0 : STD_LOGIC;
  signal busy0_carry_i_6_n_1 : STD_LOGIC;
  signal busy0_carry_i_6_n_2 : STD_LOGIC;
  signal busy0_carry_i_6_n_3 : STD_LOGIC;
  signal busy0_carry_i_7_n_0 : STD_LOGIC;
  signal busy0_carry_i_7_n_1 : STD_LOGIC;
  signal busy0_carry_i_7_n_2 : STD_LOGIC;
  signal busy0_carry_i_7_n_3 : STD_LOGIC;
  signal busy0_carry_n_0 : STD_LOGIC;
  signal busy0_carry_n_1 : STD_LOGIC;
  signal busy0_carry_n_2 : STD_LOGIC;
  signal busy0_carry_n_3 : STD_LOGIC;
  signal busy_i_1_n_0 : STD_LOGIC;
  signal cancelled_i_1_n_0 : STD_LOGIC;
  signal captured_count : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal \captured_count[0]_i_1_n_0\ : STD_LOGIC;
  signal \captured_count[0]_i_4_n_0\ : STD_LOGIC;
  signal captured_count_reg : STD_LOGIC_VECTOR ( 31 downto 10 );
  signal \captured_count_reg[0]_i_3_n_0\ : STD_LOGIC;
  signal \captured_count_reg[0]_i_3_n_1\ : STD_LOGIC;
  signal \captured_count_reg[0]_i_3_n_2\ : STD_LOGIC;
  signal \captured_count_reg[0]_i_3_n_3\ : STD_LOGIC;
  signal \captured_count_reg[0]_i_3_n_4\ : STD_LOGIC;
  signal \captured_count_reg[0]_i_3_n_5\ : STD_LOGIC;
  signal \captured_count_reg[0]_i_3_n_6\ : STD_LOGIC;
  signal \captured_count_reg[0]_i_3_n_7\ : STD_LOGIC;
  signal \captured_count_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \captured_count_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \captured_count_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \captured_count_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \captured_count_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \captured_count_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \captured_count_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \captured_count_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \captured_count_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \captured_count_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \captured_count_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \captured_count_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \captured_count_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \captured_count_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \captured_count_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \captured_count_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \captured_count_reg[20]_i_1_n_0\ : STD_LOGIC;
  signal \captured_count_reg[20]_i_1_n_1\ : STD_LOGIC;
  signal \captured_count_reg[20]_i_1_n_2\ : STD_LOGIC;
  signal \captured_count_reg[20]_i_1_n_3\ : STD_LOGIC;
  signal \captured_count_reg[20]_i_1_n_4\ : STD_LOGIC;
  signal \captured_count_reg[20]_i_1_n_5\ : STD_LOGIC;
  signal \captured_count_reg[20]_i_1_n_6\ : STD_LOGIC;
  signal \captured_count_reg[20]_i_1_n_7\ : STD_LOGIC;
  signal \captured_count_reg[24]_i_1_n_0\ : STD_LOGIC;
  signal \captured_count_reg[24]_i_1_n_1\ : STD_LOGIC;
  signal \captured_count_reg[24]_i_1_n_2\ : STD_LOGIC;
  signal \captured_count_reg[24]_i_1_n_3\ : STD_LOGIC;
  signal \captured_count_reg[24]_i_1_n_4\ : STD_LOGIC;
  signal \captured_count_reg[24]_i_1_n_5\ : STD_LOGIC;
  signal \captured_count_reg[24]_i_1_n_6\ : STD_LOGIC;
  signal \captured_count_reg[24]_i_1_n_7\ : STD_LOGIC;
  signal \captured_count_reg[28]_i_1_n_1\ : STD_LOGIC;
  signal \captured_count_reg[28]_i_1_n_2\ : STD_LOGIC;
  signal \captured_count_reg[28]_i_1_n_3\ : STD_LOGIC;
  signal \captured_count_reg[28]_i_1_n_4\ : STD_LOGIC;
  signal \captured_count_reg[28]_i_1_n_5\ : STD_LOGIC;
  signal \captured_count_reg[28]_i_1_n_6\ : STD_LOGIC;
  signal \captured_count_reg[28]_i_1_n_7\ : STD_LOGIC;
  signal \captured_count_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \captured_count_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \captured_count_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \captured_count_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \captured_count_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \captured_count_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \captured_count_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \captured_count_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \captured_count_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \captured_count_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \captured_count_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \captured_count_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \captured_count_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \captured_count_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \captured_count_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \captured_count_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal cfg_error_i_1_n_0 : STD_LOGIC;
  signal cfg_error_i_2_n_0 : STD_LOGIC;
  signal cfg_error_i_3_n_0 : STD_LOGIC;
  signal cfg_error_i_4_n_0 : STD_LOGIC;
  signal done_i_1_n_0 : STD_LOGIC;
  signal interval_remaining : STD_LOGIC;
  signal \interval_remaining[0]_i_1_n_0\ : STD_LOGIC;
  signal \interval_remaining[0]_i_4_n_0\ : STD_LOGIC;
  signal \interval_remaining[0]_i_5_n_0\ : STD_LOGIC;
  signal \interval_remaining[0]_i_6_n_0\ : STD_LOGIC;
  signal \interval_remaining[0]_i_7_n_0\ : STD_LOGIC;
  signal \interval_remaining[12]_i_2_n_0\ : STD_LOGIC;
  signal \interval_remaining[12]_i_3_n_0\ : STD_LOGIC;
  signal \interval_remaining[12]_i_4_n_0\ : STD_LOGIC;
  signal \interval_remaining[12]_i_5_n_0\ : STD_LOGIC;
  signal \interval_remaining[16]_i_2_n_0\ : STD_LOGIC;
  signal \interval_remaining[16]_i_3_n_0\ : STD_LOGIC;
  signal \interval_remaining[16]_i_4_n_0\ : STD_LOGIC;
  signal \interval_remaining[16]_i_5_n_0\ : STD_LOGIC;
  signal \interval_remaining[20]_i_2_n_0\ : STD_LOGIC;
  signal \interval_remaining[20]_i_3_n_0\ : STD_LOGIC;
  signal \interval_remaining[20]_i_4_n_0\ : STD_LOGIC;
  signal \interval_remaining[20]_i_5_n_0\ : STD_LOGIC;
  signal \interval_remaining[24]_i_2_n_0\ : STD_LOGIC;
  signal \interval_remaining[24]_i_3_n_0\ : STD_LOGIC;
  signal \interval_remaining[24]_i_4_n_0\ : STD_LOGIC;
  signal \interval_remaining[24]_i_5_n_0\ : STD_LOGIC;
  signal \interval_remaining[28]_i_2_n_0\ : STD_LOGIC;
  signal \interval_remaining[28]_i_3_n_0\ : STD_LOGIC;
  signal \interval_remaining[28]_i_4_n_0\ : STD_LOGIC;
  signal \interval_remaining[28]_i_5_n_0\ : STD_LOGIC;
  signal \interval_remaining[4]_i_2_n_0\ : STD_LOGIC;
  signal \interval_remaining[4]_i_3_n_0\ : STD_LOGIC;
  signal \interval_remaining[4]_i_4_n_0\ : STD_LOGIC;
  signal \interval_remaining[4]_i_5_n_0\ : STD_LOGIC;
  signal \interval_remaining[8]_i_2_n_0\ : STD_LOGIC;
  signal \interval_remaining[8]_i_3_n_0\ : STD_LOGIC;
  signal \interval_remaining[8]_i_4_n_0\ : STD_LOGIC;
  signal \interval_remaining[8]_i_5_n_0\ : STD_LOGIC;
  signal interval_remaining_reg : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \interval_remaining_reg[0]_i_3_n_0\ : STD_LOGIC;
  signal \interval_remaining_reg[0]_i_3_n_1\ : STD_LOGIC;
  signal \interval_remaining_reg[0]_i_3_n_2\ : STD_LOGIC;
  signal \interval_remaining_reg[0]_i_3_n_3\ : STD_LOGIC;
  signal \interval_remaining_reg[0]_i_3_n_4\ : STD_LOGIC;
  signal \interval_remaining_reg[0]_i_3_n_5\ : STD_LOGIC;
  signal \interval_remaining_reg[0]_i_3_n_6\ : STD_LOGIC;
  signal \interval_remaining_reg[0]_i_3_n_7\ : STD_LOGIC;
  signal \interval_remaining_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \interval_remaining_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \interval_remaining_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \interval_remaining_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \interval_remaining_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \interval_remaining_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \interval_remaining_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \interval_remaining_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \interval_remaining_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \interval_remaining_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \interval_remaining_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \interval_remaining_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \interval_remaining_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \interval_remaining_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \interval_remaining_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \interval_remaining_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \interval_remaining_reg[20]_i_1_n_0\ : STD_LOGIC;
  signal \interval_remaining_reg[20]_i_1_n_1\ : STD_LOGIC;
  signal \interval_remaining_reg[20]_i_1_n_2\ : STD_LOGIC;
  signal \interval_remaining_reg[20]_i_1_n_3\ : STD_LOGIC;
  signal \interval_remaining_reg[20]_i_1_n_4\ : STD_LOGIC;
  signal \interval_remaining_reg[20]_i_1_n_5\ : STD_LOGIC;
  signal \interval_remaining_reg[20]_i_1_n_6\ : STD_LOGIC;
  signal \interval_remaining_reg[20]_i_1_n_7\ : STD_LOGIC;
  signal \interval_remaining_reg[24]_i_1_n_0\ : STD_LOGIC;
  signal \interval_remaining_reg[24]_i_1_n_1\ : STD_LOGIC;
  signal \interval_remaining_reg[24]_i_1_n_2\ : STD_LOGIC;
  signal \interval_remaining_reg[24]_i_1_n_3\ : STD_LOGIC;
  signal \interval_remaining_reg[24]_i_1_n_4\ : STD_LOGIC;
  signal \interval_remaining_reg[24]_i_1_n_5\ : STD_LOGIC;
  signal \interval_remaining_reg[24]_i_1_n_6\ : STD_LOGIC;
  signal \interval_remaining_reg[24]_i_1_n_7\ : STD_LOGIC;
  signal \interval_remaining_reg[28]_i_1_n_1\ : STD_LOGIC;
  signal \interval_remaining_reg[28]_i_1_n_2\ : STD_LOGIC;
  signal \interval_remaining_reg[28]_i_1_n_3\ : STD_LOGIC;
  signal \interval_remaining_reg[28]_i_1_n_4\ : STD_LOGIC;
  signal \interval_remaining_reg[28]_i_1_n_5\ : STD_LOGIC;
  signal \interval_remaining_reg[28]_i_1_n_6\ : STD_LOGIC;
  signal \interval_remaining_reg[28]_i_1_n_7\ : STD_LOGIC;
  signal \interval_remaining_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \interval_remaining_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \interval_remaining_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \interval_remaining_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \interval_remaining_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \interval_remaining_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \interval_remaining_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \interval_remaining_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \interval_remaining_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \interval_remaining_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \interval_remaining_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \interval_remaining_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \interval_remaining_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \interval_remaining_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \interval_remaining_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \interval_remaining_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal memory_data : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal memory_valid : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal rd_error : STD_LOGIC;
  signal rd_error1 : STD_LOGIC;
  signal \rd_error1_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \rd_error1_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \rd_error1_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \rd_error1_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \rd_error1_carry__0_i_5_n_0\ : STD_LOGIC;
  signal \rd_error1_carry__0_i_6_n_0\ : STD_LOGIC;
  signal \rd_error1_carry__0_i_7_n_0\ : STD_LOGIC;
  signal \rd_error1_carry__0_i_8_n_0\ : STD_LOGIC;
  signal \rd_error1_carry__0_n_0\ : STD_LOGIC;
  signal \rd_error1_carry__0_n_1\ : STD_LOGIC;
  signal \rd_error1_carry__0_n_2\ : STD_LOGIC;
  signal \rd_error1_carry__0_n_3\ : STD_LOGIC;
  signal \rd_error1_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \rd_error1_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \rd_error1_carry__1_i_3_n_0\ : STD_LOGIC;
  signal \rd_error1_carry__1_i_4_n_0\ : STD_LOGIC;
  signal \rd_error1_carry__1_i_5_n_0\ : STD_LOGIC;
  signal \rd_error1_carry__1_i_6_n_0\ : STD_LOGIC;
  signal \rd_error1_carry__1_i_7_n_0\ : STD_LOGIC;
  signal \rd_error1_carry__1_i_8_n_0\ : STD_LOGIC;
  signal \rd_error1_carry__1_n_0\ : STD_LOGIC;
  signal \rd_error1_carry__1_n_1\ : STD_LOGIC;
  signal \rd_error1_carry__1_n_2\ : STD_LOGIC;
  signal \rd_error1_carry__1_n_3\ : STD_LOGIC;
  signal \rd_error1_carry__2_i_1_n_0\ : STD_LOGIC;
  signal \rd_error1_carry__2_i_2_n_0\ : STD_LOGIC;
  signal \rd_error1_carry__2_i_3_n_0\ : STD_LOGIC;
  signal \rd_error1_carry__2_i_4_n_0\ : STD_LOGIC;
  signal \rd_error1_carry__2_i_5_n_0\ : STD_LOGIC;
  signal \rd_error1_carry__2_i_6_n_0\ : STD_LOGIC;
  signal \rd_error1_carry__2_i_7_n_0\ : STD_LOGIC;
  signal \rd_error1_carry__2_i_8_n_0\ : STD_LOGIC;
  signal \rd_error1_carry__2_n_1\ : STD_LOGIC;
  signal \rd_error1_carry__2_n_2\ : STD_LOGIC;
  signal \rd_error1_carry__2_n_3\ : STD_LOGIC;
  signal rd_error1_carry_i_1_n_0 : STD_LOGIC;
  signal rd_error1_carry_i_2_n_0 : STD_LOGIC;
  signal rd_error1_carry_i_3_n_0 : STD_LOGIC;
  signal rd_error1_carry_i_4_n_0 : STD_LOGIC;
  signal rd_error1_carry_i_5_n_0 : STD_LOGIC;
  signal rd_error1_carry_i_6_n_0 : STD_LOGIC;
  signal rd_error1_carry_i_7_n_0 : STD_LOGIC;
  signal rd_error1_carry_i_8_n_0 : STD_LOGIC;
  signal rd_error1_carry_n_0 : STD_LOGIC;
  signal rd_error1_carry_n_1 : STD_LOGIC;
  signal rd_error1_carry_n_2 : STD_LOGIC;
  signal rd_error1_carry_n_3 : STD_LOGIC;
  signal rd_error_i_1_n_0 : STD_LOGIC;
  signal rd_error_i_2_n_0 : STD_LOGIC;
  signal record_valid : STD_LOGIC;
  signal \s_axi_bresp[1]_i_12_n_0\ : STD_LOGIC;
  signal \s_axi_bresp[1]_i_8_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[0]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[0]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[0]_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[0]_i_5_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[10]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[11]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[11]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[11]_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[12]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[12]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[12]_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[13]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[13]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[13]_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[14]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[14]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[14]_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[15]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[15]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[15]_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[16]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[16]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[16]_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[17]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[17]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[17]_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[18]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[18]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[18]_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[19]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[19]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[19]_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[1]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[1]_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[20]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[20]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[20]_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[21]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[21]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[21]_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[22]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[22]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[22]_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[23]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[23]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[23]_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[24]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[24]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[24]_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[25]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[25]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[25]_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[26]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[26]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[26]_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[27]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[27]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[27]_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[28]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[28]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[28]_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[29]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[29]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[29]_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[2]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[2]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[2]_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[30]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[30]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[30]_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[31]_i_10_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[31]_i_12_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[31]_i_5_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[31]_i_9_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[3]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[3]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[3]_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[4]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[4]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[4]_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[5]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[5]_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[5]_i_5_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[6]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[6]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[6]_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[7]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[7]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[7]_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[8]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[8]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[8]_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[9]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[9]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[9]_i_4_n_0\ : STD_LOGIC;
  signal sample_fire0 : STD_LOGIC;
  signal sample_memory_reg_i_10_n_0 : STD_LOGIC;
  signal sample_memory_reg_i_11_n_0 : STD_LOGIC;
  signal sample_memory_reg_i_12_n_0 : STD_LOGIC;
  signal sample_memory_reg_i_13_n_0 : STD_LOGIC;
  signal sample_memory_reg_i_2_n_0 : STD_LOGIC;
  signal sample_memory_reg_i_3_n_0 : STD_LOGIC;
  signal sample_memory_reg_i_4_n_0 : STD_LOGIC;
  signal sample_memory_reg_i_5_n_0 : STD_LOGIC;
  signal sample_memory_reg_i_6_n_0 : STD_LOGIC;
  signal sample_memory_reg_i_7_n_0 : STD_LOGIC;
  signal sample_memory_reg_i_8_n_0 : STD_LOGIC;
  signal sample_memory_reg_i_9_n_0 : STD_LOGIC;
  signal \^shadow_count_reg[24]\ : STD_LOGIC;
  signal trigger_seen_i_1_n_0 : STD_LOGIC;
  signal \^trigger_sticky_0\ : STD_LOGIC;
  signal NLW_busy0_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_busy0_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_busy0_carry__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_busy0_carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_busy0_carry__1_i_4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_busy0_carry__1_i_4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_captured_count_reg[28]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_interval_remaining_reg[28]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal NLW_rd_error1_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_rd_error1_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_rd_error1_carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_rd_error1_carry__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_sample_memory_reg_DOADO_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_sample_memory_reg_DOBDO_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 2 );
  signal NLW_sample_memory_reg_DOPADOP_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_sample_memory_reg_DOPBDOP_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of armed_i_2 : label is "soft_lutpair1";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \busy0_carry__0_i_5\ : label is 35;
  attribute ADDER_THRESHOLD of \busy0_carry__0_i_6\ : label is 35;
  attribute ADDER_THRESHOLD of \busy0_carry__0_i_7\ : label is 35;
  attribute ADDER_THRESHOLD of \busy0_carry__1_i_4\ : label is 35;
  attribute ADDER_THRESHOLD of \busy0_carry__1_i_5\ : label is 35;
  attribute ADDER_THRESHOLD of busy0_carry_i_5 : label is 35;
  attribute ADDER_THRESHOLD of busy0_carry_i_6 : label is 35;
  attribute ADDER_THRESHOLD of busy0_carry_i_7 : label is 35;
  attribute SOFT_HLUTNM of cancelled_i_1 : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of capture_active_INST_0 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \captured_count[0]_i_4\ : label is "soft_lutpair4";
  attribute ADDER_THRESHOLD of \captured_count_reg[0]_i_3\ : label is 11;
  attribute ADDER_THRESHOLD of \captured_count_reg[12]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \captured_count_reg[16]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \captured_count_reg[20]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \captured_count_reg[24]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \captured_count_reg[28]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \captured_count_reg[4]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \captured_count_reg[8]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \interval_remaining_reg[0]_i_3\ : label is 11;
  attribute ADDER_THRESHOLD of \interval_remaining_reg[12]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \interval_remaining_reg[16]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \interval_remaining_reg[20]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \interval_remaining_reg[24]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \interval_remaining_reg[28]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \interval_remaining_reg[4]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \interval_remaining_reg[8]_i_1\ : label is 11;
  attribute SOFT_HLUTNM of memory_pending_i_1 : label is "soft_lutpair0";
  attribute COMPARATOR_THRESHOLD : integer;
  attribute COMPARATOR_THRESHOLD of rd_error1_carry : label is 11;
  attribute COMPARATOR_THRESHOLD of \rd_error1_carry__0\ : label is 11;
  attribute COMPARATOR_THRESHOLD of \rd_error1_carry__1\ : label is 11;
  attribute COMPARATOR_THRESHOLD of \rd_error1_carry__2\ : label is 11;
  attribute SOFT_HLUTNM of rd_error_i_2 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \s_axi_bresp[1]_i_12\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \s_axi_rdata[14]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \s_axi_rdata[16]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \s_axi_rdata[19]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \s_axi_rdata[22]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \s_axi_rdata[26]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \s_axi_rdata[30]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \s_axi_rdata[31]_i_5\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \s_axi_rdata[8]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \s_axi_rdata[9]_i_1\ : label is "soft_lutpair5";
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ : string;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of sample_memory_reg : label is "p0_d2";
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ : string;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of sample_memory_reg : label is "p0_d2";
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of sample_memory_reg : label is "{SYNTH-6 {cell *THIS*}}";
  attribute RTL_RAM_BITS : integer;
  attribute RTL_RAM_BITS of sample_memory_reg : label is 2048;
  attribute RTL_RAM_NAME : string;
  attribute RTL_RAM_NAME of sample_memory_reg : label is "system_digital_capture_0/inst/capture/sample_memory_reg";
  attribute RTL_RAM_STYLE : string;
  attribute RTL_RAM_STYLE of sample_memory_reg : label is "auto";
  attribute RTL_RAM_TYPE : string;
  attribute RTL_RAM_TYPE of sample_memory_reg : label is "RAM_SDP";
  attribute ram_addr_begin : integer;
  attribute ram_addr_begin of sample_memory_reg : label is 0;
  attribute ram_addr_end : integer;
  attribute ram_addr_end of sample_memory_reg : label is 1023;
  attribute ram_offset : integer;
  attribute ram_offset of sample_memory_reg : label is 0;
  attribute ram_slice_begin : integer;
  attribute ram_slice_begin of sample_memory_reg : label is 0;
  attribute ram_slice_end : integer;
  attribute ram_slice_end of sample_memory_reg : label is 1;
  attribute SOFT_HLUTNM of sample_memory_reg_i_8 : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of trigger_seen_i_1 : label is "soft_lutpair4";
begin
  E(0) <= \^e\(0);
  \shadow_count_reg[24]\ <= \^shadow_count_reg[24]\;
  trigger_sticky_0 <= \^trigger_sticky_0\;
\active_interval_ticks[31]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => invalidate_in,
      I1 => s_axi_aresetn,
      O => \^trigger_sticky_0\
    );
\active_interval_ticks[31]_i_10\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \active_interval_ticks_reg[31]_0\(19),
      I1 => \active_interval_ticks_reg[31]_0\(21),
      I2 => \active_interval_ticks_reg[31]_0\(0),
      I3 => \active_interval_ticks_reg[31]_0\(31),
      I4 => \active_interval_ticks[31]_i_17_n_0\,
      O => \active_interval_ticks[31]_i_10_n_0\
    );
\active_interval_ticks[31]_i_11\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \active_interval_ticks_reg[31]_0\(1),
      I1 => \active_interval_ticks_reg[31]_0\(30),
      I2 => \active_interval_ticks_reg[31]_0\(2),
      I3 => \active_interval_ticks_reg[31]_0\(25),
      I4 => \active_interval_ticks[31]_i_18_n_0\,
      O => \active_interval_ticks[31]_i_11_n_0\
    );
\active_interval_ticks[31]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \active_sample_count_reg[31]_0\(6),
      I1 => \active_sample_count_reg[31]_0\(0),
      I2 => \active_sample_count_reg[31]_0\(1),
      I3 => \active_sample_count_reg[31]_0\(9),
      I4 => \active_sample_count_reg[31]_0\(2),
      I5 => \active_sample_count_reg[31]_0\(4),
      O => \active_interval_ticks[31]_i_12_n_0\
    );
\active_interval_ticks[31]_i_13\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \active_sample_count_reg[31]_0\(27),
      I1 => \active_sample_count_reg[31]_0\(26),
      I2 => \active_sample_count_reg[31]_0\(25),
      I3 => \active_sample_count_reg[31]_0\(24),
      O => \active_interval_ticks[31]_i_13_n_0\
    );
\active_interval_ticks[31]_i_14\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \active_sample_count_reg[31]_0\(22),
      I1 => \active_sample_count_reg[31]_0\(23),
      I2 => \active_sample_count_reg[31]_0\(20),
      I3 => \active_sample_count_reg[31]_0\(21),
      I4 => \active_interval_ticks[31]_i_19_n_0\,
      O => \active_interval_ticks[31]_i_14_n_0\
    );
\active_interval_ticks[31]_i_15\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \active_interval_ticks_reg[31]_0\(23),
      I1 => \active_interval_ticks_reg[31]_0\(17),
      I2 => \active_interval_ticks_reg[31]_0\(14),
      I3 => \active_interval_ticks_reg[31]_0\(4),
      O => \active_interval_ticks[31]_i_15_n_0\
    );
\active_interval_ticks[31]_i_16\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \active_interval_ticks_reg[31]_0\(16),
      I1 => \active_interval_ticks_reg[31]_0\(12),
      I2 => \active_interval_ticks_reg[31]_0\(24),
      I3 => \active_interval_ticks_reg[31]_0\(6),
      O => \active_interval_ticks[31]_i_16_n_0\
    );
\active_interval_ticks[31]_i_17\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \active_interval_ticks_reg[31]_0\(22),
      I1 => \active_interval_ticks_reg[31]_0\(10),
      I2 => \active_interval_ticks_reg[31]_0\(15),
      I3 => \active_interval_ticks_reg[31]_0\(9),
      O => \active_interval_ticks[31]_i_17_n_0\
    );
\active_interval_ticks[31]_i_18\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \active_interval_ticks_reg[31]_0\(27),
      I1 => \active_interval_ticks_reg[31]_0\(5),
      I2 => \active_interval_ticks_reg[31]_0\(28),
      I3 => \active_interval_ticks_reg[31]_0\(26),
      O => \active_interval_ticks[31]_i_18_n_0\
    );
\active_interval_ticks[31]_i_19\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \active_sample_count_reg[31]_0\(19),
      I1 => \active_sample_count_reg[31]_0\(18),
      I2 => \active_sample_count_reg[31]_0\(17),
      I3 => \active_sample_count_reg[31]_0\(16),
      O => \active_interval_ticks[31]_i_19_n_0\
    );
\active_interval_ticks[31]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000002002"
    )
        port map (
      I0 => \active_interval_ticks[31]_i_3_n_0\,
      I1 => \active_interval_ticks[31]_i_4_n_0\,
      I2 => \active_sample_count_reg[31]_0\(10),
      I3 => \active_interval_ticks[31]_i_5_n_0\,
      I4 => \active_interval_ticks[31]_i_6_n_0\,
      I5 => \active_interval_ticks[31]_i_7_n_0\,
      O => \active_interval_ticks[31]_i_2_n_0\
    );
\active_interval_ticks[31]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000020000"
    )
        port map (
      I0 => arm_valid_reg_0,
      I1 => busy,
      I2 => armed,
      I3 => \captured_count_reg[0]_0\,
      I4 => s_axi_aresetn,
      I5 => invalidate_in,
      O => \active_interval_ticks[31]_i_3_n_0\
    );
\active_interval_ticks[31]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0004"
    )
        port map (
      I0 => \active_interval_ticks[31]_i_8_n_0\,
      I1 => \active_interval_ticks[31]_i_9_n_0\,
      I2 => \active_interval_ticks[31]_i_10_n_0\,
      I3 => \active_interval_ticks[31]_i_11_n_0\,
      O => \active_interval_ticks[31]_i_4_n_0\
    );
\active_interval_ticks[31]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => \active_sample_count_reg[31]_0\(5),
      I1 => \active_sample_count_reg[31]_0\(7),
      I2 => \active_sample_count_reg[31]_0\(3),
      I3 => \active_sample_count_reg[31]_0\(8),
      I4 => \active_interval_ticks[31]_i_12_n_0\,
      O => \active_interval_ticks[31]_i_5_n_0\
    );
\active_interval_ticks[31]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \active_sample_count_reg[31]_0\(11),
      I1 => \active_sample_count_reg[31]_0\(14),
      I2 => \active_sample_count_reg[31]_0\(15),
      I3 => \active_sample_count_reg[31]_0\(12),
      I4 => \active_sample_count_reg[31]_0\(13),
      O => \active_interval_ticks[31]_i_6_n_0\
    );
\active_interval_ticks[31]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \active_interval_ticks[31]_i_13_n_0\,
      I1 => \active_sample_count_reg[31]_0\(30),
      I2 => \active_sample_count_reg[31]_0\(31),
      I3 => \active_sample_count_reg[31]_0\(29),
      I4 => \active_sample_count_reg[31]_0\(28),
      I5 => \active_interval_ticks[31]_i_14_n_0\,
      O => \active_interval_ticks[31]_i_7_n_0\
    );
\active_interval_ticks[31]_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \active_interval_ticks_reg[31]_0\(7),
      I1 => \active_interval_ticks_reg[31]_0\(11),
      I2 => \active_interval_ticks_reg[31]_0\(8),
      I3 => \active_interval_ticks_reg[31]_0\(13),
      I4 => \active_interval_ticks[31]_i_15_n_0\,
      O => \active_interval_ticks[31]_i_8_n_0\
    );
\active_interval_ticks[31]_i_9\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => \active_interval_ticks_reg[31]_0\(3),
      I1 => \active_interval_ticks_reg[31]_0\(29),
      I2 => \active_interval_ticks_reg[31]_0\(18),
      I3 => \active_interval_ticks_reg[31]_0\(20),
      I4 => \active_interval_ticks[31]_i_16_n_0\,
      O => \active_interval_ticks[31]_i_9_n_0\
    );
\active_interval_ticks_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_interval_ticks[31]_i_2_n_0\,
      D => \active_interval_ticks_reg[31]_0\(0),
      Q => active_interval_ticks(0),
      R => \^trigger_sticky_0\
    );
\active_interval_ticks_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_interval_ticks[31]_i_2_n_0\,
      D => \active_interval_ticks_reg[31]_0\(10),
      Q => active_interval_ticks(10),
      R => \^trigger_sticky_0\
    );
\active_interval_ticks_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_interval_ticks[31]_i_2_n_0\,
      D => \active_interval_ticks_reg[31]_0\(11),
      Q => active_interval_ticks(11),
      R => \^trigger_sticky_0\
    );
\active_interval_ticks_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_interval_ticks[31]_i_2_n_0\,
      D => \active_interval_ticks_reg[31]_0\(12),
      Q => active_interval_ticks(12),
      R => \^trigger_sticky_0\
    );
\active_interval_ticks_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_interval_ticks[31]_i_2_n_0\,
      D => \active_interval_ticks_reg[31]_0\(13),
      Q => active_interval_ticks(13),
      R => \^trigger_sticky_0\
    );
\active_interval_ticks_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_interval_ticks[31]_i_2_n_0\,
      D => \active_interval_ticks_reg[31]_0\(14),
      Q => active_interval_ticks(14),
      R => \^trigger_sticky_0\
    );
\active_interval_ticks_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_interval_ticks[31]_i_2_n_0\,
      D => \active_interval_ticks_reg[31]_0\(15),
      Q => active_interval_ticks(15),
      R => \^trigger_sticky_0\
    );
\active_interval_ticks_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_interval_ticks[31]_i_2_n_0\,
      D => \active_interval_ticks_reg[31]_0\(16),
      Q => active_interval_ticks(16),
      R => \^trigger_sticky_0\
    );
\active_interval_ticks_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_interval_ticks[31]_i_2_n_0\,
      D => \active_interval_ticks_reg[31]_0\(17),
      Q => active_interval_ticks(17),
      R => \^trigger_sticky_0\
    );
\active_interval_ticks_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_interval_ticks[31]_i_2_n_0\,
      D => \active_interval_ticks_reg[31]_0\(18),
      Q => active_interval_ticks(18),
      R => \^trigger_sticky_0\
    );
\active_interval_ticks_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_interval_ticks[31]_i_2_n_0\,
      D => \active_interval_ticks_reg[31]_0\(19),
      Q => active_interval_ticks(19),
      R => \^trigger_sticky_0\
    );
\active_interval_ticks_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_interval_ticks[31]_i_2_n_0\,
      D => \active_interval_ticks_reg[31]_0\(1),
      Q => active_interval_ticks(1),
      R => \^trigger_sticky_0\
    );
\active_interval_ticks_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_interval_ticks[31]_i_2_n_0\,
      D => \active_interval_ticks_reg[31]_0\(20),
      Q => active_interval_ticks(20),
      R => \^trigger_sticky_0\
    );
\active_interval_ticks_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_interval_ticks[31]_i_2_n_0\,
      D => \active_interval_ticks_reg[31]_0\(21),
      Q => active_interval_ticks(21),
      R => \^trigger_sticky_0\
    );
\active_interval_ticks_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_interval_ticks[31]_i_2_n_0\,
      D => \active_interval_ticks_reg[31]_0\(22),
      Q => active_interval_ticks(22),
      R => \^trigger_sticky_0\
    );
\active_interval_ticks_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_interval_ticks[31]_i_2_n_0\,
      D => \active_interval_ticks_reg[31]_0\(23),
      Q => active_interval_ticks(23),
      R => \^trigger_sticky_0\
    );
\active_interval_ticks_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_interval_ticks[31]_i_2_n_0\,
      D => \active_interval_ticks_reg[31]_0\(24),
      Q => active_interval_ticks(24),
      R => \^trigger_sticky_0\
    );
\active_interval_ticks_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_interval_ticks[31]_i_2_n_0\,
      D => \active_interval_ticks_reg[31]_0\(25),
      Q => active_interval_ticks(25),
      R => \^trigger_sticky_0\
    );
\active_interval_ticks_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_interval_ticks[31]_i_2_n_0\,
      D => \active_interval_ticks_reg[31]_0\(26),
      Q => active_interval_ticks(26),
      R => \^trigger_sticky_0\
    );
\active_interval_ticks_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_interval_ticks[31]_i_2_n_0\,
      D => \active_interval_ticks_reg[31]_0\(27),
      Q => active_interval_ticks(27),
      R => \^trigger_sticky_0\
    );
\active_interval_ticks_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_interval_ticks[31]_i_2_n_0\,
      D => \active_interval_ticks_reg[31]_0\(28),
      Q => active_interval_ticks(28),
      R => \^trigger_sticky_0\
    );
\active_interval_ticks_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_interval_ticks[31]_i_2_n_0\,
      D => \active_interval_ticks_reg[31]_0\(29),
      Q => active_interval_ticks(29),
      R => \^trigger_sticky_0\
    );
\active_interval_ticks_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_interval_ticks[31]_i_2_n_0\,
      D => \active_interval_ticks_reg[31]_0\(2),
      Q => active_interval_ticks(2),
      R => \^trigger_sticky_0\
    );
\active_interval_ticks_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_interval_ticks[31]_i_2_n_0\,
      D => \active_interval_ticks_reg[31]_0\(30),
      Q => active_interval_ticks(30),
      R => \^trigger_sticky_0\
    );
\active_interval_ticks_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_interval_ticks[31]_i_2_n_0\,
      D => \active_interval_ticks_reg[31]_0\(31),
      Q => active_interval_ticks(31),
      R => \^trigger_sticky_0\
    );
\active_interval_ticks_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_interval_ticks[31]_i_2_n_0\,
      D => \active_interval_ticks_reg[31]_0\(3),
      Q => active_interval_ticks(3),
      R => \^trigger_sticky_0\
    );
\active_interval_ticks_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_interval_ticks[31]_i_2_n_0\,
      D => \active_interval_ticks_reg[31]_0\(4),
      Q => active_interval_ticks(4),
      R => \^trigger_sticky_0\
    );
\active_interval_ticks_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_interval_ticks[31]_i_2_n_0\,
      D => \active_interval_ticks_reg[31]_0\(5),
      Q => active_interval_ticks(5),
      R => \^trigger_sticky_0\
    );
\active_interval_ticks_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_interval_ticks[31]_i_2_n_0\,
      D => \active_interval_ticks_reg[31]_0\(6),
      Q => active_interval_ticks(6),
      R => \^trigger_sticky_0\
    );
\active_interval_ticks_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_interval_ticks[31]_i_2_n_0\,
      D => \active_interval_ticks_reg[31]_0\(7),
      Q => active_interval_ticks(7),
      R => \^trigger_sticky_0\
    );
\active_interval_ticks_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_interval_ticks[31]_i_2_n_0\,
      D => \active_interval_ticks_reg[31]_0\(8),
      Q => active_interval_ticks(8),
      R => \^trigger_sticky_0\
    );
\active_interval_ticks_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_interval_ticks[31]_i_2_n_0\,
      D => \active_interval_ticks_reg[31]_0\(9),
      Q => active_interval_ticks(9),
      R => \^trigger_sticky_0\
    );
\active_sample_count_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_interval_ticks[31]_i_2_n_0\,
      D => \active_sample_count_reg[31]_0\(0),
      Q => active_sample_count(0),
      R => \^trigger_sticky_0\
    );
\active_sample_count_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_interval_ticks[31]_i_2_n_0\,
      D => \active_sample_count_reg[31]_0\(10),
      Q => active_sample_count(10),
      R => \^trigger_sticky_0\
    );
\active_sample_count_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_interval_ticks[31]_i_2_n_0\,
      D => \active_sample_count_reg[31]_0\(11),
      Q => active_sample_count(11),
      R => \^trigger_sticky_0\
    );
\active_sample_count_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_interval_ticks[31]_i_2_n_0\,
      D => \active_sample_count_reg[31]_0\(12),
      Q => active_sample_count(12),
      R => \^trigger_sticky_0\
    );
\active_sample_count_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_interval_ticks[31]_i_2_n_0\,
      D => \active_sample_count_reg[31]_0\(13),
      Q => active_sample_count(13),
      R => \^trigger_sticky_0\
    );
\active_sample_count_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_interval_ticks[31]_i_2_n_0\,
      D => \active_sample_count_reg[31]_0\(14),
      Q => active_sample_count(14),
      R => \^trigger_sticky_0\
    );
\active_sample_count_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_interval_ticks[31]_i_2_n_0\,
      D => \active_sample_count_reg[31]_0\(15),
      Q => active_sample_count(15),
      R => \^trigger_sticky_0\
    );
\active_sample_count_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_interval_ticks[31]_i_2_n_0\,
      D => \active_sample_count_reg[31]_0\(16),
      Q => active_sample_count(16),
      R => \^trigger_sticky_0\
    );
\active_sample_count_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_interval_ticks[31]_i_2_n_0\,
      D => \active_sample_count_reg[31]_0\(17),
      Q => active_sample_count(17),
      R => \^trigger_sticky_0\
    );
\active_sample_count_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_interval_ticks[31]_i_2_n_0\,
      D => \active_sample_count_reg[31]_0\(18),
      Q => active_sample_count(18),
      R => \^trigger_sticky_0\
    );
\active_sample_count_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_interval_ticks[31]_i_2_n_0\,
      D => \active_sample_count_reg[31]_0\(19),
      Q => active_sample_count(19),
      R => \^trigger_sticky_0\
    );
\active_sample_count_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_interval_ticks[31]_i_2_n_0\,
      D => \active_sample_count_reg[31]_0\(1),
      Q => active_sample_count(1),
      R => \^trigger_sticky_0\
    );
\active_sample_count_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_interval_ticks[31]_i_2_n_0\,
      D => \active_sample_count_reg[31]_0\(20),
      Q => active_sample_count(20),
      R => \^trigger_sticky_0\
    );
\active_sample_count_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_interval_ticks[31]_i_2_n_0\,
      D => \active_sample_count_reg[31]_0\(21),
      Q => active_sample_count(21),
      R => \^trigger_sticky_0\
    );
\active_sample_count_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_interval_ticks[31]_i_2_n_0\,
      D => \active_sample_count_reg[31]_0\(22),
      Q => active_sample_count(22),
      R => \^trigger_sticky_0\
    );
\active_sample_count_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_interval_ticks[31]_i_2_n_0\,
      D => \active_sample_count_reg[31]_0\(23),
      Q => active_sample_count(23),
      R => \^trigger_sticky_0\
    );
\active_sample_count_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_interval_ticks[31]_i_2_n_0\,
      D => \active_sample_count_reg[31]_0\(24),
      Q => active_sample_count(24),
      R => \^trigger_sticky_0\
    );
\active_sample_count_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_interval_ticks[31]_i_2_n_0\,
      D => \active_sample_count_reg[31]_0\(25),
      Q => active_sample_count(25),
      R => \^trigger_sticky_0\
    );
\active_sample_count_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_interval_ticks[31]_i_2_n_0\,
      D => \active_sample_count_reg[31]_0\(26),
      Q => active_sample_count(26),
      R => \^trigger_sticky_0\
    );
\active_sample_count_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_interval_ticks[31]_i_2_n_0\,
      D => \active_sample_count_reg[31]_0\(27),
      Q => active_sample_count(27),
      R => \^trigger_sticky_0\
    );
\active_sample_count_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_interval_ticks[31]_i_2_n_0\,
      D => \active_sample_count_reg[31]_0\(28),
      Q => active_sample_count(28),
      R => \^trigger_sticky_0\
    );
\active_sample_count_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_interval_ticks[31]_i_2_n_0\,
      D => \active_sample_count_reg[31]_0\(29),
      Q => active_sample_count(29),
      R => \^trigger_sticky_0\
    );
\active_sample_count_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_interval_ticks[31]_i_2_n_0\,
      D => \active_sample_count_reg[31]_0\(2),
      Q => active_sample_count(2),
      R => \^trigger_sticky_0\
    );
\active_sample_count_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_interval_ticks[31]_i_2_n_0\,
      D => \active_sample_count_reg[31]_0\(30),
      Q => active_sample_count(30),
      R => \^trigger_sticky_0\
    );
\active_sample_count_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_interval_ticks[31]_i_2_n_0\,
      D => \active_sample_count_reg[31]_0\(31),
      Q => active_sample_count(31),
      R => \^trigger_sticky_0\
    );
\active_sample_count_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_interval_ticks[31]_i_2_n_0\,
      D => \active_sample_count_reg[31]_0\(3),
      Q => active_sample_count(3),
      R => \^trigger_sticky_0\
    );
\active_sample_count_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_interval_ticks[31]_i_2_n_0\,
      D => \active_sample_count_reg[31]_0\(4),
      Q => active_sample_count(4),
      R => \^trigger_sticky_0\
    );
\active_sample_count_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_interval_ticks[31]_i_2_n_0\,
      D => \active_sample_count_reg[31]_0\(5),
      Q => active_sample_count(5),
      R => \^trigger_sticky_0\
    );
\active_sample_count_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_interval_ticks[31]_i_2_n_0\,
      D => \active_sample_count_reg[31]_0\(6),
      Q => active_sample_count(6),
      R => \^trigger_sticky_0\
    );
\active_sample_count_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_interval_ticks[31]_i_2_n_0\,
      D => \active_sample_count_reg[31]_0\(7),
      Q => active_sample_count(7),
      R => \^trigger_sticky_0\
    );
\active_sample_count_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_interval_ticks[31]_i_2_n_0\,
      D => \active_sample_count_reg[31]_0\(8),
      Q => active_sample_count(8),
      R => \^trigger_sticky_0\
    );
\active_sample_count_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_interval_ticks[31]_i_2_n_0\,
      D => \active_sample_count_reg[31]_0\(9),
      Q => active_sample_count(9),
      R => \^trigger_sticky_0\
    );
\arm_interval[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000100"
    )
        port map (
      I0 => arm_wait_reg,
      I1 => arm_wait_reg_0,
      I2 => \arm_interval[31]_i_4_n_0\,
      I3 => arm_wait_reg_1,
      I4 => arm_wait_reg_2,
      I5 => arm_wait_reg_3,
      O => \^e\(0)
    );
\arm_interval[31]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => arm_valid_reg_2,
      I1 => arm_wait_reg_4,
      I2 => \^trigger_sticky_0\,
      I3 => \captured_count_reg[0]_0\,
      I4 => armed,
      I5 => busy,
      O => \arm_interval[31]_i_4_n_0\
    );
arm_valid_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"ABBBBBBBA8888888"
    )
        port map (
      I0 => \^e\(0),
      I1 => \active_interval_ticks[31]_i_3_n_0\,
      I2 => arm_valid_reg_3,
      I3 => arm_valid_reg_4,
      I4 => \^shadow_count_reg[24]\,
      I5 => arm_valid_reg_0,
      O => arm_valid_reg
    );
armed_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FE020202"
    )
        port map (
      I0 => armed,
      I1 => \active_interval_ticks[31]_i_2_n_0\,
      I2 => armed7_out,
      I3 => busy_reg_0,
      I4 => \active_interval_ticks[31]_i_3_n_0\,
      I5 => armed_i_2_n_0,
      O => armed_i_1_n_0
    );
armed_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFDDDDD"
    )
        port map (
      I0 => s_axi_aresetn,
      I1 => invalidate_in,
      I2 => busy,
      I3 => armed,
      I4 => \captured_count_reg[0]_0\,
      O => armed_i_2_n_0
    );
armed_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => armed_i_1_n_0,
      Q => armed,
      R => '0'
    );
busy0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => busy0_carry_n_0,
      CO(2) => busy0_carry_n_1,
      CO(1) => busy0_carry_n_2,
      CO(0) => busy0_carry_n_3,
      CYINIT => '1',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => NLW_busy0_carry_O_UNCONNECTED(3 downto 0),
      S(3) => busy0_carry_i_1_n_0,
      S(2) => busy0_carry_i_2_n_0,
      S(1) => busy0_carry_i_3_n_0,
      S(0) => busy0_carry_i_4_n_0
    );
\busy0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => busy0_carry_n_0,
      CO(3) => \busy0_carry__0_n_0\,
      CO(2) => \busy0_carry__0_n_1\,
      CO(1) => \busy0_carry__0_n_2\,
      CO(0) => \busy0_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_busy0_carry__0_O_UNCONNECTED\(3 downto 0),
      S(3) => \busy0_carry__0_i_1_n_0\,
      S(2) => \busy0_carry__0_i_2_n_0\,
      S(1) => \busy0_carry__0_i_3_n_0\,
      S(0) => \busy0_carry__0_i_4_n_0\
    );
\busy0_carry__0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => active_sample_count(23),
      I1 => p_0_in(23),
      I2 => p_0_in(22),
      I3 => active_sample_count(22),
      I4 => p_0_in(21),
      I5 => active_sample_count(21),
      O => \busy0_carry__0_i_1_n_0\
    );
\busy0_carry__0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => active_sample_count(20),
      I1 => p_0_in(20),
      I2 => p_0_in(18),
      I3 => active_sample_count(18),
      I4 => p_0_in(19),
      I5 => active_sample_count(19),
      O => \busy0_carry__0_i_2_n_0\
    );
\busy0_carry__0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => active_sample_count(17),
      I1 => p_0_in(17),
      I2 => p_0_in(15),
      I3 => active_sample_count(15),
      I4 => p_0_in(16),
      I5 => active_sample_count(16),
      O => \busy0_carry__0_i_3_n_0\
    );
\busy0_carry__0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => active_sample_count(14),
      I1 => p_0_in(14),
      I2 => p_0_in(12),
      I3 => active_sample_count(12),
      I4 => p_0_in(13),
      I5 => active_sample_count(13),
      O => \busy0_carry__0_i_4_n_0\
    );
\busy0_carry__0_i_5\: unisim.vcomponents.CARRY4
     port map (
      CI => \busy0_carry__0_i_6_n_0\,
      CO(3) => \busy0_carry__0_i_5_n_0\,
      CO(2) => \busy0_carry__0_i_5_n_1\,
      CO(1) => \busy0_carry__0_i_5_n_2\,
      CO(0) => \busy0_carry__0_i_5_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_0_in(24 downto 21),
      S(3 downto 0) => captured_count_reg(24 downto 21)
    );
\busy0_carry__0_i_6\: unisim.vcomponents.CARRY4
     port map (
      CI => \busy0_carry__0_i_7_n_0\,
      CO(3) => \busy0_carry__0_i_6_n_0\,
      CO(2) => \busy0_carry__0_i_6_n_1\,
      CO(1) => \busy0_carry__0_i_6_n_2\,
      CO(0) => \busy0_carry__0_i_6_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_0_in(20 downto 17),
      S(3 downto 0) => captured_count_reg(20 downto 17)
    );
\busy0_carry__0_i_7\: unisim.vcomponents.CARRY4
     port map (
      CI => busy0_carry_i_5_n_0,
      CO(3) => \busy0_carry__0_i_7_n_0\,
      CO(2) => \busy0_carry__0_i_7_n_1\,
      CO(1) => \busy0_carry__0_i_7_n_2\,
      CO(0) => \busy0_carry__0_i_7_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_0_in(16 downto 13),
      S(3 downto 0) => captured_count_reg(16 downto 13)
    );
\busy0_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \busy0_carry__0_n_0\,
      CO(3) => \NLW_busy0_carry__1_CO_UNCONNECTED\(3),
      CO(2) => busy0,
      CO(1) => \busy0_carry__1_n_2\,
      CO(0) => \busy0_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_busy0_carry__1_O_UNCONNECTED\(3 downto 0),
      S(3) => '0',
      S(2) => \busy0_carry__1_i_1_n_0\,
      S(1) => \busy0_carry__1_i_2_n_0\,
      S(0) => \busy0_carry__1_i_3_n_0\
    );
\busy0_carry__1_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => active_sample_count(31),
      I1 => p_0_in(31),
      I2 => active_sample_count(30),
      I3 => p_0_in(30),
      O => \busy0_carry__1_i_1_n_0\
    );
\busy0_carry__1_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => active_sample_count(29),
      I1 => p_0_in(29),
      I2 => p_0_in(27),
      I3 => active_sample_count(27),
      I4 => p_0_in(28),
      I5 => active_sample_count(28),
      O => \busy0_carry__1_i_2_n_0\
    );
\busy0_carry__1_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => active_sample_count(26),
      I1 => p_0_in(26),
      I2 => p_0_in(24),
      I3 => active_sample_count(24),
      I4 => p_0_in(25),
      I5 => active_sample_count(25),
      O => \busy0_carry__1_i_3_n_0\
    );
\busy0_carry__1_i_4\: unisim.vcomponents.CARRY4
     port map (
      CI => \busy0_carry__1_i_5_n_0\,
      CO(3 downto 2) => \NLW_busy0_carry__1_i_4_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \busy0_carry__1_i_4_n_2\,
      CO(0) => \busy0_carry__1_i_4_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_busy0_carry__1_i_4_O_UNCONNECTED\(3),
      O(2 downto 0) => p_0_in(31 downto 29),
      S(3) => '0',
      S(2 downto 0) => captured_count_reg(31 downto 29)
    );
\busy0_carry__1_i_5\: unisim.vcomponents.CARRY4
     port map (
      CI => \busy0_carry__0_i_5_n_0\,
      CO(3) => \busy0_carry__1_i_5_n_0\,
      CO(2) => \busy0_carry__1_i_5_n_1\,
      CO(1) => \busy0_carry__1_i_5_n_2\,
      CO(0) => \busy0_carry__1_i_5_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_0_in(28 downto 25),
      S(3 downto 0) => captured_count_reg(28 downto 25)
    );
busy0_carry_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => active_sample_count(11),
      I1 => p_0_in(11),
      I2 => p_0_in(9),
      I3 => active_sample_count(9),
      I4 => p_0_in(10),
      I5 => active_sample_count(10),
      O => busy0_carry_i_1_n_0
    );
busy0_carry_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => active_sample_count(8),
      I1 => p_0_in(8),
      I2 => p_0_in(7),
      I3 => active_sample_count(7),
      I4 => p_0_in(6),
      I5 => active_sample_count(6),
      O => busy0_carry_i_2_n_0
    );
busy0_carry_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => active_sample_count(5),
      I1 => p_0_in(5),
      I2 => p_0_in(4),
      I3 => active_sample_count(4),
      I4 => p_0_in(3),
      I5 => active_sample_count(3),
      O => busy0_carry_i_3_n_0
    );
busy0_carry_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6006000000006006"
    )
        port map (
      I0 => captured_count(0),
      I1 => active_sample_count(0),
      I2 => p_0_in(2),
      I3 => active_sample_count(2),
      I4 => p_0_in(1),
      I5 => active_sample_count(1),
      O => busy0_carry_i_4_n_0
    );
busy0_carry_i_5: unisim.vcomponents.CARRY4
     port map (
      CI => busy0_carry_i_6_n_0,
      CO(3) => busy0_carry_i_5_n_0,
      CO(2) => busy0_carry_i_5_n_1,
      CO(1) => busy0_carry_i_5_n_2,
      CO(0) => busy0_carry_i_5_n_3,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_0_in(12 downto 9),
      S(3 downto 1) => captured_count_reg(12 downto 10),
      S(0) => captured_count(9)
    );
busy0_carry_i_6: unisim.vcomponents.CARRY4
     port map (
      CI => busy0_carry_i_7_n_0,
      CO(3) => busy0_carry_i_6_n_0,
      CO(2) => busy0_carry_i_6_n_1,
      CO(1) => busy0_carry_i_6_n_2,
      CO(0) => busy0_carry_i_6_n_3,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_0_in(8 downto 5),
      S(3 downto 0) => captured_count(8 downto 5)
    );
busy0_carry_i_7: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => busy0_carry_i_7_n_0,
      CO(2) => busy0_carry_i_7_n_1,
      CO(1) => busy0_carry_i_7_n_2,
      CO(0) => busy0_carry_i_7_n_3,
      CYINIT => captured_count(0),
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_0_in(4 downto 1),
      S(3 downto 0) => captured_count(4 downto 1)
    );
busy_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000151055551510"
    )
        port map (
      I0 => armed_i_2_n_0,
      I1 => busy_reg_0,
      I2 => \active_interval_ticks[31]_i_2_n_0\,
      I3 => busy,
      I4 => armed7_out,
      I5 => busy0,
      O => busy_i_1_n_0
    );
busy_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => busy_i_1_n_0,
      Q => busy,
      R => '0'
    );
cancel_pulse_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000040000000"
    )
        port map (
      I0 => cancel_pulse_reg,
      I1 => soft_trigger_reg(0),
      I2 => cancel_pulse_reg_0(0),
      I3 => \^shadow_count_reg[24]\,
      I4 => address_pending0,
      I5 => \^trigger_sticky_0\,
      O => \write_data_reg[1]\
    );
cancelled_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A8"
    )
        port map (
      I0 => \captured_count_reg[0]_0\,
      I1 => armed,
      I2 => busy,
      O => cancelled_i_1_n_0
    );
cancelled_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => cancelled_i_1_n_0,
      Q => cancelled,
      R => \^trigger_sticky_0\
    );
capture_active_INST_0: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => capture_active_0,
      I1 => memory_pending_reg_0,
      I2 => busy,
      I3 => armed,
      I4 => arm_valid_reg_0,
      O => capture_active
    );
\captured_count[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FD"
    )
        port map (
      I0 => s_axi_aresetn,
      I1 => invalidate_in,
      I2 => \active_interval_ticks[31]_i_2_n_0\,
      O => \captured_count[0]_i_1_n_0\
    );
\captured_count[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1111111100000010"
    )
        port map (
      I0 => \^trigger_sticky_0\,
      I1 => \captured_count_reg[0]_0\,
      I2 => sample_memory_reg_i_7_n_0,
      I3 => sample_memory_reg_i_6_n_0,
      I4 => sample_memory_reg_i_5_n_0,
      I5 => \captured_count[0]_i_4_n_0\,
      O => armed7_out
    );
\captured_count[0]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A8"
    )
        port map (
      I0 => armed,
      I1 => trigger_in,
      I2 => sample_memory_reg_0,
      O => \captured_count[0]_i_4_n_0\
    );
\captured_count[0]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => captured_count(0),
      O => p_0_in(0)
    );
\captured_count_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => armed7_out,
      D => \captured_count_reg[0]_i_3_n_7\,
      Q => captured_count(0),
      R => \captured_count[0]_i_1_n_0\
    );
\captured_count_reg[0]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \captured_count_reg[0]_i_3_n_0\,
      CO(2) => \captured_count_reg[0]_i_3_n_1\,
      CO(1) => \captured_count_reg[0]_i_3_n_2\,
      CO(0) => \captured_count_reg[0]_i_3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \captured_count_reg[0]_i_3_n_4\,
      O(2) => \captured_count_reg[0]_i_3_n_5\,
      O(1) => \captured_count_reg[0]_i_3_n_6\,
      O(0) => \captured_count_reg[0]_i_3_n_7\,
      S(3 downto 1) => captured_count(3 downto 1),
      S(0) => p_0_in(0)
    );
\captured_count_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => armed7_out,
      D => \captured_count_reg[8]_i_1_n_5\,
      Q => captured_count_reg(10),
      R => \captured_count[0]_i_1_n_0\
    );
\captured_count_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => armed7_out,
      D => \captured_count_reg[8]_i_1_n_4\,
      Q => captured_count_reg(11),
      R => \captured_count[0]_i_1_n_0\
    );
\captured_count_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => armed7_out,
      D => \captured_count_reg[12]_i_1_n_7\,
      Q => captured_count_reg(12),
      R => \captured_count[0]_i_1_n_0\
    );
\captured_count_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \captured_count_reg[8]_i_1_n_0\,
      CO(3) => \captured_count_reg[12]_i_1_n_0\,
      CO(2) => \captured_count_reg[12]_i_1_n_1\,
      CO(1) => \captured_count_reg[12]_i_1_n_2\,
      CO(0) => \captured_count_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \captured_count_reg[12]_i_1_n_4\,
      O(2) => \captured_count_reg[12]_i_1_n_5\,
      O(1) => \captured_count_reg[12]_i_1_n_6\,
      O(0) => \captured_count_reg[12]_i_1_n_7\,
      S(3 downto 0) => captured_count_reg(15 downto 12)
    );
\captured_count_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => armed7_out,
      D => \captured_count_reg[12]_i_1_n_6\,
      Q => captured_count_reg(13),
      R => \captured_count[0]_i_1_n_0\
    );
\captured_count_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => armed7_out,
      D => \captured_count_reg[12]_i_1_n_5\,
      Q => captured_count_reg(14),
      R => \captured_count[0]_i_1_n_0\
    );
\captured_count_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => armed7_out,
      D => \captured_count_reg[12]_i_1_n_4\,
      Q => captured_count_reg(15),
      R => \captured_count[0]_i_1_n_0\
    );
\captured_count_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => armed7_out,
      D => \captured_count_reg[16]_i_1_n_7\,
      Q => captured_count_reg(16),
      R => \captured_count[0]_i_1_n_0\
    );
\captured_count_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \captured_count_reg[12]_i_1_n_0\,
      CO(3) => \captured_count_reg[16]_i_1_n_0\,
      CO(2) => \captured_count_reg[16]_i_1_n_1\,
      CO(1) => \captured_count_reg[16]_i_1_n_2\,
      CO(0) => \captured_count_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \captured_count_reg[16]_i_1_n_4\,
      O(2) => \captured_count_reg[16]_i_1_n_5\,
      O(1) => \captured_count_reg[16]_i_1_n_6\,
      O(0) => \captured_count_reg[16]_i_1_n_7\,
      S(3 downto 0) => captured_count_reg(19 downto 16)
    );
\captured_count_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => armed7_out,
      D => \captured_count_reg[16]_i_1_n_6\,
      Q => captured_count_reg(17),
      R => \captured_count[0]_i_1_n_0\
    );
\captured_count_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => armed7_out,
      D => \captured_count_reg[16]_i_1_n_5\,
      Q => captured_count_reg(18),
      R => \captured_count[0]_i_1_n_0\
    );
\captured_count_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => armed7_out,
      D => \captured_count_reg[16]_i_1_n_4\,
      Q => captured_count_reg(19),
      R => \captured_count[0]_i_1_n_0\
    );
\captured_count_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => armed7_out,
      D => \captured_count_reg[0]_i_3_n_6\,
      Q => captured_count(1),
      R => \captured_count[0]_i_1_n_0\
    );
\captured_count_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => armed7_out,
      D => \captured_count_reg[20]_i_1_n_7\,
      Q => captured_count_reg(20),
      R => \captured_count[0]_i_1_n_0\
    );
\captured_count_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \captured_count_reg[16]_i_1_n_0\,
      CO(3) => \captured_count_reg[20]_i_1_n_0\,
      CO(2) => \captured_count_reg[20]_i_1_n_1\,
      CO(1) => \captured_count_reg[20]_i_1_n_2\,
      CO(0) => \captured_count_reg[20]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \captured_count_reg[20]_i_1_n_4\,
      O(2) => \captured_count_reg[20]_i_1_n_5\,
      O(1) => \captured_count_reg[20]_i_1_n_6\,
      O(0) => \captured_count_reg[20]_i_1_n_7\,
      S(3 downto 0) => captured_count_reg(23 downto 20)
    );
\captured_count_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => armed7_out,
      D => \captured_count_reg[20]_i_1_n_6\,
      Q => captured_count_reg(21),
      R => \captured_count[0]_i_1_n_0\
    );
\captured_count_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => armed7_out,
      D => \captured_count_reg[20]_i_1_n_5\,
      Q => captured_count_reg(22),
      R => \captured_count[0]_i_1_n_0\
    );
\captured_count_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => armed7_out,
      D => \captured_count_reg[20]_i_1_n_4\,
      Q => captured_count_reg(23),
      R => \captured_count[0]_i_1_n_0\
    );
\captured_count_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => armed7_out,
      D => \captured_count_reg[24]_i_1_n_7\,
      Q => captured_count_reg(24),
      R => \captured_count[0]_i_1_n_0\
    );
\captured_count_reg[24]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \captured_count_reg[20]_i_1_n_0\,
      CO(3) => \captured_count_reg[24]_i_1_n_0\,
      CO(2) => \captured_count_reg[24]_i_1_n_1\,
      CO(1) => \captured_count_reg[24]_i_1_n_2\,
      CO(0) => \captured_count_reg[24]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \captured_count_reg[24]_i_1_n_4\,
      O(2) => \captured_count_reg[24]_i_1_n_5\,
      O(1) => \captured_count_reg[24]_i_1_n_6\,
      O(0) => \captured_count_reg[24]_i_1_n_7\,
      S(3 downto 0) => captured_count_reg(27 downto 24)
    );
\captured_count_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => armed7_out,
      D => \captured_count_reg[24]_i_1_n_6\,
      Q => captured_count_reg(25),
      R => \captured_count[0]_i_1_n_0\
    );
\captured_count_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => armed7_out,
      D => \captured_count_reg[24]_i_1_n_5\,
      Q => captured_count_reg(26),
      R => \captured_count[0]_i_1_n_0\
    );
\captured_count_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => armed7_out,
      D => \captured_count_reg[24]_i_1_n_4\,
      Q => captured_count_reg(27),
      R => \captured_count[0]_i_1_n_0\
    );
\captured_count_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => armed7_out,
      D => \captured_count_reg[28]_i_1_n_7\,
      Q => captured_count_reg(28),
      R => \captured_count[0]_i_1_n_0\
    );
\captured_count_reg[28]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \captured_count_reg[24]_i_1_n_0\,
      CO(3) => \NLW_captured_count_reg[28]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \captured_count_reg[28]_i_1_n_1\,
      CO(1) => \captured_count_reg[28]_i_1_n_2\,
      CO(0) => \captured_count_reg[28]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \captured_count_reg[28]_i_1_n_4\,
      O(2) => \captured_count_reg[28]_i_1_n_5\,
      O(1) => \captured_count_reg[28]_i_1_n_6\,
      O(0) => \captured_count_reg[28]_i_1_n_7\,
      S(3 downto 0) => captured_count_reg(31 downto 28)
    );
\captured_count_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => armed7_out,
      D => \captured_count_reg[28]_i_1_n_6\,
      Q => captured_count_reg(29),
      R => \captured_count[0]_i_1_n_0\
    );
\captured_count_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => armed7_out,
      D => \captured_count_reg[0]_i_3_n_5\,
      Q => captured_count(2),
      R => \captured_count[0]_i_1_n_0\
    );
\captured_count_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => armed7_out,
      D => \captured_count_reg[28]_i_1_n_5\,
      Q => captured_count_reg(30),
      R => \captured_count[0]_i_1_n_0\
    );
\captured_count_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => armed7_out,
      D => \captured_count_reg[28]_i_1_n_4\,
      Q => captured_count_reg(31),
      R => \captured_count[0]_i_1_n_0\
    );
\captured_count_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => armed7_out,
      D => \captured_count_reg[0]_i_3_n_4\,
      Q => captured_count(3),
      R => \captured_count[0]_i_1_n_0\
    );
\captured_count_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => armed7_out,
      D => \captured_count_reg[4]_i_1_n_7\,
      Q => captured_count(4),
      R => \captured_count[0]_i_1_n_0\
    );
\captured_count_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \captured_count_reg[0]_i_3_n_0\,
      CO(3) => \captured_count_reg[4]_i_1_n_0\,
      CO(2) => \captured_count_reg[4]_i_1_n_1\,
      CO(1) => \captured_count_reg[4]_i_1_n_2\,
      CO(0) => \captured_count_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \captured_count_reg[4]_i_1_n_4\,
      O(2) => \captured_count_reg[4]_i_1_n_5\,
      O(1) => \captured_count_reg[4]_i_1_n_6\,
      O(0) => \captured_count_reg[4]_i_1_n_7\,
      S(3 downto 0) => captured_count(7 downto 4)
    );
\captured_count_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => armed7_out,
      D => \captured_count_reg[4]_i_1_n_6\,
      Q => captured_count(5),
      R => \captured_count[0]_i_1_n_0\
    );
\captured_count_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => armed7_out,
      D => \captured_count_reg[4]_i_1_n_5\,
      Q => captured_count(6),
      R => \captured_count[0]_i_1_n_0\
    );
\captured_count_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => armed7_out,
      D => \captured_count_reg[4]_i_1_n_4\,
      Q => captured_count(7),
      R => \captured_count[0]_i_1_n_0\
    );
\captured_count_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => armed7_out,
      D => \captured_count_reg[8]_i_1_n_7\,
      Q => captured_count(8),
      R => \captured_count[0]_i_1_n_0\
    );
\captured_count_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \captured_count_reg[4]_i_1_n_0\,
      CO(3) => \captured_count_reg[8]_i_1_n_0\,
      CO(2) => \captured_count_reg[8]_i_1_n_1\,
      CO(1) => \captured_count_reg[8]_i_1_n_2\,
      CO(0) => \captured_count_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \captured_count_reg[8]_i_1_n_4\,
      O(2) => \captured_count_reg[8]_i_1_n_5\,
      O(1) => \captured_count_reg[8]_i_1_n_6\,
      O(0) => \captured_count_reg[8]_i_1_n_7\,
      S(3 downto 2) => captured_count_reg(11 downto 10),
      S(1 downto 0) => captured_count(9 downto 8)
    );
\captured_count_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => armed7_out,
      D => \captured_count_reg[8]_i_1_n_6\,
      Q => captured_count(9),
      R => \captured_count[0]_i_1_n_0\
    );
cfg_error_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0001000000000000"
    )
        port map (
      I0 => \^trigger_sticky_0\,
      I1 => \captured_count_reg[0]_0\,
      I2 => armed,
      I3 => busy,
      I4 => arm_valid_reg_0,
      I5 => cfg_error_i_2_n_0,
      O => cfg_error_i_1_n_0
    );
cfg_error_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFFEEFFEFFFFEFFE"
    )
        port map (
      I0 => \active_interval_ticks[31]_i_7_n_0\,
      I1 => \active_interval_ticks[31]_i_6_n_0\,
      I2 => \active_interval_ticks[31]_i_5_n_0\,
      I3 => \active_sample_count_reg[31]_0\(10),
      I4 => cfg_error_i_3_n_0,
      I5 => cfg_error_i_4_n_0,
      O => cfg_error_i_2_n_0
    );
cfg_error_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => \active_interval_ticks[31]_i_16_n_0\,
      I1 => \active_interval_ticks_reg[31]_0\(20),
      I2 => \active_interval_ticks_reg[31]_0\(18),
      I3 => \active_interval_ticks_reg[31]_0\(29),
      I4 => \active_interval_ticks_reg[31]_0\(3),
      I5 => \active_interval_ticks[31]_i_8_n_0\,
      O => cfg_error_i_3_n_0
    );
cfg_error_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \active_interval_ticks[31]_i_18_n_0\,
      I1 => \active_interval_ticks_reg[31]_0\(25),
      I2 => \active_interval_ticks_reg[31]_0\(2),
      I3 => \active_interval_ticks_reg[31]_0\(30),
      I4 => \active_interval_ticks_reg[31]_0\(1),
      I5 => \active_interval_ticks[31]_i_10_n_0\,
      O => cfg_error_i_4_n_0
    );
cfg_error_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => cfg_error_i_1_n_0,
      Q => cfg_error,
      R => '0'
    );
done_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000000000EA"
    )
        port map (
      I0 => record_valid,
      I1 => busy0,
      I2 => armed7_out,
      I3 => \^trigger_sticky_0\,
      I4 => \active_interval_ticks[31]_i_2_n_0\,
      I5 => cancelled_i_1_n_0,
      O => done_i_1_n_0
    );
done_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => done_i_1_n_0,
      Q => record_valid,
      R => '0'
    );
\interval_remaining[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFE0FFFFFFFF"
    )
        port map (
      I0 => busy,
      I1 => armed,
      I2 => \captured_count_reg[0]_0\,
      I3 => \active_interval_ticks[31]_i_2_n_0\,
      I4 => invalidate_in,
      I5 => s_axi_aresetn,
      O => \interval_remaining[0]_i_1_n_0\
    );
\interval_remaining[0]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => armed7_out,
      I1 => \captured_count_reg[0]_0\,
      I2 => busy,
      O => interval_remaining
    );
\interval_remaining[0]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => interval_remaining_reg(3),
      I1 => armed7_out,
      I2 => active_interval_ticks(3),
      O => \interval_remaining[0]_i_4_n_0\
    );
\interval_remaining[0]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => interval_remaining_reg(2),
      I1 => armed7_out,
      I2 => active_interval_ticks(2),
      O => \interval_remaining[0]_i_5_n_0\
    );
\interval_remaining[0]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => interval_remaining_reg(1),
      I1 => armed7_out,
      I2 => active_interval_ticks(1),
      O => \interval_remaining[0]_i_6_n_0\
    );
\interval_remaining[0]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => interval_remaining_reg(0),
      I1 => armed7_out,
      I2 => active_interval_ticks(0),
      O => \interval_remaining[0]_i_7_n_0\
    );
\interval_remaining[12]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => interval_remaining_reg(15),
      I1 => armed7_out,
      I2 => active_interval_ticks(15),
      O => \interval_remaining[12]_i_2_n_0\
    );
\interval_remaining[12]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => interval_remaining_reg(14),
      I1 => armed7_out,
      I2 => active_interval_ticks(14),
      O => \interval_remaining[12]_i_3_n_0\
    );
\interval_remaining[12]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => interval_remaining_reg(13),
      I1 => armed7_out,
      I2 => active_interval_ticks(13),
      O => \interval_remaining[12]_i_4_n_0\
    );
\interval_remaining[12]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => interval_remaining_reg(12),
      I1 => armed7_out,
      I2 => active_interval_ticks(12),
      O => \interval_remaining[12]_i_5_n_0\
    );
\interval_remaining[16]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => interval_remaining_reg(19),
      I1 => armed7_out,
      I2 => active_interval_ticks(19),
      O => \interval_remaining[16]_i_2_n_0\
    );
\interval_remaining[16]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => interval_remaining_reg(18),
      I1 => armed7_out,
      I2 => active_interval_ticks(18),
      O => \interval_remaining[16]_i_3_n_0\
    );
\interval_remaining[16]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => interval_remaining_reg(17),
      I1 => armed7_out,
      I2 => active_interval_ticks(17),
      O => \interval_remaining[16]_i_4_n_0\
    );
\interval_remaining[16]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => interval_remaining_reg(16),
      I1 => armed7_out,
      I2 => active_interval_ticks(16),
      O => \interval_remaining[16]_i_5_n_0\
    );
\interval_remaining[20]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => interval_remaining_reg(23),
      I1 => armed7_out,
      I2 => active_interval_ticks(23),
      O => \interval_remaining[20]_i_2_n_0\
    );
\interval_remaining[20]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => interval_remaining_reg(22),
      I1 => armed7_out,
      I2 => active_interval_ticks(22),
      O => \interval_remaining[20]_i_3_n_0\
    );
\interval_remaining[20]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => interval_remaining_reg(21),
      I1 => armed7_out,
      I2 => active_interval_ticks(21),
      O => \interval_remaining[20]_i_4_n_0\
    );
\interval_remaining[20]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => interval_remaining_reg(20),
      I1 => armed7_out,
      I2 => active_interval_ticks(20),
      O => \interval_remaining[20]_i_5_n_0\
    );
\interval_remaining[24]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => interval_remaining_reg(27),
      I1 => armed7_out,
      I2 => active_interval_ticks(27),
      O => \interval_remaining[24]_i_2_n_0\
    );
\interval_remaining[24]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => interval_remaining_reg(26),
      I1 => armed7_out,
      I2 => active_interval_ticks(26),
      O => \interval_remaining[24]_i_3_n_0\
    );
\interval_remaining[24]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => interval_remaining_reg(25),
      I1 => armed7_out,
      I2 => active_interval_ticks(25),
      O => \interval_remaining[24]_i_4_n_0\
    );
\interval_remaining[24]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => interval_remaining_reg(24),
      I1 => armed7_out,
      I2 => active_interval_ticks(24),
      O => \interval_remaining[24]_i_5_n_0\
    );
\interval_remaining[28]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => interval_remaining_reg(31),
      I1 => armed7_out,
      I2 => active_interval_ticks(31),
      O => \interval_remaining[28]_i_2_n_0\
    );
\interval_remaining[28]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => interval_remaining_reg(30),
      I1 => armed7_out,
      I2 => active_interval_ticks(30),
      O => \interval_remaining[28]_i_3_n_0\
    );
\interval_remaining[28]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => interval_remaining_reg(29),
      I1 => armed7_out,
      I2 => active_interval_ticks(29),
      O => \interval_remaining[28]_i_4_n_0\
    );
\interval_remaining[28]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => interval_remaining_reg(28),
      I1 => armed7_out,
      I2 => active_interval_ticks(28),
      O => \interval_remaining[28]_i_5_n_0\
    );
\interval_remaining[4]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => interval_remaining_reg(7),
      I1 => armed7_out,
      I2 => active_interval_ticks(7),
      O => \interval_remaining[4]_i_2_n_0\
    );
\interval_remaining[4]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => interval_remaining_reg(6),
      I1 => armed7_out,
      I2 => active_interval_ticks(6),
      O => \interval_remaining[4]_i_3_n_0\
    );
\interval_remaining[4]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => interval_remaining_reg(5),
      I1 => armed7_out,
      I2 => active_interval_ticks(5),
      O => \interval_remaining[4]_i_4_n_0\
    );
\interval_remaining[4]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => interval_remaining_reg(4),
      I1 => armed7_out,
      I2 => active_interval_ticks(4),
      O => \interval_remaining[4]_i_5_n_0\
    );
\interval_remaining[8]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => interval_remaining_reg(11),
      I1 => armed7_out,
      I2 => active_interval_ticks(11),
      O => \interval_remaining[8]_i_2_n_0\
    );
\interval_remaining[8]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => interval_remaining_reg(10),
      I1 => armed7_out,
      I2 => active_interval_ticks(10),
      O => \interval_remaining[8]_i_3_n_0\
    );
\interval_remaining[8]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => interval_remaining_reg(9),
      I1 => armed7_out,
      I2 => active_interval_ticks(9),
      O => \interval_remaining[8]_i_4_n_0\
    );
\interval_remaining[8]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => interval_remaining_reg(8),
      I1 => armed7_out,
      I2 => active_interval_ticks(8),
      O => \interval_remaining[8]_i_5_n_0\
    );
\interval_remaining_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => interval_remaining,
      D => \interval_remaining_reg[0]_i_3_n_7\,
      Q => interval_remaining_reg(0),
      R => \interval_remaining[0]_i_1_n_0\
    );
\interval_remaining_reg[0]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \interval_remaining_reg[0]_i_3_n_0\,
      CO(2) => \interval_remaining_reg[0]_i_3_n_1\,
      CO(1) => \interval_remaining_reg[0]_i_3_n_2\,
      CO(0) => \interval_remaining_reg[0]_i_3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"1111",
      O(3) => \interval_remaining_reg[0]_i_3_n_4\,
      O(2) => \interval_remaining_reg[0]_i_3_n_5\,
      O(1) => \interval_remaining_reg[0]_i_3_n_6\,
      O(0) => \interval_remaining_reg[0]_i_3_n_7\,
      S(3) => \interval_remaining[0]_i_4_n_0\,
      S(2) => \interval_remaining[0]_i_5_n_0\,
      S(1) => \interval_remaining[0]_i_6_n_0\,
      S(0) => \interval_remaining[0]_i_7_n_0\
    );
\interval_remaining_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => interval_remaining,
      D => \interval_remaining_reg[8]_i_1_n_5\,
      Q => interval_remaining_reg(10),
      R => \interval_remaining[0]_i_1_n_0\
    );
\interval_remaining_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => interval_remaining,
      D => \interval_remaining_reg[8]_i_1_n_4\,
      Q => interval_remaining_reg(11),
      R => \interval_remaining[0]_i_1_n_0\
    );
\interval_remaining_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => interval_remaining,
      D => \interval_remaining_reg[12]_i_1_n_7\,
      Q => interval_remaining_reg(12),
      R => \interval_remaining[0]_i_1_n_0\
    );
\interval_remaining_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \interval_remaining_reg[8]_i_1_n_0\,
      CO(3) => \interval_remaining_reg[12]_i_1_n_0\,
      CO(2) => \interval_remaining_reg[12]_i_1_n_1\,
      CO(1) => \interval_remaining_reg[12]_i_1_n_2\,
      CO(0) => \interval_remaining_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"1111",
      O(3) => \interval_remaining_reg[12]_i_1_n_4\,
      O(2) => \interval_remaining_reg[12]_i_1_n_5\,
      O(1) => \interval_remaining_reg[12]_i_1_n_6\,
      O(0) => \interval_remaining_reg[12]_i_1_n_7\,
      S(3) => \interval_remaining[12]_i_2_n_0\,
      S(2) => \interval_remaining[12]_i_3_n_0\,
      S(1) => \interval_remaining[12]_i_4_n_0\,
      S(0) => \interval_remaining[12]_i_5_n_0\
    );
\interval_remaining_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => interval_remaining,
      D => \interval_remaining_reg[12]_i_1_n_6\,
      Q => interval_remaining_reg(13),
      R => \interval_remaining[0]_i_1_n_0\
    );
\interval_remaining_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => interval_remaining,
      D => \interval_remaining_reg[12]_i_1_n_5\,
      Q => interval_remaining_reg(14),
      R => \interval_remaining[0]_i_1_n_0\
    );
\interval_remaining_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => interval_remaining,
      D => \interval_remaining_reg[12]_i_1_n_4\,
      Q => interval_remaining_reg(15),
      R => \interval_remaining[0]_i_1_n_0\
    );
\interval_remaining_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => interval_remaining,
      D => \interval_remaining_reg[16]_i_1_n_7\,
      Q => interval_remaining_reg(16),
      R => \interval_remaining[0]_i_1_n_0\
    );
\interval_remaining_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \interval_remaining_reg[12]_i_1_n_0\,
      CO(3) => \interval_remaining_reg[16]_i_1_n_0\,
      CO(2) => \interval_remaining_reg[16]_i_1_n_1\,
      CO(1) => \interval_remaining_reg[16]_i_1_n_2\,
      CO(0) => \interval_remaining_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"1111",
      O(3) => \interval_remaining_reg[16]_i_1_n_4\,
      O(2) => \interval_remaining_reg[16]_i_1_n_5\,
      O(1) => \interval_remaining_reg[16]_i_1_n_6\,
      O(0) => \interval_remaining_reg[16]_i_1_n_7\,
      S(3) => \interval_remaining[16]_i_2_n_0\,
      S(2) => \interval_remaining[16]_i_3_n_0\,
      S(1) => \interval_remaining[16]_i_4_n_0\,
      S(0) => \interval_remaining[16]_i_5_n_0\
    );
\interval_remaining_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => interval_remaining,
      D => \interval_remaining_reg[16]_i_1_n_6\,
      Q => interval_remaining_reg(17),
      R => \interval_remaining[0]_i_1_n_0\
    );
\interval_remaining_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => interval_remaining,
      D => \interval_remaining_reg[16]_i_1_n_5\,
      Q => interval_remaining_reg(18),
      R => \interval_remaining[0]_i_1_n_0\
    );
\interval_remaining_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => interval_remaining,
      D => \interval_remaining_reg[16]_i_1_n_4\,
      Q => interval_remaining_reg(19),
      R => \interval_remaining[0]_i_1_n_0\
    );
\interval_remaining_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => interval_remaining,
      D => \interval_remaining_reg[0]_i_3_n_6\,
      Q => interval_remaining_reg(1),
      R => \interval_remaining[0]_i_1_n_0\
    );
\interval_remaining_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => interval_remaining,
      D => \interval_remaining_reg[20]_i_1_n_7\,
      Q => interval_remaining_reg(20),
      R => \interval_remaining[0]_i_1_n_0\
    );
\interval_remaining_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \interval_remaining_reg[16]_i_1_n_0\,
      CO(3) => \interval_remaining_reg[20]_i_1_n_0\,
      CO(2) => \interval_remaining_reg[20]_i_1_n_1\,
      CO(1) => \interval_remaining_reg[20]_i_1_n_2\,
      CO(0) => \interval_remaining_reg[20]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"1111",
      O(3) => \interval_remaining_reg[20]_i_1_n_4\,
      O(2) => \interval_remaining_reg[20]_i_1_n_5\,
      O(1) => \interval_remaining_reg[20]_i_1_n_6\,
      O(0) => \interval_remaining_reg[20]_i_1_n_7\,
      S(3) => \interval_remaining[20]_i_2_n_0\,
      S(2) => \interval_remaining[20]_i_3_n_0\,
      S(1) => \interval_remaining[20]_i_4_n_0\,
      S(0) => \interval_remaining[20]_i_5_n_0\
    );
\interval_remaining_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => interval_remaining,
      D => \interval_remaining_reg[20]_i_1_n_6\,
      Q => interval_remaining_reg(21),
      R => \interval_remaining[0]_i_1_n_0\
    );
\interval_remaining_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => interval_remaining,
      D => \interval_remaining_reg[20]_i_1_n_5\,
      Q => interval_remaining_reg(22),
      R => \interval_remaining[0]_i_1_n_0\
    );
\interval_remaining_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => interval_remaining,
      D => \interval_remaining_reg[20]_i_1_n_4\,
      Q => interval_remaining_reg(23),
      R => \interval_remaining[0]_i_1_n_0\
    );
\interval_remaining_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => interval_remaining,
      D => \interval_remaining_reg[24]_i_1_n_7\,
      Q => interval_remaining_reg(24),
      R => \interval_remaining[0]_i_1_n_0\
    );
\interval_remaining_reg[24]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \interval_remaining_reg[20]_i_1_n_0\,
      CO(3) => \interval_remaining_reg[24]_i_1_n_0\,
      CO(2) => \interval_remaining_reg[24]_i_1_n_1\,
      CO(1) => \interval_remaining_reg[24]_i_1_n_2\,
      CO(0) => \interval_remaining_reg[24]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"1111",
      O(3) => \interval_remaining_reg[24]_i_1_n_4\,
      O(2) => \interval_remaining_reg[24]_i_1_n_5\,
      O(1) => \interval_remaining_reg[24]_i_1_n_6\,
      O(0) => \interval_remaining_reg[24]_i_1_n_7\,
      S(3) => \interval_remaining[24]_i_2_n_0\,
      S(2) => \interval_remaining[24]_i_3_n_0\,
      S(1) => \interval_remaining[24]_i_4_n_0\,
      S(0) => \interval_remaining[24]_i_5_n_0\
    );
\interval_remaining_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => interval_remaining,
      D => \interval_remaining_reg[24]_i_1_n_6\,
      Q => interval_remaining_reg(25),
      R => \interval_remaining[0]_i_1_n_0\
    );
\interval_remaining_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => interval_remaining,
      D => \interval_remaining_reg[24]_i_1_n_5\,
      Q => interval_remaining_reg(26),
      R => \interval_remaining[0]_i_1_n_0\
    );
\interval_remaining_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => interval_remaining,
      D => \interval_remaining_reg[24]_i_1_n_4\,
      Q => interval_remaining_reg(27),
      R => \interval_remaining[0]_i_1_n_0\
    );
\interval_remaining_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => interval_remaining,
      D => \interval_remaining_reg[28]_i_1_n_7\,
      Q => interval_remaining_reg(28),
      R => \interval_remaining[0]_i_1_n_0\
    );
\interval_remaining_reg[28]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \interval_remaining_reg[24]_i_1_n_0\,
      CO(3) => \NLW_interval_remaining_reg[28]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \interval_remaining_reg[28]_i_1_n_1\,
      CO(1) => \interval_remaining_reg[28]_i_1_n_2\,
      CO(0) => \interval_remaining_reg[28]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0111",
      O(3) => \interval_remaining_reg[28]_i_1_n_4\,
      O(2) => \interval_remaining_reg[28]_i_1_n_5\,
      O(1) => \interval_remaining_reg[28]_i_1_n_6\,
      O(0) => \interval_remaining_reg[28]_i_1_n_7\,
      S(3) => \interval_remaining[28]_i_2_n_0\,
      S(2) => \interval_remaining[28]_i_3_n_0\,
      S(1) => \interval_remaining[28]_i_4_n_0\,
      S(0) => \interval_remaining[28]_i_5_n_0\
    );
\interval_remaining_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => interval_remaining,
      D => \interval_remaining_reg[28]_i_1_n_6\,
      Q => interval_remaining_reg(29),
      R => \interval_remaining[0]_i_1_n_0\
    );
\interval_remaining_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => interval_remaining,
      D => \interval_remaining_reg[0]_i_3_n_5\,
      Q => interval_remaining_reg(2),
      R => \interval_remaining[0]_i_1_n_0\
    );
\interval_remaining_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => interval_remaining,
      D => \interval_remaining_reg[28]_i_1_n_5\,
      Q => interval_remaining_reg(30),
      R => \interval_remaining[0]_i_1_n_0\
    );
\interval_remaining_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => interval_remaining,
      D => \interval_remaining_reg[28]_i_1_n_4\,
      Q => interval_remaining_reg(31),
      R => \interval_remaining[0]_i_1_n_0\
    );
\interval_remaining_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => interval_remaining,
      D => \interval_remaining_reg[0]_i_3_n_4\,
      Q => interval_remaining_reg(3),
      R => \interval_remaining[0]_i_1_n_0\
    );
\interval_remaining_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => interval_remaining,
      D => \interval_remaining_reg[4]_i_1_n_7\,
      Q => interval_remaining_reg(4),
      R => \interval_remaining[0]_i_1_n_0\
    );
\interval_remaining_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \interval_remaining_reg[0]_i_3_n_0\,
      CO(3) => \interval_remaining_reg[4]_i_1_n_0\,
      CO(2) => \interval_remaining_reg[4]_i_1_n_1\,
      CO(1) => \interval_remaining_reg[4]_i_1_n_2\,
      CO(0) => \interval_remaining_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"1111",
      O(3) => \interval_remaining_reg[4]_i_1_n_4\,
      O(2) => \interval_remaining_reg[4]_i_1_n_5\,
      O(1) => \interval_remaining_reg[4]_i_1_n_6\,
      O(0) => \interval_remaining_reg[4]_i_1_n_7\,
      S(3) => \interval_remaining[4]_i_2_n_0\,
      S(2) => \interval_remaining[4]_i_3_n_0\,
      S(1) => \interval_remaining[4]_i_4_n_0\,
      S(0) => \interval_remaining[4]_i_5_n_0\
    );
\interval_remaining_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => interval_remaining,
      D => \interval_remaining_reg[4]_i_1_n_6\,
      Q => interval_remaining_reg(5),
      R => \interval_remaining[0]_i_1_n_0\
    );
\interval_remaining_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => interval_remaining,
      D => \interval_remaining_reg[4]_i_1_n_5\,
      Q => interval_remaining_reg(6),
      R => \interval_remaining[0]_i_1_n_0\
    );
\interval_remaining_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => interval_remaining,
      D => \interval_remaining_reg[4]_i_1_n_4\,
      Q => interval_remaining_reg(7),
      R => \interval_remaining[0]_i_1_n_0\
    );
\interval_remaining_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => interval_remaining,
      D => \interval_remaining_reg[8]_i_1_n_7\,
      Q => interval_remaining_reg(8),
      R => \interval_remaining[0]_i_1_n_0\
    );
\interval_remaining_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \interval_remaining_reg[4]_i_1_n_0\,
      CO(3) => \interval_remaining_reg[8]_i_1_n_0\,
      CO(2) => \interval_remaining_reg[8]_i_1_n_1\,
      CO(1) => \interval_remaining_reg[8]_i_1_n_2\,
      CO(0) => \interval_remaining_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"1111",
      O(3) => \interval_remaining_reg[8]_i_1_n_4\,
      O(2) => \interval_remaining_reg[8]_i_1_n_5\,
      O(1) => \interval_remaining_reg[8]_i_1_n_6\,
      O(0) => \interval_remaining_reg[8]_i_1_n_7\,
      S(3) => \interval_remaining[8]_i_2_n_0\,
      S(2) => \interval_remaining[8]_i_3_n_0\,
      S(1) => \interval_remaining[8]_i_4_n_0\,
      S(0) => \interval_remaining[8]_i_5_n_0\
    );
\interval_remaining_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => interval_remaining,
      D => \interval_remaining_reg[8]_i_1_n_6\,
      Q => interval_remaining_reg(9),
      R => \interval_remaining[0]_i_1_n_0\
    );
memory_pending_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0C040C00"
    )
        port map (
      I0 => memory_valid,
      I1 => s_axi_aresetn,
      I2 => invalidate_in,
      I3 => memory_index_1,
      I4 => memory_pending_reg_0,
      O => rd_valid_reg_0
    );
rd_error1_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => rd_error1_carry_n_0,
      CO(2) => rd_error1_carry_n_1,
      CO(1) => rd_error1_carry_n_2,
      CO(0) => rd_error1_carry_n_3,
      CYINIT => '0',
      DI(3) => rd_error1_carry_i_1_n_0,
      DI(2) => rd_error1_carry_i_2_n_0,
      DI(1) => rd_error1_carry_i_3_n_0,
      DI(0) => rd_error1_carry_i_4_n_0,
      O(3 downto 0) => NLW_rd_error1_carry_O_UNCONNECTED(3 downto 0),
      S(3) => rd_error1_carry_i_5_n_0,
      S(2) => rd_error1_carry_i_6_n_0,
      S(1) => rd_error1_carry_i_7_n_0,
      S(0) => rd_error1_carry_i_8_n_0
    );
\rd_error1_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => rd_error1_carry_n_0,
      CO(3) => \rd_error1_carry__0_n_0\,
      CO(2) => \rd_error1_carry__0_n_1\,
      CO(1) => \rd_error1_carry__0_n_2\,
      CO(0) => \rd_error1_carry__0_n_3\,
      CYINIT => '0',
      DI(3) => \rd_error1_carry__0_i_1_n_0\,
      DI(2) => \rd_error1_carry__0_i_2_n_0\,
      DI(1) => \rd_error1_carry__0_i_3_n_0\,
      DI(0) => \rd_error1_carry__0_i_4_n_0\,
      O(3 downto 0) => \NLW_rd_error1_carry__0_O_UNCONNECTED\(3 downto 0),
      S(3) => \rd_error1_carry__0_i_5_n_0\,
      S(2) => \rd_error1_carry__0_i_6_n_0\,
      S(1) => \rd_error1_carry__0_i_7_n_0\,
      S(0) => \rd_error1_carry__0_i_8_n_0\
    );
\rd_error1_carry__0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => captured_count_reg(15),
      I1 => \rd_error1_carry__2_0\(15),
      I2 => captured_count_reg(14),
      I3 => \rd_error1_carry__2_0\(14),
      O => \rd_error1_carry__0_i_1_n_0\
    );
\rd_error1_carry__0_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => captured_count_reg(13),
      I1 => \rd_error1_carry__2_0\(13),
      I2 => captured_count_reg(12),
      I3 => \rd_error1_carry__2_0\(12),
      O => \rd_error1_carry__0_i_2_n_0\
    );
\rd_error1_carry__0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => captured_count_reg(11),
      I1 => \rd_error1_carry__2_0\(11),
      I2 => captured_count_reg(10),
      I3 => \rd_error1_carry__2_0\(10),
      O => \rd_error1_carry__0_i_3_n_0\
    );
\rd_error1_carry__0_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => captured_count(9),
      I1 => \rd_error1_carry__2_0\(9),
      I2 => captured_count(8),
      I3 => \rd_error1_carry__2_0\(8),
      O => \rd_error1_carry__0_i_4_n_0\
    );
\rd_error1_carry__0_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \rd_error1_carry__2_0\(15),
      I1 => captured_count_reg(15),
      I2 => \rd_error1_carry__2_0\(14),
      I3 => captured_count_reg(14),
      O => \rd_error1_carry__0_i_5_n_0\
    );
\rd_error1_carry__0_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \rd_error1_carry__2_0\(13),
      I1 => captured_count_reg(13),
      I2 => \rd_error1_carry__2_0\(12),
      I3 => captured_count_reg(12),
      O => \rd_error1_carry__0_i_6_n_0\
    );
\rd_error1_carry__0_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \rd_error1_carry__2_0\(11),
      I1 => captured_count_reg(11),
      I2 => \rd_error1_carry__2_0\(10),
      I3 => captured_count_reg(10),
      O => \rd_error1_carry__0_i_7_n_0\
    );
\rd_error1_carry__0_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \rd_error1_carry__2_0\(9),
      I1 => captured_count(9),
      I2 => \rd_error1_carry__2_0\(8),
      I3 => captured_count(8),
      O => \rd_error1_carry__0_i_8_n_0\
    );
\rd_error1_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \rd_error1_carry__0_n_0\,
      CO(3) => \rd_error1_carry__1_n_0\,
      CO(2) => \rd_error1_carry__1_n_1\,
      CO(1) => \rd_error1_carry__1_n_2\,
      CO(0) => \rd_error1_carry__1_n_3\,
      CYINIT => '0',
      DI(3) => \rd_error1_carry__1_i_1_n_0\,
      DI(2) => \rd_error1_carry__1_i_2_n_0\,
      DI(1) => \rd_error1_carry__1_i_3_n_0\,
      DI(0) => \rd_error1_carry__1_i_4_n_0\,
      O(3 downto 0) => \NLW_rd_error1_carry__1_O_UNCONNECTED\(3 downto 0),
      S(3) => \rd_error1_carry__1_i_5_n_0\,
      S(2) => \rd_error1_carry__1_i_6_n_0\,
      S(1) => \rd_error1_carry__1_i_7_n_0\,
      S(0) => \rd_error1_carry__1_i_8_n_0\
    );
\rd_error1_carry__1_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => captured_count_reg(23),
      I1 => \rd_error1_carry__2_0\(23),
      I2 => captured_count_reg(22),
      I3 => \rd_error1_carry__2_0\(22),
      O => \rd_error1_carry__1_i_1_n_0\
    );
\rd_error1_carry__1_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => captured_count_reg(21),
      I1 => \rd_error1_carry__2_0\(21),
      I2 => captured_count_reg(20),
      I3 => \rd_error1_carry__2_0\(20),
      O => \rd_error1_carry__1_i_2_n_0\
    );
\rd_error1_carry__1_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => captured_count_reg(19),
      I1 => \rd_error1_carry__2_0\(19),
      I2 => captured_count_reg(18),
      I3 => \rd_error1_carry__2_0\(18),
      O => \rd_error1_carry__1_i_3_n_0\
    );
\rd_error1_carry__1_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => captured_count_reg(17),
      I1 => \rd_error1_carry__2_0\(17),
      I2 => captured_count_reg(16),
      I3 => \rd_error1_carry__2_0\(16),
      O => \rd_error1_carry__1_i_4_n_0\
    );
\rd_error1_carry__1_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \rd_error1_carry__2_0\(23),
      I1 => captured_count_reg(23),
      I2 => \rd_error1_carry__2_0\(22),
      I3 => captured_count_reg(22),
      O => \rd_error1_carry__1_i_5_n_0\
    );
\rd_error1_carry__1_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \rd_error1_carry__2_0\(21),
      I1 => captured_count_reg(21),
      I2 => \rd_error1_carry__2_0\(20),
      I3 => captured_count_reg(20),
      O => \rd_error1_carry__1_i_6_n_0\
    );
\rd_error1_carry__1_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \rd_error1_carry__2_0\(19),
      I1 => captured_count_reg(19),
      I2 => \rd_error1_carry__2_0\(18),
      I3 => captured_count_reg(18),
      O => \rd_error1_carry__1_i_7_n_0\
    );
\rd_error1_carry__1_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \rd_error1_carry__2_0\(17),
      I1 => captured_count_reg(17),
      I2 => \rd_error1_carry__2_0\(16),
      I3 => captured_count_reg(16),
      O => \rd_error1_carry__1_i_8_n_0\
    );
\rd_error1_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \rd_error1_carry__1_n_0\,
      CO(3) => rd_error1,
      CO(2) => \rd_error1_carry__2_n_1\,
      CO(1) => \rd_error1_carry__2_n_2\,
      CO(0) => \rd_error1_carry__2_n_3\,
      CYINIT => '0',
      DI(3) => \rd_error1_carry__2_i_1_n_0\,
      DI(2) => \rd_error1_carry__2_i_2_n_0\,
      DI(1) => \rd_error1_carry__2_i_3_n_0\,
      DI(0) => \rd_error1_carry__2_i_4_n_0\,
      O(3 downto 0) => \NLW_rd_error1_carry__2_O_UNCONNECTED\(3 downto 0),
      S(3) => \rd_error1_carry__2_i_5_n_0\,
      S(2) => \rd_error1_carry__2_i_6_n_0\,
      S(1) => \rd_error1_carry__2_i_7_n_0\,
      S(0) => \rd_error1_carry__2_i_8_n_0\
    );
\rd_error1_carry__2_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => captured_count_reg(31),
      I1 => \rd_error1_carry__2_0\(31),
      I2 => captured_count_reg(30),
      I3 => \rd_error1_carry__2_0\(30),
      O => \rd_error1_carry__2_i_1_n_0\
    );
\rd_error1_carry__2_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => captured_count_reg(29),
      I1 => \rd_error1_carry__2_0\(29),
      I2 => captured_count_reg(28),
      I3 => \rd_error1_carry__2_0\(28),
      O => \rd_error1_carry__2_i_2_n_0\
    );
\rd_error1_carry__2_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => captured_count_reg(27),
      I1 => \rd_error1_carry__2_0\(27),
      I2 => captured_count_reg(26),
      I3 => \rd_error1_carry__2_0\(26),
      O => \rd_error1_carry__2_i_3_n_0\
    );
\rd_error1_carry__2_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => captured_count_reg(25),
      I1 => \rd_error1_carry__2_0\(25),
      I2 => captured_count_reg(24),
      I3 => \rd_error1_carry__2_0\(24),
      O => \rd_error1_carry__2_i_4_n_0\
    );
\rd_error1_carry__2_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \rd_error1_carry__2_0\(31),
      I1 => captured_count_reg(31),
      I2 => \rd_error1_carry__2_0\(30),
      I3 => captured_count_reg(30),
      O => \rd_error1_carry__2_i_5_n_0\
    );
\rd_error1_carry__2_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \rd_error1_carry__2_0\(29),
      I1 => captured_count_reg(29),
      I2 => \rd_error1_carry__2_0\(28),
      I3 => captured_count_reg(28),
      O => \rd_error1_carry__2_i_6_n_0\
    );
\rd_error1_carry__2_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \rd_error1_carry__2_0\(27),
      I1 => captured_count_reg(27),
      I2 => \rd_error1_carry__2_0\(26),
      I3 => captured_count_reg(26),
      O => \rd_error1_carry__2_i_7_n_0\
    );
\rd_error1_carry__2_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \rd_error1_carry__2_0\(25),
      I1 => captured_count_reg(25),
      I2 => \rd_error1_carry__2_0\(24),
      I3 => captured_count_reg(24),
      O => \rd_error1_carry__2_i_8_n_0\
    );
rd_error1_carry_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => captured_count(7),
      I1 => \rd_error1_carry__2_0\(7),
      I2 => captured_count(6),
      I3 => \rd_error1_carry__2_0\(6),
      O => rd_error1_carry_i_1_n_0
    );
rd_error1_carry_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => captured_count(5),
      I1 => \rd_error1_carry__2_0\(5),
      I2 => captured_count(4),
      I3 => \rd_error1_carry__2_0\(4),
      O => rd_error1_carry_i_2_n_0
    );
rd_error1_carry_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => captured_count(3),
      I1 => \rd_error1_carry__2_0\(3),
      I2 => captured_count(2),
      I3 => \rd_error1_carry__2_0\(2),
      O => rd_error1_carry_i_3_n_0
    );
rd_error1_carry_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => captured_count(1),
      I1 => \rd_error1_carry__2_0\(1),
      I2 => captured_count(0),
      I3 => \rd_error1_carry__2_0\(0),
      O => rd_error1_carry_i_4_n_0
    );
rd_error1_carry_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \rd_error1_carry__2_0\(7),
      I1 => captured_count(7),
      I2 => \rd_error1_carry__2_0\(6),
      I3 => captured_count(6),
      O => rd_error1_carry_i_5_n_0
    );
rd_error1_carry_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \rd_error1_carry__2_0\(5),
      I1 => captured_count(5),
      I2 => \rd_error1_carry__2_0\(4),
      I3 => captured_count(4),
      O => rd_error1_carry_i_6_n_0
    );
rd_error1_carry_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \rd_error1_carry__2_0\(3),
      I1 => captured_count(3),
      I2 => \rd_error1_carry__2_0\(2),
      I3 => captured_count(2),
      O => rd_error1_carry_i_7_n_0
    );
rd_error1_carry_i_8: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \rd_error1_carry__2_0\(1),
      I1 => captured_count(1),
      I2 => \rd_error1_carry__2_0\(0),
      I3 => captured_count(0),
      O => rd_error1_carry_i_8_n_0
    );
rd_error_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAAAA8AAA"
    )
        port map (
      I0 => memory_request,
      I1 => rd_error_i_2_n_0,
      I2 => record_valid,
      I3 => rd_error1,
      I4 => \captured_count_reg[0]_0\,
      I5 => \active_interval_ticks[31]_i_2_n_0\,
      O => rd_error_i_1_n_0
    );
rd_error_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => busy,
      I1 => armed,
      O => rd_error_i_2_n_0
    );
rd_error_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => rd_error_i_1_n_0,
      Q => rd_error,
      R => \^trigger_sticky_0\
    );
rd_valid_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => memory_request,
      Q => memory_valid,
      R => \^trigger_sticky_0\
    );
\s_axi_bresp[1]_i_12\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFB"
    )
        port map (
      I0 => invalidate_in,
      I1 => s_axi_aresetn,
      I2 => \captured_count_reg[0]_0\,
      I3 => armed,
      I4 => busy,
      O => \s_axi_bresp[1]_i_12_n_0\
    );
\s_axi_bresp[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF01FFFFFF010000"
    )
        port map (
      I0 => \s_axi_bresp_reg[1]\(1),
      I1 => \s_axi_bresp_reg[1]\(0),
      I2 => \^shadow_count_reg[24]\,
      I3 => \s_axi_bresp_reg[1]_0\,
      I4 => address_pending0,
      I5 => s_axi_bresp(0),
      O => \write_address_reg[3]\
    );
\s_axi_bresp[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFFF0002"
    )
        port map (
      I0 => arm_valid_reg_1,
      I1 => arm_valid_reg_2,
      I2 => \s_axi_bresp[1]_i_8_n_0\,
      I3 => arm_wait_reg_0,
      I4 => arm_wait_reg_3,
      I5 => arm_wait_reg,
      O => \^shadow_count_reg[24]\
    );
\s_axi_bresp[1]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \s_axi_bresp[1]_i_12_n_0\,
      I1 => \s_axi_bresp[1]_i_3_0\,
      I2 => invalidate_in,
      I3 => \s_axi_rdata_reg[31]\(18),
      I4 => arm_valid_reg_0,
      I5 => \s_axi_bresp[1]_i_3_1\,
      O => \s_axi_bresp[1]_i_8_n_0\
    );
\s_axi_rdata[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"444F444F444F4444"
    )
        port map (
      I0 => \s_axi_rdata_reg[0]_1\,
      I1 => memory_data(0),
      I2 => \s_axi_rdata[0]_i_2_n_0\,
      I3 => \s_axi_rdata_reg[0]\,
      I4 => \s_axi_rdata[0]_i_3_n_0\,
      I5 => \s_axi_rdata[0]_i_4_n_0\,
      O => D(0)
    );
\s_axi_rdata[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFFF4733"
    )
        port map (
      I0 => memory_data(0),
      I1 => s_axi_araddr(3),
      I2 => armed,
      I3 => s_axi_araddr(2),
      I4 => s_axi_araddr(1),
      I5 => \s_axi_rdata[0]_i_5_n_0\,
      O => \s_axi_rdata[0]_i_2_n_0\
    );
\s_axi_rdata[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"33E200E200000000"
    )
        port map (
      I0 => shadow_wait,
      I1 => s_axi_araddr(3),
      I2 => \s_axi_rdata_reg[31]_0\(0),
      I3 => s_axi_araddr(2),
      I4 => active_sample_count(0),
      I5 => s_axi_araddr(1),
      O => \s_axi_rdata[0]_i_3_n_0\
    );
\s_axi_rdata[0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"11011000FFFFFFFF"
    )
        port map (
      I0 => s_axi_araddr(3),
      I1 => s_axi_araddr(1),
      I2 => s_axi_araddr(2),
      I3 => captured_count(0),
      I4 => Q(0),
      I5 => s_axi_araddr(0),
      O => \s_axi_rdata[0]_i_4_n_0\
    );
\s_axi_rdata[0]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BABABAAAAAAABAAA"
    )
        port map (
      I0 => s_axi_araddr(0),
      I1 => s_axi_araddr(3),
      I2 => s_axi_araddr(1),
      I3 => \s_axi_rdata_reg[31]\(0),
      I4 => s_axi_araddr(2),
      I5 => active_interval_ticks(0),
      O => \s_axi_rdata[0]_i_5_n_0\
    );
\s_axi_rdata[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0555005505100010"
    )
        port map (
      I0 => \s_axi_rdata_reg[0]\,
      I1 => s_axi_araddr(1),
      I2 => s_axi_araddr(3),
      I3 => s_axi_araddr(2),
      I4 => \s_axi_rdata[10]_i_2_n_0\,
      I5 => \s_axi_rdata_reg[10]\,
      O => D(10)
    );
\s_axi_rdata[10]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AFA0C0C0"
    )
        port map (
      I0 => active_sample_count(10),
      I1 => captured_count_reg(10),
      I2 => s_axi_araddr(0),
      I3 => active_interval_ticks(10),
      I4 => s_axi_araddr(1),
      O => \s_axi_rdata[10]_i_2_n_0\
    );
\s_axi_rdata[11]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0151"
    )
        port map (
      I0 => \s_axi_rdata_reg[0]\,
      I1 => \s_axi_rdata[11]_i_2_n_0\,
      I2 => s_axi_araddr(0),
      I3 => \s_axi_rdata[11]_i_3_n_0\,
      O => D(11)
    );
\s_axi_rdata[11]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BBBFFFBF"
    )
        port map (
      I0 => s_axi_araddr(3),
      I1 => s_axi_araddr(1),
      I2 => \s_axi_rdata_reg[31]\(9),
      I3 => s_axi_araddr(2),
      I4 => active_interval_ticks(11),
      O => \s_axi_rdata[11]_i_2_n_0\
    );
\s_axi_rdata[11]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C7F7FFFFC7F70000"
    )
        port map (
      I0 => active_sample_count(11),
      I1 => s_axi_araddr(2),
      I2 => s_axi_araddr(3),
      I3 => \s_axi_rdata_reg[31]_0\(9),
      I4 => s_axi_araddr(1),
      I5 => \s_axi_rdata[11]_i_4_n_0\,
      O => \s_axi_rdata[11]_i_3_n_0\
    );
\s_axi_rdata[11]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABFB"
    )
        port map (
      I0 => s_axi_araddr(3),
      I1 => Q(9),
      I2 => s_axi_araddr(2),
      I3 => captured_count_reg(11),
      O => \s_axi_rdata[11]_i_4_n_0\
    );
\s_axi_rdata[12]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0151"
    )
        port map (
      I0 => \s_axi_rdata_reg[0]\,
      I1 => \s_axi_rdata[12]_i_2_n_0\,
      I2 => s_axi_araddr(0),
      I3 => \s_axi_rdata[12]_i_3_n_0\,
      O => D(12)
    );
\s_axi_rdata[12]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BBBFFFBF"
    )
        port map (
      I0 => s_axi_araddr(3),
      I1 => s_axi_araddr(1),
      I2 => \s_axi_rdata_reg[31]\(10),
      I3 => s_axi_araddr(2),
      I4 => active_interval_ticks(12),
      O => \s_axi_rdata[12]_i_2_n_0\
    );
\s_axi_rdata[12]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C7F7FFFFC7F70000"
    )
        port map (
      I0 => active_sample_count(12),
      I1 => s_axi_araddr(2),
      I2 => s_axi_araddr(3),
      I3 => \s_axi_rdata_reg[31]_0\(10),
      I4 => s_axi_araddr(1),
      I5 => \s_axi_rdata[12]_i_4_n_0\,
      O => \s_axi_rdata[12]_i_3_n_0\
    );
\s_axi_rdata[12]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABFB"
    )
        port map (
      I0 => s_axi_araddr(3),
      I1 => Q(10),
      I2 => s_axi_araddr(2),
      I3 => captured_count_reg(12),
      O => \s_axi_rdata[12]_i_4_n_0\
    );
\s_axi_rdata[13]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0151"
    )
        port map (
      I0 => \s_axi_rdata_reg[0]\,
      I1 => \s_axi_rdata[13]_i_2_n_0\,
      I2 => s_axi_araddr(0),
      I3 => \s_axi_rdata[13]_i_3_n_0\,
      O => D(13)
    );
\s_axi_rdata[13]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BBBFFFBF"
    )
        port map (
      I0 => s_axi_araddr(3),
      I1 => s_axi_araddr(1),
      I2 => \s_axi_rdata_reg[31]\(11),
      I3 => s_axi_araddr(2),
      I4 => active_interval_ticks(13),
      O => \s_axi_rdata[13]_i_2_n_0\
    );
\s_axi_rdata[13]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C7F7FFFFC7F70000"
    )
        port map (
      I0 => active_sample_count(13),
      I1 => s_axi_araddr(2),
      I2 => s_axi_araddr(3),
      I3 => \s_axi_rdata_reg[31]_0\(11),
      I4 => s_axi_araddr(1),
      I5 => \s_axi_rdata[13]_i_4_n_0\,
      O => \s_axi_rdata[13]_i_3_n_0\
    );
\s_axi_rdata[13]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABFB"
    )
        port map (
      I0 => s_axi_araddr(3),
      I1 => Q(11),
      I2 => s_axi_araddr(2),
      I3 => captured_count_reg(13),
      O => \s_axi_rdata[13]_i_4_n_0\
    );
\s_axi_rdata[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => \s_axi_rdata[14]_i_2_n_0\,
      I1 => \s_axi_rdata[14]_i_3_n_0\,
      I2 => \s_axi_rdata_reg[0]\,
      O => D(14)
    );
\s_axi_rdata[14]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF38080000"
    )
        port map (
      I0 => active_sample_count(14),
      I1 => s_axi_araddr(2),
      I2 => s_axi_araddr(3),
      I3 => \s_axi_rdata_reg[31]_0\(12),
      I4 => s_axi_araddr(1),
      I5 => \s_axi_rdata[14]_i_4_n_0\,
      O => \s_axi_rdata[14]_i_2_n_0\
    );
\s_axi_rdata[14]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4545415155554151"
    )
        port map (
      I0 => s_axi_araddr(0),
      I1 => s_axi_araddr(3),
      I2 => s_axi_araddr(1),
      I3 => \s_axi_rdata_reg[31]\(12),
      I4 => s_axi_araddr(2),
      I5 => active_interval_ticks(14),
      O => \s_axi_rdata[14]_i_3_n_0\
    );
\s_axi_rdata[14]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"11011000FFFFFFFF"
    )
        port map (
      I0 => s_axi_araddr(3),
      I1 => s_axi_araddr(1),
      I2 => s_axi_araddr(2),
      I3 => captured_count_reg(14),
      I4 => Q(12),
      I5 => s_axi_araddr(0),
      O => \s_axi_rdata[14]_i_4_n_0\
    );
\s_axi_rdata[15]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0151"
    )
        port map (
      I0 => \s_axi_rdata_reg[0]\,
      I1 => \s_axi_rdata[15]_i_2_n_0\,
      I2 => s_axi_araddr(0),
      I3 => \s_axi_rdata[15]_i_3_n_0\,
      O => D(15)
    );
\s_axi_rdata[15]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BBBFFFBF"
    )
        port map (
      I0 => s_axi_araddr(3),
      I1 => s_axi_araddr(1),
      I2 => \s_axi_rdata_reg[31]\(13),
      I3 => s_axi_araddr(2),
      I4 => active_interval_ticks(15),
      O => \s_axi_rdata[15]_i_2_n_0\
    );
\s_axi_rdata[15]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C7F7FFFFC7F70000"
    )
        port map (
      I0 => active_sample_count(15),
      I1 => s_axi_araddr(2),
      I2 => s_axi_araddr(3),
      I3 => \s_axi_rdata_reg[31]_0\(13),
      I4 => s_axi_araddr(1),
      I5 => \s_axi_rdata[15]_i_4_n_0\,
      O => \s_axi_rdata[15]_i_3_n_0\
    );
\s_axi_rdata[15]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABFB"
    )
        port map (
      I0 => s_axi_araddr(3),
      I1 => Q(13),
      I2 => s_axi_araddr(2),
      I3 => captured_count_reg(15),
      O => \s_axi_rdata[15]_i_4_n_0\
    );
\s_axi_rdata[16]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => \s_axi_rdata[16]_i_2_n_0\,
      I1 => \s_axi_rdata[16]_i_3_n_0\,
      I2 => \s_axi_rdata_reg[0]\,
      O => D(16)
    );
\s_axi_rdata[16]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF38080000"
    )
        port map (
      I0 => active_sample_count(16),
      I1 => s_axi_araddr(2),
      I2 => s_axi_araddr(3),
      I3 => \s_axi_rdata_reg[31]_0\(14),
      I4 => s_axi_araddr(1),
      I5 => \s_axi_rdata[16]_i_4_n_0\,
      O => \s_axi_rdata[16]_i_2_n_0\
    );
\s_axi_rdata[16]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4545415155554151"
    )
        port map (
      I0 => s_axi_araddr(0),
      I1 => s_axi_araddr(3),
      I2 => s_axi_araddr(1),
      I3 => \s_axi_rdata_reg[31]\(14),
      I4 => s_axi_araddr(2),
      I5 => active_interval_ticks(16),
      O => \s_axi_rdata[16]_i_3_n_0\
    );
\s_axi_rdata[16]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"11100010FFFFFFFF"
    )
        port map (
      I0 => s_axi_araddr(3),
      I1 => s_axi_araddr(1),
      I2 => Q(14),
      I3 => s_axi_araddr(2),
      I4 => captured_count_reg(16),
      I5 => s_axi_araddr(0),
      O => \s_axi_rdata[16]_i_4_n_0\
    );
\s_axi_rdata[17]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0151"
    )
        port map (
      I0 => \s_axi_rdata_reg[0]\,
      I1 => \s_axi_rdata[17]_i_2_n_0\,
      I2 => s_axi_araddr(0),
      I3 => \s_axi_rdata[17]_i_3_n_0\,
      O => D(17)
    );
\s_axi_rdata[17]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BBBFFFBF"
    )
        port map (
      I0 => s_axi_araddr(3),
      I1 => s_axi_araddr(1),
      I2 => \s_axi_rdata_reg[31]\(15),
      I3 => s_axi_araddr(2),
      I4 => active_interval_ticks(17),
      O => \s_axi_rdata[17]_i_2_n_0\
    );
\s_axi_rdata[17]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C7F7FFFFC7F70000"
    )
        port map (
      I0 => active_sample_count(17),
      I1 => s_axi_araddr(2),
      I2 => s_axi_araddr(3),
      I3 => \s_axi_rdata_reg[31]_0\(15),
      I4 => s_axi_araddr(1),
      I5 => \s_axi_rdata[17]_i_4_n_0\,
      O => \s_axi_rdata[17]_i_3_n_0\
    );
\s_axi_rdata[17]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABFB"
    )
        port map (
      I0 => s_axi_araddr(3),
      I1 => Q(15),
      I2 => s_axi_araddr(2),
      I3 => captured_count_reg(17),
      O => \s_axi_rdata[17]_i_4_n_0\
    );
\s_axi_rdata[18]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0151"
    )
        port map (
      I0 => \s_axi_rdata_reg[0]\,
      I1 => \s_axi_rdata[18]_i_2_n_0\,
      I2 => s_axi_araddr(0),
      I3 => \s_axi_rdata[18]_i_3_n_0\,
      O => D(18)
    );
\s_axi_rdata[18]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BBBFFFBF"
    )
        port map (
      I0 => s_axi_araddr(3),
      I1 => s_axi_araddr(1),
      I2 => \s_axi_rdata_reg[31]\(16),
      I3 => s_axi_araddr(2),
      I4 => active_interval_ticks(18),
      O => \s_axi_rdata[18]_i_2_n_0\
    );
\s_axi_rdata[18]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C7F7FFFFC7F70000"
    )
        port map (
      I0 => active_sample_count(18),
      I1 => s_axi_araddr(2),
      I2 => s_axi_araddr(3),
      I3 => \s_axi_rdata_reg[31]_0\(16),
      I4 => s_axi_araddr(1),
      I5 => \s_axi_rdata[18]_i_4_n_0\,
      O => \s_axi_rdata[18]_i_3_n_0\
    );
\s_axi_rdata[18]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABFB"
    )
        port map (
      I0 => s_axi_araddr(3),
      I1 => Q(16),
      I2 => s_axi_araddr(2),
      I3 => captured_count_reg(18),
      O => \s_axi_rdata[18]_i_4_n_0\
    );
\s_axi_rdata[19]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => \s_axi_rdata[19]_i_2_n_0\,
      I1 => \s_axi_rdata[19]_i_3_n_0\,
      I2 => \s_axi_rdata_reg[0]\,
      O => D(19)
    );
\s_axi_rdata[19]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF38080000"
    )
        port map (
      I0 => active_sample_count(19),
      I1 => s_axi_araddr(2),
      I2 => s_axi_araddr(3),
      I3 => \s_axi_rdata_reg[31]_0\(17),
      I4 => s_axi_araddr(1),
      I5 => \s_axi_rdata[19]_i_4_n_0\,
      O => \s_axi_rdata[19]_i_2_n_0\
    );
\s_axi_rdata[19]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4545415155554151"
    )
        port map (
      I0 => s_axi_araddr(0),
      I1 => s_axi_araddr(3),
      I2 => s_axi_araddr(1),
      I3 => \s_axi_rdata_reg[31]\(17),
      I4 => s_axi_araddr(2),
      I5 => active_interval_ticks(19),
      O => \s_axi_rdata[19]_i_3_n_0\
    );
\s_axi_rdata[19]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"11100010FFFFFFFF"
    )
        port map (
      I0 => s_axi_araddr(3),
      I1 => s_axi_araddr(1),
      I2 => Q(17),
      I3 => s_axi_araddr(2),
      I4 => captured_count_reg(19),
      I5 => s_axi_araddr(0),
      O => \s_axi_rdata[19]_i_4_n_0\
    );
\s_axi_rdata[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"444F444F444F4444"
    )
        port map (
      I0 => \s_axi_rdata_reg[0]_1\,
      I1 => memory_data(1),
      I2 => \s_axi_rdata_reg[0]\,
      I3 => \s_axi_rdata_reg[1]\,
      I4 => \s_axi_rdata[1]_i_3_n_0\,
      I5 => \s_axi_rdata[1]_i_4_n_0\,
      O => D(1)
    );
\s_axi_rdata[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000033E200E2"
    )
        port map (
      I0 => busy,
      I1 => s_axi_araddr(3),
      I2 => memory_data(1),
      I3 => s_axi_araddr(1),
      I4 => active_interval_ticks(1),
      I5 => s_axi_araddr(0),
      O => \s_axi_rdata[1]_i_3_n_0\
    );
\s_axi_rdata[1]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"54040000FFFFFFFF"
    )
        port map (
      I0 => s_axi_araddr(3),
      I1 => captured_count(1),
      I2 => s_axi_araddr(1),
      I3 => active_sample_count(1),
      I4 => s_axi_araddr(0),
      I5 => s_axi_araddr(2),
      O => \s_axi_rdata[1]_i_4_n_0\
    );
\s_axi_rdata[20]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0151"
    )
        port map (
      I0 => \s_axi_rdata_reg[0]\,
      I1 => \s_axi_rdata[20]_i_2_n_0\,
      I2 => s_axi_araddr(0),
      I3 => \s_axi_rdata[20]_i_3_n_0\,
      O => D(20)
    );
\s_axi_rdata[20]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BBBFFFBF"
    )
        port map (
      I0 => s_axi_araddr(3),
      I1 => s_axi_araddr(1),
      I2 => \s_axi_rdata_reg[31]\(18),
      I3 => s_axi_araddr(2),
      I4 => active_interval_ticks(20),
      O => \s_axi_rdata[20]_i_2_n_0\
    );
\s_axi_rdata[20]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C7F7FFFFC7F70000"
    )
        port map (
      I0 => active_sample_count(20),
      I1 => s_axi_araddr(2),
      I2 => s_axi_araddr(3),
      I3 => \s_axi_rdata_reg[31]_0\(18),
      I4 => s_axi_araddr(1),
      I5 => \s_axi_rdata[20]_i_4_n_0\,
      O => \s_axi_rdata[20]_i_3_n_0\
    );
\s_axi_rdata[20]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABFB"
    )
        port map (
      I0 => s_axi_araddr(3),
      I1 => Q(18),
      I2 => s_axi_araddr(2),
      I3 => captured_count_reg(20),
      O => \s_axi_rdata[20]_i_4_n_0\
    );
\s_axi_rdata[21]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0151"
    )
        port map (
      I0 => \s_axi_rdata_reg[0]\,
      I1 => \s_axi_rdata[21]_i_2_n_0\,
      I2 => s_axi_araddr(0),
      I3 => \s_axi_rdata[21]_i_3_n_0\,
      O => D(21)
    );
\s_axi_rdata[21]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BBBFFFBF"
    )
        port map (
      I0 => s_axi_araddr(3),
      I1 => s_axi_araddr(1),
      I2 => \s_axi_rdata_reg[31]\(19),
      I3 => s_axi_araddr(2),
      I4 => active_interval_ticks(21),
      O => \s_axi_rdata[21]_i_2_n_0\
    );
\s_axi_rdata[21]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C7F7FFFFC7F70000"
    )
        port map (
      I0 => active_sample_count(21),
      I1 => s_axi_araddr(2),
      I2 => s_axi_araddr(3),
      I3 => \s_axi_rdata_reg[31]_0\(19),
      I4 => s_axi_araddr(1),
      I5 => \s_axi_rdata[21]_i_4_n_0\,
      O => \s_axi_rdata[21]_i_3_n_0\
    );
\s_axi_rdata[21]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABFB"
    )
        port map (
      I0 => s_axi_araddr(3),
      I1 => Q(19),
      I2 => s_axi_araddr(2),
      I3 => captured_count_reg(21),
      O => \s_axi_rdata[21]_i_4_n_0\
    );
\s_axi_rdata[22]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => \s_axi_rdata[22]_i_2_n_0\,
      I1 => \s_axi_rdata[22]_i_3_n_0\,
      I2 => \s_axi_rdata_reg[0]\,
      O => D(22)
    );
\s_axi_rdata[22]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF38080000"
    )
        port map (
      I0 => active_sample_count(22),
      I1 => s_axi_araddr(2),
      I2 => s_axi_araddr(3),
      I3 => \s_axi_rdata_reg[31]_0\(20),
      I4 => s_axi_araddr(1),
      I5 => \s_axi_rdata[22]_i_4_n_0\,
      O => \s_axi_rdata[22]_i_2_n_0\
    );
\s_axi_rdata[22]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4545415155554151"
    )
        port map (
      I0 => s_axi_araddr(0),
      I1 => s_axi_araddr(3),
      I2 => s_axi_araddr(1),
      I3 => \s_axi_rdata_reg[31]\(20),
      I4 => s_axi_araddr(2),
      I5 => active_interval_ticks(22),
      O => \s_axi_rdata[22]_i_3_n_0\
    );
\s_axi_rdata[22]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"11100010FFFFFFFF"
    )
        port map (
      I0 => s_axi_araddr(3),
      I1 => s_axi_araddr(1),
      I2 => Q(20),
      I3 => s_axi_araddr(2),
      I4 => captured_count_reg(22),
      I5 => s_axi_araddr(0),
      O => \s_axi_rdata[22]_i_4_n_0\
    );
\s_axi_rdata[23]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0151"
    )
        port map (
      I0 => \s_axi_rdata_reg[0]\,
      I1 => \s_axi_rdata[23]_i_2_n_0\,
      I2 => s_axi_araddr(0),
      I3 => \s_axi_rdata[23]_i_3_n_0\,
      O => D(23)
    );
\s_axi_rdata[23]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BBBFFFBF"
    )
        port map (
      I0 => s_axi_araddr(3),
      I1 => s_axi_araddr(1),
      I2 => \s_axi_rdata_reg[31]\(21),
      I3 => s_axi_araddr(2),
      I4 => active_interval_ticks(23),
      O => \s_axi_rdata[23]_i_2_n_0\
    );
\s_axi_rdata[23]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C7F7FFFFC7F70000"
    )
        port map (
      I0 => active_sample_count(23),
      I1 => s_axi_araddr(2),
      I2 => s_axi_araddr(3),
      I3 => \s_axi_rdata_reg[31]_0\(21),
      I4 => s_axi_araddr(1),
      I5 => \s_axi_rdata[23]_i_4_n_0\,
      O => \s_axi_rdata[23]_i_3_n_0\
    );
\s_axi_rdata[23]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABFB"
    )
        port map (
      I0 => s_axi_araddr(3),
      I1 => Q(21),
      I2 => s_axi_araddr(2),
      I3 => captured_count_reg(23),
      O => \s_axi_rdata[23]_i_4_n_0\
    );
\s_axi_rdata[24]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0151"
    )
        port map (
      I0 => \s_axi_rdata_reg[0]\,
      I1 => \s_axi_rdata[24]_i_2_n_0\,
      I2 => s_axi_araddr(0),
      I3 => \s_axi_rdata[24]_i_3_n_0\,
      O => D(24)
    );
\s_axi_rdata[24]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BBBFFFBF"
    )
        port map (
      I0 => s_axi_araddr(3),
      I1 => s_axi_araddr(1),
      I2 => \s_axi_rdata_reg[31]\(22),
      I3 => s_axi_araddr(2),
      I4 => active_interval_ticks(24),
      O => \s_axi_rdata[24]_i_2_n_0\
    );
\s_axi_rdata[24]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C7F7FFFFC7F70000"
    )
        port map (
      I0 => active_sample_count(24),
      I1 => s_axi_araddr(2),
      I2 => s_axi_araddr(3),
      I3 => \s_axi_rdata_reg[31]_0\(22),
      I4 => s_axi_araddr(1),
      I5 => \s_axi_rdata[24]_i_4_n_0\,
      O => \s_axi_rdata[24]_i_3_n_0\
    );
\s_axi_rdata[24]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABFB"
    )
        port map (
      I0 => s_axi_araddr(3),
      I1 => Q(22),
      I2 => s_axi_araddr(2),
      I3 => captured_count_reg(24),
      O => \s_axi_rdata[24]_i_4_n_0\
    );
\s_axi_rdata[25]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0151"
    )
        port map (
      I0 => \s_axi_rdata_reg[0]\,
      I1 => \s_axi_rdata[25]_i_2_n_0\,
      I2 => s_axi_araddr(0),
      I3 => \s_axi_rdata[25]_i_3_n_0\,
      O => D(25)
    );
\s_axi_rdata[25]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BBBFFFBF"
    )
        port map (
      I0 => s_axi_araddr(3),
      I1 => s_axi_araddr(1),
      I2 => \s_axi_rdata_reg[31]\(23),
      I3 => s_axi_araddr(2),
      I4 => active_interval_ticks(25),
      O => \s_axi_rdata[25]_i_2_n_0\
    );
\s_axi_rdata[25]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C7F7FFFFC7F70000"
    )
        port map (
      I0 => active_sample_count(25),
      I1 => s_axi_araddr(2),
      I2 => s_axi_araddr(3),
      I3 => \s_axi_rdata_reg[31]_0\(23),
      I4 => s_axi_araddr(1),
      I5 => \s_axi_rdata[25]_i_4_n_0\,
      O => \s_axi_rdata[25]_i_3_n_0\
    );
\s_axi_rdata[25]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABFB"
    )
        port map (
      I0 => s_axi_araddr(3),
      I1 => Q(23),
      I2 => s_axi_araddr(2),
      I3 => captured_count_reg(25),
      O => \s_axi_rdata[25]_i_4_n_0\
    );
\s_axi_rdata[26]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => \s_axi_rdata[26]_i_2_n_0\,
      I1 => \s_axi_rdata[26]_i_3_n_0\,
      I2 => \s_axi_rdata_reg[0]\,
      O => D(26)
    );
\s_axi_rdata[26]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF38080000"
    )
        port map (
      I0 => active_sample_count(26),
      I1 => s_axi_araddr(2),
      I2 => s_axi_araddr(3),
      I3 => \s_axi_rdata_reg[31]_0\(24),
      I4 => s_axi_araddr(1),
      I5 => \s_axi_rdata[26]_i_4_n_0\,
      O => \s_axi_rdata[26]_i_2_n_0\
    );
\s_axi_rdata[26]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4545415155554151"
    )
        port map (
      I0 => s_axi_araddr(0),
      I1 => s_axi_araddr(3),
      I2 => s_axi_araddr(1),
      I3 => \s_axi_rdata_reg[31]\(24),
      I4 => s_axi_araddr(2),
      I5 => active_interval_ticks(26),
      O => \s_axi_rdata[26]_i_3_n_0\
    );
\s_axi_rdata[26]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"11100010FFFFFFFF"
    )
        port map (
      I0 => s_axi_araddr(3),
      I1 => s_axi_araddr(1),
      I2 => Q(24),
      I3 => s_axi_araddr(2),
      I4 => captured_count_reg(26),
      I5 => s_axi_araddr(0),
      O => \s_axi_rdata[26]_i_4_n_0\
    );
\s_axi_rdata[27]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0151"
    )
        port map (
      I0 => \s_axi_rdata_reg[0]\,
      I1 => \s_axi_rdata[27]_i_2_n_0\,
      I2 => s_axi_araddr(0),
      I3 => \s_axi_rdata[27]_i_3_n_0\,
      O => D(27)
    );
\s_axi_rdata[27]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BBBFFFBF"
    )
        port map (
      I0 => s_axi_araddr(3),
      I1 => s_axi_araddr(1),
      I2 => \s_axi_rdata_reg[31]\(25),
      I3 => s_axi_araddr(2),
      I4 => active_interval_ticks(27),
      O => \s_axi_rdata[27]_i_2_n_0\
    );
\s_axi_rdata[27]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C7F7FFFFC7F70000"
    )
        port map (
      I0 => active_sample_count(27),
      I1 => s_axi_araddr(2),
      I2 => s_axi_araddr(3),
      I3 => \s_axi_rdata_reg[31]_0\(25),
      I4 => s_axi_araddr(1),
      I5 => \s_axi_rdata[27]_i_4_n_0\,
      O => \s_axi_rdata[27]_i_3_n_0\
    );
\s_axi_rdata[27]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABFB"
    )
        port map (
      I0 => s_axi_araddr(3),
      I1 => Q(25),
      I2 => s_axi_araddr(2),
      I3 => captured_count_reg(27),
      O => \s_axi_rdata[27]_i_4_n_0\
    );
\s_axi_rdata[28]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0151"
    )
        port map (
      I0 => \s_axi_rdata_reg[0]\,
      I1 => \s_axi_rdata[28]_i_2_n_0\,
      I2 => s_axi_araddr(0),
      I3 => \s_axi_rdata[28]_i_3_n_0\,
      O => D(28)
    );
\s_axi_rdata[28]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BBBFFFBF"
    )
        port map (
      I0 => s_axi_araddr(3),
      I1 => s_axi_araddr(1),
      I2 => \s_axi_rdata_reg[31]\(26),
      I3 => s_axi_araddr(2),
      I4 => active_interval_ticks(28),
      O => \s_axi_rdata[28]_i_2_n_0\
    );
\s_axi_rdata[28]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C7F7FFFFC7F70000"
    )
        port map (
      I0 => active_sample_count(28),
      I1 => s_axi_araddr(2),
      I2 => s_axi_araddr(3),
      I3 => \s_axi_rdata_reg[31]_0\(26),
      I4 => s_axi_araddr(1),
      I5 => \s_axi_rdata[28]_i_4_n_0\,
      O => \s_axi_rdata[28]_i_3_n_0\
    );
\s_axi_rdata[28]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABFB"
    )
        port map (
      I0 => s_axi_araddr(3),
      I1 => Q(26),
      I2 => s_axi_araddr(2),
      I3 => captured_count_reg(28),
      O => \s_axi_rdata[28]_i_4_n_0\
    );
\s_axi_rdata[29]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0151"
    )
        port map (
      I0 => \s_axi_rdata_reg[0]\,
      I1 => \s_axi_rdata[29]_i_2_n_0\,
      I2 => s_axi_araddr(0),
      I3 => \s_axi_rdata[29]_i_3_n_0\,
      O => D(29)
    );
\s_axi_rdata[29]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BBBFFFBF"
    )
        port map (
      I0 => s_axi_araddr(3),
      I1 => s_axi_araddr(1),
      I2 => \s_axi_rdata_reg[31]\(27),
      I3 => s_axi_araddr(2),
      I4 => active_interval_ticks(29),
      O => \s_axi_rdata[29]_i_2_n_0\
    );
\s_axi_rdata[29]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C7F7FFFFC7F70000"
    )
        port map (
      I0 => active_sample_count(29),
      I1 => s_axi_araddr(2),
      I2 => s_axi_araddr(3),
      I3 => \s_axi_rdata_reg[31]_0\(27),
      I4 => s_axi_araddr(1),
      I5 => \s_axi_rdata[29]_i_4_n_0\,
      O => \s_axi_rdata[29]_i_3_n_0\
    );
\s_axi_rdata[29]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABFB"
    )
        port map (
      I0 => s_axi_araddr(3),
      I1 => Q(27),
      I2 => s_axi_araddr(2),
      I3 => captured_count_reg(29),
      O => \s_axi_rdata[29]_i_4_n_0\
    );
\s_axi_rdata[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0151"
    )
        port map (
      I0 => \s_axi_rdata_reg[0]\,
      I1 => \s_axi_rdata[2]_i_2_n_0\,
      I2 => s_axi_araddr(0),
      I3 => \s_axi_rdata[2]_i_3_n_0\,
      O => D(2)
    );
\s_axi_rdata[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF0F0303F5F5F"
    )
        port map (
      I0 => \s_axi_rdata_reg[31]\(1),
      I1 => active_interval_ticks(2),
      I2 => s_axi_araddr(1),
      I3 => record_valid,
      I4 => s_axi_araddr(2),
      I5 => s_axi_araddr(3),
      O => \s_axi_rdata[2]_i_2_n_0\
    );
\s_axi_rdata[2]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C7F7FFFFC7F70000"
    )
        port map (
      I0 => active_sample_count(2),
      I1 => s_axi_araddr(2),
      I2 => s_axi_araddr(3),
      I3 => \s_axi_rdata_reg[31]_0\(1),
      I4 => s_axi_araddr(1),
      I5 => \s_axi_rdata[2]_i_4_n_0\,
      O => \s_axi_rdata[2]_i_3_n_0\
    );
\s_axi_rdata[2]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABFB"
    )
        port map (
      I0 => s_axi_araddr(3),
      I1 => Q(1),
      I2 => s_axi_araddr(2),
      I3 => captured_count(2),
      O => \s_axi_rdata[2]_i_4_n_0\
    );
\s_axi_rdata[30]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => \s_axi_rdata[30]_i_2_n_0\,
      I1 => \s_axi_rdata[30]_i_3_n_0\,
      I2 => \s_axi_rdata_reg[0]\,
      O => D(30)
    );
\s_axi_rdata[30]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF38080000"
    )
        port map (
      I0 => active_sample_count(30),
      I1 => s_axi_araddr(2),
      I2 => s_axi_araddr(3),
      I3 => \s_axi_rdata_reg[31]_0\(28),
      I4 => s_axi_araddr(1),
      I5 => \s_axi_rdata[30]_i_4_n_0\,
      O => \s_axi_rdata[30]_i_2_n_0\
    );
\s_axi_rdata[30]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4545415155554151"
    )
        port map (
      I0 => s_axi_araddr(0),
      I1 => s_axi_araddr(3),
      I2 => s_axi_araddr(1),
      I3 => \s_axi_rdata_reg[31]\(28),
      I4 => s_axi_araddr(2),
      I5 => active_interval_ticks(30),
      O => \s_axi_rdata[30]_i_3_n_0\
    );
\s_axi_rdata[30]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"11100010FFFFFFFF"
    )
        port map (
      I0 => s_axi_araddr(3),
      I1 => s_axi_araddr(1),
      I2 => Q(28),
      I3 => s_axi_araddr(2),
      I4 => captured_count_reg(30),
      I5 => s_axi_araddr(0),
      O => \s_axi_rdata[30]_i_4_n_0\
    );
\s_axi_rdata[31]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C7F7FFFFC7F70000"
    )
        port map (
      I0 => active_sample_count(31),
      I1 => s_axi_araddr(2),
      I2 => s_axi_araddr(3),
      I3 => \s_axi_rdata_reg[31]_0\(29),
      I4 => s_axi_araddr(1),
      I5 => \s_axi_rdata[31]_i_12_n_0\,
      O => \s_axi_rdata[31]_i_10_n_0\
    );
\s_axi_rdata[31]_i_12\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABFB"
    )
        port map (
      I0 => s_axi_araddr(3),
      I1 => Q(29),
      I2 => s_axi_araddr(2),
      I3 => captured_count_reg(31),
      O => \s_axi_rdata[31]_i_12_n_0\
    );
\s_axi_rdata[31]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFAAFFAAFFAAFFA8"
    )
        port map (
      I0 => \s_axi_rdata_reg[0]_1\,
      I1 => s_axi_araddr(1),
      I2 => s_axi_araddr(0),
      I3 => \s_axi_rdata[31]_i_5_n_0\,
      I4 => \s_axi_rdata_reg[0]_0\,
      I5 => \s_axi_rdata_reg[0]_2\,
      O => \s_axi_araddr[3]\(0)
    );
\s_axi_rdata[31]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0151"
    )
        port map (
      I0 => \s_axi_rdata_reg[0]\,
      I1 => \s_axi_rdata[31]_i_9_n_0\,
      I2 => s_axi_araddr(0),
      I3 => \s_axi_rdata[31]_i_10_n_0\,
      O => D(31)
    );
\s_axi_rdata[31]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => memory_pending_reg_0,
      I1 => memory_valid,
      O => \s_axi_rdata[31]_i_5_n_0\
    );
\s_axi_rdata[31]_i_9\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF1DFFFF"
    )
        port map (
      I0 => \s_axi_rdata_reg[31]\(29),
      I1 => s_axi_araddr(2),
      I2 => active_interval_ticks(31),
      I3 => s_axi_araddr(3),
      I4 => s_axi_araddr(1),
      O => \s_axi_rdata[31]_i_9_n_0\
    );
\s_axi_rdata[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0151"
    )
        port map (
      I0 => \s_axi_rdata_reg[0]\,
      I1 => \s_axi_rdata[3]_i_2_n_0\,
      I2 => s_axi_araddr(0),
      I3 => \s_axi_rdata[3]_i_3_n_0\,
      O => D(3)
    );
\s_axi_rdata[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AABFAFBFFABFFFBF"
    )
        port map (
      I0 => s_axi_araddr(3),
      I1 => record_valid,
      I2 => s_axi_araddr(2),
      I3 => s_axi_araddr(1),
      I4 => \s_axi_rdata_reg[31]\(2),
      I5 => active_interval_ticks(3),
      O => \s_axi_rdata[3]_i_2_n_0\
    );
\s_axi_rdata[3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C7F7FFFFC7F70000"
    )
        port map (
      I0 => active_sample_count(3),
      I1 => s_axi_araddr(2),
      I2 => s_axi_araddr(3),
      I3 => \s_axi_rdata_reg[31]_0\(2),
      I4 => s_axi_araddr(1),
      I5 => \s_axi_rdata[3]_i_4_n_0\,
      O => \s_axi_rdata[3]_i_3_n_0\
    );
\s_axi_rdata[3]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABFB"
    )
        port map (
      I0 => s_axi_araddr(3),
      I1 => Q(2),
      I2 => s_axi_araddr(2),
      I3 => captured_count(3),
      O => \s_axi_rdata[3]_i_4_n_0\
    );
\s_axi_rdata[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000AAAAAA02"
    )
        port map (
      I0 => \s_axi_rdata[4]_i_2_n_0\,
      I1 => s_axi_araddr(1),
      I2 => \s_axi_rdata_reg[4]\,
      I3 => s_axi_araddr(0),
      I4 => \s_axi_rdata[4]_i_3_n_0\,
      I5 => \s_axi_rdata_reg[0]\,
      O => D(4)
    );
\s_axi_rdata[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF38080000"
    )
        port map (
      I0 => active_sample_count(4),
      I1 => s_axi_araddr(2),
      I2 => s_axi_araddr(3),
      I3 => \s_axi_rdata_reg[31]_0\(3),
      I4 => s_axi_araddr(1),
      I5 => \s_axi_rdata[4]_i_4_n_0\,
      O => \s_axi_rdata[4]_i_2_n_0\
    );
\s_axi_rdata[4]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000ACACF000"
    )
        port map (
      I0 => active_interval_ticks(4),
      I1 => \s_axi_rdata_reg[31]\(3),
      I2 => s_axi_araddr(2),
      I3 => error_sticky,
      I4 => s_axi_araddr(1),
      I5 => s_axi_araddr(3),
      O => \s_axi_rdata[4]_i_3_n_0\
    );
\s_axi_rdata[4]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"11100010FFFFFFFF"
    )
        port map (
      I0 => s_axi_araddr(3),
      I1 => s_axi_araddr(1),
      I2 => Q(3),
      I3 => s_axi_araddr(2),
      I4 => captured_count(4),
      I5 => s_axi_araddr(0),
      O => \s_axi_rdata[4]_i_4_n_0\
    );
\s_axi_rdata[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000AAAAAA02"
    )
        port map (
      I0 => \s_axi_rdata[5]_i_2_n_0\,
      I1 => s_axi_araddr(1),
      I2 => \s_axi_rdata_reg[4]\,
      I3 => s_axi_araddr(0),
      I4 => \s_axi_rdata[5]_i_4_n_0\,
      I5 => \s_axi_rdata_reg[0]\,
      O => D(5)
    );
\s_axi_rdata[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF38080000"
    )
        port map (
      I0 => active_sample_count(5),
      I1 => s_axi_araddr(2),
      I2 => s_axi_araddr(3),
      I3 => \s_axi_rdata_reg[31]_0\(4),
      I4 => s_axi_araddr(1),
      I5 => \s_axi_rdata[5]_i_5_n_0\,
      O => \s_axi_rdata[5]_i_2_n_0\
    );
\s_axi_rdata[5]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000CACAF000"
    )
        port map (
      I0 => \s_axi_rdata_reg[31]\(4),
      I1 => active_interval_ticks(5),
      I2 => s_axi_araddr(2),
      I3 => cancel_sticky,
      I4 => s_axi_araddr(1),
      I5 => s_axi_araddr(3),
      O => \s_axi_rdata[5]_i_4_n_0\
    );
\s_axi_rdata[5]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"11100010FFFFFFFF"
    )
        port map (
      I0 => s_axi_araddr(3),
      I1 => s_axi_araddr(1),
      I2 => Q(4),
      I3 => s_axi_araddr(2),
      I4 => captured_count(5),
      I5 => s_axi_araddr(0),
      O => \s_axi_rdata[5]_i_5_n_0\
    );
\s_axi_rdata[6]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0151"
    )
        port map (
      I0 => \s_axi_rdata_reg[0]\,
      I1 => \s_axi_rdata[6]_i_2_n_0\,
      I2 => s_axi_araddr(0),
      I3 => \s_axi_rdata[6]_i_3_n_0\,
      O => D(6)
    );
\s_axi_rdata[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AABFAFBFFABFFFBF"
    )
        port map (
      I0 => s_axi_araddr(3),
      I1 => trigger_sticky,
      I2 => s_axi_araddr(2),
      I3 => s_axi_araddr(1),
      I4 => \s_axi_rdata_reg[31]\(5),
      I5 => active_interval_ticks(6),
      O => \s_axi_rdata[6]_i_2_n_0\
    );
\s_axi_rdata[6]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C7F7FFFFC7F70000"
    )
        port map (
      I0 => active_sample_count(6),
      I1 => s_axi_araddr(2),
      I2 => s_axi_araddr(3),
      I3 => \s_axi_rdata_reg[31]_0\(5),
      I4 => s_axi_araddr(1),
      I5 => \s_axi_rdata[6]_i_4_n_0\,
      O => \s_axi_rdata[6]_i_3_n_0\
    );
\s_axi_rdata[6]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABFB"
    )
        port map (
      I0 => s_axi_araddr(3),
      I1 => Q(5),
      I2 => s_axi_araddr(2),
      I3 => captured_count(6),
      O => \s_axi_rdata[6]_i_4_n_0\
    );
\s_axi_rdata[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0151"
    )
        port map (
      I0 => \s_axi_rdata_reg[0]\,
      I1 => \s_axi_rdata[7]_i_2_n_0\,
      I2 => s_axi_araddr(0),
      I3 => \s_axi_rdata[7]_i_3_n_0\,
      O => D(7)
    );
\s_axi_rdata[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AABFBBBFEEBFFFBF"
    )
        port map (
      I0 => s_axi_araddr(3),
      I1 => s_axi_araddr(2),
      I2 => arm_valid_reg_0,
      I3 => s_axi_araddr(1),
      I4 => \s_axi_rdata_reg[31]\(6),
      I5 => active_interval_ticks(7),
      O => \s_axi_rdata[7]_i_2_n_0\
    );
\s_axi_rdata[7]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C7F7FFFFC7F70000"
    )
        port map (
      I0 => active_sample_count(7),
      I1 => s_axi_araddr(2),
      I2 => s_axi_araddr(3),
      I3 => \s_axi_rdata_reg[31]_0\(6),
      I4 => s_axi_araddr(1),
      I5 => \s_axi_rdata[7]_i_4_n_0\,
      O => \s_axi_rdata[7]_i_3_n_0\
    );
\s_axi_rdata[7]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABFB"
    )
        port map (
      I0 => s_axi_araddr(3),
      I1 => Q(6),
      I2 => s_axi_araddr(2),
      I3 => captured_count(7),
      O => \s_axi_rdata[7]_i_4_n_0\
    );
\s_axi_rdata[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => \s_axi_rdata[8]_i_2_n_0\,
      I1 => \s_axi_rdata[8]_i_3_n_0\,
      I2 => \s_axi_rdata_reg[0]\,
      O => D(8)
    );
\s_axi_rdata[8]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF38080000"
    )
        port map (
      I0 => active_sample_count(8),
      I1 => s_axi_araddr(2),
      I2 => s_axi_araddr(3),
      I3 => \s_axi_rdata_reg[31]_0\(7),
      I4 => s_axi_araddr(1),
      I5 => \s_axi_rdata[8]_i_4_n_0\,
      O => \s_axi_rdata[8]_i_2_n_0\
    );
\s_axi_rdata[8]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4545415155554151"
    )
        port map (
      I0 => s_axi_araddr(0),
      I1 => s_axi_araddr(3),
      I2 => s_axi_araddr(1),
      I3 => \s_axi_rdata_reg[31]\(7),
      I4 => s_axi_araddr(2),
      I5 => active_interval_ticks(8),
      O => \s_axi_rdata[8]_i_3_n_0\
    );
\s_axi_rdata[8]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"11100010FFFFFFFF"
    )
        port map (
      I0 => s_axi_araddr(3),
      I1 => s_axi_araddr(1),
      I2 => Q(7),
      I3 => s_axi_araddr(2),
      I4 => captured_count(8),
      I5 => s_axi_araddr(0),
      O => \s_axi_rdata[8]_i_4_n_0\
    );
\s_axi_rdata[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => \s_axi_rdata[9]_i_2_n_0\,
      I1 => \s_axi_rdata[9]_i_3_n_0\,
      I2 => \s_axi_rdata_reg[0]\,
      O => D(9)
    );
\s_axi_rdata[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF38080000"
    )
        port map (
      I0 => active_sample_count(9),
      I1 => s_axi_araddr(2),
      I2 => s_axi_araddr(3),
      I3 => \s_axi_rdata_reg[31]_0\(8),
      I4 => s_axi_araddr(1),
      I5 => \s_axi_rdata[9]_i_4_n_0\,
      O => \s_axi_rdata[9]_i_2_n_0\
    );
\s_axi_rdata[9]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4541554145515551"
    )
        port map (
      I0 => s_axi_araddr(0),
      I1 => s_axi_araddr(3),
      I2 => s_axi_araddr(1),
      I3 => s_axi_araddr(2),
      I4 => active_interval_ticks(9),
      I5 => \s_axi_rdata_reg[31]\(8),
      O => \s_axi_rdata[9]_i_3_n_0\
    );
\s_axi_rdata[9]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"11100010FFFFFFFF"
    )
        port map (
      I0 => s_axi_araddr(3),
      I1 => s_axi_araddr(1),
      I2 => Q(8),
      I3 => s_axi_araddr(2),
      I4 => captured_count(9),
      I5 => s_axi_araddr(0),
      O => \s_axi_rdata[9]_i_4_n_0\
    );
\s_axi_rresp[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF0EFF0EFF0E0000"
    )
        port map (
      I0 => s_axi_araddr(0),
      I1 => s_axi_araddr(1),
      I2 => \s_axi_rdata_reg[0]_0\,
      I3 => \s_axi_rdata_reg[0]\,
      I4 => rd_error,
      I5 => \s_axi_rdata_reg[0]_1\,
      O => p_0_out(0)
    );
\s_axi_rresp[1]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF004040"
    )
        port map (
      I0 => capture_active_0,
      I1 => s_axi_aresetn,
      I2 => s_axi_arvalid,
      I3 => memory_valid,
      I4 => memory_pending_reg_0,
      O => s_axi_rvalid_reg
    );
s_axi_rvalid_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF8888D888D888"
    )
        port map (
      I0 => memory_pending_reg_0,
      I1 => memory_valid,
      I2 => s_axi_arvalid,
      I3 => s_axi_aresetn,
      I4 => s_axi_rready,
      I5 => capture_active_0,
      O => memory_pending_reg
    );
sample_memory_reg: unisim.vcomponents.RAMB18E1
    generic map(
      DOA_REG => 0,
      DOB_REG => 0,
      INIT_A => X"00000",
      INIT_B => X"00000",
      RAM_MODE => "TDP",
      RDADDR_COLLISION_HWCONFIG => "DELAYED_WRITE",
      READ_WIDTH_A => 18,
      READ_WIDTH_B => 18,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SIM_DEVICE => "7SERIES",
      SRVAL_A => X"00000",
      SRVAL_B => X"00000",
      WRITE_MODE_A => "READ_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 18,
      WRITE_WIDTH_B => 18
    )
        port map (
      ADDRARDADDR(13 downto 4) => captured_count(9 downto 0),
      ADDRARDADDR(3 downto 0) => B"1111",
      ADDRBWRADDR(13 downto 4) => \rd_error1_carry__2_0\(9 downto 0),
      ADDRBWRADDR(3 downto 0) => B"1111",
      CLKARDCLK => s_axi_aclk,
      CLKBWRCLK => s_axi_aclk,
      DIADI(15 downto 2) => B"00000000000000",
      DIADI(1 downto 0) => sample_in(1 downto 0),
      DIBDI(15 downto 0) => B"0000000000000011",
      DIPADIP(1 downto 0) => B"00",
      DIPBDIP(1 downto 0) => B"00",
      DOADO(15 downto 0) => NLW_sample_memory_reg_DOADO_UNCONNECTED(15 downto 0),
      DOBDO(15 downto 2) => NLW_sample_memory_reg_DOBDO_UNCONNECTED(15 downto 2),
      DOBDO(1 downto 0) => memory_data(1 downto 0),
      DOPADOP(1 downto 0) => NLW_sample_memory_reg_DOPADOP_UNCONNECTED(1 downto 0),
      DOPBDOP(1 downto 0) => NLW_sample_memory_reg_DOPBDOP_UNCONNECTED(1 downto 0),
      ENARDEN => sample_fire0,
      ENBWREN => sample_memory_reg_i_2_n_0,
      REGCEAREGCE => '0',
      REGCEB => '0',
      RSTRAMARSTRAM => '0',
      RSTRAMB => sample_memory_reg_i_3_n_0,
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      WEA(1) => sample_memory_reg_i_4_n_0,
      WEA(0) => sample_memory_reg_i_4_n_0,
      WEBWE(3 downto 0) => B"0000"
    );
sample_memory_reg_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E0E0E0FFE0E0E0E0"
    )
        port map (
      I0 => sample_memory_reg_0,
      I1 => trigger_in,
      I2 => armed,
      I3 => sample_memory_reg_i_5_n_0,
      I4 => sample_memory_reg_i_6_n_0,
      I5 => sample_memory_reg_i_7_n_0,
      O => sample_fire0
    );
sample_memory_reg_i_10: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => interval_remaining_reg(16),
      I1 => interval_remaining_reg(19),
      I2 => interval_remaining_reg(11),
      I3 => interval_remaining_reg(30),
      I4 => sample_memory_reg_i_13_n_0,
      O => sample_memory_reg_i_10_n_0
    );
sample_memory_reg_i_11: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => interval_remaining_reg(31),
      I1 => interval_remaining_reg(25),
      I2 => interval_remaining_reg(29),
      I3 => interval_remaining_reg(12),
      O => sample_memory_reg_i_11_n_0
    );
sample_memory_reg_i_12: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => interval_remaining_reg(13),
      I1 => interval_remaining_reg(8),
      I2 => interval_remaining_reg(4),
      I3 => interval_remaining_reg(0),
      O => sample_memory_reg_i_12_n_0
    );
sample_memory_reg_i_13: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => interval_remaining_reg(24),
      I1 => interval_remaining_reg(23),
      I2 => interval_remaining_reg(28),
      I3 => interval_remaining_reg(14),
      O => sample_memory_reg_i_13_n_0
    );
sample_memory_reg_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FB"
    )
        port map (
      I0 => invalidate_in,
      I1 => s_axi_aresetn,
      I2 => memory_request,
      O => sample_memory_reg_i_2_n_0
    );
sample_memory_reg_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFDDDDD"
    )
        port map (
      I0 => s_axi_aresetn,
      I1 => invalidate_in,
      I2 => \active_interval_ticks[31]_i_2_n_0\,
      I3 => sample_memory_reg_i_8_n_0,
      I4 => memory_request,
      O => sample_memory_reg_i_3_n_0
    );
sample_memory_reg_i_4: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => invalidate_in,
      I1 => s_axi_aresetn,
      I2 => \captured_count_reg[0]_0\,
      O => sample_memory_reg_i_4_n_0
    );
sample_memory_reg_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFEFF"
    )
        port map (
      I0 => interval_remaining_reg(17),
      I1 => interval_remaining_reg(3),
      I2 => interval_remaining_reg(9),
      I3 => busy,
      I4 => interval_remaining_reg(5),
      I5 => interval_remaining_reg(22),
      O => sample_memory_reg_i_5_n_0
    );
sample_memory_reg_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => sample_memory_reg_i_9_n_0,
      I1 => interval_remaining_reg(7),
      I2 => interval_remaining_reg(6),
      I3 => interval_remaining_reg(15),
      I4 => interval_remaining_reg(1),
      I5 => sample_memory_reg_i_10_n_0,
      O => sample_memory_reg_i_6_n_0
    );
sample_memory_reg_i_7: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => interval_remaining_reg(26),
      I1 => interval_remaining_reg(10),
      I2 => interval_remaining_reg(27),
      I3 => sample_memory_reg_i_11_n_0,
      I4 => sample_memory_reg_i_12_n_0,
      O => sample_memory_reg_i_7_n_0
    );
sample_memory_reg_i_8: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFEFFF"
    )
        port map (
      I0 => armed,
      I1 => busy,
      I2 => record_valid,
      I3 => rd_error1,
      I4 => \captured_count_reg[0]_0\,
      O => sample_memory_reg_i_8_n_0
    );
sample_memory_reg_i_9: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => interval_remaining_reg(21),
      I1 => interval_remaining_reg(2),
      I2 => interval_remaining_reg(20),
      I3 => interval_remaining_reg(18),
      O => sample_memory_reg_i_9_n_0
    );
soft_trigger_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000040000000"
    )
        port map (
      I0 => cancel_pulse_reg,
      I1 => soft_trigger_reg(1),
      I2 => cancel_pulse_reg_0(0),
      I3 => \^shadow_count_reg[24]\,
      I4 => address_pending0,
      I5 => \^trigger_sticky_0\,
      O => \write_data_reg[2]\
    );
trigger_seen_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => armed,
      I1 => armed7_out,
      O => trigger_seen_i_1_n_0
    );
trigger_seen_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => trigger_seen_i_1_n_0,
      Q => trigger_seen,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_digital_capture_0_fdw_digital_axi is
  port (
    s_axi_rvalid_reg_0 : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 0 to 0 );
    capture_active : out STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bvalid_reg_0 : out STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 11 downto 0 );
    invalidate_in : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    trigger_in : in STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    sample_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    s_axi_awvalid : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_bready : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_digital_capture_0_fdw_digital_axi : entity is "fdw_digital_axi";
end system_digital_capture_0_fdw_digital_axi;

architecture STRUCTURE of system_digital_capture_0_fdw_digital_axi is
  signal address_pending : STD_LOGIC;
  signal address_pending0 : STD_LOGIC;
  signal address_pending_i_1_n_0 : STD_LOGIC;
  signal arm_count : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \arm_interval[31]_i_10_n_0\ : STD_LOGIC;
  signal \arm_interval[31]_i_11_n_0\ : STD_LOGIC;
  signal \arm_interval[31]_i_12_n_0\ : STD_LOGIC;
  signal \arm_interval[31]_i_13_n_0\ : STD_LOGIC;
  signal \arm_interval[31]_i_14_n_0\ : STD_LOGIC;
  signal \arm_interval[31]_i_15_n_0\ : STD_LOGIC;
  signal \arm_interval[31]_i_16_n_0\ : STD_LOGIC;
  signal \arm_interval[31]_i_17_n_0\ : STD_LOGIC;
  signal \arm_interval[31]_i_18_n_0\ : STD_LOGIC;
  signal \arm_interval[31]_i_19_n_0\ : STD_LOGIC;
  signal \arm_interval[31]_i_20_n_0\ : STD_LOGIC;
  signal \arm_interval[31]_i_21_n_0\ : STD_LOGIC;
  signal \arm_interval[31]_i_22_n_0\ : STD_LOGIC;
  signal \arm_interval[31]_i_23_n_0\ : STD_LOGIC;
  signal \arm_interval[31]_i_24_n_0\ : STD_LOGIC;
  signal \arm_interval[31]_i_25_n_0\ : STD_LOGIC;
  signal \arm_interval[31]_i_26_n_0\ : STD_LOGIC;
  signal \arm_interval[31]_i_27_n_0\ : STD_LOGIC;
  signal \arm_interval[31]_i_28_n_0\ : STD_LOGIC;
  signal \arm_interval[31]_i_29_n_0\ : STD_LOGIC;
  signal \arm_interval[31]_i_2_n_0\ : STD_LOGIC;
  signal \arm_interval[31]_i_30_n_0\ : STD_LOGIC;
  signal \arm_interval[31]_i_31_n_0\ : STD_LOGIC;
  signal \arm_interval[31]_i_3_n_0\ : STD_LOGIC;
  signal \arm_interval[31]_i_5_n_0\ : STD_LOGIC;
  signal \arm_interval[31]_i_6_n_0\ : STD_LOGIC;
  signal \arm_interval[31]_i_7_n_0\ : STD_LOGIC;
  signal \arm_interval[31]_i_8_n_0\ : STD_LOGIC;
  signal \arm_interval[31]_i_9_n_0\ : STD_LOGIC;
  signal \arm_interval_reg_n_0_[0]\ : STD_LOGIC;
  signal \arm_interval_reg_n_0_[10]\ : STD_LOGIC;
  signal \arm_interval_reg_n_0_[11]\ : STD_LOGIC;
  signal \arm_interval_reg_n_0_[12]\ : STD_LOGIC;
  signal \arm_interval_reg_n_0_[13]\ : STD_LOGIC;
  signal \arm_interval_reg_n_0_[14]\ : STD_LOGIC;
  signal \arm_interval_reg_n_0_[15]\ : STD_LOGIC;
  signal \arm_interval_reg_n_0_[16]\ : STD_LOGIC;
  signal \arm_interval_reg_n_0_[17]\ : STD_LOGIC;
  signal \arm_interval_reg_n_0_[18]\ : STD_LOGIC;
  signal \arm_interval_reg_n_0_[19]\ : STD_LOGIC;
  signal \arm_interval_reg_n_0_[1]\ : STD_LOGIC;
  signal \arm_interval_reg_n_0_[20]\ : STD_LOGIC;
  signal \arm_interval_reg_n_0_[21]\ : STD_LOGIC;
  signal \arm_interval_reg_n_0_[22]\ : STD_LOGIC;
  signal \arm_interval_reg_n_0_[23]\ : STD_LOGIC;
  signal \arm_interval_reg_n_0_[24]\ : STD_LOGIC;
  signal \arm_interval_reg_n_0_[25]\ : STD_LOGIC;
  signal \arm_interval_reg_n_0_[26]\ : STD_LOGIC;
  signal \arm_interval_reg_n_0_[27]\ : STD_LOGIC;
  signal \arm_interval_reg_n_0_[28]\ : STD_LOGIC;
  signal \arm_interval_reg_n_0_[29]\ : STD_LOGIC;
  signal \arm_interval_reg_n_0_[2]\ : STD_LOGIC;
  signal \arm_interval_reg_n_0_[30]\ : STD_LOGIC;
  signal \arm_interval_reg_n_0_[31]\ : STD_LOGIC;
  signal \arm_interval_reg_n_0_[3]\ : STD_LOGIC;
  signal \arm_interval_reg_n_0_[4]\ : STD_LOGIC;
  signal \arm_interval_reg_n_0_[5]\ : STD_LOGIC;
  signal \arm_interval_reg_n_0_[6]\ : STD_LOGIC;
  signal \arm_interval_reg_n_0_[7]\ : STD_LOGIC;
  signal \arm_interval_reg_n_0_[8]\ : STD_LOGIC;
  signal \arm_interval_reg_n_0_[9]\ : STD_LOGIC;
  signal arm_valid7_out : STD_LOGIC;
  signal arm_valid_i_2_n_0 : STD_LOGIC;
  signal arm_valid_i_3_n_0 : STD_LOGIC;
  signal arm_valid_i_4_n_0 : STD_LOGIC;
  signal arm_valid_reg_n_0 : STD_LOGIC;
  signal arm_wait_reg_n_0 : STD_LOGIC;
  signal cancel_pulse_i_2_n_0 : STD_LOGIC;
  signal cancel_pulse_reg_n_0 : STD_LOGIC;
  signal cancel_sticky : STD_LOGIC;
  signal cancel_sticky_i_1_n_0 : STD_LOGIC;
  signal cancelled : STD_LOGIC;
  signal capture_n_10 : STD_LOGIC;
  signal capture_n_11 : STD_LOGIC;
  signal capture_n_12 : STD_LOGIC;
  signal capture_n_14 : STD_LOGIC;
  signal capture_n_15 : STD_LOGIC;
  signal capture_n_17 : STD_LOGIC;
  signal capture_n_18 : STD_LOGIC;
  signal capture_n_20 : STD_LOGIC;
  signal capture_n_22 : STD_LOGIC;
  signal capture_n_23 : STD_LOGIC;
  signal capture_n_24 : STD_LOGIC;
  signal capture_n_25 : STD_LOGIC;
  signal capture_n_28 : STD_LOGIC;
  signal capture_n_29 : STD_LOGIC;
  signal capture_n_32 : STD_LOGIC;
  signal capture_n_33 : STD_LOGIC;
  signal capture_n_36 : STD_LOGIC;
  signal capture_n_38 : STD_LOGIC;
  signal capture_n_4 : STD_LOGIC;
  signal capture_n_41 : STD_LOGIC;
  signal capture_n_43 : STD_LOGIC;
  signal capture_n_44 : STD_LOGIC;
  signal capture_n_45 : STD_LOGIC;
  signal capture_n_46 : STD_LOGIC;
  signal capture_n_47 : STD_LOGIC;
  signal capture_n_6 : STD_LOGIC;
  signal capture_n_7 : STD_LOGIC;
  signal capture_n_8 : STD_LOGIC;
  signal cfg_error : STD_LOGIC;
  signal data00 : STD_LOGIC;
  signal data_pending_i_1_n_0 : STD_LOGIC;
  signal data_pending_reg_n_0 : STD_LOGIC;
  signal error_sticky : STD_LOGIC;
  signal error_sticky_i_1_n_0 : STD_LOGIC;
  signal memory_index : STD_LOGIC_VECTOR ( 31 downto 10 );
  signal memory_index_1 : STD_LOGIC;
  signal \memory_index_reg_n_0_[0]\ : STD_LOGIC;
  signal \memory_index_reg_n_0_[1]\ : STD_LOGIC;
  signal \memory_index_reg_n_0_[2]\ : STD_LOGIC;
  signal \memory_index_reg_n_0_[3]\ : STD_LOGIC;
  signal \memory_index_reg_n_0_[4]\ : STD_LOGIC;
  signal \memory_index_reg_n_0_[5]\ : STD_LOGIC;
  signal \memory_index_reg_n_0_[6]\ : STD_LOGIC;
  signal \memory_index_reg_n_0_[7]\ : STD_LOGIC;
  signal \memory_index_reg_n_0_[8]\ : STD_LOGIC;
  signal \memory_index_reg_n_0_[9]\ : STD_LOGIC;
  signal memory_pending_reg_n_0 : STD_LOGIC;
  signal memory_request : STD_LOGIC;
  signal p_0_in0 : STD_LOGIC;
  signal p_0_out : STD_LOGIC_VECTOR ( 1 to 1 );
  signal p_2_in : STD_LOGIC_VECTOR ( 30 downto 0 );
  signal read_index : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \read_index[15]_i_1_n_0\ : STD_LOGIC;
  signal \read_index[23]_i_1_n_0\ : STD_LOGIC;
  signal \read_index[31]_i_1_n_0\ : STD_LOGIC;
  signal \read_index[31]_i_2_n_0\ : STD_LOGIC;
  signal \read_index[7]_i_1_n_0\ : STD_LOGIC;
  signal \^s_axi_bresp\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \s_axi_bresp[1]_i_10_n_0\ : STD_LOGIC;
  signal \s_axi_bresp[1]_i_11_n_0\ : STD_LOGIC;
  signal \s_axi_bresp[1]_i_13_n_0\ : STD_LOGIC;
  signal \s_axi_bresp[1]_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_bresp[1]_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_bresp[1]_i_6_n_0\ : STD_LOGIC;
  signal \s_axi_bresp[1]_i_7_n_0\ : STD_LOGIC;
  signal \s_axi_bresp[1]_i_9_n_0\ : STD_LOGIC;
  signal s_axi_bvalid_i_1_n_0 : STD_LOGIC;
  signal \^s_axi_bvalid_reg_0\ : STD_LOGIC;
  signal \s_axi_rdata[10]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[1]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[1]_i_5_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[31]_i_11_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[31]_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[31]_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[31]_i_6_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[31]_i_7_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[31]_i_8_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[5]_i_3_n_0\ : STD_LOGIC;
  signal \^s_axi_rresp\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \s_axi_rresp[1]_i_1_n_0\ : STD_LOGIC;
  signal s_axi_rvalid0 : STD_LOGIC;
  signal s_axi_rvalid_i_1_n_0 : STD_LOGIC;
  signal \^s_axi_rvalid_reg_0\ : STD_LOGIC;
  signal shadow_count : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \shadow_count[15]_i_1_n_0\ : STD_LOGIC;
  signal \shadow_count[23]_i_1_n_0\ : STD_LOGIC;
  signal \shadow_count[31]_i_1_n_0\ : STD_LOGIC;
  signal \shadow_count[31]_i_2_n_0\ : STD_LOGIC;
  signal \shadow_count[7]_i_1_n_0\ : STD_LOGIC;
  signal shadow_interval : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \shadow_interval[15]_i_1_n_0\ : STD_LOGIC;
  signal \shadow_interval[23]_i_1_n_0\ : STD_LOGIC;
  signal \shadow_interval[31]_i_1_n_0\ : STD_LOGIC;
  signal \shadow_interval[31]_i_2_n_0\ : STD_LOGIC;
  signal \shadow_interval[31]_i_3_n_0\ : STD_LOGIC;
  signal \shadow_interval[7]_i_1_n_0\ : STD_LOGIC;
  signal shadow_wait : STD_LOGIC;
  signal shadow_wait_i_1_n_0 : STD_LOGIC;
  signal shadow_wait_i_2_n_0 : STD_LOGIC;
  signal shadow_wait_i_3_n_0 : STD_LOGIC;
  signal shadow_wait_i_4_n_0 : STD_LOGIC;
  signal shadow_wait_i_5_n_0 : STD_LOGIC;
  signal shadow_wait_i_6_n_0 : STD_LOGIC;
  signal shadow_wait_i_7_n_0 : STD_LOGIC;
  signal soft_trigger_reg_n_0 : STD_LOGIC;
  signal trigger_seen : STD_LOGIC;
  signal trigger_sticky : STD_LOGIC;
  signal trigger_sticky_0 : STD_LOGIC;
  signal trigger_sticky_i_1_n_0 : STD_LOGIC;
  signal write_address0 : STD_LOGIC;
  signal \write_address_reg_n_0_[0]\ : STD_LOGIC;
  signal \write_address_reg_n_0_[10]\ : STD_LOGIC;
  signal \write_address_reg_n_0_[11]\ : STD_LOGIC;
  signal \write_address_reg_n_0_[1]\ : STD_LOGIC;
  signal \write_address_reg_n_0_[2]\ : STD_LOGIC;
  signal \write_address_reg_n_0_[3]\ : STD_LOGIC;
  signal \write_address_reg_n_0_[4]\ : STD_LOGIC;
  signal \write_address_reg_n_0_[5]\ : STD_LOGIC;
  signal \write_address_reg_n_0_[7]\ : STD_LOGIC;
  signal \write_address_reg_n_0_[8]\ : STD_LOGIC;
  signal \write_address_reg_n_0_[9]\ : STD_LOGIC;
  signal write_data : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal write_data0 : STD_LOGIC;
  signal \write_strobes_reg_n_0_[0]\ : STD_LOGIC;
  signal \write_strobes_reg_n_0_[2]\ : STD_LOGIC;
  signal \write_strobes_reg_n_0_[3]\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of address_pending_i_1 : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \arm_interval[31]_i_10\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \arm_interval[31]_i_21\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \arm_interval[31]_i_6\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \arm_interval[31]_i_7\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of arm_valid_i_2 : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of arm_valid_i_4 : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of cancel_pulse_i_2 : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of data_pending_i_1 : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \read_index[31]_i_2\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of s_axi_awready_INST_0 : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \s_axi_bresp[1]_i_5\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \s_axi_bresp[1]_i_9\ : label is "soft_lutpair9";
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of \s_axi_bresp_reg[1]\ : label is "xilinx.com:interface:aximm:1.0 S_AXI BRESP";
  attribute X_INTERFACE_INFO of s_axi_bvalid_reg : label is "xilinx.com:interface:aximm:1.0 S_AXI BVALID";
  attribute SOFT_HLUTNM of \s_axi_rdata[1]_i_5\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \s_axi_rdata[31]_i_4\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \s_axi_rdata[31]_i_6\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \s_axi_rdata[31]_i_8\ : label is "soft_lutpair13";
  attribute X_INTERFACE_INFO of \s_axi_rdata_reg[0]\ : label is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of \s_axi_rdata_reg[10]\ : label is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of \s_axi_rdata_reg[11]\ : label is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of \s_axi_rdata_reg[12]\ : label is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of \s_axi_rdata_reg[13]\ : label is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of \s_axi_rdata_reg[14]\ : label is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of \s_axi_rdata_reg[15]\ : label is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of \s_axi_rdata_reg[16]\ : label is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of \s_axi_rdata_reg[17]\ : label is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of \s_axi_rdata_reg[18]\ : label is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of \s_axi_rdata_reg[19]\ : label is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of \s_axi_rdata_reg[1]\ : label is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of \s_axi_rdata_reg[20]\ : label is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of \s_axi_rdata_reg[21]\ : label is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of \s_axi_rdata_reg[22]\ : label is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of \s_axi_rdata_reg[23]\ : label is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of \s_axi_rdata_reg[24]\ : label is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of \s_axi_rdata_reg[25]\ : label is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of \s_axi_rdata_reg[26]\ : label is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of \s_axi_rdata_reg[27]\ : label is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of \s_axi_rdata_reg[28]\ : label is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of \s_axi_rdata_reg[29]\ : label is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of \s_axi_rdata_reg[2]\ : label is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of \s_axi_rdata_reg[30]\ : label is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of \s_axi_rdata_reg[31]\ : label is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of \s_axi_rdata_reg[3]\ : label is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of \s_axi_rdata_reg[4]\ : label is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of \s_axi_rdata_reg[5]\ : label is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of \s_axi_rdata_reg[6]\ : label is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of \s_axi_rdata_reg[7]\ : label is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of \s_axi_rdata_reg[8]\ : label is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of \s_axi_rdata_reg[9]\ : label is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of \s_axi_rresp_reg[1]\ : label is "xilinx.com:interface:aximm:1.0 S_AXI RRESP";
  attribute X_INTERFACE_INFO of s_axi_rvalid_reg : label is "xilinx.com:interface:aximm:1.0 S_AXI RVALID";
  attribute SOFT_HLUTNM of s_axi_wready_INST_0 : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \shadow_count[31]_i_2\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \shadow_interval[31]_i_3\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of shadow_wait_i_5 : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of shadow_wait_i_7 : label is "soft_lutpair11";
begin
  s_axi_bresp(0) <= \^s_axi_bresp\(0);
  s_axi_bvalid_reg_0 <= \^s_axi_bvalid_reg_0\;
  s_axi_rresp(0) <= \^s_axi_rresp\(0);
  s_axi_rvalid_reg_0 <= \^s_axi_rvalid_reg_0\;
address_pending_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"C008CC08"
    )
        port map (
      I0 => s_axi_awvalid,
      I1 => s_axi_aresetn,
      I2 => \^s_axi_bvalid_reg_0\,
      I3 => address_pending,
      I4 => data_pending_reg_n_0,
      O => address_pending_i_1_n_0
    );
address_pending_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => address_pending_i_1_n_0,
      Q => address_pending,
      R => '0'
    );
\arm_count_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => arm_valid7_out,
      D => shadow_count(0),
      Q => arm_count(0),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\arm_count_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => arm_valid7_out,
      D => shadow_count(10),
      Q => arm_count(10),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\arm_count_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => arm_valid7_out,
      D => shadow_count(11),
      Q => arm_count(11),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\arm_count_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => arm_valid7_out,
      D => shadow_count(12),
      Q => arm_count(12),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\arm_count_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => arm_valid7_out,
      D => shadow_count(13),
      Q => arm_count(13),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\arm_count_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => arm_valid7_out,
      D => shadow_count(14),
      Q => arm_count(14),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\arm_count_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => arm_valid7_out,
      D => shadow_count(15),
      Q => arm_count(15),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\arm_count_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => arm_valid7_out,
      D => shadow_count(16),
      Q => arm_count(16),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\arm_count_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => arm_valid7_out,
      D => shadow_count(17),
      Q => arm_count(17),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\arm_count_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => arm_valid7_out,
      D => shadow_count(18),
      Q => arm_count(18),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\arm_count_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => arm_valid7_out,
      D => shadow_count(19),
      Q => arm_count(19),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\arm_count_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => arm_valid7_out,
      D => shadow_count(1),
      Q => arm_count(1),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\arm_count_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => arm_valid7_out,
      D => shadow_count(20),
      Q => arm_count(20),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\arm_count_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => arm_valid7_out,
      D => shadow_count(21),
      Q => arm_count(21),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\arm_count_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => arm_valid7_out,
      D => shadow_count(22),
      Q => arm_count(22),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\arm_count_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => arm_valid7_out,
      D => shadow_count(23),
      Q => arm_count(23),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\arm_count_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => arm_valid7_out,
      D => shadow_count(24),
      Q => arm_count(24),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\arm_count_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => arm_valid7_out,
      D => shadow_count(25),
      Q => arm_count(25),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\arm_count_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => arm_valid7_out,
      D => shadow_count(26),
      Q => arm_count(26),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\arm_count_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => arm_valid7_out,
      D => shadow_count(27),
      Q => arm_count(27),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\arm_count_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => arm_valid7_out,
      D => shadow_count(28),
      Q => arm_count(28),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\arm_count_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => arm_valid7_out,
      D => shadow_count(29),
      Q => arm_count(29),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\arm_count_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => arm_valid7_out,
      D => shadow_count(2),
      Q => arm_count(2),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\arm_count_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => arm_valid7_out,
      D => shadow_count(30),
      Q => arm_count(30),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\arm_count_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => arm_valid7_out,
      D => shadow_count(31),
      Q => arm_count(31),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\arm_count_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => arm_valid7_out,
      D => shadow_count(3),
      Q => arm_count(3),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\arm_count_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => arm_valid7_out,
      D => shadow_count(4),
      Q => arm_count(4),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\arm_count_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => arm_valid7_out,
      D => shadow_count(5),
      Q => arm_count(5),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\arm_count_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => arm_valid7_out,
      D => shadow_count(6),
      Q => arm_count(6),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\arm_count_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => arm_valid7_out,
      D => shadow_count(7),
      Q => arm_count(7),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\arm_count_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => arm_valid7_out,
      D => shadow_count(8),
      Q => arm_count(8),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\arm_count_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => arm_valid7_out,
      D => shadow_count(9),
      Q => arm_count(9),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\arm_interval[31]_i_10\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFC0EAC0"
    )
        port map (
      I0 => write_data(9),
      I1 => \write_strobes_reg_n_0_[2]\,
      I2 => write_data(19),
      I3 => data00,
      I4 => write_data(11),
      O => \arm_interval[31]_i_10_n_0\
    );
\arm_interval[31]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFE0000"
    )
        port map (
      I0 => write_data(14),
      I1 => write_data(13),
      I2 => write_data(15),
      I3 => write_data(10),
      I4 => data00,
      I5 => \arm_interval[31]_i_26_n_0\,
      O => \arm_interval[31]_i_11_n_0\
    );
\arm_interval[31]_i_12\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => shadow_interval(1),
      I1 => shadow_interval(2),
      I2 => shadow_interval(0),
      I3 => shadow_interval(3),
      I4 => \arm_interval[31]_i_27_n_0\,
      O => \arm_interval[31]_i_12_n_0\
    );
\arm_interval[31]_i_13\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => shadow_interval(21),
      I1 => shadow_interval(22),
      I2 => shadow_interval(20),
      I3 => shadow_interval(23),
      I4 => \arm_interval[31]_i_28_n_0\,
      O => \arm_interval[31]_i_13_n_0\
    );
\arm_interval[31]_i_14\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => shadow_interval(25),
      I1 => shadow_interval(26),
      I2 => shadow_interval(24),
      I3 => shadow_interval(27),
      I4 => \arm_interval[31]_i_29_n_0\,
      O => \arm_interval[31]_i_14_n_0\
    );
\arm_interval[31]_i_15\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => shadow_interval(13),
      I1 => shadow_interval(14),
      I2 => shadow_interval(12),
      I3 => shadow_interval(15),
      I4 => \arm_interval[31]_i_30_n_0\,
      O => \arm_interval[31]_i_15_n_0\
    );
\arm_interval[31]_i_16\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => shadow_count(4),
      I1 => shadow_count(6),
      I2 => shadow_count(1),
      I3 => shadow_count(2),
      I4 => \arm_interval[31]_i_31_n_0\,
      O => \arm_interval[31]_i_16_n_0\
    );
\arm_interval[31]_i_17\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \s_axi_bresp[1]_i_13_n_0\,
      I1 => arm_valid_reg_n_0,
      I2 => shadow_count(20),
      I3 => invalidate_in,
      I4 => \arm_interval[31]_i_18_n_0\,
      O => \arm_interval[31]_i_17_n_0\
    );
\arm_interval[31]_i_18\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => shadow_count(24),
      I1 => shadow_count(12),
      I2 => shadow_count(19),
      I3 => shadow_count(15),
      O => \arm_interval[31]_i_18_n_0\
    );
\arm_interval[31]_i_19\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => shadow_count(23),
      I1 => shadow_count(11),
      I2 => shadow_count(10),
      I3 => shadow_count(20),
      I4 => shadow_count(17),
      I5 => shadow_count(18),
      O => \arm_interval[31]_i_19_n_0\
    );
\arm_interval[31]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFBA"
    )
        port map (
      I0 => \arm_interval[31]_i_8_n_0\,
      I1 => \arm_interval[31]_i_9_n_0\,
      I2 => write_data(2),
      I3 => \arm_interval[31]_i_10_n_0\,
      I4 => \arm_interval[31]_i_11_n_0\,
      O => \arm_interval[31]_i_2_n_0\
    );
\arm_interval[31]_i_20\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A8"
    )
        port map (
      I0 => \write_strobes_reg_n_0_[2]\,
      I1 => write_data(23),
      I2 => write_data(22),
      O => \arm_interval[31]_i_20_n_0\
    );
\arm_interval[31]_i_21\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => write_data(7),
      I1 => \write_strobes_reg_n_0_[0]\,
      I2 => write_data(12),
      I3 => data00,
      O => \arm_interval[31]_i_21_n_0\
    );
\arm_interval[31]_i_22\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAA8"
    )
        port map (
      I0 => \write_strobes_reg_n_0_[3]\,
      I1 => write_data(24),
      I2 => write_data(30),
      I3 => write_data(29),
      I4 => write_data(31),
      O => \arm_interval[31]_i_22_n_0\
    );
\arm_interval[31]_i_23\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AAA8"
    )
        port map (
      I0 => \write_strobes_reg_n_0_[2]\,
      I1 => write_data(17),
      I2 => write_data(18),
      I3 => write_data(21),
      O => \arm_interval[31]_i_23_n_0\
    );
\arm_interval[31]_i_24\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AAA8"
    )
        port map (
      I0 => \write_strobes_reg_n_0_[3]\,
      I1 => write_data(25),
      I2 => write_data(26),
      I3 => write_data(28),
      O => \arm_interval[31]_i_24_n_0\
    );
\arm_interval[31]_i_25\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAA8"
    )
        port map (
      I0 => \write_strobes_reg_n_0_[0]\,
      I1 => write_data(3),
      I2 => write_data(6),
      I3 => write_data(4),
      I4 => write_data(5),
      O => \arm_interval[31]_i_25_n_0\
    );
\arm_interval[31]_i_26\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFF88888"
    )
        port map (
      I0 => write_data(27),
      I1 => \write_strobes_reg_n_0_[3]\,
      I2 => write_data(16),
      I3 => write_data(20),
      I4 => \write_strobes_reg_n_0_[2]\,
      O => \arm_interval[31]_i_26_n_0\
    );
\arm_interval[31]_i_27\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => shadow_interval(19),
      I1 => shadow_interval(16),
      I2 => shadow_interval(18),
      I3 => shadow_interval(17),
      O => \arm_interval[31]_i_27_n_0\
    );
\arm_interval[31]_i_28\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => shadow_interval(7),
      I1 => shadow_interval(4),
      I2 => shadow_interval(6),
      I3 => shadow_interval(5),
      O => \arm_interval[31]_i_28_n_0\
    );
\arm_interval[31]_i_29\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => shadow_interval(11),
      I1 => shadow_interval(8),
      I2 => shadow_interval(10),
      I3 => shadow_interval(9),
      O => \arm_interval[31]_i_29_n_0\
    );
\arm_interval[31]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0010FFFF00100010"
    )
        port map (
      I0 => \arm_interval[31]_i_12_n_0\,
      I1 => \arm_interval[31]_i_13_n_0\,
      I2 => \arm_interval[31]_i_14_n_0\,
      I3 => \arm_interval[31]_i_15_n_0\,
      I4 => \arm_interval[31]_i_16_n_0\,
      I5 => shadow_count(10),
      O => \arm_interval[31]_i_3_n_0\
    );
\arm_interval[31]_i_30\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => shadow_interval(30),
      I1 => shadow_interval(28),
      I2 => shadow_interval(31),
      I3 => shadow_interval(29),
      O => \arm_interval[31]_i_30_n_0\
    );
\arm_interval[31]_i_31\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => shadow_count(9),
      I1 => shadow_count(0),
      I2 => shadow_count(5),
      I3 => shadow_count(7),
      I4 => shadow_count(3),
      I5 => shadow_count(8),
      O => \arm_interval[31]_i_31_n_0\
    );
\arm_interval[31]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FEFF"
    )
        port map (
      I0 => \s_axi_bresp[1]_i_7_n_0\,
      I1 => \arm_interval[31]_i_18_n_0\,
      I2 => \arm_interval[31]_i_19_n_0\,
      I3 => \arm_interval[31]_i_16_n_0\,
      O => \arm_interval[31]_i_5_n_0\
    );
\arm_interval[31]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFBF"
    )
        port map (
      I0 => cancel_pulse_i_2_n_0,
      I1 => data_pending_reg_n_0,
      I2 => address_pending,
      I3 => \^s_axi_bvalid_reg_0\,
      O => \arm_interval[31]_i_6_n_0\
    );
\arm_interval[31]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \write_strobes_reg_n_0_[0]\,
      I1 => write_data(0),
      O => \arm_interval[31]_i_7_n_0\
    );
\arm_interval[31]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \arm_interval[31]_i_20_n_0\,
      I1 => \arm_interval[31]_i_21_n_0\,
      I2 => \arm_interval[31]_i_22_n_0\,
      I3 => \arm_interval[31]_i_23_n_0\,
      I4 => \arm_interval[31]_i_24_n_0\,
      I5 => \arm_interval[31]_i_25_n_0\,
      O => \arm_interval[31]_i_8_n_0\
    );
\arm_interval[31]_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1F"
    )
        port map (
      I0 => write_data(0),
      I1 => write_data(1),
      I2 => \write_strobes_reg_n_0_[0]\,
      O => \arm_interval[31]_i_9_n_0\
    );
\arm_interval_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => arm_valid7_out,
      D => shadow_interval(0),
      Q => \arm_interval_reg_n_0_[0]\,
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\arm_interval_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => arm_valid7_out,
      D => shadow_interval(10),
      Q => \arm_interval_reg_n_0_[10]\,
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\arm_interval_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => arm_valid7_out,
      D => shadow_interval(11),
      Q => \arm_interval_reg_n_0_[11]\,
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\arm_interval_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => arm_valid7_out,
      D => shadow_interval(12),
      Q => \arm_interval_reg_n_0_[12]\,
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\arm_interval_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => arm_valid7_out,
      D => shadow_interval(13),
      Q => \arm_interval_reg_n_0_[13]\,
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\arm_interval_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => arm_valid7_out,
      D => shadow_interval(14),
      Q => \arm_interval_reg_n_0_[14]\,
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\arm_interval_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => arm_valid7_out,
      D => shadow_interval(15),
      Q => \arm_interval_reg_n_0_[15]\,
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\arm_interval_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => arm_valid7_out,
      D => shadow_interval(16),
      Q => \arm_interval_reg_n_0_[16]\,
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\arm_interval_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => arm_valid7_out,
      D => shadow_interval(17),
      Q => \arm_interval_reg_n_0_[17]\,
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\arm_interval_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => arm_valid7_out,
      D => shadow_interval(18),
      Q => \arm_interval_reg_n_0_[18]\,
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\arm_interval_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => arm_valid7_out,
      D => shadow_interval(19),
      Q => \arm_interval_reg_n_0_[19]\,
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\arm_interval_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => arm_valid7_out,
      D => shadow_interval(1),
      Q => \arm_interval_reg_n_0_[1]\,
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\arm_interval_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => arm_valid7_out,
      D => shadow_interval(20),
      Q => \arm_interval_reg_n_0_[20]\,
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\arm_interval_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => arm_valid7_out,
      D => shadow_interval(21),
      Q => \arm_interval_reg_n_0_[21]\,
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\arm_interval_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => arm_valid7_out,
      D => shadow_interval(22),
      Q => \arm_interval_reg_n_0_[22]\,
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\arm_interval_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => arm_valid7_out,
      D => shadow_interval(23),
      Q => \arm_interval_reg_n_0_[23]\,
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\arm_interval_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => arm_valid7_out,
      D => shadow_interval(24),
      Q => \arm_interval_reg_n_0_[24]\,
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\arm_interval_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => arm_valid7_out,
      D => shadow_interval(25),
      Q => \arm_interval_reg_n_0_[25]\,
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\arm_interval_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => arm_valid7_out,
      D => shadow_interval(26),
      Q => \arm_interval_reg_n_0_[26]\,
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\arm_interval_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => arm_valid7_out,
      D => shadow_interval(27),
      Q => \arm_interval_reg_n_0_[27]\,
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\arm_interval_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => arm_valid7_out,
      D => shadow_interval(28),
      Q => \arm_interval_reg_n_0_[28]\,
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\arm_interval_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => arm_valid7_out,
      D => shadow_interval(29),
      Q => \arm_interval_reg_n_0_[29]\,
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\arm_interval_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => arm_valid7_out,
      D => shadow_interval(2),
      Q => \arm_interval_reg_n_0_[2]\,
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\arm_interval_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => arm_valid7_out,
      D => shadow_interval(30),
      Q => \arm_interval_reg_n_0_[30]\,
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\arm_interval_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => arm_valid7_out,
      D => shadow_interval(31),
      Q => \arm_interval_reg_n_0_[31]\,
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\arm_interval_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => arm_valid7_out,
      D => shadow_interval(3),
      Q => \arm_interval_reg_n_0_[3]\,
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\arm_interval_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => arm_valid7_out,
      D => shadow_interval(4),
      Q => \arm_interval_reg_n_0_[4]\,
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\arm_interval_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => arm_valid7_out,
      D => shadow_interval(5),
      Q => \arm_interval_reg_n_0_[5]\,
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\arm_interval_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => arm_valid7_out,
      D => shadow_interval(6),
      Q => \arm_interval_reg_n_0_[6]\,
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\arm_interval_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => arm_valid7_out,
      D => shadow_interval(7),
      Q => \arm_interval_reg_n_0_[7]\,
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\arm_interval_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => arm_valid7_out,
      D => shadow_interval(8),
      Q => \arm_interval_reg_n_0_[8]\,
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\arm_interval_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => arm_valid7_out,
      D => shadow_interval(9),
      Q => \arm_interval_reg_n_0_[9]\,
      R => \s_axi_bresp[1]_i_1_n_0\
    );
arm_valid_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"10110000"
    )
        port map (
      I0 => shadow_wait_i_4_n_0,
      I1 => \write_address_reg_n_0_[4]\,
      I2 => \write_address_reg_n_0_[1]\,
      I3 => \write_address_reg_n_0_[0]\,
      I4 => address_pending0,
      O => arm_valid_i_2_n_0
    );
arm_valid_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000000000A8"
    )
        port map (
      I0 => \write_strobes_reg_n_0_[0]\,
      I1 => write_data(1),
      I2 => write_data(0),
      I3 => arm_valid_i_4_n_0,
      I4 => \write_address_reg_n_0_[3]\,
      I5 => \write_address_reg_n_0_[2]\,
      O => arm_valid_i_3_n_0
    );
arm_valid_i_4: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \write_address_reg_n_0_[5]\,
      I1 => \write_address_reg_n_0_[1]\,
      I2 => \write_address_reg_n_0_[4]\,
      O => arm_valid_i_4_n_0
    );
arm_valid_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => capture_n_44,
      Q => arm_valid_reg_n_0,
      R => trigger_sticky_0
    );
arm_wait_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => arm_valid7_out,
      D => shadow_wait,
      Q => arm_wait_reg_n_0,
      R => \s_axi_bresp[1]_i_1_n_0\
    );
cancel_pulse_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => shadow_wait_i_4_n_0,
      I1 => \write_address_reg_n_0_[5]\,
      I2 => \s_axi_bresp[1]_i_9_n_0\,
      I3 => \write_address_reg_n_0_[3]\,
      I4 => \write_address_reg_n_0_[2]\,
      O => cancel_pulse_i_2_n_0
    );
cancel_pulse_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => capture_n_45,
      Q => cancel_pulse_reg_n_0,
      R => '0'
    );
cancel_sticky_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFBFFFFFFF0000"
    )
        port map (
      I0 => \arm_interval[31]_i_6_n_0\,
      I1 => write_data(8),
      I2 => data00,
      I3 => capture_n_38,
      I4 => cancelled,
      I5 => cancel_sticky,
      O => cancel_sticky_i_1_n_0
    );
cancel_sticky_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => cancel_sticky_i_1_n_0,
      Q => cancel_sticky,
      R => trigger_sticky_0
    );
capture: entity work.system_digital_capture_0_fdw_digital_capture
     port map (
      D(31) => capture_n_4,
      D(30) => p_2_in(30),
      D(29) => capture_n_6,
      D(28) => capture_n_7,
      D(27) => capture_n_8,
      D(26) => p_2_in(26),
      D(25) => capture_n_10,
      D(24) => capture_n_11,
      D(23) => capture_n_12,
      D(22) => p_2_in(22),
      D(21) => capture_n_14,
      D(20) => capture_n_15,
      D(19) => p_2_in(19),
      D(18) => capture_n_17,
      D(17) => capture_n_18,
      D(16) => p_2_in(16),
      D(15) => capture_n_20,
      D(14) => p_2_in(14),
      D(13) => capture_n_22,
      D(12) => capture_n_23,
      D(11) => capture_n_24,
      D(10) => capture_n_25,
      D(9 downto 8) => p_2_in(9 downto 8),
      D(7) => capture_n_28,
      D(6) => capture_n_29,
      D(5 downto 4) => p_2_in(5 downto 4),
      D(3) => capture_n_32,
      D(2) => capture_n_33,
      D(1 downto 0) => p_2_in(1 downto 0),
      E(0) => arm_valid7_out,
      Q(29 downto 9) => shadow_interval(31 downto 11),
      Q(8 downto 1) => shadow_interval(9 downto 2),
      Q(0) => shadow_interval(0),
      \active_interval_ticks_reg[31]_0\(31) => \arm_interval_reg_n_0_[31]\,
      \active_interval_ticks_reg[31]_0\(30) => \arm_interval_reg_n_0_[30]\,
      \active_interval_ticks_reg[31]_0\(29) => \arm_interval_reg_n_0_[29]\,
      \active_interval_ticks_reg[31]_0\(28) => \arm_interval_reg_n_0_[28]\,
      \active_interval_ticks_reg[31]_0\(27) => \arm_interval_reg_n_0_[27]\,
      \active_interval_ticks_reg[31]_0\(26) => \arm_interval_reg_n_0_[26]\,
      \active_interval_ticks_reg[31]_0\(25) => \arm_interval_reg_n_0_[25]\,
      \active_interval_ticks_reg[31]_0\(24) => \arm_interval_reg_n_0_[24]\,
      \active_interval_ticks_reg[31]_0\(23) => \arm_interval_reg_n_0_[23]\,
      \active_interval_ticks_reg[31]_0\(22) => \arm_interval_reg_n_0_[22]\,
      \active_interval_ticks_reg[31]_0\(21) => \arm_interval_reg_n_0_[21]\,
      \active_interval_ticks_reg[31]_0\(20) => \arm_interval_reg_n_0_[20]\,
      \active_interval_ticks_reg[31]_0\(19) => \arm_interval_reg_n_0_[19]\,
      \active_interval_ticks_reg[31]_0\(18) => \arm_interval_reg_n_0_[18]\,
      \active_interval_ticks_reg[31]_0\(17) => \arm_interval_reg_n_0_[17]\,
      \active_interval_ticks_reg[31]_0\(16) => \arm_interval_reg_n_0_[16]\,
      \active_interval_ticks_reg[31]_0\(15) => \arm_interval_reg_n_0_[15]\,
      \active_interval_ticks_reg[31]_0\(14) => \arm_interval_reg_n_0_[14]\,
      \active_interval_ticks_reg[31]_0\(13) => \arm_interval_reg_n_0_[13]\,
      \active_interval_ticks_reg[31]_0\(12) => \arm_interval_reg_n_0_[12]\,
      \active_interval_ticks_reg[31]_0\(11) => \arm_interval_reg_n_0_[11]\,
      \active_interval_ticks_reg[31]_0\(10) => \arm_interval_reg_n_0_[10]\,
      \active_interval_ticks_reg[31]_0\(9) => \arm_interval_reg_n_0_[9]\,
      \active_interval_ticks_reg[31]_0\(8) => \arm_interval_reg_n_0_[8]\,
      \active_interval_ticks_reg[31]_0\(7) => \arm_interval_reg_n_0_[7]\,
      \active_interval_ticks_reg[31]_0\(6) => \arm_interval_reg_n_0_[6]\,
      \active_interval_ticks_reg[31]_0\(5) => \arm_interval_reg_n_0_[5]\,
      \active_interval_ticks_reg[31]_0\(4) => \arm_interval_reg_n_0_[4]\,
      \active_interval_ticks_reg[31]_0\(3) => \arm_interval_reg_n_0_[3]\,
      \active_interval_ticks_reg[31]_0\(2) => \arm_interval_reg_n_0_[2]\,
      \active_interval_ticks_reg[31]_0\(1) => \arm_interval_reg_n_0_[1]\,
      \active_interval_ticks_reg[31]_0\(0) => \arm_interval_reg_n_0_[0]\,
      \active_sample_count_reg[31]_0\(31 downto 0) => arm_count(31 downto 0),
      address_pending0 => address_pending0,
      arm_valid_reg => capture_n_44,
      arm_valid_reg_0 => arm_valid_reg_n_0,
      arm_valid_reg_1 => \s_axi_bresp[1]_i_6_n_0\,
      arm_valid_reg_2 => \s_axi_bresp[1]_i_7_n_0\,
      arm_valid_reg_3 => arm_valid_i_2_n_0,
      arm_valid_reg_4 => arm_valid_i_3_n_0,
      arm_wait_reg => \arm_interval[31]_i_2_n_0\,
      arm_wait_reg_0 => \arm_interval[31]_i_3_n_0\,
      arm_wait_reg_1 => \arm_interval[31]_i_5_n_0\,
      arm_wait_reg_2 => \arm_interval[31]_i_6_n_0\,
      arm_wait_reg_3 => \arm_interval[31]_i_7_n_0\,
      arm_wait_reg_4 => \arm_interval[31]_i_17_n_0\,
      busy_reg_0 => arm_wait_reg_n_0,
      cancel_pulse_reg => cancel_pulse_i_2_n_0,
      cancel_pulse_reg_0(0) => \write_strobes_reg_n_0_[0]\,
      cancel_sticky => cancel_sticky,
      cancelled => cancelled,
      capture_active => capture_active,
      capture_active_0 => \^s_axi_rvalid_reg_0\,
      \captured_count_reg[0]_0\ => cancel_pulse_reg_n_0,
      cfg_error => cfg_error,
      error_sticky => error_sticky,
      invalidate_in => invalidate_in,
      memory_index_1 => memory_index_1,
      memory_pending_reg => capture_n_41,
      memory_pending_reg_0 => memory_pending_reg_n_0,
      memory_request => memory_request,
      p_0_out(0) => p_0_out(1),
      \rd_error1_carry__2_0\(31 downto 10) => memory_index(31 downto 10),
      \rd_error1_carry__2_0\(9) => \memory_index_reg_n_0_[9]\,
      \rd_error1_carry__2_0\(8) => \memory_index_reg_n_0_[8]\,
      \rd_error1_carry__2_0\(7) => \memory_index_reg_n_0_[7]\,
      \rd_error1_carry__2_0\(6) => \memory_index_reg_n_0_[6]\,
      \rd_error1_carry__2_0\(5) => \memory_index_reg_n_0_[5]\,
      \rd_error1_carry__2_0\(4) => \memory_index_reg_n_0_[4]\,
      \rd_error1_carry__2_0\(3) => \memory_index_reg_n_0_[3]\,
      \rd_error1_carry__2_0\(2) => \memory_index_reg_n_0_[2]\,
      \rd_error1_carry__2_0\(1) => \memory_index_reg_n_0_[1]\,
      \rd_error1_carry__2_0\(0) => \memory_index_reg_n_0_[0]\,
      rd_valid_reg_0 => capture_n_36,
      s_axi_aclk => s_axi_aclk,
      s_axi_araddr(3 downto 0) => s_axi_araddr(5 downto 2),
      \s_axi_araddr[3]\(0) => s_axi_rvalid0,
      s_axi_aresetn => s_axi_aresetn,
      s_axi_arvalid => s_axi_arvalid,
      s_axi_bresp(0) => \^s_axi_bresp\(0),
      \s_axi_bresp[1]_i_3_0\ => \arm_interval[31]_i_18_n_0\,
      \s_axi_bresp[1]_i_3_1\ => \s_axi_bresp[1]_i_13_n_0\,
      \s_axi_bresp_reg[1]\(1) => \write_address_reg_n_0_[3]\,
      \s_axi_bresp_reg[1]\(0) => \write_address_reg_n_0_[2]\,
      \s_axi_bresp_reg[1]_0\ => \s_axi_bresp[1]_i_4_n_0\,
      \s_axi_rdata_reg[0]\ => \s_axi_rdata[31]_i_8_n_0\,
      \s_axi_rdata_reg[0]_0\ => \s_axi_rdata[31]_i_6_n_0\,
      \s_axi_rdata_reg[0]_1\ => \s_axi_rdata[31]_i_4_n_0\,
      \s_axi_rdata_reg[0]_2\ => \s_axi_rdata[31]_i_7_n_0\,
      \s_axi_rdata_reg[10]\ => \s_axi_rdata[10]_i_3_n_0\,
      \s_axi_rdata_reg[1]\ => \s_axi_rdata[1]_i_2_n_0\,
      \s_axi_rdata_reg[31]\(29 downto 9) => shadow_count(31 downto 11),
      \s_axi_rdata_reg[31]\(8 downto 1) => shadow_count(9 downto 2),
      \s_axi_rdata_reg[31]\(0) => shadow_count(0),
      \s_axi_rdata_reg[31]_0\(29 downto 9) => read_index(31 downto 11),
      \s_axi_rdata_reg[31]_0\(8 downto 1) => read_index(9 downto 2),
      \s_axi_rdata_reg[31]_0\(0) => read_index(0),
      \s_axi_rdata_reg[4]\ => \s_axi_rdata[5]_i_3_n_0\,
      s_axi_rready => s_axi_rready,
      s_axi_rvalid_reg => capture_n_43,
      sample_in(1 downto 0) => sample_in(1 downto 0),
      sample_memory_reg_0 => soft_trigger_reg_n_0,
      \shadow_count_reg[24]\ => capture_n_38,
      shadow_wait => shadow_wait,
      soft_trigger_reg(1 downto 0) => write_data(2 downto 1),
      trigger_in => trigger_in,
      trigger_seen => trigger_seen,
      trigger_sticky => trigger_sticky,
      trigger_sticky_0 => trigger_sticky_0,
      \write_address_reg[3]\ => capture_n_47,
      \write_data_reg[1]\ => capture_n_45,
      \write_data_reg[2]\ => capture_n_46
    );
data_pending_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"C0CC0808"
    )
        port map (
      I0 => s_axi_wvalid,
      I1 => s_axi_aresetn,
      I2 => \^s_axi_bvalid_reg_0\,
      I3 => address_pending,
      I4 => data_pending_reg_n_0,
      O => data_pending_i_1_n_0
    );
data_pending_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => data_pending_i_1_n_0,
      Q => data_pending_reg_n_0,
      R => '0'
    );
error_sticky_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFF7FFFFF0055"
    )
        port map (
      I0 => capture_n_38,
      I1 => write_data(8),
      I2 => data00,
      I3 => \arm_interval[31]_i_6_n_0\,
      I4 => cfg_error,
      I5 => error_sticky,
      O => error_sticky_i_1_n_0
    );
error_sticky_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => error_sticky_i_1_n_0,
      Q => error_sticky,
      R => trigger_sticky_0
    );
\memory_index[31]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000008"
    )
        port map (
      I0 => s_axi_araddr(5),
      I1 => s_axi_araddr(4),
      I2 => \s_axi_rdata[31]_i_8_n_0\,
      I3 => s_axi_araddr(2),
      I4 => s_axi_araddr(3),
      O => memory_index_1
    );
\memory_index_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => memory_index_1,
      D => read_index(0),
      Q => \memory_index_reg_n_0_[0]\,
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\memory_index_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => memory_index_1,
      D => read_index(10),
      Q => memory_index(10),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\memory_index_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => memory_index_1,
      D => read_index(11),
      Q => memory_index(11),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\memory_index_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => memory_index_1,
      D => read_index(12),
      Q => memory_index(12),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\memory_index_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => memory_index_1,
      D => read_index(13),
      Q => memory_index(13),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\memory_index_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => memory_index_1,
      D => read_index(14),
      Q => memory_index(14),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\memory_index_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => memory_index_1,
      D => read_index(15),
      Q => memory_index(15),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\memory_index_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => memory_index_1,
      D => read_index(16),
      Q => memory_index(16),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\memory_index_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => memory_index_1,
      D => read_index(17),
      Q => memory_index(17),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\memory_index_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => memory_index_1,
      D => read_index(18),
      Q => memory_index(18),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\memory_index_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => memory_index_1,
      D => read_index(19),
      Q => memory_index(19),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\memory_index_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => memory_index_1,
      D => read_index(1),
      Q => \memory_index_reg_n_0_[1]\,
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\memory_index_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => memory_index_1,
      D => read_index(20),
      Q => memory_index(20),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\memory_index_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => memory_index_1,
      D => read_index(21),
      Q => memory_index(21),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\memory_index_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => memory_index_1,
      D => read_index(22),
      Q => memory_index(22),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\memory_index_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => memory_index_1,
      D => read_index(23),
      Q => memory_index(23),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\memory_index_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => memory_index_1,
      D => read_index(24),
      Q => memory_index(24),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\memory_index_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => memory_index_1,
      D => read_index(25),
      Q => memory_index(25),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\memory_index_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => memory_index_1,
      D => read_index(26),
      Q => memory_index(26),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\memory_index_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => memory_index_1,
      D => read_index(27),
      Q => memory_index(27),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\memory_index_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => memory_index_1,
      D => read_index(28),
      Q => memory_index(28),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\memory_index_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => memory_index_1,
      D => read_index(29),
      Q => memory_index(29),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\memory_index_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => memory_index_1,
      D => read_index(2),
      Q => \memory_index_reg_n_0_[2]\,
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\memory_index_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => memory_index_1,
      D => read_index(30),
      Q => memory_index(30),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\memory_index_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => memory_index_1,
      D => read_index(31),
      Q => memory_index(31),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\memory_index_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => memory_index_1,
      D => read_index(3),
      Q => \memory_index_reg_n_0_[3]\,
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\memory_index_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => memory_index_1,
      D => read_index(4),
      Q => \memory_index_reg_n_0_[4]\,
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\memory_index_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => memory_index_1,
      D => read_index(5),
      Q => \memory_index_reg_n_0_[5]\,
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\memory_index_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => memory_index_1,
      D => read_index(6),
      Q => \memory_index_reg_n_0_[6]\,
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\memory_index_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => memory_index_1,
      D => read_index(7),
      Q => \memory_index_reg_n_0_[7]\,
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\memory_index_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => memory_index_1,
      D => read_index(8),
      Q => \memory_index_reg_n_0_[8]\,
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\memory_index_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => memory_index_1,
      D => read_index(9),
      Q => \memory_index_reg_n_0_[9]\,
      R => \s_axi_bresp[1]_i_1_n_0\
    );
memory_pending_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => capture_n_36,
      Q => memory_pending_reg_n_0,
      R => '0'
    );
memory_request_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => memory_index_1,
      Q => memory_request,
      R => trigger_sticky_0
    );
\read_index[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000008000000000"
    )
        port map (
      I0 => \read_index[31]_i_2_n_0\,
      I1 => data00,
      I2 => \write_address_reg_n_0_[3]\,
      I3 => \write_address_reg_n_0_[4]\,
      I4 => \write_address_reg_n_0_[1]\,
      I5 => \write_address_reg_n_0_[5]\,
      O => \read_index[15]_i_1_n_0\
    );
\read_index[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000008000000000"
    )
        port map (
      I0 => \read_index[31]_i_2_n_0\,
      I1 => \write_strobes_reg_n_0_[2]\,
      I2 => \write_address_reg_n_0_[3]\,
      I3 => \write_address_reg_n_0_[4]\,
      I4 => \write_address_reg_n_0_[1]\,
      I5 => \write_address_reg_n_0_[5]\,
      O => \read_index[23]_i_1_n_0\
    );
\read_index[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000008000000000"
    )
        port map (
      I0 => \read_index[31]_i_2_n_0\,
      I1 => \write_strobes_reg_n_0_[3]\,
      I2 => \write_address_reg_n_0_[3]\,
      I3 => \write_address_reg_n_0_[4]\,
      I4 => \write_address_reg_n_0_[1]\,
      I5 => \write_address_reg_n_0_[5]\,
      O => \read_index[31]_i_1_n_0\
    );
\read_index[31]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"D500"
    )
        port map (
      I0 => \write_address_reg_n_0_[5]\,
      I1 => \write_address_reg_n_0_[3]\,
      I2 => \write_address_reg_n_0_[2]\,
      I3 => arm_valid_i_2_n_0,
      O => \read_index[31]_i_2_n_0\
    );
\read_index[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000008000000000"
    )
        port map (
      I0 => \read_index[31]_i_2_n_0\,
      I1 => \write_strobes_reg_n_0_[0]\,
      I2 => \write_address_reg_n_0_[3]\,
      I3 => \write_address_reg_n_0_[4]\,
      I4 => \write_address_reg_n_0_[1]\,
      I5 => \write_address_reg_n_0_[5]\,
      O => \read_index[7]_i_1_n_0\
    );
\read_index_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \read_index[7]_i_1_n_0\,
      D => write_data(0),
      Q => read_index(0),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\read_index_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \read_index[15]_i_1_n_0\,
      D => write_data(10),
      Q => read_index(10),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\read_index_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \read_index[15]_i_1_n_0\,
      D => write_data(11),
      Q => read_index(11),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\read_index_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \read_index[15]_i_1_n_0\,
      D => write_data(12),
      Q => read_index(12),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\read_index_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \read_index[15]_i_1_n_0\,
      D => write_data(13),
      Q => read_index(13),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\read_index_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \read_index[15]_i_1_n_0\,
      D => write_data(14),
      Q => read_index(14),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\read_index_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \read_index[15]_i_1_n_0\,
      D => write_data(15),
      Q => read_index(15),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\read_index_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \read_index[23]_i_1_n_0\,
      D => write_data(16),
      Q => read_index(16),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\read_index_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \read_index[23]_i_1_n_0\,
      D => write_data(17),
      Q => read_index(17),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\read_index_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \read_index[23]_i_1_n_0\,
      D => write_data(18),
      Q => read_index(18),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\read_index_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \read_index[23]_i_1_n_0\,
      D => write_data(19),
      Q => read_index(19),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\read_index_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \read_index[7]_i_1_n_0\,
      D => write_data(1),
      Q => read_index(1),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\read_index_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \read_index[23]_i_1_n_0\,
      D => write_data(20),
      Q => read_index(20),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\read_index_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \read_index[23]_i_1_n_0\,
      D => write_data(21),
      Q => read_index(21),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\read_index_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \read_index[23]_i_1_n_0\,
      D => write_data(22),
      Q => read_index(22),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\read_index_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \read_index[23]_i_1_n_0\,
      D => write_data(23),
      Q => read_index(23),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\read_index_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \read_index[31]_i_1_n_0\,
      D => write_data(24),
      Q => read_index(24),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\read_index_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \read_index[31]_i_1_n_0\,
      D => write_data(25),
      Q => read_index(25),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\read_index_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \read_index[31]_i_1_n_0\,
      D => write_data(26),
      Q => read_index(26),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\read_index_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \read_index[31]_i_1_n_0\,
      D => write_data(27),
      Q => read_index(27),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\read_index_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \read_index[31]_i_1_n_0\,
      D => write_data(28),
      Q => read_index(28),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\read_index_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \read_index[31]_i_1_n_0\,
      D => write_data(29),
      Q => read_index(29),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\read_index_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \read_index[7]_i_1_n_0\,
      D => write_data(2),
      Q => read_index(2),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\read_index_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \read_index[31]_i_1_n_0\,
      D => write_data(30),
      Q => read_index(30),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\read_index_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \read_index[31]_i_1_n_0\,
      D => write_data(31),
      Q => read_index(31),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\read_index_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \read_index[7]_i_1_n_0\,
      D => write_data(3),
      Q => read_index(3),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\read_index_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \read_index[7]_i_1_n_0\,
      D => write_data(4),
      Q => read_index(4),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\read_index_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \read_index[7]_i_1_n_0\,
      D => write_data(5),
      Q => read_index(5),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\read_index_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \read_index[7]_i_1_n_0\,
      D => write_data(6),
      Q => read_index(6),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\read_index_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \read_index[7]_i_1_n_0\,
      D => write_data(7),
      Q => read_index(7),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\read_index_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \read_index[15]_i_1_n_0\,
      D => write_data(8),
      Q => read_index(8),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\read_index_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \read_index[15]_i_1_n_0\,
      D => write_data(9),
      Q => read_index(9),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
s_axi_arready_INST_0: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => s_axi_aresetn,
      I1 => memory_pending_reg_n_0,
      I2 => \^s_axi_rvalid_reg_0\,
      O => s_axi_arready
    );
s_axi_awready_INST_0: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => address_pending,
      I1 => s_axi_aresetn,
      I2 => \^s_axi_bvalid_reg_0\,
      O => s_axi_awready
    );
\s_axi_bresp[1]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s_axi_aresetn,
      O => \s_axi_bresp[1]_i_1_n_0\
    );
\s_axi_bresp[1]_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => shadow_count(25),
      I1 => shadow_count(21),
      I2 => shadow_count(26),
      I3 => shadow_count(22),
      O => \s_axi_bresp[1]_i_10_n_0\
    );
\s_axi_bresp[1]_i_11\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => shadow_count(31),
      I1 => shadow_count(14),
      I2 => shadow_count(28),
      I3 => shadow_count(13),
      O => \s_axi_bresp[1]_i_11_n_0\
    );
\s_axi_bresp[1]_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFEEE"
    )
        port map (
      I0 => shadow_count(23),
      I1 => shadow_count(11),
      I2 => \write_strobes_reg_n_0_[0]\,
      I3 => write_data(1),
      I4 => shadow_count(17),
      I5 => shadow_count(18),
      O => \s_axi_bresp[1]_i_13_n_0\
    );
\s_axi_bresp[1]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFCEFCFCFC"
    )
        port map (
      I0 => shadow_wait_i_2_n_0,
      I1 => \s_axi_bresp[1]_i_9_n_0\,
      I2 => \write_address_reg_n_0_[5]\,
      I3 => \write_address_reg_n_0_[3]\,
      I4 => \write_address_reg_n_0_[2]\,
      I5 => shadow_wait_i_4_n_0,
      O => \s_axi_bresp[1]_i_4_n_0\
    );
\s_axi_bresp[1]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => \^s_axi_bvalid_reg_0\,
      I1 => address_pending,
      I2 => data_pending_reg_n_0,
      O => address_pending0
    );
\s_axi_bresp[1]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFD"
    )
        port map (
      I0 => \arm_interval[31]_i_16_n_0\,
      I1 => \arm_interval[31]_i_19_n_0\,
      I2 => shadow_count(24),
      I3 => shadow_count(12),
      I4 => shadow_count(19),
      I5 => shadow_count(15),
      O => \s_axi_bresp[1]_i_6_n_0\
    );
\s_axi_bresp[1]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => shadow_count(29),
      I1 => shadow_count(30),
      I2 => shadow_count(16),
      I3 => shadow_count(27),
      I4 => \s_axi_bresp[1]_i_10_n_0\,
      I5 => \s_axi_bresp[1]_i_11_n_0\,
      O => \s_axi_bresp[1]_i_7_n_0\
    );
\s_axi_bresp[1]_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \write_address_reg_n_0_[0]\,
      I1 => \write_address_reg_n_0_[1]\,
      I2 => \write_address_reg_n_0_[4]\,
      O => \s_axi_bresp[1]_i_9_n_0\
    );
\s_axi_bresp_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => capture_n_47,
      Q => \^s_axi_bresp\(0),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
s_axi_bvalid_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"55C0"
    )
        port map (
      I0 => s_axi_bready,
      I1 => data_pending_reg_n_0,
      I2 => address_pending,
      I3 => \^s_axi_bvalid_reg_0\,
      O => s_axi_bvalid_i_1_n_0
    );
s_axi_bvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => s_axi_bvalid_i_1_n_0,
      Q => \^s_axi_bvalid_reg_0\,
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\s_axi_rdata[10]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C00FC000E0A0E0A0"
    )
        port map (
      I0 => shadow_interval(10),
      I1 => read_index(10),
      I2 => s_axi_araddr(2),
      I3 => s_axi_araddr(5),
      I4 => shadow_count(10),
      I5 => s_axi_araddr(3),
      O => \s_axi_rdata[10]_i_3_n_0\
    );
\s_axi_rdata[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000045CDFFFF"
    )
        port map (
      I0 => s_axi_araddr(5),
      I1 => s_axi_araddr(2),
      I2 => shadow_count(1),
      I3 => read_index(1),
      I4 => s_axi_araddr(3),
      I5 => \s_axi_rdata[1]_i_5_n_0\,
      O => \s_axi_rdata[1]_i_2_n_0\
    );
\s_axi_rdata[1]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAEA"
    )
        port map (
      I0 => s_axi_araddr(4),
      I1 => s_axi_araddr(2),
      I2 => shadow_interval(1),
      I3 => s_axi_araddr(3),
      I4 => s_axi_araddr(5),
      O => \s_axi_rdata[1]_i_5_n_0\
    );
\s_axi_rdata[31]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E0FF"
    )
        port map (
      I0 => memory_pending_reg_n_0,
      I1 => memory_index_1,
      I2 => invalidate_in,
      I3 => s_axi_aresetn,
      O => \s_axi_rdata[31]_i_1_n_0\
    );
\s_axi_rdata[31]_i_11\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => s_axi_araddr(10),
      I1 => s_axi_araddr(11),
      I2 => s_axi_araddr(9),
      I3 => s_axi_araddr(0),
      O => \s_axi_rdata[31]_i_11_n_0\
    );
\s_axi_rdata[31]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0008"
    )
        port map (
      I0 => s_axi_arvalid,
      I1 => s_axi_aresetn,
      I2 => memory_pending_reg_n_0,
      I3 => \^s_axi_rvalid_reg_0\,
      O => \s_axi_rdata[31]_i_4_n_0\
    );
\s_axi_rdata[31]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => s_axi_araddr(4),
      I1 => s_axi_araddr(5),
      O => \s_axi_rdata[31]_i_6_n_0\
    );
\s_axi_rdata[31]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => s_axi_araddr(6),
      I1 => s_axi_araddr(8),
      I2 => s_axi_araddr(1),
      I3 => s_axi_araddr(7),
      I4 => \s_axi_rdata[31]_i_11_n_0\,
      O => \s_axi_rdata[31]_i_7_n_0\
    );
\s_axi_rdata[31]_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFFFFFF"
    )
        port map (
      I0 => \s_axi_rdata[31]_i_7_n_0\,
      I1 => \^s_axi_rvalid_reg_0\,
      I2 => memory_pending_reg_n_0,
      I3 => s_axi_aresetn,
      I4 => s_axi_arvalid,
      O => \s_axi_rdata[31]_i_8_n_0\
    );
\s_axi_rdata[5]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => s_axi_araddr(4),
      I1 => s_axi_araddr(5),
      O => \s_axi_rdata[5]_i_3_n_0\
    );
\s_axi_rdata_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rvalid0,
      D => p_2_in(0),
      Q => s_axi_rdata(0),
      R => \s_axi_rdata[31]_i_1_n_0\
    );
\s_axi_rdata_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rvalid0,
      D => capture_n_25,
      Q => s_axi_rdata(10),
      R => \s_axi_rdata[31]_i_1_n_0\
    );
\s_axi_rdata_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rvalid0,
      D => capture_n_24,
      Q => s_axi_rdata(11),
      R => \s_axi_rdata[31]_i_1_n_0\
    );
\s_axi_rdata_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rvalid0,
      D => capture_n_23,
      Q => s_axi_rdata(12),
      R => \s_axi_rdata[31]_i_1_n_0\
    );
\s_axi_rdata_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rvalid0,
      D => capture_n_22,
      Q => s_axi_rdata(13),
      R => \s_axi_rdata[31]_i_1_n_0\
    );
\s_axi_rdata_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rvalid0,
      D => p_2_in(14),
      Q => s_axi_rdata(14),
      R => \s_axi_rdata[31]_i_1_n_0\
    );
\s_axi_rdata_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rvalid0,
      D => capture_n_20,
      Q => s_axi_rdata(15),
      R => \s_axi_rdata[31]_i_1_n_0\
    );
\s_axi_rdata_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rvalid0,
      D => p_2_in(16),
      Q => s_axi_rdata(16),
      R => \s_axi_rdata[31]_i_1_n_0\
    );
\s_axi_rdata_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rvalid0,
      D => capture_n_18,
      Q => s_axi_rdata(17),
      R => \s_axi_rdata[31]_i_1_n_0\
    );
\s_axi_rdata_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rvalid0,
      D => capture_n_17,
      Q => s_axi_rdata(18),
      R => \s_axi_rdata[31]_i_1_n_0\
    );
\s_axi_rdata_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rvalid0,
      D => p_2_in(19),
      Q => s_axi_rdata(19),
      R => \s_axi_rdata[31]_i_1_n_0\
    );
\s_axi_rdata_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rvalid0,
      D => p_2_in(1),
      Q => s_axi_rdata(1),
      R => \s_axi_rdata[31]_i_1_n_0\
    );
\s_axi_rdata_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rvalid0,
      D => capture_n_15,
      Q => s_axi_rdata(20),
      R => \s_axi_rdata[31]_i_1_n_0\
    );
\s_axi_rdata_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rvalid0,
      D => capture_n_14,
      Q => s_axi_rdata(21),
      R => \s_axi_rdata[31]_i_1_n_0\
    );
\s_axi_rdata_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rvalid0,
      D => p_2_in(22),
      Q => s_axi_rdata(22),
      R => \s_axi_rdata[31]_i_1_n_0\
    );
\s_axi_rdata_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rvalid0,
      D => capture_n_12,
      Q => s_axi_rdata(23),
      R => \s_axi_rdata[31]_i_1_n_0\
    );
\s_axi_rdata_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rvalid0,
      D => capture_n_11,
      Q => s_axi_rdata(24),
      R => \s_axi_rdata[31]_i_1_n_0\
    );
\s_axi_rdata_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rvalid0,
      D => capture_n_10,
      Q => s_axi_rdata(25),
      R => \s_axi_rdata[31]_i_1_n_0\
    );
\s_axi_rdata_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rvalid0,
      D => p_2_in(26),
      Q => s_axi_rdata(26),
      R => \s_axi_rdata[31]_i_1_n_0\
    );
\s_axi_rdata_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rvalid0,
      D => capture_n_8,
      Q => s_axi_rdata(27),
      R => \s_axi_rdata[31]_i_1_n_0\
    );
\s_axi_rdata_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rvalid0,
      D => capture_n_7,
      Q => s_axi_rdata(28),
      R => \s_axi_rdata[31]_i_1_n_0\
    );
\s_axi_rdata_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rvalid0,
      D => capture_n_6,
      Q => s_axi_rdata(29),
      R => \s_axi_rdata[31]_i_1_n_0\
    );
\s_axi_rdata_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rvalid0,
      D => capture_n_33,
      Q => s_axi_rdata(2),
      R => \s_axi_rdata[31]_i_1_n_0\
    );
\s_axi_rdata_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rvalid0,
      D => p_2_in(30),
      Q => s_axi_rdata(30),
      R => \s_axi_rdata[31]_i_1_n_0\
    );
\s_axi_rdata_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rvalid0,
      D => capture_n_4,
      Q => s_axi_rdata(31),
      R => \s_axi_rdata[31]_i_1_n_0\
    );
\s_axi_rdata_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rvalid0,
      D => capture_n_32,
      Q => s_axi_rdata(3),
      R => \s_axi_rdata[31]_i_1_n_0\
    );
\s_axi_rdata_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rvalid0,
      D => p_2_in(4),
      Q => s_axi_rdata(4),
      R => \s_axi_rdata[31]_i_1_n_0\
    );
\s_axi_rdata_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rvalid0,
      D => p_2_in(5),
      Q => s_axi_rdata(5),
      R => \s_axi_rdata[31]_i_1_n_0\
    );
\s_axi_rdata_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rvalid0,
      D => capture_n_29,
      Q => s_axi_rdata(6),
      R => \s_axi_rdata[31]_i_1_n_0\
    );
\s_axi_rdata_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rvalid0,
      D => capture_n_28,
      Q => s_axi_rdata(7),
      R => \s_axi_rdata[31]_i_1_n_0\
    );
\s_axi_rdata_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rvalid0,
      D => p_2_in(8),
      Q => s_axi_rdata(8),
      R => \s_axi_rdata[31]_i_1_n_0\
    );
\s_axi_rdata_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rvalid0,
      D => p_2_in(9),
      Q => s_axi_rdata(9),
      R => \s_axi_rdata[31]_i_1_n_0\
    );
\s_axi_rresp[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFBBBBBFFF88888"
    )
        port map (
      I0 => p_0_out(1),
      I1 => capture_n_43,
      I2 => memory_pending_reg_n_0,
      I3 => memory_index_1,
      I4 => invalidate_in,
      I5 => \^s_axi_rresp\(0),
      O => \s_axi_rresp[1]_i_1_n_0\
    );
\s_axi_rresp_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \s_axi_rresp[1]_i_1_n_0\,
      Q => \^s_axi_rresp\(0),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
s_axi_rvalid_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFBBBBBFFF88888"
    )
        port map (
      I0 => s_axi_rvalid0,
      I1 => capture_n_41,
      I2 => memory_pending_reg_n_0,
      I3 => memory_index_1,
      I4 => invalidate_in,
      I5 => \^s_axi_rvalid_reg_0\,
      O => s_axi_rvalid_i_1_n_0
    );
s_axi_rvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => s_axi_rvalid_i_1_n_0,
      Q => \^s_axi_rvalid_reg_0\,
      R => \s_axi_bresp[1]_i_1_n_0\
    );
s_axi_wready_INST_0: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => data_pending_reg_n_0,
      I1 => s_axi_aresetn,
      I2 => \^s_axi_bvalid_reg_0\,
      O => s_axi_wready
    );
\shadow_count[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000800"
    )
        port map (
      I0 => \shadow_count[31]_i_2_n_0\,
      I1 => data00,
      I2 => \write_address_reg_n_0_[5]\,
      I3 => \write_address_reg_n_0_[3]\,
      I4 => \write_address_reg_n_0_[4]\,
      I5 => \write_address_reg_n_0_[1]\,
      O => \shadow_count[15]_i_1_n_0\
    );
\shadow_count[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000800"
    )
        port map (
      I0 => \shadow_count[31]_i_2_n_0\,
      I1 => \write_strobes_reg_n_0_[2]\,
      I2 => \write_address_reg_n_0_[5]\,
      I3 => \write_address_reg_n_0_[3]\,
      I4 => \write_address_reg_n_0_[4]\,
      I5 => \write_address_reg_n_0_[1]\,
      O => \shadow_count[23]_i_1_n_0\
    );
\shadow_count[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000800"
    )
        port map (
      I0 => \shadow_count[31]_i_2_n_0\,
      I1 => \write_strobes_reg_n_0_[3]\,
      I2 => \write_address_reg_n_0_[5]\,
      I3 => \write_address_reg_n_0_[3]\,
      I4 => \write_address_reg_n_0_[4]\,
      I5 => \write_address_reg_n_0_[1]\,
      O => \shadow_count[31]_i_1_n_0\
    );
\shadow_count[31]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"002A"
    )
        port map (
      I0 => arm_valid_i_2_n_0,
      I1 => \write_address_reg_n_0_[3]\,
      I2 => \write_address_reg_n_0_[2]\,
      I3 => \write_address_reg_n_0_[5]\,
      O => \shadow_count[31]_i_2_n_0\
    );
\shadow_count[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000800"
    )
        port map (
      I0 => \shadow_count[31]_i_2_n_0\,
      I1 => \write_strobes_reg_n_0_[0]\,
      I2 => \write_address_reg_n_0_[5]\,
      I3 => \write_address_reg_n_0_[3]\,
      I4 => \write_address_reg_n_0_[4]\,
      I5 => \write_address_reg_n_0_[1]\,
      O => \shadow_count[7]_i_1_n_0\
    );
\shadow_count_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_count[7]_i_1_n_0\,
      D => write_data(0),
      Q => shadow_count(0),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\shadow_count_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_count[15]_i_1_n_0\,
      D => write_data(10),
      Q => shadow_count(10),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\shadow_count_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_count[15]_i_1_n_0\,
      D => write_data(11),
      Q => shadow_count(11),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\shadow_count_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_count[15]_i_1_n_0\,
      D => write_data(12),
      Q => shadow_count(12),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\shadow_count_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_count[15]_i_1_n_0\,
      D => write_data(13),
      Q => shadow_count(13),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\shadow_count_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_count[15]_i_1_n_0\,
      D => write_data(14),
      Q => shadow_count(14),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\shadow_count_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_count[15]_i_1_n_0\,
      D => write_data(15),
      Q => shadow_count(15),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\shadow_count_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_count[23]_i_1_n_0\,
      D => write_data(16),
      Q => shadow_count(16),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\shadow_count_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_count[23]_i_1_n_0\,
      D => write_data(17),
      Q => shadow_count(17),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\shadow_count_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_count[23]_i_1_n_0\,
      D => write_data(18),
      Q => shadow_count(18),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\shadow_count_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_count[23]_i_1_n_0\,
      D => write_data(19),
      Q => shadow_count(19),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\shadow_count_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_count[7]_i_1_n_0\,
      D => write_data(1),
      Q => shadow_count(1),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\shadow_count_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_count[23]_i_1_n_0\,
      D => write_data(20),
      Q => shadow_count(20),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\shadow_count_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_count[23]_i_1_n_0\,
      D => write_data(21),
      Q => shadow_count(21),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\shadow_count_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_count[23]_i_1_n_0\,
      D => write_data(22),
      Q => shadow_count(22),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\shadow_count_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_count[23]_i_1_n_0\,
      D => write_data(23),
      Q => shadow_count(23),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\shadow_count_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_count[31]_i_1_n_0\,
      D => write_data(24),
      Q => shadow_count(24),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\shadow_count_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_count[31]_i_1_n_0\,
      D => write_data(25),
      Q => shadow_count(25),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\shadow_count_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_count[31]_i_1_n_0\,
      D => write_data(26),
      Q => shadow_count(26),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\shadow_count_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_count[31]_i_1_n_0\,
      D => write_data(27),
      Q => shadow_count(27),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\shadow_count_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_count[31]_i_1_n_0\,
      D => write_data(28),
      Q => shadow_count(28),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\shadow_count_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_count[31]_i_1_n_0\,
      D => write_data(29),
      Q => shadow_count(29),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\shadow_count_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_count[7]_i_1_n_0\,
      D => write_data(2),
      Q => shadow_count(2),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\shadow_count_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_count[31]_i_1_n_0\,
      D => write_data(30),
      Q => shadow_count(30),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\shadow_count_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_count[31]_i_1_n_0\,
      D => write_data(31),
      Q => shadow_count(31),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\shadow_count_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_count[7]_i_1_n_0\,
      D => write_data(3),
      Q => shadow_count(3),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\shadow_count_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_count[7]_i_1_n_0\,
      D => write_data(4),
      Q => shadow_count(4),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\shadow_count_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_count[7]_i_1_n_0\,
      D => write_data(5),
      Q => shadow_count(5),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\shadow_count_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_count[7]_i_1_n_0\,
      D => write_data(6),
      Q => shadow_count(6),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\shadow_count_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_count[7]_i_1_n_0\,
      D => write_data(7),
      Q => shadow_count(7),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\shadow_count_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_count[15]_i_1_n_0\,
      D => write_data(8),
      Q => shadow_count(8),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\shadow_count_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_count[15]_i_1_n_0\,
      D => write_data(9),
      Q => shadow_count(9),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\shadow_interval[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5504000000000000"
    )
        port map (
      I0 => \shadow_interval[31]_i_2_n_0\,
      I1 => \write_address_reg_n_0_[2]\,
      I2 => \write_address_reg_n_0_[3]\,
      I3 => \write_address_reg_n_0_[5]\,
      I4 => \shadow_interval[31]_i_3_n_0\,
      I5 => data00,
      O => \shadow_interval[15]_i_1_n_0\
    );
\shadow_interval[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5504000000000000"
    )
        port map (
      I0 => \shadow_interval[31]_i_2_n_0\,
      I1 => \write_address_reg_n_0_[2]\,
      I2 => \write_address_reg_n_0_[3]\,
      I3 => \write_address_reg_n_0_[5]\,
      I4 => \shadow_interval[31]_i_3_n_0\,
      I5 => \write_strobes_reg_n_0_[2]\,
      O => \shadow_interval[23]_i_1_n_0\
    );
\shadow_interval[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5504000000000000"
    )
        port map (
      I0 => \shadow_interval[31]_i_2_n_0\,
      I1 => \write_address_reg_n_0_[2]\,
      I2 => \write_address_reg_n_0_[3]\,
      I3 => \write_address_reg_n_0_[5]\,
      I4 => \shadow_interval[31]_i_3_n_0\,
      I5 => \write_strobes_reg_n_0_[3]\,
      O => \shadow_interval[31]_i_1_n_0\
    );
\shadow_interval[31]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFF7F7FFF7"
    )
        port map (
      I0 => data_pending_reg_n_0,
      I1 => address_pending,
      I2 => \^s_axi_bvalid_reg_0\,
      I3 => \write_address_reg_n_0_[0]\,
      I4 => \write_address_reg_n_0_[1]\,
      I5 => \write_address_reg_n_0_[4]\,
      O => \shadow_interval[31]_i_2_n_0\
    );
\shadow_interval[31]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => shadow_wait_i_4_n_0,
      I1 => \write_address_reg_n_0_[5]\,
      I2 => \write_address_reg_n_0_[1]\,
      I3 => \write_address_reg_n_0_[4]\,
      I4 => \write_address_reg_n_0_[3]\,
      O => \shadow_interval[31]_i_3_n_0\
    );
\shadow_interval[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5504000000000000"
    )
        port map (
      I0 => \shadow_interval[31]_i_2_n_0\,
      I1 => \write_address_reg_n_0_[2]\,
      I2 => \write_address_reg_n_0_[3]\,
      I3 => \write_address_reg_n_0_[5]\,
      I4 => \shadow_interval[31]_i_3_n_0\,
      I5 => \write_strobes_reg_n_0_[0]\,
      O => \shadow_interval[7]_i_1_n_0\
    );
\shadow_interval_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_interval[7]_i_1_n_0\,
      D => write_data(0),
      Q => shadow_interval(0),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\shadow_interval_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_interval[15]_i_1_n_0\,
      D => write_data(10),
      Q => shadow_interval(10),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\shadow_interval_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_interval[15]_i_1_n_0\,
      D => write_data(11),
      Q => shadow_interval(11),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\shadow_interval_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_interval[15]_i_1_n_0\,
      D => write_data(12),
      Q => shadow_interval(12),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\shadow_interval_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_interval[15]_i_1_n_0\,
      D => write_data(13),
      Q => shadow_interval(13),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\shadow_interval_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_interval[15]_i_1_n_0\,
      D => write_data(14),
      Q => shadow_interval(14),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\shadow_interval_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_interval[15]_i_1_n_0\,
      D => write_data(15),
      Q => shadow_interval(15),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\shadow_interval_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_interval[23]_i_1_n_0\,
      D => write_data(16),
      Q => shadow_interval(16),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\shadow_interval_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_interval[23]_i_1_n_0\,
      D => write_data(17),
      Q => shadow_interval(17),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\shadow_interval_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_interval[23]_i_1_n_0\,
      D => write_data(18),
      Q => shadow_interval(18),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\shadow_interval_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_interval[23]_i_1_n_0\,
      D => write_data(19),
      Q => shadow_interval(19),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\shadow_interval_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_interval[7]_i_1_n_0\,
      D => write_data(1),
      Q => shadow_interval(1),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\shadow_interval_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_interval[23]_i_1_n_0\,
      D => write_data(20),
      Q => shadow_interval(20),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\shadow_interval_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_interval[23]_i_1_n_0\,
      D => write_data(21),
      Q => shadow_interval(21),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\shadow_interval_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_interval[23]_i_1_n_0\,
      D => write_data(22),
      Q => shadow_interval(22),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\shadow_interval_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_interval[23]_i_1_n_0\,
      D => write_data(23),
      Q => shadow_interval(23),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\shadow_interval_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_interval[31]_i_1_n_0\,
      D => write_data(24),
      Q => shadow_interval(24),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\shadow_interval_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_interval[31]_i_1_n_0\,
      D => write_data(25),
      Q => shadow_interval(25),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\shadow_interval_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_interval[31]_i_1_n_0\,
      D => write_data(26),
      Q => shadow_interval(26),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\shadow_interval_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_interval[31]_i_1_n_0\,
      D => write_data(27),
      Q => shadow_interval(27),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\shadow_interval_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_interval[31]_i_1_n_0\,
      D => write_data(28),
      Q => shadow_interval(28),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\shadow_interval_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_interval[31]_i_1_n_0\,
      D => write_data(29),
      Q => shadow_interval(29),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\shadow_interval_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_interval[7]_i_1_n_0\,
      D => write_data(2),
      Q => shadow_interval(2),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\shadow_interval_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_interval[31]_i_1_n_0\,
      D => write_data(30),
      Q => shadow_interval(30),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\shadow_interval_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_interval[31]_i_1_n_0\,
      D => write_data(31),
      Q => shadow_interval(31),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\shadow_interval_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_interval[7]_i_1_n_0\,
      D => write_data(3),
      Q => shadow_interval(3),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\shadow_interval_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_interval[7]_i_1_n_0\,
      D => write_data(4),
      Q => shadow_interval(4),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\shadow_interval_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_interval[7]_i_1_n_0\,
      D => write_data(5),
      Q => shadow_interval(5),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\shadow_interval_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_interval[7]_i_1_n_0\,
      D => write_data(6),
      Q => shadow_interval(6),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\shadow_interval_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_interval[7]_i_1_n_0\,
      D => write_data(7),
      Q => shadow_interval(7),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\shadow_interval_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_interval[15]_i_1_n_0\,
      D => write_data(8),
      Q => shadow_interval(8),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\shadow_interval_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_interval[15]_i_1_n_0\,
      D => write_data(9),
      Q => shadow_interval(9),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
shadow_wait_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFE00000002"
    )
        port map (
      I0 => write_data(0),
      I1 => shadow_wait_i_2_n_0,
      I2 => shadow_wait_i_3_n_0,
      I3 => \write_address_reg_n_0_[5]\,
      I4 => shadow_wait_i_4_n_0,
      I5 => shadow_wait,
      O => shadow_wait_i_1_n_0
    );
shadow_wait_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \arm_interval[31]_i_8_n_0\,
      I1 => shadow_wait_i_5_n_0,
      I2 => shadow_wait_i_6_n_0,
      I3 => \arm_interval[31]_i_11_n_0\,
      O => shadow_wait_i_2_n_0
    );
shadow_wait_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEFFFFFFFFFFFFFF"
    )
        port map (
      I0 => \write_address_reg_n_0_[4]\,
      I1 => \write_address_reg_n_0_[1]\,
      I2 => \write_address_reg_n_0_[0]\,
      I3 => shadow_wait_i_7_n_0,
      I4 => \write_strobes_reg_n_0_[0]\,
      I5 => address_pending0,
      O => shadow_wait_i_3_n_0
    );
shadow_wait_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \write_address_reg_n_0_[10]\,
      I1 => \write_address_reg_n_0_[9]\,
      I2 => p_0_in0,
      I3 => \write_address_reg_n_0_[11]\,
      I4 => \write_address_reg_n_0_[7]\,
      I5 => \write_address_reg_n_0_[8]\,
      O => shadow_wait_i_4_n_0
    );
shadow_wait_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => write_data(11),
      I1 => data00,
      I2 => write_data(19),
      I3 => \write_strobes_reg_n_0_[2]\,
      O => shadow_wait_i_5_n_0
    );
shadow_wait_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF0A0FCECF0A0"
    )
        port map (
      I0 => write_data(8),
      I1 => write_data(2),
      I2 => data00,
      I3 => write_data(9),
      I4 => \write_strobes_reg_n_0_[0]\,
      I5 => write_data(1),
      O => shadow_wait_i_6_n_0
    );
shadow_wait_i_7: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \write_address_reg_n_0_[3]\,
      I1 => \write_address_reg_n_0_[2]\,
      O => shadow_wait_i_7_n_0
    );
shadow_wait_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => shadow_wait_i_1_n_0,
      Q => shadow_wait,
      R => \s_axi_bresp[1]_i_1_n_0\
    );
soft_trigger_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => capture_n_46,
      Q => soft_trigger_reg_n_0,
      R => '0'
    );
trigger_sticky_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFBFFFFFFF0000"
    )
        port map (
      I0 => \arm_interval[31]_i_6_n_0\,
      I1 => write_data(8),
      I2 => data00,
      I3 => capture_n_38,
      I4 => trigger_seen,
      I5 => trigger_sticky,
      O => trigger_sticky_i_1_n_0
    );
trigger_sticky_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => trigger_sticky_i_1_n_0,
      Q => trigger_sticky,
      R => trigger_sticky_0
    );
\write_address[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => s_axi_awvalid,
      I1 => \^s_axi_bvalid_reg_0\,
      I2 => address_pending,
      O => write_address0
    );
\write_address_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_address0,
      D => s_axi_awaddr(0),
      Q => \write_address_reg_n_0_[0]\,
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\write_address_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_address0,
      D => s_axi_awaddr(10),
      Q => \write_address_reg_n_0_[10]\,
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\write_address_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_address0,
      D => s_axi_awaddr(11),
      Q => \write_address_reg_n_0_[11]\,
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\write_address_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_address0,
      D => s_axi_awaddr(1),
      Q => \write_address_reg_n_0_[1]\,
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\write_address_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_address0,
      D => s_axi_awaddr(2),
      Q => \write_address_reg_n_0_[2]\,
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\write_address_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_address0,
      D => s_axi_awaddr(3),
      Q => \write_address_reg_n_0_[3]\,
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\write_address_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_address0,
      D => s_axi_awaddr(4),
      Q => \write_address_reg_n_0_[4]\,
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\write_address_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_address0,
      D => s_axi_awaddr(5),
      Q => \write_address_reg_n_0_[5]\,
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\write_address_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_address0,
      D => s_axi_awaddr(6),
      Q => p_0_in0,
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\write_address_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_address0,
      D => s_axi_awaddr(7),
      Q => \write_address_reg_n_0_[7]\,
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\write_address_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_address0,
      D => s_axi_awaddr(8),
      Q => \write_address_reg_n_0_[8]\,
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\write_address_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_address0,
      D => s_axi_awaddr(9),
      Q => \write_address_reg_n_0_[9]\,
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\write_data_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wdata(0),
      Q => write_data(0),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\write_data_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wdata(10),
      Q => write_data(10),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\write_data_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wdata(11),
      Q => write_data(11),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\write_data_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wdata(12),
      Q => write_data(12),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\write_data_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wdata(13),
      Q => write_data(13),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\write_data_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wdata(14),
      Q => write_data(14),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\write_data_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wdata(15),
      Q => write_data(15),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\write_data_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wdata(16),
      Q => write_data(16),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\write_data_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wdata(17),
      Q => write_data(17),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\write_data_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wdata(18),
      Q => write_data(18),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\write_data_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wdata(19),
      Q => write_data(19),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\write_data_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wdata(1),
      Q => write_data(1),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\write_data_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wdata(20),
      Q => write_data(20),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\write_data_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wdata(21),
      Q => write_data(21),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\write_data_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wdata(22),
      Q => write_data(22),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\write_data_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wdata(23),
      Q => write_data(23),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\write_data_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wdata(24),
      Q => write_data(24),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\write_data_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wdata(25),
      Q => write_data(25),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\write_data_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wdata(26),
      Q => write_data(26),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\write_data_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wdata(27),
      Q => write_data(27),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\write_data_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wdata(28),
      Q => write_data(28),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\write_data_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wdata(29),
      Q => write_data(29),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\write_data_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wdata(2),
      Q => write_data(2),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\write_data_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wdata(30),
      Q => write_data(30),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\write_data_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wdata(31),
      Q => write_data(31),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\write_data_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wdata(3),
      Q => write_data(3),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\write_data_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wdata(4),
      Q => write_data(4),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\write_data_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wdata(5),
      Q => write_data(5),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\write_data_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wdata(6),
      Q => write_data(6),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\write_data_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wdata(7),
      Q => write_data(7),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\write_data_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wdata(8),
      Q => write_data(8),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\write_data_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wdata(9),
      Q => write_data(9),
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\write_strobes[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => s_axi_wvalid,
      I1 => \^s_axi_bvalid_reg_0\,
      I2 => data_pending_reg_n_0,
      O => write_data0
    );
\write_strobes_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wstrb(0),
      Q => \write_strobes_reg_n_0_[0]\,
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\write_strobes_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wstrb(1),
      Q => data00,
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\write_strobes_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wstrb(2),
      Q => \write_strobes_reg_n_0_[2]\,
      R => \s_axi_bresp[1]_i_1_n_0\
    );
\write_strobes_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wstrb(3),
      Q => \write_strobes_reg_n_0_[3]\,
      R => \s_axi_bresp[1]_i_1_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_digital_capture_0 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    sample_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    trigger_in : in STD_LOGIC;
    invalidate_in : in STD_LOGIC;
    capture_active : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of system_digital_capture_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of system_digital_capture_0 : entity is "system_digital_capture_0,fdw_digital_axi,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of system_digital_capture_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of system_digital_capture_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of system_digital_capture_0 : entity is "fdw_digital_axi,Vivado 2025.1";
end system_digital_capture_0;

architecture STRUCTURE of system_digital_capture_0 is
  signal \<const0>\ : STD_LOGIC;
  signal \^s_axi_bresp\ : STD_LOGIC_VECTOR ( 1 to 1 );
  signal \^s_axi_rresp\ : STD_LOGIC_VECTOR ( 1 to 1 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of s_axi_aclk : signal is "xilinx.com:signal:clock:1.0 s_axi_aclk CLK";
  attribute X_INTERFACE_MODE : string;
  attribute X_INTERFACE_MODE of s_axi_aclk : signal is "slave";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of s_axi_aclk : signal is "XIL_INTERFACENAME s_axi_aclk, ASSOCIATED_BUSIF S_AXI, ASSOCIATED_RESET s_axi_aresetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_axi_aresetn : signal is "xilinx.com:signal:reset:1.0 s_axi_aresetn RST";
  attribute X_INTERFACE_MODE of s_axi_aresetn : signal is "slave";
  attribute X_INTERFACE_PARAMETER of s_axi_aresetn : signal is "XIL_INTERFACENAME s_axi_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_axi_arready : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARREADY";
  attribute X_INTERFACE_INFO of s_axi_arvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARVALID";
  attribute X_INTERFACE_INFO of s_axi_awready : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWREADY";
  attribute X_INTERFACE_INFO of s_axi_awvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWVALID";
  attribute X_INTERFACE_INFO of s_axi_bready : signal is "xilinx.com:interface:aximm:1.0 S_AXI BREADY";
  attribute X_INTERFACE_INFO of s_axi_bvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI BVALID";
  attribute X_INTERFACE_INFO of s_axi_rready : signal is "xilinx.com:interface:aximm:1.0 S_AXI RREADY";
  attribute X_INTERFACE_INFO of s_axi_rvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI RVALID";
  attribute X_INTERFACE_INFO of s_axi_wready : signal is "xilinx.com:interface:aximm:1.0 S_AXI WREADY";
  attribute X_INTERFACE_INFO of s_axi_wvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI WVALID";
  attribute X_INTERFACE_INFO of s_axi_araddr : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARADDR";
  attribute X_INTERFACE_INFO of s_axi_arprot : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARPROT";
  attribute X_INTERFACE_INFO of s_axi_awaddr : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWADDR";
  attribute X_INTERFACE_MODE of s_axi_awaddr : signal is "slave";
  attribute X_INTERFACE_PARAMETER of s_axi_awaddr : signal is "XIL_INTERFACENAME S_AXI, PROTOCOL AXI4LITE, DATA_WIDTH 32, ADDR_WIDTH 12, READ_WRITE_MODE READ_WRITE, FREQ_HZ 100000000, ID_WIDTH 0, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN system_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_axi_awprot : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWPROT";
  attribute X_INTERFACE_INFO of s_axi_bresp : signal is "xilinx.com:interface:aximm:1.0 S_AXI BRESP";
  attribute X_INTERFACE_INFO of s_axi_rdata : signal is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of s_axi_rresp : signal is "xilinx.com:interface:aximm:1.0 S_AXI RRESP";
  attribute X_INTERFACE_INFO of s_axi_wdata : signal is "xilinx.com:interface:aximm:1.0 S_AXI WDATA";
  attribute X_INTERFACE_INFO of s_axi_wstrb : signal is "xilinx.com:interface:aximm:1.0 S_AXI WSTRB";
begin
  s_axi_bresp(1) <= \^s_axi_bresp\(1);
  s_axi_bresp(0) <= \<const0>\;
  s_axi_rresp(1) <= \^s_axi_rresp\(1);
  s_axi_rresp(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
inst: entity work.system_digital_capture_0_fdw_digital_axi
     port map (
      capture_active => capture_active,
      invalidate_in => invalidate_in,
      s_axi_aclk => s_axi_aclk,
      s_axi_araddr(11 downto 0) => s_axi_araddr(11 downto 0),
      s_axi_aresetn => s_axi_aresetn,
      s_axi_arready => s_axi_arready,
      s_axi_arvalid => s_axi_arvalid,
      s_axi_awaddr(11 downto 0) => s_axi_awaddr(11 downto 0),
      s_axi_awready => s_axi_awready,
      s_axi_awvalid => s_axi_awvalid,
      s_axi_bready => s_axi_bready,
      s_axi_bresp(0) => \^s_axi_bresp\(1),
      s_axi_bvalid_reg_0 => s_axi_bvalid,
      s_axi_rdata(31 downto 0) => s_axi_rdata(31 downto 0),
      s_axi_rready => s_axi_rready,
      s_axi_rresp(0) => \^s_axi_rresp\(1),
      s_axi_rvalid_reg_0 => s_axi_rvalid,
      s_axi_wdata(31 downto 0) => s_axi_wdata(31 downto 0),
      s_axi_wready => s_axi_wready,
      s_axi_wstrb(3 downto 0) => s_axi_wstrb(3 downto 0),
      s_axi_wvalid => s_axi_wvalid,
      sample_in(1 downto 0) => sample_in(1 downto 0),
      trigger_in => trigger_in
    );
end STRUCTURE;
