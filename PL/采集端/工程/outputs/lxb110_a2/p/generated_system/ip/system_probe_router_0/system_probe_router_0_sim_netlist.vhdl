-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
-- Date        : Thu Oct 22 00:36:55 2026
-- Host        : xiaojun running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/33525/FDW_NEXT/outputs/lxb110_a2/p/generated_system/ip/system_probe_router_0/system_probe_router_0_sim_netlist.vhdl
-- Design      : system_probe_router_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg484-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_probe_router_0_fdw_probe_router is
  port (
    D : out STD_LOGIC_VECTOR ( 1 downto 0 );
    Q : out STD_LOGIC_VECTOR ( 2 downto 0 );
    status_word : out STD_LOGIC_VECTOR ( 23 downto 0 );
    sample_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    pwm_out : out STD_LOGIC;
    trigger_out : out STD_LOGIC;
    invalidate_capture : out STD_LOGIC;
    capture_active : in STD_LOGIC;
    pwm_active : in STD_LOGIC;
    control_word : in STD_LOGIC_VECTOR ( 31 downto 0 );
    resetn : in STD_LOGIC;
    clk : in STD_LOGIC;
    digital_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    finite_pwm : in STD_LOGIC;
    continuous_pwm : in STD_LOGIC;
    finite_event : in STD_LOGIC;
    continuous_event : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_probe_router_0_fdw_probe_router : entity is "fdw_probe_router";
end system_probe_router_0_fdw_probe_router;

architecture STRUCTURE of system_probe_router_0_fdw_probe_router is
  signal \^q\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal active_mode : STD_LOGIC;
  signal active_mode1 : STD_LOGIC;
  signal clear : STD_LOGIC;
  signal digital_meta : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of digital_meta : signal is "true";
  attribute shreg_extract : string;
  attribute shreg_extract of digital_meta : signal is "no";
  signal digital_previous : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal digital_sync : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of digital_sync : signal is "true";
  attribute shreg_extract of digital_sync : signal is "no";
  signal finite_select : STD_LOGIC;
  signal \generation[14]_i_4_n_0\ : STD_LOGIC;
  signal \generation[14]_i_5_n_0\ : STD_LOGIC;
  signal \generation[3]_i_2_n_0\ : STD_LOGIC;
  signal \generation_reg[11]_i_1_n_0\ : STD_LOGIC;
  signal \generation_reg[11]_i_1_n_1\ : STD_LOGIC;
  signal \generation_reg[11]_i_1_n_2\ : STD_LOGIC;
  signal \generation_reg[11]_i_1_n_3\ : STD_LOGIC;
  signal \generation_reg[11]_i_1_n_4\ : STD_LOGIC;
  signal \generation_reg[11]_i_1_n_5\ : STD_LOGIC;
  signal \generation_reg[11]_i_1_n_6\ : STD_LOGIC;
  signal \generation_reg[11]_i_1_n_7\ : STD_LOGIC;
  signal \generation_reg[14]_i_3_n_2\ : STD_LOGIC;
  signal \generation_reg[14]_i_3_n_3\ : STD_LOGIC;
  signal \generation_reg[14]_i_3_n_5\ : STD_LOGIC;
  signal \generation_reg[14]_i_3_n_6\ : STD_LOGIC;
  signal \generation_reg[14]_i_3_n_7\ : STD_LOGIC;
  signal \generation_reg[3]_i_1_n_0\ : STD_LOGIC;
  signal \generation_reg[3]_i_1_n_1\ : STD_LOGIC;
  signal \generation_reg[3]_i_1_n_2\ : STD_LOGIC;
  signal \generation_reg[3]_i_1_n_3\ : STD_LOGIC;
  signal \generation_reg[3]_i_1_n_4\ : STD_LOGIC;
  signal \generation_reg[3]_i_1_n_5\ : STD_LOGIC;
  signal \generation_reg[3]_i_1_n_6\ : STD_LOGIC;
  signal \generation_reg[3]_i_1_n_7\ : STD_LOGIC;
  signal \generation_reg[7]_i_1_n_0\ : STD_LOGIC;
  signal \generation_reg[7]_i_1_n_1\ : STD_LOGIC;
  signal \generation_reg[7]_i_1_n_2\ : STD_LOGIC;
  signal \generation_reg[7]_i_1_n_3\ : STD_LOGIC;
  signal \generation_reg[7]_i_1_n_4\ : STD_LOGIC;
  signal \generation_reg[7]_i_1_n_5\ : STD_LOGIC;
  signal \generation_reg[7]_i_1_n_6\ : STD_LOGIC;
  signal \generation_reg[7]_i_1_n_7\ : STD_LOGIC;
  signal invalidate_capture_i_1_n_0 : STD_LOGIC;
  signal output_permit_reg_n_0 : STD_LOGIC;
  signal \^pwm_out\ : STD_LOGIC;
  signal \result_code[0]_i_1_n_0\ : STD_LOGIC;
  signal \result_code[0]_i_2_n_0\ : STD_LOGIC;
  signal \result_code[0]_i_3_n_0\ : STD_LOGIC;
  signal \result_code[1]_i_1_n_0\ : STD_LOGIC;
  signal \result_code[1]_i_2_n_0\ : STD_LOGIC;
  signal \result_code[1]_i_3_n_0\ : STD_LOGIC;
  signal \result_code[2]_i_1_n_0\ : STD_LOGIC;
  signal \result_code[2]_i_2_n_0\ : STD_LOGIC;
  signal \result_code[2]_i_3_n_0\ : STD_LOGIC;
  signal \result_code[2]_i_4_n_0\ : STD_LOGIC;
  signal \result_code[2]_i_5_n_0\ : STD_LOGIC;
  signal \result_code[2]_i_6_n_0\ : STD_LOGIC;
  signal \result_code[2]_i_7_n_0\ : STD_LOGIC;
  signal \result_code[2]_i_8_n_0\ : STD_LOGIC;
  signal \result_code[2]_i_9_n_0\ : STD_LOGIC;
  signal \sample_out[1]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \settle_count[0]_i_1_n_0\ : STD_LOGIC;
  signal \settle_count[0]_i_2_n_0\ : STD_LOGIC;
  signal \settle_count[0]_i_3_n_0\ : STD_LOGIC;
  signal \settle_count[1]_i_1_n_0\ : STD_LOGIC;
  signal \settle_count[1]_i_2_n_0\ : STD_LOGIC;
  signal \settle_count[1]_i_3_n_0\ : STD_LOGIC;
  signal \settle_count[2]_i_1_n_0\ : STD_LOGIC;
  signal \settle_count[2]_i_2_n_0\ : STD_LOGIC;
  signal \settle_count[2]_i_3_n_0\ : STD_LOGIC;
  signal \settle_count[2]_i_5_n_0\ : STD_LOGIC;
  signal \settle_count[2]_i_6_n_0\ : STD_LOGIC;
  signal \settle_count[2]_i_7_n_0\ : STD_LOGIC;
  signal \settle_count_reg_n_0_[0]\ : STD_LOGIC;
  signal \settle_count_reg_n_0_[1]\ : STD_LOGIC;
  signal \settle_count_reg_n_0_[2]\ : STD_LOGIC;
  signal \^status_word\ : STD_LOGIC_VECTOR ( 23 downto 0 );
  signal trigger_out_INST_0_i_1_n_0 : STD_LOGIC;
  signal trigger_out_INST_0_i_2_n_0 : STD_LOGIC;
  signal \NLW_generation_reg[14]_i_3_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_generation_reg[14]_i_3_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of \digital_meta_reg[0]\ : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of \digital_meta_reg[0]\ : label is "yes";
  attribute SHREG_EXTRACT of \digital_meta_reg[0]\ : label is "no";
  attribute ASYNC_REG_boolean of \digital_meta_reg[1]\ : label is std.standard.true;
  attribute KEEP of \digital_meta_reg[1]\ : label is "yes";
  attribute SHREG_EXTRACT of \digital_meta_reg[1]\ : label is "no";
  attribute ASYNC_REG_boolean of \digital_sync_reg[0]\ : label is std.standard.true;
  attribute KEEP of \digital_sync_reg[0]\ : label is "yes";
  attribute SHREG_EXTRACT of \digital_sync_reg[0]\ : label is "no";
  attribute ASYNC_REG_boolean of \digital_sync_reg[1]\ : label is std.standard.true;
  attribute KEEP of \digital_sync_reg[1]\ : label is "yes";
  attribute SHREG_EXTRACT of \digital_sync_reg[1]\ : label is "no";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \generation[14]_i_5\ : label is "soft_lutpair3";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \generation_reg[11]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \generation_reg[14]_i_3\ : label is 11;
  attribute ADDER_THRESHOLD of \generation_reg[3]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \generation_reg[7]_i_1\ : label is 11;
  attribute SOFT_HLUTNM of invalidate_capture_i_1 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of pwm_out_INST_0 : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \result_code[0]_i_3\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \sample_out[1]_INST_0_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \settle_count[1]_i_2\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \settle_count[2]_i_2\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \settle_count[2]_i_3\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \settle_count[2]_i_4\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \settle_count[2]_i_6\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \settle_count[2]_i_7\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \status_word[12]_INST_0\ : label is "soft_lutpair2";
begin
  D(1 downto 0) <= digital_sync(1 downto 0);
  Q(2 downto 0) <= \^q\(2 downto 0);
  pwm_out <= \^pwm_out\;
  status_word(23 downto 0) <= \^status_word\(23 downto 0);
acknowledged_reg: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => control_word(7),
      Q => \^status_word\(4),
      R => clear
    );
