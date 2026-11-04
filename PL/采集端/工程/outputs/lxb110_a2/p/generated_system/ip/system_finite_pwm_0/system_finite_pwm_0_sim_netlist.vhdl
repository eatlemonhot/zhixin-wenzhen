-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
-- Date        : Thu Oct 22 00:37:11 2026
-- Host        : xiaojun running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/33525/FDW_NEXT/outputs/lxb110_a2/p/generated_system/ip/system_finite_pwm_0/system_finite_pwm_0_sim_netlist.vhdl
-- Design      : system_finite_pwm_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg484-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_finite_pwm_0_fdw_pwm_burst is
  port (
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    pwm_out : out STD_LOGIC;
    period_start : out STD_LOGIC;
    done_event : out STD_LOGIC;
    \write_address_reg[3]\ : out STD_LOGIC;
    \write_address_reg[3]_0\ : out STD_LOGIC;
    launch_valid_reg : out STD_LOGIC;
    \write_address_reg[3]_1\ : out STD_LOGIC;
    \write_address_reg[3]_2\ : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    D : out STD_LOGIC_VECTOR ( 31 downto 0 );
    burst_start : out STD_LOGIC;
    \s_axi_bresp_reg[1]\ : out STD_LOGIC;
    \write_address_reg[2]\ : out STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    \counter_reg[0]_0\ : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 2 downto 0 );
    \error_sticky_reg[2]\ : in STD_LOGIC_VECTOR ( 2 downto 0 );
    \error_sticky_reg[1]\ : in STD_LOGIC;
    \error_sticky_reg[1]_0\ : in STD_LOGIC;
    \error_sticky_reg[1]_1\ : in STD_LOGIC;
    \error_sticky_reg[1]_2\ : in STD_LOGIC;
    \error_sticky_reg[1]_3\ : in STD_LOGIC;
    \error_sticky_reg[1]_4\ : in STD_LOGIC;
    \error_sticky_reg[2]_0\ : in STD_LOGIC;
    done_sticky_reg : in STD_LOGIC;
    done_sticky_reg_0 : in STD_LOGIC;
    data1 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    cancelled_sticky_reg : in STD_LOGIC;
    cfg_error_reg_0 : in STD_LOGIC;
    \active_period_ticks_reg[31]_0\ : in STD_LOGIC_VECTOR ( 31 downto 0 );
    \active_period_count_reg[31]_0\ : in STD_LOGIC_VECTOR ( 31 downto 0 );
    \s_axi_bresp_reg[1]_0\ : in STD_LOGIC;
    \s_axi_bresp_reg[1]_1\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    address_pending0 : in STD_LOGIC;
    \launch_count_reg[0]\ : in STD_LOGIC;
    \launch_count_reg[0]_0\ : in STD_LOGIC;
    cancelled_sticky_reg_0 : in STD_LOGIC;
    CO : in STD_LOGIC_VECTOR ( 0 to 0 );
    \s_axi_bresp[1]_i_4_0\ : in STD_LOGIC;
    \s_axi_bresp[1]_i_4_1\ : in STD_LOGIC;
    \s_axi_bresp[1]_i_4_2\ : in STD_LOGIC;
    \s_axi_bresp[1]_i_4_3\ : in STD_LOGIC;
    \s_axi_rdata_reg[1]\ : in STD_LOGIC;
    \s_axi_rdata_reg[1]_0\ : in STD_LOGIC;
    \s_axi_rdata_reg[1]_1\ : in STD_LOGIC;
    \s_axi_rdata_reg[1]_2\ : in STD_LOGIC;
    \active_high_ticks_reg[31]_0\ : in STD_LOGIC_VECTOR ( 31 downto 0 );
    \s_axi_rdata_reg[3]\ : in STD_LOGIC;
    \s_axi_rdata_reg[4]\ : in STD_LOGIC;
    \s_axi_rdata_reg[5]\ : in STD_LOGIC;
    \s_axi_rdata_reg[5]_0\ : in STD_LOGIC;
    \s_axi_rdata_reg[6]\ : in STD_LOGIC;
    \s_axi_rdata_reg[7]\ : in STD_LOGIC;
    \s_axi_rdata_reg[8]\ : in STD_LOGIC;
    \s_axi_rdata_reg[8]_0\ : in STD_LOGIC;
    \s_axi_rdata_reg[9]\ : in STD_LOGIC;
    \s_axi_rdata_reg[9]_0\ : in STD_LOGIC;
    \s_axi_rdata_reg[9]_1\ : in STD_LOGIC;
    \s_axi_rdata_reg[10]\ : in STD_LOGIC;
    \s_axi_rdata_reg[11]\ : in STD_LOGIC;
    \s_axi_rdata_reg[12]\ : in STD_LOGIC;
    \s_axi_rdata_reg[12]_0\ : in STD_LOGIC;
    \s_axi_rdata_reg[13]\ : in STD_LOGIC;
    \s_axi_rdata_reg[14]\ : in STD_LOGIC;
    \s_axi_rdata_reg[15]\ : in STD_LOGIC;
    \s_axi_rdata_reg[16]\ : in STD_LOGIC;
    \s_axi_rdata_reg[17]\ : in STD_LOGIC;
    \s_axi_rdata_reg[18]\ : in STD_LOGIC;
    \s_axi_rdata_reg[19]\ : in STD_LOGIC;
    \s_axi_rdata_reg[20]\ : in STD_LOGIC;
    \s_axi_rdata_reg[21]\ : in STD_LOGIC;
    \s_axi_rdata_reg[22]\ : in STD_LOGIC;
    \s_axi_rdata_reg[23]\ : in STD_LOGIC;
    \s_axi_rdata_reg[24]\ : in STD_LOGIC;
    \s_axi_rdata_reg[25]\ : in STD_LOGIC;
    \s_axi_rdata_reg[26]\ : in STD_LOGIC;
    \s_axi_rdata_reg[27]\ : in STD_LOGIC;
    \s_axi_rdata_reg[28]\ : in STD_LOGIC;
    \s_axi_rdata_reg[29]\ : in STD_LOGIC;
    \s_axi_rdata_reg[30]\ : in STD_LOGIC;
    \s_axi_rdata_reg[31]\ : in STD_LOGIC;
    \s_axi_rdata_reg[2]\ : in STD_LOGIC;
    \s_axi_rdata_reg[2]_0\ : in STD_LOGIC;
    \s_axi_rdata_reg[0]\ : in STD_LOGIC;
    \s_axi_bresp_reg[1]_2\ : in STD_LOGIC;
    \s_axi_bresp_reg[1]_3\ : in STD_LOGIC;
    \s_axi_bresp_reg[1]_4\ : in STD_LOGIC;
    s_axi_bresp : in STD_LOGIC_VECTOR ( 0 to 0 );
    launch_valid_reg_0 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_finite_pwm_0_fdw_pwm_burst : entity is "fdw_pwm_burst";
end system_finite_pwm_0_fdw_pwm_burst;

architecture STRUCTURE of system_finite_pwm_0_fdw_pwm_burst is
  signal \^sr\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal active_count : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal active_high : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal active_period : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \active_period_count[31]_i_10_n_0\ : STD_LOGIC;
  signal \active_period_count[31]_i_11_n_0\ : STD_LOGIC;
  signal \active_period_count[31]_i_12_n_0\ : STD_LOGIC;
  signal \active_period_count[31]_i_13_n_0\ : STD_LOGIC;
  signal \active_period_count[31]_i_14_n_0\ : STD_LOGIC;
  signal \active_period_count[31]_i_15_n_0\ : STD_LOGIC;
  signal \active_period_count[31]_i_16_n_0\ : STD_LOGIC;
  signal \active_period_count[31]_i_17_n_0\ : STD_LOGIC;
  signal \active_period_count[31]_i_18_n_0\ : STD_LOGIC;
  signal \active_period_count[31]_i_1_n_0\ : STD_LOGIC;
  signal \active_period_count[31]_i_2_n_0\ : STD_LOGIC;
  signal \active_period_count[31]_i_3_n_0\ : STD_LOGIC;
  signal \active_period_count[31]_i_4_n_0\ : STD_LOGIC;
  signal \active_period_count[31]_i_5_n_0\ : STD_LOGIC;
  signal \active_period_count[31]_i_6_n_0\ : STD_LOGIC;
  signal \active_period_count[31]_i_7_n_0\ : STD_LOGIC;
  signal \active_period_count[31]_i_8_n_0\ : STD_LOGIC;
  signal \active_period_count[31]_i_9_n_0\ : STD_LOGIC;
  signal burst_start_INST_0_i_1_n_0 : STD_LOGIC;
  signal burst_start_INST_0_i_2_n_0 : STD_LOGIC;
  signal burst_start_INST_0_i_3_n_0 : STD_LOGIC;
  signal burst_start_INST_0_i_4_n_0 : STD_LOGIC;
  signal burst_start_INST_0_i_5_n_0 : STD_LOGIC;
  signal burst_start_INST_0_i_6_n_0 : STD_LOGIC;
  signal burst_start_INST_0_i_7_n_0 : STD_LOGIC;
  signal burst_start_INST_0_i_8_n_0 : STD_LOGIC;
  signal cancelled : STD_LOGIC;
  signal cancelled_i_1_n_0 : STD_LOGIC;
  signal cancelled_sticky0 : STD_LOGIC;
  signal cfg_error : STD_LOGIC;
  signal cfg_error_i_1_n_0 : STD_LOGIC;
  signal cfg_error_i_2_n_0 : STD_LOGIC;
  signal completed_count : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \completed_periods[0]_i_1_n_0\ : STD_LOGIC;
  signal \completed_periods[0]_i_2_n_0\ : STD_LOGIC;
  signal \completed_periods_reg[0]_i_3_n_0\ : STD_LOGIC;
  signal \completed_periods_reg[0]_i_3_n_1\ : STD_LOGIC;
  signal \completed_periods_reg[0]_i_3_n_2\ : STD_LOGIC;
  signal \completed_periods_reg[0]_i_3_n_3\ : STD_LOGIC;
  signal \completed_periods_reg[0]_i_3_n_4\ : STD_LOGIC;
  signal \completed_periods_reg[0]_i_3_n_5\ : STD_LOGIC;
  signal \completed_periods_reg[0]_i_3_n_6\ : STD_LOGIC;
  signal \completed_periods_reg[0]_i_3_n_7\ : STD_LOGIC;
  signal \completed_periods_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \completed_periods_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \completed_periods_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \completed_periods_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \completed_periods_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \completed_periods_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \completed_periods_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \completed_periods_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \completed_periods_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \completed_periods_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \completed_periods_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \completed_periods_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \completed_periods_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \completed_periods_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \completed_periods_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \completed_periods_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \completed_periods_reg[20]_i_1_n_0\ : STD_LOGIC;
  signal \completed_periods_reg[20]_i_1_n_1\ : STD_LOGIC;
  signal \completed_periods_reg[20]_i_1_n_2\ : STD_LOGIC;
  signal \completed_periods_reg[20]_i_1_n_3\ : STD_LOGIC;
  signal \completed_periods_reg[20]_i_1_n_4\ : STD_LOGIC;
  signal \completed_periods_reg[20]_i_1_n_5\ : STD_LOGIC;
  signal \completed_periods_reg[20]_i_1_n_6\ : STD_LOGIC;
  signal \completed_periods_reg[20]_i_1_n_7\ : STD_LOGIC;
  signal \completed_periods_reg[24]_i_1_n_0\ : STD_LOGIC;
  signal \completed_periods_reg[24]_i_1_n_1\ : STD_LOGIC;
  signal \completed_periods_reg[24]_i_1_n_2\ : STD_LOGIC;
  signal \completed_periods_reg[24]_i_1_n_3\ : STD_LOGIC;
  signal \completed_periods_reg[24]_i_1_n_4\ : STD_LOGIC;
  signal \completed_periods_reg[24]_i_1_n_5\ : STD_LOGIC;
  signal \completed_periods_reg[24]_i_1_n_6\ : STD_LOGIC;
  signal \completed_periods_reg[24]_i_1_n_7\ : STD_LOGIC;
  signal \completed_periods_reg[28]_i_1_n_1\ : STD_LOGIC;
  signal \completed_periods_reg[28]_i_1_n_2\ : STD_LOGIC;
  signal \completed_periods_reg[28]_i_1_n_3\ : STD_LOGIC;
  signal \completed_periods_reg[28]_i_1_n_4\ : STD_LOGIC;
  signal \completed_periods_reg[28]_i_1_n_5\ : STD_LOGIC;
  signal \completed_periods_reg[28]_i_1_n_6\ : STD_LOGIC;
  signal \completed_periods_reg[28]_i_1_n_7\ : STD_LOGIC;
  signal \completed_periods_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \completed_periods_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \completed_periods_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \completed_periods_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \completed_periods_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \completed_periods_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \completed_periods_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \completed_periods_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \completed_periods_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \completed_periods_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \completed_periods_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \completed_periods_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \completed_periods_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \completed_periods_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \completed_periods_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \completed_periods_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \counter[0]_i_1_n_0\ : STD_LOGIC;
  signal counter_reg : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \counter_reg[0]_i_3_n_0\ : STD_LOGIC;
  signal \counter_reg[0]_i_3_n_1\ : STD_LOGIC;
  signal \counter_reg[0]_i_3_n_2\ : STD_LOGIC;
  signal \counter_reg[0]_i_3_n_3\ : STD_LOGIC;
  signal \counter_reg[0]_i_3_n_4\ : STD_LOGIC;
  signal \counter_reg[0]_i_3_n_5\ : STD_LOGIC;
  signal \counter_reg[0]_i_3_n_6\ : STD_LOGIC;
  signal \counter_reg[0]_i_3_n_7\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[24]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[24]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[24]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[24]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[24]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[24]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[24]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[24]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[28]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[28]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[28]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[28]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[28]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[28]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[28]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal cycle_end0 : STD_LOGIC;
  signal \cycle_end0_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \cycle_end0_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \cycle_end0_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \cycle_end0_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \cycle_end0_carry__0_n_0\ : STD_LOGIC;
  signal \cycle_end0_carry__0_n_1\ : STD_LOGIC;
  signal \cycle_end0_carry__0_n_2\ : STD_LOGIC;
  signal \cycle_end0_carry__0_n_3\ : STD_LOGIC;
  signal \cycle_end0_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \cycle_end0_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \cycle_end0_carry__1_i_3_n_0\ : STD_LOGIC;
  signal \cycle_end0_carry__1_n_2\ : STD_LOGIC;
  signal \cycle_end0_carry__1_n_3\ : STD_LOGIC;
  signal cycle_end0_carry_i_1_n_0 : STD_LOGIC;
  signal cycle_end0_carry_i_2_n_0 : STD_LOGIC;
  signal cycle_end0_carry_i_3_n_0 : STD_LOGIC;
  signal cycle_end0_carry_i_4_n_0 : STD_LOGIC;
  signal cycle_end0_carry_n_0 : STD_LOGIC;
  signal cycle_end0_carry_n_1 : STD_LOGIC;
  signal cycle_end0_carry_n_2 : STD_LOGIC;
  signal cycle_end0_carry_n_3 : STD_LOGIC;
  signal cycle_end1 : STD_LOGIC_VECTOR ( 31 downto 1 );
  signal \cycle_end1_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \cycle_end1_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \cycle_end1_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \cycle_end1_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \cycle_end1_carry__0_n_0\ : STD_LOGIC;
  signal \cycle_end1_carry__0_n_1\ : STD_LOGIC;
  signal \cycle_end1_carry__0_n_2\ : STD_LOGIC;
  signal \cycle_end1_carry__0_n_3\ : STD_LOGIC;
  signal \cycle_end1_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \cycle_end1_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \cycle_end1_carry__1_i_3_n_0\ : STD_LOGIC;
  signal \cycle_end1_carry__1_i_4_n_0\ : STD_LOGIC;
  signal \cycle_end1_carry__1_n_0\ : STD_LOGIC;
  signal \cycle_end1_carry__1_n_1\ : STD_LOGIC;
  signal \cycle_end1_carry__1_n_2\ : STD_LOGIC;
  signal \cycle_end1_carry__1_n_3\ : STD_LOGIC;
  signal \cycle_end1_carry__2_i_1_n_0\ : STD_LOGIC;
  signal \cycle_end1_carry__2_i_2_n_0\ : STD_LOGIC;
  signal \cycle_end1_carry__2_i_3_n_0\ : STD_LOGIC;
  signal \cycle_end1_carry__2_i_4_n_0\ : STD_LOGIC;
  signal \cycle_end1_carry__2_n_0\ : STD_LOGIC;
  signal \cycle_end1_carry__2_n_1\ : STD_LOGIC;
  signal \cycle_end1_carry__2_n_2\ : STD_LOGIC;
  signal \cycle_end1_carry__2_n_3\ : STD_LOGIC;
  signal \cycle_end1_carry__3_i_1_n_0\ : STD_LOGIC;
  signal \cycle_end1_carry__3_i_2_n_0\ : STD_LOGIC;
  signal \cycle_end1_carry__3_i_3_n_0\ : STD_LOGIC;
  signal \cycle_end1_carry__3_i_4_n_0\ : STD_LOGIC;
  signal \cycle_end1_carry__3_n_0\ : STD_LOGIC;
  signal \cycle_end1_carry__3_n_1\ : STD_LOGIC;
  signal \cycle_end1_carry__3_n_2\ : STD_LOGIC;
  signal \cycle_end1_carry__3_n_3\ : STD_LOGIC;
  signal \cycle_end1_carry__4_i_1_n_0\ : STD_LOGIC;
  signal \cycle_end1_carry__4_i_2_n_0\ : STD_LOGIC;
  signal \cycle_end1_carry__4_i_3_n_0\ : STD_LOGIC;
  signal \cycle_end1_carry__4_i_4_n_0\ : STD_LOGIC;
  signal \cycle_end1_carry__4_n_0\ : STD_LOGIC;
  signal \cycle_end1_carry__4_n_1\ : STD_LOGIC;
  signal \cycle_end1_carry__4_n_2\ : STD_LOGIC;
  signal \cycle_end1_carry__4_n_3\ : STD_LOGIC;
  signal \cycle_end1_carry__5_i_1_n_0\ : STD_LOGIC;
  signal \cycle_end1_carry__5_i_2_n_0\ : STD_LOGIC;
  signal \cycle_end1_carry__5_i_3_n_0\ : STD_LOGIC;
  signal \cycle_end1_carry__5_i_4_n_0\ : STD_LOGIC;
  signal \cycle_end1_carry__5_n_0\ : STD_LOGIC;
  signal \cycle_end1_carry__5_n_1\ : STD_LOGIC;
  signal \cycle_end1_carry__5_n_2\ : STD_LOGIC;
  signal \cycle_end1_carry__5_n_3\ : STD_LOGIC;
  signal \cycle_end1_carry__6_i_1_n_0\ : STD_LOGIC;
  signal \cycle_end1_carry__6_i_2_n_0\ : STD_LOGIC;
  signal \cycle_end1_carry__6_i_3_n_0\ : STD_LOGIC;
  signal \cycle_end1_carry__6_n_2\ : STD_LOGIC;
  signal \cycle_end1_carry__6_n_3\ : STD_LOGIC;
  signal cycle_end1_carry_i_1_n_0 : STD_LOGIC;
  signal cycle_end1_carry_i_2_n_0 : STD_LOGIC;
  signal cycle_end1_carry_i_3_n_0 : STD_LOGIC;
  signal cycle_end1_carry_i_4_n_0 : STD_LOGIC;
  signal cycle_end1_carry_n_0 : STD_LOGIC;
  signal cycle_end1_carry_n_1 : STD_LOGIC;
  signal cycle_end1_carry_n_2 : STD_LOGIC;
  signal cycle_end1_carry_n_3 : STD_LOGIC;
  signal done : STD_LOGIC;
  signal \^done_event\ : STD_LOGIC;
  signal done_event_i_1_n_0 : STD_LOGIC;
  signal done_i_1_n_0 : STD_LOGIC;
  signal done_sticky0 : STD_LOGIC;
  signal done_sticky_i_3_n_0 : STD_LOGIC;
  signal \error_sticky[1]_i_2_n_0\ : STD_LOGIC;
  signal \error_sticky[2]_i_2_n_0\ : STD_LOGIC;
  signal \^launch_valid_reg\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal parameters_ok1 : STD_LOGIC;
  signal \parameters_ok1_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \parameters_ok1_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \parameters_ok1_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \parameters_ok1_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \parameters_ok1_carry__0_i_5_n_0\ : STD_LOGIC;
  signal \parameters_ok1_carry__0_i_6_n_0\ : STD_LOGIC;
  signal \parameters_ok1_carry__0_i_7_n_0\ : STD_LOGIC;
  signal \parameters_ok1_carry__0_i_8_n_0\ : STD_LOGIC;
  signal \parameters_ok1_carry__0_n_0\ : STD_LOGIC;
  signal \parameters_ok1_carry__0_n_1\ : STD_LOGIC;
  signal \parameters_ok1_carry__0_n_2\ : STD_LOGIC;
  signal \parameters_ok1_carry__0_n_3\ : STD_LOGIC;
  signal \parameters_ok1_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \parameters_ok1_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \parameters_ok1_carry__1_i_3_n_0\ : STD_LOGIC;
  signal \parameters_ok1_carry__1_i_4_n_0\ : STD_LOGIC;
  signal \parameters_ok1_carry__1_i_5_n_0\ : STD_LOGIC;
  signal \parameters_ok1_carry__1_i_6_n_0\ : STD_LOGIC;
  signal \parameters_ok1_carry__1_i_7_n_0\ : STD_LOGIC;
  signal \parameters_ok1_carry__1_i_8_n_0\ : STD_LOGIC;
  signal \parameters_ok1_carry__1_n_0\ : STD_LOGIC;
  signal \parameters_ok1_carry__1_n_1\ : STD_LOGIC;
  signal \parameters_ok1_carry__1_n_2\ : STD_LOGIC;
  signal \parameters_ok1_carry__1_n_3\ : STD_LOGIC;
  signal \parameters_ok1_carry__2_i_1_n_0\ : STD_LOGIC;
  signal \parameters_ok1_carry__2_i_2_n_0\ : STD_LOGIC;
  signal \parameters_ok1_carry__2_i_3_n_0\ : STD_LOGIC;
  signal \parameters_ok1_carry__2_i_4_n_0\ : STD_LOGIC;
  signal \parameters_ok1_carry__2_i_5_n_0\ : STD_LOGIC;
  signal \parameters_ok1_carry__2_i_6_n_0\ : STD_LOGIC;
  signal \parameters_ok1_carry__2_i_7_n_0\ : STD_LOGIC;
  signal \parameters_ok1_carry__2_i_8_n_0\ : STD_LOGIC;
  signal \parameters_ok1_carry__2_n_1\ : STD_LOGIC;
  signal \parameters_ok1_carry__2_n_2\ : STD_LOGIC;
  signal \parameters_ok1_carry__2_n_3\ : STD_LOGIC;
  signal parameters_ok1_carry_i_1_n_0 : STD_LOGIC;
  signal parameters_ok1_carry_i_2_n_0 : STD_LOGIC;
  signal parameters_ok1_carry_i_3_n_0 : STD_LOGIC;
  signal parameters_ok1_carry_i_4_n_0 : STD_LOGIC;
  signal parameters_ok1_carry_i_5_n_0 : STD_LOGIC;
  signal parameters_ok1_carry_i_6_n_0 : STD_LOGIC;
  signal parameters_ok1_carry_i_7_n_0 : STD_LOGIC;
  signal parameters_ok1_carry_i_8_n_0 : STD_LOGIC;
  signal parameters_ok1_carry_n_0 : STD_LOGIC;
  signal parameters_ok1_carry_n_1 : STD_LOGIC;
  signal parameters_ok1_carry_n_2 : STD_LOGIC;
  signal parameters_ok1_carry_n_3 : STD_LOGIC;
  signal \^period_start\ : STD_LOGIC;
  signal period_start_i_1_n_0 : STD_LOGIC;
  signal \^pwm_out\ : STD_LOGIC;
  signal \pwm_out0_carry__0_i_10_n_0\ : STD_LOGIC;
  signal \pwm_out0_carry__0_i_10_n_1\ : STD_LOGIC;
  signal \pwm_out0_carry__0_i_10_n_2\ : STD_LOGIC;
  signal \pwm_out0_carry__0_i_10_n_3\ : STD_LOGIC;
  signal \pwm_out0_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \pwm_out0_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \pwm_out0_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \pwm_out0_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \pwm_out0_carry__0_i_5_n_0\ : STD_LOGIC;
  signal \pwm_out0_carry__0_i_6_n_0\ : STD_LOGIC;
  signal \pwm_out0_carry__0_i_7_n_0\ : STD_LOGIC;
  signal \pwm_out0_carry__0_i_8_n_0\ : STD_LOGIC;
  signal \pwm_out0_carry__0_i_9_n_0\ : STD_LOGIC;
  signal \pwm_out0_carry__0_i_9_n_1\ : STD_LOGIC;
  signal \pwm_out0_carry__0_i_9_n_2\ : STD_LOGIC;
  signal \pwm_out0_carry__0_i_9_n_3\ : STD_LOGIC;
  signal \pwm_out0_carry__0_n_0\ : STD_LOGIC;
  signal \pwm_out0_carry__0_n_1\ : STD_LOGIC;
  signal \pwm_out0_carry__0_n_2\ : STD_LOGIC;
  signal \pwm_out0_carry__0_n_3\ : STD_LOGIC;
  signal \pwm_out0_carry__1_i_10_n_0\ : STD_LOGIC;
  signal \pwm_out0_carry__1_i_10_n_1\ : STD_LOGIC;
  signal \pwm_out0_carry__1_i_10_n_2\ : STD_LOGIC;
  signal \pwm_out0_carry__1_i_10_n_3\ : STD_LOGIC;
  signal \pwm_out0_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \pwm_out0_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \pwm_out0_carry__1_i_3_n_0\ : STD_LOGIC;
  signal \pwm_out0_carry__1_i_4_n_0\ : STD_LOGIC;
  signal \pwm_out0_carry__1_i_5_n_0\ : STD_LOGIC;
  signal \pwm_out0_carry__1_i_6_n_0\ : STD_LOGIC;
  signal \pwm_out0_carry__1_i_7_n_0\ : STD_LOGIC;
  signal \pwm_out0_carry__1_i_8_n_0\ : STD_LOGIC;
  signal \pwm_out0_carry__1_i_9_n_0\ : STD_LOGIC;
  signal \pwm_out0_carry__1_i_9_n_1\ : STD_LOGIC;
  signal \pwm_out0_carry__1_i_9_n_2\ : STD_LOGIC;
  signal \pwm_out0_carry__1_i_9_n_3\ : STD_LOGIC;
  signal \pwm_out0_carry__1_n_0\ : STD_LOGIC;
  signal \pwm_out0_carry__1_n_1\ : STD_LOGIC;
  signal \pwm_out0_carry__1_n_2\ : STD_LOGIC;
  signal \pwm_out0_carry__1_n_3\ : STD_LOGIC;
  signal \pwm_out0_carry__2_i_10_n_0\ : STD_LOGIC;
  signal \pwm_out0_carry__2_i_10_n_1\ : STD_LOGIC;
  signal \pwm_out0_carry__2_i_10_n_2\ : STD_LOGIC;
  signal \pwm_out0_carry__2_i_10_n_3\ : STD_LOGIC;
  signal \pwm_out0_carry__2_i_1_n_0\ : STD_LOGIC;
  signal \pwm_out0_carry__2_i_2_n_0\ : STD_LOGIC;
  signal \pwm_out0_carry__2_i_3_n_0\ : STD_LOGIC;
  signal \pwm_out0_carry__2_i_4_n_0\ : STD_LOGIC;
  signal \pwm_out0_carry__2_i_5_n_0\ : STD_LOGIC;
  signal \pwm_out0_carry__2_i_6_n_0\ : STD_LOGIC;
  signal \pwm_out0_carry__2_i_7_n_0\ : STD_LOGIC;
  signal \pwm_out0_carry__2_i_8_n_0\ : STD_LOGIC;
  signal \pwm_out0_carry__2_i_9_n_2\ : STD_LOGIC;
  signal \pwm_out0_carry__2_i_9_n_3\ : STD_LOGIC;
  signal \pwm_out0_carry__2_n_0\ : STD_LOGIC;
  signal \pwm_out0_carry__2_n_1\ : STD_LOGIC;
  signal \pwm_out0_carry__2_n_2\ : STD_LOGIC;
  signal \pwm_out0_carry__2_n_3\ : STD_LOGIC;
  signal pwm_out0_carry_i_10_n_0 : STD_LOGIC;
  signal pwm_out0_carry_i_10_n_1 : STD_LOGIC;
  signal pwm_out0_carry_i_10_n_2 : STD_LOGIC;
  signal pwm_out0_carry_i_10_n_3 : STD_LOGIC;
  signal pwm_out0_carry_i_1_n_0 : STD_LOGIC;
  signal pwm_out0_carry_i_2_n_0 : STD_LOGIC;
  signal pwm_out0_carry_i_3_n_0 : STD_LOGIC;
  signal pwm_out0_carry_i_4_n_0 : STD_LOGIC;
  signal pwm_out0_carry_i_5_n_0 : STD_LOGIC;
  signal pwm_out0_carry_i_6_n_0 : STD_LOGIC;
  signal pwm_out0_carry_i_7_n_0 : STD_LOGIC;
  signal pwm_out0_carry_i_8_n_0 : STD_LOGIC;
  signal pwm_out0_carry_i_9_n_0 : STD_LOGIC;
  signal pwm_out0_carry_i_9_n_1 : STD_LOGIC;
  signal pwm_out0_carry_i_9_n_2 : STD_LOGIC;
  signal pwm_out0_carry_i_9_n_3 : STD_LOGIC;
  signal pwm_out0_carry_n_0 : STD_LOGIC;
  signal pwm_out0_carry_n_1 : STD_LOGIC;
  signal pwm_out0_carry_n_2 : STD_LOGIC;
  signal pwm_out0_carry_n_3 : STD_LOGIC;
  signal pwm_out5_out : STD_LOGIC;
  signal pwm_out_i_10_n_0 : STD_LOGIC;
  signal pwm_out_i_11_n_0 : STD_LOGIC;
  signal pwm_out_i_12_n_0 : STD_LOGIC;
  signal pwm_out_i_13_n_0 : STD_LOGIC;
  signal pwm_out_i_14_n_0 : STD_LOGIC;
  signal pwm_out_i_15_n_0 : STD_LOGIC;
  signal pwm_out_i_16_n_0 : STD_LOGIC;
  signal pwm_out_i_17_n_0 : STD_LOGIC;
  signal pwm_out_i_18_n_0 : STD_LOGIC;
  signal pwm_out_i_19_n_0 : STD_LOGIC;
  signal pwm_out_i_1_n_0 : STD_LOGIC;
  signal pwm_out_i_20_n_0 : STD_LOGIC;
  signal pwm_out_i_21_n_0 : STD_LOGIC;
  signal pwm_out_i_22_n_0 : STD_LOGIC;
  signal pwm_out_i_23_n_0 : STD_LOGIC;
  signal pwm_out_i_2_n_0 : STD_LOGIC;
  signal pwm_out_i_3_n_0 : STD_LOGIC;
  signal pwm_out_i_4_n_0 : STD_LOGIC;
  signal pwm_out_i_5_n_0 : STD_LOGIC;
  signal pwm_out_i_6_n_0 : STD_LOGIC;
  signal pwm_out_i_7_n_0 : STD_LOGIC;
  signal pwm_out_i_8_n_0 : STD_LOGIC;
  signal pwm_out_i_9_n_0 : STD_LOGIC;
  signal running : STD_LOGIC;
  signal running0 : STD_LOGIC;
  signal \running0_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \running0_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \running0_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \running0_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \running0_carry__0_i_5_n_0\ : STD_LOGIC;
  signal \running0_carry__0_i_5_n_1\ : STD_LOGIC;
  signal \running0_carry__0_i_5_n_2\ : STD_LOGIC;
  signal \running0_carry__0_i_5_n_3\ : STD_LOGIC;
  signal \running0_carry__0_i_6_n_0\ : STD_LOGIC;
  signal \running0_carry__0_i_6_n_1\ : STD_LOGIC;
  signal \running0_carry__0_i_6_n_2\ : STD_LOGIC;
  signal \running0_carry__0_i_6_n_3\ : STD_LOGIC;
  signal \running0_carry__0_i_7_n_0\ : STD_LOGIC;
  signal \running0_carry__0_i_7_n_1\ : STD_LOGIC;
  signal \running0_carry__0_i_7_n_2\ : STD_LOGIC;
  signal \running0_carry__0_i_7_n_3\ : STD_LOGIC;
  signal \running0_carry__0_n_0\ : STD_LOGIC;
  signal \running0_carry__0_n_1\ : STD_LOGIC;
  signal \running0_carry__0_n_2\ : STD_LOGIC;
  signal \running0_carry__0_n_3\ : STD_LOGIC;
  signal \running0_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \running0_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \running0_carry__1_i_3_n_0\ : STD_LOGIC;
  signal \running0_carry__1_i_4_n_2\ : STD_LOGIC;
  signal \running0_carry__1_i_4_n_3\ : STD_LOGIC;
  signal \running0_carry__1_i_5_n_0\ : STD_LOGIC;
  signal \running0_carry__1_i_5_n_1\ : STD_LOGIC;
  signal \running0_carry__1_i_5_n_2\ : STD_LOGIC;
  signal \running0_carry__1_i_5_n_3\ : STD_LOGIC;
  signal \running0_carry__1_n_2\ : STD_LOGIC;
  signal \running0_carry__1_n_3\ : STD_LOGIC;
  signal running0_carry_i_1_n_0 : STD_LOGIC;
  signal running0_carry_i_2_n_0 : STD_LOGIC;
  signal running0_carry_i_3_n_0 : STD_LOGIC;
  signal running0_carry_i_4_n_0 : STD_LOGIC;
  signal running0_carry_i_5_n_0 : STD_LOGIC;
  signal running0_carry_i_5_n_1 : STD_LOGIC;
  signal running0_carry_i_5_n_2 : STD_LOGIC;
  signal running0_carry_i_5_n_3 : STD_LOGIC;
  signal running0_carry_i_6_n_0 : STD_LOGIC;
  signal running0_carry_i_6_n_1 : STD_LOGIC;
  signal running0_carry_i_6_n_2 : STD_LOGIC;
  signal running0_carry_i_6_n_3 : STD_LOGIC;
  signal running0_carry_i_7_n_0 : STD_LOGIC;
  signal running0_carry_i_7_n_1 : STD_LOGIC;
  signal running0_carry_i_7_n_2 : STD_LOGIC;
  signal running0_carry_i_7_n_3 : STD_LOGIC;
  signal running0_carry_n_0 : STD_LOGIC;
  signal running0_carry_n_1 : STD_LOGIC;
  signal running0_carry_n_2 : STD_LOGIC;
  signal running0_carry_n_3 : STD_LOGIC;
  signal running1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal running_i_1_n_0 : STD_LOGIC;
  signal \s_axi_bresp[1]_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_bresp[1]_i_8_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[0]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[0]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[10]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[11]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[12]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[13]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[14]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[15]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[16]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[17]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[18]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[19]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[1]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[20]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[21]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[22]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[23]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[24]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[25]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[26]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[27]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[28]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[29]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[2]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[2]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[30]_i_5_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[31]_i_5_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[3]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[4]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[5]_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[6]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[7]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[8]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[9]_i_5_n_0\ : STD_LOGIC;
  signal \NLW_completed_periods_reg[28]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_counter_reg[28]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal NLW_cycle_end0_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_cycle_end0_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_cycle_end0_carry__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_cycle_end0_carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_cycle_end1_carry__6_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_cycle_end1_carry__6_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal NLW_parameters_ok1_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_parameters_ok1_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_parameters_ok1_carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_parameters_ok1_carry__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_pwm_out0_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_pwm_out0_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_pwm_out0_carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_pwm_out0_carry__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_pwm_out0_carry__2_i_9_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_pwm_out0_carry__2_i_9_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal NLW_running0_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_running0_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_running0_carry__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_running0_carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_running0_carry__1_i_4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_running0_carry__1_i_4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \active_period_count[31]_i_2\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of activity_INST_0 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of cancelled_i_1 : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of cfg_error_i_1 : label is "soft_lutpair1";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \completed_periods_reg[0]_i_3\ : label is 11;
  attribute ADDER_THRESHOLD of \completed_periods_reg[12]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \completed_periods_reg[16]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \completed_periods_reg[20]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \completed_periods_reg[24]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \completed_periods_reg[28]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \completed_periods_reg[4]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \completed_periods_reg[8]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_reg[0]_i_3\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_reg[12]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_reg[16]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_reg[20]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_reg[24]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_reg[28]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_reg[4]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_reg[8]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of cycle_end1_carry : label is 35;
  attribute ADDER_THRESHOLD of \cycle_end1_carry__0\ : label is 35;
  attribute ADDER_THRESHOLD of \cycle_end1_carry__1\ : label is 35;
  attribute ADDER_THRESHOLD of \cycle_end1_carry__2\ : label is 35;
  attribute ADDER_THRESHOLD of \cycle_end1_carry__3\ : label is 35;
  attribute ADDER_THRESHOLD of \cycle_end1_carry__4\ : label is 35;
  attribute ADDER_THRESHOLD of \cycle_end1_carry__5\ : label is 35;
  attribute ADDER_THRESHOLD of \cycle_end1_carry__6\ : label is 35;
  attribute SOFT_HLUTNM of done_event_i_1 : label is "soft_lutpair0";
  attribute COMPARATOR_THRESHOLD : integer;
  attribute COMPARATOR_THRESHOLD of parameters_ok1_carry : label is 11;
  attribute COMPARATOR_THRESHOLD of \parameters_ok1_carry__0\ : label is 11;
  attribute COMPARATOR_THRESHOLD of \parameters_ok1_carry__1\ : label is 11;
  attribute COMPARATOR_THRESHOLD of \parameters_ok1_carry__2\ : label is 11;
  attribute COMPARATOR_THRESHOLD of pwm_out0_carry : label is 11;
  attribute COMPARATOR_THRESHOLD of \pwm_out0_carry__0\ : label is 11;
  attribute ADDER_THRESHOLD of \pwm_out0_carry__0_i_10\ : label is 35;
  attribute ADDER_THRESHOLD of \pwm_out0_carry__0_i_9\ : label is 35;
  attribute COMPARATOR_THRESHOLD of \pwm_out0_carry__1\ : label is 11;
  attribute ADDER_THRESHOLD of \pwm_out0_carry__1_i_10\ : label is 35;
  attribute ADDER_THRESHOLD of \pwm_out0_carry__1_i_9\ : label is 35;
  attribute COMPARATOR_THRESHOLD of \pwm_out0_carry__2\ : label is 11;
  attribute ADDER_THRESHOLD of \pwm_out0_carry__2_i_10\ : label is 35;
  attribute ADDER_THRESHOLD of \pwm_out0_carry__2_i_9\ : label is 35;
  attribute ADDER_THRESHOLD of pwm_out0_carry_i_10 : label is 35;
  attribute ADDER_THRESHOLD of pwm_out0_carry_i_9 : label is 35;
  attribute SOFT_HLUTNM of pwm_out_i_2 : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of pwm_out_i_4 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of pwm_out_i_5 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of pwm_out_i_8 : label is "soft_lutpair4";
  attribute ADDER_THRESHOLD of \running0_carry__0_i_5\ : label is 35;
  attribute ADDER_THRESHOLD of \running0_carry__0_i_6\ : label is 35;
  attribute ADDER_THRESHOLD of \running0_carry__0_i_7\ : label is 35;
  attribute ADDER_THRESHOLD of \running0_carry__1_i_4\ : label is 35;
  attribute ADDER_THRESHOLD of \running0_carry__1_i_5\ : label is 35;
  attribute ADDER_THRESHOLD of running0_carry_i_5 : label is 35;
  attribute ADDER_THRESHOLD of running0_carry_i_6 : label is 35;
  attribute ADDER_THRESHOLD of running0_carry_i_7 : label is 35;
  attribute SOFT_HLUTNM of running_i_1 : label is "soft_lutpair2";
