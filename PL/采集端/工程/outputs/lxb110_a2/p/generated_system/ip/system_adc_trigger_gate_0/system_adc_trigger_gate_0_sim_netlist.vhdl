-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
-- Date        : Thu Oct 22 00:41:41 2026
-- Host        : xiaojun running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/33525/FDW_NEXT/outputs/lxb110_a2/p/generated_system/ip/system_adc_trigger_gate_0/system_adc_trigger_gate_0_sim_netlist.vhdl
-- Design      : system_adc_trigger_gate_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg484-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_adc_trigger_gate_0_fdw_event_cdc is
  port (
    trigger_status : out STD_LOGIC_VECTOR ( 0 to 0 );
    \src_reset_release_reg[1]_0\ : out STD_LOGIC;
    capture_control_2_sp_1 : out STD_LOGIC;
    legacy_control : out STD_LOGIC_VECTOR ( 0 to 0 );
    sample_clk : in STD_LOGIC;
    control_clk : in STD_LOGIC;
    capture_control : in STD_LOGIC_VECTOR ( 2 downto 0 );
    control_resetn : in STD_LOGIC;
    sample_resetn : in STD_LOGIC;
    waiting_reg : in STD_LOGIC;
    event_accepted_reg : in STD_LOGIC;
    trigger_event : in STD_LOGIC;
    event_accepted_reg_0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    arm_previous : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_adc_trigger_gate_0_fdw_event_cdc : entity is "fdw_event_cdc";
end system_adc_trigger_gate_0_fdw_event_cdc;

architecture STRUCTURE of system_adc_trigger_gate_0_fdw_event_cdc is
  signal acknowledge_sync : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of acknowledge_sync : signal is "true";
  attribute shreg_extract : string;
  attribute shreg_extract of acknowledge_sync : signal is "no";
  signal acknowledge_toggle : STD_LOGIC;
  signal acknowledge_toggle_i_1_n_0 : STD_LOGIC;
  signal capture_control_2_sn_1 : STD_LOGIC;
  signal dst_pulse_i_1_n_0 : STD_LOGIC;
  signal dst_reset_release : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of dst_reset_release : signal is "true";
  attribute shreg_extract of dst_reset_release : signal is "no";
  signal event_accepted_i_3_n_0 : STD_LOGIC;
  signal event_ready : STD_LOGIC;
  signal event_valid3 : STD_LOGIC;
  signal request_sync : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of request_sync : signal is "true";
  attribute shreg_extract of request_sync : signal is "no";
  signal request_toggle_i_1_n_0 : STD_LOGIC;
  signal request_toggle_reg_n_0 : STD_LOGIC;
  signal sample_pulse : STD_LOGIC;
  signal src_reset_release : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of src_reset_release : signal is "true";
  attribute shreg_extract of src_reset_release : signal is "no";
  signal \src_reset_release[1]_i_1_n_0\ : STD_LOGIC;
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of \acknowledge_sync_reg[0]\ : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of \acknowledge_sync_reg[0]\ : label is "yes";
  attribute SHREG_EXTRACT of \acknowledge_sync_reg[0]\ : label is "no";
  attribute ASYNC_REG_boolean of \acknowledge_sync_reg[1]\ : label is std.standard.true;
  attribute KEEP of \acknowledge_sync_reg[1]\ : label is "yes";
  attribute SHREG_EXTRACT of \acknowledge_sync_reg[1]\ : label is "no";
  attribute ASYNC_REG_boolean of \dst_reset_release_reg[0]\ : label is std.standard.true;
  attribute KEEP of \dst_reset_release_reg[0]\ : label is "yes";
  attribute SHREG_EXTRACT of \dst_reset_release_reg[0]\ : label is "no";
  attribute ASYNC_REG_boolean of \dst_reset_release_reg[1]\ : label is std.standard.true;
  attribute KEEP of \dst_reset_release_reg[1]\ : label is "yes";
  attribute SHREG_EXTRACT of \dst_reset_release_reg[1]\ : label is "no";
  attribute ASYNC_REG_boolean of \request_sync_reg[0]\ : label is std.standard.true;
  attribute KEEP of \request_sync_reg[0]\ : label is "yes";
  attribute SHREG_EXTRACT of \request_sync_reg[0]\ : label is "no";
  attribute ASYNC_REG_boolean of \request_sync_reg[1]\ : label is std.standard.true;
  attribute KEEP of \request_sync_reg[1]\ : label is "yes";
  attribute SHREG_EXTRACT of \request_sync_reg[1]\ : label is "no";
  attribute ASYNC_REG_boolean of \src_reset_release_reg[0]\ : label is std.standard.true;
  attribute KEEP of \src_reset_release_reg[0]\ : label is "yes";
  attribute SHREG_EXTRACT of \src_reset_release_reg[0]\ : label is "no";
  attribute ASYNC_REG_boolean of \src_reset_release_reg[1]\ : label is std.standard.true;
  attribute KEEP of \src_reset_release_reg[1]\ : label is "yes";
  attribute SHREG_EXTRACT of \src_reset_release_reg[1]\ : label is "no";
begin
  capture_control_2_sp_1 <= capture_control_2_sn_1;
\acknowledge_sync_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => '1',
      CLR => \src_reset_release[1]_i_1_n_0\,
      D => acknowledge_toggle,
      Q => acknowledge_sync(0)
    );