\active_mode_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => active_mode,
      D => control_word(0),
      Q => \^q\(0),
      R => clear
    );
\active_mode_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => active_mode,
      D => control_word(1),
      Q => \^q\(1),
      R => clear
    );
\active_mode_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => active_mode,
      D => control_word(2),
      Q => \^q\(2),
      R => clear
    );
\digital_meta_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => digital_in(0),
      Q => digital_meta(0),
      R => clear
    );
\digital_meta_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => digital_in(1),
      Q => digital_meta(1),
      R => clear
    );
\digital_previous_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => digital_sync(0),
      Q => digital_previous(0),
      R => clear
    );
\digital_previous_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => digital_sync(1),
      Q => digital_previous(1),
      R => clear
    );
\digital_sync_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => digital_meta(0),
      Q => digital_sync(0),
      R => clear
    );
\digital_sync_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => digital_meta(1),
      Q => digital_sync(1),
      R => clear
    );
finite_select_reg: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => active_mode,
      D => control_word(8),
      Q => finite_select,
      R => clear
    );
\generation[14]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => resetn,
      O => clear
    );
\generation[14]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0060"
    )
        port map (
      I0 => control_word(7),
      I1 => \^status_word\(4),
      I2 => \generation[14]_i_4_n_0\,
      I3 => \generation[14]_i_5_n_0\,
      O => active_mode
    );