begin
  SR(0) <= \^sr\(0);
  done_event <= \^done_event\;
  launch_valid_reg <= \^launch_valid_reg\;
  period_start <= \^period_start\;
  pwm_out <= \^pwm_out\;
\active_high_ticks_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_high_ticks_reg[31]_0\(0),
      Q => active_high(0),
      R => \^sr\(0)
    );
\active_high_ticks_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_high_ticks_reg[31]_0\(10),
      Q => active_high(10),
      R => \^sr\(0)
    );
\active_high_ticks_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_high_ticks_reg[31]_0\(11),
      Q => active_high(11),
      R => \^sr\(0)
    );
\active_high_ticks_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_high_ticks_reg[31]_0\(12),
      Q => active_high(12),
      R => \^sr\(0)
    );
\active_high_ticks_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_high_ticks_reg[31]_0\(13),
      Q => active_high(13),
      R => \^sr\(0)
    );
\active_high_ticks_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_high_ticks_reg[31]_0\(14),
      Q => active_high(14),
      R => \^sr\(0)
    );
\active_high_ticks_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_high_ticks_reg[31]_0\(15),
      Q => active_high(15),
      R => \^sr\(0)
    );
\active_high_ticks_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_high_ticks_reg[31]_0\(16),
      Q => active_high(16),
      R => \^sr\(0)
    );
\active_high_ticks_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_high_ticks_reg[31]_0\(17),
      Q => active_high(17),
      R => \^sr\(0)
    );
\active_high_ticks_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_high_ticks_reg[31]_0\(18),
      Q => active_high(18),
      R => \^sr\(0)
    );
\active_high_ticks_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_high_ticks_reg[31]_0\(19),
      Q => active_high(19),
      R => \^sr\(0)
    );
\active_high_ticks_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_high_ticks_reg[31]_0\(1),
      Q => active_high(1),
      R => \^sr\(0)
    );
\active_high_ticks_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_high_ticks_reg[31]_0\(20),
      Q => active_high(20),
      R => \^sr\(0)
    );
\active_high_ticks_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_high_ticks_reg[31]_0\(21),
      Q => active_high(21),
      R => \^sr\(0)
    );
\active_high_ticks_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_high_ticks_reg[31]_0\(22),
      Q => active_high(22),
      R => \^sr\(0)
    );
\active_high_ticks_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_high_ticks_reg[31]_0\(23),
      Q => active_high(23),
      R => \^sr\(0)
    );
\active_high_ticks_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_high_ticks_reg[31]_0\(24),
      Q => active_high(24),
      R => \^sr\(0)
    );
\active_high_ticks_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_high_ticks_reg[31]_0\(25),
      Q => active_high(25),
      R => \^sr\(0)
    );
\active_high_ticks_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_high_ticks_reg[31]_0\(26),
      Q => active_high(26),
      R => \^sr\(0)
    );
\active_high_ticks_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_high_ticks_reg[31]_0\(27),
      Q => active_high(27),
      R => \^sr\(0)
    );
\active_high_ticks_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_high_ticks_reg[31]_0\(28),
      Q => active_high(28),
      R => \^sr\(0)
    );
\active_high_ticks_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_high_ticks_reg[31]_0\(29),
      Q => active_high(29),
      R => \^sr\(0)
    );
\active_high_ticks_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_high_ticks_reg[31]_0\(2),
      Q => active_high(2),
      R => \^sr\(0)
    );
\active_high_ticks_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_high_ticks_reg[31]_0\(30),
      Q => active_high(30),
      R => \^sr\(0)
    );
\active_high_ticks_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_high_ticks_reg[31]_0\(31),
      Q => active_high(31),
      R => \^sr\(0)
    );
\active_high_ticks_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_high_ticks_reg[31]_0\(3),
      Q => active_high(3),
      R => \^sr\(0)
    );
\active_high_ticks_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_high_ticks_reg[31]_0\(4),
      Q => active_high(4),
      R => \^sr\(0)
    );
\active_high_ticks_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_high_ticks_reg[31]_0\(5),
      Q => active_high(5),
      R => \^sr\(0)
    );
\active_high_ticks_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_high_ticks_reg[31]_0\(6),
      Q => active_high(6),
      R => \^sr\(0)
    );
\active_high_ticks_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_high_ticks_reg[31]_0\(7),
      Q => active_high(7),
      R => \^sr\(0)
    );
\active_high_ticks_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_high_ticks_reg[31]_0\(8),
      Q => active_high(8),
      R => \^sr\(0)
    );
\active_high_ticks_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_high_ticks_reg[31]_0\(9),
      Q => active_high(9),
      R => \^sr\(0)
    );
\active_period_count[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8808880800008808"
    )
        port map (
      I0 => \active_period_count[31]_i_2_n_0\,
      I1 => parameters_ok1,
      I2 => \active_period_count[31]_i_3_n_0\,
      I3 => \active_period_count[31]_i_4_n_0\,
      I4 => \active_period_count[31]_i_5_n_0\,
      I5 => \active_period_count[31]_i_6_n_0\,
      O => \active_period_count[31]_i_1_n_0\
    );
\active_period_count[31]_i_10\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \active_period_ticks_reg[31]_0\(8),
      I1 => \active_period_ticks_reg[31]_0\(11),
      I2 => \active_period_ticks_reg[31]_0\(9),
      I3 => \active_period_ticks_reg[31]_0\(10),
      I4 => \active_period_count[31]_i_16_n_0\,
      O => \active_period_count[31]_i_10_n_0\
    );
\active_period_count[31]_i_11\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \active_period_count_reg[31]_0\(25),
      I1 => \active_period_count_reg[31]_0\(9),
      I2 => \active_period_count_reg[31]_0\(15),
      I3 => \active_period_count_reg[31]_0\(7),
      O => \active_period_count[31]_i_11_n_0\
    );
\active_period_count[31]_i_12\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \active_period_count_reg[31]_0\(6),
      I1 => \active_period_count_reg[31]_0\(10),
      I2 => \active_period_count_reg[31]_0\(4),
      I3 => \active_period_count_reg[31]_0\(12),
      I4 => \active_period_count[31]_i_17_n_0\,
      O => \active_period_count[31]_i_12_n_0\
    );
\active_period_count[31]_i_13\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \active_period_count_reg[31]_0\(23),
      I1 => \active_period_count_reg[31]_0\(11),
      I2 => \active_period_count_reg[31]_0\(14),
      I3 => \active_period_count_reg[31]_0\(8),
      O => \active_period_count[31]_i_13_n_0\
    );
\active_period_count[31]_i_14\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \active_period_count_reg[31]_0\(19),
      I1 => \active_period_count_reg[31]_0\(21),
      I2 => \active_period_count_reg[31]_0\(16),
      I3 => \active_period_count_reg[31]_0\(22),
      I4 => \active_period_count[31]_i_18_n_0\,
      O => \active_period_count[31]_i_14_n_0\
    );
\active_period_count[31]_i_15\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \active_period_ticks_reg[31]_0\(29),
      I1 => \active_period_ticks_reg[31]_0\(28),
      I2 => \active_period_ticks_reg[31]_0\(31),
      I3 => \active_period_ticks_reg[31]_0\(30),
      O => \active_period_count[31]_i_15_n_0\
    );
\active_period_count[31]_i_16\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \active_period_ticks_reg[31]_0\(13),
      I1 => \active_period_ticks_reg[31]_0\(12),
      I2 => \active_period_ticks_reg[31]_0\(15),
      I3 => \active_period_ticks_reg[31]_0\(14),
      O => \active_period_count[31]_i_16_n_0\
    );
\active_period_count[31]_i_17\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \active_period_count_reg[31]_0\(18),
      I1 => \active_period_count_reg[31]_0\(17),
      I2 => \active_period_count_reg[31]_0\(26),
      I3 => \active_period_count_reg[31]_0\(13),
      O => \active_period_count[31]_i_17_n_0\
    );
\active_period_count[31]_i_18\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \active_period_count_reg[31]_0\(27),
      I1 => \active_period_count_reg[31]_0\(3),
      I2 => \active_period_count_reg[31]_0\(28),
      I3 => \active_period_count_reg[31]_0\(2),
      O => \active_period_count[31]_i_18_n_0\
    );
\active_period_count[31]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0020"
    )
        port map (
      I0 => cfg_error_reg_0,
      I1 => \counter_reg[0]_0\,
      I2 => s_axi_aresetn,
      I3 => running,
      O => \active_period_count[31]_i_2_n_0\
    );
\active_period_count[31]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => \active_period_count[31]_i_7_n_0\,
      I1 => \active_period_ticks_reg[31]_0\(18),
      I2 => \active_period_ticks_reg[31]_0\(17),
      I3 => \active_period_ticks_reg[31]_0\(19),
      I4 => \active_period_ticks_reg[31]_0\(16),
      I5 => \active_period_count[31]_i_8_n_0\,
      O => \active_period_count[31]_i_3_n_0\
    );
\active_period_count[31]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \active_period_count[31]_i_9_n_0\,
      I1 => \active_period_ticks_reg[31]_0\(1),
      I2 => \active_period_ticks_reg[31]_0\(0),
      I3 => \active_period_ticks_reg[31]_0\(3),
      I4 => \active_period_ticks_reg[31]_0\(2),
      I5 => \active_period_count[31]_i_10_n_0\,
      O => \active_period_count[31]_i_4_n_0\
    );
\active_period_count[31]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => \active_period_count[31]_i_11_n_0\,
      I1 => \active_period_count_reg[31]_0\(30),
      I2 => \active_period_count_reg[31]_0\(5),
      I3 => \active_period_count_reg[31]_0\(20),
      I4 => \active_period_count_reg[31]_0\(1),
      I5 => \active_period_count[31]_i_12_n_0\,
      O => \active_period_count[31]_i_5_n_0\
    );
\active_period_count[31]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \active_period_count[31]_i_13_n_0\,
      I1 => \active_period_count_reg[31]_0\(31),
      I2 => \active_period_count_reg[31]_0\(29),
      I3 => \active_period_count_reg[31]_0\(24),
      I4 => \active_period_count_reg[31]_0\(0),
      I5 => \active_period_count[31]_i_14_n_0\,
      O => \active_period_count[31]_i_6_n_0\
    );
\active_period_count[31]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \active_period_ticks_reg[31]_0\(21),
      I1 => \active_period_ticks_reg[31]_0\(20),
      I2 => \active_period_ticks_reg[31]_0\(23),
      I3 => \active_period_ticks_reg[31]_0\(22),
      O => \active_period_count[31]_i_7_n_0\
    );
\active_period_count[31]_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \active_period_ticks_reg[31]_0\(24),
      I1 => \active_period_ticks_reg[31]_0\(27),
      I2 => \active_period_ticks_reg[31]_0\(25),
      I3 => \active_period_ticks_reg[31]_0\(26),
      I4 => \active_period_count[31]_i_15_n_0\,
      O => \active_period_count[31]_i_8_n_0\
    );
\active_period_count[31]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \active_period_ticks_reg[31]_0\(6),
      I1 => \active_period_ticks_reg[31]_0\(5),
      I2 => \active_period_ticks_reg[31]_0\(7),
      I3 => \active_period_ticks_reg[31]_0\(4),
      O => \active_period_count[31]_i_9_n_0\
    );
\active_period_count_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_period_count_reg[31]_0\(0),
      Q => active_count(0),
      R => \^sr\(0)
    );
\active_period_count_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_period_count_reg[31]_0\(10),
      Q => active_count(10),
      R => \^sr\(0)
    );
\active_period_count_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_period_count_reg[31]_0\(11),
      Q => active_count(11),
      R => \^sr\(0)
    );
\active_period_count_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_period_count_reg[31]_0\(12),
      Q => active_count(12),
      R => \^sr\(0)
    );
\active_period_count_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_period_count_reg[31]_0\(13),
      Q => active_count(13),
      R => \^sr\(0)
    );
\active_period_count_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_period_count_reg[31]_0\(14),
      Q => active_count(14),
      R => \^sr\(0)
    );
\active_period_count_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_period_count_reg[31]_0\(15),
      Q => active_count(15),
      R => \^sr\(0)
    );
\active_period_count_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_period_count_reg[31]_0\(16),
      Q => active_count(16),
      R => \^sr\(0)
    );
\active_period_count_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_period_count_reg[31]_0\(17),
      Q => active_count(17),
      R => \^sr\(0)
    );
\active_period_count_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_period_count_reg[31]_0\(18),
      Q => active_count(18),
      R => \^sr\(0)
    );
\active_period_count_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_period_count_reg[31]_0\(19),
      Q => active_count(19),
      R => \^sr\(0)
    );
\active_period_count_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_period_count_reg[31]_0\(1),
      Q => active_count(1),
      R => \^sr\(0)
    );
\active_period_count_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_period_count_reg[31]_0\(20),
      Q => active_count(20),
      R => \^sr\(0)
    );
\active_period_count_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_period_count_reg[31]_0\(21),
      Q => active_count(21),
      R => \^sr\(0)
    );
\active_period_count_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_period_count_reg[31]_0\(22),
      Q => active_count(22),
      R => \^sr\(0)
    );
\active_period_count_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_period_count_reg[31]_0\(23),
      Q => active_count(23),
      R => \^sr\(0)
    );
\active_period_count_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_period_count_reg[31]_0\(24),
      Q => active_count(24),
      R => \^sr\(0)
    );
\active_period_count_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_period_count_reg[31]_0\(25),
      Q => active_count(25),
      R => \^sr\(0)
    );
\active_period_count_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_period_count_reg[31]_0\(26),
      Q => active_count(26),
      R => \^sr\(0)
    );
\active_period_count_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_period_count_reg[31]_0\(27),
      Q => active_count(27),
      R => \^sr\(0)
    );
\active_period_count_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_period_count_reg[31]_0\(28),
      Q => active_count(28),
      R => \^sr\(0)
    );
\active_period_count_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_period_count_reg[31]_0\(29),
      Q => active_count(29),
      R => \^sr\(0)
    );
\active_period_count_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_period_count_reg[31]_0\(2),
      Q => active_count(2),
      R => \^sr\(0)
    );
\active_period_count_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_period_count_reg[31]_0\(30),
      Q => active_count(30),
      R => \^sr\(0)
    );
\active_period_count_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_period_count_reg[31]_0\(31),
      Q => active_count(31),
      R => \^sr\(0)
    );
\active_period_count_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_period_count_reg[31]_0\(3),
      Q => active_count(3),
      R => \^sr\(0)
    );
\active_period_count_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_period_count_reg[31]_0\(4),
      Q => active_count(4),
      R => \^sr\(0)
    );
\active_period_count_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_period_count_reg[31]_0\(5),
      Q => active_count(5),
      R => \^sr\(0)
    );
\active_period_count_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_period_count_reg[31]_0\(6),
      Q => active_count(6),
      R => \^sr\(0)
    );
\active_period_count_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_period_count_reg[31]_0\(7),
      Q => active_count(7),
      R => \^sr\(0)
    );
\active_period_count_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_period_count_reg[31]_0\(8),
      Q => active_count(8),
      R => \^sr\(0)
    );
\active_period_count_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_period_count_reg[31]_0\(9),
      Q => active_count(9),
      R => \^sr\(0)
    );
\active_period_ticks_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_period_ticks_reg[31]_0\(0),
      Q => active_period(0),
      R => \^sr\(0)
    );
\active_period_ticks_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_period_ticks_reg[31]_0\(10),
      Q => active_period(10),
      R => \^sr\(0)
    );
\active_period_ticks_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_period_ticks_reg[31]_0\(11),
      Q => active_period(11),
      R => \^sr\(0)
    );
\active_period_ticks_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_period_ticks_reg[31]_0\(12),
      Q => active_period(12),
      R => \^sr\(0)
    );
\active_period_ticks_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_period_ticks_reg[31]_0\(13),
      Q => active_period(13),
      R => \^sr\(0)
    );
\active_period_ticks_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_period_ticks_reg[31]_0\(14),
      Q => active_period(14),
      R => \^sr\(0)
    );
\active_period_ticks_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_period_ticks_reg[31]_0\(15),
      Q => active_period(15),
      R => \^sr\(0)
    );
\active_period_ticks_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_period_ticks_reg[31]_0\(16),
      Q => active_period(16),
      R => \^sr\(0)
    );
\active_period_ticks_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_period_ticks_reg[31]_0\(17),
      Q => active_period(17),
      R => \^sr\(0)
    );
\active_period_ticks_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_period_ticks_reg[31]_0\(18),
      Q => active_period(18),
      R => \^sr\(0)
    );
\active_period_ticks_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_period_ticks_reg[31]_0\(19),
      Q => active_period(19),
      R => \^sr\(0)
    );
\active_period_ticks_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_period_ticks_reg[31]_0\(1),
      Q => active_period(1),
      R => \^sr\(0)
    );
\active_period_ticks_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_period_ticks_reg[31]_0\(20),
      Q => active_period(20),
      R => \^sr\(0)
    );
\active_period_ticks_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_period_ticks_reg[31]_0\(21),
      Q => active_period(21),
      R => \^sr\(0)
    );
\active_period_ticks_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_period_ticks_reg[31]_0\(22),
      Q => active_period(22),
      R => \^sr\(0)
    );
\active_period_ticks_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_period_ticks_reg[31]_0\(23),
      Q => active_period(23),
      R => \^sr\(0)
    );
\active_period_ticks_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_period_ticks_reg[31]_0\(24),
      Q => active_period(24),
      R => \^sr\(0)
    );
\active_period_ticks_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_period_ticks_reg[31]_0\(25),
      Q => active_period(25),
      R => \^sr\(0)
    );
\active_period_ticks_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_period_ticks_reg[31]_0\(26),
      Q => active_period(26),
      R => \^sr\(0)
    );
\active_period_ticks_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_period_ticks_reg[31]_0\(27),
      Q => active_period(27),
      R => \^sr\(0)
    );
\active_period_ticks_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_period_ticks_reg[31]_0\(28),
      Q => active_period(28),
      R => \^sr\(0)
    );
\active_period_ticks_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_period_ticks_reg[31]_0\(29),
      Q => active_period(29),
      R => \^sr\(0)
    );
\active_period_ticks_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_period_ticks_reg[31]_0\(2),
      Q => active_period(2),
      R => \^sr\(0)
    );
\active_period_ticks_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_period_ticks_reg[31]_0\(30),
      Q => active_period(30),
      R => \^sr\(0)
    );
\active_period_ticks_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_period_ticks_reg[31]_0\(31),
      Q => active_period(31),
      R => \^sr\(0)
    );
\active_period_ticks_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_period_ticks_reg[31]_0\(3),
      Q => active_period(3),
      R => \^sr\(0)
    );
\active_period_ticks_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_period_ticks_reg[31]_0\(4),
      Q => active_period(4),
      R => \^sr\(0)
    );
\active_period_ticks_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_period_ticks_reg[31]_0\(5),
      Q => active_period(5),
      R => \^sr\(0)
    );
\active_period_ticks_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_period_ticks_reg[31]_0\(6),
      Q => active_period(6),
      R => \^sr\(0)
    );
\active_period_ticks_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_period_ticks_reg[31]_0\(7),
      Q => active_period(7),
      R => \^sr\(0)
    );
\active_period_ticks_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_period_ticks_reg[31]_0\(8),
      Q => active_period(8),
      R => \^sr\(0)
    );
\active_period_ticks_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \active_period_count[31]_i_1_n_0\,
      D => \active_period_ticks_reg[31]_0\(9),
      Q => active_period(9),
      R => \^sr\(0)
    );
activity_INST_0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFEF"
    )
        port map (
      I0 => cfg_error_reg_0,
      I1 => \counter_reg[0]_0\,
      I2 => s_axi_aresetn,
      I3 => running,
      O => \^launch_valid_reg\
    );
burst_start_INST_0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0002"
    )
        port map (
      I0 => burst_start_INST_0_i_1_n_0,
      I1 => burst_start_INST_0_i_2_n_0,
      I2 => burst_start_INST_0_i_3_n_0,
      I3 => burst_start_INST_0_i_4_n_0,
      O => burst_start
    );
burst_start_INST_0_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => completed_count(22),
      I1 => completed_count(24),
      I2 => completed_count(6),
      I3 => completed_count(15),
      I4 => burst_start_INST_0_i_5_n_0,
      I5 => burst_start_INST_0_i_6_n_0,
      O => burst_start_INST_0_i_1_n_0
    );
burst_start_INST_0_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => completed_count(2),
      I1 => completed_count(30),
      I2 => completed_count(0),
      I3 => completed_count(5),
      I4 => burst_start_INST_0_i_7_n_0,
      O => burst_start_INST_0_i_2_n_0
    );
burst_start_INST_0_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => completed_count(13),
      I1 => completed_count(23),
      I2 => completed_count(10),
      I3 => completed_count(18),
      I4 => burst_start_INST_0_i_8_n_0,
      O => burst_start_INST_0_i_3_n_0
    );
burst_start_INST_0_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFEFF"
    )
        port map (
      I0 => completed_count(27),
      I1 => completed_count(11),
      I2 => completed_count(7),
      I3 => running,
      I4 => completed_count(20),
      I5 => completed_count(21),
      O => burst_start_INST_0_i_4_n_0
    );
burst_start_INST_0_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => completed_count(12),
      I1 => completed_count(4),
      I2 => completed_count(17),
      I3 => completed_count(9),
      O => burst_start_INST_0_i_5_n_0
    );
burst_start_INST_0_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => completed_count(25),
      I1 => completed_count(3),
      I2 => completed_count(26),
      I3 => completed_count(8),
      O => burst_start_INST_0_i_6_n_0
    );
burst_start_INST_0_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFEF"
    )
        port map (
      I0 => completed_count(19),
      I1 => completed_count(1),
      I2 => \^period_start\,
      I3 => completed_count(16),
      O => burst_start_INST_0_i_7_n_0
    );
burst_start_INST_0_i_8: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => completed_count(31),
      I1 => completed_count(29),
      I2 => completed_count(28),
      I3 => completed_count(14),
      O => burst_start_INST_0_i_8_n_0
    );
cancelled_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \counter_reg[0]_0\,
      I1 => running,
      I2 => s_axi_aresetn,
      O => cancelled_i_1_n_0
    );
cancelled_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => cancelled_i_1_n_0,
      Q => cancelled,
      R => '0'
    );
cancelled_sticky_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFB8FFFFFF0000"
    )
        port map (
      I0 => cancelled_sticky_reg,
      I1 => Q(1),
      I2 => done_sticky_i_3_n_0,
      I3 => done_sticky_reg_0,
      I4 => cancelled_sticky0,
      I5 => data1(1),
      O => \write_address_reg[3]_2\
    );
cancelled_sticky_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAA8AAAAAA"
    )
        port map (
      I0 => cancelled,
      I1 => \error_sticky_reg[1]_3\,
      I2 => \^launch_valid_reg\,
      I3 => \s_axi_bresp_reg[1]_0\,
      I4 => \error_sticky_reg[1]\,
      I5 => cancelled_sticky_reg_0,
      O => cancelled_sticky0
    );
cfg_error_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"04000000"
    )
        port map (
      I0 => running,
      I1 => s_axi_aresetn,
      I2 => \counter_reg[0]_0\,
      I3 => cfg_error_reg_0,
      I4 => cfg_error_i_2_n_0,
      O => cfg_error_i_1_n_0
    );
cfg_error_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"4F44FFFF"
    )
        port map (
      I0 => \active_period_count[31]_i_6_n_0\,
      I1 => \active_period_count[31]_i_5_n_0\,
      I2 => \active_period_count[31]_i_4_n_0\,
      I3 => \active_period_count[31]_i_3_n_0\,
      I4 => parameters_ok1,
      O => cfg_error_i_2_n_0
    );
cfg_error_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => cfg_error_i_1_n_0,
      Q => cfg_error,
      R => '0'
    );
\completed_periods[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \active_period_count[31]_i_1_n_0\,
      I1 => s_axi_aresetn,
      O => \completed_periods[0]_i_1_n_0\
    );
\completed_periods[0]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => \counter_reg[0]_0\,
      I1 => running,
      I2 => cycle_end0,
      O => \completed_periods[0]_i_2_n_0\
    );
\completed_periods[0]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => completed_count(0),
      O => running1(0)
    );
\completed_periods_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \completed_periods[0]_i_2_n_0\,
      D => \completed_periods_reg[0]_i_3_n_7\,
      Q => completed_count(0),
      R => \completed_periods[0]_i_1_n_0\
    );
\completed_periods_reg[0]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \completed_periods_reg[0]_i_3_n_0\,
      CO(2) => \completed_periods_reg[0]_i_3_n_1\,
      CO(1) => \completed_periods_reg[0]_i_3_n_2\,
      CO(0) => \completed_periods_reg[0]_i_3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \completed_periods_reg[0]_i_3_n_4\,
      O(2) => \completed_periods_reg[0]_i_3_n_5\,
      O(1) => \completed_periods_reg[0]_i_3_n_6\,
      O(0) => \completed_periods_reg[0]_i_3_n_7\,
      S(3 downto 1) => completed_count(3 downto 1),
      S(0) => running1(0)
    );
\completed_periods_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \completed_periods[0]_i_2_n_0\,
      D => \completed_periods_reg[8]_i_1_n_5\,
      Q => completed_count(10),
      R => \completed_periods[0]_i_1_n_0\
    );
\completed_periods_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \completed_periods[0]_i_2_n_0\,
      D => \completed_periods_reg[8]_i_1_n_4\,
      Q => completed_count(11),
      R => \completed_periods[0]_i_1_n_0\
    );
\completed_periods_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \completed_periods[0]_i_2_n_0\,
      D => \completed_periods_reg[12]_i_1_n_7\,
      Q => completed_count(12),
      R => \completed_periods[0]_i_1_n_0\
    );
\completed_periods_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \completed_periods_reg[8]_i_1_n_0\,
      CO(3) => \completed_periods_reg[12]_i_1_n_0\,
      CO(2) => \completed_periods_reg[12]_i_1_n_1\,
      CO(1) => \completed_periods_reg[12]_i_1_n_2\,
      CO(0) => \completed_periods_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \completed_periods_reg[12]_i_1_n_4\,
      O(2) => \completed_periods_reg[12]_i_1_n_5\,
      O(1) => \completed_periods_reg[12]_i_1_n_6\,
      O(0) => \completed_periods_reg[12]_i_1_n_7\,
      S(3 downto 0) => completed_count(15 downto 12)
    );
\completed_periods_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \completed_periods[0]_i_2_n_0\,
      D => \completed_periods_reg[12]_i_1_n_6\,
      Q => completed_count(13),
      R => \completed_periods[0]_i_1_n_0\
    );
\completed_periods_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \completed_periods[0]_i_2_n_0\,
      D => \completed_periods_reg[12]_i_1_n_5\,
      Q => completed_count(14),
      R => \completed_periods[0]_i_1_n_0\
    );
\completed_periods_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \completed_periods[0]_i_2_n_0\,
      D => \completed_periods_reg[12]_i_1_n_4\,
      Q => completed_count(15),
      R => \completed_periods[0]_i_1_n_0\
    );
\completed_periods_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \completed_periods[0]_i_2_n_0\,
      D => \completed_periods_reg[16]_i_1_n_7\,
      Q => completed_count(16),
      R => \completed_periods[0]_i_1_n_0\
    );
\completed_periods_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \completed_periods_reg[12]_i_1_n_0\,
      CO(3) => \completed_periods_reg[16]_i_1_n_0\,
      CO(2) => \completed_periods_reg[16]_i_1_n_1\,
      CO(1) => \completed_periods_reg[16]_i_1_n_2\,
      CO(0) => \completed_periods_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \completed_periods_reg[16]_i_1_n_4\,
      O(2) => \completed_periods_reg[16]_i_1_n_5\,
      O(1) => \completed_periods_reg[16]_i_1_n_6\,
      O(0) => \completed_periods_reg[16]_i_1_n_7\,
      S(3 downto 0) => completed_count(19 downto 16)
    );
\completed_periods_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \completed_periods[0]_i_2_n_0\,
      D => \completed_periods_reg[16]_i_1_n_6\,
      Q => completed_count(17),
      R => \completed_periods[0]_i_1_n_0\
    );
\completed_periods_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \completed_periods[0]_i_2_n_0\,
      D => \completed_periods_reg[16]_i_1_n_5\,
      Q => completed_count(18),
      R => \completed_periods[0]_i_1_n_0\
    );
\completed_periods_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \completed_periods[0]_i_2_n_0\,
      D => \completed_periods_reg[16]_i_1_n_4\,
      Q => completed_count(19),
      R => \completed_periods[0]_i_1_n_0\
    );
\completed_periods_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \completed_periods[0]_i_2_n_0\,
      D => \completed_periods_reg[0]_i_3_n_6\,
      Q => completed_count(1),
      R => \completed_periods[0]_i_1_n_0\
    );
\completed_periods_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \completed_periods[0]_i_2_n_0\,
      D => \completed_periods_reg[20]_i_1_n_7\,
      Q => completed_count(20),
      R => \completed_periods[0]_i_1_n_0\
    );
\completed_periods_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \completed_periods_reg[16]_i_1_n_0\,
      CO(3) => \completed_periods_reg[20]_i_1_n_0\,
      CO(2) => \completed_periods_reg[20]_i_1_n_1\,
      CO(1) => \completed_periods_reg[20]_i_1_n_2\,
      CO(0) => \completed_periods_reg[20]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \completed_periods_reg[20]_i_1_n_4\,
      O(2) => \completed_periods_reg[20]_i_1_n_5\,
      O(1) => \completed_periods_reg[20]_i_1_n_6\,
      O(0) => \completed_periods_reg[20]_i_1_n_7\,
      S(3 downto 0) => completed_count(23 downto 20)
    );
\completed_periods_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \completed_periods[0]_i_2_n_0\,
      D => \completed_periods_reg[20]_i_1_n_6\,
      Q => completed_count(21),
      R => \completed_periods[0]_i_1_n_0\
    );
\completed_periods_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \completed_periods[0]_i_2_n_0\,
      D => \completed_periods_reg[20]_i_1_n_5\,
      Q => completed_count(22),
      R => \completed_periods[0]_i_1_n_0\
    );
\completed_periods_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \completed_periods[0]_i_2_n_0\,
      D => \completed_periods_reg[20]_i_1_n_4\,
      Q => completed_count(23),
      R => \completed_periods[0]_i_1_n_0\
    );
\completed_periods_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \completed_periods[0]_i_2_n_0\,
      D => \completed_periods_reg[24]_i_1_n_7\,
      Q => completed_count(24),
      R => \completed_periods[0]_i_1_n_0\
    );
\completed_periods_reg[24]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \completed_periods_reg[20]_i_1_n_0\,
      CO(3) => \completed_periods_reg[24]_i_1_n_0\,
      CO(2) => \completed_periods_reg[24]_i_1_n_1\,
      CO(1) => \completed_periods_reg[24]_i_1_n_2\,
      CO(0) => \completed_periods_reg[24]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \completed_periods_reg[24]_i_1_n_4\,
      O(2) => \completed_periods_reg[24]_i_1_n_5\,
      O(1) => \completed_periods_reg[24]_i_1_n_6\,
      O(0) => \completed_periods_reg[24]_i_1_n_7\,
      S(3 downto 0) => completed_count(27 downto 24)
    );
\completed_periods_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \completed_periods[0]_i_2_n_0\,
      D => \completed_periods_reg[24]_i_1_n_6\,
      Q => completed_count(25),
      R => \completed_periods[0]_i_1_n_0\
    );
\completed_periods_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \completed_periods[0]_i_2_n_0\,
      D => \completed_periods_reg[24]_i_1_n_5\,
      Q => completed_count(26),
      R => \completed_periods[0]_i_1_n_0\
    );
\completed_periods_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \completed_periods[0]_i_2_n_0\,
      D => \completed_periods_reg[24]_i_1_n_4\,
      Q => completed_count(27),
      R => \completed_periods[0]_i_1_n_0\
    );
\completed_periods_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \completed_periods[0]_i_2_n_0\,
      D => \completed_periods_reg[28]_i_1_n_7\,
      Q => completed_count(28),
      R => \completed_periods[0]_i_1_n_0\
    );
\completed_periods_reg[28]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \completed_periods_reg[24]_i_1_n_0\,
      CO(3) => \NLW_completed_periods_reg[28]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \completed_periods_reg[28]_i_1_n_1\,
      CO(1) => \completed_periods_reg[28]_i_1_n_2\,
      CO(0) => \completed_periods_reg[28]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \completed_periods_reg[28]_i_1_n_4\,
      O(2) => \completed_periods_reg[28]_i_1_n_5\,
      O(1) => \completed_periods_reg[28]_i_1_n_6\,
      O(0) => \completed_periods_reg[28]_i_1_n_7\,
      S(3 downto 0) => completed_count(31 downto 28)
    );
\completed_periods_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \completed_periods[0]_i_2_n_0\,
      D => \completed_periods_reg[28]_i_1_n_6\,
      Q => completed_count(29),
      R => \completed_periods[0]_i_1_n_0\
    );
\completed_periods_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \completed_periods[0]_i_2_n_0\,
      D => \completed_periods_reg[0]_i_3_n_5\,
      Q => completed_count(2),
      R => \completed_periods[0]_i_1_n_0\
    );
\completed_periods_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \completed_periods[0]_i_2_n_0\,
      D => \completed_periods_reg[28]_i_1_n_5\,
      Q => completed_count(30),
      R => \completed_periods[0]_i_1_n_0\
    );
\completed_periods_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \completed_periods[0]_i_2_n_0\,
      D => \completed_periods_reg[28]_i_1_n_4\,
      Q => completed_count(31),
      R => \completed_periods[0]_i_1_n_0\
    );
\completed_periods_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \completed_periods[0]_i_2_n_0\,
      D => \completed_periods_reg[0]_i_3_n_4\,
      Q => completed_count(3),
      R => \completed_periods[0]_i_1_n_0\
    );
\completed_periods_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \completed_periods[0]_i_2_n_0\,
      D => \completed_periods_reg[4]_i_1_n_7\,
      Q => completed_count(4),
      R => \completed_periods[0]_i_1_n_0\
    );
\completed_periods_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \completed_periods_reg[0]_i_3_n_0\,
      CO(3) => \completed_periods_reg[4]_i_1_n_0\,
      CO(2) => \completed_periods_reg[4]_i_1_n_1\,
      CO(1) => \completed_periods_reg[4]_i_1_n_2\,
      CO(0) => \completed_periods_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \completed_periods_reg[4]_i_1_n_4\,
      O(2) => \completed_periods_reg[4]_i_1_n_5\,
      O(1) => \completed_periods_reg[4]_i_1_n_6\,
      O(0) => \completed_periods_reg[4]_i_1_n_7\,
      S(3 downto 0) => completed_count(7 downto 4)
    );
\completed_periods_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \completed_periods[0]_i_2_n_0\,
      D => \completed_periods_reg[4]_i_1_n_6\,
      Q => completed_count(5),
      R => \completed_periods[0]_i_1_n_0\
    );
