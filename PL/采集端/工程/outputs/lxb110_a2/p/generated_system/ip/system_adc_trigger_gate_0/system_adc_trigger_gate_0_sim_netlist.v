// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
// Date        : Thu Oct 22 00:41:41 2026
// Host        : xiaojun running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/33525/FDW_NEXT/outputs/lxb110_a2/p/generated_system/ip/system_adc_trigger_gate_0/system_adc_trigger_gate_0_sim_netlist.v
// Design      : system_adc_trigger_gate_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "system_adc_trigger_gate_0,fdw_adc_trigger_gate,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "fdw_adc_trigger_gate,Vivado 2025.1" *) 
(* NotValidForBitStream *)
module system_adc_trigger_gate_0
   (control_clk,
    control_resetn,
    sample_clk,
    sample_resetn,
    capture_control,
    trigger_event,
    legacy_control,
    trigger_status);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 control_clk CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME control_clk, ASSOCIATED_RESET control_resetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input control_clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 control_resetn RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME control_resetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input control_resetn;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 sample_clk CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME sample_clk, ASSOCIATED_RESET sample_resetn, FREQ_HZ 25000000, FREQ_TOLERANCE_HZ 0, PHASE 180.0, CLK_DOMAIN /adc_clk_wiz_clk_out1, INSERT_VIP 0" *) input sample_clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 sample_resetn RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME sample_resetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input sample_resetn;
  input [2:0]capture_control;
  input trigger_event;
  output [1:0]legacy_control;
  output [3:0]trigger_status;

  wire [2:0]capture_control;
  wire control_clk;
  wire control_resetn;
  wire [0:0]\^legacy_control ;
  wire sample_clk;
  wire sample_resetn;
  wire trigger_event;
  wire [2:0]\^trigger_status ;

  assign legacy_control[1] = capture_control[1];
  assign legacy_control[0] = \^legacy_control [0];
  assign trigger_status[3] = capture_control[2];
  assign trigger_status[2:0] = \^trigger_status [2:0];
  system_adc_trigger_gate_0_fdw_adc_trigger_gate inst
       (.capture_control(capture_control),
        .control_clk(control_clk),
        .control_resetn(control_resetn),
        .legacy_control(\^legacy_control ),
        .sample_clk(sample_clk),
        .sample_resetn(sample_resetn),
        .trigger_event(trigger_event),
        .trigger_status(\^trigger_status ));
endmodule

