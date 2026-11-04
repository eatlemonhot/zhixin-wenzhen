// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Thu Oct 15 01:35:26 2026
// Host        : xiaojun running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               C:/Users/33525/Desktop/文档/源码文案精简_20261102/飞针系统_代码_20261102/PL/悟净/工程/vendor_project/rtl/ip/windex_buf_2b_16w/windex_buf_2b_16w_stub.v
// Design      : windex_buf_2b_16w
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z030ffg676-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fifo_generator_v13_2_3,Vivado 2018.3" *)
module windex_buf_2b_16w(rst, wr_clk, rd_clk, din, wr_en, rd_en, dout, full, 
  empty)
/* synthesis syn_black_box black_box_pad_pin="rst,wr_clk,rd_clk,din[1:0],wr_en,rd_en,dout[1:0],full,empty" */;
  input rst;
  input wr_clk;
  input rd_clk;
  input [1:0]din;
  input wr_en;
  input rd_en;
  output [1:0]dout;
  output full;
  output empty;
endmodule
