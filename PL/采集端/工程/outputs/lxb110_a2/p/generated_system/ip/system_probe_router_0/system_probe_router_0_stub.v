// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
// Date        : Thu Oct 22 00:36:55 2026
// Host        : xiaojun running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/33525/FDW_NEXT/outputs/lxb110_a2/p/generated_system/ip/system_probe_router_0/system_probe_router_0_stub.v
// Design      : system_probe_router_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "system_probe_router_0,fdw_probe_router,{}" *) (* CORE_GENERATION_INFO = "system_probe_router_0,fdw_probe_router,{x_ipProduct=Vivado 2025.1,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=fdw_probe_router,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) 
(* IP_DEFINITION_SOURCE = "module_ref" *) (* X_CORE_INFO = "fdw_probe_router,Vivado 2025.1" *) 
module system_probe_router_0(clk, resetn, control_word, status_word, 
  digital_in, continuous_pwm, continuous_event, finite_pwm, finite_event, pwm_active, 
  capture_active, sample_out, trigger_out, invalidate_capture, pwm_out)
/* synthesis syn_black_box black_box_pad_pin="resetn,control_word[31:0],status_word[31:0],digital_in[1:0],continuous_pwm,continuous_event,finite_pwm,finite_event,pwm_active,capture_active,sample_out[1:0],trigger_out,invalidate_capture,pwm_out" */
/* synthesis syn_force_seq_prim="clk" */;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, ASSOCIATED_RESET resetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input clk /* synthesis syn_isclock = 1 */;
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
endmodule