\acknowledge_sync_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => '1',
      CLR => \src_reset_release[1]_i_1_n_0\,
      D => acknowledge_sync(0),
      Q => acknowledge_sync(1)
    );
acknowledge_toggle_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => request_sync(1),
      I1 => dst_reset_release(1),
      O => acknowledge_toggle_i_1_n_0
    );
acknowledge_toggle_reg: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => '1',
      CLR => \src_reset_release[1]_i_1_n_0\,
      D => acknowledge_toggle_i_1_n_0,
      Q => acknowledge_toggle
    );
dst_pulse_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"28"
    )
        port map (
      I0 => dst_reset_release(1),
      I1 => request_sync(1),
      I2 => acknowledge_toggle,
      O => dst_pulse_i_1_n_0
    );
dst_pulse_reg: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => '1',
      CLR => \src_reset_release[1]_i_1_n_0\,
      D => dst_pulse_i_1_n_0,
      Q => sample_pulse
    );
\dst_reset_release_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => '1',
      CLR => \src_reset_release[1]_i_1_n_0\,
      D => '1',
      Q => dst_reset_release(0)
    );
\dst_reset_release_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => '1',
      CLR => \src_reset_release[1]_i_1_n_0\,
      D => dst_reset_release(0),
      Q => dst_reset_release(1)
    );
event_accepted_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AA800000"
    )
        port map (
      I0 => capture_control(2),
      I1 => event_ready,
      I2 => event_accepted_i_3_n_0,
      I3 => event_accepted_reg,
      I4 => event_valid3,
      O => capture_control_2_sn_1
    );
event_accepted_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000082000000"
    )
        port map (
      I0 => src_reset_release(1),
      I1 => acknowledge_sync(1),
      I2 => request_toggle_reg_n_0,
      I3 => sample_resetn,
      I4 => control_resetn,
      I5 => capture_control(1),
      O => event_ready
    );
event_accepted_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0800080008080800"
    )
        port map (
      I0 => trigger_event,
      I1 => capture_control(2),
      I2 => event_accepted_reg,
      I3 => event_accepted_reg_0(0),
      I4 => capture_control(0),
      I5 => arm_previous,
      O => event_accepted_i_3_n_0
    );
event_accepted_i_4: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => capture_control(1),
      I1 => control_resetn,
      I2 => sample_resetn,
      O => event_valid3
    );
\legacy_control[0]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => sample_pulse,
      I1 => capture_control(2),
      I2 => capture_control(0),
      O => legacy_control(0)
    );
\request_sync_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => '1',
      CLR => \src_reset_release[1]_i_1_n_0\,
      D => request_toggle_reg_n_0,
      Q => request_sync(0)
    );
\request_sync_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => '1',
      CLR => \src_reset_release[1]_i_1_n_0\,
      D => request_sync(0),
      Q => request_sync(1)
    );
request_toggle_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"5CCC0000"
    )
        port map (
      I0 => acknowledge_sync(1),
      I1 => request_toggle_reg_n_0,
      I2 => event_valid3,
      I3 => event_accepted_i_3_n_0,
      I4 => src_reset_release(1),
      O => request_toggle_i_1_n_0
    );
request_toggle_reg: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => '1',
      CLR => \src_reset_release[1]_i_1_n_0\,
      D => request_toggle_i_1_n_0,
      Q => request_toggle_reg_n_0
    );
\src_reset_release[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F7"
    )
        port map (
      I0 => sample_resetn,
      I1 => control_resetn,
      I2 => capture_control(1),
      O => \src_reset_release[1]_i_1_n_0\
    );
\src_reset_release_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => '1',
      CLR => \src_reset_release[1]_i_1_n_0\,
      D => '1',
      Q => src_reset_release(0)
    );
\src_reset_release_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => '1',
      CLR => \src_reset_release[1]_i_1_n_0\,
      D => src_reset_release(0),
      Q => src_reset_release(1)
    );
\trigger_status[2]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFFFFFBFFFFFFFFF"
    )
        port map (
      I0 => capture_control(1),
      I1 => control_resetn,
      I2 => sample_resetn,
      I3 => request_toggle_reg_n_0,
      I4 => acknowledge_sync(1),
      I5 => src_reset_release(1),
      O => trigger_status(0)
    );