\generation[14]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"01010001000100FF"
    )
        port map (
      I0 => \^status_word\(8),
      I1 => capture_active,
      I2 => pwm_active,
      I3 => control_word(3),
      I4 => control_word(0),
      I5 => control_word(1),
      O => \generation[14]_i_4_n_0\
    );
\generation[14]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \result_code[2]_i_3_n_0\,
      I1 => control_word(2),
      O => \generation[14]_i_5_n_0\
    );
\generation[3]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^status_word\(9),
      O => \generation[3]_i_2_n_0\
    );
\generation_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => active_mode,
      D => \generation_reg[3]_i_1_n_7\,
      Q => \^status_word\(9),
      R => clear
    );
\generation_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => active_mode,
      D => \generation_reg[11]_i_1_n_5\,
      Q => \^status_word\(19),
      R => clear
    );
\generation_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => active_mode,
      D => \generation_reg[11]_i_1_n_4\,
      Q => \^status_word\(20),
      R => clear
    );
\generation_reg[11]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \generation_reg[7]_i_1_n_0\,
      CO(3) => \generation_reg[11]_i_1_n_0\,
      CO(2) => \generation_reg[11]_i_1_n_1\,
      CO(1) => \generation_reg[11]_i_1_n_2\,
      CO(0) => \generation_reg[11]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \generation_reg[11]_i_1_n_4\,
      O(2) => \generation_reg[11]_i_1_n_5\,
      O(1) => \generation_reg[11]_i_1_n_6\,
      O(0) => \generation_reg[11]_i_1_n_7\,
      S(3 downto 0) => \^status_word\(20 downto 17)
    );
