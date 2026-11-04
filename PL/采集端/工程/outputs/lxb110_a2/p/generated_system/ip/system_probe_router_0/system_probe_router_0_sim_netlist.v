// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
// Date        : Thu Oct 22 00:36:55 2026
// Host        : xiaojun running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/33525/FDW_NEXT/outputs/lxb110_a2/p/generated_system/ip/system_probe_router_0/system_probe_router_0_sim_netlist.v
// Design      : system_probe_router_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "system_probe_router_0,fdw_probe_router,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "fdw_probe_router,Vivado 2025.1" *) 
(* NotValidForBitStream *)
module system_probe_router_0
   (clk,
    resetn,
    control_word,
    status_word,
    digital_in,
    continuous_pwm,
    continuous_event,
    finite_pwm,
    finite_event,
    pwm_active,
    capture_active,
    sample_out,
    trigger_out,
    invalidate_capture,
    pwm_out);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, ASSOCIATED_RESET resetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 resetn RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME resetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input resetn;
  input [31:0]control_word;
  output [31:0]status_word;
  input [1:0]digital_in;
  input continuous_pwm;
  input continuous_event;
  input finite_pwm;
  input finite_event;
  input pwm_active;
  input capture_active;
  output [1:0]sample_out;
  output trigger_out;
  output invalidate_capture;
  output pwm_out;

  wire \<const0> ;
  wire capture_active;
  wire clk;
  wire continuous_event;
  wire continuous_pwm;
  wire [31:0]control_word;
  wire [1:0]digital_in;
  wire finite_event;
  wire finite_pwm;
  wire invalidate_capture;
  wire pwm_active;
  wire pwm_out;
  wire resetn;
  wire [1:0]sample_out;
  wire [31:0]\^status_word ;
  wire trigger_out;

  assign status_word[31:17] = \^status_word [31:17];
  assign status_word[16] = capture_active;
  assign status_word[15] = pwm_active;
  assign status_word[14:12] = \^status_word [14:12];
  assign status_word[11] = \<const0> ;
  assign status_word[10:0] = \^status_word [10:0];
  GND GND
       (.G(\<const0> ));
  system_probe_router_0_fdw_probe_router inst
       (.D(\^status_word [14:13]),
        .Q(\^status_word [2:0]),
        .capture_active(capture_active),
        .clk(clk),
        .continuous_event(continuous_event),
        .continuous_pwm(continuous_pwm),
        .control_word(control_word),
        .digital_in(digital_in),
        .finite_event(finite_event),
        .finite_pwm(finite_pwm),
        .invalidate_capture(invalidate_capture),
        .pwm_active(pwm_active),
        .pwm_out(pwm_out),
        .resetn(resetn),
        .sample_out(sample_out),
        .status_word({\^status_word [31:17],\^status_word [12],\^status_word [10:3]}),
        .trigger_out(trigger_out));
endmodule