\completed_periods_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \completed_periods[0]_i_2_n_0\,
      D => \completed_periods_reg[4]_i_1_n_5\,
      Q => completed_count(6),
      R => \completed_periods[0]_i_1_n_0\
    );
\completed_periods_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \completed_periods[0]_i_2_n_0\,
      D => \completed_periods_reg[4]_i_1_n_4\,
      Q => completed_count(7),
      R => \completed_periods[0]_i_1_n_0\
    );
\completed_periods_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \completed_periods[0]_i_2_n_0\,
      D => \completed_periods_reg[8]_i_1_n_7\,
      Q => completed_count(8),
      R => \completed_periods[0]_i_1_n_0\
    );
\completed_periods_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \completed_periods_reg[4]_i_1_n_0\,
      CO(3) => \completed_periods_reg[8]_i_1_n_0\,
      CO(2) => \completed_periods_reg[8]_i_1_n_1\,
      CO(1) => \completed_periods_reg[8]_i_1_n_2\,
      CO(0) => \completed_periods_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \completed_periods_reg[8]_i_1_n_4\,
      O(2) => \completed_periods_reg[8]_i_1_n_5\,
      O(1) => \completed_periods_reg[8]_i_1_n_6\,
      O(0) => \completed_periods_reg[8]_i_1_n_7\,
      S(3 downto 0) => completed_count(11 downto 8)
    );
\completed_periods_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \completed_periods[0]_i_2_n_0\,
      D => \completed_periods_reg[8]_i_1_n_6\,
      Q => completed_count(9),
      R => \completed_periods[0]_i_1_n_0\
    );
\counter[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0ECFFFF"
    )
        port map (
      I0 => cycle_end0,
      I1 => \active_period_count[31]_i_1_n_0\,
      I2 => running,
      I3 => \counter_reg[0]_0\,
      I4 => s_axi_aresetn,
      O => \counter[0]_i_1_n_0\
    );
\counter[0]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => \active_period_count[31]_i_1_n_0\,
      I1 => \counter_reg[0]_0\,
      I2 => running,
      O => pwm_out5_out
    );
\counter[0]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => counter_reg(0),
      O => p_0_in(0)
    );
\counter_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => pwm_out5_out,
      D => \counter_reg[0]_i_3_n_7\,
      Q => counter_reg(0),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[0]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \counter_reg[0]_i_3_n_0\,
      CO(2) => \counter_reg[0]_i_3_n_1\,
      CO(1) => \counter_reg[0]_i_3_n_2\,
      CO(0) => \counter_reg[0]_i_3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \counter_reg[0]_i_3_n_4\,
      O(2) => \counter_reg[0]_i_3_n_5\,
      O(1) => \counter_reg[0]_i_3_n_6\,
      O(0) => \counter_reg[0]_i_3_n_7\,
      S(3 downto 1) => counter_reg(3 downto 1),
      S(0) => p_0_in(0)
    );
\counter_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => pwm_out5_out,
      D => \counter_reg[8]_i_1_n_5\,
      Q => counter_reg(10),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => pwm_out5_out,
      D => \counter_reg[8]_i_1_n_4\,
      Q => counter_reg(11),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => pwm_out5_out,
      D => \counter_reg[12]_i_1_n_7\,
      Q => counter_reg(12),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[8]_i_1_n_0\,
      CO(3) => \counter_reg[12]_i_1_n_0\,
      CO(2) => \counter_reg[12]_i_1_n_1\,
      CO(1) => \counter_reg[12]_i_1_n_2\,
      CO(0) => \counter_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[12]_i_1_n_4\,
      O(2) => \counter_reg[12]_i_1_n_5\,
      O(1) => \counter_reg[12]_i_1_n_6\,
      O(0) => \counter_reg[12]_i_1_n_7\,
      S(3 downto 0) => counter_reg(15 downto 12)
    );
\counter_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => pwm_out5_out,
      D => \counter_reg[12]_i_1_n_6\,
      Q => counter_reg(13),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => pwm_out5_out,
      D => \counter_reg[12]_i_1_n_5\,
      Q => counter_reg(14),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => pwm_out5_out,
      D => \counter_reg[12]_i_1_n_4\,
      Q => counter_reg(15),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => pwm_out5_out,
      D => \counter_reg[16]_i_1_n_7\,
      Q => counter_reg(16),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[12]_i_1_n_0\,
      CO(3) => \counter_reg[16]_i_1_n_0\,
      CO(2) => \counter_reg[16]_i_1_n_1\,
      CO(1) => \counter_reg[16]_i_1_n_2\,
      CO(0) => \counter_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[16]_i_1_n_4\,
      O(2) => \counter_reg[16]_i_1_n_5\,
      O(1) => \counter_reg[16]_i_1_n_6\,
      O(0) => \counter_reg[16]_i_1_n_7\,
      S(3 downto 0) => counter_reg(19 downto 16)
    );
\counter_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => pwm_out5_out,
      D => \counter_reg[16]_i_1_n_6\,
      Q => counter_reg(17),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => pwm_out5_out,
      D => \counter_reg[16]_i_1_n_5\,
      Q => counter_reg(18),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => pwm_out5_out,
      D => \counter_reg[16]_i_1_n_4\,
      Q => counter_reg(19),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => pwm_out5_out,
      D => \counter_reg[0]_i_3_n_6\,
      Q => counter_reg(1),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => pwm_out5_out,
      D => \counter_reg[20]_i_1_n_7\,
      Q => counter_reg(20),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[16]_i_1_n_0\,
      CO(3) => \counter_reg[20]_i_1_n_0\,
      CO(2) => \counter_reg[20]_i_1_n_1\,
      CO(1) => \counter_reg[20]_i_1_n_2\,
      CO(0) => \counter_reg[20]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[20]_i_1_n_4\,
      O(2) => \counter_reg[20]_i_1_n_5\,
      O(1) => \counter_reg[20]_i_1_n_6\,
      O(0) => \counter_reg[20]_i_1_n_7\,
      S(3 downto 0) => counter_reg(23 downto 20)
    );
\counter_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => pwm_out5_out,
      D => \counter_reg[20]_i_1_n_6\,
      Q => counter_reg(21),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => pwm_out5_out,
      D => \counter_reg[20]_i_1_n_5\,
      Q => counter_reg(22),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => pwm_out5_out,
      D => \counter_reg[20]_i_1_n_4\,
      Q => counter_reg(23),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => pwm_out5_out,
      D => \counter_reg[24]_i_1_n_7\,
      Q => counter_reg(24),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[24]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[20]_i_1_n_0\,
      CO(3) => \counter_reg[24]_i_1_n_0\,
      CO(2) => \counter_reg[24]_i_1_n_1\,
      CO(1) => \counter_reg[24]_i_1_n_2\,
      CO(0) => \counter_reg[24]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[24]_i_1_n_4\,
      O(2) => \counter_reg[24]_i_1_n_5\,
      O(1) => \counter_reg[24]_i_1_n_6\,
      O(0) => \counter_reg[24]_i_1_n_7\,
      S(3 downto 0) => counter_reg(27 downto 24)
    );
\counter_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => pwm_out5_out,
      D => \counter_reg[24]_i_1_n_6\,
      Q => counter_reg(25),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => pwm_out5_out,
      D => \counter_reg[24]_i_1_n_5\,
      Q => counter_reg(26),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => pwm_out5_out,
      D => \counter_reg[24]_i_1_n_4\,
      Q => counter_reg(27),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => pwm_out5_out,
      D => \counter_reg[28]_i_1_n_7\,
      Q => counter_reg(28),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[28]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[24]_i_1_n_0\,
      CO(3) => \NLW_counter_reg[28]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \counter_reg[28]_i_1_n_1\,
      CO(1) => \counter_reg[28]_i_1_n_2\,
      CO(0) => \counter_reg[28]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[28]_i_1_n_4\,
      O(2) => \counter_reg[28]_i_1_n_5\,
      O(1) => \counter_reg[28]_i_1_n_6\,
      O(0) => \counter_reg[28]_i_1_n_7\,
      S(3 downto 0) => counter_reg(31 downto 28)
    );
\counter_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => pwm_out5_out,
      D => \counter_reg[28]_i_1_n_6\,
      Q => counter_reg(29),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => pwm_out5_out,
      D => \counter_reg[0]_i_3_n_5\,
      Q => counter_reg(2),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => pwm_out5_out,
      D => \counter_reg[28]_i_1_n_5\,
      Q => counter_reg(30),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => pwm_out5_out,
      D => \counter_reg[28]_i_1_n_4\,
      Q => counter_reg(31),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => pwm_out5_out,
      D => \counter_reg[0]_i_3_n_4\,
      Q => counter_reg(3),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => pwm_out5_out,
      D => \counter_reg[4]_i_1_n_7\,
      Q => counter_reg(4),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[0]_i_3_n_0\,
      CO(3) => \counter_reg[4]_i_1_n_0\,
      CO(2) => \counter_reg[4]_i_1_n_1\,
      CO(1) => \counter_reg[4]_i_1_n_2\,
      CO(0) => \counter_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[4]_i_1_n_4\,
      O(2) => \counter_reg[4]_i_1_n_5\,
      O(1) => \counter_reg[4]_i_1_n_6\,
      O(0) => \counter_reg[4]_i_1_n_7\,
      S(3 downto 0) => counter_reg(7 downto 4)
    );
\counter_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => pwm_out5_out,
      D => \counter_reg[4]_i_1_n_6\,
      Q => counter_reg(5),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => pwm_out5_out,
      D => \counter_reg[4]_i_1_n_5\,
      Q => counter_reg(6),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => pwm_out5_out,
      D => \counter_reg[4]_i_1_n_4\,
      Q => counter_reg(7),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => pwm_out5_out,
      D => \counter_reg[8]_i_1_n_7\,
      Q => counter_reg(8),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[4]_i_1_n_0\,
      CO(3) => \counter_reg[8]_i_1_n_0\,
      CO(2) => \counter_reg[8]_i_1_n_1\,
      CO(1) => \counter_reg[8]_i_1_n_2\,
      CO(0) => \counter_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[8]_i_1_n_4\,
      O(2) => \counter_reg[8]_i_1_n_5\,
      O(1) => \counter_reg[8]_i_1_n_6\,
      O(0) => \counter_reg[8]_i_1_n_7\,
      S(3 downto 0) => counter_reg(11 downto 8)
    );
\counter_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => pwm_out5_out,
      D => \counter_reg[8]_i_1_n_6\,
      Q => counter_reg(9),
      R => \counter[0]_i_1_n_0\
    );
cycle_end0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => cycle_end0_carry_n_0,
      CO(2) => cycle_end0_carry_n_1,
      CO(1) => cycle_end0_carry_n_2,
      CO(0) => cycle_end0_carry_n_3,
      CYINIT => '1',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => NLW_cycle_end0_carry_O_UNCONNECTED(3 downto 0),
      S(3) => cycle_end0_carry_i_1_n_0,
      S(2) => cycle_end0_carry_i_2_n_0,
      S(1) => cycle_end0_carry_i_3_n_0,
      S(0) => cycle_end0_carry_i_4_n_0
    );
\cycle_end0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => cycle_end0_carry_n_0,
      CO(3) => \cycle_end0_carry__0_n_0\,
      CO(2) => \cycle_end0_carry__0_n_1\,
      CO(1) => \cycle_end0_carry__0_n_2\,
      CO(0) => \cycle_end0_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_cycle_end0_carry__0_O_UNCONNECTED\(3 downto 0),
      S(3) => \cycle_end0_carry__0_i_1_n_0\,
      S(2) => \cycle_end0_carry__0_i_2_n_0\,
      S(1) => \cycle_end0_carry__0_i_3_n_0\,
      S(0) => \cycle_end0_carry__0_i_4_n_0\
    );
\cycle_end0_carry__0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => counter_reg(22),
      I1 => cycle_end1(22),
      I2 => counter_reg(21),
      I3 => cycle_end1(21),
      I4 => cycle_end1(23),
      I5 => counter_reg(23),
      O => \cycle_end0_carry__0_i_1_n_0\
    );
\cycle_end0_carry__0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => counter_reg(19),
      I1 => cycle_end1(19),
      I2 => counter_reg(18),
      I3 => cycle_end1(18),
      I4 => cycle_end1(20),
      I5 => counter_reg(20),
      O => \cycle_end0_carry__0_i_2_n_0\
    );
\cycle_end0_carry__0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => counter_reg(16),
      I1 => cycle_end1(16),
      I2 => counter_reg(15),
      I3 => cycle_end1(15),
      I4 => cycle_end1(17),
      I5 => counter_reg(17),
      O => \cycle_end0_carry__0_i_3_n_0\
    );
\cycle_end0_carry__0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => counter_reg(12),
      I1 => cycle_end1(12),
      I2 => counter_reg(13),
      I3 => cycle_end1(13),
      I4 => cycle_end1(14),
      I5 => counter_reg(14),
      O => \cycle_end0_carry__0_i_4_n_0\
    );
\cycle_end0_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \cycle_end0_carry__0_n_0\,
      CO(3) => \NLW_cycle_end0_carry__1_CO_UNCONNECTED\(3),
      CO(2) => cycle_end0,
      CO(1) => \cycle_end0_carry__1_n_2\,
      CO(0) => \cycle_end0_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_cycle_end0_carry__1_O_UNCONNECTED\(3 downto 0),
      S(3) => '0',
      S(2) => \cycle_end0_carry__1_i_1_n_0\,
      S(1) => \cycle_end0_carry__1_i_2_n_0\,
      S(0) => \cycle_end0_carry__1_i_3_n_0\
    );
\cycle_end0_carry__1_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => cycle_end1(31),
      I1 => counter_reg(31),
      I2 => cycle_end1(30),
      I3 => counter_reg(30),
      O => \cycle_end0_carry__1_i_1_n_0\
    );
\cycle_end0_carry__1_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => counter_reg(27),
      I1 => cycle_end1(27),
      I2 => counter_reg(28),
      I3 => cycle_end1(28),
      I4 => cycle_end1(29),
      I5 => counter_reg(29),
      O => \cycle_end0_carry__1_i_2_n_0\
    );
\cycle_end0_carry__1_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => counter_reg(24),
      I1 => cycle_end1(24),
      I2 => counter_reg(25),
      I3 => cycle_end1(25),
      I4 => cycle_end1(26),
      I5 => counter_reg(26),
      O => \cycle_end0_carry__1_i_3_n_0\
    );
cycle_end0_carry_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => counter_reg(9),
      I1 => cycle_end1(9),
      I2 => counter_reg(10),
      I3 => cycle_end1(10),
      I4 => cycle_end1(11),
      I5 => counter_reg(11),
      O => cycle_end0_carry_i_1_n_0
    );
cycle_end0_carry_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => counter_reg(6),
      I1 => cycle_end1(6),
      I2 => counter_reg(7),
      I3 => cycle_end1(7),
      I4 => cycle_end1(8),
      I5 => counter_reg(8),
      O => cycle_end0_carry_i_2_n_0
    );
cycle_end0_carry_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => counter_reg(3),
      I1 => cycle_end1(3),
      I2 => counter_reg(4),
      I3 => cycle_end1(4),
      I4 => cycle_end1(5),
      I5 => counter_reg(5),
      O => cycle_end0_carry_i_3_n_0
    );
cycle_end0_carry_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0990000000000990"
    )
        port map (
      I0 => counter_reg(1),
      I1 => cycle_end1(1),
      I2 => counter_reg(0),
      I3 => active_period(0),
      I4 => cycle_end1(2),
      I5 => counter_reg(2),
      O => cycle_end0_carry_i_4_n_0
    );
cycle_end1_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => cycle_end1_carry_n_0,
      CO(2) => cycle_end1_carry_n_1,
      CO(1) => cycle_end1_carry_n_2,
      CO(0) => cycle_end1_carry_n_3,
      CYINIT => active_period(0),
      DI(3 downto 0) => active_period(4 downto 1),
      O(3 downto 0) => cycle_end1(4 downto 1),
      S(3) => cycle_end1_carry_i_1_n_0,
      S(2) => cycle_end1_carry_i_2_n_0,
      S(1) => cycle_end1_carry_i_3_n_0,
      S(0) => cycle_end1_carry_i_4_n_0
    );
\cycle_end1_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => cycle_end1_carry_n_0,
      CO(3) => \cycle_end1_carry__0_n_0\,
      CO(2) => \cycle_end1_carry__0_n_1\,
      CO(1) => \cycle_end1_carry__0_n_2\,
      CO(0) => \cycle_end1_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => active_period(8 downto 5),
      O(3 downto 0) => cycle_end1(8 downto 5),
      S(3) => \cycle_end1_carry__0_i_1_n_0\,
      S(2) => \cycle_end1_carry__0_i_2_n_0\,
      S(1) => \cycle_end1_carry__0_i_3_n_0\,
      S(0) => \cycle_end1_carry__0_i_4_n_0\
    );
\cycle_end1_carry__0_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => active_period(8),
      O => \cycle_end1_carry__0_i_1_n_0\
    );
\cycle_end1_carry__0_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => active_period(7),
      O => \cycle_end1_carry__0_i_2_n_0\
    );
\cycle_end1_carry__0_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => active_period(6),
      O => \cycle_end1_carry__0_i_3_n_0\
    );
\cycle_end1_carry__0_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => active_period(5),
      O => \cycle_end1_carry__0_i_4_n_0\
    );
\cycle_end1_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \cycle_end1_carry__0_n_0\,
      CO(3) => \cycle_end1_carry__1_n_0\,
      CO(2) => \cycle_end1_carry__1_n_1\,
      CO(1) => \cycle_end1_carry__1_n_2\,
      CO(0) => \cycle_end1_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => active_period(12 downto 9),
      O(3 downto 0) => cycle_end1(12 downto 9),
      S(3) => \cycle_end1_carry__1_i_1_n_0\,
      S(2) => \cycle_end1_carry__1_i_2_n_0\,
      S(1) => \cycle_end1_carry__1_i_3_n_0\,
      S(0) => \cycle_end1_carry__1_i_4_n_0\
    );
\cycle_end1_carry__1_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => active_period(12),
      O => \cycle_end1_carry__1_i_1_n_0\
    );
\cycle_end1_carry__1_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => active_period(11),
      O => \cycle_end1_carry__1_i_2_n_0\
    );
\cycle_end1_carry__1_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => active_period(10),
      O => \cycle_end1_carry__1_i_3_n_0\
    );
\cycle_end1_carry__1_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => active_period(9),
      O => \cycle_end1_carry__1_i_4_n_0\
    );
\cycle_end1_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \cycle_end1_carry__1_n_0\,
      CO(3) => \cycle_end1_carry__2_n_0\,
      CO(2) => \cycle_end1_carry__2_n_1\,
      CO(1) => \cycle_end1_carry__2_n_2\,
      CO(0) => \cycle_end1_carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => active_period(16 downto 13),
      O(3 downto 0) => cycle_end1(16 downto 13),
      S(3) => \cycle_end1_carry__2_i_1_n_0\,
      S(2) => \cycle_end1_carry__2_i_2_n_0\,
      S(1) => \cycle_end1_carry__2_i_3_n_0\,
      S(0) => \cycle_end1_carry__2_i_4_n_0\
    );
\cycle_end1_carry__2_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => active_period(16),
      O => \cycle_end1_carry__2_i_1_n_0\
    );
\cycle_end1_carry__2_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => active_period(15),
      O => \cycle_end1_carry__2_i_2_n_0\
    );
\cycle_end1_carry__2_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => active_period(14),
      O => \cycle_end1_carry__2_i_3_n_0\
    );
\cycle_end1_carry__2_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => active_period(13),
      O => \cycle_end1_carry__2_i_4_n_0\
    );
\cycle_end1_carry__3\: unisim.vcomponents.CARRY4
     port map (
      CI => \cycle_end1_carry__2_n_0\,
      CO(3) => \cycle_end1_carry__3_n_0\,
      CO(2) => \cycle_end1_carry__3_n_1\,
      CO(1) => \cycle_end1_carry__3_n_2\,
      CO(0) => \cycle_end1_carry__3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => active_period(20 downto 17),
      O(3 downto 0) => cycle_end1(20 downto 17),
      S(3) => \cycle_end1_carry__3_i_1_n_0\,
      S(2) => \cycle_end1_carry__3_i_2_n_0\,
      S(1) => \cycle_end1_carry__3_i_3_n_0\,
      S(0) => \cycle_end1_carry__3_i_4_n_0\
    );
\cycle_end1_carry__3_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => active_period(20),
      O => \cycle_end1_carry__3_i_1_n_0\
    );
\cycle_end1_carry__3_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => active_period(19),
      O => \cycle_end1_carry__3_i_2_n_0\
    );
\cycle_end1_carry__3_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => active_period(18),
      O => \cycle_end1_carry__3_i_3_n_0\
    );
\cycle_end1_carry__3_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => active_period(17),
      O => \cycle_end1_carry__3_i_4_n_0\
    );
\cycle_end1_carry__4\: unisim.vcomponents.CARRY4
     port map (
      CI => \cycle_end1_carry__3_n_0\,
      CO(3) => \cycle_end1_carry__4_n_0\,
      CO(2) => \cycle_end1_carry__4_n_1\,
      CO(1) => \cycle_end1_carry__4_n_2\,
      CO(0) => \cycle_end1_carry__4_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => active_period(24 downto 21),
      O(3 downto 0) => cycle_end1(24 downto 21),
      S(3) => \cycle_end1_carry__4_i_1_n_0\,
      S(2) => \cycle_end1_carry__4_i_2_n_0\,
      S(1) => \cycle_end1_carry__4_i_3_n_0\,
      S(0) => \cycle_end1_carry__4_i_4_n_0\
    );
\cycle_end1_carry__4_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => active_period(24),
      O => \cycle_end1_carry__4_i_1_n_0\
    );
\cycle_end1_carry__4_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => active_period(23),
      O => \cycle_end1_carry__4_i_2_n_0\
    );
\cycle_end1_carry__4_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => active_period(22),
      O => \cycle_end1_carry__4_i_3_n_0\
    );
\cycle_end1_carry__4_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => active_period(21),
      O => \cycle_end1_carry__4_i_4_n_0\
    );
\cycle_end1_carry__5\: unisim.vcomponents.CARRY4
     port map (
      CI => \cycle_end1_carry__4_n_0\,
      CO(3) => \cycle_end1_carry__5_n_0\,
      CO(2) => \cycle_end1_carry__5_n_1\,
      CO(1) => \cycle_end1_carry__5_n_2\,
      CO(0) => \cycle_end1_carry__5_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => active_period(28 downto 25),
      O(3 downto 0) => cycle_end1(28 downto 25),
      S(3) => \cycle_end1_carry__5_i_1_n_0\,
      S(2) => \cycle_end1_carry__5_i_2_n_0\,
      S(1) => \cycle_end1_carry__5_i_3_n_0\,
      S(0) => \cycle_end1_carry__5_i_4_n_0\
    );
\cycle_end1_carry__5_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => active_period(28),
      O => \cycle_end1_carry__5_i_1_n_0\
    );
\cycle_end1_carry__5_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => active_period(27),
      O => \cycle_end1_carry__5_i_2_n_0\
    );
\cycle_end1_carry__5_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => active_period(26),
      O => \cycle_end1_carry__5_i_3_n_0\
    );
\cycle_end1_carry__5_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => active_period(25),
      O => \cycle_end1_carry__5_i_4_n_0\
    );
\cycle_end1_carry__6\: unisim.vcomponents.CARRY4
     port map (
      CI => \cycle_end1_carry__5_n_0\,
      CO(3 downto 2) => \NLW_cycle_end1_carry__6_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \cycle_end1_carry__6_n_2\,
      CO(0) => \cycle_end1_carry__6_n_3\,
      CYINIT => '0',
      DI(3 downto 2) => B"00",
      DI(1 downto 0) => active_period(30 downto 29),
      O(3) => \NLW_cycle_end1_carry__6_O_UNCONNECTED\(3),
      O(2 downto 0) => cycle_end1(31 downto 29),
      S(3) => '0',
      S(2) => \cycle_end1_carry__6_i_1_n_0\,
      S(1) => \cycle_end1_carry__6_i_2_n_0\,
      S(0) => \cycle_end1_carry__6_i_3_n_0\
    );
\cycle_end1_carry__6_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => active_period(31),
      O => \cycle_end1_carry__6_i_1_n_0\
    );
\cycle_end1_carry__6_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => active_period(30),
      O => \cycle_end1_carry__6_i_2_n_0\
    );
\cycle_end1_carry__6_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => active_period(29),
      O => \cycle_end1_carry__6_i_3_n_0\
    );
cycle_end1_carry_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => active_period(4),
      O => cycle_end1_carry_i_1_n_0
    );
cycle_end1_carry_i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => active_period(3),
      O => cycle_end1_carry_i_2_n_0
    );
cycle_end1_carry_i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => active_period(2),
      O => cycle_end1_carry_i_3_n_0
    );
cycle_end1_carry_i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => active_period(1),
      O => cycle_end1_carry_i_4_n_0
    );
done_event_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"40000000"
    )
        port map (
      I0 => \counter_reg[0]_0\,
      I1 => running0,
      I2 => cycle_end0,
      I3 => running,
      I4 => s_axi_aresetn,
      O => done_event_i_1_n_0
    );
done_event_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => done_event_i_1_n_0,
      Q => \^done_event\,
      R => '0'
    );
done_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0444044404040000"
    )
        port map (
      I0 => \active_period_count[31]_i_1_n_0\,
      I1 => s_axi_aresetn,
      I2 => \counter_reg[0]_0\,
      I3 => running,
      I4 => pwm_out_i_5_n_0,
      I5 => done,
      O => done_i_1_n_0
    );
done_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => done_i_1_n_0,
      Q => done,
      R => '0'
    );
done_sticky_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFB8FFFFFF0000"
    )
        port map (
      I0 => done_sticky_reg,
      I1 => Q(1),
      I2 => done_sticky_i_3_n_0,
      I3 => done_sticky_reg_0,
      I4 => done_sticky0,
      I5 => data1(0),
      O => \write_address_reg[3]_1\
    );
done_sticky_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFEF"
    )
        port map (
      I0 => cfg_error_reg_0,
      I1 => \counter_reg[0]_0\,
      I2 => s_axi_aresetn,
      I3 => running,
      I4 => \error_sticky_reg[1]_3\,
      I5 => \launch_count_reg[0]_0\,
      O => done_sticky_i_3_n_0
    );
done_sticky_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAA8AAAAAA"
    )
        port map (
      I0 => \^done_event\,
      I1 => \error_sticky_reg[1]_3\,
      I2 => \^launch_valid_reg\,
      I3 => \s_axi_bresp_reg[1]_0\,
      I4 => \error_sticky_reg[1]\,
      I5 => cancelled_sticky_reg_0,
      O => done_sticky0
    );
\error_sticky[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF70FFFFFF500000"
    )
        port map (
      I0 => Q(1),
      I1 => \error_sticky_reg[2]\(1),
      I2 => \error_sticky_reg[1]\,
      I3 => cfg_error,
      I4 => \error_sticky[1]_i_2_n_0\,
      I5 => \error_sticky_reg[1]_0\,
      O => \write_address_reg[3]\
    );
\error_sticky[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF7500"
    )
        port map (
      I0 => \error_sticky_reg[1]_1\,
      I1 => \error_sticky_reg[1]_2\,
      I2 => \error_sticky_reg[1]_3\,
      I3 => \error_sticky_reg[1]_4\,
      I4 => cfg_error,
      O => \error_sticky[1]_i_2_n_0\
    );
\error_sticky[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2E00FFFF22000000"
    )
        port map (
      I0 => \^launch_valid_reg\,
      I1 => Q(1),
      I2 => \error_sticky_reg[2]\(2),
      I3 => \error_sticky_reg[1]\,
      I4 => \error_sticky[2]_i_2_n_0\,
      I5 => \error_sticky_reg[2]_0\,
      O => \write_address_reg[3]_0\
    );
\error_sticky[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0020AAAA"
    )
        port map (
      I0 => \error_sticky_reg[1]_4\,
      I1 => \error_sticky_reg[1]_2\,
      I2 => \^launch_valid_reg\,
      I3 => \error_sticky_reg[1]_3\,
      I4 => \error_sticky_reg[1]_1\,
      O => \error_sticky[2]_i_2_n_0\
    );
\launch_period[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000002000000000"
    )
        port map (
      I0 => address_pending0,
      I1 => done_sticky_i_3_n_0,
      I2 => Q(0),
      I3 => Q(2),
      I4 => \launch_count_reg[0]\,
      I5 => \error_sticky_reg[1]\,
      O => E(0)
    );
launch_valid_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"08000000"
    )
        port map (
      I0 => launch_valid_reg_0,
      I1 => Q(0),
      I2 => done_sticky_i_3_n_0,
      I3 => address_pending0,
      I4 => s_axi_aresetn,
      O => \write_address_reg[2]\
    );
parameters_ok1_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => parameters_ok1_carry_n_0,
      CO(2) => parameters_ok1_carry_n_1,
      CO(1) => parameters_ok1_carry_n_2,
      CO(0) => parameters_ok1_carry_n_3,
      CYINIT => '1',
      DI(3) => parameters_ok1_carry_i_1_n_0,
      DI(2) => parameters_ok1_carry_i_2_n_0,
      DI(1) => parameters_ok1_carry_i_3_n_0,
      DI(0) => parameters_ok1_carry_i_4_n_0,
      O(3 downto 0) => NLW_parameters_ok1_carry_O_UNCONNECTED(3 downto 0),
      S(3) => parameters_ok1_carry_i_5_n_0,
      S(2) => parameters_ok1_carry_i_6_n_0,
      S(1) => parameters_ok1_carry_i_7_n_0,
      S(0) => parameters_ok1_carry_i_8_n_0
    );
\parameters_ok1_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => parameters_ok1_carry_n_0,
      CO(3) => \parameters_ok1_carry__0_n_0\,
      CO(2) => \parameters_ok1_carry__0_n_1\,
      CO(1) => \parameters_ok1_carry__0_n_2\,
      CO(0) => \parameters_ok1_carry__0_n_3\,
      CYINIT => '0',
      DI(3) => \parameters_ok1_carry__0_i_1_n_0\,
      DI(2) => \parameters_ok1_carry__0_i_2_n_0\,
      DI(1) => \parameters_ok1_carry__0_i_3_n_0\,
      DI(0) => \parameters_ok1_carry__0_i_4_n_0\,
      O(3 downto 0) => \NLW_parameters_ok1_carry__0_O_UNCONNECTED\(3 downto 0),
      S(3) => \parameters_ok1_carry__0_i_5_n_0\,
      S(2) => \parameters_ok1_carry__0_i_6_n_0\,
      S(1) => \parameters_ok1_carry__0_i_7_n_0\,
      S(0) => \parameters_ok1_carry__0_i_8_n_0\
    );
\parameters_ok1_carry__0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => \active_period_ticks_reg[31]_0\(15),
      I1 => \active_high_ticks_reg[31]_0\(15),
      I2 => \active_period_ticks_reg[31]_0\(14),
      I3 => \active_high_ticks_reg[31]_0\(14),
      O => \parameters_ok1_carry__0_i_1_n_0\
    );
\parameters_ok1_carry__0_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => \active_period_ticks_reg[31]_0\(13),
      I1 => \active_high_ticks_reg[31]_0\(13),
      I2 => \active_period_ticks_reg[31]_0\(12),
      I3 => \active_high_ticks_reg[31]_0\(12),
      O => \parameters_ok1_carry__0_i_2_n_0\
    );
\parameters_ok1_carry__0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => \active_period_ticks_reg[31]_0\(11),
      I1 => \active_high_ticks_reg[31]_0\(11),
      I2 => \active_period_ticks_reg[31]_0\(10),
      I3 => \active_high_ticks_reg[31]_0\(10),
      O => \parameters_ok1_carry__0_i_3_n_0\
    );
\parameters_ok1_carry__0_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => \active_period_ticks_reg[31]_0\(9),
      I1 => \active_high_ticks_reg[31]_0\(9),
      I2 => \active_period_ticks_reg[31]_0\(8),
      I3 => \active_high_ticks_reg[31]_0\(8),
      O => \parameters_ok1_carry__0_i_4_n_0\
    );
\parameters_ok1_carry__0_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \active_high_ticks_reg[31]_0\(15),
      I1 => \active_period_ticks_reg[31]_0\(15),
      I2 => \active_high_ticks_reg[31]_0\(14),
      I3 => \active_period_ticks_reg[31]_0\(14),
      O => \parameters_ok1_carry__0_i_5_n_0\
    );
\parameters_ok1_carry__0_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \active_high_ticks_reg[31]_0\(13),
      I1 => \active_period_ticks_reg[31]_0\(13),
      I2 => \active_high_ticks_reg[31]_0\(12),
      I3 => \active_period_ticks_reg[31]_0\(12),
      O => \parameters_ok1_carry__0_i_6_n_0\
    );
\parameters_ok1_carry__0_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \active_high_ticks_reg[31]_0\(11),
      I1 => \active_period_ticks_reg[31]_0\(11),
      I2 => \active_high_ticks_reg[31]_0\(10),
      I3 => \active_period_ticks_reg[31]_0\(10),
      O => \parameters_ok1_carry__0_i_7_n_0\
    );
\parameters_ok1_carry__0_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \active_high_ticks_reg[31]_0\(9),
      I1 => \active_period_ticks_reg[31]_0\(9),
      I2 => \active_high_ticks_reg[31]_0\(8),
      I3 => \active_period_ticks_reg[31]_0\(8),
      O => \parameters_ok1_carry__0_i_8_n_0\
    );
\parameters_ok1_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \parameters_ok1_carry__0_n_0\,
      CO(3) => \parameters_ok1_carry__1_n_0\,
      CO(2) => \parameters_ok1_carry__1_n_1\,
      CO(1) => \parameters_ok1_carry__1_n_2\,
      CO(0) => \parameters_ok1_carry__1_n_3\,
      CYINIT => '0',
      DI(3) => \parameters_ok1_carry__1_i_1_n_0\,
      DI(2) => \parameters_ok1_carry__1_i_2_n_0\,
      DI(1) => \parameters_ok1_carry__1_i_3_n_0\,
      DI(0) => \parameters_ok1_carry__1_i_4_n_0\,
      O(3 downto 0) => \NLW_parameters_ok1_carry__1_O_UNCONNECTED\(3 downto 0),
      S(3) => \parameters_ok1_carry__1_i_5_n_0\,
      S(2) => \parameters_ok1_carry__1_i_6_n_0\,
      S(1) => \parameters_ok1_carry__1_i_7_n_0\,
      S(0) => \parameters_ok1_carry__1_i_8_n_0\
    );
\parameters_ok1_carry__1_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => \active_period_ticks_reg[31]_0\(23),
      I1 => \active_high_ticks_reg[31]_0\(23),
      I2 => \active_period_ticks_reg[31]_0\(22),
      I3 => \active_high_ticks_reg[31]_0\(22),
      O => \parameters_ok1_carry__1_i_1_n_0\
    );
\parameters_ok1_carry__1_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => \active_period_ticks_reg[31]_0\(21),
      I1 => \active_high_ticks_reg[31]_0\(21),
      I2 => \active_period_ticks_reg[31]_0\(20),
      I3 => \active_high_ticks_reg[31]_0\(20),
      O => \parameters_ok1_carry__1_i_2_n_0\
    );
\parameters_ok1_carry__1_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => \active_period_ticks_reg[31]_0\(19),
      I1 => \active_high_ticks_reg[31]_0\(19),
      I2 => \active_period_ticks_reg[31]_0\(18),
      I3 => \active_high_ticks_reg[31]_0\(18),
      O => \parameters_ok1_carry__1_i_3_n_0\
    );
\parameters_ok1_carry__1_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => \active_period_ticks_reg[31]_0\(17),
      I1 => \active_high_ticks_reg[31]_0\(17),
      I2 => \active_period_ticks_reg[31]_0\(16),
      I3 => \active_high_ticks_reg[31]_0\(16),
      O => \parameters_ok1_carry__1_i_4_n_0\
    );
\parameters_ok1_carry__1_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \active_high_ticks_reg[31]_0\(23),
      I1 => \active_period_ticks_reg[31]_0\(23),
      I2 => \active_high_ticks_reg[31]_0\(22),
      I3 => \active_period_ticks_reg[31]_0\(22),
      O => \parameters_ok1_carry__1_i_5_n_0\
    );
\parameters_ok1_carry__1_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \active_high_ticks_reg[31]_0\(21),
      I1 => \active_period_ticks_reg[31]_0\(21),
      I2 => \active_high_ticks_reg[31]_0\(20),
      I3 => \active_period_ticks_reg[31]_0\(20),
      O => \parameters_ok1_carry__1_i_6_n_0\
    );
\parameters_ok1_carry__1_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \active_high_ticks_reg[31]_0\(19),
      I1 => \active_period_ticks_reg[31]_0\(19),
      I2 => \active_high_ticks_reg[31]_0\(18),
      I3 => \active_period_ticks_reg[31]_0\(18),
      O => \parameters_ok1_carry__1_i_7_n_0\
    );
\parameters_ok1_carry__1_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \active_high_ticks_reg[31]_0\(17),
      I1 => \active_period_ticks_reg[31]_0\(17),
      I2 => \active_high_ticks_reg[31]_0\(16),
      I3 => \active_period_ticks_reg[31]_0\(16),
      O => \parameters_ok1_carry__1_i_8_n_0\
    );