\generation_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => active_mode,
      D => \generation_reg[14]_i_3_n_7\,
      Q => \^status_word\(21),
      R => clear
    );
\generation_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => active_mode,
      D => \generation_reg[14]_i_3_n_6\,
      Q => \^status_word\(22),
      R => clear
    );
\generation_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => active_mode,
      D => \generation_reg[14]_i_3_n_5\,
      Q => \^status_word\(23),
      R => clear
    );
\generation_reg[14]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => \generation_reg[11]_i_1_n_0\,
      CO(3 downto 2) => \NLW_generation_reg[14]_i_3_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \generation_reg[14]_i_3_n_2\,
      CO(0) => \generation_reg[14]_i_3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_generation_reg[14]_i_3_O_UNCONNECTED\(3),
      O(2) => \generation_reg[14]_i_3_n_5\,
      O(1) => \generation_reg[14]_i_3_n_6\,
      O(0) => \generation_reg[14]_i_3_n_7\,
      S(3) => '0',
      S(2 downto 0) => \^status_word\(23 downto 21)
    );
\generation_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => active_mode,
      D => \generation_reg[3]_i_1_n_6\,
      Q => \^status_word\(10),
      R => clear
    );
\generation_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => active_mode,
      D => \generation_reg[3]_i_1_n_5\,
      Q => \^status_word\(11),
      R => clear
    );
\generation_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => active_mode,
      D => \generation_reg[3]_i_1_n_4\,
      Q => \^status_word\(12),
      R => clear
    );
\generation_reg[3]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \generation_reg[3]_i_1_n_0\,
      CO(2) => \generation_reg[3]_i_1_n_1\,
      CO(1) => \generation_reg[3]_i_1_n_2\,
      CO(0) => \generation_reg[3]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \generation_reg[3]_i_1_n_4\,
      O(2) => \generation_reg[3]_i_1_n_5\,
      O(1) => \generation_reg[3]_i_1_n_6\,
      O(0) => \generation_reg[3]_i_1_n_7\,
      S(3 downto 1) => \^status_word\(12 downto 10),
      S(0) => \generation[3]_i_2_n_0\
    );
\generation_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => active_mode,
      D => \generation_reg[7]_i_1_n_7\,
      Q => \^status_word\(13),
      R => clear
    );
\generation_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => active_mode,
      D => \generation_reg[7]_i_1_n_6\,
      Q => \^status_word\(14),
      R => clear
    );
\generation_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => active_mode,
      D => \generation_reg[7]_i_1_n_5\,
      Q => \^status_word\(15),
      R => clear
    );
\generation_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => active_mode,
      D => \generation_reg[7]_i_1_n_4\,
      Q => \^status_word\(16),
      R => clear
    );
