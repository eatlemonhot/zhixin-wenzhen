// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
// Date        : Thu Oct 22 00:39:40 2026
// Host        : xiaojun running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/33525/FDW_NEXT/outputs/lxb110_a2/p/generated_system/ip/system_dac902_control_0/system_dac902_control_0_sim_netlist.v
// Design      : system_dac902_control_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "system_dac902_control_0,fdw_dac902_phase_control,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "fdw_dac902_phase_control,Vivado 2025.1" *) 
(* NotValidForBitStream *)
module system_dac902_control_0
   (control_clk,
    control_resetn,
    sample_clk,
    sample_resetn,
    command_word,
    status_word,
    dac_data,
    dac_clk,
    reference_valid,
    reference_inverted,
    reference_phase,
    reference_ftw,
    reference_tag);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 control_clk CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME control_clk, ASSOCIATED_RESET control_resetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input control_clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 control_resetn RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME control_resetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input control_resetn;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 sample_clk CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME sample_clk, ASSOCIATED_RESET sample_resetn, FREQ_HZ 25000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /adc_clk_wiz_clk_out1, INSERT_VIP 0" *) input sample_clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 sample_resetn RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME sample_resetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input sample_resetn;
  input [31:0]command_word;
  output [31:0]status_word;
  output [11:0]dac_data;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 dac_clk CLK" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME dac_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_dac902_control_0_dac_clk, INSERT_VIP 0" *) output dac_clk;
  output reference_valid;
  output reference_inverted;
  output [31:0]reference_phase;
  output [31:0]reference_ftw;
  output [31:0]reference_tag;

  wire \<const0> ;
  wire [31:0]command_word;
  wire control_clk;
  wire control_resetn;
  (* DRIVE = "12" *) (* SLEW = "SLOW" *) wire dac_clk;
  (* DRIVE = "12" *) (* SLEW = "SLOW" *) wire [11:0]dac_data;
  wire inst_n_0;
  wire inst_n_1;
  wire [31:0]reference_ftw;
  wire reference_inverted;
  wire [31:0]reference_phase;
  wire [31:0]reference_tag;
  wire reference_valid;
  wire sample_clk;
  wire sample_resetn;
  wire scaled_sample1_carry_i_9_n_0;
  wire [31:0]\^status_word ;

  assign status_word[31:24] = \^status_word [31:24];
  assign status_word[23] = \<const0> ;
  assign status_word[22:19] = \^status_word [22:19];
  assign status_word[18] = \<const0> ;
  assign status_word[17] = \<const0> ;
  assign status_word[16] = \<const0> ;
  assign status_word[15:0] = \^status_word [15:0];
  GND GND
       (.G(\<const0> ));
  system_dac902_control_0_fdw_dac902_phase_control inst
       (.command_word(command_word),
        .control_clk(control_clk),
        .control_resetn(control_resetn),
        .dac_clk(dac_clk),
        .dac_data(dac_data),
        .reference_ftw(reference_ftw),
        .reference_inverted(reference_inverted),
        .reference_phase(reference_phase),
        .reference_tag(reference_tag),
        .reference_valid(reference_valid),
        .reply_pending_reg_0(inst_n_1),
        .sample_clk(sample_clk),
        .sample_resetn(sample_resetn),
        .sample_resetn_0(inst_n_0),
        .scaled_sample1_carry__1(scaled_sample1_carry_i_9_n_0),
        .status_word({\^status_word [31:25],\^status_word [22:19],\^status_word [15:0]}));
  FDCE scaled_sample1_carry_i_9
       (.C(sample_clk),
        .CE(inst_n_1),
        .CLR(inst_n_0),
        .D(1'b1),
        .Q(scaled_sample1_carry_i_9_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    \status_word[24]_INST_0 
       (.I0(control_resetn),
        .I1(sample_resetn),
        .O(\^status_word [24]));
endmodule

(* ORIG_REF_NAME = "fdw_cdc_mailbox" *) 
module system_dac902_control_0_fdw_cdc_mailbox
   (\command_word[29] ,
    \command_word[27] ,
    tag_counter,
    reference_config_ftw0,
    E,
    active_enable_reg,
    Q,
    \dst_data_reg[88]_0 ,
    v2_reg,
    cfg_rejected0,
    sample_pending_reg,
    interface_initialized_reg,
    \command_word[31] ,
    reply_pending_reg,
    status_word,
    \FSM_onehot_state_reg[1] ,
    \FSM_onehot_state_reg[2] ,
    \FSM_onehot_state_reg[1]_0 ,
    control_clk,
    \dst_data_reg[0]_0 ,
    sample_clk,
    command_word,
    \tag_counter_reg[31] ,
    \error_code_reg[0] ,
    \error_code_reg[2] ,
    \error_code_reg[2]_0 ,
    \error_code_reg[2]_1 ,
    \tag_counter_reg[31]_0 ,
    request_toggle_reg_0,
    active_enable,
    enabled2,
    v2,
    acknowledge_toggle_reg_0,
    sample_pending,
    acknowledged_reg,
    acknowledged_reg_0,
    interface_initialized,
    \FSM_onehot_state_reg[0] ,
    acknowledged_reg_1,
    pending_request_reg,
    sample_pending_reg_0,
    response_valid,
    \FSM_onehot_state_reg[2]_0 ,
    \FSM_onehot_state_reg[0]_0 ,
    \src_data_hold_reg[122]_0 );
  output \command_word[29] ;
  output \command_word[27] ;
  output tag_counter;
  output reference_config_ftw0;
  output [0:0]E;
  output [0:0]active_enable_reg;
  output [121:0]Q;
  output \dst_data_reg[88]_0 ;
  output [0:0]v2_reg;
  output cfg_rejected0;
  output [0:0]sample_pending_reg;
  output interface_initialized_reg;
  output \command_word[31] ;
  output reply_pending_reg;
  output [0:0]status_word;
  output \FSM_onehot_state_reg[1] ;
  output \FSM_onehot_state_reg[2] ;
  output \FSM_onehot_state_reg[1]_0 ;
  input control_clk;
  input \dst_data_reg[0]_0 ;
  input sample_clk;
  input [4:0]command_word;
  input \tag_counter_reg[31] ;
  input \error_code_reg[0] ;
  input \error_code_reg[2] ;
  input \error_code_reg[2]_0 ;
  input \error_code_reg[2]_1 ;
  input \tag_counter_reg[31]_0 ;
  input request_toggle_reg_0;
  input active_enable;
  input enabled2;
  input v2;
  input acknowledge_toggle_reg_0;
  input sample_pending;
  input acknowledged_reg;
  input acknowledged_reg_0;
  input interface_initialized;
  input \FSM_onehot_state_reg[0] ;
  input acknowledged_reg_1;
  input pending_request_reg;
  input [0:0]sample_pending_reg_0;
  input response_valid;
  input \FSM_onehot_state_reg[2]_0 ;
  input \FSM_onehot_state_reg[0]_0 ;
  input [122:0]\src_data_hold_reg[122]_0 ;

  wire [0:0]E;
  wire \FSM_onehot_state_reg[0] ;
  wire \FSM_onehot_state_reg[0]_0 ;
  wire \FSM_onehot_state_reg[1] ;
  wire \FSM_onehot_state_reg[1]_0 ;
  wire \FSM_onehot_state_reg[2] ;
  wire \FSM_onehot_state_reg[2]_0 ;
  wire [121:0]Q;
  (* async_reg = "true" *) (* shreg_extract = "no" *) wire [1:0]acknowledge_sync;
  wire acknowledge_toggle_i_1_n_0;
  wire acknowledge_toggle_reg_0;
  wire acknowledge_toggle_reg_n_0;
  wire acknowledged_i_4_n_0;
  wire acknowledged_reg;
  wire acknowledged_reg_0;
  wire acknowledged_reg_1;
  wire active_enable;
  wire [0:0]active_enable_reg;
  wire cfg_rejected0;
  wire cfg_rejected_i_2_n_0;
  wire cfg_rejected_i_3_n_0;
  wire cfg_rejected_i_4_n_0;
  wire [4:0]command_word;
  wire \command_word[27] ;
  wire \command_word[29] ;
  wire \command_word[31] ;
  wire [90:90]config_data;
  wire \config_packet[122]_i_3_n_0 ;
  wire config_valid;
  wire control_clk;
  wire \dst_data[122]_i_1_n_0 ;
  wire \dst_data_reg[0]_0 ;
  wire \dst_data_reg[88]_0 ;
  (* async_reg = "true" *) (* shreg_extract = "no" *) wire [1:0]dst_reset_release;
  wire dst_valid_i_1_n_0;
  wire enabled2;
  wire \error_code_reg[0] ;
  wire \error_code_reg[2] ;
  wire \error_code_reg[2]_0 ;
  wire \error_code_reg[2]_1 ;
  wire interface_initialized;
  wire interface_initialized_reg;
  wire pending_request_reg;
  wire reference_config_ftw0;
  wire reply_pending_reg;
  (* async_reg = "true" *) (* shreg_extract = "no" *) wire [1:0]request_sync;
  wire request_toggle_i_1_n_0;
  wire request_toggle_reg_0;
  wire request_toggle_reg_n_0;
  wire response_valid;
  wire sample_clk;
  wire sample_pending;
  wire [0:0]sample_pending_reg;
  wire [0:0]sample_pending_reg_0;
  wire src_data_hold;
  wire [122:0]\src_data_hold_reg[122]_0 ;
  wire \src_data_hold_reg_n_0_[0] ;
  wire \src_data_hold_reg_n_0_[100] ;
  wire \src_data_hold_reg_n_0_[101] ;
  wire \src_data_hold_reg_n_0_[102] ;
  wire \src_data_hold_reg_n_0_[103] ;
  wire \src_data_hold_reg_n_0_[104] ;
  wire \src_data_hold_reg_n_0_[105] ;
  wire \src_data_hold_reg_n_0_[106] ;
  wire \src_data_hold_reg_n_0_[107] ;
  wire \src_data_hold_reg_n_0_[108] ;
  wire \src_data_hold_reg_n_0_[109] ;
  wire \src_data_hold_reg_n_0_[10] ;
  wire \src_data_hold_reg_n_0_[110] ;
  wire \src_data_hold_reg_n_0_[111] ;
  wire \src_data_hold_reg_n_0_[112] ;
  wire \src_data_hold_reg_n_0_[113] ;
  wire \src_data_hold_reg_n_0_[114] ;
  wire \src_data_hold_reg_n_0_[115] ;
  wire \src_data_hold_reg_n_0_[116] ;
  wire \src_data_hold_reg_n_0_[117] ;
  wire \src_data_hold_reg_n_0_[118] ;
  wire \src_data_hold_reg_n_0_[119] ;
  wire \src_data_hold_reg_n_0_[11] ;
  wire \src_data_hold_reg_n_0_[120] ;
  wire \src_data_hold_reg_n_0_[121] ;
  wire \src_data_hold_reg_n_0_[122] ;
  wire \src_data_hold_reg_n_0_[12] ;
  wire \src_data_hold_reg_n_0_[13] ;
  wire \src_data_hold_reg_n_0_[14] ;
  wire \src_data_hold_reg_n_0_[15] ;
  wire \src_data_hold_reg_n_0_[16] ;
  wire \src_data_hold_reg_n_0_[17] ;
  wire \src_data_hold_reg_n_0_[18] ;
  wire \src_data_hold_reg_n_0_[19] ;
  wire \src_data_hold_reg_n_0_[1] ;
  wire \src_data_hold_reg_n_0_[20] ;
  wire \src_data_hold_reg_n_0_[21] ;
  wire \src_data_hold_reg_n_0_[22] ;
  wire \src_data_hold_reg_n_0_[23] ;
  wire \src_data_hold_reg_n_0_[24] ;
  wire \src_data_hold_reg_n_0_[25] ;
  wire \src_data_hold_reg_n_0_[26] ;
  wire \src_data_hold_reg_n_0_[27] ;
  wire \src_data_hold_reg_n_0_[28] ;
  wire \src_data_hold_reg_n_0_[29] ;
  wire \src_data_hold_reg_n_0_[2] ;
  wire \src_data_hold_reg_n_0_[30] ;
  wire \src_data_hold_reg_n_0_[31] ;
  wire \src_data_hold_reg_n_0_[32] ;
  wire \src_data_hold_reg_n_0_[33] ;
  wire \src_data_hold_reg_n_0_[34] ;
  wire \src_data_hold_reg_n_0_[35] ;
  wire \src_data_hold_reg_n_0_[36] ;
  wire \src_data_hold_reg_n_0_[37] ;
  wire \src_data_hold_reg_n_0_[38] ;
  wire \src_data_hold_reg_n_0_[39] ;
  wire \src_data_hold_reg_n_0_[3] ;
  wire \src_data_hold_reg_n_0_[40] ;
  wire \src_data_hold_reg_n_0_[41] ;
  wire \src_data_hold_reg_n_0_[42] ;
  wire \src_data_hold_reg_n_0_[43] ;
  wire \src_data_hold_reg_n_0_[44] ;
  wire \src_data_hold_reg_n_0_[45] ;
  wire \src_data_hold_reg_n_0_[46] ;
  wire \src_data_hold_reg_n_0_[47] ;
  wire \src_data_hold_reg_n_0_[48] ;
  wire \src_data_hold_reg_n_0_[49] ;
  wire \src_data_hold_reg_n_0_[4] ;
  wire \src_data_hold_reg_n_0_[50] ;
  wire \src_data_hold_reg_n_0_[51] ;
  wire \src_data_hold_reg_n_0_[52] ;
  wire \src_data_hold_reg_n_0_[53] ;
  wire \src_data_hold_reg_n_0_[54] ;
  wire \src_data_hold_reg_n_0_[55] ;
  wire \src_data_hold_reg_n_0_[56] ;
  wire \src_data_hold_reg_n_0_[57] ;
  wire \src_data_hold_reg_n_0_[58] ;
  wire \src_data_hold_reg_n_0_[59] ;
  wire \src_data_hold_reg_n_0_[5] ;
  wire \src_data_hold_reg_n_0_[60] ;
  wire \src_data_hold_reg_n_0_[61] ;
  wire \src_data_hold_reg_n_0_[62] ;
  wire \src_data_hold_reg_n_0_[63] ;
  wire \src_data_hold_reg_n_0_[64] ;
  wire \src_data_hold_reg_n_0_[65] ;
  wire \src_data_hold_reg_n_0_[66] ;
  wire \src_data_hold_reg_n_0_[67] ;
  wire \src_data_hold_reg_n_0_[68] ;
  wire \src_data_hold_reg_n_0_[69] ;
  wire \src_data_hold_reg_n_0_[6] ;
  wire \src_data_hold_reg_n_0_[70] ;
  wire \src_data_hold_reg_n_0_[71] ;
  wire \src_data_hold_reg_n_0_[72] ;
  wire \src_data_hold_reg_n_0_[73] ;
  wire \src_data_hold_reg_n_0_[74] ;
  wire \src_data_hold_reg_n_0_[75] ;
  wire \src_data_hold_reg_n_0_[76] ;
  wire \src_data_hold_reg_n_0_[77] ;
  wire \src_data_hold_reg_n_0_[78] ;
  wire \src_data_hold_reg_n_0_[79] ;
  wire \src_data_hold_reg_n_0_[7] ;
  wire \src_data_hold_reg_n_0_[80] ;
  wire \src_data_hold_reg_n_0_[81] ;
  wire \src_data_hold_reg_n_0_[82] ;
  wire \src_data_hold_reg_n_0_[83] ;
  wire \src_data_hold_reg_n_0_[84] ;
  wire \src_data_hold_reg_n_0_[85] ;
  wire \src_data_hold_reg_n_0_[86] ;
  wire \src_data_hold_reg_n_0_[87] ;
  wire \src_data_hold_reg_n_0_[88] ;
  wire \src_data_hold_reg_n_0_[89] ;
  wire \src_data_hold_reg_n_0_[8] ;
  wire \src_data_hold_reg_n_0_[90] ;
  wire \src_data_hold_reg_n_0_[91] ;
  wire \src_data_hold_reg_n_0_[92] ;
  wire \src_data_hold_reg_n_0_[93] ;
  wire \src_data_hold_reg_n_0_[94] ;
  wire \src_data_hold_reg_n_0_[95] ;
  wire \src_data_hold_reg_n_0_[96] ;
  wire \src_data_hold_reg_n_0_[97] ;
  wire \src_data_hold_reg_n_0_[98] ;
  wire \src_data_hold_reg_n_0_[99] ;
  wire \src_data_hold_reg_n_0_[9] ;
  (* async_reg = "true" *) (* shreg_extract = "no" *) wire [1:0]src_reset_release;
  wire [0:0]status_word;
  wire tag_counter;
  wire \tag_counter_reg[31] ;
  wire \tag_counter_reg[31]_0 ;
  wire v2;
  wire [0:0]v2_reg;

  LUT6 #(
    .INIT(64'hAAABBBBBAAA88888)) 
    \FSM_onehot_state[0]_i_1 
       (.I0(\FSM_onehot_state_reg[2]_0 ),
        .I1(tag_counter),
        .I2(src_data_hold),
        .I3(\FSM_onehot_state_reg[0] ),
        .I4(interface_initialized),
        .I5(\FSM_onehot_state_reg[0]_0 ),
        .O(\FSM_onehot_state_reg[2] ));
  LUT5 #(
    .INIT(32'h101E505A)) 
    \FSM_onehot_state[1]_i_1 
       (.I0(tag_counter),
        .I1(src_data_hold),
        .I2(request_toggle_reg_0),
        .I3(\FSM_onehot_state_reg[2]_0 ),
        .I4(interface_initialized),
        .O(\FSM_onehot_state_reg[1]_0 ));
  LUT6 #(
    .INIT(64'hF0F1E0E0F5F5A0A0)) 
    \FSM_onehot_state[2]_i_1 
       (.I0(tag_counter),
        .I1(src_data_hold),
        .I2(request_toggle_reg_0),
        .I3(response_valid),
        .I4(\FSM_onehot_state_reg[2]_0 ),
        .I5(interface_initialized),
        .O(\FSM_onehot_state_reg[1] ));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "no" *) 
  FDCE \acknowledge_sync_reg[0] 
       (.C(control_clk),
        .CE(1'b1),
        .CLR(\dst_data_reg[0]_0 ),
        .D(acknowledge_toggle_reg_n_0),
        .Q(acknowledge_sync[0]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "no" *) 
  FDCE \acknowledge_sync_reg[1] 
       (.C(control_clk),
        .CE(1'b1),
        .CLR(\dst_data_reg[0]_0 ),
        .D(acknowledge_sync[0]),
        .Q(acknowledge_sync[1]));
  LUT6 #(
    .INIT(64'hFFEF000000200000)) 
    acknowledge_toggle_i_1
       (.I0(request_sync[1]),
        .I1(acknowledge_toggle_reg_0),
        .I2(config_valid),
        .I3(sample_pending),
        .I4(dst_reset_release[1]),
        .I5(acknowledge_toggle_reg_n_0),
        .O(acknowledge_toggle_i_1_n_0));
  FDCE acknowledge_toggle_reg
       (.C(sample_clk),
        .CE(1'b1),
        .CLR(\dst_data_reg[0]_0 ),
        .D(acknowledge_toggle_i_1_n_0),
        .Q(acknowledge_toggle_reg_n_0));
  LUT6 #(
    .INIT(64'hAAAAEFAAAAAA20AA)) 
    acknowledged_i_1
       (.I0(acknowledged_reg),
        .I1(acknowledged_i_4_n_0),
        .I2(acknowledged_reg_0),
        .I3(interface_initialized),
        .I4(\FSM_onehot_state_reg[0] ),
        .I5(acknowledged_reg_1),
        .O(interface_initialized_reg));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    acknowledged_i_4
       (.I0(\tag_counter_reg[31] ),
        .I1(command_word[1]),
        .I2(command_word[2]),
        .I3(\config_packet[122]_i_3_n_0 ),
        .O(acknowledged_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT1 #(
    .INIT(2'h1)) 
    active_invert_i_1
       (.I0(E),
        .O(reference_config_ftw0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    cfg_rejected_i_1
       (.I0(cfg_rejected_i_2_n_0),
        .I1(acknowledge_toggle_reg_0),
        .I2(config_valid),
        .I3(sample_pending),
        .O(cfg_rejected0));
  LUT6 #(
    .INIT(64'hFFFFFFFEAAAAAAAA)) 
    cfg_rejected_i_2
       (.I0(Q[31]),
        .I1(Q[72]),
        .I2(Q[74]),
        .I3(Q[64]),
        .I4(cfg_rejected_i_3_n_0),
        .I5(Q[75]),
        .O(cfg_rejected_i_2_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    cfg_rejected_i_3
       (.I0(Q[73]),
        .I1(Q[66]),
        .I2(Q[71]),
        .I3(Q[69]),
        .I4(cfg_rejected_i_4_n_0),
        .O(cfg_rejected_i_3_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    cfg_rejected_i_4
       (.I0(Q[65]),
        .I1(Q[67]),
        .I2(Q[68]),
        .I3(Q[70]),
        .O(cfg_rejected_i_4_n_0));
  LUT5 #(
    .INIT(32'h80000000)) 
    \config_packet[122]_i_1 
       (.I0(\config_packet[122]_i_3_n_0 ),
        .I1(command_word[2]),
        .I2(command_word[1]),
        .I3(\tag_counter_reg[31] ),
        .I4(\tag_counter_reg[31]_0 ),
        .O(tag_counter));
  LUT4 #(
    .INIT(16'h0090)) 
    \config_packet[122]_i_3 
       (.I0(acknowledge_sync[1]),
        .I1(request_toggle_reg_n_0),
        .I2(src_reset_release[1]),
        .I3(\dst_data_reg[0]_0 ),
        .O(\config_packet[122]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h1400)) 
    \dst_data[122]_i_1 
       (.I0(config_valid),
        .I1(request_sync[1]),
        .I2(acknowledge_toggle_reg_n_0),
        .I3(dst_reset_release[1]),
        .O(\dst_data[122]_i_1_n_0 ));
  FDCE \dst_data_reg[0] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[0] ),
        .Q(Q[0]));
  FDCE \dst_data_reg[100] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[100] ),
        .Q(Q[99]));
  FDCE \dst_data_reg[101] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[101] ),
        .Q(Q[100]));
  FDCE \dst_data_reg[102] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[102] ),
        .Q(Q[101]));
  FDCE \dst_data_reg[103] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[103] ),
        .Q(Q[102]));
  FDCE \dst_data_reg[104] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[104] ),
        .Q(Q[103]));
  FDCE \dst_data_reg[105] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[105] ),
        .Q(Q[104]));
  FDCE \dst_data_reg[106] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[106] ),
        .Q(Q[105]));
  FDCE \dst_data_reg[107] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[107] ),
        .Q(Q[106]));
  FDCE \dst_data_reg[108] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[108] ),
        .Q(Q[107]));
  FDCE \dst_data_reg[109] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[109] ),
        .Q(Q[108]));
  FDCE \dst_data_reg[10] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[10] ),
        .Q(Q[10]));
  FDCE \dst_data_reg[110] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[110] ),
        .Q(Q[109]));
  FDCE \dst_data_reg[111] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[111] ),
        .Q(Q[110]));
  FDCE \dst_data_reg[112] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[112] ),
        .Q(Q[111]));
  FDCE \dst_data_reg[113] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[113] ),
        .Q(Q[112]));
  FDCE \dst_data_reg[114] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[114] ),
        .Q(Q[113]));
  FDCE \dst_data_reg[115] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[115] ),
        .Q(Q[114]));
  FDCE \dst_data_reg[116] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[116] ),
        .Q(Q[115]));
  FDCE \dst_data_reg[117] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[117] ),
        .Q(Q[116]));
  FDCE \dst_data_reg[118] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[118] ),
        .Q(Q[117]));
  FDCE \dst_data_reg[119] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[119] ),
        .Q(Q[118]));
  FDCE \dst_data_reg[11] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[11] ),
        .Q(Q[11]));
  FDCE \dst_data_reg[120] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[120] ),
        .Q(Q[119]));
  FDCE \dst_data_reg[121] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[121] ),
        .Q(Q[120]));
  FDCE \dst_data_reg[122] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[122] ),
        .Q(Q[121]));
  FDCE \dst_data_reg[12] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[12] ),
        .Q(Q[12]));
  FDCE \dst_data_reg[13] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[13] ),
        .Q(Q[13]));
  FDCE \dst_data_reg[14] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[14] ),
        .Q(Q[14]));
  FDCE \dst_data_reg[15] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[15] ),
        .Q(Q[15]));
  FDCE \dst_data_reg[16] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[16] ),
        .Q(Q[16]));
  FDCE \dst_data_reg[17] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[17] ),
        .Q(Q[17]));
  FDCE \dst_data_reg[18] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[18] ),
        .Q(Q[18]));
  FDCE \dst_data_reg[19] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[19] ),
        .Q(Q[19]));
  FDCE \dst_data_reg[1] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[1] ),
        .Q(Q[1]));
  FDCE \dst_data_reg[20] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[20] ),
        .Q(Q[20]));
  FDCE \dst_data_reg[21] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[21] ),
        .Q(Q[21]));
  FDCE \dst_data_reg[22] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[22] ),
        .Q(Q[22]));
  FDCE \dst_data_reg[23] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[23] ),
        .Q(Q[23]));
  FDCE \dst_data_reg[24] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[24] ),
        .Q(Q[24]));
  FDCE \dst_data_reg[25] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[25] ),
        .Q(Q[25]));
  FDCE \dst_data_reg[26] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[26] ),
        .Q(Q[26]));
  FDCE \dst_data_reg[27] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[27] ),
        .Q(Q[27]));
  FDCE \dst_data_reg[28] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[28] ),
        .Q(Q[28]));
  FDCE \dst_data_reg[29] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[29] ),
        .Q(Q[29]));
  FDCE \dst_data_reg[2] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[2] ),
        .Q(Q[2]));
  FDCE \dst_data_reg[30] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[30] ),
        .Q(Q[30]));
  FDCE \dst_data_reg[31] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[31] ),
        .Q(Q[31]));
  FDCE \dst_data_reg[32] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[32] ),
        .Q(Q[32]));
  FDCE \dst_data_reg[33] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[33] ),
        .Q(Q[33]));
  FDCE \dst_data_reg[34] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[34] ),
        .Q(Q[34]));
  FDCE \dst_data_reg[35] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[35] ),
        .Q(Q[35]));
  FDCE \dst_data_reg[36] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[36] ),
        .Q(Q[36]));
  FDCE \dst_data_reg[37] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[37] ),
        .Q(Q[37]));
  FDCE \dst_data_reg[38] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[38] ),
        .Q(Q[38]));
  FDCE \dst_data_reg[39] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[39] ),
        .Q(Q[39]));
  FDCE \dst_data_reg[3] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[3] ),
        .Q(Q[3]));
  FDCE \dst_data_reg[40] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[40] ),
        .Q(Q[40]));
  FDCE \dst_data_reg[41] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[41] ),
        .Q(Q[41]));
  FDCE \dst_data_reg[42] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[42] ),
        .Q(Q[42]));
  FDCE \dst_data_reg[43] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[43] ),
        .Q(Q[43]));
  FDCE \dst_data_reg[44] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[44] ),
        .Q(Q[44]));
  FDCE \dst_data_reg[45] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[45] ),
        .Q(Q[45]));
  FDCE \dst_data_reg[46] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[46] ),
        .Q(Q[46]));
  FDCE \dst_data_reg[47] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[47] ),
        .Q(Q[47]));
  FDCE \dst_data_reg[48] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[48] ),
        .Q(Q[48]));
  FDCE \dst_data_reg[49] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[49] ),
        .Q(Q[49]));
  FDCE \dst_data_reg[4] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[4] ),
        .Q(Q[4]));
  FDCE \dst_data_reg[50] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[50] ),
        .Q(Q[50]));
  FDCE \dst_data_reg[51] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[51] ),
        .Q(Q[51]));
  FDCE \dst_data_reg[52] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[52] ),
        .Q(Q[52]));
  FDCE \dst_data_reg[53] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[53] ),
        .Q(Q[53]));
  FDCE \dst_data_reg[54] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[54] ),
        .Q(Q[54]));
  FDCE \dst_data_reg[55] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[55] ),
        .Q(Q[55]));
  FDCE \dst_data_reg[56] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[56] ),
        .Q(Q[56]));
  FDCE \dst_data_reg[57] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[57] ),
        .Q(Q[57]));
  FDCE \dst_data_reg[58] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[58] ),
        .Q(Q[58]));
  FDCE \dst_data_reg[59] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[59] ),
        .Q(Q[59]));
  FDCE \dst_data_reg[5] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[5] ),
        .Q(Q[5]));
  FDCE \dst_data_reg[60] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[60] ),
        .Q(Q[60]));
  FDCE \dst_data_reg[61] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[61] ),
        .Q(Q[61]));
  FDCE \dst_data_reg[62] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[62] ),
        .Q(Q[62]));
  FDCE \dst_data_reg[63] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[63] ),
        .Q(Q[63]));
  FDCE \dst_data_reg[64] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[64] ),
        .Q(Q[64]));
  FDCE \dst_data_reg[65] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[65] ),
        .Q(Q[65]));
  FDCE \dst_data_reg[66] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[66] ),
        .Q(Q[66]));
  FDCE \dst_data_reg[67] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[67] ),
        .Q(Q[67]));
  FDCE \dst_data_reg[68] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[68] ),
        .Q(Q[68]));
  FDCE \dst_data_reg[69] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[69] ),
        .Q(Q[69]));
  FDCE \dst_data_reg[6] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[6] ),
        .Q(Q[6]));
  FDCE \dst_data_reg[70] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[70] ),
        .Q(Q[70]));
  FDCE \dst_data_reg[71] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[71] ),
        .Q(Q[71]));
  FDCE \dst_data_reg[72] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[72] ),
        .Q(Q[72]));
  FDCE \dst_data_reg[73] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[73] ),
        .Q(Q[73]));
  FDCE \dst_data_reg[74] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[74] ),
        .Q(Q[74]));
  FDCE \dst_data_reg[75] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[75] ),
        .Q(Q[75]));
  FDCE \dst_data_reg[76] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[76] ),
        .Q(Q[76]));
  FDCE \dst_data_reg[77] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[77] ),
        .Q(Q[77]));
  FDCE \dst_data_reg[78] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[78] ),
        .Q(Q[78]));
  FDCE \dst_data_reg[79] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[79] ),
        .Q(Q[79]));
  FDCE \dst_data_reg[7] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[7] ),
        .Q(Q[7]));
  FDCE \dst_data_reg[80] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[80] ),
        .Q(Q[80]));
  FDCE \dst_data_reg[81] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[81] ),
        .Q(Q[81]));
  FDCE \dst_data_reg[82] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[82] ),
        .Q(Q[82]));
  FDCE \dst_data_reg[83] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[83] ),
        .Q(Q[83]));
  FDCE \dst_data_reg[84] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[84] ),
        .Q(Q[84]));
  FDCE \dst_data_reg[85] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[85] ),
        .Q(Q[85]));
  FDCE \dst_data_reg[86] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[86] ),
        .Q(Q[86]));
  FDCE \dst_data_reg[87] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[87] ),
        .Q(Q[87]));
  FDCE \dst_data_reg[88] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[88] ),
        .Q(Q[88]));
  FDCE \dst_data_reg[89] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[89] ),
        .Q(Q[89]));
  FDCE \dst_data_reg[8] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[8] ),
        .Q(Q[8]));
  FDCE \dst_data_reg[90] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[90] ),
        .Q(config_data));
  FDCE \dst_data_reg[91] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[91] ),
        .Q(Q[90]));
  FDCE \dst_data_reg[92] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[92] ),
        .Q(Q[91]));
  FDCE \dst_data_reg[93] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[93] ),
        .Q(Q[92]));
  FDCE \dst_data_reg[94] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[94] ),
        .Q(Q[93]));
  FDCE \dst_data_reg[95] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[95] ),
        .Q(Q[94]));
  FDCE \dst_data_reg[96] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[96] ),
        .Q(Q[95]));
  FDCE \dst_data_reg[97] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[97] ),
        .Q(Q[96]));
  FDCE \dst_data_reg[98] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[98] ),
        .Q(Q[97]));
  FDCE \dst_data_reg[99] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[99] ),
        .Q(Q[98]));
  FDCE \dst_data_reg[9] 
       (.C(sample_clk),
        .CE(\dst_data[122]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[9] ),
        .Q(Q[9]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "no" *) 
  FDCE \dst_reset_release_reg[0] 
       (.C(sample_clk),
        .CE(1'b1),
        .CLR(\dst_data_reg[0]_0 ),
        .D(1'b1),
        .Q(dst_reset_release[0]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "no" *) 
  FDCE \dst_reset_release_reg[1] 
       (.C(sample_clk),
        .CE(1'b1),
        .CLR(\dst_data_reg[0]_0 ),
        .D(dst_reset_release[0]),
        .Q(dst_reset_release[1]));
  LUT6 #(
    .INIT(64'hF0F06060F0006060)) 
    dst_valid_i_1
       (.I0(request_sync[1]),
        .I1(acknowledge_toggle_reg_n_0),
        .I2(dst_reset_release[1]),
        .I3(sample_pending),
        .I4(config_valid),
        .I5(acknowledge_toggle_reg_0),
        .O(dst_valid_i_1_n_0));
  FDCE dst_valid_reg
       (.C(sample_clk),
        .CE(1'b1),
        .CLR(\dst_data_reg[0]_0 ),
        .D(dst_valid_i_1_n_0),
        .Q(config_valid));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hFFFF4000)) 
    \error_code[0]_i_2 
       (.I0(\config_packet[122]_i_3_n_0 ),
        .I1(command_word[2]),
        .I2(command_word[1]),
        .I3(\tag_counter_reg[31] ),
        .I4(\error_code_reg[0] ),
        .O(\command_word[29] ));
  LUT6 #(
    .INIT(64'hAAAA002000000020)) 
    \error_code[2]_i_2 
       (.I0(\error_code_reg[2] ),
        .I1(\error_code_reg[2]_0 ),
        .I2(\error_code_reg[2]_1 ),
        .I3(\config_packet[122]_i_3_n_0 ),
        .I4(command_word[0]),
        .I5(command_word[3]),
        .O(\command_word[27] ));
  LUT5 #(
    .INIT(32'hBFAA80AA)) 
    pending_request_i_1
       (.I0(command_word[4]),
        .I1(acknowledged_reg_0),
        .I2(acknowledged_i_4_n_0),
        .I3(interface_initialized),
        .I4(pending_request_reg),
        .O(\command_word[31] ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \phase_accumulator[31]_i_1 
       (.I0(active_enable),
        .I1(E),
        .I2(config_data),
        .O(active_enable_reg));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "no" *) 
  FDCE \request_sync_reg[0] 
       (.C(sample_clk),
        .CE(1'b1),
        .CLR(\dst_data_reg[0]_0 ),
        .D(request_toggle_reg_n_0),
        .Q(request_sync[0]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "no" *) 
  FDCE \request_sync_reg[1] 
       (.C(sample_clk),
        .CE(1'b1),
        .CLR(\dst_data_reg[0]_0 ),
        .D(request_sync[0]),
        .Q(request_sync[1]));
  LUT5 #(
    .INIT(32'hC5CC0000)) 
    request_toggle_i_1
       (.I0(acknowledge_sync[1]),
        .I1(request_toggle_reg_n_0),
        .I2(\dst_data_reg[0]_0 ),
        .I3(request_toggle_reg_0),
        .I4(src_reset_release[1]),
        .O(request_toggle_i_1_n_0));
  FDCE request_toggle_reg
       (.C(control_clk),
        .CE(1'b1),
        .CLR(\dst_data_reg[0]_0 ),
        .D(request_toggle_i_1_n_0),
        .Q(request_toggle_reg_n_0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    sample_active_i_1
       (.I0(Q[88]),
        .I1(E),
        .I2(enabled2),
        .O(\dst_data_reg[88]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h8B)) 
    \sample_code[11]_i_1 
       (.I0(v2),
        .I1(E),
        .I2(Q[88]),
        .O(v2_reg));
  LUT4 #(
    .INIT(16'h04F4)) 
    sample_pending_i_1
       (.I0(acknowledge_toggle_reg_0),
        .I1(config_valid),
        .I2(sample_pending),
        .I3(sample_pending_reg_0),
        .O(reply_pending_reg));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \sample_tag_pending[31]_i_1 
       (.I0(sample_pending),
        .I1(config_valid),
        .I2(acknowledge_toggle_reg_0),
        .O(sample_pending_reg));
  LUT5 #(
    .INIT(32'h20000020)) 
    \src_data_hold[122]_i_1 
       (.I0(request_toggle_reg_0),
        .I1(\dst_data_reg[0]_0 ),
        .I2(src_reset_release[1]),
        .I3(request_toggle_reg_n_0),
        .I4(acknowledge_sync[1]),
        .O(src_data_hold));
  FDCE \src_data_hold_reg[0] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [0]),
        .Q(\src_data_hold_reg_n_0_[0] ));
  FDCE \src_data_hold_reg[100] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [100]),
        .Q(\src_data_hold_reg_n_0_[100] ));
  FDCE \src_data_hold_reg[101] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [101]),
        .Q(\src_data_hold_reg_n_0_[101] ));
  FDCE \src_data_hold_reg[102] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [102]),
        .Q(\src_data_hold_reg_n_0_[102] ));
  FDCE \src_data_hold_reg[103] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [103]),
        .Q(\src_data_hold_reg_n_0_[103] ));
  FDCE \src_data_hold_reg[104] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [104]),
        .Q(\src_data_hold_reg_n_0_[104] ));
  FDCE \src_data_hold_reg[105] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [105]),
        .Q(\src_data_hold_reg_n_0_[105] ));
  FDCE \src_data_hold_reg[106] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [106]),
        .Q(\src_data_hold_reg_n_0_[106] ));
  FDCE \src_data_hold_reg[107] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [107]),
        .Q(\src_data_hold_reg_n_0_[107] ));
  FDCE \src_data_hold_reg[108] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [108]),
        .Q(\src_data_hold_reg_n_0_[108] ));
  FDCE \src_data_hold_reg[109] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [109]),
        .Q(\src_data_hold_reg_n_0_[109] ));
  FDCE \src_data_hold_reg[10] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [10]),
        .Q(\src_data_hold_reg_n_0_[10] ));
  FDCE \src_data_hold_reg[110] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [110]),
        .Q(\src_data_hold_reg_n_0_[110] ));
  FDCE \src_data_hold_reg[111] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [111]),
        .Q(\src_data_hold_reg_n_0_[111] ));
  FDCE \src_data_hold_reg[112] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [112]),
        .Q(\src_data_hold_reg_n_0_[112] ));
  FDCE \src_data_hold_reg[113] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [113]),
        .Q(\src_data_hold_reg_n_0_[113] ));
  FDCE \src_data_hold_reg[114] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [114]),
        .Q(\src_data_hold_reg_n_0_[114] ));
  FDCE \src_data_hold_reg[115] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [115]),
        .Q(\src_data_hold_reg_n_0_[115] ));
  FDCE \src_data_hold_reg[116] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [116]),
        .Q(\src_data_hold_reg_n_0_[116] ));
  FDCE \src_data_hold_reg[117] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [117]),
        .Q(\src_data_hold_reg_n_0_[117] ));
  FDCE \src_data_hold_reg[118] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [118]),
        .Q(\src_data_hold_reg_n_0_[118] ));
  FDCE \src_data_hold_reg[119] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [119]),
        .Q(\src_data_hold_reg_n_0_[119] ));
  FDCE \src_data_hold_reg[11] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [11]),
        .Q(\src_data_hold_reg_n_0_[11] ));
  FDCE \src_data_hold_reg[120] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [120]),
        .Q(\src_data_hold_reg_n_0_[120] ));
  FDCE \src_data_hold_reg[121] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [121]),
        .Q(\src_data_hold_reg_n_0_[121] ));
  FDCE \src_data_hold_reg[122] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [122]),
        .Q(\src_data_hold_reg_n_0_[122] ));
  FDCE \src_data_hold_reg[12] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [12]),
        .Q(\src_data_hold_reg_n_0_[12] ));
  FDCE \src_data_hold_reg[13] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [13]),
        .Q(\src_data_hold_reg_n_0_[13] ));
  FDCE \src_data_hold_reg[14] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [14]),
        .Q(\src_data_hold_reg_n_0_[14] ));
  FDCE \src_data_hold_reg[15] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [15]),
        .Q(\src_data_hold_reg_n_0_[15] ));
  FDCE \src_data_hold_reg[16] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [16]),
        .Q(\src_data_hold_reg_n_0_[16] ));
  FDCE \src_data_hold_reg[17] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [17]),
        .Q(\src_data_hold_reg_n_0_[17] ));
  FDCE \src_data_hold_reg[18] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [18]),
        .Q(\src_data_hold_reg_n_0_[18] ));
  FDCE \src_data_hold_reg[19] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [19]),
        .Q(\src_data_hold_reg_n_0_[19] ));
  FDCE \src_data_hold_reg[1] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [1]),
        .Q(\src_data_hold_reg_n_0_[1] ));
  FDCE \src_data_hold_reg[20] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [20]),
        .Q(\src_data_hold_reg_n_0_[20] ));
  FDCE \src_data_hold_reg[21] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [21]),
        .Q(\src_data_hold_reg_n_0_[21] ));
  FDCE \src_data_hold_reg[22] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [22]),
        .Q(\src_data_hold_reg_n_0_[22] ));
  FDCE \src_data_hold_reg[23] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [23]),
        .Q(\src_data_hold_reg_n_0_[23] ));
  FDCE \src_data_hold_reg[24] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [24]),
        .Q(\src_data_hold_reg_n_0_[24] ));
  FDCE \src_data_hold_reg[25] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [25]),
        .Q(\src_data_hold_reg_n_0_[25] ));
  FDCE \src_data_hold_reg[26] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [26]),
        .Q(\src_data_hold_reg_n_0_[26] ));
  FDCE \src_data_hold_reg[27] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [27]),
        .Q(\src_data_hold_reg_n_0_[27] ));
  FDCE \src_data_hold_reg[28] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [28]),
        .Q(\src_data_hold_reg_n_0_[28] ));
  FDCE \src_data_hold_reg[29] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [29]),
        .Q(\src_data_hold_reg_n_0_[29] ));
  FDCE \src_data_hold_reg[2] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [2]),
        .Q(\src_data_hold_reg_n_0_[2] ));
  FDCE \src_data_hold_reg[30] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [30]),
        .Q(\src_data_hold_reg_n_0_[30] ));
  FDCE \src_data_hold_reg[31] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [31]),
        .Q(\src_data_hold_reg_n_0_[31] ));
  FDCE \src_data_hold_reg[32] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [32]),
        .Q(\src_data_hold_reg_n_0_[32] ));
  FDCE \src_data_hold_reg[33] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [33]),
        .Q(\src_data_hold_reg_n_0_[33] ));
  FDCE \src_data_hold_reg[34] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [34]),
        .Q(\src_data_hold_reg_n_0_[34] ));
  FDCE \src_data_hold_reg[35] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [35]),
        .Q(\src_data_hold_reg_n_0_[35] ));
  FDCE \src_data_hold_reg[36] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [36]),
        .Q(\src_data_hold_reg_n_0_[36] ));
  FDCE \src_data_hold_reg[37] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [37]),
        .Q(\src_data_hold_reg_n_0_[37] ));
  FDCE \src_data_hold_reg[38] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [38]),
        .Q(\src_data_hold_reg_n_0_[38] ));
  FDCE \src_data_hold_reg[39] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [39]),
        .Q(\src_data_hold_reg_n_0_[39] ));
  FDCE \src_data_hold_reg[3] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [3]),
        .Q(\src_data_hold_reg_n_0_[3] ));
  FDCE \src_data_hold_reg[40] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [40]),
        .Q(\src_data_hold_reg_n_0_[40] ));
  FDCE \src_data_hold_reg[41] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [41]),
        .Q(\src_data_hold_reg_n_0_[41] ));
  FDCE \src_data_hold_reg[42] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [42]),
        .Q(\src_data_hold_reg_n_0_[42] ));
  FDCE \src_data_hold_reg[43] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [43]),
        .Q(\src_data_hold_reg_n_0_[43] ));
  FDCE \src_data_hold_reg[44] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [44]),
        .Q(\src_data_hold_reg_n_0_[44] ));
  FDCE \src_data_hold_reg[45] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [45]),
        .Q(\src_data_hold_reg_n_0_[45] ));
  FDCE \src_data_hold_reg[46] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [46]),
        .Q(\src_data_hold_reg_n_0_[46] ));
  FDCE \src_data_hold_reg[47] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [47]),
        .Q(\src_data_hold_reg_n_0_[47] ));
  FDCE \src_data_hold_reg[48] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [48]),
        .Q(\src_data_hold_reg_n_0_[48] ));
  FDCE \src_data_hold_reg[49] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [49]),
        .Q(\src_data_hold_reg_n_0_[49] ));
  FDCE \src_data_hold_reg[4] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [4]),
        .Q(\src_data_hold_reg_n_0_[4] ));
  FDCE \src_data_hold_reg[50] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [50]),
        .Q(\src_data_hold_reg_n_0_[50] ));
  FDCE \src_data_hold_reg[51] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [51]),
        .Q(\src_data_hold_reg_n_0_[51] ));
  FDCE \src_data_hold_reg[52] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [52]),
        .Q(\src_data_hold_reg_n_0_[52] ));
  FDCE \src_data_hold_reg[53] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [53]),
        .Q(\src_data_hold_reg_n_0_[53] ));
  FDCE \src_data_hold_reg[54] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [54]),
        .Q(\src_data_hold_reg_n_0_[54] ));
  FDCE \src_data_hold_reg[55] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [55]),
        .Q(\src_data_hold_reg_n_0_[55] ));
  FDCE \src_data_hold_reg[56] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [56]),
        .Q(\src_data_hold_reg_n_0_[56] ));
  FDCE \src_data_hold_reg[57] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [57]),
        .Q(\src_data_hold_reg_n_0_[57] ));
  FDCE \src_data_hold_reg[58] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [58]),
        .Q(\src_data_hold_reg_n_0_[58] ));
  FDCE \src_data_hold_reg[59] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [59]),
        .Q(\src_data_hold_reg_n_0_[59] ));
  FDCE \src_data_hold_reg[5] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [5]),
        .Q(\src_data_hold_reg_n_0_[5] ));
  FDCE \src_data_hold_reg[60] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [60]),
        .Q(\src_data_hold_reg_n_0_[60] ));
  FDCE \src_data_hold_reg[61] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [61]),
        .Q(\src_data_hold_reg_n_0_[61] ));
  FDCE \src_data_hold_reg[62] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [62]),
        .Q(\src_data_hold_reg_n_0_[62] ));
  FDCE \src_data_hold_reg[63] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [63]),
        .Q(\src_data_hold_reg_n_0_[63] ));
  FDCE \src_data_hold_reg[64] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [64]),
        .Q(\src_data_hold_reg_n_0_[64] ));
  FDCE \src_data_hold_reg[65] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [65]),
        .Q(\src_data_hold_reg_n_0_[65] ));
  FDCE \src_data_hold_reg[66] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [66]),
        .Q(\src_data_hold_reg_n_0_[66] ));
  FDCE \src_data_hold_reg[67] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [67]),
        .Q(\src_data_hold_reg_n_0_[67] ));
  FDCE \src_data_hold_reg[68] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [68]),
        .Q(\src_data_hold_reg_n_0_[68] ));
  FDCE \src_data_hold_reg[69] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [69]),
        .Q(\src_data_hold_reg_n_0_[69] ));
  FDCE \src_data_hold_reg[6] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [6]),
        .Q(\src_data_hold_reg_n_0_[6] ));
  FDCE \src_data_hold_reg[70] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [70]),
        .Q(\src_data_hold_reg_n_0_[70] ));
  FDCE \src_data_hold_reg[71] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [71]),
        .Q(\src_data_hold_reg_n_0_[71] ));
  FDCE \src_data_hold_reg[72] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [72]),
        .Q(\src_data_hold_reg_n_0_[72] ));
  FDCE \src_data_hold_reg[73] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [73]),
        .Q(\src_data_hold_reg_n_0_[73] ));
  FDCE \src_data_hold_reg[74] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [74]),
        .Q(\src_data_hold_reg_n_0_[74] ));
  FDCE \src_data_hold_reg[75] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [75]),
        .Q(\src_data_hold_reg_n_0_[75] ));
  FDCE \src_data_hold_reg[76] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [76]),
        .Q(\src_data_hold_reg_n_0_[76] ));
  FDCE \src_data_hold_reg[77] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [77]),
        .Q(\src_data_hold_reg_n_0_[77] ));
  FDCE \src_data_hold_reg[78] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [78]),
        .Q(\src_data_hold_reg_n_0_[78] ));
  FDCE \src_data_hold_reg[79] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [79]),
        .Q(\src_data_hold_reg_n_0_[79] ));
  FDCE \src_data_hold_reg[7] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [7]),
        .Q(\src_data_hold_reg_n_0_[7] ));
  FDCE \src_data_hold_reg[80] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [80]),
        .Q(\src_data_hold_reg_n_0_[80] ));
  FDCE \src_data_hold_reg[81] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [81]),
        .Q(\src_data_hold_reg_n_0_[81] ));
  FDCE \src_data_hold_reg[82] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [82]),
        .Q(\src_data_hold_reg_n_0_[82] ));
  FDCE \src_data_hold_reg[83] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [83]),
        .Q(\src_data_hold_reg_n_0_[83] ));
  FDCE \src_data_hold_reg[84] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [84]),
        .Q(\src_data_hold_reg_n_0_[84] ));
  FDCE \src_data_hold_reg[85] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [85]),
        .Q(\src_data_hold_reg_n_0_[85] ));
  FDCE \src_data_hold_reg[86] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [86]),
        .Q(\src_data_hold_reg_n_0_[86] ));
  FDCE \src_data_hold_reg[87] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [87]),
        .Q(\src_data_hold_reg_n_0_[87] ));
  FDCE \src_data_hold_reg[88] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [88]),
        .Q(\src_data_hold_reg_n_0_[88] ));
  FDCE \src_data_hold_reg[89] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [89]),
        .Q(\src_data_hold_reg_n_0_[89] ));
  FDCE \src_data_hold_reg[8] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [8]),
        .Q(\src_data_hold_reg_n_0_[8] ));
  FDCE \src_data_hold_reg[90] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [90]),
        .Q(\src_data_hold_reg_n_0_[90] ));
  FDCE \src_data_hold_reg[91] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [91]),
        .Q(\src_data_hold_reg_n_0_[91] ));
  FDCE \src_data_hold_reg[92] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [92]),
        .Q(\src_data_hold_reg_n_0_[92] ));
  FDCE \src_data_hold_reg[93] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [93]),
        .Q(\src_data_hold_reg_n_0_[93] ));
  FDCE \src_data_hold_reg[94] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [94]),
        .Q(\src_data_hold_reg_n_0_[94] ));
  FDCE \src_data_hold_reg[95] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [95]),
        .Q(\src_data_hold_reg_n_0_[95] ));
  FDCE \src_data_hold_reg[96] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [96]),
        .Q(\src_data_hold_reg_n_0_[96] ));
  FDCE \src_data_hold_reg[97] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [97]),
        .Q(\src_data_hold_reg_n_0_[97] ));
  FDCE \src_data_hold_reg[98] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [98]),
        .Q(\src_data_hold_reg_n_0_[98] ));
  FDCE \src_data_hold_reg[99] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [99]),
        .Q(\src_data_hold_reg_n_0_[99] ));
  FDCE \src_data_hold_reg[9] 
       (.C(control_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[122]_0 [9]),
        .Q(\src_data_hold_reg_n_0_[9] ));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "no" *) 
  FDCE \src_reset_release_reg[0] 
       (.C(control_clk),
        .CE(1'b1),
        .CLR(\dst_data_reg[0]_0 ),
        .D(1'b1),
        .Q(src_reset_release[0]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "no" *) 
  FDCE \src_reset_release_reg[1] 
       (.C(control_clk),
        .CE(1'b1),
        .CLR(\dst_data_reg[0]_0 ),
        .D(src_reset_release[0]),
        .Q(src_reset_release[1]));
  LUT5 #(
    .INIT(32'h40040000)) 
    \status_word[29]_INST_0 
       (.I0(\dst_data_reg[0]_0 ),
        .I1(src_reset_release[1]),
        .I2(request_toggle_reg_n_0),
        .I3(acknowledge_sync[1]),
        .I4(interface_initialized),
        .O(status_word));
  LUT4 #(
    .INIT(16'hFFEF)) 
    v0_i_1
       (.I0(cfg_rejected_i_2_n_0),
        .I1(acknowledge_toggle_reg_0),
        .I2(config_valid),
        .I3(sample_pending),
        .O(E));
endmodule

(* ORIG_REF_NAME = "fdw_cdc_mailbox" *) 
module system_dac902_control_0_fdw_cdc_mailbox__parameterized0
   (response_valid,
    E,
    Q,
    \FSM_onehot_state_reg[2] ,
    S,
    \dst_data_reg[24]_0 ,
    \config_packet_reg[122] ,
    request_toggle_reg_0,
    \FSM_onehot_state_reg[2]_0 ,
    \FSM_onehot_state_reg[2]_1 ,
    \FSM_onehot_state_reg[2]_2 ,
    sample_clk,
    \dst_data_reg[0]_0 ,
    control_clk,
    request_toggle_reg_1,
    \error_code_reg[0] ,
    command_word,
    \error_code_reg[0]_0 ,
    interface_initialized,
    acknowledge_toggle_reg_0,
    \error_code1_inferred__0/i__carry__1 ,
    CO,
    reply_pending_reg,
    \error_code_reg[2] ,
    status_word,
    \error_code_reg[1] ,
    \error_code_reg[1]_0 ,
    \error_code_reg[0]_1 ,
    \src_data_hold_reg[33]_0 );
  output response_valid;
  output [0:0]E;
  output [31:0]Q;
  output \FSM_onehot_state_reg[2] ;
  output [3:0]S;
  output [3:0]\dst_data_reg[24]_0 ;
  output [2:0]\config_packet_reg[122] ;
  output request_toggle_reg_0;
  output \FSM_onehot_state_reg[2]_0 ;
  output \FSM_onehot_state_reg[2]_1 ;
  output \FSM_onehot_state_reg[2]_2 ;
  input sample_clk;
  input \dst_data_reg[0]_0 ;
  input control_clk;
  input request_toggle_reg_1;
  input \error_code_reg[0] ;
  input [0:0]command_word;
  input \error_code_reg[0]_0 ;
  input interface_initialized;
  input acknowledge_toggle_reg_0;
  input [32:0]\error_code1_inferred__0/i__carry__1 ;
  input [0:0]CO;
  input [0:0]reply_pending_reg;
  input \error_code_reg[2] ;
  input [2:0]status_word;
  input \error_code_reg[1] ;
  input \error_code_reg[1]_0 ;
  input \error_code_reg[0]_1 ;
  input [33:0]\src_data_hold_reg[33]_0 ;

  wire [0:0]CO;
  wire [0:0]E;
  wire \FSM_onehot_state_reg[2] ;
  wire \FSM_onehot_state_reg[2]_0 ;
  wire \FSM_onehot_state_reg[2]_1 ;
  wire \FSM_onehot_state_reg[2]_2 ;
  wire [31:0]Q;
  wire [3:0]S;
  (* async_reg = "true" *) (* shreg_extract = "no" *) wire [1:0]acknowledge_sync;
  wire acknowledge_toggle_i_1__0_n_0;
  wire acknowledge_toggle_reg_0;
  wire acknowledge_toggle_reg_n_0;
  wire \applied_config[88]_i_2_n_0 ;
  wire [0:0]command_word;
  wire [2:0]\config_packet_reg[122] ;
  wire control_clk;
  wire \dst_data[33]_i_1_n_0 ;
  wire \dst_data_reg[0]_0 ;
  wire [3:0]\dst_data_reg[24]_0 ;
  (* async_reg = "true" *) (* shreg_extract = "no" *) wire [1:0]dst_reset_release;
  wire dst_valid_i_1__0_n_0;
  wire [32:0]\error_code1_inferred__0/i__carry__1 ;
  wire \error_code[1]_i_2_n_0 ;
  wire \error_code[2]_i_3_n_0 ;
  wire \error_code_reg[0] ;
  wire \error_code_reg[0]_0 ;
  wire \error_code_reg[0]_1 ;
  wire \error_code_reg[1] ;
  wire \error_code_reg[1]_0 ;
  wire \error_code_reg[2] ;
  wire interface_initialized;
  wire [0:0]reply_pending_reg;
  (* async_reg = "true" *) (* shreg_extract = "no" *) wire [1:0]request_sync;
  wire request_toggle_i_1__0_n_0;
  wire request_toggle_reg_0;
  wire request_toggle_reg_1;
  wire request_toggle_reg_n_0;
  wire [1:0]response_data;
  wire response_valid;
  wire sample_clk;
  wire src_data_hold;
  wire [33:0]\src_data_hold_reg[33]_0 ;
  wire \src_data_hold_reg_n_0_[0] ;
  wire \src_data_hold_reg_n_0_[10] ;
  wire \src_data_hold_reg_n_0_[11] ;
  wire \src_data_hold_reg_n_0_[12] ;
  wire \src_data_hold_reg_n_0_[13] ;
  wire \src_data_hold_reg_n_0_[14] ;
  wire \src_data_hold_reg_n_0_[15] ;
  wire \src_data_hold_reg_n_0_[16] ;
  wire \src_data_hold_reg_n_0_[17] ;
  wire \src_data_hold_reg_n_0_[18] ;
  wire \src_data_hold_reg_n_0_[19] ;
  wire \src_data_hold_reg_n_0_[1] ;
  wire \src_data_hold_reg_n_0_[20] ;
  wire \src_data_hold_reg_n_0_[21] ;
  wire \src_data_hold_reg_n_0_[22] ;
  wire \src_data_hold_reg_n_0_[23] ;
  wire \src_data_hold_reg_n_0_[24] ;
  wire \src_data_hold_reg_n_0_[25] ;
  wire \src_data_hold_reg_n_0_[26] ;
  wire \src_data_hold_reg_n_0_[27] ;
  wire \src_data_hold_reg_n_0_[28] ;
  wire \src_data_hold_reg_n_0_[29] ;
  wire \src_data_hold_reg_n_0_[2] ;
  wire \src_data_hold_reg_n_0_[30] ;
  wire \src_data_hold_reg_n_0_[31] ;
  wire \src_data_hold_reg_n_0_[32] ;
  wire \src_data_hold_reg_n_0_[33] ;
  wire \src_data_hold_reg_n_0_[3] ;
  wire \src_data_hold_reg_n_0_[4] ;
  wire \src_data_hold_reg_n_0_[5] ;
  wire \src_data_hold_reg_n_0_[6] ;
  wire \src_data_hold_reg_n_0_[7] ;
  wire \src_data_hold_reg_n_0_[8] ;
  wire \src_data_hold_reg_n_0_[9] ;
  (* async_reg = "true" *) (* shreg_extract = "no" *) wire [1:0]src_reset_release;
  wire [2:0]status_word;

  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "no" *) 
  FDCE \acknowledge_sync_reg[0] 
       (.C(sample_clk),
        .CE(1'b1),
        .CLR(\dst_data_reg[0]_0 ),
        .D(acknowledge_toggle_reg_n_0),
        .Q(acknowledge_sync[0]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "no" *) 
  FDCE \acknowledge_sync_reg[1] 
       (.C(sample_clk),
        .CE(1'b1),
        .CLR(\dst_data_reg[0]_0 ),
        .D(acknowledge_sync[0]),
        .Q(acknowledge_sync[1]));
  LUT5 #(
    .INIT(32'hBF008000)) 
    acknowledge_toggle_i_1__0
       (.I0(request_sync[1]),
        .I1(acknowledge_toggle_reg_0),
        .I2(response_valid),
        .I3(dst_reset_release[1]),
        .I4(acknowledge_toggle_reg_n_0),
        .O(acknowledge_toggle_i_1__0_n_0));
  FDCE acknowledge_toggle_reg
       (.C(control_clk),
        .CE(1'b1),
        .CLR(\dst_data_reg[0]_0 ),
        .D(acknowledge_toggle_i_1__0_n_0),
        .Q(acknowledge_toggle_reg_n_0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h08)) 
    acknowledged_i_6
       (.I0(acknowledge_toggle_reg_0),
        .I1(response_valid),
        .I2(\error_code_reg[0]_0 ),
        .O(\FSM_onehot_state_reg[2] ));
  LUT6 #(
    .INIT(64'h0000000009000000)) 
    \applied_config[88]_i_1 
       (.I0(response_data[0]),
        .I1(\error_code1_inferred__0/i__carry__1 [0]),
        .I2(response_data[1]),
        .I3(\applied_config[88]_i_2_n_0 ),
        .I4(interface_initialized),
        .I5(CO),
        .O(E));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \applied_config[88]_i_2 
       (.I0(response_valid),
        .I1(acknowledge_toggle_reg_0),
        .O(\applied_config[88]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h1400)) 
    \dst_data[33]_i_1 
       (.I0(response_valid),
        .I1(request_sync[1]),
        .I2(acknowledge_toggle_reg_n_0),
        .I3(dst_reset_release[1]),
        .O(\dst_data[33]_i_1_n_0 ));
  FDCE \dst_data_reg[0] 
       (.C(control_clk),
        .CE(\dst_data[33]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[0] ),
        .Q(response_data[0]));
  FDCE \dst_data_reg[10] 
       (.C(control_clk),
        .CE(\dst_data[33]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[10] ),
        .Q(Q[8]));
  FDCE \dst_data_reg[11] 
       (.C(control_clk),
        .CE(\dst_data[33]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[11] ),
        .Q(Q[9]));
  FDCE \dst_data_reg[12] 
       (.C(control_clk),
        .CE(\dst_data[33]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[12] ),
        .Q(Q[10]));
  FDCE \dst_data_reg[13] 
       (.C(control_clk),
        .CE(\dst_data[33]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[13] ),
        .Q(Q[11]));
  FDCE \dst_data_reg[14] 
       (.C(control_clk),
        .CE(\dst_data[33]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[14] ),
        .Q(Q[12]));
  FDCE \dst_data_reg[15] 
       (.C(control_clk),
        .CE(\dst_data[33]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[15] ),
        .Q(Q[13]));
  FDCE \dst_data_reg[16] 
       (.C(control_clk),
        .CE(\dst_data[33]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[16] ),
        .Q(Q[14]));
  FDCE \dst_data_reg[17] 
       (.C(control_clk),
        .CE(\dst_data[33]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[17] ),
        .Q(Q[15]));
  FDCE \dst_data_reg[18] 
       (.C(control_clk),
        .CE(\dst_data[33]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[18] ),
        .Q(Q[16]));
  FDCE \dst_data_reg[19] 
       (.C(control_clk),
        .CE(\dst_data[33]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[19] ),
        .Q(Q[17]));
  FDCE \dst_data_reg[1] 
       (.C(control_clk),
        .CE(\dst_data[33]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[1] ),
        .Q(response_data[1]));
  FDCE \dst_data_reg[20] 
       (.C(control_clk),
        .CE(\dst_data[33]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[20] ),
        .Q(Q[18]));
  FDCE \dst_data_reg[21] 
       (.C(control_clk),
        .CE(\dst_data[33]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[21] ),
        .Q(Q[19]));
  FDCE \dst_data_reg[22] 
       (.C(control_clk),
        .CE(\dst_data[33]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[22] ),
        .Q(Q[20]));
  FDCE \dst_data_reg[23] 
       (.C(control_clk),
        .CE(\dst_data[33]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[23] ),
        .Q(Q[21]));
  FDCE \dst_data_reg[24] 
       (.C(control_clk),
        .CE(\dst_data[33]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[24] ),
        .Q(Q[22]));
  FDCE \dst_data_reg[25] 
       (.C(control_clk),
        .CE(\dst_data[33]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[25] ),
        .Q(Q[23]));
  FDCE \dst_data_reg[26] 
       (.C(control_clk),
        .CE(\dst_data[33]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[26] ),
        .Q(Q[24]));
  FDCE \dst_data_reg[27] 
       (.C(control_clk),
        .CE(\dst_data[33]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[27] ),
        .Q(Q[25]));
  FDCE \dst_data_reg[28] 
       (.C(control_clk),
        .CE(\dst_data[33]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[28] ),
        .Q(Q[26]));
  FDCE \dst_data_reg[29] 
       (.C(control_clk),
        .CE(\dst_data[33]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[29] ),
        .Q(Q[27]));
  FDCE \dst_data_reg[2] 
       (.C(control_clk),
        .CE(\dst_data[33]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[2] ),
        .Q(Q[0]));
  FDCE \dst_data_reg[30] 
       (.C(control_clk),
        .CE(\dst_data[33]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[30] ),
        .Q(Q[28]));
  FDCE \dst_data_reg[31] 
       (.C(control_clk),
        .CE(\dst_data[33]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[31] ),
        .Q(Q[29]));
  FDCE \dst_data_reg[32] 
       (.C(control_clk),
        .CE(\dst_data[33]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[32] ),
        .Q(Q[30]));
  FDCE \dst_data_reg[33] 
       (.C(control_clk),
        .CE(\dst_data[33]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[33] ),
        .Q(Q[31]));
  FDCE \dst_data_reg[3] 
       (.C(control_clk),
        .CE(\dst_data[33]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[3] ),
        .Q(Q[1]));
  FDCE \dst_data_reg[4] 
       (.C(control_clk),
        .CE(\dst_data[33]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[4] ),
        .Q(Q[2]));
  FDCE \dst_data_reg[5] 
       (.C(control_clk),
        .CE(\dst_data[33]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[5] ),
        .Q(Q[3]));
  FDCE \dst_data_reg[6] 
       (.C(control_clk),
        .CE(\dst_data[33]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[6] ),
        .Q(Q[4]));
  FDCE \dst_data_reg[7] 
       (.C(control_clk),
        .CE(\dst_data[33]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[7] ),
        .Q(Q[5]));
  FDCE \dst_data_reg[8] 
       (.C(control_clk),
        .CE(\dst_data[33]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[8] ),
        .Q(Q[6]));
  FDCE \dst_data_reg[9] 
       (.C(control_clk),
        .CE(\dst_data[33]_i_1_n_0 ),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg_n_0_[9] ),
        .Q(Q[7]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "no" *) 
  FDCE \dst_reset_release_reg[0] 
       (.C(control_clk),
        .CE(1'b1),
        .CLR(\dst_data_reg[0]_0 ),
        .D(1'b1),
        .Q(dst_reset_release[0]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "no" *) 
  FDCE \dst_reset_release_reg[1] 
       (.C(control_clk),
        .CE(1'b1),
        .CLR(\dst_data_reg[0]_0 ),
        .D(dst_reset_release[0]),
        .Q(dst_reset_release[1]));
  LUT5 #(
    .INIT(32'h0060F060)) 
    dst_valid_i_1__0
       (.I0(request_sync[1]),
        .I1(acknowledge_toggle_reg_n_0),
        .I2(dst_reset_release[1]),
        .I3(response_valid),
        .I4(acknowledge_toggle_reg_0),
        .O(dst_valid_i_1__0_n_0));
  FDCE dst_valid_reg
       (.C(control_clk),
        .CE(1'b1),
        .CLR(\dst_data_reg[0]_0 ),
        .D(dst_valid_i_1__0_n_0),
        .Q(response_valid));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \error_code[0]_i_1 
       (.I0(\error_code[1]_i_2_n_0 ),
        .I1(acknowledge_toggle_reg_0),
        .I2(\error_code_reg[0]_1 ),
        .I3(\error_code[2]_i_3_n_0 ),
        .I4(status_word[0]),
        .O(\FSM_onehot_state_reg[2]_2 ));
  LUT6 #(
    .INIT(64'h8F88FFFF8F880000)) 
    \error_code[1]_i_1 
       (.I0(\error_code[1]_i_2_n_0 ),
        .I1(acknowledge_toggle_reg_0),
        .I2(\error_code_reg[1] ),
        .I3(\error_code_reg[1]_0 ),
        .I4(\error_code[2]_i_3_n_0 ),
        .I5(status_word[1]),
        .O(\FSM_onehot_state_reg[2]_1 ));
  LUT4 #(
    .INIT(16'h5514)) 
    \error_code[1]_i_2 
       (.I0(CO),
        .I1(response_data[0]),
        .I2(\error_code1_inferred__0/i__carry__1 [0]),
        .I3(response_data[1]),
        .O(\error_code[1]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \error_code[2]_i_1 
       (.I0(CO),
        .I1(acknowledge_toggle_reg_0),
        .I2(\error_code_reg[2] ),
        .I3(\error_code[2]_i_3_n_0 ),
        .I4(status_word[2]),
        .O(\FSM_onehot_state_reg[2]_0 ));
  LUT6 #(
    .INIT(64'hFF00000006000600)) 
    \error_code[2]_i_3 
       (.I0(\error_code_reg[0] ),
        .I1(command_word),
        .I2(\error_code_reg[0]_0 ),
        .I3(interface_initialized),
        .I4(response_valid),
        .I5(acknowledge_toggle_reg_0),
        .O(\error_code[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry__0_i_1
       (.I0(Q[22]),
        .I1(\error_code1_inferred__0/i__carry__1 [23]),
        .I2(Q[21]),
        .I3(\error_code1_inferred__0/i__carry__1 [22]),
        .I4(\error_code1_inferred__0/i__carry__1 [24]),
        .I5(Q[23]),
        .O(\dst_data_reg[24]_0 [3]));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry__0_i_2
       (.I0(Q[19]),
        .I1(\error_code1_inferred__0/i__carry__1 [20]),
        .I2(Q[18]),
        .I3(\error_code1_inferred__0/i__carry__1 [19]),
        .I4(\error_code1_inferred__0/i__carry__1 [21]),
        .I5(Q[20]),
        .O(\dst_data_reg[24]_0 [2]));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry__0_i_3
       (.I0(Q[15]),
        .I1(\error_code1_inferred__0/i__carry__1 [16]),
        .I2(Q[16]),
        .I3(\error_code1_inferred__0/i__carry__1 [17]),
        .I4(\error_code1_inferred__0/i__carry__1 [18]),
        .I5(Q[17]),
        .O(\dst_data_reg[24]_0 [1]));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry__0_i_4
       (.I0(Q[12]),
        .I1(\error_code1_inferred__0/i__carry__1 [13]),
        .I2(Q[13]),
        .I3(\error_code1_inferred__0/i__carry__1 [14]),
        .I4(\error_code1_inferred__0/i__carry__1 [15]),
        .I5(Q[14]),
        .O(\dst_data_reg[24]_0 [0]));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__1_i_1
       (.I0(\error_code1_inferred__0/i__carry__1 [32]),
        .I1(Q[31]),
        .I2(\error_code1_inferred__0/i__carry__1 [31]),
        .I3(Q[30]),
        .O(\config_packet_reg[122] [2]));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry__1_i_2
       (.I0(Q[27]),
        .I1(\error_code1_inferred__0/i__carry__1 [28]),
        .I2(Q[28]),
        .I3(\error_code1_inferred__0/i__carry__1 [29]),
        .I4(\error_code1_inferred__0/i__carry__1 [30]),
        .I5(Q[29]),
        .O(\config_packet_reg[122] [1]));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry__1_i_3
       (.I0(Q[24]),
        .I1(\error_code1_inferred__0/i__carry__1 [25]),
        .I2(Q[25]),
        .I3(\error_code1_inferred__0/i__carry__1 [26]),
        .I4(\error_code1_inferred__0/i__carry__1 [27]),
        .I5(Q[26]),
        .O(\config_packet_reg[122] [0]));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry_i_1
       (.I0(Q[9]),
        .I1(\error_code1_inferred__0/i__carry__1 [10]),
        .I2(Q[10]),
        .I3(\error_code1_inferred__0/i__carry__1 [11]),
        .I4(\error_code1_inferred__0/i__carry__1 [12]),
        .I5(Q[11]),
        .O(S[3]));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry_i_2
       (.I0(Q[8]),
        .I1(\error_code1_inferred__0/i__carry__1 [9]),
        .I2(Q[6]),
        .I3(\error_code1_inferred__0/i__carry__1 [7]),
        .I4(\error_code1_inferred__0/i__carry__1 [8]),
        .I5(Q[7]),
        .O(S[2]));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry_i_3
       (.I0(Q[3]),
        .I1(\error_code1_inferred__0/i__carry__1 [4]),
        .I2(Q[4]),
        .I3(\error_code1_inferred__0/i__carry__1 [5]),
        .I4(\error_code1_inferred__0/i__carry__1 [6]),
        .I5(Q[5]),
        .O(S[1]));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry_i_4
       (.I0(Q[1]),
        .I1(\error_code1_inferred__0/i__carry__1 [2]),
        .I2(Q[0]),
        .I3(\error_code1_inferred__0/i__carry__1 [1]),
        .I4(\error_code1_inferred__0/i__carry__1 [3]),
        .I5(Q[2]),
        .O(S[0]));
  LUT6 #(
    .INIT(64'hFFFFFFFFF600FF00)) 
    reply_pending_i_1
       (.I0(request_toggle_reg_n_0),
        .I1(acknowledge_sync[1]),
        .I2(\dst_data_reg[0]_0 ),
        .I3(request_toggle_reg_1),
        .I4(src_reset_release[1]),
        .I5(reply_pending_reg),
        .O(request_toggle_reg_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "no" *) 
  FDCE \request_sync_reg[0] 
       (.C(control_clk),
        .CE(1'b1),
        .CLR(\dst_data_reg[0]_0 ),
        .D(request_toggle_reg_n_0),
        .Q(request_sync[0]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "no" *) 
  FDCE \request_sync_reg[1] 
       (.C(control_clk),
        .CE(1'b1),
        .CLR(\dst_data_reg[0]_0 ),
        .D(request_sync[0]),
        .Q(request_sync[1]));
  LUT5 #(
    .INIT(32'hA3AA0000)) 
    request_toggle_i_1__0
       (.I0(request_toggle_reg_n_0),
        .I1(acknowledge_sync[1]),
        .I2(\dst_data_reg[0]_0 ),
        .I3(request_toggle_reg_1),
        .I4(src_reset_release[1]),
        .O(request_toggle_i_1__0_n_0));
  FDCE request_toggle_reg
       (.C(sample_clk),
        .CE(1'b1),
        .CLR(\dst_data_reg[0]_0 ),
        .D(request_toggle_i_1__0_n_0),
        .Q(request_toggle_reg_n_0));
  LUT5 #(
    .INIT(32'h08000008)) 
    \src_data_hold[33]_i_1 
       (.I0(src_reset_release[1]),
        .I1(request_toggle_reg_1),
        .I2(\dst_data_reg[0]_0 ),
        .I3(acknowledge_sync[1]),
        .I4(request_toggle_reg_n_0),
        .O(src_data_hold));
  FDCE \src_data_hold_reg[0] 
       (.C(sample_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[33]_0 [0]),
        .Q(\src_data_hold_reg_n_0_[0] ));
  FDCE \src_data_hold_reg[10] 
       (.C(sample_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[33]_0 [10]),
        .Q(\src_data_hold_reg_n_0_[10] ));
  FDCE \src_data_hold_reg[11] 
       (.C(sample_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[33]_0 [11]),
        .Q(\src_data_hold_reg_n_0_[11] ));
  FDCE \src_data_hold_reg[12] 
       (.C(sample_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[33]_0 [12]),
        .Q(\src_data_hold_reg_n_0_[12] ));
  FDCE \src_data_hold_reg[13] 
       (.C(sample_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[33]_0 [13]),
        .Q(\src_data_hold_reg_n_0_[13] ));
  FDCE \src_data_hold_reg[14] 
       (.C(sample_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[33]_0 [14]),
        .Q(\src_data_hold_reg_n_0_[14] ));
  FDCE \src_data_hold_reg[15] 
       (.C(sample_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[33]_0 [15]),
        .Q(\src_data_hold_reg_n_0_[15] ));
  FDCE \src_data_hold_reg[16] 
       (.C(sample_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[33]_0 [16]),
        .Q(\src_data_hold_reg_n_0_[16] ));
  FDCE \src_data_hold_reg[17] 
       (.C(sample_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[33]_0 [17]),
        .Q(\src_data_hold_reg_n_0_[17] ));
  FDCE \src_data_hold_reg[18] 
       (.C(sample_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[33]_0 [18]),
        .Q(\src_data_hold_reg_n_0_[18] ));
  FDCE \src_data_hold_reg[19] 
       (.C(sample_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[33]_0 [19]),
        .Q(\src_data_hold_reg_n_0_[19] ));
  FDCE \src_data_hold_reg[1] 
       (.C(sample_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[33]_0 [1]),
        .Q(\src_data_hold_reg_n_0_[1] ));
  FDCE \src_data_hold_reg[20] 
       (.C(sample_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[33]_0 [20]),
        .Q(\src_data_hold_reg_n_0_[20] ));
  FDCE \src_data_hold_reg[21] 
       (.C(sample_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[33]_0 [21]),
        .Q(\src_data_hold_reg_n_0_[21] ));
  FDCE \src_data_hold_reg[22] 
       (.C(sample_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[33]_0 [22]),
        .Q(\src_data_hold_reg_n_0_[22] ));
  FDCE \src_data_hold_reg[23] 
       (.C(sample_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[33]_0 [23]),
        .Q(\src_data_hold_reg_n_0_[23] ));
  FDCE \src_data_hold_reg[24] 
       (.C(sample_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[33]_0 [24]),
        .Q(\src_data_hold_reg_n_0_[24] ));
  FDCE \src_data_hold_reg[25] 
       (.C(sample_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[33]_0 [25]),
        .Q(\src_data_hold_reg_n_0_[25] ));
  FDCE \src_data_hold_reg[26] 
       (.C(sample_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[33]_0 [26]),
        .Q(\src_data_hold_reg_n_0_[26] ));
  FDCE \src_data_hold_reg[27] 
       (.C(sample_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[33]_0 [27]),
        .Q(\src_data_hold_reg_n_0_[27] ));
  FDCE \src_data_hold_reg[28] 
       (.C(sample_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[33]_0 [28]),
        .Q(\src_data_hold_reg_n_0_[28] ));
  FDCE \src_data_hold_reg[29] 
       (.C(sample_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[33]_0 [29]),
        .Q(\src_data_hold_reg_n_0_[29] ));
  FDCE \src_data_hold_reg[2] 
       (.C(sample_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[33]_0 [2]),
        .Q(\src_data_hold_reg_n_0_[2] ));
  FDCE \src_data_hold_reg[30] 
       (.C(sample_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[33]_0 [30]),
        .Q(\src_data_hold_reg_n_0_[30] ));
  FDCE \src_data_hold_reg[31] 
       (.C(sample_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[33]_0 [31]),
        .Q(\src_data_hold_reg_n_0_[31] ));
  FDCE \src_data_hold_reg[32] 
       (.C(sample_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[33]_0 [32]),
        .Q(\src_data_hold_reg_n_0_[32] ));
  FDCE \src_data_hold_reg[33] 
       (.C(sample_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[33]_0 [33]),
        .Q(\src_data_hold_reg_n_0_[33] ));
  FDCE \src_data_hold_reg[3] 
       (.C(sample_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[33]_0 [3]),
        .Q(\src_data_hold_reg_n_0_[3] ));
  FDCE \src_data_hold_reg[4] 
       (.C(sample_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[33]_0 [4]),
        .Q(\src_data_hold_reg_n_0_[4] ));
  FDCE \src_data_hold_reg[5] 
       (.C(sample_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[33]_0 [5]),
        .Q(\src_data_hold_reg_n_0_[5] ));
  FDCE \src_data_hold_reg[6] 
       (.C(sample_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[33]_0 [6]),
        .Q(\src_data_hold_reg_n_0_[6] ));
  FDCE \src_data_hold_reg[7] 
       (.C(sample_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[33]_0 [7]),
        .Q(\src_data_hold_reg_n_0_[7] ));
  FDCE \src_data_hold_reg[8] 
       (.C(sample_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[33]_0 [8]),
        .Q(\src_data_hold_reg_n_0_[8] ));
  FDCE \src_data_hold_reg[9] 
       (.C(sample_clk),
        .CE(src_data_hold),
        .CLR(\dst_data_reg[0]_0 ),
        .D(\src_data_hold_reg[33]_0 [9]),
        .Q(\src_data_hold_reg_n_0_[9] ));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "no" *) 
  FDCE \src_reset_release_reg[0] 
       (.C(sample_clk),
        .CE(1'b1),
        .CLR(\dst_data_reg[0]_0 ),
        .D(1'b1),
        .Q(src_reset_release[0]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "no" *) 
  FDCE \src_reset_release_reg[1] 
       (.C(sample_clk),
        .CE(1'b1),
        .CLR(\dst_data_reg[0]_0 ),
        .D(src_reset_release[0]),
        .Q(src_reset_release[1]));
endmodule

(* ORIG_REF_NAME = "fdw_dac902_dds" *) 
module system_dac902_control_0_fdw_dac902_dds
   (sample_resetn_0,
    D,
    v2,
    active_enable,
    enabled2,
    reference_inverted,
    sample_clipped_reg_0,
    reference_ftw,
    sample_pending_reg,
    S,
    reference_tag,
    \sample_tag_pending_reg[23] ,
    \sample_tag_pending_reg[31] ,
    \active_tag_reg[11]_0 ,
    \active_tag_reg[23]_0 ,
    \active_tag_reg[31]_0 ,
    reference_valid,
    cfg_rejected_reg_0,
    sample_valid_reg_0,
    \sample_code_reg[11]_0 ,
    reference_phase,
    reference_config_ftw0,
    sample_clk,
    cfg_rejected0,
    E,
    Q,
    \sample_code_reg[0]_0 ,
    sample_active_reg_0,
    sample_resetn,
    control_resetn,
    sample_pending,
    CO,
    awaiting_sample_reg,
    sample_pending1_carry__1,
    out,
    clock_run,
    reference_valid_0,
    awaiting_sample_reg_0,
    sample_initialized,
    scaled_sample1_carry__1_0,
    \phase_accumulator_reg[31]_0 );
  output sample_resetn_0;
  output [1:0]D;
  output v2;
  output active_enable;
  output enabled2;
  output reference_inverted;
  output [0:0]sample_clipped_reg_0;
  output [31:0]reference_ftw;
  output [0:0]sample_pending_reg;
  output [3:0]S;
  output [31:0]reference_tag;
  output [3:0]\sample_tag_pending_reg[23] ;
  output [2:0]\sample_tag_pending_reg[31] ;
  output [3:0]\active_tag_reg[11]_0 ;
  output [3:0]\active_tag_reg[23]_0 ;
  output [2:0]\active_tag_reg[31]_0 ;
  output reference_valid;
  output cfg_rejected_reg_0;
  output sample_valid_reg_0;
  output [11:0]\sample_code_reg[11]_0 ;
  output [31:0]reference_phase;
  input reference_config_ftw0;
  input sample_clk;
  input cfg_rejected0;
  input [0:0]E;
  input [121:0]Q;
  input [0:0]\sample_code_reg[0]_0 ;
  input sample_active_reg_0;
  input sample_resetn;
  input control_resetn;
  input sample_pending;
  input [0:0]CO;
  input awaiting_sample_reg;
  input [31:0]sample_pending1_carry__1;
  input [0:0]out;
  input clock_run;
  input [0:0]reference_valid_0;
  input [0:0]awaiting_sample_reg_0;
  input sample_initialized;
  input scaled_sample1_carry__1_0;
  input [0:0]\phase_accumulator_reg[31]_0 ;

  wire [0:0]CO;
  wire [1:0]D;
  wire [0:0]E;
  wire [121:0]Q;
  wire [3:0]S;
  wire active_enable;
  wire [31:0]active_tag;
  wire [3:0]\active_tag_reg[11]_0 ;
  wire [3:0]\active_tag_reg[23]_0 ;
  wire [2:0]\active_tag_reg[31]_0 ;
  wire awaiting_sample_i_2_n_0;
  wire awaiting_sample_reg;
  wire [0:0]awaiting_sample_reg_0;
  wire bounded_code2_carry_i_1_n_0;
  wire bounded_code2_carry_i_2_n_0;
  wire bounded_code2_carry_i_3_n_0;
  wire bounded_code2_carry_n_2;
  wire bounded_code2_carry_n_3;
  wire cfg_accepted;
  wire cfg_rejected0;
  wire cfg_rejected_reg_0;
  wire clock_run;
  wire \code2_reg_n_0_[0] ;
  wire \code2_reg_n_0_[10] ;
  wire \code2_reg_n_0_[11] ;
  wire \code2_reg_n_0_[12] ;
  wire \code2_reg_n_0_[13] ;
  wire \code2_reg_n_0_[15] ;
  wire \code2_reg_n_0_[1] ;
  wire \code2_reg_n_0_[2] ;
  wire \code2_reg_n_0_[3] ;
  wire \code2_reg_n_0_[4] ;
  wire \code2_reg_n_0_[5] ;
  wire \code2_reg_n_0_[6] ;
  wire \code2_reg_n_0_[7] ;
  wire \code2_reg_n_0_[8] ;
  wire \code2_reg_n_0_[9] ;
  wire control_resetn;
  wire enabled0;
  wire enabled1;
  wire enabled2;
  wire [11:0]gain0;
  wire [11:0]gain_q11;
  wire invert0;
  wire invert1;
  wire invert2;
  wire [11:0]offset0;
  wire [11:0]offset1;
  wire [11:0]offset_code;
  wire [0:0]out;
  wire [31:0]p0;
  wire \p0[11]_i_2_n_0 ;
  wire \p0[11]_i_3_n_0 ;
  wire \p0[11]_i_4_n_0 ;
  wire \p0[11]_i_5_n_0 ;
  wire \p0[15]_i_2_n_0 ;
  wire \p0[15]_i_3_n_0 ;
  wire \p0[15]_i_4_n_0 ;
  wire \p0[15]_i_5_n_0 ;
  wire \p0[19]_i_2_n_0 ;
  wire \p0[19]_i_3_n_0 ;
  wire \p0[19]_i_4_n_0 ;
  wire \p0[19]_i_5_n_0 ;
  wire \p0[23]_i_2_n_0 ;
  wire \p0[23]_i_3_n_0 ;
  wire \p0[23]_i_4_n_0 ;
  wire \p0[23]_i_5_n_0 ;
  wire \p0[27]_i_2_n_0 ;
  wire \p0[27]_i_3_n_0 ;
  wire \p0[27]_i_4_n_0 ;
  wire \p0[27]_i_5_n_0 ;
  wire \p0[31]_i_2_n_0 ;
  wire \p0[31]_i_3_n_0 ;
  wire \p0[31]_i_4_n_0 ;
  wire \p0[31]_i_5_n_0 ;
  wire \p0[3]_i_2_n_0 ;
  wire \p0[3]_i_3_n_0 ;
  wire \p0[3]_i_4_n_0 ;
  wire \p0[3]_i_5_n_0 ;
  wire \p0[7]_i_2_n_0 ;
  wire \p0[7]_i_3_n_0 ;
  wire \p0[7]_i_4_n_0 ;
  wire \p0[7]_i_5_n_0 ;
  wire \p0_reg[11]_i_1_n_0 ;
  wire \p0_reg[11]_i_1_n_1 ;
  wire \p0_reg[11]_i_1_n_2 ;
  wire \p0_reg[11]_i_1_n_3 ;
  wire \p0_reg[11]_i_1_n_4 ;
  wire \p0_reg[11]_i_1_n_5 ;
  wire \p0_reg[11]_i_1_n_6 ;
  wire \p0_reg[11]_i_1_n_7 ;
  wire \p0_reg[15]_i_1_n_0 ;
  wire \p0_reg[15]_i_1_n_1 ;
  wire \p0_reg[15]_i_1_n_2 ;
  wire \p0_reg[15]_i_1_n_3 ;
  wire \p0_reg[15]_i_1_n_4 ;
  wire \p0_reg[15]_i_1_n_5 ;
  wire \p0_reg[15]_i_1_n_6 ;
  wire \p0_reg[15]_i_1_n_7 ;
  wire \p0_reg[19]_i_1_n_0 ;
  wire \p0_reg[19]_i_1_n_1 ;
  wire \p0_reg[19]_i_1_n_2 ;
  wire \p0_reg[19]_i_1_n_3 ;
  wire \p0_reg[19]_i_1_n_4 ;
  wire \p0_reg[19]_i_1_n_5 ;
  wire \p0_reg[19]_i_1_n_6 ;
  wire \p0_reg[19]_i_1_n_7 ;
  wire \p0_reg[23]_i_1_n_0 ;
  wire \p0_reg[23]_i_1_n_1 ;
  wire \p0_reg[23]_i_1_n_2 ;
  wire \p0_reg[23]_i_1_n_3 ;
  wire \p0_reg[27]_i_1_n_0 ;
  wire \p0_reg[27]_i_1_n_1 ;
  wire \p0_reg[27]_i_1_n_2 ;
  wire \p0_reg[27]_i_1_n_3 ;
  wire \p0_reg[31]_i_1_n_1 ;
  wire \p0_reg[31]_i_1_n_2 ;
  wire \p0_reg[31]_i_1_n_3 ;
  wire \p0_reg[3]_i_1_n_0 ;
  wire \p0_reg[3]_i_1_n_1 ;
  wire \p0_reg[3]_i_1_n_2 ;
  wire \p0_reg[3]_i_1_n_3 ;
  wire \p0_reg[3]_i_1_n_4 ;
  wire \p0_reg[3]_i_1_n_5 ;
  wire \p0_reg[3]_i_1_n_6 ;
  wire \p0_reg[3]_i_1_n_7 ;
  wire \p0_reg[7]_i_1_n_0 ;
  wire \p0_reg[7]_i_1_n_1 ;
  wire \p0_reg[7]_i_1_n_2 ;
  wire \p0_reg[7]_i_1_n_3 ;
  wire \p0_reg[7]_i_1_n_4 ;
  wire \p0_reg[7]_i_1_n_5 ;
  wire \p0_reg[7]_i_1_n_6 ;
  wire \p0_reg[7]_i_1_n_7 ;
  wire [31:0]p1;
  wire [31:0]p2;
  wire [11:0]p_0_out;
  wire \p_0_out_inferred__0/product10_i_100_n_0 ;
  wire \p_0_out_inferred__0/product10_i_101_n_0 ;
  wire \p_0_out_inferred__0/product10_i_102_n_0 ;
  wire \p_0_out_inferred__0/product10_i_103_n_0 ;
  wire \p_0_out_inferred__0/product10_i_104_n_0 ;
  wire \p_0_out_inferred__0/product10_i_105_n_0 ;
  wire \p_0_out_inferred__0/product10_i_106_n_0 ;
  wire \p_0_out_inferred__0/product10_i_107_n_0 ;
  wire \p_0_out_inferred__0/product10_i_108_n_0 ;
  wire \p_0_out_inferred__0/product10_i_109_n_0 ;
  wire \p_0_out_inferred__0/product10_i_110_n_0 ;
  wire \p_0_out_inferred__0/product10_i_111_n_0 ;
  wire \p_0_out_inferred__0/product10_i_112_n_0 ;
  wire \p_0_out_inferred__0/product10_i_113_n_0 ;
  wire \p_0_out_inferred__0/product10_i_114_n_0 ;
  wire \p_0_out_inferred__0/product10_i_115_n_0 ;
  wire \p_0_out_inferred__0/product10_i_116_n_0 ;
  wire \p_0_out_inferred__0/product10_i_117_n_0 ;
  wire \p_0_out_inferred__0/product10_i_118_n_0 ;
  wire \p_0_out_inferred__0/product10_i_119_n_0 ;
  wire \p_0_out_inferred__0/product10_i_120_n_0 ;
  wire \p_0_out_inferred__0/product10_i_121_n_0 ;
  wire \p_0_out_inferred__0/product10_i_122_n_0 ;
  wire \p_0_out_inferred__0/product10_i_123_n_0 ;
  wire \p_0_out_inferred__0/product10_i_124_n_0 ;
  wire \p_0_out_inferred__0/product10_i_125_n_0 ;
  wire \p_0_out_inferred__0/product10_i_126_n_0 ;
  wire \p_0_out_inferred__0/product10_i_127_n_0 ;
  wire \p_0_out_inferred__0/product10_i_128_n_0 ;
  wire \p_0_out_inferred__0/product10_i_129_n_0 ;
  wire \p_0_out_inferred__0/product10_i_130_n_0 ;
  wire \p_0_out_inferred__0/product10_i_131_n_0 ;
  wire \p_0_out_inferred__0/product10_i_132_n_0 ;
  wire \p_0_out_inferred__0/product10_i_133_n_0 ;
  wire \p_0_out_inferred__0/product10_i_134_n_0 ;
  wire \p_0_out_inferred__0/product10_i_135_n_0 ;
  wire \p_0_out_inferred__0/product10_i_136_n_0 ;
  wire \p_0_out_inferred__0/product10_i_137_n_0 ;
  wire \p_0_out_inferred__0/product10_i_138_n_0 ;
  wire \p_0_out_inferred__0/product10_i_139_n_0 ;
  wire \p_0_out_inferred__0/product10_i_13_n_0 ;
  wire \p_0_out_inferred__0/product10_i_140_n_0 ;
  wire \p_0_out_inferred__0/product10_i_141_n_0 ;
  wire \p_0_out_inferred__0/product10_i_142_n_0 ;
  wire \p_0_out_inferred__0/product10_i_143_n_0 ;
  wire \p_0_out_inferred__0/product10_i_144_n_0 ;
  wire \p_0_out_inferred__0/product10_i_145_n_0 ;
  wire \p_0_out_inferred__0/product10_i_146_n_0 ;
  wire \p_0_out_inferred__0/product10_i_147_n_0 ;
  wire \p_0_out_inferred__0/product10_i_148_n_0 ;
  wire \p_0_out_inferred__0/product10_i_149_n_0 ;
  wire \p_0_out_inferred__0/product10_i_14_n_0 ;
  wire \p_0_out_inferred__0/product10_i_150_n_0 ;
  wire \p_0_out_inferred__0/product10_i_151_n_0 ;
  wire \p_0_out_inferred__0/product10_i_152_n_0 ;
  wire \p_0_out_inferred__0/product10_i_153_n_0 ;
  wire \p_0_out_inferred__0/product10_i_154_n_0 ;
  wire \p_0_out_inferred__0/product10_i_155_n_0 ;
  wire \p_0_out_inferred__0/product10_i_156_n_0 ;
  wire \p_0_out_inferred__0/product10_i_157_n_0 ;
  wire \p_0_out_inferred__0/product10_i_158_n_0 ;
  wire \p_0_out_inferred__0/product10_i_159_n_0 ;
  wire \p_0_out_inferred__0/product10_i_15_n_0 ;
  wire \p_0_out_inferred__0/product10_i_160_n_0 ;
  wire \p_0_out_inferred__0/product10_i_161_n_0 ;
  wire \p_0_out_inferred__0/product10_i_162_n_0 ;
  wire \p_0_out_inferred__0/product10_i_163_n_0 ;
  wire \p_0_out_inferred__0/product10_i_164_n_0 ;
  wire \p_0_out_inferred__0/product10_i_165_n_0 ;
  wire \p_0_out_inferred__0/product10_i_166_n_0 ;
  wire \p_0_out_inferred__0/product10_i_167_n_0 ;
  wire \p_0_out_inferred__0/product10_i_168_n_0 ;
  wire \p_0_out_inferred__0/product10_i_169_n_0 ;
  wire \p_0_out_inferred__0/product10_i_16_n_0 ;
  wire \p_0_out_inferred__0/product10_i_170_n_0 ;
  wire \p_0_out_inferred__0/product10_i_171_n_0 ;
  wire \p_0_out_inferred__0/product10_i_172_n_0 ;
  wire \p_0_out_inferred__0/product10_i_173_n_0 ;
  wire \p_0_out_inferred__0/product10_i_174_n_0 ;
  wire \p_0_out_inferred__0/product10_i_175_n_0 ;
  wire \p_0_out_inferred__0/product10_i_176_n_0 ;
  wire \p_0_out_inferred__0/product10_i_177_n_0 ;
  wire \p_0_out_inferred__0/product10_i_178_n_0 ;
  wire \p_0_out_inferred__0/product10_i_179_n_0 ;
  wire \p_0_out_inferred__0/product10_i_17_n_0 ;
  wire \p_0_out_inferred__0/product10_i_180_n_0 ;
  wire \p_0_out_inferred__0/product10_i_181_n_0 ;
  wire \p_0_out_inferred__0/product10_i_182_n_0 ;
  wire \p_0_out_inferred__0/product10_i_183_n_0 ;
  wire \p_0_out_inferred__0/product10_i_184_n_0 ;
  wire \p_0_out_inferred__0/product10_i_185_n_0 ;
  wire \p_0_out_inferred__0/product10_i_186_n_0 ;
  wire \p_0_out_inferred__0/product10_i_187_n_0 ;
  wire \p_0_out_inferred__0/product10_i_188_n_0 ;
  wire \p_0_out_inferred__0/product10_i_189_n_0 ;
  wire \p_0_out_inferred__0/product10_i_18_n_0 ;
  wire \p_0_out_inferred__0/product10_i_190_n_0 ;
  wire \p_0_out_inferred__0/product10_i_191_n_0 ;
  wire \p_0_out_inferred__0/product10_i_192_n_0 ;
  wire \p_0_out_inferred__0/product10_i_193_n_0 ;
  wire \p_0_out_inferred__0/product10_i_194_n_0 ;
  wire \p_0_out_inferred__0/product10_i_195_n_0 ;
  wire \p_0_out_inferred__0/product10_i_196_n_0 ;
  wire \p_0_out_inferred__0/product10_i_197_n_0 ;
  wire \p_0_out_inferred__0/product10_i_198_n_0 ;
  wire \p_0_out_inferred__0/product10_i_199_n_0 ;
  wire \p_0_out_inferred__0/product10_i_19_n_0 ;
  wire \p_0_out_inferred__0/product10_i_200_n_0 ;
  wire \p_0_out_inferred__0/product10_i_201_n_0 ;
  wire \p_0_out_inferred__0/product10_i_202_n_0 ;
  wire \p_0_out_inferred__0/product10_i_203_n_0 ;
  wire \p_0_out_inferred__0/product10_i_204_n_0 ;
  wire \p_0_out_inferred__0/product10_i_205_n_0 ;
  wire \p_0_out_inferred__0/product10_i_206_n_0 ;
  wire \p_0_out_inferred__0/product10_i_207_n_0 ;
  wire \p_0_out_inferred__0/product10_i_208_n_0 ;
  wire \p_0_out_inferred__0/product10_i_209_n_0 ;
  wire \p_0_out_inferred__0/product10_i_20_n_0 ;
  wire \p_0_out_inferred__0/product10_i_210_n_0 ;
  wire \p_0_out_inferred__0/product10_i_211_n_0 ;
  wire \p_0_out_inferred__0/product10_i_212_n_0 ;
  wire \p_0_out_inferred__0/product10_i_213_n_0 ;
  wire \p_0_out_inferred__0/product10_i_214_n_0 ;
  wire \p_0_out_inferred__0/product10_i_215_n_0 ;
  wire \p_0_out_inferred__0/product10_i_216_n_0 ;
  wire \p_0_out_inferred__0/product10_i_217_n_0 ;
  wire \p_0_out_inferred__0/product10_i_218_n_0 ;
  wire \p_0_out_inferred__0/product10_i_219_n_0 ;
  wire \p_0_out_inferred__0/product10_i_21_n_0 ;
  wire \p_0_out_inferred__0/product10_i_220_n_0 ;
  wire \p_0_out_inferred__0/product10_i_221_n_0 ;
  wire \p_0_out_inferred__0/product10_i_222_n_0 ;
  wire \p_0_out_inferred__0/product10_i_223_n_0 ;
  wire \p_0_out_inferred__0/product10_i_224_n_0 ;
  wire \p_0_out_inferred__0/product10_i_225_n_0 ;
  wire \p_0_out_inferred__0/product10_i_226_n_0 ;
  wire \p_0_out_inferred__0/product10_i_227_n_0 ;
  wire \p_0_out_inferred__0/product10_i_228_n_0 ;
  wire \p_0_out_inferred__0/product10_i_229_n_0 ;
  wire \p_0_out_inferred__0/product10_i_22_n_0 ;
  wire \p_0_out_inferred__0/product10_i_230_n_0 ;
  wire \p_0_out_inferred__0/product10_i_231_n_0 ;
  wire \p_0_out_inferred__0/product10_i_232_n_0 ;
  wire \p_0_out_inferred__0/product10_i_233_n_0 ;
  wire \p_0_out_inferred__0/product10_i_234_n_0 ;
  wire \p_0_out_inferred__0/product10_i_235_n_0 ;
  wire \p_0_out_inferred__0/product10_i_236_n_0 ;
  wire \p_0_out_inferred__0/product10_i_237_n_0 ;
  wire \p_0_out_inferred__0/product10_i_238_n_0 ;
  wire \p_0_out_inferred__0/product10_i_239_n_0 ;
  wire \p_0_out_inferred__0/product10_i_23_n_0 ;
  wire \p_0_out_inferred__0/product10_i_240_n_0 ;
  wire \p_0_out_inferred__0/product10_i_241_n_0 ;
  wire \p_0_out_inferred__0/product10_i_242_n_0 ;
  wire \p_0_out_inferred__0/product10_i_243_n_0 ;
  wire \p_0_out_inferred__0/product10_i_244_n_0 ;
  wire \p_0_out_inferred__0/product10_i_245_n_0 ;
  wire \p_0_out_inferred__0/product10_i_246_n_0 ;
  wire \p_0_out_inferred__0/product10_i_247_n_0 ;
  wire \p_0_out_inferred__0/product10_i_248_n_0 ;
  wire \p_0_out_inferred__0/product10_i_249_n_0 ;
  wire \p_0_out_inferred__0/product10_i_24_n_0 ;
  wire \p_0_out_inferred__0/product10_i_250_n_0 ;
  wire \p_0_out_inferred__0/product10_i_251_n_0 ;
  wire \p_0_out_inferred__0/product10_i_252_n_0 ;
  wire \p_0_out_inferred__0/product10_i_253_n_0 ;
  wire \p_0_out_inferred__0/product10_i_254_n_0 ;
  wire \p_0_out_inferred__0/product10_i_255_n_0 ;
  wire \p_0_out_inferred__0/product10_i_256_n_0 ;
  wire \p_0_out_inferred__0/product10_i_257_n_0 ;
  wire \p_0_out_inferred__0/product10_i_258_n_0 ;
  wire \p_0_out_inferred__0/product10_i_259_n_0 ;
  wire \p_0_out_inferred__0/product10_i_25_n_0 ;
  wire \p_0_out_inferred__0/product10_i_260_n_0 ;
  wire \p_0_out_inferred__0/product10_i_261_n_0 ;
  wire \p_0_out_inferred__0/product10_i_262_n_0 ;
  wire \p_0_out_inferred__0/product10_i_263_n_0 ;
  wire \p_0_out_inferred__0/product10_i_264_n_0 ;
  wire \p_0_out_inferred__0/product10_i_265_n_0 ;
  wire \p_0_out_inferred__0/product10_i_266_n_0 ;
  wire \p_0_out_inferred__0/product10_i_267_n_0 ;
  wire \p_0_out_inferred__0/product10_i_268_n_0 ;
  wire \p_0_out_inferred__0/product10_i_269_n_0 ;
  wire \p_0_out_inferred__0/product10_i_26_n_0 ;
  wire \p_0_out_inferred__0/product10_i_270_n_0 ;
  wire \p_0_out_inferred__0/product10_i_271_n_0 ;
  wire \p_0_out_inferred__0/product10_i_272_n_0 ;
  wire \p_0_out_inferred__0/product10_i_273_n_0 ;
  wire \p_0_out_inferred__0/product10_i_274_n_0 ;
  wire \p_0_out_inferred__0/product10_i_275_n_0 ;
  wire \p_0_out_inferred__0/product10_i_276_n_0 ;
  wire \p_0_out_inferred__0/product10_i_277_n_0 ;
  wire \p_0_out_inferred__0/product10_i_278_n_0 ;
  wire \p_0_out_inferred__0/product10_i_279_n_0 ;
  wire \p_0_out_inferred__0/product10_i_27_n_0 ;
  wire \p_0_out_inferred__0/product10_i_280_n_0 ;
  wire \p_0_out_inferred__0/product10_i_281_n_0 ;
  wire \p_0_out_inferred__0/product10_i_282_n_0 ;
  wire \p_0_out_inferred__0/product10_i_283_n_0 ;
  wire \p_0_out_inferred__0/product10_i_284_n_0 ;
  wire \p_0_out_inferred__0/product10_i_285_n_0 ;
  wire \p_0_out_inferred__0/product10_i_286_n_0 ;
  wire \p_0_out_inferred__0/product10_i_287_n_0 ;
  wire \p_0_out_inferred__0/product10_i_288_n_0 ;
  wire \p_0_out_inferred__0/product10_i_289_n_0 ;
  wire \p_0_out_inferred__0/product10_i_28_n_0 ;
  wire \p_0_out_inferred__0/product10_i_290_n_0 ;
  wire \p_0_out_inferred__0/product10_i_291_n_0 ;
  wire \p_0_out_inferred__0/product10_i_292_n_0 ;
  wire \p_0_out_inferred__0/product10_i_293_n_0 ;
  wire \p_0_out_inferred__0/product10_i_294_n_0 ;
  wire \p_0_out_inferred__0/product10_i_295_n_0 ;
  wire \p_0_out_inferred__0/product10_i_296_n_0 ;
  wire \p_0_out_inferred__0/product10_i_297_n_0 ;
  wire \p_0_out_inferred__0/product10_i_298_n_0 ;
  wire \p_0_out_inferred__0/product10_i_299_n_0 ;
  wire \p_0_out_inferred__0/product10_i_29_n_0 ;
  wire \p_0_out_inferred__0/product10_i_300_n_0 ;
  wire \p_0_out_inferred__0/product10_i_301_n_0 ;
  wire \p_0_out_inferred__0/product10_i_302_n_0 ;
  wire \p_0_out_inferred__0/product10_i_303_n_0 ;
  wire \p_0_out_inferred__0/product10_i_304_n_0 ;
  wire \p_0_out_inferred__0/product10_i_305_n_0 ;
  wire \p_0_out_inferred__0/product10_i_306_n_0 ;
  wire \p_0_out_inferred__0/product10_i_307_n_0 ;
  wire \p_0_out_inferred__0/product10_i_308_n_0 ;
  wire \p_0_out_inferred__0/product10_i_309_n_0 ;
  wire \p_0_out_inferred__0/product10_i_30_n_0 ;
  wire \p_0_out_inferred__0/product10_i_310_n_0 ;
  wire \p_0_out_inferred__0/product10_i_311_n_0 ;
  wire \p_0_out_inferred__0/product10_i_312_n_0 ;
  wire \p_0_out_inferred__0/product10_i_313_n_0 ;
  wire \p_0_out_inferred__0/product10_i_314_n_0 ;
  wire \p_0_out_inferred__0/product10_i_315_n_0 ;
  wire \p_0_out_inferred__0/product10_i_316_n_0 ;
  wire \p_0_out_inferred__0/product10_i_317_n_0 ;
  wire \p_0_out_inferred__0/product10_i_318_n_0 ;
  wire \p_0_out_inferred__0/product10_i_319_n_0 ;
  wire \p_0_out_inferred__0/product10_i_31_n_0 ;
  wire \p_0_out_inferred__0/product10_i_320_n_0 ;
  wire \p_0_out_inferred__0/product10_i_321_n_0 ;
  wire \p_0_out_inferred__0/product10_i_322_n_0 ;
  wire \p_0_out_inferred__0/product10_i_323_n_0 ;
  wire \p_0_out_inferred__0/product10_i_324_n_0 ;
  wire \p_0_out_inferred__0/product10_i_325_n_0 ;
  wire \p_0_out_inferred__0/product10_i_326_n_0 ;
  wire \p_0_out_inferred__0/product10_i_327_n_0 ;
  wire \p_0_out_inferred__0/product10_i_328_n_0 ;
  wire \p_0_out_inferred__0/product10_i_329_n_0 ;
  wire \p_0_out_inferred__0/product10_i_32_n_0 ;
  wire \p_0_out_inferred__0/product10_i_330_n_0 ;
  wire \p_0_out_inferred__0/product10_i_331_n_0 ;
  wire \p_0_out_inferred__0/product10_i_332_n_0 ;
  wire \p_0_out_inferred__0/product10_i_333_n_0 ;
  wire \p_0_out_inferred__0/product10_i_335_n_0 ;
  wire \p_0_out_inferred__0/product10_i_336_n_0 ;
  wire \p_0_out_inferred__0/product10_i_337_n_0 ;
  wire \p_0_out_inferred__0/product10_i_338_n_0 ;
  wire \p_0_out_inferred__0/product10_i_339_n_0 ;
  wire \p_0_out_inferred__0/product10_i_33_n_0 ;
  wire \p_0_out_inferred__0/product10_i_340_n_0 ;
  wire \p_0_out_inferred__0/product10_i_341_n_0 ;
  wire \p_0_out_inferred__0/product10_i_342_n_0 ;
  wire \p_0_out_inferred__0/product10_i_343_n_0 ;
  wire \p_0_out_inferred__0/product10_i_344_n_0 ;
  wire \p_0_out_inferred__0/product10_i_345_n_0 ;
  wire \p_0_out_inferred__0/product10_i_346_n_0 ;
  wire \p_0_out_inferred__0/product10_i_347_n_0 ;
  wire \p_0_out_inferred__0/product10_i_348_n_0 ;
  wire \p_0_out_inferred__0/product10_i_349_n_0 ;
  wire \p_0_out_inferred__0/product10_i_34_n_0 ;
  wire \p_0_out_inferred__0/product10_i_350_n_0 ;
  wire \p_0_out_inferred__0/product10_i_351_n_0 ;
  wire \p_0_out_inferred__0/product10_i_352_n_0 ;
  wire \p_0_out_inferred__0/product10_i_353_n_0 ;
  wire \p_0_out_inferred__0/product10_i_354_n_0 ;
  wire \p_0_out_inferred__0/product10_i_355_n_0 ;
  wire \p_0_out_inferred__0/product10_i_356_n_0 ;
  wire \p_0_out_inferred__0/product10_i_357_n_0 ;
  wire \p_0_out_inferred__0/product10_i_358_n_0 ;
  wire \p_0_out_inferred__0/product10_i_359_n_0 ;
  wire \p_0_out_inferred__0/product10_i_35_n_0 ;
  wire \p_0_out_inferred__0/product10_i_360_n_0 ;
  wire \p_0_out_inferred__0/product10_i_361_n_0 ;
  wire \p_0_out_inferred__0/product10_i_362_n_0 ;
  wire \p_0_out_inferred__0/product10_i_363_n_0 ;
  wire \p_0_out_inferred__0/product10_i_364_n_0 ;
  wire \p_0_out_inferred__0/product10_i_365_n_0 ;
  wire \p_0_out_inferred__0/product10_i_366_n_0 ;
  wire \p_0_out_inferred__0/product10_i_367_n_0 ;
  wire \p_0_out_inferred__0/product10_i_368_n_0 ;
  wire \p_0_out_inferred__0/product10_i_369_n_0 ;
  wire \p_0_out_inferred__0/product10_i_36_n_0 ;
  wire \p_0_out_inferred__0/product10_i_370_n_0 ;
  wire \p_0_out_inferred__0/product10_i_371_n_0 ;
  wire \p_0_out_inferred__0/product10_i_372_n_0 ;
  wire \p_0_out_inferred__0/product10_i_373_n_0 ;
  wire \p_0_out_inferred__0/product10_i_374_n_0 ;
  wire \p_0_out_inferred__0/product10_i_375_n_0 ;
  wire \p_0_out_inferred__0/product10_i_376_n_0 ;
  wire \p_0_out_inferred__0/product10_i_377_n_0 ;
  wire \p_0_out_inferred__0/product10_i_378_n_0 ;
  wire \p_0_out_inferred__0/product10_i_379_n_0 ;
  wire \p_0_out_inferred__0/product10_i_37_n_0 ;
  wire \p_0_out_inferred__0/product10_i_380_n_0 ;
  wire \p_0_out_inferred__0/product10_i_381_n_0 ;
  wire \p_0_out_inferred__0/product10_i_382_n_0 ;
  wire \p_0_out_inferred__0/product10_i_383_n_0 ;
  wire \p_0_out_inferred__0/product10_i_384_n_0 ;
  wire \p_0_out_inferred__0/product10_i_385_n_0 ;
  wire \p_0_out_inferred__0/product10_i_386_n_0 ;
  wire \p_0_out_inferred__0/product10_i_387_n_0 ;
  wire \p_0_out_inferred__0/product10_i_388_n_0 ;
  wire \p_0_out_inferred__0/product10_i_389_n_0 ;
  wire \p_0_out_inferred__0/product10_i_38_n_0 ;
  wire \p_0_out_inferred__0/product10_i_390_n_0 ;
  wire \p_0_out_inferred__0/product10_i_391_n_0 ;
  wire \p_0_out_inferred__0/product10_i_392_n_0 ;
  wire \p_0_out_inferred__0/product10_i_393_n_0 ;
  wire \p_0_out_inferred__0/product10_i_394_n_0 ;
  wire \p_0_out_inferred__0/product10_i_395_n_0 ;
  wire \p_0_out_inferred__0/product10_i_396_n_0 ;
  wire \p_0_out_inferred__0/product10_i_397_n_0 ;
  wire \p_0_out_inferred__0/product10_i_398_n_0 ;
  wire \p_0_out_inferred__0/product10_i_399_n_0 ;
  wire \p_0_out_inferred__0/product10_i_39_n_0 ;
  wire \p_0_out_inferred__0/product10_i_400_n_0 ;
  wire \p_0_out_inferred__0/product10_i_401_n_0 ;
  wire \p_0_out_inferred__0/product10_i_402_n_0 ;
  wire \p_0_out_inferred__0/product10_i_403_n_0 ;
  wire \p_0_out_inferred__0/product10_i_404_n_0 ;
  wire \p_0_out_inferred__0/product10_i_405_n_0 ;
  wire \p_0_out_inferred__0/product10_i_406_n_0 ;
  wire \p_0_out_inferred__0/product10_i_407_n_0 ;
  wire \p_0_out_inferred__0/product10_i_408_n_0 ;
  wire \p_0_out_inferred__0/product10_i_409_n_0 ;
  wire \p_0_out_inferred__0/product10_i_40_n_0 ;
  wire \p_0_out_inferred__0/product10_i_410_n_0 ;
  wire \p_0_out_inferred__0/product10_i_411_n_0 ;
  wire \p_0_out_inferred__0/product10_i_412_n_0 ;
  wire \p_0_out_inferred__0/product10_i_413_n_0 ;
  wire \p_0_out_inferred__0/product10_i_414_n_0 ;
  wire \p_0_out_inferred__0/product10_i_415_n_0 ;
  wire \p_0_out_inferred__0/product10_i_416_n_0 ;
  wire \p_0_out_inferred__0/product10_i_417_n_0 ;
  wire \p_0_out_inferred__0/product10_i_418_n_0 ;
  wire \p_0_out_inferred__0/product10_i_419_n_0 ;
  wire \p_0_out_inferred__0/product10_i_41_n_0 ;
  wire \p_0_out_inferred__0/product10_i_420_n_0 ;
  wire \p_0_out_inferred__0/product10_i_421_n_0 ;
  wire \p_0_out_inferred__0/product10_i_422_n_0 ;
  wire \p_0_out_inferred__0/product10_i_423_n_0 ;
  wire \p_0_out_inferred__0/product10_i_424_n_0 ;
  wire \p_0_out_inferred__0/product10_i_425_n_0 ;
  wire \p_0_out_inferred__0/product10_i_426_n_0 ;
  wire \p_0_out_inferred__0/product10_i_427_n_0 ;
  wire \p_0_out_inferred__0/product10_i_428_n_0 ;
  wire \p_0_out_inferred__0/product10_i_429_n_0 ;
  wire \p_0_out_inferred__0/product10_i_42_n_0 ;
  wire \p_0_out_inferred__0/product10_i_430_n_0 ;
  wire \p_0_out_inferred__0/product10_i_431_n_0 ;
  wire \p_0_out_inferred__0/product10_i_432_n_0 ;
  wire \p_0_out_inferred__0/product10_i_433_n_0 ;
  wire \p_0_out_inferred__0/product10_i_434_n_0 ;
  wire \p_0_out_inferred__0/product10_i_435_n_0 ;
  wire \p_0_out_inferred__0/product10_i_436_n_0 ;
  wire \p_0_out_inferred__0/product10_i_437_n_0 ;
  wire \p_0_out_inferred__0/product10_i_438_n_0 ;
  wire \p_0_out_inferred__0/product10_i_439_n_0 ;
  wire \p_0_out_inferred__0/product10_i_43_n_0 ;
  wire \p_0_out_inferred__0/product10_i_440_n_0 ;
  wire \p_0_out_inferred__0/product10_i_441_n_0 ;
  wire \p_0_out_inferred__0/product10_i_442_n_0 ;
  wire \p_0_out_inferred__0/product10_i_443_n_0 ;
  wire \p_0_out_inferred__0/product10_i_444_n_0 ;
  wire \p_0_out_inferred__0/product10_i_445_n_0 ;
  wire \p_0_out_inferred__0/product10_i_446_n_0 ;
  wire \p_0_out_inferred__0/product10_i_447_n_0 ;
  wire \p_0_out_inferred__0/product10_i_448_n_0 ;
  wire \p_0_out_inferred__0/product10_i_449_n_0 ;
  wire \p_0_out_inferred__0/product10_i_44_n_0 ;
  wire \p_0_out_inferred__0/product10_i_450_n_0 ;
  wire \p_0_out_inferred__0/product10_i_451_n_0 ;
  wire \p_0_out_inferred__0/product10_i_452_n_0 ;
  wire \p_0_out_inferred__0/product10_i_453_n_0 ;
  wire \p_0_out_inferred__0/product10_i_454_n_0 ;
  wire \p_0_out_inferred__0/product10_i_455_n_0 ;
  wire \p_0_out_inferred__0/product10_i_456_n_0 ;
  wire \p_0_out_inferred__0/product10_i_457_n_0 ;
  wire \p_0_out_inferred__0/product10_i_458_n_0 ;
  wire \p_0_out_inferred__0/product10_i_459_n_0 ;
  wire \p_0_out_inferred__0/product10_i_45_n_0 ;
  wire \p_0_out_inferred__0/product10_i_460_n_0 ;
  wire \p_0_out_inferred__0/product10_i_461_n_0 ;
  wire \p_0_out_inferred__0/product10_i_462_n_0 ;
  wire \p_0_out_inferred__0/product10_i_463_n_0 ;
  wire \p_0_out_inferred__0/product10_i_464_n_0 ;
  wire \p_0_out_inferred__0/product10_i_465_n_0 ;
  wire \p_0_out_inferred__0/product10_i_466_n_0 ;
  wire \p_0_out_inferred__0/product10_i_467_n_0 ;
  wire \p_0_out_inferred__0/product10_i_468_n_0 ;
  wire \p_0_out_inferred__0/product10_i_469_n_0 ;
  wire \p_0_out_inferred__0/product10_i_46_n_0 ;
  wire \p_0_out_inferred__0/product10_i_470_n_0 ;
  wire \p_0_out_inferred__0/product10_i_471_n_0 ;
  wire \p_0_out_inferred__0/product10_i_472_n_0 ;
  wire \p_0_out_inferred__0/product10_i_473_n_0 ;
  wire \p_0_out_inferred__0/product10_i_474_n_0 ;
  wire \p_0_out_inferred__0/product10_i_475_n_0 ;
  wire \p_0_out_inferred__0/product10_i_476_n_0 ;
  wire \p_0_out_inferred__0/product10_i_477_n_0 ;
  wire \p_0_out_inferred__0/product10_i_478_n_0 ;
  wire \p_0_out_inferred__0/product10_i_479_n_0 ;
  wire \p_0_out_inferred__0/product10_i_47_n_0 ;
  wire \p_0_out_inferred__0/product10_i_480_n_0 ;
  wire \p_0_out_inferred__0/product10_i_481_n_0 ;
  wire \p_0_out_inferred__0/product10_i_482_n_0 ;
  wire \p_0_out_inferred__0/product10_i_483_n_0 ;
  wire \p_0_out_inferred__0/product10_i_484_n_0 ;
  wire \p_0_out_inferred__0/product10_i_485_n_0 ;
  wire \p_0_out_inferred__0/product10_i_486_n_0 ;
  wire \p_0_out_inferred__0/product10_i_487_n_0 ;
  wire \p_0_out_inferred__0/product10_i_488_n_0 ;
  wire \p_0_out_inferred__0/product10_i_489_n_0 ;
  wire \p_0_out_inferred__0/product10_i_48_n_0 ;
  wire \p_0_out_inferred__0/product10_i_490_n_0 ;
  wire \p_0_out_inferred__0/product10_i_491_n_0 ;
  wire \p_0_out_inferred__0/product10_i_492_n_0 ;
  wire \p_0_out_inferred__0/product10_i_493_n_0 ;
  wire \p_0_out_inferred__0/product10_i_494_n_0 ;
  wire \p_0_out_inferred__0/product10_i_495_n_0 ;
  wire \p_0_out_inferred__0/product10_i_496_n_0 ;
  wire \p_0_out_inferred__0/product10_i_497_n_0 ;
  wire \p_0_out_inferred__0/product10_i_498_n_0 ;
  wire \p_0_out_inferred__0/product10_i_499_n_0 ;
  wire \p_0_out_inferred__0/product10_i_49_n_0 ;
  wire \p_0_out_inferred__0/product10_i_500_n_0 ;
  wire \p_0_out_inferred__0/product10_i_501_n_0 ;
  wire \p_0_out_inferred__0/product10_i_502_n_0 ;
  wire \p_0_out_inferred__0/product10_i_503_n_0 ;
  wire \p_0_out_inferred__0/product10_i_504_n_0 ;
  wire \p_0_out_inferred__0/product10_i_505_n_0 ;
  wire \p_0_out_inferred__0/product10_i_506_n_0 ;
  wire \p_0_out_inferred__0/product10_i_507_n_0 ;
  wire \p_0_out_inferred__0/product10_i_508_n_0 ;
  wire \p_0_out_inferred__0/product10_i_509_n_0 ;
  wire \p_0_out_inferred__0/product10_i_50_n_0 ;
  wire \p_0_out_inferred__0/product10_i_510_n_0 ;
  wire \p_0_out_inferred__0/product10_i_511_n_0 ;
  wire \p_0_out_inferred__0/product10_i_512_n_0 ;
  wire \p_0_out_inferred__0/product10_i_513_n_0 ;
  wire \p_0_out_inferred__0/product10_i_514_n_0 ;
  wire \p_0_out_inferred__0/product10_i_515_n_0 ;
  wire \p_0_out_inferred__0/product10_i_516_n_0 ;
  wire \p_0_out_inferred__0/product10_i_517_n_0 ;
  wire \p_0_out_inferred__0/product10_i_518_n_0 ;
  wire \p_0_out_inferred__0/product10_i_519_n_0 ;
  wire \p_0_out_inferred__0/product10_i_51_n_0 ;
  wire \p_0_out_inferred__0/product10_i_520_n_0 ;
  wire \p_0_out_inferred__0/product10_i_521_n_0 ;
  wire \p_0_out_inferred__0/product10_i_522_n_0 ;
  wire \p_0_out_inferred__0/product10_i_523_n_0 ;
  wire \p_0_out_inferred__0/product10_i_524_n_0 ;
  wire \p_0_out_inferred__0/product10_i_525_n_0 ;
  wire \p_0_out_inferred__0/product10_i_526_n_0 ;
  wire \p_0_out_inferred__0/product10_i_527_n_0 ;
  wire \p_0_out_inferred__0/product10_i_528_n_0 ;
  wire \p_0_out_inferred__0/product10_i_529_n_0 ;
  wire \p_0_out_inferred__0/product10_i_52_n_0 ;
  wire \p_0_out_inferred__0/product10_i_530_n_0 ;
  wire \p_0_out_inferred__0/product10_i_531_n_0 ;
  wire \p_0_out_inferred__0/product10_i_532_n_0 ;
  wire \p_0_out_inferred__0/product10_i_533_n_0 ;
  wire \p_0_out_inferred__0/product10_i_534_n_0 ;
  wire \p_0_out_inferred__0/product10_i_535_n_0 ;
  wire \p_0_out_inferred__0/product10_i_536_n_0 ;
  wire \p_0_out_inferred__0/product10_i_537_n_0 ;
  wire \p_0_out_inferred__0/product10_i_538_n_0 ;
  wire \p_0_out_inferred__0/product10_i_539_n_0 ;
  wire \p_0_out_inferred__0/product10_i_53_n_0 ;
  wire \p_0_out_inferred__0/product10_i_540_n_0 ;
  wire \p_0_out_inferred__0/product10_i_541_n_0 ;
  wire \p_0_out_inferred__0/product10_i_542_n_0 ;
  wire \p_0_out_inferred__0/product10_i_543_n_0 ;
  wire \p_0_out_inferred__0/product10_i_544_n_0 ;
  wire \p_0_out_inferred__0/product10_i_545_n_0 ;
  wire \p_0_out_inferred__0/product10_i_546_n_0 ;
  wire \p_0_out_inferred__0/product10_i_547_n_0 ;
  wire \p_0_out_inferred__0/product10_i_548_n_0 ;
  wire \p_0_out_inferred__0/product10_i_549_n_0 ;
  wire \p_0_out_inferred__0/product10_i_54_n_0 ;
  wire \p_0_out_inferred__0/product10_i_550_n_0 ;
  wire \p_0_out_inferred__0/product10_i_551_n_0 ;
  wire \p_0_out_inferred__0/product10_i_552_n_0 ;
  wire \p_0_out_inferred__0/product10_i_553_n_0 ;
  wire \p_0_out_inferred__0/product10_i_554_n_0 ;
  wire \p_0_out_inferred__0/product10_i_555_n_0 ;
  wire \p_0_out_inferred__0/product10_i_556_n_0 ;
  wire \p_0_out_inferred__0/product10_i_557_n_0 ;
  wire \p_0_out_inferred__0/product10_i_558_n_0 ;
  wire \p_0_out_inferred__0/product10_i_559_n_0 ;
  wire \p_0_out_inferred__0/product10_i_55_n_0 ;
  wire \p_0_out_inferred__0/product10_i_560_n_0 ;
  wire \p_0_out_inferred__0/product10_i_561_n_0 ;
  wire \p_0_out_inferred__0/product10_i_562_n_0 ;
  wire \p_0_out_inferred__0/product10_i_563_n_0 ;
  wire \p_0_out_inferred__0/product10_i_564_n_0 ;
  wire \p_0_out_inferred__0/product10_i_565_n_0 ;
  wire \p_0_out_inferred__0/product10_i_566_n_0 ;
  wire \p_0_out_inferred__0/product10_i_567_n_0 ;
  wire \p_0_out_inferred__0/product10_i_568_n_0 ;
  wire \p_0_out_inferred__0/product10_i_569_n_0 ;
  wire \p_0_out_inferred__0/product10_i_56_n_0 ;
  wire \p_0_out_inferred__0/product10_i_570_n_0 ;
  wire \p_0_out_inferred__0/product10_i_571_n_0 ;
  wire \p_0_out_inferred__0/product10_i_572_n_0 ;
  wire \p_0_out_inferred__0/product10_i_573_n_0 ;
  wire \p_0_out_inferred__0/product10_i_574_n_0 ;
  wire \p_0_out_inferred__0/product10_i_575_n_0 ;
  wire \p_0_out_inferred__0/product10_i_576_n_0 ;
  wire \p_0_out_inferred__0/product10_i_577_n_0 ;
  wire \p_0_out_inferred__0/product10_i_578_n_0 ;
  wire \p_0_out_inferred__0/product10_i_579_n_0 ;
  wire \p_0_out_inferred__0/product10_i_57_n_0 ;
  wire \p_0_out_inferred__0/product10_i_580_n_0 ;
  wire \p_0_out_inferred__0/product10_i_581_n_0 ;
  wire \p_0_out_inferred__0/product10_i_582_n_0 ;
  wire \p_0_out_inferred__0/product10_i_583_n_0 ;
  wire \p_0_out_inferred__0/product10_i_584_n_0 ;
  wire \p_0_out_inferred__0/product10_i_585_n_0 ;
  wire \p_0_out_inferred__0/product10_i_586_n_0 ;
  wire \p_0_out_inferred__0/product10_i_587_n_0 ;
  wire \p_0_out_inferred__0/product10_i_588_n_0 ;
  wire \p_0_out_inferred__0/product10_i_589_n_0 ;
  wire \p_0_out_inferred__0/product10_i_58_n_0 ;
  wire \p_0_out_inferred__0/product10_i_590_n_0 ;
  wire \p_0_out_inferred__0/product10_i_591_n_0 ;
  wire \p_0_out_inferred__0/product10_i_592_n_0 ;
  wire \p_0_out_inferred__0/product10_i_593_n_0 ;
  wire \p_0_out_inferred__0/product10_i_594_n_0 ;
  wire \p_0_out_inferred__0/product10_i_595_n_0 ;
  wire \p_0_out_inferred__0/product10_i_596_n_0 ;
  wire \p_0_out_inferred__0/product10_i_597_n_0 ;
  wire \p_0_out_inferred__0/product10_i_598_n_0 ;
  wire \p_0_out_inferred__0/product10_i_599_n_0 ;
  wire \p_0_out_inferred__0/product10_i_59_n_0 ;
  wire \p_0_out_inferred__0/product10_i_600_n_0 ;
  wire \p_0_out_inferred__0/product10_i_601_n_0 ;
  wire \p_0_out_inferred__0/product10_i_602_n_0 ;
  wire \p_0_out_inferred__0/product10_i_603_n_0 ;
  wire \p_0_out_inferred__0/product10_i_604_n_0 ;
  wire \p_0_out_inferred__0/product10_i_605_n_0 ;
  wire \p_0_out_inferred__0/product10_i_606_n_0 ;
  wire \p_0_out_inferred__0/product10_i_607_n_0 ;
  wire \p_0_out_inferred__0/product10_i_608_n_0 ;
  wire \p_0_out_inferred__0/product10_i_609_n_0 ;
  wire \p_0_out_inferred__0/product10_i_60_n_0 ;
  wire \p_0_out_inferred__0/product10_i_610_n_0 ;
  wire \p_0_out_inferred__0/product10_i_611_n_0 ;
  wire \p_0_out_inferred__0/product10_i_612_n_0 ;
  wire \p_0_out_inferred__0/product10_i_613_n_0 ;
  wire \p_0_out_inferred__0/product10_i_614_n_0 ;
  wire \p_0_out_inferred__0/product10_i_615_n_0 ;
  wire \p_0_out_inferred__0/product10_i_616_n_0 ;
  wire \p_0_out_inferred__0/product10_i_617_n_0 ;
  wire \p_0_out_inferred__0/product10_i_618_n_0 ;
  wire \p_0_out_inferred__0/product10_i_619_n_0 ;
  wire \p_0_out_inferred__0/product10_i_61_n_0 ;
  wire \p_0_out_inferred__0/product10_i_620_n_0 ;
  wire \p_0_out_inferred__0/product10_i_621_n_0 ;
  wire \p_0_out_inferred__0/product10_i_622_n_0 ;
  wire \p_0_out_inferred__0/product10_i_623_n_0 ;
  wire \p_0_out_inferred__0/product10_i_624_n_0 ;
  wire \p_0_out_inferred__0/product10_i_625_n_0 ;
  wire \p_0_out_inferred__0/product10_i_626_n_0 ;
  wire \p_0_out_inferred__0/product10_i_627_n_0 ;
  wire \p_0_out_inferred__0/product10_i_628_n_0 ;
  wire \p_0_out_inferred__0/product10_i_629_n_0 ;
  wire \p_0_out_inferred__0/product10_i_62_n_0 ;
  wire \p_0_out_inferred__0/product10_i_630_n_0 ;
  wire \p_0_out_inferred__0/product10_i_631_n_0 ;
  wire \p_0_out_inferred__0/product10_i_632_n_0 ;
  wire \p_0_out_inferred__0/product10_i_633_n_0 ;
  wire \p_0_out_inferred__0/product10_i_634_n_0 ;
  wire \p_0_out_inferred__0/product10_i_635_n_0 ;
  wire \p_0_out_inferred__0/product10_i_636_n_0 ;
  wire \p_0_out_inferred__0/product10_i_637_n_0 ;
  wire \p_0_out_inferred__0/product10_i_638_n_0 ;
  wire \p_0_out_inferred__0/product10_i_639_n_0 ;
  wire \p_0_out_inferred__0/product10_i_63_n_0 ;
  wire \p_0_out_inferred__0/product10_i_640_n_0 ;
  wire \p_0_out_inferred__0/product10_i_641_n_0 ;
  wire \p_0_out_inferred__0/product10_i_642_n_0 ;
  wire \p_0_out_inferred__0/product10_i_643_n_0 ;
  wire \p_0_out_inferred__0/product10_i_644_n_0 ;
  wire \p_0_out_inferred__0/product10_i_645_n_0 ;
  wire \p_0_out_inferred__0/product10_i_646_n_0 ;
  wire \p_0_out_inferred__0/product10_i_647_n_0 ;
  wire \p_0_out_inferred__0/product10_i_648_n_0 ;
  wire \p_0_out_inferred__0/product10_i_649_n_0 ;
  wire \p_0_out_inferred__0/product10_i_64_n_0 ;
  wire \p_0_out_inferred__0/product10_i_650_n_0 ;
  wire \p_0_out_inferred__0/product10_i_651_n_0 ;
  wire \p_0_out_inferred__0/product10_i_652_n_0 ;
  wire \p_0_out_inferred__0/product10_i_653_n_0 ;
  wire \p_0_out_inferred__0/product10_i_654_n_0 ;
  wire \p_0_out_inferred__0/product10_i_655_n_0 ;
  wire \p_0_out_inferred__0/product10_i_656_n_0 ;
  wire \p_0_out_inferred__0/product10_i_657_n_0 ;
  wire \p_0_out_inferred__0/product10_i_658_n_0 ;
  wire \p_0_out_inferred__0/product10_i_659_n_0 ;
  wire \p_0_out_inferred__0/product10_i_65_n_0 ;
  wire \p_0_out_inferred__0/product10_i_660_n_0 ;
  wire \p_0_out_inferred__0/product10_i_661_n_0 ;
  wire \p_0_out_inferred__0/product10_i_662_n_0 ;
  wire \p_0_out_inferred__0/product10_i_663_n_0 ;
  wire \p_0_out_inferred__0/product10_i_664_n_0 ;
  wire \p_0_out_inferred__0/product10_i_665_n_0 ;
  wire \p_0_out_inferred__0/product10_i_666_n_0 ;
  wire \p_0_out_inferred__0/product10_i_667_n_0 ;
  wire \p_0_out_inferred__0/product10_i_668_n_0 ;
  wire \p_0_out_inferred__0/product10_i_669_n_0 ;
  wire \p_0_out_inferred__0/product10_i_66_n_0 ;
  wire \p_0_out_inferred__0/product10_i_670_n_0 ;
  wire \p_0_out_inferred__0/product10_i_671_n_0 ;
  wire \p_0_out_inferred__0/product10_i_672_n_0 ;
  wire \p_0_out_inferred__0/product10_i_673_n_0 ;
  wire \p_0_out_inferred__0/product10_i_674_n_0 ;
  wire \p_0_out_inferred__0/product10_i_675_n_0 ;
  wire \p_0_out_inferred__0/product10_i_676_n_0 ;
  wire \p_0_out_inferred__0/product10_i_677_n_0 ;
  wire \p_0_out_inferred__0/product10_i_678_n_0 ;
  wire \p_0_out_inferred__0/product10_i_679_n_0 ;
  wire \p_0_out_inferred__0/product10_i_67_n_0 ;
  wire \p_0_out_inferred__0/product10_i_680_n_0 ;
  wire \p_0_out_inferred__0/product10_i_681_n_0 ;
  wire \p_0_out_inferred__0/product10_i_682_n_0 ;
  wire \p_0_out_inferred__0/product10_i_683_n_0 ;
  wire \p_0_out_inferred__0/product10_i_684_n_0 ;
  wire \p_0_out_inferred__0/product10_i_685_n_0 ;
  wire \p_0_out_inferred__0/product10_i_686_n_0 ;
  wire \p_0_out_inferred__0/product10_i_687_n_0 ;
  wire \p_0_out_inferred__0/product10_i_688_n_0 ;
  wire \p_0_out_inferred__0/product10_i_689_n_0 ;
  wire \p_0_out_inferred__0/product10_i_68_n_0 ;
  wire \p_0_out_inferred__0/product10_i_690_n_0 ;
  wire \p_0_out_inferred__0/product10_i_691_n_0 ;
  wire \p_0_out_inferred__0/product10_i_692_n_0 ;
  wire \p_0_out_inferred__0/product10_i_693_n_0 ;
  wire \p_0_out_inferred__0/product10_i_694_n_0 ;
  wire \p_0_out_inferred__0/product10_i_695_n_0 ;
  wire \p_0_out_inferred__0/product10_i_696_n_0 ;
  wire \p_0_out_inferred__0/product10_i_697_n_0 ;
  wire \p_0_out_inferred__0/product10_i_698_n_0 ;
  wire \p_0_out_inferred__0/product10_i_699_n_0 ;
  wire \p_0_out_inferred__0/product10_i_69_n_0 ;
  wire \p_0_out_inferred__0/product10_i_700_n_0 ;
  wire \p_0_out_inferred__0/product10_i_701_n_0 ;
  wire \p_0_out_inferred__0/product10_i_702_n_0 ;
  wire \p_0_out_inferred__0/product10_i_703_n_0 ;
  wire \p_0_out_inferred__0/product10_i_704_n_0 ;
  wire \p_0_out_inferred__0/product10_i_705_n_0 ;
  wire \p_0_out_inferred__0/product10_i_706_n_0 ;
  wire \p_0_out_inferred__0/product10_i_707_n_0 ;
  wire \p_0_out_inferred__0/product10_i_708_n_0 ;
  wire \p_0_out_inferred__0/product10_i_709_n_0 ;
  wire \p_0_out_inferred__0/product10_i_70_n_0 ;
  wire \p_0_out_inferred__0/product10_i_710_n_0 ;
  wire \p_0_out_inferred__0/product10_i_711_n_0 ;
  wire \p_0_out_inferred__0/product10_i_712_n_0 ;
  wire \p_0_out_inferred__0/product10_i_713_n_0 ;
  wire \p_0_out_inferred__0/product10_i_714_n_0 ;
  wire \p_0_out_inferred__0/product10_i_715_n_0 ;
  wire \p_0_out_inferred__0/product10_i_716_n_0 ;
  wire \p_0_out_inferred__0/product10_i_717_n_0 ;
  wire \p_0_out_inferred__0/product10_i_718_n_0 ;
  wire \p_0_out_inferred__0/product10_i_719_n_0 ;
  wire \p_0_out_inferred__0/product10_i_71_n_0 ;
  wire \p_0_out_inferred__0/product10_i_720_n_0 ;
  wire \p_0_out_inferred__0/product10_i_721_n_0 ;
  wire \p_0_out_inferred__0/product10_i_722_n_0 ;
  wire \p_0_out_inferred__0/product10_i_723_n_0 ;
  wire \p_0_out_inferred__0/product10_i_724_n_0 ;
  wire \p_0_out_inferred__0/product10_i_725_n_0 ;
  wire \p_0_out_inferred__0/product10_i_726_n_0 ;
  wire \p_0_out_inferred__0/product10_i_727_n_0 ;
  wire \p_0_out_inferred__0/product10_i_728_n_0 ;
  wire \p_0_out_inferred__0/product10_i_729_n_0 ;
  wire \p_0_out_inferred__0/product10_i_72_n_0 ;
  wire \p_0_out_inferred__0/product10_i_730_n_0 ;
  wire \p_0_out_inferred__0/product10_i_731_n_0 ;
  wire \p_0_out_inferred__0/product10_i_732_n_0 ;
  wire \p_0_out_inferred__0/product10_i_733_n_0 ;
  wire \p_0_out_inferred__0/product10_i_734_n_0 ;
  wire \p_0_out_inferred__0/product10_i_735_n_0 ;
  wire \p_0_out_inferred__0/product10_i_736_n_0 ;
  wire \p_0_out_inferred__0/product10_i_737_n_0 ;
  wire \p_0_out_inferred__0/product10_i_738_n_0 ;
  wire \p_0_out_inferred__0/product10_i_739_n_0 ;
  wire \p_0_out_inferred__0/product10_i_73_n_0 ;
  wire \p_0_out_inferred__0/product10_i_740_n_0 ;
  wire \p_0_out_inferred__0/product10_i_74_n_0 ;
  wire \p_0_out_inferred__0/product10_i_75_n_0 ;
  wire \p_0_out_inferred__0/product10_i_76_n_0 ;
  wire \p_0_out_inferred__0/product10_i_77_n_0 ;
  wire \p_0_out_inferred__0/product10_i_78_n_0 ;
  wire \p_0_out_inferred__0/product10_i_79_n_0 ;
  wire \p_0_out_inferred__0/product10_i_80_n_0 ;
  wire \p_0_out_inferred__0/product10_i_81_n_0 ;
  wire \p_0_out_inferred__0/product10_i_82_n_0 ;
  wire \p_0_out_inferred__0/product10_i_83_n_0 ;
  wire \p_0_out_inferred__0/product10_i_84_n_0 ;
  wire \p_0_out_inferred__0/product10_i_85_n_0 ;
  wire \p_0_out_inferred__0/product10_i_86_n_0 ;
  wire \p_0_out_inferred__0/product10_i_87_n_0 ;
  wire \p_0_out_inferred__0/product10_i_88_n_0 ;
  wire \p_0_out_inferred__0/product10_i_89_n_0 ;
  wire \p_0_out_inferred__0/product10_i_90_n_0 ;
  wire \p_0_out_inferred__0/product10_i_91_n_0 ;
  wire \p_0_out_inferred__0/product10_i_92_n_0 ;
  wire \p_0_out_inferred__0/product10_i_93_n_0 ;
  wire \p_0_out_inferred__0/product10_i_94_n_0 ;
  wire \p_0_out_inferred__0/product10_i_95_n_0 ;
  wire \p_0_out_inferred__0/product10_i_96_n_0 ;
  wire \p_0_out_inferred__0/product10_i_97_n_0 ;
  wire \p_0_out_inferred__0/product10_i_98_n_0 ;
  wire \p_0_out_inferred__0/product10_i_99_n_0 ;
  wire [11:0]p_1_in;
  wire [31:0]phase_accumulator;
  wire \phase_accumulator[11]_i_2_n_0 ;
  wire \phase_accumulator[11]_i_3_n_0 ;
  wire \phase_accumulator[11]_i_4_n_0 ;
  wire \phase_accumulator[11]_i_5_n_0 ;
  wire \phase_accumulator[11]_i_6_n_0 ;
  wire \phase_accumulator[11]_i_7_n_0 ;
  wire \phase_accumulator[11]_i_8_n_0 ;
  wire \phase_accumulator[11]_i_9_n_0 ;
  wire \phase_accumulator[15]_i_2_n_0 ;
  wire \phase_accumulator[15]_i_3_n_0 ;
  wire \phase_accumulator[15]_i_4_n_0 ;
  wire \phase_accumulator[15]_i_5_n_0 ;
  wire \phase_accumulator[15]_i_6_n_0 ;
  wire \phase_accumulator[15]_i_7_n_0 ;
  wire \phase_accumulator[15]_i_8_n_0 ;
  wire \phase_accumulator[15]_i_9_n_0 ;
  wire \phase_accumulator[19]_i_2_n_0 ;
  wire \phase_accumulator[19]_i_3_n_0 ;
  wire \phase_accumulator[19]_i_4_n_0 ;
  wire \phase_accumulator[19]_i_5_n_0 ;
  wire \phase_accumulator[19]_i_6_n_0 ;
  wire \phase_accumulator[19]_i_7_n_0 ;
  wire \phase_accumulator[19]_i_8_n_0 ;
  wire \phase_accumulator[19]_i_9_n_0 ;
  wire \phase_accumulator[23]_i_2_n_0 ;
  wire \phase_accumulator[23]_i_3_n_0 ;
  wire \phase_accumulator[23]_i_4_n_0 ;
  wire \phase_accumulator[23]_i_5_n_0 ;
  wire \phase_accumulator[23]_i_6_n_0 ;
  wire \phase_accumulator[23]_i_7_n_0 ;
  wire \phase_accumulator[23]_i_8_n_0 ;
  wire \phase_accumulator[23]_i_9_n_0 ;
  wire \phase_accumulator[27]_i_2_n_0 ;
  wire \phase_accumulator[27]_i_3_n_0 ;
  wire \phase_accumulator[27]_i_4_n_0 ;
  wire \phase_accumulator[27]_i_5_n_0 ;
  wire \phase_accumulator[27]_i_6_n_0 ;
  wire \phase_accumulator[27]_i_7_n_0 ;
  wire \phase_accumulator[27]_i_8_n_0 ;
  wire \phase_accumulator[27]_i_9_n_0 ;
  wire \phase_accumulator[31]_i_3_n_0 ;
  wire \phase_accumulator[31]_i_4_n_0 ;
  wire \phase_accumulator[31]_i_5_n_0 ;
  wire \phase_accumulator[31]_i_6_n_0 ;
  wire \phase_accumulator[31]_i_7_n_0 ;
  wire \phase_accumulator[31]_i_8_n_0 ;
  wire \phase_accumulator[31]_i_9_n_0 ;
  wire \phase_accumulator[3]_i_2_n_0 ;
  wire \phase_accumulator[3]_i_3_n_0 ;
  wire \phase_accumulator[3]_i_4_n_0 ;
  wire \phase_accumulator[3]_i_5_n_0 ;
  wire \phase_accumulator[3]_i_6_n_0 ;
  wire \phase_accumulator[3]_i_7_n_0 ;
  wire \phase_accumulator[3]_i_8_n_0 ;
  wire \phase_accumulator[3]_i_9_n_0 ;
  wire \phase_accumulator[7]_i_2_n_0 ;
  wire \phase_accumulator[7]_i_3_n_0 ;
  wire \phase_accumulator[7]_i_4_n_0 ;
  wire \phase_accumulator[7]_i_5_n_0 ;
  wire \phase_accumulator[7]_i_6_n_0 ;
  wire \phase_accumulator[7]_i_7_n_0 ;
  wire \phase_accumulator[7]_i_8_n_0 ;
  wire \phase_accumulator[7]_i_9_n_0 ;
  wire \phase_accumulator_reg[11]_i_1_n_0 ;
  wire \phase_accumulator_reg[11]_i_1_n_1 ;
  wire \phase_accumulator_reg[11]_i_1_n_2 ;
  wire \phase_accumulator_reg[11]_i_1_n_3 ;
  wire \phase_accumulator_reg[11]_i_1_n_4 ;
  wire \phase_accumulator_reg[11]_i_1_n_5 ;
  wire \phase_accumulator_reg[11]_i_1_n_6 ;
  wire \phase_accumulator_reg[11]_i_1_n_7 ;
  wire \phase_accumulator_reg[15]_i_1_n_0 ;
  wire \phase_accumulator_reg[15]_i_1_n_1 ;
  wire \phase_accumulator_reg[15]_i_1_n_2 ;
  wire \phase_accumulator_reg[15]_i_1_n_3 ;
  wire \phase_accumulator_reg[15]_i_1_n_4 ;
  wire \phase_accumulator_reg[15]_i_1_n_5 ;
  wire \phase_accumulator_reg[15]_i_1_n_6 ;
  wire \phase_accumulator_reg[15]_i_1_n_7 ;
  wire \phase_accumulator_reg[19]_i_1_n_0 ;
  wire \phase_accumulator_reg[19]_i_1_n_1 ;
  wire \phase_accumulator_reg[19]_i_1_n_2 ;
  wire \phase_accumulator_reg[19]_i_1_n_3 ;
  wire \phase_accumulator_reg[19]_i_1_n_4 ;
  wire \phase_accumulator_reg[19]_i_1_n_5 ;
  wire \phase_accumulator_reg[19]_i_1_n_6 ;
  wire \phase_accumulator_reg[19]_i_1_n_7 ;
  wire \phase_accumulator_reg[23]_i_1_n_0 ;
  wire \phase_accumulator_reg[23]_i_1_n_1 ;
  wire \phase_accumulator_reg[23]_i_1_n_2 ;
  wire \phase_accumulator_reg[23]_i_1_n_3 ;
  wire \phase_accumulator_reg[23]_i_1_n_4 ;
  wire \phase_accumulator_reg[23]_i_1_n_5 ;
  wire \phase_accumulator_reg[23]_i_1_n_6 ;
  wire \phase_accumulator_reg[23]_i_1_n_7 ;
  wire \phase_accumulator_reg[27]_i_1_n_0 ;
  wire \phase_accumulator_reg[27]_i_1_n_1 ;
  wire \phase_accumulator_reg[27]_i_1_n_2 ;
  wire \phase_accumulator_reg[27]_i_1_n_3 ;
  wire \phase_accumulator_reg[27]_i_1_n_4 ;
  wire \phase_accumulator_reg[27]_i_1_n_5 ;
  wire \phase_accumulator_reg[27]_i_1_n_6 ;
  wire \phase_accumulator_reg[27]_i_1_n_7 ;
  wire [0:0]\phase_accumulator_reg[31]_0 ;
  wire \phase_accumulator_reg[31]_i_2_n_1 ;
  wire \phase_accumulator_reg[31]_i_2_n_2 ;
  wire \phase_accumulator_reg[31]_i_2_n_3 ;
  wire \phase_accumulator_reg[31]_i_2_n_4 ;
  wire \phase_accumulator_reg[31]_i_2_n_5 ;
  wire \phase_accumulator_reg[31]_i_2_n_6 ;
  wire \phase_accumulator_reg[31]_i_2_n_7 ;
  wire \phase_accumulator_reg[3]_i_1_n_0 ;
  wire \phase_accumulator_reg[3]_i_1_n_1 ;
  wire \phase_accumulator_reg[3]_i_1_n_2 ;
  wire \phase_accumulator_reg[3]_i_1_n_3 ;
  wire \phase_accumulator_reg[3]_i_1_n_4 ;
  wire \phase_accumulator_reg[3]_i_1_n_5 ;
  wire \phase_accumulator_reg[3]_i_1_n_6 ;
  wire \phase_accumulator_reg[3]_i_1_n_7 ;
  wire \phase_accumulator_reg[7]_i_1_n_0 ;
  wire \phase_accumulator_reg[7]_i_1_n_1 ;
  wire \phase_accumulator_reg[7]_i_1_n_2 ;
  wire \phase_accumulator_reg[7]_i_1_n_3 ;
  wire \phase_accumulator_reg[7]_i_1_n_4 ;
  wire \phase_accumulator_reg[7]_i_1_n_5 ;
  wire \phase_accumulator_reg[7]_i_1_n_6 ;
  wire \phase_accumulator_reg[7]_i_1_n_7 ;
  wire [31:0]phase_offset;
  wire [24:0]product1;
  wire product10_i_334_n_0;
  wire product10_n_100;
  wire product10_n_101;
  wire product10_n_102;
  wire product10_n_103;
  wire product10_n_104;
  wire product10_n_105;
  wire product10_n_81;
  wire product10_n_82;
  wire product10_n_83;
  wire product10_n_84;
  wire product10_n_85;
  wire product10_n_86;
  wire product10_n_87;
  wire product10_n_88;
  wire product10_n_89;
  wire product10_n_90;
  wire product10_n_91;
  wire product10_n_92;
  wire product10_n_93;
  wire product10_n_94;
  wire product10_n_95;
  wire product10_n_96;
  wire product10_n_97;
  wire product10_n_98;
  wire product10_n_99;
  wire reference_config_ftw0;
  wire [31:0]reference_ftw;
  wire reference_inverted;
  wire [31:0]reference_phase;
  wire [31:0]reference_tag;
  wire reference_valid;
  wire [0:0]reference_valid_0;
  wire sample_active_reg_0;
  wire sample_clipped_i_1_n_0;
  wire [0:0]sample_clipped_reg_0;
  wire sample_clk;
  wire [0:0]\sample_code_reg[0]_0 ;
  wire [11:0]\sample_code_reg[11]_0 ;
  wire sample_initialized;
  wire sample_pending;
  wire [31:0]sample_pending1_carry__1;
  wire [0:0]sample_pending_reg;
  wire \sample_phase[31]_i_1_n_0 ;
  wire sample_resetn;
  wire sample_resetn_0;
  wire [3:0]\sample_tag_pending_reg[23] ;
  wire [2:0]\sample_tag_pending_reg[31] ;
  wire sample_valid;
  wire sample_valid_reg_0;
  wire scaled_sample0;
  wire scaled_sample1_carry__0_i_5_n_0;
  wire scaled_sample1_carry__0_i_6_n_0;
  wire scaled_sample1_carry__0_i_7_n_0;
  wire scaled_sample1_carry__0_i_8_n_0;
  wire scaled_sample1_carry__0_n_0;
  wire scaled_sample1_carry__0_n_1;
  wire scaled_sample1_carry__0_n_2;
  wire scaled_sample1_carry__0_n_3;
  wire scaled_sample1_carry__1_0;
  wire scaled_sample1_carry__1_i_1_n_0;
  wire scaled_sample1_carry__1_i_5_n_0;
  wire scaled_sample1_carry__1_i_6_n_0;
  wire scaled_sample1_carry__1_i_7_n_0;
  wire scaled_sample1_carry__1_i_8_n_0;
  wire scaled_sample1_carry__1_n_0;
  wire scaled_sample1_carry__1_n_1;
  wire scaled_sample1_carry__1_n_2;
  wire scaled_sample1_carry__1_n_3;
  wire scaled_sample1_carry__1_n_4;
  wire scaled_sample1_carry__2_i_5_n_0;
  wire scaled_sample1_carry__2_i_6_n_0;
  wire scaled_sample1_carry__2_i_7_n_0;
  wire scaled_sample1_carry__2_i_8_n_0;
  wire scaled_sample1_carry__2_n_0;
  wire scaled_sample1_carry__2_n_1;
  wire scaled_sample1_carry__2_n_2;
  wire scaled_sample1_carry__2_n_3;
  wire scaled_sample1_carry__2_n_4;
  wire scaled_sample1_carry__2_n_5;
  wire scaled_sample1_carry__2_n_6;
  wire scaled_sample1_carry__2_n_7;
  wire scaled_sample1_carry__3_i_5_n_0;
  wire scaled_sample1_carry__3_i_6_n_0;
  wire scaled_sample1_carry__3_i_7_n_0;
  wire scaled_sample1_carry__3_i_8_n_0;
  wire scaled_sample1_carry__3_n_0;
  wire scaled_sample1_carry__3_n_1;
  wire scaled_sample1_carry__3_n_2;
  wire scaled_sample1_carry__3_n_3;
  wire scaled_sample1_carry__3_n_4;
  wire scaled_sample1_carry__3_n_5;
  wire scaled_sample1_carry__3_n_6;
  wire scaled_sample1_carry__3_n_7;
  wire scaled_sample1_carry__4_i_5_n_0;
  wire scaled_sample1_carry__4_i_6_n_0;
  wire scaled_sample1_carry__4_i_7_n_0;
  wire scaled_sample1_carry__4_i_8_n_0;
  wire scaled_sample1_carry__4_n_0;
  wire scaled_sample1_carry__4_n_1;
  wire scaled_sample1_carry__4_n_2;
  wire scaled_sample1_carry__4_n_3;
  wire scaled_sample1_carry__4_n_4;
  wire scaled_sample1_carry__4_n_5;
  wire scaled_sample1_carry__4_n_6;
  wire scaled_sample1_carry__4_n_7;
  wire scaled_sample1_carry__5_i_1_n_0;
  wire scaled_sample1_carry_i_5_n_0;
  wire scaled_sample1_carry_i_6_n_0;
  wire scaled_sample1_carry_i_7_n_0;
  wire scaled_sample1_carry_i_8_n_0;
  wire scaled_sample1_carry_n_0;
  wire scaled_sample1_carry_n_1;
  wire scaled_sample1_carry_n_2;
  wire scaled_sample1_carry_n_3;
  wire [11:0]sel;
  wire [31:0]tag0;
  wire [31:0]tag1;
  wire [31:0]tag2;
  wire [15:0]unbounded_code;
  wire unbounded_code_carry__0_i_1_n_0;
  wire unbounded_code_carry__0_i_2_n_0;
  wire unbounded_code_carry__0_i_3_n_0;
  wire unbounded_code_carry__0_i_4_n_0;
  wire unbounded_code_carry__0_n_0;
  wire unbounded_code_carry__0_n_1;
  wire unbounded_code_carry__0_n_2;
  wire unbounded_code_carry__0_n_3;
  wire unbounded_code_carry__1_i_1_n_0;
  wire unbounded_code_carry__1_i_2_n_0;
  wire unbounded_code_carry__1_i_3_n_0;
  wire unbounded_code_carry__1_i_4_n_0;
  wire unbounded_code_carry__1_n_0;
  wire unbounded_code_carry__1_n_1;
  wire unbounded_code_carry__1_n_2;
  wire unbounded_code_carry__1_n_3;
  wire unbounded_code_carry__2_n_2;
  wire unbounded_code_carry__2_n_3;
  wire unbounded_code_carry_i_1_n_0;
  wire unbounded_code_carry_i_2_n_0;
  wire unbounded_code_carry_i_3_n_0;
  wire unbounded_code_carry_i_4_n_0;
  wire unbounded_code_carry_n_0;
  wire unbounded_code_carry_n_1;
  wire unbounded_code_carry_n_2;
  wire unbounded_code_carry_n_3;
  wire v0;
  wire v1;
  wire v12_out;
  wire v2;
  wire v21_out;
  wire [3:2]NLW_bounded_code2_carry_CO_UNCONNECTED;
  wire [3:0]NLW_bounded_code2_carry_O_UNCONNECTED;
  wire [3:3]\NLW_p0_reg[31]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_phase_accumulator_reg[31]_i_2_CO_UNCONNECTED ;
  wire NLW_product10_CARRYCASCOUT_UNCONNECTED;
  wire NLW_product10_MULTSIGNOUT_UNCONNECTED;
  wire NLW_product10_OVERFLOW_UNCONNECTED;
  wire NLW_product10_PATTERNBDETECT_UNCONNECTED;
  wire NLW_product10_PATTERNDETECT_UNCONNECTED;
  wire NLW_product10_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_product10_ACOUT_UNCONNECTED;
  wire [17:0]NLW_product10_BCOUT_UNCONNECTED;
  wire [3:0]NLW_product10_CARRYOUT_UNCONNECTED;
  wire [47:25]NLW_product10_P_UNCONNECTED;
  wire [47:0]NLW_product10_PCOUT_UNCONNECTED;
  wire [3:0]NLW_scaled_sample1_carry_O_UNCONNECTED;
  wire [3:0]NLW_scaled_sample1_carry__0_O_UNCONNECTED;
  wire [2:0]NLW_scaled_sample1_carry__1_O_UNCONNECTED;
  wire [3:0]NLW_scaled_sample1_carry__5_CO_UNCONNECTED;
  wire [3:1]NLW_scaled_sample1_carry__5_O_UNCONNECTED;
  wire [3:2]NLW_unbounded_code_carry__2_CO_UNCONNECTED;
  wire [3:3]NLW_unbounded_code_carry__2_O_UNCONNECTED;

  LUT2 #(
    .INIT(4'h7)) 
    acknowledged_i_2
       (.I0(sample_resetn),
        .I1(control_resetn),
        .O(sample_resetn_0));
  FDCE active_enable_reg
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[88]),
        .Q(active_enable));
  FDCE active_invert_reg
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[89]),
        .Q(reference_inverted));
  FDCE \active_tag_reg[0] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[90]),
        .Q(active_tag[0]));
  FDCE \active_tag_reg[10] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[100]),
        .Q(active_tag[10]));
  FDCE \active_tag_reg[11] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[101]),
        .Q(active_tag[11]));
  FDCE \active_tag_reg[12] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[102]),
        .Q(active_tag[12]));
  FDCE \active_tag_reg[13] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[103]),
        .Q(active_tag[13]));
  FDCE \active_tag_reg[14] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[104]),
        .Q(active_tag[14]));
  FDCE \active_tag_reg[15] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[105]),
        .Q(active_tag[15]));
  FDCE \active_tag_reg[16] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[106]),
        .Q(active_tag[16]));
  FDCE \active_tag_reg[17] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[107]),
        .Q(active_tag[17]));
  FDCE \active_tag_reg[18] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[108]),
        .Q(active_tag[18]));
  FDCE \active_tag_reg[19] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[109]),
        .Q(active_tag[19]));
  FDCE \active_tag_reg[1] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[91]),
        .Q(active_tag[1]));
  FDCE \active_tag_reg[20] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[110]),
        .Q(active_tag[20]));
  FDCE \active_tag_reg[21] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[111]),
        .Q(active_tag[21]));
  FDCE \active_tag_reg[22] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[112]),
        .Q(active_tag[22]));
  FDCE \active_tag_reg[23] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[113]),
        .Q(active_tag[23]));
  FDCE \active_tag_reg[24] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[114]),
        .Q(active_tag[24]));
  FDCE \active_tag_reg[25] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[115]),
        .Q(active_tag[25]));
  FDCE \active_tag_reg[26] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[116]),
        .Q(active_tag[26]));
  FDCE \active_tag_reg[27] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[117]),
        .Q(active_tag[27]));
  FDCE \active_tag_reg[28] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[118]),
        .Q(active_tag[28]));
  FDCE \active_tag_reg[29] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[119]),
        .Q(active_tag[29]));
  FDCE \active_tag_reg[2] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[92]),
        .Q(active_tag[2]));
  FDCE \active_tag_reg[30] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[120]),
        .Q(active_tag[30]));
  FDCE \active_tag_reg[31] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[121]),
        .Q(active_tag[31]));
  FDCE \active_tag_reg[3] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[93]),
        .Q(active_tag[3]));
  FDCE \active_tag_reg[4] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[94]),
        .Q(active_tag[4]));
  FDCE \active_tag_reg[5] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[95]),
        .Q(active_tag[5]));
  FDCE \active_tag_reg[6] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[96]),
        .Q(active_tag[6]));
  FDCE \active_tag_reg[7] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[97]),
        .Q(active_tag[7]));
  FDCE \active_tag_reg[8] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[98]),
        .Q(active_tag[8]));
  FDCE \active_tag_reg[9] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[99]),
        .Q(active_tag[9]));
  LUT6 #(
    .INIT(64'h5545555510001000)) 
    awaiting_sample_i_1
       (.I0(awaiting_sample_reg_0),
        .I1(D[1]),
        .I2(sample_pending),
        .I3(cfg_accepted),
        .I4(awaiting_sample_i_2_n_0),
        .I5(awaiting_sample_reg),
        .O(cfg_rejected_reg_0));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'h80)) 
    awaiting_sample_i_2
       (.I0(awaiting_sample_reg),
        .I1(CO),
        .I2(sample_valid),
        .O(awaiting_sample_i_2_n_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 bounded_code2_carry
       (.CI(1'b0),
        .CO({NLW_bounded_code2_carry_CO_UNCONNECTED[3:2],bounded_code2_carry_n_2,bounded_code2_carry_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,bounded_code2_carry_i_1_n_0}),
        .O(NLW_bounded_code2_carry_O_UNCONNECTED[3:0]),
        .S({1'b0,1'b0,bounded_code2_carry_i_2_n_0,bounded_code2_carry_i_3_n_0}));
  LUT2 #(
    .INIT(4'hE)) 
    bounded_code2_carry_i_1
       (.I0(\code2_reg_n_0_[13] ),
        .I1(\code2_reg_n_0_[12] ),
        .O(bounded_code2_carry_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    bounded_code2_carry_i_2
       (.I0(\code2_reg_n_0_[15] ),
        .O(bounded_code2_carry_i_2_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    bounded_code2_carry_i_3
       (.I0(\code2_reg_n_0_[12] ),
        .I1(\code2_reg_n_0_[13] ),
        .O(bounded_code2_carry_i_3_n_0));
  FDCE cfg_accepted_reg
       (.C(sample_clk),
        .CE(1'b1),
        .CLR(sample_resetn_0),
        .D(reference_config_ftw0),
        .Q(cfg_accepted));
  FDCE cfg_rejected_reg
       (.C(sample_clk),
        .CE(1'b1),
        .CLR(sample_resetn_0),
        .D(cfg_rejected0),
        .Q(D[1]));
  FDCE \code2_reg[0] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(unbounded_code[0]),
        .Q(\code2_reg_n_0_[0] ));
  FDCE \code2_reg[10] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(unbounded_code[10]),
        .Q(\code2_reg_n_0_[10] ));
  FDPE \code2_reg[11] 
       (.C(sample_clk),
        .CE(E),
        .D(unbounded_code[11]),
        .PRE(sample_resetn_0),
        .Q(\code2_reg_n_0_[11] ));
  FDCE \code2_reg[12] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(unbounded_code[12]),
        .Q(\code2_reg_n_0_[12] ));
  FDCE \code2_reg[13] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(unbounded_code[13]),
        .Q(\code2_reg_n_0_[13] ));
  FDCE \code2_reg[15] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(unbounded_code[15]),
        .Q(\code2_reg_n_0_[15] ));
  FDCE \code2_reg[1] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(unbounded_code[1]),
        .Q(\code2_reg_n_0_[1] ));
  FDCE \code2_reg[2] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(unbounded_code[2]),
        .Q(\code2_reg_n_0_[2] ));
  FDCE \code2_reg[3] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(unbounded_code[3]),
        .Q(\code2_reg_n_0_[3] ));
  FDCE \code2_reg[4] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(unbounded_code[4]),
        .Q(\code2_reg_n_0_[4] ));
  FDCE \code2_reg[5] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(unbounded_code[5]),
        .Q(\code2_reg_n_0_[5] ));
  FDCE \code2_reg[6] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(unbounded_code[6]),
        .Q(\code2_reg_n_0_[6] ));
  FDCE \code2_reg[7] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(unbounded_code[7]),
        .Q(\code2_reg_n_0_[7] ));
  FDCE \code2_reg[8] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(unbounded_code[8]),
        .Q(\code2_reg_n_0_[8] ));
  FDCE \code2_reg[9] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(unbounded_code[9]),
        .Q(\code2_reg_n_0_[9] ));
  FDCE enabled0_reg
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(active_enable),
        .Q(enabled0));
  FDCE enabled1_reg
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(enabled0),
        .Q(enabled1));
  FDCE enabled2_reg
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(enabled1),
        .Q(enabled2));
  FDCE \frequency_word_reg[0] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[0]),
        .Q(reference_ftw[0]));
  FDCE \frequency_word_reg[10] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[10]),
        .Q(reference_ftw[10]));
  FDCE \frequency_word_reg[11] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[11]),
        .Q(reference_ftw[11]));
  FDCE \frequency_word_reg[12] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[12]),
        .Q(reference_ftw[12]));
  FDCE \frequency_word_reg[13] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[13]),
        .Q(reference_ftw[13]));
  FDCE \frequency_word_reg[14] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[14]),
        .Q(reference_ftw[14]));
  FDCE \frequency_word_reg[15] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[15]),
        .Q(reference_ftw[15]));
  FDCE \frequency_word_reg[16] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[16]),
        .Q(reference_ftw[16]));
  FDCE \frequency_word_reg[17] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[17]),
        .Q(reference_ftw[17]));
  FDCE \frequency_word_reg[18] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[18]),
        .Q(reference_ftw[18]));
  FDCE \frequency_word_reg[19] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[19]),
        .Q(reference_ftw[19]));
  FDCE \frequency_word_reg[1] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[1]),
        .Q(reference_ftw[1]));
  FDCE \frequency_word_reg[20] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[20]),
        .Q(reference_ftw[20]));
  FDCE \frequency_word_reg[21] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[21]),
        .Q(reference_ftw[21]));
  FDCE \frequency_word_reg[22] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[22]),
        .Q(reference_ftw[22]));
  FDCE \frequency_word_reg[23] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[23]),
        .Q(reference_ftw[23]));
  FDCE \frequency_word_reg[24] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[24]),
        .Q(reference_ftw[24]));
  FDCE \frequency_word_reg[25] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[25]),
        .Q(reference_ftw[25]));
  FDCE \frequency_word_reg[26] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[26]),
        .Q(reference_ftw[26]));
  FDCE \frequency_word_reg[27] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[27]),
        .Q(reference_ftw[27]));
  FDCE \frequency_word_reg[28] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[28]),
        .Q(reference_ftw[28]));
  FDCE \frequency_word_reg[29] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[29]),
        .Q(reference_ftw[29]));
  FDCE \frequency_word_reg[2] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[2]),
        .Q(reference_ftw[2]));
  FDCE \frequency_word_reg[30] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[30]),
        .Q(reference_ftw[30]));
  FDCE \frequency_word_reg[31] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[31]),
        .Q(reference_ftw[31]));
  FDCE \frequency_word_reg[3] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[3]),
        .Q(reference_ftw[3]));
  FDCE \frequency_word_reg[4] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[4]),
        .Q(reference_ftw[4]));
  FDCE \frequency_word_reg[5] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[5]),
        .Q(reference_ftw[5]));
  FDCE \frequency_word_reg[6] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[6]),
        .Q(reference_ftw[6]));
  FDCE \frequency_word_reg[7] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[7]),
        .Q(reference_ftw[7]));
  FDCE \frequency_word_reg[8] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[8]),
        .Q(reference_ftw[8]));
  FDCE \frequency_word_reg[9] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[9]),
        .Q(reference_ftw[9]));
  FDCE \gain0_reg[0] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(gain_q11[0]),
        .Q(gain0[0]));
  FDCE \gain0_reg[10] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(gain_q11[10]),
        .Q(gain0[10]));
  FDCE \gain0_reg[11] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(gain_q11[11]),
        .Q(gain0[11]));
  FDCE \gain0_reg[1] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(gain_q11[1]),
        .Q(gain0[1]));
  FDCE \gain0_reg[2] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(gain_q11[2]),
        .Q(gain0[2]));
  FDCE \gain0_reg[3] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(gain_q11[3]),
        .Q(gain0[3]));
  FDCE \gain0_reg[4] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(gain_q11[4]),
        .Q(gain0[4]));
  FDCE \gain0_reg[5] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(gain_q11[5]),
        .Q(gain0[5]));
  FDCE \gain0_reg[6] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(gain_q11[6]),
        .Q(gain0[6]));
  FDCE \gain0_reg[7] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(gain_q11[7]),
        .Q(gain0[7]));
  FDCE \gain0_reg[8] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(gain_q11[8]),
        .Q(gain0[8]));
  FDCE \gain0_reg[9] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(gain_q11[9]),
        .Q(gain0[9]));
  FDCE \gain_q11_reg[0] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[64]),
        .Q(gain_q11[0]));
  FDCE \gain_q11_reg[10] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[74]),
        .Q(gain_q11[10]));
  FDCE \gain_q11_reg[11] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[75]),
        .Q(gain_q11[11]));
  FDCE \gain_q11_reg[1] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[65]),
        .Q(gain_q11[1]));
  FDCE \gain_q11_reg[2] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[66]),
        .Q(gain_q11[2]));
  FDCE \gain_q11_reg[3] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[67]),
        .Q(gain_q11[3]));
  FDCE \gain_q11_reg[4] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[68]),
        .Q(gain_q11[4]));
  FDCE \gain_q11_reg[5] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[69]),
        .Q(gain_q11[5]));
  FDCE \gain_q11_reg[6] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[70]),
        .Q(gain_q11[6]));
  FDCE \gain_q11_reg[7] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[71]),
        .Q(gain_q11[7]));
  FDCE \gain_q11_reg[8] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[72]),
        .Q(gain_q11[8]));
  FDCE \gain_q11_reg[9] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[73]),
        .Q(gain_q11[9]));
  FDCE invert0_reg
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(reference_inverted),
        .Q(invert0));
  FDCE invert1_reg
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(invert0),
        .Q(invert1));
  FDCE invert2_reg
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(invert1),
        .Q(invert2));
  FDCE \offset0_reg[0] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(offset_code[0]),
        .Q(offset0[0]));
  FDCE \offset0_reg[10] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(offset_code[10]),
        .Q(offset0[10]));
  FDPE \offset0_reg[11] 
       (.C(sample_clk),
        .CE(E),
        .D(offset_code[11]),
        .PRE(sample_resetn_0),
        .Q(offset0[11]));
  FDCE \offset0_reg[1] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(offset_code[1]),
        .Q(offset0[1]));
  FDCE \offset0_reg[2] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(offset_code[2]),
        .Q(offset0[2]));
  FDCE \offset0_reg[3] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(offset_code[3]),
        .Q(offset0[3]));
  FDCE \offset0_reg[4] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(offset_code[4]),
        .Q(offset0[4]));
  FDCE \offset0_reg[5] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(offset_code[5]),
        .Q(offset0[5]));
  FDCE \offset0_reg[6] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(offset_code[6]),
        .Q(offset0[6]));
  FDCE \offset0_reg[7] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(offset_code[7]),
        .Q(offset0[7]));
  FDCE \offset0_reg[8] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(offset_code[8]),
        .Q(offset0[8]));
  FDCE \offset0_reg[9] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(offset_code[9]),
        .Q(offset0[9]));
  FDCE \offset1_reg[0] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(offset0[0]),
        .Q(offset1[0]));
  FDCE \offset1_reg[10] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(offset0[10]),
        .Q(offset1[10]));
  FDPE \offset1_reg[11] 
       (.C(sample_clk),
        .CE(E),
        .D(offset0[11]),
        .PRE(sample_resetn_0),
        .Q(offset1[11]));
  FDCE \offset1_reg[1] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(offset0[1]),
        .Q(offset1[1]));
  FDCE \offset1_reg[2] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(offset0[2]),
        .Q(offset1[2]));
  FDCE \offset1_reg[3] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(offset0[3]),
        .Q(offset1[3]));
  FDCE \offset1_reg[4] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(offset0[4]),
        .Q(offset1[4]));
  FDCE \offset1_reg[5] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(offset0[5]),
        .Q(offset1[5]));
  FDCE \offset1_reg[6] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(offset0[6]),
        .Q(offset1[6]));
  FDCE \offset1_reg[7] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(offset0[7]),
        .Q(offset1[7]));
  FDCE \offset1_reg[8] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(offset0[8]),
        .Q(offset1[8]));
  FDCE \offset1_reg[9] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(offset0[9]),
        .Q(offset1[9]));
  FDCE \offset_code_reg[0] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[76]),
        .Q(offset_code[0]));
  FDCE \offset_code_reg[10] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[86]),
        .Q(offset_code[10]));
  FDPE \offset_code_reg[11] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .D(Q[87]),
        .PRE(sample_resetn_0),
        .Q(offset_code[11]));
  FDCE \offset_code_reg[1] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[77]),
        .Q(offset_code[1]));
  FDCE \offset_code_reg[2] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[78]),
        .Q(offset_code[2]));
  FDCE \offset_code_reg[3] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[79]),
        .Q(offset_code[3]));
  FDCE \offset_code_reg[4] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[80]),
        .Q(offset_code[4]));
  FDCE \offset_code_reg[5] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[81]),
        .Q(offset_code[5]));
  FDCE \offset_code_reg[6] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[82]),
        .Q(offset_code[6]));
  FDCE \offset_code_reg[7] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[83]),
        .Q(offset_code[7]));
  FDCE \offset_code_reg[8] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[84]),
        .Q(offset_code[8]));
  FDCE \offset_code_reg[9] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[85]),
        .Q(offset_code[9]));
  LUT2 #(
    .INIT(4'h6)) 
    \p0[11]_i_2 
       (.I0(phase_accumulator[11]),
        .I1(phase_offset[11]),
        .O(\p0[11]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \p0[11]_i_3 
       (.I0(phase_accumulator[10]),
        .I1(phase_offset[10]),
        .O(\p0[11]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \p0[11]_i_4 
       (.I0(phase_accumulator[9]),
        .I1(phase_offset[9]),
        .O(\p0[11]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \p0[11]_i_5 
       (.I0(phase_accumulator[8]),
        .I1(phase_offset[8]),
        .O(\p0[11]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \p0[15]_i_2 
       (.I0(phase_accumulator[15]),
        .I1(phase_offset[15]),
        .O(\p0[15]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \p0[15]_i_3 
       (.I0(phase_accumulator[14]),
        .I1(phase_offset[14]),
        .O(\p0[15]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \p0[15]_i_4 
       (.I0(phase_accumulator[13]),
        .I1(phase_offset[13]),
        .O(\p0[15]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \p0[15]_i_5 
       (.I0(phase_accumulator[12]),
        .I1(phase_offset[12]),
        .O(\p0[15]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \p0[19]_i_2 
       (.I0(phase_accumulator[19]),
        .I1(phase_offset[19]),
        .O(\p0[19]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \p0[19]_i_3 
       (.I0(phase_accumulator[18]),
        .I1(phase_offset[18]),
        .O(\p0[19]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \p0[19]_i_4 
       (.I0(phase_accumulator[17]),
        .I1(phase_offset[17]),
        .O(\p0[19]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \p0[19]_i_5 
       (.I0(phase_accumulator[16]),
        .I1(phase_offset[16]),
        .O(\p0[19]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \p0[23]_i_2 
       (.I0(phase_accumulator[23]),
        .I1(phase_offset[23]),
        .O(\p0[23]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \p0[23]_i_3 
       (.I0(phase_accumulator[22]),
        .I1(phase_offset[22]),
        .O(\p0[23]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \p0[23]_i_4 
       (.I0(phase_accumulator[21]),
        .I1(phase_offset[21]),
        .O(\p0[23]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \p0[23]_i_5 
       (.I0(phase_accumulator[20]),
        .I1(phase_offset[20]),
        .O(\p0[23]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \p0[27]_i_2 
       (.I0(phase_accumulator[27]),
        .I1(phase_offset[27]),
        .O(\p0[27]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \p0[27]_i_3 
       (.I0(phase_accumulator[26]),
        .I1(phase_offset[26]),
        .O(\p0[27]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \p0[27]_i_4 
       (.I0(phase_accumulator[25]),
        .I1(phase_offset[25]),
        .O(\p0[27]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \p0[27]_i_5 
       (.I0(phase_accumulator[24]),
        .I1(phase_offset[24]),
        .O(\p0[27]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \p0[31]_i_2 
       (.I0(phase_accumulator[31]),
        .I1(phase_offset[31]),
        .O(\p0[31]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \p0[31]_i_3 
       (.I0(phase_accumulator[30]),
        .I1(phase_offset[30]),
        .O(\p0[31]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \p0[31]_i_4 
       (.I0(phase_accumulator[29]),
        .I1(phase_offset[29]),
        .O(\p0[31]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \p0[31]_i_5 
       (.I0(phase_accumulator[28]),
        .I1(phase_offset[28]),
        .O(\p0[31]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \p0[3]_i_2 
       (.I0(phase_accumulator[3]),
        .I1(phase_offset[3]),
        .O(\p0[3]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \p0[3]_i_3 
       (.I0(phase_accumulator[2]),
        .I1(phase_offset[2]),
        .O(\p0[3]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \p0[3]_i_4 
       (.I0(phase_accumulator[1]),
        .I1(phase_offset[1]),
        .O(\p0[3]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \p0[3]_i_5 
       (.I0(phase_accumulator[0]),
        .I1(phase_offset[0]),
        .O(\p0[3]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \p0[7]_i_2 
       (.I0(phase_accumulator[7]),
        .I1(phase_offset[7]),
        .O(\p0[7]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \p0[7]_i_3 
       (.I0(phase_accumulator[6]),
        .I1(phase_offset[6]),
        .O(\p0[7]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \p0[7]_i_4 
       (.I0(phase_accumulator[5]),
        .I1(phase_offset[5]),
        .O(\p0[7]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \p0[7]_i_5 
       (.I0(phase_accumulator[4]),
        .I1(phase_offset[4]),
        .O(\p0[7]_i_5_n_0 ));
  FDCE \p0_reg[0] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(\p0_reg[3]_i_1_n_7 ),
        .Q(p0[0]));
  FDCE \p0_reg[10] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(\p0_reg[11]_i_1_n_5 ),
        .Q(p0[10]));
  FDCE \p0_reg[11] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(\p0_reg[11]_i_1_n_4 ),
        .Q(p0[11]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \p0_reg[11]_i_1 
       (.CI(\p0_reg[7]_i_1_n_0 ),
        .CO({\p0_reg[11]_i_1_n_0 ,\p0_reg[11]_i_1_n_1 ,\p0_reg[11]_i_1_n_2 ,\p0_reg[11]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(phase_accumulator[11:8]),
        .O({\p0_reg[11]_i_1_n_4 ,\p0_reg[11]_i_1_n_5 ,\p0_reg[11]_i_1_n_6 ,\p0_reg[11]_i_1_n_7 }),
        .S({\p0[11]_i_2_n_0 ,\p0[11]_i_3_n_0 ,\p0[11]_i_4_n_0 ,\p0[11]_i_5_n_0 }));
  FDCE \p0_reg[12] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(\p0_reg[15]_i_1_n_7 ),
        .Q(p0[12]));
  FDCE \p0_reg[13] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(\p0_reg[15]_i_1_n_6 ),
        .Q(p0[13]));
  FDCE \p0_reg[14] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(\p0_reg[15]_i_1_n_5 ),
        .Q(p0[14]));
  FDCE \p0_reg[15] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(\p0_reg[15]_i_1_n_4 ),
        .Q(p0[15]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \p0_reg[15]_i_1 
       (.CI(\p0_reg[11]_i_1_n_0 ),
        .CO({\p0_reg[15]_i_1_n_0 ,\p0_reg[15]_i_1_n_1 ,\p0_reg[15]_i_1_n_2 ,\p0_reg[15]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(phase_accumulator[15:12]),
        .O({\p0_reg[15]_i_1_n_4 ,\p0_reg[15]_i_1_n_5 ,\p0_reg[15]_i_1_n_6 ,\p0_reg[15]_i_1_n_7 }),
        .S({\p0[15]_i_2_n_0 ,\p0[15]_i_3_n_0 ,\p0[15]_i_4_n_0 ,\p0[15]_i_5_n_0 }));
  FDCE \p0_reg[16] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(\p0_reg[19]_i_1_n_7 ),
        .Q(p0[16]));
  FDCE \p0_reg[17] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(\p0_reg[19]_i_1_n_6 ),
        .Q(p0[17]));
  FDCE \p0_reg[18] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(\p0_reg[19]_i_1_n_5 ),
        .Q(p0[18]));
  FDCE \p0_reg[19] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(\p0_reg[19]_i_1_n_4 ),
        .Q(p0[19]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \p0_reg[19]_i_1 
       (.CI(\p0_reg[15]_i_1_n_0 ),
        .CO({\p0_reg[19]_i_1_n_0 ,\p0_reg[19]_i_1_n_1 ,\p0_reg[19]_i_1_n_2 ,\p0_reg[19]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(phase_accumulator[19:16]),
        .O({\p0_reg[19]_i_1_n_4 ,\p0_reg[19]_i_1_n_5 ,\p0_reg[19]_i_1_n_6 ,\p0_reg[19]_i_1_n_7 }),
        .S({\p0[19]_i_2_n_0 ,\p0[19]_i_3_n_0 ,\p0[19]_i_4_n_0 ,\p0[19]_i_5_n_0 }));
  FDCE \p0_reg[1] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(\p0_reg[3]_i_1_n_6 ),
        .Q(p0[1]));
  FDCE \p0_reg[20] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(sel[0]),
        .Q(p0[20]));
  FDCE \p0_reg[21] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(sel[1]),
        .Q(p0[21]));
  FDCE \p0_reg[22] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(sel[2]),
        .Q(p0[22]));
  FDCE \p0_reg[23] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(sel[3]),
        .Q(p0[23]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \p0_reg[23]_i_1 
       (.CI(\p0_reg[19]_i_1_n_0 ),
        .CO({\p0_reg[23]_i_1_n_0 ,\p0_reg[23]_i_1_n_1 ,\p0_reg[23]_i_1_n_2 ,\p0_reg[23]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(phase_accumulator[23:20]),
        .O(sel[3:0]),
        .S({\p0[23]_i_2_n_0 ,\p0[23]_i_3_n_0 ,\p0[23]_i_4_n_0 ,\p0[23]_i_5_n_0 }));
  FDCE \p0_reg[24] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(sel[4]),
        .Q(p0[24]));
  FDCE \p0_reg[25] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(sel[5]),
        .Q(p0[25]));
  FDCE \p0_reg[26] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(sel[6]),
        .Q(p0[26]));
  FDCE \p0_reg[27] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(sel[7]),
        .Q(p0[27]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \p0_reg[27]_i_1 
       (.CI(\p0_reg[23]_i_1_n_0 ),
        .CO({\p0_reg[27]_i_1_n_0 ,\p0_reg[27]_i_1_n_1 ,\p0_reg[27]_i_1_n_2 ,\p0_reg[27]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(phase_accumulator[27:24]),
        .O(sel[7:4]),
        .S({\p0[27]_i_2_n_0 ,\p0[27]_i_3_n_0 ,\p0[27]_i_4_n_0 ,\p0[27]_i_5_n_0 }));
  FDCE \p0_reg[28] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(sel[8]),
        .Q(p0[28]));
  FDCE \p0_reg[29] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(sel[9]),
        .Q(p0[29]));
  FDCE \p0_reg[2] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(\p0_reg[3]_i_1_n_5 ),
        .Q(p0[2]));
  FDCE \p0_reg[30] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(sel[10]),
        .Q(p0[30]));
  FDCE \p0_reg[31] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(sel[11]),
        .Q(p0[31]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \p0_reg[31]_i_1 
       (.CI(\p0_reg[27]_i_1_n_0 ),
        .CO({\NLW_p0_reg[31]_i_1_CO_UNCONNECTED [3],\p0_reg[31]_i_1_n_1 ,\p0_reg[31]_i_1_n_2 ,\p0_reg[31]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,phase_accumulator[30:28]}),
        .O(sel[11:8]),
        .S({\p0[31]_i_2_n_0 ,\p0[31]_i_3_n_0 ,\p0[31]_i_4_n_0 ,\p0[31]_i_5_n_0 }));
  FDCE \p0_reg[3] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(\p0_reg[3]_i_1_n_4 ),
        .Q(p0[3]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \p0_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\p0_reg[3]_i_1_n_0 ,\p0_reg[3]_i_1_n_1 ,\p0_reg[3]_i_1_n_2 ,\p0_reg[3]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(phase_accumulator[3:0]),
        .O({\p0_reg[3]_i_1_n_4 ,\p0_reg[3]_i_1_n_5 ,\p0_reg[3]_i_1_n_6 ,\p0_reg[3]_i_1_n_7 }),
        .S({\p0[3]_i_2_n_0 ,\p0[3]_i_3_n_0 ,\p0[3]_i_4_n_0 ,\p0[3]_i_5_n_0 }));
  FDCE \p0_reg[4] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(\p0_reg[7]_i_1_n_7 ),
        .Q(p0[4]));
  FDCE \p0_reg[5] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(\p0_reg[7]_i_1_n_6 ),
        .Q(p0[5]));
  FDCE \p0_reg[6] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(\p0_reg[7]_i_1_n_5 ),
        .Q(p0[6]));
  FDCE \p0_reg[7] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(\p0_reg[7]_i_1_n_4 ),
        .Q(p0[7]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \p0_reg[7]_i_1 
       (.CI(\p0_reg[3]_i_1_n_0 ),
        .CO({\p0_reg[7]_i_1_n_0 ,\p0_reg[7]_i_1_n_1 ,\p0_reg[7]_i_1_n_2 ,\p0_reg[7]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(phase_accumulator[7:4]),
        .O({\p0_reg[7]_i_1_n_4 ,\p0_reg[7]_i_1_n_5 ,\p0_reg[7]_i_1_n_6 ,\p0_reg[7]_i_1_n_7 }),
        .S({\p0[7]_i_2_n_0 ,\p0[7]_i_3_n_0 ,\p0[7]_i_4_n_0 ,\p0[7]_i_5_n_0 }));
  FDCE \p0_reg[8] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(\p0_reg[11]_i_1_n_7 ),
        .Q(p0[8]));
  FDCE \p0_reg[9] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(\p0_reg[11]_i_1_n_6 ),
        .Q(p0[9]));
  FDCE \p1_reg[0] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(p0[0]),
        .Q(p1[0]));
  FDCE \p1_reg[10] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(p0[10]),
        .Q(p1[10]));
  FDCE \p1_reg[11] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(p0[11]),
        .Q(p1[11]));
  FDCE \p1_reg[12] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(p0[12]),
        .Q(p1[12]));
  FDCE \p1_reg[13] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(p0[13]),
        .Q(p1[13]));
  FDCE \p1_reg[14] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(p0[14]),
        .Q(p1[14]));
  FDCE \p1_reg[15] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(p0[15]),
        .Q(p1[15]));
  FDCE \p1_reg[16] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(p0[16]),
        .Q(p1[16]));
  FDCE \p1_reg[17] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(p0[17]),
        .Q(p1[17]));
  FDCE \p1_reg[18] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(p0[18]),
        .Q(p1[18]));
  FDCE \p1_reg[19] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(p0[19]),
        .Q(p1[19]));
  FDCE \p1_reg[1] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(p0[1]),
        .Q(p1[1]));
  FDCE \p1_reg[20] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(p0[20]),
        .Q(p1[20]));
  FDCE \p1_reg[21] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(p0[21]),
        .Q(p1[21]));
  FDCE \p1_reg[22] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(p0[22]),
        .Q(p1[22]));
  FDCE \p1_reg[23] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(p0[23]),
        .Q(p1[23]));
  FDCE \p1_reg[24] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(p0[24]),
        .Q(p1[24]));
  FDCE \p1_reg[25] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(p0[25]),
        .Q(p1[25]));
  FDCE \p1_reg[26] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(p0[26]),
        .Q(p1[26]));
  FDCE \p1_reg[27] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(p0[27]),
        .Q(p1[27]));
  FDCE \p1_reg[28] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(p0[28]),
        .Q(p1[28]));
  FDCE \p1_reg[29] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(p0[29]),
        .Q(p1[29]));
  FDCE \p1_reg[2] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(p0[2]),
        .Q(p1[2]));
  FDCE \p1_reg[30] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(p0[30]),
        .Q(p1[30]));
  FDCE \p1_reg[31] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(p0[31]),
        .Q(p1[31]));
  FDCE \p1_reg[3] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(p0[3]),
        .Q(p1[3]));
  FDCE \p1_reg[4] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(p0[4]),
        .Q(p1[4]));
  FDCE \p1_reg[5] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(p0[5]),
        .Q(p1[5]));
  FDCE \p1_reg[6] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(p0[6]),
        .Q(p1[6]));
  FDCE \p1_reg[7] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(p0[7]),
        .Q(p1[7]));
  FDCE \p1_reg[8] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(p0[8]),
        .Q(p1[8]));
  FDCE \p1_reg[9] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(p0[9]),
        .Q(p1[9]));
  FDCE \p2_reg[0] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(p1[0]),
        .Q(p2[0]));
  FDCE \p2_reg[10] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(p1[10]),
        .Q(p2[10]));
  FDCE \p2_reg[11] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(p1[11]),
        .Q(p2[11]));
  FDCE \p2_reg[12] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(p1[12]),
        .Q(p2[12]));
  FDCE \p2_reg[13] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(p1[13]),
        .Q(p2[13]));
  FDCE \p2_reg[14] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(p1[14]),
        .Q(p2[14]));
  FDCE \p2_reg[15] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(p1[15]),
        .Q(p2[15]));
  FDCE \p2_reg[16] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(p1[16]),
        .Q(p2[16]));
  FDCE \p2_reg[17] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(p1[17]),
        .Q(p2[17]));
  FDCE \p2_reg[18] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(p1[18]),
        .Q(p2[18]));
  FDCE \p2_reg[19] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(p1[19]),
        .Q(p2[19]));
  FDCE \p2_reg[1] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(p1[1]),
        .Q(p2[1]));
  FDCE \p2_reg[20] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(p1[20]),
        .Q(p2[20]));
  FDCE \p2_reg[21] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(p1[21]),
        .Q(p2[21]));
  FDCE \p2_reg[22] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(p1[22]),
        .Q(p2[22]));
  FDCE \p2_reg[23] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(p1[23]),
        .Q(p2[23]));
  FDCE \p2_reg[24] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(p1[24]),
        .Q(p2[24]));
  FDCE \p2_reg[25] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(p1[25]),
        .Q(p2[25]));
  FDCE \p2_reg[26] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(p1[26]),
        .Q(p2[26]));
  FDCE \p2_reg[27] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(p1[27]),
        .Q(p2[27]));
  FDCE \p2_reg[28] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(p1[28]),
        .Q(p2[28]));
  FDCE \p2_reg[29] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(p1[29]),
        .Q(p2[29]));
  FDCE \p2_reg[2] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(p1[2]),
        .Q(p2[2]));
  FDCE \p2_reg[30] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(p1[30]),
        .Q(p2[30]));
  FDCE \p2_reg[31] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(p1[31]),
        .Q(p2[31]));
  FDCE \p2_reg[3] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(p1[3]),
        .Q(p2[3]));
  FDCE \p2_reg[4] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(p1[4]),
        .Q(p2[4]));
  FDCE \p2_reg[5] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(p1[5]),
        .Q(p2[5]));
  FDCE \p2_reg[6] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(p1[6]),
        .Q(p2[6]));
  FDCE \p2_reg[7] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(p1[7]),
        .Q(p2[7]));
  FDCE \p2_reg[8] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(p1[8]),
        .Q(p2[8]));
  FDCE \p2_reg[9] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(p1[9]),
        .Q(p2[9]));
  LUT6 #(
    .INIT(64'hFF00FF01FF00FE00)) 
    \p_0_out_inferred__0/product10_i_1 
       (.I0(sel[9]),
        .I1(sel[10]),
        .I2(sel[8]),
        .I3(sel[11]),
        .I4(sel[7]),
        .I5(\p_0_out_inferred__0/product10_i_13_n_0 ),
        .O(p_0_out[11]));
  MUXF8 \p_0_out_inferred__0/product10_i_10 
       (.I0(\p_0_out_inferred__0/product10_i_36_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_37_n_0 ),
        .O(p_0_out[2]),
        .S(sel[9]));
  MUXF8 \p_0_out_inferred__0/product10_i_100 
       (.I0(\p_0_out_inferred__0/product10_i_245_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_246_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_100_n_0 ),
        .S(sel[6]));
  MUXF8 \p_0_out_inferred__0/product10_i_101 
       (.I0(\p_0_out_inferred__0/product10_i_247_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_248_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_101_n_0 ),
        .S(sel[6]));
  LUT6 #(
    .INIT(64'h5F50CFCF5F50C0C0)) 
    \p_0_out_inferred__0/product10_i_102 
       (.I0(sel[11]),
        .I1(\p_0_out_inferred__0/product10_i_249_n_0 ),
        .I2(sel[6]),
        .I3(\p_0_out_inferred__0/product10_i_250_n_0 ),
        .I4(sel[5]),
        .I5(\p_0_out_inferred__0/product10_i_251_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_102_n_0 ));
  MUXF8 \p_0_out_inferred__0/product10_i_103 
       (.I0(\p_0_out_inferred__0/product10_i_252_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_253_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_103_n_0 ),
        .S(sel[6]));
  MUXF8 \p_0_out_inferred__0/product10_i_104 
       (.I0(\p_0_out_inferred__0/product10_i_254_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_255_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_104_n_0 ),
        .S(sel[6]));
  MUXF8 \p_0_out_inferred__0/product10_i_105 
       (.I0(\p_0_out_inferred__0/product10_i_256_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_257_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_105_n_0 ),
        .S(sel[6]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \p_0_out_inferred__0/product10_i_106 
       (.I0(\p_0_out_inferred__0/product10_i_258_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_259_n_0 ),
        .I2(sel[7]),
        .I3(\p_0_out_inferred__0/product10_i_260_n_0 ),
        .I4(sel[6]),
        .I5(\p_0_out_inferred__0/product10_i_261_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_106_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \p_0_out_inferred__0/product10_i_107 
       (.I0(\p_0_out_inferred__0/product10_i_262_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_263_n_0 ),
        .I2(sel[7]),
        .I3(\p_0_out_inferred__0/product10_i_264_n_0 ),
        .I4(sel[6]),
        .I5(\p_0_out_inferred__0/product10_i_265_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_107_n_0 ));
  MUXF8 \p_0_out_inferred__0/product10_i_108 
       (.I0(\p_0_out_inferred__0/product10_i_266_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_267_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_108_n_0 ),
        .S(sel[6]));
  MUXF8 \p_0_out_inferred__0/product10_i_109 
       (.I0(\p_0_out_inferred__0/product10_i_268_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_269_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_109_n_0 ),
        .S(sel[6]));
  MUXF8 \p_0_out_inferred__0/product10_i_11 
       (.I0(\p_0_out_inferred__0/product10_i_38_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_39_n_0 ),
        .O(p_0_out[1]),
        .S(sel[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \p_0_out_inferred__0/product10_i_110 
       (.I0(\p_0_out_inferred__0/product10_i_270_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_271_n_0 ),
        .I2(sel[6]),
        .I3(\p_0_out_inferred__0/product10_i_272_n_0 ),
        .I4(sel[5]),
        .I5(\p_0_out_inferred__0/product10_i_273_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_110_n_0 ));
  MUXF8 \p_0_out_inferred__0/product10_i_111 
       (.I0(\p_0_out_inferred__0/product10_i_274_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_275_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_111_n_0 ),
        .S(sel[6]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \p_0_out_inferred__0/product10_i_112 
       (.I0(\p_0_out_inferred__0/product10_i_276_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_277_n_0 ),
        .I2(sel[8]),
        .I3(\p_0_out_inferred__0/product10_i_278_n_0 ),
        .I4(sel[7]),
        .I5(\p_0_out_inferred__0/product10_i_279_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_112_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \p_0_out_inferred__0/product10_i_113 
       (.I0(\p_0_out_inferred__0/product10_i_280_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_281_n_0 ),
        .I2(sel[8]),
        .I3(\p_0_out_inferred__0/product10_i_282_n_0 ),
        .I4(sel[7]),
        .I5(\p_0_out_inferred__0/product10_i_283_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_113_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \p_0_out_inferred__0/product10_i_114 
       (.I0(\p_0_out_inferred__0/product10_i_284_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_285_n_0 ),
        .I2(sel[8]),
        .I3(\p_0_out_inferred__0/product10_i_286_n_0 ),
        .I4(sel[7]),
        .I5(\p_0_out_inferred__0/product10_i_287_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_114_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \p_0_out_inferred__0/product10_i_115 
       (.I0(\p_0_out_inferred__0/product10_i_288_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_289_n_0 ),
        .I2(sel[8]),
        .I3(\p_0_out_inferred__0/product10_i_290_n_0 ),
        .I4(sel[7]),
        .I5(\p_0_out_inferred__0/product10_i_291_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_115_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \p_0_out_inferred__0/product10_i_116 
       (.I0(\p_0_out_inferred__0/product10_i_292_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_293_n_0 ),
        .I2(sel[8]),
        .I3(\p_0_out_inferred__0/product10_i_294_n_0 ),
        .I4(sel[7]),
        .I5(\p_0_out_inferred__0/product10_i_295_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_116_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \p_0_out_inferred__0/product10_i_117 
       (.I0(\p_0_out_inferred__0/product10_i_296_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_297_n_0 ),
        .I2(sel[8]),
        .I3(\p_0_out_inferred__0/product10_i_298_n_0 ),
        .I4(sel[7]),
        .I5(\p_0_out_inferred__0/product10_i_299_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_117_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \p_0_out_inferred__0/product10_i_118 
       (.I0(\p_0_out_inferred__0/product10_i_300_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_301_n_0 ),
        .I2(sel[8]),
        .I3(\p_0_out_inferred__0/product10_i_302_n_0 ),
        .I4(sel[7]),
        .I5(\p_0_out_inferred__0/product10_i_303_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_118_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \p_0_out_inferred__0/product10_i_119 
       (.I0(\p_0_out_inferred__0/product10_i_304_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_305_n_0 ),
        .I2(sel[8]),
        .I3(\p_0_out_inferred__0/product10_i_306_n_0 ),
        .I4(sel[7]),
        .I5(\p_0_out_inferred__0/product10_i_307_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_119_n_0 ));
  MUXF7 \p_0_out_inferred__0/product10_i_12 
       (.I0(\p_0_out_inferred__0/product10_i_40_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_41_n_0 ),
        .O(p_0_out[0]),
        .S(sel[9]));
  MUXF8 \p_0_out_inferred__0/product10_i_120 
       (.I0(\p_0_out_inferred__0/product10_i_308_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_309_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_120_n_0 ),
        .S(sel[7]));
  MUXF8 \p_0_out_inferred__0/product10_i_121 
       (.I0(\p_0_out_inferred__0/product10_i_310_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_311_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_121_n_0 ),
        .S(sel[7]));
  MUXF8 \p_0_out_inferred__0/product10_i_122 
       (.I0(\p_0_out_inferred__0/product10_i_312_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_313_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_122_n_0 ),
        .S(sel[7]));
  MUXF8 \p_0_out_inferred__0/product10_i_123 
       (.I0(\p_0_out_inferred__0/product10_i_314_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_315_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_123_n_0 ),
        .S(sel[7]));
  MUXF8 \p_0_out_inferred__0/product10_i_124 
       (.I0(\p_0_out_inferred__0/product10_i_316_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_317_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_124_n_0 ),
        .S(sel[7]));
  MUXF8 \p_0_out_inferred__0/product10_i_125 
       (.I0(\p_0_out_inferred__0/product10_i_318_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_319_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_125_n_0 ),
        .S(sel[7]));
  MUXF8 \p_0_out_inferred__0/product10_i_126 
       (.I0(\p_0_out_inferred__0/product10_i_320_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_321_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_126_n_0 ),
        .S(sel[7]));
  MUXF8 \p_0_out_inferred__0/product10_i_127 
       (.I0(\p_0_out_inferred__0/product10_i_322_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_323_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_127_n_0 ),
        .S(sel[7]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \p_0_out_inferred__0/product10_i_128 
       (.I0(sel[2]),
        .I1(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_128_n_0 ));
  LUT6 #(
    .INIT(64'hFEAA00000155FFFF)) 
    \p_0_out_inferred__0/product10_i_129 
       (.I0(sel[5]),
        .I1(\p_0_out_inferred__0/product10_i_184_n_0 ),
        .I2(sel[3]),
        .I3(sel[4]),
        .I4(sel[6]),
        .I5(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_129_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFE00000000)) 
    \p_0_out_inferred__0/product10_i_13 
       (.I0(sel[6]),
        .I1(sel[5]),
        .I2(sel[4]),
        .I3(sel[3]),
        .I4(\p_0_out_inferred__0/product10_i_42_n_0 ),
        .I5(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_13_n_0 ));
  LUT5 #(
    .INIT(32'h1055FEAA)) 
    \p_0_out_inferred__0/product10_i_130 
       (.I0(sel[6]),
        .I1(sel[4]),
        .I2(\p_0_out_inferred__0/product10_i_324_n_0 ),
        .I3(sel[5]),
        .I4(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_130_n_0 ));
  LUT6 #(
    .INIT(64'hFF80000000FFFFFF)) 
    \p_0_out_inferred__0/product10_i_131 
       (.I0(sel[0]),
        .I1(sel[2]),
        .I2(sel[1]),
        .I3(sel[3]),
        .I4(sel[4]),
        .I5(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_131_n_0 ));
  LUT6 #(
    .INIT(64'h3333337666666666)) 
    \p_0_out_inferred__0/product10_i_132 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[0]),
        .I3(sel[2]),
        .I4(sel[1]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_132_n_0 ));
  LUT6 #(
    .INIT(64'hEAAA00001555FFFF)) 
    \p_0_out_inferred__0/product10_i_133 
       (.I0(sel[5]),
        .I1(sel[3]),
        .I2(sel[2]),
        .I3(sel[4]),
        .I4(sel[6]),
        .I5(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_133_n_0 ));
  LUT6 #(
    .INIT(64'h4455FFFFFAAA0000)) 
    \p_0_out_inferred__0/product10_i_134 
       (.I0(sel[4]),
        .I1(\p_0_out_inferred__0/product10_i_325_n_0 ),
        .I2(\p_0_out_inferred__0/product10_i_326_n_0 ),
        .I3(sel[3]),
        .I4(sel[5]),
        .I5(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_134_n_0 ));
  LUT6 #(
    .INIT(64'h44555555FAAAAAAA)) 
    \p_0_out_inferred__0/product10_i_135 
       (.I0(sel[6]),
        .I1(\p_0_out_inferred__0/product10_i_327_n_0 ),
        .I2(\p_0_out_inferred__0/product10_i_328_n_0 ),
        .I3(sel[4]),
        .I4(sel[5]),
        .I5(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_135_n_0 ));
  LUT6 #(
    .INIT(64'hBFBCCCCC83803333)) 
    \p_0_out_inferred__0/product10_i_136 
       (.I0(\p_0_out_inferred__0/product10_i_329_n_0 ),
        .I1(sel[6]),
        .I2(sel[4]),
        .I3(\p_0_out_inferred__0/product10_i_330_n_0 ),
        .I4(sel[5]),
        .I5(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_136_n_0 ));
  LUT6 #(
    .INIT(64'h3B3B3B38C8C8C8C8)) 
    \p_0_out_inferred__0/product10_i_137 
       (.I0(\p_0_out_inferred__0/product10_i_331_n_0 ),
        .I1(sel[6]),
        .I2(sel[5]),
        .I3(sel[4]),
        .I4(\p_0_out_inferred__0/product10_i_197_n_0 ),
        .I5(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_137_n_0 ));
  LUT6 #(
    .INIT(64'h00155555FFAAAAAA)) 
    \p_0_out_inferred__0/product10_i_138 
       (.I0(sel[5]),
        .I1(sel[0]),
        .I2(\p_0_out_inferred__0/product10_i_184_n_0 ),
        .I3(sel[3]),
        .I4(sel[4]),
        .I5(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_138_n_0 ));
  LUT6 #(
    .INIT(64'hFF00FE11EE11EE11)) 
    \p_0_out_inferred__0/product10_i_139 
       (.I0(sel[5]),
        .I1(sel[4]),
        .I2(sel[0]),
        .I3(sel[11]),
        .I4(\p_0_out_inferred__0/product10_i_128_n_0 ),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_139_n_0 ));
  LUT6 #(
    .INIT(64'hFEAA00001055FFFF)) 
    \p_0_out_inferred__0/product10_i_14 
       (.I0(sel[6]),
        .I1(sel[4]),
        .I2(\p_0_out_inferred__0/product10_i_43_n_0 ),
        .I3(sel[5]),
        .I4(sel[7]),
        .I5(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_14_n_0 ));
  LUT6 #(
    .INIT(64'h0FFFFFFFF8000000)) 
    \p_0_out_inferred__0/product10_i_140 
       (.I0(sel[0]),
        .I1(\p_0_out_inferred__0/product10_i_184_n_0 ),
        .I2(sel[3]),
        .I3(sel[4]),
        .I4(sel[5]),
        .I5(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_140_n_0 ));
  LUT6 #(
    .INIT(64'hFAAA00000155FFFF)) 
    \p_0_out_inferred__0/product10_i_141 
       (.I0(sel[4]),
        .I1(sel[0]),
        .I2(\p_0_out_inferred__0/product10_i_128_n_0 ),
        .I3(sel[3]),
        .I4(sel[5]),
        .I5(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_141_n_0 ));
  LUT6 #(
    .INIT(64'hFEFEAAAA11005555)) 
    \p_0_out_inferred__0/product10_i_142 
       (.I0(sel[6]),
        .I1(sel[4]),
        .I2(\p_0_out_inferred__0/product10_i_332_n_0 ),
        .I3(\p_0_out_inferred__0/product10_i_333_n_0 ),
        .I4(sel[5]),
        .I5(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_142_n_0 ));
  LUT6 #(
    .INIT(64'h3BC43FC33BC43CC0)) 
    \p_0_out_inferred__0/product10_i_143 
       (.I0(product10_i_334_n_0),
        .I1(sel[6]),
        .I2(sel[5]),
        .I3(sel[11]),
        .I4(sel[4]),
        .I5(\p_0_out_inferred__0/product10_i_335_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_143_n_0 ));
  LUT5 #(
    .INIT(32'h1055FEAA)) 
    \p_0_out_inferred__0/product10_i_144 
       (.I0(sel[6]),
        .I1(sel[4]),
        .I2(\p_0_out_inferred__0/product10_i_329_n_0 ),
        .I3(sel[5]),
        .I4(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_144_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT5 #(
    .INIT(32'hFE0001FF)) 
    \p_0_out_inferred__0/product10_i_145 
       (.I0(sel[5]),
        .I1(sel[4]),
        .I2(sel[3]),
        .I3(sel[6]),
        .I4(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_145_n_0 ));
  LUT6 #(
    .INIT(64'h1010FFFFFFEE0000)) 
    \p_0_out_inferred__0/product10_i_146 
       (.I0(sel[5]),
        .I1(sel[4]),
        .I2(\p_0_out_inferred__0/product10_i_327_n_0 ),
        .I3(\p_0_out_inferred__0/product10_i_336_n_0 ),
        .I4(sel[6]),
        .I5(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_146_n_0 ));
  LUT6 #(
    .INIT(64'h3B383C3CCBC8C3C3)) 
    \p_0_out_inferred__0/product10_i_147 
       (.I0(\p_0_out_inferred__0/product10_i_337_n_0 ),
        .I1(sel[6]),
        .I2(sel[5]),
        .I3(\p_0_out_inferred__0/product10_i_335_n_0 ),
        .I4(sel[4]),
        .I5(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_147_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT5 #(
    .INIT(32'hFF0080FF)) 
    \p_0_out_inferred__0/product10_i_148 
       (.I0(sel[0]),
        .I1(sel[2]),
        .I2(sel[1]),
        .I3(sel[11]),
        .I4(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_148_n_0 ));
  LUT6 #(
    .INIT(64'hCCCFF3B333300C4C)) 
    \p_0_out_inferred__0/product10_i_149 
       (.I0(\p_0_out_inferred__0/product10_i_184_n_0 ),
        .I1(sel[6]),
        .I2(sel[4]),
        .I3(sel[3]),
        .I4(sel[5]),
        .I5(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_149_n_0 ));
  LUT6 #(
    .INIT(64'h3BC83FC33BC83CC0)) 
    \p_0_out_inferred__0/product10_i_15 
       (.I0(\p_0_out_inferred__0/product10_i_44_n_0 ),
        .I1(sel[8]),
        .I2(sel[7]),
        .I3(sel[11]),
        .I4(sel[6]),
        .I5(\p_0_out_inferred__0/product10_i_45_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_15_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \p_0_out_inferred__0/product10_i_150 
       (.I0(\p_0_out_inferred__0/product10_i_338_n_0 ),
        .I1(sel[11]),
        .I2(sel[6]),
        .I3(\p_0_out_inferred__0/product10_i_339_n_0 ),
        .I4(sel[5]),
        .I5(\p_0_out_inferred__0/product10_i_340_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_150_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \p_0_out_inferred__0/product10_i_151 
       (.I0(\p_0_out_inferred__0/product10_i_341_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_342_n_0 ),
        .I2(sel[6]),
        .I3(\p_0_out_inferred__0/product10_i_343_n_0 ),
        .I4(sel[5]),
        .I5(\p_0_out_inferred__0/product10_i_344_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_151_n_0 ));
  LUT6 #(
    .INIT(64'hB3B00C0C8F8CF3F3)) 
    \p_0_out_inferred__0/product10_i_152 
       (.I0(\p_0_out_inferred__0/product10_i_43_n_0 ),
        .I1(sel[6]),
        .I2(sel[4]),
        .I3(\p_0_out_inferred__0/product10_i_330_n_0 ),
        .I4(sel[5]),
        .I5(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_152_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \p_0_out_inferred__0/product10_i_153 
       (.I0(\p_0_out_inferred__0/product10_i_345_n_0 ),
        .I1(sel[6]),
        .I2(\p_0_out_inferred__0/product10_i_346_n_0 ),
        .I3(sel[5]),
        .I4(\p_0_out_inferred__0/product10_i_340_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_153_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \p_0_out_inferred__0/product10_i_154 
       (.I0(\p_0_out_inferred__0/product10_i_347_n_0 ),
        .I1(sel[6]),
        .I2(\p_0_out_inferred__0/product10_i_338_n_0 ),
        .I3(sel[5]),
        .I4(\p_0_out_inferred__0/product10_i_348_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_154_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \p_0_out_inferred__0/product10_i_155 
       (.I0(\p_0_out_inferred__0/product10_i_349_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_350_n_0 ),
        .I2(sel[6]),
        .I3(sel[11]),
        .I4(sel[5]),
        .I5(\p_0_out_inferred__0/product10_i_342_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_155_n_0 ));
  LUT6 #(
    .INIT(64'hCFCCB3B333308C8C)) 
    \p_0_out_inferred__0/product10_i_156 
       (.I0(\p_0_out_inferred__0/product10_i_351_n_0 ),
        .I1(sel[6]),
        .I2(sel[4]),
        .I3(\p_0_out_inferred__0/product10_i_329_n_0 ),
        .I4(sel[5]),
        .I5(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_156_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h555EAAAA)) 
    \p_0_out_inferred__0/product10_i_157 
       (.I0(sel[11]),
        .I1(sel[0]),
        .I2(sel[2]),
        .I3(sel[1]),
        .I4(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_157_n_0 ));
  LUT6 #(
    .INIT(64'h3B38CCCCCBC83333)) 
    \p_0_out_inferred__0/product10_i_158 
       (.I0(\p_0_out_inferred__0/product10_i_329_n_0 ),
        .I1(sel[6]),
        .I2(sel[4]),
        .I3(\p_0_out_inferred__0/product10_i_352_n_0 ),
        .I4(sel[5]),
        .I5(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_158_n_0 ));
  LUT6 #(
    .INIT(64'hFAAAAAAA04555555)) 
    \p_0_out_inferred__0/product10_i_159 
       (.I0(sel[6]),
        .I1(\p_0_out_inferred__0/product10_i_353_n_0 ),
        .I2(sel[3]),
        .I3(sel[4]),
        .I4(sel[5]),
        .I5(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_159_n_0 ));
  MUXF7 \p_0_out_inferred__0/product10_i_16 
       (.I0(\p_0_out_inferred__0/product10_i_46_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_47_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_16_n_0 ),
        .S(sel[10]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \p_0_out_inferred__0/product10_i_160 
       (.I0(\p_0_out_inferred__0/product10_i_354_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_355_n_0 ),
        .I2(sel[6]),
        .I3(sel[11]),
        .I4(sel[5]),
        .I5(\p_0_out_inferred__0/product10_i_356_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_160_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \p_0_out_inferred__0/product10_i_161 
       (.I0(\p_0_out_inferred__0/product10_i_357_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_358_n_0 ),
        .I2(sel[6]),
        .I3(\p_0_out_inferred__0/product10_i_131_n_0 ),
        .I4(sel[5]),
        .I5(\p_0_out_inferred__0/product10_i_359_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_161_n_0 ));
  LUT6 #(
    .INIT(64'h0000FFFF1555AAAA)) 
    \p_0_out_inferred__0/product10_i_162 
       (.I0(sel[4]),
        .I1(sel[0]),
        .I2(sel[1]),
        .I3(sel[2]),
        .I4(sel[11]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_162_n_0 ));
  LUT6 #(
    .INIT(64'hCCCCCCCCCCCDC9C9)) 
    \p_0_out_inferred__0/product10_i_163 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[2]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_163_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \p_0_out_inferred__0/product10_i_164 
       (.I0(\p_0_out_inferred__0/product10_i_360_n_0 ),
        .I1(sel[6]),
        .I2(\p_0_out_inferred__0/product10_i_361_n_0 ),
        .I3(sel[5]),
        .I4(\p_0_out_inferred__0/product10_i_362_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_164_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \p_0_out_inferred__0/product10_i_165 
       (.I0(\p_0_out_inferred__0/product10_i_363_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_364_n_0 ),
        .I2(sel[6]),
        .I3(\p_0_out_inferred__0/product10_i_339_n_0 ),
        .I4(sel[5]),
        .I5(\p_0_out_inferred__0/product10_i_365_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_165_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \p_0_out_inferred__0/product10_i_166 
       (.I0(\p_0_out_inferred__0/product10_i_366_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_342_n_0 ),
        .I2(sel[6]),
        .I3(\p_0_out_inferred__0/product10_i_367_n_0 ),
        .I4(sel[5]),
        .I5(\p_0_out_inferred__0/product10_i_368_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_166_n_0 ));
  LUT6 #(
    .INIT(64'hB8CCB833B833B8CC)) 
    \p_0_out_inferred__0/product10_i_167 
       (.I0(\p_0_out_inferred__0/product10_i_369_n_0 ),
        .I1(sel[6]),
        .I2(\p_0_out_inferred__0/product10_i_370_n_0 ),
        .I3(sel[5]),
        .I4(sel[4]),
        .I5(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_167_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \p_0_out_inferred__0/product10_i_168 
       (.I0(\p_0_out_inferred__0/product10_i_346_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_371_n_0 ),
        .I2(sel[6]),
        .I3(\p_0_out_inferred__0/product10_i_372_n_0 ),
        .I4(sel[5]),
        .I5(\p_0_out_inferred__0/product10_i_373_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_168_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \p_0_out_inferred__0/product10_i_169 
       (.I0(\p_0_out_inferred__0/product10_i_374_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_375_n_0 ),
        .I2(sel[6]),
        .I3(\p_0_out_inferred__0/product10_i_338_n_0 ),
        .I4(sel[5]),
        .I5(\p_0_out_inferred__0/product10_i_376_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_169_n_0 ));
  MUXF7 \p_0_out_inferred__0/product10_i_17 
       (.I0(\p_0_out_inferred__0/product10_i_48_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_49_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_17_n_0 ),
        .S(sel[10]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \p_0_out_inferred__0/product10_i_170 
       (.I0(\p_0_out_inferred__0/product10_i_377_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_350_n_0 ),
        .I2(sel[6]),
        .I3(\p_0_out_inferred__0/product10_i_378_n_0 ),
        .I4(sel[5]),
        .I5(\p_0_out_inferred__0/product10_i_331_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_170_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \p_0_out_inferred__0/product10_i_171 
       (.I0(\p_0_out_inferred__0/product10_i_379_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_380_n_0 ),
        .I2(sel[6]),
        .I3(\p_0_out_inferred__0/product10_i_381_n_0 ),
        .I4(sel[5]),
        .I5(\p_0_out_inferred__0/product10_i_382_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_171_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFC0000000)) 
    \p_0_out_inferred__0/product10_i_172 
       (.I0(sel[0]),
        .I1(sel[1]),
        .I2(sel[2]),
        .I3(sel[3]),
        .I4(sel[4]),
        .I5(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_172_n_0 ));
  LUT6 #(
    .INIT(64'hFC00000001FFFFFF)) 
    \p_0_out_inferred__0/product10_i_173 
       (.I0(sel[0]),
        .I1(sel[1]),
        .I2(sel[2]),
        .I3(sel[3]),
        .I4(sel[4]),
        .I5(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_173_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \p_0_out_inferred__0/product10_i_174 
       (.I0(\p_0_out_inferred__0/product10_i_383_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_132_n_0 ),
        .I2(sel[6]),
        .I3(\p_0_out_inferred__0/product10_i_384_n_0 ),
        .I4(sel[5]),
        .I5(\p_0_out_inferred__0/product10_i_385_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_174_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \p_0_out_inferred__0/product10_i_175 
       (.I0(\p_0_out_inferred__0/product10_i_386_n_0 ),
        .I1(sel[11]),
        .I2(sel[6]),
        .I3(\p_0_out_inferred__0/product10_i_387_n_0 ),
        .I4(sel[5]),
        .I5(\p_0_out_inferred__0/product10_i_388_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_175_n_0 ));
  MUXF7 \p_0_out_inferred__0/product10_i_176 
       (.I0(\p_0_out_inferred__0/product10_i_389_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_390_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_176_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_177 
       (.I0(\p_0_out_inferred__0/product10_i_391_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_392_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_177_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_178 
       (.I0(\p_0_out_inferred__0/product10_i_393_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_394_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_178_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_179 
       (.I0(\p_0_out_inferred__0/product10_i_395_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_396_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_179_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_18 
       (.I0(\p_0_out_inferred__0/product10_i_50_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_51_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_18_n_0 ),
        .S(sel[10]));
  MUXF7 \p_0_out_inferred__0/product10_i_180 
       (.I0(\p_0_out_inferred__0/product10_i_397_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_398_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_180_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_181 
       (.I0(\p_0_out_inferred__0/product10_i_399_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_400_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_181_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_182 
       (.I0(\p_0_out_inferred__0/product10_i_401_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_402_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_182_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_183 
       (.I0(\p_0_out_inferred__0/product10_i_403_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_404_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_183_n_0 ),
        .S(sel[5]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \p_0_out_inferred__0/product10_i_184 
       (.I0(sel[2]),
        .I1(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_184_n_0 ));
  LUT6 #(
    .INIT(64'h800000003FFFFFFF)) 
    \p_0_out_inferred__0/product10_i_185 
       (.I0(sel[0]),
        .I1(sel[2]),
        .I2(sel[1]),
        .I3(sel[3]),
        .I4(sel[4]),
        .I5(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_185_n_0 ));
  LUT6 #(
    .INIT(64'h03FFFFFFFE000000)) 
    \p_0_out_inferred__0/product10_i_186 
       (.I0(sel[0]),
        .I1(sel[2]),
        .I2(sel[1]),
        .I3(sel[3]),
        .I4(sel[4]),
        .I5(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_186_n_0 ));
  MUXF7 \p_0_out_inferred__0/product10_i_187 
       (.I0(\p_0_out_inferred__0/product10_i_405_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_406_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_187_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_188 
       (.I0(\p_0_out_inferred__0/product10_i_407_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_408_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_188_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_189 
       (.I0(\p_0_out_inferred__0/product10_i_409_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_410_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_189_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_19 
       (.I0(\p_0_out_inferred__0/product10_i_52_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_53_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_19_n_0 ),
        .S(sel[10]));
  MUXF7 \p_0_out_inferred__0/product10_i_190 
       (.I0(\p_0_out_inferred__0/product10_i_411_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_412_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_190_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_191 
       (.I0(\p_0_out_inferred__0/product10_i_413_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_414_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_191_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_192 
       (.I0(\p_0_out_inferred__0/product10_i_415_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_416_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_192_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_193 
       (.I0(\p_0_out_inferred__0/product10_i_417_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_418_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_193_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_194 
       (.I0(\p_0_out_inferred__0/product10_i_419_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_420_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_194_n_0 ),
        .S(sel[5]));
  LUT6 #(
    .INIT(64'hFFFF0000EAAA5555)) 
    \p_0_out_inferred__0/product10_i_195 
       (.I0(sel[4]),
        .I1(sel[0]),
        .I2(sel[2]),
        .I3(sel[1]),
        .I4(sel[11]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_195_n_0 ));
  LUT6 #(
    .INIT(64'h3333333333323636)) 
    \p_0_out_inferred__0/product10_i_196 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[2]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_196_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \p_0_out_inferred__0/product10_i_197 
       (.I0(sel[0]),
        .I1(sel[2]),
        .I2(sel[1]),
        .I3(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_197_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'h0015)) 
    \p_0_out_inferred__0/product10_i_198 
       (.I0(sel[2]),
        .I1(sel[0]),
        .I2(sel[1]),
        .I3(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_198_n_0 ));
  MUXF7 \p_0_out_inferred__0/product10_i_199 
       (.I0(\p_0_out_inferred__0/product10_i_421_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_422_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_199_n_0 ),
        .S(sel[5]));
  LUT6 #(
    .INIT(64'hE04F0FFFE04F00F0)) 
    \p_0_out_inferred__0/product10_i_2 
       (.I0(sel[8]),
        .I1(\p_0_out_inferred__0/product10_i_14_n_0 ),
        .I2(sel[9]),
        .I3(sel[11]),
        .I4(sel[10]),
        .I5(\p_0_out_inferred__0/product10_i_15_n_0 ),
        .O(p_0_out[10]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \p_0_out_inferred__0/product10_i_20 
       (.I0(\p_0_out_inferred__0/product10_i_54_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_55_n_0 ),
        .I2(sel[10]),
        .I3(\p_0_out_inferred__0/product10_i_56_n_0 ),
        .I4(sel[8]),
        .I5(\p_0_out_inferred__0/product10_i_57_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_20_n_0 ));
  MUXF7 \p_0_out_inferred__0/product10_i_200 
       (.I0(\p_0_out_inferred__0/product10_i_423_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_424_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_200_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_201 
       (.I0(\p_0_out_inferred__0/product10_i_425_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_426_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_201_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_202 
       (.I0(\p_0_out_inferred__0/product10_i_427_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_428_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_202_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_203 
       (.I0(\p_0_out_inferred__0/product10_i_429_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_430_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_203_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_204 
       (.I0(\p_0_out_inferred__0/product10_i_431_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_432_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_204_n_0 ),
        .S(sel[5]));
  LUT6 #(
    .INIT(64'h694B4BD2D29696B4)) 
    \p_0_out_inferred__0/product10_i_205 
       (.I0(sel[5]),
        .I1(sel[4]),
        .I2(sel[11]),
        .I3(sel[1]),
        .I4(sel[2]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_205_n_0 ));
  MUXF7 \p_0_out_inferred__0/product10_i_206 
       (.I0(\p_0_out_inferred__0/product10_i_433_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_434_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_206_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_207 
       (.I0(\p_0_out_inferred__0/product10_i_435_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_436_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_207_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_208 
       (.I0(\p_0_out_inferred__0/product10_i_437_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_438_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_208_n_0 ),
        .S(sel[5]));
  LUT6 #(
    .INIT(64'h6969666676969699)) 
    \p_0_out_inferred__0/product10_i_209 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_209_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \p_0_out_inferred__0/product10_i_21 
       (.I0(\p_0_out_inferred__0/product10_i_58_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_59_n_0 ),
        .I2(sel[10]),
        .I3(\p_0_out_inferred__0/product10_i_60_n_0 ),
        .I4(sel[8]),
        .I5(\p_0_out_inferred__0/product10_i_61_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_21_n_0 ));
  LUT6 #(
    .INIT(64'h696A666696969699)) 
    \p_0_out_inferred__0/product10_i_210 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_210_n_0 ));
  LUT6 #(
    .INIT(64'h669949666666996C)) 
    \p_0_out_inferred__0/product10_i_211 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[0]),
        .I3(sel[3]),
        .I4(sel[2]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_211_n_0 ));
  MUXF7 \p_0_out_inferred__0/product10_i_212 
       (.I0(\p_0_out_inferred__0/product10_i_439_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_440_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_212_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_213 
       (.I0(\p_0_out_inferred__0/product10_i_441_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_442_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_213_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_214 
       (.I0(\p_0_out_inferred__0/product10_i_443_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_444_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_214_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_215 
       (.I0(\p_0_out_inferred__0/product10_i_445_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_446_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_215_n_0 ),
        .S(sel[5]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    \p_0_out_inferred__0/product10_i_216 
       (.I0(sel[2]),
        .I1(sel[1]),
        .I2(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_216_n_0 ));
  MUXF7 \p_0_out_inferred__0/product10_i_217 
       (.I0(\p_0_out_inferred__0/product10_i_447_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_448_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_217_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_218 
       (.I0(\p_0_out_inferred__0/product10_i_449_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_450_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_218_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_219 
       (.I0(\p_0_out_inferred__0/product10_i_451_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_452_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_219_n_0 ),
        .S(sel[5]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \p_0_out_inferred__0/product10_i_22 
       (.I0(\p_0_out_inferred__0/product10_i_62_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_63_n_0 ),
        .I2(sel[10]),
        .I3(\p_0_out_inferred__0/product10_i_64_n_0 ),
        .I4(sel[8]),
        .I5(\p_0_out_inferred__0/product10_i_65_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_22_n_0 ));
  MUXF7 \p_0_out_inferred__0/product10_i_220 
       (.I0(\p_0_out_inferred__0/product10_i_453_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_454_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_220_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_221 
       (.I0(\p_0_out_inferred__0/product10_i_455_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_456_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_221_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_222 
       (.I0(\p_0_out_inferred__0/product10_i_457_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_458_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_222_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_223 
       (.I0(\p_0_out_inferred__0/product10_i_459_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_460_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_223_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_224 
       (.I0(\p_0_out_inferred__0/product10_i_461_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_462_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_224_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_225 
       (.I0(\p_0_out_inferred__0/product10_i_463_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_464_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_225_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_226 
       (.I0(\p_0_out_inferred__0/product10_i_465_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_466_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_226_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_227 
       (.I0(\p_0_out_inferred__0/product10_i_467_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_468_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_227_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_228 
       (.I0(\p_0_out_inferred__0/product10_i_469_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_470_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_228_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_229 
       (.I0(\p_0_out_inferred__0/product10_i_471_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_472_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_229_n_0 ),
        .S(sel[5]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \p_0_out_inferred__0/product10_i_23 
       (.I0(\p_0_out_inferred__0/product10_i_66_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_67_n_0 ),
        .I2(sel[10]),
        .I3(\p_0_out_inferred__0/product10_i_68_n_0 ),
        .I4(sel[8]),
        .I5(\p_0_out_inferred__0/product10_i_69_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_23_n_0 ));
  MUXF7 \p_0_out_inferred__0/product10_i_230 
       (.I0(\p_0_out_inferred__0/product10_i_473_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_474_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_230_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_231 
       (.I0(\p_0_out_inferred__0/product10_i_475_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_476_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_231_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_232 
       (.I0(\p_0_out_inferred__0/product10_i_477_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_478_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_232_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_233 
       (.I0(\p_0_out_inferred__0/product10_i_479_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_480_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_233_n_0 ),
        .S(sel[5]));
  LUT6 #(
    .INIT(64'h9696989999696969)) 
    \p_0_out_inferred__0/product10_i_234 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_234_n_0 ));
  LUT6 #(
    .INIT(64'h9696969999596969)) 
    \p_0_out_inferred__0/product10_i_235 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_235_n_0 ));
  LUT6 #(
    .INIT(64'h96969B999969696C)) 
    \p_0_out_inferred__0/product10_i_236 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_236_n_0 ));
  MUXF7 \p_0_out_inferred__0/product10_i_237 
       (.I0(\p_0_out_inferred__0/product10_i_481_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_482_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_237_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_238 
       (.I0(\p_0_out_inferred__0/product10_i_483_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_484_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_238_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_239 
       (.I0(\p_0_out_inferred__0/product10_i_485_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_486_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_239_n_0 ),
        .S(sel[5]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \p_0_out_inferred__0/product10_i_24 
       (.I0(\p_0_out_inferred__0/product10_i_70_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_71_n_0 ),
        .I2(sel[8]),
        .I3(\p_0_out_inferred__0/product10_i_72_n_0 ),
        .I4(sel[7]),
        .I5(\p_0_out_inferred__0/product10_i_73_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_24_n_0 ));
  MUXF7 \p_0_out_inferred__0/product10_i_240 
       (.I0(\p_0_out_inferred__0/product10_i_487_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_488_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_240_n_0 ),
        .S(sel[5]));
  LUT6 #(
    .INIT(64'hC32DC3C33CC33CBC)) 
    \p_0_out_inferred__0/product10_i_241 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[2]),
        .I4(sel[0]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_241_n_0 ));
  LUT6 #(
    .INIT(64'hC3D03C3CC3C3C33C)) 
    \p_0_out_inferred__0/product10_i_242 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_242_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT5 #(
    .INIT(32'h9C669996)) 
    \p_0_out_inferred__0/product10_i_243 
       (.I0(sel[11]),
        .I1(sel[3]),
        .I2(sel[0]),
        .I3(sel[1]),
        .I4(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_243_n_0 ));
  LUT6 #(
    .INIT(64'hC3E33C3C1EC3C379)) 
    \p_0_out_inferred__0/product10_i_244 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_244_n_0 ));
  MUXF7 \p_0_out_inferred__0/product10_i_245 
       (.I0(\p_0_out_inferred__0/product10_i_489_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_490_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_245_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_246 
       (.I0(\p_0_out_inferred__0/product10_i_491_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_492_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_246_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_247 
       (.I0(\p_0_out_inferred__0/product10_i_493_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_494_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_247_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_248 
       (.I0(\p_0_out_inferred__0/product10_i_495_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_496_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_248_n_0 ),
        .S(sel[5]));
  LUT6 #(
    .INIT(64'h3377377666666666)) 
    \p_0_out_inferred__0/product10_i_249 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[0]),
        .I3(sel[2]),
        .I4(sel[1]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_249_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \p_0_out_inferred__0/product10_i_25 
       (.I0(\p_0_out_inferred__0/product10_i_74_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_75_n_0 ),
        .I2(sel[8]),
        .I3(\p_0_out_inferred__0/product10_i_76_n_0 ),
        .I4(sel[7]),
        .I5(\p_0_out_inferred__0/product10_i_77_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_25_n_0 ));
  LUT6 #(
    .INIT(64'hFFEA00000000FFFF)) 
    \p_0_out_inferred__0/product10_i_250 
       (.I0(sel[3]),
        .I1(sel[1]),
        .I2(sel[0]),
        .I3(sel[2]),
        .I4(sel[4]),
        .I5(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_250_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'hA999999D)) 
    \p_0_out_inferred__0/product10_i_251 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[2]),
        .I3(sel[1]),
        .I4(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_251_n_0 ));
  MUXF7 \p_0_out_inferred__0/product10_i_252 
       (.I0(\p_0_out_inferred__0/product10_i_497_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_498_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_252_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_253 
       (.I0(\p_0_out_inferred__0/product10_i_499_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_500_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_253_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_254 
       (.I0(\p_0_out_inferred__0/product10_i_501_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_502_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_254_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_255 
       (.I0(\p_0_out_inferred__0/product10_i_503_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_504_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_255_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_256 
       (.I0(\p_0_out_inferred__0/product10_i_505_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_506_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_256_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_257 
       (.I0(\p_0_out_inferred__0/product10_i_507_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_508_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_257_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_258 
       (.I0(\p_0_out_inferred__0/product10_i_509_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_510_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_258_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_259 
       (.I0(\p_0_out_inferred__0/product10_i_511_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_512_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_259_n_0 ),
        .S(sel[5]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \p_0_out_inferred__0/product10_i_26 
       (.I0(\p_0_out_inferred__0/product10_i_78_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_79_n_0 ),
        .I2(sel[8]),
        .I3(\p_0_out_inferred__0/product10_i_80_n_0 ),
        .I4(sel[7]),
        .I5(\p_0_out_inferred__0/product10_i_81_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_26_n_0 ));
  MUXF7 \p_0_out_inferred__0/product10_i_260 
       (.I0(\p_0_out_inferred__0/product10_i_513_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_514_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_260_n_0 ),
        .S(sel[5]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'hE0003FFF)) 
    \p_0_out_inferred__0/product10_i_261 
       (.I0(sel[2]),
        .I1(sel[3]),
        .I2(sel[4]),
        .I3(sel[5]),
        .I4(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_261_n_0 ));
  MUXF7 \p_0_out_inferred__0/product10_i_262 
       (.I0(\p_0_out_inferred__0/product10_i_515_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_516_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_262_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_263 
       (.I0(\p_0_out_inferred__0/product10_i_517_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_518_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_263_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_264 
       (.I0(\p_0_out_inferred__0/product10_i_519_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_520_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_264_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_265 
       (.I0(\p_0_out_inferred__0/product10_i_521_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_522_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_265_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_266 
       (.I0(\p_0_out_inferred__0/product10_i_523_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_524_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_266_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_267 
       (.I0(\p_0_out_inferred__0/product10_i_525_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_526_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_267_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_268 
       (.I0(\p_0_out_inferred__0/product10_i_527_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_528_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_268_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_269 
       (.I0(\p_0_out_inferred__0/product10_i_529_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_530_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_269_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_27 
       (.I0(\p_0_out_inferred__0/product10_i_82_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_83_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_27_n_0 ),
        .S(sel[8]));
  LUT6 #(
    .INIT(64'h3C3CD2C3C33D3CBC)) 
    \p_0_out_inferred__0/product10_i_270 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_270_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h66699366)) 
    \p_0_out_inferred__0/product10_i_271 
       (.I0(sel[11]),
        .I1(sel[3]),
        .I2(sel[0]),
        .I3(sel[1]),
        .I4(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_271_n_0 ));
  LUT6 #(
    .INIT(64'h3C3CC30E3CC33C3C)) 
    \p_0_out_inferred__0/product10_i_272 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[2]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_272_n_0 ));
  LUT6 #(
    .INIT(64'h3CC33C3CE13CC379)) 
    \p_0_out_inferred__0/product10_i_273 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[2]),
        .I4(sel[0]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_273_n_0 ));
  MUXF7 \p_0_out_inferred__0/product10_i_274 
       (.I0(\p_0_out_inferred__0/product10_i_531_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_532_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_274_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_275 
       (.I0(\p_0_out_inferred__0/product10_i_533_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_534_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_275_n_0 ),
        .S(sel[5]));
  MUXF8 \p_0_out_inferred__0/product10_i_276 
       (.I0(\p_0_out_inferred__0/product10_i_535_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_536_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_276_n_0 ),
        .S(sel[6]));
  MUXF8 \p_0_out_inferred__0/product10_i_277 
       (.I0(\p_0_out_inferred__0/product10_i_537_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_538_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_277_n_0 ),
        .S(sel[6]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \p_0_out_inferred__0/product10_i_278 
       (.I0(\p_0_out_inferred__0/product10_i_539_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_540_n_0 ),
        .I2(sel[6]),
        .I3(\p_0_out_inferred__0/product10_i_541_n_0 ),
        .I4(sel[5]),
        .I5(\p_0_out_inferred__0/product10_i_542_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_278_n_0 ));
  MUXF8 \p_0_out_inferred__0/product10_i_279 
       (.I0(\p_0_out_inferred__0/product10_i_543_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_544_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_279_n_0 ),
        .S(sel[6]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \p_0_out_inferred__0/product10_i_28 
       (.I0(\p_0_out_inferred__0/product10_i_84_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_85_n_0 ),
        .I2(sel[8]),
        .I3(\p_0_out_inferred__0/product10_i_86_n_0 ),
        .I4(sel[7]),
        .I5(\p_0_out_inferred__0/product10_i_87_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_28_n_0 ));
  MUXF8 \p_0_out_inferred__0/product10_i_280 
       (.I0(\p_0_out_inferred__0/product10_i_545_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_546_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_280_n_0 ),
        .S(sel[6]));
  MUXF8 \p_0_out_inferred__0/product10_i_281 
       (.I0(\p_0_out_inferred__0/product10_i_547_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_548_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_281_n_0 ),
        .S(sel[6]));
  MUXF8 \p_0_out_inferred__0/product10_i_282 
       (.I0(\p_0_out_inferred__0/product10_i_549_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_550_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_282_n_0 ),
        .S(sel[6]));
  LUT6 #(
    .INIT(64'hAFA0C0C0AFA0CFCF)) 
    \p_0_out_inferred__0/product10_i_283 
       (.I0(\p_0_out_inferred__0/product10_i_551_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_552_n_0 ),
        .I2(sel[6]),
        .I3(\p_0_out_inferred__0/product10_i_553_n_0 ),
        .I4(sel[5]),
        .I5(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_283_n_0 ));
  LUT6 #(
    .INIT(64'h5F50CFCF5F50C0C0)) 
    \p_0_out_inferred__0/product10_i_284 
       (.I0(sel[11]),
        .I1(\p_0_out_inferred__0/product10_i_554_n_0 ),
        .I2(sel[6]),
        .I3(\p_0_out_inferred__0/product10_i_555_n_0 ),
        .I4(sel[5]),
        .I5(\p_0_out_inferred__0/product10_i_556_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_284_n_0 ));
  MUXF8 \p_0_out_inferred__0/product10_i_285 
       (.I0(\p_0_out_inferred__0/product10_i_557_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_558_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_285_n_0 ),
        .S(sel[6]));
  MUXF8 \p_0_out_inferred__0/product10_i_286 
       (.I0(\p_0_out_inferred__0/product10_i_559_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_560_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_286_n_0 ),
        .S(sel[6]));
  MUXF8 \p_0_out_inferred__0/product10_i_287 
       (.I0(\p_0_out_inferred__0/product10_i_561_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_562_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_287_n_0 ),
        .S(sel[6]));
  MUXF8 \p_0_out_inferred__0/product10_i_288 
       (.I0(\p_0_out_inferred__0/product10_i_563_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_564_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_288_n_0 ),
        .S(sel[6]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \p_0_out_inferred__0/product10_i_289 
       (.I0(\p_0_out_inferred__0/product10_i_565_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_566_n_0 ),
        .I2(sel[6]),
        .I3(\p_0_out_inferred__0/product10_i_567_n_0 ),
        .I4(sel[5]),
        .I5(\p_0_out_inferred__0/product10_i_568_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_289_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \p_0_out_inferred__0/product10_i_29 
       (.I0(\p_0_out_inferred__0/product10_i_88_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_89_n_0 ),
        .I2(sel[8]),
        .I3(\p_0_out_inferred__0/product10_i_90_n_0 ),
        .I4(sel[7]),
        .I5(\p_0_out_inferred__0/product10_i_91_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_29_n_0 ));
  MUXF8 \p_0_out_inferred__0/product10_i_290 
       (.I0(\p_0_out_inferred__0/product10_i_569_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_570_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_290_n_0 ),
        .S(sel[6]));
  MUXF8 \p_0_out_inferred__0/product10_i_291 
       (.I0(\p_0_out_inferred__0/product10_i_571_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_572_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_291_n_0 ),
        .S(sel[6]));
  MUXF8 \p_0_out_inferred__0/product10_i_292 
       (.I0(\p_0_out_inferred__0/product10_i_573_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_574_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_292_n_0 ),
        .S(sel[6]));
  MUXF8 \p_0_out_inferred__0/product10_i_293 
       (.I0(\p_0_out_inferred__0/product10_i_575_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_576_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_293_n_0 ),
        .S(sel[6]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \p_0_out_inferred__0/product10_i_294 
       (.I0(\p_0_out_inferred__0/product10_i_577_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_578_n_0 ),
        .I2(sel[6]),
        .I3(\p_0_out_inferred__0/product10_i_579_n_0 ),
        .I4(sel[5]),
        .I5(\p_0_out_inferred__0/product10_i_580_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_294_n_0 ));
  MUXF8 \p_0_out_inferred__0/product10_i_295 
       (.I0(\p_0_out_inferred__0/product10_i_581_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_582_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_295_n_0 ),
        .S(sel[6]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \p_0_out_inferred__0/product10_i_296 
       (.I0(\p_0_out_inferred__0/product10_i_583_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_584_n_0 ),
        .I2(sel[6]),
        .I3(\p_0_out_inferred__0/product10_i_585_n_0 ),
        .I4(sel[5]),
        .I5(\p_0_out_inferred__0/product10_i_586_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_296_n_0 ));
  MUXF8 \p_0_out_inferred__0/product10_i_297 
       (.I0(\p_0_out_inferred__0/product10_i_587_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_588_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_297_n_0 ),
        .S(sel[6]));
  MUXF8 \p_0_out_inferred__0/product10_i_298 
       (.I0(\p_0_out_inferred__0/product10_i_589_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_590_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_298_n_0 ),
        .S(sel[6]));
  MUXF8 \p_0_out_inferred__0/product10_i_299 
       (.I0(\p_0_out_inferred__0/product10_i_591_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_592_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_299_n_0 ),
        .S(sel[6]));
  LUT3 #(
    .INIT(8'hE4)) 
    \p_0_out_inferred__0/product10_i_3 
       (.I0(sel[9]),
        .I1(\p_0_out_inferred__0/product10_i_16_n_0 ),
        .I2(\p_0_out_inferred__0/product10_i_17_n_0 ),
        .O(p_0_out[9]));
  MUXF7 \p_0_out_inferred__0/product10_i_30 
       (.I0(\p_0_out_inferred__0/product10_i_92_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_93_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_30_n_0 ),
        .S(sel[8]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \p_0_out_inferred__0/product10_i_300 
       (.I0(\p_0_out_inferred__0/product10_i_593_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_594_n_0 ),
        .I2(sel[6]),
        .I3(\p_0_out_inferred__0/product10_i_595_n_0 ),
        .I4(sel[5]),
        .I5(\p_0_out_inferred__0/product10_i_596_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_300_n_0 ));
  MUXF8 \p_0_out_inferred__0/product10_i_301 
       (.I0(\p_0_out_inferred__0/product10_i_597_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_598_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_301_n_0 ),
        .S(sel[6]));
  MUXF8 \p_0_out_inferred__0/product10_i_302 
       (.I0(\p_0_out_inferred__0/product10_i_599_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_600_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_302_n_0 ),
        .S(sel[6]));
  MUXF8 \p_0_out_inferred__0/product10_i_303 
       (.I0(\p_0_out_inferred__0/product10_i_601_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_602_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_303_n_0 ),
        .S(sel[6]));
  MUXF8 \p_0_out_inferred__0/product10_i_304 
       (.I0(\p_0_out_inferred__0/product10_i_603_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_604_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_304_n_0 ),
        .S(sel[6]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \p_0_out_inferred__0/product10_i_305 
       (.I0(\p_0_out_inferred__0/product10_i_605_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_606_n_0 ),
        .I2(sel[6]),
        .I3(\p_0_out_inferred__0/product10_i_607_n_0 ),
        .I4(sel[5]),
        .I5(\p_0_out_inferred__0/product10_i_608_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_305_n_0 ));
  MUXF8 \p_0_out_inferred__0/product10_i_306 
       (.I0(\p_0_out_inferred__0/product10_i_609_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_610_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_306_n_0 ),
        .S(sel[6]));
  MUXF8 \p_0_out_inferred__0/product10_i_307 
       (.I0(\p_0_out_inferred__0/product10_i_611_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_612_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_307_n_0 ),
        .S(sel[6]));
  MUXF7 \p_0_out_inferred__0/product10_i_308 
       (.I0(\p_0_out_inferred__0/product10_i_613_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_614_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_308_n_0 ),
        .S(sel[6]));
  MUXF7 \p_0_out_inferred__0/product10_i_309 
       (.I0(\p_0_out_inferred__0/product10_i_615_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_616_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_309_n_0 ),
        .S(sel[6]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \p_0_out_inferred__0/product10_i_31 
       (.I0(\p_0_out_inferred__0/product10_i_94_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_95_n_0 ),
        .I2(sel[8]),
        .I3(\p_0_out_inferred__0/product10_i_96_n_0 ),
        .I4(sel[7]),
        .I5(\p_0_out_inferred__0/product10_i_97_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_31_n_0 ));
  MUXF7 \p_0_out_inferred__0/product10_i_310 
       (.I0(\p_0_out_inferred__0/product10_i_617_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_618_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_310_n_0 ),
        .S(sel[6]));
  MUXF7 \p_0_out_inferred__0/product10_i_311 
       (.I0(\p_0_out_inferred__0/product10_i_619_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_620_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_311_n_0 ),
        .S(sel[6]));
  MUXF7 \p_0_out_inferred__0/product10_i_312 
       (.I0(\p_0_out_inferred__0/product10_i_621_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_622_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_312_n_0 ),
        .S(sel[6]));
  MUXF7 \p_0_out_inferred__0/product10_i_313 
       (.I0(\p_0_out_inferred__0/product10_i_623_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_624_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_313_n_0 ),
        .S(sel[6]));
  MUXF7 \p_0_out_inferred__0/product10_i_314 
       (.I0(\p_0_out_inferred__0/product10_i_625_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_626_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_314_n_0 ),
        .S(sel[6]));
  MUXF7 \p_0_out_inferred__0/product10_i_315 
       (.I0(\p_0_out_inferred__0/product10_i_627_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_628_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_315_n_0 ),
        .S(sel[6]));
  MUXF7 \p_0_out_inferred__0/product10_i_316 
       (.I0(\p_0_out_inferred__0/product10_i_629_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_630_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_316_n_0 ),
        .S(sel[6]));
  MUXF7 \p_0_out_inferred__0/product10_i_317 
       (.I0(\p_0_out_inferred__0/product10_i_631_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_632_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_317_n_0 ),
        .S(sel[6]));
  MUXF7 \p_0_out_inferred__0/product10_i_318 
       (.I0(\p_0_out_inferred__0/product10_i_633_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_634_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_318_n_0 ),
        .S(sel[6]));
  MUXF7 \p_0_out_inferred__0/product10_i_319 
       (.I0(\p_0_out_inferred__0/product10_i_635_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_636_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_319_n_0 ),
        .S(sel[6]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \p_0_out_inferred__0/product10_i_32 
       (.I0(\p_0_out_inferred__0/product10_i_98_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_99_n_0 ),
        .I2(sel[8]),
        .I3(\p_0_out_inferred__0/product10_i_100_n_0 ),
        .I4(sel[7]),
        .I5(\p_0_out_inferred__0/product10_i_101_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_32_n_0 ));
  MUXF7 \p_0_out_inferred__0/product10_i_320 
       (.I0(\p_0_out_inferred__0/product10_i_637_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_638_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_320_n_0 ),
        .S(sel[6]));
  MUXF7 \p_0_out_inferred__0/product10_i_321 
       (.I0(\p_0_out_inferred__0/product10_i_639_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_640_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_321_n_0 ),
        .S(sel[6]));
  MUXF7 \p_0_out_inferred__0/product10_i_322 
       (.I0(\p_0_out_inferred__0/product10_i_641_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_642_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_322_n_0 ),
        .S(sel[6]));
  MUXF7 \p_0_out_inferred__0/product10_i_323 
       (.I0(\p_0_out_inferred__0/product10_i_643_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_644_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_323_n_0 ),
        .S(sel[6]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'h55555A6A)) 
    \p_0_out_inferred__0/product10_i_324 
       (.I0(sel[11]),
        .I1(sel[1]),
        .I2(sel[2]),
        .I3(sel[0]),
        .I4(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_324_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'h07)) 
    \p_0_out_inferred__0/product10_i_325 
       (.I0(sel[1]),
        .I1(sel[0]),
        .I2(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_325_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'hF8)) 
    \p_0_out_inferred__0/product10_i_326 
       (.I0(sel[1]),
        .I1(sel[0]),
        .I2(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_326_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'h01FF)) 
    \p_0_out_inferred__0/product10_i_327 
       (.I0(sel[0]),
        .I1(sel[1]),
        .I2(sel[2]),
        .I3(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_327_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'hFE00)) 
    \p_0_out_inferred__0/product10_i_328 
       (.I0(sel[0]),
        .I1(sel[2]),
        .I2(sel[1]),
        .I3(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_328_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h5666AAAA)) 
    \p_0_out_inferred__0/product10_i_329 
       (.I0(sel[11]),
        .I1(sel[2]),
        .I2(sel[0]),
        .I3(sel[1]),
        .I4(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_329_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \p_0_out_inferred__0/product10_i_33 
       (.I0(\p_0_out_inferred__0/product10_i_102_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_103_n_0 ),
        .I2(sel[8]),
        .I3(\p_0_out_inferred__0/product10_i_104_n_0 ),
        .I4(sel[7]),
        .I5(\p_0_out_inferred__0/product10_i_105_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_33_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'hAAAA9995)) 
    \p_0_out_inferred__0/product10_i_330 
       (.I0(sel[11]),
        .I1(sel[2]),
        .I2(sel[1]),
        .I3(sel[0]),
        .I4(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_330_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'h01FFFE00)) 
    \p_0_out_inferred__0/product10_i_331 
       (.I0(sel[1]),
        .I1(sel[2]),
        .I2(sel[3]),
        .I3(sel[4]),
        .I4(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_331_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \p_0_out_inferred__0/product10_i_332 
       (.I0(sel[0]),
        .I1(sel[2]),
        .I2(sel[1]),
        .I3(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_332_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    \p_0_out_inferred__0/product10_i_333 
       (.I0(sel[0]),
        .I1(sel[1]),
        .I2(sel[2]),
        .I3(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_333_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'hAA95)) 
    \p_0_out_inferred__0/product10_i_335 
       (.I0(sel[11]),
        .I1(sel[2]),
        .I2(sel[1]),
        .I3(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_335_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hE0)) 
    \p_0_out_inferred__0/product10_i_336 
       (.I0(sel[1]),
        .I1(sel[2]),
        .I2(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_336_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT5 #(
    .INIT(32'h00FF7F00)) 
    \p_0_out_inferred__0/product10_i_337 
       (.I0(sel[0]),
        .I1(sel[1]),
        .I2(sel[2]),
        .I3(sel[11]),
        .I4(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_337_n_0 ));
  LUT6 #(
    .INIT(64'h3666666666666666)) 
    \p_0_out_inferred__0/product10_i_338 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[0]),
        .I3(sel[2]),
        .I4(sel[1]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_338_n_0 ));
  LUT6 #(
    .INIT(64'hFE00000001FFFFFF)) 
    \p_0_out_inferred__0/product10_i_339 
       (.I0(sel[0]),
        .I1(sel[1]),
        .I2(sel[2]),
        .I3(sel[3]),
        .I4(sel[4]),
        .I5(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_339_n_0 ));
  MUXF7 \p_0_out_inferred__0/product10_i_34 
       (.I0(\p_0_out_inferred__0/product10_i_106_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_107_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_34_n_0 ),
        .S(sel[8]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'h33333666)) 
    \p_0_out_inferred__0/product10_i_340 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[1]),
        .I3(sel[2]),
        .I4(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_340_n_0 ));
  LUT6 #(
    .INIT(64'h55FFFFFFEA000000)) 
    \p_0_out_inferred__0/product10_i_341 
       (.I0(sel[2]),
        .I1(sel[0]),
        .I2(sel[1]),
        .I3(sel[3]),
        .I4(sel[4]),
        .I5(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_341_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'hFE0001FF)) 
    \p_0_out_inferred__0/product10_i_342 
       (.I0(sel[2]),
        .I1(sel[1]),
        .I2(sel[3]),
        .I3(sel[4]),
        .I4(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_342_n_0 ));
  LUT6 #(
    .INIT(64'h3333333666666666)) 
    \p_0_out_inferred__0/product10_i_343 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[0]),
        .I3(sel[2]),
        .I4(sel[1]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_343_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFE00000000)) 
    \p_0_out_inferred__0/product10_i_344 
       (.I0(sel[4]),
        .I1(sel[3]),
        .I2(sel[1]),
        .I3(sel[2]),
        .I4(sel[0]),
        .I5(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_344_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'h1555EAAA)) 
    \p_0_out_inferred__0/product10_i_345 
       (.I0(sel[5]),
        .I1(sel[2]),
        .I2(sel[3]),
        .I3(sel[4]),
        .I4(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_345_n_0 ));
  LUT6 #(
    .INIT(64'hFFFE00000001FFFF)) 
    \p_0_out_inferred__0/product10_i_346 
       (.I0(sel[0]),
        .I1(sel[1]),
        .I2(sel[2]),
        .I3(sel[3]),
        .I4(sel[4]),
        .I5(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_346_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'hEA15)) 
    \p_0_out_inferred__0/product10_i_347 
       (.I0(sel[5]),
        .I1(sel[3]),
        .I2(sel[4]),
        .I3(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_347_n_0 ));
  LUT6 #(
    .INIT(64'hF0F0F0F0F0A5E5A5)) 
    \p_0_out_inferred__0/product10_i_348 
       (.I0(sel[4]),
        .I1(sel[0]),
        .I2(sel[11]),
        .I3(sel[2]),
        .I4(sel[1]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_348_n_0 ));
  LUT6 #(
    .INIT(64'hEA00000015FFFFFF)) 
    \p_0_out_inferred__0/product10_i_349 
       (.I0(sel[2]),
        .I1(sel[0]),
        .I2(sel[1]),
        .I3(sel[3]),
        .I4(sel[4]),
        .I5(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_349_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \p_0_out_inferred__0/product10_i_35 
       (.I0(\p_0_out_inferred__0/product10_i_108_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_109_n_0 ),
        .I2(sel[8]),
        .I3(\p_0_out_inferred__0/product10_i_110_n_0 ),
        .I4(sel[7]),
        .I5(\p_0_out_inferred__0/product10_i_111_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_35_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'h36)) 
    \p_0_out_inferred__0/product10_i_350 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_350_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'hAAA95555)) 
    \p_0_out_inferred__0/product10_i_351 
       (.I0(sel[11]),
        .I1(sel[0]),
        .I2(sel[1]),
        .I3(sel[2]),
        .I4(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_351_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'hAAA15555)) 
    \p_0_out_inferred__0/product10_i_352 
       (.I0(sel[11]),
        .I1(sel[0]),
        .I2(sel[1]),
        .I3(sel[2]),
        .I4(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_352_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    \p_0_out_inferred__0/product10_i_353 
       (.I0(sel[2]),
        .I1(sel[1]),
        .I2(sel[0]),
        .O(\p_0_out_inferred__0/product10_i_353_n_0 ));
  LUT6 #(
    .INIT(64'hFFFE00000003FFFF)) 
    \p_0_out_inferred__0/product10_i_354 
       (.I0(sel[0]),
        .I1(sel[2]),
        .I2(sel[1]),
        .I3(sel[3]),
        .I4(sel[4]),
        .I5(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_354_n_0 ));
  LUT6 #(
    .INIT(64'h0F0F0F1A5A5A5A5A)) 
    \p_0_out_inferred__0/product10_i_355 
       (.I0(sel[4]),
        .I1(sel[0]),
        .I2(sel[11]),
        .I3(sel[1]),
        .I4(sel[2]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_355_n_0 ));
  LUT6 #(
    .INIT(64'hAA00000057FFFFFF)) 
    \p_0_out_inferred__0/product10_i_356 
       (.I0(sel[2]),
        .I1(sel[1]),
        .I2(sel[0]),
        .I3(sel[3]),
        .I4(sel[4]),
        .I5(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_356_n_0 ));
  LUT6 #(
    .INIT(64'hFFC80000003FFFFF)) 
    \p_0_out_inferred__0/product10_i_357 
       (.I0(sel[0]),
        .I1(sel[2]),
        .I2(sel[1]),
        .I3(sel[3]),
        .I4(sel[4]),
        .I5(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_357_n_0 ));
  LUT6 #(
    .INIT(64'h007FFFFFFF000000)) 
    \p_0_out_inferred__0/product10_i_358 
       (.I0(sel[0]),
        .I1(sel[1]),
        .I2(sel[2]),
        .I3(sel[3]),
        .I4(sel[4]),
        .I5(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_358_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'h07FFF800)) 
    \p_0_out_inferred__0/product10_i_359 
       (.I0(sel[1]),
        .I1(sel[2]),
        .I2(sel[3]),
        .I3(sel[4]),
        .I4(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_359_n_0 ));
  MUXF7 \p_0_out_inferred__0/product10_i_36 
       (.I0(\p_0_out_inferred__0/product10_i_112_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_113_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_36_n_0 ),
        .S(sel[10]));
  LUT6 #(
    .INIT(64'h55402AAAAABFD555)) 
    \p_0_out_inferred__0/product10_i_360 
       (.I0(sel[5]),
        .I1(sel[2]),
        .I2(sel[1]),
        .I3(sel[3]),
        .I4(sel[4]),
        .I5(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_360_n_0 ));
  LUT6 #(
    .INIT(64'h7FFF8000FF0000FF)) 
    \p_0_out_inferred__0/product10_i_361 
       (.I0(sel[0]),
        .I1(sel[2]),
        .I2(sel[1]),
        .I3(sel[4]),
        .I4(sel[11]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_361_n_0 ));
  LUT6 #(
    .INIT(64'h0003FFFFFFFE0000)) 
    \p_0_out_inferred__0/product10_i_362 
       (.I0(sel[0]),
        .I1(sel[2]),
        .I2(sel[1]),
        .I3(sel[3]),
        .I4(sel[4]),
        .I5(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_362_n_0 ));
  LUT6 #(
    .INIT(64'hC999999999999999)) 
    \p_0_out_inferred__0/product10_i_363 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[0]),
        .I3(sel[1]),
        .I4(sel[2]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_363_n_0 ));
  LUT6 #(
    .INIT(64'h0055FFFFFFEA0000)) 
    \p_0_out_inferred__0/product10_i_364 
       (.I0(sel[2]),
        .I1(sel[0]),
        .I2(sel[1]),
        .I3(sel[3]),
        .I4(sel[4]),
        .I5(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_364_n_0 ));
  LUT6 #(
    .INIT(64'h78F0F0F0F0C3C3C3)) 
    \p_0_out_inferred__0/product10_i_365 
       (.I0(sel[0]),
        .I1(sel[4]),
        .I2(sel[11]),
        .I3(sel[2]),
        .I4(sel[1]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_365_n_0 ));
  LUT6 #(
    .INIT(64'h9913993336666666)) 
    \p_0_out_inferred__0/product10_i_366 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[0]),
        .I3(sel[2]),
        .I4(sel[1]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_366_n_0 ));
  LUT6 #(
    .INIT(64'h66CCCCC999999999)) 
    \p_0_out_inferred__0/product10_i_367 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[0]),
        .I3(sel[1]),
        .I4(sel[2]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_367_n_0 ));
  LUT6 #(
    .INIT(64'h55775776AA88A888)) 
    \p_0_out_inferred__0/product10_i_368 
       (.I0(sel[4]),
        .I1(sel[3]),
        .I2(sel[1]),
        .I3(sel[2]),
        .I4(sel[0]),
        .I5(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_368_n_0 ));
  LUT6 #(
    .INIT(64'h9993993337663666)) 
    \p_0_out_inferred__0/product10_i_369 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[1]),
        .I3(sel[2]),
        .I4(sel[0]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_369_n_0 ));
  MUXF7 \p_0_out_inferred__0/product10_i_37 
       (.I0(\p_0_out_inferred__0/product10_i_114_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_115_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_37_n_0 ),
        .S(sel[10]));
  LUT6 #(
    .INIT(64'h666C6E6CC9C9C999)) 
    \p_0_out_inferred__0/product10_i_370 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[2]),
        .I3(sel[1]),
        .I4(sel[0]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_370_n_0 ));
  LUT6 #(
    .INIT(64'h6666CCCCCD999999)) 
    \p_0_out_inferred__0/product10_i_371 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[0]),
        .I3(sel[1]),
        .I4(sel[2]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_371_n_0 ));
  LUT6 #(
    .INIT(64'h0001FFFFFFFE0000)) 
    \p_0_out_inferred__0/product10_i_372 
       (.I0(sel[0]),
        .I1(sel[2]),
        .I2(sel[1]),
        .I3(sel[3]),
        .I4(sel[4]),
        .I5(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_372_n_0 ));
  LUT6 #(
    .INIT(64'hC3C38F0F0F3C3C3C)) 
    \p_0_out_inferred__0/product10_i_373 
       (.I0(sel[0]),
        .I1(sel[4]),
        .I2(sel[11]),
        .I3(sel[1]),
        .I4(sel[2]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_373_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT4 #(
    .INIT(16'hC999)) 
    \p_0_out_inferred__0/product10_i_374 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_374_n_0 ));
  LUT6 #(
    .INIT(64'h66666666CCC9C9C9)) 
    \p_0_out_inferred__0/product10_i_375 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[2]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_375_n_0 ));
  LUT6 #(
    .INIT(64'hA5A5A50F0F1A5A5A)) 
    \p_0_out_inferred__0/product10_i_376 
       (.I0(sel[4]),
        .I1(sel[0]),
        .I2(sel[11]),
        .I3(sel[1]),
        .I4(sel[2]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_376_n_0 ));
  LUT6 #(
    .INIT(64'h3C783CF0F0F0F0C3)) 
    \p_0_out_inferred__0/product10_i_377 
       (.I0(sel[0]),
        .I1(sel[4]),
        .I2(sel[11]),
        .I3(sel[2]),
        .I4(sel[1]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_377_n_0 ));
  LUT6 #(
    .INIT(64'hF0A5E5A5A5A5A5A5)) 
    \p_0_out_inferred__0/product10_i_378 
       (.I0(sel[4]),
        .I1(sel[0]),
        .I2(sel[11]),
        .I3(sel[2]),
        .I4(sel[1]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_378_n_0 ));
  LUT6 #(
    .INIT(64'hEAAAAAAA55555555)) 
    \p_0_out_inferred__0/product10_i_379 
       (.I0(sel[4]),
        .I1(sel[3]),
        .I2(sel[1]),
        .I3(sel[2]),
        .I4(sel[0]),
        .I5(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_379_n_0 ));
  MUXF7 \p_0_out_inferred__0/product10_i_38 
       (.I0(\p_0_out_inferred__0/product10_i_116_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_117_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_38_n_0 ),
        .S(sel[10]));
  LUT6 #(
    .INIT(64'h3C3C3C78F0F0F0C3)) 
    \p_0_out_inferred__0/product10_i_380 
       (.I0(sel[0]),
        .I1(sel[4]),
        .I2(sel[11]),
        .I3(sel[2]),
        .I4(sel[1]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_380_n_0 ));
  LUT6 #(
    .INIT(64'h3336363666666666)) 
    \p_0_out_inferred__0/product10_i_381 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[2]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_381_n_0 ));
  LUT6 #(
    .INIT(64'hFFEA00000015FFFF)) 
    \p_0_out_inferred__0/product10_i_382 
       (.I0(sel[2]),
        .I1(sel[0]),
        .I2(sel[1]),
        .I3(sel[3]),
        .I4(sel[4]),
        .I5(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_382_n_0 ));
  LUT6 #(
    .INIT(64'hCCC9C9C999999999)) 
    \p_0_out_inferred__0/product10_i_383 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[2]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_383_n_0 ));
  LUT6 #(
    .INIT(64'hCCCCCC8999999999)) 
    \p_0_out_inferred__0/product10_i_384 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[0]),
        .I3(sel[1]),
        .I4(sel[2]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_384_n_0 ));
  LUT6 #(
    .INIT(64'h3736363666666666)) 
    \p_0_out_inferred__0/product10_i_385 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[2]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_385_n_0 ));
  LUT6 #(
    .INIT(64'h00FF01FF00FF55AA)) 
    \p_0_out_inferred__0/product10_i_386 
       (.I0(sel[4]),
        .I1(sel[1]),
        .I2(sel[0]),
        .I3(sel[11]),
        .I4(sel[3]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_386_n_0 ));
  LUT6 #(
    .INIT(64'hFF000000007FFFFF)) 
    \p_0_out_inferred__0/product10_i_387 
       (.I0(sel[0]),
        .I1(sel[1]),
        .I2(sel[2]),
        .I3(sel[3]),
        .I4(sel[4]),
        .I5(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_387_n_0 ));
  LUT6 #(
    .INIT(64'h55555555EAAAAAAA)) 
    \p_0_out_inferred__0/product10_i_388 
       (.I0(sel[4]),
        .I1(sel[3]),
        .I2(sel[1]),
        .I3(sel[2]),
        .I4(sel[0]),
        .I5(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_388_n_0 ));
  LUT6 #(
    .INIT(64'h0F0F0FA5A5B0F0F0)) 
    \p_0_out_inferred__0/product10_i_389 
       (.I0(sel[4]),
        .I1(sel[0]),
        .I2(sel[11]),
        .I3(sel[1]),
        .I4(sel[2]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_389_n_0 ));
  MUXF7 \p_0_out_inferred__0/product10_i_39 
       (.I0(\p_0_out_inferred__0/product10_i_118_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_119_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_39_n_0 ),
        .S(sel[10]));
  LUT6 #(
    .INIT(64'h96C6C6C7C3C3C363)) 
    \p_0_out_inferred__0/product10_i_390 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_390_n_0 ));
  LUT6 #(
    .INIT(64'h69796939393C3C3C)) 
    \p_0_out_inferred__0/product10_i_391 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[1]),
        .I4(sel[0]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_391_n_0 ));
  LUT5 #(
    .INIT(32'h9C96C6C3)) 
    \p_0_out_inferred__0/product10_i_392 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[1]),
        .I4(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_392_n_0 ));
  LUT6 #(
    .INIT(64'h0F0F43C3C3F0F0B4)) 
    \p_0_out_inferred__0/product10_i_393 
       (.I0(sel[0]),
        .I1(sel[4]),
        .I2(sel[11]),
        .I3(sel[1]),
        .I4(sel[2]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_393_n_0 ));
  LUT6 #(
    .INIT(64'hCCCC666667333339)) 
    \p_0_out_inferred__0/product10_i_394 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[0]),
        .I3(sel[1]),
        .I4(sel[2]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_394_n_0 ));
  LUT6 #(
    .INIT(64'h3399339998CCCCC6)) 
    \p_0_out_inferred__0/product10_i_395 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[0]),
        .I3(sel[2]),
        .I4(sel[1]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_395_n_0 ));
  LUT6 #(
    .INIT(64'hF0B4F03C3C0F0F4B)) 
    \p_0_out_inferred__0/product10_i_396 
       (.I0(sel[0]),
        .I1(sel[4]),
        .I2(sel[11]),
        .I3(sel[2]),
        .I4(sel[1]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_396_n_0 ));
  LUT6 #(
    .INIT(64'hC666666663333999)) 
    \p_0_out_inferred__0/product10_i_397 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[0]),
        .I3(sel[1]),
        .I4(sel[2]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_397_n_0 ));
  LUT6 #(
    .INIT(64'h999C9C9CC6666666)) 
    \p_0_out_inferred__0/product10_i_398 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[2]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_398_n_0 ));
  LUT6 #(
    .INIT(64'h3CC30FC30FC34BF0)) 
    \p_0_out_inferred__0/product10_i_399 
       (.I0(sel[0]),
        .I1(sel[4]),
        .I2(sel[11]),
        .I3(sel[3]),
        .I4(sel[2]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_399_n_0 ));
  MUXF8 \p_0_out_inferred__0/product10_i_4 
       (.I0(\p_0_out_inferred__0/product10_i_18_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_19_n_0 ),
        .O(p_0_out[8]),
        .S(sel[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \p_0_out_inferred__0/product10_i_40 
       (.I0(\p_0_out_inferred__0/product10_i_120_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_121_n_0 ),
        .I2(sel[10]),
        .I3(\p_0_out_inferred__0/product10_i_122_n_0 ),
        .I4(sel[8]),
        .I5(\p_0_out_inferred__0/product10_i_123_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_40_n_0 ));
  LUT6 #(
    .INIT(64'h8CC6C6C663636373)) 
    \p_0_out_inferred__0/product10_i_400 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[2]),
        .I3(sel[1]),
        .I4(sel[0]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_400_n_0 ));
  LUT5 #(
    .INIT(32'h3C3C3C4B)) 
    \p_0_out_inferred__0/product10_i_401 
       (.I0(sel[1]),
        .I1(sel[4]),
        .I2(sel[11]),
        .I3(sel[3]),
        .I4(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_401_n_0 ));
  LUT6 #(
    .INIT(64'hA5B0D25A5A5A5A5A)) 
    \p_0_out_inferred__0/product10_i_402 
       (.I0(sel[4]),
        .I1(sel[0]),
        .I2(sel[11]),
        .I3(sel[1]),
        .I4(sel[2]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_402_n_0 ));
  LUT6 #(
    .INIT(64'hFF0000FFA8FF5700)) 
    \p_0_out_inferred__0/product10_i_403 
       (.I0(sel[2]),
        .I1(sel[1]),
        .I2(sel[0]),
        .I3(sel[4]),
        .I4(sel[11]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_403_n_0 ));
  LUT6 #(
    .INIT(64'h67993999339999CC)) 
    \p_0_out_inferred__0/product10_i_404 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[0]),
        .I3(sel[3]),
        .I4(sel[2]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_404_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAA15555555)) 
    \p_0_out_inferred__0/product10_i_405 
       (.I0(sel[4]),
        .I1(sel[3]),
        .I2(sel[2]),
        .I3(sel[1]),
        .I4(sel[0]),
        .I5(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_405_n_0 ));
  LUT6 #(
    .INIT(64'h9999999913363636)) 
    \p_0_out_inferred__0/product10_i_406 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[2]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_406_n_0 ));
  LUT6 #(
    .INIT(64'h3766366666666666)) 
    \p_0_out_inferred__0/product10_i_407 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[1]),
        .I3(sel[2]),
        .I4(sel[0]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_407_n_0 ));
  LUT6 #(
    .INIT(64'h77A8FF00FE00AA55)) 
    \p_0_out_inferred__0/product10_i_408 
       (.I0(sel[4]),
        .I1(sel[1]),
        .I2(sel[0]),
        .I3(sel[11]),
        .I4(sel[2]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_408_n_0 ));
  LUT6 #(
    .INIT(64'h626B696999999999)) 
    \p_0_out_inferred__0/product10_i_409 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[2]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_409_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \p_0_out_inferred__0/product10_i_41 
       (.I0(\p_0_out_inferred__0/product10_i_124_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_125_n_0 ),
        .I2(sel[10]),
        .I3(\p_0_out_inferred__0/product10_i_126_n_0 ),
        .I4(sel[8]),
        .I5(\p_0_out_inferred__0/product10_i_127_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_41_n_0 ));
  LUT6 #(
    .INIT(64'h666666A999999999)) 
    \p_0_out_inferred__0/product10_i_410 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[0]),
        .I3(sel[1]),
        .I4(sel[2]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_410_n_0 ));
  LUT6 #(
    .INIT(64'h6666668999999999)) 
    \p_0_out_inferred__0/product10_i_411 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[0]),
        .I3(sel[1]),
        .I4(sel[2]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_411_n_0 ));
  LUT6 #(
    .INIT(64'h6C6969C999999999)) 
    \p_0_out_inferred__0/product10_i_412 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[2]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_412_n_0 ));
  LUT5 #(
    .INIT(32'h3C783CC3)) 
    \p_0_out_inferred__0/product10_i_413 
       (.I0(sel[1]),
        .I1(sel[4]),
        .I2(sel[11]),
        .I3(sel[3]),
        .I4(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_413_n_0 ));
  LUT6 #(
    .INIT(64'h6666666649999999)) 
    \p_0_out_inferred__0/product10_i_414 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[0]),
        .I3(sel[1]),
        .I4(sel[2]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_414_n_0 ));
  LUT6 #(
    .INIT(64'h5555AAAA6AAA5555)) 
    \p_0_out_inferred__0/product10_i_415 
       (.I0(sel[4]),
        .I1(sel[0]),
        .I2(sel[2]),
        .I3(sel[1]),
        .I4(sel[11]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_415_n_0 ));
  LUT6 #(
    .INIT(64'h6666666667199999)) 
    \p_0_out_inferred__0/product10_i_416 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[0]),
        .I3(sel[1]),
        .I4(sel[2]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_416_n_0 ));
  LUT6 #(
    .INIT(64'h55A8FF00FF00EA55)) 
    \p_0_out_inferred__0/product10_i_417 
       (.I0(sel[4]),
        .I1(sel[0]),
        .I2(sel[1]),
        .I3(sel[11]),
        .I4(sel[2]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_417_n_0 ));
  LUT6 #(
    .INIT(64'hFFF80000000FFFFF)) 
    \p_0_out_inferred__0/product10_i_418 
       (.I0(sel[0]),
        .I1(sel[1]),
        .I2(sel[2]),
        .I3(sel[3]),
        .I4(sel[4]),
        .I5(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_418_n_0 ));
  LUT6 #(
    .INIT(64'hA50F0F1A5A5A5A5A)) 
    \p_0_out_inferred__0/product10_i_419 
       (.I0(sel[4]),
        .I1(sel[0]),
        .I2(sel[11]),
        .I3(sel[1]),
        .I4(sel[2]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_419_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \p_0_out_inferred__0/product10_i_42 
       (.I0(sel[1]),
        .I1(sel[2]),
        .I2(sel[0]),
        .O(\p_0_out_inferred__0/product10_i_42_n_0 ));
  LUT6 #(
    .INIT(64'h0001FFFFFFFC0000)) 
    \p_0_out_inferred__0/product10_i_420 
       (.I0(sel[0]),
        .I1(sel[1]),
        .I2(sel[2]),
        .I3(sel[3]),
        .I4(sel[4]),
        .I5(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_420_n_0 ));
  LUT6 #(
    .INIT(64'h333933B999CC9CCC)) 
    \p_0_out_inferred__0/product10_i_421 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[1]),
        .I3(sel[2]),
        .I4(sel[0]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_421_n_0 ));
  LUT6 #(
    .INIT(64'hCCC6C6C663236333)) 
    \p_0_out_inferred__0/product10_i_422 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[2]),
        .I3(sel[1]),
        .I4(sel[0]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_422_n_0 ));
  LUT6 #(
    .INIT(64'h0F0F4BC3C3F0F0F0)) 
    \p_0_out_inferred__0/product10_i_423 
       (.I0(sel[0]),
        .I1(sel[4]),
        .I2(sel[11]),
        .I3(sel[1]),
        .I4(sel[2]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_423_n_0 ));
  LUT6 #(
    .INIT(64'hCCC6C4C663636333)) 
    \p_0_out_inferred__0/product10_i_424 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[2]),
        .I3(sel[1]),
        .I4(sel[0]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_424_n_0 ));
  LUT6 #(
    .INIT(64'h1F00F0FFFCFF0300)) 
    \p_0_out_inferred__0/product10_i_425 
       (.I0(sel[0]),
        .I1(sel[1]),
        .I2(sel[2]),
        .I3(sel[4]),
        .I4(sel[11]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_425_n_0 ));
  LUT6 #(
    .INIT(64'hCCCC466663333339)) 
    \p_0_out_inferred__0/product10_i_426 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[0]),
        .I3(sel[1]),
        .I4(sel[2]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_426_n_0 ));
  LUT6 #(
    .INIT(64'h399C9C9CC6C6C662)) 
    \p_0_out_inferred__0/product10_i_427 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[2]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_427_n_0 ));
  LUT6 #(
    .INIT(64'hCC6666633333B999)) 
    \p_0_out_inferred__0/product10_i_428 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[0]),
        .I3(sel[1]),
        .I4(sel[2]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_428_n_0 ));
  LUT6 #(
    .INIT(64'hC3C3C3C3C3F0343C)) 
    \p_0_out_inferred__0/product10_i_429 
       (.I0(sel[0]),
        .I1(sel[4]),
        .I2(sel[11]),
        .I3(sel[1]),
        .I4(sel[2]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_429_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'hA9995555)) 
    \p_0_out_inferred__0/product10_i_43 
       (.I0(sel[11]),
        .I1(sel[2]),
        .I2(sel[0]),
        .I3(sel[1]),
        .I4(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_43_n_0 ));
  LUT6 #(
    .INIT(64'h693999993999999C)) 
    \p_0_out_inferred__0/product10_i_430 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[1]),
        .I4(sel[2]),
        .I5(sel[0]),
        .O(\p_0_out_inferred__0/product10_i_430_n_0 ));
  LUT6 #(
    .INIT(64'hB43C3C3C3C4F0FC3)) 
    \p_0_out_inferred__0/product10_i_431 
       (.I0(sel[0]),
        .I1(sel[4]),
        .I2(sel[11]),
        .I3(sel[2]),
        .I4(sel[1]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_431_n_0 ));
  LUT6 #(
    .INIT(64'hF00FEF100FF00FF0)) 
    \p_0_out_inferred__0/product10_i_432 
       (.I0(sel[0]),
        .I1(sel[1]),
        .I2(sel[4]),
        .I3(sel[11]),
        .I4(sel[2]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_432_n_0 ));
  LUT6 #(
    .INIT(64'h0F4FC3C3C3F0F034)) 
    \p_0_out_inferred__0/product10_i_433 
       (.I0(sel[0]),
        .I1(sel[4]),
        .I2(sel[11]),
        .I3(sel[1]),
        .I4(sel[2]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_433_n_0 ));
  LUT6 #(
    .INIT(64'h80FF7F000700F8FF)) 
    \p_0_out_inferred__0/product10_i_434 
       (.I0(sel[1]),
        .I1(sel[0]),
        .I2(sel[2]),
        .I3(sel[4]),
        .I4(sel[11]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_434_n_0 ));
  LUT6 #(
    .INIT(64'hC699636666869966)) 
    \p_0_out_inferred__0/product10_i_435 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[0]),
        .I3(sel[3]),
        .I4(sel[2]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_435_n_0 ));
  LUT6 #(
    .INIT(64'h99C9666669687696)) 
    \p_0_out_inferred__0/product10_i_436 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[2]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_436_n_0 ));
  LUT6 #(
    .INIT(64'h9989996969666E76)) 
    \p_0_out_inferred__0/product10_i_437 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[1]),
        .I4(sel[0]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_437_n_0 ));
  LUT6 #(
    .INIT(64'h9693E96999996C66)) 
    \p_0_out_inferred__0/product10_i_438 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[2]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_438_n_0 ));
  LUT6 #(
    .INIT(64'h63C6C696969C9C39)) 
    \p_0_out_inferred__0/product10_i_439 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_439_n_0 ));
  LUT6 #(
    .INIT(64'h00155555FFEAAAAA)) 
    \p_0_out_inferred__0/product10_i_44 
       (.I0(sel[5]),
        .I1(sel[1]),
        .I2(sel[2]),
        .I3(sel[3]),
        .I4(sel[4]),
        .I5(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_44_n_0 ));
  LUT6 #(
    .INIT(64'h969C9CB939696963)) 
    \p_0_out_inferred__0/product10_i_440 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_440_n_0 ));
  LUT6 #(
    .INIT(64'h87C33C8F3CC3783C)) 
    \p_0_out_inferred__0/product10_i_441 
       (.I0(sel[0]),
        .I1(sel[4]),
        .I2(sel[11]),
        .I3(sel[3]),
        .I4(sel[2]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_441_n_0 ));
  LUT6 #(
    .INIT(64'h296966C669629696)) 
    \p_0_out_inferred__0/product10_i_442 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[2]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_442_n_0 ));
  LUT6 #(
    .INIT(64'hCCCC3333C9936C6C)) 
    \p_0_out_inferred__0/product10_i_443 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[1]),
        .I3(sel[0]),
        .I4(sel[3]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_443_n_0 ));
  LUT6 #(
    .INIT(64'h3C6329C339C36BC3)) 
    \p_0_out_inferred__0/product10_i_444 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[2]),
        .I4(sel[1]),
        .I5(sel[0]),
        .O(\p_0_out_inferred__0/product10_i_444_n_0 ));
  LUT6 #(
    .INIT(64'hCD66996CB3CC33D9)) 
    \p_0_out_inferred__0/product10_i_445 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[0]),
        .I3(sel[3]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_445_n_0 ));
  LUT6 #(
    .INIT(64'h32996C33669BCC66)) 
    \p_0_out_inferred__0/product10_i_446 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[0]),
        .I3(sel[3]),
        .I4(sel[2]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_446_n_0 ));
  LUT6 #(
    .INIT(64'h9D9C949666666666)) 
    \p_0_out_inferred__0/product10_i_447 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[2]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_447_n_0 ));
  LUT6 #(
    .INIT(64'hAAA155575555AAAA)) 
    \p_0_out_inferred__0/product10_i_448 
       (.I0(sel[4]),
        .I1(sel[0]),
        .I2(sel[1]),
        .I3(sel[2]),
        .I4(sel[11]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_448_n_0 ));
  LUT6 #(
    .INIT(64'h850F1F5A5A5A5A5A)) 
    \p_0_out_inferred__0/product10_i_449 
       (.I0(sel[4]),
        .I1(sel[0]),
        .I2(sel[11]),
        .I3(sel[1]),
        .I4(sel[2]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_449_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFE00000000)) 
    \p_0_out_inferred__0/product10_i_45 
       (.I0(sel[5]),
        .I1(sel[4]),
        .I2(sel[3]),
        .I3(\p_0_out_inferred__0/product10_i_128_n_0 ),
        .I4(sel[0]),
        .I5(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_45_n_0 ));
  LUT6 #(
    .INIT(64'h010FFFFFFFF00000)) 
    \p_0_out_inferred__0/product10_i_450 
       (.I0(sel[1]),
        .I1(sel[0]),
        .I2(sel[3]),
        .I3(sel[2]),
        .I4(sel[4]),
        .I5(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_450_n_0 ));
  LUT6 #(
    .INIT(64'h239D33CC33CCB9CC)) 
    \p_0_out_inferred__0/product10_i_451 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[0]),
        .I3(sel[3]),
        .I4(sel[2]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_451_n_0 ));
  LUT6 #(
    .INIT(64'h94D696C6C6C3C3C3)) 
    \p_0_out_inferred__0/product10_i_452 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[1]),
        .I4(sel[0]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_452_n_0 ));
  LUT6 #(
    .INIT(64'h6699339D23993BCC)) 
    \p_0_out_inferred__0/product10_i_453 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[0]),
        .I3(sel[3]),
        .I4(sel[2]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_453_n_0 ));
  LUT6 #(
    .INIT(64'hDD0255AA54AA02FD)) 
    \p_0_out_inferred__0/product10_i_454 
       (.I0(sel[4]),
        .I1(sel[1]),
        .I2(sel[0]),
        .I3(sel[11]),
        .I4(sel[2]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_454_n_0 ));
  LUT6 #(
    .INIT(64'hCCCC333783136CCC)) 
    \p_0_out_inferred__0/product10_i_455 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[1]),
        .I3(sel[0]),
        .I4(sel[3]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_455_n_0 ));
  LUT6 #(
    .INIT(64'hCC33CC33CC3303EC)) 
    \p_0_out_inferred__0/product10_i_456 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[0]),
        .I3(sel[3]),
        .I4(sel[2]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_456_n_0 ));
  LUT6 #(
    .INIT(64'hC3C3C32FC3C3C33C)) 
    \p_0_out_inferred__0/product10_i_457 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[1]),
        .I4(sel[2]),
        .I5(sel[0]),
        .O(\p_0_out_inferred__0/product10_i_457_n_0 ));
  LUT6 #(
    .INIT(64'hCC33639DC63333CC)) 
    \p_0_out_inferred__0/product10_i_458 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[0]),
        .I3(sel[3]),
        .I4(sel[2]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_458_n_0 ));
  LUT6 #(
    .INIT(64'hAAAA55571555AAAA)) 
    \p_0_out_inferred__0/product10_i_459 
       (.I0(sel[4]),
        .I1(sel[0]),
        .I2(sel[1]),
        .I3(sel[2]),
        .I4(sel[11]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_459_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \p_0_out_inferred__0/product10_i_46 
       (.I0(sel[11]),
        .I1(\p_0_out_inferred__0/product10_i_129_n_0 ),
        .I2(sel[8]),
        .I3(\p_0_out_inferred__0/product10_i_130_n_0 ),
        .I4(sel[7]),
        .I5(\p_0_out_inferred__0/product10_i_13_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_46_n_0 ));
  LUT6 #(
    .INIT(64'hAAAA5555BD550AAA)) 
    \p_0_out_inferred__0/product10_i_460 
       (.I0(sel[4]),
        .I1(sel[0]),
        .I2(sel[1]),
        .I3(sel[2]),
        .I4(sel[11]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_460_n_0 ));
  LUT6 #(
    .INIT(64'hC9C9C9D999999999)) 
    \p_0_out_inferred__0/product10_i_461 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[2]),
        .I3(sel[1]),
        .I4(sel[0]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_461_n_0 ));
  LUT6 #(
    .INIT(64'h9999999993B23636)) 
    \p_0_out_inferred__0/product10_i_462 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[2]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_462_n_0 ));
  LUT6 #(
    .INIT(64'hFCCCCCCC33333337)) 
    \p_0_out_inferred__0/product10_i_463 
       (.I0(sel[0]),
        .I1(sel[4]),
        .I2(sel[3]),
        .I3(sel[2]),
        .I4(sel[1]),
        .I5(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_463_n_0 ));
  LUT6 #(
    .INIT(64'h0001FFFFFFEA0000)) 
    \p_0_out_inferred__0/product10_i_464 
       (.I0(sel[2]),
        .I1(sel[0]),
        .I2(sel[1]),
        .I3(sel[3]),
        .I4(sel[4]),
        .I5(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_464_n_0 ));
  LUT6 #(
    .INIT(64'hC0007FFF3FFF0000)) 
    \p_0_out_inferred__0/product10_i_465 
       (.I0(sel[4]),
        .I1(sel[2]),
        .I2(sel[1]),
        .I3(sel[0]),
        .I4(sel[11]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_465_n_0 ));
  LUT6 #(
    .INIT(64'hC3943C3CC2BC3C3C)) 
    \p_0_out_inferred__0/product10_i_466 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[1]),
        .I4(sel[2]),
        .I5(sel[0]),
        .O(\p_0_out_inferred__0/product10_i_466_n_0 ));
  LUT6 #(
    .INIT(64'hCE6333993333CCCC)) 
    \p_0_out_inferred__0/product10_i_467 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[0]),
        .I3(sel[1]),
        .I4(sel[3]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_467_n_0 ));
  LUT6 #(
    .INIT(64'hF33333331CCCCCCC)) 
    \p_0_out_inferred__0/product10_i_468 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[0]),
        .I3(sel[2]),
        .I4(sel[1]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_468_n_0 ));
  LUT6 #(
    .INIT(64'h0FA5A5B0F0F0DA5A)) 
    \p_0_out_inferred__0/product10_i_469 
       (.I0(sel[4]),
        .I1(sel[0]),
        .I2(sel[11]),
        .I3(sel[1]),
        .I4(sel[2]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_469_n_0 ));
  LUT6 #(
    .INIT(64'hE00000004FFFFFFF)) 
    \p_0_out_inferred__0/product10_i_47 
       (.I0(sel[5]),
        .I1(\p_0_out_inferred__0/product10_i_131_n_0 ),
        .I2(sel[6]),
        .I3(sel[7]),
        .I4(sel[8]),
        .I5(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_47_n_0 ));
  LUT6 #(
    .INIT(64'hFFF5020A4002FFF5)) 
    \p_0_out_inferred__0/product10_i_470 
       (.I0(sel[4]),
        .I1(sel[0]),
        .I2(sel[2]),
        .I3(sel[1]),
        .I4(sel[11]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_470_n_0 ));
  LUT6 #(
    .INIT(64'h00FDAA55AA55BF00)) 
    \p_0_out_inferred__0/product10_i_471 
       (.I0(sel[4]),
        .I1(sel[0]),
        .I2(sel[1]),
        .I3(sel[11]),
        .I4(sel[3]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_471_n_0 ));
  LUT6 #(
    .INIT(64'hCE66666733331999)) 
    \p_0_out_inferred__0/product10_i_472 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[0]),
        .I3(sel[1]),
        .I4(sel[2]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_472_n_0 ));
  LUT6 #(
    .INIT(64'h87F01FA55A85780F)) 
    \p_0_out_inferred__0/product10_i_473 
       (.I0(sel[4]),
        .I1(sel[0]),
        .I2(sel[11]),
        .I3(sel[3]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_473_n_0 ));
  LUT6 #(
    .INIT(64'hE3C3969EC7C69C3C)) 
    \p_0_out_inferred__0/product10_i_474 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[2]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_474_n_0 ));
  LUT6 #(
    .INIT(64'h0FF01FA55A07F00F)) 
    \p_0_out_inferred__0/product10_i_475 
       (.I0(sel[4]),
        .I1(sel[0]),
        .I2(sel[11]),
        .I3(sel[3]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_475_n_0 ));
  LUT6 #(
    .INIT(64'hC63C9C3C963C3C39)) 
    \p_0_out_inferred__0/product10_i_476 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[2]),
        .I4(sel[1]),
        .I5(sel[0]),
        .O(\p_0_out_inferred__0/product10_i_476_n_0 ));
  LUT6 #(
    .INIT(64'h969C991969696166)) 
    \p_0_out_inferred__0/product10_i_477 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_477_n_0 ));
  LUT6 #(
    .INIT(64'h9399669376996C66)) 
    \p_0_out_inferred__0/product10_i_478 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[0]),
        .I3(sel[3]),
        .I4(sel[2]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_478_n_0 ));
  LUT6 #(
    .INIT(64'h5A5AA51FF0A55A5A)) 
    \p_0_out_inferred__0/product10_i_479 
       (.I0(sel[4]),
        .I1(sel[0]),
        .I2(sel[11]),
        .I3(sel[1]),
        .I4(sel[3]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_479_n_0 ));
  LUT6 #(
    .INIT(64'h01000101FFFEFEFE)) 
    \p_0_out_inferred__0/product10_i_48 
       (.I0(sel[8]),
        .I1(sel[7]),
        .I2(sel[6]),
        .I3(\p_0_out_inferred__0/product10_i_132_n_0 ),
        .I4(sel[5]),
        .I5(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_48_n_0 ));
  LUT5 #(
    .INIT(32'hC6969C39)) 
    \p_0_out_inferred__0/product10_i_480 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[1]),
        .I4(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_480_n_0 ));
  LUT6 #(
    .INIT(64'hC96966366D669692)) 
    \p_0_out_inferred__0/product10_i_481 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[2]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_481_n_0 ));
  LUT6 #(
    .INIT(64'h9D669999666B4666)) 
    \p_0_out_inferred__0/product10_i_482 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[0]),
        .I3(sel[1]),
        .I4(sel[3]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_482_n_0 ));
  LUT6 #(
    .INIT(64'h9B99994969666C66)) 
    \p_0_out_inferred__0/product10_i_483 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[1]),
        .I4(sel[0]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_483_n_0 ));
  LUT6 #(
    .INIT(64'h9693496999996C66)) 
    \p_0_out_inferred__0/product10_i_484 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[2]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_484_n_0 ));
  LUT6 #(
    .INIT(64'h6BC3C23C3C6BC3C3)) 
    \p_0_out_inferred__0/product10_i_485 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_485_n_0 ));
  LUT6 #(
    .INIT(64'h3C6BC3C2BC3C29C3)) 
    \p_0_out_inferred__0/product10_i_486 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_486_n_0 ));
  LUT6 #(
    .INIT(64'hBCC33C94293CC329)) 
    \p_0_out_inferred__0/product10_i_487 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[2]),
        .I4(sel[0]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_487_n_0 ));
  LUT6 #(
    .INIT(64'hC3963C3D43C3D63C)) 
    \p_0_out_inferred__0/product10_i_488 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_488_n_0 ));
  LUT6 #(
    .INIT(64'h399C96C66369399C)) 
    \p_0_out_inferred__0/product10_i_489 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_489_n_0 ));
  LUT6 #(
    .INIT(64'hCFCCBBBB33308888)) 
    \p_0_out_inferred__0/product10_i_49 
       (.I0(\p_0_out_inferred__0/product10_i_133_n_0 ),
        .I1(sel[8]),
        .I2(sel[6]),
        .I3(\p_0_out_inferred__0/product10_i_134_n_0 ),
        .I4(sel[7]),
        .I5(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_49_n_0 ));
  LUT6 #(
    .INIT(64'hE369391C96C6E369)) 
    \p_0_out_inferred__0/product10_i_490 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_490_n_0 ));
  LUT6 #(
    .INIT(64'h3C9CC6C361393C9E)) 
    \p_0_out_inferred__0/product10_i_491 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_491_n_0 ));
  LUT6 #(
    .INIT(64'h86C3E3383C9EC7C3)) 
    \p_0_out_inferred__0/product10_i_492 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_492_n_0 ));
  LUT6 #(
    .INIT(64'hC9DBDB93366C6C6C)) 
    \p_0_out_inferred__0/product10_i_493 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[1]),
        .I3(sel[0]),
        .I4(sel[3]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_493_n_0 ));
  LUT6 #(
    .INIT(64'h9B2696646D99C993)) 
    \p_0_out_inferred__0/product10_i_494 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[1]),
        .I4(sel[0]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_494_n_0 ));
  LUT6 #(
    .INIT(64'h96A6666959999296)) 
    \p_0_out_inferred__0/product10_i_495 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_495_n_0 ));
  LUT6 #(
    .INIT(64'h9686666169999E96)) 
    \p_0_out_inferred__0/product10_i_496 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_496_n_0 ));
  LUT6 #(
    .INIT(64'hCCCC333781936CEC)) 
    \p_0_out_inferred__0/product10_i_497 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[1]),
        .I3(sel[0]),
        .I4(sel[3]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_497_n_0 ));
  LUT6 #(
    .INIT(64'hCCCCCC423333337E)) 
    \p_0_out_inferred__0/product10_i_498 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[0]),
        .I3(sel[2]),
        .I4(sel[1]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_498_n_0 ));
  LUT6 #(
    .INIT(64'hC363693D436B293C)) 
    \p_0_out_inferred__0/product10_i_499 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[1]),
        .I4(sel[2]),
        .I5(sel[0]),
        .O(\p_0_out_inferred__0/product10_i_499_n_0 ));
  MUXF7 \p_0_out_inferred__0/product10_i_5 
       (.I0(\p_0_out_inferred__0/product10_i_20_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_21_n_0 ),
        .O(p_0_out[7]),
        .S(sel[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \p_0_out_inferred__0/product10_i_50 
       (.I0(\p_0_out_inferred__0/product10_i_135_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_129_n_0 ),
        .I2(sel[8]),
        .I3(\p_0_out_inferred__0/product10_i_136_n_0 ),
        .I4(sel[7]),
        .I5(\p_0_out_inferred__0/product10_i_137_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_50_n_0 ));
  LUT6 #(
    .INIT(64'hCCCF3333F3B30C0C)) 
    \p_0_out_inferred__0/product10_i_500 
       (.I0(sel[0]),
        .I1(sel[4]),
        .I2(sel[2]),
        .I3(sel[1]),
        .I4(sel[11]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_500_n_0 ));
  LUT6 #(
    .INIT(64'h2632939B99C94D6C)) 
    \p_0_out_inferred__0/product10_i_501 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_501_n_0 ));
  LUT6 #(
    .INIT(64'h6426669696999B99)) 
    \p_0_out_inferred__0/product10_i_502 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[1]),
        .I4(sel[0]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_502_n_0 ));
  LUT6 #(
    .INIT(64'h67E6869696989919)) 
    \p_0_out_inferred__0/product10_i_503 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_503_n_0 ));
  LUT6 #(
    .INIT(64'hA507F8E01F5AA587)) 
    \p_0_out_inferred__0/product10_i_504 
       (.I0(sel[4]),
        .I1(sel[0]),
        .I2(sel[11]),
        .I3(sel[1]),
        .I4(sel[3]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_504_n_0 ));
  LUT6 #(
    .INIT(64'h766CCCC889133336)) 
    \p_0_out_inferred__0/product10_i_505 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_505_n_0 ));
  LUT6 #(
    .INIT(64'h3333FCECCCCC0313)) 
    \p_0_out_inferred__0/product10_i_506 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[0]),
        .I3(sel[3]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_506_n_0 ));
  LUT6 #(
    .INIT(64'h0F8FF3F0F0F0080F)) 
    \p_0_out_inferred__0/product10_i_507 
       (.I0(sel[3]),
        .I1(sel[4]),
        .I2(sel[11]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_507_n_0 ));
  LUT6 #(
    .INIT(64'hD9CCCC6C663233B3)) 
    \p_0_out_inferred__0/product10_i_508 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_508_n_0 ));
  LUT6 #(
    .INIT(64'h8000FFFDBFFF0002)) 
    \p_0_out_inferred__0/product10_i_509 
       (.I0(sel[4]),
        .I1(sel[0]),
        .I2(sel[1]),
        .I3(sel[2]),
        .I4(sel[11]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_509_n_0 ));
  LUT6 #(
    .INIT(64'hB8CC0000B833FFFF)) 
    \p_0_out_inferred__0/product10_i_51 
       (.I0(\p_0_out_inferred__0/product10_i_138_n_0 ),
        .I1(sel[7]),
        .I2(\p_0_out_inferred__0/product10_i_139_n_0 ),
        .I3(sel[6]),
        .I4(sel[8]),
        .I5(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_51_n_0 ));
  LUT6 #(
    .INIT(64'hCD9B3333264CCCCC)) 
    \p_0_out_inferred__0/product10_i_510 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[0]),
        .I3(sel[1]),
        .I4(sel[2]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_510_n_0 ));
  LUT6 #(
    .INIT(64'h9EC696C696C686E7)) 
    \p_0_out_inferred__0/product10_i_511 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[2]),
        .I4(sel[1]),
        .I5(sel[0]),
        .O(\p_0_out_inferred__0/product10_i_511_n_0 ));
  LUT6 #(
    .INIT(64'hE3696179393C383C)) 
    \p_0_out_inferred__0/product10_i_512 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[1]),
        .I4(sel[0]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_512_n_0 ));
  LUT6 #(
    .INIT(64'h03333333CCCCCCC8)) 
    \p_0_out_inferred__0/product10_i_513 
       (.I0(sel[0]),
        .I1(sel[4]),
        .I2(sel[3]),
        .I3(sel[1]),
        .I4(sel[2]),
        .I5(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_513_n_0 ));
  LUT6 #(
    .INIT(64'hE666666666656569)) 
    \p_0_out_inferred__0/product10_i_514 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[2]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_514_n_0 ));
  LUT6 #(
    .INIT(64'h0FFF8000F0007FFF)) 
    \p_0_out_inferred__0/product10_i_515 
       (.I0(sel[3]),
        .I1(sel[4]),
        .I2(sel[1]),
        .I3(sel[0]),
        .I4(sel[11]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_515_n_0 ));
  LUT6 #(
    .INIT(64'h3364324CCC9BC933)) 
    \p_0_out_inferred__0/product10_i_516 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[1]),
        .I4(sel[0]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_516_n_0 ));
  LUT6 #(
    .INIT(64'h319C3399CC67CCE6)) 
    \p_0_out_inferred__0/product10_i_517 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[0]),
        .I3(sel[1]),
        .I4(sel[3]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_517_n_0 ));
  LUT6 #(
    .INIT(64'h01CCCCCCEE333733)) 
    \p_0_out_inferred__0/product10_i_518 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[1]),
        .I4(sel[0]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_518_n_0 ));
  LUT6 #(
    .INIT(64'h6799666699861999)) 
    \p_0_out_inferred__0/product10_i_519 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[0]),
        .I3(sel[1]),
        .I4(sel[3]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_519_n_0 ));
  LUT6 #(
    .INIT(64'h05FA45EF05FA40EA)) 
    \p_0_out_inferred__0/product10_i_52 
       (.I0(sel[8]),
        .I1(\p_0_out_inferred__0/product10_i_140_n_0 ),
        .I2(sel[7]),
        .I3(sel[11]),
        .I4(sel[6]),
        .I5(\p_0_out_inferred__0/product10_i_141_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_52_n_0 ));
  LUT6 #(
    .INIT(64'hE8666C7636911399)) 
    \p_0_out_inferred__0/product10_i_520 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[1]),
        .I4(sel[0]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_520_n_0 ));
  LUT6 #(
    .INIT(64'h5A58A70FF0E51A5A)) 
    \p_0_out_inferred__0/product10_i_521 
       (.I0(sel[4]),
        .I1(sel[0]),
        .I2(sel[11]),
        .I3(sel[1]),
        .I4(sel[3]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_521_n_0 ));
  LUT6 #(
    .INIT(64'h6696469694B99D29)) 
    \p_0_out_inferred__0/product10_i_522 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[1]),
        .I4(sel[0]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_522_n_0 ));
  LUT6 #(
    .INIT(64'hD666999469299666)) 
    \p_0_out_inferred__0/product10_i_523 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[2]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_523_n_0 ));
  LUT6 #(
    .INIT(64'h16666A6999959666)) 
    \p_0_out_inferred__0/product10_i_524 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_524_n_0 ));
  LUT6 #(
    .INIT(64'h666C9196E9897666)) 
    \p_0_out_inferred__0/product10_i_525 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[2]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_525_n_0 ));
  LUT6 #(
    .INIT(64'hC999766E9337ECC9)) 
    \p_0_out_inferred__0/product10_i_526 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[2]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_526_n_0 ));
  LUT6 #(
    .INIT(64'hBC3DD63CC39443C3)) 
    \p_0_out_inferred__0/product10_i_527 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[2]),
        .I4(sel[0]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_527_n_0 ));
  LUT6 #(
    .INIT(64'hC363293C9CC6C36B)) 
    \p_0_out_inferred__0/product10_i_528 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_528_n_0 ));
  LUT6 #(
    .INIT(64'h3D9C96C263693D9C)) 
    \p_0_out_inferred__0/product10_i_529 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_529_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \p_0_out_inferred__0/product10_i_53 
       (.I0(\p_0_out_inferred__0/product10_i_142_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_143_n_0 ),
        .I2(sel[8]),
        .I3(\p_0_out_inferred__0/product10_i_144_n_0 ),
        .I4(sel[7]),
        .I5(\p_0_out_inferred__0/product10_i_145_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_53_n_0 ));
  LUT6 #(
    .INIT(64'h6369399C96C66369)) 
    \p_0_out_inferred__0/product10_i_530 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_530_n_0 ));
  LUT6 #(
    .INIT(64'h9E3CC39638E33C38)) 
    \p_0_out_inferred__0/product10_i_531 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[2]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_531_n_0 ));
  LUT6 #(
    .INIT(64'hC3863C3C61C3C71C)) 
    \p_0_out_inferred__0/product10_i_532 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_532_n_0 ));
  LUT6 #(
    .INIT(64'h61C3C71C3C79C3C3)) 
    \p_0_out_inferred__0/product10_i_533 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_533_n_0 ));
  LUT6 #(
    .INIT(64'h3C791C3CC3C379C3)) 
    \p_0_out_inferred__0/product10_i_534 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[2]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_534_n_0 ));
  MUXF7 \p_0_out_inferred__0/product10_i_535 
       (.I0(\p_0_out_inferred__0/product10_i_645_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_646_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_535_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_536 
       (.I0(\p_0_out_inferred__0/product10_i_647_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_648_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_536_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_537 
       (.I0(\p_0_out_inferred__0/product10_i_649_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_650_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_537_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_538 
       (.I0(\p_0_out_inferred__0/product10_i_651_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_652_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_538_n_0 ),
        .S(sel[5]));
  LUT6 #(
    .INIT(64'hB3CCCC3222BBDB4C)) 
    \p_0_out_inferred__0/product10_i_539 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[2]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_539_n_0 ));
  MUXF7 \p_0_out_inferred__0/product10_i_54 
       (.I0(\p_0_out_inferred__0/product10_i_146_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_147_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_54_n_0 ),
        .S(sel[7]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'h6D92)) 
    \p_0_out_inferred__0/product10_i_540 
       (.I0(sel[11]),
        .I1(sel[1]),
        .I2(sel[0]),
        .I3(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_540_n_0 ));
  LUT6 #(
    .INIT(64'h33FFCC01CC3337CC)) 
    \p_0_out_inferred__0/product10_i_541 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[2]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_541_n_0 ));
  LUT6 #(
    .INIT(64'h33CC1177CC33EE89)) 
    \p_0_out_inferred__0/product10_i_542 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_542_n_0 ));
  MUXF7 \p_0_out_inferred__0/product10_i_543 
       (.I0(\p_0_out_inferred__0/product10_i_653_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_654_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_543_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_544 
       (.I0(\p_0_out_inferred__0/product10_i_655_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_656_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_544_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_545 
       (.I0(\p_0_out_inferred__0/product10_i_657_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_658_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_545_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_546 
       (.I0(\p_0_out_inferred__0/product10_i_659_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_660_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_546_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_547 
       (.I0(\p_0_out_inferred__0/product10_i_661_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_662_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_547_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_548 
       (.I0(\p_0_out_inferred__0/product10_i_663_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_664_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_548_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_549 
       (.I0(\p_0_out_inferred__0/product10_i_665_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_666_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_549_n_0 ),
        .S(sel[5]));
  LUT6 #(
    .INIT(64'hE00000004FFFFFFF)) 
    \p_0_out_inferred__0/product10_i_55 
       (.I0(sel[4]),
        .I1(\p_0_out_inferred__0/product10_i_148_n_0 ),
        .I2(sel[5]),
        .I3(sel[6]),
        .I4(sel[7]),
        .I5(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_55_n_0 ));
  MUXF7 \p_0_out_inferred__0/product10_i_550 
       (.I0(\p_0_out_inferred__0/product10_i_667_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_668_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_550_n_0 ),
        .S(sel[5]));
  LUT6 #(
    .INIT(64'h43C3C3C3C3B0D0BC)) 
    \p_0_out_inferred__0/product10_i_551 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[1]),
        .I4(sel[0]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_551_n_0 ));
  LUT6 #(
    .INIT(64'hA0F2F0FA5A4F5F0D)) 
    \p_0_out_inferred__0/product10_i_552 
       (.I0(sel[4]),
        .I1(sel[0]),
        .I2(sel[11]),
        .I3(sel[2]),
        .I4(sel[1]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_552_n_0 ));
  LUT6 #(
    .INIT(64'h666666664555DDD9)) 
    \p_0_out_inferred__0/product10_i_553 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[0]),
        .I3(sel[1]),
        .I4(sel[2]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_553_n_0 ));
  LUT6 #(
    .INIT(64'hEEEAAA8999999999)) 
    \p_0_out_inferred__0/product10_i_554 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[0]),
        .I3(sel[1]),
        .I4(sel[2]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_554_n_0 ));
  LUT6 #(
    .INIT(64'h0FAFADB5F5F0D050)) 
    \p_0_out_inferred__0/product10_i_555 
       (.I0(sel[4]),
        .I1(sel[0]),
        .I2(sel[11]),
        .I3(sel[1]),
        .I4(sel[2]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_555_n_0 ));
  LUT6 #(
    .INIT(64'h073C3C380E3C3C78)) 
    \p_0_out_inferred__0/product10_i_556 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[1]),
        .I4(sel[2]),
        .I5(sel[0]),
        .O(\p_0_out_inferred__0/product10_i_556_n_0 ));
  MUXF7 \p_0_out_inferred__0/product10_i_557 
       (.I0(\p_0_out_inferred__0/product10_i_669_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_670_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_557_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_558 
       (.I0(\p_0_out_inferred__0/product10_i_671_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_672_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_558_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_559 
       (.I0(\p_0_out_inferred__0/product10_i_673_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_674_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_559_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_56 
       (.I0(\p_0_out_inferred__0/product10_i_149_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_150_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_56_n_0 ),
        .S(sel[7]));
  MUXF7 \p_0_out_inferred__0/product10_i_560 
       (.I0(\p_0_out_inferred__0/product10_i_675_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_676_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_560_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_561 
       (.I0(\p_0_out_inferred__0/product10_i_677_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_678_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_561_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_562 
       (.I0(\p_0_out_inferred__0/product10_i_679_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_680_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_562_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_563 
       (.I0(\p_0_out_inferred__0/product10_i_681_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_682_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_563_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_564 
       (.I0(\p_0_out_inferred__0/product10_i_683_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_684_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_564_n_0 ),
        .S(sel[5]));
  LUT6 #(
    .INIT(64'hF3F00FCF0C0FF070)) 
    \p_0_out_inferred__0/product10_i_565 
       (.I0(sel[3]),
        .I1(sel[4]),
        .I2(sel[11]),
        .I3(sel[1]),
        .I4(sel[0]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_565_n_0 ));
  LUT6 #(
    .INIT(64'h8F08F00FF0FF0FF0)) 
    \p_0_out_inferred__0/product10_i_566 
       (.I0(sel[3]),
        .I1(sel[4]),
        .I2(sel[11]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_566_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'h49B6)) 
    \p_0_out_inferred__0/product10_i_567 
       (.I0(sel[11]),
        .I1(sel[0]),
        .I2(sel[1]),
        .I3(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_567_n_0 ));
  LUT6 #(
    .INIT(64'h7E1311CCCC773789)) 
    \p_0_out_inferred__0/product10_i_568 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[2]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_568_n_0 ));
  MUXF7 \p_0_out_inferred__0/product10_i_569 
       (.I0(\p_0_out_inferred__0/product10_i_685_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_686_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_569_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_57 
       (.I0(\p_0_out_inferred__0/product10_i_151_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_152_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_57_n_0 ),
        .S(sel[7]));
  MUXF7 \p_0_out_inferred__0/product10_i_570 
       (.I0(\p_0_out_inferred__0/product10_i_687_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_688_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_570_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_571 
       (.I0(\p_0_out_inferred__0/product10_i_689_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_690_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_571_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_572 
       (.I0(\p_0_out_inferred__0/product10_i_691_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_692_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_572_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_573 
       (.I0(\p_0_out_inferred__0/product10_i_693_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_694_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_573_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_574 
       (.I0(\p_0_out_inferred__0/product10_i_695_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_696_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_574_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_575 
       (.I0(\p_0_out_inferred__0/product10_i_697_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_698_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_575_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_576 
       (.I0(\p_0_out_inferred__0/product10_i_699_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_700_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_576_n_0 ),
        .S(sel[5]));
  LUT6 #(
    .INIT(64'h5DBB2244DDB2244D)) 
    \p_0_out_inferred__0/product10_i_577 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_577_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'h4B)) 
    \p_0_out_inferred__0/product10_i_578 
       (.I0(sel[11]),
        .I1(sel[0]),
        .I2(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_578_n_0 ));
  LUT6 #(
    .INIT(64'h3300CCFF3301C8FE)) 
    \p_0_out_inferred__0/product10_i_579 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_579_n_0 ));
  MUXF7 \p_0_out_inferred__0/product10_i_58 
       (.I0(\p_0_out_inferred__0/product10_i_153_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_154_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_58_n_0 ),
        .S(sel[7]));
  LUT6 #(
    .INIT(64'hEE771188EE771589)) 
    \p_0_out_inferred__0/product10_i_580 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_580_n_0 ));
  MUXF7 \p_0_out_inferred__0/product10_i_581 
       (.I0(\p_0_out_inferred__0/product10_i_701_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_702_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_581_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_582 
       (.I0(\p_0_out_inferred__0/product10_i_703_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_704_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_582_n_0 ),
        .S(sel[5]));
  LUT6 #(
    .INIT(64'hEE67755111988AE6)) 
    \p_0_out_inferred__0/product10_i_583 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[1]),
        .I3(sel[2]),
        .I4(sel[3]),
        .I5(sel[0]),
        .O(\p_0_out_inferred__0/product10_i_583_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT4 #(
    .INIT(16'h40BF)) 
    \p_0_out_inferred__0/product10_i_584 
       (.I0(sel[11]),
        .I1(sel[3]),
        .I2(sel[4]),
        .I3(sel[0]),
        .O(\p_0_out_inferred__0/product10_i_584_n_0 ));
  LUT6 #(
    .INIT(64'h01011115FEEEEAEA)) 
    \p_0_out_inferred__0/product10_i_585 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[2]),
        .I3(sel[1]),
        .I4(sel[3]),
        .I5(sel[0]),
        .O(\p_0_out_inferred__0/product10_i_585_n_0 ));
  LUT6 #(
    .INIT(64'hBDBC94D0434B2B2F)) 
    \p_0_out_inferred__0/product10_i_586 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[1]),
        .I4(sel[2]),
        .I5(sel[0]),
        .O(\p_0_out_inferred__0/product10_i_586_n_0 ));
  MUXF7 \p_0_out_inferred__0/product10_i_587 
       (.I0(\p_0_out_inferred__0/product10_i_705_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_706_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_587_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_588 
       (.I0(\p_0_out_inferred__0/product10_i_707_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_708_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_588_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_589 
       (.I0(\p_0_out_inferred__0/product10_i_709_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_710_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_589_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_59 
       (.I0(\p_0_out_inferred__0/product10_i_155_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_156_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_59_n_0 ),
        .S(sel[7]));
  MUXF7 \p_0_out_inferred__0/product10_i_590 
       (.I0(\p_0_out_inferred__0/product10_i_711_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_712_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_590_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_591 
       (.I0(\p_0_out_inferred__0/product10_i_713_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_714_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_591_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_592 
       (.I0(\p_0_out_inferred__0/product10_i_715_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_716_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_592_n_0 ),
        .S(sel[5]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'h0F1FFFF0)) 
    \p_0_out_inferred__0/product10_i_593 
       (.I0(sel[1]),
        .I1(sel[2]),
        .I2(sel[4]),
        .I3(sel[3]),
        .I4(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_593_n_0 ));
  LUT6 #(
    .INIT(64'h443300FF403F23EC)) 
    \p_0_out_inferred__0/product10_i_594 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[0]),
        .I3(sel[3]),
        .I4(sel[2]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_594_n_0 ));
  LUT6 #(
    .INIT(64'h99AA559956D56244)) 
    \p_0_out_inferred__0/product10_i_595 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[0]),
        .I3(sel[3]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_595_n_0 ));
  LUT6 #(
    .INIT(64'h08330137FEE8FE88)) 
    \p_0_out_inferred__0/product10_i_596 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[1]),
        .I4(sel[0]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_596_n_0 ));
  MUXF7 \p_0_out_inferred__0/product10_i_597 
       (.I0(\p_0_out_inferred__0/product10_i_717_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_718_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_597_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_598 
       (.I0(\p_0_out_inferred__0/product10_i_719_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_720_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_598_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_599 
       (.I0(\p_0_out_inferred__0/product10_i_721_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_722_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_599_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_6 
       (.I0(\p_0_out_inferred__0/product10_i_22_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_23_n_0 ),
        .O(p_0_out[6]),
        .S(sel[9]));
  LUT6 #(
    .INIT(64'h01000101FFFEFEFE)) 
    \p_0_out_inferred__0/product10_i_60 
       (.I0(sel[7]),
        .I1(sel[6]),
        .I2(sel[5]),
        .I3(\p_0_out_inferred__0/product10_i_157_n_0 ),
        .I4(sel[4]),
        .I5(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_60_n_0 ));
  MUXF7 \p_0_out_inferred__0/product10_i_600 
       (.I0(\p_0_out_inferred__0/product10_i_723_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_724_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_600_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_601 
       (.I0(\p_0_out_inferred__0/product10_i_725_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_726_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_601_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_602 
       (.I0(\p_0_out_inferred__0/product10_i_727_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_728_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_602_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_603 
       (.I0(\p_0_out_inferred__0/product10_i_729_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_730_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_603_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_604 
       (.I0(\p_0_out_inferred__0/product10_i_731_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_732_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_604_n_0 ),
        .S(sel[5]));
  LUT6 #(
    .INIT(64'h80F0F0FFFF0F1F00)) 
    \p_0_out_inferred__0/product10_i_605 
       (.I0(sel[3]),
        .I1(sel[2]),
        .I2(sel[4]),
        .I3(sel[11]),
        .I4(sel[0]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_605_n_0 ));
  LUT6 #(
    .INIT(64'h7F00008000FFFFFF)) 
    \p_0_out_inferred__0/product10_i_606 
       (.I0(sel[2]),
        .I1(sel[3]),
        .I2(sel[4]),
        .I3(sel[0]),
        .I4(sel[11]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_606_n_0 ));
  LUT3 #(
    .INIT(8'h87)) 
    \p_0_out_inferred__0/product10_i_607 
       (.I0(sel[0]),
        .I1(sel[11]),
        .I2(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_607_n_0 ));
  LUT6 #(
    .INIT(64'h8117EE881177EA89)) 
    \p_0_out_inferred__0/product10_i_608 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_608_n_0 ));
  MUXF7 \p_0_out_inferred__0/product10_i_609 
       (.I0(\p_0_out_inferred__0/product10_i_733_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_734_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_609_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_61 
       (.I0(\p_0_out_inferred__0/product10_i_158_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_159_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_61_n_0 ),
        .S(sel[7]));
  MUXF7 \p_0_out_inferred__0/product10_i_610 
       (.I0(\p_0_out_inferred__0/product10_i_735_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_736_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_610_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_611 
       (.I0(\p_0_out_inferred__0/product10_i_737_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_738_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_611_n_0 ),
        .S(sel[5]));
  MUXF7 \p_0_out_inferred__0/product10_i_612 
       (.I0(\p_0_out_inferred__0/product10_i_739_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_740_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_612_n_0 ),
        .S(sel[5]));
  LUT6 #(
    .INIT(64'h837D4A82C2821DD5)) 
    \p_0_out_inferred__0/product10_i_613 
       (.I0(sel[5]),
        .I1(sel[3]),
        .I2(sel[1]),
        .I3(sel[4]),
        .I4(sel[0]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_613_n_0 ));
  LUT6 #(
    .INIT(64'h48D7E48AF408B77D)) 
    \p_0_out_inferred__0/product10_i_614 
       (.I0(sel[5]),
        .I1(sel[3]),
        .I2(sel[2]),
        .I3(sel[4]),
        .I4(sel[0]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_614_n_0 ));
  LUT6 #(
    .INIT(64'h1617736117336060)) 
    \p_0_out_inferred__0/product10_i_615 
       (.I0(sel[5]),
        .I1(sel[4]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[2]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_615_n_0 ));
  LUT6 #(
    .INIT(64'h0FFFA100FA000700)) 
    \p_0_out_inferred__0/product10_i_616 
       (.I0(sel[1]),
        .I1(sel[0]),
        .I2(sel[2]),
        .I3(sel[5]),
        .I4(sel[3]),
        .I5(sel[4]),
        .O(\p_0_out_inferred__0/product10_i_616_n_0 ));
  LUT6 #(
    .INIT(64'hC555FFFB3111999B)) 
    \p_0_out_inferred__0/product10_i_617 
       (.I0(sel[5]),
        .I1(sel[4]),
        .I2(sel[0]),
        .I3(sel[1]),
        .I4(sel[2]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_617_n_0 ));
  LUT6 #(
    .INIT(64'h6D85907AFA85253B)) 
    \p_0_out_inferred__0/product10_i_618 
       (.I0(sel[5]),
        .I1(sel[4]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_618_n_0 ));
  LUT6 #(
    .INIT(64'h09F6F618394BE73C)) 
    \p_0_out_inferred__0/product10_i_619 
       (.I0(sel[5]),
        .I1(sel[4]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[2]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_619_n_0 ));
  MUXF7 \p_0_out_inferred__0/product10_i_62 
       (.I0(\p_0_out_inferred__0/product10_i_160_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_161_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_62_n_0 ),
        .S(sel[7]));
  LUT6 #(
    .INIT(64'h3FBC444C420BB3B3)) 
    \p_0_out_inferred__0/product10_i_620 
       (.I0(sel[5]),
        .I1(sel[4]),
        .I2(sel[2]),
        .I3(sel[1]),
        .I4(sel[3]),
        .I5(sel[0]),
        .O(\p_0_out_inferred__0/product10_i_620_n_0 ));
  LUT6 #(
    .INIT(64'h1DD72828A229D773)) 
    \p_0_out_inferred__0/product10_i_621 
       (.I0(sel[5]),
        .I1(sel[4]),
        .I2(sel[2]),
        .I3(sel[1]),
        .I4(sel[3]),
        .I5(sel[0]),
        .O(\p_0_out_inferred__0/product10_i_621_n_0 ));
  LUT6 #(
    .INIT(64'h825CB5A25D30E25D)) 
    \p_0_out_inferred__0/product10_i_622 
       (.I0(sel[5]),
        .I1(sel[4]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_622_n_0 ));
  LUT6 #(
    .INIT(64'h6F0194EE6B1014EF)) 
    \p_0_out_inferred__0/product10_i_623 
       (.I0(sel[5]),
        .I1(sel[4]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_623_n_0 ));
  LUT6 #(
    .INIT(64'hBAAFADCC5053272F)) 
    \p_0_out_inferred__0/product10_i_624 
       (.I0(sel[5]),
        .I1(sel[4]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_624_n_0 ));
  LUT6 #(
    .INIT(64'h7F0000FFFA1515E8)) 
    \p_0_out_inferred__0/product10_i_625 
       (.I0(sel[5]),
        .I1(sel[4]),
        .I2(sel[1]),
        .I3(sel[3]),
        .I4(sel[0]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_625_n_0 ));
  LUT6 #(
    .INIT(64'h7178585A8F87A7E5)) 
    \p_0_out_inferred__0/product10_i_626 
       (.I0(sel[5]),
        .I1(sel[4]),
        .I2(sel[3]),
        .I3(sel[1]),
        .I4(sel[2]),
        .I5(sel[0]),
        .O(\p_0_out_inferred__0/product10_i_626_n_0 ));
  LUT6 #(
    .INIT(64'hBB44BB46BB44B847)) 
    \p_0_out_inferred__0/product10_i_627 
       (.I0(sel[5]),
        .I1(sel[4]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[2]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_627_n_0 ));
  LUT6 #(
    .INIT(64'h2AA9FFFF55660000)) 
    \p_0_out_inferred__0/product10_i_628 
       (.I0(sel[4]),
        .I1(sel[3]),
        .I2(sel[1]),
        .I3(sel[2]),
        .I4(sel[5]),
        .I5(sel[0]),
        .O(\p_0_out_inferred__0/product10_i_628_n_0 ));
  LUT6 #(
    .INIT(64'hEB14BB44BB44BA45)) 
    \p_0_out_inferred__0/product10_i_629 
       (.I0(sel[5]),
        .I1(sel[4]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[2]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_629_n_0 ));
  LUT6 #(
    .INIT(64'hB8CC0000B833FFFF)) 
    \p_0_out_inferred__0/product10_i_63 
       (.I0(\p_0_out_inferred__0/product10_i_162_n_0 ),
        .I1(sel[6]),
        .I2(\p_0_out_inferred__0/product10_i_163_n_0 ),
        .I3(sel[5]),
        .I4(sel[7]),
        .I5(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_63_n_0 ));
  LUT6 #(
    .INIT(64'h3FFF55554002AAAA)) 
    \p_0_out_inferred__0/product10_i_630 
       (.I0(sel[5]),
        .I1(sel[1]),
        .I2(sel[2]),
        .I3(sel[3]),
        .I4(sel[4]),
        .I5(sel[0]),
        .O(\p_0_out_inferred__0/product10_i_630_n_0 ));
  LUT6 #(
    .INIT(64'h5118AAEEEEF75119)) 
    \p_0_out_inferred__0/product10_i_631 
       (.I0(sel[5]),
        .I1(sel[4]),
        .I2(sel[1]),
        .I3(sel[2]),
        .I4(sel[3]),
        .I5(sel[0]),
        .O(\p_0_out_inferred__0/product10_i_631_n_0 ));
  LUT6 #(
    .INIT(64'hA5780FF08FF00EA5)) 
    \p_0_out_inferred__0/product10_i_632 
       (.I0(sel[5]),
        .I1(sel[4]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[2]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_632_n_0 ));
  LUT6 #(
    .INIT(64'hE4CA0A33B5F55D4F)) 
    \p_0_out_inferred__0/product10_i_633 
       (.I0(sel[5]),
        .I1(sel[4]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_633_n_0 ));
  LUT6 #(
    .INIT(64'h28290880D6F6777F)) 
    \p_0_out_inferred__0/product10_i_634 
       (.I0(sel[5]),
        .I1(sel[4]),
        .I2(sel[3]),
        .I3(sel[2]),
        .I4(sel[0]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_634_n_0 ));
  LUT6 #(
    .INIT(64'h47AD0C3ABA4145AD)) 
    \p_0_out_inferred__0/product10_i_635 
       (.I0(sel[5]),
        .I1(sel[4]),
        .I2(sel[3]),
        .I3(sel[2]),
        .I4(sel[0]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_635_n_0 ));
  LUT6 #(
    .INIT(64'h1E1BE4E44B48B593)) 
    \p_0_out_inferred__0/product10_i_636 
       (.I0(sel[5]),
        .I1(sel[4]),
        .I2(sel[3]),
        .I3(sel[1]),
        .I4(sel[0]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_636_n_0 ));
  LUT6 #(
    .INIT(64'h33C42DD22FD02CD3)) 
    \p_0_out_inferred__0/product10_i_637 
       (.I0(sel[5]),
        .I1(sel[4]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[2]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_637_n_0 ));
  LUT6 #(
    .INIT(64'hDA7F3582A5C078FD)) 
    \p_0_out_inferred__0/product10_i_638 
       (.I0(sel[5]),
        .I1(sel[1]),
        .I2(sel[4]),
        .I3(sel[3]),
        .I4(sel[0]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_638_n_0 ));
  LUT6 #(
    .INIT(64'hA409A1A15FB65EC6)) 
    \p_0_out_inferred__0/product10_i_639 
       (.I0(sel[5]),
        .I1(sel[4]),
        .I2(sel[3]),
        .I3(sel[2]),
        .I4(sel[0]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_639_n_0 ));
  MUXF7 \p_0_out_inferred__0/product10_i_64 
       (.I0(\p_0_out_inferred__0/product10_i_164_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_165_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_64_n_0 ),
        .S(sel[7]));
  LUT6 #(
    .INIT(64'h9F9F9F8A8A8AC3D7)) 
    \p_0_out_inferred__0/product10_i_640 
       (.I0(sel[5]),
        .I1(sel[4]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_640_n_0 ));
  LUT6 #(
    .INIT(64'h4347070606161637)) 
    \p_0_out_inferred__0/product10_i_641 
       (.I0(sel[5]),
        .I1(sel[4]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_641_n_0 ));
  LUT6 #(
    .INIT(64'h4F3CF3F80CC00C80)) 
    \p_0_out_inferred__0/product10_i_642 
       (.I0(sel[0]),
        .I1(sel[5]),
        .I2(sel[2]),
        .I3(sel[3]),
        .I4(sel[1]),
        .I5(sel[4]),
        .O(\p_0_out_inferred__0/product10_i_642_n_0 ));
  LUT6 #(
    .INIT(64'h0466CF9931378EEC)) 
    \p_0_out_inferred__0/product10_i_643 
       (.I0(sel[5]),
        .I1(sel[4]),
        .I2(sel[0]),
        .I3(sel[3]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_643_n_0 ));
  LUT6 #(
    .INIT(64'h678830D230676D25)) 
    \p_0_out_inferred__0/product10_i_644 
       (.I0(sel[5]),
        .I1(sel[2]),
        .I2(sel[4]),
        .I3(sel[0]),
        .I4(sel[3]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_644_n_0 ));
  LUT6 #(
    .INIT(64'h863CE3873CE1C73C)) 
    \p_0_out_inferred__0/product10_i_645 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_645_n_0 ));
  LUT6 #(
    .INIT(64'h433C3CF0D0C3C33C)) 
    \p_0_out_inferred__0/product10_i_646 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[2]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_646_n_0 ));
  LUT6 #(
    .INIT(64'hBDD6432D94C329BC)) 
    \p_0_out_inferred__0/product10_i_647 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_647_n_0 ));
  LUT6 #(
    .INIT(64'h69999662A9944669)) 
    \p_0_out_inferred__0/product10_i_648 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_648_n_0 ));
  LUT6 #(
    .INIT(64'h49DB246C3624DB93)) 
    \p_0_out_inferred__0/product10_i_649 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[1]),
        .I3(sel[3]),
        .I4(sel[0]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_649_n_0 ));
  MUXF7 \p_0_out_inferred__0/product10_i_65 
       (.I0(\p_0_out_inferred__0/product10_i_166_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_167_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_65_n_0 ),
        .S(sel[7]));
  LUT6 #(
    .INIT(64'h9B266D9B6D99B664)) 
    \p_0_out_inferred__0/product10_i_650 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[1]),
        .I4(sel[0]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_650_n_0 ));
  LUT6 #(
    .INIT(64'h9A69E69A69E69A69)) 
    \p_0_out_inferred__0/product10_i_651 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_651_n_0 ));
  LUT6 #(
    .INIT(64'h79E7E79E9E3939E7)) 
    \p_0_out_inferred__0/product10_i_652 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[2]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_652_n_0 ));
  LUT6 #(
    .INIT(64'h9176C8136E9976C8)) 
    \p_0_out_inferred__0/product10_i_653 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_653_n_0 ));
  LUT6 #(
    .INIT(64'h6E8937EC9176C817)) 
    \p_0_out_inferred__0/product10_i_654 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_654_n_0 ));
  LUT6 #(
    .INIT(64'h9176C8136E8937CC)) 
    \p_0_out_inferred__0/product10_i_655 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_655_n_0 ));
  LUT6 #(
    .INIT(64'hEE8937CC136E8937)) 
    \p_0_out_inferred__0/product10_i_656 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_656_n_0 ));
  LUT6 #(
    .INIT(64'h5A177A5AA5E895A5)) 
    \p_0_out_inferred__0/product10_i_657 
       (.I0(sel[4]),
        .I1(sel[2]),
        .I2(sel[11]),
        .I3(sel[0]),
        .I4(sel[3]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_657_n_0 ));
  LUT6 #(
    .INIT(64'h0111CCC8FEEE3337)) 
    \p_0_out_inferred__0/product10_i_658 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[2]),
        .I3(sel[3]),
        .I4(sel[0]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_658_n_0 ));
  LUT5 #(
    .INIT(32'h0F80F07F)) 
    \p_0_out_inferred__0/product10_i_659 
       (.I0(sel[3]),
        .I1(sel[4]),
        .I2(sel[0]),
        .I3(sel[11]),
        .I4(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_659_n_0 ));
  MUXF7 \p_0_out_inferred__0/product10_i_66 
       (.I0(\p_0_out_inferred__0/product10_i_168_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_169_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_66_n_0 ),
        .S(sel[7]));
  LUT6 #(
    .INIT(64'h999BB32666444DD9)) 
    \p_0_out_inferred__0/product10_i_660 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[2]),
        .I3(sel[3]),
        .I4(sel[0]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_660_n_0 ));
  LUT6 #(
    .INIT(64'hE66965599AA69666)) 
    \p_0_out_inferred__0/product10_i_661 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[1]),
        .I4(sel[0]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_661_n_0 ));
  LUT6 #(
    .INIT(64'h3C1E6138C7C31C8E)) 
    \p_0_out_inferred__0/product10_i_662 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[2]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_662_n_0 ));
  LUT6 #(
    .INIT(64'h3C2FB43CC3C32FC3)) 
    \p_0_out_inferred__0/product10_i_663 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[2]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_663_n_0 ));
  LUT6 #(
    .INIT(64'h426B96469D9429BD)) 
    \p_0_out_inferred__0/product10_i_664 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[2]),
        .I4(sel[0]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_664_n_0 ));
  LUT6 #(
    .INIT(64'h949D696BB9296342)) 
    \p_0_out_inferred__0/product10_i_665 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[2]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_665_n_0 ));
  LUT6 #(
    .INIT(64'h17999189C96EE866)) 
    \p_0_out_inferred__0/product10_i_666 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[1]),
        .I4(sel[0]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_666_n_0 ));
  LUT6 #(
    .INIT(64'h4CCF8CCE33317331)) 
    \p_0_out_inferred__0/product10_i_667 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[0]),
        .I3(sel[1]),
        .I4(sel[3]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_667_n_0 ));
  LUT6 #(
    .INIT(64'hB624246CC993D3B3)) 
    \p_0_out_inferred__0/product10_i_668 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[1]),
        .I3(sel[0]),
        .I4(sel[3]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_668_n_0 ));
  LUT6 #(
    .INIT(64'h3676ECC889911736)) 
    \p_0_out_inferred__0/product10_i_669 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_669_n_0 ));
  MUXF7 \p_0_out_inferred__0/product10_i_67 
       (.I0(\p_0_out_inferred__0/product10_i_170_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_171_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_67_n_0 ),
        .S(sel[7]));
  LUT6 #(
    .INIT(64'h3333CCCCB3DF4821)) 
    \p_0_out_inferred__0/product10_i_670 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[2]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_670_n_0 ));
  LUT6 #(
    .INIT(64'hD94D6C646626B293)) 
    \p_0_out_inferred__0/product10_i_671 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_671_n_0 ));
  LUT6 #(
    .INIT(64'h396979616786E686)) 
    \p_0_out_inferred__0/product10_i_672 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[1]),
        .I4(sel[0]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_672_n_0 ));
  LUT6 #(
    .INIT(64'h86E6989679186179)) 
    \p_0_out_inferred__0/product10_i_673 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[2]),
        .I4(sel[0]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_673_n_0 ));
  LUT6 #(
    .INIT(64'hF1C3873C3CF1C3C7)) 
    \p_0_out_inferred__0/product10_i_674 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_674_n_0 ));
  LUT6 #(
    .INIT(64'hC243293CBCD2C34B)) 
    \p_0_out_inferred__0/product10_i_675 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_675_n_0 ));
  LUT6 #(
    .INIT(64'h9596566A69A99D96)) 
    \p_0_out_inferred__0/product10_i_676 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_676_n_0 ));
  LUT6 #(
    .INIT(64'h899376E8891766E9)) 
    \p_0_out_inferred__0/product10_i_677 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_677_n_0 ));
  LUT5 #(
    .INIT(32'hFCEC0313)) 
    \p_0_out_inferred__0/product10_i_678 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[0]),
        .I3(sel[3]),
        .I4(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_678_n_0 ));
  LUT6 #(
    .INIT(64'hFF1F7F0000E000FF)) 
    \p_0_out_inferred__0/product10_i_679 
       (.I0(sel[3]),
        .I1(sel[2]),
        .I2(sel[4]),
        .I3(sel[11]),
        .I4(sel[0]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_679_n_0 ));
  LUT6 #(
    .INIT(64'h05FA45EF05FA40EA)) 
    \p_0_out_inferred__0/product10_i_68 
       (.I0(sel[7]),
        .I1(\p_0_out_inferred__0/product10_i_172_n_0 ),
        .I2(sel[6]),
        .I3(sel[11]),
        .I4(sel[5]),
        .I5(\p_0_out_inferred__0/product10_i_173_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_68_n_0 ));
  LUT6 #(
    .INIT(64'hA69B6692D96D994D)) 
    \p_0_out_inferred__0/product10_i_680 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[2]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_680_n_0 ));
  LUT6 #(
    .INIT(64'h64D932CCB364DD33)) 
    \p_0_out_inferred__0/product10_i_681 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_681_n_0 ));
  LUT6 #(
    .INIT(64'hBD39634242C69CBD)) 
    \p_0_out_inferred__0/product10_i_682 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[1]),
        .I3(sel[3]),
        .I4(sel[0]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_682_n_0 ));
  LUT6 #(
    .INIT(64'h42C69CBDBD396246)) 
    \p_0_out_inferred__0/product10_i_683 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[1]),
        .I3(sel[3]),
        .I4(sel[0]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_683_n_0 ));
  LUT6 #(
    .INIT(64'h9DB9636242C69CBD)) 
    \p_0_out_inferred__0/product10_i_684 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[1]),
        .I3(sel[3]),
        .I4(sel[0]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_684_n_0 ));
  LUT6 #(
    .INIT(64'h63D6BD63D6BD6BD6)) 
    \p_0_out_inferred__0/product10_i_685 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_685_n_0 ));
  LUT6 #(
    .INIT(64'h569D69569D69569D)) 
    \p_0_out_inferred__0/product10_i_686 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_686_n_0 ));
  LUT6 #(
    .INIT(64'h6697E97691E97691)) 
    \p_0_out_inferred__0/product10_i_687 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_687_n_0 ));
  LUT6 #(
    .INIT(64'h896E13C87691E876)) 
    \p_0_out_inferred__0/product10_i_688 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_688_n_0 ));
  LUT6 #(
    .INIT(64'hA592925A5A2565A5)) 
    \p_0_out_inferred__0/product10_i_689 
       (.I0(sel[4]),
        .I1(sel[2]),
        .I2(sel[11]),
        .I3(sel[0]),
        .I4(sel[3]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_689_n_0 ));
  MUXF7 \p_0_out_inferred__0/product10_i_69 
       (.I0(\p_0_out_inferred__0/product10_i_174_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_175_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_69_n_0 ),
        .S(sel[7]));
  LUT6 #(
    .INIT(64'h61383C9E86E7E179)) 
    \p_0_out_inferred__0/product10_i_690 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[2]),
        .I4(sel[0]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_690_n_0 ));
  LUT6 #(
    .INIT(64'h3C0E0FC3C3383C3C)) 
    \p_0_out_inferred__0/product10_i_691 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[2]),
        .I4(sel[0]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_691_n_0 ));
  LUT6 #(
    .INIT(64'hBC3D2DC3C394B43C)) 
    \p_0_out_inferred__0/product10_i_692 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[2]),
        .I4(sel[0]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_692_n_0 ));
  LUT6 #(
    .INIT(64'h89FE17887E15E876)) 
    \p_0_out_inferred__0/product10_i_693 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_693_n_0 ));
  LUT6 #(
    .INIT(64'h70FF08F08F00FF0F)) 
    \p_0_out_inferred__0/product10_i_694 
       (.I0(sel[3]),
        .I1(sel[4]),
        .I2(sel[11]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_694_n_0 ));
  LUT6 #(
    .INIT(64'h1A59A68265A69B59)) 
    \p_0_out_inferred__0/product10_i_695 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[1]),
        .I4(sel[0]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_695_n_0 ));
  LUT6 #(
    .INIT(64'hC3C73C780F1EF1E3)) 
    \p_0_out_inferred__0/product10_i_696 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[1]),
        .I4(sel[0]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_696_n_0 ));
  LUT6 #(
    .INIT(64'h25AAAA5A5A4555A7)) 
    \p_0_out_inferred__0/product10_i_697 
       (.I0(sel[4]),
        .I1(sel[2]),
        .I2(sel[11]),
        .I3(sel[0]),
        .I4(sel[3]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_697_n_0 ));
  LUT6 #(
    .INIT(64'hF178381E8EE7E171)) 
    \p_0_out_inferred__0/product10_i_698 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[2]),
        .I4(sel[0]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_698_n_0 ));
  LUT6 #(
    .INIT(64'hF03C3D4F43D0F03C)) 
    \p_0_out_inferred__0/product10_i_699 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[2]),
        .I4(sel[0]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_699_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \p_0_out_inferred__0/product10_i_7 
       (.I0(\p_0_out_inferred__0/product10_i_24_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_25_n_0 ),
        .I2(sel[9]),
        .I3(\p_0_out_inferred__0/product10_i_26_n_0 ),
        .I4(sel[10]),
        .I5(\p_0_out_inferred__0/product10_i_27_n_0 ),
        .O(p_0_out[5]));
  MUXF8 \p_0_out_inferred__0/product10_i_70 
       (.I0(\p_0_out_inferred__0/product10_i_176_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_177_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_70_n_0 ),
        .S(sel[6]));
  LUT6 #(
    .INIT(64'h2B52956B52B56B52)) 
    \p_0_out_inferred__0/product10_i_700 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_700_n_0 ));
  LUT6 #(
    .INIT(64'h9594A9BD6AA9566A)) 
    \p_0_out_inferred__0/product10_i_701 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[2]),
        .I4(sel[0]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_701_n_0 ));
  LUT6 #(
    .INIT(64'hADAA55A55A55AA4A)) 
    \p_0_out_inferred__0/product10_i_702 
       (.I0(sel[4]),
        .I1(sel[2]),
        .I2(sel[11]),
        .I3(sel[0]),
        .I4(sel[3]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_702_n_0 ));
  LUT6 #(
    .INIT(64'hA5AA15A55A57AA5A)) 
    \p_0_out_inferred__0/product10_i_703 
       (.I0(sel[4]),
        .I1(sel[2]),
        .I2(sel[11]),
        .I3(sel[0]),
        .I4(sel[3]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_703_n_0 ));
  LUT6 #(
    .INIT(64'h15578991E8A97E6A)) 
    \p_0_out_inferred__0/product10_i_704 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[2]),
        .I4(sel[0]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_704_n_0 ));
  LUT6 #(
    .INIT(64'h4BD0D0BCBC0F0FC3)) 
    \p_0_out_inferred__0/product10_i_705 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[2]),
        .I4(sel[0]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_705_n_0 ));
  LUT6 #(
    .INIT(64'h7E15E87695EA5685)) 
    \p_0_out_inferred__0/product10_i_706 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_706_n_0 ));
  LUT6 #(
    .INIT(64'hC708F38F30F708F0)) 
    \p_0_out_inferred__0/product10_i_707 
       (.I0(sel[3]),
        .I1(sel[4]),
        .I2(sel[11]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_707_n_0 ));
  LUT6 #(
    .INIT(64'h1AC7711E7886E518)) 
    \p_0_out_inferred__0/product10_i_708 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[2]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_708_n_0 ));
  LUT6 #(
    .INIT(64'hF1381E8EC7E57918)) 
    \p_0_out_inferred__0/product10_i_709 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_709_n_0 ));
  MUXF8 \p_0_out_inferred__0/product10_i_71 
       (.I0(\p_0_out_inferred__0/product10_i_178_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_179_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_71_n_0 ),
        .S(sel[6]));
  LUT6 #(
    .INIT(64'h526B9452BD94A9BD)) 
    \p_0_out_inferred__0/product10_i_710 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[2]),
        .I4(sel[0]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_710_n_0 ));
  LUT6 #(
    .INIT(64'h4DCF8E8EB0717171)) 
    \p_0_out_inferred__0/product10_i_711 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[0]),
        .I3(sel[2]),
        .I4(sel[3]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_711_n_0 ));
  LUT6 #(
    .INIT(64'h19AEAA6467595D9B)) 
    \p_0_out_inferred__0/product10_i_712 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[2]),
        .I3(sel[0]),
        .I4(sel[3]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_712_n_0 ));
  LUT6 #(
    .INIT(64'hEAAAAAAA7777777F)) 
    \p_0_out_inferred__0/product10_i_713 
       (.I0(sel[4]),
        .I1(sel[3]),
        .I2(sel[1]),
        .I3(sel[2]),
        .I4(sel[0]),
        .I5(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_713_n_0 ));
  LUT6 #(
    .INIT(64'hDF33FF331088008C)) 
    \p_0_out_inferred__0/product10_i_714 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[0]),
        .I3(sel[2]),
        .I4(sel[1]),
        .I5(sel[3]),
        .O(\p_0_out_inferred__0/product10_i_714_n_0 ));
  LUT6 #(
    .INIT(64'h8A9965A6E6AA5164)) 
    \p_0_out_inferred__0/product10_i_715 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[0]),
        .I3(sel[3]),
        .I4(sel[2]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_715_n_0 ));
  LUT6 #(
    .INIT(64'h4DDFDFB33340204C)) 
    \p_0_out_inferred__0/product10_i_716 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[1]),
        .I4(sel[0]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_716_n_0 ));
  LUT6 #(
    .INIT(64'hEB8D566AA995526B)) 
    \p_0_out_inferred__0/product10_i_717 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_717_n_0 ));
  LUT6 #(
    .INIT(64'hBBDF4C20B7DE4821)) 
    \p_0_out_inferred__0/product10_i_718 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_718_n_0 ));
  LUT6 #(
    .INIT(64'h86E71A86791A6579)) 
    \p_0_out_inferred__0/product10_i_719 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[2]),
        .I4(sel[0]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_719_n_0 ));
  MUXF8 \p_0_out_inferred__0/product10_i_72 
       (.I0(\p_0_out_inferred__0/product10_i_180_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_181_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_72_n_0 ),
        .S(sel[6]));
  LUT6 #(
    .INIT(64'h6BADBCD4D2432F2D)) 
    \p_0_out_inferred__0/product10_i_720 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_720_n_0 ));
  LUT6 #(
    .INIT(64'hADD24BBC2B94522D)) 
    \p_0_out_inferred__0/product10_i_721 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[2]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_721_n_0 ));
  LUT6 #(
    .INIT(64'h01FE8837EE0176C8)) 
    \p_0_out_inferred__0/product10_i_722 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_722_n_0 ));
  LUT6 #(
    .INIT(64'h9AA659DB4DDBA424)) 
    \p_0_out_inferred__0/product10_i_723 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[1]),
        .I3(sel[3]),
        .I4(sel[0]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_723_n_0 ));
  LUT6 #(
    .INIT(64'hF0C70EF0C70E78C7)) 
    \p_0_out_inferred__0/product10_i_724 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_724_n_0 ));
  LUT6 #(
    .INIT(64'h2BADA9BDD6425243)) 
    \p_0_out_inferred__0/product10_i_725 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[2]),
        .I4(sel[1]),
        .I5(sel[0]),
        .O(\p_0_out_inferred__0/product10_i_725_n_0 ));
  LUT6 #(
    .INIT(64'h00001111FFFEEEEE)) 
    \p_0_out_inferred__0/product10_i_726 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[1]),
        .I3(sel[2]),
        .I4(sel[3]),
        .I5(sel[0]),
        .O(\p_0_out_inferred__0/product10_i_726_n_0 ));
  LUT6 #(
    .INIT(64'hB33000004CCFFFFF)) 
    \p_0_out_inferred__0/product10_i_727 
       (.I0(sel[1]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[2]),
        .I4(sel[4]),
        .I5(sel[0]),
        .O(\p_0_out_inferred__0/product10_i_727_n_0 ));
  LUT6 #(
    .INIT(64'h0E71C7388678E71A)) 
    \p_0_out_inferred__0/product10_i_728 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[2]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_728_n_0 ));
  LUT6 #(
    .INIT(64'h645D2664BAA2D9BB)) 
    \p_0_out_inferred__0/product10_i_729 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[2]),
        .I3(sel[3]),
        .I4(sel[0]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_729_n_0 ));
  MUXF8 \p_0_out_inferred__0/product10_i_73 
       (.I0(\p_0_out_inferred__0/product10_i_182_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_183_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_73_n_0 ),
        .S(sel[6]));
  LUT6 #(
    .INIT(64'h333CC3338CC73C8C)) 
    \p_0_out_inferred__0/product10_i_730 
       (.I0(sel[2]),
        .I1(sel[4]),
        .I2(sel[11]),
        .I3(sel[0]),
        .I4(sel[3]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_730_n_0 ));
  LUT6 #(
    .INIT(64'h59596565A6A79AA6)) 
    \p_0_out_inferred__0/product10_i_731 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[2]),
        .I4(sel[0]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_731_n_0 ));
  LUT6 #(
    .INIT(64'h65E659758A9966AA)) 
    \p_0_out_inferred__0/product10_i_732 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[2]),
        .I3(sel[0]),
        .I4(sel[3]),
        .I5(sel[1]),
        .O(\p_0_out_inferred__0/product10_i_732_n_0 ));
  LUT6 #(
    .INIT(64'h791AA779A6711AA6)) 
    \p_0_out_inferred__0/product10_i_733 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[1]),
        .I4(sel[0]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_733_n_0 ));
  LUT6 #(
    .INIT(64'h0EF8C30F38E30F38)) 
    \p_0_out_inferred__0/product10_i_734 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_734_n_0 ));
  LUT6 #(
    .INIT(64'hBDD24B2DD4432FB4)) 
    \p_0_out_inferred__0/product10_i_735 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_735_n_0 ));
  LUT6 #(
    .INIT(64'hA995566AA995522B)) 
    \p_0_out_inferred__0/product10_i_736 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[0]),
        .I4(sel[1]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_736_n_0 ));
  LUT6 #(
    .INIT(64'hDBF32C0C2C4DF3B3)) 
    \p_0_out_inferred__0/product10_i_737 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[2]),
        .I3(sel[1]),
        .I4(sel[3]),
        .I5(sel[0]),
        .O(\p_0_out_inferred__0/product10_i_737_n_0 ));
  LUT6 #(
    .INIT(64'h9A59716465A29A59)) 
    \p_0_out_inferred__0/product10_i_738 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[1]),
        .I3(sel[3]),
        .I4(sel[0]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_738_n_0 ));
  LUT6 #(
    .INIT(64'hFF3700CC01C8FF33)) 
    \p_0_out_inferred__0/product10_i_739 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[3]),
        .I3(sel[1]),
        .I4(sel[0]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_739_n_0 ));
  LUT6 #(
    .INIT(64'h01010101FFFEFEFE)) 
    \p_0_out_inferred__0/product10_i_74 
       (.I0(sel[6]),
        .I1(sel[5]),
        .I2(sel[4]),
        .I3(sel[3]),
        .I4(\p_0_out_inferred__0/product10_i_184_n_0 ),
        .I5(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_74_n_0 ));
  LUT6 #(
    .INIT(64'h4DDBA424B624DBF3)) 
    \p_0_out_inferred__0/product10_i_740 
       (.I0(sel[4]),
        .I1(sel[11]),
        .I2(sel[1]),
        .I3(sel[3]),
        .I4(sel[0]),
        .I5(sel[2]),
        .O(\p_0_out_inferred__0/product10_i_740_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \p_0_out_inferred__0/product10_i_75 
       (.I0(sel[11]),
        .I1(\p_0_out_inferred__0/product10_i_185_n_0 ),
        .I2(sel[6]),
        .I3(\p_0_out_inferred__0/product10_i_186_n_0 ),
        .I4(sel[5]),
        .I5(\p_0_out_inferred__0/product10_i_173_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_75_n_0 ));
  MUXF8 \p_0_out_inferred__0/product10_i_76 
       (.I0(\p_0_out_inferred__0/product10_i_187_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_188_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_76_n_0 ),
        .S(sel[6]));
  MUXF8 \p_0_out_inferred__0/product10_i_77 
       (.I0(\p_0_out_inferred__0/product10_i_189_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_190_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_77_n_0 ),
        .S(sel[6]));
  MUXF8 \p_0_out_inferred__0/product10_i_78 
       (.I0(\p_0_out_inferred__0/product10_i_191_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_192_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_78_n_0 ),
        .S(sel[6]));
  MUXF8 \p_0_out_inferred__0/product10_i_79 
       (.I0(\p_0_out_inferred__0/product10_i_193_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_194_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_79_n_0 ),
        .S(sel[6]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \p_0_out_inferred__0/product10_i_8 
       (.I0(\p_0_out_inferred__0/product10_i_28_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_29_n_0 ),
        .I2(sel[9]),
        .I3(\p_0_out_inferred__0/product10_i_30_n_0 ),
        .I4(sel[10]),
        .I5(\p_0_out_inferred__0/product10_i_31_n_0 ),
        .O(p_0_out[4]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \p_0_out_inferred__0/product10_i_80 
       (.I0(\p_0_out_inferred__0/product10_i_162_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_195_n_0 ),
        .I2(sel[6]),
        .I3(\p_0_out_inferred__0/product10_i_196_n_0 ),
        .I4(sel[5]),
        .I5(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_80_n_0 ));
  LUT6 #(
    .INIT(64'hA0000000CFFFFFFF)) 
    \p_0_out_inferred__0/product10_i_81 
       (.I0(\p_0_out_inferred__0/product10_i_197_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_198_n_0 ),
        .I2(sel[4]),
        .I3(sel[5]),
        .I4(sel[6]),
        .I5(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_81_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \p_0_out_inferred__0/product10_i_82 
       (.I0(\p_0_out_inferred__0/product10_i_199_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_200_n_0 ),
        .I2(sel[7]),
        .I3(\p_0_out_inferred__0/product10_i_201_n_0 ),
        .I4(sel[6]),
        .I5(\p_0_out_inferred__0/product10_i_202_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_82_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \p_0_out_inferred__0/product10_i_83 
       (.I0(\p_0_out_inferred__0/product10_i_203_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_204_n_0 ),
        .I2(sel[7]),
        .I3(\p_0_out_inferred__0/product10_i_205_n_0 ),
        .I4(sel[6]),
        .I5(\p_0_out_inferred__0/product10_i_206_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_83_n_0 ));
  MUXF8 \p_0_out_inferred__0/product10_i_84 
       (.I0(\p_0_out_inferred__0/product10_i_207_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_208_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_84_n_0 ),
        .S(sel[6]));
  LUT5 #(
    .INIT(32'hB8F3B8C0)) 
    \p_0_out_inferred__0/product10_i_85 
       (.I0(\p_0_out_inferred__0/product10_i_209_n_0 ),
        .I1(sel[6]),
        .I2(\p_0_out_inferred__0/product10_i_210_n_0 ),
        .I3(sel[5]),
        .I4(\p_0_out_inferred__0/product10_i_211_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_85_n_0 ));
  MUXF8 \p_0_out_inferred__0/product10_i_86 
       (.I0(\p_0_out_inferred__0/product10_i_212_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_213_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_86_n_0 ),
        .S(sel[6]));
  MUXF8 \p_0_out_inferred__0/product10_i_87 
       (.I0(\p_0_out_inferred__0/product10_i_214_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_215_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_87_n_0 ),
        .S(sel[6]));
  LUT6 #(
    .INIT(64'h45504550FAAFFAAA)) 
    \p_0_out_inferred__0/product10_i_88 
       (.I0(sel[6]),
        .I1(\p_0_out_inferred__0/product10_i_198_n_0 ),
        .I2(sel[5]),
        .I3(sel[4]),
        .I4(\p_0_out_inferred__0/product10_i_216_n_0 ),
        .I5(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_88_n_0 ));
  MUXF8 \p_0_out_inferred__0/product10_i_89 
       (.I0(\p_0_out_inferred__0/product10_i_217_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_218_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_89_n_0 ),
        .S(sel[6]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \p_0_out_inferred__0/product10_i_9 
       (.I0(\p_0_out_inferred__0/product10_i_32_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_33_n_0 ),
        .I2(sel[9]),
        .I3(\p_0_out_inferred__0/product10_i_34_n_0 ),
        .I4(sel[10]),
        .I5(\p_0_out_inferred__0/product10_i_35_n_0 ),
        .O(p_0_out[3]));
  MUXF8 \p_0_out_inferred__0/product10_i_90 
       (.I0(\p_0_out_inferred__0/product10_i_219_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_220_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_90_n_0 ),
        .S(sel[6]));
  MUXF8 \p_0_out_inferred__0/product10_i_91 
       (.I0(\p_0_out_inferred__0/product10_i_221_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_222_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_91_n_0 ),
        .S(sel[6]));
  LUT6 #(
    .INIT(64'hAFA0C0C0AFA0CFCF)) 
    \p_0_out_inferred__0/product10_i_92 
       (.I0(\p_0_out_inferred__0/product10_i_223_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_224_n_0 ),
        .I2(sel[7]),
        .I3(\p_0_out_inferred__0/product10_i_225_n_0 ),
        .I4(sel[6]),
        .I5(sel[11]),
        .O(\p_0_out_inferred__0/product10_i_92_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \p_0_out_inferred__0/product10_i_93 
       (.I0(\p_0_out_inferred__0/product10_i_226_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_227_n_0 ),
        .I2(sel[7]),
        .I3(\p_0_out_inferred__0/product10_i_228_n_0 ),
        .I4(sel[6]),
        .I5(\p_0_out_inferred__0/product10_i_229_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_93_n_0 ));
  MUXF8 \p_0_out_inferred__0/product10_i_94 
       (.I0(\p_0_out_inferred__0/product10_i_230_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_231_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_94_n_0 ),
        .S(sel[6]));
  MUXF8 \p_0_out_inferred__0/product10_i_95 
       (.I0(\p_0_out_inferred__0/product10_i_232_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_233_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_95_n_0 ),
        .S(sel[6]));
  LUT5 #(
    .INIT(32'hB8F3B8C0)) 
    \p_0_out_inferred__0/product10_i_96 
       (.I0(\p_0_out_inferred__0/product10_i_234_n_0 ),
        .I1(sel[6]),
        .I2(\p_0_out_inferred__0/product10_i_235_n_0 ),
        .I3(sel[5]),
        .I4(\p_0_out_inferred__0/product10_i_236_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_96_n_0 ));
  MUXF8 \p_0_out_inferred__0/product10_i_97 
       (.I0(\p_0_out_inferred__0/product10_i_237_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_238_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_97_n_0 ),
        .S(sel[6]));
  MUXF8 \p_0_out_inferred__0/product10_i_98 
       (.I0(\p_0_out_inferred__0/product10_i_239_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_240_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_98_n_0 ),
        .S(sel[6]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \p_0_out_inferred__0/product10_i_99 
       (.I0(\p_0_out_inferred__0/product10_i_241_n_0 ),
        .I1(\p_0_out_inferred__0/product10_i_242_n_0 ),
        .I2(sel[6]),
        .I3(\p_0_out_inferred__0/product10_i_243_n_0 ),
        .I4(sel[5]),
        .I5(\p_0_out_inferred__0/product10_i_244_n_0 ),
        .O(\p_0_out_inferred__0/product10_i_99_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \phase_accumulator[11]_i_2 
       (.I0(reference_ftw[11]),
        .I1(E),
        .O(\phase_accumulator[11]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \phase_accumulator[11]_i_3 
       (.I0(reference_ftw[10]),
        .I1(E),
        .O(\phase_accumulator[11]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \phase_accumulator[11]_i_4 
       (.I0(reference_ftw[9]),
        .I1(E),
        .O(\phase_accumulator[11]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \phase_accumulator[11]_i_5 
       (.I0(reference_ftw[8]),
        .I1(E),
        .O(\phase_accumulator[11]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \phase_accumulator[11]_i_6 
       (.I0(reference_ftw[11]),
        .I1(phase_accumulator[11]),
        .I2(E),
        .O(\phase_accumulator[11]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \phase_accumulator[11]_i_7 
       (.I0(reference_ftw[10]),
        .I1(phase_accumulator[10]),
        .I2(E),
        .O(\phase_accumulator[11]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \phase_accumulator[11]_i_8 
       (.I0(reference_ftw[9]),
        .I1(phase_accumulator[9]),
        .I2(E),
        .O(\phase_accumulator[11]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \phase_accumulator[11]_i_9 
       (.I0(reference_ftw[8]),
        .I1(phase_accumulator[8]),
        .I2(E),
        .O(\phase_accumulator[11]_i_9_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \phase_accumulator[15]_i_2 
       (.I0(reference_ftw[15]),
        .I1(E),
        .O(\phase_accumulator[15]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \phase_accumulator[15]_i_3 
       (.I0(reference_ftw[14]),
        .I1(E),
        .O(\phase_accumulator[15]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \phase_accumulator[15]_i_4 
       (.I0(reference_ftw[13]),
        .I1(E),
        .O(\phase_accumulator[15]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \phase_accumulator[15]_i_5 
       (.I0(reference_ftw[12]),
        .I1(E),
        .O(\phase_accumulator[15]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \phase_accumulator[15]_i_6 
       (.I0(reference_ftw[15]),
        .I1(phase_accumulator[15]),
        .I2(E),
        .O(\phase_accumulator[15]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \phase_accumulator[15]_i_7 
       (.I0(reference_ftw[14]),
        .I1(phase_accumulator[14]),
        .I2(E),
        .O(\phase_accumulator[15]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \phase_accumulator[15]_i_8 
       (.I0(reference_ftw[13]),
        .I1(phase_accumulator[13]),
        .I2(E),
        .O(\phase_accumulator[15]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \phase_accumulator[15]_i_9 
       (.I0(reference_ftw[12]),
        .I1(phase_accumulator[12]),
        .I2(E),
        .O(\phase_accumulator[15]_i_9_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \phase_accumulator[19]_i_2 
       (.I0(reference_ftw[19]),
        .I1(E),
        .O(\phase_accumulator[19]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \phase_accumulator[19]_i_3 
       (.I0(reference_ftw[18]),
        .I1(E),
        .O(\phase_accumulator[19]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \phase_accumulator[19]_i_4 
       (.I0(reference_ftw[17]),
        .I1(E),
        .O(\phase_accumulator[19]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \phase_accumulator[19]_i_5 
       (.I0(reference_ftw[16]),
        .I1(E),
        .O(\phase_accumulator[19]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \phase_accumulator[19]_i_6 
       (.I0(reference_ftw[19]),
        .I1(phase_accumulator[19]),
        .I2(E),
        .O(\phase_accumulator[19]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \phase_accumulator[19]_i_7 
       (.I0(reference_ftw[18]),
        .I1(phase_accumulator[18]),
        .I2(E),
        .O(\phase_accumulator[19]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \phase_accumulator[19]_i_8 
       (.I0(reference_ftw[17]),
        .I1(phase_accumulator[17]),
        .I2(E),
        .O(\phase_accumulator[19]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \phase_accumulator[19]_i_9 
       (.I0(reference_ftw[16]),
        .I1(phase_accumulator[16]),
        .I2(E),
        .O(\phase_accumulator[19]_i_9_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \phase_accumulator[23]_i_2 
       (.I0(reference_ftw[23]),
        .I1(E),
        .O(\phase_accumulator[23]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \phase_accumulator[23]_i_3 
       (.I0(reference_ftw[22]),
        .I1(E),
        .O(\phase_accumulator[23]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \phase_accumulator[23]_i_4 
       (.I0(reference_ftw[21]),
        .I1(E),
        .O(\phase_accumulator[23]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \phase_accumulator[23]_i_5 
       (.I0(reference_ftw[20]),
        .I1(E),
        .O(\phase_accumulator[23]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \phase_accumulator[23]_i_6 
       (.I0(reference_ftw[23]),
        .I1(phase_accumulator[23]),
        .I2(E),
        .O(\phase_accumulator[23]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \phase_accumulator[23]_i_7 
       (.I0(reference_ftw[22]),
        .I1(phase_accumulator[22]),
        .I2(E),
        .O(\phase_accumulator[23]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \phase_accumulator[23]_i_8 
       (.I0(reference_ftw[21]),
        .I1(phase_accumulator[21]),
        .I2(E),
        .O(\phase_accumulator[23]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \phase_accumulator[23]_i_9 
       (.I0(reference_ftw[20]),
        .I1(phase_accumulator[20]),
        .I2(E),
        .O(\phase_accumulator[23]_i_9_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \phase_accumulator[27]_i_2 
       (.I0(reference_ftw[27]),
        .I1(E),
        .O(\phase_accumulator[27]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \phase_accumulator[27]_i_3 
       (.I0(reference_ftw[26]),
        .I1(E),
        .O(\phase_accumulator[27]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \phase_accumulator[27]_i_4 
       (.I0(reference_ftw[25]),
        .I1(E),
        .O(\phase_accumulator[27]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \phase_accumulator[27]_i_5 
       (.I0(reference_ftw[24]),
        .I1(E),
        .O(\phase_accumulator[27]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \phase_accumulator[27]_i_6 
       (.I0(reference_ftw[27]),
        .I1(phase_accumulator[27]),
        .I2(E),
        .O(\phase_accumulator[27]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \phase_accumulator[27]_i_7 
       (.I0(reference_ftw[26]),
        .I1(phase_accumulator[26]),
        .I2(E),
        .O(\phase_accumulator[27]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \phase_accumulator[27]_i_8 
       (.I0(reference_ftw[25]),
        .I1(phase_accumulator[25]),
        .I2(E),
        .O(\phase_accumulator[27]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \phase_accumulator[27]_i_9 
       (.I0(reference_ftw[24]),
        .I1(phase_accumulator[24]),
        .I2(E),
        .O(\phase_accumulator[27]_i_9_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \phase_accumulator[31]_i_3 
       (.I0(reference_ftw[30]),
        .I1(E),
        .O(\phase_accumulator[31]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \phase_accumulator[31]_i_4 
       (.I0(reference_ftw[29]),
        .I1(E),
        .O(\phase_accumulator[31]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \phase_accumulator[31]_i_5 
       (.I0(reference_ftw[28]),
        .I1(E),
        .O(\phase_accumulator[31]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \phase_accumulator[31]_i_6 
       (.I0(reference_ftw[31]),
        .I1(phase_accumulator[31]),
        .I2(E),
        .O(\phase_accumulator[31]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \phase_accumulator[31]_i_7 
       (.I0(reference_ftw[30]),
        .I1(phase_accumulator[30]),
        .I2(E),
        .O(\phase_accumulator[31]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \phase_accumulator[31]_i_8 
       (.I0(reference_ftw[29]),
        .I1(phase_accumulator[29]),
        .I2(E),
        .O(\phase_accumulator[31]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \phase_accumulator[31]_i_9 
       (.I0(reference_ftw[28]),
        .I1(phase_accumulator[28]),
        .I2(E),
        .O(\phase_accumulator[31]_i_9_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \phase_accumulator[3]_i_2 
       (.I0(reference_ftw[3]),
        .I1(E),
        .O(\phase_accumulator[3]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \phase_accumulator[3]_i_3 
       (.I0(reference_ftw[2]),
        .I1(E),
        .O(\phase_accumulator[3]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \phase_accumulator[3]_i_4 
       (.I0(reference_ftw[1]),
        .I1(E),
        .O(\phase_accumulator[3]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \phase_accumulator[3]_i_5 
       (.I0(reference_ftw[0]),
        .I1(E),
        .O(\phase_accumulator[3]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \phase_accumulator[3]_i_6 
       (.I0(reference_ftw[3]),
        .I1(phase_accumulator[3]),
        .I2(E),
        .O(\phase_accumulator[3]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \phase_accumulator[3]_i_7 
       (.I0(reference_ftw[2]),
        .I1(phase_accumulator[2]),
        .I2(E),
        .O(\phase_accumulator[3]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \phase_accumulator[3]_i_8 
       (.I0(reference_ftw[1]),
        .I1(phase_accumulator[1]),
        .I2(E),
        .O(\phase_accumulator[3]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \phase_accumulator[3]_i_9 
       (.I0(reference_ftw[0]),
        .I1(phase_accumulator[0]),
        .I2(E),
        .O(\phase_accumulator[3]_i_9_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \phase_accumulator[7]_i_2 
       (.I0(reference_ftw[7]),
        .I1(E),
        .O(\phase_accumulator[7]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \phase_accumulator[7]_i_3 
       (.I0(reference_ftw[6]),
        .I1(E),
        .O(\phase_accumulator[7]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \phase_accumulator[7]_i_4 
       (.I0(reference_ftw[5]),
        .I1(E),
        .O(\phase_accumulator[7]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \phase_accumulator[7]_i_5 
       (.I0(reference_ftw[4]),
        .I1(E),
        .O(\phase_accumulator[7]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \phase_accumulator[7]_i_6 
       (.I0(reference_ftw[7]),
        .I1(phase_accumulator[7]),
        .I2(E),
        .O(\phase_accumulator[7]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \phase_accumulator[7]_i_7 
       (.I0(reference_ftw[6]),
        .I1(phase_accumulator[6]),
        .I2(E),
        .O(\phase_accumulator[7]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \phase_accumulator[7]_i_8 
       (.I0(reference_ftw[5]),
        .I1(phase_accumulator[5]),
        .I2(E),
        .O(\phase_accumulator[7]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \phase_accumulator[7]_i_9 
       (.I0(reference_ftw[4]),
        .I1(phase_accumulator[4]),
        .I2(E),
        .O(\phase_accumulator[7]_i_9_n_0 ));
  FDCE \phase_accumulator_reg[0] 
       (.C(sample_clk),
        .CE(\phase_accumulator_reg[31]_0 ),
        .CLR(sample_resetn_0),
        .D(\phase_accumulator_reg[3]_i_1_n_7 ),
        .Q(phase_accumulator[0]));
  FDCE \phase_accumulator_reg[10] 
       (.C(sample_clk),
        .CE(\phase_accumulator_reg[31]_0 ),
        .CLR(sample_resetn_0),
        .D(\phase_accumulator_reg[11]_i_1_n_5 ),
        .Q(phase_accumulator[10]));
  FDCE \phase_accumulator_reg[11] 
       (.C(sample_clk),
        .CE(\phase_accumulator_reg[31]_0 ),
        .CLR(sample_resetn_0),
        .D(\phase_accumulator_reg[11]_i_1_n_4 ),
        .Q(phase_accumulator[11]));
  CARRY4 \phase_accumulator_reg[11]_i_1 
       (.CI(\phase_accumulator_reg[7]_i_1_n_0 ),
        .CO({\phase_accumulator_reg[11]_i_1_n_0 ,\phase_accumulator_reg[11]_i_1_n_1 ,\phase_accumulator_reg[11]_i_1_n_2 ,\phase_accumulator_reg[11]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({\phase_accumulator[11]_i_2_n_0 ,\phase_accumulator[11]_i_3_n_0 ,\phase_accumulator[11]_i_4_n_0 ,\phase_accumulator[11]_i_5_n_0 }),
        .O({\phase_accumulator_reg[11]_i_1_n_4 ,\phase_accumulator_reg[11]_i_1_n_5 ,\phase_accumulator_reg[11]_i_1_n_6 ,\phase_accumulator_reg[11]_i_1_n_7 }),
        .S({\phase_accumulator[11]_i_6_n_0 ,\phase_accumulator[11]_i_7_n_0 ,\phase_accumulator[11]_i_8_n_0 ,\phase_accumulator[11]_i_9_n_0 }));
  FDCE \phase_accumulator_reg[12] 
       (.C(sample_clk),
        .CE(\phase_accumulator_reg[31]_0 ),
        .CLR(sample_resetn_0),
        .D(\phase_accumulator_reg[15]_i_1_n_7 ),
        .Q(phase_accumulator[12]));
  FDCE \phase_accumulator_reg[13] 
       (.C(sample_clk),
        .CE(\phase_accumulator_reg[31]_0 ),
        .CLR(sample_resetn_0),
        .D(\phase_accumulator_reg[15]_i_1_n_6 ),
        .Q(phase_accumulator[13]));
  FDCE \phase_accumulator_reg[14] 
       (.C(sample_clk),
        .CE(\phase_accumulator_reg[31]_0 ),
        .CLR(sample_resetn_0),
        .D(\phase_accumulator_reg[15]_i_1_n_5 ),
        .Q(phase_accumulator[14]));
  FDCE \phase_accumulator_reg[15] 
       (.C(sample_clk),
        .CE(\phase_accumulator_reg[31]_0 ),
        .CLR(sample_resetn_0),
        .D(\phase_accumulator_reg[15]_i_1_n_4 ),
        .Q(phase_accumulator[15]));
  CARRY4 \phase_accumulator_reg[15]_i_1 
       (.CI(\phase_accumulator_reg[11]_i_1_n_0 ),
        .CO({\phase_accumulator_reg[15]_i_1_n_0 ,\phase_accumulator_reg[15]_i_1_n_1 ,\phase_accumulator_reg[15]_i_1_n_2 ,\phase_accumulator_reg[15]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({\phase_accumulator[15]_i_2_n_0 ,\phase_accumulator[15]_i_3_n_0 ,\phase_accumulator[15]_i_4_n_0 ,\phase_accumulator[15]_i_5_n_0 }),
        .O({\phase_accumulator_reg[15]_i_1_n_4 ,\phase_accumulator_reg[15]_i_1_n_5 ,\phase_accumulator_reg[15]_i_1_n_6 ,\phase_accumulator_reg[15]_i_1_n_7 }),
        .S({\phase_accumulator[15]_i_6_n_0 ,\phase_accumulator[15]_i_7_n_0 ,\phase_accumulator[15]_i_8_n_0 ,\phase_accumulator[15]_i_9_n_0 }));
  FDCE \phase_accumulator_reg[16] 
       (.C(sample_clk),
        .CE(\phase_accumulator_reg[31]_0 ),
        .CLR(sample_resetn_0),
        .D(\phase_accumulator_reg[19]_i_1_n_7 ),
        .Q(phase_accumulator[16]));
  FDCE \phase_accumulator_reg[17] 
       (.C(sample_clk),
        .CE(\phase_accumulator_reg[31]_0 ),
        .CLR(sample_resetn_0),
        .D(\phase_accumulator_reg[19]_i_1_n_6 ),
        .Q(phase_accumulator[17]));
  FDCE \phase_accumulator_reg[18] 
       (.C(sample_clk),
        .CE(\phase_accumulator_reg[31]_0 ),
        .CLR(sample_resetn_0),
        .D(\phase_accumulator_reg[19]_i_1_n_5 ),
        .Q(phase_accumulator[18]));
  FDCE \phase_accumulator_reg[19] 
       (.C(sample_clk),
        .CE(\phase_accumulator_reg[31]_0 ),
        .CLR(sample_resetn_0),
        .D(\phase_accumulator_reg[19]_i_1_n_4 ),
        .Q(phase_accumulator[19]));
  CARRY4 \phase_accumulator_reg[19]_i_1 
       (.CI(\phase_accumulator_reg[15]_i_1_n_0 ),
        .CO({\phase_accumulator_reg[19]_i_1_n_0 ,\phase_accumulator_reg[19]_i_1_n_1 ,\phase_accumulator_reg[19]_i_1_n_2 ,\phase_accumulator_reg[19]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({\phase_accumulator[19]_i_2_n_0 ,\phase_accumulator[19]_i_3_n_0 ,\phase_accumulator[19]_i_4_n_0 ,\phase_accumulator[19]_i_5_n_0 }),
        .O({\phase_accumulator_reg[19]_i_1_n_4 ,\phase_accumulator_reg[19]_i_1_n_5 ,\phase_accumulator_reg[19]_i_1_n_6 ,\phase_accumulator_reg[19]_i_1_n_7 }),
        .S({\phase_accumulator[19]_i_6_n_0 ,\phase_accumulator[19]_i_7_n_0 ,\phase_accumulator[19]_i_8_n_0 ,\phase_accumulator[19]_i_9_n_0 }));
  FDCE \phase_accumulator_reg[1] 
       (.C(sample_clk),
        .CE(\phase_accumulator_reg[31]_0 ),
        .CLR(sample_resetn_0),
        .D(\phase_accumulator_reg[3]_i_1_n_6 ),
        .Q(phase_accumulator[1]));
  FDCE \phase_accumulator_reg[20] 
       (.C(sample_clk),
        .CE(\phase_accumulator_reg[31]_0 ),
        .CLR(sample_resetn_0),
        .D(\phase_accumulator_reg[23]_i_1_n_7 ),
        .Q(phase_accumulator[20]));
  FDCE \phase_accumulator_reg[21] 
       (.C(sample_clk),
        .CE(\phase_accumulator_reg[31]_0 ),
        .CLR(sample_resetn_0),
        .D(\phase_accumulator_reg[23]_i_1_n_6 ),
        .Q(phase_accumulator[21]));
  FDCE \phase_accumulator_reg[22] 
       (.C(sample_clk),
        .CE(\phase_accumulator_reg[31]_0 ),
        .CLR(sample_resetn_0),
        .D(\phase_accumulator_reg[23]_i_1_n_5 ),
        .Q(phase_accumulator[22]));
  FDCE \phase_accumulator_reg[23] 
       (.C(sample_clk),
        .CE(\phase_accumulator_reg[31]_0 ),
        .CLR(sample_resetn_0),
        .D(\phase_accumulator_reg[23]_i_1_n_4 ),
        .Q(phase_accumulator[23]));
  CARRY4 \phase_accumulator_reg[23]_i_1 
       (.CI(\phase_accumulator_reg[19]_i_1_n_0 ),
        .CO({\phase_accumulator_reg[23]_i_1_n_0 ,\phase_accumulator_reg[23]_i_1_n_1 ,\phase_accumulator_reg[23]_i_1_n_2 ,\phase_accumulator_reg[23]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({\phase_accumulator[23]_i_2_n_0 ,\phase_accumulator[23]_i_3_n_0 ,\phase_accumulator[23]_i_4_n_0 ,\phase_accumulator[23]_i_5_n_0 }),
        .O({\phase_accumulator_reg[23]_i_1_n_4 ,\phase_accumulator_reg[23]_i_1_n_5 ,\phase_accumulator_reg[23]_i_1_n_6 ,\phase_accumulator_reg[23]_i_1_n_7 }),
        .S({\phase_accumulator[23]_i_6_n_0 ,\phase_accumulator[23]_i_7_n_0 ,\phase_accumulator[23]_i_8_n_0 ,\phase_accumulator[23]_i_9_n_0 }));
  FDCE \phase_accumulator_reg[24] 
       (.C(sample_clk),
        .CE(\phase_accumulator_reg[31]_0 ),
        .CLR(sample_resetn_0),
        .D(\phase_accumulator_reg[27]_i_1_n_7 ),
        .Q(phase_accumulator[24]));
  FDCE \phase_accumulator_reg[25] 
       (.C(sample_clk),
        .CE(\phase_accumulator_reg[31]_0 ),
        .CLR(sample_resetn_0),
        .D(\phase_accumulator_reg[27]_i_1_n_6 ),
        .Q(phase_accumulator[25]));
  FDCE \phase_accumulator_reg[26] 
       (.C(sample_clk),
        .CE(\phase_accumulator_reg[31]_0 ),
        .CLR(sample_resetn_0),
        .D(\phase_accumulator_reg[27]_i_1_n_5 ),
        .Q(phase_accumulator[26]));
  FDCE \phase_accumulator_reg[27] 
       (.C(sample_clk),
        .CE(\phase_accumulator_reg[31]_0 ),
        .CLR(sample_resetn_0),
        .D(\phase_accumulator_reg[27]_i_1_n_4 ),
        .Q(phase_accumulator[27]));
  CARRY4 \phase_accumulator_reg[27]_i_1 
       (.CI(\phase_accumulator_reg[23]_i_1_n_0 ),
        .CO({\phase_accumulator_reg[27]_i_1_n_0 ,\phase_accumulator_reg[27]_i_1_n_1 ,\phase_accumulator_reg[27]_i_1_n_2 ,\phase_accumulator_reg[27]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({\phase_accumulator[27]_i_2_n_0 ,\phase_accumulator[27]_i_3_n_0 ,\phase_accumulator[27]_i_4_n_0 ,\phase_accumulator[27]_i_5_n_0 }),
        .O({\phase_accumulator_reg[27]_i_1_n_4 ,\phase_accumulator_reg[27]_i_1_n_5 ,\phase_accumulator_reg[27]_i_1_n_6 ,\phase_accumulator_reg[27]_i_1_n_7 }),
        .S({\phase_accumulator[27]_i_6_n_0 ,\phase_accumulator[27]_i_7_n_0 ,\phase_accumulator[27]_i_8_n_0 ,\phase_accumulator[27]_i_9_n_0 }));
  FDCE \phase_accumulator_reg[28] 
       (.C(sample_clk),
        .CE(\phase_accumulator_reg[31]_0 ),
        .CLR(sample_resetn_0),
        .D(\phase_accumulator_reg[31]_i_2_n_7 ),
        .Q(phase_accumulator[28]));
  FDCE \phase_accumulator_reg[29] 
       (.C(sample_clk),
        .CE(\phase_accumulator_reg[31]_0 ),
        .CLR(sample_resetn_0),
        .D(\phase_accumulator_reg[31]_i_2_n_6 ),
        .Q(phase_accumulator[29]));
  FDCE \phase_accumulator_reg[2] 
       (.C(sample_clk),
        .CE(\phase_accumulator_reg[31]_0 ),
        .CLR(sample_resetn_0),
        .D(\phase_accumulator_reg[3]_i_1_n_5 ),
        .Q(phase_accumulator[2]));
  FDCE \phase_accumulator_reg[30] 
       (.C(sample_clk),
        .CE(\phase_accumulator_reg[31]_0 ),
        .CLR(sample_resetn_0),
        .D(\phase_accumulator_reg[31]_i_2_n_5 ),
        .Q(phase_accumulator[30]));
  FDCE \phase_accumulator_reg[31] 
       (.C(sample_clk),
        .CE(\phase_accumulator_reg[31]_0 ),
        .CLR(sample_resetn_0),
        .D(\phase_accumulator_reg[31]_i_2_n_4 ),
        .Q(phase_accumulator[31]));
  CARRY4 \phase_accumulator_reg[31]_i_2 
       (.CI(\phase_accumulator_reg[27]_i_1_n_0 ),
        .CO({\NLW_phase_accumulator_reg[31]_i_2_CO_UNCONNECTED [3],\phase_accumulator_reg[31]_i_2_n_1 ,\phase_accumulator_reg[31]_i_2_n_2 ,\phase_accumulator_reg[31]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,\phase_accumulator[31]_i_3_n_0 ,\phase_accumulator[31]_i_4_n_0 ,\phase_accumulator[31]_i_5_n_0 }),
        .O({\phase_accumulator_reg[31]_i_2_n_4 ,\phase_accumulator_reg[31]_i_2_n_5 ,\phase_accumulator_reg[31]_i_2_n_6 ,\phase_accumulator_reg[31]_i_2_n_7 }),
        .S({\phase_accumulator[31]_i_6_n_0 ,\phase_accumulator[31]_i_7_n_0 ,\phase_accumulator[31]_i_8_n_0 ,\phase_accumulator[31]_i_9_n_0 }));
  FDCE \phase_accumulator_reg[3] 
       (.C(sample_clk),
        .CE(\phase_accumulator_reg[31]_0 ),
        .CLR(sample_resetn_0),
        .D(\phase_accumulator_reg[3]_i_1_n_4 ),
        .Q(phase_accumulator[3]));
  CARRY4 \phase_accumulator_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\phase_accumulator_reg[3]_i_1_n_0 ,\phase_accumulator_reg[3]_i_1_n_1 ,\phase_accumulator_reg[3]_i_1_n_2 ,\phase_accumulator_reg[3]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({\phase_accumulator[3]_i_2_n_0 ,\phase_accumulator[3]_i_3_n_0 ,\phase_accumulator[3]_i_4_n_0 ,\phase_accumulator[3]_i_5_n_0 }),
        .O({\phase_accumulator_reg[3]_i_1_n_4 ,\phase_accumulator_reg[3]_i_1_n_5 ,\phase_accumulator_reg[3]_i_1_n_6 ,\phase_accumulator_reg[3]_i_1_n_7 }),
        .S({\phase_accumulator[3]_i_6_n_0 ,\phase_accumulator[3]_i_7_n_0 ,\phase_accumulator[3]_i_8_n_0 ,\phase_accumulator[3]_i_9_n_0 }));
  FDCE \phase_accumulator_reg[4] 
       (.C(sample_clk),
        .CE(\phase_accumulator_reg[31]_0 ),
        .CLR(sample_resetn_0),
        .D(\phase_accumulator_reg[7]_i_1_n_7 ),
        .Q(phase_accumulator[4]));
  FDCE \phase_accumulator_reg[5] 
       (.C(sample_clk),
        .CE(\phase_accumulator_reg[31]_0 ),
        .CLR(sample_resetn_0),
        .D(\phase_accumulator_reg[7]_i_1_n_6 ),
        .Q(phase_accumulator[5]));
  FDCE \phase_accumulator_reg[6] 
       (.C(sample_clk),
        .CE(\phase_accumulator_reg[31]_0 ),
        .CLR(sample_resetn_0),
        .D(\phase_accumulator_reg[7]_i_1_n_5 ),
        .Q(phase_accumulator[6]));
  FDCE \phase_accumulator_reg[7] 
       (.C(sample_clk),
        .CE(\phase_accumulator_reg[31]_0 ),
        .CLR(sample_resetn_0),
        .D(\phase_accumulator_reg[7]_i_1_n_4 ),
        .Q(phase_accumulator[7]));
  CARRY4 \phase_accumulator_reg[7]_i_1 
       (.CI(\phase_accumulator_reg[3]_i_1_n_0 ),
        .CO({\phase_accumulator_reg[7]_i_1_n_0 ,\phase_accumulator_reg[7]_i_1_n_1 ,\phase_accumulator_reg[7]_i_1_n_2 ,\phase_accumulator_reg[7]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({\phase_accumulator[7]_i_2_n_0 ,\phase_accumulator[7]_i_3_n_0 ,\phase_accumulator[7]_i_4_n_0 ,\phase_accumulator[7]_i_5_n_0 }),
        .O({\phase_accumulator_reg[7]_i_1_n_4 ,\phase_accumulator_reg[7]_i_1_n_5 ,\phase_accumulator_reg[7]_i_1_n_6 ,\phase_accumulator_reg[7]_i_1_n_7 }),
        .S({\phase_accumulator[7]_i_6_n_0 ,\phase_accumulator[7]_i_7_n_0 ,\phase_accumulator[7]_i_8_n_0 ,\phase_accumulator[7]_i_9_n_0 }));
  FDCE \phase_accumulator_reg[8] 
       (.C(sample_clk),
        .CE(\phase_accumulator_reg[31]_0 ),
        .CLR(sample_resetn_0),
        .D(\phase_accumulator_reg[11]_i_1_n_7 ),
        .Q(phase_accumulator[8]));
  FDCE \phase_accumulator_reg[9] 
       (.C(sample_clk),
        .CE(\phase_accumulator_reg[31]_0 ),
        .CLR(sample_resetn_0),
        .D(\phase_accumulator_reg[11]_i_1_n_6 ),
        .Q(phase_accumulator[9]));
  FDCE \phase_offset_reg[0] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[32]),
        .Q(phase_offset[0]));
  FDCE \phase_offset_reg[10] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[42]),
        .Q(phase_offset[10]));
  FDCE \phase_offset_reg[11] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[43]),
        .Q(phase_offset[11]));
  FDCE \phase_offset_reg[12] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[44]),
        .Q(phase_offset[12]));
  FDCE \phase_offset_reg[13] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[45]),
        .Q(phase_offset[13]));
  FDCE \phase_offset_reg[14] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[46]),
        .Q(phase_offset[14]));
  FDCE \phase_offset_reg[15] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[47]),
        .Q(phase_offset[15]));
  FDCE \phase_offset_reg[16] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[48]),
        .Q(phase_offset[16]));
  FDCE \phase_offset_reg[17] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[49]),
        .Q(phase_offset[17]));
  FDCE \phase_offset_reg[18] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[50]),
        .Q(phase_offset[18]));
  FDCE \phase_offset_reg[19] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[51]),
        .Q(phase_offset[19]));
  FDCE \phase_offset_reg[1] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[33]),
        .Q(phase_offset[1]));
  FDCE \phase_offset_reg[20] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[52]),
        .Q(phase_offset[20]));
  FDCE \phase_offset_reg[21] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[53]),
        .Q(phase_offset[21]));
  FDCE \phase_offset_reg[22] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[54]),
        .Q(phase_offset[22]));
  FDCE \phase_offset_reg[23] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[55]),
        .Q(phase_offset[23]));
  FDCE \phase_offset_reg[24] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[56]),
        .Q(phase_offset[24]));
  FDCE \phase_offset_reg[25] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[57]),
        .Q(phase_offset[25]));
  FDCE \phase_offset_reg[26] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[58]),
        .Q(phase_offset[26]));
  FDCE \phase_offset_reg[27] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[59]),
        .Q(phase_offset[27]));
  FDCE \phase_offset_reg[28] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[60]),
        .Q(phase_offset[28]));
  FDCE \phase_offset_reg[29] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[61]),
        .Q(phase_offset[29]));
  FDCE \phase_offset_reg[2] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[34]),
        .Q(phase_offset[2]));
  FDCE \phase_offset_reg[30] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[62]),
        .Q(phase_offset[30]));
  FDCE \phase_offset_reg[31] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[63]),
        .Q(phase_offset[31]));
  FDCE \phase_offset_reg[3] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[35]),
        .Q(phase_offset[3]));
  FDCE \phase_offset_reg[4] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[36]),
        .Q(phase_offset[4]));
  FDCE \phase_offset_reg[5] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[37]),
        .Q(phase_offset[5]));
  FDCE \phase_offset_reg[6] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[38]),
        .Q(phase_offset[6]));
  FDCE \phase_offset_reg[7] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[39]),
        .Q(phase_offset[7]));
  FDCE \phase_offset_reg[8] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[40]),
        .Q(phase_offset[8]));
  FDCE \phase_offset_reg[9] 
       (.C(sample_clk),
        .CE(reference_config_ftw0),
        .CLR(sample_resetn_0),
        .D(Q[41]),
        .Q(phase_offset[9]));
  DSP48E1 #(
    .ACASCREG(0),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(0),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(1),
    .BREG(1),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(1),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    product10
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,gain0}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_product10_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({p_0_out[11],p_0_out[11],p_0_out[11],p_0_out[11],p_0_out[11],p_0_out[11],p_0_out}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_product10_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_product10_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_product10_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(1'b0),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(1'b1),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(E),
        .CLK(sample_clk),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_product10_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_product10_OVERFLOW_UNCONNECTED),
        .P({NLW_product10_P_UNCONNECTED[47:25],product10_n_81,product10_n_82,product10_n_83,product10_n_84,product10_n_85,product10_n_86,product10_n_87,product10_n_88,product10_n_89,product10_n_90,product10_n_91,product10_n_92,product10_n_93,product10_n_94,product10_n_95,product10_n_96,product10_n_97,product10_n_98,product10_n_99,product10_n_100,product10_n_101,product10_n_102,product10_n_103,product10_n_104,product10_n_105}),
        .PATTERNBDETECT(NLW_product10_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_product10_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(NLW_product10_PCOUT_UNCONNECTED[47:0]),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(NLW_product10_UNDERFLOW_UNCONNECTED));
  LUT2 #(
    .INIT(4'h7)) 
    product10_i_334
       (.I0(sel[2]),
        .I1(sel[3]),
        .O(product10_i_334_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    reference_valid0_carry__0_i_1
       (.I0(active_tag[23]),
        .I1(reference_tag[23]),
        .I2(reference_tag[21]),
        .I3(active_tag[21]),
        .I4(reference_tag[22]),
        .I5(active_tag[22]),
        .O(\active_tag_reg[23]_0 [3]));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    reference_valid0_carry__0_i_2
       (.I0(active_tag[20]),
        .I1(reference_tag[20]),
        .I2(reference_tag[18]),
        .I3(active_tag[18]),
        .I4(reference_tag[19]),
        .I5(active_tag[19]),
        .O(\active_tag_reg[23]_0 [2]));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    reference_valid0_carry__0_i_3
       (.I0(active_tag[17]),
        .I1(reference_tag[17]),
        .I2(reference_tag[15]),
        .I3(active_tag[15]),
        .I4(reference_tag[16]),
        .I5(active_tag[16]),
        .O(\active_tag_reg[23]_0 [1]));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    reference_valid0_carry__0_i_4
       (.I0(active_tag[14]),
        .I1(reference_tag[14]),
        .I2(reference_tag[12]),
        .I3(active_tag[12]),
        .I4(reference_tag[13]),
        .I5(active_tag[13]),
        .O(\active_tag_reg[23]_0 [0]));
  LUT4 #(
    .INIT(16'h9009)) 
    reference_valid0_carry__1_i_1
       (.I0(active_tag[31]),
        .I1(reference_tag[31]),
        .I2(active_tag[30]),
        .I3(reference_tag[30]),
        .O(\active_tag_reg[31]_0 [2]));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    reference_valid0_carry__1_i_2
       (.I0(active_tag[29]),
        .I1(reference_tag[29]),
        .I2(reference_tag[27]),
        .I3(active_tag[27]),
        .I4(reference_tag[28]),
        .I5(active_tag[28]),
        .O(\active_tag_reg[31]_0 [1]));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    reference_valid0_carry__1_i_3
       (.I0(reference_tag[26]),
        .I1(active_tag[26]),
        .I2(reference_tag[24]),
        .I3(active_tag[24]),
        .I4(active_tag[25]),
        .I5(reference_tag[25]),
        .O(\active_tag_reg[31]_0 [0]));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    reference_valid0_carry_i_1
       (.I0(active_tag[11]),
        .I1(reference_tag[11]),
        .I2(reference_tag[10]),
        .I3(active_tag[10]),
        .I4(reference_tag[9]),
        .I5(active_tag[9]),
        .O(\active_tag_reg[11]_0 [3]));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    reference_valid0_carry_i_2
       (.I0(reference_tag[8]),
        .I1(active_tag[8]),
        .I2(reference_tag[6]),
        .I3(active_tag[6]),
        .I4(active_tag[7]),
        .I5(reference_tag[7]),
        .O(\active_tag_reg[11]_0 [2]));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    reference_valid0_carry_i_3
       (.I0(active_tag[5]),
        .I1(reference_tag[5]),
        .I2(reference_tag[3]),
        .I3(active_tag[3]),
        .I4(reference_tag[4]),
        .I5(active_tag[4]),
        .O(\active_tag_reg[11]_0 [1]));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    reference_valid0_carry_i_4
       (.I0(reference_tag[2]),
        .I1(active_tag[2]),
        .I2(reference_tag[0]),
        .I3(active_tag[0]),
        .I4(active_tag[1]),
        .I5(reference_tag[1]),
        .O(\active_tag_reg[11]_0 [0]));
  LUT6 #(
    .INIT(64'h0400000000000000)) 
    reference_valid_INST_0
       (.I0(out),
        .I1(D[0]),
        .I2(sample_clipped_reg_0),
        .I3(clock_run),
        .I4(sample_valid),
        .I5(reference_valid_0),
        .O(reference_valid));
  LUT6 #(
    .INIT(64'hAAAAAAAA00008000)) 
    \reply_data[33]_i_1 
       (.I0(sample_pending),
        .I1(sample_valid),
        .I2(CO),
        .I3(awaiting_sample_reg),
        .I4(cfg_accepted),
        .I5(D[1]),
        .O(sample_pending_reg));
  FDCE sample_active_reg
       (.C(sample_clk),
        .CE(\sample_code_reg[0]_0 ),
        .CLR(sample_resetn_0),
        .D(sample_active_reg_0),
        .Q(D[0]));
  LUT5 #(
    .INIT(32'hACACAC0C)) 
    sample_clipped_i_1
       (.I0(enabled2),
        .I1(Q[88]),
        .I2(E),
        .I3(\code2_reg_n_0_[15] ),
        .I4(bounded_code2_carry_n_2),
        .O(sample_clipped_i_1_n_0));
  FDCE sample_clipped_reg
       (.C(sample_clk),
        .CE(\sample_code_reg[0]_0 ),
        .CLR(sample_resetn_0),
        .D(sample_clipped_i_1_n_0),
        .Q(sample_clipped_reg_0));
  LUT6 #(
    .INIT(64'h8080808808080800)) 
    \sample_code[0]_i_1 
       (.I0(E),
        .I1(enabled2),
        .I2(\code2_reg_n_0_[15] ),
        .I3(\code2_reg_n_0_[0] ),
        .I4(bounded_code2_carry_n_2),
        .I5(invert2),
        .O(p_1_in[0]));
  LUT6 #(
    .INIT(64'h8080808808080800)) 
    \sample_code[10]_i_1 
       (.I0(E),
        .I1(enabled2),
        .I2(\code2_reg_n_0_[15] ),
        .I3(\code2_reg_n_0_[10] ),
        .I4(bounded_code2_carry_n_2),
        .I5(invert2),
        .O(p_1_in[10]));
  LUT6 #(
    .INIT(64'hF7F7F7FF7F7F7F77)) 
    \sample_code[11]_i_2 
       (.I0(E),
        .I1(enabled2),
        .I2(\code2_reg_n_0_[15] ),
        .I3(\code2_reg_n_0_[11] ),
        .I4(bounded_code2_carry_n_2),
        .I5(invert2),
        .O(p_1_in[11]));
  LUT6 #(
    .INIT(64'h8080808808080800)) 
    \sample_code[1]_i_1 
       (.I0(E),
        .I1(enabled2),
        .I2(\code2_reg_n_0_[15] ),
        .I3(\code2_reg_n_0_[1] ),
        .I4(bounded_code2_carry_n_2),
        .I5(invert2),
        .O(p_1_in[1]));
  LUT6 #(
    .INIT(64'h8080808808080800)) 
    \sample_code[2]_i_1 
       (.I0(E),
        .I1(enabled2),
        .I2(\code2_reg_n_0_[15] ),
        .I3(\code2_reg_n_0_[2] ),
        .I4(bounded_code2_carry_n_2),
        .I5(invert2),
        .O(p_1_in[2]));
  LUT6 #(
    .INIT(64'h8080808808080800)) 
    \sample_code[3]_i_1 
       (.I0(E),
        .I1(enabled2),
        .I2(\code2_reg_n_0_[15] ),
        .I3(\code2_reg_n_0_[3] ),
        .I4(bounded_code2_carry_n_2),
        .I5(invert2),
        .O(p_1_in[3]));
  LUT6 #(
    .INIT(64'h8080808808080800)) 
    \sample_code[4]_i_1 
       (.I0(E),
        .I1(enabled2),
        .I2(\code2_reg_n_0_[15] ),
        .I3(\code2_reg_n_0_[4] ),
        .I4(bounded_code2_carry_n_2),
        .I5(invert2),
        .O(p_1_in[4]));
  LUT6 #(
    .INIT(64'h8080808808080800)) 
    \sample_code[5]_i_1 
       (.I0(E),
        .I1(enabled2),
        .I2(\code2_reg_n_0_[15] ),
        .I3(\code2_reg_n_0_[5] ),
        .I4(bounded_code2_carry_n_2),
        .I5(invert2),
        .O(p_1_in[5]));
  LUT6 #(
    .INIT(64'h8080808808080800)) 
    \sample_code[6]_i_1 
       (.I0(E),
        .I1(enabled2),
        .I2(\code2_reg_n_0_[15] ),
        .I3(\code2_reg_n_0_[6] ),
        .I4(bounded_code2_carry_n_2),
        .I5(invert2),
        .O(p_1_in[6]));
  LUT6 #(
    .INIT(64'h8080808808080800)) 
    \sample_code[7]_i_1 
       (.I0(E),
        .I1(enabled2),
        .I2(\code2_reg_n_0_[15] ),
        .I3(\code2_reg_n_0_[7] ),
        .I4(bounded_code2_carry_n_2),
        .I5(invert2),
        .O(p_1_in[7]));
  LUT6 #(
    .INIT(64'h8080808808080800)) 
    \sample_code[8]_i_1 
       (.I0(E),
        .I1(enabled2),
        .I2(\code2_reg_n_0_[15] ),
        .I3(\code2_reg_n_0_[8] ),
        .I4(bounded_code2_carry_n_2),
        .I5(invert2),
        .O(p_1_in[8]));
  LUT6 #(
    .INIT(64'h8080808808080800)) 
    \sample_code[9]_i_1 
       (.I0(E),
        .I1(enabled2),
        .I2(\code2_reg_n_0_[15] ),
        .I3(\code2_reg_n_0_[9] ),
        .I4(bounded_code2_carry_n_2),
        .I5(invert2),
        .O(p_1_in[9]));
  FDCE \sample_code_reg[0] 
       (.C(sample_clk),
        .CE(\sample_code_reg[0]_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[0]),
        .Q(\sample_code_reg[11]_0 [0]));
  FDCE \sample_code_reg[10] 
       (.C(sample_clk),
        .CE(\sample_code_reg[0]_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[10]),
        .Q(\sample_code_reg[11]_0 [10]));
  FDPE \sample_code_reg[11] 
       (.C(sample_clk),
        .CE(\sample_code_reg[0]_0 ),
        .D(p_1_in[11]),
        .PRE(sample_resetn_0),
        .Q(\sample_code_reg[11]_0 [11]));
  FDCE \sample_code_reg[1] 
       (.C(sample_clk),
        .CE(\sample_code_reg[0]_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[1]),
        .Q(\sample_code_reg[11]_0 [1]));
  FDCE \sample_code_reg[2] 
       (.C(sample_clk),
        .CE(\sample_code_reg[0]_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[2]),
        .Q(\sample_code_reg[11]_0 [2]));
  FDCE \sample_code_reg[3] 
       (.C(sample_clk),
        .CE(\sample_code_reg[0]_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[3]),
        .Q(\sample_code_reg[11]_0 [3]));
  FDCE \sample_code_reg[4] 
       (.C(sample_clk),
        .CE(\sample_code_reg[0]_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[4]),
        .Q(\sample_code_reg[11]_0 [4]));
  FDCE \sample_code_reg[5] 
       (.C(sample_clk),
        .CE(\sample_code_reg[0]_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[5]),
        .Q(\sample_code_reg[11]_0 [5]));
  FDCE \sample_code_reg[6] 
       (.C(sample_clk),
        .CE(\sample_code_reg[0]_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[6]),
        .Q(\sample_code_reg[11]_0 [6]));
  FDCE \sample_code_reg[7] 
       (.C(sample_clk),
        .CE(\sample_code_reg[0]_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[7]),
        .Q(\sample_code_reg[11]_0 [7]));
  FDCE \sample_code_reg[8] 
       (.C(sample_clk),
        .CE(\sample_code_reg[0]_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[8]),
        .Q(\sample_code_reg[11]_0 [8]));
  FDCE \sample_code_reg[9] 
       (.C(sample_clk),
        .CE(\sample_code_reg[0]_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[9]),
        .Q(\sample_code_reg[11]_0 [9]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'hE)) 
    sample_initialized_i_1
       (.I0(sample_valid),
        .I1(sample_initialized),
        .O(sample_valid_reg_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    sample_pending1_carry__0_i_1
       (.I0(sample_pending1_carry__1[23]),
        .I1(reference_tag[23]),
        .I2(reference_tag[22]),
        .I3(sample_pending1_carry__1[22]),
        .I4(reference_tag[21]),
        .I5(sample_pending1_carry__1[21]),
        .O(\sample_tag_pending_reg[23] [3]));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    sample_pending1_carry__0_i_2
       (.I0(sample_pending1_carry__1[20]),
        .I1(reference_tag[20]),
        .I2(reference_tag[18]),
        .I3(sample_pending1_carry__1[18]),
        .I4(reference_tag[19]),
        .I5(sample_pending1_carry__1[19]),
        .O(\sample_tag_pending_reg[23] [2]));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    sample_pending1_carry__0_i_3
       (.I0(sample_pending1_carry__1[17]),
        .I1(reference_tag[17]),
        .I2(reference_tag[15]),
        .I3(sample_pending1_carry__1[15]),
        .I4(reference_tag[16]),
        .I5(sample_pending1_carry__1[16]),
        .O(\sample_tag_pending_reg[23] [1]));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    sample_pending1_carry__0_i_4
       (.I0(sample_pending1_carry__1[14]),
        .I1(reference_tag[14]),
        .I2(reference_tag[13]),
        .I3(sample_pending1_carry__1[13]),
        .I4(reference_tag[12]),
        .I5(sample_pending1_carry__1[12]),
        .O(\sample_tag_pending_reg[23] [0]));
  LUT4 #(
    .INIT(16'h9009)) 
    sample_pending1_carry__1_i_1
       (.I0(sample_pending1_carry__1[31]),
        .I1(reference_tag[31]),
        .I2(sample_pending1_carry__1[30]),
        .I3(reference_tag[30]),
        .O(\sample_tag_pending_reg[31] [2]));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    sample_pending1_carry__1_i_2
       (.I0(sample_pending1_carry__1[29]),
        .I1(reference_tag[29]),
        .I2(reference_tag[27]),
        .I3(sample_pending1_carry__1[27]),
        .I4(reference_tag[28]),
        .I5(sample_pending1_carry__1[28]),
        .O(\sample_tag_pending_reg[31] [1]));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    sample_pending1_carry__1_i_3
       (.I0(reference_tag[24]),
        .I1(sample_pending1_carry__1[24]),
        .I2(reference_tag[25]),
        .I3(sample_pending1_carry__1[25]),
        .I4(sample_pending1_carry__1[26]),
        .I5(reference_tag[26]),
        .O(\sample_tag_pending_reg[31] [0]));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    sample_pending1_carry_i_1
       (.I0(sample_pending1_carry__1[11]),
        .I1(reference_tag[11]),
        .I2(reference_tag[9]),
        .I3(sample_pending1_carry__1[9]),
        .I4(reference_tag[10]),
        .I5(sample_pending1_carry__1[10]),
        .O(S[3]));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    sample_pending1_carry_i_2
       (.I0(reference_tag[7]),
        .I1(sample_pending1_carry__1[7]),
        .I2(reference_tag[6]),
        .I3(sample_pending1_carry__1[6]),
        .I4(sample_pending1_carry__1[8]),
        .I5(reference_tag[8]),
        .O(S[2]));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    sample_pending1_carry_i_3
       (.I0(sample_pending1_carry__1[5]),
        .I1(reference_tag[5]),
        .I2(reference_tag[3]),
        .I3(sample_pending1_carry__1[3]),
        .I4(reference_tag[4]),
        .I5(sample_pending1_carry__1[4]),
        .O(S[1]));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    sample_pending1_carry_i_4
       (.I0(reference_tag[0]),
        .I1(sample_pending1_carry__1[0]),
        .I2(reference_tag[1]),
        .I3(sample_pending1_carry__1[1]),
        .I4(sample_pending1_carry__1[2]),
        .I5(reference_tag[2]),
        .O(S[0]));
  LUT2 #(
    .INIT(4'h8)) 
    \sample_phase[31]_i_1 
       (.I0(v2),
        .I1(E),
        .O(\sample_phase[31]_i_1_n_0 ));
  FDCE \sample_phase_reg[0] 
       (.C(sample_clk),
        .CE(\sample_phase[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p2[0]),
        .Q(reference_phase[0]));
  FDCE \sample_phase_reg[10] 
       (.C(sample_clk),
        .CE(\sample_phase[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p2[10]),
        .Q(reference_phase[10]));
  FDCE \sample_phase_reg[11] 
       (.C(sample_clk),
        .CE(\sample_phase[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p2[11]),
        .Q(reference_phase[11]));
  FDCE \sample_phase_reg[12] 
       (.C(sample_clk),
        .CE(\sample_phase[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p2[12]),
        .Q(reference_phase[12]));
  FDCE \sample_phase_reg[13] 
       (.C(sample_clk),
        .CE(\sample_phase[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p2[13]),
        .Q(reference_phase[13]));
  FDCE \sample_phase_reg[14] 
       (.C(sample_clk),
        .CE(\sample_phase[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p2[14]),
        .Q(reference_phase[14]));
  FDCE \sample_phase_reg[15] 
       (.C(sample_clk),
        .CE(\sample_phase[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p2[15]),
        .Q(reference_phase[15]));
  FDCE \sample_phase_reg[16] 
       (.C(sample_clk),
        .CE(\sample_phase[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p2[16]),
        .Q(reference_phase[16]));
  FDCE \sample_phase_reg[17] 
       (.C(sample_clk),
        .CE(\sample_phase[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p2[17]),
        .Q(reference_phase[17]));
  FDCE \sample_phase_reg[18] 
       (.C(sample_clk),
        .CE(\sample_phase[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p2[18]),
        .Q(reference_phase[18]));
  FDCE \sample_phase_reg[19] 
       (.C(sample_clk),
        .CE(\sample_phase[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p2[19]),
        .Q(reference_phase[19]));
  FDCE \sample_phase_reg[1] 
       (.C(sample_clk),
        .CE(\sample_phase[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p2[1]),
        .Q(reference_phase[1]));
  FDCE \sample_phase_reg[20] 
       (.C(sample_clk),
        .CE(\sample_phase[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p2[20]),
        .Q(reference_phase[20]));
  FDCE \sample_phase_reg[21] 
       (.C(sample_clk),
        .CE(\sample_phase[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p2[21]),
        .Q(reference_phase[21]));
  FDCE \sample_phase_reg[22] 
       (.C(sample_clk),
        .CE(\sample_phase[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p2[22]),
        .Q(reference_phase[22]));
  FDCE \sample_phase_reg[23] 
       (.C(sample_clk),
        .CE(\sample_phase[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p2[23]),
        .Q(reference_phase[23]));
  FDCE \sample_phase_reg[24] 
       (.C(sample_clk),
        .CE(\sample_phase[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p2[24]),
        .Q(reference_phase[24]));
  FDCE \sample_phase_reg[25] 
       (.C(sample_clk),
        .CE(\sample_phase[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p2[25]),
        .Q(reference_phase[25]));
  FDCE \sample_phase_reg[26] 
       (.C(sample_clk),
        .CE(\sample_phase[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p2[26]),
        .Q(reference_phase[26]));
  FDCE \sample_phase_reg[27] 
       (.C(sample_clk),
        .CE(\sample_phase[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p2[27]),
        .Q(reference_phase[27]));
  FDCE \sample_phase_reg[28] 
       (.C(sample_clk),
        .CE(\sample_phase[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p2[28]),
        .Q(reference_phase[28]));
  FDCE \sample_phase_reg[29] 
       (.C(sample_clk),
        .CE(\sample_phase[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p2[29]),
        .Q(reference_phase[29]));
  FDCE \sample_phase_reg[2] 
       (.C(sample_clk),
        .CE(\sample_phase[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p2[2]),
        .Q(reference_phase[2]));
  FDCE \sample_phase_reg[30] 
       (.C(sample_clk),
        .CE(\sample_phase[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p2[30]),
        .Q(reference_phase[30]));
  FDCE \sample_phase_reg[31] 
       (.C(sample_clk),
        .CE(\sample_phase[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p2[31]),
        .Q(reference_phase[31]));
  FDCE \sample_phase_reg[3] 
       (.C(sample_clk),
        .CE(\sample_phase[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p2[3]),
        .Q(reference_phase[3]));
  FDCE \sample_phase_reg[4] 
       (.C(sample_clk),
        .CE(\sample_phase[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p2[4]),
        .Q(reference_phase[4]));
  FDCE \sample_phase_reg[5] 
       (.C(sample_clk),
        .CE(\sample_phase[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p2[5]),
        .Q(reference_phase[5]));
  FDCE \sample_phase_reg[6] 
       (.C(sample_clk),
        .CE(\sample_phase[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p2[6]),
        .Q(reference_phase[6]));
  FDCE \sample_phase_reg[7] 
       (.C(sample_clk),
        .CE(\sample_phase[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p2[7]),
        .Q(reference_phase[7]));
  FDCE \sample_phase_reg[8] 
       (.C(sample_clk),
        .CE(\sample_phase[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p2[8]),
        .Q(reference_phase[8]));
  FDCE \sample_phase_reg[9] 
       (.C(sample_clk),
        .CE(\sample_phase[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p2[9]),
        .Q(reference_phase[9]));
  FDCE \sample_tag_reg[0] 
       (.C(sample_clk),
        .CE(\sample_phase[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(tag2[0]),
        .Q(reference_tag[0]));
  FDCE \sample_tag_reg[10] 
       (.C(sample_clk),
        .CE(\sample_phase[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(tag2[10]),
        .Q(reference_tag[10]));
  FDCE \sample_tag_reg[11] 
       (.C(sample_clk),
        .CE(\sample_phase[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(tag2[11]),
        .Q(reference_tag[11]));
  FDCE \sample_tag_reg[12] 
       (.C(sample_clk),
        .CE(\sample_phase[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(tag2[12]),
        .Q(reference_tag[12]));
  FDCE \sample_tag_reg[13] 
       (.C(sample_clk),
        .CE(\sample_phase[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(tag2[13]),
        .Q(reference_tag[13]));
  FDCE \sample_tag_reg[14] 
       (.C(sample_clk),
        .CE(\sample_phase[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(tag2[14]),
        .Q(reference_tag[14]));
  FDCE \sample_tag_reg[15] 
       (.C(sample_clk),
        .CE(\sample_phase[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(tag2[15]),
        .Q(reference_tag[15]));
  FDCE \sample_tag_reg[16] 
       (.C(sample_clk),
        .CE(\sample_phase[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(tag2[16]),
        .Q(reference_tag[16]));
  FDCE \sample_tag_reg[17] 
       (.C(sample_clk),
        .CE(\sample_phase[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(tag2[17]),
        .Q(reference_tag[17]));
  FDCE \sample_tag_reg[18] 
       (.C(sample_clk),
        .CE(\sample_phase[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(tag2[18]),
        .Q(reference_tag[18]));
  FDCE \sample_tag_reg[19] 
       (.C(sample_clk),
        .CE(\sample_phase[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(tag2[19]),
        .Q(reference_tag[19]));
  FDCE \sample_tag_reg[1] 
       (.C(sample_clk),
        .CE(\sample_phase[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(tag2[1]),
        .Q(reference_tag[1]));
  FDCE \sample_tag_reg[20] 
       (.C(sample_clk),
        .CE(\sample_phase[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(tag2[20]),
        .Q(reference_tag[20]));
  FDCE \sample_tag_reg[21] 
       (.C(sample_clk),
        .CE(\sample_phase[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(tag2[21]),
        .Q(reference_tag[21]));
  FDCE \sample_tag_reg[22] 
       (.C(sample_clk),
        .CE(\sample_phase[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(tag2[22]),
        .Q(reference_tag[22]));
  FDCE \sample_tag_reg[23] 
       (.C(sample_clk),
        .CE(\sample_phase[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(tag2[23]),
        .Q(reference_tag[23]));
  FDCE \sample_tag_reg[24] 
       (.C(sample_clk),
        .CE(\sample_phase[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(tag2[24]),
        .Q(reference_tag[24]));
  FDCE \sample_tag_reg[25] 
       (.C(sample_clk),
        .CE(\sample_phase[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(tag2[25]),
        .Q(reference_tag[25]));
  FDCE \sample_tag_reg[26] 
       (.C(sample_clk),
        .CE(\sample_phase[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(tag2[26]),
        .Q(reference_tag[26]));
  FDCE \sample_tag_reg[27] 
       (.C(sample_clk),
        .CE(\sample_phase[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(tag2[27]),
        .Q(reference_tag[27]));
  FDCE \sample_tag_reg[28] 
       (.C(sample_clk),
        .CE(\sample_phase[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(tag2[28]),
        .Q(reference_tag[28]));
  FDCE \sample_tag_reg[29] 
       (.C(sample_clk),
        .CE(\sample_phase[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(tag2[29]),
        .Q(reference_tag[29]));
  FDCE \sample_tag_reg[2] 
       (.C(sample_clk),
        .CE(\sample_phase[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(tag2[2]),
        .Q(reference_tag[2]));
  FDCE \sample_tag_reg[30] 
       (.C(sample_clk),
        .CE(\sample_phase[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(tag2[30]),
        .Q(reference_tag[30]));
  FDCE \sample_tag_reg[31] 
       (.C(sample_clk),
        .CE(\sample_phase[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(tag2[31]),
        .Q(reference_tag[31]));
  FDCE \sample_tag_reg[3] 
       (.C(sample_clk),
        .CE(\sample_phase[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(tag2[3]),
        .Q(reference_tag[3]));
  FDCE \sample_tag_reg[4] 
       (.C(sample_clk),
        .CE(\sample_phase[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(tag2[4]),
        .Q(reference_tag[4]));
  FDCE \sample_tag_reg[5] 
       (.C(sample_clk),
        .CE(\sample_phase[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(tag2[5]),
        .Q(reference_tag[5]));
  FDCE \sample_tag_reg[6] 
       (.C(sample_clk),
        .CE(\sample_phase[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(tag2[6]),
        .Q(reference_tag[6]));
  FDCE \sample_tag_reg[7] 
       (.C(sample_clk),
        .CE(\sample_phase[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(tag2[7]),
        .Q(reference_tag[7]));
  FDCE \sample_tag_reg[8] 
       (.C(sample_clk),
        .CE(\sample_phase[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(tag2[8]),
        .Q(reference_tag[8]));
  FDCE \sample_tag_reg[9] 
       (.C(sample_clk),
        .CE(\sample_phase[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(tag2[9]),
        .Q(reference_tag[9]));
  FDCE sample_valid_reg
       (.C(sample_clk),
        .CE(1'b1),
        .CLR(sample_resetn_0),
        .D(\sample_phase[31]_i_1_n_0 ),
        .Q(sample_valid));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 scaled_sample1_carry
       (.CI(1'b0),
        .CO({scaled_sample1_carry_n_0,scaled_sample1_carry_n_1,scaled_sample1_carry_n_2,scaled_sample1_carry_n_3}),
        .CYINIT(1'b1),
        .DI(product1[3:0]),
        .O(NLW_scaled_sample1_carry_O_UNCONNECTED[3:0]),
        .S({scaled_sample1_carry_i_5_n_0,scaled_sample1_carry_i_6_n_0,scaled_sample1_carry_i_7_n_0,scaled_sample1_carry_i_8_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 scaled_sample1_carry__0
       (.CI(scaled_sample1_carry_n_0),
        .CO({scaled_sample1_carry__0_n_0,scaled_sample1_carry__0_n_1,scaled_sample1_carry__0_n_2,scaled_sample1_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI(product1[7:4]),
        .O(NLW_scaled_sample1_carry__0_O_UNCONNECTED[3:0]),
        .S({scaled_sample1_carry__0_i_5_n_0,scaled_sample1_carry__0_i_6_n_0,scaled_sample1_carry__0_i_7_n_0,scaled_sample1_carry__0_i_8_n_0}));
  LUT2 #(
    .INIT(4'h8)) 
    scaled_sample1_carry__0_i_1
       (.I0(product10_n_98),
        .I1(scaled_sample1_carry__1_0),
        .O(product1[7]));
  LUT2 #(
    .INIT(4'h8)) 
    scaled_sample1_carry__0_i_2
       (.I0(product10_n_99),
        .I1(scaled_sample1_carry__1_0),
        .O(product1[6]));
  LUT2 #(
    .INIT(4'h8)) 
    scaled_sample1_carry__0_i_3
       (.I0(product10_n_100),
        .I1(scaled_sample1_carry__1_0),
        .O(product1[5]));
  LUT2 #(
    .INIT(4'h8)) 
    scaled_sample1_carry__0_i_4
       (.I0(product10_n_101),
        .I1(scaled_sample1_carry__1_0),
        .O(product1[4]));
  LUT2 #(
    .INIT(4'h7)) 
    scaled_sample1_carry__0_i_5
       (.I0(scaled_sample1_carry__1_0),
        .I1(product10_n_98),
        .O(scaled_sample1_carry__0_i_5_n_0));
  LUT2 #(
    .INIT(4'h7)) 
    scaled_sample1_carry__0_i_6
       (.I0(scaled_sample1_carry__1_0),
        .I1(product10_n_99),
        .O(scaled_sample1_carry__0_i_6_n_0));
  LUT2 #(
    .INIT(4'h7)) 
    scaled_sample1_carry__0_i_7
       (.I0(scaled_sample1_carry__1_0),
        .I1(product10_n_100),
        .O(scaled_sample1_carry__0_i_7_n_0));
  LUT2 #(
    .INIT(4'h7)) 
    scaled_sample1_carry__0_i_8
       (.I0(scaled_sample1_carry__1_0),
        .I1(product10_n_101),
        .O(scaled_sample1_carry__0_i_8_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 scaled_sample1_carry__1
       (.CI(scaled_sample1_carry__0_n_0),
        .CO({scaled_sample1_carry__1_n_0,scaled_sample1_carry__1_n_1,scaled_sample1_carry__1_n_2,scaled_sample1_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({scaled_sample1_carry__1_i_1_n_0,product1[24],product1[9:8]}),
        .O({scaled_sample1_carry__1_n_4,NLW_scaled_sample1_carry__1_O_UNCONNECTED[2:0]}),
        .S({scaled_sample1_carry__1_i_5_n_0,scaled_sample1_carry__1_i_6_n_0,scaled_sample1_carry__1_i_7_n_0,scaled_sample1_carry__1_i_8_n_0}));
  LUT3 #(
    .INIT(8'hBF)) 
    scaled_sample1_carry__1_i_1
       (.I0(product10_n_95),
        .I1(scaled_sample1_carry__1_0),
        .I2(product10_n_81),
        .O(scaled_sample1_carry__1_i_1_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    scaled_sample1_carry__1_i_2
       (.I0(product10_n_81),
        .I1(scaled_sample1_carry__1_0),
        .O(product1[24]));
  LUT2 #(
    .INIT(4'h8)) 
    scaled_sample1_carry__1_i_3
       (.I0(product10_n_96),
        .I1(scaled_sample1_carry__1_0),
        .O(product1[9]));
  LUT2 #(
    .INIT(4'h8)) 
    scaled_sample1_carry__1_i_4
       (.I0(product10_n_97),
        .I1(scaled_sample1_carry__1_0),
        .O(product1[8]));
  LUT4 #(
    .INIT(16'hD020)) 
    scaled_sample1_carry__1_i_5
       (.I0(product10_n_81),
        .I1(product10_n_95),
        .I2(scaled_sample1_carry__1_0),
        .I3(product10_n_94),
        .O(scaled_sample1_carry__1_i_5_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    scaled_sample1_carry__1_i_6
       (.I0(product10_n_95),
        .I1(scaled_sample1_carry__1_0),
        .O(scaled_sample1_carry__1_i_6_n_0));
  LUT2 #(
    .INIT(4'h7)) 
    scaled_sample1_carry__1_i_7
       (.I0(scaled_sample1_carry__1_0),
        .I1(product10_n_96),
        .O(scaled_sample1_carry__1_i_7_n_0));
  LUT2 #(
    .INIT(4'h7)) 
    scaled_sample1_carry__1_i_8
       (.I0(scaled_sample1_carry__1_0),
        .I1(product10_n_97),
        .O(scaled_sample1_carry__1_i_8_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 scaled_sample1_carry__2
       (.CI(scaled_sample1_carry__1_n_0),
        .CO({scaled_sample1_carry__2_n_0,scaled_sample1_carry__2_n_1,scaled_sample1_carry__2_n_2,scaled_sample1_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI(product1[14:11]),
        .O({scaled_sample1_carry__2_n_4,scaled_sample1_carry__2_n_5,scaled_sample1_carry__2_n_6,scaled_sample1_carry__2_n_7}),
        .S({scaled_sample1_carry__2_i_5_n_0,scaled_sample1_carry__2_i_6_n_0,scaled_sample1_carry__2_i_7_n_0,scaled_sample1_carry__2_i_8_n_0}));
  LUT2 #(
    .INIT(4'h8)) 
    scaled_sample1_carry__2_i_1
       (.I0(product10_n_91),
        .I1(scaled_sample1_carry__1_0),
        .O(product1[14]));
  LUT2 #(
    .INIT(4'h8)) 
    scaled_sample1_carry__2_i_2
       (.I0(product10_n_92),
        .I1(scaled_sample1_carry__1_0),
        .O(product1[13]));
  LUT2 #(
    .INIT(4'h8)) 
    scaled_sample1_carry__2_i_3
       (.I0(product10_n_93),
        .I1(scaled_sample1_carry__1_0),
        .O(product1[12]));
  LUT2 #(
    .INIT(4'h8)) 
    scaled_sample1_carry__2_i_4
       (.I0(product10_n_94),
        .I1(scaled_sample1_carry__1_0),
        .O(product1[11]));
  LUT3 #(
    .INIT(8'hB7)) 
    scaled_sample1_carry__2_i_5
       (.I0(product10_n_91),
        .I1(scaled_sample1_carry__1_0),
        .I2(product10_n_90),
        .O(scaled_sample1_carry__2_i_5_n_0));
  LUT3 #(
    .INIT(8'hB7)) 
    scaled_sample1_carry__2_i_6
       (.I0(product10_n_92),
        .I1(scaled_sample1_carry__1_0),
        .I2(product10_n_91),
        .O(scaled_sample1_carry__2_i_6_n_0));
  LUT3 #(
    .INIT(8'hB7)) 
    scaled_sample1_carry__2_i_7
       (.I0(product10_n_93),
        .I1(scaled_sample1_carry__1_0),
        .I2(product10_n_92),
        .O(scaled_sample1_carry__2_i_7_n_0));
  LUT3 #(
    .INIT(8'hB7)) 
    scaled_sample1_carry__2_i_8
       (.I0(product10_n_94),
        .I1(scaled_sample1_carry__1_0),
        .I2(product10_n_93),
        .O(scaled_sample1_carry__2_i_8_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 scaled_sample1_carry__3
       (.CI(scaled_sample1_carry__2_n_0),
        .CO({scaled_sample1_carry__3_n_0,scaled_sample1_carry__3_n_1,scaled_sample1_carry__3_n_2,scaled_sample1_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI(product1[18:15]),
        .O({scaled_sample1_carry__3_n_4,scaled_sample1_carry__3_n_5,scaled_sample1_carry__3_n_6,scaled_sample1_carry__3_n_7}),
        .S({scaled_sample1_carry__3_i_5_n_0,scaled_sample1_carry__3_i_6_n_0,scaled_sample1_carry__3_i_7_n_0,scaled_sample1_carry__3_i_8_n_0}));
  LUT2 #(
    .INIT(4'h8)) 
    scaled_sample1_carry__3_i_1
       (.I0(product10_n_87),
        .I1(scaled_sample1_carry__1_0),
        .O(product1[18]));
  LUT2 #(
    .INIT(4'h8)) 
    scaled_sample1_carry__3_i_2
       (.I0(product10_n_88),
        .I1(scaled_sample1_carry__1_0),
        .O(product1[17]));
  LUT2 #(
    .INIT(4'h8)) 
    scaled_sample1_carry__3_i_3
       (.I0(product10_n_89),
        .I1(scaled_sample1_carry__1_0),
        .O(product1[16]));
  LUT2 #(
    .INIT(4'h8)) 
    scaled_sample1_carry__3_i_4
       (.I0(product10_n_90),
        .I1(scaled_sample1_carry__1_0),
        .O(product1[15]));
  LUT3 #(
    .INIT(8'hB7)) 
    scaled_sample1_carry__3_i_5
       (.I0(product10_n_87),
        .I1(scaled_sample1_carry__1_0),
        .I2(product10_n_86),
        .O(scaled_sample1_carry__3_i_5_n_0));
  LUT3 #(
    .INIT(8'hB7)) 
    scaled_sample1_carry__3_i_6
       (.I0(product10_n_88),
        .I1(scaled_sample1_carry__1_0),
        .I2(product10_n_87),
        .O(scaled_sample1_carry__3_i_6_n_0));
  LUT3 #(
    .INIT(8'hB7)) 
    scaled_sample1_carry__3_i_7
       (.I0(product10_n_89),
        .I1(scaled_sample1_carry__1_0),
        .I2(product10_n_88),
        .O(scaled_sample1_carry__3_i_7_n_0));
  LUT3 #(
    .INIT(8'hB7)) 
    scaled_sample1_carry__3_i_8
       (.I0(product10_n_90),
        .I1(scaled_sample1_carry__1_0),
        .I2(product10_n_89),
        .O(scaled_sample1_carry__3_i_8_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 scaled_sample1_carry__4
       (.CI(scaled_sample1_carry__3_n_0),
        .CO({scaled_sample1_carry__4_n_0,scaled_sample1_carry__4_n_1,scaled_sample1_carry__4_n_2,scaled_sample1_carry__4_n_3}),
        .CYINIT(1'b0),
        .DI(product1[22:19]),
        .O({scaled_sample1_carry__4_n_4,scaled_sample1_carry__4_n_5,scaled_sample1_carry__4_n_6,scaled_sample1_carry__4_n_7}),
        .S({scaled_sample1_carry__4_i_5_n_0,scaled_sample1_carry__4_i_6_n_0,scaled_sample1_carry__4_i_7_n_0,scaled_sample1_carry__4_i_8_n_0}));
  LUT2 #(
    .INIT(4'h8)) 
    scaled_sample1_carry__4_i_1
       (.I0(product10_n_83),
        .I1(scaled_sample1_carry__1_0),
        .O(product1[22]));
  LUT2 #(
    .INIT(4'h8)) 
    scaled_sample1_carry__4_i_2
       (.I0(product10_n_84),
        .I1(scaled_sample1_carry__1_0),
        .O(product1[21]));
  LUT2 #(
    .INIT(4'h8)) 
    scaled_sample1_carry__4_i_3
       (.I0(product10_n_85),
        .I1(scaled_sample1_carry__1_0),
        .O(product1[20]));
  LUT2 #(
    .INIT(4'h8)) 
    scaled_sample1_carry__4_i_4
       (.I0(product10_n_86),
        .I1(scaled_sample1_carry__1_0),
        .O(product1[19]));
  LUT3 #(
    .INIT(8'hB7)) 
    scaled_sample1_carry__4_i_5
       (.I0(product10_n_83),
        .I1(scaled_sample1_carry__1_0),
        .I2(product10_n_82),
        .O(scaled_sample1_carry__4_i_5_n_0));
  LUT3 #(
    .INIT(8'hB7)) 
    scaled_sample1_carry__4_i_6
       (.I0(product10_n_84),
        .I1(scaled_sample1_carry__1_0),
        .I2(product10_n_83),
        .O(scaled_sample1_carry__4_i_6_n_0));
  LUT3 #(
    .INIT(8'hB7)) 
    scaled_sample1_carry__4_i_7
       (.I0(product10_n_85),
        .I1(scaled_sample1_carry__1_0),
        .I2(product10_n_84),
        .O(scaled_sample1_carry__4_i_7_n_0));
  LUT3 #(
    .INIT(8'hB7)) 
    scaled_sample1_carry__4_i_8
       (.I0(product10_n_86),
        .I1(scaled_sample1_carry__1_0),
        .I2(product10_n_85),
        .O(scaled_sample1_carry__4_i_8_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 scaled_sample1_carry__5
       (.CI(scaled_sample1_carry__4_n_0),
        .CO(NLW_scaled_sample1_carry__5_CO_UNCONNECTED[3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_scaled_sample1_carry__5_O_UNCONNECTED[3:1],scaled_sample0}),
        .S({1'b0,1'b0,1'b0,scaled_sample1_carry__5_i_1_n_0}));
  LUT3 #(
    .INIT(8'hB7)) 
    scaled_sample1_carry__5_i_1
       (.I0(product10_n_82),
        .I1(scaled_sample1_carry__1_0),
        .I2(product10_n_81),
        .O(scaled_sample1_carry__5_i_1_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    scaled_sample1_carry_i_1
       (.I0(product10_n_102),
        .I1(scaled_sample1_carry__1_0),
        .O(product1[3]));
  LUT2 #(
    .INIT(4'h8)) 
    scaled_sample1_carry_i_2
       (.I0(product10_n_103),
        .I1(scaled_sample1_carry__1_0),
        .O(product1[2]));
  LUT2 #(
    .INIT(4'h8)) 
    scaled_sample1_carry_i_3
       (.I0(product10_n_104),
        .I1(scaled_sample1_carry__1_0),
        .O(product1[1]));
  LUT2 #(
    .INIT(4'h8)) 
    scaled_sample1_carry_i_4
       (.I0(product10_n_105),
        .I1(scaled_sample1_carry__1_0),
        .O(product1[0]));
  LUT2 #(
    .INIT(4'h7)) 
    scaled_sample1_carry_i_5
       (.I0(scaled_sample1_carry__1_0),
        .I1(product10_n_102),
        .O(scaled_sample1_carry_i_5_n_0));
  LUT2 #(
    .INIT(4'h7)) 
    scaled_sample1_carry_i_6
       (.I0(scaled_sample1_carry__1_0),
        .I1(product10_n_103),
        .O(scaled_sample1_carry_i_6_n_0));
  LUT2 #(
    .INIT(4'h7)) 
    scaled_sample1_carry_i_7
       (.I0(scaled_sample1_carry__1_0),
        .I1(product10_n_104),
        .O(scaled_sample1_carry_i_7_n_0));
  LUT3 #(
    .INIT(8'hB7)) 
    scaled_sample1_carry_i_8
       (.I0(product10_n_105),
        .I1(scaled_sample1_carry__1_0),
        .I2(product10_n_81),
        .O(scaled_sample1_carry_i_8_n_0));
  FDCE \tag0_reg[0] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(active_tag[0]),
        .Q(tag0[0]));
  FDCE \tag0_reg[10] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(active_tag[10]),
        .Q(tag0[10]));
  FDCE \tag0_reg[11] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(active_tag[11]),
        .Q(tag0[11]));
  FDCE \tag0_reg[12] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(active_tag[12]),
        .Q(tag0[12]));
  FDCE \tag0_reg[13] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(active_tag[13]),
        .Q(tag0[13]));
  FDCE \tag0_reg[14] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(active_tag[14]),
        .Q(tag0[14]));
  FDCE \tag0_reg[15] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(active_tag[15]),
        .Q(tag0[15]));
  FDCE \tag0_reg[16] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(active_tag[16]),
        .Q(tag0[16]));
  FDCE \tag0_reg[17] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(active_tag[17]),
        .Q(tag0[17]));
  FDCE \tag0_reg[18] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(active_tag[18]),
        .Q(tag0[18]));
  FDCE \tag0_reg[19] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(active_tag[19]),
        .Q(tag0[19]));
  FDCE \tag0_reg[1] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(active_tag[1]),
        .Q(tag0[1]));
  FDCE \tag0_reg[20] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(active_tag[20]),
        .Q(tag0[20]));
  FDCE \tag0_reg[21] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(active_tag[21]),
        .Q(tag0[21]));
  FDCE \tag0_reg[22] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(active_tag[22]),
        .Q(tag0[22]));
  FDCE \tag0_reg[23] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(active_tag[23]),
        .Q(tag0[23]));
  FDCE \tag0_reg[24] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(active_tag[24]),
        .Q(tag0[24]));
  FDCE \tag0_reg[25] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(active_tag[25]),
        .Q(tag0[25]));
  FDCE \tag0_reg[26] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(active_tag[26]),
        .Q(tag0[26]));
  FDCE \tag0_reg[27] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(active_tag[27]),
        .Q(tag0[27]));
  FDCE \tag0_reg[28] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(active_tag[28]),
        .Q(tag0[28]));
  FDCE \tag0_reg[29] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(active_tag[29]),
        .Q(tag0[29]));
  FDCE \tag0_reg[2] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(active_tag[2]),
        .Q(tag0[2]));
  FDCE \tag0_reg[30] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(active_tag[30]),
        .Q(tag0[30]));
  FDCE \tag0_reg[31] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(active_tag[31]),
        .Q(tag0[31]));
  FDCE \tag0_reg[3] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(active_tag[3]),
        .Q(tag0[3]));
  FDCE \tag0_reg[4] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(active_tag[4]),
        .Q(tag0[4]));
  FDCE \tag0_reg[5] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(active_tag[5]),
        .Q(tag0[5]));
  FDCE \tag0_reg[6] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(active_tag[6]),
        .Q(tag0[6]));
  FDCE \tag0_reg[7] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(active_tag[7]),
        .Q(tag0[7]));
  FDCE \tag0_reg[8] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(active_tag[8]),
        .Q(tag0[8]));
  FDCE \tag0_reg[9] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(active_tag[9]),
        .Q(tag0[9]));
  FDCE \tag1_reg[0] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(tag0[0]),
        .Q(tag1[0]));
  FDCE \tag1_reg[10] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(tag0[10]),
        .Q(tag1[10]));
  FDCE \tag1_reg[11] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(tag0[11]),
        .Q(tag1[11]));
  FDCE \tag1_reg[12] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(tag0[12]),
        .Q(tag1[12]));
  FDCE \tag1_reg[13] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(tag0[13]),
        .Q(tag1[13]));
  FDCE \tag1_reg[14] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(tag0[14]),
        .Q(tag1[14]));
  FDCE \tag1_reg[15] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(tag0[15]),
        .Q(tag1[15]));
  FDCE \tag1_reg[16] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(tag0[16]),
        .Q(tag1[16]));
  FDCE \tag1_reg[17] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(tag0[17]),
        .Q(tag1[17]));
  FDCE \tag1_reg[18] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(tag0[18]),
        .Q(tag1[18]));
  FDCE \tag1_reg[19] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(tag0[19]),
        .Q(tag1[19]));
  FDCE \tag1_reg[1] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(tag0[1]),
        .Q(tag1[1]));
  FDCE \tag1_reg[20] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(tag0[20]),
        .Q(tag1[20]));
  FDCE \tag1_reg[21] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(tag0[21]),
        .Q(tag1[21]));
  FDCE \tag1_reg[22] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(tag0[22]),
        .Q(tag1[22]));
  FDCE \tag1_reg[23] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(tag0[23]),
        .Q(tag1[23]));
  FDCE \tag1_reg[24] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(tag0[24]),
        .Q(tag1[24]));
  FDCE \tag1_reg[25] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(tag0[25]),
        .Q(tag1[25]));
  FDCE \tag1_reg[26] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(tag0[26]),
        .Q(tag1[26]));
  FDCE \tag1_reg[27] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(tag0[27]),
        .Q(tag1[27]));
  FDCE \tag1_reg[28] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(tag0[28]),
        .Q(tag1[28]));
  FDCE \tag1_reg[29] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(tag0[29]),
        .Q(tag1[29]));
  FDCE \tag1_reg[2] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(tag0[2]),
        .Q(tag1[2]));
  FDCE \tag1_reg[30] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(tag0[30]),
        .Q(tag1[30]));
  FDCE \tag1_reg[31] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(tag0[31]),
        .Q(tag1[31]));
  FDCE \tag1_reg[3] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(tag0[3]),
        .Q(tag1[3]));
  FDCE \tag1_reg[4] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(tag0[4]),
        .Q(tag1[4]));
  FDCE \tag1_reg[5] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(tag0[5]),
        .Q(tag1[5]));
  FDCE \tag1_reg[6] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(tag0[6]),
        .Q(tag1[6]));
  FDCE \tag1_reg[7] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(tag0[7]),
        .Q(tag1[7]));
  FDCE \tag1_reg[8] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(tag0[8]),
        .Q(tag1[8]));
  FDCE \tag1_reg[9] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(tag0[9]),
        .Q(tag1[9]));
  FDCE \tag2_reg[0] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(tag1[0]),
        .Q(tag2[0]));
  FDCE \tag2_reg[10] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(tag1[10]),
        .Q(tag2[10]));
  FDCE \tag2_reg[11] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(tag1[11]),
        .Q(tag2[11]));
  FDCE \tag2_reg[12] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(tag1[12]),
        .Q(tag2[12]));
  FDCE \tag2_reg[13] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(tag1[13]),
        .Q(tag2[13]));
  FDCE \tag2_reg[14] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(tag1[14]),
        .Q(tag2[14]));
  FDCE \tag2_reg[15] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(tag1[15]),
        .Q(tag2[15]));
  FDCE \tag2_reg[16] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(tag1[16]),
        .Q(tag2[16]));
  FDCE \tag2_reg[17] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(tag1[17]),
        .Q(tag2[17]));
  FDCE \tag2_reg[18] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(tag1[18]),
        .Q(tag2[18]));
  FDCE \tag2_reg[19] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(tag1[19]),
        .Q(tag2[19]));
  FDCE \tag2_reg[1] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(tag1[1]),
        .Q(tag2[1]));
  FDCE \tag2_reg[20] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(tag1[20]),
        .Q(tag2[20]));
  FDCE \tag2_reg[21] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(tag1[21]),
        .Q(tag2[21]));
  FDCE \tag2_reg[22] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(tag1[22]),
        .Q(tag2[22]));
  FDCE \tag2_reg[23] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(tag1[23]),
        .Q(tag2[23]));
  FDCE \tag2_reg[24] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(tag1[24]),
        .Q(tag2[24]));
  FDCE \tag2_reg[25] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(tag1[25]),
        .Q(tag2[25]));
  FDCE \tag2_reg[26] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(tag1[26]),
        .Q(tag2[26]));
  FDCE \tag2_reg[27] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(tag1[27]),
        .Q(tag2[27]));
  FDCE \tag2_reg[28] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(tag1[28]),
        .Q(tag2[28]));
  FDCE \tag2_reg[29] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(tag1[29]),
        .Q(tag2[29]));
  FDCE \tag2_reg[2] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(tag1[2]),
        .Q(tag2[2]));
  FDCE \tag2_reg[30] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(tag1[30]),
        .Q(tag2[30]));
  FDCE \tag2_reg[31] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(tag1[31]),
        .Q(tag2[31]));
  FDCE \tag2_reg[3] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(tag1[3]),
        .Q(tag2[3]));
  FDCE \tag2_reg[4] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(tag1[4]),
        .Q(tag2[4]));
  FDCE \tag2_reg[5] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(tag1[5]),
        .Q(tag2[5]));
  FDCE \tag2_reg[6] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(tag1[6]),
        .Q(tag2[6]));
  FDCE \tag2_reg[7] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(tag1[7]),
        .Q(tag2[7]));
  FDCE \tag2_reg[8] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(tag1[8]),
        .Q(tag2[8]));
  FDCE \tag2_reg[9] 
       (.C(sample_clk),
        .CE(E),
        .CLR(sample_resetn_0),
        .D(tag1[9]),
        .Q(tag2[9]));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 unbounded_code_carry
       (.CI(1'b0),
        .CO({unbounded_code_carry_n_0,unbounded_code_carry_n_1,unbounded_code_carry_n_2,unbounded_code_carry_n_3}),
        .CYINIT(1'b0),
        .DI(offset1[3:0]),
        .O(unbounded_code[3:0]),
        .S({unbounded_code_carry_i_1_n_0,unbounded_code_carry_i_2_n_0,unbounded_code_carry_i_3_n_0,unbounded_code_carry_i_4_n_0}));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 unbounded_code_carry__0
       (.CI(unbounded_code_carry_n_0),
        .CO({unbounded_code_carry__0_n_0,unbounded_code_carry__0_n_1,unbounded_code_carry__0_n_2,unbounded_code_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI(offset1[7:4]),
        .O(unbounded_code[7:4]),
        .S({unbounded_code_carry__0_i_1_n_0,unbounded_code_carry__0_i_2_n_0,unbounded_code_carry__0_i_3_n_0,unbounded_code_carry__0_i_4_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    unbounded_code_carry__0_i_1
       (.I0(offset1[7]),
        .I1(scaled_sample1_carry__3_n_5),
        .O(unbounded_code_carry__0_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    unbounded_code_carry__0_i_2
       (.I0(offset1[6]),
        .I1(scaled_sample1_carry__3_n_6),
        .O(unbounded_code_carry__0_i_2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    unbounded_code_carry__0_i_3
       (.I0(offset1[5]),
        .I1(scaled_sample1_carry__3_n_7),
        .O(unbounded_code_carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    unbounded_code_carry__0_i_4
       (.I0(offset1[4]),
        .I1(scaled_sample1_carry__2_n_4),
        .O(unbounded_code_carry__0_i_4_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 unbounded_code_carry__1
       (.CI(unbounded_code_carry__0_n_0),
        .CO({unbounded_code_carry__1_n_0,unbounded_code_carry__1_n_1,unbounded_code_carry__1_n_2,unbounded_code_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI(offset1[11:8]),
        .O(unbounded_code[11:8]),
        .S({unbounded_code_carry__1_i_1_n_0,unbounded_code_carry__1_i_2_n_0,unbounded_code_carry__1_i_3_n_0,unbounded_code_carry__1_i_4_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    unbounded_code_carry__1_i_1
       (.I0(offset1[11]),
        .I1(scaled_sample1_carry__4_n_5),
        .O(unbounded_code_carry__1_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    unbounded_code_carry__1_i_2
       (.I0(offset1[10]),
        .I1(scaled_sample1_carry__4_n_6),
        .O(unbounded_code_carry__1_i_2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    unbounded_code_carry__1_i_3
       (.I0(offset1[9]),
        .I1(scaled_sample1_carry__4_n_7),
        .O(unbounded_code_carry__1_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    unbounded_code_carry__1_i_4
       (.I0(offset1[8]),
        .I1(scaled_sample1_carry__3_n_4),
        .O(unbounded_code_carry__1_i_4_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 unbounded_code_carry__2
       (.CI(unbounded_code_carry__1_n_0),
        .CO({NLW_unbounded_code_carry__2_CO_UNCONNECTED[3:2],unbounded_code_carry__2_n_2,unbounded_code_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b1,1'b0}),
        .O({NLW_unbounded_code_carry__2_O_UNCONNECTED[3],unbounded_code[15],unbounded_code[13:12]}),
        .S({1'b0,1'b1,scaled_sample0,scaled_sample1_carry__4_n_4}));
  LUT2 #(
    .INIT(4'h6)) 
    unbounded_code_carry_i_1
       (.I0(offset1[3]),
        .I1(scaled_sample1_carry__2_n_5),
        .O(unbounded_code_carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    unbounded_code_carry_i_2
       (.I0(offset1[2]),
        .I1(scaled_sample1_carry__2_n_6),
        .O(unbounded_code_carry_i_2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    unbounded_code_carry_i_3
       (.I0(offset1[1]),
        .I1(scaled_sample1_carry__2_n_7),
        .O(unbounded_code_carry_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    unbounded_code_carry_i_4
       (.I0(offset1[0]),
        .I1(scaled_sample1_carry__1_n_4),
        .O(unbounded_code_carry_i_4_n_0));
  FDCE v0_reg
       (.C(sample_clk),
        .CE(1'b1),
        .CLR(sample_resetn_0),
        .D(E),
        .Q(v0));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT2 #(
    .INIT(4'h8)) 
    v1_i_1
       (.I0(v0),
        .I1(E),
        .O(v12_out));
  FDCE v1_reg
       (.C(sample_clk),
        .CE(1'b1),
        .CLR(sample_resetn_0),
        .D(v12_out),
        .Q(v1));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT2 #(
    .INIT(4'h8)) 
    v2_i_1
       (.I0(v1),
        .I1(E),
        .O(v21_out));
  FDCE v2_reg
       (.C(sample_clk),
        .CE(1'b1),
        .CLR(sample_resetn_0),
        .D(v21_out),
        .Q(v2));
endmodule

(* ORIG_REF_NAME = "fdw_dac902_phase_control" *) 
module system_dac902_control_0_fdw_dac902_phase_control
   (sample_resetn_0,
    reply_pending_reg_0,
    reference_inverted,
    dac_data,
    dac_clk,
    status_word,
    reference_ftw,
    reference_tag,
    reference_valid,
    reference_phase,
    sample_clk,
    control_clk,
    command_word,
    sample_resetn,
    control_resetn,
    scaled_sample1_carry__1);
  output sample_resetn_0;
  output reply_pending_reg_0;
  output reference_inverted;
  output [11:0]dac_data;
  output dac_clk;
  output [26:0]status_word;
  output [31:0]reference_ftw;
  output [31:0]reference_tag;
  output reference_valid;
  output [31:0]reference_phase;
  input sample_clk;
  input control_clk;
  input [31:0]command_word;
  input sample_resetn;
  input control_resetn;
  input scaled_sample1_carry__1;

  wire \FSM_onehot_state_reg_n_0_[0] ;
  wire \FSM_onehot_state_reg_n_0_[1] ;
  wire \FSM_onehot_state_reg_n_0_[2] ;
  wire R0;
  wire acknowledged_i_3_n_0;
  wire acknowledged_i_5_n_0;
  wire active_enable;
  wire \applied_config_reg_n_0_[0] ;
  wire \applied_config_reg_n_0_[10] ;
  wire \applied_config_reg_n_0_[11] ;
  wire \applied_config_reg_n_0_[12] ;
  wire \applied_config_reg_n_0_[13] ;
  wire \applied_config_reg_n_0_[14] ;
  wire \applied_config_reg_n_0_[15] ;
  wire \applied_config_reg_n_0_[1] ;
  wire \applied_config_reg_n_0_[2] ;
  wire \applied_config_reg_n_0_[3] ;
  wire \applied_config_reg_n_0_[4] ;
  wire \applied_config_reg_n_0_[5] ;
  wire \applied_config_reg_n_0_[6] ;
  wire \applied_config_reg_n_0_[7] ;
  wire \applied_config_reg_n_0_[8] ;
  wire \applied_config_reg_n_0_[9] ;
  wire \applied_tag_reg_n_0_[0] ;
  wire \applied_tag_reg_n_0_[10] ;
  wire \applied_tag_reg_n_0_[11] ;
  wire \applied_tag_reg_n_0_[12] ;
  wire \applied_tag_reg_n_0_[13] ;
  wire \applied_tag_reg_n_0_[14] ;
  wire \applied_tag_reg_n_0_[15] ;
  wire \applied_tag_reg_n_0_[1] ;
  wire \applied_tag_reg_n_0_[2] ;
  wire \applied_tag_reg_n_0_[3] ;
  wire \applied_tag_reg_n_0_[4] ;
  wire \applied_tag_reg_n_0_[5] ;
  wire \applied_tag_reg_n_0_[6] ;
  wire \applied_tag_reg_n_0_[7] ;
  wire \applied_tag_reg_n_0_[8] ;
  wire \applied_tag_reg_n_0_[9] ;
  wire awaiting_sample_reg_n_0;
  wire cfg_rejected;
  wire cfg_rejected0;
  wire cfg_valid0;
  (* async_reg = "true" *) (* shreg_extract = "no" *) wire [1:0]clipped_sync;
  wire clock_run;
  wire clock_run0;
  wire [31:0]command_word;
  wire [122:0]config_data;
  wire \config_packet_reg[103]_i_1_n_0 ;
  wire \config_packet_reg[103]_i_1_n_1 ;
  wire \config_packet_reg[103]_i_1_n_2 ;
  wire \config_packet_reg[103]_i_1_n_3 ;
  wire \config_packet_reg[107]_i_1_n_0 ;
  wire \config_packet_reg[107]_i_1_n_1 ;
  wire \config_packet_reg[107]_i_1_n_2 ;
  wire \config_packet_reg[107]_i_1_n_3 ;
  wire \config_packet_reg[111]_i_1_n_0 ;
  wire \config_packet_reg[111]_i_1_n_1 ;
  wire \config_packet_reg[111]_i_1_n_2 ;
  wire \config_packet_reg[111]_i_1_n_3 ;
  wire \config_packet_reg[115]_i_1_n_0 ;
  wire \config_packet_reg[115]_i_1_n_1 ;
  wire \config_packet_reg[115]_i_1_n_2 ;
  wire \config_packet_reg[115]_i_1_n_3 ;
  wire \config_packet_reg[119]_i_1_n_0 ;
  wire \config_packet_reg[119]_i_1_n_1 ;
  wire \config_packet_reg[119]_i_1_n_2 ;
  wire \config_packet_reg[119]_i_1_n_3 ;
  wire \config_packet_reg[122]_i_2_n_2 ;
  wire \config_packet_reg[122]_i_2_n_3 ;
  wire \config_packet_reg[95]_i_1_n_0 ;
  wire \config_packet_reg[95]_i_1_n_1 ;
  wire \config_packet_reg[95]_i_1_n_2 ;
  wire \config_packet_reg[95]_i_1_n_3 ;
  wire \config_packet_reg[99]_i_1_n_0 ;
  wire \config_packet_reg[99]_i_1_n_1 ;
  wire \config_packet_reg[99]_i_1_n_2 ;
  wire \config_packet_reg[99]_i_1_n_3 ;
  wire \config_packet_reg_n_0_[0] ;
  wire \config_packet_reg_n_0_[100] ;
  wire \config_packet_reg_n_0_[101] ;
  wire \config_packet_reg_n_0_[102] ;
  wire \config_packet_reg_n_0_[103] ;
  wire \config_packet_reg_n_0_[104] ;
  wire \config_packet_reg_n_0_[105] ;
  wire \config_packet_reg_n_0_[106] ;
  wire \config_packet_reg_n_0_[107] ;
  wire \config_packet_reg_n_0_[108] ;
  wire \config_packet_reg_n_0_[109] ;
  wire \config_packet_reg_n_0_[10] ;
  wire \config_packet_reg_n_0_[110] ;
  wire \config_packet_reg_n_0_[111] ;
  wire \config_packet_reg_n_0_[112] ;
  wire \config_packet_reg_n_0_[113] ;
  wire \config_packet_reg_n_0_[114] ;
  wire \config_packet_reg_n_0_[115] ;
  wire \config_packet_reg_n_0_[116] ;
  wire \config_packet_reg_n_0_[117] ;
  wire \config_packet_reg_n_0_[118] ;
  wire \config_packet_reg_n_0_[119] ;
  wire \config_packet_reg_n_0_[11] ;
  wire \config_packet_reg_n_0_[120] ;
  wire \config_packet_reg_n_0_[121] ;
  wire \config_packet_reg_n_0_[122] ;
  wire \config_packet_reg_n_0_[12] ;
  wire \config_packet_reg_n_0_[13] ;
  wire \config_packet_reg_n_0_[14] ;
  wire \config_packet_reg_n_0_[15] ;
  wire \config_packet_reg_n_0_[16] ;
  wire \config_packet_reg_n_0_[17] ;
  wire \config_packet_reg_n_0_[18] ;
  wire \config_packet_reg_n_0_[19] ;
  wire \config_packet_reg_n_0_[1] ;
  wire \config_packet_reg_n_0_[20] ;
  wire \config_packet_reg_n_0_[21] ;
  wire \config_packet_reg_n_0_[22] ;
  wire \config_packet_reg_n_0_[23] ;
  wire \config_packet_reg_n_0_[24] ;
  wire \config_packet_reg_n_0_[25] ;
  wire \config_packet_reg_n_0_[26] ;
  wire \config_packet_reg_n_0_[27] ;
  wire \config_packet_reg_n_0_[28] ;
  wire \config_packet_reg_n_0_[29] ;
  wire \config_packet_reg_n_0_[2] ;
  wire \config_packet_reg_n_0_[30] ;
  wire \config_packet_reg_n_0_[31] ;
  wire \config_packet_reg_n_0_[32] ;
  wire \config_packet_reg_n_0_[33] ;
  wire \config_packet_reg_n_0_[34] ;
  wire \config_packet_reg_n_0_[35] ;
  wire \config_packet_reg_n_0_[36] ;
  wire \config_packet_reg_n_0_[37] ;
  wire \config_packet_reg_n_0_[38] ;
  wire \config_packet_reg_n_0_[39] ;
  wire \config_packet_reg_n_0_[3] ;
  wire \config_packet_reg_n_0_[40] ;
  wire \config_packet_reg_n_0_[41] ;
  wire \config_packet_reg_n_0_[42] ;
  wire \config_packet_reg_n_0_[43] ;
  wire \config_packet_reg_n_0_[44] ;
  wire \config_packet_reg_n_0_[45] ;
  wire \config_packet_reg_n_0_[46] ;
  wire \config_packet_reg_n_0_[47] ;
  wire \config_packet_reg_n_0_[48] ;
  wire \config_packet_reg_n_0_[49] ;
  wire \config_packet_reg_n_0_[4] ;
  wire \config_packet_reg_n_0_[50] ;
  wire \config_packet_reg_n_0_[51] ;
  wire \config_packet_reg_n_0_[52] ;
  wire \config_packet_reg_n_0_[53] ;
  wire \config_packet_reg_n_0_[54] ;
  wire \config_packet_reg_n_0_[55] ;
  wire \config_packet_reg_n_0_[56] ;
  wire \config_packet_reg_n_0_[57] ;
  wire \config_packet_reg_n_0_[58] ;
  wire \config_packet_reg_n_0_[59] ;
  wire \config_packet_reg_n_0_[5] ;
  wire \config_packet_reg_n_0_[60] ;
  wire \config_packet_reg_n_0_[61] ;
  wire \config_packet_reg_n_0_[62] ;
  wire \config_packet_reg_n_0_[63] ;
  wire \config_packet_reg_n_0_[64] ;
  wire \config_packet_reg_n_0_[65] ;
  wire \config_packet_reg_n_0_[66] ;
  wire \config_packet_reg_n_0_[67] ;
  wire \config_packet_reg_n_0_[68] ;
  wire \config_packet_reg_n_0_[69] ;
  wire \config_packet_reg_n_0_[6] ;
  wire \config_packet_reg_n_0_[70] ;
  wire \config_packet_reg_n_0_[71] ;
  wire \config_packet_reg_n_0_[72] ;
  wire \config_packet_reg_n_0_[73] ;
  wire \config_packet_reg_n_0_[74] ;
  wire \config_packet_reg_n_0_[75] ;
  wire \config_packet_reg_n_0_[76] ;
  wire \config_packet_reg_n_0_[77] ;
  wire \config_packet_reg_n_0_[78] ;
  wire \config_packet_reg_n_0_[79] ;
  wire \config_packet_reg_n_0_[7] ;
  wire \config_packet_reg_n_0_[80] ;
  wire \config_packet_reg_n_0_[81] ;
  wire \config_packet_reg_n_0_[82] ;
  wire \config_packet_reg_n_0_[83] ;
  wire \config_packet_reg_n_0_[84] ;
  wire \config_packet_reg_n_0_[85] ;
  wire \config_packet_reg_n_0_[86] ;
  wire \config_packet_reg_n_0_[87] ;
  wire \config_packet_reg_n_0_[88] ;
  wire \config_packet_reg_n_0_[89] ;
  wire \config_packet_reg_n_0_[8] ;
  wire \config_packet_reg_n_0_[90] ;
  wire \config_packet_reg_n_0_[91] ;
  wire \config_packet_reg_n_0_[92] ;
  wire \config_packet_reg_n_0_[93] ;
  wire \config_packet_reg_n_0_[94] ;
  wire \config_packet_reg_n_0_[95] ;
  wire \config_packet_reg_n_0_[96] ;
  wire \config_packet_reg_n_0_[97] ;
  wire \config_packet_reg_n_0_[98] ;
  wire \config_packet_reg_n_0_[99] ;
  wire \config_packet_reg_n_0_[9] ;
  wire configuration_mailbox_n_0;
  wire configuration_mailbox_n_1;
  wire configuration_mailbox_n_128;
  wire configuration_mailbox_n_129;
  wire configuration_mailbox_n_132;
  wire configuration_mailbox_n_133;
  wire configuration_mailbox_n_134;
  wire configuration_mailbox_n_136;
  wire configuration_mailbox_n_137;
  wire configuration_mailbox_n_138;
  wire configuration_mailbox_n_5;
  wire confirmation_mailbox_n_1;
  wire confirmation_mailbox_n_34;
  wire confirmation_mailbox_n_35;
  wire confirmation_mailbox_n_36;
  wire confirmation_mailbox_n_37;
  wire confirmation_mailbox_n_38;
  wire confirmation_mailbox_n_39;
  wire confirmation_mailbox_n_40;
  wire confirmation_mailbox_n_41;
  wire confirmation_mailbox_n_42;
  wire confirmation_mailbox_n_43;
  wire confirmation_mailbox_n_44;
  wire confirmation_mailbox_n_45;
  wire confirmation_mailbox_n_46;
  wire confirmation_mailbox_n_47;
  wire confirmation_mailbox_n_48;
  wire confirmation_mailbox_n_49;
  (* async_reg = "true" *) (* shreg_extract = "no" *) wire [1:0]connected_sync;
  wire control_clk;
  wire control_resetn;
  wire dac_clk;
  wire [11:0]dac_data;
  wire [15:0]data1;
  wire [15:0]data3;
  wire [15:0]data4;
  wire [15:0]data5;
  wire [11:0]data6;
  wire [11:0]data7;
  wire [2:1]data8;
  wire enabled2;
  wire \error_code1_inferred__0/i__carry__0_n_0 ;
  wire \error_code1_inferred__0/i__carry__0_n_1 ;
  wire \error_code1_inferred__0/i__carry__0_n_2 ;
  wire \error_code1_inferred__0/i__carry__0_n_3 ;
  wire \error_code1_inferred__0/i__carry__1_n_1 ;
  wire \error_code1_inferred__0/i__carry__1_n_2 ;
  wire \error_code1_inferred__0/i__carry__1_n_3 ;
  wire \error_code1_inferred__0/i__carry_n_0 ;
  wire \error_code1_inferred__0/i__carry_n_1 ;
  wire \error_code1_inferred__0/i__carry_n_2 ;
  wire \error_code1_inferred__0/i__carry_n_3 ;
  wire \error_code[0]_i_3_n_0 ;
  wire \error_code[0]_i_4_n_0 ;
  wire \error_code[1]_i_3_n_0 ;
  wire \error_code[1]_i_4_n_0 ;
  wire \error_code[1]_i_5_n_0 ;
  wire \error_code[2]_i_10_n_0 ;
  wire \error_code[2]_i_11_n_0 ;
  wire \error_code[2]_i_12_n_0 ;
  wire \error_code[2]_i_13_n_0 ;
  wire \error_code[2]_i_14_n_0 ;
  wire \error_code[2]_i_4_n_0 ;
  wire \error_code[2]_i_5_n_0 ;
  wire \error_code[2]_i_6_n_0 ;
  wire \error_code[2]_i_7_n_0 ;
  wire \error_code[2]_i_8_n_0 ;
  wire \error_code[2]_i_9_n_0 ;
  wire generated_clock;
  wire [11:0]generated_data;
  wire interface_initialized;
  wire [31:0]next_tag;
  wire p_0_in1_in;
  wire [31:5]p_1_in;
  wire [0:0]p_3_out;
  wire pad_release;
  wire pad_release0;
  (* DONT_TOUCH *) (* RTL_KEEP = "true" *) wire [12:0]pad_tristate;
  wire \pad_tristate[12]_i_2_n_0 ;
  wire pad_tristate_reg0;
  (* async_reg = "true" *) (* shreg_extract = "no" *) wire [1:0]parked_sync;
  wire pending_request_reg_n_0;
  wire permit_seen_low;
  wire permit_seen_low_i_1_n_0;
  (* async_reg = "true" *) (* shreg_extract = "no" *) wire [1:0]permit_sync;
  wire \permit_sync[1]_i_1_n_0 ;
  wire pins_enabled;
  wire \query[3]_i_1_n_0 ;
  wire \query[3]_i_2_n_0 ;
  wire [3:0]query__0;
  wire reference_config_ftw0;
  wire [31:0]reference_ftw;
  wire reference_inverted;
  wire [31:0]reference_phase;
  wire [31:0]reference_tag;
  wire reference_valid;
  wire reference_valid0;
  wire reference_valid0_carry__0_n_0;
  wire reference_valid0_carry__0_n_1;
  wire reference_valid0_carry__0_n_2;
  wire reference_valid0_carry__0_n_3;
  wire reference_valid0_carry__1_n_2;
  wire reference_valid0_carry__1_n_3;
  wire reference_valid0_carry_n_0;
  wire reference_valid0_carry_n_1;
  wire reference_valid0_carry_n_2;
  wire reference_valid0_carry_n_3;
  wire \reply_data_reg_n_0_[0] ;
  wire \reply_data_reg_n_0_[10] ;
  wire \reply_data_reg_n_0_[11] ;
  wire \reply_data_reg_n_0_[12] ;
  wire \reply_data_reg_n_0_[13] ;
  wire \reply_data_reg_n_0_[14] ;
  wire \reply_data_reg_n_0_[15] ;
  wire \reply_data_reg_n_0_[16] ;
  wire \reply_data_reg_n_0_[17] ;
  wire \reply_data_reg_n_0_[18] ;
  wire \reply_data_reg_n_0_[19] ;
  wire \reply_data_reg_n_0_[1] ;
  wire \reply_data_reg_n_0_[20] ;
  wire \reply_data_reg_n_0_[21] ;
  wire \reply_data_reg_n_0_[22] ;
  wire \reply_data_reg_n_0_[23] ;
  wire \reply_data_reg_n_0_[24] ;
  wire \reply_data_reg_n_0_[25] ;
  wire \reply_data_reg_n_0_[26] ;
  wire \reply_data_reg_n_0_[27] ;
  wire \reply_data_reg_n_0_[28] ;
  wire \reply_data_reg_n_0_[29] ;
  wire \reply_data_reg_n_0_[2] ;
  wire \reply_data_reg_n_0_[30] ;
  wire \reply_data_reg_n_0_[31] ;
  wire \reply_data_reg_n_0_[32] ;
  wire \reply_data_reg_n_0_[33] ;
  wire \reply_data_reg_n_0_[3] ;
  wire \reply_data_reg_n_0_[4] ;
  wire \reply_data_reg_n_0_[5] ;
  wire \reply_data_reg_n_0_[6] ;
  wire \reply_data_reg_n_0_[7] ;
  wire \reply_data_reg_n_0_[8] ;
  wire \reply_data_reg_n_0_[9] ;
  wire reply_pending;
  wire reply_pending_reg_0;
  wire reply_pending_reg_n_0;
  wire [33:2]response_data;
  wire response_valid;
  wire sample_active;
  wire sample_clipped;
  wire sample_clk;
  wire sample_initialized;
  wire sample_pending;
  wire sample_pending1;
  wire sample_pending1_carry__0_n_0;
  wire sample_pending1_carry__0_n_1;
  wire sample_pending1_carry__0_n_2;
  wire sample_pending1_carry__0_n_3;
  wire sample_pending1_carry__1_n_2;
  wire sample_pending1_carry__1_n_3;
  wire sample_pending1_carry_n_0;
  wire sample_pending1_carry_n_1;
  wire sample_pending1_carry_n_2;
  wire sample_pending1_carry_n_3;
  wire sample_resetn;
  wire sample_resetn_0;
  wire [31:0]sample_tag_pending;
  wire scaled_sample1_carry__1;
  wire staged_enable;
  wire staged_enable_i_1_n_0;
  wire \staged_ftw[26]_i_1_n_0 ;
  wire \staged_ftw[31]_i_1_n_0 ;
  wire \staged_ftw[31]_i_3_n_0 ;
  wire \staged_ftw[31]_i_4_n_0 ;
  wire \staged_ftw[31]_i_5_n_0 ;
  wire \staged_ftw[31]_i_6_n_0 ;
  wire \staged_ftw[31]_i_7_n_0 ;
  wire \staged_ftw[31]_i_8_n_0 ;
  wire \staged_ftw[31]_i_9_n_0 ;
  wire \staged_ftw_reg_n_0_[0] ;
  wire \staged_ftw_reg_n_0_[10] ;
  wire \staged_ftw_reg_n_0_[11] ;
  wire \staged_ftw_reg_n_0_[12] ;
  wire \staged_ftw_reg_n_0_[13] ;
  wire \staged_ftw_reg_n_0_[14] ;
  wire \staged_ftw_reg_n_0_[15] ;
  wire \staged_ftw_reg_n_0_[16] ;
  wire \staged_ftw_reg_n_0_[17] ;
  wire \staged_ftw_reg_n_0_[18] ;
  wire \staged_ftw_reg_n_0_[19] ;
  wire \staged_ftw_reg_n_0_[1] ;
  wire \staged_ftw_reg_n_0_[20] ;
  wire \staged_ftw_reg_n_0_[21] ;
  wire \staged_ftw_reg_n_0_[22] ;
  wire \staged_ftw_reg_n_0_[23] ;
  wire \staged_ftw_reg_n_0_[24] ;
  wire \staged_ftw_reg_n_0_[25] ;
  wire \staged_ftw_reg_n_0_[26] ;
  wire \staged_ftw_reg_n_0_[27] ;
  wire \staged_ftw_reg_n_0_[28] ;
  wire \staged_ftw_reg_n_0_[29] ;
  wire \staged_ftw_reg_n_0_[2] ;
  wire \staged_ftw_reg_n_0_[30] ;
  wire \staged_ftw_reg_n_0_[3] ;
  wire \staged_ftw_reg_n_0_[4] ;
  wire \staged_ftw_reg_n_0_[5] ;
  wire \staged_ftw_reg_n_0_[6] ;
  wire \staged_ftw_reg_n_0_[7] ;
  wire \staged_ftw_reg_n_0_[8] ;
  wire \staged_ftw_reg_n_0_[9] ;
  wire \staged_gain[0]_i_1_n_0 ;
  wire \staged_gain[10]_i_1_n_0 ;
  wire \staged_gain[11]_i_1_n_0 ;
  wire \staged_gain[11]_i_2_n_0 ;
  wire \staged_gain[1]_i_1_n_0 ;
  wire \staged_gain[2]_i_1_n_0 ;
  wire \staged_gain[3]_i_1_n_0 ;
  wire \staged_gain[4]_i_1_n_0 ;
  wire \staged_gain[5]_i_1_n_0 ;
  wire \staged_gain[6]_i_1_n_0 ;
  wire \staged_gain[7]_i_1_n_0 ;
  wire \staged_gain[8]_i_1_n_0 ;
  wire \staged_gain[9]_i_1_n_0 ;
  wire \staged_gain_reg_n_0_[0] ;
  wire \staged_gain_reg_n_0_[10] ;
  wire \staged_gain_reg_n_0_[11] ;
  wire \staged_gain_reg_n_0_[1] ;
  wire \staged_gain_reg_n_0_[2] ;
  wire \staged_gain_reg_n_0_[3] ;
  wire \staged_gain_reg_n_0_[4] ;
  wire \staged_gain_reg_n_0_[5] ;
  wire \staged_gain_reg_n_0_[6] ;
  wire \staged_gain_reg_n_0_[7] ;
  wire \staged_gain_reg_n_0_[8] ;
  wire \staged_gain_reg_n_0_[9] ;
  wire staged_invert;
  wire staged_invert_i_1_n_0;
  wire \staged_offset[0]_i_1_n_0 ;
  wire \staged_offset[10]_i_1_n_0 ;
  wire \staged_offset[11]_i_1_n_0 ;
  wire \staged_offset[1]_i_1_n_0 ;
  wire \staged_offset[2]_i_1_n_0 ;
  wire \staged_offset[3]_i_1_n_0 ;
  wire \staged_offset[4]_i_1_n_0 ;
  wire \staged_offset[5]_i_1_n_0 ;
  wire \staged_offset[6]_i_1_n_0 ;
  wire \staged_offset[7]_i_1_n_0 ;
  wire \staged_offset[8]_i_1_n_0 ;
  wire \staged_offset[9]_i_1_n_0 ;
  wire [11:0]staged_offset__0;
  wire [31:0]staged_phase;
  wire \staged_phase[26]_i_1_n_0 ;
  wire \staged_phase[31]_i_1_n_0 ;
  wire staged_restart__0;
  wire staged_restart_i_1_n_0;
  wire [26:0]\^status_word ;
  wire \status_word[0]_INST_0_i_1_n_0 ;
  wire \status_word[0]_INST_0_i_2_n_0 ;
  wire \status_word[0]_INST_0_i_3_n_0 ;
  wire \status_word[10]_INST_0_i_1_n_0 ;
  wire \status_word[10]_INST_0_i_2_n_0 ;
  wire \status_word[10]_INST_0_i_3_n_0 ;
  wire \status_word[11]_INST_0_i_1_n_0 ;
  wire \status_word[11]_INST_0_i_2_n_0 ;
  wire \status_word[11]_INST_0_i_3_n_0 ;
  wire \status_word[12]_INST_0_i_1_n_0 ;
  wire \status_word[12]_INST_0_i_2_n_0 ;
  wire \status_word[13]_INST_0_i_1_n_0 ;
  wire \status_word[13]_INST_0_i_2_n_0 ;
  wire \status_word[14]_INST_0_i_1_n_0 ;
  wire \status_word[14]_INST_0_i_2_n_0 ;
  wire \status_word[15]_INST_0_i_1_n_0 ;
  wire \status_word[15]_INST_0_i_2_n_0 ;
  wire \status_word[1]_INST_0_i_1_n_0 ;
  wire \status_word[1]_INST_0_i_2_n_0 ;
  wire \status_word[1]_INST_0_i_3_n_0 ;
  wire \status_word[2]_INST_0_i_1_n_0 ;
  wire \status_word[2]_INST_0_i_2_n_0 ;
  wire \status_word[2]_INST_0_i_3_n_0 ;
  wire \status_word[3]_INST_0_i_1_n_0 ;
  wire \status_word[3]_INST_0_i_2_n_0 ;
  wire \status_word[3]_INST_0_i_3_n_0 ;
  wire \status_word[4]_INST_0_i_1_n_0 ;
  wire \status_word[4]_INST_0_i_2_n_0 ;
  wire \status_word[4]_INST_0_i_3_n_0 ;
  wire \status_word[5]_INST_0_i_1_n_0 ;
  wire \status_word[5]_INST_0_i_2_n_0 ;
  wire \status_word[5]_INST_0_i_3_n_0 ;
  wire \status_word[6]_INST_0_i_1_n_0 ;
  wire \status_word[6]_INST_0_i_2_n_0 ;
  wire \status_word[6]_INST_0_i_3_n_0 ;
  wire \status_word[7]_INST_0_i_1_n_0 ;
  wire \status_word[7]_INST_0_i_2_n_0 ;
  wire \status_word[7]_INST_0_i_3_n_0 ;
  wire \status_word[8]_INST_0_i_1_n_0 ;
  wire \status_word[8]_INST_0_i_2_n_0 ;
  wire \status_word[8]_INST_0_i_3_n_0 ;
  wire \status_word[9]_INST_0_i_1_n_0 ;
  wire \status_word[9]_INST_0_i_2_n_0 ;
  wire \status_word[9]_INST_0_i_3_n_0 ;
  wire tag_counter;
  wire \tag_counter[0]_i_2_n_0 ;
  wire [31:0]tag_counter_reg;
  wire \tag_counter_reg[0]_i_1_n_0 ;
  wire \tag_counter_reg[0]_i_1_n_1 ;
  wire \tag_counter_reg[0]_i_1_n_2 ;
  wire \tag_counter_reg[0]_i_1_n_3 ;
  wire \tag_counter_reg[0]_i_1_n_4 ;
  wire \tag_counter_reg[0]_i_1_n_5 ;
  wire \tag_counter_reg[0]_i_1_n_6 ;
  wire \tag_counter_reg[0]_i_1_n_7 ;
  wire \tag_counter_reg[12]_i_1_n_0 ;
  wire \tag_counter_reg[12]_i_1_n_1 ;
  wire \tag_counter_reg[12]_i_1_n_2 ;
  wire \tag_counter_reg[12]_i_1_n_3 ;
  wire \tag_counter_reg[12]_i_1_n_4 ;
  wire \tag_counter_reg[12]_i_1_n_5 ;
  wire \tag_counter_reg[12]_i_1_n_6 ;
  wire \tag_counter_reg[12]_i_1_n_7 ;
  wire \tag_counter_reg[16]_i_1_n_0 ;
  wire \tag_counter_reg[16]_i_1_n_1 ;
  wire \tag_counter_reg[16]_i_1_n_2 ;
  wire \tag_counter_reg[16]_i_1_n_3 ;
  wire \tag_counter_reg[16]_i_1_n_4 ;
  wire \tag_counter_reg[16]_i_1_n_5 ;
  wire \tag_counter_reg[16]_i_1_n_6 ;
  wire \tag_counter_reg[16]_i_1_n_7 ;
  wire \tag_counter_reg[20]_i_1_n_0 ;
  wire \tag_counter_reg[20]_i_1_n_1 ;
  wire \tag_counter_reg[20]_i_1_n_2 ;
  wire \tag_counter_reg[20]_i_1_n_3 ;
  wire \tag_counter_reg[20]_i_1_n_4 ;
  wire \tag_counter_reg[20]_i_1_n_5 ;
  wire \tag_counter_reg[20]_i_1_n_6 ;
  wire \tag_counter_reg[20]_i_1_n_7 ;
  wire \tag_counter_reg[24]_i_1_n_0 ;
  wire \tag_counter_reg[24]_i_1_n_1 ;
  wire \tag_counter_reg[24]_i_1_n_2 ;
  wire \tag_counter_reg[24]_i_1_n_3 ;
  wire \tag_counter_reg[24]_i_1_n_4 ;
  wire \tag_counter_reg[24]_i_1_n_5 ;
  wire \tag_counter_reg[24]_i_1_n_6 ;
  wire \tag_counter_reg[24]_i_1_n_7 ;
  wire \tag_counter_reg[28]_i_1_n_1 ;
  wire \tag_counter_reg[28]_i_1_n_2 ;
  wire \tag_counter_reg[28]_i_1_n_3 ;
  wire \tag_counter_reg[28]_i_1_n_4 ;
  wire \tag_counter_reg[28]_i_1_n_5 ;
  wire \tag_counter_reg[28]_i_1_n_6 ;
  wire \tag_counter_reg[28]_i_1_n_7 ;
  wire \tag_counter_reg[4]_i_1_n_0 ;
  wire \tag_counter_reg[4]_i_1_n_1 ;
  wire \tag_counter_reg[4]_i_1_n_2 ;
  wire \tag_counter_reg[4]_i_1_n_3 ;
  wire \tag_counter_reg[4]_i_1_n_4 ;
  wire \tag_counter_reg[4]_i_1_n_5 ;
  wire \tag_counter_reg[4]_i_1_n_6 ;
  wire \tag_counter_reg[4]_i_1_n_7 ;
  wire \tag_counter_reg[8]_i_1_n_0 ;
  wire \tag_counter_reg[8]_i_1_n_1 ;
  wire \tag_counter_reg[8]_i_1_n_2 ;
  wire \tag_counter_reg[8]_i_1_n_3 ;
  wire \tag_counter_reg[8]_i_1_n_4 ;
  wire \tag_counter_reg[8]_i_1_n_5 ;
  wire \tag_counter_reg[8]_i_1_n_6 ;
  wire \tag_counter_reg[8]_i_1_n_7 ;
  wire v2;
  wire waveform_n_41;
  wire waveform_n_42;
  wire waveform_n_43;
  wire waveform_n_44;
  wire waveform_n_77;
  wire waveform_n_78;
  wire waveform_n_79;
  wire waveform_n_80;
  wire waveform_n_81;
  wire waveform_n_82;
  wire waveform_n_83;
  wire waveform_n_84;
  wire waveform_n_85;
  wire waveform_n_86;
  wire waveform_n_87;
  wire waveform_n_88;
  wire waveform_n_89;
  wire waveform_n_90;
  wire waveform_n_91;
  wire waveform_n_92;
  wire waveform_n_93;
  wire waveform_n_94;
  wire waveform_n_96;
  wire waveform_n_97;
  wire [3:2]\NLW_config_packet_reg[122]_i_2_CO_UNCONNECTED ;
  wire [3:3]\NLW_config_packet_reg[122]_i_2_O_UNCONNECTED ;
  wire NLW_dac_clk_oddr_S_UNCONNECTED;
  wire [3:0]\NLW_error_code1_inferred__0/i__carry_O_UNCONNECTED ;
  wire [3:0]\NLW_error_code1_inferred__0/i__carry__0_O_UNCONNECTED ;
  wire [3:3]\NLW_error_code1_inferred__0/i__carry__1_CO_UNCONNECTED ;
  wire [3:0]\NLW_error_code1_inferred__0/i__carry__1_O_UNCONNECTED ;
  wire [3:0]NLW_reference_valid0_carry_O_UNCONNECTED;
  wire [3:0]NLW_reference_valid0_carry__0_O_UNCONNECTED;
  wire [3:3]NLW_reference_valid0_carry__1_CO_UNCONNECTED;
  wire [3:0]NLW_reference_valid0_carry__1_O_UNCONNECTED;
  wire [3:0]NLW_sample_pending1_carry_O_UNCONNECTED;
  wire [3:0]NLW_sample_pending1_carry__0_O_UNCONNECTED;
  wire [3:3]NLW_sample_pending1_carry__1_CO_UNCONNECTED;
  wire [3:0]NLW_sample_pending1_carry__1_O_UNCONNECTED;
  wire [3:3]\NLW_tag_counter_reg[28]_i_1_CO_UNCONNECTED ;

  assign status_word[26:24] = \^status_word [26:24];
  assign status_word[23] = connected_sync[1];
  assign status_word[22:21] = \^status_word [22:21];
  assign status_word[20] = clipped_sync[1];
  assign status_word[19:17] = \^status_word [19:17];
  assign status_word[16] = parked_sync[1];
  assign status_word[15:0] = \^status_word [15:0];
  (* FSM_ENCODED_STATES = "iSTATE:001,iSTATE0:010,iSTATE1:100," *) 
  FDPE #(
    .INIT(1'b1)) 
    \FSM_onehot_state_reg[0] 
       (.C(control_clk),
        .CE(1'b1),
        .D(configuration_mailbox_n_137),
        .PRE(sample_resetn_0),
        .Q(\FSM_onehot_state_reg_n_0_[0] ));
  (* FSM_ENCODED_STATES = "iSTATE:001,iSTATE0:010,iSTATE1:100," *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[1] 
       (.C(control_clk),
        .CE(1'b1),
        .CLR(sample_resetn_0),
        .D(configuration_mailbox_n_138),
        .Q(\FSM_onehot_state_reg_n_0_[1] ));
  (* FSM_ENCODED_STATES = "iSTATE:001,iSTATE0:010,iSTATE1:100," *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[2] 
       (.C(control_clk),
        .CE(1'b1),
        .CLR(sample_resetn_0),
        .D(configuration_mailbox_n_136),
        .Q(\FSM_onehot_state_reg_n_0_[2] ));
  LUT4 #(
    .INIT(16'hEA2A)) 
    acknowledged_i_3
       (.I0(command_word[31]),
        .I1(interface_initialized),
        .I2(\FSM_onehot_state_reg_n_0_[2] ),
        .I3(pending_request_reg_n_0),
        .O(acknowledged_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT4 #(
    .INIT(16'h0006)) 
    acknowledged_i_5
       (.I0(\^status_word [26]),
        .I1(command_word[31]),
        .I2(\FSM_onehot_state_reg_n_0_[2] ),
        .I3(\FSM_onehot_state_reg_n_0_[1] ),
        .O(acknowledged_i_5_n_0));
  FDCE acknowledged_reg
       (.C(control_clk),
        .CE(1'b1),
        .CLR(sample_resetn_0),
        .D(configuration_mailbox_n_132),
        .Q(\^status_word [26]));
  FDCE \applied_config_reg[0] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[0] ),
        .Q(\applied_config_reg_n_0_[0] ));
  FDCE \applied_config_reg[10] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[10] ),
        .Q(\applied_config_reg_n_0_[10] ));
  FDCE \applied_config_reg[11] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[11] ),
        .Q(\applied_config_reg_n_0_[11] ));
  FDCE \applied_config_reg[12] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[12] ),
        .Q(\applied_config_reg_n_0_[12] ));
  FDCE \applied_config_reg[13] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[13] ),
        .Q(\applied_config_reg_n_0_[13] ));
  FDCE \applied_config_reg[14] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[14] ),
        .Q(\applied_config_reg_n_0_[14] ));
  FDCE \applied_config_reg[15] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[15] ),
        .Q(\applied_config_reg_n_0_[15] ));
  FDCE \applied_config_reg[16] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[16] ),
        .Q(data3[0]));
  FDCE \applied_config_reg[17] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[17] ),
        .Q(data3[1]));
  FDCE \applied_config_reg[18] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[18] ),
        .Q(data3[2]));
  FDCE \applied_config_reg[19] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[19] ),
        .Q(data3[3]));
  FDCE \applied_config_reg[1] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[1] ),
        .Q(\applied_config_reg_n_0_[1] ));
  FDCE \applied_config_reg[20] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[20] ),
        .Q(data3[4]));
  FDCE \applied_config_reg[21] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[21] ),
        .Q(data3[5]));
  FDCE \applied_config_reg[22] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[22] ),
        .Q(data3[6]));
  FDCE \applied_config_reg[23] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[23] ),
        .Q(data3[7]));
  FDCE \applied_config_reg[24] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[24] ),
        .Q(data3[8]));
  FDCE \applied_config_reg[25] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[25] ),
        .Q(data3[9]));
  FDCE \applied_config_reg[26] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[26] ),
        .Q(data3[10]));
  FDCE \applied_config_reg[27] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[27] ),
        .Q(data3[11]));
  FDCE \applied_config_reg[28] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[28] ),
        .Q(data3[12]));
  FDCE \applied_config_reg[29] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[29] ),
        .Q(data3[13]));
  FDCE \applied_config_reg[2] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[2] ),
        .Q(\applied_config_reg_n_0_[2] ));
  FDCE \applied_config_reg[30] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[30] ),
        .Q(data3[14]));
  FDCE \applied_config_reg[31] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[31] ),
        .Q(data3[15]));
  FDCE \applied_config_reg[32] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[32] ),
        .Q(data4[0]));
  FDCE \applied_config_reg[33] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[33] ),
        .Q(data4[1]));
  FDCE \applied_config_reg[34] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[34] ),
        .Q(data4[2]));
  FDCE \applied_config_reg[35] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[35] ),
        .Q(data4[3]));
  FDCE \applied_config_reg[36] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[36] ),
        .Q(data4[4]));
  FDCE \applied_config_reg[37] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[37] ),
        .Q(data4[5]));
  FDCE \applied_config_reg[38] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[38] ),
        .Q(data4[6]));
  FDCE \applied_config_reg[39] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[39] ),
        .Q(data4[7]));
  FDCE \applied_config_reg[3] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[3] ),
        .Q(\applied_config_reg_n_0_[3] ));
  FDCE \applied_config_reg[40] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[40] ),
        .Q(data4[8]));
  FDCE \applied_config_reg[41] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[41] ),
        .Q(data4[9]));
  FDCE \applied_config_reg[42] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[42] ),
        .Q(data4[10]));
  FDCE \applied_config_reg[43] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[43] ),
        .Q(data4[11]));
  FDCE \applied_config_reg[44] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[44] ),
        .Q(data4[12]));
  FDCE \applied_config_reg[45] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[45] ),
        .Q(data4[13]));
  FDCE \applied_config_reg[46] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[46] ),
        .Q(data4[14]));
  FDCE \applied_config_reg[47] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[47] ),
        .Q(data4[15]));
  FDCE \applied_config_reg[48] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[48] ),
        .Q(data5[0]));
  FDCE \applied_config_reg[49] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[49] ),
        .Q(data5[1]));
  FDCE \applied_config_reg[4] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[4] ),
        .Q(\applied_config_reg_n_0_[4] ));
  FDCE \applied_config_reg[50] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[50] ),
        .Q(data5[2]));
  FDCE \applied_config_reg[51] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[51] ),
        .Q(data5[3]));
  FDCE \applied_config_reg[52] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[52] ),
        .Q(data5[4]));
  FDCE \applied_config_reg[53] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[53] ),
        .Q(data5[5]));
  FDCE \applied_config_reg[54] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[54] ),
        .Q(data5[6]));
  FDCE \applied_config_reg[55] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[55] ),
        .Q(data5[7]));
  FDCE \applied_config_reg[56] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[56] ),
        .Q(data5[8]));
  FDCE \applied_config_reg[57] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[57] ),
        .Q(data5[9]));
  FDCE \applied_config_reg[58] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[58] ),
        .Q(data5[10]));
  FDCE \applied_config_reg[59] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[59] ),
        .Q(data5[11]));
  FDCE \applied_config_reg[5] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[5] ),
        .Q(\applied_config_reg_n_0_[5] ));
  FDCE \applied_config_reg[60] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[60] ),
        .Q(data5[12]));
  FDCE \applied_config_reg[61] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[61] ),
        .Q(data5[13]));
  FDCE \applied_config_reg[62] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[62] ),
        .Q(data5[14]));
  FDCE \applied_config_reg[63] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[63] ),
        .Q(data5[15]));
  FDCE \applied_config_reg[64] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[64] ),
        .Q(data6[0]));
  FDCE \applied_config_reg[65] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[65] ),
        .Q(data6[1]));
  FDCE \applied_config_reg[66] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[66] ),
        .Q(data6[2]));
  FDCE \applied_config_reg[67] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[67] ),
        .Q(data6[3]));
  FDCE \applied_config_reg[68] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[68] ),
        .Q(data6[4]));
  FDCE \applied_config_reg[69] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[69] ),
        .Q(data6[5]));
  FDCE \applied_config_reg[6] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[6] ),
        .Q(\applied_config_reg_n_0_[6] ));
  FDCE \applied_config_reg[70] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[70] ),
        .Q(data6[6]));
  FDCE \applied_config_reg[71] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[71] ),
        .Q(data6[7]));
  FDCE \applied_config_reg[72] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[72] ),
        .Q(data6[8]));
  FDCE \applied_config_reg[73] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[73] ),
        .Q(data6[9]));
  FDCE \applied_config_reg[74] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[74] ),
        .Q(data6[10]));
  FDCE \applied_config_reg[75] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[75] ),
        .Q(data6[11]));
  FDCE \applied_config_reg[76] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[76] ),
        .Q(data7[0]));
  FDCE \applied_config_reg[77] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[77] ),
        .Q(data7[1]));
  FDCE \applied_config_reg[78] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[78] ),
        .Q(data7[2]));
  FDCE \applied_config_reg[79] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[79] ),
        .Q(data7[3]));
  FDCE \applied_config_reg[7] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[7] ),
        .Q(\applied_config_reg_n_0_[7] ));
  FDCE \applied_config_reg[80] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[80] ),
        .Q(data7[4]));
  FDCE \applied_config_reg[81] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[81] ),
        .Q(data7[5]));
  FDCE \applied_config_reg[82] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[82] ),
        .Q(data7[6]));
  FDCE \applied_config_reg[83] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[83] ),
        .Q(data7[7]));
  FDCE \applied_config_reg[84] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[84] ),
        .Q(data7[8]));
  FDCE \applied_config_reg[85] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[85] ),
        .Q(data7[9]));
  FDCE \applied_config_reg[86] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[86] ),
        .Q(data7[10]));
  FDCE \applied_config_reg[87] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[87] ),
        .Q(data7[11]));
  FDCE \applied_config_reg[88] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[88] ),
        .Q(\^status_word [21]));
  FDCE \applied_config_reg[89] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[89] ),
        .Q(data8[1]));
  FDCE \applied_config_reg[8] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[8] ),
        .Q(\applied_config_reg_n_0_[8] ));
  FDCE \applied_config_reg[90] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[90] ),
        .Q(data8[2]));
  FDCE \applied_config_reg[9] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(\config_packet_reg_n_0_[9] ),
        .Q(\applied_config_reg_n_0_[9] ));
  FDCE \applied_tag_reg[0] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(response_data[2]),
        .Q(\applied_tag_reg_n_0_[0] ));
  FDCE \applied_tag_reg[10] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(response_data[12]),
        .Q(\applied_tag_reg_n_0_[10] ));
  FDCE \applied_tag_reg[11] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(response_data[13]),
        .Q(\applied_tag_reg_n_0_[11] ));
  FDCE \applied_tag_reg[12] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(response_data[14]),
        .Q(\applied_tag_reg_n_0_[12] ));
  FDCE \applied_tag_reg[13] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(response_data[15]),
        .Q(\applied_tag_reg_n_0_[13] ));
  FDCE \applied_tag_reg[14] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(response_data[16]),
        .Q(\applied_tag_reg_n_0_[14] ));
  FDCE \applied_tag_reg[15] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(response_data[17]),
        .Q(\applied_tag_reg_n_0_[15] ));
  FDCE \applied_tag_reg[16] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(response_data[18]),
        .Q(data1[0]));
  FDCE \applied_tag_reg[17] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(response_data[19]),
        .Q(data1[1]));
  FDCE \applied_tag_reg[18] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(response_data[20]),
        .Q(data1[2]));
  FDCE \applied_tag_reg[19] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(response_data[21]),
        .Q(data1[3]));
  FDCE \applied_tag_reg[1] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(response_data[3]),
        .Q(\applied_tag_reg_n_0_[1] ));
  FDCE \applied_tag_reg[20] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(response_data[22]),
        .Q(data1[4]));
  FDCE \applied_tag_reg[21] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(response_data[23]),
        .Q(data1[5]));
  FDCE \applied_tag_reg[22] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(response_data[24]),
        .Q(data1[6]));
  FDCE \applied_tag_reg[23] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(response_data[25]),
        .Q(data1[7]));
  FDCE \applied_tag_reg[24] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(response_data[26]),
        .Q(data1[8]));
  FDCE \applied_tag_reg[25] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(response_data[27]),
        .Q(data1[9]));
  FDCE \applied_tag_reg[26] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(response_data[28]),
        .Q(data1[10]));
  FDCE \applied_tag_reg[27] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(response_data[29]),
        .Q(data1[11]));
  FDCE \applied_tag_reg[28] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(response_data[30]),
        .Q(data1[12]));
  FDCE \applied_tag_reg[29] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(response_data[31]),
        .Q(data1[13]));
  FDCE \applied_tag_reg[2] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(response_data[4]),
        .Q(\applied_tag_reg_n_0_[2] ));
  FDCE \applied_tag_reg[30] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(response_data[32]),
        .Q(data1[14]));
  FDCE \applied_tag_reg[31] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(response_data[33]),
        .Q(data1[15]));
  FDCE \applied_tag_reg[3] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(response_data[5]),
        .Q(\applied_tag_reg_n_0_[3] ));
  FDCE \applied_tag_reg[4] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(response_data[6]),
        .Q(\applied_tag_reg_n_0_[4] ));
  FDCE \applied_tag_reg[5] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(response_data[7]),
        .Q(\applied_tag_reg_n_0_[5] ));
  FDCE \applied_tag_reg[6] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(response_data[8]),
        .Q(\applied_tag_reg_n_0_[6] ));
  FDCE \applied_tag_reg[7] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(response_data[9]),
        .Q(\applied_tag_reg_n_0_[7] ));
  FDCE \applied_tag_reg[8] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(response_data[10]),
        .Q(\applied_tag_reg_n_0_[8] ));
  FDCE \applied_tag_reg[9] 
       (.C(control_clk),
        .CE(confirmation_mailbox_n_1),
        .CLR(sample_resetn_0),
        .D(response_data[11]),
        .Q(\applied_tag_reg_n_0_[9] ));
  FDCE awaiting_sample_reg
       (.C(sample_clk),
        .CE(1'b1),
        .CLR(sample_resetn_0),
        .D(waveform_n_96),
        .Q(awaiting_sample_reg_n_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "no" *) 
  FDCE \clipped_sync_reg[0] 
       (.C(control_clk),
        .CE(1'b1),
        .CLR(sample_resetn_0),
        .D(sample_clipped),
        .Q(clipped_sync[0]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "no" *) 
  FDCE \clipped_sync_reg[1] 
       (.C(control_clk),
        .CE(1'b1),
        .CLR(sample_resetn_0),
        .D(clipped_sync[0]),
        .Q(clipped_sync[1]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  OBUFT #(
    .IOSTANDARD("DEFAULT")) 
    clock_pad
       (.I(generated_clock),
        .O(dac_clk),
        .T(pad_tristate[12]));
  LUT2 #(
    .INIT(4'h2)) 
    clock_run_i_1
       (.I0(permit_sync[1]),
        .I1(pad_tristate[12]),
        .O(clock_run0));
  FDCE clock_run_reg
       (.C(sample_clk),
        .CE(1'b1),
        .CLR(sample_resetn_0),
        .D(clock_run0),
        .Q(clock_run));
  LUT1 #(
    .INIT(2'h1)) 
    \config_packet[91]_i_1 
       (.I0(tag_counter_reg[0]),
        .O(next_tag[0]));
  FDCE \config_packet_reg[0] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\staged_ftw_reg_n_0_[0] ),
        .Q(\config_packet_reg_n_0_[0] ));
  FDCE \config_packet_reg[100] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(next_tag[9]),
        .Q(\config_packet_reg_n_0_[100] ));
  FDCE \config_packet_reg[101] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(next_tag[10]),
        .Q(\config_packet_reg_n_0_[101] ));
  FDCE \config_packet_reg[102] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(next_tag[11]),
        .Q(\config_packet_reg_n_0_[102] ));
  FDCE \config_packet_reg[103] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(next_tag[12]),
        .Q(\config_packet_reg_n_0_[103] ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \config_packet_reg[103]_i_1 
       (.CI(\config_packet_reg[99]_i_1_n_0 ),
        .CO({\config_packet_reg[103]_i_1_n_0 ,\config_packet_reg[103]_i_1_n_1 ,\config_packet_reg[103]_i_1_n_2 ,\config_packet_reg[103]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(next_tag[12:9]),
        .S(tag_counter_reg[12:9]));
  FDCE \config_packet_reg[104] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(next_tag[13]),
        .Q(\config_packet_reg_n_0_[104] ));
  FDCE \config_packet_reg[105] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(next_tag[14]),
        .Q(\config_packet_reg_n_0_[105] ));
  FDCE \config_packet_reg[106] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(next_tag[15]),
        .Q(\config_packet_reg_n_0_[106] ));
  FDCE \config_packet_reg[107] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(next_tag[16]),
        .Q(\config_packet_reg_n_0_[107] ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \config_packet_reg[107]_i_1 
       (.CI(\config_packet_reg[103]_i_1_n_0 ),
        .CO({\config_packet_reg[107]_i_1_n_0 ,\config_packet_reg[107]_i_1_n_1 ,\config_packet_reg[107]_i_1_n_2 ,\config_packet_reg[107]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(next_tag[16:13]),
        .S(tag_counter_reg[16:13]));
  FDCE \config_packet_reg[108] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(next_tag[17]),
        .Q(\config_packet_reg_n_0_[108] ));
  FDCE \config_packet_reg[109] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(next_tag[18]),
        .Q(\config_packet_reg_n_0_[109] ));
  FDCE \config_packet_reg[10] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\staged_ftw_reg_n_0_[10] ),
        .Q(\config_packet_reg_n_0_[10] ));
  FDCE \config_packet_reg[110] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(next_tag[19]),
        .Q(\config_packet_reg_n_0_[110] ));
  FDCE \config_packet_reg[111] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(next_tag[20]),
        .Q(\config_packet_reg_n_0_[111] ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \config_packet_reg[111]_i_1 
       (.CI(\config_packet_reg[107]_i_1_n_0 ),
        .CO({\config_packet_reg[111]_i_1_n_0 ,\config_packet_reg[111]_i_1_n_1 ,\config_packet_reg[111]_i_1_n_2 ,\config_packet_reg[111]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(next_tag[20:17]),
        .S(tag_counter_reg[20:17]));
  FDCE \config_packet_reg[112] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(next_tag[21]),
        .Q(\config_packet_reg_n_0_[112] ));
  FDCE \config_packet_reg[113] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(next_tag[22]),
        .Q(\config_packet_reg_n_0_[113] ));
  FDCE \config_packet_reg[114] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(next_tag[23]),
        .Q(\config_packet_reg_n_0_[114] ));
  FDCE \config_packet_reg[115] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(next_tag[24]),
        .Q(\config_packet_reg_n_0_[115] ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \config_packet_reg[115]_i_1 
       (.CI(\config_packet_reg[111]_i_1_n_0 ),
        .CO({\config_packet_reg[115]_i_1_n_0 ,\config_packet_reg[115]_i_1_n_1 ,\config_packet_reg[115]_i_1_n_2 ,\config_packet_reg[115]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(next_tag[24:21]),
        .S(tag_counter_reg[24:21]));
  FDCE \config_packet_reg[116] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(next_tag[25]),
        .Q(\config_packet_reg_n_0_[116] ));
  FDCE \config_packet_reg[117] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(next_tag[26]),
        .Q(\config_packet_reg_n_0_[117] ));
  FDCE \config_packet_reg[118] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(next_tag[27]),
        .Q(\config_packet_reg_n_0_[118] ));
  FDCE \config_packet_reg[119] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(next_tag[28]),
        .Q(\config_packet_reg_n_0_[119] ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \config_packet_reg[119]_i_1 
       (.CI(\config_packet_reg[115]_i_1_n_0 ),
        .CO({\config_packet_reg[119]_i_1_n_0 ,\config_packet_reg[119]_i_1_n_1 ,\config_packet_reg[119]_i_1_n_2 ,\config_packet_reg[119]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(next_tag[28:25]),
        .S(tag_counter_reg[28:25]));
  FDCE \config_packet_reg[11] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\staged_ftw_reg_n_0_[11] ),
        .Q(\config_packet_reg_n_0_[11] ));
  FDCE \config_packet_reg[120] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(next_tag[29]),
        .Q(\config_packet_reg_n_0_[120] ));
  FDCE \config_packet_reg[121] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(next_tag[30]),
        .Q(\config_packet_reg_n_0_[121] ));
  FDCE \config_packet_reg[122] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(next_tag[31]),
        .Q(\config_packet_reg_n_0_[122] ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \config_packet_reg[122]_i_2 
       (.CI(\config_packet_reg[119]_i_1_n_0 ),
        .CO({\NLW_config_packet_reg[122]_i_2_CO_UNCONNECTED [3:2],\config_packet_reg[122]_i_2_n_2 ,\config_packet_reg[122]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_config_packet_reg[122]_i_2_O_UNCONNECTED [3],next_tag[31:29]}),
        .S({1'b0,tag_counter_reg[31:29]}));
  FDCE \config_packet_reg[12] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\staged_ftw_reg_n_0_[12] ),
        .Q(\config_packet_reg_n_0_[12] ));
  FDCE \config_packet_reg[13] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\staged_ftw_reg_n_0_[13] ),
        .Q(\config_packet_reg_n_0_[13] ));
  FDCE \config_packet_reg[14] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\staged_ftw_reg_n_0_[14] ),
        .Q(\config_packet_reg_n_0_[14] ));
  FDCE \config_packet_reg[15] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\staged_ftw_reg_n_0_[15] ),
        .Q(\config_packet_reg_n_0_[15] ));
  FDCE \config_packet_reg[16] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\staged_ftw_reg_n_0_[16] ),
        .Q(\config_packet_reg_n_0_[16] ));
  FDCE \config_packet_reg[17] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\staged_ftw_reg_n_0_[17] ),
        .Q(\config_packet_reg_n_0_[17] ));
  FDCE \config_packet_reg[18] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\staged_ftw_reg_n_0_[18] ),
        .Q(\config_packet_reg_n_0_[18] ));
  FDCE \config_packet_reg[19] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\staged_ftw_reg_n_0_[19] ),
        .Q(\config_packet_reg_n_0_[19] ));
  FDCE \config_packet_reg[1] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\staged_ftw_reg_n_0_[1] ),
        .Q(\config_packet_reg_n_0_[1] ));
  FDCE \config_packet_reg[20] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\staged_ftw_reg_n_0_[20] ),
        .Q(\config_packet_reg_n_0_[20] ));
  FDCE \config_packet_reg[21] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\staged_ftw_reg_n_0_[21] ),
        .Q(\config_packet_reg_n_0_[21] ));
  FDCE \config_packet_reg[22] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\staged_ftw_reg_n_0_[22] ),
        .Q(\config_packet_reg_n_0_[22] ));
  FDCE \config_packet_reg[23] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\staged_ftw_reg_n_0_[23] ),
        .Q(\config_packet_reg_n_0_[23] ));
  FDCE \config_packet_reg[24] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\staged_ftw_reg_n_0_[24] ),
        .Q(\config_packet_reg_n_0_[24] ));
  FDCE \config_packet_reg[25] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\staged_ftw_reg_n_0_[25] ),
        .Q(\config_packet_reg_n_0_[25] ));
  FDCE \config_packet_reg[26] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\staged_ftw_reg_n_0_[26] ),
        .Q(\config_packet_reg_n_0_[26] ));
  FDCE \config_packet_reg[27] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\staged_ftw_reg_n_0_[27] ),
        .Q(\config_packet_reg_n_0_[27] ));
  FDCE \config_packet_reg[28] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\staged_ftw_reg_n_0_[28] ),
        .Q(\config_packet_reg_n_0_[28] ));
  FDCE \config_packet_reg[29] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\staged_ftw_reg_n_0_[29] ),
        .Q(\config_packet_reg_n_0_[29] ));
  FDCE \config_packet_reg[2] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\staged_ftw_reg_n_0_[2] ),
        .Q(\config_packet_reg_n_0_[2] ));
  FDCE \config_packet_reg[30] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\staged_ftw_reg_n_0_[30] ),
        .Q(\config_packet_reg_n_0_[30] ));
  FDCE \config_packet_reg[31] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(p_0_in1_in),
        .Q(\config_packet_reg_n_0_[31] ));
  FDCE \config_packet_reg[32] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(staged_phase[0]),
        .Q(\config_packet_reg_n_0_[32] ));
  FDCE \config_packet_reg[33] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(staged_phase[1]),
        .Q(\config_packet_reg_n_0_[33] ));
  FDCE \config_packet_reg[34] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(staged_phase[2]),
        .Q(\config_packet_reg_n_0_[34] ));
  FDCE \config_packet_reg[35] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(staged_phase[3]),
        .Q(\config_packet_reg_n_0_[35] ));
  FDCE \config_packet_reg[36] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(staged_phase[4]),
        .Q(\config_packet_reg_n_0_[36] ));
  FDCE \config_packet_reg[37] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(staged_phase[5]),
        .Q(\config_packet_reg_n_0_[37] ));
  FDCE \config_packet_reg[38] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(staged_phase[6]),
        .Q(\config_packet_reg_n_0_[38] ));
  FDCE \config_packet_reg[39] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(staged_phase[7]),
        .Q(\config_packet_reg_n_0_[39] ));
  FDCE \config_packet_reg[3] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\staged_ftw_reg_n_0_[3] ),
        .Q(\config_packet_reg_n_0_[3] ));
  FDCE \config_packet_reg[40] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(staged_phase[8]),
        .Q(\config_packet_reg_n_0_[40] ));
  FDCE \config_packet_reg[41] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(staged_phase[9]),
        .Q(\config_packet_reg_n_0_[41] ));
  FDCE \config_packet_reg[42] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(staged_phase[10]),
        .Q(\config_packet_reg_n_0_[42] ));
  FDCE \config_packet_reg[43] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(staged_phase[11]),
        .Q(\config_packet_reg_n_0_[43] ));
  FDCE \config_packet_reg[44] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(staged_phase[12]),
        .Q(\config_packet_reg_n_0_[44] ));
  FDCE \config_packet_reg[45] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(staged_phase[13]),
        .Q(\config_packet_reg_n_0_[45] ));
  FDCE \config_packet_reg[46] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(staged_phase[14]),
        .Q(\config_packet_reg_n_0_[46] ));
  FDCE \config_packet_reg[47] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(staged_phase[15]),
        .Q(\config_packet_reg_n_0_[47] ));
  FDCE \config_packet_reg[48] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(staged_phase[16]),
        .Q(\config_packet_reg_n_0_[48] ));
  FDCE \config_packet_reg[49] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(staged_phase[17]),
        .Q(\config_packet_reg_n_0_[49] ));
  FDCE \config_packet_reg[4] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\staged_ftw_reg_n_0_[4] ),
        .Q(\config_packet_reg_n_0_[4] ));
  FDCE \config_packet_reg[50] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(staged_phase[18]),
        .Q(\config_packet_reg_n_0_[50] ));
  FDCE \config_packet_reg[51] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(staged_phase[19]),
        .Q(\config_packet_reg_n_0_[51] ));
  FDCE \config_packet_reg[52] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(staged_phase[20]),
        .Q(\config_packet_reg_n_0_[52] ));
  FDCE \config_packet_reg[53] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(staged_phase[21]),
        .Q(\config_packet_reg_n_0_[53] ));
  FDCE \config_packet_reg[54] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(staged_phase[22]),
        .Q(\config_packet_reg_n_0_[54] ));
  FDCE \config_packet_reg[55] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(staged_phase[23]),
        .Q(\config_packet_reg_n_0_[55] ));
  FDCE \config_packet_reg[56] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(staged_phase[24]),
        .Q(\config_packet_reg_n_0_[56] ));
  FDCE \config_packet_reg[57] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(staged_phase[25]),
        .Q(\config_packet_reg_n_0_[57] ));
  FDCE \config_packet_reg[58] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(staged_phase[26]),
        .Q(\config_packet_reg_n_0_[58] ));
  FDCE \config_packet_reg[59] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(staged_phase[27]),
        .Q(\config_packet_reg_n_0_[59] ));
  FDCE \config_packet_reg[5] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\staged_ftw_reg_n_0_[5] ),
        .Q(\config_packet_reg_n_0_[5] ));
  FDCE \config_packet_reg[60] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(staged_phase[28]),
        .Q(\config_packet_reg_n_0_[60] ));
  FDCE \config_packet_reg[61] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(staged_phase[29]),
        .Q(\config_packet_reg_n_0_[61] ));
  FDCE \config_packet_reg[62] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(staged_phase[30]),
        .Q(\config_packet_reg_n_0_[62] ));
  FDCE \config_packet_reg[63] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(staged_phase[31]),
        .Q(\config_packet_reg_n_0_[63] ));
  FDCE \config_packet_reg[64] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\staged_gain_reg_n_0_[0] ),
        .Q(\config_packet_reg_n_0_[64] ));
  FDCE \config_packet_reg[65] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\staged_gain_reg_n_0_[1] ),
        .Q(\config_packet_reg_n_0_[65] ));
  FDCE \config_packet_reg[66] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\staged_gain_reg_n_0_[2] ),
        .Q(\config_packet_reg_n_0_[66] ));
  FDCE \config_packet_reg[67] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\staged_gain_reg_n_0_[3] ),
        .Q(\config_packet_reg_n_0_[67] ));
  FDCE \config_packet_reg[68] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\staged_gain_reg_n_0_[4] ),
        .Q(\config_packet_reg_n_0_[68] ));
  FDCE \config_packet_reg[69] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\staged_gain_reg_n_0_[5] ),
        .Q(\config_packet_reg_n_0_[69] ));
  FDCE \config_packet_reg[6] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\staged_ftw_reg_n_0_[6] ),
        .Q(\config_packet_reg_n_0_[6] ));
  FDCE \config_packet_reg[70] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\staged_gain_reg_n_0_[6] ),
        .Q(\config_packet_reg_n_0_[70] ));
  FDCE \config_packet_reg[71] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\staged_gain_reg_n_0_[7] ),
        .Q(\config_packet_reg_n_0_[71] ));
  FDCE \config_packet_reg[72] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\staged_gain_reg_n_0_[8] ),
        .Q(\config_packet_reg_n_0_[72] ));
  FDCE \config_packet_reg[73] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\staged_gain_reg_n_0_[9] ),
        .Q(\config_packet_reg_n_0_[73] ));
  FDCE \config_packet_reg[74] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\staged_gain_reg_n_0_[10] ),
        .Q(\config_packet_reg_n_0_[74] ));
  FDCE \config_packet_reg[75] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\staged_gain_reg_n_0_[11] ),
        .Q(\config_packet_reg_n_0_[75] ));
  FDCE \config_packet_reg[76] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(staged_offset__0[0]),
        .Q(\config_packet_reg_n_0_[76] ));
  FDCE \config_packet_reg[77] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(staged_offset__0[1]),
        .Q(\config_packet_reg_n_0_[77] ));
  FDCE \config_packet_reg[78] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(staged_offset__0[2]),
        .Q(\config_packet_reg_n_0_[78] ));
  FDCE \config_packet_reg[79] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(staged_offset__0[3]),
        .Q(\config_packet_reg_n_0_[79] ));
  FDCE \config_packet_reg[7] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\staged_ftw_reg_n_0_[7] ),
        .Q(\config_packet_reg_n_0_[7] ));
  FDCE \config_packet_reg[80] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(staged_offset__0[4]),
        .Q(\config_packet_reg_n_0_[80] ));
  FDCE \config_packet_reg[81] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(staged_offset__0[5]),
        .Q(\config_packet_reg_n_0_[81] ));
  FDCE \config_packet_reg[82] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(staged_offset__0[6]),
        .Q(\config_packet_reg_n_0_[82] ));
  FDCE \config_packet_reg[83] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(staged_offset__0[7]),
        .Q(\config_packet_reg_n_0_[83] ));
  FDCE \config_packet_reg[84] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(staged_offset__0[8]),
        .Q(\config_packet_reg_n_0_[84] ));
  FDCE \config_packet_reg[85] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(staged_offset__0[9]),
        .Q(\config_packet_reg_n_0_[85] ));
  FDCE \config_packet_reg[86] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(staged_offset__0[10]),
        .Q(\config_packet_reg_n_0_[86] ));
  FDCE \config_packet_reg[87] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(staged_offset__0[11]),
        .Q(\config_packet_reg_n_0_[87] ));
  FDCE \config_packet_reg[88] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(staged_enable),
        .Q(\config_packet_reg_n_0_[88] ));
  FDCE \config_packet_reg[89] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(staged_invert),
        .Q(\config_packet_reg_n_0_[89] ));
  FDCE \config_packet_reg[8] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\staged_ftw_reg_n_0_[8] ),
        .Q(\config_packet_reg_n_0_[8] ));
  FDCE \config_packet_reg[90] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(staged_restart__0),
        .Q(\config_packet_reg_n_0_[90] ));
  FDCE \config_packet_reg[91] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(next_tag[0]),
        .Q(\config_packet_reg_n_0_[91] ));
  FDCE \config_packet_reg[92] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(next_tag[1]),
        .Q(\config_packet_reg_n_0_[92] ));
  FDCE \config_packet_reg[93] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(next_tag[2]),
        .Q(\config_packet_reg_n_0_[93] ));
  FDCE \config_packet_reg[94] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(next_tag[3]),
        .Q(\config_packet_reg_n_0_[94] ));
  FDCE \config_packet_reg[95] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(next_tag[4]),
        .Q(\config_packet_reg_n_0_[95] ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \config_packet_reg[95]_i_1 
       (.CI(1'b0),
        .CO({\config_packet_reg[95]_i_1_n_0 ,\config_packet_reg[95]_i_1_n_1 ,\config_packet_reg[95]_i_1_n_2 ,\config_packet_reg[95]_i_1_n_3 }),
        .CYINIT(tag_counter_reg[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(next_tag[4:1]),
        .S(tag_counter_reg[4:1]));
  FDCE \config_packet_reg[96] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(next_tag[5]),
        .Q(\config_packet_reg_n_0_[96] ));
  FDCE \config_packet_reg[97] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(next_tag[6]),
        .Q(\config_packet_reg_n_0_[97] ));
  FDCE \config_packet_reg[98] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(next_tag[7]),
        .Q(\config_packet_reg_n_0_[98] ));
  FDCE \config_packet_reg[99] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(next_tag[8]),
        .Q(\config_packet_reg_n_0_[99] ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \config_packet_reg[99]_i_1 
       (.CI(\config_packet_reg[95]_i_1_n_0 ),
        .CO({\config_packet_reg[99]_i_1_n_0 ,\config_packet_reg[99]_i_1_n_1 ,\config_packet_reg[99]_i_1_n_2 ,\config_packet_reg[99]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(next_tag[8:5]),
        .S(tag_counter_reg[8:5]));
  FDCE \config_packet_reg[9] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\staged_ftw_reg_n_0_[9] ),
        .Q(\config_packet_reg_n_0_[9] ));
  system_dac902_control_0_fdw_cdc_mailbox configuration_mailbox
       (.E(reply_pending_reg_0),
        .\FSM_onehot_state_reg[0] (confirmation_mailbox_n_34),
        .\FSM_onehot_state_reg[0]_0 (\FSM_onehot_state_reg_n_0_[0] ),
        .\FSM_onehot_state_reg[1] (configuration_mailbox_n_136),
        .\FSM_onehot_state_reg[1]_0 (configuration_mailbox_n_138),
        .\FSM_onehot_state_reg[2] (configuration_mailbox_n_137),
        .\FSM_onehot_state_reg[2]_0 (\FSM_onehot_state_reg_n_0_[2] ),
        .Q({config_data[122:91],config_data[89:0]}),
        .acknowledge_toggle_reg_0(reply_pending_reg_n_0),
        .acknowledged_reg(acknowledged_i_3_n_0),
        .acknowledged_reg_0(acknowledged_i_5_n_0),
        .acknowledged_reg_1(\^status_word [26]),
        .active_enable(active_enable),
        .active_enable_reg(configuration_mailbox_n_5),
        .cfg_rejected0(cfg_rejected0),
        .command_word(command_word[31:27]),
        .\command_word[27] (configuration_mailbox_n_1),
        .\command_word[29] (configuration_mailbox_n_0),
        .\command_word[31] (configuration_mailbox_n_133),
        .control_clk(control_clk),
        .\dst_data_reg[0]_0 (sample_resetn_0),
        .\dst_data_reg[88]_0 (configuration_mailbox_n_128),
        .enabled2(enabled2),
        .\error_code_reg[0] (\error_code[0]_i_3_n_0 ),
        .\error_code_reg[2] (\error_code[2]_i_4_n_0 ),
        .\error_code_reg[2]_0 (\error_code[2]_i_5_n_0 ),
        .\error_code_reg[2]_1 (\error_code[2]_i_6_n_0 ),
        .interface_initialized(interface_initialized),
        .interface_initialized_reg(configuration_mailbox_n_132),
        .pending_request_reg(pending_request_reg_n_0),
        .reference_config_ftw0(reference_config_ftw0),
        .reply_pending_reg(configuration_mailbox_n_134),
        .request_toggle_reg_0(\FSM_onehot_state_reg_n_0_[1] ),
        .response_valid(response_valid),
        .sample_clk(sample_clk),
        .sample_pending(sample_pending),
        .sample_pending_reg(cfg_valid0),
        .sample_pending_reg_0(reply_pending),
        .\src_data_hold_reg[122]_0 ({\config_packet_reg_n_0_[122] ,\config_packet_reg_n_0_[121] ,\config_packet_reg_n_0_[120] ,\config_packet_reg_n_0_[119] ,\config_packet_reg_n_0_[118] ,\config_packet_reg_n_0_[117] ,\config_packet_reg_n_0_[116] ,\config_packet_reg_n_0_[115] ,\config_packet_reg_n_0_[114] ,\config_packet_reg_n_0_[113] ,\config_packet_reg_n_0_[112] ,\config_packet_reg_n_0_[111] ,\config_packet_reg_n_0_[110] ,\config_packet_reg_n_0_[109] ,\config_packet_reg_n_0_[108] ,\config_packet_reg_n_0_[107] ,\config_packet_reg_n_0_[106] ,\config_packet_reg_n_0_[105] ,\config_packet_reg_n_0_[104] ,\config_packet_reg_n_0_[103] ,\config_packet_reg_n_0_[102] ,\config_packet_reg_n_0_[101] ,\config_packet_reg_n_0_[100] ,\config_packet_reg_n_0_[99] ,\config_packet_reg_n_0_[98] ,\config_packet_reg_n_0_[97] ,\config_packet_reg_n_0_[96] ,\config_packet_reg_n_0_[95] ,\config_packet_reg_n_0_[94] ,\config_packet_reg_n_0_[93] ,\config_packet_reg_n_0_[92] ,\config_packet_reg_n_0_[91] ,\config_packet_reg_n_0_[90] ,\config_packet_reg_n_0_[89] ,\config_packet_reg_n_0_[88] ,\config_packet_reg_n_0_[87] ,\config_packet_reg_n_0_[86] ,\config_packet_reg_n_0_[85] ,\config_packet_reg_n_0_[84] ,\config_packet_reg_n_0_[83] ,\config_packet_reg_n_0_[82] ,\config_packet_reg_n_0_[81] ,\config_packet_reg_n_0_[80] ,\config_packet_reg_n_0_[79] ,\config_packet_reg_n_0_[78] ,\config_packet_reg_n_0_[77] ,\config_packet_reg_n_0_[76] ,\config_packet_reg_n_0_[75] ,\config_packet_reg_n_0_[74] ,\config_packet_reg_n_0_[73] ,\config_packet_reg_n_0_[72] ,\config_packet_reg_n_0_[71] ,\config_packet_reg_n_0_[70] ,\config_packet_reg_n_0_[69] ,\config_packet_reg_n_0_[68] ,\config_packet_reg_n_0_[67] ,\config_packet_reg_n_0_[66] ,\config_packet_reg_n_0_[65] ,\config_packet_reg_n_0_[64] ,\config_packet_reg_n_0_[63] ,\config_packet_reg_n_0_[62] ,\config_packet_reg_n_0_[61] ,\config_packet_reg_n_0_[60] ,\config_packet_reg_n_0_[59] ,\config_packet_reg_n_0_[58] ,\config_packet_reg_n_0_[57] ,\config_packet_reg_n_0_[56] ,\config_packet_reg_n_0_[55] ,\config_packet_reg_n_0_[54] ,\config_packet_reg_n_0_[53] ,\config_packet_reg_n_0_[52] ,\config_packet_reg_n_0_[51] ,\config_packet_reg_n_0_[50] ,\config_packet_reg_n_0_[49] ,\config_packet_reg_n_0_[48] ,\config_packet_reg_n_0_[47] ,\config_packet_reg_n_0_[46] ,\config_packet_reg_n_0_[45] ,\config_packet_reg_n_0_[44] ,\config_packet_reg_n_0_[43] ,\config_packet_reg_n_0_[42] ,\config_packet_reg_n_0_[41] ,\config_packet_reg_n_0_[40] ,\config_packet_reg_n_0_[39] ,\config_packet_reg_n_0_[38] ,\config_packet_reg_n_0_[37] ,\config_packet_reg_n_0_[36] ,\config_packet_reg_n_0_[35] ,\config_packet_reg_n_0_[34] ,\config_packet_reg_n_0_[33] ,\config_packet_reg_n_0_[32] ,\config_packet_reg_n_0_[31] ,\config_packet_reg_n_0_[30] ,\config_packet_reg_n_0_[29] ,\config_packet_reg_n_0_[28] ,\config_packet_reg_n_0_[27] ,\config_packet_reg_n_0_[26] ,\config_packet_reg_n_0_[25] ,\config_packet_reg_n_0_[24] ,\config_packet_reg_n_0_[23] ,\config_packet_reg_n_0_[22] ,\config_packet_reg_n_0_[21] ,\config_packet_reg_n_0_[20] ,\config_packet_reg_n_0_[19] ,\config_packet_reg_n_0_[18] ,\config_packet_reg_n_0_[17] ,\config_packet_reg_n_0_[16] ,\config_packet_reg_n_0_[15] ,\config_packet_reg_n_0_[14] ,\config_packet_reg_n_0_[13] ,\config_packet_reg_n_0_[12] ,\config_packet_reg_n_0_[11] ,\config_packet_reg_n_0_[10] ,\config_packet_reg_n_0_[9] ,\config_packet_reg_n_0_[8] ,\config_packet_reg_n_0_[7] ,\config_packet_reg_n_0_[6] ,\config_packet_reg_n_0_[5] ,\config_packet_reg_n_0_[4] ,\config_packet_reg_n_0_[3] ,\config_packet_reg_n_0_[2] ,\config_packet_reg_n_0_[1] ,\config_packet_reg_n_0_[0] }),
        .status_word(\^status_word [24]),
        .tag_counter(tag_counter),
        .\tag_counter_reg[31] (\error_code[1]_i_3_n_0 ),
        .\tag_counter_reg[31]_0 (\staged_ftw[31]_i_4_n_0 ),
        .v2(v2),
        .v2_reg(configuration_mailbox_n_129));
  system_dac902_control_0_fdw_cdc_mailbox__parameterized0 confirmation_mailbox
       (.CO(\error_code1_inferred__0/i__carry__1_n_1 ),
        .E(confirmation_mailbox_n_1),
        .\FSM_onehot_state_reg[2] (confirmation_mailbox_n_34),
        .\FSM_onehot_state_reg[2]_0 (confirmation_mailbox_n_47),
        .\FSM_onehot_state_reg[2]_1 (confirmation_mailbox_n_48),
        .\FSM_onehot_state_reg[2]_2 (confirmation_mailbox_n_49),
        .Q(response_data),
        .S({confirmation_mailbox_n_35,confirmation_mailbox_n_36,confirmation_mailbox_n_37,confirmation_mailbox_n_38}),
        .acknowledge_toggle_reg_0(\FSM_onehot_state_reg_n_0_[2] ),
        .command_word(command_word[31]),
        .\config_packet_reg[122] ({confirmation_mailbox_n_43,confirmation_mailbox_n_44,confirmation_mailbox_n_45}),
        .control_clk(control_clk),
        .\dst_data_reg[0]_0 (sample_resetn_0),
        .\dst_data_reg[24]_0 ({confirmation_mailbox_n_39,confirmation_mailbox_n_40,confirmation_mailbox_n_41,confirmation_mailbox_n_42}),
        .\error_code1_inferred__0/i__carry__1 ({\config_packet_reg_n_0_[122] ,\config_packet_reg_n_0_[121] ,\config_packet_reg_n_0_[120] ,\config_packet_reg_n_0_[119] ,\config_packet_reg_n_0_[118] ,\config_packet_reg_n_0_[117] ,\config_packet_reg_n_0_[116] ,\config_packet_reg_n_0_[115] ,\config_packet_reg_n_0_[114] ,\config_packet_reg_n_0_[113] ,\config_packet_reg_n_0_[112] ,\config_packet_reg_n_0_[111] ,\config_packet_reg_n_0_[110] ,\config_packet_reg_n_0_[109] ,\config_packet_reg_n_0_[108] ,\config_packet_reg_n_0_[107] ,\config_packet_reg_n_0_[106] ,\config_packet_reg_n_0_[105] ,\config_packet_reg_n_0_[104] ,\config_packet_reg_n_0_[103] ,\config_packet_reg_n_0_[102] ,\config_packet_reg_n_0_[101] ,\config_packet_reg_n_0_[100] ,\config_packet_reg_n_0_[99] ,\config_packet_reg_n_0_[98] ,\config_packet_reg_n_0_[97] ,\config_packet_reg_n_0_[96] ,\config_packet_reg_n_0_[95] ,\config_packet_reg_n_0_[94] ,\config_packet_reg_n_0_[93] ,\config_packet_reg_n_0_[92] ,\config_packet_reg_n_0_[91] ,\config_packet_reg_n_0_[88] }),
        .\error_code_reg[0] (\^status_word [26]),
        .\error_code_reg[0]_0 (\FSM_onehot_state_reg_n_0_[1] ),
        .\error_code_reg[0]_1 (configuration_mailbox_n_0),
        .\error_code_reg[1] (\error_code[1]_i_3_n_0 ),
        .\error_code_reg[1]_0 (\error_code[1]_i_4_n_0 ),
        .\error_code_reg[2] (configuration_mailbox_n_1),
        .interface_initialized(interface_initialized),
        .reply_pending_reg(reply_pending),
        .request_toggle_reg_0(confirmation_mailbox_n_46),
        .request_toggle_reg_1(reply_pending_reg_n_0),
        .response_valid(response_valid),
        .sample_clk(sample_clk),
        .\src_data_hold_reg[33]_0 ({\reply_data_reg_n_0_[33] ,\reply_data_reg_n_0_[32] ,\reply_data_reg_n_0_[31] ,\reply_data_reg_n_0_[30] ,\reply_data_reg_n_0_[29] ,\reply_data_reg_n_0_[28] ,\reply_data_reg_n_0_[27] ,\reply_data_reg_n_0_[26] ,\reply_data_reg_n_0_[25] ,\reply_data_reg_n_0_[24] ,\reply_data_reg_n_0_[23] ,\reply_data_reg_n_0_[22] ,\reply_data_reg_n_0_[21] ,\reply_data_reg_n_0_[20] ,\reply_data_reg_n_0_[19] ,\reply_data_reg_n_0_[18] ,\reply_data_reg_n_0_[17] ,\reply_data_reg_n_0_[16] ,\reply_data_reg_n_0_[15] ,\reply_data_reg_n_0_[14] ,\reply_data_reg_n_0_[13] ,\reply_data_reg_n_0_[12] ,\reply_data_reg_n_0_[11] ,\reply_data_reg_n_0_[10] ,\reply_data_reg_n_0_[9] ,\reply_data_reg_n_0_[8] ,\reply_data_reg_n_0_[7] ,\reply_data_reg_n_0_[6] ,\reply_data_reg_n_0_[5] ,\reply_data_reg_n_0_[4] ,\reply_data_reg_n_0_[3] ,\reply_data_reg_n_0_[2] ,\reply_data_reg_n_0_[1] ,\reply_data_reg_n_0_[0] }),
        .status_word(\^status_word [19:17]));
  LUT1 #(
    .INIT(2'h1)) 
    \connected_sync[0]_i_1 
       (.I0(pad_tristate[12]),
        .O(pins_enabled));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "no" *) 
  FDCE \connected_sync_reg[0] 
       (.C(control_clk),
        .CE(1'b1),
        .CLR(sample_resetn_0),
        .D(pins_enabled),
        .Q(connected_sync[0]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "no" *) 
  FDCE \connected_sync_reg[1] 
       (.C(control_clk),
        .CE(1'b1),
        .CLR(sample_resetn_0),
        .D(connected_sync[0]),
        .Q(connected_sync[1]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* __SRVAL = "FALSE" *) 
  ODDR #(
    .DDR_CLK_EDGE("SAME_EDGE"),
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D1_INVERTED(1'b0),
    .IS_D2_INVERTED(1'b0),
    .SRTYPE("ASYNC")) 
    dac_clk_oddr
       (.C(sample_clk),
        .CE(1'b1),
        .D1(1'b0),
        .D2(1'b1),
        .Q(generated_clock),
        .R(R0),
        .S(NLW_dac_clk_oddr_S_UNCONNECTED));
  LUT2 #(
    .INIT(4'hB)) 
    dac_clk_oddr_i_1
       (.I0(sample_resetn_0),
        .I1(clock_run),
        .O(R0));
  CARRY4 \error_code1_inferred__0/i__carry 
       (.CI(1'b0),
        .CO({\error_code1_inferred__0/i__carry_n_0 ,\error_code1_inferred__0/i__carry_n_1 ,\error_code1_inferred__0/i__carry_n_2 ,\error_code1_inferred__0/i__carry_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b1,1'b1,1'b1,1'b1}),
        .O(\NLW_error_code1_inferred__0/i__carry_O_UNCONNECTED [3:0]),
        .S({confirmation_mailbox_n_35,confirmation_mailbox_n_36,confirmation_mailbox_n_37,confirmation_mailbox_n_38}));
  CARRY4 \error_code1_inferred__0/i__carry__0 
       (.CI(\error_code1_inferred__0/i__carry_n_0 ),
        .CO({\error_code1_inferred__0/i__carry__0_n_0 ,\error_code1_inferred__0/i__carry__0_n_1 ,\error_code1_inferred__0/i__carry__0_n_2 ,\error_code1_inferred__0/i__carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b1,1'b1,1'b1,1'b1}),
        .O(\NLW_error_code1_inferred__0/i__carry__0_O_UNCONNECTED [3:0]),
        .S({confirmation_mailbox_n_39,confirmation_mailbox_n_40,confirmation_mailbox_n_41,confirmation_mailbox_n_42}));
  CARRY4 \error_code1_inferred__0/i__carry__1 
       (.CI(\error_code1_inferred__0/i__carry__0_n_0 ),
        .CO({\NLW_error_code1_inferred__0/i__carry__1_CO_UNCONNECTED [3],\error_code1_inferred__0/i__carry__1_n_1 ,\error_code1_inferred__0/i__carry__1_n_2 ,\error_code1_inferred__0/i__carry__1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b1,1'b1,1'b1}),
        .O(\NLW_error_code1_inferred__0/i__carry__1_O_UNCONNECTED [3:0]),
        .S({1'b0,confirmation_mailbox_n_43,confirmation_mailbox_n_44,confirmation_mailbox_n_45}));
  LUT5 #(
    .INIT(32'h000C00CE)) 
    \error_code[0]_i_3 
       (.I0(\error_code[0]_i_4_n_0 ),
        .I1(\staged_ftw[31]_i_3_n_0 ),
        .I2(command_word[29]),
        .I3(command_word[27]),
        .I4(command_word[28]),
        .O(\error_code[0]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT5 #(
    .INIT(32'hFFFFFFE0)) 
    \error_code[0]_i_4 
       (.I0(command_word[2]),
        .I1(command_word[1]),
        .I2(command_word[3]),
        .I3(command_word[4]),
        .I4(command_word[28]),
        .O(\error_code[0]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    \error_code[1]_i_3 
       (.I0(\error_code[2]_i_6_n_0 ),
        .I1(command_word[27]),
        .I2(command_word[4]),
        .I3(command_word[0]),
        .I4(\error_code[1]_i_5_n_0 ),
        .I5(\staged_ftw[31]_i_3_n_0 ),
        .O(\error_code[1]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT5 #(
    .INIT(32'h40004040)) 
    \error_code[1]_i_4 
       (.I0(\FSM_onehot_state_reg_n_0_[2] ),
        .I1(command_word[28]),
        .I2(command_word[29]),
        .I3(command_word[30]),
        .I4(command_word[27]),
        .O(\error_code[1]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \error_code[1]_i_5 
       (.I0(command_word[1]),
        .I1(command_word[2]),
        .I2(p_0_in1_in),
        .I3(command_word[3]),
        .O(\error_code[1]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \error_code[2]_i_10 
       (.I0(\staged_gain_reg_n_0_[1] ),
        .I1(\staged_gain_reg_n_0_[0] ),
        .I2(\staged_gain_reg_n_0_[2] ),
        .I3(\staged_gain_reg_n_0_[5] ),
        .O(\error_code[2]_i_10_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \error_code[2]_i_11 
       (.I0(\staged_gain_reg_n_0_[3] ),
        .I1(\staged_gain_reg_n_0_[8] ),
        .I2(\staged_gain_reg_n_0_[9] ),
        .I3(\staged_gain_reg_n_0_[10] ),
        .O(\error_code[2]_i_11_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \error_code[2]_i_12 
       (.I0(command_word[2]),
        .I1(command_word[1]),
        .O(\error_code[2]_i_12_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \error_code[2]_i_13 
       (.I0(command_word[11]),
        .I1(command_word[15]),
        .I2(command_word[8]),
        .I3(command_word[23]),
        .O(\error_code[2]_i_13_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \error_code[2]_i_14 
       (.I0(command_word[9]),
        .I1(command_word[10]),
        .I2(command_word[20]),
        .I3(p_0_in1_in),
        .I4(command_word[14]),
        .I5(command_word[13]),
        .O(\error_code[2]_i_14_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \error_code[2]_i_4 
       (.I0(command_word[28]),
        .I1(command_word[29]),
        .O(\error_code[2]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \error_code[2]_i_5 
       (.I0(\error_code[2]_i_7_n_0 ),
        .I1(command_word[26]),
        .I2(command_word[24]),
        .I3(command_word[25]),
        .I4(\error_code[2]_i_8_n_0 ),
        .I5(\error_code[2]_i_9_n_0 ),
        .O(\error_code[2]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h5555555555555557)) 
    \error_code[2]_i_6 
       (.I0(\staged_gain_reg_n_0_[11] ),
        .I1(\staged_gain_reg_n_0_[6] ),
        .I2(\staged_gain_reg_n_0_[7] ),
        .I3(\staged_gain_reg_n_0_[4] ),
        .I4(\error_code[2]_i_10_n_0 ),
        .I5(\error_code[2]_i_11_n_0 ),
        .O(\error_code[2]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \error_code[2]_i_7 
       (.I0(command_word[17]),
        .I1(command_word[6]),
        .I2(command_word[18]),
        .I3(command_word[5]),
        .I4(\error_code[2]_i_12_n_0 ),
        .I5(\staged_ftw[31]_i_8_n_0 ),
        .O(\error_code[2]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \error_code[2]_i_8 
       (.I0(command_word[16]),
        .I1(command_word[19]),
        .I2(command_word[3]),
        .I3(command_word[12]),
        .O(\error_code[2]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \error_code[2]_i_9 
       (.I0(command_word[7]),
        .I1(command_word[0]),
        .I2(command_word[4]),
        .I3(\error_code[2]_i_13_n_0 ),
        .I4(\error_code[2]_i_14_n_0 ),
        .O(\error_code[2]_i_9_n_0 ));
  FDCE \error_code_reg[0] 
       (.C(control_clk),
        .CE(1'b1),
        .CLR(sample_resetn_0),
        .D(confirmation_mailbox_n_49),
        .Q(\^status_word [17]));
  FDCE \error_code_reg[1] 
       (.C(control_clk),
        .CE(1'b1),
        .CLR(sample_resetn_0),
        .D(confirmation_mailbox_n_48),
        .Q(\^status_word [18]));
  FDCE \error_code_reg[2] 
       (.C(control_clk),
        .CE(1'b1),
        .CLR(sample_resetn_0),
        .D(confirmation_mailbox_n_47),
        .Q(\^status_word [19]));
  FDCE interface_initialized_reg
       (.C(control_clk),
        .CE(1'b1),
        .CLR(sample_resetn_0),
        .D(1'b1),
        .Q(interface_initialized));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  OBUFT #(
    .IOSTANDARD("DEFAULT")) 
    \output_buffers[0].data_pad 
       (.I(generated_data[0]),
        .O(dac_data[0]),
        .T(pad_tristate[0]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  OBUFT #(
    .IOSTANDARD("DEFAULT")) 
    \output_buffers[10].data_pad 
       (.I(generated_data[10]),
        .O(dac_data[10]),
        .T(pad_tristate[10]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  OBUFT #(
    .IOSTANDARD("DEFAULT")) 
    \output_buffers[11].data_pad 
       (.I(generated_data[11]),
        .O(dac_data[11]),
        .T(pad_tristate[11]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  OBUFT #(
    .IOSTANDARD("DEFAULT")) 
    \output_buffers[1].data_pad 
       (.I(generated_data[1]),
        .O(dac_data[1]),
        .T(pad_tristate[1]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  OBUFT #(
    .IOSTANDARD("DEFAULT")) 
    \output_buffers[2].data_pad 
       (.I(generated_data[2]),
        .O(dac_data[2]),
        .T(pad_tristate[2]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  OBUFT #(
    .IOSTANDARD("DEFAULT")) 
    \output_buffers[3].data_pad 
       (.I(generated_data[3]),
        .O(dac_data[3]),
        .T(pad_tristate[3]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  OBUFT #(
    .IOSTANDARD("DEFAULT")) 
    \output_buffers[4].data_pad 
       (.I(generated_data[4]),
        .O(dac_data[4]),
        .T(pad_tristate[4]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  OBUFT #(
    .IOSTANDARD("DEFAULT")) 
    \output_buffers[5].data_pad 
       (.I(generated_data[5]),
        .O(dac_data[5]),
        .T(pad_tristate[5]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  OBUFT #(
    .IOSTANDARD("DEFAULT")) 
    \output_buffers[6].data_pad 
       (.I(generated_data[6]),
        .O(dac_data[6]),
        .T(pad_tristate[6]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  OBUFT #(
    .IOSTANDARD("DEFAULT")) 
    \output_buffers[7].data_pad 
       (.I(generated_data[7]),
        .O(dac_data[7]),
        .T(pad_tristate[7]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  OBUFT #(
    .IOSTANDARD("DEFAULT")) 
    \output_buffers[8].data_pad 
       (.I(generated_data[8]),
        .O(dac_data[8]),
        .T(pad_tristate[8]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  OBUFT #(
    .IOSTANDARD("DEFAULT")) 
    \output_buffers[9].data_pad 
       (.I(generated_data[9]),
        .O(dac_data[9]),
        .T(pad_tristate[9]));
  LUT2 #(
    .INIT(4'h8)) 
    pad_release_i_1
       (.I0(sample_initialized),
        .I1(permit_sync[1]),
        .O(pad_release0));
  FDCE pad_release_reg
       (.C(sample_clk),
        .CE(1'b1),
        .CLR(sample_resetn_0),
        .D(pad_release0),
        .Q(pad_release));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \pad_tristate[12]_i_1 
       (.I0(pad_release),
        .O(pad_tristate_reg0));
  LUT1 #(
    .INIT(2'h1)) 
    \pad_tristate[12]_i_2 
       (.I0(permit_sync[1]),
        .O(\pad_tristate[12]_i_2_n_0 ));
  (* DONT_TOUCH *) 
  (* IOB = "TRUE" *) 
  (* KEEP = "yes" *) 
  FDPE \pad_tristate_reg[0] 
       (.C(sample_clk),
        .CE(1'b1),
        .D(pad_tristate_reg0),
        .PRE(\pad_tristate[12]_i_2_n_0 ),
        .Q(pad_tristate[0]));
  (* DONT_TOUCH *) 
  (* IOB = "TRUE" *) 
  (* KEEP = "yes" *) 
  FDPE \pad_tristate_reg[10] 
       (.C(sample_clk),
        .CE(1'b1),
        .D(pad_tristate_reg0),
        .PRE(\pad_tristate[12]_i_2_n_0 ),
        .Q(pad_tristate[10]));
  (* DONT_TOUCH *) 
  (* IOB = "TRUE" *) 
  (* KEEP = "yes" *) 
  FDPE \pad_tristate_reg[11] 
       (.C(sample_clk),
        .CE(1'b1),
        .D(pad_tristate_reg0),
        .PRE(\pad_tristate[12]_i_2_n_0 ),
        .Q(pad_tristate[11]));
  (* DONT_TOUCH *) 
  (* IOB = "TRUE" *) 
  (* KEEP = "yes" *) 
  FDPE \pad_tristate_reg[12] 
       (.C(sample_clk),
        .CE(1'b1),
        .D(pad_tristate_reg0),
        .PRE(\pad_tristate[12]_i_2_n_0 ),
        .Q(pad_tristate[12]));
  (* DONT_TOUCH *) 
  (* IOB = "TRUE" *) 
  (* KEEP = "yes" *) 
  FDPE \pad_tristate_reg[1] 
       (.C(sample_clk),
        .CE(1'b1),
        .D(pad_tristate_reg0),
        .PRE(\pad_tristate[12]_i_2_n_0 ),
        .Q(pad_tristate[1]));
  (* DONT_TOUCH *) 
  (* IOB = "TRUE" *) 
  (* KEEP = "yes" *) 
  FDPE \pad_tristate_reg[2] 
       (.C(sample_clk),
        .CE(1'b1),
        .D(pad_tristate_reg0),
        .PRE(\pad_tristate[12]_i_2_n_0 ),
        .Q(pad_tristate[2]));
  (* DONT_TOUCH *) 
  (* IOB = "TRUE" *) 
  (* KEEP = "yes" *) 
  FDPE \pad_tristate_reg[3] 
       (.C(sample_clk),
        .CE(1'b1),
        .D(pad_tristate_reg0),
        .PRE(\pad_tristate[12]_i_2_n_0 ),
        .Q(pad_tristate[3]));
  (* DONT_TOUCH *) 
  (* IOB = "TRUE" *) 
  (* KEEP = "yes" *) 
  FDPE \pad_tristate_reg[4] 
       (.C(sample_clk),
        .CE(1'b1),
        .D(pad_tristate_reg0),
        .PRE(\pad_tristate[12]_i_2_n_0 ),
        .Q(pad_tristate[4]));
  (* DONT_TOUCH *) 
  (* IOB = "TRUE" *) 
  (* KEEP = "yes" *) 
  FDPE \pad_tristate_reg[5] 
       (.C(sample_clk),
        .CE(1'b1),
        .D(pad_tristate_reg0),
        .PRE(\pad_tristate[12]_i_2_n_0 ),
        .Q(pad_tristate[5]));
  (* DONT_TOUCH *) 
  (* IOB = "TRUE" *) 
  (* KEEP = "yes" *) 
  FDPE \pad_tristate_reg[6] 
       (.C(sample_clk),
        .CE(1'b1),
        .D(pad_tristate_reg0),
        .PRE(\pad_tristate[12]_i_2_n_0 ),
        .Q(pad_tristate[6]));
  (* DONT_TOUCH *) 
  (* IOB = "TRUE" *) 
  (* KEEP = "yes" *) 
  FDPE \pad_tristate_reg[7] 
       (.C(sample_clk),
        .CE(1'b1),
        .D(pad_tristate_reg0),
        .PRE(\pad_tristate[12]_i_2_n_0 ),
        .Q(pad_tristate[7]));
  (* DONT_TOUCH *) 
  (* IOB = "TRUE" *) 
  (* KEEP = "yes" *) 
  FDPE \pad_tristate_reg[8] 
       (.C(sample_clk),
        .CE(1'b1),
        .D(pad_tristate_reg0),
        .PRE(\pad_tristate[12]_i_2_n_0 ),
        .Q(pad_tristate[8]));
  (* DONT_TOUCH *) 
  (* IOB = "TRUE" *) 
  (* KEEP = "yes" *) 
  FDPE \pad_tristate_reg[9] 
       (.C(sample_clk),
        .CE(1'b1),
        .D(pad_tristate_reg0),
        .PRE(\pad_tristate[12]_i_2_n_0 ),
        .Q(pad_tristate[9]));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \parked_sync[0]_i_1 
       (.I0(pad_release),
        .I1(clock_run),
        .O(p_3_out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "no" *) 
  FDCE \parked_sync_reg[0] 
       (.C(control_clk),
        .CE(1'b1),
        .CLR(sample_resetn_0),
        .D(p_3_out),
        .Q(parked_sync[0]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "no" *) 
  FDCE \parked_sync_reg[1] 
       (.C(control_clk),
        .CE(1'b1),
        .CLR(sample_resetn_0),
        .D(parked_sync[0]),
        .Q(parked_sync[1]));
  FDCE pending_request_reg
       (.C(control_clk),
        .CE(1'b1),
        .CLR(sample_resetn_0),
        .D(configuration_mailbox_n_133),
        .Q(pending_request_reg_n_0));
  LUT2 #(
    .INIT(4'hB)) 
    permit_seen_low_i_1
       (.I0(permit_seen_low),
        .I1(command_word[30]),
        .O(permit_seen_low_i_1_n_0));
  FDCE permit_seen_low_reg
       (.C(control_clk),
        .CE(1'b1),
        .CLR(sample_resetn_0),
        .D(permit_seen_low_i_1_n_0),
        .Q(permit_seen_low));
  LUT3 #(
    .INIT(8'hBF)) 
    \permit_sync[1]_i_1 
       (.I0(sample_resetn_0),
        .I1(permit_seen_low),
        .I2(command_word[30]),
        .O(\permit_sync[1]_i_1_n_0 ));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "no" *) 
  FDCE \permit_sync_reg[0] 
       (.C(sample_clk),
        .CE(1'b1),
        .CLR(\permit_sync[1]_i_1_n_0 ),
        .D(1'b1),
        .Q(permit_sync[0]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "no" *) 
  FDCE \permit_sync_reg[1] 
       (.C(sample_clk),
        .CE(1'b1),
        .CLR(\permit_sync[1]_i_1_n_0 ),
        .D(permit_sync[0]),
        .Q(permit_sync[1]));
  LUT4 #(
    .INIT(16'h0010)) 
    \query[3]_i_1 
       (.I0(command_word[27]),
        .I1(command_word[29]),
        .I2(\staged_ftw[31]_i_4_n_0 ),
        .I3(\query[3]_i_2_n_0 ),
        .O(\query[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFEFFFEFFFEFEFE)) 
    \query[3]_i_2 
       (.I0(\staged_ftw[31]_i_3_n_0 ),
        .I1(command_word[28]),
        .I2(command_word[4]),
        .I3(command_word[3]),
        .I4(command_word[1]),
        .I5(command_word[2]),
        .O(\query[3]_i_2_n_0 ));
  FDCE \query_reg[0] 
       (.C(control_clk),
        .CE(\query[3]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(command_word[0]),
        .Q(query__0[0]));
  FDCE \query_reg[1] 
       (.C(control_clk),
        .CE(\query[3]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(command_word[1]),
        .Q(query__0[1]));
  FDCE \query_reg[2] 
       (.C(control_clk),
        .CE(\query[3]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(command_word[2]),
        .Q(query__0[2]));
  FDCE \query_reg[3] 
       (.C(control_clk),
        .CE(\query[3]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(command_word[3]),
        .Q(query__0[3]));
  CARRY4 reference_valid0_carry
       (.CI(1'b0),
        .CO({reference_valid0_carry_n_0,reference_valid0_carry_n_1,reference_valid0_carry_n_2,reference_valid0_carry_n_3}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_reference_valid0_carry_O_UNCONNECTED[3:0]),
        .S({waveform_n_84,waveform_n_85,waveform_n_86,waveform_n_87}));
  CARRY4 reference_valid0_carry__0
       (.CI(reference_valid0_carry_n_0),
        .CO({reference_valid0_carry__0_n_0,reference_valid0_carry__0_n_1,reference_valid0_carry__0_n_2,reference_valid0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_reference_valid0_carry__0_O_UNCONNECTED[3:0]),
        .S({waveform_n_88,waveform_n_89,waveform_n_90,waveform_n_91}));
  CARRY4 reference_valid0_carry__1
       (.CI(reference_valid0_carry__0_n_0),
        .CO({NLW_reference_valid0_carry__1_CO_UNCONNECTED[3],reference_valid0,reference_valid0_carry__1_n_2,reference_valid0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_reference_valid0_carry__1_O_UNCONNECTED[3:0]),
        .S({1'b0,waveform_n_92,waveform_n_93,waveform_n_94}));
  FDCE \reply_data_reg[0] 
       (.C(sample_clk),
        .CE(reply_pending),
        .CLR(sample_resetn_0),
        .D(sample_active),
        .Q(\reply_data_reg_n_0_[0] ));
  FDCE \reply_data_reg[10] 
       (.C(sample_clk),
        .CE(reply_pending),
        .CLR(sample_resetn_0),
        .D(sample_tag_pending[8]),
        .Q(\reply_data_reg_n_0_[10] ));
  FDCE \reply_data_reg[11] 
       (.C(sample_clk),
        .CE(reply_pending),
        .CLR(sample_resetn_0),
        .D(sample_tag_pending[9]),
        .Q(\reply_data_reg_n_0_[11] ));
  FDCE \reply_data_reg[12] 
       (.C(sample_clk),
        .CE(reply_pending),
        .CLR(sample_resetn_0),
        .D(sample_tag_pending[10]),
        .Q(\reply_data_reg_n_0_[12] ));
  FDCE \reply_data_reg[13] 
       (.C(sample_clk),
        .CE(reply_pending),
        .CLR(sample_resetn_0),
        .D(sample_tag_pending[11]),
        .Q(\reply_data_reg_n_0_[13] ));
  FDCE \reply_data_reg[14] 
       (.C(sample_clk),
        .CE(reply_pending),
        .CLR(sample_resetn_0),
        .D(sample_tag_pending[12]),
        .Q(\reply_data_reg_n_0_[14] ));
  FDCE \reply_data_reg[15] 
       (.C(sample_clk),
        .CE(reply_pending),
        .CLR(sample_resetn_0),
        .D(sample_tag_pending[13]),
        .Q(\reply_data_reg_n_0_[15] ));
  FDCE \reply_data_reg[16] 
       (.C(sample_clk),
        .CE(reply_pending),
        .CLR(sample_resetn_0),
        .D(sample_tag_pending[14]),
        .Q(\reply_data_reg_n_0_[16] ));
  FDCE \reply_data_reg[17] 
       (.C(sample_clk),
        .CE(reply_pending),
        .CLR(sample_resetn_0),
        .D(sample_tag_pending[15]),
        .Q(\reply_data_reg_n_0_[17] ));
  FDCE \reply_data_reg[18] 
       (.C(sample_clk),
        .CE(reply_pending),
        .CLR(sample_resetn_0),
        .D(sample_tag_pending[16]),
        .Q(\reply_data_reg_n_0_[18] ));
  FDCE \reply_data_reg[19] 
       (.C(sample_clk),
        .CE(reply_pending),
        .CLR(sample_resetn_0),
        .D(sample_tag_pending[17]),
        .Q(\reply_data_reg_n_0_[19] ));
  FDCE \reply_data_reg[1] 
       (.C(sample_clk),
        .CE(reply_pending),
        .CLR(sample_resetn_0),
        .D(cfg_rejected),
        .Q(\reply_data_reg_n_0_[1] ));
  FDCE \reply_data_reg[20] 
       (.C(sample_clk),
        .CE(reply_pending),
        .CLR(sample_resetn_0),
        .D(sample_tag_pending[18]),
        .Q(\reply_data_reg_n_0_[20] ));
  FDCE \reply_data_reg[21] 
       (.C(sample_clk),
        .CE(reply_pending),
        .CLR(sample_resetn_0),
        .D(sample_tag_pending[19]),
        .Q(\reply_data_reg_n_0_[21] ));
  FDCE \reply_data_reg[22] 
       (.C(sample_clk),
        .CE(reply_pending),
        .CLR(sample_resetn_0),
        .D(sample_tag_pending[20]),
        .Q(\reply_data_reg_n_0_[22] ));
  FDCE \reply_data_reg[23] 
       (.C(sample_clk),
        .CE(reply_pending),
        .CLR(sample_resetn_0),
        .D(sample_tag_pending[21]),
        .Q(\reply_data_reg_n_0_[23] ));
  FDCE \reply_data_reg[24] 
       (.C(sample_clk),
        .CE(reply_pending),
        .CLR(sample_resetn_0),
        .D(sample_tag_pending[22]),
        .Q(\reply_data_reg_n_0_[24] ));
  FDCE \reply_data_reg[25] 
       (.C(sample_clk),
        .CE(reply_pending),
        .CLR(sample_resetn_0),
        .D(sample_tag_pending[23]),
        .Q(\reply_data_reg_n_0_[25] ));
  FDCE \reply_data_reg[26] 
       (.C(sample_clk),
        .CE(reply_pending),
        .CLR(sample_resetn_0),
        .D(sample_tag_pending[24]),
        .Q(\reply_data_reg_n_0_[26] ));
  FDCE \reply_data_reg[27] 
       (.C(sample_clk),
        .CE(reply_pending),
        .CLR(sample_resetn_0),
        .D(sample_tag_pending[25]),
        .Q(\reply_data_reg_n_0_[27] ));
  FDCE \reply_data_reg[28] 
       (.C(sample_clk),
        .CE(reply_pending),
        .CLR(sample_resetn_0),
        .D(sample_tag_pending[26]),
        .Q(\reply_data_reg_n_0_[28] ));
  FDCE \reply_data_reg[29] 
       (.C(sample_clk),
        .CE(reply_pending),
        .CLR(sample_resetn_0),
        .D(sample_tag_pending[27]),
        .Q(\reply_data_reg_n_0_[29] ));
  FDCE \reply_data_reg[2] 
       (.C(sample_clk),
        .CE(reply_pending),
        .CLR(sample_resetn_0),
        .D(sample_tag_pending[0]),
        .Q(\reply_data_reg_n_0_[2] ));
  FDCE \reply_data_reg[30] 
       (.C(sample_clk),
        .CE(reply_pending),
        .CLR(sample_resetn_0),
        .D(sample_tag_pending[28]),
        .Q(\reply_data_reg_n_0_[30] ));
  FDCE \reply_data_reg[31] 
       (.C(sample_clk),
        .CE(reply_pending),
        .CLR(sample_resetn_0),
        .D(sample_tag_pending[29]),
        .Q(\reply_data_reg_n_0_[31] ));
  FDCE \reply_data_reg[32] 
       (.C(sample_clk),
        .CE(reply_pending),
        .CLR(sample_resetn_0),
        .D(sample_tag_pending[30]),
        .Q(\reply_data_reg_n_0_[32] ));
  FDCE \reply_data_reg[33] 
       (.C(sample_clk),
        .CE(reply_pending),
        .CLR(sample_resetn_0),
        .D(sample_tag_pending[31]),
        .Q(\reply_data_reg_n_0_[33] ));
  FDCE \reply_data_reg[3] 
       (.C(sample_clk),
        .CE(reply_pending),
        .CLR(sample_resetn_0),
        .D(sample_tag_pending[1]),
        .Q(\reply_data_reg_n_0_[3] ));
  FDCE \reply_data_reg[4] 
       (.C(sample_clk),
        .CE(reply_pending),
        .CLR(sample_resetn_0),
        .D(sample_tag_pending[2]),
        .Q(\reply_data_reg_n_0_[4] ));
  FDCE \reply_data_reg[5] 
       (.C(sample_clk),
        .CE(reply_pending),
        .CLR(sample_resetn_0),
        .D(sample_tag_pending[3]),
        .Q(\reply_data_reg_n_0_[5] ));
  FDCE \reply_data_reg[6] 
       (.C(sample_clk),
        .CE(reply_pending),
        .CLR(sample_resetn_0),
        .D(sample_tag_pending[4]),
        .Q(\reply_data_reg_n_0_[6] ));
  FDCE \reply_data_reg[7] 
       (.C(sample_clk),
        .CE(reply_pending),
        .CLR(sample_resetn_0),
        .D(sample_tag_pending[5]),
        .Q(\reply_data_reg_n_0_[7] ));
  FDCE \reply_data_reg[8] 
       (.C(sample_clk),
        .CE(reply_pending),
        .CLR(sample_resetn_0),
        .D(sample_tag_pending[6]),
        .Q(\reply_data_reg_n_0_[8] ));
  FDCE \reply_data_reg[9] 
       (.C(sample_clk),
        .CE(reply_pending),
        .CLR(sample_resetn_0),
        .D(sample_tag_pending[7]),
        .Q(\reply_data_reg_n_0_[9] ));
  FDCE reply_pending_reg
       (.C(sample_clk),
        .CE(1'b1),
        .CLR(sample_resetn_0),
        .D(confirmation_mailbox_n_46),
        .Q(reply_pending_reg_n_0));
  FDCE sample_initialized_reg
       (.C(sample_clk),
        .CE(1'b1),
        .CLR(sample_resetn_0),
        .D(waveform_n_97),
        .Q(sample_initialized));
  CARRY4 sample_pending1_carry
       (.CI(1'b0),
        .CO({sample_pending1_carry_n_0,sample_pending1_carry_n_1,sample_pending1_carry_n_2,sample_pending1_carry_n_3}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_sample_pending1_carry_O_UNCONNECTED[3:0]),
        .S({waveform_n_41,waveform_n_42,waveform_n_43,waveform_n_44}));
  CARRY4 sample_pending1_carry__0
       (.CI(sample_pending1_carry_n_0),
        .CO({sample_pending1_carry__0_n_0,sample_pending1_carry__0_n_1,sample_pending1_carry__0_n_2,sample_pending1_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_sample_pending1_carry__0_O_UNCONNECTED[3:0]),
        .S({waveform_n_77,waveform_n_78,waveform_n_79,waveform_n_80}));
  CARRY4 sample_pending1_carry__1
       (.CI(sample_pending1_carry__0_n_0),
        .CO({NLW_sample_pending1_carry__1_CO_UNCONNECTED[3],sample_pending1,sample_pending1_carry__1_n_2,sample_pending1_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_sample_pending1_carry__1_O_UNCONNECTED[3:0]),
        .S({1'b0,waveform_n_81,waveform_n_82,waveform_n_83}));
  FDCE sample_pending_reg
       (.C(sample_clk),
        .CE(1'b1),
        .CLR(sample_resetn_0),
        .D(configuration_mailbox_n_134),
        .Q(sample_pending));
  FDCE \sample_tag_pending_reg[0] 
       (.C(sample_clk),
        .CE(cfg_valid0),
        .CLR(sample_resetn_0),
        .D(config_data[91]),
        .Q(sample_tag_pending[0]));
  FDCE \sample_tag_pending_reg[10] 
       (.C(sample_clk),
        .CE(cfg_valid0),
        .CLR(sample_resetn_0),
        .D(config_data[101]),
        .Q(sample_tag_pending[10]));
  FDCE \sample_tag_pending_reg[11] 
       (.C(sample_clk),
        .CE(cfg_valid0),
        .CLR(sample_resetn_0),
        .D(config_data[102]),
        .Q(sample_tag_pending[11]));
  FDCE \sample_tag_pending_reg[12] 
       (.C(sample_clk),
        .CE(cfg_valid0),
        .CLR(sample_resetn_0),
        .D(config_data[103]),
        .Q(sample_tag_pending[12]));
  FDCE \sample_tag_pending_reg[13] 
       (.C(sample_clk),
        .CE(cfg_valid0),
        .CLR(sample_resetn_0),
        .D(config_data[104]),
        .Q(sample_tag_pending[13]));
  FDCE \sample_tag_pending_reg[14] 
       (.C(sample_clk),
        .CE(cfg_valid0),
        .CLR(sample_resetn_0),
        .D(config_data[105]),
        .Q(sample_tag_pending[14]));
  FDCE \sample_tag_pending_reg[15] 
       (.C(sample_clk),
        .CE(cfg_valid0),
        .CLR(sample_resetn_0),
        .D(config_data[106]),
        .Q(sample_tag_pending[15]));
  FDCE \sample_tag_pending_reg[16] 
       (.C(sample_clk),
        .CE(cfg_valid0),
        .CLR(sample_resetn_0),
        .D(config_data[107]),
        .Q(sample_tag_pending[16]));
  FDCE \sample_tag_pending_reg[17] 
       (.C(sample_clk),
        .CE(cfg_valid0),
        .CLR(sample_resetn_0),
        .D(config_data[108]),
        .Q(sample_tag_pending[17]));
  FDCE \sample_tag_pending_reg[18] 
       (.C(sample_clk),
        .CE(cfg_valid0),
        .CLR(sample_resetn_0),
        .D(config_data[109]),
        .Q(sample_tag_pending[18]));
  FDCE \sample_tag_pending_reg[19] 
       (.C(sample_clk),
        .CE(cfg_valid0),
        .CLR(sample_resetn_0),
        .D(config_data[110]),
        .Q(sample_tag_pending[19]));
  FDCE \sample_tag_pending_reg[1] 
       (.C(sample_clk),
        .CE(cfg_valid0),
        .CLR(sample_resetn_0),
        .D(config_data[92]),
        .Q(sample_tag_pending[1]));
  FDCE \sample_tag_pending_reg[20] 
       (.C(sample_clk),
        .CE(cfg_valid0),
        .CLR(sample_resetn_0),
        .D(config_data[111]),
        .Q(sample_tag_pending[20]));
  FDCE \sample_tag_pending_reg[21] 
       (.C(sample_clk),
        .CE(cfg_valid0),
        .CLR(sample_resetn_0),
        .D(config_data[112]),
        .Q(sample_tag_pending[21]));
  FDCE \sample_tag_pending_reg[22] 
       (.C(sample_clk),
        .CE(cfg_valid0),
        .CLR(sample_resetn_0),
        .D(config_data[113]),
        .Q(sample_tag_pending[22]));
  FDCE \sample_tag_pending_reg[23] 
       (.C(sample_clk),
        .CE(cfg_valid0),
        .CLR(sample_resetn_0),
        .D(config_data[114]),
        .Q(sample_tag_pending[23]));
  FDCE \sample_tag_pending_reg[24] 
       (.C(sample_clk),
        .CE(cfg_valid0),
        .CLR(sample_resetn_0),
        .D(config_data[115]),
        .Q(sample_tag_pending[24]));
  FDCE \sample_tag_pending_reg[25] 
       (.C(sample_clk),
        .CE(cfg_valid0),
        .CLR(sample_resetn_0),
        .D(config_data[116]),
        .Q(sample_tag_pending[25]));
  FDCE \sample_tag_pending_reg[26] 
       (.C(sample_clk),
        .CE(cfg_valid0),
        .CLR(sample_resetn_0),
        .D(config_data[117]),
        .Q(sample_tag_pending[26]));
  FDCE \sample_tag_pending_reg[27] 
       (.C(sample_clk),
        .CE(cfg_valid0),
        .CLR(sample_resetn_0),
        .D(config_data[118]),
        .Q(sample_tag_pending[27]));
  FDCE \sample_tag_pending_reg[28] 
       (.C(sample_clk),
        .CE(cfg_valid0),
        .CLR(sample_resetn_0),
        .D(config_data[119]),
        .Q(sample_tag_pending[28]));
  FDCE \sample_tag_pending_reg[29] 
       (.C(sample_clk),
        .CE(cfg_valid0),
        .CLR(sample_resetn_0),
        .D(config_data[120]),
        .Q(sample_tag_pending[29]));
  FDCE \sample_tag_pending_reg[2] 
       (.C(sample_clk),
        .CE(cfg_valid0),
        .CLR(sample_resetn_0),
        .D(config_data[93]),
        .Q(sample_tag_pending[2]));
  FDCE \sample_tag_pending_reg[30] 
       (.C(sample_clk),
        .CE(cfg_valid0),
        .CLR(sample_resetn_0),
        .D(config_data[121]),
        .Q(sample_tag_pending[30]));
  FDCE \sample_tag_pending_reg[31] 
       (.C(sample_clk),
        .CE(cfg_valid0),
        .CLR(sample_resetn_0),
        .D(config_data[122]),
        .Q(sample_tag_pending[31]));
  FDCE \sample_tag_pending_reg[3] 
       (.C(sample_clk),
        .CE(cfg_valid0),
        .CLR(sample_resetn_0),
        .D(config_data[94]),
        .Q(sample_tag_pending[3]));
  FDCE \sample_tag_pending_reg[4] 
       (.C(sample_clk),
        .CE(cfg_valid0),
        .CLR(sample_resetn_0),
        .D(config_data[95]),
        .Q(sample_tag_pending[4]));
  FDCE \sample_tag_pending_reg[5] 
       (.C(sample_clk),
        .CE(cfg_valid0),
        .CLR(sample_resetn_0),
        .D(config_data[96]),
        .Q(sample_tag_pending[5]));
  FDCE \sample_tag_pending_reg[6] 
       (.C(sample_clk),
        .CE(cfg_valid0),
        .CLR(sample_resetn_0),
        .D(config_data[97]),
        .Q(sample_tag_pending[6]));
  FDCE \sample_tag_pending_reg[7] 
       (.C(sample_clk),
        .CE(cfg_valid0),
        .CLR(sample_resetn_0),
        .D(config_data[98]),
        .Q(sample_tag_pending[7]));
  FDCE \sample_tag_pending_reg[8] 
       (.C(sample_clk),
        .CE(cfg_valid0),
        .CLR(sample_resetn_0),
        .D(config_data[99]),
        .Q(sample_tag_pending[8]));
  FDCE \sample_tag_pending_reg[9] 
       (.C(sample_clk),
        .CE(cfg_valid0),
        .CLR(sample_resetn_0),
        .D(config_data[100]),
        .Q(sample_tag_pending[9]));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT2 #(
    .INIT(4'h2)) 
    staged_enable_i_1
       (.I0(command_word[24]),
        .I1(command_word[28]),
        .O(staged_enable_i_1_n_0));
  FDCE staged_enable_reg
       (.C(control_clk),
        .CE(\staged_gain[11]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(staged_enable_i_1_n_0),
        .Q(staged_enable));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \staged_ftw[10]_i_1 
       (.I0(command_word[10]),
        .I1(command_word[29]),
        .O(p_1_in[10]));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \staged_ftw[11]_i_1 
       (.I0(command_word[11]),
        .I1(command_word[29]),
        .O(p_1_in[11]));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \staged_ftw[12]_i_1 
       (.I0(command_word[12]),
        .I1(command_word[29]),
        .O(p_1_in[12]));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \staged_ftw[13]_i_1 
       (.I0(command_word[13]),
        .I1(command_word[29]),
        .O(p_1_in[13]));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \staged_ftw[14]_i_1 
       (.I0(command_word[14]),
        .I1(command_word[29]),
        .O(p_1_in[14]));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \staged_ftw[15]_i_1 
       (.I0(command_word[15]),
        .I1(command_word[29]),
        .O(p_1_in[15]));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \staged_ftw[16]_i_1 
       (.I0(command_word[16]),
        .I1(command_word[29]),
        .O(p_1_in[16]));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \staged_ftw[17]_i_1 
       (.I0(command_word[17]),
        .I1(command_word[29]),
        .O(p_1_in[17]));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \staged_ftw[18]_i_1 
       (.I0(command_word[18]),
        .I1(command_word[29]),
        .O(p_1_in[18]));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \staged_ftw[19]_i_1 
       (.I0(command_word[19]),
        .I1(command_word[29]),
        .O(p_1_in[19]));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \staged_ftw[20]_i_1 
       (.I0(command_word[20]),
        .I1(command_word[29]),
        .O(p_1_in[20]));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \staged_ftw[21]_i_1 
       (.I0(command_word[21]),
        .I1(command_word[29]),
        .O(p_1_in[21]));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \staged_ftw[22]_i_1 
       (.I0(command_word[22]),
        .I1(command_word[29]),
        .O(p_1_in[22]));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \staged_ftw[23]_i_1 
       (.I0(command_word[23]),
        .I1(command_word[29]),
        .O(p_1_in[23]));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \staged_ftw[24]_i_1 
       (.I0(command_word[24]),
        .I1(command_word[29]),
        .O(p_1_in[24]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \staged_ftw[25]_i_1 
       (.I0(command_word[25]),
        .I1(command_word[29]),
        .O(p_1_in[25]));
  LUT6 #(
    .INIT(64'h0800000000008800)) 
    \staged_ftw[26]_i_1 
       (.I0(command_word[27]),
        .I1(interface_initialized),
        .I2(command_word[30]),
        .I3(acknowledged_i_5_n_0),
        .I4(command_word[29]),
        .I5(command_word[28]),
        .O(\staged_ftw[26]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \staged_ftw[26]_i_2 
       (.I0(command_word[26]),
        .I1(command_word[29]),
        .O(p_1_in[26]));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \staged_ftw[27]_i_1 
       (.I0(command_word[0]),
        .I1(command_word[29]),
        .O(p_1_in[27]));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \staged_ftw[28]_i_1 
       (.I0(command_word[1]),
        .I1(command_word[29]),
        .O(p_1_in[28]));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \staged_ftw[29]_i_1 
       (.I0(command_word[2]),
        .I1(command_word[29]),
        .O(p_1_in[29]));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \staged_ftw[30]_i_1 
       (.I0(command_word[3]),
        .I1(command_word[29]),
        .O(p_1_in[30]));
  LUT6 #(
    .INIT(64'h00000040C0000040)) 
    \staged_ftw[31]_i_1 
       (.I0(\staged_ftw[31]_i_3_n_0 ),
        .I1(command_word[28]),
        .I2(\staged_ftw[31]_i_4_n_0 ),
        .I3(command_word[29]),
        .I4(command_word[27]),
        .I5(command_word[30]),
        .O(\staged_ftw[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \staged_ftw[31]_i_2 
       (.I0(command_word[4]),
        .I1(command_word[29]),
        .O(p_1_in[31]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFEF)) 
    \staged_ftw[31]_i_3 
       (.I0(\staged_ftw[31]_i_5_n_0 ),
        .I1(\staged_ftw[31]_i_6_n_0 ),
        .I2(\staged_ftw[31]_i_7_n_0 ),
        .I3(command_word[20]),
        .I4(command_word[19]),
        .I5(\staged_ftw[31]_i_8_n_0 ),
        .O(\staged_ftw[31]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT5 #(
    .INIT(32'h01100000)) 
    \staged_ftw[31]_i_4 
       (.I0(\FSM_onehot_state_reg_n_0_[1] ),
        .I1(\FSM_onehot_state_reg_n_0_[2] ),
        .I2(command_word[31]),
        .I3(\^status_word [26]),
        .I4(interface_initialized),
        .O(\staged_ftw[31]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \staged_ftw[31]_i_5 
       (.I0(command_word[8]),
        .I1(command_word[7]),
        .I2(command_word[10]),
        .I3(command_word[9]),
        .I4(command_word[5]),
        .I5(command_word[6]),
        .O(\staged_ftw[31]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \staged_ftw[31]_i_6 
       (.I0(command_word[16]),
        .I1(command_word[15]),
        .I2(command_word[18]),
        .I3(command_word[17]),
        .I4(\staged_ftw[31]_i_9_n_0 ),
        .O(\staged_ftw[31]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \staged_ftw[31]_i_7 
       (.I0(command_word[25]),
        .I1(command_word[26]),
        .I2(command_word[23]),
        .I3(command_word[24]),
        .O(\staged_ftw[31]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \staged_ftw[31]_i_8 
       (.I0(command_word[22]),
        .I1(command_word[21]),
        .O(\staged_ftw[31]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \staged_ftw[31]_i_9 
       (.I0(command_word[13]),
        .I1(command_word[14]),
        .I2(command_word[11]),
        .I3(command_word[12]),
        .O(\staged_ftw[31]_i_9_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \staged_ftw[5]_i_1 
       (.I0(command_word[5]),
        .I1(command_word[29]),
        .O(p_1_in[5]));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \staged_ftw[6]_i_1 
       (.I0(command_word[6]),
        .I1(command_word[29]),
        .O(p_1_in[6]));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \staged_ftw[7]_i_1 
       (.I0(command_word[7]),
        .I1(command_word[29]),
        .O(p_1_in[7]));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \staged_ftw[8]_i_1 
       (.I0(command_word[8]),
        .I1(command_word[29]),
        .O(p_1_in[8]));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \staged_ftw[9]_i_1 
       (.I0(command_word[9]),
        .I1(command_word[29]),
        .O(p_1_in[9]));
  FDCE \staged_ftw_reg[0] 
       (.C(control_clk),
        .CE(\staged_ftw[26]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[27]),
        .Q(\staged_ftw_reg_n_0_[0] ));
  FDCE \staged_ftw_reg[10] 
       (.C(control_clk),
        .CE(\staged_ftw[26]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[10]),
        .Q(\staged_ftw_reg_n_0_[10] ));
  FDCE \staged_ftw_reg[11] 
       (.C(control_clk),
        .CE(\staged_ftw[26]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[11]),
        .Q(\staged_ftw_reg_n_0_[11] ));
  FDCE \staged_ftw_reg[12] 
       (.C(control_clk),
        .CE(\staged_ftw[26]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[12]),
        .Q(\staged_ftw_reg_n_0_[12] ));
  FDCE \staged_ftw_reg[13] 
       (.C(control_clk),
        .CE(\staged_ftw[26]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[13]),
        .Q(\staged_ftw_reg_n_0_[13] ));
  FDCE \staged_ftw_reg[14] 
       (.C(control_clk),
        .CE(\staged_ftw[26]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[14]),
        .Q(\staged_ftw_reg_n_0_[14] ));
  FDCE \staged_ftw_reg[15] 
       (.C(control_clk),
        .CE(\staged_ftw[26]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[15]),
        .Q(\staged_ftw_reg_n_0_[15] ));
  FDCE \staged_ftw_reg[16] 
       (.C(control_clk),
        .CE(\staged_ftw[26]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[16]),
        .Q(\staged_ftw_reg_n_0_[16] ));
  FDCE \staged_ftw_reg[17] 
       (.C(control_clk),
        .CE(\staged_ftw[26]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[17]),
        .Q(\staged_ftw_reg_n_0_[17] ));
  FDCE \staged_ftw_reg[18] 
       (.C(control_clk),
        .CE(\staged_ftw[26]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[18]),
        .Q(\staged_ftw_reg_n_0_[18] ));
  FDCE \staged_ftw_reg[19] 
       (.C(control_clk),
        .CE(\staged_ftw[26]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[19]),
        .Q(\staged_ftw_reg_n_0_[19] ));
  FDCE \staged_ftw_reg[1] 
       (.C(control_clk),
        .CE(\staged_ftw[26]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[28]),
        .Q(\staged_ftw_reg_n_0_[1] ));
  FDCE \staged_ftw_reg[20] 
       (.C(control_clk),
        .CE(\staged_ftw[26]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[20]),
        .Q(\staged_ftw_reg_n_0_[20] ));
  FDCE \staged_ftw_reg[21] 
       (.C(control_clk),
        .CE(\staged_ftw[26]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[21]),
        .Q(\staged_ftw_reg_n_0_[21] ));
  FDCE \staged_ftw_reg[22] 
       (.C(control_clk),
        .CE(\staged_ftw[26]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[22]),
        .Q(\staged_ftw_reg_n_0_[22] ));
  FDCE \staged_ftw_reg[23] 
       (.C(control_clk),
        .CE(\staged_ftw[26]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[23]),
        .Q(\staged_ftw_reg_n_0_[23] ));
  FDCE \staged_ftw_reg[24] 
       (.C(control_clk),
        .CE(\staged_ftw[26]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[24]),
        .Q(\staged_ftw_reg_n_0_[24] ));
  FDCE \staged_ftw_reg[25] 
       (.C(control_clk),
        .CE(\staged_ftw[26]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[25]),
        .Q(\staged_ftw_reg_n_0_[25] ));
  FDCE \staged_ftw_reg[26] 
       (.C(control_clk),
        .CE(\staged_ftw[26]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[26]),
        .Q(\staged_ftw_reg_n_0_[26] ));
  FDCE \staged_ftw_reg[27] 
       (.C(control_clk),
        .CE(\staged_ftw[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[27]),
        .Q(\staged_ftw_reg_n_0_[27] ));
  FDCE \staged_ftw_reg[28] 
       (.C(control_clk),
        .CE(\staged_ftw[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[28]),
        .Q(\staged_ftw_reg_n_0_[28] ));
  FDCE \staged_ftw_reg[29] 
       (.C(control_clk),
        .CE(\staged_ftw[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[29]),
        .Q(\staged_ftw_reg_n_0_[29] ));
  FDCE \staged_ftw_reg[2] 
       (.C(control_clk),
        .CE(\staged_ftw[26]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[29]),
        .Q(\staged_ftw_reg_n_0_[2] ));
  FDCE \staged_ftw_reg[30] 
       (.C(control_clk),
        .CE(\staged_ftw[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[30]),
        .Q(\staged_ftw_reg_n_0_[30] ));
  FDCE \staged_ftw_reg[31] 
       (.C(control_clk),
        .CE(\staged_ftw[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[31]),
        .Q(p_0_in1_in));
  FDCE \staged_ftw_reg[3] 
       (.C(control_clk),
        .CE(\staged_ftw[26]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[30]),
        .Q(\staged_ftw_reg_n_0_[3] ));
  FDCE \staged_ftw_reg[4] 
       (.C(control_clk),
        .CE(\staged_ftw[26]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[31]),
        .Q(\staged_ftw_reg_n_0_[4] ));
  FDCE \staged_ftw_reg[5] 
       (.C(control_clk),
        .CE(\staged_ftw[26]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[5]),
        .Q(\staged_ftw_reg_n_0_[5] ));
  FDCE \staged_ftw_reg[6] 
       (.C(control_clk),
        .CE(\staged_ftw[26]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[6]),
        .Q(\staged_ftw_reg_n_0_[6] ));
  FDCE \staged_ftw_reg[7] 
       (.C(control_clk),
        .CE(\staged_ftw[26]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[7]),
        .Q(\staged_ftw_reg_n_0_[7] ));
  FDCE \staged_ftw_reg[8] 
       (.C(control_clk),
        .CE(\staged_ftw[26]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[8]),
        .Q(\staged_ftw_reg_n_0_[8] ));
  FDCE \staged_ftw_reg[9] 
       (.C(control_clk),
        .CE(\staged_ftw[26]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[9]),
        .Q(\staged_ftw_reg_n_0_[9] ));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \staged_gain[0]_i_1 
       (.I0(command_word[0]),
        .I1(command_word[28]),
        .O(\staged_gain[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \staged_gain[10]_i_1 
       (.I0(command_word[10]),
        .I1(command_word[28]),
        .O(\staged_gain[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0080808000000000)) 
    \staged_gain[11]_i_1 
       (.I0(command_word[29]),
        .I1(command_word[27]),
        .I2(interface_initialized),
        .I3(command_word[30]),
        .I4(command_word[28]),
        .I5(acknowledged_i_5_n_0),
        .O(\staged_gain[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \staged_gain[11]_i_2 
       (.I0(command_word[11]),
        .I1(command_word[28]),
        .O(\staged_gain[11]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \staged_gain[1]_i_1 
       (.I0(command_word[1]),
        .I1(command_word[28]),
        .O(\staged_gain[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \staged_gain[2]_i_1 
       (.I0(command_word[2]),
        .I1(command_word[28]),
        .O(\staged_gain[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \staged_gain[3]_i_1 
       (.I0(command_word[3]),
        .I1(command_word[28]),
        .O(\staged_gain[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \staged_gain[4]_i_1 
       (.I0(command_word[4]),
        .I1(command_word[28]),
        .O(\staged_gain[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \staged_gain[5]_i_1 
       (.I0(command_word[5]),
        .I1(command_word[28]),
        .O(\staged_gain[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \staged_gain[6]_i_1 
       (.I0(command_word[6]),
        .I1(command_word[28]),
        .O(\staged_gain[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \staged_gain[7]_i_1 
       (.I0(command_word[7]),
        .I1(command_word[28]),
        .O(\staged_gain[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \staged_gain[8]_i_1 
       (.I0(command_word[8]),
        .I1(command_word[28]),
        .O(\staged_gain[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \staged_gain[9]_i_1 
       (.I0(command_word[9]),
        .I1(command_word[28]),
        .O(\staged_gain[9]_i_1_n_0 ));
  FDCE \staged_gain_reg[0] 
       (.C(control_clk),
        .CE(\staged_gain[11]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(\staged_gain[0]_i_1_n_0 ),
        .Q(\staged_gain_reg_n_0_[0] ));
  FDCE \staged_gain_reg[10] 
       (.C(control_clk),
        .CE(\staged_gain[11]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(\staged_gain[10]_i_1_n_0 ),
        .Q(\staged_gain_reg_n_0_[10] ));
  FDCE \staged_gain_reg[11] 
       (.C(control_clk),
        .CE(\staged_gain[11]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(\staged_gain[11]_i_2_n_0 ),
        .Q(\staged_gain_reg_n_0_[11] ));
  FDCE \staged_gain_reg[1] 
       (.C(control_clk),
        .CE(\staged_gain[11]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(\staged_gain[1]_i_1_n_0 ),
        .Q(\staged_gain_reg_n_0_[1] ));
  FDCE \staged_gain_reg[2] 
       (.C(control_clk),
        .CE(\staged_gain[11]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(\staged_gain[2]_i_1_n_0 ),
        .Q(\staged_gain_reg_n_0_[2] ));
  FDCE \staged_gain_reg[3] 
       (.C(control_clk),
        .CE(\staged_gain[11]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(\staged_gain[3]_i_1_n_0 ),
        .Q(\staged_gain_reg_n_0_[3] ));
  FDCE \staged_gain_reg[4] 
       (.C(control_clk),
        .CE(\staged_gain[11]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(\staged_gain[4]_i_1_n_0 ),
        .Q(\staged_gain_reg_n_0_[4] ));
  FDCE \staged_gain_reg[5] 
       (.C(control_clk),
        .CE(\staged_gain[11]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(\staged_gain[5]_i_1_n_0 ),
        .Q(\staged_gain_reg_n_0_[5] ));
  FDCE \staged_gain_reg[6] 
       (.C(control_clk),
        .CE(\staged_gain[11]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(\staged_gain[6]_i_1_n_0 ),
        .Q(\staged_gain_reg_n_0_[6] ));
  FDCE \staged_gain_reg[7] 
       (.C(control_clk),
        .CE(\staged_gain[11]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(\staged_gain[7]_i_1_n_0 ),
        .Q(\staged_gain_reg_n_0_[7] ));
  FDCE \staged_gain_reg[8] 
       (.C(control_clk),
        .CE(\staged_gain[11]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(\staged_gain[8]_i_1_n_0 ),
        .Q(\staged_gain_reg_n_0_[8] ));
  FDCE \staged_gain_reg[9] 
       (.C(control_clk),
        .CE(\staged_gain[11]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(\staged_gain[9]_i_1_n_0 ),
        .Q(\staged_gain_reg_n_0_[9] ));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT2 #(
    .INIT(4'h2)) 
    staged_invert_i_1
       (.I0(command_word[25]),
        .I1(command_word[28]),
        .O(staged_invert_i_1_n_0));
  FDCE staged_invert_reg
       (.C(control_clk),
        .CE(\staged_gain[11]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(staged_invert_i_1_n_0),
        .Q(staged_invert));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \staged_offset[0]_i_1 
       (.I0(command_word[12]),
        .I1(command_word[28]),
        .O(\staged_offset[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \staged_offset[10]_i_1 
       (.I0(command_word[22]),
        .I1(command_word[28]),
        .O(\staged_offset[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \staged_offset[11]_i_1 
       (.I0(command_word[28]),
        .I1(command_word[23]),
        .O(\staged_offset[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \staged_offset[1]_i_1 
       (.I0(command_word[13]),
        .I1(command_word[28]),
        .O(\staged_offset[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \staged_offset[2]_i_1 
       (.I0(command_word[14]),
        .I1(command_word[28]),
        .O(\staged_offset[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \staged_offset[3]_i_1 
       (.I0(command_word[15]),
        .I1(command_word[28]),
        .O(\staged_offset[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \staged_offset[4]_i_1 
       (.I0(command_word[16]),
        .I1(command_word[28]),
        .O(\staged_offset[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \staged_offset[5]_i_1 
       (.I0(command_word[17]),
        .I1(command_word[28]),
        .O(\staged_offset[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \staged_offset[6]_i_1 
       (.I0(command_word[18]),
        .I1(command_word[28]),
        .O(\staged_offset[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \staged_offset[7]_i_1 
       (.I0(command_word[19]),
        .I1(command_word[28]),
        .O(\staged_offset[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \staged_offset[8]_i_1 
       (.I0(command_word[20]),
        .I1(command_word[28]),
        .O(\staged_offset[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \staged_offset[9]_i_1 
       (.I0(command_word[21]),
        .I1(command_word[28]),
        .O(\staged_offset[9]_i_1_n_0 ));
  FDCE \staged_offset_reg[0] 
       (.C(control_clk),
        .CE(\staged_gain[11]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(\staged_offset[0]_i_1_n_0 ),
        .Q(staged_offset__0[0]));
  FDCE \staged_offset_reg[10] 
       (.C(control_clk),
        .CE(\staged_gain[11]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(\staged_offset[10]_i_1_n_0 ),
        .Q(staged_offset__0[10]));
  FDPE \staged_offset_reg[11] 
       (.C(control_clk),
        .CE(\staged_gain[11]_i_1_n_0 ),
        .D(\staged_offset[11]_i_1_n_0 ),
        .PRE(sample_resetn_0),
        .Q(staged_offset__0[11]));
  FDCE \staged_offset_reg[1] 
       (.C(control_clk),
        .CE(\staged_gain[11]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(\staged_offset[1]_i_1_n_0 ),
        .Q(staged_offset__0[1]));
  FDCE \staged_offset_reg[2] 
       (.C(control_clk),
        .CE(\staged_gain[11]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(\staged_offset[2]_i_1_n_0 ),
        .Q(staged_offset__0[2]));
  FDCE \staged_offset_reg[3] 
       (.C(control_clk),
        .CE(\staged_gain[11]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(\staged_offset[3]_i_1_n_0 ),
        .Q(staged_offset__0[3]));
  FDCE \staged_offset_reg[4] 
       (.C(control_clk),
        .CE(\staged_gain[11]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(\staged_offset[4]_i_1_n_0 ),
        .Q(staged_offset__0[4]));
  FDCE \staged_offset_reg[5] 
       (.C(control_clk),
        .CE(\staged_gain[11]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(\staged_offset[5]_i_1_n_0 ),
        .Q(staged_offset__0[5]));
  FDCE \staged_offset_reg[6] 
       (.C(control_clk),
        .CE(\staged_gain[11]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(\staged_offset[6]_i_1_n_0 ),
        .Q(staged_offset__0[6]));
  FDCE \staged_offset_reg[7] 
       (.C(control_clk),
        .CE(\staged_gain[11]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(\staged_offset[7]_i_1_n_0 ),
        .Q(staged_offset__0[7]));
  FDCE \staged_offset_reg[8] 
       (.C(control_clk),
        .CE(\staged_gain[11]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(\staged_offset[8]_i_1_n_0 ),
        .Q(staged_offset__0[8]));
  FDCE \staged_offset_reg[9] 
       (.C(control_clk),
        .CE(\staged_gain[11]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(\staged_offset[9]_i_1_n_0 ),
        .Q(staged_offset__0[9]));
  LUT6 #(
    .INIT(64'h2A00000000000000)) 
    \staged_phase[26]_i_1 
       (.I0(acknowledged_i_5_n_0),
        .I1(command_word[29]),
        .I2(command_word[30]),
        .I3(command_word[28]),
        .I4(interface_initialized),
        .I5(command_word[27]),
        .O(\staged_phase[26]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00000200A0000200)) 
    \staged_phase[31]_i_1 
       (.I0(\staged_ftw[31]_i_4_n_0 ),
        .I1(\staged_ftw[31]_i_3_n_0 ),
        .I2(command_word[28]),
        .I3(command_word[29]),
        .I4(command_word[27]),
        .I5(command_word[30]),
        .O(\staged_phase[31]_i_1_n_0 ));
  FDCE \staged_phase_reg[0] 
       (.C(control_clk),
        .CE(\staged_phase[26]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[27]),
        .Q(staged_phase[0]));
  FDCE \staged_phase_reg[10] 
       (.C(control_clk),
        .CE(\staged_phase[26]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[10]),
        .Q(staged_phase[10]));
  FDCE \staged_phase_reg[11] 
       (.C(control_clk),
        .CE(\staged_phase[26]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[11]),
        .Q(staged_phase[11]));
  FDCE \staged_phase_reg[12] 
       (.C(control_clk),
        .CE(\staged_phase[26]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[12]),
        .Q(staged_phase[12]));
  FDCE \staged_phase_reg[13] 
       (.C(control_clk),
        .CE(\staged_phase[26]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[13]),
        .Q(staged_phase[13]));
  FDCE \staged_phase_reg[14] 
       (.C(control_clk),
        .CE(\staged_phase[26]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[14]),
        .Q(staged_phase[14]));
  FDCE \staged_phase_reg[15] 
       (.C(control_clk),
        .CE(\staged_phase[26]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[15]),
        .Q(staged_phase[15]));
  FDCE \staged_phase_reg[16] 
       (.C(control_clk),
        .CE(\staged_phase[26]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[16]),
        .Q(staged_phase[16]));
  FDCE \staged_phase_reg[17] 
       (.C(control_clk),
        .CE(\staged_phase[26]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[17]),
        .Q(staged_phase[17]));
  FDCE \staged_phase_reg[18] 
       (.C(control_clk),
        .CE(\staged_phase[26]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[18]),
        .Q(staged_phase[18]));
  FDCE \staged_phase_reg[19] 
       (.C(control_clk),
        .CE(\staged_phase[26]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[19]),
        .Q(staged_phase[19]));
  FDCE \staged_phase_reg[1] 
       (.C(control_clk),
        .CE(\staged_phase[26]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[28]),
        .Q(staged_phase[1]));
  FDCE \staged_phase_reg[20] 
       (.C(control_clk),
        .CE(\staged_phase[26]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[20]),
        .Q(staged_phase[20]));
  FDCE \staged_phase_reg[21] 
       (.C(control_clk),
        .CE(\staged_phase[26]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[21]),
        .Q(staged_phase[21]));
  FDCE \staged_phase_reg[22] 
       (.C(control_clk),
        .CE(\staged_phase[26]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[22]),
        .Q(staged_phase[22]));
  FDCE \staged_phase_reg[23] 
       (.C(control_clk),
        .CE(\staged_phase[26]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[23]),
        .Q(staged_phase[23]));
  FDCE \staged_phase_reg[24] 
       (.C(control_clk),
        .CE(\staged_phase[26]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[24]),
        .Q(staged_phase[24]));
  FDCE \staged_phase_reg[25] 
       (.C(control_clk),
        .CE(\staged_phase[26]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[25]),
        .Q(staged_phase[25]));
  FDCE \staged_phase_reg[26] 
       (.C(control_clk),
        .CE(\staged_phase[26]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[26]),
        .Q(staged_phase[26]));
  FDCE \staged_phase_reg[27] 
       (.C(control_clk),
        .CE(\staged_phase[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(\staged_gain[0]_i_1_n_0 ),
        .Q(staged_phase[27]));
  FDCE \staged_phase_reg[28] 
       (.C(control_clk),
        .CE(\staged_phase[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(\staged_gain[1]_i_1_n_0 ),
        .Q(staged_phase[28]));
  FDCE \staged_phase_reg[29] 
       (.C(control_clk),
        .CE(\staged_phase[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(\staged_gain[2]_i_1_n_0 ),
        .Q(staged_phase[29]));
  FDCE \staged_phase_reg[2] 
       (.C(control_clk),
        .CE(\staged_phase[26]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[29]),
        .Q(staged_phase[2]));
  FDCE \staged_phase_reg[30] 
       (.C(control_clk),
        .CE(\staged_phase[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(\staged_gain[3]_i_1_n_0 ),
        .Q(staged_phase[30]));
  FDCE \staged_phase_reg[31] 
       (.C(control_clk),
        .CE(\staged_phase[31]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(\staged_gain[4]_i_1_n_0 ),
        .Q(staged_phase[31]));
  FDCE \staged_phase_reg[3] 
       (.C(control_clk),
        .CE(\staged_phase[26]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[30]),
        .Q(staged_phase[3]));
  FDCE \staged_phase_reg[4] 
       (.C(control_clk),
        .CE(\staged_phase[26]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[31]),
        .Q(staged_phase[4]));
  FDCE \staged_phase_reg[5] 
       (.C(control_clk),
        .CE(\staged_phase[26]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[5]),
        .Q(staged_phase[5]));
  FDCE \staged_phase_reg[6] 
       (.C(control_clk),
        .CE(\staged_phase[26]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[6]),
        .Q(staged_phase[6]));
  FDCE \staged_phase_reg[7] 
       (.C(control_clk),
        .CE(\staged_phase[26]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[7]),
        .Q(staged_phase[7]));
  FDCE \staged_phase_reg[8] 
       (.C(control_clk),
        .CE(\staged_phase[26]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[8]),
        .Q(staged_phase[8]));
  FDCE \staged_phase_reg[9] 
       (.C(control_clk),
        .CE(\staged_phase[26]_i_1_n_0 ),
        .CLR(sample_resetn_0),
        .D(p_1_in[9]),
        .Q(staged_phase[9]));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT2 #(
    .INIT(4'hE)) 
    staged_restart_i_1
       (.I0(command_word[26]),
        .I1(command_word[28]),
        .O(staged_restart_i_1_n_0));
  FDPE staged_restart_reg
       (.C(control_clk),
        .CE(\staged_gain[11]_i_1_n_0 ),
        .D(staged_restart_i_1_n_0),
        .PRE(sample_resetn_0),
        .Q(staged_restart__0));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \status_word[0]_INST_0 
       (.I0(\status_word[0]_INST_0_i_1_n_0 ),
        .I1(query__0[3]),
        .I2(\status_word[0]_INST_0_i_2_n_0 ),
        .I3(query__0[2]),
        .I4(\status_word[0]_INST_0_i_3_n_0 ),
        .O(\^status_word [0]));
  LUT5 #(
    .INIT(32'h00004540)) 
    \status_word[0]_INST_0_i_1 
       (.I0(query__0[1]),
        .I1(\^status_word [21]),
        .I2(query__0[0]),
        .I3(data7[0]),
        .I4(query__0[2]),
        .O(\status_word[0]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \status_word[0]_INST_0_i_2 
       (.I0(data6[0]),
        .I1(data5[0]),
        .I2(query__0[1]),
        .I3(data4[0]),
        .I4(query__0[0]),
        .I5(data3[0]),
        .O(\status_word[0]_INST_0_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hAFA0CFCF)) 
    \status_word[0]_INST_0_i_3 
       (.I0(\applied_config_reg_n_0_[0] ),
        .I1(data1[0]),
        .I2(query__0[1]),
        .I3(\applied_tag_reg_n_0_[0] ),
        .I4(query__0[0]),
        .O(\status_word[0]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0100FFFF01000000)) 
    \status_word[10]_INST_0 
       (.I0(query__0[2]),
        .I1(query__0[0]),
        .I2(query__0[1]),
        .I3(data7[10]),
        .I4(query__0[3]),
        .I5(\status_word[10]_INST_0_i_1_n_0 ),
        .O(\^status_word [10]));
  MUXF7 \status_word[10]_INST_0_i_1 
       (.I0(\status_word[10]_INST_0_i_2_n_0 ),
        .I1(\status_word[10]_INST_0_i_3_n_0 ),
        .O(\status_word[10]_INST_0_i_1_n_0 ),
        .S(query__0[2]));
  LUT5 #(
    .INIT(32'hAFA0C0C0)) 
    \status_word[10]_INST_0_i_2 
       (.I0(\applied_config_reg_n_0_[10] ),
        .I1(data1[10]),
        .I2(query__0[1]),
        .I3(\applied_tag_reg_n_0_[10] ),
        .I4(query__0[0]),
        .O(\status_word[10]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \status_word[10]_INST_0_i_3 
       (.I0(data6[10]),
        .I1(data5[10]),
        .I2(query__0[1]),
        .I3(data4[10]),
        .I4(query__0[0]),
        .I5(data3[10]),
        .O(\status_word[10]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0100FFFF01000000)) 
    \status_word[11]_INST_0 
       (.I0(query__0[2]),
        .I1(query__0[0]),
        .I2(query__0[1]),
        .I3(data7[11]),
        .I4(query__0[3]),
        .I5(\status_word[11]_INST_0_i_1_n_0 ),
        .O(\^status_word [11]));
  MUXF7 \status_word[11]_INST_0_i_1 
       (.I0(\status_word[11]_INST_0_i_2_n_0 ),
        .I1(\status_word[11]_INST_0_i_3_n_0 ),
        .O(\status_word[11]_INST_0_i_1_n_0 ),
        .S(query__0[2]));
  LUT5 #(
    .INIT(32'hAFA0CFCF)) 
    \status_word[11]_INST_0_i_2 
       (.I0(\applied_config_reg_n_0_[11] ),
        .I1(data1[11]),
        .I2(query__0[1]),
        .I3(\applied_tag_reg_n_0_[11] ),
        .I4(query__0[0]),
        .O(\status_word[11]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \status_word[11]_INST_0_i_3 
       (.I0(data6[11]),
        .I1(data5[11]),
        .I2(query__0[1]),
        .I3(data4[11]),
        .I4(query__0[0]),
        .I5(data3[11]),
        .O(\status_word[11]_INST_0_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \status_word[12]_INST_0 
       (.I0(\status_word[12]_INST_0_i_1_n_0 ),
        .I1(query__0[2]),
        .I2(\status_word[12]_INST_0_i_2_n_0 ),
        .I3(query__0[3]),
        .O(\^status_word [12]));
  LUT5 #(
    .INIT(32'hAFA0CFCF)) 
    \status_word[12]_INST_0_i_1 
       (.I0(\applied_config_reg_n_0_[12] ),
        .I1(data1[12]),
        .I2(query__0[1]),
        .I3(\applied_tag_reg_n_0_[12] ),
        .I4(query__0[0]),
        .O(\status_word[12]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \status_word[12]_INST_0_i_2 
       (.I0(data5[12]),
        .I1(query__0[1]),
        .I2(data4[12]),
        .I3(query__0[0]),
        .I4(data3[12]),
        .O(\status_word[12]_INST_0_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \status_word[13]_INST_0 
       (.I0(\status_word[13]_INST_0_i_1_n_0 ),
        .I1(query__0[2]),
        .I2(\status_word[13]_INST_0_i_2_n_0 ),
        .I3(query__0[3]),
        .O(\^status_word [13]));
  LUT5 #(
    .INIT(32'hAFA0C0C0)) 
    \status_word[13]_INST_0_i_1 
       (.I0(\applied_config_reg_n_0_[13] ),
        .I1(data1[13]),
        .I2(query__0[1]),
        .I3(\applied_tag_reg_n_0_[13] ),
        .I4(query__0[0]),
        .O(\status_word[13]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \status_word[13]_INST_0_i_2 
       (.I0(data5[13]),
        .I1(query__0[1]),
        .I2(data4[13]),
        .I3(query__0[0]),
        .I4(data3[13]),
        .O(\status_word[13]_INST_0_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \status_word[14]_INST_0 
       (.I0(\status_word[14]_INST_0_i_1_n_0 ),
        .I1(query__0[2]),
        .I2(\status_word[14]_INST_0_i_2_n_0 ),
        .I3(query__0[3]),
        .O(\^status_word [14]));
  LUT5 #(
    .INIT(32'hAFA0CFCF)) 
    \status_word[14]_INST_0_i_1 
       (.I0(\applied_config_reg_n_0_[14] ),
        .I1(data1[14]),
        .I2(query__0[1]),
        .I3(\applied_tag_reg_n_0_[14] ),
        .I4(query__0[0]),
        .O(\status_word[14]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \status_word[14]_INST_0_i_2 
       (.I0(data5[14]),
        .I1(query__0[1]),
        .I2(data4[14]),
        .I3(query__0[0]),
        .I4(data3[14]),
        .O(\status_word[14]_INST_0_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \status_word[15]_INST_0 
       (.I0(\status_word[15]_INST_0_i_1_n_0 ),
        .I1(query__0[2]),
        .I2(\status_word[15]_INST_0_i_2_n_0 ),
        .I3(query__0[3]),
        .O(\^status_word [15]));
  LUT5 #(
    .INIT(32'hAFA0CFCF)) 
    \status_word[15]_INST_0_i_1 
       (.I0(\applied_config_reg_n_0_[15] ),
        .I1(data1[15]),
        .I2(query__0[1]),
        .I3(\applied_tag_reg_n_0_[15] ),
        .I4(query__0[0]),
        .O(\status_word[15]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \status_word[15]_INST_0_i_2 
       (.I0(data5[15]),
        .I1(query__0[1]),
        .I2(data4[15]),
        .I3(query__0[0]),
        .I4(data3[15]),
        .O(\status_word[15]_INST_0_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \status_word[1]_INST_0 
       (.I0(\status_word[1]_INST_0_i_1_n_0 ),
        .I1(query__0[3]),
        .I2(\status_word[1]_INST_0_i_2_n_0 ),
        .I3(query__0[2]),
        .I4(\status_word[1]_INST_0_i_3_n_0 ),
        .O(\^status_word [1]));
  LUT5 #(
    .INIT(32'h00004540)) 
    \status_word[1]_INST_0_i_1 
       (.I0(query__0[1]),
        .I1(data8[1]),
        .I2(query__0[0]),
        .I3(data7[1]),
        .I4(query__0[2]),
        .O(\status_word[1]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \status_word[1]_INST_0_i_2 
       (.I0(data6[1]),
        .I1(data5[1]),
        .I2(query__0[1]),
        .I3(data4[1]),
        .I4(query__0[0]),
        .I5(data3[1]),
        .O(\status_word[1]_INST_0_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hAFC0A0C0)) 
    \status_word[1]_INST_0_i_3 
       (.I0(\applied_config_reg_n_0_[1] ),
        .I1(data1[1]),
        .I2(query__0[1]),
        .I3(query__0[0]),
        .I4(\applied_tag_reg_n_0_[1] ),
        .O(\status_word[1]_INST_0_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hFE)) 
    \status_word[27]_INST_0 
       (.I0(\^status_word [19]),
        .I1(\^status_word [18]),
        .I2(\^status_word [17]),
        .O(\^status_word [22]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \status_word[2]_INST_0 
       (.I0(\status_word[2]_INST_0_i_1_n_0 ),
        .I1(query__0[3]),
        .I2(\status_word[2]_INST_0_i_2_n_0 ),
        .I3(query__0[2]),
        .I4(\status_word[2]_INST_0_i_3_n_0 ),
        .O(\^status_word [2]));
  LUT5 #(
    .INIT(32'h00004540)) 
    \status_word[2]_INST_0_i_1 
       (.I0(query__0[1]),
        .I1(data8[2]),
        .I2(query__0[0]),
        .I3(data7[2]),
        .I4(query__0[2]),
        .O(\status_word[2]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \status_word[2]_INST_0_i_2 
       (.I0(data6[2]),
        .I1(data5[2]),
        .I2(query__0[1]),
        .I3(data4[2]),
        .I4(query__0[0]),
        .I5(data3[2]),
        .O(\status_word[2]_INST_0_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hAFA0CFCF)) 
    \status_word[2]_INST_0_i_3 
       (.I0(\applied_config_reg_n_0_[2] ),
        .I1(data1[2]),
        .I2(query__0[1]),
        .I3(\applied_tag_reg_n_0_[2] ),
        .I4(query__0[0]),
        .O(\status_word[2]_INST_0_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \status_word[30]_INST_0 
       (.I0(\FSM_onehot_state_reg_n_0_[0] ),
        .O(\^status_word [25]));
  LUT6 #(
    .INIT(64'h0100FFFF01000000)) 
    \status_word[3]_INST_0 
       (.I0(query__0[2]),
        .I1(query__0[0]),
        .I2(query__0[1]),
        .I3(data7[3]),
        .I4(query__0[3]),
        .I5(\status_word[3]_INST_0_i_1_n_0 ),
        .O(\^status_word [3]));
  MUXF7 \status_word[3]_INST_0_i_1 
       (.I0(\status_word[3]_INST_0_i_2_n_0 ),
        .I1(\status_word[3]_INST_0_i_3_n_0 ),
        .O(\status_word[3]_INST_0_i_1_n_0 ),
        .S(query__0[2]));
  LUT5 #(
    .INIT(32'hAFC0A0C0)) 
    \status_word[3]_INST_0_i_2 
       (.I0(\applied_config_reg_n_0_[3] ),
        .I1(data1[3]),
        .I2(query__0[1]),
        .I3(query__0[0]),
        .I4(\applied_tag_reg_n_0_[3] ),
        .O(\status_word[3]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \status_word[3]_INST_0_i_3 
       (.I0(data6[3]),
        .I1(data5[3]),
        .I2(query__0[1]),
        .I3(data4[3]),
        .I4(query__0[0]),
        .I5(data3[3]),
        .O(\status_word[3]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0100FFFF01000000)) 
    \status_word[4]_INST_0 
       (.I0(query__0[2]),
        .I1(query__0[0]),
        .I2(query__0[1]),
        .I3(data7[4]),
        .I4(query__0[3]),
        .I5(\status_word[4]_INST_0_i_1_n_0 ),
        .O(\^status_word [4]));
  MUXF7 \status_word[4]_INST_0_i_1 
       (.I0(\status_word[4]_INST_0_i_2_n_0 ),
        .I1(\status_word[4]_INST_0_i_3_n_0 ),
        .O(\status_word[4]_INST_0_i_1_n_0 ),
        .S(query__0[2]));
  LUT5 #(
    .INIT(32'hAFC0A0C0)) 
    \status_word[4]_INST_0_i_2 
       (.I0(\applied_config_reg_n_0_[4] ),
        .I1(data1[4]),
        .I2(query__0[1]),
        .I3(query__0[0]),
        .I4(\applied_tag_reg_n_0_[4] ),
        .O(\status_word[4]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \status_word[4]_INST_0_i_3 
       (.I0(data6[4]),
        .I1(data5[4]),
        .I2(query__0[1]),
        .I3(data4[4]),
        .I4(query__0[0]),
        .I5(data3[4]),
        .O(\status_word[4]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0100FFFF01000000)) 
    \status_word[5]_INST_0 
       (.I0(query__0[2]),
        .I1(query__0[0]),
        .I2(query__0[1]),
        .I3(data7[5]),
        .I4(query__0[3]),
        .I5(\status_word[5]_INST_0_i_1_n_0 ),
        .O(\^status_word [5]));
  MUXF7 \status_word[5]_INST_0_i_1 
       (.I0(\status_word[5]_INST_0_i_2_n_0 ),
        .I1(\status_word[5]_INST_0_i_3_n_0 ),
        .O(\status_word[5]_INST_0_i_1_n_0 ),
        .S(query__0[2]));
  LUT5 #(
    .INIT(32'hAFC0A0C0)) 
    \status_word[5]_INST_0_i_2 
       (.I0(\applied_config_reg_n_0_[5] ),
        .I1(data1[5]),
        .I2(query__0[1]),
        .I3(query__0[0]),
        .I4(\applied_tag_reg_n_0_[5] ),
        .O(\status_word[5]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \status_word[5]_INST_0_i_3 
       (.I0(data6[5]),
        .I1(data5[5]),
        .I2(query__0[1]),
        .I3(data4[5]),
        .I4(query__0[0]),
        .I5(data3[5]),
        .O(\status_word[5]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0100FFFF01000000)) 
    \status_word[6]_INST_0 
       (.I0(query__0[2]),
        .I1(query__0[0]),
        .I2(query__0[1]),
        .I3(data7[6]),
        .I4(query__0[3]),
        .I5(\status_word[6]_INST_0_i_1_n_0 ),
        .O(\^status_word [6]));
  MUXF7 \status_word[6]_INST_0_i_1 
       (.I0(\status_word[6]_INST_0_i_2_n_0 ),
        .I1(\status_word[6]_INST_0_i_3_n_0 ),
        .O(\status_word[6]_INST_0_i_1_n_0 ),
        .S(query__0[2]));
  LUT5 #(
    .INIT(32'hAFC0A0C0)) 
    \status_word[6]_INST_0_i_2 
       (.I0(\applied_config_reg_n_0_[6] ),
        .I1(data1[6]),
        .I2(query__0[1]),
        .I3(query__0[0]),
        .I4(\applied_tag_reg_n_0_[6] ),
        .O(\status_word[6]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \status_word[6]_INST_0_i_3 
       (.I0(data6[6]),
        .I1(data5[6]),
        .I2(query__0[1]),
        .I3(data4[6]),
        .I4(query__0[0]),
        .I5(data3[6]),
        .O(\status_word[6]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0100FFFF01000000)) 
    \status_word[7]_INST_0 
       (.I0(query__0[2]),
        .I1(query__0[0]),
        .I2(query__0[1]),
        .I3(data7[7]),
        .I4(query__0[3]),
        .I5(\status_word[7]_INST_0_i_1_n_0 ),
        .O(\^status_word [7]));
  MUXF7 \status_word[7]_INST_0_i_1 
       (.I0(\status_word[7]_INST_0_i_2_n_0 ),
        .I1(\status_word[7]_INST_0_i_3_n_0 ),
        .O(\status_word[7]_INST_0_i_1_n_0 ),
        .S(query__0[2]));
  LUT5 #(
    .INIT(32'hAFC0A0C0)) 
    \status_word[7]_INST_0_i_2 
       (.I0(\applied_config_reg_n_0_[7] ),
        .I1(data1[7]),
        .I2(query__0[1]),
        .I3(query__0[0]),
        .I4(\applied_tag_reg_n_0_[7] ),
        .O(\status_word[7]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \status_word[7]_INST_0_i_3 
       (.I0(data6[7]),
        .I1(data5[7]),
        .I2(query__0[1]),
        .I3(data4[7]),
        .I4(query__0[0]),
        .I5(data3[7]),
        .O(\status_word[7]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0100FFFF01000000)) 
    \status_word[8]_INST_0 
       (.I0(query__0[2]),
        .I1(query__0[0]),
        .I2(query__0[1]),
        .I3(data7[8]),
        .I4(query__0[3]),
        .I5(\status_word[8]_INST_0_i_1_n_0 ),
        .O(\^status_word [8]));
  MUXF7 \status_word[8]_INST_0_i_1 
       (.I0(\status_word[8]_INST_0_i_2_n_0 ),
        .I1(\status_word[8]_INST_0_i_3_n_0 ),
        .O(\status_word[8]_INST_0_i_1_n_0 ),
        .S(query__0[2]));
  LUT5 #(
    .INIT(32'hAFA0CFCF)) 
    \status_word[8]_INST_0_i_2 
       (.I0(\applied_config_reg_n_0_[8] ),
        .I1(data1[8]),
        .I2(query__0[1]),
        .I3(\applied_tag_reg_n_0_[8] ),
        .I4(query__0[0]),
        .O(\status_word[8]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \status_word[8]_INST_0_i_3 
       (.I0(data6[8]),
        .I1(data5[8]),
        .I2(query__0[1]),
        .I3(data4[8]),
        .I4(query__0[0]),
        .I5(data3[8]),
        .O(\status_word[8]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0100FFFF01000000)) 
    \status_word[9]_INST_0 
       (.I0(query__0[2]),
        .I1(query__0[0]),
        .I2(query__0[1]),
        .I3(data7[9]),
        .I4(query__0[3]),
        .I5(\status_word[9]_INST_0_i_1_n_0 ),
        .O(\^status_word [9]));
  MUXF7 \status_word[9]_INST_0_i_1 
       (.I0(\status_word[9]_INST_0_i_2_n_0 ),
        .I1(\status_word[9]_INST_0_i_3_n_0 ),
        .O(\status_word[9]_INST_0_i_1_n_0 ),
        .S(query__0[2]));
  LUT5 #(
    .INIT(32'hAFA0C0C0)) 
    \status_word[9]_INST_0_i_2 
       (.I0(\applied_config_reg_n_0_[9] ),
        .I1(data1[9]),
        .I2(query__0[1]),
        .I3(\applied_tag_reg_n_0_[9] ),
        .I4(query__0[0]),
        .O(\status_word[9]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \status_word[9]_INST_0_i_3 
       (.I0(data6[9]),
        .I1(data5[9]),
        .I2(query__0[1]),
        .I3(data4[9]),
        .I4(query__0[0]),
        .I5(data3[9]),
        .O(\status_word[9]_INST_0_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \tag_counter[0]_i_2 
       (.I0(tag_counter_reg[0]),
        .O(\tag_counter[0]_i_2_n_0 ));
  FDCE \tag_counter_reg[0] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\tag_counter_reg[0]_i_1_n_7 ),
        .Q(tag_counter_reg[0]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \tag_counter_reg[0]_i_1 
       (.CI(1'b0),
        .CO({\tag_counter_reg[0]_i_1_n_0 ,\tag_counter_reg[0]_i_1_n_1 ,\tag_counter_reg[0]_i_1_n_2 ,\tag_counter_reg[0]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\tag_counter_reg[0]_i_1_n_4 ,\tag_counter_reg[0]_i_1_n_5 ,\tag_counter_reg[0]_i_1_n_6 ,\tag_counter_reg[0]_i_1_n_7 }),
        .S({tag_counter_reg[3:1],\tag_counter[0]_i_2_n_0 }));
  FDCE \tag_counter_reg[10] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\tag_counter_reg[8]_i_1_n_5 ),
        .Q(tag_counter_reg[10]));
  FDCE \tag_counter_reg[11] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\tag_counter_reg[8]_i_1_n_4 ),
        .Q(tag_counter_reg[11]));
  FDCE \tag_counter_reg[12] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\tag_counter_reg[12]_i_1_n_7 ),
        .Q(tag_counter_reg[12]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \tag_counter_reg[12]_i_1 
       (.CI(\tag_counter_reg[8]_i_1_n_0 ),
        .CO({\tag_counter_reg[12]_i_1_n_0 ,\tag_counter_reg[12]_i_1_n_1 ,\tag_counter_reg[12]_i_1_n_2 ,\tag_counter_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\tag_counter_reg[12]_i_1_n_4 ,\tag_counter_reg[12]_i_1_n_5 ,\tag_counter_reg[12]_i_1_n_6 ,\tag_counter_reg[12]_i_1_n_7 }),
        .S(tag_counter_reg[15:12]));
  FDCE \tag_counter_reg[13] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\tag_counter_reg[12]_i_1_n_6 ),
        .Q(tag_counter_reg[13]));
  FDCE \tag_counter_reg[14] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\tag_counter_reg[12]_i_1_n_5 ),
        .Q(tag_counter_reg[14]));
  FDCE \tag_counter_reg[15] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\tag_counter_reg[12]_i_1_n_4 ),
        .Q(tag_counter_reg[15]));
  FDCE \tag_counter_reg[16] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\tag_counter_reg[16]_i_1_n_7 ),
        .Q(tag_counter_reg[16]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \tag_counter_reg[16]_i_1 
       (.CI(\tag_counter_reg[12]_i_1_n_0 ),
        .CO({\tag_counter_reg[16]_i_1_n_0 ,\tag_counter_reg[16]_i_1_n_1 ,\tag_counter_reg[16]_i_1_n_2 ,\tag_counter_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\tag_counter_reg[16]_i_1_n_4 ,\tag_counter_reg[16]_i_1_n_5 ,\tag_counter_reg[16]_i_1_n_6 ,\tag_counter_reg[16]_i_1_n_7 }),
        .S(tag_counter_reg[19:16]));
  FDCE \tag_counter_reg[17] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\tag_counter_reg[16]_i_1_n_6 ),
        .Q(tag_counter_reg[17]));
  FDCE \tag_counter_reg[18] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\tag_counter_reg[16]_i_1_n_5 ),
        .Q(tag_counter_reg[18]));
  FDCE \tag_counter_reg[19] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\tag_counter_reg[16]_i_1_n_4 ),
        .Q(tag_counter_reg[19]));
  FDCE \tag_counter_reg[1] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\tag_counter_reg[0]_i_1_n_6 ),
        .Q(tag_counter_reg[1]));
  FDCE \tag_counter_reg[20] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\tag_counter_reg[20]_i_1_n_7 ),
        .Q(tag_counter_reg[20]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \tag_counter_reg[20]_i_1 
       (.CI(\tag_counter_reg[16]_i_1_n_0 ),
        .CO({\tag_counter_reg[20]_i_1_n_0 ,\tag_counter_reg[20]_i_1_n_1 ,\tag_counter_reg[20]_i_1_n_2 ,\tag_counter_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\tag_counter_reg[20]_i_1_n_4 ,\tag_counter_reg[20]_i_1_n_5 ,\tag_counter_reg[20]_i_1_n_6 ,\tag_counter_reg[20]_i_1_n_7 }),
        .S(tag_counter_reg[23:20]));
  FDCE \tag_counter_reg[21] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\tag_counter_reg[20]_i_1_n_6 ),
        .Q(tag_counter_reg[21]));
  FDCE \tag_counter_reg[22] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\tag_counter_reg[20]_i_1_n_5 ),
        .Q(tag_counter_reg[22]));
  FDCE \tag_counter_reg[23] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\tag_counter_reg[20]_i_1_n_4 ),
        .Q(tag_counter_reg[23]));
  FDCE \tag_counter_reg[24] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\tag_counter_reg[24]_i_1_n_7 ),
        .Q(tag_counter_reg[24]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \tag_counter_reg[24]_i_1 
       (.CI(\tag_counter_reg[20]_i_1_n_0 ),
        .CO({\tag_counter_reg[24]_i_1_n_0 ,\tag_counter_reg[24]_i_1_n_1 ,\tag_counter_reg[24]_i_1_n_2 ,\tag_counter_reg[24]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\tag_counter_reg[24]_i_1_n_4 ,\tag_counter_reg[24]_i_1_n_5 ,\tag_counter_reg[24]_i_1_n_6 ,\tag_counter_reg[24]_i_1_n_7 }),
        .S(tag_counter_reg[27:24]));
  FDCE \tag_counter_reg[25] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\tag_counter_reg[24]_i_1_n_6 ),
        .Q(tag_counter_reg[25]));
  FDCE \tag_counter_reg[26] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\tag_counter_reg[24]_i_1_n_5 ),
        .Q(tag_counter_reg[26]));
  FDCE \tag_counter_reg[27] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\tag_counter_reg[24]_i_1_n_4 ),
        .Q(tag_counter_reg[27]));
  FDCE \tag_counter_reg[28] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\tag_counter_reg[28]_i_1_n_7 ),
        .Q(tag_counter_reg[28]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \tag_counter_reg[28]_i_1 
       (.CI(\tag_counter_reg[24]_i_1_n_0 ),
        .CO({\NLW_tag_counter_reg[28]_i_1_CO_UNCONNECTED [3],\tag_counter_reg[28]_i_1_n_1 ,\tag_counter_reg[28]_i_1_n_2 ,\tag_counter_reg[28]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\tag_counter_reg[28]_i_1_n_4 ,\tag_counter_reg[28]_i_1_n_5 ,\tag_counter_reg[28]_i_1_n_6 ,\tag_counter_reg[28]_i_1_n_7 }),
        .S(tag_counter_reg[31:28]));
  FDCE \tag_counter_reg[29] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\tag_counter_reg[28]_i_1_n_6 ),
        .Q(tag_counter_reg[29]));
  FDCE \tag_counter_reg[2] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\tag_counter_reg[0]_i_1_n_5 ),
        .Q(tag_counter_reg[2]));
  FDCE \tag_counter_reg[30] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\tag_counter_reg[28]_i_1_n_5 ),
        .Q(tag_counter_reg[30]));
  FDCE \tag_counter_reg[31] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\tag_counter_reg[28]_i_1_n_4 ),
        .Q(tag_counter_reg[31]));
  FDCE \tag_counter_reg[3] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\tag_counter_reg[0]_i_1_n_4 ),
        .Q(tag_counter_reg[3]));
  FDCE \tag_counter_reg[4] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\tag_counter_reg[4]_i_1_n_7 ),
        .Q(tag_counter_reg[4]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \tag_counter_reg[4]_i_1 
       (.CI(\tag_counter_reg[0]_i_1_n_0 ),
        .CO({\tag_counter_reg[4]_i_1_n_0 ,\tag_counter_reg[4]_i_1_n_1 ,\tag_counter_reg[4]_i_1_n_2 ,\tag_counter_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\tag_counter_reg[4]_i_1_n_4 ,\tag_counter_reg[4]_i_1_n_5 ,\tag_counter_reg[4]_i_1_n_6 ,\tag_counter_reg[4]_i_1_n_7 }),
        .S(tag_counter_reg[7:4]));
  FDCE \tag_counter_reg[5] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\tag_counter_reg[4]_i_1_n_6 ),
        .Q(tag_counter_reg[5]));
  FDCE \tag_counter_reg[6] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\tag_counter_reg[4]_i_1_n_5 ),
        .Q(tag_counter_reg[6]));
  FDCE \tag_counter_reg[7] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\tag_counter_reg[4]_i_1_n_4 ),
        .Q(tag_counter_reg[7]));
  FDCE \tag_counter_reg[8] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\tag_counter_reg[8]_i_1_n_7 ),
        .Q(tag_counter_reg[8]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \tag_counter_reg[8]_i_1 
       (.CI(\tag_counter_reg[4]_i_1_n_0 ),
        .CO({\tag_counter_reg[8]_i_1_n_0 ,\tag_counter_reg[8]_i_1_n_1 ,\tag_counter_reg[8]_i_1_n_2 ,\tag_counter_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\tag_counter_reg[8]_i_1_n_4 ,\tag_counter_reg[8]_i_1_n_5 ,\tag_counter_reg[8]_i_1_n_6 ,\tag_counter_reg[8]_i_1_n_7 }),
        .S(tag_counter_reg[11:8]));
  FDCE \tag_counter_reg[9] 
       (.C(control_clk),
        .CE(tag_counter),
        .CLR(sample_resetn_0),
        .D(\tag_counter_reg[8]_i_1_n_6 ),
        .Q(tag_counter_reg[9]));
  system_dac902_control_0_fdw_dac902_dds waveform
       (.CO(sample_pending1),
        .D({cfg_rejected,sample_active}),
        .E(reply_pending_reg_0),
        .Q({config_data[122:91],config_data[89:0]}),
        .S({waveform_n_41,waveform_n_42,waveform_n_43,waveform_n_44}),
        .active_enable(active_enable),
        .\active_tag_reg[11]_0 ({waveform_n_84,waveform_n_85,waveform_n_86,waveform_n_87}),
        .\active_tag_reg[23]_0 ({waveform_n_88,waveform_n_89,waveform_n_90,waveform_n_91}),
        .\active_tag_reg[31]_0 ({waveform_n_92,waveform_n_93,waveform_n_94}),
        .awaiting_sample_reg(awaiting_sample_reg_n_0),
        .awaiting_sample_reg_0(cfg_valid0),
        .cfg_rejected0(cfg_rejected0),
        .cfg_rejected_reg_0(waveform_n_96),
        .clock_run(clock_run),
        .control_resetn(control_resetn),
        .enabled2(enabled2),
        .out(pad_tristate[12]),
        .\phase_accumulator_reg[31]_0 (configuration_mailbox_n_5),
        .reference_config_ftw0(reference_config_ftw0),
        .reference_ftw(reference_ftw),
        .reference_inverted(reference_inverted),
        .reference_phase(reference_phase),
        .reference_tag(reference_tag),
        .reference_valid(reference_valid),
        .reference_valid_0(reference_valid0),
        .sample_active_reg_0(configuration_mailbox_n_128),
        .sample_clipped_reg_0(sample_clipped),
        .sample_clk(sample_clk),
        .\sample_code_reg[0]_0 (configuration_mailbox_n_129),
        .\sample_code_reg[11]_0 (generated_data),
        .sample_initialized(sample_initialized),
        .sample_pending(sample_pending),
        .sample_pending1_carry__1(sample_tag_pending),
        .sample_pending_reg(reply_pending),
        .sample_resetn(sample_resetn),
        .sample_resetn_0(sample_resetn_0),
        .\sample_tag_pending_reg[23] ({waveform_n_77,waveform_n_78,waveform_n_79,waveform_n_80}),
        .\sample_tag_pending_reg[31] ({waveform_n_81,waveform_n_82,waveform_n_83}),
        .sample_valid_reg_0(waveform_n_97),
        .scaled_sample1_carry__1_0(scaled_sample1_carry__1),
        .v2(v2));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