(* ORIG_REF_NAME = "fdw_probe_router" *) 
module system_probe_router_0_fdw_probe_router
   (D,
    Q,
    status_word,
    sample_out,
    pwm_out,
    trigger_out,
    invalidate_capture,
    capture_active,
    pwm_active,
    control_word,
    resetn,
    clk,
    digital_in,
    finite_pwm,
    continuous_pwm,
    finite_event,
    continuous_event);
  output [1:0]D;
  output [2:0]Q;
  output [23:0]status_word;
  output [1:0]sample_out;
  output pwm_out;
  output trigger_out;
  output invalidate_capture;
  input capture_active;
  input pwm_active;
  input [31:0]control_word;
  input resetn;
  input clk;
  input [1:0]digital_in;
  input finite_pwm;
  input continuous_pwm;
  input finite_event;
  input continuous_event;

  wire [2:0]Q;
  wire active_mode;
  wire active_mode1;
  wire capture_active;
  wire clear;
  wire clk;
  wire continuous_event;
  wire continuous_pwm;
  wire [31:0]control_word;
  wire [1:0]digital_in;
  (* async_reg = "true" *) (* shreg_extract = "no" *) wire [1:0]digital_meta;
  wire [1:0]digital_previous;
  (* async_reg = "true" *) (* shreg_extract = "no" *) wire [1:0]digital_sync;
  wire finite_event;
  wire finite_pwm;
  wire finite_select;
  wire \generation[14]_i_4_n_0 ;
  wire \generation[14]_i_5_n_0 ;
  wire \generation[3]_i_2_n_0 ;
  wire \generation_reg[11]_i_1_n_0 ;
  wire \generation_reg[11]_i_1_n_1 ;
  wire \generation_reg[11]_i_1_n_2 ;
  wire \generation_reg[11]_i_1_n_3 ;
  wire \generation_reg[11]_i_1_n_4 ;
  wire \generation_reg[11]_i_1_n_5 ;
  wire \generation_reg[11]_i_1_n_6 ;
  wire \generation_reg[11]_i_1_n_7 ;
  wire \generation_reg[14]_i_3_n_2 ;
  wire \generation_reg[14]_i_3_n_3 ;
  wire \generation_reg[14]_i_3_n_5 ;
  wire \generation_reg[14]_i_3_n_6 ;
  wire \generation_reg[14]_i_3_n_7 ;
  wire \generation_reg[3]_i_1_n_0 ;
  wire \generation_reg[3]_i_1_n_1 ;
  wire \generation_reg[3]_i_1_n_2 ;
  wire \generation_reg[3]_i_1_n_3 ;
  wire \generation_reg[3]_i_1_n_4 ;
  wire \generation_reg[3]_i_1_n_5 ;
  wire \generation_reg[3]_i_1_n_6 ;
  wire \generation_reg[3]_i_1_n_7 ;
  wire \generation_reg[7]_i_1_n_0 ;
  wire \generation_reg[7]_i_1_n_1 ;
  wire \generation_reg[7]_i_1_n_2 ;
  wire \generation_reg[7]_i_1_n_3 ;
  wire \generation_reg[7]_i_1_n_4 ;
  wire \generation_reg[7]_i_1_n_5 ;
  wire \generation_reg[7]_i_1_n_6 ;
  wire \generation_reg[7]_i_1_n_7 ;
  wire invalidate_capture;
  wire invalidate_capture_i_1_n_0;
  wire output_permit_reg_n_0;
  wire pwm_active;
  wire pwm_out;
  wire resetn;
  wire \result_code[0]_i_1_n_0 ;
  wire \result_code[0]_i_2_n_0 ;
  wire \result_code[0]_i_3_n_0 ;
  wire \result_code[1]_i_1_n_0 ;
  wire \result_code[1]_i_2_n_0 ;
  wire \result_code[1]_i_3_n_0 ;
  wire \result_code[2]_i_1_n_0 ;
  wire \result_code[2]_i_2_n_0 ;
  wire \result_code[2]_i_3_n_0 ;
  wire \result_code[2]_i_4_n_0 ;
  wire \result_code[2]_i_5_n_0 ;
  wire \result_code[2]_i_6_n_0 ;
  wire \result_code[2]_i_7_n_0 ;
  wire \result_code[2]_i_8_n_0 ;
  wire \result_code[2]_i_9_n_0 ;
  wire [1:0]sample_out;
  wire \sample_out[1]_INST_0_i_1_n_0 ;
  wire \settle_count[0]_i_1_n_0 ;
  wire \settle_count[0]_i_2_n_0 ;
  wire \settle_count[0]_i_3_n_0 ;
  wire \settle_count[1]_i_1_n_0 ;
  wire \settle_count[1]_i_2_n_0 ;
  wire \settle_count[1]_i_3_n_0 ;
  wire \settle_count[2]_i_1_n_0 ;
  wire \settle_count[2]_i_2_n_0 ;
  wire \settle_count[2]_i_3_n_0 ;
  wire \settle_count[2]_i_5_n_0 ;
  wire \settle_count[2]_i_6_n_0 ;
  wire \settle_count[2]_i_7_n_0 ;
  wire \settle_count_reg_n_0_[0] ;
  wire \settle_count_reg_n_0_[1] ;
  wire \settle_count_reg_n_0_[2] ;
  wire [23:0]status_word;
  wire trigger_out;
  wire trigger_out_INST_0_i_1_n_0;
  wire trigger_out_INST_0_i_2_n_0;
  wire [3:2]\NLW_generation_reg[14]_i_3_CO_UNCONNECTED ;
  wire [3:3]\NLW_generation_reg[14]_i_3_O_UNCONNECTED ;

  assign D[1:0] = digital_sync;
  FDRE acknowledged_reg
       (.C(clk),
        .CE(1'b1),
        .D(control_word[7]),
        .Q(status_word[4]),
        .R(clear));
  FDRE \active_mode_reg[0] 
       (.C(clk),
        .CE(active_mode),
        .D(control_word[0]),
        .Q(Q[0]),
        .R(clear));
  FDRE \active_mode_reg[1] 
       (.C(clk),
        .CE(active_mode),
        .D(control_word[1]),
        .Q(Q[1]),
        .R(clear));
  FDRE \active_mode_reg[2] 
       (.C(clk),
        .CE(active_mode),
        .D(control_word[2]),
        .Q(Q[2]),
        .R(clear));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "no" *) 
  FDRE \digital_meta_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(digital_in[0]),
        .Q(digital_meta[0]),
        .R(clear));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "no" *) 
  FDRE \digital_meta_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(digital_in[1]),
        .Q(digital_meta[1]),
        .R(clear));
  FDRE \digital_previous_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(digital_sync[0]),
        .Q(digital_previous[0]),
        .R(clear));
  FDRE \digital_previous_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(digital_sync[1]),
        .Q(digital_previous[1]),
        .R(clear));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "no" *) 
  FDRE \digital_sync_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(digital_meta[0]),
        .Q(digital_sync[0]),
        .R(clear));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "no" *) 
  FDRE \digital_sync_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(digital_meta[1]),
        .Q(digital_sync[1]),
        .R(clear));
  FDRE finite_select_reg
       (.C(clk),
        .CE(active_mode),
        .D(control_word[8]),
        .Q(finite_select),
        .R(clear));
  LUT1 #(
    .INIT(2'h1)) 
    \generation[14]_i_1 
       (.I0(resetn),
        .O(clear));
  LUT4 #(
    .INIT(16'h0060)) 
    \generation[14]_i_2 
       (.I0(control_word[7]),
        .I1(status_word[4]),
        .I2(\generation[14]_i_4_n_0 ),
        .I3(\generation[14]_i_5_n_0 ),
        .O(active_mode));
  LUT6 #(
    .INIT(64'h01010001000100FF)) 
    \generation[14]_i_4 
       (.I0(status_word[8]),
        .I1(capture_active),
        .I2(pwm_active),
        .I3(control_word[3]),
        .I4(control_word[0]),
        .I5(control_word[1]),
        .O(\generation[14]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \generation[14]_i_5 
       (.I0(\result_code[2]_i_3_n_0 ),
        .I1(control_word[2]),
        .O(\generation[14]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \generation[3]_i_2 
       (.I0(status_word[9]),
        .O(\generation[3]_i_2_n_0 ));
  FDRE \generation_reg[0] 
       (.C(clk),
        .CE(active_mode),
        .D(\generation_reg[3]_i_1_n_7 ),
        .Q(status_word[9]),
        .R(clear));
  FDRE \generation_reg[10] 
       (.C(clk),
        .CE(active_mode),
        .D(\generation_reg[11]_i_1_n_5 ),
        .Q(status_word[19]),
        .R(clear));
  FDRE \generation_reg[11] 
       (.C(clk),
        .CE(active_mode),
        .D(\generation_reg[11]_i_1_n_4 ),
        .Q(status_word[20]),
        .R(clear));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \generation_reg[11]_i_1 
       (.CI(\generation_reg[7]_i_1_n_0 ),
        .CO({\generation_reg[11]_i_1_n_0 ,\generation_reg[11]_i_1_n_1 ,\generation_reg[11]_i_1_n_2 ,\generation_reg[11]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\generation_reg[11]_i_1_n_4 ,\generation_reg[11]_i_1_n_5 ,\generation_reg[11]_i_1_n_6 ,\generation_reg[11]_i_1_n_7 }),
        .S(status_word[20:17]));
  FDRE \generation_reg[12] 
       (.C(clk),
        .CE(active_mode),
        .D(\generation_reg[14]_i_3_n_7 ),
        .Q(status_word[21]),
        .R(clear));
  FDRE \generation_reg[13] 
       (.C(clk),
        .CE(active_mode),
        .D(\generation_reg[14]_i_3_n_6 ),
        .Q(status_word[22]),
        .R(clear));
  FDRE \generation_reg[14] 
       (.C(clk),
        .CE(active_mode),
        .D(\generation_reg[14]_i_3_n_5 ),
        .Q(status_word[23]),
        .R(clear));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \generation_reg[14]_i_3 
       (.CI(\generation_reg[11]_i_1_n_0 ),
        .CO({\NLW_generation_reg[14]_i_3_CO_UNCONNECTED [3:2],\generation_reg[14]_i_3_n_2 ,\generation_reg[14]_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_generation_reg[14]_i_3_O_UNCONNECTED [3],\generation_reg[14]_i_3_n_5 ,\generation_reg[14]_i_3_n_6 ,\generation_reg[14]_i_3_n_7 }),
        .S({1'b0,status_word[23:21]}));
  FDRE \generation_reg[1] 
       (.C(clk),
        .CE(active_mode),
        .D(\generation_reg[3]_i_1_n_6 ),
        .Q(status_word[10]),
        .R(clear));
  FDRE \generation_reg[2] 
       (.C(clk),
        .CE(active_mode),
        .D(\generation_reg[3]_i_1_n_5 ),
        .Q(status_word[11]),
        .R(clear));
  FDRE \generation_reg[3] 
       (.C(clk),
        .CE(active_mode),
        .D(\generation_reg[3]_i_1_n_4 ),
        .Q(status_word[12]),
        .R(clear));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \generation_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\generation_reg[3]_i_1_n_0 ,\generation_reg[3]_i_1_n_1 ,\generation_reg[3]_i_1_n_2 ,\generation_reg[3]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\generation_reg[3]_i_1_n_4 ,\generation_reg[3]_i_1_n_5 ,\generation_reg[3]_i_1_n_6 ,\generation_reg[3]_i_1_n_7 }),
        .S({status_word[12:10],\generation[3]_i_2_n_0 }));
  FDRE \generation_reg[4] 
       (.C(clk),
        .CE(active_mode),
        .D(\generation_reg[7]_i_1_n_7 ),
        .Q(status_word[13]),
        .R(clear));
  FDRE \generation_reg[5] 
       (.C(clk),
        .CE(active_mode),
        .D(\generation_reg[7]_i_1_n_6 ),
        .Q(status_word[14]),
        .R(clear));
  FDRE \generation_reg[6] 
       (.C(clk),
        .CE(active_mode),
        .D(\generation_reg[7]_i_1_n_5 ),
        .Q(status_word[15]),
        .R(clear));
  FDRE \generation_reg[7] 
       (.C(clk),
        .CE(active_mode),
        .D(\generation_reg[7]_i_1_n_4 ),
        .Q(status_word[16]),
        .R(clear));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \generation_reg[7]_i_1 
       (.CI(\generation_reg[3]_i_1_n_0 ),
        .CO({\generation_reg[7]_i_1_n_0 ,\generation_reg[7]_i_1_n_1 ,\generation_reg[7]_i_1_n_2 ,\generation_reg[7]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\generation_reg[7]_i_1_n_4 ,\generation_reg[7]_i_1_n_5 ,\generation_reg[7]_i_1_n_6 ,\generation_reg[7]_i_1_n_7 }),
        .S(status_word[16:13]));
  FDRE \generation_reg[8] 
       (.C(clk),
        .CE(active_mode),
        .D(\generation_reg[11]_i_1_n_7 ),
        .Q(status_word[17]),
        .R(clear));
  FDRE \generation_reg[9] 
       (.C(clk),
        .CE(active_mode),
        .D(\generation_reg[11]_i_1_n_6 ),
        .Q(status_word[18]),
        .R(clear));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h00002800)) 
    invalidate_capture_i_1
       (.I0(\generation[14]_i_4_n_0 ),
        .I1(status_word[4]),
        .I2(control_word[7]),
        .I3(resetn),
        .I4(\generation[14]_i_5_n_0 ),
        .O(invalidate_capture_i_1_n_0));
  FDRE invalidate_capture_reg
       (.C(clk),
        .CE(1'b1),
        .D(invalidate_capture_i_1_n_0),
        .Q(invalidate_capture),
        .R(1'b0));
  FDRE output_permit_reg
       (.C(clk),
        .CE(active_mode),
        .D(control_word[3]),
        .Q(output_permit_reg_n_0),
        .R(clear));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    pwm_out_INST_0
       (.I0(finite_pwm),
        .I1(finite_select),
        .I2(continuous_pwm),
        .O(pwm_out));
  LUT6 #(
    .INIT(64'hF44F000004400000)) 
    \result_code[0]_i_1 
       (.I0(\result_code[2]_i_3_n_0 ),
        .I1(\result_code[0]_i_2_n_0 ),
        .I2(status_word[4]),
        .I3(control_word[7]),
        .I4(resetn),
        .I5(status_word[5]),
        .O(\result_code[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00FF80E0)) 
    \result_code[0]_i_2 
       (.I0(control_word[0]),
        .I1(control_word[1]),
        .I2(\result_code[0]_i_3_n_0 ),
        .I3(control_word[3]),
        .I4(control_word[2]),
        .O(\result_code[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h00000004)) 
    \result_code[0]_i_3 
       (.I0(capture_active),
        .I1(pwm_active),
        .I2(\settle_count_reg_n_0_[2] ),
        .I3(\settle_count_reg_n_0_[0] ),
        .I4(\settle_count_reg_n_0_[1] ),
        .O(\result_code[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hF22F222202202222)) 
    \result_code[1]_i_1 
       (.I0(\result_code[1]_i_2_n_0 ),
        .I1(\generation[14]_i_5_n_0 ),
        .I2(status_word[4]),
        .I3(control_word[7]),
        .I4(resetn),
        .I5(status_word[6]),
        .O(\result_code[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hA220A2200000A220)) 
    \result_code[1]_i_2 
       (.I0(resetn),
        .I1(control_word[3]),
        .I2(control_word[0]),
        .I3(control_word[1]),
        .I4(\result_code[1]_i_3_n_0 ),
        .I5(status_word[8]),
        .O(\result_code[1]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \result_code[1]_i_3 
       (.I0(pwm_active),
        .I1(capture_active),
        .O(\result_code[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFEEFAAAA0EE0AAAA)) 
    \result_code[2]_i_1 
       (.I0(\result_code[2]_i_2_n_0 ),
        .I1(\result_code[2]_i_3_n_0 ),
        .I2(status_word[4]),
        .I3(control_word[7]),
        .I4(resetn),
        .I5(status_word[7]),
        .O(\result_code[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h88880888)) 
    \result_code[2]_i_2 
       (.I0(control_word[3]),
        .I1(resetn),
        .I2(control_word[0]),
        .I3(control_word[1]),
        .I4(control_word[2]),
        .O(\result_code[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \result_code[2]_i_3 
       (.I0(\result_code[2]_i_4_n_0 ),
        .I1(\result_code[2]_i_5_n_0 ),
        .I2(\result_code[2]_i_6_n_0 ),
        .I3(\result_code[2]_i_7_n_0 ),
        .I4(\result_code[2]_i_8_n_0 ),
        .I5(\result_code[2]_i_9_n_0 ),
        .O(\result_code[2]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \result_code[2]_i_4 
       (.I0(control_word[25]),
        .I1(control_word[24]),
        .I2(control_word[27]),
        .I3(control_word[26]),
        .O(\result_code[2]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \result_code[2]_i_5 
       (.I0(control_word[29]),
        .I1(control_word[28]),
        .I2(control_word[31]),
        .I3(control_word[30]),
        .O(\result_code[2]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \result_code[2]_i_6 
       (.I0(control_word[17]),
        .I1(control_word[16]),
        .I2(control_word[19]),
        .I3(control_word[18]),
        .O(\result_code[2]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \result_code[2]_i_7 
       (.I0(control_word[21]),
        .I1(control_word[20]),
        .I2(control_word[23]),
        .I3(control_word[22]),
        .O(\result_code[2]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \result_code[2]_i_8 
       (.I0(control_word[13]),
        .I1(control_word[12]),
        .I2(control_word[15]),
        .I3(control_word[14]),
        .O(\result_code[2]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFF8)) 
    \result_code[2]_i_9 
       (.I0(control_word[5]),
        .I1(control_word[6]),
        .I2(control_word[9]),
        .I3(control_word[11]),
        .I4(control_word[10]),
        .O(\result_code[2]_i_9_n_0 ));
  FDRE \result_code_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\result_code[0]_i_1_n_0 ),
        .Q(status_word[5]),
        .R(1'b0));
  FDRE \result_code_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\result_code[1]_i_1_n_0 ),
        .Q(status_word[6]),
        .R(1'b0));
  FDRE \result_code_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\result_code[2]_i_1_n_0 ),
        .Q(status_word[7]),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h0000F808)) 
    \sample_out[0]_INST_0 
       (.I0(pwm_out),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(digital_sync[0]),
        .I4(Q[2]),
        .O(sample_out[0]));
  LUT5 #(
    .INIT(32'h0000F808)) 
    \sample_out[1]_INST_0 
       (.I0(\sample_out[1]_INST_0_i_1_n_0 ),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(digital_sync[1]),
        .I4(Q[2]),
        .O(sample_out[1]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sample_out[1]_INST_0_i_1 
       (.I0(finite_event),
        .I1(finite_select),
        .I2(continuous_event),
        .O(\sample_out[1]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFF00FFFFFFC80000)) 
    \settle_count[0]_i_1 
       (.I0(\settle_count[1]_i_2_n_0 ),
        .I1(resetn),
        .I2(\settle_count[0]_i_2_n_0 ),
        .I3(\settle_count[0]_i_3_n_0 ),
        .I4(\settle_count[2]_i_5_n_0 ),
        .I5(\settle_count_reg_n_0_[0] ),
        .O(\settle_count[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFEFFFFFFFEFEFE00)) 
    \settle_count[0]_i_2 
       (.I0(\settle_count_reg_n_0_[2] ),
        .I1(capture_active),
        .I2(pwm_active),
        .I3(control_word[1]),
        .I4(control_word[0]),
        .I5(control_word[3]),
        .O(\settle_count[0]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00A80000)) 
    \settle_count[0]_i_3 
       (.I0(\settle_count_reg_n_0_[1] ),
        .I1(control_word[0]),
        .I2(control_word[1]),
        .I3(\settle_count_reg_n_0_[0] ),
        .I4(resetn),
        .O(\settle_count[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFF80FFFFFF400000)) 
    \settle_count[1]_i_1 
       (.I0(\settle_count_reg_n_0_[0] ),
        .I1(resetn),
        .I2(\settle_count[1]_i_2_n_0 ),
        .I3(\settle_count[1]_i_3_n_0 ),
        .I4(\settle_count[2]_i_5_n_0 ),
        .I5(\settle_count_reg_n_0_[1] ),
        .O(\settle_count[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'hFEEF)) 
    \settle_count[1]_i_2 
       (.I0(control_word[2]),
        .I1(\result_code[2]_i_3_n_0 ),
        .I2(status_word[4]),
        .I3(control_word[7]),
        .O(\settle_count[1]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h300A0000)) 
    \settle_count[1]_i_3 
       (.I0(\settle_count[0]_i_2_n_0 ),
        .I1(\settle_count[2]_i_2_n_0 ),
        .I2(\settle_count_reg_n_0_[1] ),
        .I3(\settle_count_reg_n_0_[0] ),
        .I4(resetn),
        .O(\settle_count[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hC4CCFFFFC4CC0000)) 
    \settle_count[2]_i_1 
       (.I0(\settle_count[2]_i_2_n_0 ),
        .I1(\settle_count[2]_i_3_n_0 ),
        .I2(\generation[14]_i_5_n_0 ),
        .I3(active_mode1),
        .I4(\settle_count[2]_i_5_n_0 ),
        .I5(\settle_count_reg_n_0_[2] ),
        .O(\settle_count[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h01)) 
    \settle_count[2]_i_2 
       (.I0(control_word[1]),
        .I1(control_word[0]),
        .I2(control_word[3]),
        .O(\settle_count[2]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'hA900)) 
    \settle_count[2]_i_3 
       (.I0(\settle_count_reg_n_0_[2] ),
        .I1(\settle_count_reg_n_0_[0] ),
        .I2(\settle_count_reg_n_0_[1] ),
        .I3(resetn),
        .O(\settle_count[2]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \settle_count[2]_i_4 
       (.I0(control_word[7]),
        .I1(status_word[4]),
        .O(active_mode1));
  LUT6 #(
    .INIT(64'hFFFFFFFF11100000)) 
    \settle_count[2]_i_5 
       (.I0(\result_code[2]_i_3_n_0 ),
        .I1(control_word[2]),
        .I2(\settle_count[2]_i_2_n_0 ),
        .I3(\settle_count[2]_i_6_n_0 ),
        .I4(active_mode1),
        .I5(\settle_count[2]_i_7_n_0 ),
        .O(\settle_count[2]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h11010101)) 
    \settle_count[2]_i_6 
       (.I0(capture_active),
        .I1(pwm_active),
        .I2(control_word[3]),
        .I3(control_word[0]),
        .I4(control_word[1]),
        .O(\settle_count[2]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'hFEFF)) 
    \settle_count[2]_i_7 
       (.I0(\settle_count_reg_n_0_[2] ),
        .I1(\settle_count_reg_n_0_[0] ),
        .I2(\settle_count_reg_n_0_[1] ),
        .I3(resetn),
        .O(\settle_count[2]_i_7_n_0 ));
  FDRE \settle_count_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\settle_count[0]_i_1_n_0 ),
        .Q(\settle_count_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \settle_count_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\settle_count[1]_i_1_n_0 ),
        .Q(\settle_count_reg_n_0_[1] ),
        .R(1'b0));
  FDRE \settle_count_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\settle_count[2]_i_1_n_0 ),
        .Q(\settle_count_reg_n_0_[2] ),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \status_word[12]_INST_0 
       (.I0(\settle_count_reg_n_0_[1] ),
        .I1(\settle_count_reg_n_0_[0] ),
        .I2(\settle_count_reg_n_0_[2] ),
        .O(status_word[8]));
  LUT6 #(
    .INIT(64'h0000000020000000)) 
    \status_word[3]_INST_0 
       (.I0(Q[1]),
        .I1(Q[2]),
        .I2(output_permit_reg_n_0),
        .I3(Q[0]),
        .I4(resetn),
        .I5(status_word[8]),
        .O(status_word[0]));
  LUT6 #(
    .INIT(64'h4444444000000000)) 
    trigger_out_INST_0
       (.I0(status_word[8]),
        .I1(resetn),
        .I2(Q[2]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(trigger_out_INST_0_i_1_n_0),
        .O(trigger_out));
  LUT6 #(
    .INIT(64'hFFFFFFFF00001800)) 
    trigger_out_INST_0_i_1
       (.I0(digital_previous[0]),
        .I1(status_word[1]),
        .I2(digital_sync[0]),
        .I3(status_word[2]),
        .I4(status_word[3]),
        .I5(trigger_out_INST_0_i_2_n_0),
        .O(trigger_out_INST_0_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000042CC4200)) 
    trigger_out_INST_0_i_2
       (.I0(digital_sync[1]),
        .I1(status_word[1]),
        .I2(digital_previous[1]),
        .I3(status_word[3]),
        .I4(\sample_out[1]_INST_0_i_1_n_0 ),
        .I5(status_word[2]),
        .O(trigger_out_INST_0_i_2_n_0));
  FDRE \trigger_select_reg[0] 
       (.C(clk),
        .CE(active_mode),
        .D(control_word[4]),
        .Q(status_word[1]),
        .R(clear));
  FDRE \trigger_select_reg[1] 
       (.C(clk),
        .CE(active_mode),
        .D(control_word[5]),
        .Q(status_word[2]),
        .R(clear));
  FDRE \trigger_select_reg[2] 
       (.C(clk),
        .CE(active_mode),
        .D(control_word[6]),
        .Q(status_word[3]),
        .R(clear));
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