\generation_reg[7]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \generation_reg[3]_i_1_n_0\,
      CO(3) => \generation_reg[7]_i_1_n_0\,
      CO(2) => \generation_reg[7]_i_1_n_1\,
      CO(1) => \generation_reg[7]_i_1_n_2\,
      CO(0) => \generation_reg[7]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \generation_reg[7]_i_1_n_4\,
      O(2) => \generation_reg[7]_i_1_n_5\,
      O(1) => \generation_reg[7]_i_1_n_6\,
      O(0) => \generation_reg[7]_i_1_n_7\,
      S(3 downto 0) => \^status_word\(16 downto 13)
    );
\generation_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => active_mode,
      D => \generation_reg[11]_i_1_n_7\,
      Q => \^status_word\(17),
      R => clear
    );
\generation_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => active_mode,
      D => \generation_reg[11]_i_1_n_6\,
      Q => \^status_word\(18),
      R => clear
    );
invalidate_capture_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00002800"
    )
        port map (
      I0 => \generation[14]_i_4_n_0\,
      I1 => \^status_word\(4),
      I2 => control_word(7),
      I3 => resetn,
      I4 => \generation[14]_i_5_n_0\,
      O => invalidate_capture_i_1_n_0
    );
invalidate_capture_reg: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => invalidate_capture_i_1_n_0,
      Q => invalidate_capture,
      R => '0'
    );
output_permit_reg: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => active_mode,
      D => control_word(3),
      Q => output_permit_reg_n_0,
      R => clear
    );
pwm_out_INST_0: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => finite_pwm,
      I1 => finite_select,
      I2 => continuous_pwm,
      O => \^pwm_out\
    );
\result_code[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F44F000004400000"
    )
        port map (
      I0 => \result_code[2]_i_3_n_0\,
      I1 => \result_code[0]_i_2_n_0\,
      I2 => \^status_word\(4),
      I3 => control_word(7),
      I4 => resetn,
      I5 => \^status_word\(5),
      O => \result_code[0]_i_1_n_0\
    );
\result_code[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00FF80E0"
    )
        port map (
      I0 => control_word(0),
      I1 => control_word(1),
      I2 => \result_code[0]_i_3_n_0\,
      I3 => control_word(3),
      I4 => control_word(2),
      O => \result_code[0]_i_2_n_0\
    );
\result_code[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000004"
    )
        port map (
      I0 => capture_active,
      I1 => pwm_active,
      I2 => \settle_count_reg_n_0_[2]\,
      I3 => \settle_count_reg_n_0_[0]\,
      I4 => \settle_count_reg_n_0_[1]\,
      O => \result_code[0]_i_3_n_0\
    );
\result_code[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F22F222202202222"
    )
        port map (
      I0 => \result_code[1]_i_2_n_0\,
      I1 => \generation[14]_i_5_n_0\,
      I2 => \^status_word\(4),
      I3 => control_word(7),
      I4 => resetn,
      I5 => \^status_word\(6),
      O => \result_code[1]_i_1_n_0\
    );
\result_code[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A220A2200000A220"
    )
        port map (
      I0 => resetn,
      I1 => control_word(3),
      I2 => control_word(0),
      I3 => control_word(1),
      I4 => \result_code[1]_i_3_n_0\,
      I5 => \^status_word\(8),
      O => \result_code[1]_i_2_n_0\
    );
\result_code[1]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => pwm_active,
      I1 => capture_active,
      O => \result_code[1]_i_3_n_0\
    );
\result_code[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEEFAAAA0EE0AAAA"
    )
        port map (
      I0 => \result_code[2]_i_2_n_0\,
      I1 => \result_code[2]_i_3_n_0\,
      I2 => \^status_word\(4),
      I3 => control_word(7),
      I4 => resetn,
      I5 => \^status_word\(7),
      O => \result_code[2]_i_1_n_0\
    );
\result_code[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"88880888"
    )
        port map (
      I0 => control_word(3),
      I1 => resetn,
      I2 => control_word(0),
      I3 => control_word(1),
      I4 => control_word(2),
      O => \result_code[2]_i_2_n_0\
    );
