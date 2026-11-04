// (c) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// (c) Copyright 2022-2026 Advanced Micro Devices, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of AMD and is protected under U.S. and international copyright
// and other intellectual property laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// AMD, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) AMD shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or AMD had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// AMD products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of AMD products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:module_ref:fdw_adc_phase_axis_source:1.0
// IP Revision: 1

`timescale 1ns/1ps

(* IP_DEFINITION_SOURCE = "module_ref" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module system_adc_capture_0 (
  sample_clk,
  adc_clk_0,
  control_clk,
  control_resetn,
  phase_command_word,
  legacy_status,
  phase_status_word,
  reference_valid,
  reference_inverted,
  reference_phase,
  reference_ftw,
  reference_tag,
  aresetn,
  adc_data,
  adc_otr,
  adc_clk,
  capture_control,
  capture_start_sampled,
  capture_clear_ack,
  fifo_aresetn,
  capture_active,
  capture_done,
  m_axis_tdata,
  m_axis_tvalid,
  m_axis_tready,
  m_axis_tlast
);

(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 sample_clk CLK" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME sample_clk, ASSOCIATED_BUSIF M_AXIS, ASSOCIATED_RESET aresetn, FREQ_HZ 25000000, FREQ_TOLERANCE_HZ 0, PHASE 180.0, CLK_DOMAIN /adc_clk_wiz_clk_out1, INSERT_VIP 0" *)
input wire sample_clk;
input wire adc_clk_0;
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 control_clk CLK" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME control_clk, ASSOCIATED_RESET control_resetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *)
input wire control_clk;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 control_resetn RST" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME control_resetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
input wire control_resetn;
input wire [31 : 0] phase_command_word;
input wire [6 : 0] legacy_status;
output wire [31 : 0] phase_status_word;
input wire reference_valid;
input wire reference_inverted;
input wire [31 : 0] reference_phase;
input wire [31 : 0] reference_ftw;
input wire [31 : 0] reference_tag;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 aresetn RST" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
input wire aresetn;
input wire [11 : 0] adc_data;
input wire adc_otr;
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 adc_clk CLK" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME adc_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_adc_capture_0_adc_clk, INSERT_VIP 0" *)
output wire adc_clk;
input wire [1 : 0] capture_control;
output wire capture_start_sampled;
output wire capture_clear_ack;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 fifo_aresetn RST" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME fifo_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
output wire fifo_aresetn;
output wire capture_active;
output wire capture_done;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TDATA" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS, TDATA_NUM_BYTES 2, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 25000000, PHASE 180.0, CLK_DOMAIN /adc_clk_wiz_clk_out1, LAYERED_METADATA undef, INSERT_VIP 0" *)
output wire [15 : 0] m_axis_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TVALID" *)
output wire m_axis_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TREADY" *)
input wire m_axis_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TLAST" *)
output wire m_axis_tlast;

  fdw_adc_phase_axis_source #(
    .FRAME_SAMPLES(8192)
  ) inst (
    .sample_clk(sample_clk),
    .adc_clk_0(adc_clk_0),
    .control_clk(control_clk),
    .control_resetn(control_resetn),
    .phase_command_word(phase_command_word),
    .legacy_status(legacy_status),
    .phase_status_word(phase_status_word),
    .reference_valid(reference_valid),
    .reference_inverted(reference_inverted),
    .reference_phase(reference_phase),
    .reference_ftw(reference_ftw),
    .reference_tag(reference_tag),
    .aresetn(aresetn),
    .adc_data(adc_data),
    .adc_otr(adc_otr),
    .adc_clk(adc_clk),
    .capture_control(capture_control),
    .capture_start_sampled(capture_start_sampled),
    .capture_clear_ack(capture_clear_ack),
    .fifo_aresetn(fifo_aresetn),
    .capture_active(capture_active),
    .capture_done(capture_done),
    .m_axis_tdata(m_axis_tdata),
    .m_axis_tvalid(m_axis_tvalid),
    .m_axis_tready(m_axis_tready),
    .m_axis_tlast(m_axis_tlast)
  );
endmodule
