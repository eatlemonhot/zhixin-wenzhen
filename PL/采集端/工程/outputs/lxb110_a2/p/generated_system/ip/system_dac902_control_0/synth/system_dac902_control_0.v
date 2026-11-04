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


// IP VLNV: xilinx.com:module_ref:fdw_dac902_phase_control:1.0
// IP Revision: 1

(* X_CORE_INFO = "fdw_dac902_phase_control,Vivado 2025.1" *)
(* CHECK_LICENSE_TYPE = "system_dac902_control_0,fdw_dac902_phase_control,{}" *)
(* CORE_GENERATION_INFO = "system_dac902_control_0,fdw_dac902_phase_control,{x_ipProduct=Vivado 2025.1,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=fdw_dac902_phase_control,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,ROM_FILE=C_/Users/33525/FDW_NEXT/hardware/7020/candidates/lxb_r4_port/rtl/fdw_sine12_4096.mem}" *)
(* IP_DEFINITION_SOURCE = "module_ref" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module system_dac902_control_0 (
  control_clk,
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
  reference_tag
);

(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 control_clk CLK" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME control_clk, ASSOCIATED_RESET control_resetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *)
input wire control_clk;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 control_resetn RST" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME control_resetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
input wire control_resetn;
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 sample_clk CLK" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME sample_clk, ASSOCIATED_RESET sample_resetn, FREQ_HZ 25000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /adc_clk_wiz_clk_out1, INSERT_VIP 0" *)
input wire sample_clk;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 sample_resetn RST" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME sample_resetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
input wire sample_resetn;
input wire [31 : 0] command_word;
output wire [31 : 0] status_word;
output wire [11 : 0] dac_data;
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 dac_clk CLK" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME dac_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_dac902_control_0_dac_clk, INSERT_VIP 0" *)
output wire dac_clk;
output wire reference_valid;
output wire reference_inverted;
output wire [31 : 0] reference_phase;
output wire [31 : 0] reference_ftw;
output wire [31 : 0] reference_tag;

  fdw_dac902_phase_control #(
    .ROM_FILE("C:/Users/33525/Desktop/文档/源码文案精简_20261102/飞针系统_代码_20261102/PL/7020/工程/hardware/7020/candidates/lxb_r4_port/rtl/fdw_sine12_4096.mem")
  ) inst (
    .control_clk(control_clk),
    .control_resetn(control_resetn),
    .sample_clk(sample_clk),
    .sample_resetn(sample_resetn),
    .command_word(command_word),
    .status_word(status_word),
    .dac_data(dac_data),
    .dac_clk(dac_clk),
    .reference_valid(reference_valid),
    .reference_inverted(reference_inverted),
    .reference_phase(reference_phase),
    .reference_ftw(reference_ftw),
    .reference_tag(reference_tag)
  );
endmodule