\result_code[2]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \result_code[2]_i_4_n_0\,
      I1 => \result_code[2]_i_5_n_0\,
      I2 => \result_code[2]_i_6_n_0\,
      I3 => \result_code[2]_i_7_n_0\,
      I4 => \result_code[2]_i_8_n_0\,
      I5 => \result_code[2]_i_9_n_0\,
      O => \result_code[2]_i_3_n_0\
    );
\result_code[2]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => control_word(25),
      I1 => control_word(24),
      I2 => control_word(27),
      I3 => control_word(26),
      O => \result_code[2]_i_4_n_0\
    );
\result_code[2]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => control_word(29),
      I1 => control_word(28),
      I2 => control_word(31),
      I3 => control_word(30),
      O => \result_code[2]_i_5_n_0\
    );
\result_code[2]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => control_word(17),
      I1 => control_word(16),
      I2 => control_word(19),
      I3 => control_word(18),
      O => \result_code[2]_i_6_n_0\
    );
\result_code[2]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => control_word(21),
      I1 => control_word(20),
      I2 => control_word(23),
      I3 => control_word(22),
      O => \result_code[2]_i_7_n_0\
    );
\result_code[2]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => control_word(13),
      I1 => control_word(12),
      I2 => control_word(15),
      I3 => control_word(14),
      O => \result_code[2]_i_8_n_0\
    );
\result_code[2]_i_9\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFF8"
    )
        port map (
      I0 => control_word(5),
      I1 => control_word(6),
      I2 => control_word(9),
      I3 => control_word(11),
      I4 => control_word(10),
      O => \result_code[2]_i_9_n_0\
    );
\result_code_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \result_code[0]_i_1_n_0\,
      Q => \^status_word\(5),
      R => '0'
    );
\result_code_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \result_code[1]_i_1_n_0\,
      Q => \^status_word\(6),
      R => '0'
    );
\result_code_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \result_code[2]_i_1_n_0\,
      Q => \^status_word\(7),
      R => '0'
    );
\sample_out[0]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000F808"
    )
        port map (
      I0 => \^pwm_out\,
      I1 => \^q\(0),
      I2 => \^q\(1),
      I3 => digital_sync(0),
      I4 => \^q\(2),
      O => sample_out(0)
    );
\sample_out[1]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000F808"
    )
        port map (
      I0 => \sample_out[1]_INST_0_i_1_n_0\,
      I1 => \^q\(0),
      I2 => \^q\(1),
      I3 => digital_sync(1),
      I4 => \^q\(2),
      O => sample_out(1)
    );
\sample_out[1]_INST_0_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => finite_event,
      I1 => finite_select,
      I2 => continuous_event,
      O => \sample_out[1]_INST_0_i_1_n_0\
    );
\settle_count[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF00FFFFFFC80000"
    )
        port map (
      I0 => \settle_count[1]_i_2_n_0\,
      I1 => resetn,
      I2 => \settle_count[0]_i_2_n_0\,
      I3 => \settle_count[0]_i_3_n_0\,
      I4 => \settle_count[2]_i_5_n_0\,
      I5 => \settle_count_reg_n_0_[0]\,
      O => \settle_count[0]_i_1_n_0\
    );
\settle_count[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEFFFFFFFEFEFE00"
    )
        port map (
      I0 => \settle_count_reg_n_0_[2]\,
      I1 => capture_active,
      I2 => pwm_active,
      I3 => control_word(1),
      I4 => control_word(0),
      I5 => control_word(3),
      O => \settle_count[0]_i_2_n_0\
    );
\settle_count[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00A80000"
    )
        port map (
      I0 => \settle_count_reg_n_0_[1]\,
      I1 => control_word(0),
      I2 => control_word(1),
      I3 => \settle_count_reg_n_0_[0]\,
      I4 => resetn,
      O => \settle_count[0]_i_3_n_0\
    );