\parameters_ok1_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \parameters_ok1_carry__1_n_0\,
      CO(3) => parameters_ok1,
      CO(2) => \parameters_ok1_carry__2_n_1\,
      CO(1) => \parameters_ok1_carry__2_n_2\,
      CO(0) => \parameters_ok1_carry__2_n_3\,
      CYINIT => '0',
      DI(3) => \parameters_ok1_carry__2_i_1_n_0\,
      DI(2) => \parameters_ok1_carry__2_i_2_n_0\,
      DI(1) => \parameters_ok1_carry__2_i_3_n_0\,
      DI(0) => \parameters_ok1_carry__2_i_4_n_0\,
      O(3 downto 0) => \NLW_parameters_ok1_carry__2_O_UNCONNECTED\(3 downto 0),
      S(3) => \parameters_ok1_carry__2_i_5_n_0\,
      S(2) => \parameters_ok1_carry__2_i_6_n_0\,
      S(1) => \parameters_ok1_carry__2_i_7_n_0\,
      S(0) => \parameters_ok1_carry__2_i_8_n_0\
    );
\parameters_ok1_carry__2_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => \active_period_ticks_reg[31]_0\(31),
      I1 => \active_high_ticks_reg[31]_0\(31),
      I2 => \active_period_ticks_reg[31]_0\(30),
      I3 => \active_high_ticks_reg[31]_0\(30),
      O => \parameters_ok1_carry__2_i_1_n_0\
    );
\parameters_ok1_carry__2_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => \active_period_ticks_reg[31]_0\(29),
      I1 => \active_high_ticks_reg[31]_0\(29),
      I2 => \active_period_ticks_reg[31]_0\(28),
      I3 => \active_high_ticks_reg[31]_0\(28),
      O => \parameters_ok1_carry__2_i_2_n_0\
    );
\parameters_ok1_carry__2_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => \active_period_ticks_reg[31]_0\(27),
      I1 => \active_high_ticks_reg[31]_0\(27),
      I2 => \active_period_ticks_reg[31]_0\(26),
      I3 => \active_high_ticks_reg[31]_0\(26),
      O => \parameters_ok1_carry__2_i_3_n_0\
    );
\parameters_ok1_carry__2_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => \active_period_ticks_reg[31]_0\(25),
      I1 => \active_high_ticks_reg[31]_0\(25),
      I2 => \active_period_ticks_reg[31]_0\(24),
      I3 => \active_high_ticks_reg[31]_0\(24),
      O => \parameters_ok1_carry__2_i_4_n_0\
    );
\parameters_ok1_carry__2_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \active_high_ticks_reg[31]_0\(31),
      I1 => \active_period_ticks_reg[31]_0\(31),
      I2 => \active_high_ticks_reg[31]_0\(30),
      I3 => \active_period_ticks_reg[31]_0\(30),
      O => \parameters_ok1_carry__2_i_5_n_0\
    );
\parameters_ok1_carry__2_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \active_high_ticks_reg[31]_0\(29),
      I1 => \active_period_ticks_reg[31]_0\(29),
      I2 => \active_high_ticks_reg[31]_0\(28),
      I3 => \active_period_ticks_reg[31]_0\(28),
      O => \parameters_ok1_carry__2_i_6_n_0\
    );
\parameters_ok1_carry__2_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \active_high_ticks_reg[31]_0\(27),
      I1 => \active_period_ticks_reg[31]_0\(27),
      I2 => \active_high_ticks_reg[31]_0\(26),
      I3 => \active_period_ticks_reg[31]_0\(26),
      O => \parameters_ok1_carry__2_i_7_n_0\
    );
\parameters_ok1_carry__2_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \active_high_ticks_reg[31]_0\(25),
      I1 => \active_period_ticks_reg[31]_0\(25),
      I2 => \active_high_ticks_reg[31]_0\(24),
      I3 => \active_period_ticks_reg[31]_0\(24),
      O => \parameters_ok1_carry__2_i_8_n_0\
    );
parameters_ok1_carry_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => \active_period_ticks_reg[31]_0\(7),
      I1 => \active_high_ticks_reg[31]_0\(7),
      I2 => \active_period_ticks_reg[31]_0\(6),
      I3 => \active_high_ticks_reg[31]_0\(6),
      O => parameters_ok1_carry_i_1_n_0
    );
parameters_ok1_carry_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => \active_period_ticks_reg[31]_0\(5),
      I1 => \active_high_ticks_reg[31]_0\(5),
      I2 => \active_period_ticks_reg[31]_0\(4),
      I3 => \active_high_ticks_reg[31]_0\(4),
      O => parameters_ok1_carry_i_2_n_0
    );
parameters_ok1_carry_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => \active_period_ticks_reg[31]_0\(3),
      I1 => \active_high_ticks_reg[31]_0\(3),
      I2 => \active_period_ticks_reg[31]_0\(2),
      I3 => \active_high_ticks_reg[31]_0\(2),
      O => parameters_ok1_carry_i_3_n_0
    );
parameters_ok1_carry_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => \active_period_ticks_reg[31]_0\(1),
      I1 => \active_high_ticks_reg[31]_0\(1),
      I2 => \active_period_ticks_reg[31]_0\(0),
      I3 => \active_high_ticks_reg[31]_0\(0),
      O => parameters_ok1_carry_i_4_n_0
    );
parameters_ok1_carry_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \active_high_ticks_reg[31]_0\(7),
      I1 => \active_period_ticks_reg[31]_0\(7),
      I2 => \active_high_ticks_reg[31]_0\(6),
      I3 => \active_period_ticks_reg[31]_0\(6),
      O => parameters_ok1_carry_i_5_n_0
    );
parameters_ok1_carry_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \active_high_ticks_reg[31]_0\(5),
      I1 => \active_period_ticks_reg[31]_0\(5),
      I2 => \active_high_ticks_reg[31]_0\(4),
      I3 => \active_period_ticks_reg[31]_0\(4),
      O => parameters_ok1_carry_i_6_n_0
    );
parameters_ok1_carry_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \active_high_ticks_reg[31]_0\(3),
      I1 => \active_period_ticks_reg[31]_0\(3),
      I2 => \active_high_ticks_reg[31]_0\(2),
      I3 => \active_period_ticks_reg[31]_0\(2),
      O => parameters_ok1_carry_i_7_n_0
    );
parameters_ok1_carry_i_8: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \active_high_ticks_reg[31]_0\(1),
      I1 => \active_period_ticks_reg[31]_0\(1),
      I2 => \active_high_ticks_reg[31]_0\(0),
      I3 => \active_period_ticks_reg[31]_0\(0),
      O => parameters_ok1_carry_i_8_n_0
    );
period_start_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1010300030003000"
    )
        port map (
      I0 => running0,
      I1 => \counter_reg[0]_0\,
      I2 => s_axi_aresetn,
      I3 => \active_period_count[31]_i_1_n_0\,
      I4 => running,
      I5 => cycle_end0,
      O => period_start_i_1_n_0
    );
period_start_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => period_start_i_1_n_0,
      Q => \^period_start\,
      R => '0'
    );
pwm_out0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => pwm_out0_carry_n_0,
      CO(2) => pwm_out0_carry_n_1,
      CO(1) => pwm_out0_carry_n_2,
      CO(0) => pwm_out0_carry_n_3,
      CYINIT => '0',
      DI(3) => pwm_out0_carry_i_1_n_0,
      DI(2) => pwm_out0_carry_i_2_n_0,
      DI(1) => pwm_out0_carry_i_3_n_0,
      DI(0) => pwm_out0_carry_i_4_n_0,
      O(3 downto 0) => NLW_pwm_out0_carry_O_UNCONNECTED(3 downto 0),
      S(3) => pwm_out0_carry_i_5_n_0,
      S(2) => pwm_out0_carry_i_6_n_0,
      S(1) => pwm_out0_carry_i_7_n_0,
      S(0) => pwm_out0_carry_i_8_n_0
    );
\pwm_out0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => pwm_out0_carry_n_0,
      CO(3) => \pwm_out0_carry__0_n_0\,
      CO(2) => \pwm_out0_carry__0_n_1\,
      CO(1) => \pwm_out0_carry__0_n_2\,
      CO(0) => \pwm_out0_carry__0_n_3\,
      CYINIT => '0',
      DI(3) => \pwm_out0_carry__0_i_1_n_0\,
      DI(2) => \pwm_out0_carry__0_i_2_n_0\,
      DI(1) => \pwm_out0_carry__0_i_3_n_0\,
      DI(0) => \pwm_out0_carry__0_i_4_n_0\,
      O(3 downto 0) => \NLW_pwm_out0_carry__0_O_UNCONNECTED\(3 downto 0),
      S(3) => \pwm_out0_carry__0_i_5_n_0\,
      S(2) => \pwm_out0_carry__0_i_6_n_0\,
      S(1) => \pwm_out0_carry__0_i_7_n_0\,
      S(0) => \pwm_out0_carry__0_i_8_n_0\
    );
\pwm_out0_carry__0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => active_high(15),
      I1 => p_0_in(15),
      I2 => active_high(14),
      I3 => p_0_in(14),
      O => \pwm_out0_carry__0_i_1_n_0\
    );
\pwm_out0_carry__0_i_10\: unisim.vcomponents.CARRY4
     port map (
      CI => pwm_out0_carry_i_9_n_0,
      CO(3) => \pwm_out0_carry__0_i_10_n_0\,
      CO(2) => \pwm_out0_carry__0_i_10_n_1\,
      CO(1) => \pwm_out0_carry__0_i_10_n_2\,
      CO(0) => \pwm_out0_carry__0_i_10_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_0_in(12 downto 9),
      S(3 downto 0) => counter_reg(12 downto 9)
    );
\pwm_out0_carry__0_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => active_high(13),
      I1 => p_0_in(13),
      I2 => active_high(12),
      I3 => p_0_in(12),
      O => \pwm_out0_carry__0_i_2_n_0\
    );
\pwm_out0_carry__0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => active_high(11),
      I1 => p_0_in(11),
      I2 => active_high(10),
      I3 => p_0_in(10),
      O => \pwm_out0_carry__0_i_3_n_0\
    );
\pwm_out0_carry__0_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => active_high(9),
      I1 => p_0_in(9),
      I2 => active_high(8),
      I3 => p_0_in(8),
      O => \pwm_out0_carry__0_i_4_n_0\
    );
\pwm_out0_carry__0_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => p_0_in(15),
      I1 => active_high(15),
      I2 => p_0_in(14),
      I3 => active_high(14),
      O => \pwm_out0_carry__0_i_5_n_0\
    );
\pwm_out0_carry__0_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => p_0_in(13),
      I1 => active_high(13),
      I2 => p_0_in(12),
      I3 => active_high(12),
      O => \pwm_out0_carry__0_i_6_n_0\
    );
\pwm_out0_carry__0_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => p_0_in(11),
      I1 => active_high(11),
      I2 => p_0_in(10),
      I3 => active_high(10),
      O => \pwm_out0_carry__0_i_7_n_0\
    );
\pwm_out0_carry__0_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => p_0_in(9),
      I1 => active_high(9),
      I2 => p_0_in(8),
      I3 => active_high(8),
      O => \pwm_out0_carry__0_i_8_n_0\
    );
\pwm_out0_carry__0_i_9\: unisim.vcomponents.CARRY4
     port map (
      CI => \pwm_out0_carry__0_i_10_n_0\,
      CO(3) => \pwm_out0_carry__0_i_9_n_0\,
      CO(2) => \pwm_out0_carry__0_i_9_n_1\,
      CO(1) => \pwm_out0_carry__0_i_9_n_2\,
      CO(0) => \pwm_out0_carry__0_i_9_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_0_in(16 downto 13),
      S(3 downto 0) => counter_reg(16 downto 13)
    );
\pwm_out0_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \pwm_out0_carry__0_n_0\,
      CO(3) => \pwm_out0_carry__1_n_0\,
      CO(2) => \pwm_out0_carry__1_n_1\,
      CO(1) => \pwm_out0_carry__1_n_2\,
      CO(0) => \pwm_out0_carry__1_n_3\,
      CYINIT => '0',
      DI(3) => \pwm_out0_carry__1_i_1_n_0\,
      DI(2) => \pwm_out0_carry__1_i_2_n_0\,
      DI(1) => \pwm_out0_carry__1_i_3_n_0\,
      DI(0) => \pwm_out0_carry__1_i_4_n_0\,
      O(3 downto 0) => \NLW_pwm_out0_carry__1_O_UNCONNECTED\(3 downto 0),
      S(3) => \pwm_out0_carry__1_i_5_n_0\,
      S(2) => \pwm_out0_carry__1_i_6_n_0\,
      S(1) => \pwm_out0_carry__1_i_7_n_0\,
      S(0) => \pwm_out0_carry__1_i_8_n_0\
    );
\pwm_out0_carry__1_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => active_high(23),
      I1 => p_0_in(23),
      I2 => active_high(22),
      I3 => p_0_in(22),
      O => \pwm_out0_carry__1_i_1_n_0\
    );
\pwm_out0_carry__1_i_10\: unisim.vcomponents.CARRY4
     port map (
      CI => \pwm_out0_carry__0_i_9_n_0\,
      CO(3) => \pwm_out0_carry__1_i_10_n_0\,
      CO(2) => \pwm_out0_carry__1_i_10_n_1\,
      CO(1) => \pwm_out0_carry__1_i_10_n_2\,
      CO(0) => \pwm_out0_carry__1_i_10_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_0_in(20 downto 17),
      S(3 downto 0) => counter_reg(20 downto 17)
    );
\pwm_out0_carry__1_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => active_high(21),
      I1 => p_0_in(21),
      I2 => active_high(20),
      I3 => p_0_in(20),
      O => \pwm_out0_carry__1_i_2_n_0\
    );
\pwm_out0_carry__1_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => active_high(19),
      I1 => p_0_in(19),
      I2 => active_high(18),
      I3 => p_0_in(18),
      O => \pwm_out0_carry__1_i_3_n_0\
    );
\pwm_out0_carry__1_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => active_high(17),
      I1 => p_0_in(17),
      I2 => active_high(16),
      I3 => p_0_in(16),
      O => \pwm_out0_carry__1_i_4_n_0\
    );
\pwm_out0_carry__1_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => p_0_in(23),
      I1 => active_high(23),
      I2 => p_0_in(22),
      I3 => active_high(22),
      O => \pwm_out0_carry__1_i_5_n_0\
    );
\pwm_out0_carry__1_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => p_0_in(21),
      I1 => active_high(21),
      I2 => p_0_in(20),
      I3 => active_high(20),
      O => \pwm_out0_carry__1_i_6_n_0\
    );
\pwm_out0_carry__1_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => p_0_in(19),
      I1 => active_high(19),
      I2 => p_0_in(18),
      I3 => active_high(18),
      O => \pwm_out0_carry__1_i_7_n_0\
    );
\pwm_out0_carry__1_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => p_0_in(17),
      I1 => active_high(17),
      I2 => p_0_in(16),
      I3 => active_high(16),
      O => \pwm_out0_carry__1_i_8_n_0\
    );
\pwm_out0_carry__1_i_9\: unisim.vcomponents.CARRY4
     port map (
      CI => \pwm_out0_carry__1_i_10_n_0\,
      CO(3) => \pwm_out0_carry__1_i_9_n_0\,
      CO(2) => \pwm_out0_carry__1_i_9_n_1\,
      CO(1) => \pwm_out0_carry__1_i_9_n_2\,
      CO(0) => \pwm_out0_carry__1_i_9_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_0_in(24 downto 21),
      S(3 downto 0) => counter_reg(24 downto 21)
    );
\pwm_out0_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \pwm_out0_carry__1_n_0\,
      CO(3) => \pwm_out0_carry__2_n_0\,
      CO(2) => \pwm_out0_carry__2_n_1\,
      CO(1) => \pwm_out0_carry__2_n_2\,
      CO(0) => \pwm_out0_carry__2_n_3\,
      CYINIT => '0',
      DI(3) => \pwm_out0_carry__2_i_1_n_0\,
      DI(2) => \pwm_out0_carry__2_i_2_n_0\,
      DI(1) => \pwm_out0_carry__2_i_3_n_0\,
      DI(0) => \pwm_out0_carry__2_i_4_n_0\,
      O(3 downto 0) => \NLW_pwm_out0_carry__2_O_UNCONNECTED\(3 downto 0),
      S(3) => \pwm_out0_carry__2_i_5_n_0\,
      S(2) => \pwm_out0_carry__2_i_6_n_0\,
      S(1) => \pwm_out0_carry__2_i_7_n_0\,
      S(0) => \pwm_out0_carry__2_i_8_n_0\
    );
\pwm_out0_carry__2_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => active_high(31),
      I1 => p_0_in(31),
      I2 => active_high(30),
      I3 => p_0_in(30),
      O => \pwm_out0_carry__2_i_1_n_0\
    );
\pwm_out0_carry__2_i_10\: unisim.vcomponents.CARRY4
     port map (
      CI => \pwm_out0_carry__1_i_9_n_0\,
      CO(3) => \pwm_out0_carry__2_i_10_n_0\,
      CO(2) => \pwm_out0_carry__2_i_10_n_1\,
      CO(1) => \pwm_out0_carry__2_i_10_n_2\,
      CO(0) => \pwm_out0_carry__2_i_10_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_0_in(28 downto 25),
      S(3 downto 0) => counter_reg(28 downto 25)
    );
\pwm_out0_carry__2_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => active_high(29),
      I1 => p_0_in(29),
      I2 => active_high(28),
      I3 => p_0_in(28),
      O => \pwm_out0_carry__2_i_2_n_0\
    );
\pwm_out0_carry__2_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => active_high(27),
      I1 => p_0_in(27),
      I2 => active_high(26),
      I3 => p_0_in(26),
      O => \pwm_out0_carry__2_i_3_n_0\
    );
\pwm_out0_carry__2_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => active_high(25),
      I1 => p_0_in(25),
      I2 => active_high(24),
      I3 => p_0_in(24),
      O => \pwm_out0_carry__2_i_4_n_0\
    );
\pwm_out0_carry__2_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => p_0_in(31),
      I1 => active_high(31),
      I2 => p_0_in(30),
      I3 => active_high(30),
      O => \pwm_out0_carry__2_i_5_n_0\
    );
\pwm_out0_carry__2_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => p_0_in(29),
      I1 => active_high(29),
      I2 => p_0_in(28),
      I3 => active_high(28),
      O => \pwm_out0_carry__2_i_6_n_0\
    );
\pwm_out0_carry__2_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => p_0_in(27),
      I1 => active_high(27),
      I2 => p_0_in(26),
      I3 => active_high(26),
      O => \pwm_out0_carry__2_i_7_n_0\
    );
\pwm_out0_carry__2_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => p_0_in(25),
      I1 => active_high(25),
      I2 => p_0_in(24),
      I3 => active_high(24),
      O => \pwm_out0_carry__2_i_8_n_0\
    );
\pwm_out0_carry__2_i_9\: unisim.vcomponents.CARRY4
     port map (
      CI => \pwm_out0_carry__2_i_10_n_0\,
      CO(3 downto 2) => \NLW_pwm_out0_carry__2_i_9_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \pwm_out0_carry__2_i_9_n_2\,
      CO(0) => \pwm_out0_carry__2_i_9_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_pwm_out0_carry__2_i_9_O_UNCONNECTED\(3),
      O(2 downto 0) => p_0_in(31 downto 29),
      S(3) => '0',
      S(2 downto 0) => counter_reg(31 downto 29)
    );
pwm_out0_carry_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => active_high(7),
      I1 => p_0_in(7),
      I2 => active_high(6),
      I3 => p_0_in(6),
      O => pwm_out0_carry_i_1_n_0
    );
pwm_out0_carry_i_10: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => pwm_out0_carry_i_10_n_0,
      CO(2) => pwm_out0_carry_i_10_n_1,
      CO(1) => pwm_out0_carry_i_10_n_2,
      CO(0) => pwm_out0_carry_i_10_n_3,
      CYINIT => counter_reg(0),
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_0_in(4 downto 1),
      S(3 downto 0) => counter_reg(4 downto 1)
    );
pwm_out0_carry_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => active_high(5),
      I1 => p_0_in(5),
      I2 => active_high(4),
      I3 => p_0_in(4),
      O => pwm_out0_carry_i_2_n_0
    );
pwm_out0_carry_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => active_high(3),
      I1 => p_0_in(3),
      I2 => active_high(2),
      I3 => p_0_in(2),
      O => pwm_out0_carry_i_3_n_0
    );
pwm_out0_carry_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B222"
    )
        port map (
      I0 => active_high(1),
      I1 => p_0_in(1),
      I2 => counter_reg(0),
      I3 => active_high(0),
      O => pwm_out0_carry_i_4_n_0
    );
pwm_out0_carry_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => p_0_in(7),
      I1 => active_high(7),
      I2 => p_0_in(6),
      I3 => active_high(6),
      O => pwm_out0_carry_i_5_n_0
    );
pwm_out0_carry_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => p_0_in(5),
      I1 => active_high(5),
      I2 => p_0_in(4),
      I3 => active_high(4),
      O => pwm_out0_carry_i_6_n_0
    );
pwm_out0_carry_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => p_0_in(3),
      I1 => active_high(3),
      I2 => p_0_in(2),
      I3 => active_high(2),
      O => pwm_out0_carry_i_7_n_0
    );
pwm_out0_carry_i_8: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6006"
    )
        port map (
      I0 => active_high(0),
      I1 => counter_reg(0),
      I2 => p_0_in(1),
      I3 => active_high(1),
      O => pwm_out0_carry_i_8_n_0
    );
pwm_out0_carry_i_9: unisim.vcomponents.CARRY4
     port map (
      CI => pwm_out0_carry_i_10_n_0,
      CO(3) => pwm_out0_carry_i_9_n_0,
      CO(2) => pwm_out0_carry_i_9_n_1,
      CO(1) => pwm_out0_carry_i_9_n_2,
      CO(0) => pwm_out0_carry_i_9_n_3,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_0_in(8 downto 5),
      S(3 downto 0) => counter_reg(8 downto 5)
    );
pwm_out_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000888A8880"
    )
        port map (
      I0 => pwm_out_i_2_n_0,
      I1 => pwm_out_i_3_n_0,
      I2 => \active_period_count[31]_i_1_n_0\,
      I3 => pwm_out_i_4_n_0,
      I4 => \^pwm_out\,
      I5 => pwm_out_i_5_n_0,
      O => pwm_out_i_1_n_0
    );
pwm_out_i_10: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \active_high_ticks_reg[31]_0\(1),
      I1 => \active_high_ticks_reg[31]_0\(0),
      I2 => \active_high_ticks_reg[31]_0\(3),
      I3 => \active_high_ticks_reg[31]_0\(2),
      O => pwm_out_i_10_n_0
    );
pwm_out_i_11: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \active_high_ticks_reg[31]_0\(8),
      I1 => \active_high_ticks_reg[31]_0\(11),
      I2 => \active_high_ticks_reg[31]_0\(9),
      I3 => \active_high_ticks_reg[31]_0\(10),
      I4 => pwm_out_i_18_n_0,
      O => pwm_out_i_11_n_0
    );
pwm_out_i_12: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \active_high_ticks_reg[31]_0\(17),
      I1 => \active_high_ticks_reg[31]_0\(16),
      I2 => \active_high_ticks_reg[31]_0\(19),
      I3 => \active_high_ticks_reg[31]_0\(18),
      O => pwm_out_i_12_n_0
    );
pwm_out_i_13: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \active_high_ticks_reg[31]_0\(24),
      I1 => \active_high_ticks_reg[31]_0\(27),
      I2 => \active_high_ticks_reg[31]_0\(25),
      I3 => \active_high_ticks_reg[31]_0\(26),
      I4 => pwm_out_i_19_n_0,
      O => pwm_out_i_13_n_0
    );
pwm_out_i_14: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => active_high(4),
      I1 => active_high(7),
      I2 => active_high(5),
      I3 => active_high(6),
      I4 => pwm_out_i_20_n_0,
      O => pwm_out_i_14_n_0
    );
pwm_out_i_15: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => active_high(8),
      I1 => active_high(11),
      I2 => active_high(9),
      I3 => active_high(10),
      I4 => pwm_out_i_21_n_0,
      O => pwm_out_i_15_n_0
    );
pwm_out_i_16: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => active_high(24),
      I1 => active_high(27),
      I2 => active_high(25),
      I3 => active_high(26),
      I4 => pwm_out_i_22_n_0,
      O => pwm_out_i_16_n_0
    );
pwm_out_i_17: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => active_high(20),
      I1 => active_high(23),
      I2 => active_high(21),
      I3 => active_high(22),
      I4 => pwm_out_i_23_n_0,
      O => pwm_out_i_17_n_0
    );
pwm_out_i_18: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \active_high_ticks_reg[31]_0\(14),
      I1 => \active_high_ticks_reg[31]_0\(13),
      I2 => \active_high_ticks_reg[31]_0\(15),
      I3 => \active_high_ticks_reg[31]_0\(12),
      O => pwm_out_i_18_n_0
    );
pwm_out_i_19: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \active_high_ticks_reg[31]_0\(29),
      I1 => \active_high_ticks_reg[31]_0\(28),
      I2 => \active_high_ticks_reg[31]_0\(31),
      I3 => \active_high_ticks_reg[31]_0\(30),
      O => pwm_out_i_19_n_0
    );
pwm_out_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"2A"
    )
        port map (
      I0 => s_axi_aresetn,
      I1 => \counter_reg[0]_0\,
      I2 => running,
      O => pwm_out_i_2_n_0
    );
pwm_out_i_20: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => active_high(1),
      I1 => active_high(0),
      I2 => active_high(3),
      I3 => active_high(2),
      O => pwm_out_i_20_n_0
    );
pwm_out_i_21: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => active_high(13),
      I1 => active_high(12),
      I2 => active_high(15),
      I3 => active_high(14),
      O => pwm_out_i_21_n_0
    );
pwm_out_i_22: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => active_high(29),
      I1 => active_high(28),
      I2 => active_high(31),
      I3 => active_high(30),
      O => pwm_out_i_22_n_0
    );
pwm_out_i_23: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => active_high(17),
      I1 => active_high(16),
      I2 => active_high(19),
      I3 => active_high(18),
      O => pwm_out_i_23_n_0
    );
pwm_out_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFE0EFEFEFE0E0E0"
    )
        port map (
      I0 => pwm_out_i_6_n_0,
      I1 => pwm_out_i_7_n_0,
      I2 => \active_period_count[31]_i_2_n_0\,
      I3 => \pwm_out0_carry__2_n_0\,
      I4 => pwm_out_i_8_n_0,
      I5 => pwm_out_i_9_n_0,
      O => pwm_out_i_3_n_0
    );
pwm_out_i_4: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => running,
      I1 => \counter_reg[0]_0\,
      O => pwm_out_i_4_n_0
    );
pwm_out_i_5: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => running0,
      I1 => cycle_end0,
      I2 => running,
      O => pwm_out_i_5_n_0
    );
pwm_out_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => pwm_out_i_10_n_0,
      I1 => \active_high_ticks_reg[31]_0\(7),
      I2 => \active_high_ticks_reg[31]_0\(4),
      I3 => \active_high_ticks_reg[31]_0\(6),
      I4 => \active_high_ticks_reg[31]_0\(5),
      I5 => pwm_out_i_11_n_0,
      O => pwm_out_i_6_n_0
    );
pwm_out_i_7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => pwm_out_i_12_n_0,
      I1 => \active_high_ticks_reg[31]_0\(23),
      I2 => \active_high_ticks_reg[31]_0\(20),
      I3 => \active_high_ticks_reg[31]_0\(22),
      I4 => \active_high_ticks_reg[31]_0\(21),
      I5 => pwm_out_i_13_n_0,
      O => pwm_out_i_7_n_0
    );
pwm_out_i_8: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => running,
      I1 => cycle_end0,
      O => pwm_out_i_8_n_0
    );
pwm_out_i_9: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => pwm_out_i_14_n_0,
      I1 => pwm_out_i_15_n_0,
      I2 => pwm_out_i_16_n_0,
      I3 => pwm_out_i_17_n_0,
      O => pwm_out_i_9_n_0
    );
pwm_out_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => pwm_out_i_1_n_0,
      Q => \^pwm_out\,
      R => '0'
    );
running0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => running0_carry_n_0,
      CO(2) => running0_carry_n_1,
      CO(1) => running0_carry_n_2,
      CO(0) => running0_carry_n_3,
      CYINIT => '1',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => NLW_running0_carry_O_UNCONNECTED(3 downto 0),
      S(3) => running0_carry_i_1_n_0,
      S(2) => running0_carry_i_2_n_0,
      S(1) => running0_carry_i_3_n_0,
      S(0) => running0_carry_i_4_n_0
    );
\running0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => running0_carry_n_0,
      CO(3) => \running0_carry__0_n_0\,
      CO(2) => \running0_carry__0_n_1\,
      CO(1) => \running0_carry__0_n_2\,
      CO(0) => \running0_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_running0_carry__0_O_UNCONNECTED\(3 downto 0),
      S(3) => \running0_carry__0_i_1_n_0\,
      S(2) => \running0_carry__0_i_2_n_0\,
      S(1) => \running0_carry__0_i_3_n_0\,
      S(0) => \running0_carry__0_i_4_n_0\
    );
\running0_carry__0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => active_count(23),
      I1 => running1(23),
      I2 => running1(21),
      I3 => active_count(21),
      I4 => running1(22),
      I5 => active_count(22),
      O => \running0_carry__0_i_1_n_0\
    );
\running0_carry__0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => active_count(20),
      I1 => running1(20),
      I2 => running1(18),
      I3 => active_count(18),
      I4 => running1(19),
      I5 => active_count(19),
      O => \running0_carry__0_i_2_n_0\
    );
\running0_carry__0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => active_count(17),
      I1 => running1(17),
      I2 => running1(16),
      I3 => active_count(16),
      I4 => running1(15),
      I5 => active_count(15),
      O => \running0_carry__0_i_3_n_0\
    );
\running0_carry__0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => active_count(14),
      I1 => running1(14),
      I2 => running1(12),
      I3 => active_count(12),
      I4 => running1(13),
      I5 => active_count(13),
      O => \running0_carry__0_i_4_n_0\
    );
\running0_carry__0_i_5\: unisim.vcomponents.CARRY4
     port map (
      CI => \running0_carry__0_i_6_n_0\,
      CO(3) => \running0_carry__0_i_5_n_0\,
      CO(2) => \running0_carry__0_i_5_n_1\,
      CO(1) => \running0_carry__0_i_5_n_2\,
      CO(0) => \running0_carry__0_i_5_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => running1(24 downto 21),
      S(3 downto 0) => completed_count(24 downto 21)
    );
\running0_carry__0_i_6\: unisim.vcomponents.CARRY4
     port map (
      CI => \running0_carry__0_i_7_n_0\,
      CO(3) => \running0_carry__0_i_6_n_0\,
      CO(2) => \running0_carry__0_i_6_n_1\,
      CO(1) => \running0_carry__0_i_6_n_2\,
      CO(0) => \running0_carry__0_i_6_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => running1(20 downto 17),
      S(3 downto 0) => completed_count(20 downto 17)
    );
\running0_carry__0_i_7\: unisim.vcomponents.CARRY4
     port map (
      CI => running0_carry_i_5_n_0,
      CO(3) => \running0_carry__0_i_7_n_0\,
      CO(2) => \running0_carry__0_i_7_n_1\,
      CO(1) => \running0_carry__0_i_7_n_2\,
      CO(0) => \running0_carry__0_i_7_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => running1(16 downto 13),
      S(3 downto 0) => completed_count(16 downto 13)
    );
\running0_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \running0_carry__0_n_0\,
      CO(3) => \NLW_running0_carry__1_CO_UNCONNECTED\(3),
      CO(2) => running0,
      CO(1) => \running0_carry__1_n_2\,
      CO(0) => \running0_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_running0_carry__1_O_UNCONNECTED\(3 downto 0),
      S(3) => '0',
      S(2) => \running0_carry__1_i_1_n_0\,
      S(1) => \running0_carry__1_i_2_n_0\,
      S(0) => \running0_carry__1_i_3_n_0\
    );
\running0_carry__1_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => active_count(31),
      I1 => running1(31),
      I2 => active_count(30),
      I3 => running1(30),
      O => \running0_carry__1_i_1_n_0\
    );
\running0_carry__1_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => active_count(29),
      I1 => running1(29),
      I2 => running1(27),
      I3 => active_count(27),
      I4 => running1(28),
      I5 => active_count(28),
      O => \running0_carry__1_i_2_n_0\
    );
\running0_carry__1_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => active_count(26),
      I1 => running1(26),
      I2 => running1(24),
      I3 => active_count(24),
      I4 => running1(25),
      I5 => active_count(25),
      O => \running0_carry__1_i_3_n_0\
    );
\running0_carry__1_i_4\: unisim.vcomponents.CARRY4
     port map (
      CI => \running0_carry__1_i_5_n_0\,
      CO(3 downto 2) => \NLW_running0_carry__1_i_4_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \running0_carry__1_i_4_n_2\,
      CO(0) => \running0_carry__1_i_4_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_running0_carry__1_i_4_O_UNCONNECTED\(3),
      O(2 downto 0) => running1(31 downto 29),
      S(3) => '0',
      S(2 downto 0) => completed_count(31 downto 29)
    );
\running0_carry__1_i_5\: unisim.vcomponents.CARRY4
     port map (
      CI => \running0_carry__0_i_5_n_0\,
      CO(3) => \running0_carry__1_i_5_n_0\,
      CO(2) => \running0_carry__1_i_5_n_1\,
      CO(1) => \running0_carry__1_i_5_n_2\,
      CO(0) => \running0_carry__1_i_5_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => running1(28 downto 25),
      S(3 downto 0) => completed_count(28 downto 25)
    );
running0_carry_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => active_count(11),
      I1 => running1(11),
      I2 => running1(9),
      I3 => active_count(9),
      I4 => running1(10),
      I5 => active_count(10),
      O => running0_carry_i_1_n_0
    );
running0_carry_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => active_count(8),
      I1 => running1(8),
      I2 => running1(6),
      I3 => active_count(6),
      I4 => running1(7),
      I5 => active_count(7),
      O => running0_carry_i_2_n_0
    );
running0_carry_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => running1(3),
      I1 => active_count(3),
      I2 => running1(4),
      I3 => active_count(4),
      I4 => active_count(5),
      I5 => running1(5),
      O => running0_carry_i_3_n_0
    );
running0_carry_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0990000000000990"
    )
        port map (
      I0 => active_count(2),
      I1 => running1(2),
      I2 => active_count(0),
      I3 => completed_count(0),
      I4 => running1(1),
      I5 => active_count(1),
      O => running0_carry_i_4_n_0
    );
running0_carry_i_5: unisim.vcomponents.CARRY4
     port map (
      CI => running0_carry_i_6_n_0,
      CO(3) => running0_carry_i_5_n_0,
      CO(2) => running0_carry_i_5_n_1,
      CO(1) => running0_carry_i_5_n_2,
      CO(0) => running0_carry_i_5_n_3,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => running1(12 downto 9),
      S(3 downto 0) => completed_count(12 downto 9)
    );
running0_carry_i_6: unisim.vcomponents.CARRY4
     port map (
      CI => running0_carry_i_7_n_0,
      CO(3) => running0_carry_i_6_n_0,
      CO(2) => running0_carry_i_6_n_1,
      CO(1) => running0_carry_i_6_n_2,
      CO(0) => running0_carry_i_6_n_3,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => running1(8 downto 5),
      S(3 downto 0) => completed_count(8 downto 5)
    );
running0_carry_i_7: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => running0_carry_i_7_n_0,
      CO(2) => running0_carry_i_7_n_1,
      CO(1) => running0_carry_i_7_n_2,
      CO(0) => running0_carry_i_7_n_3,
      CYINIT => completed_count(0),
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => running1(4 downto 1),
      S(3 downto 0) => completed_count(4 downto 1)
    );
running_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"000A0038"
    )
        port map (
      I0 => cfg_error_reg_0,
      I1 => \active_period_count[31]_i_1_n_0\,
      I2 => running,
      I3 => \counter_reg[0]_0\,
      I4 => pwm_out_i_5_n_0,
      O => running_i_1_n_0
    );
running_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => running_i_1_n_0,
      Q => running,
      R => \^sr\(0)
    );
\s_axi_bresp[1]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s_axi_aresetn,
      O => \^sr\(0)
    );
\s_axi_bresp[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FBAAFFFFFBAA0000"
    )
        port map (
      I0 => \s_axi_bresp_reg[1]_2\,
      I1 => \s_axi_bresp[1]_i_4_n_0\,
      I2 => \s_axi_bresp_reg[1]_3\,
      I3 => \s_axi_bresp_reg[1]_4\,
      I4 => address_pending0,
      I5 => s_axi_bresp(0),
      O => \s_axi_bresp_reg[1]\
    );
\s_axi_bresp[1]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF5700FFFF"
    )
        port map (
      I0 => \error_sticky_reg[2]\(0),
      I1 => \s_axi_bresp[1]_i_8_n_0\,
      I2 => \error_sticky_reg[2]\(1),
      I3 => \s_axi_bresp_reg[1]_0\,
      I4 => \s_axi_bresp_reg[1]_1\(0),
      I5 => Q(1),
      O => \s_axi_bresp[1]_i_4_n_0\
    );
