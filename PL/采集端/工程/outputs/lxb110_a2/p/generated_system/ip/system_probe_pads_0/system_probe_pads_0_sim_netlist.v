// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
// Date        : Thu Oct 22 00:39:10 2026
// Host        : xiaojun running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/33525/FDW_NEXT/outputs/lxb110_a2/p/generated_system/ip/system_probe_pads_0/system_probe_pads_0_sim_netlist.v
// Design      : system_probe_pads_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "system_probe_pads_0,fdw_lxb_probe_io,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "fdw_lxb_probe_io,Vivado 2025.1" *) 
(* NotValidForBitStream *)
module system_probe_pads_0
   (resetn,
    permit,
    output_mask,
    pwm_a,
    pwm_b,
    digital_in,
    probe_io);
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 resetn RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME resetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input resetn;
  input permit;
  input [1:0]output_mask;
  input pwm_a;
  input pwm_b;
  output [1:0]digital_in;
  inout [1:0]probe_io;

  (* DRIVE = "12" *) (* IBUF_LOW_PWR *) (* SLEW = "SLOW" *) wire [1:0]digital_in;
  wire [1:0]output_mask;
  wire permit;
  (* DRIVE = "12" *) (* IBUF_LOW_PWR *) (* SLEW = "SLOW" *) wire [1:0]probe_io;
  (* DRIVE = "12" *) (* IBUF_LOW_PWR *) (* SLEW = "SLOW" *) wire pwm_a;
  (* DRIVE = "12" *) (* IBUF_LOW_PWR *) (* SLEW = "SLOW" *) wire pwm_b;
  wire resetn;

  system_probe_pads_0_fdw_lxb_probe_io inst
       (.digital_in(digital_in),
        .output_mask(output_mask),
        .permit(permit),
        .probe_io(probe_io),
        .pwm_a(pwm_a),
        .pwm_b(pwm_b),
        .resetn(resetn));
endmodule

(* ORIG_REF_NAME = "fdw_lxb_probe_io" *) 
module system_probe_pads_0_fdw_lxb_probe_io
   (digital_in,
    probe_io,
    pwm_a,
    pwm_b,
    permit,
    resetn,
    output_mask);
  output [1:0]digital_in;
  inout [1:0]probe_io;
  input pwm_a;
  input pwm_b;
  input permit;
  input resetn;
  input [1:0]output_mask;

  wire T0;
  wire [1:0]digital_in;
  wire [1:0]output_mask;
  wire permit;
  wire probe_b_i_1_n_0;
  wire [1:0]probe_io;
  wire pwm_a;
  wire pwm_b;
  wire resetn;

  (* BOX_TYPE = "PRIMITIVE" *) 
  IOBUF #(
    .IOSTANDARD("DEFAULT")) 
    probe_a
       (.I(pwm_a),
        .IO(probe_io[0]),
        .O(digital_in[0]),
        .T(T0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    probe_a_i_1
       (.I0(permit),
        .I1(resetn),
        .I2(output_mask[0]),
        .O(T0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  IOBUF #(
    .IOSTANDARD("DEFAULT")) 
    probe_b
       (.I(pwm_b),
        .IO(probe_io[1]),
        .O(digital_in[1]),
        .T(probe_b_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    probe_b_i_1
       (.I0(permit),
        .I1(resetn),
        .I2(output_mask[1]),
        .O(probe_b_i_1_n_0));
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