\settle_count[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF80FFFFFF400000"
    )
        port map (
      I0 => \settle_count_reg_n_0_[0]\,
      I1 => resetn,
      I2 => \settle_count[1]_i_2_n_0\,
      I3 => \settle_count[1]_i_3_n_0\,
      I4 => \settle_count[2]_i_5_n_0\,
      I5 => \settle_count_reg_n_0_[1]\,
      O => \settle_count[1]_i_1_n_0\
    );
\settle_count[1]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FEEF"
    )
        port map (
      I0 => control_word(2),
      I1 => \result_code[2]_i_3_n_0\,
      I2 => \^status_word\(4),
      I3 => control_word(7),
      O => \settle_count[1]_i_2_n_0\
    );
\settle_count[1]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"300A0000"
    )
        port map (
      I0 => \settle_count[0]_i_2_n_0\,
      I1 => \settle_count[2]_i_2_n_0\,
      I2 => \settle_count_reg_n_0_[1]\,
      I3 => \settle_count_reg_n_0_[0]\,
      I4 => resetn,
      O => \settle_count[1]_i_3_n_0\
    );
\settle_count[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C4CCFFFFC4CC0000"
    )
        port map (
      I0 => \settle_count[2]_i_2_n_0\,
      I1 => \settle_count[2]_i_3_n_0\,
      I2 => \generation[14]_i_5_n_0\,
      I3 => active_mode1,
      I4 => \settle_count[2]_i_5_n_0\,
      I5 => \settle_count_reg_n_0_[2]\,
      O => \settle_count[2]_i_1_n_0\
    );
\settle_count[2]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => control_word(1),
      I1 => control_word(0),
      I2 => control_word(3),
      O => \settle_count[2]_i_2_n_0\
    );
\settle_count[2]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A900"
    )
        port map (
      I0 => \settle_count_reg_n_0_[2]\,
      I1 => \settle_count_reg_n_0_[0]\,
      I2 => \settle_count_reg_n_0_[1]\,
      I3 => resetn,
      O => \settle_count[2]_i_3_n_0\
    );
\settle_count[2]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => control_word(7),
      I1 => \^status_word\(4),
      O => active_mode1
    );
\settle_count[2]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF11100000"
    )
        port map (
      I0 => \result_code[2]_i_3_n_0\,
      I1 => control_word(2),
      I2 => \settle_count[2]_i_2_n_0\,
      I3 => \settle_count[2]_i_6_n_0\,
      I4 => active_mode1,
      I5 => \settle_count[2]_i_7_n_0\,
      O => \settle_count[2]_i_5_n_0\
    );
\settle_count[2]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"11010101"
    )
        port map (
      I0 => capture_active,
      I1 => pwm_active,
      I2 => control_word(3),
      I3 => control_word(0),
      I4 => control_word(1),
      O => \settle_count[2]_i_6_n_0\
    );
\settle_count[2]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FEFF"
    )
        port map (
      I0 => \settle_count_reg_n_0_[2]\,
      I1 => \settle_count_reg_n_0_[0]\,
      I2 => \settle_count_reg_n_0_[1]\,
      I3 => resetn,
      O => \settle_count[2]_i_7_n_0\
    );
\settle_count_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \settle_count[0]_i_1_n_0\,
      Q => \settle_count_reg_n_0_[0]\,
      R => '0'
    );
\settle_count_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \settle_count[1]_i_1_n_0\,
      Q => \settle_count_reg_n_0_[1]\,
      R => '0'
    );
\settle_count_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \settle_count[2]_i_1_n_0\,
      Q => \settle_count_reg_n_0_[2]\,
      R => '0'
    );
\status_word[12]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \settle_count_reg_n_0_[1]\,
      I1 => \settle_count_reg_n_0_[0]\,
      I2 => \settle_count_reg_n_0_[2]\,
      O => \^status_word\(8)
    );
\status_word[3]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000020000000"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(2),
      I2 => output_permit_reg_n_0,
      I3 => \^q\(0),
      I4 => resetn,
      I5 => \^status_word\(8),
      O => \^status_word\(0)
    );