\s_axi_bresp[1]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFBABAFFBA"
    )
        port map (
      I0 => CO(0),
      I1 => \s_axi_bresp[1]_i_4_0\,
      I2 => \s_axi_bresp[1]_i_4_1\,
      I3 => \s_axi_bresp[1]_i_4_2\,
      I4 => \s_axi_bresp[1]_i_4_3\,
      I5 => \^launch_valid_reg\,
      O => \s_axi_bresp[1]_i_8_n_0\
    );
\s_axi_rdata[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"02A2"
    )
        port map (
      I0 => \s_axi_rdata_reg[1]\,
      I1 => \s_axi_rdata[0]_i_2_n_0\,
      I2 => \s_axi_rdata_reg[1]_1\,
      I3 => \s_axi_rdata[0]_i_3_n_0\,
      O => D(0)
    );
\s_axi_rdata[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"040CF4FC"
    )
        port map (
      I0 => running,
      I1 => \s_axi_rdata_reg[12]\,
      I2 => \s_axi_rdata_reg[8]\,
      I3 => \s_axi_rdata_reg[2]\,
      I4 => \s_axi_rdata_reg[0]\,
      O => \s_axi_rdata[0]_i_2_n_0\
    );
\s_axi_rdata[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"505F3030505F3F3F"
    )
        port map (
      I0 => completed_count(0),
      I1 => active_count(0),
      I2 => \s_axi_rdata_reg[12]\,
      I3 => active_high(0),
      I4 => \s_axi_rdata_reg[2]\,
      I5 => active_period(0),
      O => \s_axi_rdata[0]_i_3_n_0\
    );
\s_axi_rdata[10]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8A88"
    )
        port map (
      I0 => \s_axi_rdata_reg[1]\,
      I1 => \s_axi_rdata_reg[10]\,
      I2 => \s_axi_rdata[10]_i_3_n_0\,
      I3 => \s_axi_rdata_reg[1]_1\,
      O => D(10)
    );
\s_axi_rdata[10]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5050303F5F5F303F"
    )
        port map (
      I0 => completed_count(10),
      I1 => active_count(10),
      I2 => \s_axi_rdata_reg[12]\,
      I3 => active_period(10),
      I4 => \s_axi_rdata_reg[2]\,
      I5 => active_high(10),
      O => \s_axi_rdata[10]_i_3_n_0\
    );
\s_axi_rdata[11]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8A88"
    )
        port map (
      I0 => \s_axi_rdata_reg[1]\,
      I1 => \s_axi_rdata_reg[11]\,
      I2 => \s_axi_rdata[11]_i_3_n_0\,
      I3 => \s_axi_rdata_reg[1]_1\,
      O => D(11)
    );
\s_axi_rdata[11]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3030505F3F3F505F"
    )
        port map (
      I0 => active_count(11),
      I1 => completed_count(11),
      I2 => \s_axi_rdata_reg[12]\,
      I3 => active_period(11),
      I4 => \s_axi_rdata_reg[2]\,
      I5 => active_high(11),
      O => \s_axi_rdata[11]_i_3_n_0\
    );
\s_axi_rdata[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000A2AA00AAA2"
    )
        port map (
      I0 => \s_axi_rdata_reg[1]\,
      I1 => \s_axi_rdata_reg[12]\,
      I2 => \s_axi_rdata_reg[8]\,
      I3 => \s_axi_rdata_reg[1]_1\,
      I4 => \s_axi_rdata_reg[12]_0\,
      I5 => \s_axi_rdata[12]_i_3_n_0\,
      O => D(12)
    );
\s_axi_rdata[12]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5050303F5F5F303F"
    )
        port map (
      I0 => completed_count(12),
      I1 => active_count(12),
      I2 => \s_axi_rdata_reg[12]\,
      I3 => active_period(12),
      I4 => \s_axi_rdata_reg[2]\,
      I5 => active_high(12),
      O => \s_axi_rdata[12]_i_3_n_0\
    );
\s_axi_rdata[13]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8A88"
    )
        port map (
      I0 => \s_axi_rdata_reg[1]\,
      I1 => \s_axi_rdata_reg[13]\,
      I2 => \s_axi_rdata[13]_i_3_n_0\,
      I3 => \s_axi_rdata_reg[1]_1\,
      O => D(13)
    );
\s_axi_rdata[13]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5050303F5F5F303F"
    )
        port map (
      I0 => completed_count(13),
      I1 => active_count(13),
      I2 => \s_axi_rdata_reg[12]\,
      I3 => active_period(13),
      I4 => \s_axi_rdata_reg[2]\,
      I5 => active_high(13),
      O => \s_axi_rdata[13]_i_3_n_0\
    );
\s_axi_rdata[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000A2AA00AAA2"
    )
        port map (
      I0 => \s_axi_rdata_reg[1]\,
      I1 => \s_axi_rdata_reg[12]\,
      I2 => \s_axi_rdata_reg[8]\,
      I3 => \s_axi_rdata_reg[1]_1\,
      I4 => \s_axi_rdata_reg[14]\,
      I5 => \s_axi_rdata[14]_i_3_n_0\,
      O => D(14)
    );
\s_axi_rdata[14]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3030505F3F3F505F"
    )
        port map (
      I0 => active_count(14),
      I1 => completed_count(14),
      I2 => \s_axi_rdata_reg[12]\,
      I3 => active_period(14),
      I4 => \s_axi_rdata_reg[2]\,
      I5 => active_high(14),
      O => \s_axi_rdata[14]_i_3_n_0\
    );
\s_axi_rdata[15]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8A88"
    )
        port map (
      I0 => \s_axi_rdata_reg[1]\,
      I1 => \s_axi_rdata_reg[15]\,
      I2 => \s_axi_rdata[15]_i_3_n_0\,
      I3 => \s_axi_rdata_reg[1]_1\,
      O => D(15)
    );
\s_axi_rdata[15]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5050303F5F5F303F"
    )
        port map (
      I0 => completed_count(15),
      I1 => active_count(15),
      I2 => \s_axi_rdata_reg[12]\,
      I3 => active_period(15),
      I4 => \s_axi_rdata_reg[2]\,
      I5 => active_high(15),
      O => \s_axi_rdata[15]_i_3_n_0\
    );
\s_axi_rdata[16]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000A2AA00AAA2"
    )
        port map (
      I0 => \s_axi_rdata_reg[1]\,
      I1 => \s_axi_rdata_reg[12]\,
      I2 => \s_axi_rdata_reg[8]\,
      I3 => \s_axi_rdata_reg[1]_1\,
      I4 => \s_axi_rdata_reg[16]\,
      I5 => \s_axi_rdata[16]_i_3_n_0\,
      O => D(16)
    );
\s_axi_rdata[16]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5050303F5F5F303F"
    )
        port map (
      I0 => completed_count(16),
      I1 => active_count(16),
      I2 => \s_axi_rdata_reg[12]\,
      I3 => active_period(16),
      I4 => \s_axi_rdata_reg[2]\,
      I5 => active_high(16),
      O => \s_axi_rdata[16]_i_3_n_0\
    );
\s_axi_rdata[17]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8A88"
    )
        port map (
      I0 => \s_axi_rdata_reg[1]\,
      I1 => \s_axi_rdata_reg[17]\,
      I2 => \s_axi_rdata[17]_i_3_n_0\,
      I3 => \s_axi_rdata_reg[1]_1\,
      O => D(17)
    );
\s_axi_rdata[17]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3030505F3F3F505F"
    )
        port map (
      I0 => active_count(17),
      I1 => completed_count(17),
      I2 => \s_axi_rdata_reg[12]\,
      I3 => active_period(17),
      I4 => \s_axi_rdata_reg[2]\,
      I5 => active_high(17),
      O => \s_axi_rdata[17]_i_3_n_0\
    );
\s_axi_rdata[18]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000A2AA00AAA2"
    )
        port map (
      I0 => \s_axi_rdata_reg[1]\,
      I1 => \s_axi_rdata_reg[12]\,
      I2 => \s_axi_rdata_reg[8]\,
      I3 => \s_axi_rdata_reg[1]_1\,
      I4 => \s_axi_rdata_reg[18]\,
      I5 => \s_axi_rdata[18]_i_3_n_0\,
      O => D(18)
    );
\s_axi_rdata[18]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5050303F5F5F303F"
    )
        port map (
      I0 => completed_count(18),
      I1 => active_count(18),
      I2 => \s_axi_rdata_reg[12]\,
      I3 => active_period(18),
      I4 => \s_axi_rdata_reg[2]\,
      I5 => active_high(18),
      O => \s_axi_rdata[18]_i_3_n_0\
    );
\s_axi_rdata[19]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8A88"
    )
        port map (
      I0 => \s_axi_rdata_reg[1]\,
      I1 => \s_axi_rdata_reg[19]\,
      I2 => \s_axi_rdata[19]_i_3_n_0\,
      I3 => \s_axi_rdata_reg[1]_1\,
      O => D(19)
    );
\s_axi_rdata[19]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5050303F5F5F303F"
    )
        port map (
      I0 => completed_count(19),
      I1 => active_count(19),
      I2 => \s_axi_rdata_reg[12]\,
      I3 => active_period(19),
      I4 => \s_axi_rdata_reg[2]\,
      I5 => active_high(19),
      O => \s_axi_rdata[19]_i_3_n_0\
    );
\s_axi_rdata[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"20AA2020AAAAAAAA"
    )
        port map (
      I0 => \s_axi_rdata_reg[1]\,
      I1 => \s_axi_rdata_reg[1]_0\,
      I2 => \^launch_valid_reg\,
      I3 => \s_axi_rdata[1]_i_2_n_0\,
      I4 => \s_axi_rdata_reg[1]_1\,
      I5 => \s_axi_rdata_reg[1]_2\,
      O => D(1)
    );
\s_axi_rdata[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5050303F5F5F303F"
    )
        port map (
      I0 => completed_count(1),
      I1 => active_count(1),
      I2 => \s_axi_rdata_reg[12]\,
      I3 => active_period(1),
      I4 => \s_axi_rdata_reg[2]\,
      I5 => active_high(1),
      O => \s_axi_rdata[1]_i_2_n_0\
    );
\s_axi_rdata[20]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000A2AA00AAA2"
    )
        port map (
      I0 => \s_axi_rdata_reg[1]\,
      I1 => \s_axi_rdata_reg[12]\,
      I2 => \s_axi_rdata_reg[8]\,
      I3 => \s_axi_rdata_reg[1]_1\,
      I4 => \s_axi_rdata_reg[20]\,
      I5 => \s_axi_rdata[20]_i_3_n_0\,
      O => D(20)
    );
\s_axi_rdata[20]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3030505F3F3F505F"
    )
        port map (
      I0 => active_count(20),
      I1 => completed_count(20),
      I2 => \s_axi_rdata_reg[12]\,
      I3 => active_period(20),
      I4 => \s_axi_rdata_reg[2]\,
      I5 => active_high(20),
      O => \s_axi_rdata[20]_i_3_n_0\
    );
\s_axi_rdata[21]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8A88"
    )
        port map (
      I0 => \s_axi_rdata_reg[1]\,
      I1 => \s_axi_rdata_reg[21]\,
      I2 => \s_axi_rdata[21]_i_3_n_0\,
      I3 => \s_axi_rdata_reg[1]_1\,
      O => D(21)
    );
\s_axi_rdata[21]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5050303F5F5F303F"
    )
        port map (
      I0 => completed_count(21),
      I1 => active_count(21),
      I2 => \s_axi_rdata_reg[12]\,
      I3 => active_period(21),
      I4 => \s_axi_rdata_reg[2]\,
      I5 => active_high(21),
      O => \s_axi_rdata[21]_i_3_n_0\
    );
\s_axi_rdata[22]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000A2AA00AAA2"
    )
        port map (
      I0 => \s_axi_rdata_reg[1]\,
      I1 => \s_axi_rdata_reg[12]\,
      I2 => \s_axi_rdata_reg[8]\,
      I3 => \s_axi_rdata_reg[1]_1\,
      I4 => \s_axi_rdata_reg[22]\,
      I5 => \s_axi_rdata[22]_i_3_n_0\,
      O => D(22)
    );
\s_axi_rdata[22]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5050303F5F5F303F"
    )
        port map (
      I0 => completed_count(22),
      I1 => active_count(22),
      I2 => \s_axi_rdata_reg[12]\,
      I3 => active_period(22),
      I4 => \s_axi_rdata_reg[2]\,
      I5 => active_high(22),
      O => \s_axi_rdata[22]_i_3_n_0\
    );
\s_axi_rdata[23]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8A88"
    )
        port map (
      I0 => \s_axi_rdata_reg[1]\,
      I1 => \s_axi_rdata_reg[23]\,
      I2 => \s_axi_rdata[23]_i_3_n_0\,
      I3 => \s_axi_rdata_reg[1]_1\,
      O => D(23)
    );
\s_axi_rdata[23]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3030505F3F3F505F"
    )
        port map (
      I0 => active_count(23),
      I1 => completed_count(23),
      I2 => \s_axi_rdata_reg[12]\,
      I3 => active_period(23),
      I4 => \s_axi_rdata_reg[2]\,
      I5 => active_high(23),
      O => \s_axi_rdata[23]_i_3_n_0\
    );
\s_axi_rdata[24]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8A88"
    )
        port map (
      I0 => \s_axi_rdata_reg[1]\,
      I1 => \s_axi_rdata_reg[24]\,
      I2 => \s_axi_rdata[24]_i_3_n_0\,
      I3 => \s_axi_rdata_reg[1]_1\,
      O => D(24)
    );
\s_axi_rdata[24]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5050303F5F5F303F"
    )
        port map (
      I0 => completed_count(24),
      I1 => active_count(24),
      I2 => \s_axi_rdata_reg[12]\,
      I3 => active_period(24),
      I4 => \s_axi_rdata_reg[2]\,
      I5 => active_high(24),
      O => \s_axi_rdata[24]_i_3_n_0\
    );
\s_axi_rdata[25]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000A2AA00AAA2"
    )
        port map (
      I0 => \s_axi_rdata_reg[1]\,
      I1 => \s_axi_rdata_reg[12]\,
      I2 => \s_axi_rdata_reg[8]\,
      I3 => \s_axi_rdata_reg[1]_1\,
      I4 => \s_axi_rdata_reg[25]\,
      I5 => \s_axi_rdata[25]_i_3_n_0\,
      O => D(25)
    );
\s_axi_rdata[25]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5050303F5F5F303F"
    )
        port map (
      I0 => completed_count(25),
      I1 => active_count(25),
      I2 => \s_axi_rdata_reg[12]\,
      I3 => active_period(25),
      I4 => \s_axi_rdata_reg[2]\,
      I5 => active_high(25),
      O => \s_axi_rdata[25]_i_3_n_0\
    );
\s_axi_rdata[26]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8A88"
    )
        port map (
      I0 => \s_axi_rdata_reg[1]\,
      I1 => \s_axi_rdata_reg[26]\,
      I2 => \s_axi_rdata[26]_i_3_n_0\,
      I3 => \s_axi_rdata_reg[1]_1\,
      O => D(26)
    );
\s_axi_rdata[26]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3030505F3F3F505F"
    )
        port map (
      I0 => active_count(26),
      I1 => completed_count(26),
      I2 => \s_axi_rdata_reg[12]\,
      I3 => active_period(26),
      I4 => \s_axi_rdata_reg[2]\,
      I5 => active_high(26),
      O => \s_axi_rdata[26]_i_3_n_0\
    );
\s_axi_rdata[27]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8A88"
    )
        port map (
      I0 => \s_axi_rdata_reg[1]\,
      I1 => \s_axi_rdata_reg[27]\,
      I2 => \s_axi_rdata[27]_i_3_n_0\,
      I3 => \s_axi_rdata_reg[1]_1\,
      O => D(27)
    );
\s_axi_rdata[27]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5050303F5F5F303F"
    )
        port map (
      I0 => completed_count(27),
      I1 => active_count(27),
      I2 => \s_axi_rdata_reg[12]\,
      I3 => active_period(27),
      I4 => \s_axi_rdata_reg[2]\,
      I5 => active_high(27),
      O => \s_axi_rdata[27]_i_3_n_0\
    );
\s_axi_rdata[28]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8A88"
    )
        port map (
      I0 => \s_axi_rdata_reg[1]\,
      I1 => \s_axi_rdata_reg[28]\,
      I2 => \s_axi_rdata[28]_i_3_n_0\,
      I3 => \s_axi_rdata_reg[1]_1\,
      O => D(28)
    );
\s_axi_rdata[28]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5050303F5F5F303F"
    )
        port map (
      I0 => completed_count(28),
      I1 => active_count(28),
      I2 => \s_axi_rdata_reg[12]\,
      I3 => active_period(28),
      I4 => \s_axi_rdata_reg[2]\,
      I5 => active_high(28),
      O => \s_axi_rdata[28]_i_3_n_0\
    );
\s_axi_rdata[29]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8A88"
    )
        port map (
      I0 => \s_axi_rdata_reg[1]\,
      I1 => \s_axi_rdata_reg[29]\,
      I2 => \s_axi_rdata[29]_i_3_n_0\,
      I3 => \s_axi_rdata_reg[1]_1\,
      O => D(29)
    );
\s_axi_rdata[29]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3030505F3F3F505F"
    )
        port map (
      I0 => active_count(29),
      I1 => completed_count(29),
      I2 => \s_axi_rdata_reg[12]\,
      I3 => active_period(29),
      I4 => \s_axi_rdata_reg[2]\,
      I5 => active_high(29),
      O => \s_axi_rdata[29]_i_3_n_0\
    );
\s_axi_rdata[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8A88"
    )
        port map (
      I0 => \s_axi_rdata_reg[1]\,
      I1 => \s_axi_rdata[2]_i_2_n_0\,
      I2 => \s_axi_rdata[2]_i_3_n_0\,
      I3 => \s_axi_rdata_reg[1]_1\,
      O => D(2)
    );
\s_axi_rdata[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FFFF08000800"
    )
        port map (
      I0 => \s_axi_rdata_reg[12]\,
      I1 => \s_axi_rdata_reg[2]\,
      I2 => \s_axi_rdata_reg[1]_1\,
      I3 => done,
      I4 => \s_axi_rdata_reg[2]_0\,
      I5 => \s_axi_rdata_reg[8]\,
      O => \s_axi_rdata[2]_i_2_n_0\
    );
\s_axi_rdata[2]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"303F5050303F5F5F"
    )
        port map (
      I0 => active_count(2),
      I1 => completed_count(2),
      I2 => \s_axi_rdata_reg[12]\,
      I3 => active_high(2),
      I4 => \s_axi_rdata_reg[2]\,
      I5 => active_period(2),
      O => \s_axi_rdata[2]_i_3_n_0\
    );
\s_axi_rdata[30]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00008808AAAA8808"
    )
        port map (
      I0 => \s_axi_rdata_reg[1]\,
      I1 => \s_axi_rdata_reg[30]\,
      I2 => \s_axi_rdata_reg[12]\,
      I3 => \s_axi_rdata_reg[8]\,
      I4 => \s_axi_rdata_reg[1]_1\,
      I5 => \s_axi_rdata[30]_i_5_n_0\,
      O => D(30)
    );
\s_axi_rdata[30]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5050303F5F5F303F"
    )
        port map (
      I0 => completed_count(30),
      I1 => active_count(30),
      I2 => \s_axi_rdata_reg[12]\,
      I3 => active_period(30),
      I4 => \s_axi_rdata_reg[2]\,
      I5 => active_high(30),
      O => \s_axi_rdata[30]_i_5_n_0\
    );
\s_axi_rdata[31]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8A88"
    )
        port map (
      I0 => \s_axi_rdata_reg[1]\,
      I1 => \s_axi_rdata_reg[31]\,
      I2 => \s_axi_rdata[31]_i_5_n_0\,
      I3 => \s_axi_rdata_reg[1]_1\,
      O => D(31)
    );
\s_axi_rdata[31]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5050303F5F5F303F"
    )
        port map (
      I0 => completed_count(31),
      I1 => active_count(31),
      I2 => \s_axi_rdata_reg[12]\,
      I3 => active_period(31),
      I4 => \s_axi_rdata_reg[2]\,
      I5 => active_high(31),
      O => \s_axi_rdata[31]_i_5_n_0\
    );
\s_axi_rdata[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"20AA2020AAAAAAAA"
    )
        port map (
      I0 => \s_axi_rdata_reg[1]\,
      I1 => \s_axi_rdata_reg[1]_0\,
      I2 => data1(0),
      I3 => \s_axi_rdata[3]_i_3_n_0\,
      I4 => \s_axi_rdata_reg[1]_1\,
      I5 => \s_axi_rdata_reg[3]\,
      O => D(3)
    );
\s_axi_rdata[3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5050303F5F5F303F"
    )
        port map (
      I0 => completed_count(3),
      I1 => active_count(3),
      I2 => \s_axi_rdata_reg[12]\,
      I3 => active_period(3),
      I4 => \s_axi_rdata_reg[2]\,
      I5 => active_high(3),
      O => \s_axi_rdata[3]_i_3_n_0\
    );
\s_axi_rdata[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => \s_axi_rdata_reg[1]\,
      I1 => \s_axi_rdata_reg[4]\,
      I2 => \s_axi_rdata_reg[1]_1\,
      I3 => \s_axi_rdata[4]_i_3_n_0\,
      O => D(4)
    );
\s_axi_rdata[4]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => completed_count(4),
      I1 => active_count(4),
      I2 => \s_axi_rdata_reg[12]\,
      I3 => active_high(4),
      I4 => \s_axi_rdata_reg[2]\,
      I5 => active_period(4),
      O => \s_axi_rdata[4]_i_3_n_0\
    );
\s_axi_rdata[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AA200020"
    )
        port map (
      I0 => \s_axi_rdata_reg[1]\,
      I1 => \s_axi_rdata_reg[5]\,
      I2 => \s_axi_rdata_reg[5]_0\,
      I3 => \s_axi_rdata_reg[1]_1\,
      I4 => \s_axi_rdata[5]_i_4_n_0\,
      O => D(5)
    );
\s_axi_rdata[5]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => completed_count(5),
      I1 => active_count(5),
      I2 => \s_axi_rdata_reg[12]\,
      I3 => active_high(5),
      I4 => \s_axi_rdata_reg[2]\,
      I5 => active_period(5),
      O => \s_axi_rdata[5]_i_4_n_0\
    );
\s_axi_rdata[6]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8A88"
    )
        port map (
      I0 => \s_axi_rdata_reg[1]\,
      I1 => \s_axi_rdata_reg[6]\,
      I2 => \s_axi_rdata[6]_i_3_n_0\,
      I3 => \s_axi_rdata_reg[1]_1\,
      O => D(6)
    );
\s_axi_rdata[6]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5050303F5F5F303F"
    )
        port map (
      I0 => completed_count(6),
      I1 => active_count(6),
      I2 => \s_axi_rdata_reg[12]\,
      I3 => active_period(6),
      I4 => \s_axi_rdata_reg[2]\,
      I5 => active_high(6),
      O => \s_axi_rdata[6]_i_3_n_0\
    );
\s_axi_rdata[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8A88"
    )
        port map (
      I0 => \s_axi_rdata_reg[1]\,
      I1 => \s_axi_rdata_reg[7]\,
      I2 => \s_axi_rdata[7]_i_3_n_0\,
      I3 => \s_axi_rdata_reg[1]_1\,
      O => D(7)
    );
\s_axi_rdata[7]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5050303F5F5F303F"
    )
        port map (
      I0 => completed_count(7),
      I1 => active_count(7),
      I2 => \s_axi_rdata_reg[12]\,
      I3 => active_period(7),
      I4 => \s_axi_rdata_reg[2]\,
      I5 => active_high(7),
      O => \s_axi_rdata[7]_i_3_n_0\
    );
\s_axi_rdata[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"08AA0808"
    )
        port map (
      I0 => \s_axi_rdata_reg[1]\,
      I1 => \s_axi_rdata_reg[8]\,
      I2 => \s_axi_rdata_reg[8]_0\,
      I3 => \s_axi_rdata[8]_i_3_n_0\,
      I4 => \s_axi_rdata_reg[1]_1\,
      O => D(8)
    );
\s_axi_rdata[8]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3030505F3F3F505F"
    )
        port map (
      I0 => active_count(8),
      I1 => completed_count(8),
      I2 => \s_axi_rdata_reg[12]\,
      I3 => active_period(8),
      I4 => \s_axi_rdata_reg[2]\,
      I5 => active_high(8),
      O => \s_axi_rdata[8]_i_3_n_0\
    );
\s_axi_rdata[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8880AAAA88808880"
    )
        port map (
      I0 => \s_axi_rdata_reg[1]\,
      I1 => \s_axi_rdata_reg[9]\,
      I2 => \s_axi_rdata_reg[9]_0\,
      I3 => \s_axi_rdata_reg[9]_1\,
      I4 => \s_axi_rdata[9]_i_5_n_0\,
      I5 => \s_axi_rdata_reg[1]_1\,
      O => D(9)
    );
\s_axi_rdata[9]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5050303F5F5F303F"
    )
        port map (
      I0 => completed_count(9),
      I1 => active_count(9),
      I2 => \s_axi_rdata_reg[12]\,
      I3 => active_period(9),
      I4 => \s_axi_rdata_reg[2]\,
      I5 => active_high(9),
      O => \s_axi_rdata[9]_i_5_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_finite_pwm_0_fdw_pwm_burst_axi is
  port (
    launch_valid_reg_0 : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 0 to 0 );
    pwm_out : out STD_LOGIC;
    done_event : out STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bvalid_reg_0 : out STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rvalid_reg_0 : out STD_LOGIC;
    burst_start : out STD_LOGIC;
    period_start : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_aresetn : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_aclk : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_arvalid : in STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_rready : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_finite_pwm_0_fdw_pwm_burst_axi : entity is "fdw_pwm_burst_axi";
end system_finite_pwm_0_fdw_pwm_burst_axi;

architecture STRUCTURE of system_finite_pwm_0_fdw_pwm_burst_axi is
  signal address_pending : STD_LOGIC;
  signal address_pending0 : STD_LOGIC;
  signal address_pending_i_1_n_0 : STD_LOGIC;
  signal cancel_pulse_i_1_n_0 : STD_LOGIC;
  signal cancel_pulse_i_2_n_0 : STD_LOGIC;
  signal cancel_pulse_reg_n_0 : STD_LOGIC;
  signal cancelled_sticky_i_2_n_0 : STD_LOGIC;
  signal core_n_10 : STD_LOGIC;
  signal core_n_11 : STD_LOGIC;
  signal core_n_12 : STD_LOGIC;
  signal core_n_13 : STD_LOGIC;
  signal core_n_14 : STD_LOGIC;
  signal core_n_15 : STD_LOGIC;
  signal core_n_16 : STD_LOGIC;
  signal core_n_17 : STD_LOGIC;
  signal core_n_18 : STD_LOGIC;
  signal core_n_19 : STD_LOGIC;
  signal core_n_20 : STD_LOGIC;
  signal core_n_21 : STD_LOGIC;
  signal core_n_22 : STD_LOGIC;
  signal core_n_23 : STD_LOGIC;
  signal core_n_24 : STD_LOGIC;
  signal core_n_25 : STD_LOGIC;
  signal core_n_26 : STD_LOGIC;
  signal core_n_27 : STD_LOGIC;
  signal core_n_28 : STD_LOGIC;
  signal core_n_29 : STD_LOGIC;
  signal core_n_30 : STD_LOGIC;
  signal core_n_31 : STD_LOGIC;
  signal core_n_32 : STD_LOGIC;
  signal core_n_33 : STD_LOGIC;
  signal core_n_34 : STD_LOGIC;
  signal core_n_35 : STD_LOGIC;
  signal core_n_36 : STD_LOGIC;
  signal core_n_37 : STD_LOGIC;
  signal core_n_38 : STD_LOGIC;
  signal core_n_39 : STD_LOGIC;
  signal core_n_4 : STD_LOGIC;
  signal core_n_40 : STD_LOGIC;
  signal core_n_41 : STD_LOGIC;
  signal core_n_43 : STD_LOGIC;
  signal core_n_44 : STD_LOGIC;
  signal core_n_5 : STD_LOGIC;
  signal core_n_7 : STD_LOGIC;
  signal core_n_8 : STD_LOGIC;
  signal core_n_9 : STD_LOGIC;
  signal data1 : STD_LOGIC_VECTOR ( 9 downto 8 );
  signal data_pending_i_1_n_0 : STD_LOGIC;
  signal data_pending_reg_n_0 : STD_LOGIC;
  signal done_sticky_i_2_n_0 : STD_LOGIC;
  signal done_sticky_i_4_n_0 : STD_LOGIC;
  signal done_sticky_i_6_n_0 : STD_LOGIC;
  signal done_sticky_i_7_n_0 : STD_LOGIC;
  signal done_sticky_i_8_n_0 : STD_LOGIC;
  signal \error_sticky[0]_i_1_n_0\ : STD_LOGIC;
  signal \error_sticky[0]_i_2_n_0\ : STD_LOGIC;
  signal \error_sticky[0]_i_3_n_0\ : STD_LOGIC;
  signal \error_sticky[0]_i_4_n_0\ : STD_LOGIC;
  signal \error_sticky[0]_i_5_n_0\ : STD_LOGIC;
  signal \error_sticky[0]_i_6_n_0\ : STD_LOGIC;
  signal \error_sticky[0]_i_7_n_0\ : STD_LOGIC;
  signal \error_sticky[2]_i_3_n_0\ : STD_LOGIC;
  signal \error_sticky[2]_i_4_n_0\ : STD_LOGIC;
  signal \error_sticky[2]_i_5_n_0\ : STD_LOGIC;
  signal \error_sticky[2]_i_6_n_0\ : STD_LOGIC;
  signal \error_sticky[2]_i_7_n_0\ : STD_LOGIC;
  signal \error_sticky[3]_i_1_n_0\ : STD_LOGIC;
  signal \error_sticky[3]_i_2_n_0\ : STD_LOGIC;
  signal \error_sticky[3]_i_3_n_0\ : STD_LOGIC;
  signal \error_sticky[3]_i_4_n_0\ : STD_LOGIC;
  signal \error_sticky[3]_i_5_n_0\ : STD_LOGIC;
  signal \error_sticky_reg_n_0_[0]\ : STD_LOGIC;
  signal \error_sticky_reg_n_0_[1]\ : STD_LOGIC;
  signal \error_sticky_reg_n_0_[2]\ : STD_LOGIC;
  signal \error_sticky_reg_n_0_[3]\ : STD_LOGIC;
  signal launch_count : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal launch_high : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \launch_period[31]_i_2_n_0\ : STD_LOGIC;
  signal \launch_period_reg_n_0_[0]\ : STD_LOGIC;
  signal \launch_period_reg_n_0_[10]\ : STD_LOGIC;
  signal \launch_period_reg_n_0_[11]\ : STD_LOGIC;
  signal \launch_period_reg_n_0_[12]\ : STD_LOGIC;
  signal \launch_period_reg_n_0_[13]\ : STD_LOGIC;
  signal \launch_period_reg_n_0_[14]\ : STD_LOGIC;
  signal \launch_period_reg_n_0_[15]\ : STD_LOGIC;
  signal \launch_period_reg_n_0_[16]\ : STD_LOGIC;
  signal \launch_period_reg_n_0_[17]\ : STD_LOGIC;
  signal \launch_period_reg_n_0_[18]\ : STD_LOGIC;
  signal \launch_period_reg_n_0_[19]\ : STD_LOGIC;
  signal \launch_period_reg_n_0_[1]\ : STD_LOGIC;
  signal \launch_period_reg_n_0_[20]\ : STD_LOGIC;
  signal \launch_period_reg_n_0_[21]\ : STD_LOGIC;
  signal \launch_period_reg_n_0_[22]\ : STD_LOGIC;
  signal \launch_period_reg_n_0_[23]\ : STD_LOGIC;
  signal \launch_period_reg_n_0_[24]\ : STD_LOGIC;
  signal \launch_period_reg_n_0_[25]\ : STD_LOGIC;
  signal \launch_period_reg_n_0_[26]\ : STD_LOGIC;
  signal \launch_period_reg_n_0_[27]\ : STD_LOGIC;
  signal \launch_period_reg_n_0_[28]\ : STD_LOGIC;
  signal \launch_period_reg_n_0_[29]\ : STD_LOGIC;
  signal \launch_period_reg_n_0_[2]\ : STD_LOGIC;
  signal \launch_period_reg_n_0_[30]\ : STD_LOGIC;
  signal \launch_period_reg_n_0_[31]\ : STD_LOGIC;
  signal \launch_period_reg_n_0_[3]\ : STD_LOGIC;
  signal \launch_period_reg_n_0_[4]\ : STD_LOGIC;
  signal \launch_period_reg_n_0_[5]\ : STD_LOGIC;
  signal \launch_period_reg_n_0_[6]\ : STD_LOGIC;
  signal \launch_period_reg_n_0_[7]\ : STD_LOGIC;
  signal \launch_period_reg_n_0_[8]\ : STD_LOGIC;
  signal \launch_period_reg_n_0_[9]\ : STD_LOGIC;
  signal launch_valid_i_2_n_0 : STD_LOGIC;
  signal launch_valid_reg_n_0 : STD_LOGIC;
  signal p_0_in0 : STD_LOGIC;
  signal \p_0_in__0\ : STD_LOGIC;
  signal p_1_in : STD_LOGIC_VECTOR ( 24 downto 0 );
  signal p_1_in5_in : STD_LOGIC;
  signal p_5_out : STD_LOGIC;
  signal p_7_out : STD_LOGIC;
  signal \^s_axi_bresp\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s_axi_bresp3 : STD_LOGIC;
  signal \s_axi_bresp3_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_bresp3_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_bresp3_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_bresp3_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_bresp3_carry__0_i_5_n_0\ : STD_LOGIC;
  signal \s_axi_bresp3_carry__0_i_6_n_0\ : STD_LOGIC;
  signal \s_axi_bresp3_carry__0_i_7_n_0\ : STD_LOGIC;
  signal \s_axi_bresp3_carry__0_i_8_n_0\ : STD_LOGIC;
  signal \s_axi_bresp3_carry__0_n_0\ : STD_LOGIC;
  signal \s_axi_bresp3_carry__0_n_1\ : STD_LOGIC;
  signal \s_axi_bresp3_carry__0_n_2\ : STD_LOGIC;
  signal \s_axi_bresp3_carry__0_n_3\ : STD_LOGIC;
  signal \s_axi_bresp3_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_bresp3_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_bresp3_carry__1_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_bresp3_carry__1_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_bresp3_carry__1_i_5_n_0\ : STD_LOGIC;
  signal \s_axi_bresp3_carry__1_i_6_n_0\ : STD_LOGIC;
  signal \s_axi_bresp3_carry__1_i_7_n_0\ : STD_LOGIC;
  signal \s_axi_bresp3_carry__1_i_8_n_0\ : STD_LOGIC;
  signal \s_axi_bresp3_carry__1_n_0\ : STD_LOGIC;
  signal \s_axi_bresp3_carry__1_n_1\ : STD_LOGIC;
  signal \s_axi_bresp3_carry__1_n_2\ : STD_LOGIC;
  signal \s_axi_bresp3_carry__1_n_3\ : STD_LOGIC;
  signal \s_axi_bresp3_carry__2_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_bresp3_carry__2_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_bresp3_carry__2_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_bresp3_carry__2_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_bresp3_carry__2_i_5_n_0\ : STD_LOGIC;
  signal \s_axi_bresp3_carry__2_i_6_n_0\ : STD_LOGIC;
  signal \s_axi_bresp3_carry__2_i_7_n_0\ : STD_LOGIC;
  signal \s_axi_bresp3_carry__2_i_8_n_0\ : STD_LOGIC;
  signal \s_axi_bresp3_carry__2_n_1\ : STD_LOGIC;
  signal \s_axi_bresp3_carry__2_n_2\ : STD_LOGIC;
  signal \s_axi_bresp3_carry__2_n_3\ : STD_LOGIC;
  signal s_axi_bresp3_carry_i_1_n_0 : STD_LOGIC;
  signal s_axi_bresp3_carry_i_2_n_0 : STD_LOGIC;
  signal s_axi_bresp3_carry_i_3_n_0 : STD_LOGIC;
  signal s_axi_bresp3_carry_i_4_n_0 : STD_LOGIC;
  signal s_axi_bresp3_carry_i_5_n_0 : STD_LOGIC;
  signal s_axi_bresp3_carry_i_6_n_0 : STD_LOGIC;
  signal s_axi_bresp3_carry_i_7_n_0 : STD_LOGIC;
  signal s_axi_bresp3_carry_i_8_n_0 : STD_LOGIC;
  signal s_axi_bresp3_carry_n_0 : STD_LOGIC;
  signal s_axi_bresp3_carry_n_1 : STD_LOGIC;
  signal s_axi_bresp3_carry_n_2 : STD_LOGIC;
  signal s_axi_bresp3_carry_n_3 : STD_LOGIC;
  signal \s_axi_bresp[1]_i_10_n_0\ : STD_LOGIC;
  signal \s_axi_bresp[1]_i_11_n_0\ : STD_LOGIC;
  signal \s_axi_bresp[1]_i_12_n_0\ : STD_LOGIC;
  signal \s_axi_bresp[1]_i_13_n_0\ : STD_LOGIC;
  signal \s_axi_bresp[1]_i_14_n_0\ : STD_LOGIC;
  signal \s_axi_bresp[1]_i_15_n_0\ : STD_LOGIC;
  signal \s_axi_bresp[1]_i_16_n_0\ : STD_LOGIC;
  signal \s_axi_bresp[1]_i_17_n_0\ : STD_LOGIC;
  signal \s_axi_bresp[1]_i_18_n_0\ : STD_LOGIC;
  signal \s_axi_bresp[1]_i_19_n_0\ : STD_LOGIC;
  signal \s_axi_bresp[1]_i_20_n_0\ : STD_LOGIC;
  signal \s_axi_bresp[1]_i_21_n_0\ : STD_LOGIC;
  signal \s_axi_bresp[1]_i_22_n_0\ : STD_LOGIC;
  signal \s_axi_bresp[1]_i_23_n_0\ : STD_LOGIC;
  signal \s_axi_bresp[1]_i_24_n_0\ : STD_LOGIC;
  signal \s_axi_bresp[1]_i_25_n_0\ : STD_LOGIC;
  signal \s_axi_bresp[1]_i_26_n_0\ : STD_LOGIC;
  signal \s_axi_bresp[1]_i_27_n_0\ : STD_LOGIC;
  signal \s_axi_bresp[1]_i_28_n_0\ : STD_LOGIC;
  signal \s_axi_bresp[1]_i_29_n_0\ : STD_LOGIC;
  signal \s_axi_bresp[1]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_bresp[1]_i_5_n_0\ : STD_LOGIC;
  signal \s_axi_bresp[1]_i_6_n_0\ : STD_LOGIC;
  signal \s_axi_bresp[1]_i_9_n_0\ : STD_LOGIC;
  signal s_axi_bvalid_i_1_n_0 : STD_LOGIC;
  signal \^s_axi_bvalid_reg_0\ : STD_LOGIC;
  signal \s_axi_rdata[0]_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[10]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[11]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[12]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[13]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[14]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[15]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[16]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[17]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[18]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[19]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[1]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[1]_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[20]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[21]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[22]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[23]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[24]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[25]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[26]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[27]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[28]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[29]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[2]_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[30]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[30]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[30]_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[31]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[31]_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[31]_i_6_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[31]_i_7_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[3]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[3]_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[3]_i_5_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[4]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[4]_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[5]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[5]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[5]_i_5_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[6]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[7]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[8]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[9]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[9]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[9]_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_rresp[1]_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_rresp[1]_i_2_n_0\ : STD_LOGIC;
  signal s_axi_rvalid014_out : STD_LOGIC;
  signal s_axi_rvalid_i_1_n_0 : STD_LOGIC;
  signal \^s_axi_rvalid_reg_0\ : STD_LOGIC;
  signal shadow_count : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \shadow_count[31]_i_2_n_0\ : STD_LOGIC;
  signal shadow_high : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \shadow_high[15]_i_1_n_0\ : STD_LOGIC;
  signal \shadow_high[23]_i_1_n_0\ : STD_LOGIC;
  signal \shadow_high[31]_i_1_n_0\ : STD_LOGIC;
  signal \shadow_high[7]_i_1_n_0\ : STD_LOGIC;
  signal shadow_period : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \shadow_period[15]_i_1_n_0\ : STD_LOGIC;
  signal \shadow_period[23]_i_1_n_0\ : STD_LOGIC;
  signal \shadow_period[31]_i_1_n_0\ : STD_LOGIC;
  signal \shadow_period[7]_i_1_n_0\ : STD_LOGIC;
  signal write_address : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal write_address0 : STD_LOGIC;
  signal write_data0 : STD_LOGIC;
  signal \write_data_reg_n_0_[0]\ : STD_LOGIC;
  signal \write_data_reg_n_0_[10]\ : STD_LOGIC;
  signal \write_data_reg_n_0_[11]\ : STD_LOGIC;
  signal \write_data_reg_n_0_[12]\ : STD_LOGIC;
  signal \write_data_reg_n_0_[13]\ : STD_LOGIC;
  signal \write_data_reg_n_0_[14]\ : STD_LOGIC;
  signal \write_data_reg_n_0_[15]\ : STD_LOGIC;
  signal \write_data_reg_n_0_[16]\ : STD_LOGIC;
  signal \write_data_reg_n_0_[17]\ : STD_LOGIC;
  signal \write_data_reg_n_0_[18]\ : STD_LOGIC;
  signal \write_data_reg_n_0_[19]\ : STD_LOGIC;
  signal \write_data_reg_n_0_[1]\ : STD_LOGIC;
  signal \write_data_reg_n_0_[20]\ : STD_LOGIC;
  signal \write_data_reg_n_0_[21]\ : STD_LOGIC;
  signal \write_data_reg_n_0_[22]\ : STD_LOGIC;
  signal \write_data_reg_n_0_[23]\ : STD_LOGIC;
  signal \write_data_reg_n_0_[24]\ : STD_LOGIC;
  signal \write_data_reg_n_0_[25]\ : STD_LOGIC;
  signal \write_data_reg_n_0_[26]\ : STD_LOGIC;
  signal \write_data_reg_n_0_[27]\ : STD_LOGIC;
  signal \write_data_reg_n_0_[28]\ : STD_LOGIC;
  signal \write_data_reg_n_0_[29]\ : STD_LOGIC;
  signal \write_data_reg_n_0_[2]\ : STD_LOGIC;
  signal \write_data_reg_n_0_[30]\ : STD_LOGIC;
  signal \write_data_reg_n_0_[31]\ : STD_LOGIC;
  signal \write_data_reg_n_0_[3]\ : STD_LOGIC;
  signal \write_data_reg_n_0_[4]\ : STD_LOGIC;
  signal \write_data_reg_n_0_[5]\ : STD_LOGIC;
  signal \write_data_reg_n_0_[6]\ : STD_LOGIC;
  signal \write_data_reg_n_0_[7]\ : STD_LOGIC;
  signal \write_data_reg_n_0_[9]\ : STD_LOGIC;
  signal \write_strobes_reg_n_0_[3]\ : STD_LOGIC;
  signal NLW_s_axi_bresp3_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_s_axi_bresp3_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_s_axi_bresp3_carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_s_axi_bresp3_carry__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of address_pending_i_1 : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of cancelled_sticky_i_2 : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of data_pending_i_1 : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of done_sticky_i_2 : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of done_sticky_i_8 : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \error_sticky[0]_i_6\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \error_sticky[2]_i_3\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \error_sticky[2]_i_6\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \error_sticky[2]_i_7\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \error_sticky[3]_i_2\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \launch_period[31]_i_2\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of launch_valid_i_2 : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of s_axi_arready_INST_0 : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of s_axi_awready_INST_0 : label is "soft_lutpair12";
  attribute COMPARATOR_THRESHOLD : integer;
  attribute COMPARATOR_THRESHOLD of s_axi_bresp3_carry : label is 11;
  attribute COMPARATOR_THRESHOLD of \s_axi_bresp3_carry__0\ : label is 11;
  attribute COMPARATOR_THRESHOLD of \s_axi_bresp3_carry__1\ : label is 11;
  attribute COMPARATOR_THRESHOLD of \s_axi_bresp3_carry__2\ : label is 11;
  attribute SOFT_HLUTNM of \s_axi_bresp[1]_i_23\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \s_axi_bresp[1]_i_25\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \s_axi_bresp[1]_i_3\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \s_axi_bresp[1]_i_5\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \s_axi_bresp[1]_i_6\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \s_axi_bresp[1]_i_7\ : label is "soft_lutpair15";
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of \s_axi_bresp_reg[1]\ : label is "xilinx.com:interface:aximm:1.0 S_AXI BRESP";
  attribute SOFT_HLUTNM of s_axi_bvalid_i_1 : label is "soft_lutpair15";
  attribute X_INTERFACE_INFO of s_axi_bvalid_reg : label is "xilinx.com:interface:aximm:1.0 S_AXI BVALID";
  attribute SOFT_HLUTNM of \s_axi_rdata[31]_i_6\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \s_axi_rdata[3]_i_5\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \s_axi_rdata[9]_i_4\ : label is "soft_lutpair5";
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
  attribute SOFT_HLUTNM of \s_axi_rresp[1]_i_2\ : label is "soft_lutpair14";
  attribute X_INTERFACE_INFO of \s_axi_rresp_reg[1]\ : label is "xilinx.com:interface:aximm:1.0 S_AXI RRESP";
  attribute SOFT_HLUTNM of s_axi_rvalid_i_1 : label is "soft_lutpair16";
  attribute X_INTERFACE_INFO of s_axi_rvalid_reg : label is "xilinx.com:interface:aximm:1.0 S_AXI RVALID";
  attribute SOFT_HLUTNM of s_axi_wready_INST_0 : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \shadow_count[31]_i_2\ : label is "soft_lutpair6";
begin
  s_axi_bresp(0) <= \^s_axi_bresp\(0);
  s_axi_bvalid_reg_0 <= \^s_axi_bvalid_reg_0\;
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
cancel_pulse_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0004000000000000"
    )
        port map (
      I0 => cancel_pulse_i_2_n_0,
      I1 => \error_sticky[3]_i_4_n_0\,
      I2 => \launch_period[31]_i_2_n_0\,
      I3 => write_address(4),
      I4 => address_pending0,
      I5 => s_axi_aresetn,
      O => cancel_pulse_i_1_n_0
    );