(* ORIG_REF_NAME = "fdw_adc_trigger_gate" *) 
module system_adc_trigger_gate_0_fdw_adc_trigger_gate
   (trigger_status,
    legacy_control,
    control_clk,
    sample_clk,
    capture_control,
    control_resetn,
    sample_resetn,
    trigger_event);
  output [2:0]trigger_status;
  output [0:0]legacy_control;
  input control_clk;
  input sample_clk;
  input [2:0]capture_control;
  input control_resetn;
  input sample_resetn;
  input trigger_event;

  wire arm_previous;
  wire arm_previous_i_1_n_0;
  wire bridge_n_1;
  wire bridge_n_2;
  wire [2:0]capture_control;
  wire control_clk;
  wire control_resetn;
  wire [0:0]legacy_control;
  wire sample_clk;
  wire sample_resetn;
  wire trigger_event;
  wire [2:0]trigger_status;
  wire waiting_i_2_n_0;

  LUT4 #(
    .INIT(16'h0800)) 
    arm_previous_i_1
       (.I0(sample_resetn),
        .I1(control_resetn),
        .I2(capture_control[1]),
        .I3(capture_control[0]),
        .O(arm_previous_i_1_n_0));
  FDRE arm_previous_reg
       (.C(control_clk),
        .CE(1'b1),
        .D(arm_previous_i_1_n_0),
        .Q(arm_previous),
        .R(1'b0));
  system_adc_trigger_gate_0_fdw_event_cdc bridge
       (.arm_previous(arm_previous),
        .capture_control(capture_control),
        .capture_control_2_sp_1(bridge_n_2),
        .control_clk(control_clk),
        .control_resetn(control_resetn),
        .event_accepted_reg(trigger_status[1]),
        .event_accepted_reg_0(trigger_status[0]),
        .legacy_control(legacy_control),
        .sample_clk(sample_clk),
        .sample_resetn(sample_resetn),
        .\src_reset_release_reg[1]_0 (bridge_n_1),
        .trigger_event(trigger_event),
        .trigger_status(trigger_status[2]),
        .waiting_reg(waiting_i_2_n_0));
  FDRE event_accepted_reg
       (.C(control_clk),
        .CE(1'b1),
        .D(bridge_n_2),
        .Q(trigger_status[1]),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hAABA0000)) 
    waiting_i_2
       (.I0(trigger_status[0]),
        .I1(arm_previous),
        .I2(capture_control[0]),
        .I3(trigger_status[1]),
        .I4(capture_control[2]),
        .O(waiting_i_2_n_0));
  FDRE waiting_reg
       (.C(control_clk),
        .CE(1'b1),
        .D(bridge_n_1),
        .Q(trigger_status[0]),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "fdw_event_cdc" *) 
module system_adc_trigger_gate_0_fdw_event_cdc
   (trigger_status,
    \src_reset_release_reg[1]_0 ,
    capture_control_2_sp_1,
    legacy_control,
    sample_clk,
    control_clk,
    capture_control,
    control_resetn,
    sample_resetn,
    waiting_reg,
    event_accepted_reg,
    trigger_event,
    event_accepted_reg_0,
    arm_previous);
  output [0:0]trigger_status;
  output \src_reset_release_reg[1]_0 ;
  output capture_control_2_sp_1;
  output [0:0]legacy_control;
  input sample_clk;
  input control_clk;
  input [2:0]capture_control;
  input control_resetn;
  input sample_resetn;
  input waiting_reg;
  input event_accepted_reg;
  input trigger_event;
  input [0:0]event_accepted_reg_0;
  input arm_previous;

  (* async_reg = "true" *) (* shreg_extract = "no" *) wire [1:0]acknowledge_sync;
  wire acknowledge_toggle;
  wire acknowledge_toggle_i_1_n_0;
  wire arm_previous;
  wire [2:0]capture_control;
  wire capture_control_2_sn_1;
  wire control_clk;
  wire control_resetn;
  wire dst_pulse_i_1_n_0;
  (* async_reg = "true" *) (* shreg_extract = "no" *) wire [1:0]dst_reset_release;
  wire event_accepted_i_3_n_0;
  wire event_accepted_reg;
  wire [0:0]event_accepted_reg_0;
  wire event_ready;
  wire event_valid3;
  wire [0:0]legacy_control;
  (* async_reg = "true" *) (* shreg_extract = "no" *) wire [1:0]request_sync;
  wire request_toggle_i_1_n_0;
  wire request_toggle_reg_n_0;
  wire sample_clk;
  wire sample_pulse;
  wire sample_resetn;
  (* async_reg = "true" *) (* shreg_extract = "no" *) wire [1:0]src_reset_release;
  wire \src_reset_release[1]_i_1_n_0 ;
  wire \src_reset_release_reg[1]_0 ;
  wire trigger_event;
  wire [0:0]trigger_status;
  wire waiting_reg;

  assign capture_control_2_sp_1 = capture_control_2_sn_1;
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "no" *) 
  FDCE \acknowledge_sync_reg[0] 
       (.C(control_clk),
        .CE(1'b1),
        .CLR(\src_reset_release[1]_i_1_n_0 ),
        .D(acknowledge_toggle),
        .Q(acknowledge_sync[0]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "no" *) 
  FDCE \acknowledge_sync_reg[1] 
       (.C(control_clk),
        .CE(1'b1),
        .CLR(\src_reset_release[1]_i_1_n_0 ),
        .D(acknowledge_sync[0]),
        .Q(acknowledge_sync[1]));
  LUT2 #(
    .INIT(4'h8)) 
    acknowledge_toggle_i_1
       (.I0(request_sync[1]),
        .I1(dst_reset_release[1]),
        .O(acknowledge_toggle_i_1_n_0));
  FDCE acknowledge_toggle_reg
       (.C(sample_clk),
        .CE(1'b1),
        .CLR(\src_reset_release[1]_i_1_n_0 ),
        .D(acknowledge_toggle_i_1_n_0),
        .Q(acknowledge_toggle));
  LUT3 #(
    .INIT(8'h28)) 
    dst_pulse_i_1
       (.I0(dst_reset_release[1]),
        .I1(request_sync[1]),
        .I2(acknowledge_toggle),
        .O(dst_pulse_i_1_n_0));
  FDCE dst_pulse_reg
       (.C(sample_clk),
        .CE(1'b1),
        .CLR(\src_reset_release[1]_i_1_n_0 ),
        .D(dst_pulse_i_1_n_0),
        .Q(sample_pulse));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "no" *) 
  FDCE \dst_reset_release_reg[0] 
       (.C(sample_clk),
        .CE(1'b1),
        .CLR(\src_reset_release[1]_i_1_n_0 ),
        .D(1'b1),
        .Q(dst_reset_release[0]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "no" *) 
  FDCE \dst_reset_release_reg[1] 
       (.C(sample_clk),
        .CE(1'b1),
        .CLR(\src_reset_release[1]_i_1_n_0 ),
        .D(dst_reset_release[0]),
        .Q(dst_reset_release[1]));
  LUT5 #(
    .INIT(32'hAA800000)) 
    event_accepted_i_1
       (.I0(capture_control[2]),
        .I1(event_ready),
        .I2(event_accepted_i_3_n_0),
        .I3(event_accepted_reg),
        .I4(event_valid3),
        .O(capture_control_2_sn_1));
  LUT6 #(
    .INIT(64'h0000000082000000)) 
    event_accepted_i_2
       (.I0(src_reset_release[1]),
        .I1(acknowledge_sync[1]),
        .I2(request_toggle_reg_n_0),
        .I3(sample_resetn),
        .I4(control_resetn),
        .I5(capture_control[1]),
        .O(event_ready));
  LUT6 #(
    .INIT(64'h0800080008080800)) 
    event_accepted_i_3
       (.I0(trigger_event),
        .I1(capture_control[2]),
        .I2(event_accepted_reg),
        .I3(event_accepted_reg_0),
        .I4(capture_control[0]),
        .I5(arm_previous),
        .O(event_accepted_i_3_n_0));
  LUT3 #(
    .INIT(8'h40)) 
    event_accepted_i_4
       (.I0(capture_control[1]),
        .I1(control_resetn),
        .I2(sample_resetn),
        .O(event_valid3));
  LUT3 #(
    .INIT(8'hB8)) 
    \legacy_control[0]_INST_0 
       (.I0(sample_pulse),
        .I1(capture_control[2]),
        .I2(capture_control[0]),
        .O(legacy_control));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "no" *) 
  FDCE \request_sync_reg[0] 
       (.C(sample_clk),
        .CE(1'b1),
        .CLR(\src_reset_release[1]_i_1_n_0 ),
        .D(request_toggle_reg_n_0),
        .Q(request_sync[0]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "no" *) 
  FDCE \request_sync_reg[1] 
       (.C(sample_clk),
        .CE(1'b1),
        .CLR(\src_reset_release[1]_i_1_n_0 ),
        .D(request_sync[0]),
        .Q(request_sync[1]));
  LUT5 #(
    .INIT(32'h5CCC0000)) 
    request_toggle_i_1
       (.I0(acknowledge_sync[1]),
        .I1(request_toggle_reg_n_0),
        .I2(event_valid3),
        .I3(event_accepted_i_3_n_0),
        .I4(src_reset_release[1]),
        .O(request_toggle_i_1_n_0));
  FDCE request_toggle_reg
       (.C(control_clk),
        .CE(1'b1),
        .CLR(\src_reset_release[1]_i_1_n_0 ),
        .D(request_toggle_i_1_n_0),
        .Q(request_toggle_reg_n_0));
  LUT3 #(
    .INIT(8'hF7)) 
    \src_reset_release[1]_i_1 
       (.I0(sample_resetn),
        .I1(control_resetn),
        .I2(capture_control[1]),
        .O(\src_reset_release[1]_i_1_n_0 ));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "no" *) 
  FDCE \src_reset_release_reg[0] 
       (.C(control_clk),
        .CE(1'b1),
        .CLR(\src_reset_release[1]_i_1_n_0 ),
        .D(1'b1),
        .Q(src_reset_release[0]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "no" *) 
  FDCE \src_reset_release_reg[1] 
       (.C(control_clk),
        .CE(1'b1),
        .CLR(\src_reset_release[1]_i_1_n_0 ),
        .D(src_reset_release[0]),
        .Q(src_reset_release[1]));
  LUT6 #(
    .INIT(64'hBFFFFFBFFFFFFFFF)) 
    \trigger_status[2]_INST_0 
       (.I0(capture_control[1]),
        .I1(control_resetn),
        .I2(sample_resetn),
        .I3(request_toggle_reg_n_0),
        .I4(acknowledge_sync[1]),
        .I5(src_reset_release[1]),
        .O(trigger_status));
  LUT6 #(
    .INIT(64'h2AA20000AAAA0000)) 
    waiting_i_1
       (.I0(waiting_reg),
        .I1(src_reset_release[1]),
        .I2(acknowledge_sync[1]),
        .I3(request_toggle_reg_n_0),
        .I4(event_valid3),
        .I5(event_accepted_i_3_n_0),
        .O(\src_reset_release_reg[1]_0 ));
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