trigger_out_INST_0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4444444000000000"
    )
        port map (
      I0 => \^status_word\(8),
      I1 => resetn,
      I2 => \^q\(2),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => trigger_out_INST_0_i_1_n_0,
      O => trigger_out
    );
trigger_out_INST_0_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00001800"
    )
        port map (
      I0 => digital_previous(0),
      I1 => \^status_word\(1),
      I2 => digital_sync(0),
      I3 => \^status_word\(2),
      I4 => \^status_word\(3),
      I5 => trigger_out_INST_0_i_2_n_0,
      O => trigger_out_INST_0_i_1_n_0
    );
trigger_out_INST_0_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000042CC4200"
    )
        port map (
      I0 => digital_sync(1),
      I1 => \^status_word\(1),
      I2 => digital_previous(1),
      I3 => \^status_word\(3),
      I4 => \sample_out[1]_INST_0_i_1_n_0\,
      I5 => \^status_word\(2),
      O => trigger_out_INST_0_i_2_n_0
    );
\trigger_select_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => active_mode,
      D => control_word(4),
      Q => \^status_word\(1),
      R => clear
    );
\trigger_select_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => active_mode,
      D => control_word(5),
      Q => \^status_word\(2),
      R => clear
    );
\trigger_select_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => active_mode,
      D => control_word(6),
      Q => \^status_word\(3),
      R => clear
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_probe_router_0 is
  port (
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
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of system_probe_router_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of system_probe_router_0 : entity is "system_probe_router_0,fdw_probe_router,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of system_probe_router_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of system_probe_router_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of system_probe_router_0 : entity is "fdw_probe_router,Vivado 2025.1";
end system_probe_router_0;

architecture STRUCTURE of system_probe_router_0 is
  signal \<const0>\ : STD_LOGIC;
  signal \^capture_active\ : STD_LOGIC;
  signal \^pwm_active\ : STD_LOGIC;
  signal \^status_word\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute X_INTERFACE_MODE : string;
  attribute X_INTERFACE_MODE of clk : signal is "slave";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME clk, ASSOCIATED_RESET resetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of resetn : signal is "xilinx.com:signal:reset:1.0 resetn RST";
  attribute X_INTERFACE_MODE of resetn : signal is "slave";
  attribute X_INTERFACE_PARAMETER of resetn : signal is "XIL_INTERFACENAME resetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
begin
  \^capture_active\ <= capture_active;
  \^pwm_active\ <= pwm_active;
  status_word(31 downto 17) <= \^status_word\(31 downto 17);
  status_word(16) <= \^capture_active\;
  status_word(15) <= \^pwm_active\;
  status_word(14 downto 12) <= \^status_word\(14 downto 12);
  status_word(11) <= \<const0>\;
  status_word(10 downto 0) <= \^status_word\(10 downto 0);
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
inst: entity work.system_probe_router_0_fdw_probe_router
     port map (
      D(1 downto 0) => \^status_word\(14 downto 13),
      Q(2 downto 0) => \^status_word\(2 downto 0),
      capture_active => \^capture_active\,
      clk => clk,
      continuous_event => continuous_event,
      continuous_pwm => continuous_pwm,
      control_word(31 downto 0) => control_word(31 downto 0),
      digital_in(1 downto 0) => digital_in(1 downto 0),
      finite_event => finite_event,
      finite_pwm => finite_pwm,
      invalidate_capture => invalidate_capture,
      pwm_active => \^pwm_active\,
      pwm_out => pwm_out,
      resetn => resetn,
      sample_out(1 downto 0) => sample_out(1 downto 0),
      status_word(23 downto 9) => \^status_word\(31 downto 17),
      status_word(8) => \^status_word\(12),
      status_word(7 downto 0) => \^status_word\(10 downto 3),
      trigger_out => trigger_out
    );
end STRUCTURE;