cancel_pulse_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF7FFFFF"
    )
        port map (
      I0 => \s_axi_bresp[1]_i_9_n_0\,
      I1 => p_7_out,
      I2 => write_address(2),
      I3 => \write_data_reg_n_0_[0]\,
      I4 => \write_data_reg_n_0_[1]\,
      O => cancel_pulse_i_2_n_0
    );
cancel_pulse_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => cancel_pulse_i_1_n_0,
      Q => cancel_pulse_reg_n_0,
      R => '0'
    );
cancelled_sticky_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => p_5_out,
      I1 => \write_data_reg_n_0_[9]\,
      O => cancelled_sticky_i_2_n_0
    );
cancelled_sticky_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => core_n_8,
      Q => data1(9),
      R => \p_0_in__0\
    );
core: entity work.system_finite_pwm_0_fdw_pwm_burst
     port map (
      CO(0) => s_axi_bresp3,
      D(31) => core_n_10,
      D(30) => core_n_11,
      D(29) => core_n_12,
      D(28) => core_n_13,
      D(27) => core_n_14,
      D(26) => core_n_15,
      D(25) => core_n_16,
      D(24) => core_n_17,
      D(23) => core_n_18,
      D(22) => core_n_19,
      D(21) => core_n_20,
      D(20) => core_n_21,
      D(19) => core_n_22,
      D(18) => core_n_23,
      D(17) => core_n_24,
      D(16) => core_n_25,
      D(15) => core_n_26,
      D(14) => core_n_27,
      D(13) => core_n_28,
      D(12) => core_n_29,
      D(11) => core_n_30,
      D(10) => core_n_31,
      D(9) => core_n_32,
      D(8) => core_n_33,
      D(7) => core_n_34,
      D(6) => core_n_35,
      D(5) => core_n_36,
      D(4) => core_n_37,
      D(3) => core_n_38,
      D(2) => core_n_39,
      D(1) => core_n_40,
      D(0) => core_n_41,
      E(0) => core_n_9,
      Q(2 downto 0) => write_address(4 downto 2),
      SR(0) => \p_0_in__0\,
      \active_high_ticks_reg[31]_0\(31 downto 0) => launch_high(31 downto 0),
      \active_period_count_reg[31]_0\(31 downto 0) => launch_count(31 downto 0),
      \active_period_ticks_reg[31]_0\(31) => \launch_period_reg_n_0_[31]\,
      \active_period_ticks_reg[31]_0\(30) => \launch_period_reg_n_0_[30]\,
      \active_period_ticks_reg[31]_0\(29) => \launch_period_reg_n_0_[29]\,
      \active_period_ticks_reg[31]_0\(28) => \launch_period_reg_n_0_[28]\,
      \active_period_ticks_reg[31]_0\(27) => \launch_period_reg_n_0_[27]\,
      \active_period_ticks_reg[31]_0\(26) => \launch_period_reg_n_0_[26]\,
      \active_period_ticks_reg[31]_0\(25) => \launch_period_reg_n_0_[25]\,
      \active_period_ticks_reg[31]_0\(24) => \launch_period_reg_n_0_[24]\,
      \active_period_ticks_reg[31]_0\(23) => \launch_period_reg_n_0_[23]\,
      \active_period_ticks_reg[31]_0\(22) => \launch_period_reg_n_0_[22]\,
      \active_period_ticks_reg[31]_0\(21) => \launch_period_reg_n_0_[21]\,
      \active_period_ticks_reg[31]_0\(20) => \launch_period_reg_n_0_[20]\,
      \active_period_ticks_reg[31]_0\(19) => \launch_period_reg_n_0_[19]\,
      \active_period_ticks_reg[31]_0\(18) => \launch_period_reg_n_0_[18]\,
      \active_period_ticks_reg[31]_0\(17) => \launch_period_reg_n_0_[17]\,
      \active_period_ticks_reg[31]_0\(16) => \launch_period_reg_n_0_[16]\,
      \active_period_ticks_reg[31]_0\(15) => \launch_period_reg_n_0_[15]\,
      \active_period_ticks_reg[31]_0\(14) => \launch_period_reg_n_0_[14]\,
      \active_period_ticks_reg[31]_0\(13) => \launch_period_reg_n_0_[13]\,
      \active_period_ticks_reg[31]_0\(12) => \launch_period_reg_n_0_[12]\,
      \active_period_ticks_reg[31]_0\(11) => \launch_period_reg_n_0_[11]\,
      \active_period_ticks_reg[31]_0\(10) => \launch_period_reg_n_0_[10]\,
      \active_period_ticks_reg[31]_0\(9) => \launch_period_reg_n_0_[9]\,
      \active_period_ticks_reg[31]_0\(8) => \launch_period_reg_n_0_[8]\,
      \active_period_ticks_reg[31]_0\(7) => \launch_period_reg_n_0_[7]\,
      \active_period_ticks_reg[31]_0\(6) => \launch_period_reg_n_0_[6]\,
      \active_period_ticks_reg[31]_0\(5) => \launch_period_reg_n_0_[5]\,
      \active_period_ticks_reg[31]_0\(4) => \launch_period_reg_n_0_[4]\,
      \active_period_ticks_reg[31]_0\(3) => \launch_period_reg_n_0_[3]\,
      \active_period_ticks_reg[31]_0\(2) => \launch_period_reg_n_0_[2]\,
      \active_period_ticks_reg[31]_0\(1) => \launch_period_reg_n_0_[1]\,
      \active_period_ticks_reg[31]_0\(0) => \launch_period_reg_n_0_[0]\,
      address_pending0 => address_pending0,
      burst_start => burst_start,
      cancelled_sticky_reg => cancelled_sticky_i_2_n_0,
      cancelled_sticky_reg_0 => done_sticky_i_7_n_0,
      cfg_error_reg_0 => launch_valid_reg_n_0,
      \counter_reg[0]_0\ => cancel_pulse_reg_n_0,
      data1(1 downto 0) => data1(9 downto 8),
      done_event => done_event,
      done_sticky_reg => done_sticky_i_2_n_0,
      done_sticky_reg_0 => done_sticky_i_4_n_0,
      \error_sticky_reg[1]\ => \error_sticky[3]_i_4_n_0\,
      \error_sticky_reg[1]_0\ => \error_sticky_reg_n_0_[1]\,
      \error_sticky_reg[1]_1\ => \error_sticky[0]_i_4_n_0\,
      \error_sticky_reg[1]_2\ => \error_sticky[2]_i_4_n_0\,
      \error_sticky_reg[1]_3\ => \error_sticky[2]_i_5_n_0\,
      \error_sticky_reg[1]_4\ => \error_sticky[2]_i_3_n_0\,
      \error_sticky_reg[2]\(2) => \write_data_reg_n_0_[2]\,
      \error_sticky_reg[2]\(1) => \write_data_reg_n_0_[1]\,
      \error_sticky_reg[2]\(0) => \write_data_reg_n_0_[0]\,
      \error_sticky_reg[2]_0\ => \error_sticky_reg_n_0_[2]\,
      \launch_count_reg[0]\ => \launch_period[31]_i_2_n_0\,
      \launch_count_reg[0]_0\ => done_sticky_i_6_n_0,
      launch_valid_reg => launch_valid_reg_0,
      launch_valid_reg_0 => launch_valid_i_2_n_0,
      period_start => period_start,
      pwm_out => pwm_out,
      s_axi_aclk => s_axi_aclk,
      s_axi_aresetn => s_axi_aresetn,
      s_axi_bresp(0) => \^s_axi_bresp\(0),
      \s_axi_bresp[1]_i_4_0\ => \s_axi_bresp[1]_i_10_n_0\,
      \s_axi_bresp[1]_i_4_1\ => \s_axi_bresp[1]_i_11_n_0\,
      \s_axi_bresp[1]_i_4_2\ => \s_axi_bresp[1]_i_12_n_0\,
      \s_axi_bresp[1]_i_4_3\ => \s_axi_bresp[1]_i_13_n_0\,
      \s_axi_bresp_reg[1]\ => core_n_43,
      \s_axi_bresp_reg[1]_0\ => \s_axi_bresp[1]_i_9_n_0\,
      \s_axi_bresp_reg[1]_1\(0) => p_7_out,
      \s_axi_bresp_reg[1]_2\ => \s_axi_bresp[1]_i_3_n_0\,
      \s_axi_bresp_reg[1]_3\ => \s_axi_bresp[1]_i_5_n_0\,
      \s_axi_bresp_reg[1]_4\ => \s_axi_bresp[1]_i_6_n_0\,
      \s_axi_rdata_reg[0]\ => \s_axi_rdata[0]_i_4_n_0\,
      \s_axi_rdata_reg[10]\ => \s_axi_rdata[10]_i_2_n_0\,
      \s_axi_rdata_reg[11]\ => \s_axi_rdata[11]_i_2_n_0\,
      \s_axi_rdata_reg[12]\ => \s_axi_rdata[30]_i_3_n_0\,
      \s_axi_rdata_reg[12]_0\ => \s_axi_rdata[12]_i_2_n_0\,
      \s_axi_rdata_reg[13]\ => \s_axi_rdata[13]_i_2_n_0\,
      \s_axi_rdata_reg[14]\ => \s_axi_rdata[14]_i_2_n_0\,
      \s_axi_rdata_reg[15]\ => \s_axi_rdata[15]_i_2_n_0\,
      \s_axi_rdata_reg[16]\ => \s_axi_rdata[16]_i_2_n_0\,
      \s_axi_rdata_reg[17]\ => \s_axi_rdata[17]_i_2_n_0\,
      \s_axi_rdata_reg[18]\ => \s_axi_rdata[18]_i_2_n_0\,
      \s_axi_rdata_reg[19]\ => \s_axi_rdata[19]_i_2_n_0\,
      \s_axi_rdata_reg[1]\ => \s_axi_rdata[31]_i_3_n_0\,
      \s_axi_rdata_reg[1]_0\ => \s_axi_rdata[3]_i_2_n_0\,
      \s_axi_rdata_reg[1]_1\ => \s_axi_rdata[31]_i_6_n_0\,
      \s_axi_rdata_reg[1]_2\ => \s_axi_rdata[1]_i_3_n_0\,
      \s_axi_rdata_reg[20]\ => \s_axi_rdata[20]_i_2_n_0\,
      \s_axi_rdata_reg[21]\ => \s_axi_rdata[21]_i_2_n_0\,
      \s_axi_rdata_reg[22]\ => \s_axi_rdata[22]_i_2_n_0\,
      \s_axi_rdata_reg[23]\ => \s_axi_rdata[23]_i_2_n_0\,
      \s_axi_rdata_reg[24]\ => \s_axi_rdata[24]_i_2_n_0\,
      \s_axi_rdata_reg[25]\ => \s_axi_rdata[25]_i_2_n_0\,
      \s_axi_rdata_reg[26]\ => \s_axi_rdata[26]_i_2_n_0\,
      \s_axi_rdata_reg[27]\ => \s_axi_rdata[27]_i_2_n_0\,
      \s_axi_rdata_reg[28]\ => \s_axi_rdata[28]_i_2_n_0\,
      \s_axi_rdata_reg[29]\ => \s_axi_rdata[29]_i_2_n_0\,
      \s_axi_rdata_reg[2]\ => \s_axi_rdata[31]_i_7_n_0\,
      \s_axi_rdata_reg[2]_0\ => \s_axi_rdata[2]_i_4_n_0\,
      \s_axi_rdata_reg[30]\ => \s_axi_rdata[30]_i_2_n_0\,
      \s_axi_rdata_reg[31]\ => \s_axi_rdata[31]_i_4_n_0\,
      \s_axi_rdata_reg[3]\ => \s_axi_rdata[3]_i_4_n_0\,
      \s_axi_rdata_reg[4]\ => \s_axi_rdata[4]_i_2_n_0\,
      \s_axi_rdata_reg[5]\ => \s_axi_rdata[5]_i_2_n_0\,
      \s_axi_rdata_reg[5]_0\ => \s_axi_rdata[5]_i_3_n_0\,
      \s_axi_rdata_reg[6]\ => \s_axi_rdata[6]_i_2_n_0\,
      \s_axi_rdata_reg[7]\ => \s_axi_rdata[7]_i_2_n_0\,
      \s_axi_rdata_reg[8]\ => \s_axi_rdata[30]_i_4_n_0\,
      \s_axi_rdata_reg[8]_0\ => \s_axi_rdata[8]_i_2_n_0\,
      \s_axi_rdata_reg[9]\ => \s_axi_rdata[9]_i_2_n_0\,
      \s_axi_rdata_reg[9]_0\ => \s_axi_rdata[9]_i_3_n_0\,
      \s_axi_rdata_reg[9]_1\ => \s_axi_rdata[9]_i_4_n_0\,
      \write_address_reg[2]\ => core_n_44,
      \write_address_reg[3]\ => core_n_4,
      \write_address_reg[3]_0\ => core_n_5,
      \write_address_reg[3]_1\ => core_n_7,
      \write_address_reg[3]_2\ => core_n_8
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
done_sticky_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => p_5_out,
      I1 => p_1_in5_in,
      O => done_sticky_i_2_n_0
    );
done_sticky_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000800000000"
    )
        port map (
      I0 => address_pending0,
      I1 => \error_sticky[3]_i_4_n_0\,
      I2 => write_address(1),
      I3 => write_address(0),
      I4 => write_address(4),
      I5 => write_address(2),
      O => done_sticky_i_4_n_0
    );
done_sticky_i_6: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFBF"
    )
        port map (
      I0 => \error_sticky[0]_i_5_n_0\,
      I1 => p_7_out,
      I2 => \write_data_reg_n_0_[0]\,
      I3 => \write_data_reg_n_0_[1]\,
      I4 => \write_data_reg_n_0_[7]\,
      O => done_sticky_i_6_n_0
    );
done_sticky_i_7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFDFFFFF"
    )
        port map (
      I0 => \write_data_reg_n_0_[0]\,
      I1 => \write_data_reg_n_0_[1]\,
      I2 => p_7_out,
      I3 => done_sticky_i_8_n_0,
      I4 => address_pending0,
      I5 => \launch_period[31]_i_2_n_0\,
      O => done_sticky_i_7_n_0
    );
done_sticky_i_8: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => write_address(4),
      I1 => write_address(2),
      O => done_sticky_i_8_n_0
    );
done_sticky_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => core_n_7,
      Q => data1(8),
      R => \p_0_in__0\
    );
\error_sticky[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFF7F7F40004040"
    )
        port map (
      I0 => \error_sticky[0]_i_2_n_0\,
      I1 => \error_sticky[3]_i_4_n_0\,
      I2 => address_pending0,
      I3 => \error_sticky[0]_i_3_n_0\,
      I4 => \error_sticky[0]_i_4_n_0\,
      I5 => \error_sticky_reg_n_0_[0]\,
      O => \error_sticky[0]_i_1_n_0\
    );
\error_sticky[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCC4444CCCC4447"
    )
        port map (
      I0 => \error_sticky_reg_n_0_[0]\,
      I1 => write_address(3),
      I2 => \write_data_reg_n_0_[1]\,
      I3 => \write_data_reg_n_0_[7]\,
      I4 => \write_data_reg_n_0_[0]\,
      I5 => \error_sticky[0]_i_5_n_0\,
      O => \error_sticky[0]_i_2_n_0\
    );
\error_sticky[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000000FEFA"
    )
        port map (
      I0 => \error_sticky[0]_i_5_n_0\,
      I1 => \write_data_reg_n_0_[0]\,
      I2 => \write_data_reg_n_0_[7]\,
      I3 => \write_data_reg_n_0_[1]\,
      I4 => \error_sticky[0]_i_6_n_0\,
      I5 => \error_sticky[0]_i_7_n_0\,
      O => \error_sticky[0]_i_3_n_0\
    );
\error_sticky[0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFF7FF"
    )
        port map (
      I0 => p_7_out,
      I1 => write_address(3),
      I2 => write_address(4),
      I3 => write_address(2),
      I4 => write_address(0),
      I5 => write_address(1),
      O => \error_sticky[0]_i_4_n_0\
    );
\error_sticky[0]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \write_data_reg_n_0_[6]\,
      I1 => \write_data_reg_n_0_[4]\,
      I2 => \write_data_reg_n_0_[2]\,
      I3 => \write_data_reg_n_0_[3]\,
      I4 => \write_data_reg_n_0_[5]\,
      O => \error_sticky[0]_i_5_n_0\
    );
\error_sticky[0]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFF8B"
    )
        port map (
      I0 => write_address(3),
      I1 => write_address(2),
      I2 => write_address(4),
      I3 => write_address(0),
      I4 => write_address(1),
      O => \error_sticky[0]_i_6_n_0\
    );
\error_sticky[0]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5555555555557DF5"
    )
        port map (
      I0 => p_7_out,
      I1 => write_address(3),
      I2 => write_address(4),
      I3 => write_address(2),
      I4 => write_address(0),
      I5 => write_address(1),
      O => \error_sticky[0]_i_7_n_0\
    );
\error_sticky[2]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0800"
    )
        port map (
      I0 => data_pending_reg_n_0,
      I1 => address_pending,
      I2 => \^s_axi_bvalid_reg_0\,
      I3 => \error_sticky[3]_i_4_n_0\,
      O => \error_sticky[2]_i_3_n_0\
    );
\error_sticky[2]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFB"
    )
        port map (
      I0 => write_address(3),
      I1 => write_address(2),
      I2 => write_address(4),
      I3 => write_address(0),
      I4 => write_address(1),
      I5 => done_sticky_i_6_n_0,
      O => \error_sticky[2]_i_4_n_0\
    );
\error_sticky[2]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF0404FF04"
    )
        port map (
      I0 => \s_axi_bresp[1]_i_13_n_0\,
      I1 => \error_sticky[2]_i_6_n_0\,
      I2 => \error_sticky[2]_i_7_n_0\,
      I3 => \s_axi_bresp[1]_i_11_n_0\,
      I4 => \s_axi_bresp[1]_i_10_n_0\,
      I5 => s_axi_bresp3,
      O => \error_sticky[2]_i_5_n_0\
    );
\error_sticky[2]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => shadow_period(0),
      I1 => shadow_period(3),
      I2 => shadow_period(1),
      I3 => shadow_period(2),
      I4 => \s_axi_bresp[1]_i_22_n_0\,
      O => \error_sticky[2]_i_6_n_0\
    );
\error_sticky[2]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => shadow_period(8),
      I1 => shadow_period(11),
      I2 => shadow_period(9),
      I3 => shadow_period(10),
      I4 => \s_axi_bresp[1]_i_24_n_0\,
      O => \error_sticky[2]_i_7_n_0\
    );
\error_sticky[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFFFBFBFA000A0A0"
    )
        port map (
      I0 => \error_sticky[3]_i_2_n_0\,
      I1 => \write_data_reg_n_0_[3]\,
      I2 => address_pending0,
      I3 => \error_sticky[3]_i_3_n_0\,
      I4 => \error_sticky[3]_i_4_n_0\,
      I5 => \error_sticky_reg_n_0_[3]\,
      O => \error_sticky[3]_i_1_n_0\
    );
\error_sticky[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFDFFFF"
    )
        port map (
      I0 => write_address(2),
      I1 => write_address(4),
      I2 => write_address(0),
      I3 => write_address(1),
      I4 => \error_sticky[3]_i_4_n_0\,
      O => \error_sticky[3]_i_2_n_0\
    );
\error_sticky[3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEFFEEEFFEEFEEEF"
    )
        port map (
      I0 => write_address(1),
      I1 => write_address(0),
      I2 => write_address(2),
      I3 => write_address(4),
      I4 => write_address(3),
      I5 => p_7_out,
      O => \error_sticky[3]_i_3_n_0\
    );
\error_sticky[3]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => write_address(5),
      I1 => write_address(8),
      I2 => write_address(10),
      I3 => \error_sticky[3]_i_5_n_0\,
      O => \error_sticky[3]_i_4_n_0\
    );
\error_sticky[3]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => write_address(7),
      I1 => write_address(6),
      I2 => write_address(11),
      I3 => write_address(9),
      O => \error_sticky[3]_i_5_n_0\
    );
\error_sticky_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \error_sticky[0]_i_1_n_0\,
      Q => \error_sticky_reg_n_0_[0]\,
      R => \p_0_in__0\
    );
\error_sticky_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => core_n_4,
      Q => \error_sticky_reg_n_0_[1]\,
      R => \p_0_in__0\
    );
\error_sticky_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => core_n_5,
      Q => \error_sticky_reg_n_0_[2]\,
      R => \p_0_in__0\
    );
\error_sticky_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \error_sticky[3]_i_1_n_0\,
      Q => \error_sticky_reg_n_0_[3]\,
      R => \p_0_in__0\
    );
\launch_count_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_count(0),
      Q => launch_count(0),
      R => \p_0_in__0\
    );
\launch_count_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_count(10),
      Q => launch_count(10),
      R => \p_0_in__0\
    );
\launch_count_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_count(11),
      Q => launch_count(11),
      R => \p_0_in__0\
    );
\launch_count_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_count(12),
      Q => launch_count(12),
      R => \p_0_in__0\
    );
\launch_count_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_count(13),
      Q => launch_count(13),
      R => \p_0_in__0\
    );
\launch_count_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_count(14),
      Q => launch_count(14),
      R => \p_0_in__0\
    );
\launch_count_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_count(15),
      Q => launch_count(15),
      R => \p_0_in__0\
    );
\launch_count_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_count(16),
      Q => launch_count(16),
      R => \p_0_in__0\
    );
\launch_count_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_count(17),
      Q => launch_count(17),
      R => \p_0_in__0\
    );
\launch_count_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_count(18),
      Q => launch_count(18),
      R => \p_0_in__0\
    );
\launch_count_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_count(19),
      Q => launch_count(19),
      R => \p_0_in__0\
    );
\launch_count_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_count(1),
      Q => launch_count(1),
      R => \p_0_in__0\
    );
\launch_count_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_count(20),
      Q => launch_count(20),
      R => \p_0_in__0\
    );
\launch_count_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_count(21),
      Q => launch_count(21),
      R => \p_0_in__0\
    );
\launch_count_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_count(22),
      Q => launch_count(22),
      R => \p_0_in__0\
    );
\launch_count_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_count(23),
      Q => launch_count(23),
      R => \p_0_in__0\
    );
\launch_count_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_count(24),
      Q => launch_count(24),
      R => \p_0_in__0\
    );
\launch_count_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_count(25),
      Q => launch_count(25),
      R => \p_0_in__0\
    );
\launch_count_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_count(26),
      Q => launch_count(26),
      R => \p_0_in__0\
    );
\launch_count_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_count(27),
      Q => launch_count(27),
      R => \p_0_in__0\
    );
\launch_count_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_count(28),
      Q => launch_count(28),
      R => \p_0_in__0\
    );
\launch_count_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_count(29),
      Q => launch_count(29),
      R => \p_0_in__0\
    );
\launch_count_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_count(2),
      Q => launch_count(2),
      R => \p_0_in__0\
    );
\launch_count_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_count(30),
      Q => launch_count(30),
      R => \p_0_in__0\
    );
\launch_count_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_count(31),
      Q => launch_count(31),
      R => \p_0_in__0\
    );
\launch_count_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_count(3),
      Q => launch_count(3),
      R => \p_0_in__0\
    );
\launch_count_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_count(4),
      Q => launch_count(4),
      R => \p_0_in__0\
    );
\launch_count_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_count(5),
      Q => launch_count(5),
      R => \p_0_in__0\
    );
\launch_count_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_count(6),
      Q => launch_count(6),
      R => \p_0_in__0\
    );
\launch_count_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_count(7),
      Q => launch_count(7),
      R => \p_0_in__0\
    );
\launch_count_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_count(8),
      Q => launch_count(8),
      R => \p_0_in__0\
    );
\launch_count_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_count(9),
      Q => launch_count(9),
      R => \p_0_in__0\
    );
\launch_high_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_high(0),
      Q => launch_high(0),
      R => \p_0_in__0\
    );
\launch_high_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_high(10),
      Q => launch_high(10),
      R => \p_0_in__0\
    );
\launch_high_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_high(11),
      Q => launch_high(11),
      R => \p_0_in__0\
    );
\launch_high_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_high(12),
      Q => launch_high(12),
      R => \p_0_in__0\
    );
\launch_high_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_high(13),
      Q => launch_high(13),
      R => \p_0_in__0\
    );
\launch_high_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_high(14),
      Q => launch_high(14),
      R => \p_0_in__0\
    );
\launch_high_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_high(15),
      Q => launch_high(15),
      R => \p_0_in__0\
    );
\launch_high_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_high(16),
      Q => launch_high(16),
      R => \p_0_in__0\
    );
\launch_high_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_high(17),
      Q => launch_high(17),
      R => \p_0_in__0\
    );
\launch_high_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_high(18),
      Q => launch_high(18),
      R => \p_0_in__0\
    );
\launch_high_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_high(19),
      Q => launch_high(19),
      R => \p_0_in__0\
    );
\launch_high_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_high(1),
      Q => launch_high(1),
      R => \p_0_in__0\
    );
\launch_high_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_high(20),
      Q => launch_high(20),
      R => \p_0_in__0\
    );
\launch_high_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_high(21),
      Q => launch_high(21),
      R => \p_0_in__0\
    );
\launch_high_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_high(22),
      Q => launch_high(22),
      R => \p_0_in__0\
    );
\launch_high_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_high(23),
      Q => launch_high(23),
      R => \p_0_in__0\
    );
\launch_high_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_high(24),
      Q => launch_high(24),
      R => \p_0_in__0\
    );
\launch_high_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_high(25),
      Q => launch_high(25),
      R => \p_0_in__0\
    );
\launch_high_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_high(26),
      Q => launch_high(26),
      R => \p_0_in__0\
    );
\launch_high_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_high(27),
      Q => launch_high(27),
      R => \p_0_in__0\
    );
\launch_high_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_high(28),
      Q => launch_high(28),
      R => \p_0_in__0\
    );
\launch_high_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_high(29),
      Q => launch_high(29),
      R => \p_0_in__0\
    );
\launch_high_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_high(2),
      Q => launch_high(2),
      R => \p_0_in__0\
    );
\launch_high_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_high(30),
      Q => launch_high(30),
      R => \p_0_in__0\
    );
\launch_high_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_high(31),
      Q => launch_high(31),
      R => \p_0_in__0\
    );
\launch_high_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_high(3),
      Q => launch_high(3),
      R => \p_0_in__0\
    );
\launch_high_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_high(4),
      Q => launch_high(4),
      R => \p_0_in__0\
    );
\launch_high_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_high(5),
      Q => launch_high(5),
      R => \p_0_in__0\
    );
\launch_high_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_high(6),
      Q => launch_high(6),
      R => \p_0_in__0\
    );
\launch_high_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_high(7),
      Q => launch_high(7),
      R => \p_0_in__0\
    );
\launch_high_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_high(8),
      Q => launch_high(8),
      R => \p_0_in__0\
    );
\launch_high_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_high(9),
      Q => launch_high(9),
      R => \p_0_in__0\
    );
\launch_period[31]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => write_address(3),
      I1 => write_address(1),
      I2 => write_address(0),
      O => \launch_period[31]_i_2_n_0\
    );
\launch_period_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_period(0),
      Q => \launch_period_reg_n_0_[0]\,
      R => \p_0_in__0\
    );
\launch_period_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_period(10),
      Q => \launch_period_reg_n_0_[10]\,
      R => \p_0_in__0\
    );
\launch_period_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_period(11),
      Q => \launch_period_reg_n_0_[11]\,
      R => \p_0_in__0\
    );
\launch_period_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_period(12),
      Q => \launch_period_reg_n_0_[12]\,
      R => \p_0_in__0\
    );
\launch_period_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_period(13),
      Q => \launch_period_reg_n_0_[13]\,
      R => \p_0_in__0\
    );
\launch_period_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_period(14),
      Q => \launch_period_reg_n_0_[14]\,
      R => \p_0_in__0\
    );
\launch_period_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_period(15),
      Q => \launch_period_reg_n_0_[15]\,
      R => \p_0_in__0\
    );
\launch_period_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_period(16),
      Q => \launch_period_reg_n_0_[16]\,
      R => \p_0_in__0\
    );
\launch_period_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_period(17),
      Q => \launch_period_reg_n_0_[17]\,
      R => \p_0_in__0\
    );
\launch_period_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_period(18),
      Q => \launch_period_reg_n_0_[18]\,
      R => \p_0_in__0\
    );