waiting_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2AA20000AAAA0000"
    )
        port map (
      I0 => waiting_reg,
      I1 => src_reset_release(1),
      I2 => acknowledge_sync(1),
      I3 => request_toggle_reg_n_0,
      I4 => event_valid3,
      I5 => event_accepted_i_3_n_0,
      O => \src_reset_release_reg[1]_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_adc_trigger_gate_0_fdw_adc_trigger_gate is
  port (
    trigger_status : out STD_LOGIC_VECTOR ( 2 downto 0 );
    legacy_control : out STD_LOGIC_VECTOR ( 0 to 0 );
    control_clk : in STD_LOGIC;
    sample_clk : in STD_LOGIC;
    capture_control : in STD_LOGIC_VECTOR ( 2 downto 0 );
    control_resetn : in STD_LOGIC;
    sample_resetn : in STD_LOGIC;
    trigger_event : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_adc_trigger_gate_0_fdw_adc_trigger_gate : entity is "fdw_adc_trigger_gate";
end system_adc_trigger_gate_0_fdw_adc_trigger_gate;

architecture STRUCTURE of system_adc_trigger_gate_0_fdw_adc_trigger_gate is
  signal arm_previous : STD_LOGIC;
  signal arm_previous_i_1_n_0 : STD_LOGIC;
  signal bridge_n_1 : STD_LOGIC;
  signal bridge_n_2 : STD_LOGIC;
  signal \^trigger_status\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal waiting_i_2_n_0 : STD_LOGIC;
begin
  trigger_status(2 downto 0) <= \^trigger_status\(2 downto 0);
arm_previous_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0800"
    )
        port map (
      I0 => sample_resetn,
      I1 => control_resetn,
      I2 => capture_control(1),
      I3 => capture_control(0),
      O => arm_previous_i_1_n_0
    );
arm_previous_reg: unisim.vcomponents.FDRE
     port map (
      C => control_clk,
      CE => '1',
      D => arm_previous_i_1_n_0,
      Q => arm_previous,
      R => '0'
    );
bridge: entity work.system_adc_trigger_gate_0_fdw_event_cdc
     port map (
      arm_previous => arm_previous,
      capture_control(2 downto 0) => capture_control(2 downto 0),
      capture_control_2_sp_1 => bridge_n_2,
      control_clk => control_clk,
      control_resetn => control_resetn,
      event_accepted_reg => \^trigger_status\(1),
      event_accepted_reg_0(0) => \^trigger_status\(0),
      legacy_control(0) => legacy_control(0),
      sample_clk => sample_clk,
      sample_resetn => sample_resetn,
      \src_reset_release_reg[1]_0\ => bridge_n_1,
      trigger_event => trigger_event,
      trigger_status(0) => \^trigger_status\(2),
      waiting_reg => waiting_i_2_n_0
    );
event_accepted_reg: unisim.vcomponents.FDRE
     port map (
      C => control_clk,
      CE => '1',
      D => bridge_n_2,
      Q => \^trigger_status\(1),
      R => '0'
    );
waiting_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AABA0000"
    )
        port map (
      I0 => \^trigger_status\(0),
      I1 => arm_previous,
      I2 => capture_control(0),
      I3 => \^trigger_status\(1),
      I4 => capture_control(2),
      O => waiting_i_2_n_0
    );
waiting_reg: unisim.vcomponents.FDRE
     port map (
      C => control_clk,
      CE => '1',
      D => bridge_n_1,
      Q => \^trigger_status\(0),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_adc_trigger_gate_0 is
  port (
    control_clk : in STD_LOGIC;
    control_resetn : in STD_LOGIC;
    sample_clk : in STD_LOGIC;
    sample_resetn : in STD_LOGIC;
    capture_control : in STD_LOGIC_VECTOR ( 2 downto 0 );
    trigger_event : in STD_LOGIC;
    legacy_control : out STD_LOGIC_VECTOR ( 1 downto 0 );
    trigger_status : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of system_adc_trigger_gate_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of system_adc_trigger_gate_0 : entity is "system_adc_trigger_gate_0,fdw_adc_trigger_gate,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of system_adc_trigger_gate_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of system_adc_trigger_gate_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of system_adc_trigger_gate_0 : entity is "fdw_adc_trigger_gate,Vivado 2025.1";
end system_adc_trigger_gate_0;

architecture STRUCTURE of system_adc_trigger_gate_0 is
  signal \^capture_control\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \^legacy_control\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^trigger_status\ : STD_LOGIC_VECTOR ( 2 downto 0 );
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
begin
  \^capture_control\(2 downto 0) <= capture_control(2 downto 0);
  legacy_control(1) <= \^capture_control\(1);
  legacy_control(0) <= \^legacy_control\(0);
  trigger_status(3) <= \^capture_control\(2);
  trigger_status(2 downto 0) <= \^trigger_status\(2 downto 0);
inst: entity work.system_adc_trigger_gate_0_fdw_adc_trigger_gate
     port map (
      capture_control(2 downto 0) => \^capture_control\(2 downto 0),
      control_clk => control_clk,
      control_resetn => control_resetn,
      legacy_control(0) => \^legacy_control\(0),
      sample_clk => sample_clk,
      sample_resetn => sample_resetn,
      trigger_event => trigger_event,
      trigger_status(2 downto 0) => \^trigger_status\(2 downto 0)
    );
end STRUCTURE;
