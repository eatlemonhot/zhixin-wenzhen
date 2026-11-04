// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
// Date        : Thu Oct 22 00:42:10 2026
// Host        : xiaojun running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/33525/FDW_NEXT/outputs/lxb110_a2/p/generated_system/ip/system_adc_capture_0/system_adc_capture_0_stub.v
// Design      : system_adc_capture_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "system_adc_capture_0,fdw_adc_phase_axis_source,{}" *) (* CORE_GENERATION_INFO = "system_adc_capture_0,fdw_adc_phase_axis_source,{x_ipProduct=Vivado 2025.1,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=fdw_adc_phase_axis_source,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,FRAME_SAMPLES=8192}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) 
(* IP_DEFINITION_SOURCE = "module_ref" *) (* X_CORE_INFO = "fdw_adc_phase_axis_source,Vivado 2025.1" *) 
module system_adc_capture_0(sample_clk, adc_clk_0, control_clk, 
  control_resetn, phase_command_word, legacy_status, phase_status_word, reference_valid, 
  reference_inverted, reference_phase, reference_ftw, reference_tag, aresetn, adc_data, 
  adc_otr, adc_clk, capture_control, capture_start_sampled, capture_clear_ack, fifo_aresetn, 
  capture_active, capture_done, m_axis_tdata, m_axis_tvalid, m_axis_tready, m_axis_tlast)
/* synthesis syn_black_box black_box_pad_pin="control_resetn,phase_command_word[31:0],legacy_status[6:0],phase_status_word[31:0],reference_valid,reference_inverted,reference_phase[31:0],reference_ftw[31:0],reference_tag[31:0],aresetn,adc_data[11:0],adc_otr,adc_clk,capture_control[1:0],capture_start_sampled,capture_clear_ack,fifo_aresetn,capture_active,capture_done,m_axis_tdata[15:0],m_axis_tvalid,m_axis_tready,m_axis_tlast" */
/* synthesis syn_force_seq_prim="sample_clk" */
/* synthesis syn_force_seq_prim="adc_clk_0" */
/* synthesis syn_force_seq_prim="control_clk" */;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 sample_clk CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME sample_clk, ASSOCIATED_BUSIF M_AXIS, ASSOCIATED_RESET aresetn, FREQ_HZ 25000000, FREQ_TOLERANCE_HZ 0, PHASE 180.0, CLK_DOMAIN /adc_clk_wiz_clk_out1, INSERT_VIP 0" *) input sample_clk /* synthesis syn_isclock = 1 */;
  input adc_clk_0 /* synthesis syn_isclock = 1 */;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 control_clk CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME control_clk, ASSOCIATED_RESET control_resetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input control_clk /* synthesis syn_isclock = 1 */;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 control_resetn RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME control_resetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input control_resetn;
  input [31:0]phase_command_word;
  input [6:0]legacy_status;
  output [31:0]phase_status_word;
  input reference_valid;
  input reference_inverted;
  input [31:0]reference_phase;
  input [31:0]reference_ftw;
  input [31:0]reference_tag;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 aresetn RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input aresetn;
  input [11:0]adc_data;
  input adc_otr;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 adc_clk CLK" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME adc_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_adc_capture_0_adc_clk, INSERT_VIP 0" *) output adc_clk;
  input [1:0]capture_control;
  output capture_start_sampled;
  output capture_clear_ack;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 fifo_aresetn RST" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME fifo_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) output fifo_aresetn;
  output capture_active;
  output capture_done;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TDATA" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS, TDATA_NUM_BYTES 2, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 25000000, PHASE 180.0, CLK_DOMAIN /adc_clk_wiz_clk_out1, LAYERED_METADATA undef, INSERT_VIP 0" *) output [15:0]m_axis_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TVALID" *) output m_axis_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TREADY" *) input m_axis_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TLAST" *) output m_axis_tlast;
endmodule