\launch_period_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_period(19),
      Q => \launch_period_reg_n_0_[19]\,
      R => \p_0_in__0\
    );
\launch_period_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_period(1),
      Q => \launch_period_reg_n_0_[1]\,
      R => \p_0_in__0\
    );
\launch_period_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_period(20),
      Q => \launch_period_reg_n_0_[20]\,
      R => \p_0_in__0\
    );
\launch_period_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_period(21),
      Q => \launch_period_reg_n_0_[21]\,
      R => \p_0_in__0\
    );
\launch_period_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_period(22),
      Q => \launch_period_reg_n_0_[22]\,
      R => \p_0_in__0\
    );
\launch_period_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_period(23),
      Q => \launch_period_reg_n_0_[23]\,
      R => \p_0_in__0\
    );
\launch_period_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_period(24),
      Q => \launch_period_reg_n_0_[24]\,
      R => \p_0_in__0\
    );
\launch_period_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_period(25),
      Q => \launch_period_reg_n_0_[25]\,
      R => \p_0_in__0\
    );
\launch_period_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_period(26),
      Q => \launch_period_reg_n_0_[26]\,
      R => \p_0_in__0\
    );
\launch_period_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_period(27),
      Q => \launch_period_reg_n_0_[27]\,
      R => \p_0_in__0\
    );
\launch_period_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_period(28),
      Q => \launch_period_reg_n_0_[28]\,
      R => \p_0_in__0\
    );
\launch_period_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_period(29),
      Q => \launch_period_reg_n_0_[29]\,
      R => \p_0_in__0\
    );
\launch_period_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_period(2),
      Q => \launch_period_reg_n_0_[2]\,
      R => \p_0_in__0\
    );
\launch_period_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_period(30),
      Q => \launch_period_reg_n_0_[30]\,
      R => \p_0_in__0\
    );
\launch_period_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_period(31),
      Q => \launch_period_reg_n_0_[31]\,
      R => \p_0_in__0\
    );
\launch_period_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_period(3),
      Q => \launch_period_reg_n_0_[3]\,
      R => \p_0_in__0\
    );
\launch_period_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_period(4),
      Q => \launch_period_reg_n_0_[4]\,
      R => \p_0_in__0\
    );
\launch_period_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_period(5),
      Q => \launch_period_reg_n_0_[5]\,
      R => \p_0_in__0\
    );
\launch_period_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_period(6),
      Q => \launch_period_reg_n_0_[6]\,
      R => \p_0_in__0\
    );
\launch_period_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_period(7),
      Q => \launch_period_reg_n_0_[7]\,
      R => \p_0_in__0\
    );
\launch_period_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_period(8),
      Q => \launch_period_reg_n_0_[8]\,
      R => \p_0_in__0\
    );
\launch_period_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => core_n_9,
      D => shadow_period(9),
      Q => \launch_period_reg_n_0_[9]\,
      R => \p_0_in__0\
    );
launch_valid_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000002"
    )
        port map (
      I0 => \error_sticky[3]_i_4_n_0\,
      I1 => write_address(3),
      I2 => write_address(1),
      I3 => write_address(0),
      I4 => write_address(4),
      O => launch_valid_i_2_n_0
    );
launch_valid_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => core_n_44,
      Q => launch_valid_reg_n_0,
      R => '0'
    );
s_axi_arready_INST_0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => s_axi_aresetn,
      I1 => \^s_axi_rvalid_reg_0\,
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
s_axi_bresp3_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => s_axi_bresp3_carry_n_0,
      CO(2) => s_axi_bresp3_carry_n_1,
      CO(1) => s_axi_bresp3_carry_n_2,
      CO(0) => s_axi_bresp3_carry_n_3,
      CYINIT => '0',
      DI(3) => s_axi_bresp3_carry_i_1_n_0,
      DI(2) => s_axi_bresp3_carry_i_2_n_0,
      DI(1) => s_axi_bresp3_carry_i_3_n_0,
      DI(0) => s_axi_bresp3_carry_i_4_n_0,
      O(3 downto 0) => NLW_s_axi_bresp3_carry_O_UNCONNECTED(3 downto 0),
      S(3) => s_axi_bresp3_carry_i_5_n_0,
      S(2) => s_axi_bresp3_carry_i_6_n_0,
      S(1) => s_axi_bresp3_carry_i_7_n_0,
      S(0) => s_axi_bresp3_carry_i_8_n_0
    );
\s_axi_bresp3_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => s_axi_bresp3_carry_n_0,
      CO(3) => \s_axi_bresp3_carry__0_n_0\,
      CO(2) => \s_axi_bresp3_carry__0_n_1\,
      CO(1) => \s_axi_bresp3_carry__0_n_2\,
      CO(0) => \s_axi_bresp3_carry__0_n_3\,
      CYINIT => '0',
      DI(3) => \s_axi_bresp3_carry__0_i_1_n_0\,
      DI(2) => \s_axi_bresp3_carry__0_i_2_n_0\,
      DI(1) => \s_axi_bresp3_carry__0_i_3_n_0\,
      DI(0) => \s_axi_bresp3_carry__0_i_4_n_0\,
      O(3 downto 0) => \NLW_s_axi_bresp3_carry__0_O_UNCONNECTED\(3 downto 0),
      S(3) => \s_axi_bresp3_carry__0_i_5_n_0\,
      S(2) => \s_axi_bresp3_carry__0_i_6_n_0\,
      S(1) => \s_axi_bresp3_carry__0_i_7_n_0\,
      S(0) => \s_axi_bresp3_carry__0_i_8_n_0\
    );
\s_axi_bresp3_carry__0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => shadow_high(15),
      I1 => shadow_period(15),
      I2 => shadow_high(14),
      I3 => shadow_period(14),
      O => \s_axi_bresp3_carry__0_i_1_n_0\
    );
\s_axi_bresp3_carry__0_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => shadow_high(13),
      I1 => shadow_period(13),
      I2 => shadow_high(12),
      I3 => shadow_period(12),
      O => \s_axi_bresp3_carry__0_i_2_n_0\
    );
\s_axi_bresp3_carry__0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => shadow_high(11),
      I1 => shadow_period(11),
      I2 => shadow_high(10),
      I3 => shadow_period(10),
      O => \s_axi_bresp3_carry__0_i_3_n_0\
    );
\s_axi_bresp3_carry__0_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => shadow_high(9),
      I1 => shadow_period(9),
      I2 => shadow_high(8),
      I3 => shadow_period(8),
      O => \s_axi_bresp3_carry__0_i_4_n_0\
    );
\s_axi_bresp3_carry__0_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => shadow_period(15),
      I1 => shadow_high(15),
      I2 => shadow_period(14),
      I3 => shadow_high(14),
      O => \s_axi_bresp3_carry__0_i_5_n_0\
    );
\s_axi_bresp3_carry__0_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => shadow_period(13),
      I1 => shadow_high(13),
      I2 => shadow_period(12),
      I3 => shadow_high(12),
      O => \s_axi_bresp3_carry__0_i_6_n_0\
    );
\s_axi_bresp3_carry__0_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => shadow_period(11),
      I1 => shadow_high(11),
      I2 => shadow_period(10),
      I3 => shadow_high(10),
      O => \s_axi_bresp3_carry__0_i_7_n_0\
    );
\s_axi_bresp3_carry__0_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => shadow_period(9),
      I1 => shadow_high(9),
      I2 => shadow_period(8),
      I3 => shadow_high(8),
      O => \s_axi_bresp3_carry__0_i_8_n_0\
    );
\s_axi_bresp3_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \s_axi_bresp3_carry__0_n_0\,
      CO(3) => \s_axi_bresp3_carry__1_n_0\,
      CO(2) => \s_axi_bresp3_carry__1_n_1\,
      CO(1) => \s_axi_bresp3_carry__1_n_2\,
      CO(0) => \s_axi_bresp3_carry__1_n_3\,
      CYINIT => '0',
      DI(3) => \s_axi_bresp3_carry__1_i_1_n_0\,
      DI(2) => \s_axi_bresp3_carry__1_i_2_n_0\,
      DI(1) => \s_axi_bresp3_carry__1_i_3_n_0\,
      DI(0) => \s_axi_bresp3_carry__1_i_4_n_0\,
      O(3 downto 0) => \NLW_s_axi_bresp3_carry__1_O_UNCONNECTED\(3 downto 0),
      S(3) => \s_axi_bresp3_carry__1_i_5_n_0\,
      S(2) => \s_axi_bresp3_carry__1_i_6_n_0\,
      S(1) => \s_axi_bresp3_carry__1_i_7_n_0\,
      S(0) => \s_axi_bresp3_carry__1_i_8_n_0\
    );
\s_axi_bresp3_carry__1_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => shadow_high(23),
      I1 => shadow_period(23),
      I2 => shadow_high(22),
      I3 => shadow_period(22),
      O => \s_axi_bresp3_carry__1_i_1_n_0\
    );
\s_axi_bresp3_carry__1_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => shadow_high(21),
      I1 => shadow_period(21),
      I2 => shadow_high(20),
      I3 => shadow_period(20),
      O => \s_axi_bresp3_carry__1_i_2_n_0\
    );
\s_axi_bresp3_carry__1_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => shadow_high(19),
      I1 => shadow_period(19),
      I2 => shadow_high(18),
      I3 => shadow_period(18),
      O => \s_axi_bresp3_carry__1_i_3_n_0\
    );
\s_axi_bresp3_carry__1_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => shadow_high(17),
      I1 => shadow_period(17),
      I2 => shadow_high(16),
      I3 => shadow_period(16),
      O => \s_axi_bresp3_carry__1_i_4_n_0\
    );
\s_axi_bresp3_carry__1_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => shadow_period(23),
      I1 => shadow_high(23),
      I2 => shadow_period(22),
      I3 => shadow_high(22),
      O => \s_axi_bresp3_carry__1_i_5_n_0\
    );
\s_axi_bresp3_carry__1_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => shadow_period(21),
      I1 => shadow_high(21),
      I2 => shadow_period(20),
      I3 => shadow_high(20),
      O => \s_axi_bresp3_carry__1_i_6_n_0\
    );
\s_axi_bresp3_carry__1_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => shadow_period(19),
      I1 => shadow_high(19),
      I2 => shadow_period(18),
      I3 => shadow_high(18),
      O => \s_axi_bresp3_carry__1_i_7_n_0\
    );
\s_axi_bresp3_carry__1_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => shadow_period(17),
      I1 => shadow_high(17),
      I2 => shadow_period(16),
      I3 => shadow_high(16),
      O => \s_axi_bresp3_carry__1_i_8_n_0\
    );
\s_axi_bresp3_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \s_axi_bresp3_carry__1_n_0\,
      CO(3) => s_axi_bresp3,
      CO(2) => \s_axi_bresp3_carry__2_n_1\,
      CO(1) => \s_axi_bresp3_carry__2_n_2\,
      CO(0) => \s_axi_bresp3_carry__2_n_3\,
      CYINIT => '0',
      DI(3) => \s_axi_bresp3_carry__2_i_1_n_0\,
      DI(2) => \s_axi_bresp3_carry__2_i_2_n_0\,
      DI(1) => \s_axi_bresp3_carry__2_i_3_n_0\,
      DI(0) => \s_axi_bresp3_carry__2_i_4_n_0\,
      O(3 downto 0) => \NLW_s_axi_bresp3_carry__2_O_UNCONNECTED\(3 downto 0),
      S(3) => \s_axi_bresp3_carry__2_i_5_n_0\,
      S(2) => \s_axi_bresp3_carry__2_i_6_n_0\,
      S(1) => \s_axi_bresp3_carry__2_i_7_n_0\,
      S(0) => \s_axi_bresp3_carry__2_i_8_n_0\
    );
\s_axi_bresp3_carry__2_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => shadow_high(31),
      I1 => shadow_period(31),
      I2 => shadow_high(30),
      I3 => shadow_period(30),
      O => \s_axi_bresp3_carry__2_i_1_n_0\
    );
\s_axi_bresp3_carry__2_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => shadow_high(29),
      I1 => shadow_period(29),
      I2 => shadow_high(28),
      I3 => shadow_period(28),
      O => \s_axi_bresp3_carry__2_i_2_n_0\
    );
\s_axi_bresp3_carry__2_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => shadow_high(27),
      I1 => shadow_period(27),
      I2 => shadow_high(26),
      I3 => shadow_period(26),
      O => \s_axi_bresp3_carry__2_i_3_n_0\
    );
\s_axi_bresp3_carry__2_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => shadow_high(25),
      I1 => shadow_period(25),
      I2 => shadow_high(24),
      I3 => shadow_period(24),
      O => \s_axi_bresp3_carry__2_i_4_n_0\
    );
\s_axi_bresp3_carry__2_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => shadow_period(31),
      I1 => shadow_high(31),
      I2 => shadow_period(30),
      I3 => shadow_high(30),
      O => \s_axi_bresp3_carry__2_i_5_n_0\
    );
\s_axi_bresp3_carry__2_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => shadow_period(29),
      I1 => shadow_high(29),
      I2 => shadow_period(28),
      I3 => shadow_high(28),
      O => \s_axi_bresp3_carry__2_i_6_n_0\
    );
\s_axi_bresp3_carry__2_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => shadow_period(27),
      I1 => shadow_high(27),
      I2 => shadow_period(26),
      I3 => shadow_high(26),
      O => \s_axi_bresp3_carry__2_i_7_n_0\
    );
\s_axi_bresp3_carry__2_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => shadow_period(25),
      I1 => shadow_high(25),
      I2 => shadow_period(24),
      I3 => shadow_high(24),
      O => \s_axi_bresp3_carry__2_i_8_n_0\
    );
s_axi_bresp3_carry_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => shadow_high(7),
      I1 => shadow_period(7),
      I2 => shadow_high(6),
      I3 => shadow_period(6),
      O => s_axi_bresp3_carry_i_1_n_0
    );
s_axi_bresp3_carry_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => shadow_high(5),
      I1 => shadow_period(5),
      I2 => shadow_high(4),
      I3 => shadow_period(4),
      O => s_axi_bresp3_carry_i_2_n_0
    );
s_axi_bresp3_carry_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => shadow_high(3),
      I1 => shadow_period(3),
      I2 => shadow_high(2),
      I3 => shadow_period(2),
      O => s_axi_bresp3_carry_i_3_n_0
    );
s_axi_bresp3_carry_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => shadow_high(1),
      I1 => shadow_period(1),
      I2 => shadow_high(0),
      I3 => shadow_period(0),
      O => s_axi_bresp3_carry_i_4_n_0
    );
s_axi_bresp3_carry_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => shadow_period(7),
      I1 => shadow_high(7),
      I2 => shadow_period(6),
      I3 => shadow_high(6),
      O => s_axi_bresp3_carry_i_5_n_0
    );
s_axi_bresp3_carry_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => shadow_period(5),
      I1 => shadow_high(5),
      I2 => shadow_period(4),
      I3 => shadow_high(4),
      O => s_axi_bresp3_carry_i_6_n_0
    );
s_axi_bresp3_carry_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => shadow_period(3),
      I1 => shadow_high(3),
      I2 => shadow_period(2),
      I3 => shadow_high(2),
      O => s_axi_bresp3_carry_i_7_n_0
    );
s_axi_bresp3_carry_i_8: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => shadow_period(1),
      I1 => shadow_high(1),
      I2 => shadow_period(0),
      I3 => shadow_high(0),
      O => s_axi_bresp3_carry_i_8_n_0
    );
\s_axi_bresp[1]_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \s_axi_bresp[1]_i_14_n_0\,
      I1 => \s_axi_bresp[1]_i_15_n_0\,
      I2 => \s_axi_bresp[1]_i_16_n_0\,
      I3 => \s_axi_bresp[1]_i_17_n_0\,
      O => \s_axi_bresp[1]_i_10_n_0\
    );
\s_axi_bresp[1]_i_11\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0004"
    )
        port map (
      I0 => \s_axi_bresp[1]_i_18_n_0\,
      I1 => \s_axi_bresp[1]_i_19_n_0\,
      I2 => \s_axi_bresp[1]_i_20_n_0\,
      I3 => \s_axi_bresp[1]_i_21_n_0\,
      O => \s_axi_bresp[1]_i_11_n_0\
    );
\s_axi_bresp[1]_i_12\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0004"
    )
        port map (
      I0 => \s_axi_bresp[1]_i_22_n_0\,
      I1 => \s_axi_bresp[1]_i_23_n_0\,
      I2 => \s_axi_bresp[1]_i_24_n_0\,
      I3 => \s_axi_bresp[1]_i_25_n_0\,
      O => \s_axi_bresp[1]_i_12_n_0\
    );
\s_axi_bresp[1]_i_13\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \s_axi_bresp[1]_i_26_n_0\,
      I1 => \s_axi_bresp[1]_i_27_n_0\,
      I2 => \s_axi_bresp[1]_i_28_n_0\,
      I3 => \s_axi_bresp[1]_i_29_n_0\,
      O => \s_axi_bresp[1]_i_13_n_0\
    );
\s_axi_bresp[1]_i_14\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => shadow_count(19),
      I1 => shadow_count(16),
      I2 => shadow_count(18),
      I3 => shadow_count(17),
      O => \s_axi_bresp[1]_i_14_n_0\
    );
\s_axi_bresp[1]_i_15\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => shadow_count(3),
      I1 => shadow_count(0),
      I2 => shadow_count(2),
      I3 => shadow_count(1),
      O => \s_axi_bresp[1]_i_15_n_0\
    );
\s_axi_bresp[1]_i_16\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => shadow_count(7),
      I1 => shadow_count(4),
      I2 => shadow_count(6),
      I3 => shadow_count(5),
      O => \s_axi_bresp[1]_i_16_n_0\
    );
\s_axi_bresp[1]_i_17\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => shadow_count(23),
      I1 => shadow_count(20),
      I2 => shadow_count(22),
      I3 => shadow_count(21),
      O => \s_axi_bresp[1]_i_17_n_0\
    );
\s_axi_bresp[1]_i_18\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => shadow_count(11),
      I1 => shadow_count(8),
      I2 => shadow_count(10),
      I3 => shadow_count(9),
      O => \s_axi_bresp[1]_i_18_n_0\
    );
\s_axi_bresp[1]_i_19\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => shadow_count(27),
      I1 => shadow_count(24),
      I2 => shadow_count(26),
      I3 => shadow_count(25),
      O => \s_axi_bresp[1]_i_19_n_0\
    );
\s_axi_bresp[1]_i_20\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => shadow_count(30),
      I1 => shadow_count(28),
      I2 => shadow_count(31),
      I3 => shadow_count(29),
      O => \s_axi_bresp[1]_i_20_n_0\
    );
\s_axi_bresp[1]_i_21\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => shadow_count(15),
      I1 => shadow_count(12),
      I2 => shadow_count(14),
      I3 => shadow_count(13),
      O => \s_axi_bresp[1]_i_21_n_0\
    );
\s_axi_bresp[1]_i_22\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => shadow_period(5),
      I1 => shadow_period(4),
      I2 => shadow_period(7),
      I3 => shadow_period(6),
      O => \s_axi_bresp[1]_i_22_n_0\
    );
\s_axi_bresp[1]_i_23\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => shadow_period(2),
      I1 => shadow_period(1),
      I2 => shadow_period(3),
      I3 => shadow_period(0),
      O => \s_axi_bresp[1]_i_23_n_0\
    );
\s_axi_bresp[1]_i_24\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => shadow_period(13),
      I1 => shadow_period(12),
      I2 => shadow_period(15),
      I3 => shadow_period(14),
      O => \s_axi_bresp[1]_i_24_n_0\
    );
\s_axi_bresp[1]_i_25\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => shadow_period(10),
      I1 => shadow_period(9),
      I2 => shadow_period(11),
      I3 => shadow_period(8),
      O => \s_axi_bresp[1]_i_25_n_0\
    );
\s_axi_bresp[1]_i_26\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => shadow_period(21),
      I1 => shadow_period(20),
      I2 => shadow_period(23),
      I3 => shadow_period(22),
      O => \s_axi_bresp[1]_i_26_n_0\
    );
\s_axi_bresp[1]_i_27\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => shadow_period(18),
      I1 => shadow_period(17),
      I2 => shadow_period(19),
      I3 => shadow_period(16),
      O => \s_axi_bresp[1]_i_27_n_0\
    );
\s_axi_bresp[1]_i_28\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => shadow_period(29),
      I1 => shadow_period(28),
      I2 => shadow_period(31),
      I3 => shadow_period(30),
      O => \s_axi_bresp[1]_i_28_n_0\
    );
\s_axi_bresp[1]_i_29\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => shadow_period(26),
      I1 => shadow_period(25),
      I2 => shadow_period(27),
      I3 => shadow_period(24),
      O => \s_axi_bresp[1]_i_29_n_0\
    );
\s_axi_bresp[1]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FD"
    )
        port map (
      I0 => \error_sticky[3]_i_4_n_0\,
      I1 => write_address(1),
      I2 => write_address(0),
      O => \s_axi_bresp[1]_i_3_n_0\
    );
\s_axi_bresp[1]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => write_address(4),
      I1 => write_address(2),
      O => \s_axi_bresp[1]_i_5_n_0\
    );
\s_axi_bresp[1]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => write_address(3),
      I1 => write_address(4),
      O => \s_axi_bresp[1]_i_6_n_0\
    );
\s_axi_bresp[1]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => \^s_axi_bvalid_reg_0\,
      I1 => address_pending,
      I2 => data_pending_reg_n_0,
      O => address_pending0
    );
\s_axi_bresp[1]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => \write_data_reg_n_0_[7]\,
      I1 => \write_data_reg_n_0_[5]\,
      I2 => \write_data_reg_n_0_[3]\,
      I3 => \write_data_reg_n_0_[2]\,
      I4 => \write_data_reg_n_0_[4]\,
      I5 => \write_data_reg_n_0_[6]\,
      O => \s_axi_bresp[1]_i_9_n_0\
    );
\s_axi_bresp_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => core_n_43,
      Q => \^s_axi_bresp\(0),
      R => \p_0_in__0\
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
      R => \p_0_in__0\
    );
\s_axi_rdata[0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => shadow_count(0),
      I1 => shadow_high(0),
      I2 => \s_axi_rdata[30]_i_3_n_0\,
      I3 => shadow_period(0),
      I4 => \s_axi_rdata[31]_i_7_n_0\,
      I5 => \error_sticky_reg_n_0_[0]\,
      O => \s_axi_rdata[0]_i_4_n_0\
    );
\s_axi_rdata[10]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA80888022800080"
    )
        port map (
      I0 => \s_axi_rdata[30]_i_4_n_0\,
      I1 => \s_axi_rdata[31]_i_7_n_0\,
      I2 => shadow_period(10),
      I3 => \s_axi_rdata[30]_i_3_n_0\,
      I4 => shadow_high(10),
      I5 => shadow_count(10),
      O => \s_axi_rdata[10]_i_2_n_0\
    );
\s_axi_rdata[11]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA80888022800080"
    )
        port map (
      I0 => \s_axi_rdata[30]_i_4_n_0\,
      I1 => \s_axi_rdata[31]_i_7_n_0\,
      I2 => shadow_period(11),
      I3 => \s_axi_rdata[30]_i_3_n_0\,
      I4 => shadow_high(11),
      I5 => shadow_count(11),
      O => \s_axi_rdata[11]_i_2_n_0\
    );
\s_axi_rdata[12]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"002A222ACC2AEE2A"
    )
        port map (
      I0 => \s_axi_rdata[30]_i_4_n_0\,
      I1 => \s_axi_rdata[31]_i_7_n_0\,
      I2 => shadow_period(12),
      I3 => \s_axi_rdata[30]_i_3_n_0\,
      I4 => shadow_high(12),
      I5 => shadow_count(12),
      O => \s_axi_rdata[12]_i_2_n_0\
    );
\s_axi_rdata[13]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA80888022800080"
    )
        port map (
      I0 => \s_axi_rdata[30]_i_4_n_0\,
      I1 => \s_axi_rdata[31]_i_7_n_0\,
      I2 => shadow_period(13),
      I3 => \s_axi_rdata[30]_i_3_n_0\,
      I4 => shadow_high(13),
      I5 => shadow_count(13),
      O => \s_axi_rdata[13]_i_2_n_0\
    );
\s_axi_rdata[14]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"002A222ACC2AEE2A"
    )
        port map (
      I0 => \s_axi_rdata[30]_i_4_n_0\,
      I1 => \s_axi_rdata[31]_i_7_n_0\,
      I2 => shadow_period(14),
      I3 => \s_axi_rdata[30]_i_3_n_0\,
      I4 => shadow_high(14),
      I5 => shadow_count(14),
      O => \s_axi_rdata[14]_i_2_n_0\
    );
\s_axi_rdata[15]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA80888022800080"
    )
        port map (
      I0 => \s_axi_rdata[30]_i_4_n_0\,
      I1 => \s_axi_rdata[31]_i_7_n_0\,
      I2 => shadow_period(15),
      I3 => \s_axi_rdata[30]_i_3_n_0\,
      I4 => shadow_high(15),
      I5 => shadow_count(15),
      O => \s_axi_rdata[15]_i_2_n_0\
    );
\s_axi_rdata[16]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"002A222ACC2AEE2A"
    )
        port map (
      I0 => \s_axi_rdata[30]_i_4_n_0\,
      I1 => \s_axi_rdata[31]_i_7_n_0\,
      I2 => shadow_period(16),
      I3 => \s_axi_rdata[30]_i_3_n_0\,
      I4 => shadow_high(16),
      I5 => shadow_count(16),
      O => \s_axi_rdata[16]_i_2_n_0\
    );
\s_axi_rdata[17]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA80888022800080"
    )
        port map (
      I0 => \s_axi_rdata[30]_i_4_n_0\,
      I1 => \s_axi_rdata[31]_i_7_n_0\,
      I2 => shadow_period(17),
      I3 => \s_axi_rdata[30]_i_3_n_0\,
      I4 => shadow_high(17),
      I5 => shadow_count(17),
      O => \s_axi_rdata[17]_i_2_n_0\
    );
\s_axi_rdata[18]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"002A222ACC2AEE2A"
    )
        port map (
      I0 => \s_axi_rdata[30]_i_4_n_0\,
      I1 => \s_axi_rdata[31]_i_7_n_0\,
      I2 => shadow_period(18),
      I3 => \s_axi_rdata[30]_i_3_n_0\,
      I4 => shadow_high(18),
      I5 => shadow_count(18),
      O => \s_axi_rdata[18]_i_2_n_0\
    );
\s_axi_rdata[19]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA80888022800080"
    )
        port map (
      I0 => \s_axi_rdata[30]_i_4_n_0\,
      I1 => \s_axi_rdata[31]_i_7_n_0\,
      I2 => shadow_period(19),
      I3 => \s_axi_rdata[30]_i_3_n_0\,
      I4 => shadow_high(19),
      I5 => shadow_count(19),
      O => \s_axi_rdata[19]_i_2_n_0\
    );
\s_axi_rdata[1]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF0145"
    )
        port map (
      I0 => \s_axi_rdata[30]_i_3_n_0\,
      I1 => \s_axi_rdata[31]_i_7_n_0\,
      I2 => \error_sticky_reg_n_0_[1]\,
      I3 => shadow_period(1),
      I4 => \s_axi_rdata[1]_i_4_n_0\,
      O => \s_axi_rdata[1]_i_3_n_0\
    );
\s_axi_rdata[1]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"10B0FFFF"
    )
        port map (
      I0 => \s_axi_rdata[31]_i_7_n_0\,
      I1 => shadow_high(1),
      I2 => \s_axi_rdata[30]_i_3_n_0\,
      I3 => shadow_count(1),
      I4 => \s_axi_rdata[30]_i_4_n_0\,
      O => \s_axi_rdata[1]_i_4_n_0\
    );
\s_axi_rdata[20]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"002A222ACC2AEE2A"
    )
        port map (
      I0 => \s_axi_rdata[30]_i_4_n_0\,
      I1 => \s_axi_rdata[31]_i_7_n_0\,
      I2 => shadow_period(20),
      I3 => \s_axi_rdata[30]_i_3_n_0\,
      I4 => shadow_high(20),
      I5 => shadow_count(20),
      O => \s_axi_rdata[20]_i_2_n_0\
    );
\s_axi_rdata[21]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA80888022800080"
    )
        port map (
      I0 => \s_axi_rdata[30]_i_4_n_0\,
      I1 => \s_axi_rdata[31]_i_7_n_0\,
      I2 => shadow_period(21),
      I3 => \s_axi_rdata[30]_i_3_n_0\,
      I4 => shadow_high(21),
      I5 => shadow_count(21),
      O => \s_axi_rdata[21]_i_2_n_0\
    );
\s_axi_rdata[22]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"002A222ACC2AEE2A"
    )
        port map (
      I0 => \s_axi_rdata[30]_i_4_n_0\,
      I1 => \s_axi_rdata[31]_i_7_n_0\,
      I2 => shadow_period(22),
      I3 => \s_axi_rdata[30]_i_3_n_0\,
      I4 => shadow_high(22),
      I5 => shadow_count(22),
      O => \s_axi_rdata[22]_i_2_n_0\
    );
\s_axi_rdata[23]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA80888022800080"
    )
        port map (
      I0 => \s_axi_rdata[30]_i_4_n_0\,
      I1 => \s_axi_rdata[31]_i_7_n_0\,
      I2 => shadow_period(23),
      I3 => \s_axi_rdata[30]_i_3_n_0\,
      I4 => shadow_high(23),
      I5 => shadow_count(23),
      O => \s_axi_rdata[23]_i_2_n_0\
    );
\s_axi_rdata[24]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA80888022800080"
    )
        port map (
      I0 => \s_axi_rdata[30]_i_4_n_0\,
      I1 => \s_axi_rdata[31]_i_7_n_0\,
      I2 => shadow_period(24),
      I3 => \s_axi_rdata[30]_i_3_n_0\,
      I4 => shadow_high(24),
      I5 => shadow_count(24),
      O => \s_axi_rdata[24]_i_2_n_0\
    );
\s_axi_rdata[25]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"002A222ACC2AEE2A"
    )
        port map (
      I0 => \s_axi_rdata[30]_i_4_n_0\,
      I1 => \s_axi_rdata[31]_i_7_n_0\,
      I2 => shadow_period(25),
      I3 => \s_axi_rdata[30]_i_3_n_0\,
      I4 => shadow_high(25),
      I5 => shadow_count(25),
      O => \s_axi_rdata[25]_i_2_n_0\
    );
\s_axi_rdata[26]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA80888022800080"
    )
        port map (
      I0 => \s_axi_rdata[30]_i_4_n_0\,
      I1 => \s_axi_rdata[31]_i_7_n_0\,
      I2 => shadow_period(26),
      I3 => \s_axi_rdata[30]_i_3_n_0\,
      I4 => shadow_high(26),
      I5 => shadow_count(26),
      O => \s_axi_rdata[26]_i_2_n_0\
    );
\s_axi_rdata[27]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA80888022800080"
    )
        port map (
      I0 => \s_axi_rdata[30]_i_4_n_0\,
      I1 => \s_axi_rdata[31]_i_7_n_0\,
      I2 => shadow_period(27),
      I3 => \s_axi_rdata[30]_i_3_n_0\,
      I4 => shadow_high(27),
      I5 => shadow_count(27),
      O => \s_axi_rdata[27]_i_2_n_0\
    );
\s_axi_rdata[28]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA80888022800080"
    )
        port map (
      I0 => \s_axi_rdata[30]_i_4_n_0\,
      I1 => \s_axi_rdata[31]_i_7_n_0\,
      I2 => shadow_period(28),
      I3 => \s_axi_rdata[30]_i_3_n_0\,
      I4 => shadow_high(28),
      I5 => shadow_count(28),
      O => \s_axi_rdata[28]_i_2_n_0\
    );
\s_axi_rdata[29]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA80888022800080"
    )
        port map (
      I0 => \s_axi_rdata[30]_i_4_n_0\,
      I1 => \s_axi_rdata[31]_i_7_n_0\,
      I2 => shadow_period(29),
      I3 => \s_axi_rdata[30]_i_3_n_0\,
      I4 => shadow_high(29),
      I5 => shadow_count(29),
      O => \s_axi_rdata[29]_i_2_n_0\
    );
\s_axi_rdata[2]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"505F3030505F3F3F"
    )
        port map (
      I0 => shadow_count(2),
      I1 => shadow_high(2),
      I2 => \s_axi_rdata[30]_i_3_n_0\,
      I3 => shadow_period(2),
      I4 => \s_axi_rdata[31]_i_7_n_0\,
      I5 => \error_sticky_reg_n_0_[2]\,
      O => \s_axi_rdata[2]_i_4_n_0\
    );
\s_axi_rdata[30]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFD5DDD533D511D5"
    )
        port map (
      I0 => \s_axi_rdata[30]_i_4_n_0\,
      I1 => \s_axi_rdata[31]_i_7_n_0\,
      I2 => shadow_period(30),
      I3 => \s_axi_rdata[30]_i_3_n_0\,
      I4 => shadow_high(30),
      I5 => shadow_count(30),
      O => \s_axi_rdata[30]_i_2_n_0\
    );
\s_axi_rdata[30]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEFFFEFEFFEE"
    )
        port map (
      I0 => s_axi_araddr(1),
      I1 => s_axi_araddr(0),
      I2 => s_axi_araddr(4),
      I3 => s_axi_araddr(2),
      I4 => s_axi_araddr(5),
      I5 => s_axi_araddr(3),
      O => \s_axi_rdata[30]_i_3_n_0\
    );
\s_axi_rdata[30]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0001010101000000"
    )
        port map (
      I0 => s_axi_araddr(0),
      I1 => s_axi_araddr(1),
      I2 => s_axi_araddr(5),
      I3 => s_axi_araddr(3),
      I4 => s_axi_araddr(2),
      I5 => s_axi_araddr(4),
      O => \s_axi_rdata[30]_i_4_n_0\
    );
\s_axi_rdata[31]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => s_axi_arvalid,
      I1 => \^s_axi_rvalid_reg_0\,
      O => s_axi_rvalid014_out
    );
\s_axi_rdata[31]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => s_axi_araddr(10),
      I1 => s_axi_araddr(9),
      I2 => s_axi_araddr(6),
      I3 => s_axi_araddr(11),
      I4 => s_axi_araddr(7),
      I5 => s_axi_araddr(8),
      O => \s_axi_rdata[31]_i_3_n_0\
    );
\s_axi_rdata[31]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F8A8580800000000"
    )
        port map (
      I0 => \s_axi_rdata[31]_i_7_n_0\,
      I1 => shadow_period(31),
      I2 => \s_axi_rdata[30]_i_3_n_0\,
      I3 => shadow_high(31),
      I4 => shadow_count(31),
      I5 => \s_axi_rdata[30]_i_4_n_0\,
      O => \s_axi_rdata[31]_i_4_n_0\
    );
\s_axi_rdata[31]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0010"
    )
        port map (
      I0 => s_axi_araddr(1),
      I1 => s_axi_araddr(0),
      I2 => s_axi_araddr(5),
      I3 => s_axi_araddr(4),
      O => \s_axi_rdata[31]_i_6_n_0\
    );
\s_axi_rdata[31]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00011001"
    )
        port map (
      I0 => s_axi_araddr(1),
      I1 => s_axi_araddr(0),
      I2 => s_axi_araddr(5),
      I3 => s_axi_araddr(2),
      I4 => s_axi_araddr(4),
      O => \s_axi_rdata[31]_i_7_n_0\
    );
\s_axi_rdata[3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFF7"
    )
        port map (
      I0 => \s_axi_rdata[30]_i_3_n_0\,
      I1 => \s_axi_rdata[31]_i_7_n_0\,
      I2 => \s_axi_rdata[30]_i_4_n_0\,
      I3 => \s_axi_rdata[31]_i_6_n_0\,
      O => \s_axi_rdata[3]_i_2_n_0\
    );
\s_axi_rdata[3]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF0145"
    )
        port map (
      I0 => \s_axi_rdata[30]_i_3_n_0\,
      I1 => \s_axi_rdata[31]_i_7_n_0\,
      I2 => \error_sticky_reg_n_0_[3]\,
      I3 => shadow_period(3),
      I4 => \s_axi_rdata[3]_i_5_n_0\,
      O => \s_axi_rdata[3]_i_4_n_0\
    );
\s_axi_rdata[3]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"10B0FFFF"
    )
        port map (
      I0 => \s_axi_rdata[31]_i_7_n_0\,
      I1 => shadow_high(3),
      I2 => \s_axi_rdata[30]_i_3_n_0\,
      I3 => shadow_count(3),
      I4 => \s_axi_rdata[30]_i_4_n_0\,
      O => \s_axi_rdata[3]_i_5_n_0\
    );
\s_axi_rdata[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FCCCB3B33000B3B3"
    )
        port map (
      I0 => data1(9),
      I1 => \s_axi_rdata[30]_i_3_n_0\,
      I2 => \s_axi_rdata[31]_i_7_n_0\,
      I3 => shadow_period(4),
      I4 => \s_axi_rdata[30]_i_4_n_0\,
      I5 => \s_axi_rdata[4]_i_4_n_0\,
      O => \s_axi_rdata[4]_i_2_n_0\
    );
\s_axi_rdata[4]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => shadow_count(4),
      I1 => \s_axi_rdata[31]_i_7_n_0\,
      I2 => shadow_high(4),
      O => \s_axi_rdata[4]_i_4_n_0\
    );
