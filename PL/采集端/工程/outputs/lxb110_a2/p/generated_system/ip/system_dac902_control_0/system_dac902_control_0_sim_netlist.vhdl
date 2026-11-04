-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
-- Date        : Thu Oct 22 00:39:40 2026
-- Host        : xiaojun running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/33525/FDW_NEXT/outputs/lxb110_a2/p/generated_system/ip/system_dac902_control_0/system_dac902_control_0_sim_netlist.vhdl
-- Design      : system_dac902_control_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg484-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_dac902_control_0_fdw_cdc_mailbox is
  port (
    \command_word[29]\ : out STD_LOGIC;
    \command_word[27]\ : out STD_LOGIC;
    tag_counter : out STD_LOGIC;
    reference_config_ftw0 : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    active_enable_reg : out STD_LOGIC_VECTOR ( 0 to 0 );
    Q : out STD_LOGIC_VECTOR ( 121 downto 0 );
    \dst_data_reg[88]_0\ : out STD_LOGIC;
    v2_reg : out STD_LOGIC_VECTOR ( 0 to 0 );
    cfg_rejected0 : out STD_LOGIC;
    sample_pending_reg : out STD_LOGIC_VECTOR ( 0 to 0 );
    interface_initialized_reg : out STD_LOGIC;
    \command_word[31]\ : out STD_LOGIC;
    reply_pending_reg : out STD_LOGIC;
    status_word : out STD_LOGIC_VECTOR ( 0 to 0 );
    \FSM_onehot_state_reg[1]\ : out STD_LOGIC;
    \FSM_onehot_state_reg[2]\ : out STD_LOGIC;
    \FSM_onehot_state_reg[1]_0\ : out STD_LOGIC;
    control_clk : in STD_LOGIC;
    \dst_data_reg[0]_0\ : in STD_LOGIC;
    sample_clk : in STD_LOGIC;
    command_word : in STD_LOGIC_VECTOR ( 4 downto 0 );
    \tag_counter_reg[31]\ : in STD_LOGIC;
    \error_code_reg[0]\ : in STD_LOGIC;
    \error_code_reg[2]\ : in STD_LOGIC;
    \error_code_reg[2]_0\ : in STD_LOGIC;
    \error_code_reg[2]_1\ : in STD_LOGIC;
    \tag_counter_reg[31]_0\ : in STD_LOGIC;
    request_toggle_reg_0 : in STD_LOGIC;
    active_enable : in STD_LOGIC;
    enabled2 : in STD_LOGIC;
    v2 : in STD_LOGIC;
    acknowledge_toggle_reg_0 : in STD_LOGIC;
    sample_pending : in STD_LOGIC;
    acknowledged_reg : in STD_LOGIC;
    acknowledged_reg_0 : in STD_LOGIC;
    interface_initialized : in STD_LOGIC;
    \FSM_onehot_state_reg[0]\ : in STD_LOGIC;
    acknowledged_reg_1 : in STD_LOGIC;
    pending_request_reg : in STD_LOGIC;
    sample_pending_reg_0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    response_valid : in STD_LOGIC;
    \FSM_onehot_state_reg[2]_0\ : in STD_LOGIC;
    \FSM_onehot_state_reg[0]_0\ : in STD_LOGIC;
    \src_data_hold_reg[122]_0\ : in STD_LOGIC_VECTOR ( 122 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_dac902_control_0_fdw_cdc_mailbox : entity is "fdw_cdc_mailbox";
end system_dac902_control_0_fdw_cdc_mailbox;

architecture STRUCTURE of system_dac902_control_0_fdw_cdc_mailbox is
  signal \^e\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^q\ : STD_LOGIC_VECTOR ( 121 downto 0 );
  signal acknowledge_sync : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of acknowledge_sync : signal is "true";
  attribute shreg_extract : string;
  attribute shreg_extract of acknowledge_sync : signal is "no";
  signal acknowledge_toggle_i_1_n_0 : STD_LOGIC;
  signal acknowledge_toggle_reg_n_0 : STD_LOGIC;
  signal acknowledged_i_4_n_0 : STD_LOGIC;
  signal cfg_rejected_i_2_n_0 : STD_LOGIC;
  signal cfg_rejected_i_3_n_0 : STD_LOGIC;
  signal cfg_rejected_i_4_n_0 : STD_LOGIC;
  signal config_data : STD_LOGIC_VECTOR ( 90 to 90 );
  signal \config_packet[122]_i_3_n_0\ : STD_LOGIC;
  signal config_valid : STD_LOGIC;
  signal \dst_data[122]_i_1_n_0\ : STD_LOGIC;
  signal dst_reset_release : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of dst_reset_release : signal is "true";
  attribute shreg_extract of dst_reset_release : signal is "no";
  signal dst_valid_i_1_n_0 : STD_LOGIC;
  signal request_sync : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of request_sync : signal is "true";
  attribute shreg_extract of request_sync : signal is "no";
  signal request_toggle_i_1_n_0 : STD_LOGIC;
  signal request_toggle_reg_n_0 : STD_LOGIC;
  signal src_data_hold : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[0]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[100]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[101]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[102]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[103]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[104]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[105]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[106]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[107]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[108]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[109]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[10]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[110]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[111]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[112]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[113]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[114]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[115]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[116]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[117]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[118]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[119]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[11]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[120]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[121]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[122]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[12]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[13]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[14]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[15]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[16]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[17]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[18]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[19]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[1]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[20]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[21]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[22]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[23]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[24]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[25]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[26]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[27]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[28]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[29]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[2]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[30]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[31]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[32]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[33]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[34]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[35]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[36]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[37]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[38]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[39]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[3]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[40]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[41]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[42]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[43]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[44]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[45]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[46]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[47]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[48]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[49]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[4]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[50]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[51]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[52]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[53]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[54]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[55]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[56]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[57]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[58]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[59]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[5]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[60]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[61]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[62]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[63]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[64]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[65]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[66]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[67]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[68]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[69]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[6]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[70]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[71]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[72]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[73]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[74]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[75]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[76]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[77]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[78]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[79]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[7]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[80]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[81]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[82]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[83]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[84]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[85]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[86]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[87]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[88]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[89]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[8]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[90]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[91]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[92]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[93]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[94]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[95]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[96]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[97]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[98]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[99]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[9]\ : STD_LOGIC;
  signal src_reset_release : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of src_reset_release : signal is "true";
  attribute shreg_extract of src_reset_release : signal is "no";
  signal \^tag_counter\ : STD_LOGIC;
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of \acknowledge_sync_reg[0]\ : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of \acknowledge_sync_reg[0]\ : label is "yes";
  attribute SHREG_EXTRACT of \acknowledge_sync_reg[0]\ : label is "no";
  attribute ASYNC_REG_boolean of \acknowledge_sync_reg[1]\ : label is std.standard.true;
  attribute KEEP of \acknowledge_sync_reg[1]\ : label is "yes";
  attribute SHREG_EXTRACT of \acknowledge_sync_reg[1]\ : label is "no";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of acknowledged_i_4 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of active_invert_i_1 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of cfg_rejected_i_1 : label is "soft_lutpair1";
  attribute ASYNC_REG_boolean of \dst_reset_release_reg[0]\ : label is std.standard.true;
  attribute KEEP of \dst_reset_release_reg[0]\ : label is "yes";
  attribute SHREG_EXTRACT of \dst_reset_release_reg[0]\ : label is "no";
  attribute ASYNC_REG_boolean of \dst_reset_release_reg[1]\ : label is std.standard.true;
  attribute KEEP of \dst_reset_release_reg[1]\ : label is "yes";
  attribute SHREG_EXTRACT of \dst_reset_release_reg[1]\ : label is "no";
  attribute SOFT_HLUTNM of \error_code[0]_i_2\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \phase_accumulator[31]_i_1\ : label is "soft_lutpair2";
  attribute ASYNC_REG_boolean of \request_sync_reg[0]\ : label is std.standard.true;
  attribute KEEP of \request_sync_reg[0]\ : label is "yes";
  attribute SHREG_EXTRACT of \request_sync_reg[0]\ : label is "no";
  attribute ASYNC_REG_boolean of \request_sync_reg[1]\ : label is std.standard.true;
  attribute KEEP of \request_sync_reg[1]\ : label is "yes";
  attribute SHREG_EXTRACT of \request_sync_reg[1]\ : label is "no";
  attribute SOFT_HLUTNM of sample_active_i_1 : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \sample_code[11]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \sample_tag_pending[31]_i_1\ : label is "soft_lutpair1";
  attribute ASYNC_REG_boolean of \src_reset_release_reg[0]\ : label is std.standard.true;
  attribute KEEP of \src_reset_release_reg[0]\ : label is "yes";
  attribute SHREG_EXTRACT of \src_reset_release_reg[0]\ : label is "no";
  attribute ASYNC_REG_boolean of \src_reset_release_reg[1]\ : label is std.standard.true;
  attribute KEEP of \src_reset_release_reg[1]\ : label is "yes";
  attribute SHREG_EXTRACT of \src_reset_release_reg[1]\ : label is "no";
begin
  E(0) <= \^e\(0);
  Q(121 downto 0) <= \^q\(121 downto 0);
  tag_counter <= \^tag_counter\;
\FSM_onehot_state[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAABBBBBAAA88888"
    )
        port map (
      I0 => \FSM_onehot_state_reg[2]_0\,
      I1 => \^tag_counter\,
      I2 => src_data_hold,
      I3 => \FSM_onehot_state_reg[0]\,
      I4 => interface_initialized,
      I5 => \FSM_onehot_state_reg[0]_0\,
      O => \FSM_onehot_state_reg[2]\
    );
\FSM_onehot_state[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"101E505A"
    )
        port map (
      I0 => \^tag_counter\,
      I1 => src_data_hold,
      I2 => request_toggle_reg_0,
      I3 => \FSM_onehot_state_reg[2]_0\,
      I4 => interface_initialized,
      O => \FSM_onehot_state_reg[1]_0\
    );
\FSM_onehot_state[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F1E0E0F5F5A0A0"
    )
        port map (
      I0 => \^tag_counter\,
      I1 => src_data_hold,
      I2 => request_toggle_reg_0,
      I3 => response_valid,
      I4 => \FSM_onehot_state_reg[2]_0\,
      I5 => interface_initialized,
      O => \FSM_onehot_state_reg[1]\
    );
\acknowledge_sync_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => '1',
      CLR => \dst_data_reg[0]_0\,
      D => acknowledge_toggle_reg_n_0,
      Q => acknowledge_sync(0)
    );
\acknowledge_sync_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => '1',
      CLR => \dst_data_reg[0]_0\,
      D => acknowledge_sync(0),
      Q => acknowledge_sync(1)
    );
acknowledge_toggle_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFEF000000200000"
    )
        port map (
      I0 => request_sync(1),
      I1 => acknowledge_toggle_reg_0,
      I2 => config_valid,
      I3 => sample_pending,
      I4 => dst_reset_release(1),
      I5 => acknowledge_toggle_reg_n_0,
      O => acknowledge_toggle_i_1_n_0
    );
acknowledge_toggle_reg: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => '1',
      CLR => \dst_data_reg[0]_0\,
      D => acknowledge_toggle_i_1_n_0,
      Q => acknowledge_toggle_reg_n_0
    );
acknowledged_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAEFAAAAAA20AA"
    )
        port map (
      I0 => acknowledged_reg,
      I1 => acknowledged_i_4_n_0,
      I2 => acknowledged_reg_0,
      I3 => interface_initialized,
      I4 => \FSM_onehot_state_reg[0]\,
      I5 => acknowledged_reg_1,
      O => interface_initialized_reg
    );
acknowledged_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \tag_counter_reg[31]\,
      I1 => command_word(1),
      I2 => command_word(2),
      I3 => \config_packet[122]_i_3_n_0\,
      O => acknowledged_i_4_n_0
    );
active_invert_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^e\(0),
      O => reference_config_ftw0
    );
cfg_rejected_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0020"
    )
        port map (
      I0 => cfg_rejected_i_2_n_0,
      I1 => acknowledge_toggle_reg_0,
      I2 => config_valid,
      I3 => sample_pending,
      O => cfg_rejected0
    );
cfg_rejected_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFEAAAAAAAA"
    )
        port map (
      I0 => \^q\(31),
      I1 => \^q\(72),
      I2 => \^q\(74),
      I3 => \^q\(64),
      I4 => cfg_rejected_i_3_n_0,
      I5 => \^q\(75),
      O => cfg_rejected_i_2_n_0
    );
cfg_rejected_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \^q\(73),
      I1 => \^q\(66),
      I2 => \^q\(71),
      I3 => \^q\(69),
      I4 => cfg_rejected_i_4_n_0,
      O => cfg_rejected_i_3_n_0
    );
cfg_rejected_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \^q\(65),
      I1 => \^q\(67),
      I2 => \^q\(68),
      I3 => \^q\(70),
      O => cfg_rejected_i_4_n_0
    );
\config_packet[122]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => \config_packet[122]_i_3_n_0\,
      I1 => command_word(2),
      I2 => command_word(1),
      I3 => \tag_counter_reg[31]\,
      I4 => \tag_counter_reg[31]_0\,
      O => \^tag_counter\
    );
\config_packet[122]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0090"
    )
        port map (
      I0 => acknowledge_sync(1),
      I1 => request_toggle_reg_n_0,
      I2 => src_reset_release(1),
      I3 => \dst_data_reg[0]_0\,
      O => \config_packet[122]_i_3_n_0\
    );
\dst_data[122]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1400"
    )
        port map (
      I0 => config_valid,
      I1 => request_sync(1),
      I2 => acknowledge_toggle_reg_n_0,
      I3 => dst_reset_release(1),
      O => \dst_data[122]_i_1_n_0\
    );
\dst_data_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[0]\,
      Q => \^q\(0)
    );
\dst_data_reg[100]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[100]\,
      Q => \^q\(99)
    );
\dst_data_reg[101]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[101]\,
      Q => \^q\(100)
    );
\dst_data_reg[102]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[102]\,
      Q => \^q\(101)
    );
\dst_data_reg[103]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[103]\,
      Q => \^q\(102)
    );
\dst_data_reg[104]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[104]\,
      Q => \^q\(103)
    );
\dst_data_reg[105]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[105]\,
      Q => \^q\(104)
    );
\dst_data_reg[106]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[106]\,
      Q => \^q\(105)
    );
\dst_data_reg[107]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[107]\,
      Q => \^q\(106)
    );
\dst_data_reg[108]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[108]\,
      Q => \^q\(107)
    );
\dst_data_reg[109]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[109]\,
      Q => \^q\(108)
    );
\dst_data_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[10]\,
      Q => \^q\(10)
    );
\dst_data_reg[110]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[110]\,
      Q => \^q\(109)
    );
\dst_data_reg[111]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[111]\,
      Q => \^q\(110)
    );
\dst_data_reg[112]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[112]\,
      Q => \^q\(111)
    );
\dst_data_reg[113]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[113]\,
      Q => \^q\(112)
    );
\dst_data_reg[114]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[114]\,
      Q => \^q\(113)
    );
\dst_data_reg[115]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[115]\,
      Q => \^q\(114)
    );
\dst_data_reg[116]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[116]\,
      Q => \^q\(115)
    );
\dst_data_reg[117]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[117]\,
      Q => \^q\(116)
    );
\dst_data_reg[118]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[118]\,
      Q => \^q\(117)
    );
\dst_data_reg[119]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[119]\,
      Q => \^q\(118)
    );
\dst_data_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[11]\,
      Q => \^q\(11)
    );
\dst_data_reg[120]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[120]\,
      Q => \^q\(119)
    );
\dst_data_reg[121]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[121]\,
      Q => \^q\(120)
    );
\dst_data_reg[122]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[122]\,
      Q => \^q\(121)
    );
\dst_data_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[12]\,
      Q => \^q\(12)
    );
\dst_data_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[13]\,
      Q => \^q\(13)
    );
\dst_data_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[14]\,
      Q => \^q\(14)
    );
\dst_data_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[15]\,
      Q => \^q\(15)
    );
\dst_data_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[16]\,
      Q => \^q\(16)
    );
\dst_data_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[17]\,
      Q => \^q\(17)
    );
\dst_data_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[18]\,
      Q => \^q\(18)
    );
\dst_data_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[19]\,
      Q => \^q\(19)
    );
\dst_data_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[1]\,
      Q => \^q\(1)
    );
\dst_data_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[20]\,
      Q => \^q\(20)
    );
\dst_data_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[21]\,
      Q => \^q\(21)
    );
\dst_data_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[22]\,
      Q => \^q\(22)
    );
\dst_data_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[23]\,
      Q => \^q\(23)
    );
\dst_data_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[24]\,
      Q => \^q\(24)
    );
\dst_data_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[25]\,
      Q => \^q\(25)
    );
\dst_data_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[26]\,
      Q => \^q\(26)
    );
\dst_data_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[27]\,
      Q => \^q\(27)
    );
\dst_data_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[28]\,
      Q => \^q\(28)
    );
\dst_data_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[29]\,
      Q => \^q\(29)
    );
\dst_data_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[2]\,
      Q => \^q\(2)
    );
\dst_data_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[30]\,
      Q => \^q\(30)
    );
\dst_data_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[31]\,
      Q => \^q\(31)
    );
\dst_data_reg[32]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[32]\,
      Q => \^q\(32)
    );
\dst_data_reg[33]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[33]\,
      Q => \^q\(33)
    );
\dst_data_reg[34]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[34]\,
      Q => \^q\(34)
    );
\dst_data_reg[35]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[35]\,
      Q => \^q\(35)
    );
\dst_data_reg[36]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[36]\,
      Q => \^q\(36)
    );
\dst_data_reg[37]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[37]\,
      Q => \^q\(37)
    );
\dst_data_reg[38]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[38]\,
      Q => \^q\(38)
    );
\dst_data_reg[39]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[39]\,
      Q => \^q\(39)
    );
\dst_data_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[3]\,
      Q => \^q\(3)
    );
\dst_data_reg[40]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[40]\,
      Q => \^q\(40)
    );
\dst_data_reg[41]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[41]\,
      Q => \^q\(41)
    );
\dst_data_reg[42]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[42]\,
      Q => \^q\(42)
    );
\dst_data_reg[43]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[43]\,
      Q => \^q\(43)
    );
\dst_data_reg[44]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[44]\,
      Q => \^q\(44)
    );
\dst_data_reg[45]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[45]\,
      Q => \^q\(45)
    );
\dst_data_reg[46]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[46]\,
      Q => \^q\(46)
    );
\dst_data_reg[47]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[47]\,
      Q => \^q\(47)
    );
\dst_data_reg[48]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[48]\,
      Q => \^q\(48)
    );
\dst_data_reg[49]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[49]\,
      Q => \^q\(49)
    );
\dst_data_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[4]\,
      Q => \^q\(4)
    );
\dst_data_reg[50]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[50]\,
      Q => \^q\(50)
    );
\dst_data_reg[51]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[51]\,
      Q => \^q\(51)
    );
\dst_data_reg[52]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[52]\,
      Q => \^q\(52)
    );
\dst_data_reg[53]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[53]\,
      Q => \^q\(53)
    );
\dst_data_reg[54]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[54]\,
      Q => \^q\(54)
    );
\dst_data_reg[55]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[55]\,
      Q => \^q\(55)
    );
\dst_data_reg[56]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[56]\,
      Q => \^q\(56)
    );
\dst_data_reg[57]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[57]\,
      Q => \^q\(57)
    );
\dst_data_reg[58]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[58]\,
      Q => \^q\(58)
    );
\dst_data_reg[59]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[59]\,
      Q => \^q\(59)
    );
\dst_data_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[5]\,
      Q => \^q\(5)
    );
\dst_data_reg[60]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[60]\,
      Q => \^q\(60)
    );
\dst_data_reg[61]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[61]\,
      Q => \^q\(61)
    );
\dst_data_reg[62]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[62]\,
      Q => \^q\(62)
    );
\dst_data_reg[63]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[63]\,
      Q => \^q\(63)
    );
\dst_data_reg[64]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[64]\,
      Q => \^q\(64)
    );
\dst_data_reg[65]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[65]\,
      Q => \^q\(65)
    );
\dst_data_reg[66]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[66]\,
      Q => \^q\(66)
    );
\dst_data_reg[67]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[67]\,
      Q => \^q\(67)
    );
\dst_data_reg[68]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[68]\,
      Q => \^q\(68)
    );
\dst_data_reg[69]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[69]\,
      Q => \^q\(69)
    );
\dst_data_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[6]\,
      Q => \^q\(6)
    );
\dst_data_reg[70]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[70]\,
      Q => \^q\(70)
    );
\dst_data_reg[71]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[71]\,
      Q => \^q\(71)
    );
\dst_data_reg[72]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[72]\,
      Q => \^q\(72)
    );
\dst_data_reg[73]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[73]\,
      Q => \^q\(73)
    );
\dst_data_reg[74]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[74]\,
      Q => \^q\(74)
    );
\dst_data_reg[75]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[75]\,
      Q => \^q\(75)
    );
\dst_data_reg[76]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[76]\,
      Q => \^q\(76)
    );
\dst_data_reg[77]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[77]\,
      Q => \^q\(77)
    );
\dst_data_reg[78]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[78]\,
      Q => \^q\(78)
    );
\dst_data_reg[79]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[79]\,
      Q => \^q\(79)
    );
\dst_data_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[7]\,
      Q => \^q\(7)
    );
\dst_data_reg[80]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[80]\,
      Q => \^q\(80)
    );
\dst_data_reg[81]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[81]\,
      Q => \^q\(81)
    );
\dst_data_reg[82]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[82]\,
      Q => \^q\(82)
    );
\dst_data_reg[83]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[83]\,
      Q => \^q\(83)
    );
\dst_data_reg[84]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[84]\,
      Q => \^q\(84)
    );
\dst_data_reg[85]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[85]\,
      Q => \^q\(85)
    );
\dst_data_reg[86]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[86]\,
      Q => \^q\(86)
    );
\dst_data_reg[87]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[87]\,
      Q => \^q\(87)
    );
\dst_data_reg[88]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[88]\,
      Q => \^q\(88)
    );
\dst_data_reg[89]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[89]\,
      Q => \^q\(89)
    );
\dst_data_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[8]\,
      Q => \^q\(8)
    );
\dst_data_reg[90]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[90]\,
      Q => config_data(90)
    );
\dst_data_reg[91]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[91]\,
      Q => \^q\(90)
    );
\dst_data_reg[92]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[92]\,
      Q => \^q\(91)
    );
\dst_data_reg[93]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[93]\,
      Q => \^q\(92)
    );
\dst_data_reg[94]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[94]\,
      Q => \^q\(93)
    );
\dst_data_reg[95]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[95]\,
      Q => \^q\(94)
    );
\dst_data_reg[96]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[96]\,
      Q => \^q\(95)
    );
\dst_data_reg[97]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[97]\,
      Q => \^q\(96)
    );
\dst_data_reg[98]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[98]\,
      Q => \^q\(97)
    );
\dst_data_reg[99]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[99]\,
      Q => \^q\(98)
    );
\dst_data_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \dst_data[122]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[9]\,
      Q => \^q\(9)
    );
\dst_reset_release_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => '1',
      CLR => \dst_data_reg[0]_0\,
      D => '1',
      Q => dst_reset_release(0)
    );
\dst_reset_release_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => '1',
      CLR => \dst_data_reg[0]_0\,
      D => dst_reset_release(0),
      Q => dst_reset_release(1)
    );
dst_valid_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F06060F0006060"
    )
        port map (
      I0 => request_sync(1),
      I1 => acknowledge_toggle_reg_n_0,
      I2 => dst_reset_release(1),
      I3 => sample_pending,
      I4 => config_valid,
      I5 => acknowledge_toggle_reg_0,
      O => dst_valid_i_1_n_0
    );
dst_valid_reg: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => '1',
      CLR => \dst_data_reg[0]_0\,
      D => dst_valid_i_1_n_0,
      Q => config_valid
    );
\error_code[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF4000"
    )
        port map (
      I0 => \config_packet[122]_i_3_n_0\,
      I1 => command_word(2),
      I2 => command_word(1),
      I3 => \tag_counter_reg[31]\,
      I4 => \error_code_reg[0]\,
      O => \command_word[29]\
    );
\error_code[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAA002000000020"
    )
        port map (
      I0 => \error_code_reg[2]\,
      I1 => \error_code_reg[2]_0\,
      I2 => \error_code_reg[2]_1\,
      I3 => \config_packet[122]_i_3_n_0\,
      I4 => command_word(0),
      I5 => command_word(3),
      O => \command_word[27]\
    );
pending_request_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFAA80AA"
    )
        port map (
      I0 => command_word(4),
      I1 => acknowledged_reg_0,
      I2 => acknowledged_i_4_n_0,
      I3 => interface_initialized,
      I4 => pending_request_reg,
      O => \command_word[31]\
    );
\phase_accumulator[31]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => active_enable,
      I1 => \^e\(0),
      I2 => config_data(90),
      O => active_enable_reg(0)
    );
\request_sync_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => '1',
      CLR => \dst_data_reg[0]_0\,
      D => request_toggle_reg_n_0,
      Q => request_sync(0)
    );
\request_sync_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => '1',
      CLR => \dst_data_reg[0]_0\,
      D => request_sync(0),
      Q => request_sync(1)
    );
request_toggle_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"C5CC0000"
    )
        port map (
      I0 => acknowledge_sync(1),
      I1 => request_toggle_reg_n_0,
      I2 => \dst_data_reg[0]_0\,
      I3 => request_toggle_reg_0,
      I4 => src_reset_release(1),
      O => request_toggle_i_1_n_0
    );
request_toggle_reg: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => '1',
      CLR => \dst_data_reg[0]_0\,
      D => request_toggle_i_1_n_0,
      Q => request_toggle_reg_n_0
    );
sample_active_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => \^q\(88),
      I1 => \^e\(0),
      I2 => enabled2,
      O => \dst_data_reg[88]_0\
    );
\sample_code[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8B"
    )
        port map (
      I0 => v2,
      I1 => \^e\(0),
      I2 => \^q\(88),
      O => v2_reg(0)
    );
sample_pending_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"04F4"
    )
        port map (
      I0 => acknowledge_toggle_reg_0,
      I1 => config_valid,
      I2 => sample_pending,
      I3 => sample_pending_reg_0(0),
      O => reply_pending_reg
    );
\sample_tag_pending[31]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => sample_pending,
      I1 => config_valid,
      I2 => acknowledge_toggle_reg_0,
      O => sample_pending_reg(0)
    );
\src_data_hold[122]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20000020"
    )
        port map (
      I0 => request_toggle_reg_0,
      I1 => \dst_data_reg[0]_0\,
      I2 => src_reset_release(1),
      I3 => request_toggle_reg_n_0,
      I4 => acknowledge_sync(1),
      O => src_data_hold
    );
\src_data_hold_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(0),
      Q => \src_data_hold_reg_n_0_[0]\
    );
\src_data_hold_reg[100]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(100),
      Q => \src_data_hold_reg_n_0_[100]\
    );
\src_data_hold_reg[101]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(101),
      Q => \src_data_hold_reg_n_0_[101]\
    );
\src_data_hold_reg[102]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(102),
      Q => \src_data_hold_reg_n_0_[102]\
    );
\src_data_hold_reg[103]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(103),
      Q => \src_data_hold_reg_n_0_[103]\
    );
\src_data_hold_reg[104]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(104),
      Q => \src_data_hold_reg_n_0_[104]\
    );
\src_data_hold_reg[105]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(105),
      Q => \src_data_hold_reg_n_0_[105]\
    );
\src_data_hold_reg[106]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(106),
      Q => \src_data_hold_reg_n_0_[106]\
    );
\src_data_hold_reg[107]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(107),
      Q => \src_data_hold_reg_n_0_[107]\
    );
\src_data_hold_reg[108]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(108),
      Q => \src_data_hold_reg_n_0_[108]\
    );
\src_data_hold_reg[109]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(109),
      Q => \src_data_hold_reg_n_0_[109]\
    );
\src_data_hold_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(10),
      Q => \src_data_hold_reg_n_0_[10]\
    );
\src_data_hold_reg[110]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(110),
      Q => \src_data_hold_reg_n_0_[110]\
    );
\src_data_hold_reg[111]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(111),
      Q => \src_data_hold_reg_n_0_[111]\
    );
\src_data_hold_reg[112]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(112),
      Q => \src_data_hold_reg_n_0_[112]\
    );
\src_data_hold_reg[113]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(113),
      Q => \src_data_hold_reg_n_0_[113]\
    );
\src_data_hold_reg[114]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(114),
      Q => \src_data_hold_reg_n_0_[114]\
    );
\src_data_hold_reg[115]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(115),
      Q => \src_data_hold_reg_n_0_[115]\
    );
\src_data_hold_reg[116]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(116),
      Q => \src_data_hold_reg_n_0_[116]\
    );
\src_data_hold_reg[117]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(117),
      Q => \src_data_hold_reg_n_0_[117]\
    );
\src_data_hold_reg[118]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(118),
      Q => \src_data_hold_reg_n_0_[118]\
    );
\src_data_hold_reg[119]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(119),
      Q => \src_data_hold_reg_n_0_[119]\
    );
\src_data_hold_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(11),
      Q => \src_data_hold_reg_n_0_[11]\
    );
\src_data_hold_reg[120]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(120),
      Q => \src_data_hold_reg_n_0_[120]\
    );
\src_data_hold_reg[121]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(121),
      Q => \src_data_hold_reg_n_0_[121]\
    );
\src_data_hold_reg[122]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(122),
      Q => \src_data_hold_reg_n_0_[122]\
    );
\src_data_hold_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(12),
      Q => \src_data_hold_reg_n_0_[12]\
    );
\src_data_hold_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(13),
      Q => \src_data_hold_reg_n_0_[13]\
    );
\src_data_hold_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(14),
      Q => \src_data_hold_reg_n_0_[14]\
    );
\src_data_hold_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(15),
      Q => \src_data_hold_reg_n_0_[15]\
    );
\src_data_hold_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(16),
      Q => \src_data_hold_reg_n_0_[16]\
    );
\src_data_hold_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(17),
      Q => \src_data_hold_reg_n_0_[17]\
    );
\src_data_hold_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(18),
      Q => \src_data_hold_reg_n_0_[18]\
    );
\src_data_hold_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(19),
      Q => \src_data_hold_reg_n_0_[19]\
    );
\src_data_hold_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(1),
      Q => \src_data_hold_reg_n_0_[1]\
    );
\src_data_hold_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(20),
      Q => \src_data_hold_reg_n_0_[20]\
    );
\src_data_hold_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(21),
      Q => \src_data_hold_reg_n_0_[21]\
    );
\src_data_hold_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(22),
      Q => \src_data_hold_reg_n_0_[22]\
    );
\src_data_hold_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(23),
      Q => \src_data_hold_reg_n_0_[23]\
    );
\src_data_hold_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(24),
      Q => \src_data_hold_reg_n_0_[24]\
    );
\src_data_hold_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(25),
      Q => \src_data_hold_reg_n_0_[25]\
    );
\src_data_hold_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(26),
      Q => \src_data_hold_reg_n_0_[26]\
    );
\src_data_hold_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(27),
      Q => \src_data_hold_reg_n_0_[27]\
    );
\src_data_hold_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(28),
      Q => \src_data_hold_reg_n_0_[28]\
    );
\src_data_hold_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(29),
      Q => \src_data_hold_reg_n_0_[29]\
    );
\src_data_hold_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(2),
      Q => \src_data_hold_reg_n_0_[2]\
    );
\src_data_hold_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(30),
      Q => \src_data_hold_reg_n_0_[30]\
    );
\src_data_hold_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(31),
      Q => \src_data_hold_reg_n_0_[31]\
    );
\src_data_hold_reg[32]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(32),
      Q => \src_data_hold_reg_n_0_[32]\
    );
\src_data_hold_reg[33]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(33),
      Q => \src_data_hold_reg_n_0_[33]\
    );
\src_data_hold_reg[34]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(34),
      Q => \src_data_hold_reg_n_0_[34]\
    );
\src_data_hold_reg[35]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(35),
      Q => \src_data_hold_reg_n_0_[35]\
    );
\src_data_hold_reg[36]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(36),
      Q => \src_data_hold_reg_n_0_[36]\
    );
\src_data_hold_reg[37]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(37),
      Q => \src_data_hold_reg_n_0_[37]\
    );
\src_data_hold_reg[38]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(38),
      Q => \src_data_hold_reg_n_0_[38]\
    );
\src_data_hold_reg[39]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(39),
      Q => \src_data_hold_reg_n_0_[39]\
    );
\src_data_hold_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(3),
      Q => \src_data_hold_reg_n_0_[3]\
    );
\src_data_hold_reg[40]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(40),
      Q => \src_data_hold_reg_n_0_[40]\
    );
\src_data_hold_reg[41]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(41),
      Q => \src_data_hold_reg_n_0_[41]\
    );
\src_data_hold_reg[42]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(42),
      Q => \src_data_hold_reg_n_0_[42]\
    );
\src_data_hold_reg[43]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(43),
      Q => \src_data_hold_reg_n_0_[43]\
    );
\src_data_hold_reg[44]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(44),
      Q => \src_data_hold_reg_n_0_[44]\
    );
\src_data_hold_reg[45]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(45),
      Q => \src_data_hold_reg_n_0_[45]\
    );
\src_data_hold_reg[46]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(46),
      Q => \src_data_hold_reg_n_0_[46]\
    );
\src_data_hold_reg[47]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(47),
      Q => \src_data_hold_reg_n_0_[47]\
    );
\src_data_hold_reg[48]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(48),
      Q => \src_data_hold_reg_n_0_[48]\
    );
\src_data_hold_reg[49]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(49),
      Q => \src_data_hold_reg_n_0_[49]\
    );
\src_data_hold_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(4),
      Q => \src_data_hold_reg_n_0_[4]\
    );
\src_data_hold_reg[50]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(50),
      Q => \src_data_hold_reg_n_0_[50]\
    );
\src_data_hold_reg[51]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(51),
      Q => \src_data_hold_reg_n_0_[51]\
    );
\src_data_hold_reg[52]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(52),
      Q => \src_data_hold_reg_n_0_[52]\
    );
\src_data_hold_reg[53]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(53),
      Q => \src_data_hold_reg_n_0_[53]\
    );
\src_data_hold_reg[54]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(54),
      Q => \src_data_hold_reg_n_0_[54]\
    );
\src_data_hold_reg[55]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(55),
      Q => \src_data_hold_reg_n_0_[55]\
    );
\src_data_hold_reg[56]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(56),
      Q => \src_data_hold_reg_n_0_[56]\
    );
\src_data_hold_reg[57]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(57),
      Q => \src_data_hold_reg_n_0_[57]\
    );
\src_data_hold_reg[58]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(58),
      Q => \src_data_hold_reg_n_0_[58]\
    );
\src_data_hold_reg[59]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(59),
      Q => \src_data_hold_reg_n_0_[59]\
    );
\src_data_hold_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(5),
      Q => \src_data_hold_reg_n_0_[5]\
    );
\src_data_hold_reg[60]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(60),
      Q => \src_data_hold_reg_n_0_[60]\
    );
\src_data_hold_reg[61]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(61),
      Q => \src_data_hold_reg_n_0_[61]\
    );
\src_data_hold_reg[62]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(62),
      Q => \src_data_hold_reg_n_0_[62]\
    );
\src_data_hold_reg[63]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(63),
      Q => \src_data_hold_reg_n_0_[63]\
    );
\src_data_hold_reg[64]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(64),
      Q => \src_data_hold_reg_n_0_[64]\
    );
\src_data_hold_reg[65]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(65),
      Q => \src_data_hold_reg_n_0_[65]\
    );
\src_data_hold_reg[66]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(66),
      Q => \src_data_hold_reg_n_0_[66]\
    );
\src_data_hold_reg[67]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(67),
      Q => \src_data_hold_reg_n_0_[67]\
    );
\src_data_hold_reg[68]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(68),
      Q => \src_data_hold_reg_n_0_[68]\
    );
\src_data_hold_reg[69]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(69),
      Q => \src_data_hold_reg_n_0_[69]\
    );
\src_data_hold_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(6),
      Q => \src_data_hold_reg_n_0_[6]\
    );
\src_data_hold_reg[70]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(70),
      Q => \src_data_hold_reg_n_0_[70]\
    );
\src_data_hold_reg[71]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(71),
      Q => \src_data_hold_reg_n_0_[71]\
    );
\src_data_hold_reg[72]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(72),
      Q => \src_data_hold_reg_n_0_[72]\
    );
\src_data_hold_reg[73]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(73),
      Q => \src_data_hold_reg_n_0_[73]\
    );
\src_data_hold_reg[74]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(74),
      Q => \src_data_hold_reg_n_0_[74]\
    );
\src_data_hold_reg[75]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(75),
      Q => \src_data_hold_reg_n_0_[75]\
    );
\src_data_hold_reg[76]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(76),
      Q => \src_data_hold_reg_n_0_[76]\
    );
\src_data_hold_reg[77]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(77),
      Q => \src_data_hold_reg_n_0_[77]\
    );
\src_data_hold_reg[78]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(78),
      Q => \src_data_hold_reg_n_0_[78]\
    );
\src_data_hold_reg[79]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(79),
      Q => \src_data_hold_reg_n_0_[79]\
    );
\src_data_hold_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(7),
      Q => \src_data_hold_reg_n_0_[7]\
    );
\src_data_hold_reg[80]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(80),
      Q => \src_data_hold_reg_n_0_[80]\
    );
\src_data_hold_reg[81]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(81),
      Q => \src_data_hold_reg_n_0_[81]\
    );
\src_data_hold_reg[82]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(82),
      Q => \src_data_hold_reg_n_0_[82]\
    );
\src_data_hold_reg[83]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(83),
      Q => \src_data_hold_reg_n_0_[83]\
    );
\src_data_hold_reg[84]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(84),
      Q => \src_data_hold_reg_n_0_[84]\
    );
\src_data_hold_reg[85]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(85),
      Q => \src_data_hold_reg_n_0_[85]\
    );
\src_data_hold_reg[86]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(86),
      Q => \src_data_hold_reg_n_0_[86]\
    );
\src_data_hold_reg[87]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(87),
      Q => \src_data_hold_reg_n_0_[87]\
    );
\src_data_hold_reg[88]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(88),
      Q => \src_data_hold_reg_n_0_[88]\
    );
\src_data_hold_reg[89]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(89),
      Q => \src_data_hold_reg_n_0_[89]\
    );
\src_data_hold_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(8),
      Q => \src_data_hold_reg_n_0_[8]\
    );
\src_data_hold_reg[90]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(90),
      Q => \src_data_hold_reg_n_0_[90]\
    );
\src_data_hold_reg[91]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(91),
      Q => \src_data_hold_reg_n_0_[91]\
    );
\src_data_hold_reg[92]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(92),
      Q => \src_data_hold_reg_n_0_[92]\
    );
\src_data_hold_reg[93]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(93),
      Q => \src_data_hold_reg_n_0_[93]\
    );
\src_data_hold_reg[94]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(94),
      Q => \src_data_hold_reg_n_0_[94]\
    );
\src_data_hold_reg[95]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(95),
      Q => \src_data_hold_reg_n_0_[95]\
    );
\src_data_hold_reg[96]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(96),
      Q => \src_data_hold_reg_n_0_[96]\
    );
\src_data_hold_reg[97]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(97),
      Q => \src_data_hold_reg_n_0_[97]\
    );
\src_data_hold_reg[98]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(98),
      Q => \src_data_hold_reg_n_0_[98]\
    );
\src_data_hold_reg[99]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(99),
      Q => \src_data_hold_reg_n_0_[99]\
    );
\src_data_hold_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[122]_0\(9),
      Q => \src_data_hold_reg_n_0_[9]\
    );
\src_reset_release_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => '1',
      CLR => \dst_data_reg[0]_0\,
      D => '1',
      Q => src_reset_release(0)
    );
\src_reset_release_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => '1',
      CLR => \dst_data_reg[0]_0\,
      D => src_reset_release(0),
      Q => src_reset_release(1)
    );
\status_word[29]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"40040000"
    )
        port map (
      I0 => \dst_data_reg[0]_0\,
      I1 => src_reset_release(1),
      I2 => request_toggle_reg_n_0,
      I3 => acknowledge_sync(1),
      I4 => interface_initialized,
      O => status_word(0)
    );
v0_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFEF"
    )
        port map (
      I0 => cfg_rejected_i_2_n_0,
      I1 => acknowledge_toggle_reg_0,
      I2 => config_valid,
      I3 => sample_pending,
      O => \^e\(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \system_dac902_control_0_fdw_cdc_mailbox__parameterized0\ is
  port (
    response_valid : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    Q : out STD_LOGIC_VECTOR ( 31 downto 0 );
    \FSM_onehot_state_reg[2]\ : out STD_LOGIC;
    S : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \dst_data_reg[24]_0\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \config_packet_reg[122]\ : out STD_LOGIC_VECTOR ( 2 downto 0 );
    request_toggle_reg_0 : out STD_LOGIC;
    \FSM_onehot_state_reg[2]_0\ : out STD_LOGIC;
    \FSM_onehot_state_reg[2]_1\ : out STD_LOGIC;
    \FSM_onehot_state_reg[2]_2\ : out STD_LOGIC;
    sample_clk : in STD_LOGIC;
    \dst_data_reg[0]_0\ : in STD_LOGIC;
    control_clk : in STD_LOGIC;
    request_toggle_reg_1 : in STD_LOGIC;
    \error_code_reg[0]\ : in STD_LOGIC;
    command_word : in STD_LOGIC_VECTOR ( 0 to 0 );
    \error_code_reg[0]_0\ : in STD_LOGIC;
    interface_initialized : in STD_LOGIC;
    acknowledge_toggle_reg_0 : in STD_LOGIC;
    \error_code1_inferred__0/i__carry__1\ : in STD_LOGIC_VECTOR ( 32 downto 0 );
    CO : in STD_LOGIC_VECTOR ( 0 to 0 );
    reply_pending_reg : in STD_LOGIC_VECTOR ( 0 to 0 );
    \error_code_reg[2]\ : in STD_LOGIC;
    status_word : in STD_LOGIC_VECTOR ( 2 downto 0 );
    \error_code_reg[1]\ : in STD_LOGIC;
    \error_code_reg[1]_0\ : in STD_LOGIC;
    \error_code_reg[0]_1\ : in STD_LOGIC;
    \src_data_hold_reg[33]_0\ : in STD_LOGIC_VECTOR ( 33 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \system_dac902_control_0_fdw_cdc_mailbox__parameterized0\ : entity is "fdw_cdc_mailbox";
end \system_dac902_control_0_fdw_cdc_mailbox__parameterized0\;

architecture STRUCTURE of \system_dac902_control_0_fdw_cdc_mailbox__parameterized0\ is
  signal \^q\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal acknowledge_sync : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of acknowledge_sync : signal is "true";
  attribute shreg_extract : string;
  attribute shreg_extract of acknowledge_sync : signal is "no";
  signal \acknowledge_toggle_i_1__0_n_0\ : STD_LOGIC;
  signal acknowledge_toggle_reg_n_0 : STD_LOGIC;
  signal \applied_config[88]_i_2_n_0\ : STD_LOGIC;
  signal \dst_data[33]_i_1_n_0\ : STD_LOGIC;
  signal dst_reset_release : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of dst_reset_release : signal is "true";
  attribute shreg_extract of dst_reset_release : signal is "no";
  signal \dst_valid_i_1__0_n_0\ : STD_LOGIC;
  signal \error_code[1]_i_2_n_0\ : STD_LOGIC;
  signal \error_code[2]_i_3_n_0\ : STD_LOGIC;
  signal request_sync : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of request_sync : signal is "true";
  attribute shreg_extract of request_sync : signal is "no";
  signal \request_toggle_i_1__0_n_0\ : STD_LOGIC;
  signal request_toggle_reg_n_0 : STD_LOGIC;
  signal response_data : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^response_valid\ : STD_LOGIC;
  signal src_data_hold : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[0]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[10]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[11]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[12]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[13]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[14]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[15]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[16]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[17]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[18]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[19]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[1]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[20]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[21]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[22]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[23]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[24]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[25]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[26]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[27]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[28]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[29]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[2]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[30]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[31]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[32]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[33]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[3]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[4]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[5]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[6]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[7]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[8]\ : STD_LOGIC;
  signal \src_data_hold_reg_n_0_[9]\ : STD_LOGIC;
  signal src_reset_release : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of src_reset_release : signal is "true";
  attribute shreg_extract of src_reset_release : signal is "no";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of \acknowledge_sync_reg[0]\ : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of \acknowledge_sync_reg[0]\ : label is "yes";
  attribute SHREG_EXTRACT of \acknowledge_sync_reg[0]\ : label is "no";
  attribute ASYNC_REG_boolean of \acknowledge_sync_reg[1]\ : label is std.standard.true;
  attribute KEEP of \acknowledge_sync_reg[1]\ : label is "yes";
  attribute SHREG_EXTRACT of \acknowledge_sync_reg[1]\ : label is "no";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of acknowledged_i_6 : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \applied_config[88]_i_2\ : label is "soft_lutpair4";
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
  Q(31 downto 0) <= \^q\(31 downto 0);
  response_valid <= \^response_valid\;
\acknowledge_sync_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => '1',
      CLR => \dst_data_reg[0]_0\,
      D => acknowledge_toggle_reg_n_0,
      Q => acknowledge_sync(0)
    );
\acknowledge_sync_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => '1',
      CLR => \dst_data_reg[0]_0\,
      D => acknowledge_sync(0),
      Q => acknowledge_sync(1)
    );
\acknowledge_toggle_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BF008000"
    )
        port map (
      I0 => request_sync(1),
      I1 => acknowledge_toggle_reg_0,
      I2 => \^response_valid\,
      I3 => dst_reset_release(1),
      I4 => acknowledge_toggle_reg_n_0,
      O => \acknowledge_toggle_i_1__0_n_0\
    );
acknowledge_toggle_reg: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => '1',
      CLR => \dst_data_reg[0]_0\,
      D => \acknowledge_toggle_i_1__0_n_0\,
      Q => acknowledge_toggle_reg_n_0
    );
acknowledged_i_6: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => acknowledge_toggle_reg_0,
      I1 => \^response_valid\,
      I2 => \error_code_reg[0]_0\,
      O => \FSM_onehot_state_reg[2]\
    );
\applied_config[88]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000009000000"
    )
        port map (
      I0 => response_data(0),
      I1 => \error_code1_inferred__0/i__carry__1\(0),
      I2 => response_data(1),
      I3 => \applied_config[88]_i_2_n_0\,
      I4 => interface_initialized,
      I5 => CO(0),
      O => E(0)
    );
\applied_config[88]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^response_valid\,
      I1 => acknowledge_toggle_reg_0,
      O => \applied_config[88]_i_2_n_0\
    );
\dst_data[33]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1400"
    )
        port map (
      I0 => \^response_valid\,
      I1 => request_sync(1),
      I2 => acknowledge_toggle_reg_n_0,
      I3 => dst_reset_release(1),
      O => \dst_data[33]_i_1_n_0\
    );
\dst_data_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \dst_data[33]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[0]\,
      Q => response_data(0)
    );
\dst_data_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \dst_data[33]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[10]\,
      Q => \^q\(8)
    );
\dst_data_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \dst_data[33]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[11]\,
      Q => \^q\(9)
    );
\dst_data_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \dst_data[33]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[12]\,
      Q => \^q\(10)
    );
\dst_data_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \dst_data[33]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[13]\,
      Q => \^q\(11)
    );
\dst_data_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \dst_data[33]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[14]\,
      Q => \^q\(12)
    );
\dst_data_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \dst_data[33]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[15]\,
      Q => \^q\(13)
    );
\dst_data_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \dst_data[33]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[16]\,
      Q => \^q\(14)
    );
\dst_data_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \dst_data[33]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[17]\,
      Q => \^q\(15)
    );
\dst_data_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \dst_data[33]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[18]\,
      Q => \^q\(16)
    );
\dst_data_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \dst_data[33]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[19]\,
      Q => \^q\(17)
    );
\dst_data_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \dst_data[33]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[1]\,
      Q => response_data(1)
    );
\dst_data_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \dst_data[33]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[20]\,
      Q => \^q\(18)
    );
\dst_data_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \dst_data[33]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[21]\,
      Q => \^q\(19)
    );
\dst_data_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \dst_data[33]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[22]\,
      Q => \^q\(20)
    );
\dst_data_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \dst_data[33]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[23]\,
      Q => \^q\(21)
    );
\dst_data_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \dst_data[33]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[24]\,
      Q => \^q\(22)
    );
\dst_data_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \dst_data[33]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[25]\,
      Q => \^q\(23)
    );
\dst_data_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \dst_data[33]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[26]\,
      Q => \^q\(24)
    );
\dst_data_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \dst_data[33]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[27]\,
      Q => \^q\(25)
    );
\dst_data_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \dst_data[33]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[28]\,
      Q => \^q\(26)
    );
\dst_data_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \dst_data[33]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[29]\,
      Q => \^q\(27)
    );
\dst_data_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \dst_data[33]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[2]\,
      Q => \^q\(0)
    );
\dst_data_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \dst_data[33]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[30]\,
      Q => \^q\(28)
    );
\dst_data_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \dst_data[33]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[31]\,
      Q => \^q\(29)
    );
\dst_data_reg[32]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \dst_data[33]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[32]\,
      Q => \^q\(30)
    );
\dst_data_reg[33]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \dst_data[33]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[33]\,
      Q => \^q\(31)
    );
\dst_data_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \dst_data[33]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[3]\,
      Q => \^q\(1)
    );
\dst_data_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \dst_data[33]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[4]\,
      Q => \^q\(2)
    );
\dst_data_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \dst_data[33]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[5]\,
      Q => \^q\(3)
    );
\dst_data_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \dst_data[33]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[6]\,
      Q => \^q\(4)
    );
\dst_data_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \dst_data[33]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[7]\,
      Q => \^q\(5)
    );
\dst_data_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \dst_data[33]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[8]\,
      Q => \^q\(6)
    );
\dst_data_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \dst_data[33]_i_1_n_0\,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg_n_0_[9]\,
      Q => \^q\(7)
    );
\dst_reset_release_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => '1',
      CLR => \dst_data_reg[0]_0\,
      D => '1',
      Q => dst_reset_release(0)
    );
\dst_reset_release_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => '1',
      CLR => \dst_data_reg[0]_0\,
      D => dst_reset_release(0),
      Q => dst_reset_release(1)
    );
\dst_valid_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0060F060"
    )
        port map (
      I0 => request_sync(1),
      I1 => acknowledge_toggle_reg_n_0,
      I2 => dst_reset_release(1),
      I3 => \^response_valid\,
      I4 => acknowledge_toggle_reg_0,
      O => \dst_valid_i_1__0_n_0\
    );
dst_valid_reg: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => '1',
      CLR => \dst_data_reg[0]_0\,
      D => \dst_valid_i_1__0_n_0\,
      Q => \^response_valid\
    );
\error_code[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \error_code[1]_i_2_n_0\,
      I1 => acknowledge_toggle_reg_0,
      I2 => \error_code_reg[0]_1\,
      I3 => \error_code[2]_i_3_n_0\,
      I4 => status_word(0),
      O => \FSM_onehot_state_reg[2]_2\
    );
\error_code[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8F88FFFF8F880000"
    )
        port map (
      I0 => \error_code[1]_i_2_n_0\,
      I1 => acknowledge_toggle_reg_0,
      I2 => \error_code_reg[1]\,
      I3 => \error_code_reg[1]_0\,
      I4 => \error_code[2]_i_3_n_0\,
      I5 => status_word(1),
      O => \FSM_onehot_state_reg[2]_1\
    );
\error_code[1]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5514"
    )
        port map (
      I0 => CO(0),
      I1 => response_data(0),
      I2 => \error_code1_inferred__0/i__carry__1\(0),
      I3 => response_data(1),
      O => \error_code[1]_i_2_n_0\
    );
\error_code[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => CO(0),
      I1 => acknowledge_toggle_reg_0,
      I2 => \error_code_reg[2]\,
      I3 => \error_code[2]_i_3_n_0\,
      I4 => status_word(2),
      O => \FSM_onehot_state_reg[2]_0\
    );
\error_code[2]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF00000006000600"
    )
        port map (
      I0 => \error_code_reg[0]\,
      I1 => command_word(0),
      I2 => \error_code_reg[0]_0\,
      I3 => interface_initialized,
      I4 => \^response_valid\,
      I5 => acknowledge_toggle_reg_0,
      O => \error_code[2]_i_3_n_0\
    );
\i__carry__0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \^q\(22),
      I1 => \error_code1_inferred__0/i__carry__1\(23),
      I2 => \^q\(21),
      I3 => \error_code1_inferred__0/i__carry__1\(22),
      I4 => \error_code1_inferred__0/i__carry__1\(24),
      I5 => \^q\(23),
      O => \dst_data_reg[24]_0\(3)
    );
\i__carry__0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \^q\(19),
      I1 => \error_code1_inferred__0/i__carry__1\(20),
      I2 => \^q\(18),
      I3 => \error_code1_inferred__0/i__carry__1\(19),
      I4 => \error_code1_inferred__0/i__carry__1\(21),
      I5 => \^q\(20),
      O => \dst_data_reg[24]_0\(2)
    );
\i__carry__0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \^q\(15),
      I1 => \error_code1_inferred__0/i__carry__1\(16),
      I2 => \^q\(16),
      I3 => \error_code1_inferred__0/i__carry__1\(17),
      I4 => \error_code1_inferred__0/i__carry__1\(18),
      I5 => \^q\(17),
      O => \dst_data_reg[24]_0\(1)
    );
\i__carry__0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \^q\(12),
      I1 => \error_code1_inferred__0/i__carry__1\(13),
      I2 => \^q\(13),
      I3 => \error_code1_inferred__0/i__carry__1\(14),
      I4 => \error_code1_inferred__0/i__carry__1\(15),
      I5 => \^q\(14),
      O => \dst_data_reg[24]_0\(0)
    );
\i__carry__1_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \error_code1_inferred__0/i__carry__1\(32),
      I1 => \^q\(31),
      I2 => \error_code1_inferred__0/i__carry__1\(31),
      I3 => \^q\(30),
      O => \config_packet_reg[122]\(2)
    );
\i__carry__1_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \^q\(27),
      I1 => \error_code1_inferred__0/i__carry__1\(28),
      I2 => \^q\(28),
      I3 => \error_code1_inferred__0/i__carry__1\(29),
      I4 => \error_code1_inferred__0/i__carry__1\(30),
      I5 => \^q\(29),
      O => \config_packet_reg[122]\(1)
    );
\i__carry__1_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \^q\(24),
      I1 => \error_code1_inferred__0/i__carry__1\(25),
      I2 => \^q\(25),
      I3 => \error_code1_inferred__0/i__carry__1\(26),
      I4 => \error_code1_inferred__0/i__carry__1\(27),
      I5 => \^q\(26),
      O => \config_packet_reg[122]\(0)
    );
\i__carry_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \^q\(9),
      I1 => \error_code1_inferred__0/i__carry__1\(10),
      I2 => \^q\(10),
      I3 => \error_code1_inferred__0/i__carry__1\(11),
      I4 => \error_code1_inferred__0/i__carry__1\(12),
      I5 => \^q\(11),
      O => S(3)
    );
\i__carry_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \^q\(8),
      I1 => \error_code1_inferred__0/i__carry__1\(9),
      I2 => \^q\(6),
      I3 => \error_code1_inferred__0/i__carry__1\(7),
      I4 => \error_code1_inferred__0/i__carry__1\(8),
      I5 => \^q\(7),
      O => S(2)
    );
\i__carry_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \^q\(3),
      I1 => \error_code1_inferred__0/i__carry__1\(4),
      I2 => \^q\(4),
      I3 => \error_code1_inferred__0/i__carry__1\(5),
      I4 => \error_code1_inferred__0/i__carry__1\(6),
      I5 => \^q\(5),
      O => S(1)
    );
\i__carry_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \^q\(1),
      I1 => \error_code1_inferred__0/i__carry__1\(2),
      I2 => \^q\(0),
      I3 => \error_code1_inferred__0/i__carry__1\(1),
      I4 => \error_code1_inferred__0/i__carry__1\(3),
      I5 => \^q\(2),
      O => S(0)
    );
reply_pending_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFF600FF00"
    )
        port map (
      I0 => request_toggle_reg_n_0,
      I1 => acknowledge_sync(1),
      I2 => \dst_data_reg[0]_0\,
      I3 => request_toggle_reg_1,
      I4 => src_reset_release(1),
      I5 => reply_pending_reg(0),
      O => request_toggle_reg_0
    );
\request_sync_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => '1',
      CLR => \dst_data_reg[0]_0\,
      D => request_toggle_reg_n_0,
      Q => request_sync(0)
    );
\request_sync_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => '1',
      CLR => \dst_data_reg[0]_0\,
      D => request_sync(0),
      Q => request_sync(1)
    );
\request_toggle_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A3AA0000"
    )
        port map (
      I0 => request_toggle_reg_n_0,
      I1 => acknowledge_sync(1),
      I2 => \dst_data_reg[0]_0\,
      I3 => request_toggle_reg_1,
      I4 => src_reset_release(1),
      O => \request_toggle_i_1__0_n_0\
    );
request_toggle_reg: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => '1',
      CLR => \dst_data_reg[0]_0\,
      D => \request_toggle_i_1__0_n_0\,
      Q => request_toggle_reg_n_0
    );
\src_data_hold[33]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"08000008"
    )
        port map (
      I0 => src_reset_release(1),
      I1 => request_toggle_reg_1,
      I2 => \dst_data_reg[0]_0\,
      I3 => acknowledge_sync(1),
      I4 => request_toggle_reg_n_0,
      O => src_data_hold
    );
\src_data_hold_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[33]_0\(0),
      Q => \src_data_hold_reg_n_0_[0]\
    );
\src_data_hold_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[33]_0\(10),
      Q => \src_data_hold_reg_n_0_[10]\
    );
\src_data_hold_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[33]_0\(11),
      Q => \src_data_hold_reg_n_0_[11]\
    );
\src_data_hold_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[33]_0\(12),
      Q => \src_data_hold_reg_n_0_[12]\
    );
\src_data_hold_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[33]_0\(13),
      Q => \src_data_hold_reg_n_0_[13]\
    );
\src_data_hold_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[33]_0\(14),
      Q => \src_data_hold_reg_n_0_[14]\
    );
\src_data_hold_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[33]_0\(15),
      Q => \src_data_hold_reg_n_0_[15]\
    );
\src_data_hold_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[33]_0\(16),
      Q => \src_data_hold_reg_n_0_[16]\
    );
\src_data_hold_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[33]_0\(17),
      Q => \src_data_hold_reg_n_0_[17]\
    );
\src_data_hold_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[33]_0\(18),
      Q => \src_data_hold_reg_n_0_[18]\
    );
\src_data_hold_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[33]_0\(19),
      Q => \src_data_hold_reg_n_0_[19]\
    );
\src_data_hold_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[33]_0\(1),
      Q => \src_data_hold_reg_n_0_[1]\
    );
\src_data_hold_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[33]_0\(20),
      Q => \src_data_hold_reg_n_0_[20]\
    );
\src_data_hold_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[33]_0\(21),
      Q => \src_data_hold_reg_n_0_[21]\
    );
\src_data_hold_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[33]_0\(22),
      Q => \src_data_hold_reg_n_0_[22]\
    );
\src_data_hold_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[33]_0\(23),
      Q => \src_data_hold_reg_n_0_[23]\
    );
\src_data_hold_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[33]_0\(24),
      Q => \src_data_hold_reg_n_0_[24]\
    );
\src_data_hold_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[33]_0\(25),
      Q => \src_data_hold_reg_n_0_[25]\
    );
\src_data_hold_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[33]_0\(26),
      Q => \src_data_hold_reg_n_0_[26]\
    );
\src_data_hold_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[33]_0\(27),
      Q => \src_data_hold_reg_n_0_[27]\
    );
\src_data_hold_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[33]_0\(28),
      Q => \src_data_hold_reg_n_0_[28]\
    );
\src_data_hold_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[33]_0\(29),
      Q => \src_data_hold_reg_n_0_[29]\
    );
\src_data_hold_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[33]_0\(2),
      Q => \src_data_hold_reg_n_0_[2]\
    );
\src_data_hold_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[33]_0\(30),
      Q => \src_data_hold_reg_n_0_[30]\
    );
\src_data_hold_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[33]_0\(31),
      Q => \src_data_hold_reg_n_0_[31]\
    );
\src_data_hold_reg[32]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[33]_0\(32),
      Q => \src_data_hold_reg_n_0_[32]\
    );
\src_data_hold_reg[33]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[33]_0\(33),
      Q => \src_data_hold_reg_n_0_[33]\
    );
\src_data_hold_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[33]_0\(3),
      Q => \src_data_hold_reg_n_0_[3]\
    );
\src_data_hold_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[33]_0\(4),
      Q => \src_data_hold_reg_n_0_[4]\
    );
\src_data_hold_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[33]_0\(5),
      Q => \src_data_hold_reg_n_0_[5]\
    );
\src_data_hold_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[33]_0\(6),
      Q => \src_data_hold_reg_n_0_[6]\
    );
\src_data_hold_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[33]_0\(7),
      Q => \src_data_hold_reg_n_0_[7]\
    );
\src_data_hold_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[33]_0\(8),
      Q => \src_data_hold_reg_n_0_[8]\
    );
\src_data_hold_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => src_data_hold,
      CLR => \dst_data_reg[0]_0\,
      D => \src_data_hold_reg[33]_0\(9),
      Q => \src_data_hold_reg_n_0_[9]\
    );
\src_reset_release_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => '1',
      CLR => \dst_data_reg[0]_0\,
      D => '1',
      Q => src_reset_release(0)
    );
\src_reset_release_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => '1',
      CLR => \dst_data_reg[0]_0\,
      D => src_reset_release(0),
      Q => src_reset_release(1)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_dac902_control_0_fdw_dac902_dds is
  port (
    sample_resetn_0 : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 1 downto 0 );
    v2 : out STD_LOGIC;
    active_enable : out STD_LOGIC;
    enabled2 : out STD_LOGIC;
    reference_inverted : out STD_LOGIC;
    sample_clipped_reg_0 : out STD_LOGIC_VECTOR ( 0 to 0 );
    reference_ftw : out STD_LOGIC_VECTOR ( 31 downto 0 );
    sample_pending_reg : out STD_LOGIC_VECTOR ( 0 to 0 );
    S : out STD_LOGIC_VECTOR ( 3 downto 0 );
    reference_tag : out STD_LOGIC_VECTOR ( 31 downto 0 );
    \sample_tag_pending_reg[23]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \sample_tag_pending_reg[31]\ : out STD_LOGIC_VECTOR ( 2 downto 0 );
    \active_tag_reg[11]_0\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \active_tag_reg[23]_0\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \active_tag_reg[31]_0\ : out STD_LOGIC_VECTOR ( 2 downto 0 );
    reference_valid : out STD_LOGIC;
    cfg_rejected_reg_0 : out STD_LOGIC;
    sample_valid_reg_0 : out STD_LOGIC;
    \sample_code_reg[11]_0\ : out STD_LOGIC_VECTOR ( 11 downto 0 );
    reference_phase : out STD_LOGIC_VECTOR ( 31 downto 0 );
    reference_config_ftw0 : in STD_LOGIC;
    sample_clk : in STD_LOGIC;
    cfg_rejected0 : in STD_LOGIC;
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    Q : in STD_LOGIC_VECTOR ( 121 downto 0 );
    \sample_code_reg[0]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    sample_active_reg_0 : in STD_LOGIC;
    sample_resetn : in STD_LOGIC;
    control_resetn : in STD_LOGIC;
    sample_pending : in STD_LOGIC;
    CO : in STD_LOGIC_VECTOR ( 0 to 0 );
    awaiting_sample_reg : in STD_LOGIC;
    \sample_pending1_carry__1\ : in STD_LOGIC_VECTOR ( 31 downto 0 );
    \out\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    clock_run : in STD_LOGIC;
    reference_valid_0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    awaiting_sample_reg_0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    sample_initialized : in STD_LOGIC;
    \scaled_sample1_carry__1_0\ : in STD_LOGIC;
    \phase_accumulator_reg[31]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_dac902_control_0_fdw_dac902_dds : entity is "fdw_dac902_dds";
end system_dac902_control_0_fdw_dac902_dds;

architecture STRUCTURE of system_dac902_control_0_fdw_dac902_dds is
  signal \^d\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^active_enable\ : STD_LOGIC;
  signal active_tag : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal awaiting_sample_i_2_n_0 : STD_LOGIC;
  signal bounded_code2_carry_i_1_n_0 : STD_LOGIC;
  signal bounded_code2_carry_i_2_n_0 : STD_LOGIC;
  signal bounded_code2_carry_i_3_n_0 : STD_LOGIC;
  signal bounded_code2_carry_n_2 : STD_LOGIC;
  signal bounded_code2_carry_n_3 : STD_LOGIC;
  signal cfg_accepted : STD_LOGIC;
  signal \code2_reg_n_0_[0]\ : STD_LOGIC;
  signal \code2_reg_n_0_[10]\ : STD_LOGIC;
  signal \code2_reg_n_0_[11]\ : STD_LOGIC;
  signal \code2_reg_n_0_[12]\ : STD_LOGIC;
  signal \code2_reg_n_0_[13]\ : STD_LOGIC;
  signal \code2_reg_n_0_[15]\ : STD_LOGIC;
  signal \code2_reg_n_0_[1]\ : STD_LOGIC;
  signal \code2_reg_n_0_[2]\ : STD_LOGIC;
  signal \code2_reg_n_0_[3]\ : STD_LOGIC;
  signal \code2_reg_n_0_[4]\ : STD_LOGIC;
  signal \code2_reg_n_0_[5]\ : STD_LOGIC;
  signal \code2_reg_n_0_[6]\ : STD_LOGIC;
  signal \code2_reg_n_0_[7]\ : STD_LOGIC;
  signal \code2_reg_n_0_[8]\ : STD_LOGIC;
  signal \code2_reg_n_0_[9]\ : STD_LOGIC;
  signal enabled0 : STD_LOGIC;
  signal enabled1 : STD_LOGIC;
  signal \^enabled2\ : STD_LOGIC;
  signal gain0 : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal gain_q11 : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal invert0 : STD_LOGIC;
  signal invert1 : STD_LOGIC;
  signal invert2 : STD_LOGIC;
  signal offset0 : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal offset1 : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal offset_code : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal p0 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \p0[11]_i_2_n_0\ : STD_LOGIC;
  signal \p0[11]_i_3_n_0\ : STD_LOGIC;
  signal \p0[11]_i_4_n_0\ : STD_LOGIC;
  signal \p0[11]_i_5_n_0\ : STD_LOGIC;
  signal \p0[15]_i_2_n_0\ : STD_LOGIC;
  signal \p0[15]_i_3_n_0\ : STD_LOGIC;
  signal \p0[15]_i_4_n_0\ : STD_LOGIC;
  signal \p0[15]_i_5_n_0\ : STD_LOGIC;
  signal \p0[19]_i_2_n_0\ : STD_LOGIC;
  signal \p0[19]_i_3_n_0\ : STD_LOGIC;
  signal \p0[19]_i_4_n_0\ : STD_LOGIC;
  signal \p0[19]_i_5_n_0\ : STD_LOGIC;
  signal \p0[23]_i_2_n_0\ : STD_LOGIC;
  signal \p0[23]_i_3_n_0\ : STD_LOGIC;
  signal \p0[23]_i_4_n_0\ : STD_LOGIC;
  signal \p0[23]_i_5_n_0\ : STD_LOGIC;
  signal \p0[27]_i_2_n_0\ : STD_LOGIC;
  signal \p0[27]_i_3_n_0\ : STD_LOGIC;
  signal \p0[27]_i_4_n_0\ : STD_LOGIC;
  signal \p0[27]_i_5_n_0\ : STD_LOGIC;
  signal \p0[31]_i_2_n_0\ : STD_LOGIC;
  signal \p0[31]_i_3_n_0\ : STD_LOGIC;
  signal \p0[31]_i_4_n_0\ : STD_LOGIC;
  signal \p0[31]_i_5_n_0\ : STD_LOGIC;
  signal \p0[3]_i_2_n_0\ : STD_LOGIC;
  signal \p0[3]_i_3_n_0\ : STD_LOGIC;
  signal \p0[3]_i_4_n_0\ : STD_LOGIC;
  signal \p0[3]_i_5_n_0\ : STD_LOGIC;
  signal \p0[7]_i_2_n_0\ : STD_LOGIC;
  signal \p0[7]_i_3_n_0\ : STD_LOGIC;
  signal \p0[7]_i_4_n_0\ : STD_LOGIC;
  signal \p0[7]_i_5_n_0\ : STD_LOGIC;
  signal \p0_reg[11]_i_1_n_0\ : STD_LOGIC;
  signal \p0_reg[11]_i_1_n_1\ : STD_LOGIC;
  signal \p0_reg[11]_i_1_n_2\ : STD_LOGIC;
  signal \p0_reg[11]_i_1_n_3\ : STD_LOGIC;
  signal \p0_reg[11]_i_1_n_4\ : STD_LOGIC;
  signal \p0_reg[11]_i_1_n_5\ : STD_LOGIC;
  signal \p0_reg[11]_i_1_n_6\ : STD_LOGIC;
  signal \p0_reg[11]_i_1_n_7\ : STD_LOGIC;
  signal \p0_reg[15]_i_1_n_0\ : STD_LOGIC;
  signal \p0_reg[15]_i_1_n_1\ : STD_LOGIC;
  signal \p0_reg[15]_i_1_n_2\ : STD_LOGIC;
  signal \p0_reg[15]_i_1_n_3\ : STD_LOGIC;
  signal \p0_reg[15]_i_1_n_4\ : STD_LOGIC;
  signal \p0_reg[15]_i_1_n_5\ : STD_LOGIC;
  signal \p0_reg[15]_i_1_n_6\ : STD_LOGIC;
  signal \p0_reg[15]_i_1_n_7\ : STD_LOGIC;
  signal \p0_reg[19]_i_1_n_0\ : STD_LOGIC;
  signal \p0_reg[19]_i_1_n_1\ : STD_LOGIC;
  signal \p0_reg[19]_i_1_n_2\ : STD_LOGIC;
  signal \p0_reg[19]_i_1_n_3\ : STD_LOGIC;
  signal \p0_reg[19]_i_1_n_4\ : STD_LOGIC;
  signal \p0_reg[19]_i_1_n_5\ : STD_LOGIC;
  signal \p0_reg[19]_i_1_n_6\ : STD_LOGIC;
  signal \p0_reg[19]_i_1_n_7\ : STD_LOGIC;
  signal \p0_reg[23]_i_1_n_0\ : STD_LOGIC;
  signal \p0_reg[23]_i_1_n_1\ : STD_LOGIC;
  signal \p0_reg[23]_i_1_n_2\ : STD_LOGIC;
  signal \p0_reg[23]_i_1_n_3\ : STD_LOGIC;
  signal \p0_reg[27]_i_1_n_0\ : STD_LOGIC;
  signal \p0_reg[27]_i_1_n_1\ : STD_LOGIC;
  signal \p0_reg[27]_i_1_n_2\ : STD_LOGIC;
  signal \p0_reg[27]_i_1_n_3\ : STD_LOGIC;
  signal \p0_reg[31]_i_1_n_1\ : STD_LOGIC;
  signal \p0_reg[31]_i_1_n_2\ : STD_LOGIC;
  signal \p0_reg[31]_i_1_n_3\ : STD_LOGIC;
  signal \p0_reg[3]_i_1_n_0\ : STD_LOGIC;
  signal \p0_reg[3]_i_1_n_1\ : STD_LOGIC;
  signal \p0_reg[3]_i_1_n_2\ : STD_LOGIC;
  signal \p0_reg[3]_i_1_n_3\ : STD_LOGIC;
  signal \p0_reg[3]_i_1_n_4\ : STD_LOGIC;
  signal \p0_reg[3]_i_1_n_5\ : STD_LOGIC;
  signal \p0_reg[3]_i_1_n_6\ : STD_LOGIC;
  signal \p0_reg[3]_i_1_n_7\ : STD_LOGIC;
  signal \p0_reg[7]_i_1_n_0\ : STD_LOGIC;
  signal \p0_reg[7]_i_1_n_1\ : STD_LOGIC;
  signal \p0_reg[7]_i_1_n_2\ : STD_LOGIC;
  signal \p0_reg[7]_i_1_n_3\ : STD_LOGIC;
  signal \p0_reg[7]_i_1_n_4\ : STD_LOGIC;
  signal \p0_reg[7]_i_1_n_5\ : STD_LOGIC;
  signal \p0_reg[7]_i_1_n_6\ : STD_LOGIC;
  signal \p0_reg[7]_i_1_n_7\ : STD_LOGIC;
  signal p1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal p2 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal p_0_out : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal \p_0_out_inferred__0/product10_i_100_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_101_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_102_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_103_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_104_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_105_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_106_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_107_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_108_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_109_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_110_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_111_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_112_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_113_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_114_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_115_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_116_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_117_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_118_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_119_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_120_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_121_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_122_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_123_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_124_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_125_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_126_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_127_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_128_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_129_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_130_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_131_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_132_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_133_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_134_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_135_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_136_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_137_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_138_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_139_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_13_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_140_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_141_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_142_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_143_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_144_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_145_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_146_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_147_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_148_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_149_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_14_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_150_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_151_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_152_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_153_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_154_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_155_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_156_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_157_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_158_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_159_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_15_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_160_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_161_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_162_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_163_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_164_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_165_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_166_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_167_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_168_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_169_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_16_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_170_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_171_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_172_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_173_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_174_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_175_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_176_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_177_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_178_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_179_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_17_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_180_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_181_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_182_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_183_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_184_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_185_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_186_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_187_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_188_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_189_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_18_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_190_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_191_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_192_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_193_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_194_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_195_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_196_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_197_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_198_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_199_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_19_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_200_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_201_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_202_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_203_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_204_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_205_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_206_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_207_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_208_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_209_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_20_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_210_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_211_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_212_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_213_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_214_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_215_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_216_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_217_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_218_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_219_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_21_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_220_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_221_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_222_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_223_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_224_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_225_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_226_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_227_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_228_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_229_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_22_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_230_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_231_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_232_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_233_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_234_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_235_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_236_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_237_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_238_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_239_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_23_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_240_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_241_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_242_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_243_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_244_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_245_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_246_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_247_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_248_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_249_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_24_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_250_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_251_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_252_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_253_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_254_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_255_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_256_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_257_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_258_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_259_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_25_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_260_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_261_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_262_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_263_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_264_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_265_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_266_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_267_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_268_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_269_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_26_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_270_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_271_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_272_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_273_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_274_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_275_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_276_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_277_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_278_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_279_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_27_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_280_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_281_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_282_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_283_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_284_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_285_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_286_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_287_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_288_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_289_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_28_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_290_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_291_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_292_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_293_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_294_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_295_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_296_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_297_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_298_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_299_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_29_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_300_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_301_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_302_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_303_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_304_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_305_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_306_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_307_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_308_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_309_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_30_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_310_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_311_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_312_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_313_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_314_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_315_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_316_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_317_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_318_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_319_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_31_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_320_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_321_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_322_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_323_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_324_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_325_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_326_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_327_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_328_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_329_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_32_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_330_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_331_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_332_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_333_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_335_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_336_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_337_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_338_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_339_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_33_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_340_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_341_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_342_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_343_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_344_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_345_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_346_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_347_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_348_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_349_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_34_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_350_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_351_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_352_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_353_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_354_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_355_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_356_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_357_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_358_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_359_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_35_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_360_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_361_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_362_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_363_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_364_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_365_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_366_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_367_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_368_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_369_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_36_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_370_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_371_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_372_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_373_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_374_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_375_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_376_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_377_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_378_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_379_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_37_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_380_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_381_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_382_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_383_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_384_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_385_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_386_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_387_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_388_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_389_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_38_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_390_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_391_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_392_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_393_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_394_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_395_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_396_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_397_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_398_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_399_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_39_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_400_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_401_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_402_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_403_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_404_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_405_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_406_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_407_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_408_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_409_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_40_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_410_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_411_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_412_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_413_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_414_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_415_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_416_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_417_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_418_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_419_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_41_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_420_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_421_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_422_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_423_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_424_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_425_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_426_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_427_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_428_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_429_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_42_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_430_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_431_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_432_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_433_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_434_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_435_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_436_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_437_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_438_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_439_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_43_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_440_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_441_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_442_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_443_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_444_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_445_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_446_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_447_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_448_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_449_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_44_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_450_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_451_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_452_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_453_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_454_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_455_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_456_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_457_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_458_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_459_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_45_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_460_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_461_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_462_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_463_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_464_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_465_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_466_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_467_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_468_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_469_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_46_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_470_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_471_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_472_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_473_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_474_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_475_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_476_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_477_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_478_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_479_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_47_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_480_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_481_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_482_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_483_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_484_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_485_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_486_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_487_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_488_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_489_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_48_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_490_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_491_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_492_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_493_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_494_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_495_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_496_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_497_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_498_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_499_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_49_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_500_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_501_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_502_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_503_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_504_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_505_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_506_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_507_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_508_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_509_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_50_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_510_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_511_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_512_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_513_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_514_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_515_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_516_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_517_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_518_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_519_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_51_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_520_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_521_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_522_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_523_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_524_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_525_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_526_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_527_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_528_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_529_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_52_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_530_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_531_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_532_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_533_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_534_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_535_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_536_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_537_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_538_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_539_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_53_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_540_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_541_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_542_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_543_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_544_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_545_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_546_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_547_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_548_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_549_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_54_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_550_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_551_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_552_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_553_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_554_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_555_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_556_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_557_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_558_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_559_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_55_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_560_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_561_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_562_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_563_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_564_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_565_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_566_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_567_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_568_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_569_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_56_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_570_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_571_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_572_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_573_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_574_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_575_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_576_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_577_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_578_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_579_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_57_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_580_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_581_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_582_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_583_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_584_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_585_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_586_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_587_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_588_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_589_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_58_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_590_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_591_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_592_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_593_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_594_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_595_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_596_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_597_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_598_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_599_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_59_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_600_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_601_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_602_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_603_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_604_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_605_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_606_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_607_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_608_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_609_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_60_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_610_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_611_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_612_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_613_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_614_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_615_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_616_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_617_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_618_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_619_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_61_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_620_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_621_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_622_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_623_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_624_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_625_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_626_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_627_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_628_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_629_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_62_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_630_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_631_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_632_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_633_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_634_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_635_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_636_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_637_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_638_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_639_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_63_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_640_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_641_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_642_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_643_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_644_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_645_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_646_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_647_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_648_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_649_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_64_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_650_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_651_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_652_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_653_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_654_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_655_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_656_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_657_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_658_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_659_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_65_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_660_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_661_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_662_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_663_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_664_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_665_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_666_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_667_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_668_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_669_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_66_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_670_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_671_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_672_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_673_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_674_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_675_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_676_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_677_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_678_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_679_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_67_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_680_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_681_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_682_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_683_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_684_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_685_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_686_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_687_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_688_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_689_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_68_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_690_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_691_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_692_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_693_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_694_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_695_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_696_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_697_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_698_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_699_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_69_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_700_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_701_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_702_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_703_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_704_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_705_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_706_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_707_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_708_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_709_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_70_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_710_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_711_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_712_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_713_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_714_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_715_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_716_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_717_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_718_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_719_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_71_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_720_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_721_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_722_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_723_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_724_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_725_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_726_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_727_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_728_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_729_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_72_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_730_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_731_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_732_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_733_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_734_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_735_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_736_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_737_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_738_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_739_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_73_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_740_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_74_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_75_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_76_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_77_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_78_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_79_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_80_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_81_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_82_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_83_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_84_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_85_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_86_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_87_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_88_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_89_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_90_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_91_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_92_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_93_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_94_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_95_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_96_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_97_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_98_n_0\ : STD_LOGIC;
  signal \p_0_out_inferred__0/product10_i_99_n_0\ : STD_LOGIC;
  signal p_1_in : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal phase_accumulator : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \phase_accumulator[11]_i_2_n_0\ : STD_LOGIC;
  signal \phase_accumulator[11]_i_3_n_0\ : STD_LOGIC;
  signal \phase_accumulator[11]_i_4_n_0\ : STD_LOGIC;
  signal \phase_accumulator[11]_i_5_n_0\ : STD_LOGIC;
  signal \phase_accumulator[11]_i_6_n_0\ : STD_LOGIC;
  signal \phase_accumulator[11]_i_7_n_0\ : STD_LOGIC;
  signal \phase_accumulator[11]_i_8_n_0\ : STD_LOGIC;
  signal \phase_accumulator[11]_i_9_n_0\ : STD_LOGIC;
  signal \phase_accumulator[15]_i_2_n_0\ : STD_LOGIC;
  signal \phase_accumulator[15]_i_3_n_0\ : STD_LOGIC;
  signal \phase_accumulator[15]_i_4_n_0\ : STD_LOGIC;
  signal \phase_accumulator[15]_i_5_n_0\ : STD_LOGIC;
  signal \phase_accumulator[15]_i_6_n_0\ : STD_LOGIC;
  signal \phase_accumulator[15]_i_7_n_0\ : STD_LOGIC;
  signal \phase_accumulator[15]_i_8_n_0\ : STD_LOGIC;
  signal \phase_accumulator[15]_i_9_n_0\ : STD_LOGIC;
  signal \phase_accumulator[19]_i_2_n_0\ : STD_LOGIC;
  signal \phase_accumulator[19]_i_3_n_0\ : STD_LOGIC;
  signal \phase_accumulator[19]_i_4_n_0\ : STD_LOGIC;
  signal \phase_accumulator[19]_i_5_n_0\ : STD_LOGIC;
  signal \phase_accumulator[19]_i_6_n_0\ : STD_LOGIC;
  signal \phase_accumulator[19]_i_7_n_0\ : STD_LOGIC;
  signal \phase_accumulator[19]_i_8_n_0\ : STD_LOGIC;
  signal \phase_accumulator[19]_i_9_n_0\ : STD_LOGIC;
  signal \phase_accumulator[23]_i_2_n_0\ : STD_LOGIC;
  signal \phase_accumulator[23]_i_3_n_0\ : STD_LOGIC;
  signal \phase_accumulator[23]_i_4_n_0\ : STD_LOGIC;
  signal \phase_accumulator[23]_i_5_n_0\ : STD_LOGIC;
  signal \phase_accumulator[23]_i_6_n_0\ : STD_LOGIC;
  signal \phase_accumulator[23]_i_7_n_0\ : STD_LOGIC;
  signal \phase_accumulator[23]_i_8_n_0\ : STD_LOGIC;
  signal \phase_accumulator[23]_i_9_n_0\ : STD_LOGIC;
  signal \phase_accumulator[27]_i_2_n_0\ : STD_LOGIC;
  signal \phase_accumulator[27]_i_3_n_0\ : STD_LOGIC;
  signal \phase_accumulator[27]_i_4_n_0\ : STD_LOGIC;
  signal \phase_accumulator[27]_i_5_n_0\ : STD_LOGIC;
  signal \phase_accumulator[27]_i_6_n_0\ : STD_LOGIC;
  signal \phase_accumulator[27]_i_7_n_0\ : STD_LOGIC;
  signal \phase_accumulator[27]_i_8_n_0\ : STD_LOGIC;
  signal \phase_accumulator[27]_i_9_n_0\ : STD_LOGIC;
  signal \phase_accumulator[31]_i_3_n_0\ : STD_LOGIC;
  signal \phase_accumulator[31]_i_4_n_0\ : STD_LOGIC;
  signal \phase_accumulator[31]_i_5_n_0\ : STD_LOGIC;
  signal \phase_accumulator[31]_i_6_n_0\ : STD_LOGIC;
  signal \phase_accumulator[31]_i_7_n_0\ : STD_LOGIC;
  signal \phase_accumulator[31]_i_8_n_0\ : STD_LOGIC;
  signal \phase_accumulator[31]_i_9_n_0\ : STD_LOGIC;
  signal \phase_accumulator[3]_i_2_n_0\ : STD_LOGIC;
  signal \phase_accumulator[3]_i_3_n_0\ : STD_LOGIC;
  signal \phase_accumulator[3]_i_4_n_0\ : STD_LOGIC;
  signal \phase_accumulator[3]_i_5_n_0\ : STD_LOGIC;
  signal \phase_accumulator[3]_i_6_n_0\ : STD_LOGIC;
  signal \phase_accumulator[3]_i_7_n_0\ : STD_LOGIC;
  signal \phase_accumulator[3]_i_8_n_0\ : STD_LOGIC;
  signal \phase_accumulator[3]_i_9_n_0\ : STD_LOGIC;
  signal \phase_accumulator[7]_i_2_n_0\ : STD_LOGIC;
  signal \phase_accumulator[7]_i_3_n_0\ : STD_LOGIC;
  signal \phase_accumulator[7]_i_4_n_0\ : STD_LOGIC;
  signal \phase_accumulator[7]_i_5_n_0\ : STD_LOGIC;
  signal \phase_accumulator[7]_i_6_n_0\ : STD_LOGIC;
  signal \phase_accumulator[7]_i_7_n_0\ : STD_LOGIC;
  signal \phase_accumulator[7]_i_8_n_0\ : STD_LOGIC;
  signal \phase_accumulator[7]_i_9_n_0\ : STD_LOGIC;
  signal \phase_accumulator_reg[11]_i_1_n_0\ : STD_LOGIC;
  signal \phase_accumulator_reg[11]_i_1_n_1\ : STD_LOGIC;
  signal \phase_accumulator_reg[11]_i_1_n_2\ : STD_LOGIC;
  signal \phase_accumulator_reg[11]_i_1_n_3\ : STD_LOGIC;
  signal \phase_accumulator_reg[11]_i_1_n_4\ : STD_LOGIC;
  signal \phase_accumulator_reg[11]_i_1_n_5\ : STD_LOGIC;
  signal \phase_accumulator_reg[11]_i_1_n_6\ : STD_LOGIC;
  signal \phase_accumulator_reg[11]_i_1_n_7\ : STD_LOGIC;
  signal \phase_accumulator_reg[15]_i_1_n_0\ : STD_LOGIC;
  signal \phase_accumulator_reg[15]_i_1_n_1\ : STD_LOGIC;
  signal \phase_accumulator_reg[15]_i_1_n_2\ : STD_LOGIC;
  signal \phase_accumulator_reg[15]_i_1_n_3\ : STD_LOGIC;
  signal \phase_accumulator_reg[15]_i_1_n_4\ : STD_LOGIC;
  signal \phase_accumulator_reg[15]_i_1_n_5\ : STD_LOGIC;
  signal \phase_accumulator_reg[15]_i_1_n_6\ : STD_LOGIC;
  signal \phase_accumulator_reg[15]_i_1_n_7\ : STD_LOGIC;
  signal \phase_accumulator_reg[19]_i_1_n_0\ : STD_LOGIC;
  signal \phase_accumulator_reg[19]_i_1_n_1\ : STD_LOGIC;
  signal \phase_accumulator_reg[19]_i_1_n_2\ : STD_LOGIC;
  signal \phase_accumulator_reg[19]_i_1_n_3\ : STD_LOGIC;
  signal \phase_accumulator_reg[19]_i_1_n_4\ : STD_LOGIC;
  signal \phase_accumulator_reg[19]_i_1_n_5\ : STD_LOGIC;
  signal \phase_accumulator_reg[19]_i_1_n_6\ : STD_LOGIC;
  signal \phase_accumulator_reg[19]_i_1_n_7\ : STD_LOGIC;
  signal \phase_accumulator_reg[23]_i_1_n_0\ : STD_LOGIC;
  signal \phase_accumulator_reg[23]_i_1_n_1\ : STD_LOGIC;
  signal \phase_accumulator_reg[23]_i_1_n_2\ : STD_LOGIC;
  signal \phase_accumulator_reg[23]_i_1_n_3\ : STD_LOGIC;
  signal \phase_accumulator_reg[23]_i_1_n_4\ : STD_LOGIC;
  signal \phase_accumulator_reg[23]_i_1_n_5\ : STD_LOGIC;
  signal \phase_accumulator_reg[23]_i_1_n_6\ : STD_LOGIC;
  signal \phase_accumulator_reg[23]_i_1_n_7\ : STD_LOGIC;
  signal \phase_accumulator_reg[27]_i_1_n_0\ : STD_LOGIC;
  signal \phase_accumulator_reg[27]_i_1_n_1\ : STD_LOGIC;
  signal \phase_accumulator_reg[27]_i_1_n_2\ : STD_LOGIC;
  signal \phase_accumulator_reg[27]_i_1_n_3\ : STD_LOGIC;
  signal \phase_accumulator_reg[27]_i_1_n_4\ : STD_LOGIC;
  signal \phase_accumulator_reg[27]_i_1_n_5\ : STD_LOGIC;
  signal \phase_accumulator_reg[27]_i_1_n_6\ : STD_LOGIC;
  signal \phase_accumulator_reg[27]_i_1_n_7\ : STD_LOGIC;
  signal \phase_accumulator_reg[31]_i_2_n_1\ : STD_LOGIC;
  signal \phase_accumulator_reg[31]_i_2_n_2\ : STD_LOGIC;
  signal \phase_accumulator_reg[31]_i_2_n_3\ : STD_LOGIC;
  signal \phase_accumulator_reg[31]_i_2_n_4\ : STD_LOGIC;
  signal \phase_accumulator_reg[31]_i_2_n_5\ : STD_LOGIC;
  signal \phase_accumulator_reg[31]_i_2_n_6\ : STD_LOGIC;
  signal \phase_accumulator_reg[31]_i_2_n_7\ : STD_LOGIC;
  signal \phase_accumulator_reg[3]_i_1_n_0\ : STD_LOGIC;
  signal \phase_accumulator_reg[3]_i_1_n_1\ : STD_LOGIC;
  signal \phase_accumulator_reg[3]_i_1_n_2\ : STD_LOGIC;
  signal \phase_accumulator_reg[3]_i_1_n_3\ : STD_LOGIC;
  signal \phase_accumulator_reg[3]_i_1_n_4\ : STD_LOGIC;
  signal \phase_accumulator_reg[3]_i_1_n_5\ : STD_LOGIC;
  signal \phase_accumulator_reg[3]_i_1_n_6\ : STD_LOGIC;
  signal \phase_accumulator_reg[3]_i_1_n_7\ : STD_LOGIC;
  signal \phase_accumulator_reg[7]_i_1_n_0\ : STD_LOGIC;
  signal \phase_accumulator_reg[7]_i_1_n_1\ : STD_LOGIC;
  signal \phase_accumulator_reg[7]_i_1_n_2\ : STD_LOGIC;
  signal \phase_accumulator_reg[7]_i_1_n_3\ : STD_LOGIC;
  signal \phase_accumulator_reg[7]_i_1_n_4\ : STD_LOGIC;
  signal \phase_accumulator_reg[7]_i_1_n_5\ : STD_LOGIC;
  signal \phase_accumulator_reg[7]_i_1_n_6\ : STD_LOGIC;
  signal \phase_accumulator_reg[7]_i_1_n_7\ : STD_LOGIC;
  signal phase_offset : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal product1 : STD_LOGIC_VECTOR ( 24 downto 0 );
  signal product10_i_334_n_0 : STD_LOGIC;
  signal product10_n_100 : STD_LOGIC;
  signal product10_n_101 : STD_LOGIC;
  signal product10_n_102 : STD_LOGIC;
  signal product10_n_103 : STD_LOGIC;
  signal product10_n_104 : STD_LOGIC;
  signal product10_n_105 : STD_LOGIC;
  signal product10_n_81 : STD_LOGIC;
  signal product10_n_82 : STD_LOGIC;
  signal product10_n_83 : STD_LOGIC;
  signal product10_n_84 : STD_LOGIC;
  signal product10_n_85 : STD_LOGIC;
  signal product10_n_86 : STD_LOGIC;
  signal product10_n_87 : STD_LOGIC;
  signal product10_n_88 : STD_LOGIC;
  signal product10_n_89 : STD_LOGIC;
  signal product10_n_90 : STD_LOGIC;
  signal product10_n_91 : STD_LOGIC;
  signal product10_n_92 : STD_LOGIC;
  signal product10_n_93 : STD_LOGIC;
  signal product10_n_94 : STD_LOGIC;
  signal product10_n_95 : STD_LOGIC;
  signal product10_n_96 : STD_LOGIC;
  signal product10_n_97 : STD_LOGIC;
  signal product10_n_98 : STD_LOGIC;
  signal product10_n_99 : STD_LOGIC;
  signal \^reference_ftw\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^reference_inverted\ : STD_LOGIC;
  signal \^reference_tag\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal sample_clipped_i_1_n_0 : STD_LOGIC;
  signal \^sample_clipped_reg_0\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \sample_phase[31]_i_1_n_0\ : STD_LOGIC;
  signal \^sample_resetn_0\ : STD_LOGIC;
  signal sample_valid : STD_LOGIC;
  signal scaled_sample0 : STD_LOGIC;
  signal \scaled_sample1_carry__0_i_5_n_0\ : STD_LOGIC;
  signal \scaled_sample1_carry__0_i_6_n_0\ : STD_LOGIC;
  signal \scaled_sample1_carry__0_i_7_n_0\ : STD_LOGIC;
  signal \scaled_sample1_carry__0_i_8_n_0\ : STD_LOGIC;
  signal \scaled_sample1_carry__0_n_0\ : STD_LOGIC;
  signal \scaled_sample1_carry__0_n_1\ : STD_LOGIC;
  signal \scaled_sample1_carry__0_n_2\ : STD_LOGIC;
  signal \scaled_sample1_carry__0_n_3\ : STD_LOGIC;
  signal \scaled_sample1_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \scaled_sample1_carry__1_i_5_n_0\ : STD_LOGIC;
  signal \scaled_sample1_carry__1_i_6_n_0\ : STD_LOGIC;
  signal \scaled_sample1_carry__1_i_7_n_0\ : STD_LOGIC;
  signal \scaled_sample1_carry__1_i_8_n_0\ : STD_LOGIC;
  signal \scaled_sample1_carry__1_n_0\ : STD_LOGIC;
  signal \scaled_sample1_carry__1_n_1\ : STD_LOGIC;
  signal \scaled_sample1_carry__1_n_2\ : STD_LOGIC;
  signal \scaled_sample1_carry__1_n_3\ : STD_LOGIC;
  signal \scaled_sample1_carry__1_n_4\ : STD_LOGIC;
  signal \scaled_sample1_carry__2_i_5_n_0\ : STD_LOGIC;
  signal \scaled_sample1_carry__2_i_6_n_0\ : STD_LOGIC;
  signal \scaled_sample1_carry__2_i_7_n_0\ : STD_LOGIC;
  signal \scaled_sample1_carry__2_i_8_n_0\ : STD_LOGIC;
  signal \scaled_sample1_carry__2_n_0\ : STD_LOGIC;
  signal \scaled_sample1_carry__2_n_1\ : STD_LOGIC;
  signal \scaled_sample1_carry__2_n_2\ : STD_LOGIC;
  signal \scaled_sample1_carry__2_n_3\ : STD_LOGIC;
  signal \scaled_sample1_carry__2_n_4\ : STD_LOGIC;
  signal \scaled_sample1_carry__2_n_5\ : STD_LOGIC;
  signal \scaled_sample1_carry__2_n_6\ : STD_LOGIC;
  signal \scaled_sample1_carry__2_n_7\ : STD_LOGIC;
  signal \scaled_sample1_carry__3_i_5_n_0\ : STD_LOGIC;
  signal \scaled_sample1_carry__3_i_6_n_0\ : STD_LOGIC;
  signal \scaled_sample1_carry__3_i_7_n_0\ : STD_LOGIC;
  signal \scaled_sample1_carry__3_i_8_n_0\ : STD_LOGIC;
  signal \scaled_sample1_carry__3_n_0\ : STD_LOGIC;
  signal \scaled_sample1_carry__3_n_1\ : STD_LOGIC;
  signal \scaled_sample1_carry__3_n_2\ : STD_LOGIC;
  signal \scaled_sample1_carry__3_n_3\ : STD_LOGIC;
  signal \scaled_sample1_carry__3_n_4\ : STD_LOGIC;
  signal \scaled_sample1_carry__3_n_5\ : STD_LOGIC;
  signal \scaled_sample1_carry__3_n_6\ : STD_LOGIC;
  signal \scaled_sample1_carry__3_n_7\ : STD_LOGIC;
  signal \scaled_sample1_carry__4_i_5_n_0\ : STD_LOGIC;
  signal \scaled_sample1_carry__4_i_6_n_0\ : STD_LOGIC;
  signal \scaled_sample1_carry__4_i_7_n_0\ : STD_LOGIC;
  signal \scaled_sample1_carry__4_i_8_n_0\ : STD_LOGIC;
  signal \scaled_sample1_carry__4_n_0\ : STD_LOGIC;
  signal \scaled_sample1_carry__4_n_1\ : STD_LOGIC;
  signal \scaled_sample1_carry__4_n_2\ : STD_LOGIC;
  signal \scaled_sample1_carry__4_n_3\ : STD_LOGIC;
  signal \scaled_sample1_carry__4_n_4\ : STD_LOGIC;
  signal \scaled_sample1_carry__4_n_5\ : STD_LOGIC;
  signal \scaled_sample1_carry__4_n_6\ : STD_LOGIC;
  signal \scaled_sample1_carry__4_n_7\ : STD_LOGIC;
  signal \scaled_sample1_carry__5_i_1_n_0\ : STD_LOGIC;
  signal scaled_sample1_carry_i_5_n_0 : STD_LOGIC;
  signal scaled_sample1_carry_i_6_n_0 : STD_LOGIC;
  signal scaled_sample1_carry_i_7_n_0 : STD_LOGIC;
  signal scaled_sample1_carry_i_8_n_0 : STD_LOGIC;
  signal scaled_sample1_carry_n_0 : STD_LOGIC;
  signal scaled_sample1_carry_n_1 : STD_LOGIC;
  signal scaled_sample1_carry_n_2 : STD_LOGIC;
  signal scaled_sample1_carry_n_3 : STD_LOGIC;
  signal sel : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal tag0 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal tag1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal tag2 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal unbounded_code : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \unbounded_code_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \unbounded_code_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \unbounded_code_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \unbounded_code_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \unbounded_code_carry__0_n_0\ : STD_LOGIC;
  signal \unbounded_code_carry__0_n_1\ : STD_LOGIC;
  signal \unbounded_code_carry__0_n_2\ : STD_LOGIC;
  signal \unbounded_code_carry__0_n_3\ : STD_LOGIC;
  signal \unbounded_code_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \unbounded_code_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \unbounded_code_carry__1_i_3_n_0\ : STD_LOGIC;
  signal \unbounded_code_carry__1_i_4_n_0\ : STD_LOGIC;
  signal \unbounded_code_carry__1_n_0\ : STD_LOGIC;
  signal \unbounded_code_carry__1_n_1\ : STD_LOGIC;
  signal \unbounded_code_carry__1_n_2\ : STD_LOGIC;
  signal \unbounded_code_carry__1_n_3\ : STD_LOGIC;
  signal \unbounded_code_carry__2_n_2\ : STD_LOGIC;
  signal \unbounded_code_carry__2_n_3\ : STD_LOGIC;
  signal unbounded_code_carry_i_1_n_0 : STD_LOGIC;
  signal unbounded_code_carry_i_2_n_0 : STD_LOGIC;
  signal unbounded_code_carry_i_3_n_0 : STD_LOGIC;
  signal unbounded_code_carry_i_4_n_0 : STD_LOGIC;
  signal unbounded_code_carry_n_0 : STD_LOGIC;
  signal unbounded_code_carry_n_1 : STD_LOGIC;
  signal unbounded_code_carry_n_2 : STD_LOGIC;
  signal unbounded_code_carry_n_3 : STD_LOGIC;
  signal v0 : STD_LOGIC;
  signal v1 : STD_LOGIC;
  signal v12_out : STD_LOGIC;
  signal \^v2\ : STD_LOGIC;
  signal v21_out : STD_LOGIC;
  signal NLW_bounded_code2_carry_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal NLW_bounded_code2_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_p0_reg[31]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_phase_accumulator_reg[31]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal NLW_product10_CARRYCASCOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_product10_MULTSIGNOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_product10_OVERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_product10_PATTERNBDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_product10_PATTERNDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_product10_UNDERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_product10_ACOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal NLW_product10_BCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal NLW_product10_CARRYOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_product10_P_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 25 );
  signal NLW_product10_PCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 0 );
  signal NLW_scaled_sample1_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_scaled_sample1_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_scaled_sample1_carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_scaled_sample1_carry__5_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_scaled_sample1_carry__5_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_unbounded_code_carry__2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_unbounded_code_carry__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of awaiting_sample_i_2 : label is "soft_lutpair23";
  attribute COMPARATOR_THRESHOLD : integer;
  attribute COMPARATOR_THRESHOLD of bounded_code2_carry : label is 11;
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \p0_reg[11]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \p0_reg[15]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \p0_reg[19]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \p0_reg[23]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \p0_reg[27]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \p0_reg[31]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \p0_reg[3]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \p0_reg[7]_i_1\ : label is 35;
  attribute SOFT_HLUTNM of \p_0_out_inferred__0/product10_i_128\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \p_0_out_inferred__0/product10_i_145\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \p_0_out_inferred__0/product10_i_148\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \p_0_out_inferred__0/product10_i_157\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \p_0_out_inferred__0/product10_i_184\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \p_0_out_inferred__0/product10_i_197\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \p_0_out_inferred__0/product10_i_198\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \p_0_out_inferred__0/product10_i_216\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \p_0_out_inferred__0/product10_i_243\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \p_0_out_inferred__0/product10_i_251\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \p_0_out_inferred__0/product10_i_261\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \p_0_out_inferred__0/product10_i_271\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \p_0_out_inferred__0/product10_i_324\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \p_0_out_inferred__0/product10_i_325\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \p_0_out_inferred__0/product10_i_326\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \p_0_out_inferred__0/product10_i_327\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \p_0_out_inferred__0/product10_i_328\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \p_0_out_inferred__0/product10_i_329\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \p_0_out_inferred__0/product10_i_330\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \p_0_out_inferred__0/product10_i_331\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \p_0_out_inferred__0/product10_i_332\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \p_0_out_inferred__0/product10_i_333\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \p_0_out_inferred__0/product10_i_335\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \p_0_out_inferred__0/product10_i_336\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \p_0_out_inferred__0/product10_i_337\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \p_0_out_inferred__0/product10_i_340\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \p_0_out_inferred__0/product10_i_342\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \p_0_out_inferred__0/product10_i_345\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \p_0_out_inferred__0/product10_i_347\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \p_0_out_inferred__0/product10_i_350\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \p_0_out_inferred__0/product10_i_351\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \p_0_out_inferred__0/product10_i_352\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \p_0_out_inferred__0/product10_i_353\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \p_0_out_inferred__0/product10_i_359\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \p_0_out_inferred__0/product10_i_374\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \p_0_out_inferred__0/product10_i_42\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \p_0_out_inferred__0/product10_i_43\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \p_0_out_inferred__0/product10_i_540\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \p_0_out_inferred__0/product10_i_567\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \p_0_out_inferred__0/product10_i_578\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \p_0_out_inferred__0/product10_i_584\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \p_0_out_inferred__0/product10_i_593\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of sample_initialized_i_1 : label is "soft_lutpair23";
  attribute ADDER_THRESHOLD of scaled_sample1_carry : label is 35;
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of scaled_sample1_carry : label is "{SYNTH-8 {cell *THIS*}}";
  attribute ADDER_THRESHOLD of \scaled_sample1_carry__0\ : label is 35;
  attribute METHODOLOGY_DRC_VIOS of \scaled_sample1_carry__0\ : label is "{SYNTH-8 {cell *THIS*}}";
  attribute ADDER_THRESHOLD of \scaled_sample1_carry__1\ : label is 35;
  attribute METHODOLOGY_DRC_VIOS of \scaled_sample1_carry__1\ : label is "{SYNTH-8 {cell *THIS*}}";
  attribute ADDER_THRESHOLD of \scaled_sample1_carry__2\ : label is 35;
  attribute METHODOLOGY_DRC_VIOS of \scaled_sample1_carry__2\ : label is "{SYNTH-8 {cell *THIS*}}";
  attribute ADDER_THRESHOLD of \scaled_sample1_carry__3\ : label is 35;
  attribute METHODOLOGY_DRC_VIOS of \scaled_sample1_carry__3\ : label is "{SYNTH-8 {cell *THIS*}}";
  attribute ADDER_THRESHOLD of \scaled_sample1_carry__4\ : label is 35;
  attribute METHODOLOGY_DRC_VIOS of \scaled_sample1_carry__4\ : label is "{SYNTH-8 {cell *THIS*}}";
  attribute ADDER_THRESHOLD of \scaled_sample1_carry__5\ : label is 35;
  attribute METHODOLOGY_DRC_VIOS of \scaled_sample1_carry__5\ : label is "{SYNTH-8 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of unbounded_code_carry : label is "{SYNTH-8 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of \unbounded_code_carry__0\ : label is "{SYNTH-8 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of \unbounded_code_carry__1\ : label is "{SYNTH-8 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of \unbounded_code_carry__2\ : label is "{SYNTH-8 {cell *THIS*}}";
  attribute SOFT_HLUTNM of v1_i_1 : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of v2_i_1 : label is "soft_lutpair27";
begin
  D(1 downto 0) <= \^d\(1 downto 0);
  active_enable <= \^active_enable\;
  enabled2 <= \^enabled2\;
  reference_ftw(31 downto 0) <= \^reference_ftw\(31 downto 0);
  reference_inverted <= \^reference_inverted\;
  reference_tag(31 downto 0) <= \^reference_tag\(31 downto 0);
  sample_clipped_reg_0(0) <= \^sample_clipped_reg_0\(0);
  sample_resetn_0 <= \^sample_resetn_0\;
  v2 <= \^v2\;
acknowledged_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => sample_resetn,
      I1 => control_resetn,
      O => \^sample_resetn_0\
    );
active_enable_reg: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(88),
      Q => \^active_enable\
    );
active_invert_reg: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(89),
      Q => \^reference_inverted\
    );
\active_tag_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(90),
      Q => active_tag(0)
    );
\active_tag_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(100),
      Q => active_tag(10)
    );
\active_tag_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(101),
      Q => active_tag(11)
    );
\active_tag_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(102),
      Q => active_tag(12)
    );
\active_tag_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(103),
      Q => active_tag(13)
    );
\active_tag_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(104),
      Q => active_tag(14)
    );
\active_tag_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(105),
      Q => active_tag(15)
    );
\active_tag_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(106),
      Q => active_tag(16)
    );
\active_tag_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(107),
      Q => active_tag(17)
    );
\active_tag_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(108),
      Q => active_tag(18)
    );
\active_tag_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(109),
      Q => active_tag(19)
    );
\active_tag_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(91),
      Q => active_tag(1)
    );
\active_tag_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(110),
      Q => active_tag(20)
    );
\active_tag_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(111),
      Q => active_tag(21)
    );
\active_tag_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(112),
      Q => active_tag(22)
    );
\active_tag_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(113),
      Q => active_tag(23)
    );
\active_tag_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(114),
      Q => active_tag(24)
    );
\active_tag_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(115),
      Q => active_tag(25)
    );
\active_tag_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(116),
      Q => active_tag(26)
    );
\active_tag_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(117),
      Q => active_tag(27)
    );
\active_tag_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(118),
      Q => active_tag(28)
    );
\active_tag_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(119),
      Q => active_tag(29)
    );
\active_tag_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(92),
      Q => active_tag(2)
    );
\active_tag_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(120),
      Q => active_tag(30)
    );
\active_tag_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(121),
      Q => active_tag(31)
    );
\active_tag_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(93),
      Q => active_tag(3)
    );
\active_tag_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(94),
      Q => active_tag(4)
    );
\active_tag_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(95),
      Q => active_tag(5)
    );
\active_tag_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(96),
      Q => active_tag(6)
    );
\active_tag_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(97),
      Q => active_tag(7)
    );
\active_tag_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(98),
      Q => active_tag(8)
    );
\active_tag_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(99),
      Q => active_tag(9)
    );
awaiting_sample_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5545555510001000"
    )
        port map (
      I0 => awaiting_sample_reg_0(0),
      I1 => \^d\(1),
      I2 => sample_pending,
      I3 => cfg_accepted,
      I4 => awaiting_sample_i_2_n_0,
      I5 => awaiting_sample_reg,
      O => cfg_rejected_reg_0
    );
awaiting_sample_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => awaiting_sample_reg,
      I1 => CO(0),
      I2 => sample_valid,
      O => awaiting_sample_i_2_n_0
    );
bounded_code2_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3 downto 2) => NLW_bounded_code2_carry_CO_UNCONNECTED(3 downto 2),
      CO(1) => bounded_code2_carry_n_2,
      CO(0) => bounded_code2_carry_n_3,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => bounded_code2_carry_i_1_n_0,
      O(3 downto 0) => NLW_bounded_code2_carry_O_UNCONNECTED(3 downto 0),
      S(3 downto 2) => B"00",
      S(1) => bounded_code2_carry_i_2_n_0,
      S(0) => bounded_code2_carry_i_3_n_0
    );
bounded_code2_carry_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \code2_reg_n_0_[13]\,
      I1 => \code2_reg_n_0_[12]\,
      O => bounded_code2_carry_i_1_n_0
    );
bounded_code2_carry_i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \code2_reg_n_0_[15]\,
      O => bounded_code2_carry_i_2_n_0
    );
bounded_code2_carry_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \code2_reg_n_0_[12]\,
      I1 => \code2_reg_n_0_[13]\,
      O => bounded_code2_carry_i_3_n_0
    );
cfg_accepted_reg: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => '1',
      CLR => \^sample_resetn_0\,
      D => reference_config_ftw0,
      Q => cfg_accepted
    );
cfg_rejected_reg: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => '1',
      CLR => \^sample_resetn_0\,
      D => cfg_rejected0,
      Q => \^d\(1)
    );
\code2_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => unbounded_code(0),
      Q => \code2_reg_n_0_[0]\
    );
\code2_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => unbounded_code(10),
      Q => \code2_reg_n_0_[10]\
    );
\code2_reg[11]\: unisim.vcomponents.FDPE
     port map (
      C => sample_clk,
      CE => E(0),
      D => unbounded_code(11),
      PRE => \^sample_resetn_0\,
      Q => \code2_reg_n_0_[11]\
    );
\code2_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => unbounded_code(12),
      Q => \code2_reg_n_0_[12]\
    );
\code2_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => unbounded_code(13),
      Q => \code2_reg_n_0_[13]\
    );
\code2_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => unbounded_code(15),
      Q => \code2_reg_n_0_[15]\
    );
\code2_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => unbounded_code(1),
      Q => \code2_reg_n_0_[1]\
    );
\code2_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => unbounded_code(2),
      Q => \code2_reg_n_0_[2]\
    );
\code2_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => unbounded_code(3),
      Q => \code2_reg_n_0_[3]\
    );
\code2_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => unbounded_code(4),
      Q => \code2_reg_n_0_[4]\
    );
\code2_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => unbounded_code(5),
      Q => \code2_reg_n_0_[5]\
    );
\code2_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => unbounded_code(6),
      Q => \code2_reg_n_0_[6]\
    );
\code2_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => unbounded_code(7),
      Q => \code2_reg_n_0_[7]\
    );
\code2_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => unbounded_code(8),
      Q => \code2_reg_n_0_[8]\
    );
\code2_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => unbounded_code(9),
      Q => \code2_reg_n_0_[9]\
    );
enabled0_reg: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => \^active_enable\,
      Q => enabled0
    );
enabled1_reg: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => enabled0,
      Q => enabled1
    );
enabled2_reg: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => enabled1,
      Q => \^enabled2\
    );
\frequency_word_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(0),
      Q => \^reference_ftw\(0)
    );
\frequency_word_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(10),
      Q => \^reference_ftw\(10)
    );
\frequency_word_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(11),
      Q => \^reference_ftw\(11)
    );
\frequency_word_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(12),
      Q => \^reference_ftw\(12)
    );
\frequency_word_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(13),
      Q => \^reference_ftw\(13)
    );
\frequency_word_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(14),
      Q => \^reference_ftw\(14)
    );
\frequency_word_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(15),
      Q => \^reference_ftw\(15)
    );
\frequency_word_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(16),
      Q => \^reference_ftw\(16)
    );
\frequency_word_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(17),
      Q => \^reference_ftw\(17)
    );
\frequency_word_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(18),
      Q => \^reference_ftw\(18)
    );
\frequency_word_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(19),
      Q => \^reference_ftw\(19)
    );
\frequency_word_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(1),
      Q => \^reference_ftw\(1)
    );
\frequency_word_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(20),
      Q => \^reference_ftw\(20)
    );
\frequency_word_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(21),
      Q => \^reference_ftw\(21)
    );
\frequency_word_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(22),
      Q => \^reference_ftw\(22)
    );
\frequency_word_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(23),
      Q => \^reference_ftw\(23)
    );
\frequency_word_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(24),
      Q => \^reference_ftw\(24)
    );
\frequency_word_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(25),
      Q => \^reference_ftw\(25)
    );
\frequency_word_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(26),
      Q => \^reference_ftw\(26)
    );
\frequency_word_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(27),
      Q => \^reference_ftw\(27)
    );
\frequency_word_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(28),
      Q => \^reference_ftw\(28)
    );
\frequency_word_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(29),
      Q => \^reference_ftw\(29)
    );
\frequency_word_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(2),
      Q => \^reference_ftw\(2)
    );
\frequency_word_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(30),
      Q => \^reference_ftw\(30)
    );
\frequency_word_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(31),
      Q => \^reference_ftw\(31)
    );
\frequency_word_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(3),
      Q => \^reference_ftw\(3)
    );
\frequency_word_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(4),
      Q => \^reference_ftw\(4)
    );
\frequency_word_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(5),
      Q => \^reference_ftw\(5)
    );
\frequency_word_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(6),
      Q => \^reference_ftw\(6)
    );
\frequency_word_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(7),
      Q => \^reference_ftw\(7)
    );
\frequency_word_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(8),
      Q => \^reference_ftw\(8)
    );
\frequency_word_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(9),
      Q => \^reference_ftw\(9)
    );
\gain0_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => gain_q11(0),
      Q => gain0(0)
    );
\gain0_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => gain_q11(10),
      Q => gain0(10)
    );
\gain0_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => gain_q11(11),
      Q => gain0(11)
    );
\gain0_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => gain_q11(1),
      Q => gain0(1)
    );
\gain0_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => gain_q11(2),
      Q => gain0(2)
    );
\gain0_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => gain_q11(3),
      Q => gain0(3)
    );
\gain0_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => gain_q11(4),
      Q => gain0(4)
    );
\gain0_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => gain_q11(5),
      Q => gain0(5)
    );
\gain0_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => gain_q11(6),
      Q => gain0(6)
    );
\gain0_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => gain_q11(7),
      Q => gain0(7)
    );
\gain0_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => gain_q11(8),
      Q => gain0(8)
    );
\gain0_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => gain_q11(9),
      Q => gain0(9)
    );
\gain_q11_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(64),
      Q => gain_q11(0)
    );
\gain_q11_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(74),
      Q => gain_q11(10)
    );
\gain_q11_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(75),
      Q => gain_q11(11)
    );
\gain_q11_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(65),
      Q => gain_q11(1)
    );
\gain_q11_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(66),
      Q => gain_q11(2)
    );
\gain_q11_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(67),
      Q => gain_q11(3)
    );
\gain_q11_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(68),
      Q => gain_q11(4)
    );
\gain_q11_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(69),
      Q => gain_q11(5)
    );
\gain_q11_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(70),
      Q => gain_q11(6)
    );
\gain_q11_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(71),
      Q => gain_q11(7)
    );
\gain_q11_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(72),
      Q => gain_q11(8)
    );
\gain_q11_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(73),
      Q => gain_q11(9)
    );
invert0_reg: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => \^reference_inverted\,
      Q => invert0
    );
invert1_reg: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => invert0,
      Q => invert1
    );
invert2_reg: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => invert1,
      Q => invert2
    );
\offset0_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => offset_code(0),
      Q => offset0(0)
    );
\offset0_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => offset_code(10),
      Q => offset0(10)
    );
\offset0_reg[11]\: unisim.vcomponents.FDPE
     port map (
      C => sample_clk,
      CE => E(0),
      D => offset_code(11),
      PRE => \^sample_resetn_0\,
      Q => offset0(11)
    );
\offset0_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => offset_code(1),
      Q => offset0(1)
    );
\offset0_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => offset_code(2),
      Q => offset0(2)
    );
\offset0_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => offset_code(3),
      Q => offset0(3)
    );
\offset0_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => offset_code(4),
      Q => offset0(4)
    );
\offset0_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => offset_code(5),
      Q => offset0(5)
    );
\offset0_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => offset_code(6),
      Q => offset0(6)
    );
\offset0_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => offset_code(7),
      Q => offset0(7)
    );
\offset0_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => offset_code(8),
      Q => offset0(8)
    );
\offset0_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => offset_code(9),
      Q => offset0(9)
    );
\offset1_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => offset0(0),
      Q => offset1(0)
    );
\offset1_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => offset0(10),
      Q => offset1(10)
    );
\offset1_reg[11]\: unisim.vcomponents.FDPE
     port map (
      C => sample_clk,
      CE => E(0),
      D => offset0(11),
      PRE => \^sample_resetn_0\,
      Q => offset1(11)
    );
\offset1_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => offset0(1),
      Q => offset1(1)
    );
\offset1_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => offset0(2),
      Q => offset1(2)
    );
\offset1_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => offset0(3),
      Q => offset1(3)
    );
\offset1_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => offset0(4),
      Q => offset1(4)
    );
\offset1_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => offset0(5),
      Q => offset1(5)
    );
\offset1_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => offset0(6),
      Q => offset1(6)
    );
\offset1_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => offset0(7),
      Q => offset1(7)
    );
\offset1_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => offset0(8),
      Q => offset1(8)
    );
\offset1_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => offset0(9),
      Q => offset1(9)
    );
\offset_code_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(76),
      Q => offset_code(0)
    );
\offset_code_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(86),
      Q => offset_code(10)
    );
\offset_code_reg[11]\: unisim.vcomponents.FDPE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      D => Q(87),
      PRE => \^sample_resetn_0\,
      Q => offset_code(11)
    );
\offset_code_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(77),
      Q => offset_code(1)
    );
\offset_code_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(78),
      Q => offset_code(2)
    );
\offset_code_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(79),
      Q => offset_code(3)
    );
\offset_code_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(80),
      Q => offset_code(4)
    );
\offset_code_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(81),
      Q => offset_code(5)
    );
\offset_code_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(82),
      Q => offset_code(6)
    );
\offset_code_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(83),
      Q => offset_code(7)
    );
\offset_code_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(84),
      Q => offset_code(8)
    );
\offset_code_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(85),
      Q => offset_code(9)
    );
\p0[11]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_accumulator(11),
      I1 => phase_offset(11),
      O => \p0[11]_i_2_n_0\
    );
\p0[11]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_accumulator(10),
      I1 => phase_offset(10),
      O => \p0[11]_i_3_n_0\
    );
\p0[11]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_accumulator(9),
      I1 => phase_offset(9),
      O => \p0[11]_i_4_n_0\
    );
\p0[11]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_accumulator(8),
      I1 => phase_offset(8),
      O => \p0[11]_i_5_n_0\
    );
\p0[15]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_accumulator(15),
      I1 => phase_offset(15),
      O => \p0[15]_i_2_n_0\
    );
\p0[15]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_accumulator(14),
      I1 => phase_offset(14),
      O => \p0[15]_i_3_n_0\
    );
\p0[15]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_accumulator(13),
      I1 => phase_offset(13),
      O => \p0[15]_i_4_n_0\
    );
\p0[15]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_accumulator(12),
      I1 => phase_offset(12),
      O => \p0[15]_i_5_n_0\
    );
\p0[19]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_accumulator(19),
      I1 => phase_offset(19),
      O => \p0[19]_i_2_n_0\
    );
\p0[19]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_accumulator(18),
      I1 => phase_offset(18),
      O => \p0[19]_i_3_n_0\
    );
\p0[19]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_accumulator(17),
      I1 => phase_offset(17),
      O => \p0[19]_i_4_n_0\
    );
\p0[19]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_accumulator(16),
      I1 => phase_offset(16),
      O => \p0[19]_i_5_n_0\
    );
\p0[23]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_accumulator(23),
      I1 => phase_offset(23),
      O => \p0[23]_i_2_n_0\
    );
\p0[23]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_accumulator(22),
      I1 => phase_offset(22),
      O => \p0[23]_i_3_n_0\
    );
\p0[23]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_accumulator(21),
      I1 => phase_offset(21),
      O => \p0[23]_i_4_n_0\
    );
\p0[23]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_accumulator(20),
      I1 => phase_offset(20),
      O => \p0[23]_i_5_n_0\
    );
\p0[27]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_accumulator(27),
      I1 => phase_offset(27),
      O => \p0[27]_i_2_n_0\
    );
\p0[27]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_accumulator(26),
      I1 => phase_offset(26),
      O => \p0[27]_i_3_n_0\
    );
\p0[27]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_accumulator(25),
      I1 => phase_offset(25),
      O => \p0[27]_i_4_n_0\
    );
\p0[27]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_accumulator(24),
      I1 => phase_offset(24),
      O => \p0[27]_i_5_n_0\
    );
\p0[31]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_accumulator(31),
      I1 => phase_offset(31),
      O => \p0[31]_i_2_n_0\
    );
\p0[31]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_accumulator(30),
      I1 => phase_offset(30),
      O => \p0[31]_i_3_n_0\
    );
\p0[31]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_accumulator(29),
      I1 => phase_offset(29),
      O => \p0[31]_i_4_n_0\
    );
\p0[31]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_accumulator(28),
      I1 => phase_offset(28),
      O => \p0[31]_i_5_n_0\
    );
\p0[3]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_accumulator(3),
      I1 => phase_offset(3),
      O => \p0[3]_i_2_n_0\
    );
\p0[3]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_accumulator(2),
      I1 => phase_offset(2),
      O => \p0[3]_i_3_n_0\
    );
\p0[3]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_accumulator(1),
      I1 => phase_offset(1),
      O => \p0[3]_i_4_n_0\
    );
\p0[3]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_accumulator(0),
      I1 => phase_offset(0),
      O => \p0[3]_i_5_n_0\
    );
\p0[7]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_accumulator(7),
      I1 => phase_offset(7),
      O => \p0[7]_i_2_n_0\
    );
\p0[7]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_accumulator(6),
      I1 => phase_offset(6),
      O => \p0[7]_i_3_n_0\
    );
\p0[7]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_accumulator(5),
      I1 => phase_offset(5),
      O => \p0[7]_i_4_n_0\
    );
\p0[7]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => phase_accumulator(4),
      I1 => phase_offset(4),
      O => \p0[7]_i_5_n_0\
    );
\p0_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => \p0_reg[3]_i_1_n_7\,
      Q => p0(0)
    );
\p0_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => \p0_reg[11]_i_1_n_5\,
      Q => p0(10)
    );
\p0_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => \p0_reg[11]_i_1_n_4\,
      Q => p0(11)
    );
\p0_reg[11]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \p0_reg[7]_i_1_n_0\,
      CO(3) => \p0_reg[11]_i_1_n_0\,
      CO(2) => \p0_reg[11]_i_1_n_1\,
      CO(1) => \p0_reg[11]_i_1_n_2\,
      CO(0) => \p0_reg[11]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => phase_accumulator(11 downto 8),
      O(3) => \p0_reg[11]_i_1_n_4\,
      O(2) => \p0_reg[11]_i_1_n_5\,
      O(1) => \p0_reg[11]_i_1_n_6\,
      O(0) => \p0_reg[11]_i_1_n_7\,
      S(3) => \p0[11]_i_2_n_0\,
      S(2) => \p0[11]_i_3_n_0\,
      S(1) => \p0[11]_i_4_n_0\,
      S(0) => \p0[11]_i_5_n_0\
    );
\p0_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => \p0_reg[15]_i_1_n_7\,
      Q => p0(12)
    );
\p0_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => \p0_reg[15]_i_1_n_6\,
      Q => p0(13)
    );
\p0_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => \p0_reg[15]_i_1_n_5\,
      Q => p0(14)
    );
\p0_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => \p0_reg[15]_i_1_n_4\,
      Q => p0(15)
    );
\p0_reg[15]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \p0_reg[11]_i_1_n_0\,
      CO(3) => \p0_reg[15]_i_1_n_0\,
      CO(2) => \p0_reg[15]_i_1_n_1\,
      CO(1) => \p0_reg[15]_i_1_n_2\,
      CO(0) => \p0_reg[15]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => phase_accumulator(15 downto 12),
      O(3) => \p0_reg[15]_i_1_n_4\,
      O(2) => \p0_reg[15]_i_1_n_5\,
      O(1) => \p0_reg[15]_i_1_n_6\,
      O(0) => \p0_reg[15]_i_1_n_7\,
      S(3) => \p0[15]_i_2_n_0\,
      S(2) => \p0[15]_i_3_n_0\,
      S(1) => \p0[15]_i_4_n_0\,
      S(0) => \p0[15]_i_5_n_0\
    );
\p0_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => \p0_reg[19]_i_1_n_7\,
      Q => p0(16)
    );
\p0_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => \p0_reg[19]_i_1_n_6\,
      Q => p0(17)
    );
\p0_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => \p0_reg[19]_i_1_n_5\,
      Q => p0(18)
    );
\p0_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => \p0_reg[19]_i_1_n_4\,
      Q => p0(19)
    );
\p0_reg[19]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \p0_reg[15]_i_1_n_0\,
      CO(3) => \p0_reg[19]_i_1_n_0\,
      CO(2) => \p0_reg[19]_i_1_n_1\,
      CO(1) => \p0_reg[19]_i_1_n_2\,
      CO(0) => \p0_reg[19]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => phase_accumulator(19 downto 16),
      O(3) => \p0_reg[19]_i_1_n_4\,
      O(2) => \p0_reg[19]_i_1_n_5\,
      O(1) => \p0_reg[19]_i_1_n_6\,
      O(0) => \p0_reg[19]_i_1_n_7\,
      S(3) => \p0[19]_i_2_n_0\,
      S(2) => \p0[19]_i_3_n_0\,
      S(1) => \p0[19]_i_4_n_0\,
      S(0) => \p0[19]_i_5_n_0\
    );
\p0_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => \p0_reg[3]_i_1_n_6\,
      Q => p0(1)
    );
\p0_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => sel(0),
      Q => p0(20)
    );
\p0_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => sel(1),
      Q => p0(21)
    );
\p0_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => sel(2),
      Q => p0(22)
    );
\p0_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => sel(3),
      Q => p0(23)
    );
\p0_reg[23]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \p0_reg[19]_i_1_n_0\,
      CO(3) => \p0_reg[23]_i_1_n_0\,
      CO(2) => \p0_reg[23]_i_1_n_1\,
      CO(1) => \p0_reg[23]_i_1_n_2\,
      CO(0) => \p0_reg[23]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => phase_accumulator(23 downto 20),
      O(3 downto 0) => sel(3 downto 0),
      S(3) => \p0[23]_i_2_n_0\,
      S(2) => \p0[23]_i_3_n_0\,
      S(1) => \p0[23]_i_4_n_0\,
      S(0) => \p0[23]_i_5_n_0\
    );
\p0_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => sel(4),
      Q => p0(24)
    );
\p0_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => sel(5),
      Q => p0(25)
    );
\p0_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => sel(6),
      Q => p0(26)
    );
\p0_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => sel(7),
      Q => p0(27)
    );
\p0_reg[27]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \p0_reg[23]_i_1_n_0\,
      CO(3) => \p0_reg[27]_i_1_n_0\,
      CO(2) => \p0_reg[27]_i_1_n_1\,
      CO(1) => \p0_reg[27]_i_1_n_2\,
      CO(0) => \p0_reg[27]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => phase_accumulator(27 downto 24),
      O(3 downto 0) => sel(7 downto 4),
      S(3) => \p0[27]_i_2_n_0\,
      S(2) => \p0[27]_i_3_n_0\,
      S(1) => \p0[27]_i_4_n_0\,
      S(0) => \p0[27]_i_5_n_0\
    );
\p0_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => sel(8),
      Q => p0(28)
    );
\p0_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => sel(9),
      Q => p0(29)
    );
\p0_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => \p0_reg[3]_i_1_n_5\,
      Q => p0(2)
    );
\p0_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => sel(10),
      Q => p0(30)
    );
\p0_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => sel(11),
      Q => p0(31)
    );
\p0_reg[31]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \p0_reg[27]_i_1_n_0\,
      CO(3) => \NLW_p0_reg[31]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \p0_reg[31]_i_1_n_1\,
      CO(1) => \p0_reg[31]_i_1_n_2\,
      CO(0) => \p0_reg[31]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2 downto 0) => phase_accumulator(30 downto 28),
      O(3 downto 0) => sel(11 downto 8),
      S(3) => \p0[31]_i_2_n_0\,
      S(2) => \p0[31]_i_3_n_0\,
      S(1) => \p0[31]_i_4_n_0\,
      S(0) => \p0[31]_i_5_n_0\
    );
\p0_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => \p0_reg[3]_i_1_n_4\,
      Q => p0(3)
    );
\p0_reg[3]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \p0_reg[3]_i_1_n_0\,
      CO(2) => \p0_reg[3]_i_1_n_1\,
      CO(1) => \p0_reg[3]_i_1_n_2\,
      CO(0) => \p0_reg[3]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => phase_accumulator(3 downto 0),
      O(3) => \p0_reg[3]_i_1_n_4\,
      O(2) => \p0_reg[3]_i_1_n_5\,
      O(1) => \p0_reg[3]_i_1_n_6\,
      O(0) => \p0_reg[3]_i_1_n_7\,
      S(3) => \p0[3]_i_2_n_0\,
      S(2) => \p0[3]_i_3_n_0\,
      S(1) => \p0[3]_i_4_n_0\,
      S(0) => \p0[3]_i_5_n_0\
    );
\p0_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => \p0_reg[7]_i_1_n_7\,
      Q => p0(4)
    );
\p0_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => \p0_reg[7]_i_1_n_6\,
      Q => p0(5)
    );
\p0_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => \p0_reg[7]_i_1_n_5\,
      Q => p0(6)
    );
\p0_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => \p0_reg[7]_i_1_n_4\,
      Q => p0(7)
    );
\p0_reg[7]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \p0_reg[3]_i_1_n_0\,
      CO(3) => \p0_reg[7]_i_1_n_0\,
      CO(2) => \p0_reg[7]_i_1_n_1\,
      CO(1) => \p0_reg[7]_i_1_n_2\,
      CO(0) => \p0_reg[7]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => phase_accumulator(7 downto 4),
      O(3) => \p0_reg[7]_i_1_n_4\,
      O(2) => \p0_reg[7]_i_1_n_5\,
      O(1) => \p0_reg[7]_i_1_n_6\,
      O(0) => \p0_reg[7]_i_1_n_7\,
      S(3) => \p0[7]_i_2_n_0\,
      S(2) => \p0[7]_i_3_n_0\,
      S(1) => \p0[7]_i_4_n_0\,
      S(0) => \p0[7]_i_5_n_0\
    );
\p0_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => \p0_reg[11]_i_1_n_7\,
      Q => p0(8)
    );
\p0_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => \p0_reg[11]_i_1_n_6\,
      Q => p0(9)
    );
\p1_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => p0(0),
      Q => p1(0)
    );
\p1_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => p0(10),
      Q => p1(10)
    );
\p1_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => p0(11),
      Q => p1(11)
    );
\p1_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => p0(12),
      Q => p1(12)
    );
\p1_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => p0(13),
      Q => p1(13)
    );
\p1_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => p0(14),
      Q => p1(14)
    );
\p1_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => p0(15),
      Q => p1(15)
    );
\p1_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => p0(16),
      Q => p1(16)
    );
\p1_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => p0(17),
      Q => p1(17)
    );
\p1_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => p0(18),
      Q => p1(18)
    );
\p1_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => p0(19),
      Q => p1(19)
    );
\p1_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => p0(1),
      Q => p1(1)
    );
\p1_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => p0(20),
      Q => p1(20)
    );
\p1_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => p0(21),
      Q => p1(21)
    );
\p1_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => p0(22),
      Q => p1(22)
    );
\p1_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => p0(23),
      Q => p1(23)
    );
\p1_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => p0(24),
      Q => p1(24)
    );
\p1_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => p0(25),
      Q => p1(25)
    );
\p1_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => p0(26),
      Q => p1(26)
    );
\p1_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => p0(27),
      Q => p1(27)
    );
\p1_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => p0(28),
      Q => p1(28)
    );
\p1_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => p0(29),
      Q => p1(29)
    );
\p1_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => p0(2),
      Q => p1(2)
    );
\p1_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => p0(30),
      Q => p1(30)
    );
\p1_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => p0(31),
      Q => p1(31)
    );
\p1_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => p0(3),
      Q => p1(3)
    );
\p1_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => p0(4),
      Q => p1(4)
    );
\p1_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => p0(5),
      Q => p1(5)
    );
\p1_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => p0(6),
      Q => p1(6)
    );
\p1_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => p0(7),
      Q => p1(7)
    );
\p1_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => p0(8),
      Q => p1(8)
    );
\p1_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => p0(9),
      Q => p1(9)
    );
\p2_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => p1(0),
      Q => p2(0)
    );
\p2_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => p1(10),
      Q => p2(10)
    );
\p2_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => p1(11),
      Q => p2(11)
    );
\p2_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => p1(12),
      Q => p2(12)
    );
\p2_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => p1(13),
      Q => p2(13)
    );
\p2_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => p1(14),
      Q => p2(14)
    );
\p2_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => p1(15),
      Q => p2(15)
    );
\p2_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => p1(16),
      Q => p2(16)
    );
\p2_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => p1(17),
      Q => p2(17)
    );
\p2_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => p1(18),
      Q => p2(18)
    );
\p2_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => p1(19),
      Q => p2(19)
    );
\p2_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => p1(1),
      Q => p2(1)
    );
\p2_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => p1(20),
      Q => p2(20)
    );
\p2_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => p1(21),
      Q => p2(21)
    );
\p2_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => p1(22),
      Q => p2(22)
    );
\p2_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => p1(23),
      Q => p2(23)
    );
\p2_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => p1(24),
      Q => p2(24)
    );
\p2_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => p1(25),
      Q => p2(25)
    );
\p2_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => p1(26),
      Q => p2(26)
    );
\p2_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => p1(27),
      Q => p2(27)
    );
\p2_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => p1(28),
      Q => p2(28)
    );
\p2_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => p1(29),
      Q => p2(29)
    );
\p2_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => p1(2),
      Q => p2(2)
    );
\p2_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => p1(30),
      Q => p2(30)
    );
\p2_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => p1(31),
      Q => p2(31)
    );
\p2_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => p1(3),
      Q => p2(3)
    );
\p2_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => p1(4),
      Q => p2(4)
    );
\p2_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => p1(5),
      Q => p2(5)
    );
\p2_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => p1(6),
      Q => p2(6)
    );
\p2_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => p1(7),
      Q => p2(7)
    );
\p2_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => p1(8),
      Q => p2(8)
    );
\p2_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => p1(9),
      Q => p2(9)
    );
\p_0_out_inferred__0/product10_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF00FF01FF00FE00"
    )
        port map (
      I0 => sel(9),
      I1 => sel(10),
      I2 => sel(8),
      I3 => sel(11),
      I4 => sel(7),
      I5 => \p_0_out_inferred__0/product10_i_13_n_0\,
      O => p_0_out(11)
    );
\p_0_out_inferred__0/product10_i_10\: unisim.vcomponents.MUXF8
     port map (
      I0 => \p_0_out_inferred__0/product10_i_36_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_37_n_0\,
      O => p_0_out(2),
      S => sel(9)
    );
\p_0_out_inferred__0/product10_i_100\: unisim.vcomponents.MUXF8
     port map (
      I0 => \p_0_out_inferred__0/product10_i_245_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_246_n_0\,
      O => \p_0_out_inferred__0/product10_i_100_n_0\,
      S => sel(6)
    );
\p_0_out_inferred__0/product10_i_101\: unisim.vcomponents.MUXF8
     port map (
      I0 => \p_0_out_inferred__0/product10_i_247_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_248_n_0\,
      O => \p_0_out_inferred__0/product10_i_101_n_0\,
      S => sel(6)
    );
\p_0_out_inferred__0/product10_i_102\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5F50CFCF5F50C0C0"
    )
        port map (
      I0 => sel(11),
      I1 => \p_0_out_inferred__0/product10_i_249_n_0\,
      I2 => sel(6),
      I3 => \p_0_out_inferred__0/product10_i_250_n_0\,
      I4 => sel(5),
      I5 => \p_0_out_inferred__0/product10_i_251_n_0\,
      O => \p_0_out_inferred__0/product10_i_102_n_0\
    );
\p_0_out_inferred__0/product10_i_103\: unisim.vcomponents.MUXF8
     port map (
      I0 => \p_0_out_inferred__0/product10_i_252_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_253_n_0\,
      O => \p_0_out_inferred__0/product10_i_103_n_0\,
      S => sel(6)
    );
\p_0_out_inferred__0/product10_i_104\: unisim.vcomponents.MUXF8
     port map (
      I0 => \p_0_out_inferred__0/product10_i_254_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_255_n_0\,
      O => \p_0_out_inferred__0/product10_i_104_n_0\,
      S => sel(6)
    );
\p_0_out_inferred__0/product10_i_105\: unisim.vcomponents.MUXF8
     port map (
      I0 => \p_0_out_inferred__0/product10_i_256_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_257_n_0\,
      O => \p_0_out_inferred__0/product10_i_105_n_0\,
      S => sel(6)
    );
\p_0_out_inferred__0/product10_i_106\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_258_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_259_n_0\,
      I2 => sel(7),
      I3 => \p_0_out_inferred__0/product10_i_260_n_0\,
      I4 => sel(6),
      I5 => \p_0_out_inferred__0/product10_i_261_n_0\,
      O => \p_0_out_inferred__0/product10_i_106_n_0\
    );
\p_0_out_inferred__0/product10_i_107\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_262_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_263_n_0\,
      I2 => sel(7),
      I3 => \p_0_out_inferred__0/product10_i_264_n_0\,
      I4 => sel(6),
      I5 => \p_0_out_inferred__0/product10_i_265_n_0\,
      O => \p_0_out_inferred__0/product10_i_107_n_0\
    );
\p_0_out_inferred__0/product10_i_108\: unisim.vcomponents.MUXF8
     port map (
      I0 => \p_0_out_inferred__0/product10_i_266_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_267_n_0\,
      O => \p_0_out_inferred__0/product10_i_108_n_0\,
      S => sel(6)
    );
\p_0_out_inferred__0/product10_i_109\: unisim.vcomponents.MUXF8
     port map (
      I0 => \p_0_out_inferred__0/product10_i_268_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_269_n_0\,
      O => \p_0_out_inferred__0/product10_i_109_n_0\,
      S => sel(6)
    );
\p_0_out_inferred__0/product10_i_11\: unisim.vcomponents.MUXF8
     port map (
      I0 => \p_0_out_inferred__0/product10_i_38_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_39_n_0\,
      O => p_0_out(1),
      S => sel(9)
    );
\p_0_out_inferred__0/product10_i_110\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_270_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_271_n_0\,
      I2 => sel(6),
      I3 => \p_0_out_inferred__0/product10_i_272_n_0\,
      I4 => sel(5),
      I5 => \p_0_out_inferred__0/product10_i_273_n_0\,
      O => \p_0_out_inferred__0/product10_i_110_n_0\
    );
\p_0_out_inferred__0/product10_i_111\: unisim.vcomponents.MUXF8
     port map (
      I0 => \p_0_out_inferred__0/product10_i_274_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_275_n_0\,
      O => \p_0_out_inferred__0/product10_i_111_n_0\,
      S => sel(6)
    );
\p_0_out_inferred__0/product10_i_112\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_276_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_277_n_0\,
      I2 => sel(8),
      I3 => \p_0_out_inferred__0/product10_i_278_n_0\,
      I4 => sel(7),
      I5 => \p_0_out_inferred__0/product10_i_279_n_0\,
      O => \p_0_out_inferred__0/product10_i_112_n_0\
    );
\p_0_out_inferred__0/product10_i_113\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_280_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_281_n_0\,
      I2 => sel(8),
      I3 => \p_0_out_inferred__0/product10_i_282_n_0\,
      I4 => sel(7),
      I5 => \p_0_out_inferred__0/product10_i_283_n_0\,
      O => \p_0_out_inferred__0/product10_i_113_n_0\
    );
\p_0_out_inferred__0/product10_i_114\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_284_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_285_n_0\,
      I2 => sel(8),
      I3 => \p_0_out_inferred__0/product10_i_286_n_0\,
      I4 => sel(7),
      I5 => \p_0_out_inferred__0/product10_i_287_n_0\,
      O => \p_0_out_inferred__0/product10_i_114_n_0\
    );
\p_0_out_inferred__0/product10_i_115\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_288_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_289_n_0\,
      I2 => sel(8),
      I3 => \p_0_out_inferred__0/product10_i_290_n_0\,
      I4 => sel(7),
      I5 => \p_0_out_inferred__0/product10_i_291_n_0\,
      O => \p_0_out_inferred__0/product10_i_115_n_0\
    );
\p_0_out_inferred__0/product10_i_116\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_292_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_293_n_0\,
      I2 => sel(8),
      I3 => \p_0_out_inferred__0/product10_i_294_n_0\,
      I4 => sel(7),
      I5 => \p_0_out_inferred__0/product10_i_295_n_0\,
      O => \p_0_out_inferred__0/product10_i_116_n_0\
    );
\p_0_out_inferred__0/product10_i_117\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_296_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_297_n_0\,
      I2 => sel(8),
      I3 => \p_0_out_inferred__0/product10_i_298_n_0\,
      I4 => sel(7),
      I5 => \p_0_out_inferred__0/product10_i_299_n_0\,
      O => \p_0_out_inferred__0/product10_i_117_n_0\
    );
\p_0_out_inferred__0/product10_i_118\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_300_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_301_n_0\,
      I2 => sel(8),
      I3 => \p_0_out_inferred__0/product10_i_302_n_0\,
      I4 => sel(7),
      I5 => \p_0_out_inferred__0/product10_i_303_n_0\,
      O => \p_0_out_inferred__0/product10_i_118_n_0\
    );
\p_0_out_inferred__0/product10_i_119\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_304_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_305_n_0\,
      I2 => sel(8),
      I3 => \p_0_out_inferred__0/product10_i_306_n_0\,
      I4 => sel(7),
      I5 => \p_0_out_inferred__0/product10_i_307_n_0\,
      O => \p_0_out_inferred__0/product10_i_119_n_0\
    );
\p_0_out_inferred__0/product10_i_12\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_40_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_41_n_0\,
      O => p_0_out(0),
      S => sel(9)
    );
\p_0_out_inferred__0/product10_i_120\: unisim.vcomponents.MUXF8
     port map (
      I0 => \p_0_out_inferred__0/product10_i_308_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_309_n_0\,
      O => \p_0_out_inferred__0/product10_i_120_n_0\,
      S => sel(7)
    );
\p_0_out_inferred__0/product10_i_121\: unisim.vcomponents.MUXF8
     port map (
      I0 => \p_0_out_inferred__0/product10_i_310_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_311_n_0\,
      O => \p_0_out_inferred__0/product10_i_121_n_0\,
      S => sel(7)
    );
\p_0_out_inferred__0/product10_i_122\: unisim.vcomponents.MUXF8
     port map (
      I0 => \p_0_out_inferred__0/product10_i_312_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_313_n_0\,
      O => \p_0_out_inferred__0/product10_i_122_n_0\,
      S => sel(7)
    );
\p_0_out_inferred__0/product10_i_123\: unisim.vcomponents.MUXF8
     port map (
      I0 => \p_0_out_inferred__0/product10_i_314_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_315_n_0\,
      O => \p_0_out_inferred__0/product10_i_123_n_0\,
      S => sel(7)
    );
\p_0_out_inferred__0/product10_i_124\: unisim.vcomponents.MUXF8
     port map (
      I0 => \p_0_out_inferred__0/product10_i_316_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_317_n_0\,
      O => \p_0_out_inferred__0/product10_i_124_n_0\,
      S => sel(7)
    );
\p_0_out_inferred__0/product10_i_125\: unisim.vcomponents.MUXF8
     port map (
      I0 => \p_0_out_inferred__0/product10_i_318_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_319_n_0\,
      O => \p_0_out_inferred__0/product10_i_125_n_0\,
      S => sel(7)
    );
\p_0_out_inferred__0/product10_i_126\: unisim.vcomponents.MUXF8
     port map (
      I0 => \p_0_out_inferred__0/product10_i_320_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_321_n_0\,
      O => \p_0_out_inferred__0/product10_i_126_n_0\,
      S => sel(7)
    );
\p_0_out_inferred__0/product10_i_127\: unisim.vcomponents.MUXF8
     port map (
      I0 => \p_0_out_inferred__0/product10_i_322_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_323_n_0\,
      O => \p_0_out_inferred__0/product10_i_127_n_0\,
      S => sel(7)
    );
\p_0_out_inferred__0/product10_i_128\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => sel(2),
      I1 => sel(1),
      O => \p_0_out_inferred__0/product10_i_128_n_0\
    );
\p_0_out_inferred__0/product10_i_129\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEAA00000155FFFF"
    )
        port map (
      I0 => sel(5),
      I1 => \p_0_out_inferred__0/product10_i_184_n_0\,
      I2 => sel(3),
      I3 => sel(4),
      I4 => sel(6),
      I5 => sel(11),
      O => \p_0_out_inferred__0/product10_i_129_n_0\
    );
\p_0_out_inferred__0/product10_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFE00000000"
    )
        port map (
      I0 => sel(6),
      I1 => sel(5),
      I2 => sel(4),
      I3 => sel(3),
      I4 => \p_0_out_inferred__0/product10_i_42_n_0\,
      I5 => sel(11),
      O => \p_0_out_inferred__0/product10_i_13_n_0\
    );
\p_0_out_inferred__0/product10_i_130\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"1055FEAA"
    )
        port map (
      I0 => sel(6),
      I1 => sel(4),
      I2 => \p_0_out_inferred__0/product10_i_324_n_0\,
      I3 => sel(5),
      I4 => sel(11),
      O => \p_0_out_inferred__0/product10_i_130_n_0\
    );
\p_0_out_inferred__0/product10_i_131\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF80000000FFFFFF"
    )
        port map (
      I0 => sel(0),
      I1 => sel(2),
      I2 => sel(1),
      I3 => sel(3),
      I4 => sel(4),
      I5 => sel(11),
      O => \p_0_out_inferred__0/product10_i_131_n_0\
    );
\p_0_out_inferred__0/product10_i_132\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3333337666666666"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(0),
      I3 => sel(2),
      I4 => sel(1),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_132_n_0\
    );
\p_0_out_inferred__0/product10_i_133\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EAAA00001555FFFF"
    )
        port map (
      I0 => sel(5),
      I1 => sel(3),
      I2 => sel(2),
      I3 => sel(4),
      I4 => sel(6),
      I5 => sel(11),
      O => \p_0_out_inferred__0/product10_i_133_n_0\
    );
\p_0_out_inferred__0/product10_i_134\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4455FFFFFAAA0000"
    )
        port map (
      I0 => sel(4),
      I1 => \p_0_out_inferred__0/product10_i_325_n_0\,
      I2 => \p_0_out_inferred__0/product10_i_326_n_0\,
      I3 => sel(3),
      I4 => sel(5),
      I5 => sel(11),
      O => \p_0_out_inferred__0/product10_i_134_n_0\
    );
\p_0_out_inferred__0/product10_i_135\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"44555555FAAAAAAA"
    )
        port map (
      I0 => sel(6),
      I1 => \p_0_out_inferred__0/product10_i_327_n_0\,
      I2 => \p_0_out_inferred__0/product10_i_328_n_0\,
      I3 => sel(4),
      I4 => sel(5),
      I5 => sel(11),
      O => \p_0_out_inferred__0/product10_i_135_n_0\
    );
\p_0_out_inferred__0/product10_i_136\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFBCCCCC83803333"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_329_n_0\,
      I1 => sel(6),
      I2 => sel(4),
      I3 => \p_0_out_inferred__0/product10_i_330_n_0\,
      I4 => sel(5),
      I5 => sel(11),
      O => \p_0_out_inferred__0/product10_i_136_n_0\
    );
\p_0_out_inferred__0/product10_i_137\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3B3B3B38C8C8C8C8"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_331_n_0\,
      I1 => sel(6),
      I2 => sel(5),
      I3 => sel(4),
      I4 => \p_0_out_inferred__0/product10_i_197_n_0\,
      I5 => sel(11),
      O => \p_0_out_inferred__0/product10_i_137_n_0\
    );
\p_0_out_inferred__0/product10_i_138\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00155555FFAAAAAA"
    )
        port map (
      I0 => sel(5),
      I1 => sel(0),
      I2 => \p_0_out_inferred__0/product10_i_184_n_0\,
      I3 => sel(3),
      I4 => sel(4),
      I5 => sel(11),
      O => \p_0_out_inferred__0/product10_i_138_n_0\
    );
\p_0_out_inferred__0/product10_i_139\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF00FE11EE11EE11"
    )
        port map (
      I0 => sel(5),
      I1 => sel(4),
      I2 => sel(0),
      I3 => sel(11),
      I4 => \p_0_out_inferred__0/product10_i_128_n_0\,
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_139_n_0\
    );
\p_0_out_inferred__0/product10_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEAA00001055FFFF"
    )
        port map (
      I0 => sel(6),
      I1 => sel(4),
      I2 => \p_0_out_inferred__0/product10_i_43_n_0\,
      I3 => sel(5),
      I4 => sel(7),
      I5 => sel(11),
      O => \p_0_out_inferred__0/product10_i_14_n_0\
    );
\p_0_out_inferred__0/product10_i_140\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0FFFFFFFF8000000"
    )
        port map (
      I0 => sel(0),
      I1 => \p_0_out_inferred__0/product10_i_184_n_0\,
      I2 => sel(3),
      I3 => sel(4),
      I4 => sel(5),
      I5 => sel(11),
      O => \p_0_out_inferred__0/product10_i_140_n_0\
    );
\p_0_out_inferred__0/product10_i_141\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FAAA00000155FFFF"
    )
        port map (
      I0 => sel(4),
      I1 => sel(0),
      I2 => \p_0_out_inferred__0/product10_i_128_n_0\,
      I3 => sel(3),
      I4 => sel(5),
      I5 => sel(11),
      O => \p_0_out_inferred__0/product10_i_141_n_0\
    );
\p_0_out_inferred__0/product10_i_142\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEFEAAAA11005555"
    )
        port map (
      I0 => sel(6),
      I1 => sel(4),
      I2 => \p_0_out_inferred__0/product10_i_332_n_0\,
      I3 => \p_0_out_inferred__0/product10_i_333_n_0\,
      I4 => sel(5),
      I5 => sel(11),
      O => \p_0_out_inferred__0/product10_i_142_n_0\
    );
\p_0_out_inferred__0/product10_i_143\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3BC43FC33BC43CC0"
    )
        port map (
      I0 => product10_i_334_n_0,
      I1 => sel(6),
      I2 => sel(5),
      I3 => sel(11),
      I4 => sel(4),
      I5 => \p_0_out_inferred__0/product10_i_335_n_0\,
      O => \p_0_out_inferred__0/product10_i_143_n_0\
    );
\p_0_out_inferred__0/product10_i_144\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"1055FEAA"
    )
        port map (
      I0 => sel(6),
      I1 => sel(4),
      I2 => \p_0_out_inferred__0/product10_i_329_n_0\,
      I3 => sel(5),
      I4 => sel(11),
      O => \p_0_out_inferred__0/product10_i_144_n_0\
    );
\p_0_out_inferred__0/product10_i_145\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FE0001FF"
    )
        port map (
      I0 => sel(5),
      I1 => sel(4),
      I2 => sel(3),
      I3 => sel(6),
      I4 => sel(11),
      O => \p_0_out_inferred__0/product10_i_145_n_0\
    );
\p_0_out_inferred__0/product10_i_146\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1010FFFFFFEE0000"
    )
        port map (
      I0 => sel(5),
      I1 => sel(4),
      I2 => \p_0_out_inferred__0/product10_i_327_n_0\,
      I3 => \p_0_out_inferred__0/product10_i_336_n_0\,
      I4 => sel(6),
      I5 => sel(11),
      O => \p_0_out_inferred__0/product10_i_146_n_0\
    );
\p_0_out_inferred__0/product10_i_147\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3B383C3CCBC8C3C3"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_337_n_0\,
      I1 => sel(6),
      I2 => sel(5),
      I3 => \p_0_out_inferred__0/product10_i_335_n_0\,
      I4 => sel(4),
      I5 => sel(11),
      O => \p_0_out_inferred__0/product10_i_147_n_0\
    );
\p_0_out_inferred__0/product10_i_148\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF0080FF"
    )
        port map (
      I0 => sel(0),
      I1 => sel(2),
      I2 => sel(1),
      I3 => sel(11),
      I4 => sel(3),
      O => \p_0_out_inferred__0/product10_i_148_n_0\
    );
\p_0_out_inferred__0/product10_i_149\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCFF3B333300C4C"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_184_n_0\,
      I1 => sel(6),
      I2 => sel(4),
      I3 => sel(3),
      I4 => sel(5),
      I5 => sel(11),
      O => \p_0_out_inferred__0/product10_i_149_n_0\
    );
\p_0_out_inferred__0/product10_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3BC83FC33BC83CC0"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_44_n_0\,
      I1 => sel(8),
      I2 => sel(7),
      I3 => sel(11),
      I4 => sel(6),
      I5 => \p_0_out_inferred__0/product10_i_45_n_0\,
      O => \p_0_out_inferred__0/product10_i_15_n_0\
    );
\p_0_out_inferred__0/product10_i_150\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_338_n_0\,
      I1 => sel(11),
      I2 => sel(6),
      I3 => \p_0_out_inferred__0/product10_i_339_n_0\,
      I4 => sel(5),
      I5 => \p_0_out_inferred__0/product10_i_340_n_0\,
      O => \p_0_out_inferred__0/product10_i_150_n_0\
    );
\p_0_out_inferred__0/product10_i_151\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_341_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_342_n_0\,
      I2 => sel(6),
      I3 => \p_0_out_inferred__0/product10_i_343_n_0\,
      I4 => sel(5),
      I5 => \p_0_out_inferred__0/product10_i_344_n_0\,
      O => \p_0_out_inferred__0/product10_i_151_n_0\
    );
\p_0_out_inferred__0/product10_i_152\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B3B00C0C8F8CF3F3"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_43_n_0\,
      I1 => sel(6),
      I2 => sel(4),
      I3 => \p_0_out_inferred__0/product10_i_330_n_0\,
      I4 => sel(5),
      I5 => sel(11),
      O => \p_0_out_inferred__0/product10_i_152_n_0\
    );
\p_0_out_inferred__0/product10_i_153\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_345_n_0\,
      I1 => sel(6),
      I2 => \p_0_out_inferred__0/product10_i_346_n_0\,
      I3 => sel(5),
      I4 => \p_0_out_inferred__0/product10_i_340_n_0\,
      O => \p_0_out_inferred__0/product10_i_153_n_0\
    );
\p_0_out_inferred__0/product10_i_154\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_347_n_0\,
      I1 => sel(6),
      I2 => \p_0_out_inferred__0/product10_i_338_n_0\,
      I3 => sel(5),
      I4 => \p_0_out_inferred__0/product10_i_348_n_0\,
      O => \p_0_out_inferred__0/product10_i_154_n_0\
    );
\p_0_out_inferred__0/product10_i_155\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_349_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_350_n_0\,
      I2 => sel(6),
      I3 => sel(11),
      I4 => sel(5),
      I5 => \p_0_out_inferred__0/product10_i_342_n_0\,
      O => \p_0_out_inferred__0/product10_i_155_n_0\
    );
\p_0_out_inferred__0/product10_i_156\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFCCB3B333308C8C"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_351_n_0\,
      I1 => sel(6),
      I2 => sel(4),
      I3 => \p_0_out_inferred__0/product10_i_329_n_0\,
      I4 => sel(5),
      I5 => sel(11),
      O => \p_0_out_inferred__0/product10_i_156_n_0\
    );
\p_0_out_inferred__0/product10_i_157\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"555EAAAA"
    )
        port map (
      I0 => sel(11),
      I1 => sel(0),
      I2 => sel(2),
      I3 => sel(1),
      I4 => sel(3),
      O => \p_0_out_inferred__0/product10_i_157_n_0\
    );
\p_0_out_inferred__0/product10_i_158\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3B38CCCCCBC83333"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_329_n_0\,
      I1 => sel(6),
      I2 => sel(4),
      I3 => \p_0_out_inferred__0/product10_i_352_n_0\,
      I4 => sel(5),
      I5 => sel(11),
      O => \p_0_out_inferred__0/product10_i_158_n_0\
    );
\p_0_out_inferred__0/product10_i_159\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FAAAAAAA04555555"
    )
        port map (
      I0 => sel(6),
      I1 => \p_0_out_inferred__0/product10_i_353_n_0\,
      I2 => sel(3),
      I3 => sel(4),
      I4 => sel(5),
      I5 => sel(11),
      O => \p_0_out_inferred__0/product10_i_159_n_0\
    );
\p_0_out_inferred__0/product10_i_16\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_46_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_47_n_0\,
      O => \p_0_out_inferred__0/product10_i_16_n_0\,
      S => sel(10)
    );
\p_0_out_inferred__0/product10_i_160\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_354_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_355_n_0\,
      I2 => sel(6),
      I3 => sel(11),
      I4 => sel(5),
      I5 => \p_0_out_inferred__0/product10_i_356_n_0\,
      O => \p_0_out_inferred__0/product10_i_160_n_0\
    );
\p_0_out_inferred__0/product10_i_161\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_357_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_358_n_0\,
      I2 => sel(6),
      I3 => \p_0_out_inferred__0/product10_i_131_n_0\,
      I4 => sel(5),
      I5 => \p_0_out_inferred__0/product10_i_359_n_0\,
      O => \p_0_out_inferred__0/product10_i_161_n_0\
    );
\p_0_out_inferred__0/product10_i_162\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FFFF1555AAAA"
    )
        port map (
      I0 => sel(4),
      I1 => sel(0),
      I2 => sel(1),
      I3 => sel(2),
      I4 => sel(11),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_162_n_0\
    );
\p_0_out_inferred__0/product10_i_163\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCCCCCDC9C9"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(2),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_163_n_0\
    );
\p_0_out_inferred__0/product10_i_164\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_360_n_0\,
      I1 => sel(6),
      I2 => \p_0_out_inferred__0/product10_i_361_n_0\,
      I3 => sel(5),
      I4 => \p_0_out_inferred__0/product10_i_362_n_0\,
      O => \p_0_out_inferred__0/product10_i_164_n_0\
    );
\p_0_out_inferred__0/product10_i_165\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_363_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_364_n_0\,
      I2 => sel(6),
      I3 => \p_0_out_inferred__0/product10_i_339_n_0\,
      I4 => sel(5),
      I5 => \p_0_out_inferred__0/product10_i_365_n_0\,
      O => \p_0_out_inferred__0/product10_i_165_n_0\
    );
\p_0_out_inferred__0/product10_i_166\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_366_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_342_n_0\,
      I2 => sel(6),
      I3 => \p_0_out_inferred__0/product10_i_367_n_0\,
      I4 => sel(5),
      I5 => \p_0_out_inferred__0/product10_i_368_n_0\,
      O => \p_0_out_inferred__0/product10_i_166_n_0\
    );
\p_0_out_inferred__0/product10_i_167\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8CCB833B833B8CC"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_369_n_0\,
      I1 => sel(6),
      I2 => \p_0_out_inferred__0/product10_i_370_n_0\,
      I3 => sel(5),
      I4 => sel(4),
      I5 => sel(11),
      O => \p_0_out_inferred__0/product10_i_167_n_0\
    );
\p_0_out_inferred__0/product10_i_168\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_346_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_371_n_0\,
      I2 => sel(6),
      I3 => \p_0_out_inferred__0/product10_i_372_n_0\,
      I4 => sel(5),
      I5 => \p_0_out_inferred__0/product10_i_373_n_0\,
      O => \p_0_out_inferred__0/product10_i_168_n_0\
    );
\p_0_out_inferred__0/product10_i_169\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_374_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_375_n_0\,
      I2 => sel(6),
      I3 => \p_0_out_inferred__0/product10_i_338_n_0\,
      I4 => sel(5),
      I5 => \p_0_out_inferred__0/product10_i_376_n_0\,
      O => \p_0_out_inferred__0/product10_i_169_n_0\
    );
\p_0_out_inferred__0/product10_i_17\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_48_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_49_n_0\,
      O => \p_0_out_inferred__0/product10_i_17_n_0\,
      S => sel(10)
    );
\p_0_out_inferred__0/product10_i_170\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_377_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_350_n_0\,
      I2 => sel(6),
      I3 => \p_0_out_inferred__0/product10_i_378_n_0\,
      I4 => sel(5),
      I5 => \p_0_out_inferred__0/product10_i_331_n_0\,
      O => \p_0_out_inferred__0/product10_i_170_n_0\
    );
\p_0_out_inferred__0/product10_i_171\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_379_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_380_n_0\,
      I2 => sel(6),
      I3 => \p_0_out_inferred__0/product10_i_381_n_0\,
      I4 => sel(5),
      I5 => \p_0_out_inferred__0/product10_i_382_n_0\,
      O => \p_0_out_inferred__0/product10_i_171_n_0\
    );
\p_0_out_inferred__0/product10_i_172\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFFC0000000"
    )
        port map (
      I0 => sel(0),
      I1 => sel(1),
      I2 => sel(2),
      I3 => sel(3),
      I4 => sel(4),
      I5 => sel(11),
      O => \p_0_out_inferred__0/product10_i_172_n_0\
    );
\p_0_out_inferred__0/product10_i_173\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FC00000001FFFFFF"
    )
        port map (
      I0 => sel(0),
      I1 => sel(1),
      I2 => sel(2),
      I3 => sel(3),
      I4 => sel(4),
      I5 => sel(11),
      O => \p_0_out_inferred__0/product10_i_173_n_0\
    );
\p_0_out_inferred__0/product10_i_174\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_383_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_132_n_0\,
      I2 => sel(6),
      I3 => \p_0_out_inferred__0/product10_i_384_n_0\,
      I4 => sel(5),
      I5 => \p_0_out_inferred__0/product10_i_385_n_0\,
      O => \p_0_out_inferred__0/product10_i_174_n_0\
    );
\p_0_out_inferred__0/product10_i_175\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_386_n_0\,
      I1 => sel(11),
      I2 => sel(6),
      I3 => \p_0_out_inferred__0/product10_i_387_n_0\,
      I4 => sel(5),
      I5 => \p_0_out_inferred__0/product10_i_388_n_0\,
      O => \p_0_out_inferred__0/product10_i_175_n_0\
    );
\p_0_out_inferred__0/product10_i_176\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_389_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_390_n_0\,
      O => \p_0_out_inferred__0/product10_i_176_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_177\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_391_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_392_n_0\,
      O => \p_0_out_inferred__0/product10_i_177_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_178\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_393_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_394_n_0\,
      O => \p_0_out_inferred__0/product10_i_178_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_179\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_395_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_396_n_0\,
      O => \p_0_out_inferred__0/product10_i_179_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_18\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_50_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_51_n_0\,
      O => \p_0_out_inferred__0/product10_i_18_n_0\,
      S => sel(10)
    );
\p_0_out_inferred__0/product10_i_180\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_397_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_398_n_0\,
      O => \p_0_out_inferred__0/product10_i_180_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_181\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_399_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_400_n_0\,
      O => \p_0_out_inferred__0/product10_i_181_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_182\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_401_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_402_n_0\,
      O => \p_0_out_inferred__0/product10_i_182_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_183\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_403_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_404_n_0\,
      O => \p_0_out_inferred__0/product10_i_183_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_184\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => sel(2),
      I1 => sel(1),
      O => \p_0_out_inferred__0/product10_i_184_n_0\
    );
\p_0_out_inferred__0/product10_i_185\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"800000003FFFFFFF"
    )
        port map (
      I0 => sel(0),
      I1 => sel(2),
      I2 => sel(1),
      I3 => sel(3),
      I4 => sel(4),
      I5 => sel(11),
      O => \p_0_out_inferred__0/product10_i_185_n_0\
    );
\p_0_out_inferred__0/product10_i_186\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"03FFFFFFFE000000"
    )
        port map (
      I0 => sel(0),
      I1 => sel(2),
      I2 => sel(1),
      I3 => sel(3),
      I4 => sel(4),
      I5 => sel(11),
      O => \p_0_out_inferred__0/product10_i_186_n_0\
    );
\p_0_out_inferred__0/product10_i_187\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_405_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_406_n_0\,
      O => \p_0_out_inferred__0/product10_i_187_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_188\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_407_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_408_n_0\,
      O => \p_0_out_inferred__0/product10_i_188_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_189\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_409_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_410_n_0\,
      O => \p_0_out_inferred__0/product10_i_189_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_19\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_52_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_53_n_0\,
      O => \p_0_out_inferred__0/product10_i_19_n_0\,
      S => sel(10)
    );
\p_0_out_inferred__0/product10_i_190\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_411_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_412_n_0\,
      O => \p_0_out_inferred__0/product10_i_190_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_191\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_413_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_414_n_0\,
      O => \p_0_out_inferred__0/product10_i_191_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_192\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_415_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_416_n_0\,
      O => \p_0_out_inferred__0/product10_i_192_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_193\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_417_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_418_n_0\,
      O => \p_0_out_inferred__0/product10_i_193_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_194\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_419_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_420_n_0\,
      O => \p_0_out_inferred__0/product10_i_194_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_195\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF0000EAAA5555"
    )
        port map (
      I0 => sel(4),
      I1 => sel(0),
      I2 => sel(2),
      I3 => sel(1),
      I4 => sel(11),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_195_n_0\
    );
\p_0_out_inferred__0/product10_i_196\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3333333333323636"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(2),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_196_n_0\
    );
\p_0_out_inferred__0/product10_i_197\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => sel(0),
      I1 => sel(2),
      I2 => sel(1),
      I3 => sel(3),
      O => \p_0_out_inferred__0/product10_i_197_n_0\
    );
\p_0_out_inferred__0/product10_i_198\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0015"
    )
        port map (
      I0 => sel(2),
      I1 => sel(0),
      I2 => sel(1),
      I3 => sel(3),
      O => \p_0_out_inferred__0/product10_i_198_n_0\
    );
\p_0_out_inferred__0/product10_i_199\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_421_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_422_n_0\,
      O => \p_0_out_inferred__0/product10_i_199_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E04F0FFFE04F00F0"
    )
        port map (
      I0 => sel(8),
      I1 => \p_0_out_inferred__0/product10_i_14_n_0\,
      I2 => sel(9),
      I3 => sel(11),
      I4 => sel(10),
      I5 => \p_0_out_inferred__0/product10_i_15_n_0\,
      O => p_0_out(10)
    );
\p_0_out_inferred__0/product10_i_20\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_54_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_55_n_0\,
      I2 => sel(10),
      I3 => \p_0_out_inferred__0/product10_i_56_n_0\,
      I4 => sel(8),
      I5 => \p_0_out_inferred__0/product10_i_57_n_0\,
      O => \p_0_out_inferred__0/product10_i_20_n_0\
    );
\p_0_out_inferred__0/product10_i_200\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_423_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_424_n_0\,
      O => \p_0_out_inferred__0/product10_i_200_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_201\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_425_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_426_n_0\,
      O => \p_0_out_inferred__0/product10_i_201_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_202\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_427_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_428_n_0\,
      O => \p_0_out_inferred__0/product10_i_202_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_203\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_429_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_430_n_0\,
      O => \p_0_out_inferred__0/product10_i_203_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_204\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_431_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_432_n_0\,
      O => \p_0_out_inferred__0/product10_i_204_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_205\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"694B4BD2D29696B4"
    )
        port map (
      I0 => sel(5),
      I1 => sel(4),
      I2 => sel(11),
      I3 => sel(1),
      I4 => sel(2),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_205_n_0\
    );
\p_0_out_inferred__0/product10_i_206\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_433_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_434_n_0\,
      O => \p_0_out_inferred__0/product10_i_206_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_207\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_435_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_436_n_0\,
      O => \p_0_out_inferred__0/product10_i_207_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_208\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_437_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_438_n_0\,
      O => \p_0_out_inferred__0/product10_i_208_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_209\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6969666676969699"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_209_n_0\
    );
\p_0_out_inferred__0/product10_i_21\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_58_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_59_n_0\,
      I2 => sel(10),
      I3 => \p_0_out_inferred__0/product10_i_60_n_0\,
      I4 => sel(8),
      I5 => \p_0_out_inferred__0/product10_i_61_n_0\,
      O => \p_0_out_inferred__0/product10_i_21_n_0\
    );
\p_0_out_inferred__0/product10_i_210\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"696A666696969699"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_210_n_0\
    );
\p_0_out_inferred__0/product10_i_211\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"669949666666996C"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(0),
      I3 => sel(3),
      I4 => sel(2),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_211_n_0\
    );
\p_0_out_inferred__0/product10_i_212\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_439_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_440_n_0\,
      O => \p_0_out_inferred__0/product10_i_212_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_213\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_441_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_442_n_0\,
      O => \p_0_out_inferred__0/product10_i_213_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_214\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_443_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_444_n_0\,
      O => \p_0_out_inferred__0/product10_i_214_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_215\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_445_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_446_n_0\,
      O => \p_0_out_inferred__0/product10_i_215_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_216\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => sel(2),
      I1 => sel(1),
      I2 => sel(3),
      O => \p_0_out_inferred__0/product10_i_216_n_0\
    );
\p_0_out_inferred__0/product10_i_217\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_447_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_448_n_0\,
      O => \p_0_out_inferred__0/product10_i_217_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_218\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_449_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_450_n_0\,
      O => \p_0_out_inferred__0/product10_i_218_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_219\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_451_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_452_n_0\,
      O => \p_0_out_inferred__0/product10_i_219_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_22\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_62_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_63_n_0\,
      I2 => sel(10),
      I3 => \p_0_out_inferred__0/product10_i_64_n_0\,
      I4 => sel(8),
      I5 => \p_0_out_inferred__0/product10_i_65_n_0\,
      O => \p_0_out_inferred__0/product10_i_22_n_0\
    );
\p_0_out_inferred__0/product10_i_220\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_453_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_454_n_0\,
      O => \p_0_out_inferred__0/product10_i_220_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_221\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_455_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_456_n_0\,
      O => \p_0_out_inferred__0/product10_i_221_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_222\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_457_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_458_n_0\,
      O => \p_0_out_inferred__0/product10_i_222_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_223\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_459_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_460_n_0\,
      O => \p_0_out_inferred__0/product10_i_223_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_224\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_461_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_462_n_0\,
      O => \p_0_out_inferred__0/product10_i_224_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_225\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_463_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_464_n_0\,
      O => \p_0_out_inferred__0/product10_i_225_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_226\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_465_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_466_n_0\,
      O => \p_0_out_inferred__0/product10_i_226_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_227\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_467_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_468_n_0\,
      O => \p_0_out_inferred__0/product10_i_227_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_228\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_469_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_470_n_0\,
      O => \p_0_out_inferred__0/product10_i_228_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_229\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_471_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_472_n_0\,
      O => \p_0_out_inferred__0/product10_i_229_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_23\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_66_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_67_n_0\,
      I2 => sel(10),
      I3 => \p_0_out_inferred__0/product10_i_68_n_0\,
      I4 => sel(8),
      I5 => \p_0_out_inferred__0/product10_i_69_n_0\,
      O => \p_0_out_inferred__0/product10_i_23_n_0\
    );
\p_0_out_inferred__0/product10_i_230\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_473_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_474_n_0\,
      O => \p_0_out_inferred__0/product10_i_230_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_231\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_475_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_476_n_0\,
      O => \p_0_out_inferred__0/product10_i_231_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_232\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_477_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_478_n_0\,
      O => \p_0_out_inferred__0/product10_i_232_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_233\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_479_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_480_n_0\,
      O => \p_0_out_inferred__0/product10_i_233_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_234\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9696989999696969"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_234_n_0\
    );
\p_0_out_inferred__0/product10_i_235\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9696969999596969"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_235_n_0\
    );
\p_0_out_inferred__0/product10_i_236\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"96969B999969696C"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_236_n_0\
    );
\p_0_out_inferred__0/product10_i_237\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_481_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_482_n_0\,
      O => \p_0_out_inferred__0/product10_i_237_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_238\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_483_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_484_n_0\,
      O => \p_0_out_inferred__0/product10_i_238_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_239\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_485_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_486_n_0\,
      O => \p_0_out_inferred__0/product10_i_239_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_24\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_70_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_71_n_0\,
      I2 => sel(8),
      I3 => \p_0_out_inferred__0/product10_i_72_n_0\,
      I4 => sel(7),
      I5 => \p_0_out_inferred__0/product10_i_73_n_0\,
      O => \p_0_out_inferred__0/product10_i_24_n_0\
    );
\p_0_out_inferred__0/product10_i_240\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_487_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_488_n_0\,
      O => \p_0_out_inferred__0/product10_i_240_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_241\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C32DC3C33CC33CBC"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(2),
      I4 => sel(0),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_241_n_0\
    );
\p_0_out_inferred__0/product10_i_242\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C3D03C3CC3C3C33C"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_242_n_0\
    );
\p_0_out_inferred__0/product10_i_243\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"9C669996"
    )
        port map (
      I0 => sel(11),
      I1 => sel(3),
      I2 => sel(0),
      I3 => sel(1),
      I4 => sel(2),
      O => \p_0_out_inferred__0/product10_i_243_n_0\
    );
\p_0_out_inferred__0/product10_i_244\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C3E33C3C1EC3C379"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_244_n_0\
    );
\p_0_out_inferred__0/product10_i_245\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_489_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_490_n_0\,
      O => \p_0_out_inferred__0/product10_i_245_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_246\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_491_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_492_n_0\,
      O => \p_0_out_inferred__0/product10_i_246_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_247\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_493_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_494_n_0\,
      O => \p_0_out_inferred__0/product10_i_247_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_248\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_495_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_496_n_0\,
      O => \p_0_out_inferred__0/product10_i_248_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_249\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3377377666666666"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(0),
      I3 => sel(2),
      I4 => sel(1),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_249_n_0\
    );
\p_0_out_inferred__0/product10_i_25\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_74_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_75_n_0\,
      I2 => sel(8),
      I3 => \p_0_out_inferred__0/product10_i_76_n_0\,
      I4 => sel(7),
      I5 => \p_0_out_inferred__0/product10_i_77_n_0\,
      O => \p_0_out_inferred__0/product10_i_25_n_0\
    );
\p_0_out_inferred__0/product10_i_250\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFEA00000000FFFF"
    )
        port map (
      I0 => sel(3),
      I1 => sel(1),
      I2 => sel(0),
      I3 => sel(2),
      I4 => sel(4),
      I5 => sel(11),
      O => \p_0_out_inferred__0/product10_i_250_n_0\
    );
\p_0_out_inferred__0/product10_i_251\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A999999D"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(2),
      I3 => sel(1),
      I4 => sel(3),
      O => \p_0_out_inferred__0/product10_i_251_n_0\
    );
\p_0_out_inferred__0/product10_i_252\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_497_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_498_n_0\,
      O => \p_0_out_inferred__0/product10_i_252_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_253\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_499_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_500_n_0\,
      O => \p_0_out_inferred__0/product10_i_253_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_254\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_501_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_502_n_0\,
      O => \p_0_out_inferred__0/product10_i_254_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_255\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_503_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_504_n_0\,
      O => \p_0_out_inferred__0/product10_i_255_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_256\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_505_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_506_n_0\,
      O => \p_0_out_inferred__0/product10_i_256_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_257\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_507_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_508_n_0\,
      O => \p_0_out_inferred__0/product10_i_257_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_258\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_509_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_510_n_0\,
      O => \p_0_out_inferred__0/product10_i_258_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_259\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_511_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_512_n_0\,
      O => \p_0_out_inferred__0/product10_i_259_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_26\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_78_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_79_n_0\,
      I2 => sel(8),
      I3 => \p_0_out_inferred__0/product10_i_80_n_0\,
      I4 => sel(7),
      I5 => \p_0_out_inferred__0/product10_i_81_n_0\,
      O => \p_0_out_inferred__0/product10_i_26_n_0\
    );
\p_0_out_inferred__0/product10_i_260\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_513_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_514_n_0\,
      O => \p_0_out_inferred__0/product10_i_260_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_261\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"E0003FFF"
    )
        port map (
      I0 => sel(2),
      I1 => sel(3),
      I2 => sel(4),
      I3 => sel(5),
      I4 => sel(11),
      O => \p_0_out_inferred__0/product10_i_261_n_0\
    );
\p_0_out_inferred__0/product10_i_262\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_515_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_516_n_0\,
      O => \p_0_out_inferred__0/product10_i_262_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_263\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_517_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_518_n_0\,
      O => \p_0_out_inferred__0/product10_i_263_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_264\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_519_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_520_n_0\,
      O => \p_0_out_inferred__0/product10_i_264_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_265\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_521_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_522_n_0\,
      O => \p_0_out_inferred__0/product10_i_265_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_266\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_523_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_524_n_0\,
      O => \p_0_out_inferred__0/product10_i_266_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_267\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_525_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_526_n_0\,
      O => \p_0_out_inferred__0/product10_i_267_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_268\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_527_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_528_n_0\,
      O => \p_0_out_inferred__0/product10_i_268_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_269\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_529_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_530_n_0\,
      O => \p_0_out_inferred__0/product10_i_269_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_27\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_82_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_83_n_0\,
      O => \p_0_out_inferred__0/product10_i_27_n_0\,
      S => sel(8)
    );
\p_0_out_inferred__0/product10_i_270\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3C3CD2C3C33D3CBC"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_270_n_0\
    );
\p_0_out_inferred__0/product10_i_271\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"66699366"
    )
        port map (
      I0 => sel(11),
      I1 => sel(3),
      I2 => sel(0),
      I3 => sel(1),
      I4 => sel(2),
      O => \p_0_out_inferred__0/product10_i_271_n_0\
    );
\p_0_out_inferred__0/product10_i_272\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3C3CC30E3CC33C3C"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(2),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_272_n_0\
    );
\p_0_out_inferred__0/product10_i_273\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3CC33C3CE13CC379"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(2),
      I4 => sel(0),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_273_n_0\
    );
\p_0_out_inferred__0/product10_i_274\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_531_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_532_n_0\,
      O => \p_0_out_inferred__0/product10_i_274_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_275\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_533_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_534_n_0\,
      O => \p_0_out_inferred__0/product10_i_275_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_276\: unisim.vcomponents.MUXF8
     port map (
      I0 => \p_0_out_inferred__0/product10_i_535_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_536_n_0\,
      O => \p_0_out_inferred__0/product10_i_276_n_0\,
      S => sel(6)
    );
\p_0_out_inferred__0/product10_i_277\: unisim.vcomponents.MUXF8
     port map (
      I0 => \p_0_out_inferred__0/product10_i_537_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_538_n_0\,
      O => \p_0_out_inferred__0/product10_i_277_n_0\,
      S => sel(6)
    );
\p_0_out_inferred__0/product10_i_278\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_539_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_540_n_0\,
      I2 => sel(6),
      I3 => \p_0_out_inferred__0/product10_i_541_n_0\,
      I4 => sel(5),
      I5 => \p_0_out_inferred__0/product10_i_542_n_0\,
      O => \p_0_out_inferred__0/product10_i_278_n_0\
    );
\p_0_out_inferred__0/product10_i_279\: unisim.vcomponents.MUXF8
     port map (
      I0 => \p_0_out_inferred__0/product10_i_543_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_544_n_0\,
      O => \p_0_out_inferred__0/product10_i_279_n_0\,
      S => sel(6)
    );
\p_0_out_inferred__0/product10_i_28\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_84_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_85_n_0\,
      I2 => sel(8),
      I3 => \p_0_out_inferred__0/product10_i_86_n_0\,
      I4 => sel(7),
      I5 => \p_0_out_inferred__0/product10_i_87_n_0\,
      O => \p_0_out_inferred__0/product10_i_28_n_0\
    );
\p_0_out_inferred__0/product10_i_280\: unisim.vcomponents.MUXF8
     port map (
      I0 => \p_0_out_inferred__0/product10_i_545_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_546_n_0\,
      O => \p_0_out_inferred__0/product10_i_280_n_0\,
      S => sel(6)
    );
\p_0_out_inferred__0/product10_i_281\: unisim.vcomponents.MUXF8
     port map (
      I0 => \p_0_out_inferred__0/product10_i_547_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_548_n_0\,
      O => \p_0_out_inferred__0/product10_i_281_n_0\,
      S => sel(6)
    );
\p_0_out_inferred__0/product10_i_282\: unisim.vcomponents.MUXF8
     port map (
      I0 => \p_0_out_inferred__0/product10_i_549_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_550_n_0\,
      O => \p_0_out_inferred__0/product10_i_282_n_0\,
      S => sel(6)
    );
\p_0_out_inferred__0/product10_i_283\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0C0C0AFA0CFCF"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_551_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_552_n_0\,
      I2 => sel(6),
      I3 => \p_0_out_inferred__0/product10_i_553_n_0\,
      I4 => sel(5),
      I5 => sel(11),
      O => \p_0_out_inferred__0/product10_i_283_n_0\
    );
\p_0_out_inferred__0/product10_i_284\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5F50CFCF5F50C0C0"
    )
        port map (
      I0 => sel(11),
      I1 => \p_0_out_inferred__0/product10_i_554_n_0\,
      I2 => sel(6),
      I3 => \p_0_out_inferred__0/product10_i_555_n_0\,
      I4 => sel(5),
      I5 => \p_0_out_inferred__0/product10_i_556_n_0\,
      O => \p_0_out_inferred__0/product10_i_284_n_0\
    );
\p_0_out_inferred__0/product10_i_285\: unisim.vcomponents.MUXF8
     port map (
      I0 => \p_0_out_inferred__0/product10_i_557_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_558_n_0\,
      O => \p_0_out_inferred__0/product10_i_285_n_0\,
      S => sel(6)
    );
\p_0_out_inferred__0/product10_i_286\: unisim.vcomponents.MUXF8
     port map (
      I0 => \p_0_out_inferred__0/product10_i_559_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_560_n_0\,
      O => \p_0_out_inferred__0/product10_i_286_n_0\,
      S => sel(6)
    );
\p_0_out_inferred__0/product10_i_287\: unisim.vcomponents.MUXF8
     port map (
      I0 => \p_0_out_inferred__0/product10_i_561_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_562_n_0\,
      O => \p_0_out_inferred__0/product10_i_287_n_0\,
      S => sel(6)
    );
\p_0_out_inferred__0/product10_i_288\: unisim.vcomponents.MUXF8
     port map (
      I0 => \p_0_out_inferred__0/product10_i_563_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_564_n_0\,
      O => \p_0_out_inferred__0/product10_i_288_n_0\,
      S => sel(6)
    );
\p_0_out_inferred__0/product10_i_289\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_565_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_566_n_0\,
      I2 => sel(6),
      I3 => \p_0_out_inferred__0/product10_i_567_n_0\,
      I4 => sel(5),
      I5 => \p_0_out_inferred__0/product10_i_568_n_0\,
      O => \p_0_out_inferred__0/product10_i_289_n_0\
    );
\p_0_out_inferred__0/product10_i_29\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_88_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_89_n_0\,
      I2 => sel(8),
      I3 => \p_0_out_inferred__0/product10_i_90_n_0\,
      I4 => sel(7),
      I5 => \p_0_out_inferred__0/product10_i_91_n_0\,
      O => \p_0_out_inferred__0/product10_i_29_n_0\
    );
\p_0_out_inferred__0/product10_i_290\: unisim.vcomponents.MUXF8
     port map (
      I0 => \p_0_out_inferred__0/product10_i_569_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_570_n_0\,
      O => \p_0_out_inferred__0/product10_i_290_n_0\,
      S => sel(6)
    );
\p_0_out_inferred__0/product10_i_291\: unisim.vcomponents.MUXF8
     port map (
      I0 => \p_0_out_inferred__0/product10_i_571_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_572_n_0\,
      O => \p_0_out_inferred__0/product10_i_291_n_0\,
      S => sel(6)
    );
\p_0_out_inferred__0/product10_i_292\: unisim.vcomponents.MUXF8
     port map (
      I0 => \p_0_out_inferred__0/product10_i_573_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_574_n_0\,
      O => \p_0_out_inferred__0/product10_i_292_n_0\,
      S => sel(6)
    );
\p_0_out_inferred__0/product10_i_293\: unisim.vcomponents.MUXF8
     port map (
      I0 => \p_0_out_inferred__0/product10_i_575_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_576_n_0\,
      O => \p_0_out_inferred__0/product10_i_293_n_0\,
      S => sel(6)
    );
\p_0_out_inferred__0/product10_i_294\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_577_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_578_n_0\,
      I2 => sel(6),
      I3 => \p_0_out_inferred__0/product10_i_579_n_0\,
      I4 => sel(5),
      I5 => \p_0_out_inferred__0/product10_i_580_n_0\,
      O => \p_0_out_inferred__0/product10_i_294_n_0\
    );
\p_0_out_inferred__0/product10_i_295\: unisim.vcomponents.MUXF8
     port map (
      I0 => \p_0_out_inferred__0/product10_i_581_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_582_n_0\,
      O => \p_0_out_inferred__0/product10_i_295_n_0\,
      S => sel(6)
    );
\p_0_out_inferred__0/product10_i_296\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_583_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_584_n_0\,
      I2 => sel(6),
      I3 => \p_0_out_inferred__0/product10_i_585_n_0\,
      I4 => sel(5),
      I5 => \p_0_out_inferred__0/product10_i_586_n_0\,
      O => \p_0_out_inferred__0/product10_i_296_n_0\
    );
\p_0_out_inferred__0/product10_i_297\: unisim.vcomponents.MUXF8
     port map (
      I0 => \p_0_out_inferred__0/product10_i_587_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_588_n_0\,
      O => \p_0_out_inferred__0/product10_i_297_n_0\,
      S => sel(6)
    );
\p_0_out_inferred__0/product10_i_298\: unisim.vcomponents.MUXF8
     port map (
      I0 => \p_0_out_inferred__0/product10_i_589_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_590_n_0\,
      O => \p_0_out_inferred__0/product10_i_298_n_0\,
      S => sel(6)
    );
\p_0_out_inferred__0/product10_i_299\: unisim.vcomponents.MUXF8
     port map (
      I0 => \p_0_out_inferred__0/product10_i_591_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_592_n_0\,
      O => \p_0_out_inferred__0/product10_i_299_n_0\,
      S => sel(6)
    );
\p_0_out_inferred__0/product10_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E4"
    )
        port map (
      I0 => sel(9),
      I1 => \p_0_out_inferred__0/product10_i_16_n_0\,
      I2 => \p_0_out_inferred__0/product10_i_17_n_0\,
      O => p_0_out(9)
    );
\p_0_out_inferred__0/product10_i_30\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_92_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_93_n_0\,
      O => \p_0_out_inferred__0/product10_i_30_n_0\,
      S => sel(8)
    );
\p_0_out_inferred__0/product10_i_300\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_593_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_594_n_0\,
      I2 => sel(6),
      I3 => \p_0_out_inferred__0/product10_i_595_n_0\,
      I4 => sel(5),
      I5 => \p_0_out_inferred__0/product10_i_596_n_0\,
      O => \p_0_out_inferred__0/product10_i_300_n_0\
    );
\p_0_out_inferred__0/product10_i_301\: unisim.vcomponents.MUXF8
     port map (
      I0 => \p_0_out_inferred__0/product10_i_597_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_598_n_0\,
      O => \p_0_out_inferred__0/product10_i_301_n_0\,
      S => sel(6)
    );
\p_0_out_inferred__0/product10_i_302\: unisim.vcomponents.MUXF8
     port map (
      I0 => \p_0_out_inferred__0/product10_i_599_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_600_n_0\,
      O => \p_0_out_inferred__0/product10_i_302_n_0\,
      S => sel(6)
    );
\p_0_out_inferred__0/product10_i_303\: unisim.vcomponents.MUXF8
     port map (
      I0 => \p_0_out_inferred__0/product10_i_601_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_602_n_0\,
      O => \p_0_out_inferred__0/product10_i_303_n_0\,
      S => sel(6)
    );
\p_0_out_inferred__0/product10_i_304\: unisim.vcomponents.MUXF8
     port map (
      I0 => \p_0_out_inferred__0/product10_i_603_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_604_n_0\,
      O => \p_0_out_inferred__0/product10_i_304_n_0\,
      S => sel(6)
    );
\p_0_out_inferred__0/product10_i_305\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_605_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_606_n_0\,
      I2 => sel(6),
      I3 => \p_0_out_inferred__0/product10_i_607_n_0\,
      I4 => sel(5),
      I5 => \p_0_out_inferred__0/product10_i_608_n_0\,
      O => \p_0_out_inferred__0/product10_i_305_n_0\
    );
\p_0_out_inferred__0/product10_i_306\: unisim.vcomponents.MUXF8
     port map (
      I0 => \p_0_out_inferred__0/product10_i_609_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_610_n_0\,
      O => \p_0_out_inferred__0/product10_i_306_n_0\,
      S => sel(6)
    );
\p_0_out_inferred__0/product10_i_307\: unisim.vcomponents.MUXF8
     port map (
      I0 => \p_0_out_inferred__0/product10_i_611_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_612_n_0\,
      O => \p_0_out_inferred__0/product10_i_307_n_0\,
      S => sel(6)
    );
\p_0_out_inferred__0/product10_i_308\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_613_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_614_n_0\,
      O => \p_0_out_inferred__0/product10_i_308_n_0\,
      S => sel(6)
    );
\p_0_out_inferred__0/product10_i_309\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_615_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_616_n_0\,
      O => \p_0_out_inferred__0/product10_i_309_n_0\,
      S => sel(6)
    );
\p_0_out_inferred__0/product10_i_31\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_94_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_95_n_0\,
      I2 => sel(8),
      I3 => \p_0_out_inferred__0/product10_i_96_n_0\,
      I4 => sel(7),
      I5 => \p_0_out_inferred__0/product10_i_97_n_0\,
      O => \p_0_out_inferred__0/product10_i_31_n_0\
    );
\p_0_out_inferred__0/product10_i_310\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_617_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_618_n_0\,
      O => \p_0_out_inferred__0/product10_i_310_n_0\,
      S => sel(6)
    );
\p_0_out_inferred__0/product10_i_311\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_619_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_620_n_0\,
      O => \p_0_out_inferred__0/product10_i_311_n_0\,
      S => sel(6)
    );
\p_0_out_inferred__0/product10_i_312\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_621_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_622_n_0\,
      O => \p_0_out_inferred__0/product10_i_312_n_0\,
      S => sel(6)
    );
\p_0_out_inferred__0/product10_i_313\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_623_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_624_n_0\,
      O => \p_0_out_inferred__0/product10_i_313_n_0\,
      S => sel(6)
    );
\p_0_out_inferred__0/product10_i_314\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_625_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_626_n_0\,
      O => \p_0_out_inferred__0/product10_i_314_n_0\,
      S => sel(6)
    );
\p_0_out_inferred__0/product10_i_315\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_627_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_628_n_0\,
      O => \p_0_out_inferred__0/product10_i_315_n_0\,
      S => sel(6)
    );
\p_0_out_inferred__0/product10_i_316\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_629_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_630_n_0\,
      O => \p_0_out_inferred__0/product10_i_316_n_0\,
      S => sel(6)
    );
\p_0_out_inferred__0/product10_i_317\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_631_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_632_n_0\,
      O => \p_0_out_inferred__0/product10_i_317_n_0\,
      S => sel(6)
    );
\p_0_out_inferred__0/product10_i_318\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_633_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_634_n_0\,
      O => \p_0_out_inferred__0/product10_i_318_n_0\,
      S => sel(6)
    );
\p_0_out_inferred__0/product10_i_319\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_635_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_636_n_0\,
      O => \p_0_out_inferred__0/product10_i_319_n_0\,
      S => sel(6)
    );
\p_0_out_inferred__0/product10_i_32\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_98_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_99_n_0\,
      I2 => sel(8),
      I3 => \p_0_out_inferred__0/product10_i_100_n_0\,
      I4 => sel(7),
      I5 => \p_0_out_inferred__0/product10_i_101_n_0\,
      O => \p_0_out_inferred__0/product10_i_32_n_0\
    );
\p_0_out_inferred__0/product10_i_320\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_637_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_638_n_0\,
      O => \p_0_out_inferred__0/product10_i_320_n_0\,
      S => sel(6)
    );
\p_0_out_inferred__0/product10_i_321\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_639_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_640_n_0\,
      O => \p_0_out_inferred__0/product10_i_321_n_0\,
      S => sel(6)
    );
\p_0_out_inferred__0/product10_i_322\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_641_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_642_n_0\,
      O => \p_0_out_inferred__0/product10_i_322_n_0\,
      S => sel(6)
    );
\p_0_out_inferred__0/product10_i_323\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_643_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_644_n_0\,
      O => \p_0_out_inferred__0/product10_i_323_n_0\,
      S => sel(6)
    );
\p_0_out_inferred__0/product10_i_324\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"55555A6A"
    )
        port map (
      I0 => sel(11),
      I1 => sel(1),
      I2 => sel(2),
      I3 => sel(0),
      I4 => sel(3),
      O => \p_0_out_inferred__0/product10_i_324_n_0\
    );
\p_0_out_inferred__0/product10_i_325\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"07"
    )
        port map (
      I0 => sel(1),
      I1 => sel(0),
      I2 => sel(2),
      O => \p_0_out_inferred__0/product10_i_325_n_0\
    );
\p_0_out_inferred__0/product10_i_326\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => sel(1),
      I1 => sel(0),
      I2 => sel(2),
      O => \p_0_out_inferred__0/product10_i_326_n_0\
    );
\p_0_out_inferred__0/product10_i_327\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"01FF"
    )
        port map (
      I0 => sel(0),
      I1 => sel(1),
      I2 => sel(2),
      I3 => sel(3),
      O => \p_0_out_inferred__0/product10_i_327_n_0\
    );
\p_0_out_inferred__0/product10_i_328\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FE00"
    )
        port map (
      I0 => sel(0),
      I1 => sel(2),
      I2 => sel(1),
      I3 => sel(3),
      O => \p_0_out_inferred__0/product10_i_328_n_0\
    );
\p_0_out_inferred__0/product10_i_329\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"5666AAAA"
    )
        port map (
      I0 => sel(11),
      I1 => sel(2),
      I2 => sel(0),
      I3 => sel(1),
      I4 => sel(3),
      O => \p_0_out_inferred__0/product10_i_329_n_0\
    );
\p_0_out_inferred__0/product10_i_33\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_102_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_103_n_0\,
      I2 => sel(8),
      I3 => \p_0_out_inferred__0/product10_i_104_n_0\,
      I4 => sel(7),
      I5 => \p_0_out_inferred__0/product10_i_105_n_0\,
      O => \p_0_out_inferred__0/product10_i_33_n_0\
    );
\p_0_out_inferred__0/product10_i_330\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAA9995"
    )
        port map (
      I0 => sel(11),
      I1 => sel(2),
      I2 => sel(1),
      I3 => sel(0),
      I4 => sel(3),
      O => \p_0_out_inferred__0/product10_i_330_n_0\
    );
\p_0_out_inferred__0/product10_i_331\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"01FFFE00"
    )
        port map (
      I0 => sel(1),
      I1 => sel(2),
      I2 => sel(3),
      I3 => sel(4),
      I4 => sel(11),
      O => \p_0_out_inferred__0/product10_i_331_n_0\
    );
\p_0_out_inferred__0/product10_i_332\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => sel(0),
      I1 => sel(2),
      I2 => sel(1),
      I3 => sel(3),
      O => \p_0_out_inferred__0/product10_i_332_n_0\
    );
\p_0_out_inferred__0/product10_i_333\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => sel(0),
      I1 => sel(1),
      I2 => sel(2),
      I3 => sel(3),
      O => \p_0_out_inferred__0/product10_i_333_n_0\
    );
\p_0_out_inferred__0/product10_i_335\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AA95"
    )
        port map (
      I0 => sel(11),
      I1 => sel(2),
      I2 => sel(1),
      I3 => sel(3),
      O => \p_0_out_inferred__0/product10_i_335_n_0\
    );
\p_0_out_inferred__0/product10_i_336\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E0"
    )
        port map (
      I0 => sel(1),
      I1 => sel(2),
      I2 => sel(3),
      O => \p_0_out_inferred__0/product10_i_336_n_0\
    );
\p_0_out_inferred__0/product10_i_337\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00FF7F00"
    )
        port map (
      I0 => sel(0),
      I1 => sel(1),
      I2 => sel(2),
      I3 => sel(11),
      I4 => sel(3),
      O => \p_0_out_inferred__0/product10_i_337_n_0\
    );
\p_0_out_inferred__0/product10_i_338\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3666666666666666"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(0),
      I3 => sel(2),
      I4 => sel(1),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_338_n_0\
    );
\p_0_out_inferred__0/product10_i_339\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FE00000001FFFFFF"
    )
        port map (
      I0 => sel(0),
      I1 => sel(1),
      I2 => sel(2),
      I3 => sel(3),
      I4 => sel(4),
      I5 => sel(11),
      O => \p_0_out_inferred__0/product10_i_339_n_0\
    );
\p_0_out_inferred__0/product10_i_34\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_106_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_107_n_0\,
      O => \p_0_out_inferred__0/product10_i_34_n_0\,
      S => sel(8)
    );
\p_0_out_inferred__0/product10_i_340\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"33333666"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(1),
      I3 => sel(2),
      I4 => sel(3),
      O => \p_0_out_inferred__0/product10_i_340_n_0\
    );
\p_0_out_inferred__0/product10_i_341\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"55FFFFFFEA000000"
    )
        port map (
      I0 => sel(2),
      I1 => sel(0),
      I2 => sel(1),
      I3 => sel(3),
      I4 => sel(4),
      I5 => sel(11),
      O => \p_0_out_inferred__0/product10_i_341_n_0\
    );
\p_0_out_inferred__0/product10_i_342\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FE0001FF"
    )
        port map (
      I0 => sel(2),
      I1 => sel(1),
      I2 => sel(3),
      I3 => sel(4),
      I4 => sel(11),
      O => \p_0_out_inferred__0/product10_i_342_n_0\
    );
\p_0_out_inferred__0/product10_i_343\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3333333666666666"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(0),
      I3 => sel(2),
      I4 => sel(1),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_343_n_0\
    );
\p_0_out_inferred__0/product10_i_344\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFE00000000"
    )
        port map (
      I0 => sel(4),
      I1 => sel(3),
      I2 => sel(1),
      I3 => sel(2),
      I4 => sel(0),
      I5 => sel(11),
      O => \p_0_out_inferred__0/product10_i_344_n_0\
    );
\p_0_out_inferred__0/product10_i_345\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"1555EAAA"
    )
        port map (
      I0 => sel(5),
      I1 => sel(2),
      I2 => sel(3),
      I3 => sel(4),
      I4 => sel(11),
      O => \p_0_out_inferred__0/product10_i_345_n_0\
    );
\p_0_out_inferred__0/product10_i_346\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFE00000001FFFF"
    )
        port map (
      I0 => sel(0),
      I1 => sel(1),
      I2 => sel(2),
      I3 => sel(3),
      I4 => sel(4),
      I5 => sel(11),
      O => \p_0_out_inferred__0/product10_i_346_n_0\
    );
\p_0_out_inferred__0/product10_i_347\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EA15"
    )
        port map (
      I0 => sel(5),
      I1 => sel(3),
      I2 => sel(4),
      I3 => sel(11),
      O => \p_0_out_inferred__0/product10_i_347_n_0\
    );
\p_0_out_inferred__0/product10_i_348\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F0F0F0A5E5A5"
    )
        port map (
      I0 => sel(4),
      I1 => sel(0),
      I2 => sel(11),
      I3 => sel(2),
      I4 => sel(1),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_348_n_0\
    );
\p_0_out_inferred__0/product10_i_349\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EA00000015FFFFFF"
    )
        port map (
      I0 => sel(2),
      I1 => sel(0),
      I2 => sel(1),
      I3 => sel(3),
      I4 => sel(4),
      I5 => sel(11),
      O => \p_0_out_inferred__0/product10_i_349_n_0\
    );
\p_0_out_inferred__0/product10_i_35\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_108_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_109_n_0\,
      I2 => sel(8),
      I3 => \p_0_out_inferred__0/product10_i_110_n_0\,
      I4 => sel(7),
      I5 => \p_0_out_inferred__0/product10_i_111_n_0\,
      O => \p_0_out_inferred__0/product10_i_35_n_0\
    );
\p_0_out_inferred__0/product10_i_350\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"36"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      O => \p_0_out_inferred__0/product10_i_350_n_0\
    );
\p_0_out_inferred__0/product10_i_351\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAA95555"
    )
        port map (
      I0 => sel(11),
      I1 => sel(0),
      I2 => sel(1),
      I3 => sel(2),
      I4 => sel(3),
      O => \p_0_out_inferred__0/product10_i_351_n_0\
    );
\p_0_out_inferred__0/product10_i_352\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAA15555"
    )
        port map (
      I0 => sel(11),
      I1 => sel(0),
      I2 => sel(1),
      I3 => sel(2),
      I4 => sel(3),
      O => \p_0_out_inferred__0/product10_i_352_n_0\
    );
\p_0_out_inferred__0/product10_i_353\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => sel(2),
      I1 => sel(1),
      I2 => sel(0),
      O => \p_0_out_inferred__0/product10_i_353_n_0\
    );
\p_0_out_inferred__0/product10_i_354\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFE00000003FFFF"
    )
        port map (
      I0 => sel(0),
      I1 => sel(2),
      I2 => sel(1),
      I3 => sel(3),
      I4 => sel(4),
      I5 => sel(11),
      O => \p_0_out_inferred__0/product10_i_354_n_0\
    );
\p_0_out_inferred__0/product10_i_355\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0F0F0F1A5A5A5A5A"
    )
        port map (
      I0 => sel(4),
      I1 => sel(0),
      I2 => sel(11),
      I3 => sel(1),
      I4 => sel(2),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_355_n_0\
    );
\p_0_out_inferred__0/product10_i_356\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA00000057FFFFFF"
    )
        port map (
      I0 => sel(2),
      I1 => sel(1),
      I2 => sel(0),
      I3 => sel(3),
      I4 => sel(4),
      I5 => sel(11),
      O => \p_0_out_inferred__0/product10_i_356_n_0\
    );
\p_0_out_inferred__0/product10_i_357\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFC80000003FFFFF"
    )
        port map (
      I0 => sel(0),
      I1 => sel(2),
      I2 => sel(1),
      I3 => sel(3),
      I4 => sel(4),
      I5 => sel(11),
      O => \p_0_out_inferred__0/product10_i_357_n_0\
    );
\p_0_out_inferred__0/product10_i_358\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"007FFFFFFF000000"
    )
        port map (
      I0 => sel(0),
      I1 => sel(1),
      I2 => sel(2),
      I3 => sel(3),
      I4 => sel(4),
      I5 => sel(11),
      O => \p_0_out_inferred__0/product10_i_358_n_0\
    );
\p_0_out_inferred__0/product10_i_359\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"07FFF800"
    )
        port map (
      I0 => sel(1),
      I1 => sel(2),
      I2 => sel(3),
      I3 => sel(4),
      I4 => sel(11),
      O => \p_0_out_inferred__0/product10_i_359_n_0\
    );
\p_0_out_inferred__0/product10_i_36\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_112_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_113_n_0\,
      O => \p_0_out_inferred__0/product10_i_36_n_0\,
      S => sel(10)
    );
\p_0_out_inferred__0/product10_i_360\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"55402AAAAABFD555"
    )
        port map (
      I0 => sel(5),
      I1 => sel(2),
      I2 => sel(1),
      I3 => sel(3),
      I4 => sel(4),
      I5 => sel(11),
      O => \p_0_out_inferred__0/product10_i_360_n_0\
    );
\p_0_out_inferred__0/product10_i_361\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFF8000FF0000FF"
    )
        port map (
      I0 => sel(0),
      I1 => sel(2),
      I2 => sel(1),
      I3 => sel(4),
      I4 => sel(11),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_361_n_0\
    );
\p_0_out_inferred__0/product10_i_362\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0003FFFFFFFE0000"
    )
        port map (
      I0 => sel(0),
      I1 => sel(2),
      I2 => sel(1),
      I3 => sel(3),
      I4 => sel(4),
      I5 => sel(11),
      O => \p_0_out_inferred__0/product10_i_362_n_0\
    );
\p_0_out_inferred__0/product10_i_363\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C999999999999999"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(0),
      I3 => sel(1),
      I4 => sel(2),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_363_n_0\
    );
\p_0_out_inferred__0/product10_i_364\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0055FFFFFFEA0000"
    )
        port map (
      I0 => sel(2),
      I1 => sel(0),
      I2 => sel(1),
      I3 => sel(3),
      I4 => sel(4),
      I5 => sel(11),
      O => \p_0_out_inferred__0/product10_i_364_n_0\
    );
\p_0_out_inferred__0/product10_i_365\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"78F0F0F0F0C3C3C3"
    )
        port map (
      I0 => sel(0),
      I1 => sel(4),
      I2 => sel(11),
      I3 => sel(2),
      I4 => sel(1),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_365_n_0\
    );
\p_0_out_inferred__0/product10_i_366\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9913993336666666"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(0),
      I3 => sel(2),
      I4 => sel(1),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_366_n_0\
    );
\p_0_out_inferred__0/product10_i_367\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"66CCCCC999999999"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(0),
      I3 => sel(1),
      I4 => sel(2),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_367_n_0\
    );
\p_0_out_inferred__0/product10_i_368\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"55775776AA88A888"
    )
        port map (
      I0 => sel(4),
      I1 => sel(3),
      I2 => sel(1),
      I3 => sel(2),
      I4 => sel(0),
      I5 => sel(11),
      O => \p_0_out_inferred__0/product10_i_368_n_0\
    );
\p_0_out_inferred__0/product10_i_369\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9993993337663666"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(1),
      I3 => sel(2),
      I4 => sel(0),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_369_n_0\
    );
\p_0_out_inferred__0/product10_i_37\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_114_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_115_n_0\,
      O => \p_0_out_inferred__0/product10_i_37_n_0\,
      S => sel(10)
    );
\p_0_out_inferred__0/product10_i_370\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"666C6E6CC9C9C999"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(2),
      I3 => sel(1),
      I4 => sel(0),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_370_n_0\
    );
\p_0_out_inferred__0/product10_i_371\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6666CCCCCD999999"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(0),
      I3 => sel(1),
      I4 => sel(2),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_371_n_0\
    );
\p_0_out_inferred__0/product10_i_372\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0001FFFFFFFE0000"
    )
        port map (
      I0 => sel(0),
      I1 => sel(2),
      I2 => sel(1),
      I3 => sel(3),
      I4 => sel(4),
      I5 => sel(11),
      O => \p_0_out_inferred__0/product10_i_372_n_0\
    );
\p_0_out_inferred__0/product10_i_373\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C3C38F0F0F3C3C3C"
    )
        port map (
      I0 => sel(0),
      I1 => sel(4),
      I2 => sel(11),
      I3 => sel(1),
      I4 => sel(2),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_373_n_0\
    );
\p_0_out_inferred__0/product10_i_374\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"C999"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(2),
      O => \p_0_out_inferred__0/product10_i_374_n_0\
    );
\p_0_out_inferred__0/product10_i_375\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"66666666CCC9C9C9"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(2),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_375_n_0\
    );
\p_0_out_inferred__0/product10_i_376\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A5A5A50F0F1A5A5A"
    )
        port map (
      I0 => sel(4),
      I1 => sel(0),
      I2 => sel(11),
      I3 => sel(1),
      I4 => sel(2),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_376_n_0\
    );
\p_0_out_inferred__0/product10_i_377\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3C783CF0F0F0F0C3"
    )
        port map (
      I0 => sel(0),
      I1 => sel(4),
      I2 => sel(11),
      I3 => sel(2),
      I4 => sel(1),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_377_n_0\
    );
\p_0_out_inferred__0/product10_i_378\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0A5E5A5A5A5A5A5"
    )
        port map (
      I0 => sel(4),
      I1 => sel(0),
      I2 => sel(11),
      I3 => sel(2),
      I4 => sel(1),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_378_n_0\
    );
\p_0_out_inferred__0/product10_i_379\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EAAAAAAA55555555"
    )
        port map (
      I0 => sel(4),
      I1 => sel(3),
      I2 => sel(1),
      I3 => sel(2),
      I4 => sel(0),
      I5 => sel(11),
      O => \p_0_out_inferred__0/product10_i_379_n_0\
    );
\p_0_out_inferred__0/product10_i_38\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_116_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_117_n_0\,
      O => \p_0_out_inferred__0/product10_i_38_n_0\,
      S => sel(10)
    );
\p_0_out_inferred__0/product10_i_380\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3C3C3C78F0F0F0C3"
    )
        port map (
      I0 => sel(0),
      I1 => sel(4),
      I2 => sel(11),
      I3 => sel(2),
      I4 => sel(1),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_380_n_0\
    );
\p_0_out_inferred__0/product10_i_381\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3336363666666666"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(2),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_381_n_0\
    );
\p_0_out_inferred__0/product10_i_382\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFEA00000015FFFF"
    )
        port map (
      I0 => sel(2),
      I1 => sel(0),
      I2 => sel(1),
      I3 => sel(3),
      I4 => sel(4),
      I5 => sel(11),
      O => \p_0_out_inferred__0/product10_i_382_n_0\
    );
\p_0_out_inferred__0/product10_i_383\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCC9C9C999999999"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(2),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_383_n_0\
    );
\p_0_out_inferred__0/product10_i_384\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCC8999999999"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(0),
      I3 => sel(1),
      I4 => sel(2),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_384_n_0\
    );
\p_0_out_inferred__0/product10_i_385\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3736363666666666"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(2),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_385_n_0\
    );
\p_0_out_inferred__0/product10_i_386\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00FF01FF00FF55AA"
    )
        port map (
      I0 => sel(4),
      I1 => sel(1),
      I2 => sel(0),
      I3 => sel(11),
      I4 => sel(3),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_386_n_0\
    );
\p_0_out_inferred__0/product10_i_387\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF000000007FFFFF"
    )
        port map (
      I0 => sel(0),
      I1 => sel(1),
      I2 => sel(2),
      I3 => sel(3),
      I4 => sel(4),
      I5 => sel(11),
      O => \p_0_out_inferred__0/product10_i_387_n_0\
    );
\p_0_out_inferred__0/product10_i_388\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"55555555EAAAAAAA"
    )
        port map (
      I0 => sel(4),
      I1 => sel(3),
      I2 => sel(1),
      I3 => sel(2),
      I4 => sel(0),
      I5 => sel(11),
      O => \p_0_out_inferred__0/product10_i_388_n_0\
    );
\p_0_out_inferred__0/product10_i_389\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0F0F0FA5A5B0F0F0"
    )
        port map (
      I0 => sel(4),
      I1 => sel(0),
      I2 => sel(11),
      I3 => sel(1),
      I4 => sel(2),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_389_n_0\
    );
\p_0_out_inferred__0/product10_i_39\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_118_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_119_n_0\,
      O => \p_0_out_inferred__0/product10_i_39_n_0\,
      S => sel(10)
    );
\p_0_out_inferred__0/product10_i_390\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"96C6C6C7C3C3C363"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_390_n_0\
    );
\p_0_out_inferred__0/product10_i_391\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"69796939393C3C3C"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(1),
      I4 => sel(0),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_391_n_0\
    );
\p_0_out_inferred__0/product10_i_392\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"9C96C6C3"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(1),
      I4 => sel(2),
      O => \p_0_out_inferred__0/product10_i_392_n_0\
    );
\p_0_out_inferred__0/product10_i_393\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0F0F43C3C3F0F0B4"
    )
        port map (
      I0 => sel(0),
      I1 => sel(4),
      I2 => sel(11),
      I3 => sel(1),
      I4 => sel(2),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_393_n_0\
    );
\p_0_out_inferred__0/product10_i_394\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCC666667333339"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(0),
      I3 => sel(1),
      I4 => sel(2),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_394_n_0\
    );
\p_0_out_inferred__0/product10_i_395\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3399339998CCCCC6"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(0),
      I3 => sel(2),
      I4 => sel(1),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_395_n_0\
    );
\p_0_out_inferred__0/product10_i_396\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0B4F03C3C0F0F4B"
    )
        port map (
      I0 => sel(0),
      I1 => sel(4),
      I2 => sel(11),
      I3 => sel(2),
      I4 => sel(1),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_396_n_0\
    );
\p_0_out_inferred__0/product10_i_397\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C666666663333999"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(0),
      I3 => sel(1),
      I4 => sel(2),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_397_n_0\
    );
\p_0_out_inferred__0/product10_i_398\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"999C9C9CC6666666"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(2),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_398_n_0\
    );
\p_0_out_inferred__0/product10_i_399\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3CC30FC30FC34BF0"
    )
        port map (
      I0 => sel(0),
      I1 => sel(4),
      I2 => sel(11),
      I3 => sel(3),
      I4 => sel(2),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_399_n_0\
    );
\p_0_out_inferred__0/product10_i_4\: unisim.vcomponents.MUXF8
     port map (
      I0 => \p_0_out_inferred__0/product10_i_18_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_19_n_0\,
      O => p_0_out(8),
      S => sel(9)
    );
\p_0_out_inferred__0/product10_i_40\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_120_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_121_n_0\,
      I2 => sel(10),
      I3 => \p_0_out_inferred__0/product10_i_122_n_0\,
      I4 => sel(8),
      I5 => \p_0_out_inferred__0/product10_i_123_n_0\,
      O => \p_0_out_inferred__0/product10_i_40_n_0\
    );
\p_0_out_inferred__0/product10_i_400\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8CC6C6C663636373"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(2),
      I3 => sel(1),
      I4 => sel(0),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_400_n_0\
    );
\p_0_out_inferred__0/product10_i_401\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"3C3C3C4B"
    )
        port map (
      I0 => sel(1),
      I1 => sel(4),
      I2 => sel(11),
      I3 => sel(3),
      I4 => sel(2),
      O => \p_0_out_inferred__0/product10_i_401_n_0\
    );
\p_0_out_inferred__0/product10_i_402\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A5B0D25A5A5A5A5A"
    )
        port map (
      I0 => sel(4),
      I1 => sel(0),
      I2 => sel(11),
      I3 => sel(1),
      I4 => sel(2),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_402_n_0\
    );
\p_0_out_inferred__0/product10_i_403\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF0000FFA8FF5700"
    )
        port map (
      I0 => sel(2),
      I1 => sel(1),
      I2 => sel(0),
      I3 => sel(4),
      I4 => sel(11),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_403_n_0\
    );
\p_0_out_inferred__0/product10_i_404\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"67993999339999CC"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(0),
      I3 => sel(3),
      I4 => sel(2),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_404_n_0\
    );
\p_0_out_inferred__0/product10_i_405\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAA15555555"
    )
        port map (
      I0 => sel(4),
      I1 => sel(3),
      I2 => sel(2),
      I3 => sel(1),
      I4 => sel(0),
      I5 => sel(11),
      O => \p_0_out_inferred__0/product10_i_405_n_0\
    );
\p_0_out_inferred__0/product10_i_406\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9999999913363636"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(2),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_406_n_0\
    );
\p_0_out_inferred__0/product10_i_407\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3766366666666666"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(1),
      I3 => sel(2),
      I4 => sel(0),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_407_n_0\
    );
\p_0_out_inferred__0/product10_i_408\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"77A8FF00FE00AA55"
    )
        port map (
      I0 => sel(4),
      I1 => sel(1),
      I2 => sel(0),
      I3 => sel(11),
      I4 => sel(2),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_408_n_0\
    );
\p_0_out_inferred__0/product10_i_409\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"626B696999999999"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(2),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_409_n_0\
    );
\p_0_out_inferred__0/product10_i_41\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_124_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_125_n_0\,
      I2 => sel(10),
      I3 => \p_0_out_inferred__0/product10_i_126_n_0\,
      I4 => sel(8),
      I5 => \p_0_out_inferred__0/product10_i_127_n_0\,
      O => \p_0_out_inferred__0/product10_i_41_n_0\
    );
\p_0_out_inferred__0/product10_i_410\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"666666A999999999"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(0),
      I3 => sel(1),
      I4 => sel(2),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_410_n_0\
    );
\p_0_out_inferred__0/product10_i_411\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6666668999999999"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(0),
      I3 => sel(1),
      I4 => sel(2),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_411_n_0\
    );
\p_0_out_inferred__0/product10_i_412\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6C6969C999999999"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(2),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_412_n_0\
    );
\p_0_out_inferred__0/product10_i_413\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"3C783CC3"
    )
        port map (
      I0 => sel(1),
      I1 => sel(4),
      I2 => sel(11),
      I3 => sel(3),
      I4 => sel(2),
      O => \p_0_out_inferred__0/product10_i_413_n_0\
    );
\p_0_out_inferred__0/product10_i_414\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6666666649999999"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(0),
      I3 => sel(1),
      I4 => sel(2),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_414_n_0\
    );
\p_0_out_inferred__0/product10_i_415\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5555AAAA6AAA5555"
    )
        port map (
      I0 => sel(4),
      I1 => sel(0),
      I2 => sel(2),
      I3 => sel(1),
      I4 => sel(11),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_415_n_0\
    );
\p_0_out_inferred__0/product10_i_416\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6666666667199999"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(0),
      I3 => sel(1),
      I4 => sel(2),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_416_n_0\
    );
\p_0_out_inferred__0/product10_i_417\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"55A8FF00FF00EA55"
    )
        port map (
      I0 => sel(4),
      I1 => sel(0),
      I2 => sel(1),
      I3 => sel(11),
      I4 => sel(2),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_417_n_0\
    );
\p_0_out_inferred__0/product10_i_418\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFF80000000FFFFF"
    )
        port map (
      I0 => sel(0),
      I1 => sel(1),
      I2 => sel(2),
      I3 => sel(3),
      I4 => sel(4),
      I5 => sel(11),
      O => \p_0_out_inferred__0/product10_i_418_n_0\
    );
\p_0_out_inferred__0/product10_i_419\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A50F0F1A5A5A5A5A"
    )
        port map (
      I0 => sel(4),
      I1 => sel(0),
      I2 => sel(11),
      I3 => sel(1),
      I4 => sel(2),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_419_n_0\
    );
\p_0_out_inferred__0/product10_i_42\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => sel(1),
      I1 => sel(2),
      I2 => sel(0),
      O => \p_0_out_inferred__0/product10_i_42_n_0\
    );
\p_0_out_inferred__0/product10_i_420\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0001FFFFFFFC0000"
    )
        port map (
      I0 => sel(0),
      I1 => sel(1),
      I2 => sel(2),
      I3 => sel(3),
      I4 => sel(4),
      I5 => sel(11),
      O => \p_0_out_inferred__0/product10_i_420_n_0\
    );
\p_0_out_inferred__0/product10_i_421\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"333933B999CC9CCC"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(1),
      I3 => sel(2),
      I4 => sel(0),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_421_n_0\
    );
\p_0_out_inferred__0/product10_i_422\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCC6C6C663236333"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(2),
      I3 => sel(1),
      I4 => sel(0),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_422_n_0\
    );
\p_0_out_inferred__0/product10_i_423\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0F0F4BC3C3F0F0F0"
    )
        port map (
      I0 => sel(0),
      I1 => sel(4),
      I2 => sel(11),
      I3 => sel(1),
      I4 => sel(2),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_423_n_0\
    );
\p_0_out_inferred__0/product10_i_424\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCC6C4C663636333"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(2),
      I3 => sel(1),
      I4 => sel(0),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_424_n_0\
    );
\p_0_out_inferred__0/product10_i_425\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1F00F0FFFCFF0300"
    )
        port map (
      I0 => sel(0),
      I1 => sel(1),
      I2 => sel(2),
      I3 => sel(4),
      I4 => sel(11),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_425_n_0\
    );
\p_0_out_inferred__0/product10_i_426\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCC466663333339"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(0),
      I3 => sel(1),
      I4 => sel(2),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_426_n_0\
    );
\p_0_out_inferred__0/product10_i_427\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"399C9C9CC6C6C662"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(2),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_427_n_0\
    );
\p_0_out_inferred__0/product10_i_428\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CC6666633333B999"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(0),
      I3 => sel(1),
      I4 => sel(2),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_428_n_0\
    );
\p_0_out_inferred__0/product10_i_429\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C3C3C3C3C3F0343C"
    )
        port map (
      I0 => sel(0),
      I1 => sel(4),
      I2 => sel(11),
      I3 => sel(1),
      I4 => sel(2),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_429_n_0\
    );
\p_0_out_inferred__0/product10_i_43\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A9995555"
    )
        port map (
      I0 => sel(11),
      I1 => sel(2),
      I2 => sel(0),
      I3 => sel(1),
      I4 => sel(3),
      O => \p_0_out_inferred__0/product10_i_43_n_0\
    );
\p_0_out_inferred__0/product10_i_430\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"693999993999999C"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(1),
      I4 => sel(2),
      I5 => sel(0),
      O => \p_0_out_inferred__0/product10_i_430_n_0\
    );
\p_0_out_inferred__0/product10_i_431\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B43C3C3C3C4F0FC3"
    )
        port map (
      I0 => sel(0),
      I1 => sel(4),
      I2 => sel(11),
      I3 => sel(2),
      I4 => sel(1),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_431_n_0\
    );
\p_0_out_inferred__0/product10_i_432\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F00FEF100FF00FF0"
    )
        port map (
      I0 => sel(0),
      I1 => sel(1),
      I2 => sel(4),
      I3 => sel(11),
      I4 => sel(2),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_432_n_0\
    );
\p_0_out_inferred__0/product10_i_433\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0F4FC3C3C3F0F034"
    )
        port map (
      I0 => sel(0),
      I1 => sel(4),
      I2 => sel(11),
      I3 => sel(1),
      I4 => sel(2),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_433_n_0\
    );
\p_0_out_inferred__0/product10_i_434\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"80FF7F000700F8FF"
    )
        port map (
      I0 => sel(1),
      I1 => sel(0),
      I2 => sel(2),
      I3 => sel(4),
      I4 => sel(11),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_434_n_0\
    );
\p_0_out_inferred__0/product10_i_435\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C699636666869966"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(0),
      I3 => sel(3),
      I4 => sel(2),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_435_n_0\
    );
\p_0_out_inferred__0/product10_i_436\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"99C9666669687696"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(2),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_436_n_0\
    );
\p_0_out_inferred__0/product10_i_437\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9989996969666E76"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(1),
      I4 => sel(0),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_437_n_0\
    );
\p_0_out_inferred__0/product10_i_438\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9693E96999996C66"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(2),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_438_n_0\
    );
\p_0_out_inferred__0/product10_i_439\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"63C6C696969C9C39"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_439_n_0\
    );
\p_0_out_inferred__0/product10_i_44\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00155555FFEAAAAA"
    )
        port map (
      I0 => sel(5),
      I1 => sel(1),
      I2 => sel(2),
      I3 => sel(3),
      I4 => sel(4),
      I5 => sel(11),
      O => \p_0_out_inferred__0/product10_i_44_n_0\
    );
\p_0_out_inferred__0/product10_i_440\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"969C9CB939696963"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_440_n_0\
    );
\p_0_out_inferred__0/product10_i_441\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"87C33C8F3CC3783C"
    )
        port map (
      I0 => sel(0),
      I1 => sel(4),
      I2 => sel(11),
      I3 => sel(3),
      I4 => sel(2),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_441_n_0\
    );
\p_0_out_inferred__0/product10_i_442\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"296966C669629696"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(2),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_442_n_0\
    );
\p_0_out_inferred__0/product10_i_443\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCC3333C9936C6C"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(1),
      I3 => sel(0),
      I4 => sel(3),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_443_n_0\
    );
\p_0_out_inferred__0/product10_i_444\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3C6329C339C36BC3"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(2),
      I4 => sel(1),
      I5 => sel(0),
      O => \p_0_out_inferred__0/product10_i_444_n_0\
    );
\p_0_out_inferred__0/product10_i_445\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CD66996CB3CC33D9"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(0),
      I3 => sel(3),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_445_n_0\
    );
\p_0_out_inferred__0/product10_i_446\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"32996C33669BCC66"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(0),
      I3 => sel(3),
      I4 => sel(2),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_446_n_0\
    );
\p_0_out_inferred__0/product10_i_447\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9D9C949666666666"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(2),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_447_n_0\
    );
\p_0_out_inferred__0/product10_i_448\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAA155575555AAAA"
    )
        port map (
      I0 => sel(4),
      I1 => sel(0),
      I2 => sel(1),
      I3 => sel(2),
      I4 => sel(11),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_448_n_0\
    );
\p_0_out_inferred__0/product10_i_449\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"850F1F5A5A5A5A5A"
    )
        port map (
      I0 => sel(4),
      I1 => sel(0),
      I2 => sel(11),
      I3 => sel(1),
      I4 => sel(2),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_449_n_0\
    );
\p_0_out_inferred__0/product10_i_45\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFE00000000"
    )
        port map (
      I0 => sel(5),
      I1 => sel(4),
      I2 => sel(3),
      I3 => \p_0_out_inferred__0/product10_i_128_n_0\,
      I4 => sel(0),
      I5 => sel(11),
      O => \p_0_out_inferred__0/product10_i_45_n_0\
    );
\p_0_out_inferred__0/product10_i_450\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"010FFFFFFFF00000"
    )
        port map (
      I0 => sel(1),
      I1 => sel(0),
      I2 => sel(3),
      I3 => sel(2),
      I4 => sel(4),
      I5 => sel(11),
      O => \p_0_out_inferred__0/product10_i_450_n_0\
    );
\p_0_out_inferred__0/product10_i_451\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"239D33CC33CCB9CC"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(0),
      I3 => sel(3),
      I4 => sel(2),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_451_n_0\
    );
\p_0_out_inferred__0/product10_i_452\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"94D696C6C6C3C3C3"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(1),
      I4 => sel(0),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_452_n_0\
    );
\p_0_out_inferred__0/product10_i_453\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6699339D23993BCC"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(0),
      I3 => sel(3),
      I4 => sel(2),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_453_n_0\
    );
\p_0_out_inferred__0/product10_i_454\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DD0255AA54AA02FD"
    )
        port map (
      I0 => sel(4),
      I1 => sel(1),
      I2 => sel(0),
      I3 => sel(11),
      I4 => sel(2),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_454_n_0\
    );
\p_0_out_inferred__0/product10_i_455\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCC333783136CCC"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(1),
      I3 => sel(0),
      I4 => sel(3),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_455_n_0\
    );
\p_0_out_inferred__0/product10_i_456\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CC33CC33CC3303EC"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(0),
      I3 => sel(3),
      I4 => sel(2),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_456_n_0\
    );
\p_0_out_inferred__0/product10_i_457\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C3C3C32FC3C3C33C"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(1),
      I4 => sel(2),
      I5 => sel(0),
      O => \p_0_out_inferred__0/product10_i_457_n_0\
    );
\p_0_out_inferred__0/product10_i_458\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CC33639DC63333CC"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(0),
      I3 => sel(3),
      I4 => sel(2),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_458_n_0\
    );
\p_0_out_inferred__0/product10_i_459\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAA55571555AAAA"
    )
        port map (
      I0 => sel(4),
      I1 => sel(0),
      I2 => sel(1),
      I3 => sel(2),
      I4 => sel(11),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_459_n_0\
    );
\p_0_out_inferred__0/product10_i_46\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => sel(11),
      I1 => \p_0_out_inferred__0/product10_i_129_n_0\,
      I2 => sel(8),
      I3 => \p_0_out_inferred__0/product10_i_130_n_0\,
      I4 => sel(7),
      I5 => \p_0_out_inferred__0/product10_i_13_n_0\,
      O => \p_0_out_inferred__0/product10_i_46_n_0\
    );
\p_0_out_inferred__0/product10_i_460\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAA5555BD550AAA"
    )
        port map (
      I0 => sel(4),
      I1 => sel(0),
      I2 => sel(1),
      I3 => sel(2),
      I4 => sel(11),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_460_n_0\
    );
\p_0_out_inferred__0/product10_i_461\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C9C9C9D999999999"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(2),
      I3 => sel(1),
      I4 => sel(0),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_461_n_0\
    );
\p_0_out_inferred__0/product10_i_462\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9999999993B23636"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(2),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_462_n_0\
    );
\p_0_out_inferred__0/product10_i_463\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FCCCCCCC33333337"
    )
        port map (
      I0 => sel(0),
      I1 => sel(4),
      I2 => sel(3),
      I3 => sel(2),
      I4 => sel(1),
      I5 => sel(11),
      O => \p_0_out_inferred__0/product10_i_463_n_0\
    );
\p_0_out_inferred__0/product10_i_464\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0001FFFFFFEA0000"
    )
        port map (
      I0 => sel(2),
      I1 => sel(0),
      I2 => sel(1),
      I3 => sel(3),
      I4 => sel(4),
      I5 => sel(11),
      O => \p_0_out_inferred__0/product10_i_464_n_0\
    );
\p_0_out_inferred__0/product10_i_465\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C0007FFF3FFF0000"
    )
        port map (
      I0 => sel(4),
      I1 => sel(2),
      I2 => sel(1),
      I3 => sel(0),
      I4 => sel(11),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_465_n_0\
    );
\p_0_out_inferred__0/product10_i_466\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C3943C3CC2BC3C3C"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(1),
      I4 => sel(2),
      I5 => sel(0),
      O => \p_0_out_inferred__0/product10_i_466_n_0\
    );
\p_0_out_inferred__0/product10_i_467\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CE6333993333CCCC"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(0),
      I3 => sel(1),
      I4 => sel(3),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_467_n_0\
    );
\p_0_out_inferred__0/product10_i_468\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F33333331CCCCCCC"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(0),
      I3 => sel(2),
      I4 => sel(1),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_468_n_0\
    );
\p_0_out_inferred__0/product10_i_469\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0FA5A5B0F0F0DA5A"
    )
        port map (
      I0 => sel(4),
      I1 => sel(0),
      I2 => sel(11),
      I3 => sel(1),
      I4 => sel(2),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_469_n_0\
    );
\p_0_out_inferred__0/product10_i_47\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E00000004FFFFFFF"
    )
        port map (
      I0 => sel(5),
      I1 => \p_0_out_inferred__0/product10_i_131_n_0\,
      I2 => sel(6),
      I3 => sel(7),
      I4 => sel(8),
      I5 => sel(11),
      O => \p_0_out_inferred__0/product10_i_47_n_0\
    );
\p_0_out_inferred__0/product10_i_470\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFF5020A4002FFF5"
    )
        port map (
      I0 => sel(4),
      I1 => sel(0),
      I2 => sel(2),
      I3 => sel(1),
      I4 => sel(11),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_470_n_0\
    );
\p_0_out_inferred__0/product10_i_471\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00FDAA55AA55BF00"
    )
        port map (
      I0 => sel(4),
      I1 => sel(0),
      I2 => sel(1),
      I3 => sel(11),
      I4 => sel(3),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_471_n_0\
    );
\p_0_out_inferred__0/product10_i_472\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CE66666733331999"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(0),
      I3 => sel(1),
      I4 => sel(2),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_472_n_0\
    );
\p_0_out_inferred__0/product10_i_473\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"87F01FA55A85780F"
    )
        port map (
      I0 => sel(4),
      I1 => sel(0),
      I2 => sel(11),
      I3 => sel(3),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_473_n_0\
    );
\p_0_out_inferred__0/product10_i_474\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E3C3969EC7C69C3C"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(2),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_474_n_0\
    );
\p_0_out_inferred__0/product10_i_475\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0FF01FA55A07F00F"
    )
        port map (
      I0 => sel(4),
      I1 => sel(0),
      I2 => sel(11),
      I3 => sel(3),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_475_n_0\
    );
\p_0_out_inferred__0/product10_i_476\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C63C9C3C963C3C39"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(2),
      I4 => sel(1),
      I5 => sel(0),
      O => \p_0_out_inferred__0/product10_i_476_n_0\
    );
\p_0_out_inferred__0/product10_i_477\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"969C991969696166"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_477_n_0\
    );
\p_0_out_inferred__0/product10_i_478\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9399669376996C66"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(0),
      I3 => sel(3),
      I4 => sel(2),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_478_n_0\
    );
\p_0_out_inferred__0/product10_i_479\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5A5AA51FF0A55A5A"
    )
        port map (
      I0 => sel(4),
      I1 => sel(0),
      I2 => sel(11),
      I3 => sel(1),
      I4 => sel(3),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_479_n_0\
    );
\p_0_out_inferred__0/product10_i_48\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"01000101FFFEFEFE"
    )
        port map (
      I0 => sel(8),
      I1 => sel(7),
      I2 => sel(6),
      I3 => \p_0_out_inferred__0/product10_i_132_n_0\,
      I4 => sel(5),
      I5 => sel(11),
      O => \p_0_out_inferred__0/product10_i_48_n_0\
    );
\p_0_out_inferred__0/product10_i_480\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"C6969C39"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(1),
      I4 => sel(2),
      O => \p_0_out_inferred__0/product10_i_480_n_0\
    );
\p_0_out_inferred__0/product10_i_481\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C96966366D669692"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(2),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_481_n_0\
    );
\p_0_out_inferred__0/product10_i_482\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9D669999666B4666"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(0),
      I3 => sel(1),
      I4 => sel(3),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_482_n_0\
    );
\p_0_out_inferred__0/product10_i_483\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9B99994969666C66"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(1),
      I4 => sel(0),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_483_n_0\
    );
\p_0_out_inferred__0/product10_i_484\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9693496999996C66"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(2),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_484_n_0\
    );
\p_0_out_inferred__0/product10_i_485\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6BC3C23C3C6BC3C3"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_485_n_0\
    );
\p_0_out_inferred__0/product10_i_486\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3C6BC3C2BC3C29C3"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_486_n_0\
    );
\p_0_out_inferred__0/product10_i_487\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BCC33C94293CC329"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(2),
      I4 => sel(0),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_487_n_0\
    );
\p_0_out_inferred__0/product10_i_488\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C3963C3D43C3D63C"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_488_n_0\
    );
\p_0_out_inferred__0/product10_i_489\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"399C96C66369399C"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_489_n_0\
    );
\p_0_out_inferred__0/product10_i_49\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFCCBBBB33308888"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_133_n_0\,
      I1 => sel(8),
      I2 => sel(6),
      I3 => \p_0_out_inferred__0/product10_i_134_n_0\,
      I4 => sel(7),
      I5 => sel(11),
      O => \p_0_out_inferred__0/product10_i_49_n_0\
    );
\p_0_out_inferred__0/product10_i_490\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E369391C96C6E369"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_490_n_0\
    );
\p_0_out_inferred__0/product10_i_491\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3C9CC6C361393C9E"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_491_n_0\
    );
\p_0_out_inferred__0/product10_i_492\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"86C3E3383C9EC7C3"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_492_n_0\
    );
\p_0_out_inferred__0/product10_i_493\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C9DBDB93366C6C6C"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(1),
      I3 => sel(0),
      I4 => sel(3),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_493_n_0\
    );
\p_0_out_inferred__0/product10_i_494\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9B2696646D99C993"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(1),
      I4 => sel(0),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_494_n_0\
    );
\p_0_out_inferred__0/product10_i_495\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"96A6666959999296"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_495_n_0\
    );
\p_0_out_inferred__0/product10_i_496\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9686666169999E96"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_496_n_0\
    );
\p_0_out_inferred__0/product10_i_497\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCC333781936CEC"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(1),
      I3 => sel(0),
      I4 => sel(3),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_497_n_0\
    );
\p_0_out_inferred__0/product10_i_498\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCC423333337E"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(0),
      I3 => sel(2),
      I4 => sel(1),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_498_n_0\
    );
\p_0_out_inferred__0/product10_i_499\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C363693D436B293C"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(1),
      I4 => sel(2),
      I5 => sel(0),
      O => \p_0_out_inferred__0/product10_i_499_n_0\
    );
\p_0_out_inferred__0/product10_i_5\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_20_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_21_n_0\,
      O => p_0_out(7),
      S => sel(9)
    );
\p_0_out_inferred__0/product10_i_50\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_135_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_129_n_0\,
      I2 => sel(8),
      I3 => \p_0_out_inferred__0/product10_i_136_n_0\,
      I4 => sel(7),
      I5 => \p_0_out_inferred__0/product10_i_137_n_0\,
      O => \p_0_out_inferred__0/product10_i_50_n_0\
    );
\p_0_out_inferred__0/product10_i_500\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCF3333F3B30C0C"
    )
        port map (
      I0 => sel(0),
      I1 => sel(4),
      I2 => sel(2),
      I3 => sel(1),
      I4 => sel(11),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_500_n_0\
    );
\p_0_out_inferred__0/product10_i_501\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2632939B99C94D6C"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_501_n_0\
    );
\p_0_out_inferred__0/product10_i_502\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6426669696999B99"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(1),
      I4 => sel(0),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_502_n_0\
    );
\p_0_out_inferred__0/product10_i_503\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"67E6869696989919"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_503_n_0\
    );
\p_0_out_inferred__0/product10_i_504\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A507F8E01F5AA587"
    )
        port map (
      I0 => sel(4),
      I1 => sel(0),
      I2 => sel(11),
      I3 => sel(1),
      I4 => sel(3),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_504_n_0\
    );
\p_0_out_inferred__0/product10_i_505\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"766CCCC889133336"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_505_n_0\
    );
\p_0_out_inferred__0/product10_i_506\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3333FCECCCCC0313"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(0),
      I3 => sel(3),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_506_n_0\
    );
\p_0_out_inferred__0/product10_i_507\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0F8FF3F0F0F0080F"
    )
        port map (
      I0 => sel(3),
      I1 => sel(4),
      I2 => sel(11),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_507_n_0\
    );
\p_0_out_inferred__0/product10_i_508\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"D9CCCC6C663233B3"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_508_n_0\
    );
\p_0_out_inferred__0/product10_i_509\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000FFFDBFFF0002"
    )
        port map (
      I0 => sel(4),
      I1 => sel(0),
      I2 => sel(1),
      I3 => sel(2),
      I4 => sel(11),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_509_n_0\
    );
\p_0_out_inferred__0/product10_i_51\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8CC0000B833FFFF"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_138_n_0\,
      I1 => sel(7),
      I2 => \p_0_out_inferred__0/product10_i_139_n_0\,
      I3 => sel(6),
      I4 => sel(8),
      I5 => sel(11),
      O => \p_0_out_inferred__0/product10_i_51_n_0\
    );
\p_0_out_inferred__0/product10_i_510\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CD9B3333264CCCCC"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(0),
      I3 => sel(1),
      I4 => sel(2),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_510_n_0\
    );
\p_0_out_inferred__0/product10_i_511\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9EC696C696C686E7"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(2),
      I4 => sel(1),
      I5 => sel(0),
      O => \p_0_out_inferred__0/product10_i_511_n_0\
    );
\p_0_out_inferred__0/product10_i_512\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E3696179393C383C"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(1),
      I4 => sel(0),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_512_n_0\
    );
\p_0_out_inferred__0/product10_i_513\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"03333333CCCCCCC8"
    )
        port map (
      I0 => sel(0),
      I1 => sel(4),
      I2 => sel(3),
      I3 => sel(1),
      I4 => sel(2),
      I5 => sel(11),
      O => \p_0_out_inferred__0/product10_i_513_n_0\
    );
\p_0_out_inferred__0/product10_i_514\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E666666666656569"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(2),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_514_n_0\
    );
\p_0_out_inferred__0/product10_i_515\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0FFF8000F0007FFF"
    )
        port map (
      I0 => sel(3),
      I1 => sel(4),
      I2 => sel(1),
      I3 => sel(0),
      I4 => sel(11),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_515_n_0\
    );
\p_0_out_inferred__0/product10_i_516\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3364324CCC9BC933"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(1),
      I4 => sel(0),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_516_n_0\
    );
\p_0_out_inferred__0/product10_i_517\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"319C3399CC67CCE6"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(0),
      I3 => sel(1),
      I4 => sel(3),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_517_n_0\
    );
\p_0_out_inferred__0/product10_i_518\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"01CCCCCCEE333733"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(1),
      I4 => sel(0),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_518_n_0\
    );
\p_0_out_inferred__0/product10_i_519\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6799666699861999"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(0),
      I3 => sel(1),
      I4 => sel(3),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_519_n_0\
    );
\p_0_out_inferred__0/product10_i_52\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"05FA45EF05FA40EA"
    )
        port map (
      I0 => sel(8),
      I1 => \p_0_out_inferred__0/product10_i_140_n_0\,
      I2 => sel(7),
      I3 => sel(11),
      I4 => sel(6),
      I5 => \p_0_out_inferred__0/product10_i_141_n_0\,
      O => \p_0_out_inferred__0/product10_i_52_n_0\
    );
\p_0_out_inferred__0/product10_i_520\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E8666C7636911399"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(1),
      I4 => sel(0),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_520_n_0\
    );
\p_0_out_inferred__0/product10_i_521\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5A58A70FF0E51A5A"
    )
        port map (
      I0 => sel(4),
      I1 => sel(0),
      I2 => sel(11),
      I3 => sel(1),
      I4 => sel(3),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_521_n_0\
    );
\p_0_out_inferred__0/product10_i_522\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6696469694B99D29"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(1),
      I4 => sel(0),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_522_n_0\
    );
\p_0_out_inferred__0/product10_i_523\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"D666999469299666"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(2),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_523_n_0\
    );
\p_0_out_inferred__0/product10_i_524\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"16666A6999959666"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_524_n_0\
    );
\p_0_out_inferred__0/product10_i_525\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"666C9196E9897666"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(2),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_525_n_0\
    );
\p_0_out_inferred__0/product10_i_526\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C999766E9337ECC9"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(2),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_526_n_0\
    );
\p_0_out_inferred__0/product10_i_527\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BC3DD63CC39443C3"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(2),
      I4 => sel(0),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_527_n_0\
    );
\p_0_out_inferred__0/product10_i_528\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C363293C9CC6C36B"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_528_n_0\
    );
\p_0_out_inferred__0/product10_i_529\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3D9C96C263693D9C"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_529_n_0\
    );
\p_0_out_inferred__0/product10_i_53\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_142_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_143_n_0\,
      I2 => sel(8),
      I3 => \p_0_out_inferred__0/product10_i_144_n_0\,
      I4 => sel(7),
      I5 => \p_0_out_inferred__0/product10_i_145_n_0\,
      O => \p_0_out_inferred__0/product10_i_53_n_0\
    );
\p_0_out_inferred__0/product10_i_530\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6369399C96C66369"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_530_n_0\
    );
\p_0_out_inferred__0/product10_i_531\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9E3CC39638E33C38"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(2),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_531_n_0\
    );
\p_0_out_inferred__0/product10_i_532\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C3863C3C61C3C71C"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_532_n_0\
    );
\p_0_out_inferred__0/product10_i_533\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"61C3C71C3C79C3C3"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_533_n_0\
    );
\p_0_out_inferred__0/product10_i_534\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3C791C3CC3C379C3"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(2),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_534_n_0\
    );
\p_0_out_inferred__0/product10_i_535\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_645_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_646_n_0\,
      O => \p_0_out_inferred__0/product10_i_535_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_536\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_647_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_648_n_0\,
      O => \p_0_out_inferred__0/product10_i_536_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_537\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_649_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_650_n_0\,
      O => \p_0_out_inferred__0/product10_i_537_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_538\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_651_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_652_n_0\,
      O => \p_0_out_inferred__0/product10_i_538_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_539\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B3CCCC3222BBDB4C"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(2),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_539_n_0\
    );
\p_0_out_inferred__0/product10_i_54\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_146_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_147_n_0\,
      O => \p_0_out_inferred__0/product10_i_54_n_0\,
      S => sel(7)
    );
\p_0_out_inferred__0/product10_i_540\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6D92"
    )
        port map (
      I0 => sel(11),
      I1 => sel(1),
      I2 => sel(0),
      I3 => sel(2),
      O => \p_0_out_inferred__0/product10_i_540_n_0\
    );
\p_0_out_inferred__0/product10_i_541\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"33FFCC01CC3337CC"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(2),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_541_n_0\
    );
\p_0_out_inferred__0/product10_i_542\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"33CC1177CC33EE89"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_542_n_0\
    );
\p_0_out_inferred__0/product10_i_543\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_653_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_654_n_0\,
      O => \p_0_out_inferred__0/product10_i_543_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_544\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_655_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_656_n_0\,
      O => \p_0_out_inferred__0/product10_i_544_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_545\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_657_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_658_n_0\,
      O => \p_0_out_inferred__0/product10_i_545_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_546\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_659_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_660_n_0\,
      O => \p_0_out_inferred__0/product10_i_546_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_547\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_661_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_662_n_0\,
      O => \p_0_out_inferred__0/product10_i_547_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_548\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_663_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_664_n_0\,
      O => \p_0_out_inferred__0/product10_i_548_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_549\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_665_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_666_n_0\,
      O => \p_0_out_inferred__0/product10_i_549_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_55\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E00000004FFFFFFF"
    )
        port map (
      I0 => sel(4),
      I1 => \p_0_out_inferred__0/product10_i_148_n_0\,
      I2 => sel(5),
      I3 => sel(6),
      I4 => sel(7),
      I5 => sel(11),
      O => \p_0_out_inferred__0/product10_i_55_n_0\
    );
\p_0_out_inferred__0/product10_i_550\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_667_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_668_n_0\,
      O => \p_0_out_inferred__0/product10_i_550_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_551\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"43C3C3C3C3B0D0BC"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(1),
      I4 => sel(0),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_551_n_0\
    );
\p_0_out_inferred__0/product10_i_552\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0F2F0FA5A4F5F0D"
    )
        port map (
      I0 => sel(4),
      I1 => sel(0),
      I2 => sel(11),
      I3 => sel(2),
      I4 => sel(1),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_552_n_0\
    );
\p_0_out_inferred__0/product10_i_553\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"666666664555DDD9"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(0),
      I3 => sel(1),
      I4 => sel(2),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_553_n_0\
    );
\p_0_out_inferred__0/product10_i_554\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEEAAA8999999999"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(0),
      I3 => sel(1),
      I4 => sel(2),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_554_n_0\
    );
\p_0_out_inferred__0/product10_i_555\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0FAFADB5F5F0D050"
    )
        port map (
      I0 => sel(4),
      I1 => sel(0),
      I2 => sel(11),
      I3 => sel(1),
      I4 => sel(2),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_555_n_0\
    );
\p_0_out_inferred__0/product10_i_556\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"073C3C380E3C3C78"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(1),
      I4 => sel(2),
      I5 => sel(0),
      O => \p_0_out_inferred__0/product10_i_556_n_0\
    );
\p_0_out_inferred__0/product10_i_557\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_669_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_670_n_0\,
      O => \p_0_out_inferred__0/product10_i_557_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_558\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_671_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_672_n_0\,
      O => \p_0_out_inferred__0/product10_i_558_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_559\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_673_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_674_n_0\,
      O => \p_0_out_inferred__0/product10_i_559_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_56\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_149_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_150_n_0\,
      O => \p_0_out_inferred__0/product10_i_56_n_0\,
      S => sel(7)
    );
\p_0_out_inferred__0/product10_i_560\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_675_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_676_n_0\,
      O => \p_0_out_inferred__0/product10_i_560_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_561\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_677_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_678_n_0\,
      O => \p_0_out_inferred__0/product10_i_561_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_562\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_679_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_680_n_0\,
      O => \p_0_out_inferred__0/product10_i_562_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_563\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_681_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_682_n_0\,
      O => \p_0_out_inferred__0/product10_i_563_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_564\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_683_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_684_n_0\,
      O => \p_0_out_inferred__0/product10_i_564_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_565\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F3F00FCF0C0FF070"
    )
        port map (
      I0 => sel(3),
      I1 => sel(4),
      I2 => sel(11),
      I3 => sel(1),
      I4 => sel(0),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_565_n_0\
    );
\p_0_out_inferred__0/product10_i_566\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8F08F00FF0FF0FF0"
    )
        port map (
      I0 => sel(3),
      I1 => sel(4),
      I2 => sel(11),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_566_n_0\
    );
\p_0_out_inferred__0/product10_i_567\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"49B6"
    )
        port map (
      I0 => sel(11),
      I1 => sel(0),
      I2 => sel(1),
      I3 => sel(2),
      O => \p_0_out_inferred__0/product10_i_567_n_0\
    );
\p_0_out_inferred__0/product10_i_568\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7E1311CCCC773789"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(2),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_568_n_0\
    );
\p_0_out_inferred__0/product10_i_569\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_685_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_686_n_0\,
      O => \p_0_out_inferred__0/product10_i_569_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_57\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_151_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_152_n_0\,
      O => \p_0_out_inferred__0/product10_i_57_n_0\,
      S => sel(7)
    );
\p_0_out_inferred__0/product10_i_570\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_687_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_688_n_0\,
      O => \p_0_out_inferred__0/product10_i_570_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_571\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_689_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_690_n_0\,
      O => \p_0_out_inferred__0/product10_i_571_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_572\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_691_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_692_n_0\,
      O => \p_0_out_inferred__0/product10_i_572_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_573\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_693_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_694_n_0\,
      O => \p_0_out_inferred__0/product10_i_573_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_574\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_695_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_696_n_0\,
      O => \p_0_out_inferred__0/product10_i_574_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_575\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_697_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_698_n_0\,
      O => \p_0_out_inferred__0/product10_i_575_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_576\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_699_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_700_n_0\,
      O => \p_0_out_inferred__0/product10_i_576_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_577\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5DBB2244DDB2244D"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_577_n_0\
    );
\p_0_out_inferred__0/product10_i_578\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"4B"
    )
        port map (
      I0 => sel(11),
      I1 => sel(0),
      I2 => sel(1),
      O => \p_0_out_inferred__0/product10_i_578_n_0\
    );
\p_0_out_inferred__0/product10_i_579\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3300CCFF3301C8FE"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_579_n_0\
    );
\p_0_out_inferred__0/product10_i_58\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_153_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_154_n_0\,
      O => \p_0_out_inferred__0/product10_i_58_n_0\,
      S => sel(7)
    );
\p_0_out_inferred__0/product10_i_580\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EE771188EE771589"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_580_n_0\
    );
\p_0_out_inferred__0/product10_i_581\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_701_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_702_n_0\,
      O => \p_0_out_inferred__0/product10_i_581_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_582\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_703_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_704_n_0\,
      O => \p_0_out_inferred__0/product10_i_582_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_583\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EE67755111988AE6"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(1),
      I3 => sel(2),
      I4 => sel(3),
      I5 => sel(0),
      O => \p_0_out_inferred__0/product10_i_583_n_0\
    );
\p_0_out_inferred__0/product10_i_584\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"40BF"
    )
        port map (
      I0 => sel(11),
      I1 => sel(3),
      I2 => sel(4),
      I3 => sel(0),
      O => \p_0_out_inferred__0/product10_i_584_n_0\
    );
\p_0_out_inferred__0/product10_i_585\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"01011115FEEEEAEA"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(2),
      I3 => sel(1),
      I4 => sel(3),
      I5 => sel(0),
      O => \p_0_out_inferred__0/product10_i_585_n_0\
    );
\p_0_out_inferred__0/product10_i_586\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BDBC94D0434B2B2F"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(1),
      I4 => sel(2),
      I5 => sel(0),
      O => \p_0_out_inferred__0/product10_i_586_n_0\
    );
\p_0_out_inferred__0/product10_i_587\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_705_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_706_n_0\,
      O => \p_0_out_inferred__0/product10_i_587_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_588\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_707_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_708_n_0\,
      O => \p_0_out_inferred__0/product10_i_588_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_589\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_709_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_710_n_0\,
      O => \p_0_out_inferred__0/product10_i_589_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_59\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_155_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_156_n_0\,
      O => \p_0_out_inferred__0/product10_i_59_n_0\,
      S => sel(7)
    );
\p_0_out_inferred__0/product10_i_590\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_711_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_712_n_0\,
      O => \p_0_out_inferred__0/product10_i_590_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_591\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_713_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_714_n_0\,
      O => \p_0_out_inferred__0/product10_i_591_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_592\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_715_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_716_n_0\,
      O => \p_0_out_inferred__0/product10_i_592_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_593\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0F1FFFF0"
    )
        port map (
      I0 => sel(1),
      I1 => sel(2),
      I2 => sel(4),
      I3 => sel(3),
      I4 => sel(11),
      O => \p_0_out_inferred__0/product10_i_593_n_0\
    );
\p_0_out_inferred__0/product10_i_594\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"443300FF403F23EC"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(0),
      I3 => sel(3),
      I4 => sel(2),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_594_n_0\
    );
\p_0_out_inferred__0/product10_i_595\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"99AA559956D56244"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(0),
      I3 => sel(3),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_595_n_0\
    );
\p_0_out_inferred__0/product10_i_596\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"08330137FEE8FE88"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(1),
      I4 => sel(0),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_596_n_0\
    );
\p_0_out_inferred__0/product10_i_597\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_717_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_718_n_0\,
      O => \p_0_out_inferred__0/product10_i_597_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_598\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_719_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_720_n_0\,
      O => \p_0_out_inferred__0/product10_i_598_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_599\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_721_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_722_n_0\,
      O => \p_0_out_inferred__0/product10_i_599_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_6\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_22_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_23_n_0\,
      O => p_0_out(6),
      S => sel(9)
    );
\p_0_out_inferred__0/product10_i_60\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"01000101FFFEFEFE"
    )
        port map (
      I0 => sel(7),
      I1 => sel(6),
      I2 => sel(5),
      I3 => \p_0_out_inferred__0/product10_i_157_n_0\,
      I4 => sel(4),
      I5 => sel(11),
      O => \p_0_out_inferred__0/product10_i_60_n_0\
    );
\p_0_out_inferred__0/product10_i_600\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_723_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_724_n_0\,
      O => \p_0_out_inferred__0/product10_i_600_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_601\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_725_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_726_n_0\,
      O => \p_0_out_inferred__0/product10_i_601_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_602\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_727_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_728_n_0\,
      O => \p_0_out_inferred__0/product10_i_602_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_603\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_729_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_730_n_0\,
      O => \p_0_out_inferred__0/product10_i_603_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_604\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_731_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_732_n_0\,
      O => \p_0_out_inferred__0/product10_i_604_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_605\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"80F0F0FFFF0F1F00"
    )
        port map (
      I0 => sel(3),
      I1 => sel(2),
      I2 => sel(4),
      I3 => sel(11),
      I4 => sel(0),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_605_n_0\
    );
\p_0_out_inferred__0/product10_i_606\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7F00008000FFFFFF"
    )
        port map (
      I0 => sel(2),
      I1 => sel(3),
      I2 => sel(4),
      I3 => sel(0),
      I4 => sel(11),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_606_n_0\
    );
\p_0_out_inferred__0/product10_i_607\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"87"
    )
        port map (
      I0 => sel(0),
      I1 => sel(11),
      I2 => sel(1),
      O => \p_0_out_inferred__0/product10_i_607_n_0\
    );
\p_0_out_inferred__0/product10_i_608\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8117EE881177EA89"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_608_n_0\
    );
\p_0_out_inferred__0/product10_i_609\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_733_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_734_n_0\,
      O => \p_0_out_inferred__0/product10_i_609_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_61\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_158_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_159_n_0\,
      O => \p_0_out_inferred__0/product10_i_61_n_0\,
      S => sel(7)
    );
\p_0_out_inferred__0/product10_i_610\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_735_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_736_n_0\,
      O => \p_0_out_inferred__0/product10_i_610_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_611\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_737_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_738_n_0\,
      O => \p_0_out_inferred__0/product10_i_611_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_612\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_739_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_740_n_0\,
      O => \p_0_out_inferred__0/product10_i_612_n_0\,
      S => sel(5)
    );
\p_0_out_inferred__0/product10_i_613\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"837D4A82C2821DD5"
    )
        port map (
      I0 => sel(5),
      I1 => sel(3),
      I2 => sel(1),
      I3 => sel(4),
      I4 => sel(0),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_613_n_0\
    );
\p_0_out_inferred__0/product10_i_614\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"48D7E48AF408B77D"
    )
        port map (
      I0 => sel(5),
      I1 => sel(3),
      I2 => sel(2),
      I3 => sel(4),
      I4 => sel(0),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_614_n_0\
    );
\p_0_out_inferred__0/product10_i_615\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1617736117336060"
    )
        port map (
      I0 => sel(5),
      I1 => sel(4),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(2),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_615_n_0\
    );
\p_0_out_inferred__0/product10_i_616\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0FFFA100FA000700"
    )
        port map (
      I0 => sel(1),
      I1 => sel(0),
      I2 => sel(2),
      I3 => sel(5),
      I4 => sel(3),
      I5 => sel(4),
      O => \p_0_out_inferred__0/product10_i_616_n_0\
    );
\p_0_out_inferred__0/product10_i_617\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C555FFFB3111999B"
    )
        port map (
      I0 => sel(5),
      I1 => sel(4),
      I2 => sel(0),
      I3 => sel(1),
      I4 => sel(2),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_617_n_0\
    );
\p_0_out_inferred__0/product10_i_618\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6D85907AFA85253B"
    )
        port map (
      I0 => sel(5),
      I1 => sel(4),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_618_n_0\
    );
\p_0_out_inferred__0/product10_i_619\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"09F6F618394BE73C"
    )
        port map (
      I0 => sel(5),
      I1 => sel(4),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(2),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_619_n_0\
    );
\p_0_out_inferred__0/product10_i_62\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_160_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_161_n_0\,
      O => \p_0_out_inferred__0/product10_i_62_n_0\,
      S => sel(7)
    );
\p_0_out_inferred__0/product10_i_620\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3FBC444C420BB3B3"
    )
        port map (
      I0 => sel(5),
      I1 => sel(4),
      I2 => sel(2),
      I3 => sel(1),
      I4 => sel(3),
      I5 => sel(0),
      O => \p_0_out_inferred__0/product10_i_620_n_0\
    );
\p_0_out_inferred__0/product10_i_621\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1DD72828A229D773"
    )
        port map (
      I0 => sel(5),
      I1 => sel(4),
      I2 => sel(2),
      I3 => sel(1),
      I4 => sel(3),
      I5 => sel(0),
      O => \p_0_out_inferred__0/product10_i_621_n_0\
    );
\p_0_out_inferred__0/product10_i_622\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"825CB5A25D30E25D"
    )
        port map (
      I0 => sel(5),
      I1 => sel(4),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_622_n_0\
    );
\p_0_out_inferred__0/product10_i_623\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6F0194EE6B1014EF"
    )
        port map (
      I0 => sel(5),
      I1 => sel(4),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_623_n_0\
    );
\p_0_out_inferred__0/product10_i_624\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BAAFADCC5053272F"
    )
        port map (
      I0 => sel(5),
      I1 => sel(4),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_624_n_0\
    );
\p_0_out_inferred__0/product10_i_625\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7F0000FFFA1515E8"
    )
        port map (
      I0 => sel(5),
      I1 => sel(4),
      I2 => sel(1),
      I3 => sel(3),
      I4 => sel(0),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_625_n_0\
    );
\p_0_out_inferred__0/product10_i_626\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7178585A8F87A7E5"
    )
        port map (
      I0 => sel(5),
      I1 => sel(4),
      I2 => sel(3),
      I3 => sel(1),
      I4 => sel(2),
      I5 => sel(0),
      O => \p_0_out_inferred__0/product10_i_626_n_0\
    );
\p_0_out_inferred__0/product10_i_627\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BB44BB46BB44B847"
    )
        port map (
      I0 => sel(5),
      I1 => sel(4),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(2),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_627_n_0\
    );
\p_0_out_inferred__0/product10_i_628\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2AA9FFFF55660000"
    )
        port map (
      I0 => sel(4),
      I1 => sel(3),
      I2 => sel(1),
      I3 => sel(2),
      I4 => sel(5),
      I5 => sel(0),
      O => \p_0_out_inferred__0/product10_i_628_n_0\
    );
\p_0_out_inferred__0/product10_i_629\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EB14BB44BB44BA45"
    )
        port map (
      I0 => sel(5),
      I1 => sel(4),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(2),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_629_n_0\
    );
\p_0_out_inferred__0/product10_i_63\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8CC0000B833FFFF"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_162_n_0\,
      I1 => sel(6),
      I2 => \p_0_out_inferred__0/product10_i_163_n_0\,
      I3 => sel(5),
      I4 => sel(7),
      I5 => sel(11),
      O => \p_0_out_inferred__0/product10_i_63_n_0\
    );
\p_0_out_inferred__0/product10_i_630\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3FFF55554002AAAA"
    )
        port map (
      I0 => sel(5),
      I1 => sel(1),
      I2 => sel(2),
      I3 => sel(3),
      I4 => sel(4),
      I5 => sel(0),
      O => \p_0_out_inferred__0/product10_i_630_n_0\
    );
\p_0_out_inferred__0/product10_i_631\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5118AAEEEEF75119"
    )
        port map (
      I0 => sel(5),
      I1 => sel(4),
      I2 => sel(1),
      I3 => sel(2),
      I4 => sel(3),
      I5 => sel(0),
      O => \p_0_out_inferred__0/product10_i_631_n_0\
    );
\p_0_out_inferred__0/product10_i_632\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A5780FF08FF00EA5"
    )
        port map (
      I0 => sel(5),
      I1 => sel(4),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(2),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_632_n_0\
    );
\p_0_out_inferred__0/product10_i_633\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E4CA0A33B5F55D4F"
    )
        port map (
      I0 => sel(5),
      I1 => sel(4),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_633_n_0\
    );
\p_0_out_inferred__0/product10_i_634\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"28290880D6F6777F"
    )
        port map (
      I0 => sel(5),
      I1 => sel(4),
      I2 => sel(3),
      I3 => sel(2),
      I4 => sel(0),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_634_n_0\
    );
\p_0_out_inferred__0/product10_i_635\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"47AD0C3ABA4145AD"
    )
        port map (
      I0 => sel(5),
      I1 => sel(4),
      I2 => sel(3),
      I3 => sel(2),
      I4 => sel(0),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_635_n_0\
    );
\p_0_out_inferred__0/product10_i_636\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1E1BE4E44B48B593"
    )
        port map (
      I0 => sel(5),
      I1 => sel(4),
      I2 => sel(3),
      I3 => sel(1),
      I4 => sel(0),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_636_n_0\
    );
\p_0_out_inferred__0/product10_i_637\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"33C42DD22FD02CD3"
    )
        port map (
      I0 => sel(5),
      I1 => sel(4),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(2),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_637_n_0\
    );
\p_0_out_inferred__0/product10_i_638\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DA7F3582A5C078FD"
    )
        port map (
      I0 => sel(5),
      I1 => sel(1),
      I2 => sel(4),
      I3 => sel(3),
      I4 => sel(0),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_638_n_0\
    );
\p_0_out_inferred__0/product10_i_639\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A409A1A15FB65EC6"
    )
        port map (
      I0 => sel(5),
      I1 => sel(4),
      I2 => sel(3),
      I3 => sel(2),
      I4 => sel(0),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_639_n_0\
    );
\p_0_out_inferred__0/product10_i_64\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_164_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_165_n_0\,
      O => \p_0_out_inferred__0/product10_i_64_n_0\,
      S => sel(7)
    );
\p_0_out_inferred__0/product10_i_640\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9F9F9F8A8A8AC3D7"
    )
        port map (
      I0 => sel(5),
      I1 => sel(4),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_640_n_0\
    );
\p_0_out_inferred__0/product10_i_641\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4347070606161637"
    )
        port map (
      I0 => sel(5),
      I1 => sel(4),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_641_n_0\
    );
\p_0_out_inferred__0/product10_i_642\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4F3CF3F80CC00C80"
    )
        port map (
      I0 => sel(0),
      I1 => sel(5),
      I2 => sel(2),
      I3 => sel(3),
      I4 => sel(1),
      I5 => sel(4),
      O => \p_0_out_inferred__0/product10_i_642_n_0\
    );
\p_0_out_inferred__0/product10_i_643\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0466CF9931378EEC"
    )
        port map (
      I0 => sel(5),
      I1 => sel(4),
      I2 => sel(0),
      I3 => sel(3),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_643_n_0\
    );
\p_0_out_inferred__0/product10_i_644\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"678830D230676D25"
    )
        port map (
      I0 => sel(5),
      I1 => sel(2),
      I2 => sel(4),
      I3 => sel(0),
      I4 => sel(3),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_644_n_0\
    );
\p_0_out_inferred__0/product10_i_645\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"863CE3873CE1C73C"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_645_n_0\
    );
\p_0_out_inferred__0/product10_i_646\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"433C3CF0D0C3C33C"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(2),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_646_n_0\
    );
\p_0_out_inferred__0/product10_i_647\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BDD6432D94C329BC"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_647_n_0\
    );
\p_0_out_inferred__0/product10_i_648\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"69999662A9944669"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_648_n_0\
    );
\p_0_out_inferred__0/product10_i_649\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"49DB246C3624DB93"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(1),
      I3 => sel(3),
      I4 => sel(0),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_649_n_0\
    );
\p_0_out_inferred__0/product10_i_65\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_166_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_167_n_0\,
      O => \p_0_out_inferred__0/product10_i_65_n_0\,
      S => sel(7)
    );
\p_0_out_inferred__0/product10_i_650\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9B266D9B6D99B664"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(1),
      I4 => sel(0),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_650_n_0\
    );
\p_0_out_inferred__0/product10_i_651\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9A69E69A69E69A69"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_651_n_0\
    );
\p_0_out_inferred__0/product10_i_652\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"79E7E79E9E3939E7"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(2),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_652_n_0\
    );
\p_0_out_inferred__0/product10_i_653\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9176C8136E9976C8"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_653_n_0\
    );
\p_0_out_inferred__0/product10_i_654\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6E8937EC9176C817"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_654_n_0\
    );
\p_0_out_inferred__0/product10_i_655\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9176C8136E8937CC"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_655_n_0\
    );
\p_0_out_inferred__0/product10_i_656\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EE8937CC136E8937"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_656_n_0\
    );
\p_0_out_inferred__0/product10_i_657\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5A177A5AA5E895A5"
    )
        port map (
      I0 => sel(4),
      I1 => sel(2),
      I2 => sel(11),
      I3 => sel(0),
      I4 => sel(3),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_657_n_0\
    );
\p_0_out_inferred__0/product10_i_658\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0111CCC8FEEE3337"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(2),
      I3 => sel(3),
      I4 => sel(0),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_658_n_0\
    );
\p_0_out_inferred__0/product10_i_659\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0F80F07F"
    )
        port map (
      I0 => sel(3),
      I1 => sel(4),
      I2 => sel(0),
      I3 => sel(11),
      I4 => sel(1),
      O => \p_0_out_inferred__0/product10_i_659_n_0\
    );
\p_0_out_inferred__0/product10_i_66\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_168_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_169_n_0\,
      O => \p_0_out_inferred__0/product10_i_66_n_0\,
      S => sel(7)
    );
\p_0_out_inferred__0/product10_i_660\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"999BB32666444DD9"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(2),
      I3 => sel(3),
      I4 => sel(0),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_660_n_0\
    );
\p_0_out_inferred__0/product10_i_661\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E66965599AA69666"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(1),
      I4 => sel(0),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_661_n_0\
    );
\p_0_out_inferred__0/product10_i_662\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3C1E6138C7C31C8E"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(2),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_662_n_0\
    );
\p_0_out_inferred__0/product10_i_663\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3C2FB43CC3C32FC3"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(2),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_663_n_0\
    );
\p_0_out_inferred__0/product10_i_664\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"426B96469D9429BD"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(2),
      I4 => sel(0),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_664_n_0\
    );
\p_0_out_inferred__0/product10_i_665\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"949D696BB9296342"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(2),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_665_n_0\
    );
\p_0_out_inferred__0/product10_i_666\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17999189C96EE866"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(1),
      I4 => sel(0),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_666_n_0\
    );
\p_0_out_inferred__0/product10_i_667\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4CCF8CCE33317331"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(0),
      I3 => sel(1),
      I4 => sel(3),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_667_n_0\
    );
\p_0_out_inferred__0/product10_i_668\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B624246CC993D3B3"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(1),
      I3 => sel(0),
      I4 => sel(3),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_668_n_0\
    );
\p_0_out_inferred__0/product10_i_669\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3676ECC889911736"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_669_n_0\
    );
\p_0_out_inferred__0/product10_i_67\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_170_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_171_n_0\,
      O => \p_0_out_inferred__0/product10_i_67_n_0\,
      S => sel(7)
    );
\p_0_out_inferred__0/product10_i_670\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3333CCCCB3DF4821"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(2),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_670_n_0\
    );
\p_0_out_inferred__0/product10_i_671\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"D94D6C646626B293"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_671_n_0\
    );
\p_0_out_inferred__0/product10_i_672\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"396979616786E686"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(1),
      I4 => sel(0),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_672_n_0\
    );
\p_0_out_inferred__0/product10_i_673\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"86E6989679186179"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(2),
      I4 => sel(0),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_673_n_0\
    );
\p_0_out_inferred__0/product10_i_674\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F1C3873C3CF1C3C7"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_674_n_0\
    );
\p_0_out_inferred__0/product10_i_675\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C243293CBCD2C34B"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_675_n_0\
    );
\p_0_out_inferred__0/product10_i_676\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9596566A69A99D96"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_676_n_0\
    );
\p_0_out_inferred__0/product10_i_677\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"899376E8891766E9"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_677_n_0\
    );
\p_0_out_inferred__0/product10_i_678\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FCEC0313"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(0),
      I3 => sel(3),
      I4 => sel(1),
      O => \p_0_out_inferred__0/product10_i_678_n_0\
    );
\p_0_out_inferred__0/product10_i_679\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF1F7F0000E000FF"
    )
        port map (
      I0 => sel(3),
      I1 => sel(2),
      I2 => sel(4),
      I3 => sel(11),
      I4 => sel(0),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_679_n_0\
    );
\p_0_out_inferred__0/product10_i_68\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"05FA45EF05FA40EA"
    )
        port map (
      I0 => sel(7),
      I1 => \p_0_out_inferred__0/product10_i_172_n_0\,
      I2 => sel(6),
      I3 => sel(11),
      I4 => sel(5),
      I5 => \p_0_out_inferred__0/product10_i_173_n_0\,
      O => \p_0_out_inferred__0/product10_i_68_n_0\
    );
\p_0_out_inferred__0/product10_i_680\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A69B6692D96D994D"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(2),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_680_n_0\
    );
\p_0_out_inferred__0/product10_i_681\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"64D932CCB364DD33"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_681_n_0\
    );
\p_0_out_inferred__0/product10_i_682\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BD39634242C69CBD"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(1),
      I3 => sel(3),
      I4 => sel(0),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_682_n_0\
    );
\p_0_out_inferred__0/product10_i_683\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"42C69CBDBD396246"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(1),
      I3 => sel(3),
      I4 => sel(0),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_683_n_0\
    );
\p_0_out_inferred__0/product10_i_684\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9DB9636242C69CBD"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(1),
      I3 => sel(3),
      I4 => sel(0),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_684_n_0\
    );
\p_0_out_inferred__0/product10_i_685\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"63D6BD63D6BD6BD6"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_685_n_0\
    );
\p_0_out_inferred__0/product10_i_686\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"569D69569D69569D"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_686_n_0\
    );
\p_0_out_inferred__0/product10_i_687\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6697E97691E97691"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_687_n_0\
    );
\p_0_out_inferred__0/product10_i_688\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"896E13C87691E876"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_688_n_0\
    );
\p_0_out_inferred__0/product10_i_689\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A592925A5A2565A5"
    )
        port map (
      I0 => sel(4),
      I1 => sel(2),
      I2 => sel(11),
      I3 => sel(0),
      I4 => sel(3),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_689_n_0\
    );
\p_0_out_inferred__0/product10_i_69\: unisim.vcomponents.MUXF7
     port map (
      I0 => \p_0_out_inferred__0/product10_i_174_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_175_n_0\,
      O => \p_0_out_inferred__0/product10_i_69_n_0\,
      S => sel(7)
    );
\p_0_out_inferred__0/product10_i_690\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"61383C9E86E7E179"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(2),
      I4 => sel(0),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_690_n_0\
    );
\p_0_out_inferred__0/product10_i_691\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3C0E0FC3C3383C3C"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(2),
      I4 => sel(0),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_691_n_0\
    );
\p_0_out_inferred__0/product10_i_692\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BC3D2DC3C394B43C"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(2),
      I4 => sel(0),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_692_n_0\
    );
\p_0_out_inferred__0/product10_i_693\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"89FE17887E15E876"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_693_n_0\
    );
\p_0_out_inferred__0/product10_i_694\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"70FF08F08F00FF0F"
    )
        port map (
      I0 => sel(3),
      I1 => sel(4),
      I2 => sel(11),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_694_n_0\
    );
\p_0_out_inferred__0/product10_i_695\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1A59A68265A69B59"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(1),
      I4 => sel(0),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_695_n_0\
    );
\p_0_out_inferred__0/product10_i_696\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C3C73C780F1EF1E3"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(1),
      I4 => sel(0),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_696_n_0\
    );
\p_0_out_inferred__0/product10_i_697\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"25AAAA5A5A4555A7"
    )
        port map (
      I0 => sel(4),
      I1 => sel(2),
      I2 => sel(11),
      I3 => sel(0),
      I4 => sel(3),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_697_n_0\
    );
\p_0_out_inferred__0/product10_i_698\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F178381E8EE7E171"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(2),
      I4 => sel(0),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_698_n_0\
    );
\p_0_out_inferred__0/product10_i_699\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F03C3D4F43D0F03C"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(2),
      I4 => sel(0),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_699_n_0\
    );
\p_0_out_inferred__0/product10_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_24_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_25_n_0\,
      I2 => sel(9),
      I3 => \p_0_out_inferred__0/product10_i_26_n_0\,
      I4 => sel(10),
      I5 => \p_0_out_inferred__0/product10_i_27_n_0\,
      O => p_0_out(5)
    );
\p_0_out_inferred__0/product10_i_70\: unisim.vcomponents.MUXF8
     port map (
      I0 => \p_0_out_inferred__0/product10_i_176_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_177_n_0\,
      O => \p_0_out_inferred__0/product10_i_70_n_0\,
      S => sel(6)
    );
\p_0_out_inferred__0/product10_i_700\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2B52956B52B56B52"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_700_n_0\
    );
\p_0_out_inferred__0/product10_i_701\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9594A9BD6AA9566A"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(2),
      I4 => sel(0),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_701_n_0\
    );
\p_0_out_inferred__0/product10_i_702\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"ADAA55A55A55AA4A"
    )
        port map (
      I0 => sel(4),
      I1 => sel(2),
      I2 => sel(11),
      I3 => sel(0),
      I4 => sel(3),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_702_n_0\
    );
\p_0_out_inferred__0/product10_i_703\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A5AA15A55A57AA5A"
    )
        port map (
      I0 => sel(4),
      I1 => sel(2),
      I2 => sel(11),
      I3 => sel(0),
      I4 => sel(3),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_703_n_0\
    );
\p_0_out_inferred__0/product10_i_704\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"15578991E8A97E6A"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(2),
      I4 => sel(0),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_704_n_0\
    );
\p_0_out_inferred__0/product10_i_705\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4BD0D0BCBC0F0FC3"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(2),
      I4 => sel(0),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_705_n_0\
    );
\p_0_out_inferred__0/product10_i_706\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7E15E87695EA5685"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_706_n_0\
    );
\p_0_out_inferred__0/product10_i_707\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C708F38F30F708F0"
    )
        port map (
      I0 => sel(3),
      I1 => sel(4),
      I2 => sel(11),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_707_n_0\
    );
\p_0_out_inferred__0/product10_i_708\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1AC7711E7886E518"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(2),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_708_n_0\
    );
\p_0_out_inferred__0/product10_i_709\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F1381E8EC7E57918"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_709_n_0\
    );
\p_0_out_inferred__0/product10_i_71\: unisim.vcomponents.MUXF8
     port map (
      I0 => \p_0_out_inferred__0/product10_i_178_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_179_n_0\,
      O => \p_0_out_inferred__0/product10_i_71_n_0\,
      S => sel(6)
    );
\p_0_out_inferred__0/product10_i_710\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"526B9452BD94A9BD"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(2),
      I4 => sel(0),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_710_n_0\
    );
\p_0_out_inferred__0/product10_i_711\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4DCF8E8EB0717171"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(0),
      I3 => sel(2),
      I4 => sel(3),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_711_n_0\
    );
\p_0_out_inferred__0/product10_i_712\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"19AEAA6467595D9B"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(2),
      I3 => sel(0),
      I4 => sel(3),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_712_n_0\
    );
\p_0_out_inferred__0/product10_i_713\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EAAAAAAA7777777F"
    )
        port map (
      I0 => sel(4),
      I1 => sel(3),
      I2 => sel(1),
      I3 => sel(2),
      I4 => sel(0),
      I5 => sel(11),
      O => \p_0_out_inferred__0/product10_i_713_n_0\
    );
\p_0_out_inferred__0/product10_i_714\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DF33FF331088008C"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(0),
      I3 => sel(2),
      I4 => sel(1),
      I5 => sel(3),
      O => \p_0_out_inferred__0/product10_i_714_n_0\
    );
\p_0_out_inferred__0/product10_i_715\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8A9965A6E6AA5164"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(0),
      I3 => sel(3),
      I4 => sel(2),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_715_n_0\
    );
\p_0_out_inferred__0/product10_i_716\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4DDFDFB33340204C"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(1),
      I4 => sel(0),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_716_n_0\
    );
\p_0_out_inferred__0/product10_i_717\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EB8D566AA995526B"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_717_n_0\
    );
\p_0_out_inferred__0/product10_i_718\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBDF4C20B7DE4821"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_718_n_0\
    );
\p_0_out_inferred__0/product10_i_719\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"86E71A86791A6579"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(2),
      I4 => sel(0),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_719_n_0\
    );
\p_0_out_inferred__0/product10_i_72\: unisim.vcomponents.MUXF8
     port map (
      I0 => \p_0_out_inferred__0/product10_i_180_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_181_n_0\,
      O => \p_0_out_inferred__0/product10_i_72_n_0\,
      S => sel(6)
    );
\p_0_out_inferred__0/product10_i_720\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6BADBCD4D2432F2D"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_720_n_0\
    );
\p_0_out_inferred__0/product10_i_721\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"ADD24BBC2B94522D"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(2),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_721_n_0\
    );
\p_0_out_inferred__0/product10_i_722\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"01FE8837EE0176C8"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_722_n_0\
    );
\p_0_out_inferred__0/product10_i_723\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9AA659DB4DDBA424"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(1),
      I3 => sel(3),
      I4 => sel(0),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_723_n_0\
    );
\p_0_out_inferred__0/product10_i_724\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0C70EF0C70E78C7"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_724_n_0\
    );
\p_0_out_inferred__0/product10_i_725\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2BADA9BDD6425243"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(2),
      I4 => sel(1),
      I5 => sel(0),
      O => \p_0_out_inferred__0/product10_i_725_n_0\
    );
\p_0_out_inferred__0/product10_i_726\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00001111FFFEEEEE"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(1),
      I3 => sel(2),
      I4 => sel(3),
      I5 => sel(0),
      O => \p_0_out_inferred__0/product10_i_726_n_0\
    );
\p_0_out_inferred__0/product10_i_727\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B33000004CCFFFFF"
    )
        port map (
      I0 => sel(1),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(2),
      I4 => sel(4),
      I5 => sel(0),
      O => \p_0_out_inferred__0/product10_i_727_n_0\
    );
\p_0_out_inferred__0/product10_i_728\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0E71C7388678E71A"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(2),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_728_n_0\
    );
\p_0_out_inferred__0/product10_i_729\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"645D2664BAA2D9BB"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(2),
      I3 => sel(3),
      I4 => sel(0),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_729_n_0\
    );
\p_0_out_inferred__0/product10_i_73\: unisim.vcomponents.MUXF8
     port map (
      I0 => \p_0_out_inferred__0/product10_i_182_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_183_n_0\,
      O => \p_0_out_inferred__0/product10_i_73_n_0\,
      S => sel(6)
    );
\p_0_out_inferred__0/product10_i_730\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"333CC3338CC73C8C"
    )
        port map (
      I0 => sel(2),
      I1 => sel(4),
      I2 => sel(11),
      I3 => sel(0),
      I4 => sel(3),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_730_n_0\
    );
\p_0_out_inferred__0/product10_i_731\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"59596565A6A79AA6"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(2),
      I4 => sel(0),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_731_n_0\
    );
\p_0_out_inferred__0/product10_i_732\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"65E659758A9966AA"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(2),
      I3 => sel(0),
      I4 => sel(3),
      I5 => sel(1),
      O => \p_0_out_inferred__0/product10_i_732_n_0\
    );
\p_0_out_inferred__0/product10_i_733\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"791AA779A6711AA6"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(1),
      I4 => sel(0),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_733_n_0\
    );
\p_0_out_inferred__0/product10_i_734\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0EF8C30F38E30F38"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_734_n_0\
    );
\p_0_out_inferred__0/product10_i_735\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BDD24B2DD4432FB4"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_735_n_0\
    );
\p_0_out_inferred__0/product10_i_736\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A995566AA995522B"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(0),
      I4 => sel(1),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_736_n_0\
    );
\p_0_out_inferred__0/product10_i_737\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DBF32C0C2C4DF3B3"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(2),
      I3 => sel(1),
      I4 => sel(3),
      I5 => sel(0),
      O => \p_0_out_inferred__0/product10_i_737_n_0\
    );
\p_0_out_inferred__0/product10_i_738\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9A59716465A29A59"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(1),
      I3 => sel(3),
      I4 => sel(0),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_738_n_0\
    );
\p_0_out_inferred__0/product10_i_739\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF3700CC01C8FF33"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(3),
      I3 => sel(1),
      I4 => sel(0),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_739_n_0\
    );
\p_0_out_inferred__0/product10_i_74\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"01010101FFFEFEFE"
    )
        port map (
      I0 => sel(6),
      I1 => sel(5),
      I2 => sel(4),
      I3 => sel(3),
      I4 => \p_0_out_inferred__0/product10_i_184_n_0\,
      I5 => sel(11),
      O => \p_0_out_inferred__0/product10_i_74_n_0\
    );
\p_0_out_inferred__0/product10_i_740\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4DDBA424B624DBF3"
    )
        port map (
      I0 => sel(4),
      I1 => sel(11),
      I2 => sel(1),
      I3 => sel(3),
      I4 => sel(0),
      I5 => sel(2),
      O => \p_0_out_inferred__0/product10_i_740_n_0\
    );
\p_0_out_inferred__0/product10_i_75\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => sel(11),
      I1 => \p_0_out_inferred__0/product10_i_185_n_0\,
      I2 => sel(6),
      I3 => \p_0_out_inferred__0/product10_i_186_n_0\,
      I4 => sel(5),
      I5 => \p_0_out_inferred__0/product10_i_173_n_0\,
      O => \p_0_out_inferred__0/product10_i_75_n_0\
    );
\p_0_out_inferred__0/product10_i_76\: unisim.vcomponents.MUXF8
     port map (
      I0 => \p_0_out_inferred__0/product10_i_187_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_188_n_0\,
      O => \p_0_out_inferred__0/product10_i_76_n_0\,
      S => sel(6)
    );
\p_0_out_inferred__0/product10_i_77\: unisim.vcomponents.MUXF8
     port map (
      I0 => \p_0_out_inferred__0/product10_i_189_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_190_n_0\,
      O => \p_0_out_inferred__0/product10_i_77_n_0\,
      S => sel(6)
    );
\p_0_out_inferred__0/product10_i_78\: unisim.vcomponents.MUXF8
     port map (
      I0 => \p_0_out_inferred__0/product10_i_191_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_192_n_0\,
      O => \p_0_out_inferred__0/product10_i_78_n_0\,
      S => sel(6)
    );
\p_0_out_inferred__0/product10_i_79\: unisim.vcomponents.MUXF8
     port map (
      I0 => \p_0_out_inferred__0/product10_i_193_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_194_n_0\,
      O => \p_0_out_inferred__0/product10_i_79_n_0\,
      S => sel(6)
    );
\p_0_out_inferred__0/product10_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_28_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_29_n_0\,
      I2 => sel(9),
      I3 => \p_0_out_inferred__0/product10_i_30_n_0\,
      I4 => sel(10),
      I5 => \p_0_out_inferred__0/product10_i_31_n_0\,
      O => p_0_out(4)
    );
\p_0_out_inferred__0/product10_i_80\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_162_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_195_n_0\,
      I2 => sel(6),
      I3 => \p_0_out_inferred__0/product10_i_196_n_0\,
      I4 => sel(5),
      I5 => sel(11),
      O => \p_0_out_inferred__0/product10_i_80_n_0\
    );
\p_0_out_inferred__0/product10_i_81\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0000000CFFFFFFF"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_197_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_198_n_0\,
      I2 => sel(4),
      I3 => sel(5),
      I4 => sel(6),
      I5 => sel(11),
      O => \p_0_out_inferred__0/product10_i_81_n_0\
    );
\p_0_out_inferred__0/product10_i_82\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_199_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_200_n_0\,
      I2 => sel(7),
      I3 => \p_0_out_inferred__0/product10_i_201_n_0\,
      I4 => sel(6),
      I5 => \p_0_out_inferred__0/product10_i_202_n_0\,
      O => \p_0_out_inferred__0/product10_i_82_n_0\
    );
\p_0_out_inferred__0/product10_i_83\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_203_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_204_n_0\,
      I2 => sel(7),
      I3 => \p_0_out_inferred__0/product10_i_205_n_0\,
      I4 => sel(6),
      I5 => \p_0_out_inferred__0/product10_i_206_n_0\,
      O => \p_0_out_inferred__0/product10_i_83_n_0\
    );
\p_0_out_inferred__0/product10_i_84\: unisim.vcomponents.MUXF8
     port map (
      I0 => \p_0_out_inferred__0/product10_i_207_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_208_n_0\,
      O => \p_0_out_inferred__0/product10_i_84_n_0\,
      S => sel(6)
    );
\p_0_out_inferred__0/product10_i_85\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8F3B8C0"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_209_n_0\,
      I1 => sel(6),
      I2 => \p_0_out_inferred__0/product10_i_210_n_0\,
      I3 => sel(5),
      I4 => \p_0_out_inferred__0/product10_i_211_n_0\,
      O => \p_0_out_inferred__0/product10_i_85_n_0\
    );
\p_0_out_inferred__0/product10_i_86\: unisim.vcomponents.MUXF8
     port map (
      I0 => \p_0_out_inferred__0/product10_i_212_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_213_n_0\,
      O => \p_0_out_inferred__0/product10_i_86_n_0\,
      S => sel(6)
    );
\p_0_out_inferred__0/product10_i_87\: unisim.vcomponents.MUXF8
     port map (
      I0 => \p_0_out_inferred__0/product10_i_214_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_215_n_0\,
      O => \p_0_out_inferred__0/product10_i_87_n_0\,
      S => sel(6)
    );
\p_0_out_inferred__0/product10_i_88\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"45504550FAAFFAAA"
    )
        port map (
      I0 => sel(6),
      I1 => \p_0_out_inferred__0/product10_i_198_n_0\,
      I2 => sel(5),
      I3 => sel(4),
      I4 => \p_0_out_inferred__0/product10_i_216_n_0\,
      I5 => sel(11),
      O => \p_0_out_inferred__0/product10_i_88_n_0\
    );
\p_0_out_inferred__0/product10_i_89\: unisim.vcomponents.MUXF8
     port map (
      I0 => \p_0_out_inferred__0/product10_i_217_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_218_n_0\,
      O => \p_0_out_inferred__0/product10_i_89_n_0\,
      S => sel(6)
    );
\p_0_out_inferred__0/product10_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_32_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_33_n_0\,
      I2 => sel(9),
      I3 => \p_0_out_inferred__0/product10_i_34_n_0\,
      I4 => sel(10),
      I5 => \p_0_out_inferred__0/product10_i_35_n_0\,
      O => p_0_out(3)
    );
\p_0_out_inferred__0/product10_i_90\: unisim.vcomponents.MUXF8
     port map (
      I0 => \p_0_out_inferred__0/product10_i_219_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_220_n_0\,
      O => \p_0_out_inferred__0/product10_i_90_n_0\,
      S => sel(6)
    );
\p_0_out_inferred__0/product10_i_91\: unisim.vcomponents.MUXF8
     port map (
      I0 => \p_0_out_inferred__0/product10_i_221_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_222_n_0\,
      O => \p_0_out_inferred__0/product10_i_91_n_0\,
      S => sel(6)
    );
\p_0_out_inferred__0/product10_i_92\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0C0C0AFA0CFCF"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_223_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_224_n_0\,
      I2 => sel(7),
      I3 => \p_0_out_inferred__0/product10_i_225_n_0\,
      I4 => sel(6),
      I5 => sel(11),
      O => \p_0_out_inferred__0/product10_i_92_n_0\
    );
\p_0_out_inferred__0/product10_i_93\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_226_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_227_n_0\,
      I2 => sel(7),
      I3 => \p_0_out_inferred__0/product10_i_228_n_0\,
      I4 => sel(6),
      I5 => \p_0_out_inferred__0/product10_i_229_n_0\,
      O => \p_0_out_inferred__0/product10_i_93_n_0\
    );
\p_0_out_inferred__0/product10_i_94\: unisim.vcomponents.MUXF8
     port map (
      I0 => \p_0_out_inferred__0/product10_i_230_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_231_n_0\,
      O => \p_0_out_inferred__0/product10_i_94_n_0\,
      S => sel(6)
    );
\p_0_out_inferred__0/product10_i_95\: unisim.vcomponents.MUXF8
     port map (
      I0 => \p_0_out_inferred__0/product10_i_232_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_233_n_0\,
      O => \p_0_out_inferred__0/product10_i_95_n_0\,
      S => sel(6)
    );
\p_0_out_inferred__0/product10_i_96\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8F3B8C0"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_234_n_0\,
      I1 => sel(6),
      I2 => \p_0_out_inferred__0/product10_i_235_n_0\,
      I3 => sel(5),
      I4 => \p_0_out_inferred__0/product10_i_236_n_0\,
      O => \p_0_out_inferred__0/product10_i_96_n_0\
    );
\p_0_out_inferred__0/product10_i_97\: unisim.vcomponents.MUXF8
     port map (
      I0 => \p_0_out_inferred__0/product10_i_237_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_238_n_0\,
      O => \p_0_out_inferred__0/product10_i_97_n_0\,
      S => sel(6)
    );
\p_0_out_inferred__0/product10_i_98\: unisim.vcomponents.MUXF8
     port map (
      I0 => \p_0_out_inferred__0/product10_i_239_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_240_n_0\,
      O => \p_0_out_inferred__0/product10_i_98_n_0\,
      S => sel(6)
    );
\p_0_out_inferred__0/product10_i_99\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \p_0_out_inferred__0/product10_i_241_n_0\,
      I1 => \p_0_out_inferred__0/product10_i_242_n_0\,
      I2 => sel(6),
      I3 => \p_0_out_inferred__0/product10_i_243_n_0\,
      I4 => sel(5),
      I5 => \p_0_out_inferred__0/product10_i_244_n_0\,
      O => \p_0_out_inferred__0/product10_i_99_n_0\
    );
\phase_accumulator[11]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^reference_ftw\(11),
      I1 => E(0),
      O => \phase_accumulator[11]_i_2_n_0\
    );
\phase_accumulator[11]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^reference_ftw\(10),
      I1 => E(0),
      O => \phase_accumulator[11]_i_3_n_0\
    );
\phase_accumulator[11]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^reference_ftw\(9),
      I1 => E(0),
      O => \phase_accumulator[11]_i_4_n_0\
    );
\phase_accumulator[11]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^reference_ftw\(8),
      I1 => E(0),
      O => \phase_accumulator[11]_i_5_n_0\
    );
\phase_accumulator[11]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"60"
    )
        port map (
      I0 => \^reference_ftw\(11),
      I1 => phase_accumulator(11),
      I2 => E(0),
      O => \phase_accumulator[11]_i_6_n_0\
    );
\phase_accumulator[11]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"60"
    )
        port map (
      I0 => \^reference_ftw\(10),
      I1 => phase_accumulator(10),
      I2 => E(0),
      O => \phase_accumulator[11]_i_7_n_0\
    );
\phase_accumulator[11]_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"60"
    )
        port map (
      I0 => \^reference_ftw\(9),
      I1 => phase_accumulator(9),
      I2 => E(0),
      O => \phase_accumulator[11]_i_8_n_0\
    );
\phase_accumulator[11]_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"60"
    )
        port map (
      I0 => \^reference_ftw\(8),
      I1 => phase_accumulator(8),
      I2 => E(0),
      O => \phase_accumulator[11]_i_9_n_0\
    );
\phase_accumulator[15]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^reference_ftw\(15),
      I1 => E(0),
      O => \phase_accumulator[15]_i_2_n_0\
    );
\phase_accumulator[15]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^reference_ftw\(14),
      I1 => E(0),
      O => \phase_accumulator[15]_i_3_n_0\
    );
\phase_accumulator[15]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^reference_ftw\(13),
      I1 => E(0),
      O => \phase_accumulator[15]_i_4_n_0\
    );
\phase_accumulator[15]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^reference_ftw\(12),
      I1 => E(0),
      O => \phase_accumulator[15]_i_5_n_0\
    );
\phase_accumulator[15]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"60"
    )
        port map (
      I0 => \^reference_ftw\(15),
      I1 => phase_accumulator(15),
      I2 => E(0),
      O => \phase_accumulator[15]_i_6_n_0\
    );
\phase_accumulator[15]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"60"
    )
        port map (
      I0 => \^reference_ftw\(14),
      I1 => phase_accumulator(14),
      I2 => E(0),
      O => \phase_accumulator[15]_i_7_n_0\
    );
\phase_accumulator[15]_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"60"
    )
        port map (
      I0 => \^reference_ftw\(13),
      I1 => phase_accumulator(13),
      I2 => E(0),
      O => \phase_accumulator[15]_i_8_n_0\
    );
\phase_accumulator[15]_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"60"
    )
        port map (
      I0 => \^reference_ftw\(12),
      I1 => phase_accumulator(12),
      I2 => E(0),
      O => \phase_accumulator[15]_i_9_n_0\
    );
\phase_accumulator[19]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^reference_ftw\(19),
      I1 => E(0),
      O => \phase_accumulator[19]_i_2_n_0\
    );
\phase_accumulator[19]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^reference_ftw\(18),
      I1 => E(0),
      O => \phase_accumulator[19]_i_3_n_0\
    );
\phase_accumulator[19]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^reference_ftw\(17),
      I1 => E(0),
      O => \phase_accumulator[19]_i_4_n_0\
    );
\phase_accumulator[19]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^reference_ftw\(16),
      I1 => E(0),
      O => \phase_accumulator[19]_i_5_n_0\
    );
\phase_accumulator[19]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"60"
    )
        port map (
      I0 => \^reference_ftw\(19),
      I1 => phase_accumulator(19),
      I2 => E(0),
      O => \phase_accumulator[19]_i_6_n_0\
    );
\phase_accumulator[19]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"60"
    )
        port map (
      I0 => \^reference_ftw\(18),
      I1 => phase_accumulator(18),
      I2 => E(0),
      O => \phase_accumulator[19]_i_7_n_0\
    );
\phase_accumulator[19]_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"60"
    )
        port map (
      I0 => \^reference_ftw\(17),
      I1 => phase_accumulator(17),
      I2 => E(0),
      O => \phase_accumulator[19]_i_8_n_0\
    );
\phase_accumulator[19]_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"60"
    )
        port map (
      I0 => \^reference_ftw\(16),
      I1 => phase_accumulator(16),
      I2 => E(0),
      O => \phase_accumulator[19]_i_9_n_0\
    );
\phase_accumulator[23]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^reference_ftw\(23),
      I1 => E(0),
      O => \phase_accumulator[23]_i_2_n_0\
    );
\phase_accumulator[23]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^reference_ftw\(22),
      I1 => E(0),
      O => \phase_accumulator[23]_i_3_n_0\
    );
\phase_accumulator[23]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^reference_ftw\(21),
      I1 => E(0),
      O => \phase_accumulator[23]_i_4_n_0\
    );
\phase_accumulator[23]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^reference_ftw\(20),
      I1 => E(0),
      O => \phase_accumulator[23]_i_5_n_0\
    );
\phase_accumulator[23]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"60"
    )
        port map (
      I0 => \^reference_ftw\(23),
      I1 => phase_accumulator(23),
      I2 => E(0),
      O => \phase_accumulator[23]_i_6_n_0\
    );
\phase_accumulator[23]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"60"
    )
        port map (
      I0 => \^reference_ftw\(22),
      I1 => phase_accumulator(22),
      I2 => E(0),
      O => \phase_accumulator[23]_i_7_n_0\
    );
\phase_accumulator[23]_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"60"
    )
        port map (
      I0 => \^reference_ftw\(21),
      I1 => phase_accumulator(21),
      I2 => E(0),
      O => \phase_accumulator[23]_i_8_n_0\
    );
\phase_accumulator[23]_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"60"
    )
        port map (
      I0 => \^reference_ftw\(20),
      I1 => phase_accumulator(20),
      I2 => E(0),
      O => \phase_accumulator[23]_i_9_n_0\
    );
\phase_accumulator[27]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^reference_ftw\(27),
      I1 => E(0),
      O => \phase_accumulator[27]_i_2_n_0\
    );
\phase_accumulator[27]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^reference_ftw\(26),
      I1 => E(0),
      O => \phase_accumulator[27]_i_3_n_0\
    );
\phase_accumulator[27]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^reference_ftw\(25),
      I1 => E(0),
      O => \phase_accumulator[27]_i_4_n_0\
    );
\phase_accumulator[27]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^reference_ftw\(24),
      I1 => E(0),
      O => \phase_accumulator[27]_i_5_n_0\
    );
\phase_accumulator[27]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"60"
    )
        port map (
      I0 => \^reference_ftw\(27),
      I1 => phase_accumulator(27),
      I2 => E(0),
      O => \phase_accumulator[27]_i_6_n_0\
    );
\phase_accumulator[27]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"60"
    )
        port map (
      I0 => \^reference_ftw\(26),
      I1 => phase_accumulator(26),
      I2 => E(0),
      O => \phase_accumulator[27]_i_7_n_0\
    );
\phase_accumulator[27]_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"60"
    )
        port map (
      I0 => \^reference_ftw\(25),
      I1 => phase_accumulator(25),
      I2 => E(0),
      O => \phase_accumulator[27]_i_8_n_0\
    );
\phase_accumulator[27]_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"60"
    )
        port map (
      I0 => \^reference_ftw\(24),
      I1 => phase_accumulator(24),
      I2 => E(0),
      O => \phase_accumulator[27]_i_9_n_0\
    );
\phase_accumulator[31]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^reference_ftw\(30),
      I1 => E(0),
      O => \phase_accumulator[31]_i_3_n_0\
    );
\phase_accumulator[31]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^reference_ftw\(29),
      I1 => E(0),
      O => \phase_accumulator[31]_i_4_n_0\
    );
\phase_accumulator[31]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^reference_ftw\(28),
      I1 => E(0),
      O => \phase_accumulator[31]_i_5_n_0\
    );
\phase_accumulator[31]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"60"
    )
        port map (
      I0 => \^reference_ftw\(31),
      I1 => phase_accumulator(31),
      I2 => E(0),
      O => \phase_accumulator[31]_i_6_n_0\
    );
\phase_accumulator[31]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"60"
    )
        port map (
      I0 => \^reference_ftw\(30),
      I1 => phase_accumulator(30),
      I2 => E(0),
      O => \phase_accumulator[31]_i_7_n_0\
    );
\phase_accumulator[31]_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"60"
    )
        port map (
      I0 => \^reference_ftw\(29),
      I1 => phase_accumulator(29),
      I2 => E(0),
      O => \phase_accumulator[31]_i_8_n_0\
    );
\phase_accumulator[31]_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"60"
    )
        port map (
      I0 => \^reference_ftw\(28),
      I1 => phase_accumulator(28),
      I2 => E(0),
      O => \phase_accumulator[31]_i_9_n_0\
    );
\phase_accumulator[3]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^reference_ftw\(3),
      I1 => E(0),
      O => \phase_accumulator[3]_i_2_n_0\
    );
\phase_accumulator[3]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^reference_ftw\(2),
      I1 => E(0),
      O => \phase_accumulator[3]_i_3_n_0\
    );
\phase_accumulator[3]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^reference_ftw\(1),
      I1 => E(0),
      O => \phase_accumulator[3]_i_4_n_0\
    );
\phase_accumulator[3]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^reference_ftw\(0),
      I1 => E(0),
      O => \phase_accumulator[3]_i_5_n_0\
    );
\phase_accumulator[3]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"60"
    )
        port map (
      I0 => \^reference_ftw\(3),
      I1 => phase_accumulator(3),
      I2 => E(0),
      O => \phase_accumulator[3]_i_6_n_0\
    );
\phase_accumulator[3]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"60"
    )
        port map (
      I0 => \^reference_ftw\(2),
      I1 => phase_accumulator(2),
      I2 => E(0),
      O => \phase_accumulator[3]_i_7_n_0\
    );
\phase_accumulator[3]_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"60"
    )
        port map (
      I0 => \^reference_ftw\(1),
      I1 => phase_accumulator(1),
      I2 => E(0),
      O => \phase_accumulator[3]_i_8_n_0\
    );
\phase_accumulator[3]_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"60"
    )
        port map (
      I0 => \^reference_ftw\(0),
      I1 => phase_accumulator(0),
      I2 => E(0),
      O => \phase_accumulator[3]_i_9_n_0\
    );
\phase_accumulator[7]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^reference_ftw\(7),
      I1 => E(0),
      O => \phase_accumulator[7]_i_2_n_0\
    );
\phase_accumulator[7]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^reference_ftw\(6),
      I1 => E(0),
      O => \phase_accumulator[7]_i_3_n_0\
    );
\phase_accumulator[7]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^reference_ftw\(5),
      I1 => E(0),
      O => \phase_accumulator[7]_i_4_n_0\
    );
\phase_accumulator[7]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^reference_ftw\(4),
      I1 => E(0),
      O => \phase_accumulator[7]_i_5_n_0\
    );
\phase_accumulator[7]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"60"
    )
        port map (
      I0 => \^reference_ftw\(7),
      I1 => phase_accumulator(7),
      I2 => E(0),
      O => \phase_accumulator[7]_i_6_n_0\
    );
\phase_accumulator[7]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"60"
    )
        port map (
      I0 => \^reference_ftw\(6),
      I1 => phase_accumulator(6),
      I2 => E(0),
      O => \phase_accumulator[7]_i_7_n_0\
    );
\phase_accumulator[7]_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"60"
    )
        port map (
      I0 => \^reference_ftw\(5),
      I1 => phase_accumulator(5),
      I2 => E(0),
      O => \phase_accumulator[7]_i_8_n_0\
    );
\phase_accumulator[7]_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"60"
    )
        port map (
      I0 => \^reference_ftw\(4),
      I1 => phase_accumulator(4),
      I2 => E(0),
      O => \phase_accumulator[7]_i_9_n_0\
    );
\phase_accumulator_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \phase_accumulator_reg[31]_0\(0),
      CLR => \^sample_resetn_0\,
      D => \phase_accumulator_reg[3]_i_1_n_7\,
      Q => phase_accumulator(0)
    );
\phase_accumulator_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \phase_accumulator_reg[31]_0\(0),
      CLR => \^sample_resetn_0\,
      D => \phase_accumulator_reg[11]_i_1_n_5\,
      Q => phase_accumulator(10)
    );
\phase_accumulator_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \phase_accumulator_reg[31]_0\(0),
      CLR => \^sample_resetn_0\,
      D => \phase_accumulator_reg[11]_i_1_n_4\,
      Q => phase_accumulator(11)
    );
\phase_accumulator_reg[11]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \phase_accumulator_reg[7]_i_1_n_0\,
      CO(3) => \phase_accumulator_reg[11]_i_1_n_0\,
      CO(2) => \phase_accumulator_reg[11]_i_1_n_1\,
      CO(1) => \phase_accumulator_reg[11]_i_1_n_2\,
      CO(0) => \phase_accumulator_reg[11]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => \phase_accumulator[11]_i_2_n_0\,
      DI(2) => \phase_accumulator[11]_i_3_n_0\,
      DI(1) => \phase_accumulator[11]_i_4_n_0\,
      DI(0) => \phase_accumulator[11]_i_5_n_0\,
      O(3) => \phase_accumulator_reg[11]_i_1_n_4\,
      O(2) => \phase_accumulator_reg[11]_i_1_n_5\,
      O(1) => \phase_accumulator_reg[11]_i_1_n_6\,
      O(0) => \phase_accumulator_reg[11]_i_1_n_7\,
      S(3) => \phase_accumulator[11]_i_6_n_0\,
      S(2) => \phase_accumulator[11]_i_7_n_0\,
      S(1) => \phase_accumulator[11]_i_8_n_0\,
      S(0) => \phase_accumulator[11]_i_9_n_0\
    );
\phase_accumulator_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \phase_accumulator_reg[31]_0\(0),
      CLR => \^sample_resetn_0\,
      D => \phase_accumulator_reg[15]_i_1_n_7\,
      Q => phase_accumulator(12)
    );
\phase_accumulator_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \phase_accumulator_reg[31]_0\(0),
      CLR => \^sample_resetn_0\,
      D => \phase_accumulator_reg[15]_i_1_n_6\,
      Q => phase_accumulator(13)
    );
\phase_accumulator_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \phase_accumulator_reg[31]_0\(0),
      CLR => \^sample_resetn_0\,
      D => \phase_accumulator_reg[15]_i_1_n_5\,
      Q => phase_accumulator(14)
    );
\phase_accumulator_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \phase_accumulator_reg[31]_0\(0),
      CLR => \^sample_resetn_0\,
      D => \phase_accumulator_reg[15]_i_1_n_4\,
      Q => phase_accumulator(15)
    );
\phase_accumulator_reg[15]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \phase_accumulator_reg[11]_i_1_n_0\,
      CO(3) => \phase_accumulator_reg[15]_i_1_n_0\,
      CO(2) => \phase_accumulator_reg[15]_i_1_n_1\,
      CO(1) => \phase_accumulator_reg[15]_i_1_n_2\,
      CO(0) => \phase_accumulator_reg[15]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => \phase_accumulator[15]_i_2_n_0\,
      DI(2) => \phase_accumulator[15]_i_3_n_0\,
      DI(1) => \phase_accumulator[15]_i_4_n_0\,
      DI(0) => \phase_accumulator[15]_i_5_n_0\,
      O(3) => \phase_accumulator_reg[15]_i_1_n_4\,
      O(2) => \phase_accumulator_reg[15]_i_1_n_5\,
      O(1) => \phase_accumulator_reg[15]_i_1_n_6\,
      O(0) => \phase_accumulator_reg[15]_i_1_n_7\,
      S(3) => \phase_accumulator[15]_i_6_n_0\,
      S(2) => \phase_accumulator[15]_i_7_n_0\,
      S(1) => \phase_accumulator[15]_i_8_n_0\,
      S(0) => \phase_accumulator[15]_i_9_n_0\
    );
\phase_accumulator_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \phase_accumulator_reg[31]_0\(0),
      CLR => \^sample_resetn_0\,
      D => \phase_accumulator_reg[19]_i_1_n_7\,
      Q => phase_accumulator(16)
    );
\phase_accumulator_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \phase_accumulator_reg[31]_0\(0),
      CLR => \^sample_resetn_0\,
      D => \phase_accumulator_reg[19]_i_1_n_6\,
      Q => phase_accumulator(17)
    );
\phase_accumulator_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \phase_accumulator_reg[31]_0\(0),
      CLR => \^sample_resetn_0\,
      D => \phase_accumulator_reg[19]_i_1_n_5\,
      Q => phase_accumulator(18)
    );
\phase_accumulator_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \phase_accumulator_reg[31]_0\(0),
      CLR => \^sample_resetn_0\,
      D => \phase_accumulator_reg[19]_i_1_n_4\,
      Q => phase_accumulator(19)
    );
\phase_accumulator_reg[19]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \phase_accumulator_reg[15]_i_1_n_0\,
      CO(3) => \phase_accumulator_reg[19]_i_1_n_0\,
      CO(2) => \phase_accumulator_reg[19]_i_1_n_1\,
      CO(1) => \phase_accumulator_reg[19]_i_1_n_2\,
      CO(0) => \phase_accumulator_reg[19]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => \phase_accumulator[19]_i_2_n_0\,
      DI(2) => \phase_accumulator[19]_i_3_n_0\,
      DI(1) => \phase_accumulator[19]_i_4_n_0\,
      DI(0) => \phase_accumulator[19]_i_5_n_0\,
      O(3) => \phase_accumulator_reg[19]_i_1_n_4\,
      O(2) => \phase_accumulator_reg[19]_i_1_n_5\,
      O(1) => \phase_accumulator_reg[19]_i_1_n_6\,
      O(0) => \phase_accumulator_reg[19]_i_1_n_7\,
      S(3) => \phase_accumulator[19]_i_6_n_0\,
      S(2) => \phase_accumulator[19]_i_7_n_0\,
      S(1) => \phase_accumulator[19]_i_8_n_0\,
      S(0) => \phase_accumulator[19]_i_9_n_0\
    );
\phase_accumulator_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \phase_accumulator_reg[31]_0\(0),
      CLR => \^sample_resetn_0\,
      D => \phase_accumulator_reg[3]_i_1_n_6\,
      Q => phase_accumulator(1)
    );
\phase_accumulator_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \phase_accumulator_reg[31]_0\(0),
      CLR => \^sample_resetn_0\,
      D => \phase_accumulator_reg[23]_i_1_n_7\,
      Q => phase_accumulator(20)
    );
\phase_accumulator_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \phase_accumulator_reg[31]_0\(0),
      CLR => \^sample_resetn_0\,
      D => \phase_accumulator_reg[23]_i_1_n_6\,
      Q => phase_accumulator(21)
    );
\phase_accumulator_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \phase_accumulator_reg[31]_0\(0),
      CLR => \^sample_resetn_0\,
      D => \phase_accumulator_reg[23]_i_1_n_5\,
      Q => phase_accumulator(22)
    );
\phase_accumulator_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \phase_accumulator_reg[31]_0\(0),
      CLR => \^sample_resetn_0\,
      D => \phase_accumulator_reg[23]_i_1_n_4\,
      Q => phase_accumulator(23)
    );
\phase_accumulator_reg[23]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \phase_accumulator_reg[19]_i_1_n_0\,
      CO(3) => \phase_accumulator_reg[23]_i_1_n_0\,
      CO(2) => \phase_accumulator_reg[23]_i_1_n_1\,
      CO(1) => \phase_accumulator_reg[23]_i_1_n_2\,
      CO(0) => \phase_accumulator_reg[23]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => \phase_accumulator[23]_i_2_n_0\,
      DI(2) => \phase_accumulator[23]_i_3_n_0\,
      DI(1) => \phase_accumulator[23]_i_4_n_0\,
      DI(0) => \phase_accumulator[23]_i_5_n_0\,
      O(3) => \phase_accumulator_reg[23]_i_1_n_4\,
      O(2) => \phase_accumulator_reg[23]_i_1_n_5\,
      O(1) => \phase_accumulator_reg[23]_i_1_n_6\,
      O(0) => \phase_accumulator_reg[23]_i_1_n_7\,
      S(3) => \phase_accumulator[23]_i_6_n_0\,
      S(2) => \phase_accumulator[23]_i_7_n_0\,
      S(1) => \phase_accumulator[23]_i_8_n_0\,
      S(0) => \phase_accumulator[23]_i_9_n_0\
    );
\phase_accumulator_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \phase_accumulator_reg[31]_0\(0),
      CLR => \^sample_resetn_0\,
      D => \phase_accumulator_reg[27]_i_1_n_7\,
      Q => phase_accumulator(24)
    );
\phase_accumulator_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \phase_accumulator_reg[31]_0\(0),
      CLR => \^sample_resetn_0\,
      D => \phase_accumulator_reg[27]_i_1_n_6\,
      Q => phase_accumulator(25)
    );
\phase_accumulator_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \phase_accumulator_reg[31]_0\(0),
      CLR => \^sample_resetn_0\,
      D => \phase_accumulator_reg[27]_i_1_n_5\,
      Q => phase_accumulator(26)
    );
\phase_accumulator_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \phase_accumulator_reg[31]_0\(0),
      CLR => \^sample_resetn_0\,
      D => \phase_accumulator_reg[27]_i_1_n_4\,
      Q => phase_accumulator(27)
    );
\phase_accumulator_reg[27]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \phase_accumulator_reg[23]_i_1_n_0\,
      CO(3) => \phase_accumulator_reg[27]_i_1_n_0\,
      CO(2) => \phase_accumulator_reg[27]_i_1_n_1\,
      CO(1) => \phase_accumulator_reg[27]_i_1_n_2\,
      CO(0) => \phase_accumulator_reg[27]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => \phase_accumulator[27]_i_2_n_0\,
      DI(2) => \phase_accumulator[27]_i_3_n_0\,
      DI(1) => \phase_accumulator[27]_i_4_n_0\,
      DI(0) => \phase_accumulator[27]_i_5_n_0\,
      O(3) => \phase_accumulator_reg[27]_i_1_n_4\,
      O(2) => \phase_accumulator_reg[27]_i_1_n_5\,
      O(1) => \phase_accumulator_reg[27]_i_1_n_6\,
      O(0) => \phase_accumulator_reg[27]_i_1_n_7\,
      S(3) => \phase_accumulator[27]_i_6_n_0\,
      S(2) => \phase_accumulator[27]_i_7_n_0\,
      S(1) => \phase_accumulator[27]_i_8_n_0\,
      S(0) => \phase_accumulator[27]_i_9_n_0\
    );
\phase_accumulator_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \phase_accumulator_reg[31]_0\(0),
      CLR => \^sample_resetn_0\,
      D => \phase_accumulator_reg[31]_i_2_n_7\,
      Q => phase_accumulator(28)
    );
\phase_accumulator_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \phase_accumulator_reg[31]_0\(0),
      CLR => \^sample_resetn_0\,
      D => \phase_accumulator_reg[31]_i_2_n_6\,
      Q => phase_accumulator(29)
    );
\phase_accumulator_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \phase_accumulator_reg[31]_0\(0),
      CLR => \^sample_resetn_0\,
      D => \phase_accumulator_reg[3]_i_1_n_5\,
      Q => phase_accumulator(2)
    );
\phase_accumulator_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \phase_accumulator_reg[31]_0\(0),
      CLR => \^sample_resetn_0\,
      D => \phase_accumulator_reg[31]_i_2_n_5\,
      Q => phase_accumulator(30)
    );
\phase_accumulator_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \phase_accumulator_reg[31]_0\(0),
      CLR => \^sample_resetn_0\,
      D => \phase_accumulator_reg[31]_i_2_n_4\,
      Q => phase_accumulator(31)
    );
\phase_accumulator_reg[31]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \phase_accumulator_reg[27]_i_1_n_0\,
      CO(3) => \NLW_phase_accumulator_reg[31]_i_2_CO_UNCONNECTED\(3),
      CO(2) => \phase_accumulator_reg[31]_i_2_n_1\,
      CO(1) => \phase_accumulator_reg[31]_i_2_n_2\,
      CO(0) => \phase_accumulator_reg[31]_i_2_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => \phase_accumulator[31]_i_3_n_0\,
      DI(1) => \phase_accumulator[31]_i_4_n_0\,
      DI(0) => \phase_accumulator[31]_i_5_n_0\,
      O(3) => \phase_accumulator_reg[31]_i_2_n_4\,
      O(2) => \phase_accumulator_reg[31]_i_2_n_5\,
      O(1) => \phase_accumulator_reg[31]_i_2_n_6\,
      O(0) => \phase_accumulator_reg[31]_i_2_n_7\,
      S(3) => \phase_accumulator[31]_i_6_n_0\,
      S(2) => \phase_accumulator[31]_i_7_n_0\,
      S(1) => \phase_accumulator[31]_i_8_n_0\,
      S(0) => \phase_accumulator[31]_i_9_n_0\
    );
\phase_accumulator_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \phase_accumulator_reg[31]_0\(0),
      CLR => \^sample_resetn_0\,
      D => \phase_accumulator_reg[3]_i_1_n_4\,
      Q => phase_accumulator(3)
    );
\phase_accumulator_reg[3]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \phase_accumulator_reg[3]_i_1_n_0\,
      CO(2) => \phase_accumulator_reg[3]_i_1_n_1\,
      CO(1) => \phase_accumulator_reg[3]_i_1_n_2\,
      CO(0) => \phase_accumulator_reg[3]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => \phase_accumulator[3]_i_2_n_0\,
      DI(2) => \phase_accumulator[3]_i_3_n_0\,
      DI(1) => \phase_accumulator[3]_i_4_n_0\,
      DI(0) => \phase_accumulator[3]_i_5_n_0\,
      O(3) => \phase_accumulator_reg[3]_i_1_n_4\,
      O(2) => \phase_accumulator_reg[3]_i_1_n_5\,
      O(1) => \phase_accumulator_reg[3]_i_1_n_6\,
      O(0) => \phase_accumulator_reg[3]_i_1_n_7\,
      S(3) => \phase_accumulator[3]_i_6_n_0\,
      S(2) => \phase_accumulator[3]_i_7_n_0\,
      S(1) => \phase_accumulator[3]_i_8_n_0\,
      S(0) => \phase_accumulator[3]_i_9_n_0\
    );
\phase_accumulator_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \phase_accumulator_reg[31]_0\(0),
      CLR => \^sample_resetn_0\,
      D => \phase_accumulator_reg[7]_i_1_n_7\,
      Q => phase_accumulator(4)
    );
\phase_accumulator_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \phase_accumulator_reg[31]_0\(0),
      CLR => \^sample_resetn_0\,
      D => \phase_accumulator_reg[7]_i_1_n_6\,
      Q => phase_accumulator(5)
    );
\phase_accumulator_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \phase_accumulator_reg[31]_0\(0),
      CLR => \^sample_resetn_0\,
      D => \phase_accumulator_reg[7]_i_1_n_5\,
      Q => phase_accumulator(6)
    );
\phase_accumulator_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \phase_accumulator_reg[31]_0\(0),
      CLR => \^sample_resetn_0\,
      D => \phase_accumulator_reg[7]_i_1_n_4\,
      Q => phase_accumulator(7)
    );
\phase_accumulator_reg[7]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \phase_accumulator_reg[3]_i_1_n_0\,
      CO(3) => \phase_accumulator_reg[7]_i_1_n_0\,
      CO(2) => \phase_accumulator_reg[7]_i_1_n_1\,
      CO(1) => \phase_accumulator_reg[7]_i_1_n_2\,
      CO(0) => \phase_accumulator_reg[7]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => \phase_accumulator[7]_i_2_n_0\,
      DI(2) => \phase_accumulator[7]_i_3_n_0\,
      DI(1) => \phase_accumulator[7]_i_4_n_0\,
      DI(0) => \phase_accumulator[7]_i_5_n_0\,
      O(3) => \phase_accumulator_reg[7]_i_1_n_4\,
      O(2) => \phase_accumulator_reg[7]_i_1_n_5\,
      O(1) => \phase_accumulator_reg[7]_i_1_n_6\,
      O(0) => \phase_accumulator_reg[7]_i_1_n_7\,
      S(3) => \phase_accumulator[7]_i_6_n_0\,
      S(2) => \phase_accumulator[7]_i_7_n_0\,
      S(1) => \phase_accumulator[7]_i_8_n_0\,
      S(0) => \phase_accumulator[7]_i_9_n_0\
    );
\phase_accumulator_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \phase_accumulator_reg[31]_0\(0),
      CLR => \^sample_resetn_0\,
      D => \phase_accumulator_reg[11]_i_1_n_7\,
      Q => phase_accumulator(8)
    );
\phase_accumulator_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \phase_accumulator_reg[31]_0\(0),
      CLR => \^sample_resetn_0\,
      D => \phase_accumulator_reg[11]_i_1_n_6\,
      Q => phase_accumulator(9)
    );
\phase_offset_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(32),
      Q => phase_offset(0)
    );
\phase_offset_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(42),
      Q => phase_offset(10)
    );
\phase_offset_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(43),
      Q => phase_offset(11)
    );
\phase_offset_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(44),
      Q => phase_offset(12)
    );
\phase_offset_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(45),
      Q => phase_offset(13)
    );
\phase_offset_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(46),
      Q => phase_offset(14)
    );
\phase_offset_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(47),
      Q => phase_offset(15)
    );
\phase_offset_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(48),
      Q => phase_offset(16)
    );
\phase_offset_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(49),
      Q => phase_offset(17)
    );
\phase_offset_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(50),
      Q => phase_offset(18)
    );
\phase_offset_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(51),
      Q => phase_offset(19)
    );
\phase_offset_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(33),
      Q => phase_offset(1)
    );
\phase_offset_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(52),
      Q => phase_offset(20)
    );
\phase_offset_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(53),
      Q => phase_offset(21)
    );
\phase_offset_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(54),
      Q => phase_offset(22)
    );
\phase_offset_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(55),
      Q => phase_offset(23)
    );
\phase_offset_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(56),
      Q => phase_offset(24)
    );
\phase_offset_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(57),
      Q => phase_offset(25)
    );
\phase_offset_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(58),
      Q => phase_offset(26)
    );
\phase_offset_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(59),
      Q => phase_offset(27)
    );
\phase_offset_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(60),
      Q => phase_offset(28)
    );
\phase_offset_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(61),
      Q => phase_offset(29)
    );
\phase_offset_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(34),
      Q => phase_offset(2)
    );
\phase_offset_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(62),
      Q => phase_offset(30)
    );
\phase_offset_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(63),
      Q => phase_offset(31)
    );
\phase_offset_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(35),
      Q => phase_offset(3)
    );
\phase_offset_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(36),
      Q => phase_offset(4)
    );
\phase_offset_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(37),
      Q => phase_offset(5)
    );
\phase_offset_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(38),
      Q => phase_offset(6)
    );
\phase_offset_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(39),
      Q => phase_offset(7)
    );
\phase_offset_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(40),
      Q => phase_offset(8)
    );
\phase_offset_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reference_config_ftw0,
      CLR => \^sample_resetn_0\,
      D => Q(41),
      Q => phase_offset(9)
    );
product10: unisim.vcomponents.DSP48E1
    generic map(
      ACASCREG => 0,
      ADREG => 1,
      ALUMODEREG => 0,
      AREG => 0,
      AUTORESET_PATDET => "NO_RESET",
      A_INPUT => "DIRECT",
      BCASCREG => 1,
      BREG => 1,
      B_INPUT => "DIRECT",
      CARRYINREG => 0,
      CARRYINSELREG => 0,
      CREG => 1,
      DREG => 1,
      INMODEREG => 0,
      MASK => X"3FFFFFFFFFFF",
      MREG => 0,
      OPMODEREG => 0,
      PATTERN => X"000000000000",
      PREG => 1,
      SEL_MASK => "MASK",
      SEL_PATTERN => "PATTERN",
      USE_DPORT => false,
      USE_MULT => "MULTIPLY",
      USE_PATTERN_DETECT => "NO_PATDET",
      USE_SIMD => "ONE48"
    )
        port map (
      A(29 downto 12) => B"000000000000000000",
      A(11 downto 0) => gain0(11 downto 0),
      ACIN(29 downto 0) => B"000000000000000000000000000000",
      ACOUT(29 downto 0) => NLW_product10_ACOUT_UNCONNECTED(29 downto 0),
      ALUMODE(3 downto 0) => B"0000",
      B(17) => p_0_out(11),
      B(16) => p_0_out(11),
      B(15) => p_0_out(11),
      B(14) => p_0_out(11),
      B(13) => p_0_out(11),
      B(12) => p_0_out(11),
      B(11 downto 0) => p_0_out(11 downto 0),
      BCIN(17 downto 0) => B"000000000000000000",
      BCOUT(17 downto 0) => NLW_product10_BCOUT_UNCONNECTED(17 downto 0),
      C(47 downto 0) => B"111111111111111111111111111111111111111111111111",
      CARRYCASCIN => '0',
      CARRYCASCOUT => NLW_product10_CARRYCASCOUT_UNCONNECTED,
      CARRYIN => '0',
      CARRYINSEL(2 downto 0) => B"000",
      CARRYOUT(3 downto 0) => NLW_product10_CARRYOUT_UNCONNECTED(3 downto 0),
      CEA1 => '0',
      CEA2 => '0',
      CEAD => '0',
      CEALUMODE => '0',
      CEB1 => '0',
      CEB2 => '1',
      CEC => '0',
      CECARRYIN => '0',
      CECTRL => '0',
      CED => '0',
      CEINMODE => '0',
      CEM => '0',
      CEP => E(0),
      CLK => sample_clk,
      D(24 downto 0) => B"0000000000000000000000000",
      INMODE(4 downto 0) => B"00000",
      MULTSIGNIN => '0',
      MULTSIGNOUT => NLW_product10_MULTSIGNOUT_UNCONNECTED,
      OPMODE(6 downto 0) => B"0000101",
      OVERFLOW => NLW_product10_OVERFLOW_UNCONNECTED,
      P(47 downto 25) => NLW_product10_P_UNCONNECTED(47 downto 25),
      P(24) => product10_n_81,
      P(23) => product10_n_82,
      P(22) => product10_n_83,
      P(21) => product10_n_84,
      P(20) => product10_n_85,
      P(19) => product10_n_86,
      P(18) => product10_n_87,
      P(17) => product10_n_88,
      P(16) => product10_n_89,
      P(15) => product10_n_90,
      P(14) => product10_n_91,
      P(13) => product10_n_92,
      P(12) => product10_n_93,
      P(11) => product10_n_94,
      P(10) => product10_n_95,
      P(9) => product10_n_96,
      P(8) => product10_n_97,
      P(7) => product10_n_98,
      P(6) => product10_n_99,
      P(5) => product10_n_100,
      P(4) => product10_n_101,
      P(3) => product10_n_102,
      P(2) => product10_n_103,
      P(1) => product10_n_104,
      P(0) => product10_n_105,
      PATTERNBDETECT => NLW_product10_PATTERNBDETECT_UNCONNECTED,
      PATTERNDETECT => NLW_product10_PATTERNDETECT_UNCONNECTED,
      PCIN(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      PCOUT(47 downto 0) => NLW_product10_PCOUT_UNCONNECTED(47 downto 0),
      RSTA => '0',
      RSTALLCARRYIN => '0',
      RSTALUMODE => '0',
      RSTB => '0',
      RSTC => '0',
      RSTCTRL => '0',
      RSTD => '0',
      RSTINMODE => '0',
      RSTM => '0',
      RSTP => '0',
      UNDERFLOW => NLW_product10_UNDERFLOW_UNCONNECTED
    );
product10_i_334: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => sel(2),
      I1 => sel(3),
      O => product10_i_334_n_0
    );
\reference_valid0_carry__0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => active_tag(23),
      I1 => \^reference_tag\(23),
      I2 => \^reference_tag\(21),
      I3 => active_tag(21),
      I4 => \^reference_tag\(22),
      I5 => active_tag(22),
      O => \active_tag_reg[23]_0\(3)
    );
\reference_valid0_carry__0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => active_tag(20),
      I1 => \^reference_tag\(20),
      I2 => \^reference_tag\(18),
      I3 => active_tag(18),
      I4 => \^reference_tag\(19),
      I5 => active_tag(19),
      O => \active_tag_reg[23]_0\(2)
    );
\reference_valid0_carry__0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => active_tag(17),
      I1 => \^reference_tag\(17),
      I2 => \^reference_tag\(15),
      I3 => active_tag(15),
      I4 => \^reference_tag\(16),
      I5 => active_tag(16),
      O => \active_tag_reg[23]_0\(1)
    );
\reference_valid0_carry__0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => active_tag(14),
      I1 => \^reference_tag\(14),
      I2 => \^reference_tag\(12),
      I3 => active_tag(12),
      I4 => \^reference_tag\(13),
      I5 => active_tag(13),
      O => \active_tag_reg[23]_0\(0)
    );
\reference_valid0_carry__1_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => active_tag(31),
      I1 => \^reference_tag\(31),
      I2 => active_tag(30),
      I3 => \^reference_tag\(30),
      O => \active_tag_reg[31]_0\(2)
    );
\reference_valid0_carry__1_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => active_tag(29),
      I1 => \^reference_tag\(29),
      I2 => \^reference_tag\(27),
      I3 => active_tag(27),
      I4 => \^reference_tag\(28),
      I5 => active_tag(28),
      O => \active_tag_reg[31]_0\(1)
    );
\reference_valid0_carry__1_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \^reference_tag\(26),
      I1 => active_tag(26),
      I2 => \^reference_tag\(24),
      I3 => active_tag(24),
      I4 => active_tag(25),
      I5 => \^reference_tag\(25),
      O => \active_tag_reg[31]_0\(0)
    );
reference_valid0_carry_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => active_tag(11),
      I1 => \^reference_tag\(11),
      I2 => \^reference_tag\(10),
      I3 => active_tag(10),
      I4 => \^reference_tag\(9),
      I5 => active_tag(9),
      O => \active_tag_reg[11]_0\(3)
    );
reference_valid0_carry_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \^reference_tag\(8),
      I1 => active_tag(8),
      I2 => \^reference_tag\(6),
      I3 => active_tag(6),
      I4 => active_tag(7),
      I5 => \^reference_tag\(7),
      O => \active_tag_reg[11]_0\(2)
    );
reference_valid0_carry_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => active_tag(5),
      I1 => \^reference_tag\(5),
      I2 => \^reference_tag\(3),
      I3 => active_tag(3),
      I4 => \^reference_tag\(4),
      I5 => active_tag(4),
      O => \active_tag_reg[11]_0\(1)
    );
reference_valid0_carry_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \^reference_tag\(2),
      I1 => active_tag(2),
      I2 => \^reference_tag\(0),
      I3 => active_tag(0),
      I4 => active_tag(1),
      I5 => \^reference_tag\(1),
      O => \active_tag_reg[11]_0\(0)
    );
reference_valid_INST_0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0400000000000000"
    )
        port map (
      I0 => \out\(0),
      I1 => \^d\(0),
      I2 => \^sample_clipped_reg_0\(0),
      I3 => clock_run,
      I4 => sample_valid,
      I5 => reference_valid_0(0),
      O => reference_valid
    );
\reply_data[33]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAA00008000"
    )
        port map (
      I0 => sample_pending,
      I1 => sample_valid,
      I2 => CO(0),
      I3 => awaiting_sample_reg,
      I4 => cfg_accepted,
      I5 => \^d\(1),
      O => sample_pending_reg(0)
    );
sample_active_reg: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_code_reg[0]_0\(0),
      CLR => \^sample_resetn_0\,
      D => sample_active_reg_0,
      Q => \^d\(0)
    );
sample_clipped_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ACACAC0C"
    )
        port map (
      I0 => \^enabled2\,
      I1 => Q(88),
      I2 => E(0),
      I3 => \code2_reg_n_0_[15]\,
      I4 => bounded_code2_carry_n_2,
      O => sample_clipped_i_1_n_0
    );
sample_clipped_reg: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_code_reg[0]_0\(0),
      CLR => \^sample_resetn_0\,
      D => sample_clipped_i_1_n_0,
      Q => \^sample_clipped_reg_0\(0)
    );
\sample_code[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8080808808080800"
    )
        port map (
      I0 => E(0),
      I1 => \^enabled2\,
      I2 => \code2_reg_n_0_[15]\,
      I3 => \code2_reg_n_0_[0]\,
      I4 => bounded_code2_carry_n_2,
      I5 => invert2,
      O => p_1_in(0)
    );
\sample_code[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8080808808080800"
    )
        port map (
      I0 => E(0),
      I1 => \^enabled2\,
      I2 => \code2_reg_n_0_[15]\,
      I3 => \code2_reg_n_0_[10]\,
      I4 => bounded_code2_carry_n_2,
      I5 => invert2,
      O => p_1_in(10)
    );
\sample_code[11]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F7F7F7FF7F7F7F77"
    )
        port map (
      I0 => E(0),
      I1 => \^enabled2\,
      I2 => \code2_reg_n_0_[15]\,
      I3 => \code2_reg_n_0_[11]\,
      I4 => bounded_code2_carry_n_2,
      I5 => invert2,
      O => p_1_in(11)
    );
\sample_code[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8080808808080800"
    )
        port map (
      I0 => E(0),
      I1 => \^enabled2\,
      I2 => \code2_reg_n_0_[15]\,
      I3 => \code2_reg_n_0_[1]\,
      I4 => bounded_code2_carry_n_2,
      I5 => invert2,
      O => p_1_in(1)
    );
\sample_code[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8080808808080800"
    )
        port map (
      I0 => E(0),
      I1 => \^enabled2\,
      I2 => \code2_reg_n_0_[15]\,
      I3 => \code2_reg_n_0_[2]\,
      I4 => bounded_code2_carry_n_2,
      I5 => invert2,
      O => p_1_in(2)
    );
\sample_code[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8080808808080800"
    )
        port map (
      I0 => E(0),
      I1 => \^enabled2\,
      I2 => \code2_reg_n_0_[15]\,
      I3 => \code2_reg_n_0_[3]\,
      I4 => bounded_code2_carry_n_2,
      I5 => invert2,
      O => p_1_in(3)
    );
\sample_code[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8080808808080800"
    )
        port map (
      I0 => E(0),
      I1 => \^enabled2\,
      I2 => \code2_reg_n_0_[15]\,
      I3 => \code2_reg_n_0_[4]\,
      I4 => bounded_code2_carry_n_2,
      I5 => invert2,
      O => p_1_in(4)
    );
\sample_code[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8080808808080800"
    )
        port map (
      I0 => E(0),
      I1 => \^enabled2\,
      I2 => \code2_reg_n_0_[15]\,
      I3 => \code2_reg_n_0_[5]\,
      I4 => bounded_code2_carry_n_2,
      I5 => invert2,
      O => p_1_in(5)
    );
\sample_code[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8080808808080800"
    )
        port map (
      I0 => E(0),
      I1 => \^enabled2\,
      I2 => \code2_reg_n_0_[15]\,
      I3 => \code2_reg_n_0_[6]\,
      I4 => bounded_code2_carry_n_2,
      I5 => invert2,
      O => p_1_in(6)
    );
\sample_code[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8080808808080800"
    )
        port map (
      I0 => E(0),
      I1 => \^enabled2\,
      I2 => \code2_reg_n_0_[15]\,
      I3 => \code2_reg_n_0_[7]\,
      I4 => bounded_code2_carry_n_2,
      I5 => invert2,
      O => p_1_in(7)
    );
\sample_code[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8080808808080800"
    )
        port map (
      I0 => E(0),
      I1 => \^enabled2\,
      I2 => \code2_reg_n_0_[15]\,
      I3 => \code2_reg_n_0_[8]\,
      I4 => bounded_code2_carry_n_2,
      I5 => invert2,
      O => p_1_in(8)
    );
\sample_code[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8080808808080800"
    )
        port map (
      I0 => E(0),
      I1 => \^enabled2\,
      I2 => \code2_reg_n_0_[15]\,
      I3 => \code2_reg_n_0_[9]\,
      I4 => bounded_code2_carry_n_2,
      I5 => invert2,
      O => p_1_in(9)
    );
\sample_code_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_code_reg[0]_0\(0),
      CLR => \^sample_resetn_0\,
      D => p_1_in(0),
      Q => \sample_code_reg[11]_0\(0)
    );
\sample_code_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_code_reg[0]_0\(0),
      CLR => \^sample_resetn_0\,
      D => p_1_in(10),
      Q => \sample_code_reg[11]_0\(10)
    );
\sample_code_reg[11]\: unisim.vcomponents.FDPE
     port map (
      C => sample_clk,
      CE => \sample_code_reg[0]_0\(0),
      D => p_1_in(11),
      PRE => \^sample_resetn_0\,
      Q => \sample_code_reg[11]_0\(11)
    );
\sample_code_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_code_reg[0]_0\(0),
      CLR => \^sample_resetn_0\,
      D => p_1_in(1),
      Q => \sample_code_reg[11]_0\(1)
    );
\sample_code_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_code_reg[0]_0\(0),
      CLR => \^sample_resetn_0\,
      D => p_1_in(2),
      Q => \sample_code_reg[11]_0\(2)
    );
\sample_code_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_code_reg[0]_0\(0),
      CLR => \^sample_resetn_0\,
      D => p_1_in(3),
      Q => \sample_code_reg[11]_0\(3)
    );
\sample_code_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_code_reg[0]_0\(0),
      CLR => \^sample_resetn_0\,
      D => p_1_in(4),
      Q => \sample_code_reg[11]_0\(4)
    );
\sample_code_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_code_reg[0]_0\(0),
      CLR => \^sample_resetn_0\,
      D => p_1_in(5),
      Q => \sample_code_reg[11]_0\(5)
    );
\sample_code_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_code_reg[0]_0\(0),
      CLR => \^sample_resetn_0\,
      D => p_1_in(6),
      Q => \sample_code_reg[11]_0\(6)
    );
\sample_code_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_code_reg[0]_0\(0),
      CLR => \^sample_resetn_0\,
      D => p_1_in(7),
      Q => \sample_code_reg[11]_0\(7)
    );
\sample_code_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_code_reg[0]_0\(0),
      CLR => \^sample_resetn_0\,
      D => p_1_in(8),
      Q => \sample_code_reg[11]_0\(8)
    );
\sample_code_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_code_reg[0]_0\(0),
      CLR => \^sample_resetn_0\,
      D => p_1_in(9),
      Q => \sample_code_reg[11]_0\(9)
    );
sample_initialized_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => sample_valid,
      I1 => sample_initialized,
      O => sample_valid_reg_0
    );
\sample_pending1_carry__0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \sample_pending1_carry__1\(23),
      I1 => \^reference_tag\(23),
      I2 => \^reference_tag\(22),
      I3 => \sample_pending1_carry__1\(22),
      I4 => \^reference_tag\(21),
      I5 => \sample_pending1_carry__1\(21),
      O => \sample_tag_pending_reg[23]\(3)
    );
\sample_pending1_carry__0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \sample_pending1_carry__1\(20),
      I1 => \^reference_tag\(20),
      I2 => \^reference_tag\(18),
      I3 => \sample_pending1_carry__1\(18),
      I4 => \^reference_tag\(19),
      I5 => \sample_pending1_carry__1\(19),
      O => \sample_tag_pending_reg[23]\(2)
    );
\sample_pending1_carry__0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \sample_pending1_carry__1\(17),
      I1 => \^reference_tag\(17),
      I2 => \^reference_tag\(15),
      I3 => \sample_pending1_carry__1\(15),
      I4 => \^reference_tag\(16),
      I5 => \sample_pending1_carry__1\(16),
      O => \sample_tag_pending_reg[23]\(1)
    );
\sample_pending1_carry__0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \sample_pending1_carry__1\(14),
      I1 => \^reference_tag\(14),
      I2 => \^reference_tag\(13),
      I3 => \sample_pending1_carry__1\(13),
      I4 => \^reference_tag\(12),
      I5 => \sample_pending1_carry__1\(12),
      O => \sample_tag_pending_reg[23]\(0)
    );
\sample_pending1_carry__1_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \sample_pending1_carry__1\(31),
      I1 => \^reference_tag\(31),
      I2 => \sample_pending1_carry__1\(30),
      I3 => \^reference_tag\(30),
      O => \sample_tag_pending_reg[31]\(2)
    );
\sample_pending1_carry__1_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \sample_pending1_carry__1\(29),
      I1 => \^reference_tag\(29),
      I2 => \^reference_tag\(27),
      I3 => \sample_pending1_carry__1\(27),
      I4 => \^reference_tag\(28),
      I5 => \sample_pending1_carry__1\(28),
      O => \sample_tag_pending_reg[31]\(1)
    );
\sample_pending1_carry__1_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \^reference_tag\(24),
      I1 => \sample_pending1_carry__1\(24),
      I2 => \^reference_tag\(25),
      I3 => \sample_pending1_carry__1\(25),
      I4 => \sample_pending1_carry__1\(26),
      I5 => \^reference_tag\(26),
      O => \sample_tag_pending_reg[31]\(0)
    );
sample_pending1_carry_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \sample_pending1_carry__1\(11),
      I1 => \^reference_tag\(11),
      I2 => \^reference_tag\(9),
      I3 => \sample_pending1_carry__1\(9),
      I4 => \^reference_tag\(10),
      I5 => \sample_pending1_carry__1\(10),
      O => S(3)
    );
sample_pending1_carry_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \^reference_tag\(7),
      I1 => \sample_pending1_carry__1\(7),
      I2 => \^reference_tag\(6),
      I3 => \sample_pending1_carry__1\(6),
      I4 => \sample_pending1_carry__1\(8),
      I5 => \^reference_tag\(8),
      O => S(2)
    );
sample_pending1_carry_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \sample_pending1_carry__1\(5),
      I1 => \^reference_tag\(5),
      I2 => \^reference_tag\(3),
      I3 => \sample_pending1_carry__1\(3),
      I4 => \^reference_tag\(4),
      I5 => \sample_pending1_carry__1\(4),
      O => S(1)
    );
sample_pending1_carry_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \^reference_tag\(0),
      I1 => \sample_pending1_carry__1\(0),
      I2 => \^reference_tag\(1),
      I3 => \sample_pending1_carry__1\(1),
      I4 => \sample_pending1_carry__1\(2),
      I5 => \^reference_tag\(2),
      O => S(0)
    );
\sample_phase[31]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^v2\,
      I1 => E(0),
      O => \sample_phase[31]_i_1_n_0\
    );
\sample_phase_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_phase[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p2(0),
      Q => reference_phase(0)
    );
\sample_phase_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_phase[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p2(10),
      Q => reference_phase(10)
    );
\sample_phase_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_phase[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p2(11),
      Q => reference_phase(11)
    );
\sample_phase_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_phase[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p2(12),
      Q => reference_phase(12)
    );
\sample_phase_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_phase[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p2(13),
      Q => reference_phase(13)
    );
\sample_phase_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_phase[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p2(14),
      Q => reference_phase(14)
    );
\sample_phase_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_phase[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p2(15),
      Q => reference_phase(15)
    );
\sample_phase_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_phase[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p2(16),
      Q => reference_phase(16)
    );
\sample_phase_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_phase[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p2(17),
      Q => reference_phase(17)
    );
\sample_phase_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_phase[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p2(18),
      Q => reference_phase(18)
    );
\sample_phase_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_phase[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p2(19),
      Q => reference_phase(19)
    );
\sample_phase_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_phase[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p2(1),
      Q => reference_phase(1)
    );
\sample_phase_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_phase[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p2(20),
      Q => reference_phase(20)
    );
\sample_phase_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_phase[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p2(21),
      Q => reference_phase(21)
    );
\sample_phase_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_phase[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p2(22),
      Q => reference_phase(22)
    );
\sample_phase_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_phase[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p2(23),
      Q => reference_phase(23)
    );
\sample_phase_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_phase[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p2(24),
      Q => reference_phase(24)
    );
\sample_phase_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_phase[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p2(25),
      Q => reference_phase(25)
    );
\sample_phase_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_phase[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p2(26),
      Q => reference_phase(26)
    );
\sample_phase_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_phase[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p2(27),
      Q => reference_phase(27)
    );
\sample_phase_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_phase[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p2(28),
      Q => reference_phase(28)
    );
\sample_phase_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_phase[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p2(29),
      Q => reference_phase(29)
    );
\sample_phase_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_phase[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p2(2),
      Q => reference_phase(2)
    );
\sample_phase_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_phase[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p2(30),
      Q => reference_phase(30)
    );
\sample_phase_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_phase[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p2(31),
      Q => reference_phase(31)
    );
\sample_phase_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_phase[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p2(3),
      Q => reference_phase(3)
    );
\sample_phase_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_phase[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p2(4),
      Q => reference_phase(4)
    );
\sample_phase_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_phase[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p2(5),
      Q => reference_phase(5)
    );
\sample_phase_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_phase[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p2(6),
      Q => reference_phase(6)
    );
\sample_phase_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_phase[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p2(7),
      Q => reference_phase(7)
    );
\sample_phase_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_phase[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p2(8),
      Q => reference_phase(8)
    );
\sample_phase_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_phase[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p2(9),
      Q => reference_phase(9)
    );
\sample_tag_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_phase[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => tag2(0),
      Q => \^reference_tag\(0)
    );
\sample_tag_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_phase[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => tag2(10),
      Q => \^reference_tag\(10)
    );
\sample_tag_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_phase[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => tag2(11),
      Q => \^reference_tag\(11)
    );
\sample_tag_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_phase[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => tag2(12),
      Q => \^reference_tag\(12)
    );
\sample_tag_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_phase[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => tag2(13),
      Q => \^reference_tag\(13)
    );
\sample_tag_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_phase[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => tag2(14),
      Q => \^reference_tag\(14)
    );
\sample_tag_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_phase[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => tag2(15),
      Q => \^reference_tag\(15)
    );
\sample_tag_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_phase[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => tag2(16),
      Q => \^reference_tag\(16)
    );
\sample_tag_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_phase[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => tag2(17),
      Q => \^reference_tag\(17)
    );
\sample_tag_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_phase[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => tag2(18),
      Q => \^reference_tag\(18)
    );
\sample_tag_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_phase[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => tag2(19),
      Q => \^reference_tag\(19)
    );
\sample_tag_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_phase[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => tag2(1),
      Q => \^reference_tag\(1)
    );
\sample_tag_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_phase[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => tag2(20),
      Q => \^reference_tag\(20)
    );
\sample_tag_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_phase[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => tag2(21),
      Q => \^reference_tag\(21)
    );
\sample_tag_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_phase[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => tag2(22),
      Q => \^reference_tag\(22)
    );
\sample_tag_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_phase[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => tag2(23),
      Q => \^reference_tag\(23)
    );
\sample_tag_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_phase[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => tag2(24),
      Q => \^reference_tag\(24)
    );
\sample_tag_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_phase[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => tag2(25),
      Q => \^reference_tag\(25)
    );
\sample_tag_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_phase[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => tag2(26),
      Q => \^reference_tag\(26)
    );
\sample_tag_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_phase[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => tag2(27),
      Q => \^reference_tag\(27)
    );
\sample_tag_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_phase[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => tag2(28),
      Q => \^reference_tag\(28)
    );
\sample_tag_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_phase[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => tag2(29),
      Q => \^reference_tag\(29)
    );
\sample_tag_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_phase[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => tag2(2),
      Q => \^reference_tag\(2)
    );
\sample_tag_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_phase[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => tag2(30),
      Q => \^reference_tag\(30)
    );
\sample_tag_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_phase[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => tag2(31),
      Q => \^reference_tag\(31)
    );
\sample_tag_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_phase[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => tag2(3),
      Q => \^reference_tag\(3)
    );
\sample_tag_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_phase[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => tag2(4),
      Q => \^reference_tag\(4)
    );
\sample_tag_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_phase[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => tag2(5),
      Q => \^reference_tag\(5)
    );
\sample_tag_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_phase[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => tag2(6),
      Q => \^reference_tag\(6)
    );
\sample_tag_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_phase[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => tag2(7),
      Q => \^reference_tag\(7)
    );
\sample_tag_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_phase[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => tag2(8),
      Q => \^reference_tag\(8)
    );
\sample_tag_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => \sample_phase[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => tag2(9),
      Q => \^reference_tag\(9)
    );
sample_valid_reg: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => '1',
      CLR => \^sample_resetn_0\,
      D => \sample_phase[31]_i_1_n_0\,
      Q => sample_valid
    );
scaled_sample1_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => scaled_sample1_carry_n_0,
      CO(2) => scaled_sample1_carry_n_1,
      CO(1) => scaled_sample1_carry_n_2,
      CO(0) => scaled_sample1_carry_n_3,
      CYINIT => '1',
      DI(3 downto 0) => product1(3 downto 0),
      O(3 downto 0) => NLW_scaled_sample1_carry_O_UNCONNECTED(3 downto 0),
      S(3) => scaled_sample1_carry_i_5_n_0,
      S(2) => scaled_sample1_carry_i_6_n_0,
      S(1) => scaled_sample1_carry_i_7_n_0,
      S(0) => scaled_sample1_carry_i_8_n_0
    );
\scaled_sample1_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => scaled_sample1_carry_n_0,
      CO(3) => \scaled_sample1_carry__0_n_0\,
      CO(2) => \scaled_sample1_carry__0_n_1\,
      CO(1) => \scaled_sample1_carry__0_n_2\,
      CO(0) => \scaled_sample1_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => product1(7 downto 4),
      O(3 downto 0) => \NLW_scaled_sample1_carry__0_O_UNCONNECTED\(3 downto 0),
      S(3) => \scaled_sample1_carry__0_i_5_n_0\,
      S(2) => \scaled_sample1_carry__0_i_6_n_0\,
      S(1) => \scaled_sample1_carry__0_i_7_n_0\,
      S(0) => \scaled_sample1_carry__0_i_8_n_0\
    );
\scaled_sample1_carry__0_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => product10_n_98,
      I1 => \scaled_sample1_carry__1_0\,
      O => product1(7)
    );
\scaled_sample1_carry__0_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => product10_n_99,
      I1 => \scaled_sample1_carry__1_0\,
      O => product1(6)
    );
\scaled_sample1_carry__0_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => product10_n_100,
      I1 => \scaled_sample1_carry__1_0\,
      O => product1(5)
    );
\scaled_sample1_carry__0_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => product10_n_101,
      I1 => \scaled_sample1_carry__1_0\,
      O => product1(4)
    );
\scaled_sample1_carry__0_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \scaled_sample1_carry__1_0\,
      I1 => product10_n_98,
      O => \scaled_sample1_carry__0_i_5_n_0\
    );
\scaled_sample1_carry__0_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \scaled_sample1_carry__1_0\,
      I1 => product10_n_99,
      O => \scaled_sample1_carry__0_i_6_n_0\
    );
\scaled_sample1_carry__0_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \scaled_sample1_carry__1_0\,
      I1 => product10_n_100,
      O => \scaled_sample1_carry__0_i_7_n_0\
    );
\scaled_sample1_carry__0_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \scaled_sample1_carry__1_0\,
      I1 => product10_n_101,
      O => \scaled_sample1_carry__0_i_8_n_0\
    );
\scaled_sample1_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \scaled_sample1_carry__0_n_0\,
      CO(3) => \scaled_sample1_carry__1_n_0\,
      CO(2) => \scaled_sample1_carry__1_n_1\,
      CO(1) => \scaled_sample1_carry__1_n_2\,
      CO(0) => \scaled_sample1_carry__1_n_3\,
      CYINIT => '0',
      DI(3) => \scaled_sample1_carry__1_i_1_n_0\,
      DI(2) => product1(24),
      DI(1 downto 0) => product1(9 downto 8),
      O(3) => \scaled_sample1_carry__1_n_4\,
      O(2 downto 0) => \NLW_scaled_sample1_carry__1_O_UNCONNECTED\(2 downto 0),
      S(3) => \scaled_sample1_carry__1_i_5_n_0\,
      S(2) => \scaled_sample1_carry__1_i_6_n_0\,
      S(1) => \scaled_sample1_carry__1_i_7_n_0\,
      S(0) => \scaled_sample1_carry__1_i_8_n_0\
    );
\scaled_sample1_carry__1_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BF"
    )
        port map (
      I0 => product10_n_95,
      I1 => \scaled_sample1_carry__1_0\,
      I2 => product10_n_81,
      O => \scaled_sample1_carry__1_i_1_n_0\
    );
\scaled_sample1_carry__1_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => product10_n_81,
      I1 => \scaled_sample1_carry__1_0\,
      O => product1(24)
    );
\scaled_sample1_carry__1_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => product10_n_96,
      I1 => \scaled_sample1_carry__1_0\,
      O => product1(9)
    );
\scaled_sample1_carry__1_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => product10_n_97,
      I1 => \scaled_sample1_carry__1_0\,
      O => product1(8)
    );
\scaled_sample1_carry__1_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"D020"
    )
        port map (
      I0 => product10_n_81,
      I1 => product10_n_95,
      I2 => \scaled_sample1_carry__1_0\,
      I3 => product10_n_94,
      O => \scaled_sample1_carry__1_i_5_n_0\
    );
\scaled_sample1_carry__1_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => product10_n_95,
      I1 => \scaled_sample1_carry__1_0\,
      O => \scaled_sample1_carry__1_i_6_n_0\
    );
\scaled_sample1_carry__1_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \scaled_sample1_carry__1_0\,
      I1 => product10_n_96,
      O => \scaled_sample1_carry__1_i_7_n_0\
    );
\scaled_sample1_carry__1_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \scaled_sample1_carry__1_0\,
      I1 => product10_n_97,
      O => \scaled_sample1_carry__1_i_8_n_0\
    );
\scaled_sample1_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \scaled_sample1_carry__1_n_0\,
      CO(3) => \scaled_sample1_carry__2_n_0\,
      CO(2) => \scaled_sample1_carry__2_n_1\,
      CO(1) => \scaled_sample1_carry__2_n_2\,
      CO(0) => \scaled_sample1_carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => product1(14 downto 11),
      O(3) => \scaled_sample1_carry__2_n_4\,
      O(2) => \scaled_sample1_carry__2_n_5\,
      O(1) => \scaled_sample1_carry__2_n_6\,
      O(0) => \scaled_sample1_carry__2_n_7\,
      S(3) => \scaled_sample1_carry__2_i_5_n_0\,
      S(2) => \scaled_sample1_carry__2_i_6_n_0\,
      S(1) => \scaled_sample1_carry__2_i_7_n_0\,
      S(0) => \scaled_sample1_carry__2_i_8_n_0\
    );
\scaled_sample1_carry__2_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => product10_n_91,
      I1 => \scaled_sample1_carry__1_0\,
      O => product1(14)
    );
\scaled_sample1_carry__2_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => product10_n_92,
      I1 => \scaled_sample1_carry__1_0\,
      O => product1(13)
    );
\scaled_sample1_carry__2_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => product10_n_93,
      I1 => \scaled_sample1_carry__1_0\,
      O => product1(12)
    );
\scaled_sample1_carry__2_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => product10_n_94,
      I1 => \scaled_sample1_carry__1_0\,
      O => product1(11)
    );
\scaled_sample1_carry__2_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B7"
    )
        port map (
      I0 => product10_n_91,
      I1 => \scaled_sample1_carry__1_0\,
      I2 => product10_n_90,
      O => \scaled_sample1_carry__2_i_5_n_0\
    );
\scaled_sample1_carry__2_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B7"
    )
        port map (
      I0 => product10_n_92,
      I1 => \scaled_sample1_carry__1_0\,
      I2 => product10_n_91,
      O => \scaled_sample1_carry__2_i_6_n_0\
    );
\scaled_sample1_carry__2_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B7"
    )
        port map (
      I0 => product10_n_93,
      I1 => \scaled_sample1_carry__1_0\,
      I2 => product10_n_92,
      O => \scaled_sample1_carry__2_i_7_n_0\
    );
\scaled_sample1_carry__2_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B7"
    )
        port map (
      I0 => product10_n_94,
      I1 => \scaled_sample1_carry__1_0\,
      I2 => product10_n_93,
      O => \scaled_sample1_carry__2_i_8_n_0\
    );
\scaled_sample1_carry__3\: unisim.vcomponents.CARRY4
     port map (
      CI => \scaled_sample1_carry__2_n_0\,
      CO(3) => \scaled_sample1_carry__3_n_0\,
      CO(2) => \scaled_sample1_carry__3_n_1\,
      CO(1) => \scaled_sample1_carry__3_n_2\,
      CO(0) => \scaled_sample1_carry__3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => product1(18 downto 15),
      O(3) => \scaled_sample1_carry__3_n_4\,
      O(2) => \scaled_sample1_carry__3_n_5\,
      O(1) => \scaled_sample1_carry__3_n_6\,
      O(0) => \scaled_sample1_carry__3_n_7\,
      S(3) => \scaled_sample1_carry__3_i_5_n_0\,
      S(2) => \scaled_sample1_carry__3_i_6_n_0\,
      S(1) => \scaled_sample1_carry__3_i_7_n_0\,
      S(0) => \scaled_sample1_carry__3_i_8_n_0\
    );
\scaled_sample1_carry__3_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => product10_n_87,
      I1 => \scaled_sample1_carry__1_0\,
      O => product1(18)
    );
\scaled_sample1_carry__3_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => product10_n_88,
      I1 => \scaled_sample1_carry__1_0\,
      O => product1(17)
    );
\scaled_sample1_carry__3_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => product10_n_89,
      I1 => \scaled_sample1_carry__1_0\,
      O => product1(16)
    );
\scaled_sample1_carry__3_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => product10_n_90,
      I1 => \scaled_sample1_carry__1_0\,
      O => product1(15)
    );
\scaled_sample1_carry__3_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B7"
    )
        port map (
      I0 => product10_n_87,
      I1 => \scaled_sample1_carry__1_0\,
      I2 => product10_n_86,
      O => \scaled_sample1_carry__3_i_5_n_0\
    );
\scaled_sample1_carry__3_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B7"
    )
        port map (
      I0 => product10_n_88,
      I1 => \scaled_sample1_carry__1_0\,
      I2 => product10_n_87,
      O => \scaled_sample1_carry__3_i_6_n_0\
    );
\scaled_sample1_carry__3_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B7"
    )
        port map (
      I0 => product10_n_89,
      I1 => \scaled_sample1_carry__1_0\,
      I2 => product10_n_88,
      O => \scaled_sample1_carry__3_i_7_n_0\
    );
\scaled_sample1_carry__3_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B7"
    )
        port map (
      I0 => product10_n_90,
      I1 => \scaled_sample1_carry__1_0\,
      I2 => product10_n_89,
      O => \scaled_sample1_carry__3_i_8_n_0\
    );
\scaled_sample1_carry__4\: unisim.vcomponents.CARRY4
     port map (
      CI => \scaled_sample1_carry__3_n_0\,
      CO(3) => \scaled_sample1_carry__4_n_0\,
      CO(2) => \scaled_sample1_carry__4_n_1\,
      CO(1) => \scaled_sample1_carry__4_n_2\,
      CO(0) => \scaled_sample1_carry__4_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => product1(22 downto 19),
      O(3) => \scaled_sample1_carry__4_n_4\,
      O(2) => \scaled_sample1_carry__4_n_5\,
      O(1) => \scaled_sample1_carry__4_n_6\,
      O(0) => \scaled_sample1_carry__4_n_7\,
      S(3) => \scaled_sample1_carry__4_i_5_n_0\,
      S(2) => \scaled_sample1_carry__4_i_6_n_0\,
      S(1) => \scaled_sample1_carry__4_i_7_n_0\,
      S(0) => \scaled_sample1_carry__4_i_8_n_0\
    );
\scaled_sample1_carry__4_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => product10_n_83,
      I1 => \scaled_sample1_carry__1_0\,
      O => product1(22)
    );
\scaled_sample1_carry__4_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => product10_n_84,
      I1 => \scaled_sample1_carry__1_0\,
      O => product1(21)
    );
\scaled_sample1_carry__4_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => product10_n_85,
      I1 => \scaled_sample1_carry__1_0\,
      O => product1(20)
    );
\scaled_sample1_carry__4_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => product10_n_86,
      I1 => \scaled_sample1_carry__1_0\,
      O => product1(19)
    );
\scaled_sample1_carry__4_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B7"
    )
        port map (
      I0 => product10_n_83,
      I1 => \scaled_sample1_carry__1_0\,
      I2 => product10_n_82,
      O => \scaled_sample1_carry__4_i_5_n_0\
    );
\scaled_sample1_carry__4_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B7"
    )
        port map (
      I0 => product10_n_84,
      I1 => \scaled_sample1_carry__1_0\,
      I2 => product10_n_83,
      O => \scaled_sample1_carry__4_i_6_n_0\
    );
\scaled_sample1_carry__4_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B7"
    )
        port map (
      I0 => product10_n_85,
      I1 => \scaled_sample1_carry__1_0\,
      I2 => product10_n_84,
      O => \scaled_sample1_carry__4_i_7_n_0\
    );
\scaled_sample1_carry__4_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B7"
    )
        port map (
      I0 => product10_n_86,
      I1 => \scaled_sample1_carry__1_0\,
      I2 => product10_n_85,
      O => \scaled_sample1_carry__4_i_8_n_0\
    );
\scaled_sample1_carry__5\: unisim.vcomponents.CARRY4
     port map (
      CI => \scaled_sample1_carry__4_n_0\,
      CO(3 downto 0) => \NLW_scaled_sample1_carry__5_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 1) => \NLW_scaled_sample1_carry__5_O_UNCONNECTED\(3 downto 1),
      O(0) => scaled_sample0,
      S(3 downto 1) => B"000",
      S(0) => \scaled_sample1_carry__5_i_1_n_0\
    );
\scaled_sample1_carry__5_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B7"
    )
        port map (
      I0 => product10_n_82,
      I1 => \scaled_sample1_carry__1_0\,
      I2 => product10_n_81,
      O => \scaled_sample1_carry__5_i_1_n_0\
    );
scaled_sample1_carry_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => product10_n_102,
      I1 => \scaled_sample1_carry__1_0\,
      O => product1(3)
    );
scaled_sample1_carry_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => product10_n_103,
      I1 => \scaled_sample1_carry__1_0\,
      O => product1(2)
    );
scaled_sample1_carry_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => product10_n_104,
      I1 => \scaled_sample1_carry__1_0\,
      O => product1(1)
    );
scaled_sample1_carry_i_4: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => product10_n_105,
      I1 => \scaled_sample1_carry__1_0\,
      O => product1(0)
    );
scaled_sample1_carry_i_5: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \scaled_sample1_carry__1_0\,
      I1 => product10_n_102,
      O => scaled_sample1_carry_i_5_n_0
    );
scaled_sample1_carry_i_6: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \scaled_sample1_carry__1_0\,
      I1 => product10_n_103,
      O => scaled_sample1_carry_i_6_n_0
    );
scaled_sample1_carry_i_7: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \scaled_sample1_carry__1_0\,
      I1 => product10_n_104,
      O => scaled_sample1_carry_i_7_n_0
    );
scaled_sample1_carry_i_8: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B7"
    )
        port map (
      I0 => product10_n_105,
      I1 => \scaled_sample1_carry__1_0\,
      I2 => product10_n_81,
      O => scaled_sample1_carry_i_8_n_0
    );
\tag0_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => active_tag(0),
      Q => tag0(0)
    );
\tag0_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => active_tag(10),
      Q => tag0(10)
    );
\tag0_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => active_tag(11),
      Q => tag0(11)
    );
\tag0_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => active_tag(12),
      Q => tag0(12)
    );
\tag0_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => active_tag(13),
      Q => tag0(13)
    );
\tag0_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => active_tag(14),
      Q => tag0(14)
    );
\tag0_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => active_tag(15),
      Q => tag0(15)
    );
\tag0_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => active_tag(16),
      Q => tag0(16)
    );
\tag0_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => active_tag(17),
      Q => tag0(17)
    );
\tag0_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => active_tag(18),
      Q => tag0(18)
    );
\tag0_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => active_tag(19),
      Q => tag0(19)
    );
\tag0_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => active_tag(1),
      Q => tag0(1)
    );
\tag0_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => active_tag(20),
      Q => tag0(20)
    );
\tag0_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => active_tag(21),
      Q => tag0(21)
    );
\tag0_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => active_tag(22),
      Q => tag0(22)
    );
\tag0_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => active_tag(23),
      Q => tag0(23)
    );
\tag0_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => active_tag(24),
      Q => tag0(24)
    );
\tag0_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => active_tag(25),
      Q => tag0(25)
    );
\tag0_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => active_tag(26),
      Q => tag0(26)
    );
\tag0_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => active_tag(27),
      Q => tag0(27)
    );
\tag0_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => active_tag(28),
      Q => tag0(28)
    );
\tag0_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => active_tag(29),
      Q => tag0(29)
    );
\tag0_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => active_tag(2),
      Q => tag0(2)
    );
\tag0_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => active_tag(30),
      Q => tag0(30)
    );
\tag0_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => active_tag(31),
      Q => tag0(31)
    );
\tag0_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => active_tag(3),
      Q => tag0(3)
    );
\tag0_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => active_tag(4),
      Q => tag0(4)
    );
\tag0_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => active_tag(5),
      Q => tag0(5)
    );
\tag0_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => active_tag(6),
      Q => tag0(6)
    );
\tag0_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => active_tag(7),
      Q => tag0(7)
    );
\tag0_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => active_tag(8),
      Q => tag0(8)
    );
\tag0_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => active_tag(9),
      Q => tag0(9)
    );
\tag1_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => tag0(0),
      Q => tag1(0)
    );
\tag1_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => tag0(10),
      Q => tag1(10)
    );
\tag1_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => tag0(11),
      Q => tag1(11)
    );
\tag1_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => tag0(12),
      Q => tag1(12)
    );
\tag1_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => tag0(13),
      Q => tag1(13)
    );
\tag1_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => tag0(14),
      Q => tag1(14)
    );
\tag1_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => tag0(15),
      Q => tag1(15)
    );
\tag1_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => tag0(16),
      Q => tag1(16)
    );
\tag1_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => tag0(17),
      Q => tag1(17)
    );
\tag1_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => tag0(18),
      Q => tag1(18)
    );
\tag1_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => tag0(19),
      Q => tag1(19)
    );
\tag1_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => tag0(1),
      Q => tag1(1)
    );
\tag1_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => tag0(20),
      Q => tag1(20)
    );
\tag1_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => tag0(21),
      Q => tag1(21)
    );
\tag1_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => tag0(22),
      Q => tag1(22)
    );
\tag1_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => tag0(23),
      Q => tag1(23)
    );
\tag1_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => tag0(24),
      Q => tag1(24)
    );
\tag1_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => tag0(25),
      Q => tag1(25)
    );
\tag1_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => tag0(26),
      Q => tag1(26)
    );
\tag1_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => tag0(27),
      Q => tag1(27)
    );
\tag1_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => tag0(28),
      Q => tag1(28)
    );
\tag1_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => tag0(29),
      Q => tag1(29)
    );
\tag1_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => tag0(2),
      Q => tag1(2)
    );
\tag1_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => tag0(30),
      Q => tag1(30)
    );
\tag1_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => tag0(31),
      Q => tag1(31)
    );
\tag1_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => tag0(3),
      Q => tag1(3)
    );
\tag1_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => tag0(4),
      Q => tag1(4)
    );
\tag1_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => tag0(5),
      Q => tag1(5)
    );
\tag1_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => tag0(6),
      Q => tag1(6)
    );
\tag1_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => tag0(7),
      Q => tag1(7)
    );
\tag1_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => tag0(8),
      Q => tag1(8)
    );
\tag1_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => tag0(9),
      Q => tag1(9)
    );
\tag2_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => tag1(0),
      Q => tag2(0)
    );
\tag2_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => tag1(10),
      Q => tag2(10)
    );
\tag2_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => tag1(11),
      Q => tag2(11)
    );
\tag2_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => tag1(12),
      Q => tag2(12)
    );
\tag2_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => tag1(13),
      Q => tag2(13)
    );
\tag2_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => tag1(14),
      Q => tag2(14)
    );
\tag2_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => tag1(15),
      Q => tag2(15)
    );
\tag2_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => tag1(16),
      Q => tag2(16)
    );
\tag2_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => tag1(17),
      Q => tag2(17)
    );
\tag2_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => tag1(18),
      Q => tag2(18)
    );
\tag2_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => tag1(19),
      Q => tag2(19)
    );
\tag2_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => tag1(1),
      Q => tag2(1)
    );
\tag2_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => tag1(20),
      Q => tag2(20)
    );
\tag2_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => tag1(21),
      Q => tag2(21)
    );
\tag2_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => tag1(22),
      Q => tag2(22)
    );
\tag2_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => tag1(23),
      Q => tag2(23)
    );
\tag2_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => tag1(24),
      Q => tag2(24)
    );
\tag2_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => tag1(25),
      Q => tag2(25)
    );
\tag2_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => tag1(26),
      Q => tag2(26)
    );
\tag2_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => tag1(27),
      Q => tag2(27)
    );
\tag2_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => tag1(28),
      Q => tag2(28)
    );
\tag2_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => tag1(29),
      Q => tag2(29)
    );
\tag2_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => tag1(2),
      Q => tag2(2)
    );
\tag2_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => tag1(30),
      Q => tag2(30)
    );
\tag2_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => tag1(31),
      Q => tag2(31)
    );
\tag2_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => tag1(3),
      Q => tag2(3)
    );
\tag2_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => tag1(4),
      Q => tag2(4)
    );
\tag2_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => tag1(5),
      Q => tag2(5)
    );
\tag2_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => tag1(6),
      Q => tag2(6)
    );
\tag2_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => tag1(7),
      Q => tag2(7)
    );
\tag2_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => tag1(8),
      Q => tag2(8)
    );
\tag2_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => E(0),
      CLR => \^sample_resetn_0\,
      D => tag1(9),
      Q => tag2(9)
    );
unbounded_code_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => unbounded_code_carry_n_0,
      CO(2) => unbounded_code_carry_n_1,
      CO(1) => unbounded_code_carry_n_2,
      CO(0) => unbounded_code_carry_n_3,
      CYINIT => '0',
      DI(3 downto 0) => offset1(3 downto 0),
      O(3 downto 0) => unbounded_code(3 downto 0),
      S(3) => unbounded_code_carry_i_1_n_0,
      S(2) => unbounded_code_carry_i_2_n_0,
      S(1) => unbounded_code_carry_i_3_n_0,
      S(0) => unbounded_code_carry_i_4_n_0
    );
\unbounded_code_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => unbounded_code_carry_n_0,
      CO(3) => \unbounded_code_carry__0_n_0\,
      CO(2) => \unbounded_code_carry__0_n_1\,
      CO(1) => \unbounded_code_carry__0_n_2\,
      CO(0) => \unbounded_code_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => offset1(7 downto 4),
      O(3 downto 0) => unbounded_code(7 downto 4),
      S(3) => \unbounded_code_carry__0_i_1_n_0\,
      S(2) => \unbounded_code_carry__0_i_2_n_0\,
      S(1) => \unbounded_code_carry__0_i_3_n_0\,
      S(0) => \unbounded_code_carry__0_i_4_n_0\
    );
\unbounded_code_carry__0_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => offset1(7),
      I1 => \scaled_sample1_carry__3_n_5\,
      O => \unbounded_code_carry__0_i_1_n_0\
    );
\unbounded_code_carry__0_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => offset1(6),
      I1 => \scaled_sample1_carry__3_n_6\,
      O => \unbounded_code_carry__0_i_2_n_0\
    );
\unbounded_code_carry__0_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => offset1(5),
      I1 => \scaled_sample1_carry__3_n_7\,
      O => \unbounded_code_carry__0_i_3_n_0\
    );
\unbounded_code_carry__0_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => offset1(4),
      I1 => \scaled_sample1_carry__2_n_4\,
      O => \unbounded_code_carry__0_i_4_n_0\
    );
\unbounded_code_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \unbounded_code_carry__0_n_0\,
      CO(3) => \unbounded_code_carry__1_n_0\,
      CO(2) => \unbounded_code_carry__1_n_1\,
      CO(1) => \unbounded_code_carry__1_n_2\,
      CO(0) => \unbounded_code_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => offset1(11 downto 8),
      O(3 downto 0) => unbounded_code(11 downto 8),
      S(3) => \unbounded_code_carry__1_i_1_n_0\,
      S(2) => \unbounded_code_carry__1_i_2_n_0\,
      S(1) => \unbounded_code_carry__1_i_3_n_0\,
      S(0) => \unbounded_code_carry__1_i_4_n_0\
    );
\unbounded_code_carry__1_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => offset1(11),
      I1 => \scaled_sample1_carry__4_n_5\,
      O => \unbounded_code_carry__1_i_1_n_0\
    );
\unbounded_code_carry__1_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => offset1(10),
      I1 => \scaled_sample1_carry__4_n_6\,
      O => \unbounded_code_carry__1_i_2_n_0\
    );
\unbounded_code_carry__1_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => offset1(9),
      I1 => \scaled_sample1_carry__4_n_7\,
      O => \unbounded_code_carry__1_i_3_n_0\
    );
\unbounded_code_carry__1_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => offset1(8),
      I1 => \scaled_sample1_carry__3_n_4\,
      O => \unbounded_code_carry__1_i_4_n_0\
    );
\unbounded_code_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \unbounded_code_carry__1_n_0\,
      CO(3 downto 2) => \NLW_unbounded_code_carry__2_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \unbounded_code_carry__2_n_2\,
      CO(0) => \unbounded_code_carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0010",
      O(3) => \NLW_unbounded_code_carry__2_O_UNCONNECTED\(3),
      O(2) => unbounded_code(15),
      O(1 downto 0) => unbounded_code(13 downto 12),
      S(3 downto 2) => B"01",
      S(1) => scaled_sample0,
      S(0) => \scaled_sample1_carry__4_n_4\
    );
unbounded_code_carry_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => offset1(3),
      I1 => \scaled_sample1_carry__2_n_5\,
      O => unbounded_code_carry_i_1_n_0
    );
unbounded_code_carry_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => offset1(2),
      I1 => \scaled_sample1_carry__2_n_6\,
      O => unbounded_code_carry_i_2_n_0
    );
unbounded_code_carry_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => offset1(1),
      I1 => \scaled_sample1_carry__2_n_7\,
      O => unbounded_code_carry_i_3_n_0
    );
unbounded_code_carry_i_4: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => offset1(0),
      I1 => \scaled_sample1_carry__1_n_4\,
      O => unbounded_code_carry_i_4_n_0
    );
v0_reg: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => '1',
      CLR => \^sample_resetn_0\,
      D => E(0),
      Q => v0
    );
v1_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => v0,
      I1 => E(0),
      O => v12_out
    );
v1_reg: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => '1',
      CLR => \^sample_resetn_0\,
      D => v12_out,
      Q => v1
    );
v2_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => v1,
      I1 => E(0),
      O => v21_out
    );
v2_reg: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => '1',
      CLR => \^sample_resetn_0\,
      D => v21_out,
      Q => \^v2\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_dac902_control_0_fdw_dac902_phase_control is
  port (
    sample_resetn_0 : out STD_LOGIC;
    reply_pending_reg_0 : out STD_LOGIC;
    reference_inverted : out STD_LOGIC;
    dac_data : out STD_LOGIC_VECTOR ( 11 downto 0 );
    dac_clk : out STD_LOGIC;
    status_word : out STD_LOGIC_VECTOR ( 26 downto 0 );
    reference_ftw : out STD_LOGIC_VECTOR ( 31 downto 0 );
    reference_tag : out STD_LOGIC_VECTOR ( 31 downto 0 );
    reference_valid : out STD_LOGIC;
    reference_phase : out STD_LOGIC_VECTOR ( 31 downto 0 );
    sample_clk : in STD_LOGIC;
    control_clk : in STD_LOGIC;
    command_word : in STD_LOGIC_VECTOR ( 31 downto 0 );
    sample_resetn : in STD_LOGIC;
    control_resetn : in STD_LOGIC;
    \scaled_sample1_carry__1\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_dac902_control_0_fdw_dac902_phase_control : entity is "fdw_dac902_phase_control";
end system_dac902_control_0_fdw_dac902_phase_control;

architecture STRUCTURE of system_dac902_control_0_fdw_dac902_phase_control is
  signal \FSM_onehot_state_reg_n_0_[0]\ : STD_LOGIC;
  signal \FSM_onehot_state_reg_n_0_[1]\ : STD_LOGIC;
  signal \FSM_onehot_state_reg_n_0_[2]\ : STD_LOGIC;
  signal R0 : STD_LOGIC;
  signal acknowledged_i_3_n_0 : STD_LOGIC;
  signal acknowledged_i_5_n_0 : STD_LOGIC;
  signal active_enable : STD_LOGIC;
  signal \applied_config_reg_n_0_[0]\ : STD_LOGIC;
  signal \applied_config_reg_n_0_[10]\ : STD_LOGIC;
  signal \applied_config_reg_n_0_[11]\ : STD_LOGIC;
  signal \applied_config_reg_n_0_[12]\ : STD_LOGIC;
  signal \applied_config_reg_n_0_[13]\ : STD_LOGIC;
  signal \applied_config_reg_n_0_[14]\ : STD_LOGIC;
  signal \applied_config_reg_n_0_[15]\ : STD_LOGIC;
  signal \applied_config_reg_n_0_[1]\ : STD_LOGIC;
  signal \applied_config_reg_n_0_[2]\ : STD_LOGIC;
  signal \applied_config_reg_n_0_[3]\ : STD_LOGIC;
  signal \applied_config_reg_n_0_[4]\ : STD_LOGIC;
  signal \applied_config_reg_n_0_[5]\ : STD_LOGIC;
  signal \applied_config_reg_n_0_[6]\ : STD_LOGIC;
  signal \applied_config_reg_n_0_[7]\ : STD_LOGIC;
  signal \applied_config_reg_n_0_[8]\ : STD_LOGIC;
  signal \applied_config_reg_n_0_[9]\ : STD_LOGIC;
  signal \applied_tag_reg_n_0_[0]\ : STD_LOGIC;
  signal \applied_tag_reg_n_0_[10]\ : STD_LOGIC;
  signal \applied_tag_reg_n_0_[11]\ : STD_LOGIC;
  signal \applied_tag_reg_n_0_[12]\ : STD_LOGIC;
  signal \applied_tag_reg_n_0_[13]\ : STD_LOGIC;
  signal \applied_tag_reg_n_0_[14]\ : STD_LOGIC;
  signal \applied_tag_reg_n_0_[15]\ : STD_LOGIC;
  signal \applied_tag_reg_n_0_[1]\ : STD_LOGIC;
  signal \applied_tag_reg_n_0_[2]\ : STD_LOGIC;
  signal \applied_tag_reg_n_0_[3]\ : STD_LOGIC;
  signal \applied_tag_reg_n_0_[4]\ : STD_LOGIC;
  signal \applied_tag_reg_n_0_[5]\ : STD_LOGIC;
  signal \applied_tag_reg_n_0_[6]\ : STD_LOGIC;
  signal \applied_tag_reg_n_0_[7]\ : STD_LOGIC;
  signal \applied_tag_reg_n_0_[8]\ : STD_LOGIC;
  signal \applied_tag_reg_n_0_[9]\ : STD_LOGIC;
  signal awaiting_sample_reg_n_0 : STD_LOGIC;
  signal cfg_rejected : STD_LOGIC;
  signal cfg_rejected0 : STD_LOGIC;
  signal cfg_valid0 : STD_LOGIC;
  signal clipped_sync : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of clipped_sync : signal is "true";
  attribute shreg_extract : string;
  attribute shreg_extract of clipped_sync : signal is "no";
  signal clock_run : STD_LOGIC;
  signal clock_run0 : STD_LOGIC;
  signal config_data : STD_LOGIC_VECTOR ( 122 downto 0 );
  signal \config_packet_reg[103]_i_1_n_0\ : STD_LOGIC;
  signal \config_packet_reg[103]_i_1_n_1\ : STD_LOGIC;
  signal \config_packet_reg[103]_i_1_n_2\ : STD_LOGIC;
  signal \config_packet_reg[103]_i_1_n_3\ : STD_LOGIC;
  signal \config_packet_reg[107]_i_1_n_0\ : STD_LOGIC;
  signal \config_packet_reg[107]_i_1_n_1\ : STD_LOGIC;
  signal \config_packet_reg[107]_i_1_n_2\ : STD_LOGIC;
  signal \config_packet_reg[107]_i_1_n_3\ : STD_LOGIC;
  signal \config_packet_reg[111]_i_1_n_0\ : STD_LOGIC;
  signal \config_packet_reg[111]_i_1_n_1\ : STD_LOGIC;
  signal \config_packet_reg[111]_i_1_n_2\ : STD_LOGIC;
  signal \config_packet_reg[111]_i_1_n_3\ : STD_LOGIC;
  signal \config_packet_reg[115]_i_1_n_0\ : STD_LOGIC;
  signal \config_packet_reg[115]_i_1_n_1\ : STD_LOGIC;
  signal \config_packet_reg[115]_i_1_n_2\ : STD_LOGIC;
  signal \config_packet_reg[115]_i_1_n_3\ : STD_LOGIC;
  signal \config_packet_reg[119]_i_1_n_0\ : STD_LOGIC;
  signal \config_packet_reg[119]_i_1_n_1\ : STD_LOGIC;
  signal \config_packet_reg[119]_i_1_n_2\ : STD_LOGIC;
  signal \config_packet_reg[119]_i_1_n_3\ : STD_LOGIC;
  signal \config_packet_reg[122]_i_2_n_2\ : STD_LOGIC;
  signal \config_packet_reg[122]_i_2_n_3\ : STD_LOGIC;
  signal \config_packet_reg[95]_i_1_n_0\ : STD_LOGIC;
  signal \config_packet_reg[95]_i_1_n_1\ : STD_LOGIC;
  signal \config_packet_reg[95]_i_1_n_2\ : STD_LOGIC;
  signal \config_packet_reg[95]_i_1_n_3\ : STD_LOGIC;
  signal \config_packet_reg[99]_i_1_n_0\ : STD_LOGIC;
  signal \config_packet_reg[99]_i_1_n_1\ : STD_LOGIC;
  signal \config_packet_reg[99]_i_1_n_2\ : STD_LOGIC;
  signal \config_packet_reg[99]_i_1_n_3\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[0]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[100]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[101]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[102]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[103]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[104]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[105]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[106]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[107]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[108]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[109]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[10]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[110]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[111]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[112]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[113]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[114]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[115]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[116]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[117]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[118]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[119]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[11]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[120]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[121]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[122]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[12]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[13]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[14]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[15]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[16]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[17]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[18]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[19]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[1]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[20]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[21]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[22]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[23]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[24]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[25]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[26]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[27]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[28]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[29]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[2]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[30]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[31]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[32]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[33]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[34]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[35]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[36]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[37]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[38]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[39]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[3]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[40]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[41]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[42]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[43]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[44]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[45]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[46]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[47]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[48]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[49]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[4]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[50]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[51]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[52]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[53]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[54]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[55]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[56]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[57]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[58]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[59]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[5]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[60]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[61]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[62]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[63]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[64]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[65]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[66]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[67]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[68]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[69]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[6]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[70]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[71]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[72]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[73]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[74]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[75]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[76]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[77]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[78]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[79]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[7]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[80]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[81]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[82]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[83]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[84]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[85]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[86]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[87]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[88]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[89]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[8]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[90]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[91]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[92]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[93]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[94]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[95]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[96]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[97]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[98]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[99]\ : STD_LOGIC;
  signal \config_packet_reg_n_0_[9]\ : STD_LOGIC;
  signal configuration_mailbox_n_0 : STD_LOGIC;
  signal configuration_mailbox_n_1 : STD_LOGIC;
  signal configuration_mailbox_n_128 : STD_LOGIC;
  signal configuration_mailbox_n_129 : STD_LOGIC;
  signal configuration_mailbox_n_132 : STD_LOGIC;
  signal configuration_mailbox_n_133 : STD_LOGIC;
  signal configuration_mailbox_n_134 : STD_LOGIC;
  signal configuration_mailbox_n_136 : STD_LOGIC;
  signal configuration_mailbox_n_137 : STD_LOGIC;
  signal configuration_mailbox_n_138 : STD_LOGIC;
  signal configuration_mailbox_n_5 : STD_LOGIC;
  signal confirmation_mailbox_n_1 : STD_LOGIC;
  signal confirmation_mailbox_n_34 : STD_LOGIC;
  signal confirmation_mailbox_n_35 : STD_LOGIC;
  signal confirmation_mailbox_n_36 : STD_LOGIC;
  signal confirmation_mailbox_n_37 : STD_LOGIC;
  signal confirmation_mailbox_n_38 : STD_LOGIC;
  signal confirmation_mailbox_n_39 : STD_LOGIC;
  signal confirmation_mailbox_n_40 : STD_LOGIC;
  signal confirmation_mailbox_n_41 : STD_LOGIC;
  signal confirmation_mailbox_n_42 : STD_LOGIC;
  signal confirmation_mailbox_n_43 : STD_LOGIC;
  signal confirmation_mailbox_n_44 : STD_LOGIC;
  signal confirmation_mailbox_n_45 : STD_LOGIC;
  signal confirmation_mailbox_n_46 : STD_LOGIC;
  signal confirmation_mailbox_n_47 : STD_LOGIC;
  signal confirmation_mailbox_n_48 : STD_LOGIC;
  signal confirmation_mailbox_n_49 : STD_LOGIC;
  signal connected_sync : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of connected_sync : signal is "true";
  attribute shreg_extract of connected_sync : signal is "no";
  signal data1 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal data3 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal data4 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal data5 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal data6 : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal data7 : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal data8 : STD_LOGIC_VECTOR ( 2 downto 1 );
  signal enabled2 : STD_LOGIC;
  signal \error_code1_inferred__0/i__carry__0_n_0\ : STD_LOGIC;
  signal \error_code1_inferred__0/i__carry__0_n_1\ : STD_LOGIC;
  signal \error_code1_inferred__0/i__carry__0_n_2\ : STD_LOGIC;
  signal \error_code1_inferred__0/i__carry__0_n_3\ : STD_LOGIC;
  signal \error_code1_inferred__0/i__carry__1_n_1\ : STD_LOGIC;
  signal \error_code1_inferred__0/i__carry__1_n_2\ : STD_LOGIC;
  signal \error_code1_inferred__0/i__carry__1_n_3\ : STD_LOGIC;
  signal \error_code1_inferred__0/i__carry_n_0\ : STD_LOGIC;
  signal \error_code1_inferred__0/i__carry_n_1\ : STD_LOGIC;
  signal \error_code1_inferred__0/i__carry_n_2\ : STD_LOGIC;
  signal \error_code1_inferred__0/i__carry_n_3\ : STD_LOGIC;
  signal \error_code[0]_i_3_n_0\ : STD_LOGIC;
  signal \error_code[0]_i_4_n_0\ : STD_LOGIC;
  signal \error_code[1]_i_3_n_0\ : STD_LOGIC;
  signal \error_code[1]_i_4_n_0\ : STD_LOGIC;
  signal \error_code[1]_i_5_n_0\ : STD_LOGIC;
  signal \error_code[2]_i_10_n_0\ : STD_LOGIC;
  signal \error_code[2]_i_11_n_0\ : STD_LOGIC;
  signal \error_code[2]_i_12_n_0\ : STD_LOGIC;
  signal \error_code[2]_i_13_n_0\ : STD_LOGIC;
  signal \error_code[2]_i_14_n_0\ : STD_LOGIC;
  signal \error_code[2]_i_4_n_0\ : STD_LOGIC;
  signal \error_code[2]_i_5_n_0\ : STD_LOGIC;
  signal \error_code[2]_i_6_n_0\ : STD_LOGIC;
  signal \error_code[2]_i_7_n_0\ : STD_LOGIC;
  signal \error_code[2]_i_8_n_0\ : STD_LOGIC;
  signal \error_code[2]_i_9_n_0\ : STD_LOGIC;
  signal generated_clock : STD_LOGIC;
  signal generated_data : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal interface_initialized : STD_LOGIC;
  signal next_tag : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal p_0_in1_in : STD_LOGIC;
  signal p_1_in : STD_LOGIC_VECTOR ( 31 downto 5 );
  signal p_3_out : STD_LOGIC_VECTOR ( 0 to 0 );
  signal pad_release : STD_LOGIC;
  signal pad_release0 : STD_LOGIC;
  signal pad_tristate : STD_LOGIC_VECTOR ( 12 downto 0 );
  attribute DONT_TOUCH : boolean;
  attribute DONT_TOUCH of pad_tristate : signal is std.standard.true;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of pad_tristate : signal is "true";
  signal \pad_tristate[12]_i_2_n_0\ : STD_LOGIC;
  signal pad_tristate_reg0 : STD_LOGIC;
  signal parked_sync : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of parked_sync : signal is "true";
  attribute shreg_extract of parked_sync : signal is "no";
  signal pending_request_reg_n_0 : STD_LOGIC;
  signal permit_seen_low : STD_LOGIC;
  signal permit_seen_low_i_1_n_0 : STD_LOGIC;
  signal permit_sync : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of permit_sync : signal is "true";
  attribute shreg_extract of permit_sync : signal is "no";
  signal \permit_sync[1]_i_1_n_0\ : STD_LOGIC;
  signal pins_enabled : STD_LOGIC;
  signal \query[3]_i_1_n_0\ : STD_LOGIC;
  signal \query[3]_i_2_n_0\ : STD_LOGIC;
  signal \query__0\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal reference_config_ftw0 : STD_LOGIC;
  signal reference_valid0 : STD_LOGIC;
  signal \reference_valid0_carry__0_n_0\ : STD_LOGIC;
  signal \reference_valid0_carry__0_n_1\ : STD_LOGIC;
  signal \reference_valid0_carry__0_n_2\ : STD_LOGIC;
  signal \reference_valid0_carry__0_n_3\ : STD_LOGIC;
  signal \reference_valid0_carry__1_n_2\ : STD_LOGIC;
  signal \reference_valid0_carry__1_n_3\ : STD_LOGIC;
  signal reference_valid0_carry_n_0 : STD_LOGIC;
  signal reference_valid0_carry_n_1 : STD_LOGIC;
  signal reference_valid0_carry_n_2 : STD_LOGIC;
  signal reference_valid0_carry_n_3 : STD_LOGIC;
  signal \reply_data_reg_n_0_[0]\ : STD_LOGIC;
  signal \reply_data_reg_n_0_[10]\ : STD_LOGIC;
  signal \reply_data_reg_n_0_[11]\ : STD_LOGIC;
  signal \reply_data_reg_n_0_[12]\ : STD_LOGIC;
  signal \reply_data_reg_n_0_[13]\ : STD_LOGIC;
  signal \reply_data_reg_n_0_[14]\ : STD_LOGIC;
  signal \reply_data_reg_n_0_[15]\ : STD_LOGIC;
  signal \reply_data_reg_n_0_[16]\ : STD_LOGIC;
  signal \reply_data_reg_n_0_[17]\ : STD_LOGIC;
  signal \reply_data_reg_n_0_[18]\ : STD_LOGIC;
  signal \reply_data_reg_n_0_[19]\ : STD_LOGIC;
  signal \reply_data_reg_n_0_[1]\ : STD_LOGIC;
  signal \reply_data_reg_n_0_[20]\ : STD_LOGIC;
  signal \reply_data_reg_n_0_[21]\ : STD_LOGIC;
  signal \reply_data_reg_n_0_[22]\ : STD_LOGIC;
  signal \reply_data_reg_n_0_[23]\ : STD_LOGIC;
  signal \reply_data_reg_n_0_[24]\ : STD_LOGIC;
  signal \reply_data_reg_n_0_[25]\ : STD_LOGIC;
  signal \reply_data_reg_n_0_[26]\ : STD_LOGIC;
  signal \reply_data_reg_n_0_[27]\ : STD_LOGIC;
  signal \reply_data_reg_n_0_[28]\ : STD_LOGIC;
  signal \reply_data_reg_n_0_[29]\ : STD_LOGIC;
  signal \reply_data_reg_n_0_[2]\ : STD_LOGIC;
  signal \reply_data_reg_n_0_[30]\ : STD_LOGIC;
  signal \reply_data_reg_n_0_[31]\ : STD_LOGIC;
  signal \reply_data_reg_n_0_[32]\ : STD_LOGIC;
  signal \reply_data_reg_n_0_[33]\ : STD_LOGIC;
  signal \reply_data_reg_n_0_[3]\ : STD_LOGIC;
  signal \reply_data_reg_n_0_[4]\ : STD_LOGIC;
  signal \reply_data_reg_n_0_[5]\ : STD_LOGIC;
  signal \reply_data_reg_n_0_[6]\ : STD_LOGIC;
  signal \reply_data_reg_n_0_[7]\ : STD_LOGIC;
  signal \reply_data_reg_n_0_[8]\ : STD_LOGIC;
  signal \reply_data_reg_n_0_[9]\ : STD_LOGIC;
  signal reply_pending : STD_LOGIC;
  signal \^reply_pending_reg_0\ : STD_LOGIC;
  signal reply_pending_reg_n_0 : STD_LOGIC;
  signal response_data : STD_LOGIC_VECTOR ( 33 downto 2 );
  signal response_valid : STD_LOGIC;
  signal sample_active : STD_LOGIC;
  signal sample_clipped : STD_LOGIC;
  signal sample_initialized : STD_LOGIC;
  signal sample_pending : STD_LOGIC;
  signal sample_pending1 : STD_LOGIC;
  signal \sample_pending1_carry__0_n_0\ : STD_LOGIC;
  signal \sample_pending1_carry__0_n_1\ : STD_LOGIC;
  signal \sample_pending1_carry__0_n_2\ : STD_LOGIC;
  signal \sample_pending1_carry__0_n_3\ : STD_LOGIC;
  signal \sample_pending1_carry__1_n_2\ : STD_LOGIC;
  signal \sample_pending1_carry__1_n_3\ : STD_LOGIC;
  signal sample_pending1_carry_n_0 : STD_LOGIC;
  signal sample_pending1_carry_n_1 : STD_LOGIC;
  signal sample_pending1_carry_n_2 : STD_LOGIC;
  signal sample_pending1_carry_n_3 : STD_LOGIC;
  signal \^sample_resetn_0\ : STD_LOGIC;
  signal sample_tag_pending : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal staged_enable : STD_LOGIC;
  signal staged_enable_i_1_n_0 : STD_LOGIC;
  signal \staged_ftw[26]_i_1_n_0\ : STD_LOGIC;
  signal \staged_ftw[31]_i_1_n_0\ : STD_LOGIC;
  signal \staged_ftw[31]_i_3_n_0\ : STD_LOGIC;
  signal \staged_ftw[31]_i_4_n_0\ : STD_LOGIC;
  signal \staged_ftw[31]_i_5_n_0\ : STD_LOGIC;
  signal \staged_ftw[31]_i_6_n_0\ : STD_LOGIC;
  signal \staged_ftw[31]_i_7_n_0\ : STD_LOGIC;
  signal \staged_ftw[31]_i_8_n_0\ : STD_LOGIC;
  signal \staged_ftw[31]_i_9_n_0\ : STD_LOGIC;
  signal \staged_ftw_reg_n_0_[0]\ : STD_LOGIC;
  signal \staged_ftw_reg_n_0_[10]\ : STD_LOGIC;
  signal \staged_ftw_reg_n_0_[11]\ : STD_LOGIC;
  signal \staged_ftw_reg_n_0_[12]\ : STD_LOGIC;
  signal \staged_ftw_reg_n_0_[13]\ : STD_LOGIC;
  signal \staged_ftw_reg_n_0_[14]\ : STD_LOGIC;
  signal \staged_ftw_reg_n_0_[15]\ : STD_LOGIC;
  signal \staged_ftw_reg_n_0_[16]\ : STD_LOGIC;
  signal \staged_ftw_reg_n_0_[17]\ : STD_LOGIC;
  signal \staged_ftw_reg_n_0_[18]\ : STD_LOGIC;
  signal \staged_ftw_reg_n_0_[19]\ : STD_LOGIC;
  signal \staged_ftw_reg_n_0_[1]\ : STD_LOGIC;
  signal \staged_ftw_reg_n_0_[20]\ : STD_LOGIC;
  signal \staged_ftw_reg_n_0_[21]\ : STD_LOGIC;
  signal \staged_ftw_reg_n_0_[22]\ : STD_LOGIC;
  signal \staged_ftw_reg_n_0_[23]\ : STD_LOGIC;
  signal \staged_ftw_reg_n_0_[24]\ : STD_LOGIC;
  signal \staged_ftw_reg_n_0_[25]\ : STD_LOGIC;
  signal \staged_ftw_reg_n_0_[26]\ : STD_LOGIC;
  signal \staged_ftw_reg_n_0_[27]\ : STD_LOGIC;
  signal \staged_ftw_reg_n_0_[28]\ : STD_LOGIC;
  signal \staged_ftw_reg_n_0_[29]\ : STD_LOGIC;
  signal \staged_ftw_reg_n_0_[2]\ : STD_LOGIC;
  signal \staged_ftw_reg_n_0_[30]\ : STD_LOGIC;
  signal \staged_ftw_reg_n_0_[3]\ : STD_LOGIC;
  signal \staged_ftw_reg_n_0_[4]\ : STD_LOGIC;
  signal \staged_ftw_reg_n_0_[5]\ : STD_LOGIC;
  signal \staged_ftw_reg_n_0_[6]\ : STD_LOGIC;
  signal \staged_ftw_reg_n_0_[7]\ : STD_LOGIC;
  signal \staged_ftw_reg_n_0_[8]\ : STD_LOGIC;
  signal \staged_ftw_reg_n_0_[9]\ : STD_LOGIC;
  signal \staged_gain[0]_i_1_n_0\ : STD_LOGIC;
  signal \staged_gain[10]_i_1_n_0\ : STD_LOGIC;
  signal \staged_gain[11]_i_1_n_0\ : STD_LOGIC;
  signal \staged_gain[11]_i_2_n_0\ : STD_LOGIC;
  signal \staged_gain[1]_i_1_n_0\ : STD_LOGIC;
  signal \staged_gain[2]_i_1_n_0\ : STD_LOGIC;
  signal \staged_gain[3]_i_1_n_0\ : STD_LOGIC;
  signal \staged_gain[4]_i_1_n_0\ : STD_LOGIC;
  signal \staged_gain[5]_i_1_n_0\ : STD_LOGIC;
  signal \staged_gain[6]_i_1_n_0\ : STD_LOGIC;
  signal \staged_gain[7]_i_1_n_0\ : STD_LOGIC;
  signal \staged_gain[8]_i_1_n_0\ : STD_LOGIC;
  signal \staged_gain[9]_i_1_n_0\ : STD_LOGIC;
  signal \staged_gain_reg_n_0_[0]\ : STD_LOGIC;
  signal \staged_gain_reg_n_0_[10]\ : STD_LOGIC;
  signal \staged_gain_reg_n_0_[11]\ : STD_LOGIC;
  signal \staged_gain_reg_n_0_[1]\ : STD_LOGIC;
  signal \staged_gain_reg_n_0_[2]\ : STD_LOGIC;
  signal \staged_gain_reg_n_0_[3]\ : STD_LOGIC;
  signal \staged_gain_reg_n_0_[4]\ : STD_LOGIC;
  signal \staged_gain_reg_n_0_[5]\ : STD_LOGIC;
  signal \staged_gain_reg_n_0_[6]\ : STD_LOGIC;
  signal \staged_gain_reg_n_0_[7]\ : STD_LOGIC;
  signal \staged_gain_reg_n_0_[8]\ : STD_LOGIC;
  signal \staged_gain_reg_n_0_[9]\ : STD_LOGIC;
  signal staged_invert : STD_LOGIC;
  signal staged_invert_i_1_n_0 : STD_LOGIC;
  signal \staged_offset[0]_i_1_n_0\ : STD_LOGIC;
  signal \staged_offset[10]_i_1_n_0\ : STD_LOGIC;
  signal \staged_offset[11]_i_1_n_0\ : STD_LOGIC;
  signal \staged_offset[1]_i_1_n_0\ : STD_LOGIC;
  signal \staged_offset[2]_i_1_n_0\ : STD_LOGIC;
  signal \staged_offset[3]_i_1_n_0\ : STD_LOGIC;
  signal \staged_offset[4]_i_1_n_0\ : STD_LOGIC;
  signal \staged_offset[5]_i_1_n_0\ : STD_LOGIC;
  signal \staged_offset[6]_i_1_n_0\ : STD_LOGIC;
  signal \staged_offset[7]_i_1_n_0\ : STD_LOGIC;
  signal \staged_offset[8]_i_1_n_0\ : STD_LOGIC;
  signal \staged_offset[9]_i_1_n_0\ : STD_LOGIC;
  signal \staged_offset__0\ : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal staged_phase : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \staged_phase[26]_i_1_n_0\ : STD_LOGIC;
  signal \staged_phase[31]_i_1_n_0\ : STD_LOGIC;
  signal \staged_restart__0\ : STD_LOGIC;
  signal staged_restart_i_1_n_0 : STD_LOGIC;
  signal \^status_word\ : STD_LOGIC_VECTOR ( 26 downto 0 );
  signal \status_word[0]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \status_word[0]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \status_word[0]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \status_word[10]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \status_word[10]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \status_word[10]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \status_word[11]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \status_word[11]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \status_word[11]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \status_word[12]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \status_word[12]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \status_word[13]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \status_word[13]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \status_word[14]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \status_word[14]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \status_word[15]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \status_word[15]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \status_word[1]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \status_word[1]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \status_word[1]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \status_word[2]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \status_word[2]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \status_word[2]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \status_word[3]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \status_word[3]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \status_word[3]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \status_word[4]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \status_word[4]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \status_word[4]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \status_word[5]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \status_word[5]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \status_word[5]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \status_word[6]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \status_word[6]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \status_word[6]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \status_word[7]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \status_word[7]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \status_word[7]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \status_word[8]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \status_word[8]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \status_word[8]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \status_word[9]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \status_word[9]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \status_word[9]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal tag_counter : STD_LOGIC;
  signal \tag_counter[0]_i_2_n_0\ : STD_LOGIC;
  signal tag_counter_reg : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \tag_counter_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \tag_counter_reg[0]_i_1_n_1\ : STD_LOGIC;
  signal \tag_counter_reg[0]_i_1_n_2\ : STD_LOGIC;
  signal \tag_counter_reg[0]_i_1_n_3\ : STD_LOGIC;
  signal \tag_counter_reg[0]_i_1_n_4\ : STD_LOGIC;
  signal \tag_counter_reg[0]_i_1_n_5\ : STD_LOGIC;
  signal \tag_counter_reg[0]_i_1_n_6\ : STD_LOGIC;
  signal \tag_counter_reg[0]_i_1_n_7\ : STD_LOGIC;
  signal \tag_counter_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \tag_counter_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \tag_counter_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \tag_counter_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \tag_counter_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \tag_counter_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \tag_counter_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \tag_counter_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \tag_counter_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \tag_counter_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \tag_counter_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \tag_counter_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \tag_counter_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \tag_counter_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \tag_counter_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \tag_counter_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \tag_counter_reg[20]_i_1_n_0\ : STD_LOGIC;
  signal \tag_counter_reg[20]_i_1_n_1\ : STD_LOGIC;
  signal \tag_counter_reg[20]_i_1_n_2\ : STD_LOGIC;
  signal \tag_counter_reg[20]_i_1_n_3\ : STD_LOGIC;
  signal \tag_counter_reg[20]_i_1_n_4\ : STD_LOGIC;
  signal \tag_counter_reg[20]_i_1_n_5\ : STD_LOGIC;
  signal \tag_counter_reg[20]_i_1_n_6\ : STD_LOGIC;
  signal \tag_counter_reg[20]_i_1_n_7\ : STD_LOGIC;
  signal \tag_counter_reg[24]_i_1_n_0\ : STD_LOGIC;
  signal \tag_counter_reg[24]_i_1_n_1\ : STD_LOGIC;
  signal \tag_counter_reg[24]_i_1_n_2\ : STD_LOGIC;
  signal \tag_counter_reg[24]_i_1_n_3\ : STD_LOGIC;
  signal \tag_counter_reg[24]_i_1_n_4\ : STD_LOGIC;
  signal \tag_counter_reg[24]_i_1_n_5\ : STD_LOGIC;
  signal \tag_counter_reg[24]_i_1_n_6\ : STD_LOGIC;
  signal \tag_counter_reg[24]_i_1_n_7\ : STD_LOGIC;
  signal \tag_counter_reg[28]_i_1_n_1\ : STD_LOGIC;
  signal \tag_counter_reg[28]_i_1_n_2\ : STD_LOGIC;
  signal \tag_counter_reg[28]_i_1_n_3\ : STD_LOGIC;
  signal \tag_counter_reg[28]_i_1_n_4\ : STD_LOGIC;
  signal \tag_counter_reg[28]_i_1_n_5\ : STD_LOGIC;
  signal \tag_counter_reg[28]_i_1_n_6\ : STD_LOGIC;
  signal \tag_counter_reg[28]_i_1_n_7\ : STD_LOGIC;
  signal \tag_counter_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \tag_counter_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \tag_counter_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \tag_counter_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \tag_counter_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \tag_counter_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \tag_counter_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \tag_counter_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \tag_counter_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \tag_counter_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \tag_counter_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \tag_counter_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \tag_counter_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \tag_counter_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \tag_counter_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \tag_counter_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal v2 : STD_LOGIC;
  signal waveform_n_41 : STD_LOGIC;
  signal waveform_n_42 : STD_LOGIC;
  signal waveform_n_43 : STD_LOGIC;
  signal waveform_n_44 : STD_LOGIC;
  signal waveform_n_77 : STD_LOGIC;
  signal waveform_n_78 : STD_LOGIC;
  signal waveform_n_79 : STD_LOGIC;
  signal waveform_n_80 : STD_LOGIC;
  signal waveform_n_81 : STD_LOGIC;
  signal waveform_n_82 : STD_LOGIC;
  signal waveform_n_83 : STD_LOGIC;
  signal waveform_n_84 : STD_LOGIC;
  signal waveform_n_85 : STD_LOGIC;
  signal waveform_n_86 : STD_LOGIC;
  signal waveform_n_87 : STD_LOGIC;
  signal waveform_n_88 : STD_LOGIC;
  signal waveform_n_89 : STD_LOGIC;
  signal waveform_n_90 : STD_LOGIC;
  signal waveform_n_91 : STD_LOGIC;
  signal waveform_n_92 : STD_LOGIC;
  signal waveform_n_93 : STD_LOGIC;
  signal waveform_n_94 : STD_LOGIC;
  signal waveform_n_96 : STD_LOGIC;
  signal waveform_n_97 : STD_LOGIC;
  signal \NLW_config_packet_reg[122]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_config_packet_reg[122]_i_2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal NLW_dac_clk_oddr_S_UNCONNECTED : STD_LOGIC;
  signal \NLW_error_code1_inferred__0/i__carry_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_error_code1_inferred__0/i__carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_error_code1_inferred__0/i__carry__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_error_code1_inferred__0/i__carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_reference_valid0_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_reference_valid0_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_reference_valid0_carry__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_reference_valid0_carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_sample_pending1_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_sample_pending1_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_sample_pending1_carry__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_sample_pending1_carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_tag_counter_reg[28]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[0]\ : label is "iSTATE:001,iSTATE0:010,iSTATE1:100,";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[1]\ : label is "iSTATE:001,iSTATE0:010,iSTATE1:100,";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[2]\ : label is "iSTATE:001,iSTATE0:010,iSTATE1:100,";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of acknowledged_i_5 : label is "soft_lutpair30";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of \clipped_sync_reg[0]\ : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of \clipped_sync_reg[0]\ : label is "yes";
  attribute SHREG_EXTRACT of \clipped_sync_reg[0]\ : label is "no";
  attribute ASYNC_REG_boolean of \clipped_sync_reg[1]\ : label is std.standard.true;
  attribute KEEP of \clipped_sync_reg[1]\ : label is "yes";
  attribute SHREG_EXTRACT of \clipped_sync_reg[1]\ : label is "no";
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of clock_pad : label is "PRIMITIVE";
  attribute CAPACITANCE : string;
  attribute CAPACITANCE of clock_pad : label is "DONT_CARE";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \config_packet_reg[103]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \config_packet_reg[107]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \config_packet_reg[111]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \config_packet_reg[115]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \config_packet_reg[119]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \config_packet_reg[122]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \config_packet_reg[95]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \config_packet_reg[99]_i_1\ : label is 35;
  attribute ASYNC_REG_boolean of \connected_sync_reg[0]\ : label is std.standard.true;
  attribute KEEP of \connected_sync_reg[0]\ : label is "yes";
  attribute SHREG_EXTRACT of \connected_sync_reg[0]\ : label is "no";
  attribute ASYNC_REG_boolean of \connected_sync_reg[1]\ : label is std.standard.true;
  attribute KEEP of \connected_sync_reg[1]\ : label is "yes";
  attribute SHREG_EXTRACT of \connected_sync_reg[1]\ : label is "no";
  attribute BOX_TYPE of dac_clk_oddr : label is "PRIMITIVE";
  attribute OPT_MODIFIED : string;
  attribute OPT_MODIFIED of dac_clk_oddr : label is "MLO";
  attribute \__SRVAL\ : string;
  attribute \__SRVAL\ of dac_clk_oddr : label is "FALSE";
  attribute SOFT_HLUTNM of \error_code[0]_i_4\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \error_code[1]_i_4\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \error_code[1]_i_5\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \error_code[2]_i_12\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \error_code[2]_i_13\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \error_code[2]_i_4\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \error_code[2]_i_8\ : label is "soft_lutpair35";
  attribute BOX_TYPE of \output_buffers[0].data_pad\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \output_buffers[0].data_pad\ : label is "DONT_CARE";
  attribute BOX_TYPE of \output_buffers[10].data_pad\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \output_buffers[10].data_pad\ : label is "DONT_CARE";
  attribute BOX_TYPE of \output_buffers[11].data_pad\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \output_buffers[11].data_pad\ : label is "DONT_CARE";
  attribute BOX_TYPE of \output_buffers[1].data_pad\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \output_buffers[1].data_pad\ : label is "DONT_CARE";
  attribute BOX_TYPE of \output_buffers[2].data_pad\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \output_buffers[2].data_pad\ : label is "DONT_CARE";
  attribute BOX_TYPE of \output_buffers[3].data_pad\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \output_buffers[3].data_pad\ : label is "DONT_CARE";
  attribute BOX_TYPE of \output_buffers[4].data_pad\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \output_buffers[4].data_pad\ : label is "DONT_CARE";
  attribute BOX_TYPE of \output_buffers[5].data_pad\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \output_buffers[5].data_pad\ : label is "DONT_CARE";
  attribute BOX_TYPE of \output_buffers[6].data_pad\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \output_buffers[6].data_pad\ : label is "DONT_CARE";
  attribute BOX_TYPE of \output_buffers[7].data_pad\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \output_buffers[7].data_pad\ : label is "DONT_CARE";
  attribute BOX_TYPE of \output_buffers[8].data_pad\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \output_buffers[8].data_pad\ : label is "DONT_CARE";
  attribute BOX_TYPE of \output_buffers[9].data_pad\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \output_buffers[9].data_pad\ : label is "DONT_CARE";
  attribute SOFT_HLUTNM of \pad_tristate[12]_i_1\ : label is "soft_lutpair38";
  attribute DONT_TOUCH of \pad_tristate_reg[0]\ : label is std.standard.true;
  attribute IOB : string;
  attribute IOB of \pad_tristate_reg[0]\ : label is "TRUE";
  attribute KEEP of \pad_tristate_reg[0]\ : label is "yes";
  attribute DONT_TOUCH of \pad_tristate_reg[10]\ : label is std.standard.true;
  attribute IOB of \pad_tristate_reg[10]\ : label is "TRUE";
  attribute KEEP of \pad_tristate_reg[10]\ : label is "yes";
  attribute DONT_TOUCH of \pad_tristate_reg[11]\ : label is std.standard.true;
  attribute IOB of \pad_tristate_reg[11]\ : label is "TRUE";
  attribute KEEP of \pad_tristate_reg[11]\ : label is "yes";
  attribute DONT_TOUCH of \pad_tristate_reg[12]\ : label is std.standard.true;
  attribute IOB of \pad_tristate_reg[12]\ : label is "TRUE";
  attribute KEEP of \pad_tristate_reg[12]\ : label is "yes";
  attribute DONT_TOUCH of \pad_tristate_reg[1]\ : label is std.standard.true;
  attribute IOB of \pad_tristate_reg[1]\ : label is "TRUE";
  attribute KEEP of \pad_tristate_reg[1]\ : label is "yes";
  attribute DONT_TOUCH of \pad_tristate_reg[2]\ : label is std.standard.true;
  attribute IOB of \pad_tristate_reg[2]\ : label is "TRUE";
  attribute KEEP of \pad_tristate_reg[2]\ : label is "yes";
  attribute DONT_TOUCH of \pad_tristate_reg[3]\ : label is std.standard.true;
  attribute IOB of \pad_tristate_reg[3]\ : label is "TRUE";
  attribute KEEP of \pad_tristate_reg[3]\ : label is "yes";
  attribute DONT_TOUCH of \pad_tristate_reg[4]\ : label is std.standard.true;
  attribute IOB of \pad_tristate_reg[4]\ : label is "TRUE";
  attribute KEEP of \pad_tristate_reg[4]\ : label is "yes";
  attribute DONT_TOUCH of \pad_tristate_reg[5]\ : label is std.standard.true;
  attribute IOB of \pad_tristate_reg[5]\ : label is "TRUE";
  attribute KEEP of \pad_tristate_reg[5]\ : label is "yes";
  attribute DONT_TOUCH of \pad_tristate_reg[6]\ : label is std.standard.true;
  attribute IOB of \pad_tristate_reg[6]\ : label is "TRUE";
  attribute KEEP of \pad_tristate_reg[6]\ : label is "yes";
  attribute DONT_TOUCH of \pad_tristate_reg[7]\ : label is std.standard.true;
  attribute IOB of \pad_tristate_reg[7]\ : label is "TRUE";
  attribute KEEP of \pad_tristate_reg[7]\ : label is "yes";
  attribute DONT_TOUCH of \pad_tristate_reg[8]\ : label is std.standard.true;
  attribute IOB of \pad_tristate_reg[8]\ : label is "TRUE";
  attribute KEEP of \pad_tristate_reg[8]\ : label is "yes";
  attribute DONT_TOUCH of \pad_tristate_reg[9]\ : label is std.standard.true;
  attribute IOB of \pad_tristate_reg[9]\ : label is "TRUE";
  attribute KEEP of \pad_tristate_reg[9]\ : label is "yes";
  attribute SOFT_HLUTNM of \parked_sync[0]_i_1\ : label is "soft_lutpair38";
  attribute ASYNC_REG_boolean of \parked_sync_reg[0]\ : label is std.standard.true;
  attribute KEEP of \parked_sync_reg[0]\ : label is "yes";
  attribute SHREG_EXTRACT of \parked_sync_reg[0]\ : label is "no";
  attribute ASYNC_REG_boolean of \parked_sync_reg[1]\ : label is std.standard.true;
  attribute KEEP of \parked_sync_reg[1]\ : label is "yes";
  attribute SHREG_EXTRACT of \parked_sync_reg[1]\ : label is "no";
  attribute ASYNC_REG_boolean of \permit_sync_reg[0]\ : label is std.standard.true;
  attribute KEEP of \permit_sync_reg[0]\ : label is "yes";
  attribute SHREG_EXTRACT of \permit_sync_reg[0]\ : label is "no";
  attribute ASYNC_REG_boolean of \permit_sync_reg[1]\ : label is std.standard.true;
  attribute KEEP of \permit_sync_reg[1]\ : label is "yes";
  attribute SHREG_EXTRACT of \permit_sync_reg[1]\ : label is "no";
  attribute SOFT_HLUTNM of staged_enable_i_1 : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \staged_ftw[10]_i_1\ : label is "soft_lutpair53";
  attribute SOFT_HLUTNM of \staged_ftw[11]_i_1\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \staged_ftw[12]_i_1\ : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of \staged_ftw[13]_i_1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \staged_ftw[14]_i_1\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of \staged_ftw[15]_i_1\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \staged_ftw[16]_i_1\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \staged_ftw[17]_i_1\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \staged_ftw[18]_i_1\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \staged_ftw[19]_i_1\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \staged_ftw[20]_i_1\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \staged_ftw[21]_i_1\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \staged_ftw[22]_i_1\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \staged_ftw[23]_i_1\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \staged_ftw[24]_i_1\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \staged_ftw[25]_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \staged_ftw[26]_i_2\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \staged_ftw[27]_i_1\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \staged_ftw[28]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \staged_ftw[29]_i_1\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \staged_ftw[30]_i_1\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \staged_ftw[31]_i_2\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \staged_ftw[31]_i_4\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \staged_ftw[31]_i_7\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \staged_ftw[31]_i_8\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \staged_ftw[31]_i_9\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \staged_ftw[5]_i_1\ : label is "soft_lutpair58";
  attribute SOFT_HLUTNM of \staged_ftw[6]_i_1\ : label is "soft_lutpair57";
  attribute SOFT_HLUTNM of \staged_ftw[7]_i_1\ : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of \staged_ftw[8]_i_1\ : label is "soft_lutpair55";
  attribute SOFT_HLUTNM of \staged_ftw[9]_i_1\ : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of \staged_gain[0]_i_1\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \staged_gain[10]_i_1\ : label is "soft_lutpair53";
  attribute SOFT_HLUTNM of \staged_gain[11]_i_2\ : label is "soft_lutpair59";
  attribute SOFT_HLUTNM of \staged_gain[1]_i_1\ : label is "soft_lutpair59";
  attribute SOFT_HLUTNM of \staged_gain[2]_i_1\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \staged_gain[3]_i_1\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \staged_gain[4]_i_1\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \staged_gain[5]_i_1\ : label is "soft_lutpair58";
  attribute SOFT_HLUTNM of \staged_gain[6]_i_1\ : label is "soft_lutpair57";
  attribute SOFT_HLUTNM of \staged_gain[7]_i_1\ : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of \staged_gain[8]_i_1\ : label is "soft_lutpair55";
  attribute SOFT_HLUTNM of \staged_gain[9]_i_1\ : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of staged_invert_i_1 : label is "soft_lutpair60";
  attribute SOFT_HLUTNM of \staged_offset[0]_i_1\ : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of \staged_offset[10]_i_1\ : label is "soft_lutpair60";
  attribute SOFT_HLUTNM of \staged_offset[11]_i_1\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \staged_offset[1]_i_1\ : label is "soft_lutpair61";
  attribute SOFT_HLUTNM of \staged_offset[2]_i_1\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of \staged_offset[3]_i_1\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \staged_offset[4]_i_1\ : label is "soft_lutpair61";
  attribute SOFT_HLUTNM of \staged_offset[5]_i_1\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \staged_offset[6]_i_1\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \staged_offset[7]_i_1\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \staged_offset[8]_i_1\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \staged_offset[9]_i_1\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of staged_restart_i_1 : label is "soft_lutpair37";
  attribute ADDER_THRESHOLD of \tag_counter_reg[0]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \tag_counter_reg[12]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \tag_counter_reg[16]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \tag_counter_reg[20]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \tag_counter_reg[24]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \tag_counter_reg[28]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \tag_counter_reg[4]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \tag_counter_reg[8]_i_1\ : label is 11;
begin
  reply_pending_reg_0 <= \^reply_pending_reg_0\;
  sample_resetn_0 <= \^sample_resetn_0\;
  status_word(26 downto 24) <= \^status_word\(26 downto 24);
  status_word(23) <= connected_sync(1);
  status_word(22 downto 21) <= \^status_word\(22 downto 21);
  status_word(20) <= clipped_sync(1);
  status_word(19 downto 17) <= \^status_word\(19 downto 17);
  status_word(16) <= parked_sync(1);
  status_word(15 downto 0) <= \^status_word\(15 downto 0);
\FSM_onehot_state_reg[0]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => control_clk,
      CE => '1',
      D => configuration_mailbox_n_137,
      PRE => \^sample_resetn_0\,
      Q => \FSM_onehot_state_reg_n_0_[0]\
    );
\FSM_onehot_state_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => control_clk,
      CE => '1',
      CLR => \^sample_resetn_0\,
      D => configuration_mailbox_n_138,
      Q => \FSM_onehot_state_reg_n_0_[1]\
    );
\FSM_onehot_state_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => control_clk,
      CE => '1',
      CLR => \^sample_resetn_0\,
      D => configuration_mailbox_n_136,
      Q => \FSM_onehot_state_reg_n_0_[2]\
    );
acknowledged_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EA2A"
    )
        port map (
      I0 => command_word(31),
      I1 => interface_initialized,
      I2 => \FSM_onehot_state_reg_n_0_[2]\,
      I3 => pending_request_reg_n_0,
      O => acknowledged_i_3_n_0
    );
acknowledged_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0006"
    )
        port map (
      I0 => \^status_word\(26),
      I1 => command_word(31),
      I2 => \FSM_onehot_state_reg_n_0_[2]\,
      I3 => \FSM_onehot_state_reg_n_0_[1]\,
      O => acknowledged_i_5_n_0
    );
acknowledged_reg: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => '1',
      CLR => \^sample_resetn_0\,
      D => configuration_mailbox_n_132,
      Q => \^status_word\(26)
    );
\applied_config_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[0]\,
      Q => \applied_config_reg_n_0_[0]\
    );
\applied_config_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[10]\,
      Q => \applied_config_reg_n_0_[10]\
    );
\applied_config_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[11]\,
      Q => \applied_config_reg_n_0_[11]\
    );
\applied_config_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[12]\,
      Q => \applied_config_reg_n_0_[12]\
    );
\applied_config_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[13]\,
      Q => \applied_config_reg_n_0_[13]\
    );
\applied_config_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[14]\,
      Q => \applied_config_reg_n_0_[14]\
    );
\applied_config_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[15]\,
      Q => \applied_config_reg_n_0_[15]\
    );
\applied_config_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[16]\,
      Q => data3(0)
    );
\applied_config_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[17]\,
      Q => data3(1)
    );
\applied_config_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[18]\,
      Q => data3(2)
    );
\applied_config_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[19]\,
      Q => data3(3)
    );
\applied_config_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[1]\,
      Q => \applied_config_reg_n_0_[1]\
    );
\applied_config_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[20]\,
      Q => data3(4)
    );
\applied_config_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[21]\,
      Q => data3(5)
    );
\applied_config_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[22]\,
      Q => data3(6)
    );
\applied_config_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[23]\,
      Q => data3(7)
    );
\applied_config_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[24]\,
      Q => data3(8)
    );
\applied_config_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[25]\,
      Q => data3(9)
    );
\applied_config_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[26]\,
      Q => data3(10)
    );
\applied_config_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[27]\,
      Q => data3(11)
    );
\applied_config_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[28]\,
      Q => data3(12)
    );
\applied_config_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[29]\,
      Q => data3(13)
    );
\applied_config_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[2]\,
      Q => \applied_config_reg_n_0_[2]\
    );
\applied_config_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[30]\,
      Q => data3(14)
    );
\applied_config_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[31]\,
      Q => data3(15)
    );
\applied_config_reg[32]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[32]\,
      Q => data4(0)
    );
\applied_config_reg[33]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[33]\,
      Q => data4(1)
    );
\applied_config_reg[34]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[34]\,
      Q => data4(2)
    );
\applied_config_reg[35]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[35]\,
      Q => data4(3)
    );
\applied_config_reg[36]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[36]\,
      Q => data4(4)
    );
\applied_config_reg[37]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[37]\,
      Q => data4(5)
    );
\applied_config_reg[38]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[38]\,
      Q => data4(6)
    );
\applied_config_reg[39]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[39]\,
      Q => data4(7)
    );
\applied_config_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[3]\,
      Q => \applied_config_reg_n_0_[3]\
    );
\applied_config_reg[40]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[40]\,
      Q => data4(8)
    );
\applied_config_reg[41]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[41]\,
      Q => data4(9)
    );
\applied_config_reg[42]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[42]\,
      Q => data4(10)
    );
\applied_config_reg[43]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[43]\,
      Q => data4(11)
    );
\applied_config_reg[44]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[44]\,
      Q => data4(12)
    );
\applied_config_reg[45]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[45]\,
      Q => data4(13)
    );
\applied_config_reg[46]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[46]\,
      Q => data4(14)
    );
\applied_config_reg[47]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[47]\,
      Q => data4(15)
    );
\applied_config_reg[48]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[48]\,
      Q => data5(0)
    );
\applied_config_reg[49]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[49]\,
      Q => data5(1)
    );
\applied_config_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[4]\,
      Q => \applied_config_reg_n_0_[4]\
    );
\applied_config_reg[50]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[50]\,
      Q => data5(2)
    );
\applied_config_reg[51]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[51]\,
      Q => data5(3)
    );
\applied_config_reg[52]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[52]\,
      Q => data5(4)
    );
\applied_config_reg[53]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[53]\,
      Q => data5(5)
    );
\applied_config_reg[54]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[54]\,
      Q => data5(6)
    );
\applied_config_reg[55]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[55]\,
      Q => data5(7)
    );
\applied_config_reg[56]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[56]\,
      Q => data5(8)
    );
\applied_config_reg[57]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[57]\,
      Q => data5(9)
    );
\applied_config_reg[58]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[58]\,
      Q => data5(10)
    );
\applied_config_reg[59]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[59]\,
      Q => data5(11)
    );
\applied_config_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[5]\,
      Q => \applied_config_reg_n_0_[5]\
    );
\applied_config_reg[60]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[60]\,
      Q => data5(12)
    );
\applied_config_reg[61]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[61]\,
      Q => data5(13)
    );
\applied_config_reg[62]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[62]\,
      Q => data5(14)
    );
\applied_config_reg[63]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[63]\,
      Q => data5(15)
    );
\applied_config_reg[64]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[64]\,
      Q => data6(0)
    );
\applied_config_reg[65]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[65]\,
      Q => data6(1)
    );
\applied_config_reg[66]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[66]\,
      Q => data6(2)
    );
\applied_config_reg[67]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[67]\,
      Q => data6(3)
    );
\applied_config_reg[68]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[68]\,
      Q => data6(4)
    );
\applied_config_reg[69]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[69]\,
      Q => data6(5)
    );
\applied_config_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[6]\,
      Q => \applied_config_reg_n_0_[6]\
    );
\applied_config_reg[70]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[70]\,
      Q => data6(6)
    );
\applied_config_reg[71]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[71]\,
      Q => data6(7)
    );
\applied_config_reg[72]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[72]\,
      Q => data6(8)
    );
\applied_config_reg[73]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[73]\,
      Q => data6(9)
    );
\applied_config_reg[74]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[74]\,
      Q => data6(10)
    );
\applied_config_reg[75]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[75]\,
      Q => data6(11)
    );
\applied_config_reg[76]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[76]\,
      Q => data7(0)
    );
\applied_config_reg[77]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[77]\,
      Q => data7(1)
    );
\applied_config_reg[78]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[78]\,
      Q => data7(2)
    );
\applied_config_reg[79]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[79]\,
      Q => data7(3)
    );
\applied_config_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[7]\,
      Q => \applied_config_reg_n_0_[7]\
    );
\applied_config_reg[80]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[80]\,
      Q => data7(4)
    );
\applied_config_reg[81]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[81]\,
      Q => data7(5)
    );
\applied_config_reg[82]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[82]\,
      Q => data7(6)
    );
\applied_config_reg[83]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[83]\,
      Q => data7(7)
    );
\applied_config_reg[84]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[84]\,
      Q => data7(8)
    );
\applied_config_reg[85]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[85]\,
      Q => data7(9)
    );
\applied_config_reg[86]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[86]\,
      Q => data7(10)
    );
\applied_config_reg[87]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[87]\,
      Q => data7(11)
    );
\applied_config_reg[88]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[88]\,
      Q => \^status_word\(21)
    );
\applied_config_reg[89]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[89]\,
      Q => data8(1)
    );
\applied_config_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[8]\,
      Q => \applied_config_reg_n_0_[8]\
    );
\applied_config_reg[90]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[90]\,
      Q => data8(2)
    );
\applied_config_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => \config_packet_reg_n_0_[9]\,
      Q => \applied_config_reg_n_0_[9]\
    );
\applied_tag_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => response_data(2),
      Q => \applied_tag_reg_n_0_[0]\
    );
\applied_tag_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => response_data(12),
      Q => \applied_tag_reg_n_0_[10]\
    );
\applied_tag_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => response_data(13),
      Q => \applied_tag_reg_n_0_[11]\
    );
\applied_tag_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => response_data(14),
      Q => \applied_tag_reg_n_0_[12]\
    );
\applied_tag_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => response_data(15),
      Q => \applied_tag_reg_n_0_[13]\
    );
\applied_tag_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => response_data(16),
      Q => \applied_tag_reg_n_0_[14]\
    );
\applied_tag_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => response_data(17),
      Q => \applied_tag_reg_n_0_[15]\
    );
\applied_tag_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => response_data(18),
      Q => data1(0)
    );
\applied_tag_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => response_data(19),
      Q => data1(1)
    );
\applied_tag_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => response_data(20),
      Q => data1(2)
    );
\applied_tag_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => response_data(21),
      Q => data1(3)
    );
\applied_tag_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => response_data(3),
      Q => \applied_tag_reg_n_0_[1]\
    );
\applied_tag_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => response_data(22),
      Q => data1(4)
    );
\applied_tag_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => response_data(23),
      Q => data1(5)
    );
\applied_tag_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => response_data(24),
      Q => data1(6)
    );
\applied_tag_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => response_data(25),
      Q => data1(7)
    );
\applied_tag_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => response_data(26),
      Q => data1(8)
    );
\applied_tag_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => response_data(27),
      Q => data1(9)
    );
\applied_tag_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => response_data(28),
      Q => data1(10)
    );
\applied_tag_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => response_data(29),
      Q => data1(11)
    );
\applied_tag_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => response_data(30),
      Q => data1(12)
    );
\applied_tag_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => response_data(31),
      Q => data1(13)
    );
\applied_tag_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => response_data(4),
      Q => \applied_tag_reg_n_0_[2]\
    );
\applied_tag_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => response_data(32),
      Q => data1(14)
    );
\applied_tag_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => response_data(33),
      Q => data1(15)
    );
\applied_tag_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => response_data(5),
      Q => \applied_tag_reg_n_0_[3]\
    );
\applied_tag_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => response_data(6),
      Q => \applied_tag_reg_n_0_[4]\
    );
\applied_tag_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => response_data(7),
      Q => \applied_tag_reg_n_0_[5]\
    );
\applied_tag_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => response_data(8),
      Q => \applied_tag_reg_n_0_[6]\
    );
\applied_tag_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => response_data(9),
      Q => \applied_tag_reg_n_0_[7]\
    );
\applied_tag_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => response_data(10),
      Q => \applied_tag_reg_n_0_[8]\
    );
\applied_tag_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => confirmation_mailbox_n_1,
      CLR => \^sample_resetn_0\,
      D => response_data(11),
      Q => \applied_tag_reg_n_0_[9]\
    );
awaiting_sample_reg: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => '1',
      CLR => \^sample_resetn_0\,
      D => waveform_n_96,
      Q => awaiting_sample_reg_n_0
    );
\clipped_sync_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => '1',
      CLR => \^sample_resetn_0\,
      D => sample_clipped,
      Q => clipped_sync(0)
    );
\clipped_sync_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => '1',
      CLR => \^sample_resetn_0\,
      D => clipped_sync(0),
      Q => clipped_sync(1)
    );
clock_pad: unisim.vcomponents.OBUFT
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => generated_clock,
      O => dac_clk,
      T => pad_tristate(12)
    );
clock_run_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => permit_sync(1),
      I1 => pad_tristate(12),
      O => clock_run0
    );
clock_run_reg: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => '1',
      CLR => \^sample_resetn_0\,
      D => clock_run0,
      Q => clock_run
    );
\config_packet[91]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => tag_counter_reg(0),
      O => next_tag(0)
    );
\config_packet_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \staged_ftw_reg_n_0_[0]\,
      Q => \config_packet_reg_n_0_[0]\
    );
\config_packet_reg[100]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => next_tag(9),
      Q => \config_packet_reg_n_0_[100]\
    );
\config_packet_reg[101]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => next_tag(10),
      Q => \config_packet_reg_n_0_[101]\
    );
\config_packet_reg[102]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => next_tag(11),
      Q => \config_packet_reg_n_0_[102]\
    );
\config_packet_reg[103]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => next_tag(12),
      Q => \config_packet_reg_n_0_[103]\
    );
\config_packet_reg[103]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \config_packet_reg[99]_i_1_n_0\,
      CO(3) => \config_packet_reg[103]_i_1_n_0\,
      CO(2) => \config_packet_reg[103]_i_1_n_1\,
      CO(1) => \config_packet_reg[103]_i_1_n_2\,
      CO(0) => \config_packet_reg[103]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => next_tag(12 downto 9),
      S(3 downto 0) => tag_counter_reg(12 downto 9)
    );
\config_packet_reg[104]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => next_tag(13),
      Q => \config_packet_reg_n_0_[104]\
    );
\config_packet_reg[105]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => next_tag(14),
      Q => \config_packet_reg_n_0_[105]\
    );
\config_packet_reg[106]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => next_tag(15),
      Q => \config_packet_reg_n_0_[106]\
    );
\config_packet_reg[107]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => next_tag(16),
      Q => \config_packet_reg_n_0_[107]\
    );
\config_packet_reg[107]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \config_packet_reg[103]_i_1_n_0\,
      CO(3) => \config_packet_reg[107]_i_1_n_0\,
      CO(2) => \config_packet_reg[107]_i_1_n_1\,
      CO(1) => \config_packet_reg[107]_i_1_n_2\,
      CO(0) => \config_packet_reg[107]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => next_tag(16 downto 13),
      S(3 downto 0) => tag_counter_reg(16 downto 13)
    );
\config_packet_reg[108]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => next_tag(17),
      Q => \config_packet_reg_n_0_[108]\
    );
\config_packet_reg[109]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => next_tag(18),
      Q => \config_packet_reg_n_0_[109]\
    );
\config_packet_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \staged_ftw_reg_n_0_[10]\,
      Q => \config_packet_reg_n_0_[10]\
    );
\config_packet_reg[110]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => next_tag(19),
      Q => \config_packet_reg_n_0_[110]\
    );
\config_packet_reg[111]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => next_tag(20),
      Q => \config_packet_reg_n_0_[111]\
    );
\config_packet_reg[111]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \config_packet_reg[107]_i_1_n_0\,
      CO(3) => \config_packet_reg[111]_i_1_n_0\,
      CO(2) => \config_packet_reg[111]_i_1_n_1\,
      CO(1) => \config_packet_reg[111]_i_1_n_2\,
      CO(0) => \config_packet_reg[111]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => next_tag(20 downto 17),
      S(3 downto 0) => tag_counter_reg(20 downto 17)
    );
\config_packet_reg[112]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => next_tag(21),
      Q => \config_packet_reg_n_0_[112]\
    );
\config_packet_reg[113]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => next_tag(22),
      Q => \config_packet_reg_n_0_[113]\
    );
\config_packet_reg[114]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => next_tag(23),
      Q => \config_packet_reg_n_0_[114]\
    );
\config_packet_reg[115]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => next_tag(24),
      Q => \config_packet_reg_n_0_[115]\
    );
\config_packet_reg[115]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \config_packet_reg[111]_i_1_n_0\,
      CO(3) => \config_packet_reg[115]_i_1_n_0\,
      CO(2) => \config_packet_reg[115]_i_1_n_1\,
      CO(1) => \config_packet_reg[115]_i_1_n_2\,
      CO(0) => \config_packet_reg[115]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => next_tag(24 downto 21),
      S(3 downto 0) => tag_counter_reg(24 downto 21)
    );
\config_packet_reg[116]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => next_tag(25),
      Q => \config_packet_reg_n_0_[116]\
    );
\config_packet_reg[117]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => next_tag(26),
      Q => \config_packet_reg_n_0_[117]\
    );
\config_packet_reg[118]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => next_tag(27),
      Q => \config_packet_reg_n_0_[118]\
    );
\config_packet_reg[119]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => next_tag(28),
      Q => \config_packet_reg_n_0_[119]\
    );
\config_packet_reg[119]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \config_packet_reg[115]_i_1_n_0\,
      CO(3) => \config_packet_reg[119]_i_1_n_0\,
      CO(2) => \config_packet_reg[119]_i_1_n_1\,
      CO(1) => \config_packet_reg[119]_i_1_n_2\,
      CO(0) => \config_packet_reg[119]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => next_tag(28 downto 25),
      S(3 downto 0) => tag_counter_reg(28 downto 25)
    );
\config_packet_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \staged_ftw_reg_n_0_[11]\,
      Q => \config_packet_reg_n_0_[11]\
    );
\config_packet_reg[120]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => next_tag(29),
      Q => \config_packet_reg_n_0_[120]\
    );
\config_packet_reg[121]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => next_tag(30),
      Q => \config_packet_reg_n_0_[121]\
    );
\config_packet_reg[122]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => next_tag(31),
      Q => \config_packet_reg_n_0_[122]\
    );
\config_packet_reg[122]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \config_packet_reg[119]_i_1_n_0\,
      CO(3 downto 2) => \NLW_config_packet_reg[122]_i_2_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \config_packet_reg[122]_i_2_n_2\,
      CO(0) => \config_packet_reg[122]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_config_packet_reg[122]_i_2_O_UNCONNECTED\(3),
      O(2 downto 0) => next_tag(31 downto 29),
      S(3) => '0',
      S(2 downto 0) => tag_counter_reg(31 downto 29)
    );
\config_packet_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \staged_ftw_reg_n_0_[12]\,
      Q => \config_packet_reg_n_0_[12]\
    );
\config_packet_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \staged_ftw_reg_n_0_[13]\,
      Q => \config_packet_reg_n_0_[13]\
    );
\config_packet_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \staged_ftw_reg_n_0_[14]\,
      Q => \config_packet_reg_n_0_[14]\
    );
\config_packet_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \staged_ftw_reg_n_0_[15]\,
      Q => \config_packet_reg_n_0_[15]\
    );
\config_packet_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \staged_ftw_reg_n_0_[16]\,
      Q => \config_packet_reg_n_0_[16]\
    );
\config_packet_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \staged_ftw_reg_n_0_[17]\,
      Q => \config_packet_reg_n_0_[17]\
    );
\config_packet_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \staged_ftw_reg_n_0_[18]\,
      Q => \config_packet_reg_n_0_[18]\
    );
\config_packet_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \staged_ftw_reg_n_0_[19]\,
      Q => \config_packet_reg_n_0_[19]\
    );
\config_packet_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \staged_ftw_reg_n_0_[1]\,
      Q => \config_packet_reg_n_0_[1]\
    );
\config_packet_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \staged_ftw_reg_n_0_[20]\,
      Q => \config_packet_reg_n_0_[20]\
    );
\config_packet_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \staged_ftw_reg_n_0_[21]\,
      Q => \config_packet_reg_n_0_[21]\
    );
\config_packet_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \staged_ftw_reg_n_0_[22]\,
      Q => \config_packet_reg_n_0_[22]\
    );
\config_packet_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \staged_ftw_reg_n_0_[23]\,
      Q => \config_packet_reg_n_0_[23]\
    );
\config_packet_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \staged_ftw_reg_n_0_[24]\,
      Q => \config_packet_reg_n_0_[24]\
    );
\config_packet_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \staged_ftw_reg_n_0_[25]\,
      Q => \config_packet_reg_n_0_[25]\
    );
\config_packet_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \staged_ftw_reg_n_0_[26]\,
      Q => \config_packet_reg_n_0_[26]\
    );
\config_packet_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \staged_ftw_reg_n_0_[27]\,
      Q => \config_packet_reg_n_0_[27]\
    );
\config_packet_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \staged_ftw_reg_n_0_[28]\,
      Q => \config_packet_reg_n_0_[28]\
    );
\config_packet_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \staged_ftw_reg_n_0_[29]\,
      Q => \config_packet_reg_n_0_[29]\
    );
\config_packet_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \staged_ftw_reg_n_0_[2]\,
      Q => \config_packet_reg_n_0_[2]\
    );
\config_packet_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \staged_ftw_reg_n_0_[30]\,
      Q => \config_packet_reg_n_0_[30]\
    );
\config_packet_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => p_0_in1_in,
      Q => \config_packet_reg_n_0_[31]\
    );
\config_packet_reg[32]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => staged_phase(0),
      Q => \config_packet_reg_n_0_[32]\
    );
\config_packet_reg[33]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => staged_phase(1),
      Q => \config_packet_reg_n_0_[33]\
    );
\config_packet_reg[34]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => staged_phase(2),
      Q => \config_packet_reg_n_0_[34]\
    );
\config_packet_reg[35]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => staged_phase(3),
      Q => \config_packet_reg_n_0_[35]\
    );
\config_packet_reg[36]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => staged_phase(4),
      Q => \config_packet_reg_n_0_[36]\
    );
\config_packet_reg[37]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => staged_phase(5),
      Q => \config_packet_reg_n_0_[37]\
    );
\config_packet_reg[38]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => staged_phase(6),
      Q => \config_packet_reg_n_0_[38]\
    );
\config_packet_reg[39]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => staged_phase(7),
      Q => \config_packet_reg_n_0_[39]\
    );
\config_packet_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \staged_ftw_reg_n_0_[3]\,
      Q => \config_packet_reg_n_0_[3]\
    );
\config_packet_reg[40]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => staged_phase(8),
      Q => \config_packet_reg_n_0_[40]\
    );
\config_packet_reg[41]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => staged_phase(9),
      Q => \config_packet_reg_n_0_[41]\
    );
\config_packet_reg[42]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => staged_phase(10),
      Q => \config_packet_reg_n_0_[42]\
    );
\config_packet_reg[43]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => staged_phase(11),
      Q => \config_packet_reg_n_0_[43]\
    );
\config_packet_reg[44]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => staged_phase(12),
      Q => \config_packet_reg_n_0_[44]\
    );
\config_packet_reg[45]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => staged_phase(13),
      Q => \config_packet_reg_n_0_[45]\
    );
\config_packet_reg[46]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => staged_phase(14),
      Q => \config_packet_reg_n_0_[46]\
    );
\config_packet_reg[47]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => staged_phase(15),
      Q => \config_packet_reg_n_0_[47]\
    );
\config_packet_reg[48]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => staged_phase(16),
      Q => \config_packet_reg_n_0_[48]\
    );
\config_packet_reg[49]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => staged_phase(17),
      Q => \config_packet_reg_n_0_[49]\
    );
\config_packet_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \staged_ftw_reg_n_0_[4]\,
      Q => \config_packet_reg_n_0_[4]\
    );
\config_packet_reg[50]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => staged_phase(18),
      Q => \config_packet_reg_n_0_[50]\
    );
\config_packet_reg[51]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => staged_phase(19),
      Q => \config_packet_reg_n_0_[51]\
    );
\config_packet_reg[52]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => staged_phase(20),
      Q => \config_packet_reg_n_0_[52]\
    );
\config_packet_reg[53]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => staged_phase(21),
      Q => \config_packet_reg_n_0_[53]\
    );
\config_packet_reg[54]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => staged_phase(22),
      Q => \config_packet_reg_n_0_[54]\
    );
\config_packet_reg[55]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => staged_phase(23),
      Q => \config_packet_reg_n_0_[55]\
    );
\config_packet_reg[56]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => staged_phase(24),
      Q => \config_packet_reg_n_0_[56]\
    );
\config_packet_reg[57]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => staged_phase(25),
      Q => \config_packet_reg_n_0_[57]\
    );
\config_packet_reg[58]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => staged_phase(26),
      Q => \config_packet_reg_n_0_[58]\
    );
\config_packet_reg[59]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => staged_phase(27),
      Q => \config_packet_reg_n_0_[59]\
    );
\config_packet_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \staged_ftw_reg_n_0_[5]\,
      Q => \config_packet_reg_n_0_[5]\
    );
\config_packet_reg[60]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => staged_phase(28),
      Q => \config_packet_reg_n_0_[60]\
    );
\config_packet_reg[61]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => staged_phase(29),
      Q => \config_packet_reg_n_0_[61]\
    );
\config_packet_reg[62]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => staged_phase(30),
      Q => \config_packet_reg_n_0_[62]\
    );
\config_packet_reg[63]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => staged_phase(31),
      Q => \config_packet_reg_n_0_[63]\
    );
\config_packet_reg[64]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \staged_gain_reg_n_0_[0]\,
      Q => \config_packet_reg_n_0_[64]\
    );
\config_packet_reg[65]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \staged_gain_reg_n_0_[1]\,
      Q => \config_packet_reg_n_0_[65]\
    );
\config_packet_reg[66]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \staged_gain_reg_n_0_[2]\,
      Q => \config_packet_reg_n_0_[66]\
    );
\config_packet_reg[67]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \staged_gain_reg_n_0_[3]\,
      Q => \config_packet_reg_n_0_[67]\
    );
\config_packet_reg[68]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \staged_gain_reg_n_0_[4]\,
      Q => \config_packet_reg_n_0_[68]\
    );
\config_packet_reg[69]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \staged_gain_reg_n_0_[5]\,
      Q => \config_packet_reg_n_0_[69]\
    );
\config_packet_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \staged_ftw_reg_n_0_[6]\,
      Q => \config_packet_reg_n_0_[6]\
    );
\config_packet_reg[70]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \staged_gain_reg_n_0_[6]\,
      Q => \config_packet_reg_n_0_[70]\
    );
\config_packet_reg[71]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \staged_gain_reg_n_0_[7]\,
      Q => \config_packet_reg_n_0_[71]\
    );
\config_packet_reg[72]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \staged_gain_reg_n_0_[8]\,
      Q => \config_packet_reg_n_0_[72]\
    );
\config_packet_reg[73]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \staged_gain_reg_n_0_[9]\,
      Q => \config_packet_reg_n_0_[73]\
    );
\config_packet_reg[74]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \staged_gain_reg_n_0_[10]\,
      Q => \config_packet_reg_n_0_[74]\
    );
\config_packet_reg[75]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \staged_gain_reg_n_0_[11]\,
      Q => \config_packet_reg_n_0_[75]\
    );
\config_packet_reg[76]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \staged_offset__0\(0),
      Q => \config_packet_reg_n_0_[76]\
    );
\config_packet_reg[77]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \staged_offset__0\(1),
      Q => \config_packet_reg_n_0_[77]\
    );
\config_packet_reg[78]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \staged_offset__0\(2),
      Q => \config_packet_reg_n_0_[78]\
    );
\config_packet_reg[79]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \staged_offset__0\(3),
      Q => \config_packet_reg_n_0_[79]\
    );
\config_packet_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \staged_ftw_reg_n_0_[7]\,
      Q => \config_packet_reg_n_0_[7]\
    );
\config_packet_reg[80]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \staged_offset__0\(4),
      Q => \config_packet_reg_n_0_[80]\
    );
\config_packet_reg[81]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \staged_offset__0\(5),
      Q => \config_packet_reg_n_0_[81]\
    );
\config_packet_reg[82]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \staged_offset__0\(6),
      Q => \config_packet_reg_n_0_[82]\
    );
\config_packet_reg[83]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \staged_offset__0\(7),
      Q => \config_packet_reg_n_0_[83]\
    );
\config_packet_reg[84]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \staged_offset__0\(8),
      Q => \config_packet_reg_n_0_[84]\
    );
\config_packet_reg[85]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \staged_offset__0\(9),
      Q => \config_packet_reg_n_0_[85]\
    );
\config_packet_reg[86]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \staged_offset__0\(10),
      Q => \config_packet_reg_n_0_[86]\
    );
\config_packet_reg[87]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \staged_offset__0\(11),
      Q => \config_packet_reg_n_0_[87]\
    );
\config_packet_reg[88]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => staged_enable,
      Q => \config_packet_reg_n_0_[88]\
    );
\config_packet_reg[89]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => staged_invert,
      Q => \config_packet_reg_n_0_[89]\
    );
\config_packet_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \staged_ftw_reg_n_0_[8]\,
      Q => \config_packet_reg_n_0_[8]\
    );
\config_packet_reg[90]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \staged_restart__0\,
      Q => \config_packet_reg_n_0_[90]\
    );
\config_packet_reg[91]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => next_tag(0),
      Q => \config_packet_reg_n_0_[91]\
    );
\config_packet_reg[92]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => next_tag(1),
      Q => \config_packet_reg_n_0_[92]\
    );
\config_packet_reg[93]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => next_tag(2),
      Q => \config_packet_reg_n_0_[93]\
    );
\config_packet_reg[94]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => next_tag(3),
      Q => \config_packet_reg_n_0_[94]\
    );
\config_packet_reg[95]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => next_tag(4),
      Q => \config_packet_reg_n_0_[95]\
    );
\config_packet_reg[95]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \config_packet_reg[95]_i_1_n_0\,
      CO(2) => \config_packet_reg[95]_i_1_n_1\,
      CO(1) => \config_packet_reg[95]_i_1_n_2\,
      CO(0) => \config_packet_reg[95]_i_1_n_3\,
      CYINIT => tag_counter_reg(0),
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => next_tag(4 downto 1),
      S(3 downto 0) => tag_counter_reg(4 downto 1)
    );
\config_packet_reg[96]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => next_tag(5),
      Q => \config_packet_reg_n_0_[96]\
    );
\config_packet_reg[97]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => next_tag(6),
      Q => \config_packet_reg_n_0_[97]\
    );
\config_packet_reg[98]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => next_tag(7),
      Q => \config_packet_reg_n_0_[98]\
    );
\config_packet_reg[99]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => next_tag(8),
      Q => \config_packet_reg_n_0_[99]\
    );
\config_packet_reg[99]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \config_packet_reg[95]_i_1_n_0\,
      CO(3) => \config_packet_reg[99]_i_1_n_0\,
      CO(2) => \config_packet_reg[99]_i_1_n_1\,
      CO(1) => \config_packet_reg[99]_i_1_n_2\,
      CO(0) => \config_packet_reg[99]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => next_tag(8 downto 5),
      S(3 downto 0) => tag_counter_reg(8 downto 5)
    );
\config_packet_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \staged_ftw_reg_n_0_[9]\,
      Q => \config_packet_reg_n_0_[9]\
    );
configuration_mailbox: entity work.system_dac902_control_0_fdw_cdc_mailbox
     port map (
      E(0) => \^reply_pending_reg_0\,
      \FSM_onehot_state_reg[0]\ => confirmation_mailbox_n_34,
      \FSM_onehot_state_reg[0]_0\ => \FSM_onehot_state_reg_n_0_[0]\,
      \FSM_onehot_state_reg[1]\ => configuration_mailbox_n_136,
      \FSM_onehot_state_reg[1]_0\ => configuration_mailbox_n_138,
      \FSM_onehot_state_reg[2]\ => configuration_mailbox_n_137,
      \FSM_onehot_state_reg[2]_0\ => \FSM_onehot_state_reg_n_0_[2]\,
      Q(121 downto 90) => config_data(122 downto 91),
      Q(89 downto 0) => config_data(89 downto 0),
      acknowledge_toggle_reg_0 => reply_pending_reg_n_0,
      acknowledged_reg => acknowledged_i_3_n_0,
      acknowledged_reg_0 => acknowledged_i_5_n_0,
      acknowledged_reg_1 => \^status_word\(26),
      active_enable => active_enable,
      active_enable_reg(0) => configuration_mailbox_n_5,
      cfg_rejected0 => cfg_rejected0,
      command_word(4 downto 0) => command_word(31 downto 27),
      \command_word[27]\ => configuration_mailbox_n_1,
      \command_word[29]\ => configuration_mailbox_n_0,
      \command_word[31]\ => configuration_mailbox_n_133,
      control_clk => control_clk,
      \dst_data_reg[0]_0\ => \^sample_resetn_0\,
      \dst_data_reg[88]_0\ => configuration_mailbox_n_128,
      enabled2 => enabled2,
      \error_code_reg[0]\ => \error_code[0]_i_3_n_0\,
      \error_code_reg[2]\ => \error_code[2]_i_4_n_0\,
      \error_code_reg[2]_0\ => \error_code[2]_i_5_n_0\,
      \error_code_reg[2]_1\ => \error_code[2]_i_6_n_0\,
      interface_initialized => interface_initialized,
      interface_initialized_reg => configuration_mailbox_n_132,
      pending_request_reg => pending_request_reg_n_0,
      reference_config_ftw0 => reference_config_ftw0,
      reply_pending_reg => configuration_mailbox_n_134,
      request_toggle_reg_0 => \FSM_onehot_state_reg_n_0_[1]\,
      response_valid => response_valid,
      sample_clk => sample_clk,
      sample_pending => sample_pending,
      sample_pending_reg(0) => cfg_valid0,
      sample_pending_reg_0(0) => reply_pending,
      \src_data_hold_reg[122]_0\(122) => \config_packet_reg_n_0_[122]\,
      \src_data_hold_reg[122]_0\(121) => \config_packet_reg_n_0_[121]\,
      \src_data_hold_reg[122]_0\(120) => \config_packet_reg_n_0_[120]\,
      \src_data_hold_reg[122]_0\(119) => \config_packet_reg_n_0_[119]\,
      \src_data_hold_reg[122]_0\(118) => \config_packet_reg_n_0_[118]\,
      \src_data_hold_reg[122]_0\(117) => \config_packet_reg_n_0_[117]\,
      \src_data_hold_reg[122]_0\(116) => \config_packet_reg_n_0_[116]\,
      \src_data_hold_reg[122]_0\(115) => \config_packet_reg_n_0_[115]\,
      \src_data_hold_reg[122]_0\(114) => \config_packet_reg_n_0_[114]\,
      \src_data_hold_reg[122]_0\(113) => \config_packet_reg_n_0_[113]\,
      \src_data_hold_reg[122]_0\(112) => \config_packet_reg_n_0_[112]\,
      \src_data_hold_reg[122]_0\(111) => \config_packet_reg_n_0_[111]\,
      \src_data_hold_reg[122]_0\(110) => \config_packet_reg_n_0_[110]\,
      \src_data_hold_reg[122]_0\(109) => \config_packet_reg_n_0_[109]\,
      \src_data_hold_reg[122]_0\(108) => \config_packet_reg_n_0_[108]\,
      \src_data_hold_reg[122]_0\(107) => \config_packet_reg_n_0_[107]\,
      \src_data_hold_reg[122]_0\(106) => \config_packet_reg_n_0_[106]\,
      \src_data_hold_reg[122]_0\(105) => \config_packet_reg_n_0_[105]\,
      \src_data_hold_reg[122]_0\(104) => \config_packet_reg_n_0_[104]\,
      \src_data_hold_reg[122]_0\(103) => \config_packet_reg_n_0_[103]\,
      \src_data_hold_reg[122]_0\(102) => \config_packet_reg_n_0_[102]\,
      \src_data_hold_reg[122]_0\(101) => \config_packet_reg_n_0_[101]\,
      \src_data_hold_reg[122]_0\(100) => \config_packet_reg_n_0_[100]\,
      \src_data_hold_reg[122]_0\(99) => \config_packet_reg_n_0_[99]\,
      \src_data_hold_reg[122]_0\(98) => \config_packet_reg_n_0_[98]\,
      \src_data_hold_reg[122]_0\(97) => \config_packet_reg_n_0_[97]\,
      \src_data_hold_reg[122]_0\(96) => \config_packet_reg_n_0_[96]\,
      \src_data_hold_reg[122]_0\(95) => \config_packet_reg_n_0_[95]\,
      \src_data_hold_reg[122]_0\(94) => \config_packet_reg_n_0_[94]\,
      \src_data_hold_reg[122]_0\(93) => \config_packet_reg_n_0_[93]\,
      \src_data_hold_reg[122]_0\(92) => \config_packet_reg_n_0_[92]\,
      \src_data_hold_reg[122]_0\(91) => \config_packet_reg_n_0_[91]\,
      \src_data_hold_reg[122]_0\(90) => \config_packet_reg_n_0_[90]\,
      \src_data_hold_reg[122]_0\(89) => \config_packet_reg_n_0_[89]\,
      \src_data_hold_reg[122]_0\(88) => \config_packet_reg_n_0_[88]\,
      \src_data_hold_reg[122]_0\(87) => \config_packet_reg_n_0_[87]\,
      \src_data_hold_reg[122]_0\(86) => \config_packet_reg_n_0_[86]\,
      \src_data_hold_reg[122]_0\(85) => \config_packet_reg_n_0_[85]\,
      \src_data_hold_reg[122]_0\(84) => \config_packet_reg_n_0_[84]\,
      \src_data_hold_reg[122]_0\(83) => \config_packet_reg_n_0_[83]\,
      \src_data_hold_reg[122]_0\(82) => \config_packet_reg_n_0_[82]\,
      \src_data_hold_reg[122]_0\(81) => \config_packet_reg_n_0_[81]\,
      \src_data_hold_reg[122]_0\(80) => \config_packet_reg_n_0_[80]\,
      \src_data_hold_reg[122]_0\(79) => \config_packet_reg_n_0_[79]\,
      \src_data_hold_reg[122]_0\(78) => \config_packet_reg_n_0_[78]\,
      \src_data_hold_reg[122]_0\(77) => \config_packet_reg_n_0_[77]\,
      \src_data_hold_reg[122]_0\(76) => \config_packet_reg_n_0_[76]\,
      \src_data_hold_reg[122]_0\(75) => \config_packet_reg_n_0_[75]\,
      \src_data_hold_reg[122]_0\(74) => \config_packet_reg_n_0_[74]\,
      \src_data_hold_reg[122]_0\(73) => \config_packet_reg_n_0_[73]\,
      \src_data_hold_reg[122]_0\(72) => \config_packet_reg_n_0_[72]\,
      \src_data_hold_reg[122]_0\(71) => \config_packet_reg_n_0_[71]\,
      \src_data_hold_reg[122]_0\(70) => \config_packet_reg_n_0_[70]\,
      \src_data_hold_reg[122]_0\(69) => \config_packet_reg_n_0_[69]\,
      \src_data_hold_reg[122]_0\(68) => \config_packet_reg_n_0_[68]\,
      \src_data_hold_reg[122]_0\(67) => \config_packet_reg_n_0_[67]\,
      \src_data_hold_reg[122]_0\(66) => \config_packet_reg_n_0_[66]\,
      \src_data_hold_reg[122]_0\(65) => \config_packet_reg_n_0_[65]\,
      \src_data_hold_reg[122]_0\(64) => \config_packet_reg_n_0_[64]\,
      \src_data_hold_reg[122]_0\(63) => \config_packet_reg_n_0_[63]\,
      \src_data_hold_reg[122]_0\(62) => \config_packet_reg_n_0_[62]\,
      \src_data_hold_reg[122]_0\(61) => \config_packet_reg_n_0_[61]\,
      \src_data_hold_reg[122]_0\(60) => \config_packet_reg_n_0_[60]\,
      \src_data_hold_reg[122]_0\(59) => \config_packet_reg_n_0_[59]\,
      \src_data_hold_reg[122]_0\(58) => \config_packet_reg_n_0_[58]\,
      \src_data_hold_reg[122]_0\(57) => \config_packet_reg_n_0_[57]\,
      \src_data_hold_reg[122]_0\(56) => \config_packet_reg_n_0_[56]\,
      \src_data_hold_reg[122]_0\(55) => \config_packet_reg_n_0_[55]\,
      \src_data_hold_reg[122]_0\(54) => \config_packet_reg_n_0_[54]\,
      \src_data_hold_reg[122]_0\(53) => \config_packet_reg_n_0_[53]\,
      \src_data_hold_reg[122]_0\(52) => \config_packet_reg_n_0_[52]\,
      \src_data_hold_reg[122]_0\(51) => \config_packet_reg_n_0_[51]\,
      \src_data_hold_reg[122]_0\(50) => \config_packet_reg_n_0_[50]\,
      \src_data_hold_reg[122]_0\(49) => \config_packet_reg_n_0_[49]\,
      \src_data_hold_reg[122]_0\(48) => \config_packet_reg_n_0_[48]\,
      \src_data_hold_reg[122]_0\(47) => \config_packet_reg_n_0_[47]\,
      \src_data_hold_reg[122]_0\(46) => \config_packet_reg_n_0_[46]\,
      \src_data_hold_reg[122]_0\(45) => \config_packet_reg_n_0_[45]\,
      \src_data_hold_reg[122]_0\(44) => \config_packet_reg_n_0_[44]\,
      \src_data_hold_reg[122]_0\(43) => \config_packet_reg_n_0_[43]\,
      \src_data_hold_reg[122]_0\(42) => \config_packet_reg_n_0_[42]\,
      \src_data_hold_reg[122]_0\(41) => \config_packet_reg_n_0_[41]\,
      \src_data_hold_reg[122]_0\(40) => \config_packet_reg_n_0_[40]\,
      \src_data_hold_reg[122]_0\(39) => \config_packet_reg_n_0_[39]\,
      \src_data_hold_reg[122]_0\(38) => \config_packet_reg_n_0_[38]\,
      \src_data_hold_reg[122]_0\(37) => \config_packet_reg_n_0_[37]\,
      \src_data_hold_reg[122]_0\(36) => \config_packet_reg_n_0_[36]\,
      \src_data_hold_reg[122]_0\(35) => \config_packet_reg_n_0_[35]\,
      \src_data_hold_reg[122]_0\(34) => \config_packet_reg_n_0_[34]\,
      \src_data_hold_reg[122]_0\(33) => \config_packet_reg_n_0_[33]\,
      \src_data_hold_reg[122]_0\(32) => \config_packet_reg_n_0_[32]\,
      \src_data_hold_reg[122]_0\(31) => \config_packet_reg_n_0_[31]\,
      \src_data_hold_reg[122]_0\(30) => \config_packet_reg_n_0_[30]\,
      \src_data_hold_reg[122]_0\(29) => \config_packet_reg_n_0_[29]\,
      \src_data_hold_reg[122]_0\(28) => \config_packet_reg_n_0_[28]\,
      \src_data_hold_reg[122]_0\(27) => \config_packet_reg_n_0_[27]\,
      \src_data_hold_reg[122]_0\(26) => \config_packet_reg_n_0_[26]\,
      \src_data_hold_reg[122]_0\(25) => \config_packet_reg_n_0_[25]\,
      \src_data_hold_reg[122]_0\(24) => \config_packet_reg_n_0_[24]\,
      \src_data_hold_reg[122]_0\(23) => \config_packet_reg_n_0_[23]\,
      \src_data_hold_reg[122]_0\(22) => \config_packet_reg_n_0_[22]\,
      \src_data_hold_reg[122]_0\(21) => \config_packet_reg_n_0_[21]\,
      \src_data_hold_reg[122]_0\(20) => \config_packet_reg_n_0_[20]\,
      \src_data_hold_reg[122]_0\(19) => \config_packet_reg_n_0_[19]\,
      \src_data_hold_reg[122]_0\(18) => \config_packet_reg_n_0_[18]\,
      \src_data_hold_reg[122]_0\(17) => \config_packet_reg_n_0_[17]\,
      \src_data_hold_reg[122]_0\(16) => \config_packet_reg_n_0_[16]\,
      \src_data_hold_reg[122]_0\(15) => \config_packet_reg_n_0_[15]\,
      \src_data_hold_reg[122]_0\(14) => \config_packet_reg_n_0_[14]\,
      \src_data_hold_reg[122]_0\(13) => \config_packet_reg_n_0_[13]\,
      \src_data_hold_reg[122]_0\(12) => \config_packet_reg_n_0_[12]\,
      \src_data_hold_reg[122]_0\(11) => \config_packet_reg_n_0_[11]\,
      \src_data_hold_reg[122]_0\(10) => \config_packet_reg_n_0_[10]\,
      \src_data_hold_reg[122]_0\(9) => \config_packet_reg_n_0_[9]\,
      \src_data_hold_reg[122]_0\(8) => \config_packet_reg_n_0_[8]\,
      \src_data_hold_reg[122]_0\(7) => \config_packet_reg_n_0_[7]\,
      \src_data_hold_reg[122]_0\(6) => \config_packet_reg_n_0_[6]\,
      \src_data_hold_reg[122]_0\(5) => \config_packet_reg_n_0_[5]\,
      \src_data_hold_reg[122]_0\(4) => \config_packet_reg_n_0_[4]\,
      \src_data_hold_reg[122]_0\(3) => \config_packet_reg_n_0_[3]\,
      \src_data_hold_reg[122]_0\(2) => \config_packet_reg_n_0_[2]\,
      \src_data_hold_reg[122]_0\(1) => \config_packet_reg_n_0_[1]\,
      \src_data_hold_reg[122]_0\(0) => \config_packet_reg_n_0_[0]\,
      status_word(0) => \^status_word\(24),
      tag_counter => tag_counter,
      \tag_counter_reg[31]\ => \error_code[1]_i_3_n_0\,
      \tag_counter_reg[31]_0\ => \staged_ftw[31]_i_4_n_0\,
      v2 => v2,
      v2_reg(0) => configuration_mailbox_n_129
    );
confirmation_mailbox: entity work.\system_dac902_control_0_fdw_cdc_mailbox__parameterized0\
     port map (
      CO(0) => \error_code1_inferred__0/i__carry__1_n_1\,
      E(0) => confirmation_mailbox_n_1,
      \FSM_onehot_state_reg[2]\ => confirmation_mailbox_n_34,
      \FSM_onehot_state_reg[2]_0\ => confirmation_mailbox_n_47,
      \FSM_onehot_state_reg[2]_1\ => confirmation_mailbox_n_48,
      \FSM_onehot_state_reg[2]_2\ => confirmation_mailbox_n_49,
      Q(31 downto 0) => response_data(33 downto 2),
      S(3) => confirmation_mailbox_n_35,
      S(2) => confirmation_mailbox_n_36,
      S(1) => confirmation_mailbox_n_37,
      S(0) => confirmation_mailbox_n_38,
      acknowledge_toggle_reg_0 => \FSM_onehot_state_reg_n_0_[2]\,
      command_word(0) => command_word(31),
      \config_packet_reg[122]\(2) => confirmation_mailbox_n_43,
      \config_packet_reg[122]\(1) => confirmation_mailbox_n_44,
      \config_packet_reg[122]\(0) => confirmation_mailbox_n_45,
      control_clk => control_clk,
      \dst_data_reg[0]_0\ => \^sample_resetn_0\,
      \dst_data_reg[24]_0\(3) => confirmation_mailbox_n_39,
      \dst_data_reg[24]_0\(2) => confirmation_mailbox_n_40,
      \dst_data_reg[24]_0\(1) => confirmation_mailbox_n_41,
      \dst_data_reg[24]_0\(0) => confirmation_mailbox_n_42,
      \error_code1_inferred__0/i__carry__1\(32) => \config_packet_reg_n_0_[122]\,
      \error_code1_inferred__0/i__carry__1\(31) => \config_packet_reg_n_0_[121]\,
      \error_code1_inferred__0/i__carry__1\(30) => \config_packet_reg_n_0_[120]\,
      \error_code1_inferred__0/i__carry__1\(29) => \config_packet_reg_n_0_[119]\,
      \error_code1_inferred__0/i__carry__1\(28) => \config_packet_reg_n_0_[118]\,
      \error_code1_inferred__0/i__carry__1\(27) => \config_packet_reg_n_0_[117]\,
      \error_code1_inferred__0/i__carry__1\(26) => \config_packet_reg_n_0_[116]\,
      \error_code1_inferred__0/i__carry__1\(25) => \config_packet_reg_n_0_[115]\,
      \error_code1_inferred__0/i__carry__1\(24) => \config_packet_reg_n_0_[114]\,
      \error_code1_inferred__0/i__carry__1\(23) => \config_packet_reg_n_0_[113]\,
      \error_code1_inferred__0/i__carry__1\(22) => \config_packet_reg_n_0_[112]\,
      \error_code1_inferred__0/i__carry__1\(21) => \config_packet_reg_n_0_[111]\,
      \error_code1_inferred__0/i__carry__1\(20) => \config_packet_reg_n_0_[110]\,
      \error_code1_inferred__0/i__carry__1\(19) => \config_packet_reg_n_0_[109]\,
      \error_code1_inferred__0/i__carry__1\(18) => \config_packet_reg_n_0_[108]\,
      \error_code1_inferred__0/i__carry__1\(17) => \config_packet_reg_n_0_[107]\,
      \error_code1_inferred__0/i__carry__1\(16) => \config_packet_reg_n_0_[106]\,
      \error_code1_inferred__0/i__carry__1\(15) => \config_packet_reg_n_0_[105]\,
      \error_code1_inferred__0/i__carry__1\(14) => \config_packet_reg_n_0_[104]\,
      \error_code1_inferred__0/i__carry__1\(13) => \config_packet_reg_n_0_[103]\,
      \error_code1_inferred__0/i__carry__1\(12) => \config_packet_reg_n_0_[102]\,
      \error_code1_inferred__0/i__carry__1\(11) => \config_packet_reg_n_0_[101]\,
      \error_code1_inferred__0/i__carry__1\(10) => \config_packet_reg_n_0_[100]\,
      \error_code1_inferred__0/i__carry__1\(9) => \config_packet_reg_n_0_[99]\,
      \error_code1_inferred__0/i__carry__1\(8) => \config_packet_reg_n_0_[98]\,
      \error_code1_inferred__0/i__carry__1\(7) => \config_packet_reg_n_0_[97]\,
      \error_code1_inferred__0/i__carry__1\(6) => \config_packet_reg_n_0_[96]\,
      \error_code1_inferred__0/i__carry__1\(5) => \config_packet_reg_n_0_[95]\,
      \error_code1_inferred__0/i__carry__1\(4) => \config_packet_reg_n_0_[94]\,
      \error_code1_inferred__0/i__carry__1\(3) => \config_packet_reg_n_0_[93]\,
      \error_code1_inferred__0/i__carry__1\(2) => \config_packet_reg_n_0_[92]\,
      \error_code1_inferred__0/i__carry__1\(1) => \config_packet_reg_n_0_[91]\,
      \error_code1_inferred__0/i__carry__1\(0) => \config_packet_reg_n_0_[88]\,
      \error_code_reg[0]\ => \^status_word\(26),
      \error_code_reg[0]_0\ => \FSM_onehot_state_reg_n_0_[1]\,
      \error_code_reg[0]_1\ => configuration_mailbox_n_0,
      \error_code_reg[1]\ => \error_code[1]_i_3_n_0\,
      \error_code_reg[1]_0\ => \error_code[1]_i_4_n_0\,
      \error_code_reg[2]\ => configuration_mailbox_n_1,
      interface_initialized => interface_initialized,
      reply_pending_reg(0) => reply_pending,
      request_toggle_reg_0 => confirmation_mailbox_n_46,
      request_toggle_reg_1 => reply_pending_reg_n_0,
      response_valid => response_valid,
      sample_clk => sample_clk,
      \src_data_hold_reg[33]_0\(33) => \reply_data_reg_n_0_[33]\,
      \src_data_hold_reg[33]_0\(32) => \reply_data_reg_n_0_[32]\,
      \src_data_hold_reg[33]_0\(31) => \reply_data_reg_n_0_[31]\,
      \src_data_hold_reg[33]_0\(30) => \reply_data_reg_n_0_[30]\,
      \src_data_hold_reg[33]_0\(29) => \reply_data_reg_n_0_[29]\,
      \src_data_hold_reg[33]_0\(28) => \reply_data_reg_n_0_[28]\,
      \src_data_hold_reg[33]_0\(27) => \reply_data_reg_n_0_[27]\,
      \src_data_hold_reg[33]_0\(26) => \reply_data_reg_n_0_[26]\,
      \src_data_hold_reg[33]_0\(25) => \reply_data_reg_n_0_[25]\,
      \src_data_hold_reg[33]_0\(24) => \reply_data_reg_n_0_[24]\,
      \src_data_hold_reg[33]_0\(23) => \reply_data_reg_n_0_[23]\,
      \src_data_hold_reg[33]_0\(22) => \reply_data_reg_n_0_[22]\,
      \src_data_hold_reg[33]_0\(21) => \reply_data_reg_n_0_[21]\,
      \src_data_hold_reg[33]_0\(20) => \reply_data_reg_n_0_[20]\,
      \src_data_hold_reg[33]_0\(19) => \reply_data_reg_n_0_[19]\,
      \src_data_hold_reg[33]_0\(18) => \reply_data_reg_n_0_[18]\,
      \src_data_hold_reg[33]_0\(17) => \reply_data_reg_n_0_[17]\,
      \src_data_hold_reg[33]_0\(16) => \reply_data_reg_n_0_[16]\,
      \src_data_hold_reg[33]_0\(15) => \reply_data_reg_n_0_[15]\,
      \src_data_hold_reg[33]_0\(14) => \reply_data_reg_n_0_[14]\,
      \src_data_hold_reg[33]_0\(13) => \reply_data_reg_n_0_[13]\,
      \src_data_hold_reg[33]_0\(12) => \reply_data_reg_n_0_[12]\,
      \src_data_hold_reg[33]_0\(11) => \reply_data_reg_n_0_[11]\,
      \src_data_hold_reg[33]_0\(10) => \reply_data_reg_n_0_[10]\,
      \src_data_hold_reg[33]_0\(9) => \reply_data_reg_n_0_[9]\,
      \src_data_hold_reg[33]_0\(8) => \reply_data_reg_n_0_[8]\,
      \src_data_hold_reg[33]_0\(7) => \reply_data_reg_n_0_[7]\,
      \src_data_hold_reg[33]_0\(6) => \reply_data_reg_n_0_[6]\,
      \src_data_hold_reg[33]_0\(5) => \reply_data_reg_n_0_[5]\,
      \src_data_hold_reg[33]_0\(4) => \reply_data_reg_n_0_[4]\,
      \src_data_hold_reg[33]_0\(3) => \reply_data_reg_n_0_[3]\,
      \src_data_hold_reg[33]_0\(2) => \reply_data_reg_n_0_[2]\,
      \src_data_hold_reg[33]_0\(1) => \reply_data_reg_n_0_[1]\,
      \src_data_hold_reg[33]_0\(0) => \reply_data_reg_n_0_[0]\,
      status_word(2 downto 0) => \^status_word\(19 downto 17)
    );
\connected_sync[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => pad_tristate(12),
      O => pins_enabled
    );
\connected_sync_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => '1',
      CLR => \^sample_resetn_0\,
      D => pins_enabled,
      Q => connected_sync(0)
    );
\connected_sync_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => '1',
      CLR => \^sample_resetn_0\,
      D => connected_sync(0),
      Q => connected_sync(1)
    );
dac_clk_oddr: unisim.vcomponents.ODDR
    generic map(
      DDR_CLK_EDGE => "SAME_EDGE",
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D1_INVERTED => '0',
      IS_D2_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => sample_clk,
      CE => '1',
      D1 => '0',
      D2 => '1',
      Q => generated_clock,
      R => R0,
      S => NLW_dac_clk_oddr_S_UNCONNECTED
    );
dac_clk_oddr_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \^sample_resetn_0\,
      I1 => clock_run,
      O => R0
    );
\error_code1_inferred__0/i__carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \error_code1_inferred__0/i__carry_n_0\,
      CO(2) => \error_code1_inferred__0/i__carry_n_1\,
      CO(1) => \error_code1_inferred__0/i__carry_n_2\,
      CO(0) => \error_code1_inferred__0/i__carry_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"1111",
      O(3 downto 0) => \NLW_error_code1_inferred__0/i__carry_O_UNCONNECTED\(3 downto 0),
      S(3) => confirmation_mailbox_n_35,
      S(2) => confirmation_mailbox_n_36,
      S(1) => confirmation_mailbox_n_37,
      S(0) => confirmation_mailbox_n_38
    );
\error_code1_inferred__0/i__carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \error_code1_inferred__0/i__carry_n_0\,
      CO(3) => \error_code1_inferred__0/i__carry__0_n_0\,
      CO(2) => \error_code1_inferred__0/i__carry__0_n_1\,
      CO(1) => \error_code1_inferred__0/i__carry__0_n_2\,
      CO(0) => \error_code1_inferred__0/i__carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"1111",
      O(3 downto 0) => \NLW_error_code1_inferred__0/i__carry__0_O_UNCONNECTED\(3 downto 0),
      S(3) => confirmation_mailbox_n_39,
      S(2) => confirmation_mailbox_n_40,
      S(1) => confirmation_mailbox_n_41,
      S(0) => confirmation_mailbox_n_42
    );
\error_code1_inferred__0/i__carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \error_code1_inferred__0/i__carry__0_n_0\,
      CO(3) => \NLW_error_code1_inferred__0/i__carry__1_CO_UNCONNECTED\(3),
      CO(2) => \error_code1_inferred__0/i__carry__1_n_1\,
      CO(1) => \error_code1_inferred__0/i__carry__1_n_2\,
      CO(0) => \error_code1_inferred__0/i__carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0111",
      O(3 downto 0) => \NLW_error_code1_inferred__0/i__carry__1_O_UNCONNECTED\(3 downto 0),
      S(3) => '0',
      S(2) => confirmation_mailbox_n_43,
      S(1) => confirmation_mailbox_n_44,
      S(0) => confirmation_mailbox_n_45
    );
\error_code[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"000C00CE"
    )
        port map (
      I0 => \error_code[0]_i_4_n_0\,
      I1 => \staged_ftw[31]_i_3_n_0\,
      I2 => command_word(29),
      I3 => command_word(27),
      I4 => command_word(28),
      O => \error_code[0]_i_3_n_0\
    );
\error_code[0]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFE0"
    )
        port map (
      I0 => command_word(2),
      I1 => command_word(1),
      I2 => command_word(3),
      I3 => command_word(4),
      I4 => command_word(28),
      O => \error_code[0]_i_4_n_0\
    );
\error_code[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000002"
    )
        port map (
      I0 => \error_code[2]_i_6_n_0\,
      I1 => command_word(27),
      I2 => command_word(4),
      I3 => command_word(0),
      I4 => \error_code[1]_i_5_n_0\,
      I5 => \staged_ftw[31]_i_3_n_0\,
      O => \error_code[1]_i_3_n_0\
    );
\error_code[1]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"40004040"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[2]\,
      I1 => command_word(28),
      I2 => command_word(29),
      I3 => command_word(30),
      I4 => command_word(27),
      O => \error_code[1]_i_4_n_0\
    );
\error_code[1]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => command_word(1),
      I1 => command_word(2),
      I2 => p_0_in1_in,
      I3 => command_word(3),
      O => \error_code[1]_i_5_n_0\
    );
\error_code[2]_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \staged_gain_reg_n_0_[1]\,
      I1 => \staged_gain_reg_n_0_[0]\,
      I2 => \staged_gain_reg_n_0_[2]\,
      I3 => \staged_gain_reg_n_0_[5]\,
      O => \error_code[2]_i_10_n_0\
    );
\error_code[2]_i_11\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \staged_gain_reg_n_0_[3]\,
      I1 => \staged_gain_reg_n_0_[8]\,
      I2 => \staged_gain_reg_n_0_[9]\,
      I3 => \staged_gain_reg_n_0_[10]\,
      O => \error_code[2]_i_11_n_0\
    );
\error_code[2]_i_12\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => command_word(2),
      I1 => command_word(1),
      O => \error_code[2]_i_12_n_0\
    );
\error_code[2]_i_13\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => command_word(11),
      I1 => command_word(15),
      I2 => command_word(8),
      I3 => command_word(23),
      O => \error_code[2]_i_13_n_0\
    );
\error_code[2]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => command_word(9),
      I1 => command_word(10),
      I2 => command_word(20),
      I3 => p_0_in1_in,
      I4 => command_word(14),
      I5 => command_word(13),
      O => \error_code[2]_i_14_n_0\
    );
\error_code[2]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => command_word(28),
      I1 => command_word(29),
      O => \error_code[2]_i_4_n_0\
    );
\error_code[2]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \error_code[2]_i_7_n_0\,
      I1 => command_word(26),
      I2 => command_word(24),
      I3 => command_word(25),
      I4 => \error_code[2]_i_8_n_0\,
      I5 => \error_code[2]_i_9_n_0\,
      O => \error_code[2]_i_5_n_0\
    );
\error_code[2]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5555555555555557"
    )
        port map (
      I0 => \staged_gain_reg_n_0_[11]\,
      I1 => \staged_gain_reg_n_0_[6]\,
      I2 => \staged_gain_reg_n_0_[7]\,
      I3 => \staged_gain_reg_n_0_[4]\,
      I4 => \error_code[2]_i_10_n_0\,
      I5 => \error_code[2]_i_11_n_0\,
      O => \error_code[2]_i_6_n_0\
    );
\error_code[2]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => command_word(17),
      I1 => command_word(6),
      I2 => command_word(18),
      I3 => command_word(5),
      I4 => \error_code[2]_i_12_n_0\,
      I5 => \staged_ftw[31]_i_8_n_0\,
      O => \error_code[2]_i_7_n_0\
    );
\error_code[2]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => command_word(16),
      I1 => command_word(19),
      I2 => command_word(3),
      I3 => command_word(12),
      O => \error_code[2]_i_8_n_0\
    );
\error_code[2]_i_9\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => command_word(7),
      I1 => command_word(0),
      I2 => command_word(4),
      I3 => \error_code[2]_i_13_n_0\,
      I4 => \error_code[2]_i_14_n_0\,
      O => \error_code[2]_i_9_n_0\
    );
\error_code_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => '1',
      CLR => \^sample_resetn_0\,
      D => confirmation_mailbox_n_49,
      Q => \^status_word\(17)
    );
\error_code_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => '1',
      CLR => \^sample_resetn_0\,
      D => confirmation_mailbox_n_48,
      Q => \^status_word\(18)
    );
\error_code_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => '1',
      CLR => \^sample_resetn_0\,
      D => confirmation_mailbox_n_47,
      Q => \^status_word\(19)
    );
interface_initialized_reg: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => '1',
      CLR => \^sample_resetn_0\,
      D => '1',
      Q => interface_initialized
    );
\output_buffers[0].data_pad\: unisim.vcomponents.OBUFT
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => generated_data(0),
      O => dac_data(0),
      T => pad_tristate(0)
    );
\output_buffers[10].data_pad\: unisim.vcomponents.OBUFT
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => generated_data(10),
      O => dac_data(10),
      T => pad_tristate(10)
    );
\output_buffers[11].data_pad\: unisim.vcomponents.OBUFT
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => generated_data(11),
      O => dac_data(11),
      T => pad_tristate(11)
    );
\output_buffers[1].data_pad\: unisim.vcomponents.OBUFT
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => generated_data(1),
      O => dac_data(1),
      T => pad_tristate(1)
    );
\output_buffers[2].data_pad\: unisim.vcomponents.OBUFT
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => generated_data(2),
      O => dac_data(2),
      T => pad_tristate(2)
    );
\output_buffers[3].data_pad\: unisim.vcomponents.OBUFT
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => generated_data(3),
      O => dac_data(3),
      T => pad_tristate(3)
    );
\output_buffers[4].data_pad\: unisim.vcomponents.OBUFT
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => generated_data(4),
      O => dac_data(4),
      T => pad_tristate(4)
    );
\output_buffers[5].data_pad\: unisim.vcomponents.OBUFT
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => generated_data(5),
      O => dac_data(5),
      T => pad_tristate(5)
    );
\output_buffers[6].data_pad\: unisim.vcomponents.OBUFT
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => generated_data(6),
      O => dac_data(6),
      T => pad_tristate(6)
    );
\output_buffers[7].data_pad\: unisim.vcomponents.OBUFT
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => generated_data(7),
      O => dac_data(7),
      T => pad_tristate(7)
    );
\output_buffers[8].data_pad\: unisim.vcomponents.OBUFT
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => generated_data(8),
      O => dac_data(8),
      T => pad_tristate(8)
    );
\output_buffers[9].data_pad\: unisim.vcomponents.OBUFT
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => generated_data(9),
      O => dac_data(9),
      T => pad_tristate(9)
    );
pad_release_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => sample_initialized,
      I1 => permit_sync(1),
      O => pad_release0
    );
pad_release_reg: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => '1',
      CLR => \^sample_resetn_0\,
      D => pad_release0,
      Q => pad_release
    );
\pad_tristate[12]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => pad_release,
      O => pad_tristate_reg0
    );
\pad_tristate[12]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => permit_sync(1),
      O => \pad_tristate[12]_i_2_n_0\
    );
\pad_tristate_reg[0]\: unisim.vcomponents.FDPE
     port map (
      C => sample_clk,
      CE => '1',
      D => pad_tristate_reg0,
      PRE => \pad_tristate[12]_i_2_n_0\,
      Q => pad_tristate(0)
    );
\pad_tristate_reg[10]\: unisim.vcomponents.FDPE
     port map (
      C => sample_clk,
      CE => '1',
      D => pad_tristate_reg0,
      PRE => \pad_tristate[12]_i_2_n_0\,
      Q => pad_tristate(10)
    );
\pad_tristate_reg[11]\: unisim.vcomponents.FDPE
     port map (
      C => sample_clk,
      CE => '1',
      D => pad_tristate_reg0,
      PRE => \pad_tristate[12]_i_2_n_0\,
      Q => pad_tristate(11)
    );
\pad_tristate_reg[12]\: unisim.vcomponents.FDPE
     port map (
      C => sample_clk,
      CE => '1',
      D => pad_tristate_reg0,
      PRE => \pad_tristate[12]_i_2_n_0\,
      Q => pad_tristate(12)
    );
\pad_tristate_reg[1]\: unisim.vcomponents.FDPE
     port map (
      C => sample_clk,
      CE => '1',
      D => pad_tristate_reg0,
      PRE => \pad_tristate[12]_i_2_n_0\,
      Q => pad_tristate(1)
    );
\pad_tristate_reg[2]\: unisim.vcomponents.FDPE
     port map (
      C => sample_clk,
      CE => '1',
      D => pad_tristate_reg0,
      PRE => \pad_tristate[12]_i_2_n_0\,
      Q => pad_tristate(2)
    );
\pad_tristate_reg[3]\: unisim.vcomponents.FDPE
     port map (
      C => sample_clk,
      CE => '1',
      D => pad_tristate_reg0,
      PRE => \pad_tristate[12]_i_2_n_0\,
      Q => pad_tristate(3)
    );
\pad_tristate_reg[4]\: unisim.vcomponents.FDPE
     port map (
      C => sample_clk,
      CE => '1',
      D => pad_tristate_reg0,
      PRE => \pad_tristate[12]_i_2_n_0\,
      Q => pad_tristate(4)
    );
\pad_tristate_reg[5]\: unisim.vcomponents.FDPE
     port map (
      C => sample_clk,
      CE => '1',
      D => pad_tristate_reg0,
      PRE => \pad_tristate[12]_i_2_n_0\,
      Q => pad_tristate(5)
    );
\pad_tristate_reg[6]\: unisim.vcomponents.FDPE
     port map (
      C => sample_clk,
      CE => '1',
      D => pad_tristate_reg0,
      PRE => \pad_tristate[12]_i_2_n_0\,
      Q => pad_tristate(6)
    );
\pad_tristate_reg[7]\: unisim.vcomponents.FDPE
     port map (
      C => sample_clk,
      CE => '1',
      D => pad_tristate_reg0,
      PRE => \pad_tristate[12]_i_2_n_0\,
      Q => pad_tristate(7)
    );
\pad_tristate_reg[8]\: unisim.vcomponents.FDPE
     port map (
      C => sample_clk,
      CE => '1',
      D => pad_tristate_reg0,
      PRE => \pad_tristate[12]_i_2_n_0\,
      Q => pad_tristate(8)
    );
\pad_tristate_reg[9]\: unisim.vcomponents.FDPE
     port map (
      C => sample_clk,
      CE => '1',
      D => pad_tristate_reg0,
      PRE => \pad_tristate[12]_i_2_n_0\,
      Q => pad_tristate(9)
    );
\parked_sync[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => pad_release,
      I1 => clock_run,
      O => p_3_out(0)
    );
\parked_sync_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => '1',
      CLR => \^sample_resetn_0\,
      D => p_3_out(0),
      Q => parked_sync(0)
    );
\parked_sync_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => '1',
      CLR => \^sample_resetn_0\,
      D => parked_sync(0),
      Q => parked_sync(1)
    );
pending_request_reg: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => '1',
      CLR => \^sample_resetn_0\,
      D => configuration_mailbox_n_133,
      Q => pending_request_reg_n_0
    );
permit_seen_low_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => permit_seen_low,
      I1 => command_word(30),
      O => permit_seen_low_i_1_n_0
    );
permit_seen_low_reg: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => '1',
      CLR => \^sample_resetn_0\,
      D => permit_seen_low_i_1_n_0,
      Q => permit_seen_low
    );
\permit_sync[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BF"
    )
        port map (
      I0 => \^sample_resetn_0\,
      I1 => permit_seen_low,
      I2 => command_word(30),
      O => \permit_sync[1]_i_1_n_0\
    );
\permit_sync_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => '1',
      CLR => \permit_sync[1]_i_1_n_0\,
      D => '1',
      Q => permit_sync(0)
    );
\permit_sync_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => '1',
      CLR => \permit_sync[1]_i_1_n_0\,
      D => permit_sync(0),
      Q => permit_sync(1)
    );
\query[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0010"
    )
        port map (
      I0 => command_word(27),
      I1 => command_word(29),
      I2 => \staged_ftw[31]_i_4_n_0\,
      I3 => \query[3]_i_2_n_0\,
      O => \query[3]_i_1_n_0\
    );
\query[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFEFFFEFEFE"
    )
        port map (
      I0 => \staged_ftw[31]_i_3_n_0\,
      I1 => command_word(28),
      I2 => command_word(4),
      I3 => command_word(3),
      I4 => command_word(1),
      I5 => command_word(2),
      O => \query[3]_i_2_n_0\
    );
\query_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \query[3]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => command_word(0),
      Q => \query__0\(0)
    );
\query_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \query[3]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => command_word(1),
      Q => \query__0\(1)
    );
\query_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \query[3]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => command_word(2),
      Q => \query__0\(2)
    );
\query_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \query[3]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => command_word(3),
      Q => \query__0\(3)
    );
reference_valid0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => reference_valid0_carry_n_0,
      CO(2) => reference_valid0_carry_n_1,
      CO(1) => reference_valid0_carry_n_2,
      CO(0) => reference_valid0_carry_n_3,
      CYINIT => '1',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => NLW_reference_valid0_carry_O_UNCONNECTED(3 downto 0),
      S(3) => waveform_n_84,
      S(2) => waveform_n_85,
      S(1) => waveform_n_86,
      S(0) => waveform_n_87
    );
\reference_valid0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => reference_valid0_carry_n_0,
      CO(3) => \reference_valid0_carry__0_n_0\,
      CO(2) => \reference_valid0_carry__0_n_1\,
      CO(1) => \reference_valid0_carry__0_n_2\,
      CO(0) => \reference_valid0_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_reference_valid0_carry__0_O_UNCONNECTED\(3 downto 0),
      S(3) => waveform_n_88,
      S(2) => waveform_n_89,
      S(1) => waveform_n_90,
      S(0) => waveform_n_91
    );
\reference_valid0_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \reference_valid0_carry__0_n_0\,
      CO(3) => \NLW_reference_valid0_carry__1_CO_UNCONNECTED\(3),
      CO(2) => reference_valid0,
      CO(1) => \reference_valid0_carry__1_n_2\,
      CO(0) => \reference_valid0_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_reference_valid0_carry__1_O_UNCONNECTED\(3 downto 0),
      S(3) => '0',
      S(2) => waveform_n_92,
      S(1) => waveform_n_93,
      S(0) => waveform_n_94
    );
\reply_data_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reply_pending,
      CLR => \^sample_resetn_0\,
      D => sample_active,
      Q => \reply_data_reg_n_0_[0]\
    );
\reply_data_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reply_pending,
      CLR => \^sample_resetn_0\,
      D => sample_tag_pending(8),
      Q => \reply_data_reg_n_0_[10]\
    );
\reply_data_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reply_pending,
      CLR => \^sample_resetn_0\,
      D => sample_tag_pending(9),
      Q => \reply_data_reg_n_0_[11]\
    );
\reply_data_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reply_pending,
      CLR => \^sample_resetn_0\,
      D => sample_tag_pending(10),
      Q => \reply_data_reg_n_0_[12]\
    );
\reply_data_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reply_pending,
      CLR => \^sample_resetn_0\,
      D => sample_tag_pending(11),
      Q => \reply_data_reg_n_0_[13]\
    );
\reply_data_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reply_pending,
      CLR => \^sample_resetn_0\,
      D => sample_tag_pending(12),
      Q => \reply_data_reg_n_0_[14]\
    );
\reply_data_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reply_pending,
      CLR => \^sample_resetn_0\,
      D => sample_tag_pending(13),
      Q => \reply_data_reg_n_0_[15]\
    );
\reply_data_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reply_pending,
      CLR => \^sample_resetn_0\,
      D => sample_tag_pending(14),
      Q => \reply_data_reg_n_0_[16]\
    );
\reply_data_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reply_pending,
      CLR => \^sample_resetn_0\,
      D => sample_tag_pending(15),
      Q => \reply_data_reg_n_0_[17]\
    );
\reply_data_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reply_pending,
      CLR => \^sample_resetn_0\,
      D => sample_tag_pending(16),
      Q => \reply_data_reg_n_0_[18]\
    );
\reply_data_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reply_pending,
      CLR => \^sample_resetn_0\,
      D => sample_tag_pending(17),
      Q => \reply_data_reg_n_0_[19]\
    );
\reply_data_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reply_pending,
      CLR => \^sample_resetn_0\,
      D => cfg_rejected,
      Q => \reply_data_reg_n_0_[1]\
    );
\reply_data_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reply_pending,
      CLR => \^sample_resetn_0\,
      D => sample_tag_pending(18),
      Q => \reply_data_reg_n_0_[20]\
    );
\reply_data_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reply_pending,
      CLR => \^sample_resetn_0\,
      D => sample_tag_pending(19),
      Q => \reply_data_reg_n_0_[21]\
    );
\reply_data_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reply_pending,
      CLR => \^sample_resetn_0\,
      D => sample_tag_pending(20),
      Q => \reply_data_reg_n_0_[22]\
    );
\reply_data_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reply_pending,
      CLR => \^sample_resetn_0\,
      D => sample_tag_pending(21),
      Q => \reply_data_reg_n_0_[23]\
    );
\reply_data_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reply_pending,
      CLR => \^sample_resetn_0\,
      D => sample_tag_pending(22),
      Q => \reply_data_reg_n_0_[24]\
    );
\reply_data_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reply_pending,
      CLR => \^sample_resetn_0\,
      D => sample_tag_pending(23),
      Q => \reply_data_reg_n_0_[25]\
    );
\reply_data_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reply_pending,
      CLR => \^sample_resetn_0\,
      D => sample_tag_pending(24),
      Q => \reply_data_reg_n_0_[26]\
    );
\reply_data_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reply_pending,
      CLR => \^sample_resetn_0\,
      D => sample_tag_pending(25),
      Q => \reply_data_reg_n_0_[27]\
    );
\reply_data_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reply_pending,
      CLR => \^sample_resetn_0\,
      D => sample_tag_pending(26),
      Q => \reply_data_reg_n_0_[28]\
    );
\reply_data_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reply_pending,
      CLR => \^sample_resetn_0\,
      D => sample_tag_pending(27),
      Q => \reply_data_reg_n_0_[29]\
    );
\reply_data_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reply_pending,
      CLR => \^sample_resetn_0\,
      D => sample_tag_pending(0),
      Q => \reply_data_reg_n_0_[2]\
    );
\reply_data_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reply_pending,
      CLR => \^sample_resetn_0\,
      D => sample_tag_pending(28),
      Q => \reply_data_reg_n_0_[30]\
    );
\reply_data_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reply_pending,
      CLR => \^sample_resetn_0\,
      D => sample_tag_pending(29),
      Q => \reply_data_reg_n_0_[31]\
    );
\reply_data_reg[32]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reply_pending,
      CLR => \^sample_resetn_0\,
      D => sample_tag_pending(30),
      Q => \reply_data_reg_n_0_[32]\
    );
\reply_data_reg[33]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reply_pending,
      CLR => \^sample_resetn_0\,
      D => sample_tag_pending(31),
      Q => \reply_data_reg_n_0_[33]\
    );
\reply_data_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reply_pending,
      CLR => \^sample_resetn_0\,
      D => sample_tag_pending(1),
      Q => \reply_data_reg_n_0_[3]\
    );
\reply_data_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reply_pending,
      CLR => \^sample_resetn_0\,
      D => sample_tag_pending(2),
      Q => \reply_data_reg_n_0_[4]\
    );
\reply_data_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reply_pending,
      CLR => \^sample_resetn_0\,
      D => sample_tag_pending(3),
      Q => \reply_data_reg_n_0_[5]\
    );
\reply_data_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reply_pending,
      CLR => \^sample_resetn_0\,
      D => sample_tag_pending(4),
      Q => \reply_data_reg_n_0_[6]\
    );
\reply_data_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reply_pending,
      CLR => \^sample_resetn_0\,
      D => sample_tag_pending(5),
      Q => \reply_data_reg_n_0_[7]\
    );
\reply_data_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reply_pending,
      CLR => \^sample_resetn_0\,
      D => sample_tag_pending(6),
      Q => \reply_data_reg_n_0_[8]\
    );
\reply_data_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => reply_pending,
      CLR => \^sample_resetn_0\,
      D => sample_tag_pending(7),
      Q => \reply_data_reg_n_0_[9]\
    );
reply_pending_reg: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => '1',
      CLR => \^sample_resetn_0\,
      D => confirmation_mailbox_n_46,
      Q => reply_pending_reg_n_0
    );
sample_initialized_reg: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => '1',
      CLR => \^sample_resetn_0\,
      D => waveform_n_97,
      Q => sample_initialized
    );
sample_pending1_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => sample_pending1_carry_n_0,
      CO(2) => sample_pending1_carry_n_1,
      CO(1) => sample_pending1_carry_n_2,
      CO(0) => sample_pending1_carry_n_3,
      CYINIT => '1',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => NLW_sample_pending1_carry_O_UNCONNECTED(3 downto 0),
      S(3) => waveform_n_41,
      S(2) => waveform_n_42,
      S(1) => waveform_n_43,
      S(0) => waveform_n_44
    );
\sample_pending1_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => sample_pending1_carry_n_0,
      CO(3) => \sample_pending1_carry__0_n_0\,
      CO(2) => \sample_pending1_carry__0_n_1\,
      CO(1) => \sample_pending1_carry__0_n_2\,
      CO(0) => \sample_pending1_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_sample_pending1_carry__0_O_UNCONNECTED\(3 downto 0),
      S(3) => waveform_n_77,
      S(2) => waveform_n_78,
      S(1) => waveform_n_79,
      S(0) => waveform_n_80
    );
\sample_pending1_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \sample_pending1_carry__0_n_0\,
      CO(3) => \NLW_sample_pending1_carry__1_CO_UNCONNECTED\(3),
      CO(2) => sample_pending1,
      CO(1) => \sample_pending1_carry__1_n_2\,
      CO(0) => \sample_pending1_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_sample_pending1_carry__1_O_UNCONNECTED\(3 downto 0),
      S(3) => '0',
      S(2) => waveform_n_81,
      S(1) => waveform_n_82,
      S(0) => waveform_n_83
    );
sample_pending_reg: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => '1',
      CLR => \^sample_resetn_0\,
      D => configuration_mailbox_n_134,
      Q => sample_pending
    );
\sample_tag_pending_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => cfg_valid0,
      CLR => \^sample_resetn_0\,
      D => config_data(91),
      Q => sample_tag_pending(0)
    );
\sample_tag_pending_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => cfg_valid0,
      CLR => \^sample_resetn_0\,
      D => config_data(101),
      Q => sample_tag_pending(10)
    );
\sample_tag_pending_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => cfg_valid0,
      CLR => \^sample_resetn_0\,
      D => config_data(102),
      Q => sample_tag_pending(11)
    );
\sample_tag_pending_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => cfg_valid0,
      CLR => \^sample_resetn_0\,
      D => config_data(103),
      Q => sample_tag_pending(12)
    );
\sample_tag_pending_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => cfg_valid0,
      CLR => \^sample_resetn_0\,
      D => config_data(104),
      Q => sample_tag_pending(13)
    );
\sample_tag_pending_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => cfg_valid0,
      CLR => \^sample_resetn_0\,
      D => config_data(105),
      Q => sample_tag_pending(14)
    );
\sample_tag_pending_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => cfg_valid0,
      CLR => \^sample_resetn_0\,
      D => config_data(106),
      Q => sample_tag_pending(15)
    );
\sample_tag_pending_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => cfg_valid0,
      CLR => \^sample_resetn_0\,
      D => config_data(107),
      Q => sample_tag_pending(16)
    );
\sample_tag_pending_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => cfg_valid0,
      CLR => \^sample_resetn_0\,
      D => config_data(108),
      Q => sample_tag_pending(17)
    );
\sample_tag_pending_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => cfg_valid0,
      CLR => \^sample_resetn_0\,
      D => config_data(109),
      Q => sample_tag_pending(18)
    );
\sample_tag_pending_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => cfg_valid0,
      CLR => \^sample_resetn_0\,
      D => config_data(110),
      Q => sample_tag_pending(19)
    );
\sample_tag_pending_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => cfg_valid0,
      CLR => \^sample_resetn_0\,
      D => config_data(92),
      Q => sample_tag_pending(1)
    );
\sample_tag_pending_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => cfg_valid0,
      CLR => \^sample_resetn_0\,
      D => config_data(111),
      Q => sample_tag_pending(20)
    );
\sample_tag_pending_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => cfg_valid0,
      CLR => \^sample_resetn_0\,
      D => config_data(112),
      Q => sample_tag_pending(21)
    );
\sample_tag_pending_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => cfg_valid0,
      CLR => \^sample_resetn_0\,
      D => config_data(113),
      Q => sample_tag_pending(22)
    );
\sample_tag_pending_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => cfg_valid0,
      CLR => \^sample_resetn_0\,
      D => config_data(114),
      Q => sample_tag_pending(23)
    );
\sample_tag_pending_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => cfg_valid0,
      CLR => \^sample_resetn_0\,
      D => config_data(115),
      Q => sample_tag_pending(24)
    );
\sample_tag_pending_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => cfg_valid0,
      CLR => \^sample_resetn_0\,
      D => config_data(116),
      Q => sample_tag_pending(25)
    );
\sample_tag_pending_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => cfg_valid0,
      CLR => \^sample_resetn_0\,
      D => config_data(117),
      Q => sample_tag_pending(26)
    );
\sample_tag_pending_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => cfg_valid0,
      CLR => \^sample_resetn_0\,
      D => config_data(118),
      Q => sample_tag_pending(27)
    );
\sample_tag_pending_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => cfg_valid0,
      CLR => \^sample_resetn_0\,
      D => config_data(119),
      Q => sample_tag_pending(28)
    );
\sample_tag_pending_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => cfg_valid0,
      CLR => \^sample_resetn_0\,
      D => config_data(120),
      Q => sample_tag_pending(29)
    );
\sample_tag_pending_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => cfg_valid0,
      CLR => \^sample_resetn_0\,
      D => config_data(93),
      Q => sample_tag_pending(2)
    );
\sample_tag_pending_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => cfg_valid0,
      CLR => \^sample_resetn_0\,
      D => config_data(121),
      Q => sample_tag_pending(30)
    );
\sample_tag_pending_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => cfg_valid0,
      CLR => \^sample_resetn_0\,
      D => config_data(122),
      Q => sample_tag_pending(31)
    );
\sample_tag_pending_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => cfg_valid0,
      CLR => \^sample_resetn_0\,
      D => config_data(94),
      Q => sample_tag_pending(3)
    );
\sample_tag_pending_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => cfg_valid0,
      CLR => \^sample_resetn_0\,
      D => config_data(95),
      Q => sample_tag_pending(4)
    );
\sample_tag_pending_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => cfg_valid0,
      CLR => \^sample_resetn_0\,
      D => config_data(96),
      Q => sample_tag_pending(5)
    );
\sample_tag_pending_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => cfg_valid0,
      CLR => \^sample_resetn_0\,
      D => config_data(97),
      Q => sample_tag_pending(6)
    );
\sample_tag_pending_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => cfg_valid0,
      CLR => \^sample_resetn_0\,
      D => config_data(98),
      Q => sample_tag_pending(7)
    );
\sample_tag_pending_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => cfg_valid0,
      CLR => \^sample_resetn_0\,
      D => config_data(99),
      Q => sample_tag_pending(8)
    );
\sample_tag_pending_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => cfg_valid0,
      CLR => \^sample_resetn_0\,
      D => config_data(100),
      Q => sample_tag_pending(9)
    );
staged_enable_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => command_word(24),
      I1 => command_word(28),
      O => staged_enable_i_1_n_0
    );
staged_enable_reg: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_gain[11]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => staged_enable_i_1_n_0,
      Q => staged_enable
    );
\staged_ftw[10]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => command_word(10),
      I1 => command_word(29),
      O => p_1_in(10)
    );
\staged_ftw[11]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => command_word(11),
      I1 => command_word(29),
      O => p_1_in(11)
    );
\staged_ftw[12]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => command_word(12),
      I1 => command_word(29),
      O => p_1_in(12)
    );
\staged_ftw[13]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => command_word(13),
      I1 => command_word(29),
      O => p_1_in(13)
    );
\staged_ftw[14]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => command_word(14),
      I1 => command_word(29),
      O => p_1_in(14)
    );
\staged_ftw[15]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => command_word(15),
      I1 => command_word(29),
      O => p_1_in(15)
    );
\staged_ftw[16]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => command_word(16),
      I1 => command_word(29),
      O => p_1_in(16)
    );
\staged_ftw[17]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => command_word(17),
      I1 => command_word(29),
      O => p_1_in(17)
    );
\staged_ftw[18]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => command_word(18),
      I1 => command_word(29),
      O => p_1_in(18)
    );
\staged_ftw[19]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => command_word(19),
      I1 => command_word(29),
      O => p_1_in(19)
    );
\staged_ftw[20]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => command_word(20),
      I1 => command_word(29),
      O => p_1_in(20)
    );
\staged_ftw[21]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => command_word(21),
      I1 => command_word(29),
      O => p_1_in(21)
    );
\staged_ftw[22]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => command_word(22),
      I1 => command_word(29),
      O => p_1_in(22)
    );
\staged_ftw[23]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => command_word(23),
      I1 => command_word(29),
      O => p_1_in(23)
    );
\staged_ftw[24]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => command_word(24),
      I1 => command_word(29),
      O => p_1_in(24)
    );
\staged_ftw[25]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => command_word(25),
      I1 => command_word(29),
      O => p_1_in(25)
    );
\staged_ftw[26]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0800000000008800"
    )
        port map (
      I0 => command_word(27),
      I1 => interface_initialized,
      I2 => command_word(30),
      I3 => acknowledged_i_5_n_0,
      I4 => command_word(29),
      I5 => command_word(28),
      O => \staged_ftw[26]_i_1_n_0\
    );
\staged_ftw[26]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => command_word(26),
      I1 => command_word(29),
      O => p_1_in(26)
    );
\staged_ftw[27]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => command_word(0),
      I1 => command_word(29),
      O => p_1_in(27)
    );
\staged_ftw[28]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => command_word(1),
      I1 => command_word(29),
      O => p_1_in(28)
    );
\staged_ftw[29]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => command_word(2),
      I1 => command_word(29),
      O => p_1_in(29)
    );
\staged_ftw[30]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => command_word(3),
      I1 => command_word(29),
      O => p_1_in(30)
    );
\staged_ftw[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000040C0000040"
    )
        port map (
      I0 => \staged_ftw[31]_i_3_n_0\,
      I1 => command_word(28),
      I2 => \staged_ftw[31]_i_4_n_0\,
      I3 => command_word(29),
      I4 => command_word(27),
      I5 => command_word(30),
      O => \staged_ftw[31]_i_1_n_0\
    );
\staged_ftw[31]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => command_word(4),
      I1 => command_word(29),
      O => p_1_in(31)
    );
\staged_ftw[31]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFEF"
    )
        port map (
      I0 => \staged_ftw[31]_i_5_n_0\,
      I1 => \staged_ftw[31]_i_6_n_0\,
      I2 => \staged_ftw[31]_i_7_n_0\,
      I3 => command_word(20),
      I4 => command_word(19),
      I5 => \staged_ftw[31]_i_8_n_0\,
      O => \staged_ftw[31]_i_3_n_0\
    );
\staged_ftw[31]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"01100000"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[1]\,
      I1 => \FSM_onehot_state_reg_n_0_[2]\,
      I2 => command_word(31),
      I3 => \^status_word\(26),
      I4 => interface_initialized,
      O => \staged_ftw[31]_i_4_n_0\
    );
\staged_ftw[31]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => command_word(8),
      I1 => command_word(7),
      I2 => command_word(10),
      I3 => command_word(9),
      I4 => command_word(5),
      I5 => command_word(6),
      O => \staged_ftw[31]_i_5_n_0\
    );
\staged_ftw[31]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => command_word(16),
      I1 => command_word(15),
      I2 => command_word(18),
      I3 => command_word(17),
      I4 => \staged_ftw[31]_i_9_n_0\,
      O => \staged_ftw[31]_i_6_n_0\
    );
\staged_ftw[31]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => command_word(25),
      I1 => command_word(26),
      I2 => command_word(23),
      I3 => command_word(24),
      O => \staged_ftw[31]_i_7_n_0\
    );
\staged_ftw[31]_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => command_word(22),
      I1 => command_word(21),
      O => \staged_ftw[31]_i_8_n_0\
    );
\staged_ftw[31]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => command_word(13),
      I1 => command_word(14),
      I2 => command_word(11),
      I3 => command_word(12),
      O => \staged_ftw[31]_i_9_n_0\
    );
\staged_ftw[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => command_word(5),
      I1 => command_word(29),
      O => p_1_in(5)
    );
\staged_ftw[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => command_word(6),
      I1 => command_word(29),
      O => p_1_in(6)
    );
\staged_ftw[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => command_word(7),
      I1 => command_word(29),
      O => p_1_in(7)
    );
\staged_ftw[8]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => command_word(8),
      I1 => command_word(29),
      O => p_1_in(8)
    );
\staged_ftw[9]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => command_word(9),
      I1 => command_word(29),
      O => p_1_in(9)
    );
\staged_ftw_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_ftw[26]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p_1_in(27),
      Q => \staged_ftw_reg_n_0_[0]\
    );
\staged_ftw_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_ftw[26]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p_1_in(10),
      Q => \staged_ftw_reg_n_0_[10]\
    );
\staged_ftw_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_ftw[26]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p_1_in(11),
      Q => \staged_ftw_reg_n_0_[11]\
    );
\staged_ftw_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_ftw[26]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p_1_in(12),
      Q => \staged_ftw_reg_n_0_[12]\
    );
\staged_ftw_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_ftw[26]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p_1_in(13),
      Q => \staged_ftw_reg_n_0_[13]\
    );
\staged_ftw_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_ftw[26]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p_1_in(14),
      Q => \staged_ftw_reg_n_0_[14]\
    );
\staged_ftw_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_ftw[26]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p_1_in(15),
      Q => \staged_ftw_reg_n_0_[15]\
    );
\staged_ftw_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_ftw[26]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p_1_in(16),
      Q => \staged_ftw_reg_n_0_[16]\
    );
\staged_ftw_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_ftw[26]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p_1_in(17),
      Q => \staged_ftw_reg_n_0_[17]\
    );
\staged_ftw_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_ftw[26]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p_1_in(18),
      Q => \staged_ftw_reg_n_0_[18]\
    );
\staged_ftw_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_ftw[26]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p_1_in(19),
      Q => \staged_ftw_reg_n_0_[19]\
    );
\staged_ftw_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_ftw[26]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p_1_in(28),
      Q => \staged_ftw_reg_n_0_[1]\
    );
\staged_ftw_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_ftw[26]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p_1_in(20),
      Q => \staged_ftw_reg_n_0_[20]\
    );
\staged_ftw_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_ftw[26]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p_1_in(21),
      Q => \staged_ftw_reg_n_0_[21]\
    );
\staged_ftw_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_ftw[26]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p_1_in(22),
      Q => \staged_ftw_reg_n_0_[22]\
    );
\staged_ftw_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_ftw[26]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p_1_in(23),
      Q => \staged_ftw_reg_n_0_[23]\
    );
\staged_ftw_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_ftw[26]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p_1_in(24),
      Q => \staged_ftw_reg_n_0_[24]\
    );
\staged_ftw_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_ftw[26]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p_1_in(25),
      Q => \staged_ftw_reg_n_0_[25]\
    );
\staged_ftw_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_ftw[26]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p_1_in(26),
      Q => \staged_ftw_reg_n_0_[26]\
    );
\staged_ftw_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_ftw[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p_1_in(27),
      Q => \staged_ftw_reg_n_0_[27]\
    );
\staged_ftw_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_ftw[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p_1_in(28),
      Q => \staged_ftw_reg_n_0_[28]\
    );
\staged_ftw_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_ftw[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p_1_in(29),
      Q => \staged_ftw_reg_n_0_[29]\
    );
\staged_ftw_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_ftw[26]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p_1_in(29),
      Q => \staged_ftw_reg_n_0_[2]\
    );
\staged_ftw_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_ftw[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p_1_in(30),
      Q => \staged_ftw_reg_n_0_[30]\
    );
\staged_ftw_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_ftw[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p_1_in(31),
      Q => p_0_in1_in
    );
\staged_ftw_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_ftw[26]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p_1_in(30),
      Q => \staged_ftw_reg_n_0_[3]\
    );
\staged_ftw_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_ftw[26]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p_1_in(31),
      Q => \staged_ftw_reg_n_0_[4]\
    );
\staged_ftw_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_ftw[26]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p_1_in(5),
      Q => \staged_ftw_reg_n_0_[5]\
    );
\staged_ftw_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_ftw[26]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p_1_in(6),
      Q => \staged_ftw_reg_n_0_[6]\
    );
\staged_ftw_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_ftw[26]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p_1_in(7),
      Q => \staged_ftw_reg_n_0_[7]\
    );
\staged_ftw_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_ftw[26]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p_1_in(8),
      Q => \staged_ftw_reg_n_0_[8]\
    );
\staged_ftw_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_ftw[26]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p_1_in(9),
      Q => \staged_ftw_reg_n_0_[9]\
    );
\staged_gain[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => command_word(0),
      I1 => command_word(28),
      O => \staged_gain[0]_i_1_n_0\
    );
\staged_gain[10]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => command_word(10),
      I1 => command_word(28),
      O => \staged_gain[10]_i_1_n_0\
    );
\staged_gain[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0080808000000000"
    )
        port map (
      I0 => command_word(29),
      I1 => command_word(27),
      I2 => interface_initialized,
      I3 => command_word(30),
      I4 => command_word(28),
      I5 => acknowledged_i_5_n_0,
      O => \staged_gain[11]_i_1_n_0\
    );
\staged_gain[11]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => command_word(11),
      I1 => command_word(28),
      O => \staged_gain[11]_i_2_n_0\
    );
\staged_gain[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => command_word(1),
      I1 => command_word(28),
      O => \staged_gain[1]_i_1_n_0\
    );
\staged_gain[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => command_word(2),
      I1 => command_word(28),
      O => \staged_gain[2]_i_1_n_0\
    );
\staged_gain[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => command_word(3),
      I1 => command_word(28),
      O => \staged_gain[3]_i_1_n_0\
    );
\staged_gain[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => command_word(4),
      I1 => command_word(28),
      O => \staged_gain[4]_i_1_n_0\
    );
\staged_gain[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => command_word(5),
      I1 => command_word(28),
      O => \staged_gain[5]_i_1_n_0\
    );
\staged_gain[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => command_word(6),
      I1 => command_word(28),
      O => \staged_gain[6]_i_1_n_0\
    );
\staged_gain[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => command_word(7),
      I1 => command_word(28),
      O => \staged_gain[7]_i_1_n_0\
    );
\staged_gain[8]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => command_word(8),
      I1 => command_word(28),
      O => \staged_gain[8]_i_1_n_0\
    );
\staged_gain[9]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => command_word(9),
      I1 => command_word(28),
      O => \staged_gain[9]_i_1_n_0\
    );
\staged_gain_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_gain[11]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => \staged_gain[0]_i_1_n_0\,
      Q => \staged_gain_reg_n_0_[0]\
    );
\staged_gain_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_gain[11]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => \staged_gain[10]_i_1_n_0\,
      Q => \staged_gain_reg_n_0_[10]\
    );
\staged_gain_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_gain[11]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => \staged_gain[11]_i_2_n_0\,
      Q => \staged_gain_reg_n_0_[11]\
    );
\staged_gain_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_gain[11]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => \staged_gain[1]_i_1_n_0\,
      Q => \staged_gain_reg_n_0_[1]\
    );
\staged_gain_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_gain[11]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => \staged_gain[2]_i_1_n_0\,
      Q => \staged_gain_reg_n_0_[2]\
    );
\staged_gain_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_gain[11]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => \staged_gain[3]_i_1_n_0\,
      Q => \staged_gain_reg_n_0_[3]\
    );
\staged_gain_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_gain[11]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => \staged_gain[4]_i_1_n_0\,
      Q => \staged_gain_reg_n_0_[4]\
    );
\staged_gain_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_gain[11]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => \staged_gain[5]_i_1_n_0\,
      Q => \staged_gain_reg_n_0_[5]\
    );
\staged_gain_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_gain[11]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => \staged_gain[6]_i_1_n_0\,
      Q => \staged_gain_reg_n_0_[6]\
    );
\staged_gain_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_gain[11]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => \staged_gain[7]_i_1_n_0\,
      Q => \staged_gain_reg_n_0_[7]\
    );
\staged_gain_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_gain[11]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => \staged_gain[8]_i_1_n_0\,
      Q => \staged_gain_reg_n_0_[8]\
    );
\staged_gain_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_gain[11]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => \staged_gain[9]_i_1_n_0\,
      Q => \staged_gain_reg_n_0_[9]\
    );
staged_invert_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => command_word(25),
      I1 => command_word(28),
      O => staged_invert_i_1_n_0
    );
staged_invert_reg: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_gain[11]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => staged_invert_i_1_n_0,
      Q => staged_invert
    );
\staged_offset[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => command_word(12),
      I1 => command_word(28),
      O => \staged_offset[0]_i_1_n_0\
    );
\staged_offset[10]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => command_word(22),
      I1 => command_word(28),
      O => \staged_offset[10]_i_1_n_0\
    );
\staged_offset[11]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => command_word(28),
      I1 => command_word(23),
      O => \staged_offset[11]_i_1_n_0\
    );
\staged_offset[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => command_word(13),
      I1 => command_word(28),
      O => \staged_offset[1]_i_1_n_0\
    );
\staged_offset[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => command_word(14),
      I1 => command_word(28),
      O => \staged_offset[2]_i_1_n_0\
    );
\staged_offset[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => command_word(15),
      I1 => command_word(28),
      O => \staged_offset[3]_i_1_n_0\
    );
\staged_offset[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => command_word(16),
      I1 => command_word(28),
      O => \staged_offset[4]_i_1_n_0\
    );
\staged_offset[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => command_word(17),
      I1 => command_word(28),
      O => \staged_offset[5]_i_1_n_0\
    );
\staged_offset[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => command_word(18),
      I1 => command_word(28),
      O => \staged_offset[6]_i_1_n_0\
    );
\staged_offset[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => command_word(19),
      I1 => command_word(28),
      O => \staged_offset[7]_i_1_n_0\
    );
\staged_offset[8]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => command_word(20),
      I1 => command_word(28),
      O => \staged_offset[8]_i_1_n_0\
    );
\staged_offset[9]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => command_word(21),
      I1 => command_word(28),
      O => \staged_offset[9]_i_1_n_0\
    );
\staged_offset_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_gain[11]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => \staged_offset[0]_i_1_n_0\,
      Q => \staged_offset__0\(0)
    );
\staged_offset_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_gain[11]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => \staged_offset[10]_i_1_n_0\,
      Q => \staged_offset__0\(10)
    );
\staged_offset_reg[11]\: unisim.vcomponents.FDPE
     port map (
      C => control_clk,
      CE => \staged_gain[11]_i_1_n_0\,
      D => \staged_offset[11]_i_1_n_0\,
      PRE => \^sample_resetn_0\,
      Q => \staged_offset__0\(11)
    );
\staged_offset_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_gain[11]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => \staged_offset[1]_i_1_n_0\,
      Q => \staged_offset__0\(1)
    );
\staged_offset_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_gain[11]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => \staged_offset[2]_i_1_n_0\,
      Q => \staged_offset__0\(2)
    );
\staged_offset_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_gain[11]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => \staged_offset[3]_i_1_n_0\,
      Q => \staged_offset__0\(3)
    );
\staged_offset_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_gain[11]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => \staged_offset[4]_i_1_n_0\,
      Q => \staged_offset__0\(4)
    );
\staged_offset_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_gain[11]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => \staged_offset[5]_i_1_n_0\,
      Q => \staged_offset__0\(5)
    );
\staged_offset_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_gain[11]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => \staged_offset[6]_i_1_n_0\,
      Q => \staged_offset__0\(6)
    );
\staged_offset_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_gain[11]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => \staged_offset[7]_i_1_n_0\,
      Q => \staged_offset__0\(7)
    );
\staged_offset_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_gain[11]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => \staged_offset[8]_i_1_n_0\,
      Q => \staged_offset__0\(8)
    );
\staged_offset_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_gain[11]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => \staged_offset[9]_i_1_n_0\,
      Q => \staged_offset__0\(9)
    );
\staged_phase[26]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2A00000000000000"
    )
        port map (
      I0 => acknowledged_i_5_n_0,
      I1 => command_word(29),
      I2 => command_word(30),
      I3 => command_word(28),
      I4 => interface_initialized,
      I5 => command_word(27),
      O => \staged_phase[26]_i_1_n_0\
    );
\staged_phase[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000200A0000200"
    )
        port map (
      I0 => \staged_ftw[31]_i_4_n_0\,
      I1 => \staged_ftw[31]_i_3_n_0\,
      I2 => command_word(28),
      I3 => command_word(29),
      I4 => command_word(27),
      I5 => command_word(30),
      O => \staged_phase[31]_i_1_n_0\
    );
\staged_phase_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_phase[26]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p_1_in(27),
      Q => staged_phase(0)
    );
\staged_phase_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_phase[26]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p_1_in(10),
      Q => staged_phase(10)
    );
\staged_phase_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_phase[26]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p_1_in(11),
      Q => staged_phase(11)
    );
\staged_phase_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_phase[26]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p_1_in(12),
      Q => staged_phase(12)
    );
\staged_phase_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_phase[26]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p_1_in(13),
      Q => staged_phase(13)
    );
\staged_phase_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_phase[26]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p_1_in(14),
      Q => staged_phase(14)
    );
\staged_phase_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_phase[26]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p_1_in(15),
      Q => staged_phase(15)
    );
\staged_phase_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_phase[26]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p_1_in(16),
      Q => staged_phase(16)
    );
\staged_phase_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_phase[26]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p_1_in(17),
      Q => staged_phase(17)
    );
\staged_phase_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_phase[26]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p_1_in(18),
      Q => staged_phase(18)
    );
\staged_phase_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_phase[26]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p_1_in(19),
      Q => staged_phase(19)
    );
\staged_phase_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_phase[26]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p_1_in(28),
      Q => staged_phase(1)
    );
\staged_phase_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_phase[26]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p_1_in(20),
      Q => staged_phase(20)
    );
\staged_phase_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_phase[26]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p_1_in(21),
      Q => staged_phase(21)
    );
\staged_phase_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_phase[26]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p_1_in(22),
      Q => staged_phase(22)
    );
\staged_phase_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_phase[26]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p_1_in(23),
      Q => staged_phase(23)
    );
\staged_phase_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_phase[26]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p_1_in(24),
      Q => staged_phase(24)
    );
\staged_phase_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_phase[26]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p_1_in(25),
      Q => staged_phase(25)
    );
\staged_phase_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_phase[26]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p_1_in(26),
      Q => staged_phase(26)
    );
\staged_phase_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_phase[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => \staged_gain[0]_i_1_n_0\,
      Q => staged_phase(27)
    );
\staged_phase_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_phase[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => \staged_gain[1]_i_1_n_0\,
      Q => staged_phase(28)
    );
\staged_phase_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_phase[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => \staged_gain[2]_i_1_n_0\,
      Q => staged_phase(29)
    );
\staged_phase_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_phase[26]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p_1_in(29),
      Q => staged_phase(2)
    );
\staged_phase_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_phase[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => \staged_gain[3]_i_1_n_0\,
      Q => staged_phase(30)
    );
\staged_phase_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_phase[31]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => \staged_gain[4]_i_1_n_0\,
      Q => staged_phase(31)
    );
\staged_phase_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_phase[26]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p_1_in(30),
      Q => staged_phase(3)
    );
\staged_phase_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_phase[26]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p_1_in(31),
      Q => staged_phase(4)
    );
\staged_phase_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_phase[26]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p_1_in(5),
      Q => staged_phase(5)
    );
\staged_phase_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_phase[26]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p_1_in(6),
      Q => staged_phase(6)
    );
\staged_phase_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_phase[26]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p_1_in(7),
      Q => staged_phase(7)
    );
\staged_phase_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_phase[26]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p_1_in(8),
      Q => staged_phase(8)
    );
\staged_phase_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => \staged_phase[26]_i_1_n_0\,
      CLR => \^sample_resetn_0\,
      D => p_1_in(9),
      Q => staged_phase(9)
    );
staged_restart_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => command_word(26),
      I1 => command_word(28),
      O => staged_restart_i_1_n_0
    );
staged_restart_reg: unisim.vcomponents.FDPE
     port map (
      C => control_clk,
      CE => \staged_gain[11]_i_1_n_0\,
      D => staged_restart_i_1_n_0,
      PRE => \^sample_resetn_0\,
      Q => \staged_restart__0\
    );
\status_word[0]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \status_word[0]_INST_0_i_1_n_0\,
      I1 => \query__0\(3),
      I2 => \status_word[0]_INST_0_i_2_n_0\,
      I3 => \query__0\(2),
      I4 => \status_word[0]_INST_0_i_3_n_0\,
      O => \^status_word\(0)
    );
\status_word[0]_INST_0_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00004540"
    )
        port map (
      I0 => \query__0\(1),
      I1 => \^status_word\(21),
      I2 => \query__0\(0),
      I3 => data7(0),
      I4 => \query__0\(2),
      O => \status_word[0]_INST_0_i_1_n_0\
    );
\status_word[0]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data6(0),
      I1 => data5(0),
      I2 => \query__0\(1),
      I3 => data4(0),
      I4 => \query__0\(0),
      I5 => data3(0),
      O => \status_word[0]_INST_0_i_2_n_0\
    );
\status_word[0]_INST_0_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AFA0CFCF"
    )
        port map (
      I0 => \applied_config_reg_n_0_[0]\,
      I1 => data1(0),
      I2 => \query__0\(1),
      I3 => \applied_tag_reg_n_0_[0]\,
      I4 => \query__0\(0),
      O => \status_word[0]_INST_0_i_3_n_0\
    );
\status_word[10]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0100FFFF01000000"
    )
        port map (
      I0 => \query__0\(2),
      I1 => \query__0\(0),
      I2 => \query__0\(1),
      I3 => data7(10),
      I4 => \query__0\(3),
      I5 => \status_word[10]_INST_0_i_1_n_0\,
      O => \^status_word\(10)
    );
\status_word[10]_INST_0_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \status_word[10]_INST_0_i_2_n_0\,
      I1 => \status_word[10]_INST_0_i_3_n_0\,
      O => \status_word[10]_INST_0_i_1_n_0\,
      S => \query__0\(2)
    );
\status_word[10]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AFA0C0C0"
    )
        port map (
      I0 => \applied_config_reg_n_0_[10]\,
      I1 => data1(10),
      I2 => \query__0\(1),
      I3 => \applied_tag_reg_n_0_[10]\,
      I4 => \query__0\(0),
      O => \status_word[10]_INST_0_i_2_n_0\
    );
\status_word[10]_INST_0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data6(10),
      I1 => data5(10),
      I2 => \query__0\(1),
      I3 => data4(10),
      I4 => \query__0\(0),
      I5 => data3(10),
      O => \status_word[10]_INST_0_i_3_n_0\
    );
\status_word[11]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0100FFFF01000000"
    )
        port map (
      I0 => \query__0\(2),
      I1 => \query__0\(0),
      I2 => \query__0\(1),
      I3 => data7(11),
      I4 => \query__0\(3),
      I5 => \status_word[11]_INST_0_i_1_n_0\,
      O => \^status_word\(11)
    );
\status_word[11]_INST_0_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \status_word[11]_INST_0_i_2_n_0\,
      I1 => \status_word[11]_INST_0_i_3_n_0\,
      O => \status_word[11]_INST_0_i_1_n_0\,
      S => \query__0\(2)
    );
\status_word[11]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AFA0CFCF"
    )
        port map (
      I0 => \applied_config_reg_n_0_[11]\,
      I1 => data1(11),
      I2 => \query__0\(1),
      I3 => \applied_tag_reg_n_0_[11]\,
      I4 => \query__0\(0),
      O => \status_word[11]_INST_0_i_2_n_0\
    );
\status_word[11]_INST_0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data6(11),
      I1 => data5(11),
      I2 => \query__0\(1),
      I3 => data4(11),
      I4 => \query__0\(0),
      I5 => data3(11),
      O => \status_word[11]_INST_0_i_3_n_0\
    );
\status_word[12]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => \status_word[12]_INST_0_i_1_n_0\,
      I1 => \query__0\(2),
      I2 => \status_word[12]_INST_0_i_2_n_0\,
      I3 => \query__0\(3),
      O => \^status_word\(12)
    );
\status_word[12]_INST_0_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AFA0CFCF"
    )
        port map (
      I0 => \applied_config_reg_n_0_[12]\,
      I1 => data1(12),
      I2 => \query__0\(1),
      I3 => \applied_tag_reg_n_0_[12]\,
      I4 => \query__0\(0),
      O => \status_word[12]_INST_0_i_1_n_0\
    );
\status_word[12]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => data5(12),
      I1 => \query__0\(1),
      I2 => data4(12),
      I3 => \query__0\(0),
      I4 => data3(12),
      O => \status_word[12]_INST_0_i_2_n_0\
    );
\status_word[13]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => \status_word[13]_INST_0_i_1_n_0\,
      I1 => \query__0\(2),
      I2 => \status_word[13]_INST_0_i_2_n_0\,
      I3 => \query__0\(3),
      O => \^status_word\(13)
    );
\status_word[13]_INST_0_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AFA0C0C0"
    )
        port map (
      I0 => \applied_config_reg_n_0_[13]\,
      I1 => data1(13),
      I2 => \query__0\(1),
      I3 => \applied_tag_reg_n_0_[13]\,
      I4 => \query__0\(0),
      O => \status_word[13]_INST_0_i_1_n_0\
    );
\status_word[13]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => data5(13),
      I1 => \query__0\(1),
      I2 => data4(13),
      I3 => \query__0\(0),
      I4 => data3(13),
      O => \status_word[13]_INST_0_i_2_n_0\
    );
\status_word[14]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => \status_word[14]_INST_0_i_1_n_0\,
      I1 => \query__0\(2),
      I2 => \status_word[14]_INST_0_i_2_n_0\,
      I3 => \query__0\(3),
      O => \^status_word\(14)
    );
\status_word[14]_INST_0_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AFA0CFCF"
    )
        port map (
      I0 => \applied_config_reg_n_0_[14]\,
      I1 => data1(14),
      I2 => \query__0\(1),
      I3 => \applied_tag_reg_n_0_[14]\,
      I4 => \query__0\(0),
      O => \status_word[14]_INST_0_i_1_n_0\
    );
\status_word[14]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => data5(14),
      I1 => \query__0\(1),
      I2 => data4(14),
      I3 => \query__0\(0),
      I4 => data3(14),
      O => \status_word[14]_INST_0_i_2_n_0\
    );
\status_word[15]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => \status_word[15]_INST_0_i_1_n_0\,
      I1 => \query__0\(2),
      I2 => \status_word[15]_INST_0_i_2_n_0\,
      I3 => \query__0\(3),
      O => \^status_word\(15)
    );
\status_word[15]_INST_0_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AFA0CFCF"
    )
        port map (
      I0 => \applied_config_reg_n_0_[15]\,
      I1 => data1(15),
      I2 => \query__0\(1),
      I3 => \applied_tag_reg_n_0_[15]\,
      I4 => \query__0\(0),
      O => \status_word[15]_INST_0_i_1_n_0\
    );
\status_word[15]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => data5(15),
      I1 => \query__0\(1),
      I2 => data4(15),
      I3 => \query__0\(0),
      I4 => data3(15),
      O => \status_word[15]_INST_0_i_2_n_0\
    );
\status_word[1]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \status_word[1]_INST_0_i_1_n_0\,
      I1 => \query__0\(3),
      I2 => \status_word[1]_INST_0_i_2_n_0\,
      I3 => \query__0\(2),
      I4 => \status_word[1]_INST_0_i_3_n_0\,
      O => \^status_word\(1)
    );
\status_word[1]_INST_0_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00004540"
    )
        port map (
      I0 => \query__0\(1),
      I1 => data8(1),
      I2 => \query__0\(0),
      I3 => data7(1),
      I4 => \query__0\(2),
      O => \status_word[1]_INST_0_i_1_n_0\
    );
\status_word[1]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data6(1),
      I1 => data5(1),
      I2 => \query__0\(1),
      I3 => data4(1),
      I4 => \query__0\(0),
      I5 => data3(1),
      O => \status_word[1]_INST_0_i_2_n_0\
    );
\status_word[1]_INST_0_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AFC0A0C0"
    )
        port map (
      I0 => \applied_config_reg_n_0_[1]\,
      I1 => data1(1),
      I2 => \query__0\(1),
      I3 => \query__0\(0),
      I4 => \applied_tag_reg_n_0_[1]\,
      O => \status_word[1]_INST_0_i_3_n_0\
    );
\status_word[27]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \^status_word\(19),
      I1 => \^status_word\(18),
      I2 => \^status_word\(17),
      O => \^status_word\(22)
    );
\status_word[2]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \status_word[2]_INST_0_i_1_n_0\,
      I1 => \query__0\(3),
      I2 => \status_word[2]_INST_0_i_2_n_0\,
      I3 => \query__0\(2),
      I4 => \status_word[2]_INST_0_i_3_n_0\,
      O => \^status_word\(2)
    );
\status_word[2]_INST_0_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00004540"
    )
        port map (
      I0 => \query__0\(1),
      I1 => data8(2),
      I2 => \query__0\(0),
      I3 => data7(2),
      I4 => \query__0\(2),
      O => \status_word[2]_INST_0_i_1_n_0\
    );
\status_word[2]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data6(2),
      I1 => data5(2),
      I2 => \query__0\(1),
      I3 => data4(2),
      I4 => \query__0\(0),
      I5 => data3(2),
      O => \status_word[2]_INST_0_i_2_n_0\
    );
\status_word[2]_INST_0_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AFA0CFCF"
    )
        port map (
      I0 => \applied_config_reg_n_0_[2]\,
      I1 => data1(2),
      I2 => \query__0\(1),
      I3 => \applied_tag_reg_n_0_[2]\,
      I4 => \query__0\(0),
      O => \status_word[2]_INST_0_i_3_n_0\
    );
\status_word[30]_INST_0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[0]\,
      O => \^status_word\(25)
    );
\status_word[3]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0100FFFF01000000"
    )
        port map (
      I0 => \query__0\(2),
      I1 => \query__0\(0),
      I2 => \query__0\(1),
      I3 => data7(3),
      I4 => \query__0\(3),
      I5 => \status_word[3]_INST_0_i_1_n_0\,
      O => \^status_word\(3)
    );
\status_word[3]_INST_0_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \status_word[3]_INST_0_i_2_n_0\,
      I1 => \status_word[3]_INST_0_i_3_n_0\,
      O => \status_word[3]_INST_0_i_1_n_0\,
      S => \query__0\(2)
    );
\status_word[3]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AFC0A0C0"
    )
        port map (
      I0 => \applied_config_reg_n_0_[3]\,
      I1 => data1(3),
      I2 => \query__0\(1),
      I3 => \query__0\(0),
      I4 => \applied_tag_reg_n_0_[3]\,
      O => \status_word[3]_INST_0_i_2_n_0\
    );
\status_word[3]_INST_0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data6(3),
      I1 => data5(3),
      I2 => \query__0\(1),
      I3 => data4(3),
      I4 => \query__0\(0),
      I5 => data3(3),
      O => \status_word[3]_INST_0_i_3_n_0\
    );
\status_word[4]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0100FFFF01000000"
    )
        port map (
      I0 => \query__0\(2),
      I1 => \query__0\(0),
      I2 => \query__0\(1),
      I3 => data7(4),
      I4 => \query__0\(3),
      I5 => \status_word[4]_INST_0_i_1_n_0\,
      O => \^status_word\(4)
    );
\status_word[4]_INST_0_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \status_word[4]_INST_0_i_2_n_0\,
      I1 => \status_word[4]_INST_0_i_3_n_0\,
      O => \status_word[4]_INST_0_i_1_n_0\,
      S => \query__0\(2)
    );
\status_word[4]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AFC0A0C0"
    )
        port map (
      I0 => \applied_config_reg_n_0_[4]\,
      I1 => data1(4),
      I2 => \query__0\(1),
      I3 => \query__0\(0),
      I4 => \applied_tag_reg_n_0_[4]\,
      O => \status_word[4]_INST_0_i_2_n_0\
    );
\status_word[4]_INST_0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data6(4),
      I1 => data5(4),
      I2 => \query__0\(1),
      I3 => data4(4),
      I4 => \query__0\(0),
      I5 => data3(4),
      O => \status_word[4]_INST_0_i_3_n_0\
    );
\status_word[5]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0100FFFF01000000"
    )
        port map (
      I0 => \query__0\(2),
      I1 => \query__0\(0),
      I2 => \query__0\(1),
      I3 => data7(5),
      I4 => \query__0\(3),
      I5 => \status_word[5]_INST_0_i_1_n_0\,
      O => \^status_word\(5)
    );
\status_word[5]_INST_0_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \status_word[5]_INST_0_i_2_n_0\,
      I1 => \status_word[5]_INST_0_i_3_n_0\,
      O => \status_word[5]_INST_0_i_1_n_0\,
      S => \query__0\(2)
    );
\status_word[5]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AFC0A0C0"
    )
        port map (
      I0 => \applied_config_reg_n_0_[5]\,
      I1 => data1(5),
      I2 => \query__0\(1),
      I3 => \query__0\(0),
      I4 => \applied_tag_reg_n_0_[5]\,
      O => \status_word[5]_INST_0_i_2_n_0\
    );
\status_word[5]_INST_0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data6(5),
      I1 => data5(5),
      I2 => \query__0\(1),
      I3 => data4(5),
      I4 => \query__0\(0),
      I5 => data3(5),
      O => \status_word[5]_INST_0_i_3_n_0\
    );
\status_word[6]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0100FFFF01000000"
    )
        port map (
      I0 => \query__0\(2),
      I1 => \query__0\(0),
      I2 => \query__0\(1),
      I3 => data7(6),
      I4 => \query__0\(3),
      I5 => \status_word[6]_INST_0_i_1_n_0\,
      O => \^status_word\(6)
    );
\status_word[6]_INST_0_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \status_word[6]_INST_0_i_2_n_0\,
      I1 => \status_word[6]_INST_0_i_3_n_0\,
      O => \status_word[6]_INST_0_i_1_n_0\,
      S => \query__0\(2)
    );
\status_word[6]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AFC0A0C0"
    )
        port map (
      I0 => \applied_config_reg_n_0_[6]\,
      I1 => data1(6),
      I2 => \query__0\(1),
      I3 => \query__0\(0),
      I4 => \applied_tag_reg_n_0_[6]\,
      O => \status_word[6]_INST_0_i_2_n_0\
    );
\status_word[6]_INST_0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data6(6),
      I1 => data5(6),
      I2 => \query__0\(1),
      I3 => data4(6),
      I4 => \query__0\(0),
      I5 => data3(6),
      O => \status_word[6]_INST_0_i_3_n_0\
    );
\status_word[7]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0100FFFF01000000"
    )
        port map (
      I0 => \query__0\(2),
      I1 => \query__0\(0),
      I2 => \query__0\(1),
      I3 => data7(7),
      I4 => \query__0\(3),
      I5 => \status_word[7]_INST_0_i_1_n_0\,
      O => \^status_word\(7)
    );
\status_word[7]_INST_0_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \status_word[7]_INST_0_i_2_n_0\,
      I1 => \status_word[7]_INST_0_i_3_n_0\,
      O => \status_word[7]_INST_0_i_1_n_0\,
      S => \query__0\(2)
    );
\status_word[7]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AFC0A0C0"
    )
        port map (
      I0 => \applied_config_reg_n_0_[7]\,
      I1 => data1(7),
      I2 => \query__0\(1),
      I3 => \query__0\(0),
      I4 => \applied_tag_reg_n_0_[7]\,
      O => \status_word[7]_INST_0_i_2_n_0\
    );
\status_word[7]_INST_0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data6(7),
      I1 => data5(7),
      I2 => \query__0\(1),
      I3 => data4(7),
      I4 => \query__0\(0),
      I5 => data3(7),
      O => \status_word[7]_INST_0_i_3_n_0\
    );
\status_word[8]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0100FFFF01000000"
    )
        port map (
      I0 => \query__0\(2),
      I1 => \query__0\(0),
      I2 => \query__0\(1),
      I3 => data7(8),
      I4 => \query__0\(3),
      I5 => \status_word[8]_INST_0_i_1_n_0\,
      O => \^status_word\(8)
    );
\status_word[8]_INST_0_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \status_word[8]_INST_0_i_2_n_0\,
      I1 => \status_word[8]_INST_0_i_3_n_0\,
      O => \status_word[8]_INST_0_i_1_n_0\,
      S => \query__0\(2)
    );
\status_word[8]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AFA0CFCF"
    )
        port map (
      I0 => \applied_config_reg_n_0_[8]\,
      I1 => data1(8),
      I2 => \query__0\(1),
      I3 => \applied_tag_reg_n_0_[8]\,
      I4 => \query__0\(0),
      O => \status_word[8]_INST_0_i_2_n_0\
    );
\status_word[8]_INST_0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data6(8),
      I1 => data5(8),
      I2 => \query__0\(1),
      I3 => data4(8),
      I4 => \query__0\(0),
      I5 => data3(8),
      O => \status_word[8]_INST_0_i_3_n_0\
    );
\status_word[9]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0100FFFF01000000"
    )
        port map (
      I0 => \query__0\(2),
      I1 => \query__0\(0),
      I2 => \query__0\(1),
      I3 => data7(9),
      I4 => \query__0\(3),
      I5 => \status_word[9]_INST_0_i_1_n_0\,
      O => \^status_word\(9)
    );
\status_word[9]_INST_0_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \status_word[9]_INST_0_i_2_n_0\,
      I1 => \status_word[9]_INST_0_i_3_n_0\,
      O => \status_word[9]_INST_0_i_1_n_0\,
      S => \query__0\(2)
    );
\status_word[9]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AFA0C0C0"
    )
        port map (
      I0 => \applied_config_reg_n_0_[9]\,
      I1 => data1(9),
      I2 => \query__0\(1),
      I3 => \applied_tag_reg_n_0_[9]\,
      I4 => \query__0\(0),
      O => \status_word[9]_INST_0_i_2_n_0\
    );
\status_word[9]_INST_0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data6(9),
      I1 => data5(9),
      I2 => \query__0\(1),
      I3 => data4(9),
      I4 => \query__0\(0),
      I5 => data3(9),
      O => \status_word[9]_INST_0_i_3_n_0\
    );
\tag_counter[0]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => tag_counter_reg(0),
      O => \tag_counter[0]_i_2_n_0\
    );
\tag_counter_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \tag_counter_reg[0]_i_1_n_7\,
      Q => tag_counter_reg(0)
    );
\tag_counter_reg[0]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \tag_counter_reg[0]_i_1_n_0\,
      CO(2) => \tag_counter_reg[0]_i_1_n_1\,
      CO(1) => \tag_counter_reg[0]_i_1_n_2\,
      CO(0) => \tag_counter_reg[0]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \tag_counter_reg[0]_i_1_n_4\,
      O(2) => \tag_counter_reg[0]_i_1_n_5\,
      O(1) => \tag_counter_reg[0]_i_1_n_6\,
      O(0) => \tag_counter_reg[0]_i_1_n_7\,
      S(3 downto 1) => tag_counter_reg(3 downto 1),
      S(0) => \tag_counter[0]_i_2_n_0\
    );
\tag_counter_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \tag_counter_reg[8]_i_1_n_5\,
      Q => tag_counter_reg(10)
    );
\tag_counter_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \tag_counter_reg[8]_i_1_n_4\,
      Q => tag_counter_reg(11)
    );
\tag_counter_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \tag_counter_reg[12]_i_1_n_7\,
      Q => tag_counter_reg(12)
    );
\tag_counter_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \tag_counter_reg[8]_i_1_n_0\,
      CO(3) => \tag_counter_reg[12]_i_1_n_0\,
      CO(2) => \tag_counter_reg[12]_i_1_n_1\,
      CO(1) => \tag_counter_reg[12]_i_1_n_2\,
      CO(0) => \tag_counter_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \tag_counter_reg[12]_i_1_n_4\,
      O(2) => \tag_counter_reg[12]_i_1_n_5\,
      O(1) => \tag_counter_reg[12]_i_1_n_6\,
      O(0) => \tag_counter_reg[12]_i_1_n_7\,
      S(3 downto 0) => tag_counter_reg(15 downto 12)
    );
\tag_counter_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \tag_counter_reg[12]_i_1_n_6\,
      Q => tag_counter_reg(13)
    );
\tag_counter_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \tag_counter_reg[12]_i_1_n_5\,
      Q => tag_counter_reg(14)
    );
\tag_counter_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \tag_counter_reg[12]_i_1_n_4\,
      Q => tag_counter_reg(15)
    );
\tag_counter_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \tag_counter_reg[16]_i_1_n_7\,
      Q => tag_counter_reg(16)
    );
\tag_counter_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \tag_counter_reg[12]_i_1_n_0\,
      CO(3) => \tag_counter_reg[16]_i_1_n_0\,
      CO(2) => \tag_counter_reg[16]_i_1_n_1\,
      CO(1) => \tag_counter_reg[16]_i_1_n_2\,
      CO(0) => \tag_counter_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \tag_counter_reg[16]_i_1_n_4\,
      O(2) => \tag_counter_reg[16]_i_1_n_5\,
      O(1) => \tag_counter_reg[16]_i_1_n_6\,
      O(0) => \tag_counter_reg[16]_i_1_n_7\,
      S(3 downto 0) => tag_counter_reg(19 downto 16)
    );
\tag_counter_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \tag_counter_reg[16]_i_1_n_6\,
      Q => tag_counter_reg(17)
    );
\tag_counter_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \tag_counter_reg[16]_i_1_n_5\,
      Q => tag_counter_reg(18)
    );
\tag_counter_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \tag_counter_reg[16]_i_1_n_4\,
      Q => tag_counter_reg(19)
    );
\tag_counter_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \tag_counter_reg[0]_i_1_n_6\,
      Q => tag_counter_reg(1)
    );
\tag_counter_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \tag_counter_reg[20]_i_1_n_7\,
      Q => tag_counter_reg(20)
    );
\tag_counter_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \tag_counter_reg[16]_i_1_n_0\,
      CO(3) => \tag_counter_reg[20]_i_1_n_0\,
      CO(2) => \tag_counter_reg[20]_i_1_n_1\,
      CO(1) => \tag_counter_reg[20]_i_1_n_2\,
      CO(0) => \tag_counter_reg[20]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \tag_counter_reg[20]_i_1_n_4\,
      O(2) => \tag_counter_reg[20]_i_1_n_5\,
      O(1) => \tag_counter_reg[20]_i_1_n_6\,
      O(0) => \tag_counter_reg[20]_i_1_n_7\,
      S(3 downto 0) => tag_counter_reg(23 downto 20)
    );
\tag_counter_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \tag_counter_reg[20]_i_1_n_6\,
      Q => tag_counter_reg(21)
    );
\tag_counter_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \tag_counter_reg[20]_i_1_n_5\,
      Q => tag_counter_reg(22)
    );
\tag_counter_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \tag_counter_reg[20]_i_1_n_4\,
      Q => tag_counter_reg(23)
    );
\tag_counter_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \tag_counter_reg[24]_i_1_n_7\,
      Q => tag_counter_reg(24)
    );
\tag_counter_reg[24]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \tag_counter_reg[20]_i_1_n_0\,
      CO(3) => \tag_counter_reg[24]_i_1_n_0\,
      CO(2) => \tag_counter_reg[24]_i_1_n_1\,
      CO(1) => \tag_counter_reg[24]_i_1_n_2\,
      CO(0) => \tag_counter_reg[24]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \tag_counter_reg[24]_i_1_n_4\,
      O(2) => \tag_counter_reg[24]_i_1_n_5\,
      O(1) => \tag_counter_reg[24]_i_1_n_6\,
      O(0) => \tag_counter_reg[24]_i_1_n_7\,
      S(3 downto 0) => tag_counter_reg(27 downto 24)
    );
\tag_counter_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \tag_counter_reg[24]_i_1_n_6\,
      Q => tag_counter_reg(25)
    );
\tag_counter_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \tag_counter_reg[24]_i_1_n_5\,
      Q => tag_counter_reg(26)
    );
\tag_counter_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \tag_counter_reg[24]_i_1_n_4\,
      Q => tag_counter_reg(27)
    );
\tag_counter_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \tag_counter_reg[28]_i_1_n_7\,
      Q => tag_counter_reg(28)
    );
\tag_counter_reg[28]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \tag_counter_reg[24]_i_1_n_0\,
      CO(3) => \NLW_tag_counter_reg[28]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \tag_counter_reg[28]_i_1_n_1\,
      CO(1) => \tag_counter_reg[28]_i_1_n_2\,
      CO(0) => \tag_counter_reg[28]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \tag_counter_reg[28]_i_1_n_4\,
      O(2) => \tag_counter_reg[28]_i_1_n_5\,
      O(1) => \tag_counter_reg[28]_i_1_n_6\,
      O(0) => \tag_counter_reg[28]_i_1_n_7\,
      S(3 downto 0) => tag_counter_reg(31 downto 28)
    );
\tag_counter_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \tag_counter_reg[28]_i_1_n_6\,
      Q => tag_counter_reg(29)
    );
\tag_counter_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \tag_counter_reg[0]_i_1_n_5\,
      Q => tag_counter_reg(2)
    );
\tag_counter_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \tag_counter_reg[28]_i_1_n_5\,
      Q => tag_counter_reg(30)
    );
\tag_counter_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \tag_counter_reg[28]_i_1_n_4\,
      Q => tag_counter_reg(31)
    );
\tag_counter_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \tag_counter_reg[0]_i_1_n_4\,
      Q => tag_counter_reg(3)
    );
\tag_counter_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \tag_counter_reg[4]_i_1_n_7\,
      Q => tag_counter_reg(4)
    );
\tag_counter_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \tag_counter_reg[0]_i_1_n_0\,
      CO(3) => \tag_counter_reg[4]_i_1_n_0\,
      CO(2) => \tag_counter_reg[4]_i_1_n_1\,
      CO(1) => \tag_counter_reg[4]_i_1_n_2\,
      CO(0) => \tag_counter_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \tag_counter_reg[4]_i_1_n_4\,
      O(2) => \tag_counter_reg[4]_i_1_n_5\,
      O(1) => \tag_counter_reg[4]_i_1_n_6\,
      O(0) => \tag_counter_reg[4]_i_1_n_7\,
      S(3 downto 0) => tag_counter_reg(7 downto 4)
    );
\tag_counter_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \tag_counter_reg[4]_i_1_n_6\,
      Q => tag_counter_reg(5)
    );
\tag_counter_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \tag_counter_reg[4]_i_1_n_5\,
      Q => tag_counter_reg(6)
    );
\tag_counter_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \tag_counter_reg[4]_i_1_n_4\,
      Q => tag_counter_reg(7)
    );
\tag_counter_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \tag_counter_reg[8]_i_1_n_7\,
      Q => tag_counter_reg(8)
    );
\tag_counter_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \tag_counter_reg[4]_i_1_n_0\,
      CO(3) => \tag_counter_reg[8]_i_1_n_0\,
      CO(2) => \tag_counter_reg[8]_i_1_n_1\,
      CO(1) => \tag_counter_reg[8]_i_1_n_2\,
      CO(0) => \tag_counter_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \tag_counter_reg[8]_i_1_n_4\,
      O(2) => \tag_counter_reg[8]_i_1_n_5\,
      O(1) => \tag_counter_reg[8]_i_1_n_6\,
      O(0) => \tag_counter_reg[8]_i_1_n_7\,
      S(3 downto 0) => tag_counter_reg(11 downto 8)
    );
\tag_counter_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => control_clk,
      CE => tag_counter,
      CLR => \^sample_resetn_0\,
      D => \tag_counter_reg[8]_i_1_n_6\,
      Q => tag_counter_reg(9)
    );
waveform: entity work.system_dac902_control_0_fdw_dac902_dds
     port map (
      CO(0) => sample_pending1,
      D(1) => cfg_rejected,
      D(0) => sample_active,
      E(0) => \^reply_pending_reg_0\,
      Q(121 downto 90) => config_data(122 downto 91),
      Q(89 downto 0) => config_data(89 downto 0),
      S(3) => waveform_n_41,
      S(2) => waveform_n_42,
      S(1) => waveform_n_43,
      S(0) => waveform_n_44,
      active_enable => active_enable,
      \active_tag_reg[11]_0\(3) => waveform_n_84,
      \active_tag_reg[11]_0\(2) => waveform_n_85,
      \active_tag_reg[11]_0\(1) => waveform_n_86,
      \active_tag_reg[11]_0\(0) => waveform_n_87,
      \active_tag_reg[23]_0\(3) => waveform_n_88,
      \active_tag_reg[23]_0\(2) => waveform_n_89,
      \active_tag_reg[23]_0\(1) => waveform_n_90,
      \active_tag_reg[23]_0\(0) => waveform_n_91,
      \active_tag_reg[31]_0\(2) => waveform_n_92,
      \active_tag_reg[31]_0\(1) => waveform_n_93,
      \active_tag_reg[31]_0\(0) => waveform_n_94,
      awaiting_sample_reg => awaiting_sample_reg_n_0,
      awaiting_sample_reg_0(0) => cfg_valid0,
      cfg_rejected0 => cfg_rejected0,
      cfg_rejected_reg_0 => waveform_n_96,
      clock_run => clock_run,
      control_resetn => control_resetn,
      enabled2 => enabled2,
      \out\(0) => pad_tristate(12),
      \phase_accumulator_reg[31]_0\(0) => configuration_mailbox_n_5,
      reference_config_ftw0 => reference_config_ftw0,
      reference_ftw(31 downto 0) => reference_ftw(31 downto 0),
      reference_inverted => reference_inverted,
      reference_phase(31 downto 0) => reference_phase(31 downto 0),
      reference_tag(31 downto 0) => reference_tag(31 downto 0),
      reference_valid => reference_valid,
      reference_valid_0(0) => reference_valid0,
      sample_active_reg_0 => configuration_mailbox_n_128,
      sample_clipped_reg_0(0) => sample_clipped,
      sample_clk => sample_clk,
      \sample_code_reg[0]_0\(0) => configuration_mailbox_n_129,
      \sample_code_reg[11]_0\(11 downto 0) => generated_data(11 downto 0),
      sample_initialized => sample_initialized,
      sample_pending => sample_pending,
      \sample_pending1_carry__1\(31 downto 0) => sample_tag_pending(31 downto 0),
      sample_pending_reg(0) => reply_pending,
      sample_resetn => sample_resetn,
      sample_resetn_0 => \^sample_resetn_0\,
      \sample_tag_pending_reg[23]\(3) => waveform_n_77,
      \sample_tag_pending_reg[23]\(2) => waveform_n_78,
      \sample_tag_pending_reg[23]\(1) => waveform_n_79,
      \sample_tag_pending_reg[23]\(0) => waveform_n_80,
      \sample_tag_pending_reg[31]\(2) => waveform_n_81,
      \sample_tag_pending_reg[31]\(1) => waveform_n_82,
      \sample_tag_pending_reg[31]\(0) => waveform_n_83,
      sample_valid_reg_0 => waveform_n_97,
      \scaled_sample1_carry__1_0\ => \scaled_sample1_carry__1\,
      v2 => v2
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_dac902_control_0 is
  port (
    control_clk : in STD_LOGIC;
    control_resetn : in STD_LOGIC;
    sample_clk : in STD_LOGIC;
    sample_resetn : in STD_LOGIC;
    command_word : in STD_LOGIC_VECTOR ( 31 downto 0 );
    status_word : out STD_LOGIC_VECTOR ( 31 downto 0 );
    dac_data : out STD_LOGIC_VECTOR ( 11 downto 0 );
    dac_clk : out STD_LOGIC;
    reference_valid : out STD_LOGIC;
    reference_inverted : out STD_LOGIC;
    reference_phase : out STD_LOGIC_VECTOR ( 31 downto 0 );
    reference_ftw : out STD_LOGIC_VECTOR ( 31 downto 0 );
    reference_tag : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of system_dac902_control_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of system_dac902_control_0 : entity is "system_dac902_control_0,fdw_dac902_phase_control,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of system_dac902_control_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of system_dac902_control_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of system_dac902_control_0 : entity is "fdw_dac902_phase_control,Vivado 2025.1";
end system_dac902_control_0;

architecture STRUCTURE of system_dac902_control_0 is
  signal \<const0>\ : STD_LOGIC;
  signal inst_n_0 : STD_LOGIC;
  signal inst_n_1 : STD_LOGIC;
  signal scaled_sample1_carry_i_9_n_0 : STD_LOGIC;
  signal \^status_word\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of control_clk : signal is "xilinx.com:signal:clock:1.0 control_clk CLK";
  attribute X_INTERFACE_MODE : string;
  attribute X_INTERFACE_MODE of control_clk : signal is "slave";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of control_clk : signal is "XIL_INTERFACENAME control_clk, ASSOCIATED_RESET control_resetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of control_resetn : signal is "xilinx.com:signal:reset:1.0 control_resetn RST";
  attribute X_INTERFACE_MODE of control_resetn : signal is "slave";
  attribute X_INTERFACE_PARAMETER of control_resetn : signal is "XIL_INTERFACENAME control_resetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of dac_clk : signal is "xilinx.com:signal:clock:1.0 dac_clk CLK";
  attribute X_INTERFACE_MODE of dac_clk : signal is "master";
  attribute X_INTERFACE_PARAMETER of dac_clk : signal is "XIL_INTERFACENAME dac_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_dac902_control_0_dac_clk, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of sample_clk : signal is "xilinx.com:signal:clock:1.0 sample_clk CLK";
  attribute X_INTERFACE_MODE of sample_clk : signal is "slave";
  attribute X_INTERFACE_PARAMETER of sample_clk : signal is "XIL_INTERFACENAME sample_clk, ASSOCIATED_RESET sample_resetn, FREQ_HZ 25000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /adc_clk_wiz_clk_out1, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of sample_resetn : signal is "xilinx.com:signal:reset:1.0 sample_resetn RST";
  attribute X_INTERFACE_MODE of sample_resetn : signal is "slave";
  attribute X_INTERFACE_PARAMETER of sample_resetn : signal is "XIL_INTERFACENAME sample_resetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
begin
  status_word(31 downto 24) <= \^status_word\(31 downto 24);
  status_word(23) <= \<const0>\;
  status_word(22 downto 19) <= \^status_word\(22 downto 19);
  status_word(18) <= \<const0>\;
  status_word(17) <= \<const0>\;
  status_word(16) <= \<const0>\;
  status_word(15 downto 0) <= \^status_word\(15 downto 0);
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
inst: entity work.system_dac902_control_0_fdw_dac902_phase_control
     port map (
      command_word(31 downto 0) => command_word(31 downto 0),
      control_clk => control_clk,
      control_resetn => control_resetn,
      dac_clk => dac_clk,
      dac_data(11 downto 0) => dac_data(11 downto 0),
      reference_ftw(31 downto 0) => reference_ftw(31 downto 0),
      reference_inverted => reference_inverted,
      reference_phase(31 downto 0) => reference_phase(31 downto 0),
      reference_tag(31 downto 0) => reference_tag(31 downto 0),
      reference_valid => reference_valid,
      reply_pending_reg_0 => inst_n_1,
      sample_clk => sample_clk,
      sample_resetn => sample_resetn,
      sample_resetn_0 => inst_n_0,
      \scaled_sample1_carry__1\ => scaled_sample1_carry_i_9_n_0,
      status_word(26 downto 20) => \^status_word\(31 downto 25),
      status_word(19 downto 16) => \^status_word\(22 downto 19),
      status_word(15 downto 0) => \^status_word\(15 downto 0)
    );
scaled_sample1_carry_i_9: unisim.vcomponents.FDCE
     port map (
      C => sample_clk,
      CE => inst_n_1,
      CLR => inst_n_0,
      D => '1',
      Q => scaled_sample1_carry_i_9_n_0
    );
\status_word[24]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => control_resetn,
      I1 => sample_resetn,
      O => \^status_word\(24)
    );
end STRUCTURE;
