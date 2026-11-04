// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
// Date        : Thu Oct 22 00:39:10 2026
// Host        : xiaojun running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/33525/FDW_NEXT/outputs/lxb110_a2/p/generated_system/ip/system_probe_pads_0/system_probe_pads_0_stub.v
// Design      : system_probe_pads_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "system_probe_pads_0,fdw_lxb_probe_io,{}" *) (* CORE_GENERATION_INFO = "system_probe_pads_0,fdw_lxb_probe_io,{x_ipProduct=Vivado 2025.1,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=fdw_lxb_probe_io,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) 
(* IP_DEFINITION_SOURCE = "module_ref" *) (* X_CORE_INFO = "fdw_lxb_probe_io,Vivado 2025.1" *) 
module system_probe_pads_0(resetn, permit, output_mask, pwm_a, pwm_b, 
  digital_in, probe_io)
/* synthesis syn_black_box black_box_pad_pin="resetn,permit,output_mask[1:0],pwm_a,pwm_b,digital_in[1:0],probe_io[1:0]" */;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 resetn RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME resetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input resetn;
  input permit;
  input [1:0]output_mask;
  input pwm_a;
  input pwm_b;
  output [1:0]digital_in;
  inout [1:0]probe_io;
endmodule