\s_axi_rdata[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5050303000F0F0F0"
    )
        port map (
      I0 => shadow_count(5),
      I1 => shadow_high(5),
      I2 => \s_axi_rdata[30]_i_4_n_0\,
      I3 => shadow_period(5),
      I4 => \s_axi_rdata[31]_i_7_n_0\,
      I5 => \s_axi_rdata[30]_i_3_n_0\,
      O => \s_axi_rdata[5]_i_2_n_0\
    );
\s_axi_rdata[5]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFD55555555"
    )
        port map (
      I0 => \s_axi_rdata[5]_i_5_n_0\,
      I1 => \error_sticky_reg_n_0_[3]\,
      I2 => \error_sticky_reg_n_0_[0]\,
      I3 => \error_sticky_reg_n_0_[2]\,
      I4 => \error_sticky_reg_n_0_[1]\,
      I5 => \s_axi_rdata[31]_i_7_n_0\,
      O => \s_axi_rdata[5]_i_3_n_0\
    );
\s_axi_rdata[5]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFA94"
    )
        port map (
      I0 => s_axi_araddr(4),
      I1 => s_axi_araddr(2),
      I2 => s_axi_araddr(3),
      I3 => s_axi_araddr(5),
      I4 => s_axi_araddr(1),
      I5 => s_axi_araddr(0),
      O => \s_axi_rdata[5]_i_5_n_0\
    );
\s_axi_rdata[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA80888022800080"
    )
        port map (
      I0 => \s_axi_rdata[30]_i_4_n_0\,
      I1 => \s_axi_rdata[31]_i_7_n_0\,
      I2 => shadow_period(6),
      I3 => \s_axi_rdata[30]_i_3_n_0\,
      I4 => shadow_high(6),
      I5 => shadow_count(6),
      O => \s_axi_rdata[6]_i_2_n_0\
    );
\s_axi_rdata[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA80888022800080"
    )
        port map (
      I0 => \s_axi_rdata[30]_i_4_n_0\,
      I1 => \s_axi_rdata[31]_i_7_n_0\,
      I2 => shadow_period(7),
      I3 => \s_axi_rdata[30]_i_3_n_0\,
      I4 => shadow_high(7),
      I5 => shadow_count(7),
      O => \s_axi_rdata[7]_i_2_n_0\
    );
\s_axi_rdata[8]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"505F3030505F3F3F"
    )
        port map (
      I0 => shadow_count(8),
      I1 => shadow_high(8),
      I2 => \s_axi_rdata[30]_i_3_n_0\,
      I3 => shadow_period(8),
      I4 => \s_axi_rdata[31]_i_7_n_0\,
      I5 => data1(8),
      O => \s_axi_rdata[8]_i_2_n_0\
    );
\s_axi_rdata[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0001010101000001"
    )
        port map (
      I0 => s_axi_araddr(0),
      I1 => s_axi_araddr(1),
      I2 => s_axi_araddr(5),
      I3 => s_axi_araddr(3),
      I4 => s_axi_araddr(2),
      I5 => s_axi_araddr(4),
      O => \s_axi_rdata[9]_i_2_n_0\
    );
\s_axi_rdata[9]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => shadow_count(9),
      I1 => shadow_high(9),
      I2 => \s_axi_rdata[30]_i_3_n_0\,
      I3 => shadow_period(9),
      I4 => \s_axi_rdata[31]_i_7_n_0\,
      I5 => data1(9),
      O => \s_axi_rdata[9]_i_3_n_0\
    );
\s_axi_rdata[9]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"15"
    )
        port map (
      I0 => \s_axi_rdata[30]_i_4_n_0\,
      I1 => \s_axi_rdata[30]_i_3_n_0\,
      I2 => \s_axi_rdata[31]_i_7_n_0\,
      O => \s_axi_rdata[9]_i_4_n_0\
    );
\s_axi_rdata_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rvalid014_out,
      D => core_n_41,
      Q => s_axi_rdata(0),
      R => \p_0_in__0\
    );
\s_axi_rdata_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rvalid014_out,
      D => core_n_31,
      Q => s_axi_rdata(10),
      R => \p_0_in__0\
    );
\s_axi_rdata_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rvalid014_out,
      D => core_n_30,
      Q => s_axi_rdata(11),
      R => \p_0_in__0\
    );
\s_axi_rdata_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rvalid014_out,
      D => core_n_29,
      Q => s_axi_rdata(12),
      R => \p_0_in__0\
    );
\s_axi_rdata_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rvalid014_out,
      D => core_n_28,
      Q => s_axi_rdata(13),
      R => \p_0_in__0\
    );
\s_axi_rdata_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rvalid014_out,
      D => core_n_27,
      Q => s_axi_rdata(14),
      R => \p_0_in__0\
    );
\s_axi_rdata_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rvalid014_out,
      D => core_n_26,
      Q => s_axi_rdata(15),
      R => \p_0_in__0\
    );
\s_axi_rdata_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rvalid014_out,
      D => core_n_25,
      Q => s_axi_rdata(16),
      R => \p_0_in__0\
    );
\s_axi_rdata_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rvalid014_out,
      D => core_n_24,
      Q => s_axi_rdata(17),
      R => \p_0_in__0\
    );
\s_axi_rdata_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rvalid014_out,
      D => core_n_23,
      Q => s_axi_rdata(18),
      R => \p_0_in__0\
    );
\s_axi_rdata_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rvalid014_out,
      D => core_n_22,
      Q => s_axi_rdata(19),
      R => \p_0_in__0\
    );
\s_axi_rdata_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rvalid014_out,
      D => core_n_40,
      Q => s_axi_rdata(1),
      R => \p_0_in__0\
    );
\s_axi_rdata_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rvalid014_out,
      D => core_n_21,
      Q => s_axi_rdata(20),
      R => \p_0_in__0\
    );
\s_axi_rdata_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rvalid014_out,
      D => core_n_20,
      Q => s_axi_rdata(21),
      R => \p_0_in__0\
    );
\s_axi_rdata_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rvalid014_out,
      D => core_n_19,
      Q => s_axi_rdata(22),
      R => \p_0_in__0\
    );
\s_axi_rdata_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rvalid014_out,
      D => core_n_18,
      Q => s_axi_rdata(23),
      R => \p_0_in__0\
    );
\s_axi_rdata_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rvalid014_out,
      D => core_n_17,
      Q => s_axi_rdata(24),
      R => \p_0_in__0\
    );
\s_axi_rdata_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rvalid014_out,
      D => core_n_16,
      Q => s_axi_rdata(25),
      R => \p_0_in__0\
    );
\s_axi_rdata_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rvalid014_out,
      D => core_n_15,
      Q => s_axi_rdata(26),
      R => \p_0_in__0\
    );
\s_axi_rdata_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rvalid014_out,
      D => core_n_14,
      Q => s_axi_rdata(27),
      R => \p_0_in__0\
    );
\s_axi_rdata_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rvalid014_out,
      D => core_n_13,
      Q => s_axi_rdata(28),
      R => \p_0_in__0\
    );
\s_axi_rdata_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rvalid014_out,
      D => core_n_12,
      Q => s_axi_rdata(29),
      R => \p_0_in__0\
    );
\s_axi_rdata_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rvalid014_out,
      D => core_n_39,
      Q => s_axi_rdata(2),
      R => \p_0_in__0\
    );
\s_axi_rdata_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rvalid014_out,
      D => core_n_11,
      Q => s_axi_rdata(30),
      R => \p_0_in__0\
    );
\s_axi_rdata_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rvalid014_out,
      D => core_n_10,
      Q => s_axi_rdata(31),
      R => \p_0_in__0\
    );
\s_axi_rdata_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rvalid014_out,
      D => core_n_38,
      Q => s_axi_rdata(3),
      R => \p_0_in__0\
    );
\s_axi_rdata_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rvalid014_out,
      D => core_n_37,
      Q => s_axi_rdata(4),
      R => \p_0_in__0\
    );
\s_axi_rdata_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rvalid014_out,
      D => core_n_36,
      Q => s_axi_rdata(5),
      R => \p_0_in__0\
    );
\s_axi_rdata_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rvalid014_out,
      D => core_n_35,
      Q => s_axi_rdata(6),
      R => \p_0_in__0\
    );
\s_axi_rdata_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rvalid014_out,
      D => core_n_34,
      Q => s_axi_rdata(7),
      R => \p_0_in__0\
    );
\s_axi_rdata_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rvalid014_out,
      D => core_n_33,
      Q => s_axi_rdata(8),
      R => \p_0_in__0\
    );
\s_axi_rdata_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rvalid014_out,
      D => core_n_32,
      Q => s_axi_rdata(9),
      R => \p_0_in__0\
    );
\s_axi_rresp[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEEEEAAAFFFFFFFF"
    )
        port map (
      I0 => \s_axi_rresp[1]_i_2_n_0\,
      I1 => s_axi_araddr(4),
      I2 => s_axi_araddr(3),
      I3 => s_axi_araddr(2),
      I4 => s_axi_araddr(5),
      I5 => \s_axi_rdata[31]_i_3_n_0\,
      O => \s_axi_rresp[1]_i_1_n_0\
    );
\s_axi_rresp[1]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => s_axi_araddr(0),
      I1 => s_axi_araddr(1),
      O => \s_axi_rresp[1]_i_2_n_0\
    );
\s_axi_rresp_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rvalid014_out,
      D => \s_axi_rresp[1]_i_1_n_0\,
      Q => s_axi_rresp(0),
      R => \p_0_in__0\
    );
s_axi_rvalid_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"3A"
    )
        port map (
      I0 => s_axi_arvalid,
      I1 => s_axi_rready,
      I2 => \^s_axi_rvalid_reg_0\,
      O => s_axi_rvalid_i_1_n_0
    );
s_axi_rvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => s_axi_rvalid_i_1_n_0,
      Q => \^s_axi_rvalid_reg_0\,
      R => \p_0_in__0\
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
      INIT => X"0000000000040000"
    )
        port map (
      I0 => write_address(2),
      I1 => write_address(3),
      I2 => write_address(0),
      I3 => write_address(1),
      I4 => p_5_out,
      I5 => \shadow_count[31]_i_2_n_0\,
      O => p_1_in(8)
    );
\shadow_count[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000040000"
    )
        port map (
      I0 => write_address(2),
      I1 => write_address(3),
      I2 => write_address(0),
      I3 => write_address(1),
      I4 => p_0_in0,
      I5 => \shadow_count[31]_i_2_n_0\,
      O => p_1_in(16)
    );
\shadow_count[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000040000"
    )
        port map (
      I0 => write_address(2),
      I1 => write_address(3),
      I2 => write_address(0),
      I3 => write_address(1),
      I4 => \write_strobes_reg_n_0_[3]\,
      I5 => \shadow_count[31]_i_2_n_0\,
      O => p_1_in(24)
    );
\shadow_count[31]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F7FFFFFF"
    )
        port map (
      I0 => write_address(4),
      I1 => \error_sticky[3]_i_4_n_0\,
      I2 => \^s_axi_bvalid_reg_0\,
      I3 => address_pending,
      I4 => data_pending_reg_n_0,
      O => \shadow_count[31]_i_2_n_0\
    );
\shadow_count[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000040000"
    )
        port map (
      I0 => write_address(2),
      I1 => write_address(3),
      I2 => write_address(0),
      I3 => write_address(1),
      I4 => p_7_out,
      I5 => \shadow_count[31]_i_2_n_0\,
      O => p_1_in(0)
    );
\shadow_count_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => p_1_in(0),
      D => \write_data_reg_n_0_[0]\,
      Q => shadow_count(0),
      R => \p_0_in__0\
    );
\shadow_count_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => p_1_in(8),
      D => \write_data_reg_n_0_[10]\,
      Q => shadow_count(10),
      R => \p_0_in__0\
    );
\shadow_count_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => p_1_in(8),
      D => \write_data_reg_n_0_[11]\,
      Q => shadow_count(11),
      R => \p_0_in__0\
    );
\shadow_count_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => p_1_in(8),
      D => \write_data_reg_n_0_[12]\,
      Q => shadow_count(12),
      R => \p_0_in__0\
    );
\shadow_count_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => p_1_in(8),
      D => \write_data_reg_n_0_[13]\,
      Q => shadow_count(13),
      R => \p_0_in__0\
    );
\shadow_count_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => p_1_in(8),
      D => \write_data_reg_n_0_[14]\,
      Q => shadow_count(14),
      R => \p_0_in__0\
    );
\shadow_count_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => p_1_in(8),
      D => \write_data_reg_n_0_[15]\,
      Q => shadow_count(15),
      R => \p_0_in__0\
    );
\shadow_count_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => p_1_in(16),
      D => \write_data_reg_n_0_[16]\,
      Q => shadow_count(16),
      R => \p_0_in__0\
    );
\shadow_count_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => p_1_in(16),
      D => \write_data_reg_n_0_[17]\,
      Q => shadow_count(17),
      R => \p_0_in__0\
    );
\shadow_count_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => p_1_in(16),
      D => \write_data_reg_n_0_[18]\,
      Q => shadow_count(18),
      R => \p_0_in__0\
    );
\shadow_count_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => p_1_in(16),
      D => \write_data_reg_n_0_[19]\,
      Q => shadow_count(19),
      R => \p_0_in__0\
    );
\shadow_count_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => p_1_in(0),
      D => \write_data_reg_n_0_[1]\,
      Q => shadow_count(1),
      R => \p_0_in__0\
    );
\shadow_count_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => p_1_in(16),
      D => \write_data_reg_n_0_[20]\,
      Q => shadow_count(20),
      R => \p_0_in__0\
    );
\shadow_count_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => p_1_in(16),
      D => \write_data_reg_n_0_[21]\,
      Q => shadow_count(21),
      R => \p_0_in__0\
    );
\shadow_count_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => p_1_in(16),
      D => \write_data_reg_n_0_[22]\,
      Q => shadow_count(22),
      R => \p_0_in__0\
    );
\shadow_count_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => p_1_in(16),
      D => \write_data_reg_n_0_[23]\,
      Q => shadow_count(23),
      R => \p_0_in__0\
    );
\shadow_count_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => p_1_in(24),
      D => \write_data_reg_n_0_[24]\,
      Q => shadow_count(24),
      R => \p_0_in__0\
    );
\shadow_count_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => p_1_in(24),
      D => \write_data_reg_n_0_[25]\,
      Q => shadow_count(25),
      R => \p_0_in__0\
    );
\shadow_count_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => p_1_in(24),
      D => \write_data_reg_n_0_[26]\,
      Q => shadow_count(26),
      R => \p_0_in__0\
    );
\shadow_count_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => p_1_in(24),
      D => \write_data_reg_n_0_[27]\,
      Q => shadow_count(27),
      R => \p_0_in__0\
    );
\shadow_count_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => p_1_in(24),
      D => \write_data_reg_n_0_[28]\,
      Q => shadow_count(28),
      R => \p_0_in__0\
    );
\shadow_count_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => p_1_in(24),
      D => \write_data_reg_n_0_[29]\,
      Q => shadow_count(29),
      R => \p_0_in__0\
    );
\shadow_count_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => p_1_in(0),
      D => \write_data_reg_n_0_[2]\,
      Q => shadow_count(2),
      R => \p_0_in__0\
    );
\shadow_count_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => p_1_in(24),
      D => \write_data_reg_n_0_[30]\,
      Q => shadow_count(30),
      R => \p_0_in__0\
    );
\shadow_count_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => p_1_in(24),
      D => \write_data_reg_n_0_[31]\,
      Q => shadow_count(31),
      R => \p_0_in__0\
    );
\shadow_count_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => p_1_in(0),
      D => \write_data_reg_n_0_[3]\,
      Q => shadow_count(3),
      R => \p_0_in__0\
    );
\shadow_count_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => p_1_in(0),
      D => \write_data_reg_n_0_[4]\,
      Q => shadow_count(4),
      R => \p_0_in__0\
    );
\shadow_count_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => p_1_in(0),
      D => \write_data_reg_n_0_[5]\,
      Q => shadow_count(5),
      R => \p_0_in__0\
    );
\shadow_count_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => p_1_in(0),
      D => \write_data_reg_n_0_[6]\,
      Q => shadow_count(6),
      R => \p_0_in__0\
    );
\shadow_count_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => p_1_in(0),
      D => \write_data_reg_n_0_[7]\,
      Q => shadow_count(7),
      R => \p_0_in__0\
    );
\shadow_count_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => p_1_in(8),
      D => p_1_in5_in,
      Q => shadow_count(8),
      R => \p_0_in__0\
    );
\shadow_count_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => p_1_in(8),
      D => \write_data_reg_n_0_[9]\,
      Q => shadow_count(9),
      R => \p_0_in__0\
    );
\shadow_high[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000001000000"
    )
        port map (
      I0 => write_address(3),
      I1 => write_address(1),
      I2 => write_address(0),
      I3 => write_address(2),
      I4 => p_5_out,
      I5 => \shadow_count[31]_i_2_n_0\,
      O => \shadow_high[15]_i_1_n_0\
    );
\shadow_high[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000001000000"
    )
        port map (
      I0 => write_address(3),
      I1 => write_address(1),
      I2 => write_address(0),
      I3 => write_address(2),
      I4 => p_0_in0,
      I5 => \shadow_count[31]_i_2_n_0\,
      O => \shadow_high[23]_i_1_n_0\
    );
\shadow_high[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000001000000"
    )
        port map (
      I0 => write_address(3),
      I1 => write_address(1),
      I2 => write_address(0),
      I3 => write_address(2),
      I4 => \write_strobes_reg_n_0_[3]\,
      I5 => \shadow_count[31]_i_2_n_0\,
      O => \shadow_high[31]_i_1_n_0\
    );
\shadow_high[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000001000000"
    )
        port map (
      I0 => write_address(3),
      I1 => write_address(1),
      I2 => write_address(0),
      I3 => write_address(2),
      I4 => p_7_out,
      I5 => \shadow_count[31]_i_2_n_0\,
      O => \shadow_high[7]_i_1_n_0\
    );
\shadow_high_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_high[7]_i_1_n_0\,
      D => \write_data_reg_n_0_[0]\,
      Q => shadow_high(0),
      R => \p_0_in__0\
    );
\shadow_high_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_high[15]_i_1_n_0\,
      D => \write_data_reg_n_0_[10]\,
      Q => shadow_high(10),
      R => \p_0_in__0\
    );
\shadow_high_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_high[15]_i_1_n_0\,
      D => \write_data_reg_n_0_[11]\,
      Q => shadow_high(11),
      R => \p_0_in__0\
    );
\shadow_high_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_high[15]_i_1_n_0\,
      D => \write_data_reg_n_0_[12]\,
      Q => shadow_high(12),
      R => \p_0_in__0\
    );
\shadow_high_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_high[15]_i_1_n_0\,
      D => \write_data_reg_n_0_[13]\,
      Q => shadow_high(13),
      R => \p_0_in__0\
    );
\shadow_high_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_high[15]_i_1_n_0\,
      D => \write_data_reg_n_0_[14]\,
      Q => shadow_high(14),
      R => \p_0_in__0\
    );
\shadow_high_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_high[15]_i_1_n_0\,
      D => \write_data_reg_n_0_[15]\,
      Q => shadow_high(15),
      R => \p_0_in__0\
    );
\shadow_high_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_high[23]_i_1_n_0\,
      D => \write_data_reg_n_0_[16]\,
      Q => shadow_high(16),
      R => \p_0_in__0\
    );
\shadow_high_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_high[23]_i_1_n_0\,
      D => \write_data_reg_n_0_[17]\,
      Q => shadow_high(17),
      R => \p_0_in__0\
    );
\shadow_high_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_high[23]_i_1_n_0\,
      D => \write_data_reg_n_0_[18]\,
      Q => shadow_high(18),
      R => \p_0_in__0\
    );
\shadow_high_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_high[23]_i_1_n_0\,
      D => \write_data_reg_n_0_[19]\,
      Q => shadow_high(19),
      R => \p_0_in__0\
    );
\shadow_high_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_high[7]_i_1_n_0\,
      D => \write_data_reg_n_0_[1]\,
      Q => shadow_high(1),
      R => \p_0_in__0\
    );
\shadow_high_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_high[23]_i_1_n_0\,
      D => \write_data_reg_n_0_[20]\,
      Q => shadow_high(20),
      R => \p_0_in__0\
    );
\shadow_high_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_high[23]_i_1_n_0\,
      D => \write_data_reg_n_0_[21]\,
      Q => shadow_high(21),
      R => \p_0_in__0\
    );
\shadow_high_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_high[23]_i_1_n_0\,
      D => \write_data_reg_n_0_[22]\,
      Q => shadow_high(22),
      R => \p_0_in__0\
    );
\shadow_high_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_high[23]_i_1_n_0\,
      D => \write_data_reg_n_0_[23]\,
      Q => shadow_high(23),
      R => \p_0_in__0\
    );
\shadow_high_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_high[31]_i_1_n_0\,
      D => \write_data_reg_n_0_[24]\,
      Q => shadow_high(24),
      R => \p_0_in__0\
    );
\shadow_high_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_high[31]_i_1_n_0\,
      D => \write_data_reg_n_0_[25]\,
      Q => shadow_high(25),
      R => \p_0_in__0\
    );
\shadow_high_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_high[31]_i_1_n_0\,
      D => \write_data_reg_n_0_[26]\,
      Q => shadow_high(26),
      R => \p_0_in__0\
    );
\shadow_high_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_high[31]_i_1_n_0\,
      D => \write_data_reg_n_0_[27]\,
      Q => shadow_high(27),
      R => \p_0_in__0\
    );
\shadow_high_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_high[31]_i_1_n_0\,
      D => \write_data_reg_n_0_[28]\,
      Q => shadow_high(28),
      R => \p_0_in__0\
    );
\shadow_high_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_high[31]_i_1_n_0\,
      D => \write_data_reg_n_0_[29]\,
      Q => shadow_high(29),
      R => \p_0_in__0\
    );
\shadow_high_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_high[7]_i_1_n_0\,
      D => \write_data_reg_n_0_[2]\,
      Q => shadow_high(2),
      R => \p_0_in__0\
    );
\shadow_high_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_high[31]_i_1_n_0\,
      D => \write_data_reg_n_0_[30]\,
      Q => shadow_high(30),
      R => \p_0_in__0\
    );
\shadow_high_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_high[31]_i_1_n_0\,
      D => \write_data_reg_n_0_[31]\,
      Q => shadow_high(31),
      R => \p_0_in__0\
    );
\shadow_high_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_high[7]_i_1_n_0\,
      D => \write_data_reg_n_0_[3]\,
      Q => shadow_high(3),
      R => \p_0_in__0\
    );
\shadow_high_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_high[7]_i_1_n_0\,
      D => \write_data_reg_n_0_[4]\,
      Q => shadow_high(4),
      R => \p_0_in__0\
    );
\shadow_high_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_high[7]_i_1_n_0\,
      D => \write_data_reg_n_0_[5]\,
      Q => shadow_high(5),
      R => \p_0_in__0\
    );
\shadow_high_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_high[7]_i_1_n_0\,
      D => \write_data_reg_n_0_[6]\,
      Q => shadow_high(6),
      R => \p_0_in__0\
    );
\shadow_high_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_high[7]_i_1_n_0\,
      D => \write_data_reg_n_0_[7]\,
      Q => shadow_high(7),
      R => \p_0_in__0\
    );
\shadow_high_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_high[15]_i_1_n_0\,
      D => p_1_in5_in,
      Q => shadow_high(8),
      R => \p_0_in__0\
    );
\shadow_high_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_high[15]_i_1_n_0\,
      D => \write_data_reg_n_0_[9]\,
      Q => shadow_high(9),
      R => \p_0_in__0\
    );
\shadow_period[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000002"
    )
        port map (
      I0 => p_5_out,
      I1 => \shadow_count[31]_i_2_n_0\,
      I2 => write_address(3),
      I3 => write_address(1),
      I4 => write_address(0),
      I5 => write_address(2),
      O => \shadow_period[15]_i_1_n_0\
    );
\shadow_period[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000002"
    )
        port map (
      I0 => p_0_in0,
      I1 => \shadow_count[31]_i_2_n_0\,
      I2 => write_address(3),
      I3 => write_address(1),
      I4 => write_address(0),
      I5 => write_address(2),
      O => \shadow_period[23]_i_1_n_0\
    );
\shadow_period[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000002"
    )
        port map (
      I0 => \write_strobes_reg_n_0_[3]\,
      I1 => \shadow_count[31]_i_2_n_0\,
      I2 => write_address(3),
      I3 => write_address(1),
      I4 => write_address(0),
      I5 => write_address(2),
      O => \shadow_period[31]_i_1_n_0\
    );
\shadow_period[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000002"
    )
        port map (
      I0 => p_7_out,
      I1 => \shadow_count[31]_i_2_n_0\,
      I2 => write_address(3),
      I3 => write_address(1),
      I4 => write_address(0),
      I5 => write_address(2),
      O => \shadow_period[7]_i_1_n_0\
    );
\shadow_period_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_period[7]_i_1_n_0\,
      D => \write_data_reg_n_0_[0]\,
      Q => shadow_period(0),
      R => \p_0_in__0\
    );
\shadow_period_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_period[15]_i_1_n_0\,
      D => \write_data_reg_n_0_[10]\,
      Q => shadow_period(10),
      R => \p_0_in__0\
    );
\shadow_period_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_period[15]_i_1_n_0\,
      D => \write_data_reg_n_0_[11]\,
      Q => shadow_period(11),
      R => \p_0_in__0\
    );
\shadow_period_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_period[15]_i_1_n_0\,
      D => \write_data_reg_n_0_[12]\,
      Q => shadow_period(12),
      R => \p_0_in__0\
    );
\shadow_period_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_period[15]_i_1_n_0\,
      D => \write_data_reg_n_0_[13]\,
      Q => shadow_period(13),
      R => \p_0_in__0\
    );
\shadow_period_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_period[15]_i_1_n_0\,
      D => \write_data_reg_n_0_[14]\,
      Q => shadow_period(14),
      R => \p_0_in__0\
    );
\shadow_period_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_period[15]_i_1_n_0\,
      D => \write_data_reg_n_0_[15]\,
      Q => shadow_period(15),
      R => \p_0_in__0\
    );
\shadow_period_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_period[23]_i_1_n_0\,
      D => \write_data_reg_n_0_[16]\,
      Q => shadow_period(16),
      R => \p_0_in__0\
    );
\shadow_period_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_period[23]_i_1_n_0\,
      D => \write_data_reg_n_0_[17]\,
      Q => shadow_period(17),
      R => \p_0_in__0\
    );
\shadow_period_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_period[23]_i_1_n_0\,
      D => \write_data_reg_n_0_[18]\,
      Q => shadow_period(18),
      R => \p_0_in__0\
    );
\shadow_period_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_period[23]_i_1_n_0\,
      D => \write_data_reg_n_0_[19]\,
      Q => shadow_period(19),
      R => \p_0_in__0\
    );
\shadow_period_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_period[7]_i_1_n_0\,
      D => \write_data_reg_n_0_[1]\,
      Q => shadow_period(1),
      R => \p_0_in__0\
    );
\shadow_period_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_period[23]_i_1_n_0\,
      D => \write_data_reg_n_0_[20]\,
      Q => shadow_period(20),
      R => \p_0_in__0\
    );
\shadow_period_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_period[23]_i_1_n_0\,
      D => \write_data_reg_n_0_[21]\,
      Q => shadow_period(21),
      R => \p_0_in__0\
    );
\shadow_period_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_period[23]_i_1_n_0\,
      D => \write_data_reg_n_0_[22]\,
      Q => shadow_period(22),
      R => \p_0_in__0\
    );
\shadow_period_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_period[23]_i_1_n_0\,
      D => \write_data_reg_n_0_[23]\,
      Q => shadow_period(23),
      R => \p_0_in__0\
    );
\shadow_period_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_period[31]_i_1_n_0\,
      D => \write_data_reg_n_0_[24]\,
      Q => shadow_period(24),
      R => \p_0_in__0\
    );
\shadow_period_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_period[31]_i_1_n_0\,
      D => \write_data_reg_n_0_[25]\,
      Q => shadow_period(25),
      R => \p_0_in__0\
    );
\shadow_period_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_period[31]_i_1_n_0\,
      D => \write_data_reg_n_0_[26]\,
      Q => shadow_period(26),
      R => \p_0_in__0\
    );
\shadow_period_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_period[31]_i_1_n_0\,
      D => \write_data_reg_n_0_[27]\,
      Q => shadow_period(27),
      R => \p_0_in__0\
    );
\shadow_period_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_period[31]_i_1_n_0\,
      D => \write_data_reg_n_0_[28]\,
      Q => shadow_period(28),
      R => \p_0_in__0\
    );
\shadow_period_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_period[31]_i_1_n_0\,
      D => \write_data_reg_n_0_[29]\,
      Q => shadow_period(29),
      R => \p_0_in__0\
    );
\shadow_period_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_period[7]_i_1_n_0\,
      D => \write_data_reg_n_0_[2]\,
      Q => shadow_period(2),
      R => \p_0_in__0\
    );
\shadow_period_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_period[31]_i_1_n_0\,
      D => \write_data_reg_n_0_[30]\,
      Q => shadow_period(30),
      R => \p_0_in__0\
    );
\shadow_period_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_period[31]_i_1_n_0\,
      D => \write_data_reg_n_0_[31]\,
      Q => shadow_period(31),
      R => \p_0_in__0\
    );
\shadow_period_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_period[7]_i_1_n_0\,
      D => \write_data_reg_n_0_[3]\,
      Q => shadow_period(3),
      R => \p_0_in__0\
    );
\shadow_period_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_period[7]_i_1_n_0\,
      D => \write_data_reg_n_0_[4]\,
      Q => shadow_period(4),
      R => \p_0_in__0\
    );
\shadow_period_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_period[7]_i_1_n_0\,
      D => \write_data_reg_n_0_[5]\,
      Q => shadow_period(5),
      R => \p_0_in__0\
    );
\shadow_period_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_period[7]_i_1_n_0\,
      D => \write_data_reg_n_0_[6]\,
      Q => shadow_period(6),
      R => \p_0_in__0\
    );
\shadow_period_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_period[7]_i_1_n_0\,
      D => \write_data_reg_n_0_[7]\,
      Q => shadow_period(7),
      R => \p_0_in__0\
    );
\shadow_period_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_period[15]_i_1_n_0\,
      D => p_1_in5_in,
      Q => shadow_period(8),
      R => \p_0_in__0\
    );
\shadow_period_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \shadow_period[15]_i_1_n_0\,
      D => \write_data_reg_n_0_[9]\,
      Q => shadow_period(9),
      R => \p_0_in__0\
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
      Q => write_address(0),
      R => \p_0_in__0\
    );
\write_address_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_address0,
      D => s_axi_awaddr(10),
      Q => write_address(10),
      R => \p_0_in__0\
    );
\write_address_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_address0,
      D => s_axi_awaddr(11),
      Q => write_address(11),
      R => \p_0_in__0\
    );
\write_address_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_address0,
      D => s_axi_awaddr(1),
      Q => write_address(1),
      R => \p_0_in__0\
    );
\write_address_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_address0,
      D => s_axi_awaddr(2),
      Q => write_address(2),
      R => \p_0_in__0\
    );
\write_address_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_address0,
      D => s_axi_awaddr(3),
      Q => write_address(3),
      R => \p_0_in__0\
    );
\write_address_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_address0,
      D => s_axi_awaddr(4),
      Q => write_address(4),
      R => \p_0_in__0\
    );
\write_address_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_address0,
      D => s_axi_awaddr(5),
      Q => write_address(5),
      R => \p_0_in__0\
    );
\write_address_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_address0,
      D => s_axi_awaddr(6),
      Q => write_address(6),
      R => \p_0_in__0\
    );
\write_address_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_address0,
      D => s_axi_awaddr(7),
      Q => write_address(7),
      R => \p_0_in__0\
    );
\write_address_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_address0,
      D => s_axi_awaddr(8),
      Q => write_address(8),
      R => \p_0_in__0\
    );
\write_address_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_address0,
      D => s_axi_awaddr(9),
      Q => write_address(9),
      R => \p_0_in__0\
    );
\write_data_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wdata(0),
      Q => \write_data_reg_n_0_[0]\,
      R => \p_0_in__0\
    );
\write_data_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wdata(10),
      Q => \write_data_reg_n_0_[10]\,
      R => \p_0_in__0\
    );
\write_data_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wdata(11),
      Q => \write_data_reg_n_0_[11]\,
      R => \p_0_in__0\
    );
\write_data_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wdata(12),
      Q => \write_data_reg_n_0_[12]\,
      R => \p_0_in__0\
    );
\write_data_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wdata(13),
      Q => \write_data_reg_n_0_[13]\,
      R => \p_0_in__0\
    );
\write_data_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wdata(14),
      Q => \write_data_reg_n_0_[14]\,
      R => \p_0_in__0\
    );
\write_data_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wdata(15),
      Q => \write_data_reg_n_0_[15]\,
      R => \p_0_in__0\
    );
\write_data_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wdata(16),
      Q => \write_data_reg_n_0_[16]\,
      R => \p_0_in__0\
    );
\write_data_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wdata(17),
      Q => \write_data_reg_n_0_[17]\,
      R => \p_0_in__0\
    );
\write_data_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wdata(18),
      Q => \write_data_reg_n_0_[18]\,
      R => \p_0_in__0\
    );
\write_data_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wdata(19),
      Q => \write_data_reg_n_0_[19]\,
      R => \p_0_in__0\
    );
\write_data_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wdata(1),
      Q => \write_data_reg_n_0_[1]\,
      R => \p_0_in__0\
    );
\write_data_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wdata(20),
      Q => \write_data_reg_n_0_[20]\,
      R => \p_0_in__0\
    );
\write_data_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wdata(21),
      Q => \write_data_reg_n_0_[21]\,
      R => \p_0_in__0\
    );
\write_data_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wdata(22),
      Q => \write_data_reg_n_0_[22]\,
      R => \p_0_in__0\
    );
\write_data_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wdata(23),
      Q => \write_data_reg_n_0_[23]\,
      R => \p_0_in__0\
    );
\write_data_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wdata(24),
      Q => \write_data_reg_n_0_[24]\,
      R => \p_0_in__0\
    );
\write_data_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wdata(25),
      Q => \write_data_reg_n_0_[25]\,
      R => \p_0_in__0\
    );
\write_data_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wdata(26),
      Q => \write_data_reg_n_0_[26]\,
      R => \p_0_in__0\
    );
\write_data_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wdata(27),
      Q => \write_data_reg_n_0_[27]\,
      R => \p_0_in__0\
    );
\write_data_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wdata(28),
      Q => \write_data_reg_n_0_[28]\,
      R => \p_0_in__0\
    );
\write_data_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wdata(29),
      Q => \write_data_reg_n_0_[29]\,
      R => \p_0_in__0\
    );
\write_data_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wdata(2),
      Q => \write_data_reg_n_0_[2]\,
      R => \p_0_in__0\
    );
\write_data_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wdata(30),
      Q => \write_data_reg_n_0_[30]\,
      R => \p_0_in__0\
    );
\write_data_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wdata(31),
      Q => \write_data_reg_n_0_[31]\,
      R => \p_0_in__0\
    );
\write_data_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wdata(3),
      Q => \write_data_reg_n_0_[3]\,
      R => \p_0_in__0\
    );
\write_data_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wdata(4),
      Q => \write_data_reg_n_0_[4]\,
      R => \p_0_in__0\
    );
\write_data_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wdata(5),
      Q => \write_data_reg_n_0_[5]\,
      R => \p_0_in__0\
    );
\write_data_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wdata(6),
      Q => \write_data_reg_n_0_[6]\,
      R => \p_0_in__0\
    );
\write_data_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wdata(7),
      Q => \write_data_reg_n_0_[7]\,
      R => \p_0_in__0\
    );
\write_data_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wdata(8),
      Q => p_1_in5_in,
      R => \p_0_in__0\
    );
\write_data_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wdata(9),
      Q => \write_data_reg_n_0_[9]\,
      R => \p_0_in__0\
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
      Q => p_7_out,
      R => \p_0_in__0\
    );
\write_strobes_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wstrb(1),
      Q => p_5_out,
      R => \p_0_in__0\
    );
\write_strobes_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wstrb(2),
      Q => p_0_in0,
      R => \p_0_in__0\
    );
\write_strobes_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => write_data0,
      D => s_axi_wstrb(3),
      Q => \write_strobes_reg_n_0_[3]\,
      R => \p_0_in__0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_finite_pwm_0 is
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
    pwm_out : out STD_LOGIC;
    period_start : out STD_LOGIC;
    burst_start : out STD_LOGIC;
    done_event : out STD_LOGIC;
    activity : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of system_finite_pwm_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of system_finite_pwm_0 : entity is "system_finite_pwm_0,fdw_pwm_burst_axi,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of system_finite_pwm_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of system_finite_pwm_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of system_finite_pwm_0 : entity is "fdw_pwm_burst_axi,Vivado 2025.1";
end system_finite_pwm_0;

architecture STRUCTURE of system_finite_pwm_0 is
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
inst: entity work.system_finite_pwm_0_fdw_pwm_burst_axi
     port map (
      burst_start => burst_start,
      done_event => done_event,
      launch_valid_reg_0 => activity,
      period_start => period_start,
      pwm_out => pwm_out,
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
      s_axi_wvalid => s_axi_wvalid
    );
end STRUCTURE;
