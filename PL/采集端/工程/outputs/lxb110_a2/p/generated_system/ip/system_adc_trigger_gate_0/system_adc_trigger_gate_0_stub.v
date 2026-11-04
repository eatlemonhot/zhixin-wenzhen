// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
// Date        : Thu Oct 22 00:41:41 2026
// Host        : xiaojun running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/33525/FDW_NEXT/outputs/lxb110_a2/p/generated_system/ip/system_adc_trigger_gate_0/system_adc_trigger_gate_0_stub.v
// Design      : system_adc_trigger_gate_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "system_adc_trigger_gate_0,fdw_adc_trigger_gate,{}" *) (* CORE_GENERATION_INFO = "system_adc_trigger_gate_0,fdw_adc_trigger_gate,{x_ipProduct=Vivado 2025.1,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=fdw_adc_trigger_gate,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) 
(* IP_DEFINITION_SOURCE = "module_ref" *) (* X_CORE_INFO = "fdw_adc_trigger_gate,Vivado 2025.1" *) 
module system_adc_trigger_gate_0(control_clk, control_resetn, sample_clk, 
  sample_resetn, capture_control, trigger_event, legacy_control, trigger_status)
/* synthesis syn_black_box black_box_pad_pin="control_resetn,sample_resetn,capture_control[2:0],trigger_event,legacy_control[1:0],trigger_status[3:0]" */
/* synthesis syn_force_seq_prim="control_clk" */
/* synthesis syn_force_seq_prim="sample_clk" */;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 control_clk CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME control_clk, ASSOCIATED_RESET control_resetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input control_clk /* synthesis syn_isclock = 1 */;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 control_resetn RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME control_resetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input control_resetn;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 sample_clk CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME sample_clk, ASSOCIATED_RESET sample_resetn, FREQ_HZ 25000000, FREQ_TOLERANCE_HZ 0, PHASE 180.0, CLK_DOMAIN /adc_clk_wiz_clk_out1, INSERT_VIP 0" *) input sample_clk /* synthesis syn_isclock = 1 */;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 sample_resetn RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME sample_resetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input sample_resetn;
  input [2:0]capture_control;
  input trigger_event;
  output [1:0]legacy_control;
  output [3:0]trigger_status;
endmodule
