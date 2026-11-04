// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
// Date        : Thu Oct 22 00:42:11 2026
// Host        : xiaojun running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/33525/FDW_NEXT/outputs/lxb110_a2/p/generated_system/ip/system_pwm_control_b_0/system_pwm_control_b_0_sim_netlist.v
// Design      : system_pwm_control_b_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "system_pwm_control_b_0,fdw_pwm_axi,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "fdw_pwm_axi,Vivado 2025.1" *) 
(* NotValidForBitStream *)
module system_pwm_control_b_0
   (s_axi_aclk,
    s_axi_aresetn,
    s_axi_awaddr,
    s_axi_awprot,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_araddr,
    s_axi_arprot,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rvalid,
    s_axi_rready,
    pwm_out,
    period_start,
    activity);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 s_axi_aclk CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi_aclk, ASSOCIATED_BUSIF S_AXI, ASSOCIATED_RESET s_axi_aresetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input s_axi_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 s_axi_aresetn RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input s_axi_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWADDR" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXI, PROTOCOL AXI4LITE, DATA_WIDTH 32, ADDR_WIDTH 12, READ_WRITE_MODE READ_WRITE, FREQ_HZ 100000000, ID_WIDTH 0, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN system_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input [11:0]s_axi_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWPROT" *) input [2:0]s_axi_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWVALID" *) input s_axi_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWREADY" *) output s_axi_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WDATA" *) input [31:0]s_axi_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WSTRB" *) input [3:0]s_axi_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WVALID" *) input s_axi_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WREADY" *) output s_axi_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BRESP" *) output [1:0]s_axi_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BVALID" *) output s_axi_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BREADY" *) input s_axi_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARADDR" *) input [11:0]s_axi_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARPROT" *) input [2:0]s_axi_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARVALID" *) input s_axi_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARREADY" *) output s_axi_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) output [31:0]s_axi_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RRESP" *) output [1:0]s_axi_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RVALID" *) output s_axi_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RREADY" *) input s_axi_rready;
  output pwm_out;
  output period_start;
  output activity;

  wire \<const0> ;
  wire activity;
  wire period_start;
  wire pwm_out;
  wire s_axi_aclk;
  wire [11:0]s_axi_araddr;
  wire s_axi_aresetn;
  wire s_axi_arready;
  wire s_axi_arvalid;
  wire [11:0]s_axi_awaddr;
  wire s_axi_awready;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire [1:1]\^s_axi_bresp ;
  wire s_axi_bvalid;
  wire [31:0]s_axi_rdata;
  wire s_axi_rready;
  wire [1:1]\^s_axi_rresp ;
  wire s_axi_rvalid;
  wire [31:0]s_axi_wdata;
  wire s_axi_wready;
  wire [3:0]s_axi_wstrb;
  wire s_axi_wvalid;

  assign s_axi_bresp[1] = \^s_axi_bresp [1];
  assign s_axi_bresp[0] = \<const0> ;
  assign s_axi_rresp[1] = \^s_axi_rresp [1];
  assign s_axi_rresp[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  system_pwm_control_b_0_fdw_pwm_axi inst
       (.activity(activity),
        .period_start(period_start),
        .pwm_out(pwm_out),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_araddr(s_axi_araddr),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_arready(s_axi_arready),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awready(s_axi_awready),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bready(s_axi_bready),
        .s_axi_bresp(\^s_axi_bresp ),
        .s_axi_bvalid_reg_0(s_axi_bvalid),
        .s_axi_rdata(s_axi_rdata),
        .s_axi_rready(s_axi_rready),
        .s_axi_rresp(\^s_axi_rresp ),
        .s_axi_rvalid_reg_0(s_axi_rvalid),
        .s_axi_wdata(s_axi_wdata),
        .s_axi_wready(s_axi_wready),
        .s_axi_wstrb(s_axi_wstrb),
        .s_axi_wvalid(s_axi_wvalid));
endmodule

(* ORIG_REF_NAME = "fdw_pwm_axi" *) 
module system_pwm_control_b_0_fdw_pwm_axi
   (s_axi_rdata,
    s_axi_rresp,
    period_start,
    s_axi_wready,
    s_axi_bvalid_reg_0,
    s_axi_awready,
    s_axi_arready,
    s_axi_rvalid_reg_0,
    activity,
    s_axi_bresp,
    pwm_out,
    s_axi_awaddr,
    s_axi_aclk,
    s_axi_wstrb,
    s_axi_wdata,
    s_axi_aresetn,
    s_axi_araddr,
    s_axi_awvalid,
    s_axi_wvalid,
    s_axi_arvalid,
    s_axi_bready,
    s_axi_rready);
  output [31:0]s_axi_rdata;
  output [0:0]s_axi_rresp;
  output period_start;
  output s_axi_wready;
  output s_axi_bvalid_reg_0;
  output s_axi_awready;
  output s_axi_arready;
  output s_axi_rvalid_reg_0;
  output activity;
  output [0:0]s_axi_bresp;
  output pwm_out;
  input [11:0]s_axi_awaddr;
  input s_axi_aclk;
  input [3:0]s_axi_wstrb;
  input [31:0]s_axi_wdata;
  input s_axi_aresetn;
  input [11:0]s_axi_araddr;
  input s_axi_awvalid;
  input s_axi_wvalid;
  input s_axi_arvalid;
  input s_axi_bready;
  input s_axi_rready;

  wire activity;
  wire address_pending;
  wire address_pending0;
  wire address_pending_i_1_n_0;
  wire applied_sticky;
  wire applied_sticky_i_1_n_0;
  wire cfg_applied;
  wire cfg_error;
  wire clear;
  wire [31:0]commit_high;
  wire commit_period;
  wire \commit_period[31]_i_3_n_0 ;
  wire \commit_period[31]_i_4_n_0 ;
  wire \commit_period[31]_i_5_n_0 ;
  wire \commit_period_reg_n_0_[0] ;
  wire \commit_period_reg_n_0_[10] ;
  wire \commit_period_reg_n_0_[11] ;
  wire \commit_period_reg_n_0_[12] ;
  wire \commit_period_reg_n_0_[13] ;
  wire \commit_period_reg_n_0_[14] ;
  wire \commit_period_reg_n_0_[15] ;
  wire \commit_period_reg_n_0_[16] ;
  wire \commit_period_reg_n_0_[17] ;
  wire \commit_period_reg_n_0_[18] ;
  wire \commit_period_reg_n_0_[19] ;
  wire \commit_period_reg_n_0_[1] ;
  wire \commit_period_reg_n_0_[20] ;
  wire \commit_period_reg_n_0_[21] ;
  wire \commit_period_reg_n_0_[22] ;
  wire \commit_period_reg_n_0_[23] ;
  wire \commit_period_reg_n_0_[24] ;
  wire \commit_period_reg_n_0_[25] ;
  wire \commit_period_reg_n_0_[26] ;
  wire \commit_period_reg_n_0_[27] ;
  wire \commit_period_reg_n_0_[28] ;
  wire \commit_period_reg_n_0_[29] ;
  wire \commit_period_reg_n_0_[2] ;
  wire \commit_period_reg_n_0_[30] ;
  wire \commit_period_reg_n_0_[31] ;
  wire \commit_period_reg_n_0_[3] ;
  wire \commit_period_reg_n_0_[4] ;
  wire \commit_period_reg_n_0_[5] ;
  wire \commit_period_reg_n_0_[6] ;
  wire \commit_period_reg_n_0_[7] ;
  wire \commit_period_reg_n_0_[8] ;
  wire \commit_period_reg_n_0_[9] ;
  wire commit_valid_reg_n_0;
  wire \cycle_count[0]_i_2_n_0 ;
  wire [31:0]cycle_count_reg;
  wire \cycle_count_reg[0]_i_1_n_0 ;
  wire \cycle_count_reg[0]_i_1_n_1 ;
  wire \cycle_count_reg[0]_i_1_n_2 ;
  wire \cycle_count_reg[0]_i_1_n_3 ;
  wire \cycle_count_reg[0]_i_1_n_4 ;
  wire \cycle_count_reg[0]_i_1_n_5 ;
  wire \cycle_count_reg[0]_i_1_n_6 ;
  wire \cycle_count_reg[0]_i_1_n_7 ;
  wire \cycle_count_reg[12]_i_1_n_0 ;
  wire \cycle_count_reg[12]_i_1_n_1 ;
  wire \cycle_count_reg[12]_i_1_n_2 ;
  wire \cycle_count_reg[12]_i_1_n_3 ;
  wire \cycle_count_reg[12]_i_1_n_4 ;
  wire \cycle_count_reg[12]_i_1_n_5 ;
  wire \cycle_count_reg[12]_i_1_n_6 ;
  wire \cycle_count_reg[12]_i_1_n_7 ;
  wire \cycle_count_reg[16]_i_1_n_0 ;
  wire \cycle_count_reg[16]_i_1_n_1 ;
  wire \cycle_count_reg[16]_i_1_n_2 ;
  wire \cycle_count_reg[16]_i_1_n_3 ;
  wire \cycle_count_reg[16]_i_1_n_4 ;
  wire \cycle_count_reg[16]_i_1_n_5 ;
  wire \cycle_count_reg[16]_i_1_n_6 ;
  wire \cycle_count_reg[16]_i_1_n_7 ;
  wire \cycle_count_reg[20]_i_1_n_0 ;
  wire \cycle_count_reg[20]_i_1_n_1 ;
  wire \cycle_count_reg[20]_i_1_n_2 ;
  wire \cycle_count_reg[20]_i_1_n_3 ;
  wire \cycle_count_reg[20]_i_1_n_4 ;
  wire \cycle_count_reg[20]_i_1_n_5 ;
  wire \cycle_count_reg[20]_i_1_n_6 ;
  wire \cycle_count_reg[20]_i_1_n_7 ;
  wire \cycle_count_reg[24]_i_1_n_0 ;
  wire \cycle_count_reg[24]_i_1_n_1 ;
  wire \cycle_count_reg[24]_i_1_n_2 ;
  wire \cycle_count_reg[24]_i_1_n_3 ;
  wire \cycle_count_reg[24]_i_1_n_4 ;
  wire \cycle_count_reg[24]_i_1_n_5 ;
  wire \cycle_count_reg[24]_i_1_n_6 ;
  wire \cycle_count_reg[24]_i_1_n_7 ;
  wire \cycle_count_reg[28]_i_1_n_1 ;
  wire \cycle_count_reg[28]_i_1_n_2 ;
  wire \cycle_count_reg[28]_i_1_n_3 ;
  wire \cycle_count_reg[28]_i_1_n_4 ;
  wire \cycle_count_reg[28]_i_1_n_5 ;
  wire \cycle_count_reg[28]_i_1_n_6 ;
  wire \cycle_count_reg[28]_i_1_n_7 ;
  wire \cycle_count_reg[4]_i_1_n_0 ;
  wire \cycle_count_reg[4]_i_1_n_1 ;
  wire \cycle_count_reg[4]_i_1_n_2 ;
  wire \cycle_count_reg[4]_i_1_n_3 ;
  wire \cycle_count_reg[4]_i_1_n_4 ;
  wire \cycle_count_reg[4]_i_1_n_5 ;
  wire \cycle_count_reg[4]_i_1_n_6 ;
  wire \cycle_count_reg[4]_i_1_n_7 ;
  wire \cycle_count_reg[8]_i_1_n_0 ;
  wire \cycle_count_reg[8]_i_1_n_1 ;
  wire \cycle_count_reg[8]_i_1_n_2 ;
  wire \cycle_count_reg[8]_i_1_n_3 ;
  wire \cycle_count_reg[8]_i_1_n_4 ;
  wire \cycle_count_reg[8]_i_1_n_5 ;
  wire \cycle_count_reg[8]_i_1_n_6 ;
  wire \cycle_count_reg[8]_i_1_n_7 ;
  wire data_pending_i_1_n_0;
  wire data_pending_reg_n_0;
  wire error_sticky;
  wire error_sticky_i_1_n_0;
  wire error_sticky_i_2_n_0;
  wire error_sticky_i_3_n_0;
  wire error_sticky_i_4_n_0;
  wire p_0_in0;
  wire p_0_in10_in;
  wire p_0_in11_in;
  wire [24:0]p_1_in;
  wire p_5_out;
  wire p_7_out;
  wire period_start;
  wire pwm_core_n_10;
  wire pwm_core_n_11;
  wire pwm_core_n_12;
  wire pwm_core_n_13;
  wire pwm_core_n_14;
  wire pwm_core_n_15;
  wire pwm_core_n_16;
  wire pwm_core_n_17;
  wire pwm_core_n_18;
  wire pwm_core_n_19;
  wire pwm_core_n_20;
  wire pwm_core_n_21;
  wire pwm_core_n_22;
  wire pwm_core_n_23;
  wire pwm_core_n_24;
  wire pwm_core_n_25;
  wire pwm_core_n_26;
  wire pwm_core_n_27;
  wire pwm_core_n_28;
  wire pwm_core_n_29;
  wire pwm_core_n_30;
  wire pwm_core_n_31;
  wire pwm_core_n_32;
  wire pwm_core_n_33;
  wire pwm_core_n_34;
  wire pwm_core_n_35;
  wire pwm_core_n_36;
  wire pwm_core_n_37;
  wire pwm_core_n_38;
  wire pwm_core_n_39;
  wire pwm_core_n_40;
  wire pwm_core_n_42;
  wire pwm_core_n_43;
  wire pwm_core_n_5;
  wire pwm_core_n_6;
  wire pwm_core_n_9;
  wire pwm_enable;
  wire pwm_out;
  wire s_axi_aclk;
  wire [11:0]s_axi_araddr;
  wire s_axi_aresetn;
  wire s_axi_arready;
  wire s_axi_arvalid;
  wire [11:0]s_axi_awaddr;
  wire s_axi_awready;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire [0:0]s_axi_bresp;
  wire s_axi_bresp1;
  wire s_axi_bresp3;
  wire s_axi_bresp3_carry__0_i_1_n_0;
  wire s_axi_bresp3_carry__0_i_2_n_0;
  wire s_axi_bresp3_carry__0_i_3_n_0;
  wire s_axi_bresp3_carry__0_i_4_n_0;
  wire s_axi_bresp3_carry__0_i_5_n_0;
  wire s_axi_bresp3_carry__0_i_6_n_0;
  wire s_axi_bresp3_carry__0_i_7_n_0;
  wire s_axi_bresp3_carry__0_i_8_n_0;
  wire s_axi_bresp3_carry__0_n_0;
  wire s_axi_bresp3_carry__0_n_1;
  wire s_axi_bresp3_carry__0_n_2;
  wire s_axi_bresp3_carry__0_n_3;
  wire s_axi_bresp3_carry__1_i_1_n_0;
  wire s_axi_bresp3_carry__1_i_2_n_0;
  wire s_axi_bresp3_carry__1_i_3_n_0;
  wire s_axi_bresp3_carry__1_i_4_n_0;
  wire s_axi_bresp3_carry__1_i_5_n_0;
  wire s_axi_bresp3_carry__1_i_6_n_0;
  wire s_axi_bresp3_carry__1_i_7_n_0;
  wire s_axi_bresp3_carry__1_i_8_n_0;
  wire s_axi_bresp3_carry__1_n_0;
  wire s_axi_bresp3_carry__1_n_1;
  wire s_axi_bresp3_carry__1_n_2;
  wire s_axi_bresp3_carry__1_n_3;
  wire s_axi_bresp3_carry__2_i_1_n_0;
  wire s_axi_bresp3_carry__2_i_2_n_0;
  wire s_axi_bresp3_carry__2_i_3_n_0;
  wire s_axi_bresp3_carry__2_i_4_n_0;
  wire s_axi_bresp3_carry__2_i_5_n_0;
  wire s_axi_bresp3_carry__2_i_6_n_0;
  wire s_axi_bresp3_carry__2_i_7_n_0;
  wire s_axi_bresp3_carry__2_i_8_n_0;
  wire s_axi_bresp3_carry__2_n_1;
  wire s_axi_bresp3_carry__2_n_2;
  wire s_axi_bresp3_carry__2_n_3;
  wire s_axi_bresp3_carry_i_1_n_0;
  wire s_axi_bresp3_carry_i_2_n_0;
  wire s_axi_bresp3_carry_i_3_n_0;
  wire s_axi_bresp3_carry_i_4_n_0;
  wire s_axi_bresp3_carry_i_5_n_0;
  wire s_axi_bresp3_carry_i_6_n_0;
  wire s_axi_bresp3_carry_i_7_n_0;
  wire s_axi_bresp3_carry_i_8_n_0;
  wire s_axi_bresp3_carry_n_0;
  wire s_axi_bresp3_carry_n_1;
  wire s_axi_bresp3_carry_n_2;
  wire s_axi_bresp3_carry_n_3;
  wire \s_axi_bresp[1]_i_10_n_0 ;
  wire \s_axi_bresp[1]_i_12_n_0 ;
  wire \s_axi_bresp[1]_i_13_n_0 ;
  wire \s_axi_bresp[1]_i_14_n_0 ;
  wire \s_axi_bresp[1]_i_15_n_0 ;
  wire \s_axi_bresp[1]_i_16_n_0 ;
  wire \s_axi_bresp[1]_i_17_n_0 ;
  wire \s_axi_bresp[1]_i_3_n_0 ;
  wire \s_axi_bresp[1]_i_6_n_0 ;
  wire \s_axi_bresp[1]_i_7_n_0 ;
  wire \s_axi_bresp[1]_i_8_n_0 ;
  wire \s_axi_bresp[1]_i_9_n_0 ;
  wire s_axi_bvalid_i_1_n_0;
  wire s_axi_bvalid_reg_0;
  wire [31:0]s_axi_rdata;
  wire \s_axi_rdata[2]_i_3_n_0 ;
  wire \s_axi_rdata[31]_i_3_n_0 ;
  wire \s_axi_rdata[31]_i_5_n_0 ;
  wire \s_axi_rdata[31]_i_6_n_0 ;
  wire \s_axi_rdata[31]_i_7_n_0 ;
  wire \s_axi_rdata[31]_i_8_n_0 ;
  wire \s_axi_rdata[3]_i_3_n_0 ;
  wire s_axi_rready;
  wire [0:0]s_axi_rresp;
  wire \s_axi_rresp[1]_i_1_n_0 ;
  wire s_axi_rvalid013_out;
  wire s_axi_rvalid_i_1_n_0;
  wire s_axi_rvalid_reg_0;
  wire [31:0]s_axi_wdata;
  wire s_axi_wready;
  wire [3:0]s_axi_wstrb;
  wire s_axi_wvalid;
  wire [31:0]shadow_high;
  wire \shadow_high[15]_i_1_n_0 ;
  wire \shadow_high[23]_i_1_n_0 ;
  wire \shadow_high[31]_i_1_n_0 ;
  wire \shadow_high[7]_i_1_n_0 ;
  wire [31:0]shadow_period;
  wire \shadow_period[31]_i_2_n_0 ;
  wire \shadow_period[31]_i_3_n_0 ;
  wire [11:0]write_address;
  wire write_address0;
  wire write_data0;
  wire \write_data_reg_n_0_[0] ;
  wire \write_data_reg_n_0_[10] ;
  wire \write_data_reg_n_0_[11] ;
  wire \write_data_reg_n_0_[12] ;
  wire \write_data_reg_n_0_[13] ;
  wire \write_data_reg_n_0_[14] ;
  wire \write_data_reg_n_0_[15] ;
  wire \write_data_reg_n_0_[16] ;
  wire \write_data_reg_n_0_[17] ;
  wire \write_data_reg_n_0_[18] ;
  wire \write_data_reg_n_0_[19] ;
  wire \write_data_reg_n_0_[20] ;
  wire \write_data_reg_n_0_[21] ;
  wire \write_data_reg_n_0_[22] ;
  wire \write_data_reg_n_0_[23] ;
  wire \write_data_reg_n_0_[24] ;
  wire \write_data_reg_n_0_[25] ;
  wire \write_data_reg_n_0_[26] ;
  wire \write_data_reg_n_0_[27] ;
  wire \write_data_reg_n_0_[28] ;
  wire \write_data_reg_n_0_[29] ;
  wire \write_data_reg_n_0_[2] ;
  wire \write_data_reg_n_0_[30] ;
  wire \write_data_reg_n_0_[31] ;
  wire \write_data_reg_n_0_[3] ;
  wire \write_data_reg_n_0_[4] ;
  wire \write_data_reg_n_0_[5] ;
  wire \write_data_reg_n_0_[6] ;
  wire \write_data_reg_n_0_[7] ;
  wire \write_data_reg_n_0_[9] ;
  wire \write_strobes_reg_n_0_[3] ;
  wire [3:3]\NLW_cycle_count_reg[28]_i_1_CO_UNCONNECTED ;
  wire [3:0]NLW_s_axi_bresp3_carry_O_UNCONNECTED;
  wire [3:0]NLW_s_axi_bresp3_carry__0_O_UNCONNECTED;
  wire [3:0]NLW_s_axi_bresp3_carry__1_O_UNCONNECTED;
  wire [3:0]NLW_s_axi_bresp3_carry__2_O_UNCONNECTED;

  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'hC0CC0808)) 
    address_pending_i_1
       (.I0(s_axi_awvalid),
        .I1(s_axi_aresetn),
        .I2(s_axi_bvalid_reg_0),
        .I3(data_pending_reg_n_0),
        .I4(address_pending),
        .O(address_pending_i_1_n_0));
  FDRE address_pending_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(address_pending_i_1_n_0),
        .Q(address_pending),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hFF7FFF00)) 
    applied_sticky_i_1
       (.I0(pwm_core_n_6),
        .I1(p_0_in11_in),
        .I2(p_5_out),
        .I3(cfg_applied),
        .I4(applied_sticky),
        .O(applied_sticky_i_1_n_0));
  FDRE applied_sticky_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(applied_sticky_i_1_n_0),
        .Q(applied_sticky),
        .R(clear));
  FDRE \commit_high_reg[0] 
       (.C(s_axi_aclk),
        .CE(commit_period),
        .D(shadow_high[0]),
        .Q(commit_high[0]),
        .R(clear));
  FDRE \commit_high_reg[10] 
       (.C(s_axi_aclk),
        .CE(commit_period),
        .D(shadow_high[10]),
        .Q(commit_high[10]),
        .R(clear));
  FDRE \commit_high_reg[11] 
       (.C(s_axi_aclk),
        .CE(commit_period),
        .D(shadow_high[11]),
        .Q(commit_high[11]),
        .R(clear));
  FDRE \commit_high_reg[12] 
       (.C(s_axi_aclk),
        .CE(commit_period),
        .D(shadow_high[12]),
        .Q(commit_high[12]),
        .R(clear));
  FDRE \commit_high_reg[13] 
       (.C(s_axi_aclk),
        .CE(commit_period),
        .D(shadow_high[13]),
        .Q(commit_high[13]),
        .R(clear));
  FDRE \commit_high_reg[14] 
       (.C(s_axi_aclk),
        .CE(commit_period),
        .D(shadow_high[14]),
        .Q(commit_high[14]),
        .R(clear));
  FDRE \commit_high_reg[15] 
       (.C(s_axi_aclk),
        .CE(commit_period),
        .D(shadow_high[15]),
        .Q(commit_high[15]),
        .R(clear));
  FDRE \commit_high_reg[16] 
       (.C(s_axi_aclk),
        .CE(commit_period),
        .D(shadow_high[16]),
        .Q(commit_high[16]),
        .R(clear));
  FDRE \commit_high_reg[17] 
       (.C(s_axi_aclk),
        .CE(commit_period),
        .D(shadow_high[17]),
        .Q(commit_high[17]),
        .R(clear));
  FDRE \commit_high_reg[18] 
       (.C(s_axi_aclk),
        .CE(commit_period),
        .D(shadow_high[18]),
        .Q(commit_high[18]),
        .R(clear));
  FDRE \commit_high_reg[19] 
       (.C(s_axi_aclk),
        .CE(commit_period),
        .D(shadow_high[19]),
        .Q(commit_high[19]),
        .R(clear));
  FDRE \commit_high_reg[1] 
       (.C(s_axi_aclk),
        .CE(commit_period),
        .D(shadow_high[1]),
        .Q(commit_high[1]),
        .R(clear));
  FDRE \commit_high_reg[20] 
       (.C(s_axi_aclk),
        .CE(commit_period),
        .D(shadow_high[20]),
        .Q(commit_high[20]),
        .R(clear));
  FDRE \commit_high_reg[21] 
       (.C(s_axi_aclk),
        .CE(commit_period),
        .D(shadow_high[21]),
        .Q(commit_high[21]),
        .R(clear));
  FDRE \commit_high_reg[22] 
       (.C(s_axi_aclk),
        .CE(commit_period),
        .D(shadow_high[22]),
        .Q(commit_high[22]),
        .R(clear));
  FDRE \commit_high_reg[23] 
       (.C(s_axi_aclk),
        .CE(commit_period),
        .D(shadow_high[23]),
        .Q(commit_high[23]),
        .R(clear));
  FDRE \commit_high_reg[24] 
       (.C(s_axi_aclk),
        .CE(commit_period),
        .D(shadow_high[24]),
        .Q(commit_high[24]),
        .R(clear));
  FDRE \commit_high_reg[25] 
       (.C(s_axi_aclk),
        .CE(commit_period),
        .D(shadow_high[25]),
        .Q(commit_high[25]),
        .R(clear));
  FDRE \commit_high_reg[26] 
       (.C(s_axi_aclk),
        .CE(commit_period),
        .D(shadow_high[26]),
        .Q(commit_high[26]),
        .R(clear));
  FDRE \commit_high_reg[27] 
       (.C(s_axi_aclk),
        .CE(commit_period),
        .D(shadow_high[27]),
        .Q(commit_high[27]),
        .R(clear));
  FDRE \commit_high_reg[28] 
       (.C(s_axi_aclk),
        .CE(commit_period),
        .D(shadow_high[28]),
        .Q(commit_high[28]),
        .R(clear));
  FDRE \commit_high_reg[29] 
       (.C(s_axi_aclk),
        .CE(commit_period),
        .D(shadow_high[29]),
        .Q(commit_high[29]),
        .R(clear));
  FDRE \commit_high_reg[2] 
       (.C(s_axi_aclk),
        .CE(commit_period),
        .D(shadow_high[2]),
        .Q(commit_high[2]),
        .R(clear));
  FDRE \commit_high_reg[30] 
       (.C(s_axi_aclk),
        .CE(commit_period),
        .D(shadow_high[30]),
        .Q(commit_high[30]),
        .R(clear));
  FDRE \commit_high_reg[31] 
       (.C(s_axi_aclk),
        .CE(commit_period),
        .D(shadow_high[31]),
        .Q(commit_high[31]),
        .R(clear));
  FDRE \commit_high_reg[3] 
       (.C(s_axi_aclk),
        .CE(commit_period),
        .D(shadow_high[3]),
        .Q(commit_high[3]),
        .R(clear));
  FDRE \commit_high_reg[4] 
       (.C(s_axi_aclk),
        .CE(commit_period),
        .D(shadow_high[4]),
        .Q(commit_high[4]),
        .R(clear));
  FDRE \commit_high_reg[5] 
       (.C(s_axi_aclk),
        .CE(commit_period),
        .D(shadow_high[5]),
        .Q(commit_high[5]),
        .R(clear));
  FDRE \commit_high_reg[6] 
       (.C(s_axi_aclk),
        .CE(commit_period),
        .D(shadow_high[6]),
        .Q(commit_high[6]),
        .R(clear));
  FDRE \commit_high_reg[7] 
       (.C(s_axi_aclk),
        .CE(commit_period),
        .D(shadow_high[7]),
        .Q(commit_high[7]),
        .R(clear));
  FDRE \commit_high_reg[8] 
       (.C(s_axi_aclk),
        .CE(commit_period),
        .D(shadow_high[8]),
        .Q(commit_high[8]),
        .R(clear));
  FDRE \commit_high_reg[9] 
       (.C(s_axi_aclk),
        .CE(commit_period),
        .D(shadow_high[9]),
        .Q(commit_high[9]),
        .R(clear));
  LUT4 #(
    .INIT(16'h8000)) 
    \commit_period[31]_i_3 
       (.I0(\s_axi_bresp[1]_i_13_n_0 ),
        .I1(\commit_period[31]_i_4_n_0 ),
        .I2(\s_axi_bresp[1]_i_12_n_0 ),
        .I3(\commit_period[31]_i_5_n_0 ),
        .O(\commit_period[31]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \commit_period[31]_i_4 
       (.I0(shadow_period[1]),
        .I1(shadow_period[0]),
        .I2(shadow_period[3]),
        .I3(shadow_period[2]),
        .O(\commit_period[31]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \commit_period[31]_i_5 
       (.I0(shadow_period[15]),
        .I1(shadow_period[14]),
        .I2(shadow_period[13]),
        .I3(shadow_period[12]),
        .O(\commit_period[31]_i_5_n_0 ));
  FDRE \commit_period_reg[0] 
       (.C(s_axi_aclk),
        .CE(commit_period),
        .D(shadow_period[0]),
        .Q(\commit_period_reg_n_0_[0] ),
        .R(clear));
  FDRE \commit_period_reg[10] 
       (.C(s_axi_aclk),
        .CE(commit_period),
        .D(shadow_period[10]),
        .Q(\commit_period_reg_n_0_[10] ),
        .R(clear));
  FDRE \commit_period_reg[11] 
       (.C(s_axi_aclk),
        .CE(commit_period),
        .D(shadow_period[11]),
        .Q(\commit_period_reg_n_0_[11] ),
        .R(clear));
  FDRE \commit_period_reg[12] 
       (.C(s_axi_aclk),
        .CE(commit_period),
        .D(shadow_period[12]),
        .Q(\commit_period_reg_n_0_[12] ),
        .R(clear));
  FDRE \commit_period_reg[13] 
       (.C(s_axi_aclk),
        .CE(commit_period),
        .D(shadow_period[13]),
        .Q(\commit_period_reg_n_0_[13] ),
        .R(clear));
  FDRE \commit_period_reg[14] 
       (.C(s_axi_aclk),
        .CE(commit_period),
        .D(shadow_period[14]),
        .Q(\commit_period_reg_n_0_[14] ),
        .R(clear));
  FDRE \commit_period_reg[15] 
       (.C(s_axi_aclk),
        .CE(commit_period),
        .D(shadow_period[15]),
        .Q(\commit_period_reg_n_0_[15] ),
        .R(clear));
  FDRE \commit_period_reg[16] 
       (.C(s_axi_aclk),
        .CE(commit_period),
        .D(shadow_period[16]),
        .Q(\commit_period_reg_n_0_[16] ),
        .R(clear));
  FDRE \commit_period_reg[17] 
       (.C(s_axi_aclk),
        .CE(commit_period),
        .D(shadow_period[17]),
        .Q(\commit_period_reg_n_0_[17] ),
        .R(clear));
  FDRE \commit_period_reg[18] 
       (.C(s_axi_aclk),
        .CE(commit_period),
        .D(shadow_period[18]),
        .Q(\commit_period_reg_n_0_[18] ),
        .R(clear));
  FDRE \commit_period_reg[19] 
       (.C(s_axi_aclk),
        .CE(commit_period),
        .D(shadow_period[19]),
        .Q(\commit_period_reg_n_0_[19] ),
        .R(clear));
  FDRE \commit_period_reg[1] 
       (.C(s_axi_aclk),
        .CE(commit_period),
        .D(shadow_period[1]),
        .Q(\commit_period_reg_n_0_[1] ),
        .R(clear));
  FDRE \commit_period_reg[20] 
       (.C(s_axi_aclk),
        .CE(commit_period),
        .D(shadow_period[20]),
        .Q(\commit_period_reg_n_0_[20] ),
        .R(clear));
  FDRE \commit_period_reg[21] 
       (.C(s_axi_aclk),
        .CE(commit_period),
        .D(shadow_period[21]),
        .Q(\commit_period_reg_n_0_[21] ),
        .R(clear));
  FDRE \commit_period_reg[22] 
       (.C(s_axi_aclk),
        .CE(commit_period),
        .D(shadow_period[22]),
        .Q(\commit_period_reg_n_0_[22] ),
        .R(clear));
  FDRE \commit_period_reg[23] 
       (.C(s_axi_aclk),
        .CE(commit_period),
        .D(shadow_period[23]),
        .Q(\commit_period_reg_n_0_[23] ),
        .R(clear));
  FDRE \commit_period_reg[24] 
       (.C(s_axi_aclk),
        .CE(commit_period),
        .D(shadow_period[24]),
        .Q(\commit_period_reg_n_0_[24] ),
        .R(clear));
  FDRE \commit_period_reg[25] 
       (.C(s_axi_aclk),
        .CE(commit_period),
        .D(shadow_period[25]),
        .Q(\commit_period_reg_n_0_[25] ),
        .R(clear));
  FDRE \commit_period_reg[26] 
       (.C(s_axi_aclk),
        .CE(commit_period),
        .D(shadow_period[26]),
        .Q(\commit_period_reg_n_0_[26] ),
        .R(clear));
  FDRE \commit_period_reg[27] 
       (.C(s_axi_aclk),
        .CE(commit_period),
        .D(shadow_period[27]),
        .Q(\commit_period_reg_n_0_[27] ),
        .R(clear));
  FDRE \commit_period_reg[28] 
       (.C(s_axi_aclk),
        .CE(commit_period),
        .D(shadow_period[28]),
        .Q(\commit_period_reg_n_0_[28] ),
        .R(clear));
  FDRE \commit_period_reg[29] 
       (.C(s_axi_aclk),
        .CE(commit_period),
        .D(shadow_period[29]),
        .Q(\commit_period_reg_n_0_[29] ),
        .R(clear));
  FDRE \commit_period_reg[2] 
       (.C(s_axi_aclk),
        .CE(commit_period),
        .D(shadow_period[2]),
        .Q(\commit_period_reg_n_0_[2] ),
        .R(clear));
  FDRE \commit_period_reg[30] 
       (.C(s_axi_aclk),
        .CE(commit_period),
        .D(shadow_period[30]),
        .Q(\commit_period_reg_n_0_[30] ),
        .R(clear));
  FDRE \commit_period_reg[31] 
       (.C(s_axi_aclk),
        .CE(commit_period),
        .D(shadow_period[31]),
        .Q(\commit_period_reg_n_0_[31] ),
        .R(clear));
  FDRE \commit_period_reg[3] 
       (.C(s_axi_aclk),
        .CE(commit_period),
        .D(shadow_period[3]),
        .Q(\commit_period_reg_n_0_[3] ),
        .R(clear));
  FDRE \commit_period_reg[4] 
       (.C(s_axi_aclk),
        .CE(commit_period),
        .D(shadow_period[4]),
        .Q(\commit_period_reg_n_0_[4] ),
        .R(clear));
  FDRE \commit_period_reg[5] 
       (.C(s_axi_aclk),
        .CE(commit_period),
        .D(shadow_period[5]),
        .Q(\commit_period_reg_n_0_[5] ),
        .R(clear));
  FDRE \commit_period_reg[6] 
       (.C(s_axi_aclk),
        .CE(commit_period),
        .D(shadow_period[6]),
        .Q(\commit_period_reg_n_0_[6] ),
        .R(clear));
  FDRE \commit_period_reg[7] 
       (.C(s_axi_aclk),
        .CE(commit_period),
        .D(shadow_period[7]),
        .Q(\commit_period_reg_n_0_[7] ),
        .R(clear));
  FDRE \commit_period_reg[8] 
       (.C(s_axi_aclk),
        .CE(commit_period),
        .D(shadow_period[8]),
        .Q(\commit_period_reg_n_0_[8] ),
        .R(clear));
  FDRE \commit_period_reg[9] 
       (.C(s_axi_aclk),
        .CE(commit_period),
        .D(shadow_period[9]),
        .Q(\commit_period_reg_n_0_[9] ),
        .R(clear));
  FDRE commit_valid_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(pwm_core_n_5),
        .Q(commit_valid_reg_n_0),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \cycle_count[0]_i_2 
       (.I0(cycle_count_reg[0]),
        .O(\cycle_count[0]_i_2_n_0 ));
  FDRE \cycle_count_reg[0] 
       (.C(s_axi_aclk),
        .CE(period_start),
        .D(\cycle_count_reg[0]_i_1_n_7 ),
        .Q(cycle_count_reg[0]),
        .R(clear));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \cycle_count_reg[0]_i_1 
       (.CI(1'b0),
        .CO({\cycle_count_reg[0]_i_1_n_0 ,\cycle_count_reg[0]_i_1_n_1 ,\cycle_count_reg[0]_i_1_n_2 ,\cycle_count_reg[0]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\cycle_count_reg[0]_i_1_n_4 ,\cycle_count_reg[0]_i_1_n_5 ,\cycle_count_reg[0]_i_1_n_6 ,\cycle_count_reg[0]_i_1_n_7 }),
        .S({cycle_count_reg[3:1],\cycle_count[0]_i_2_n_0 }));
  FDRE \cycle_count_reg[10] 
       (.C(s_axi_aclk),
        .CE(period_start),
        .D(\cycle_count_reg[8]_i_1_n_5 ),
        .Q(cycle_count_reg[10]),
        .R(clear));
  FDRE \cycle_count_reg[11] 
       (.C(s_axi_aclk),
        .CE(period_start),
        .D(\cycle_count_reg[8]_i_1_n_4 ),
        .Q(cycle_count_reg[11]),
        .R(clear));
  FDRE \cycle_count_reg[12] 
       (.C(s_axi_aclk),
        .CE(period_start),
        .D(\cycle_count_reg[12]_i_1_n_7 ),
        .Q(cycle_count_reg[12]),
        .R(clear));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \cycle_count_reg[12]_i_1 
       (.CI(\cycle_count_reg[8]_i_1_n_0 ),
        .CO({\cycle_count_reg[12]_i_1_n_0 ,\cycle_count_reg[12]_i_1_n_1 ,\cycle_count_reg[12]_i_1_n_2 ,\cycle_count_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cycle_count_reg[12]_i_1_n_4 ,\cycle_count_reg[12]_i_1_n_5 ,\cycle_count_reg[12]_i_1_n_6 ,\cycle_count_reg[12]_i_1_n_7 }),
        .S(cycle_count_reg[15:12]));
  FDRE \cycle_count_reg[13] 
       (.C(s_axi_aclk),
        .CE(period_start),
        .D(\cycle_count_reg[12]_i_1_n_6 ),
        .Q(cycle_count_reg[13]),
        .R(clear));
  FDRE \cycle_count_reg[14] 
       (.C(s_axi_aclk),
        .CE(period_start),
        .D(\cycle_count_reg[12]_i_1_n_5 ),
        .Q(cycle_count_reg[14]),
        .R(clear));
  FDRE \cycle_count_reg[15] 
       (.C(s_axi_aclk),
        .CE(period_start),
        .D(\cycle_count_reg[12]_i_1_n_4 ),
        .Q(cycle_count_reg[15]),
        .R(clear));
  FDRE \cycle_count_reg[16] 
       (.C(s_axi_aclk),
        .CE(period_start),
        .D(\cycle_count_reg[16]_i_1_n_7 ),
        .Q(cycle_count_reg[16]),
        .R(clear));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \cycle_count_reg[16]_i_1 
       (.CI(\cycle_count_reg[12]_i_1_n_0 ),
        .CO({\cycle_count_reg[16]_i_1_n_0 ,\cycle_count_reg[16]_i_1_n_1 ,\cycle_count_reg[16]_i_1_n_2 ,\cycle_count_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cycle_count_reg[16]_i_1_n_4 ,\cycle_count_reg[16]_i_1_n_5 ,\cycle_count_reg[16]_i_1_n_6 ,\cycle_count_reg[16]_i_1_n_7 }),
        .S(cycle_count_reg[19:16]));
  FDRE \cycle_count_reg[17] 
       (.C(s_axi_aclk),
        .CE(period_start),
        .D(\cycle_count_reg[16]_i_1_n_6 ),
        .Q(cycle_count_reg[17]),
        .R(clear));
  FDRE \cycle_count_reg[18] 
       (.C(s_axi_aclk),
        .CE(period_start),
        .D(\cycle_count_reg[16]_i_1_n_5 ),
        .Q(cycle_count_reg[18]),
        .R(clear));
  FDRE \cycle_count_reg[19] 
       (.C(s_axi_aclk),
        .CE(period_start),
        .D(\cycle_count_reg[16]_i_1_n_4 ),
        .Q(cycle_count_reg[19]),
        .R(clear));
  FDRE \cycle_count_reg[1] 
       (.C(s_axi_aclk),
        .CE(period_start),
        .D(\cycle_count_reg[0]_i_1_n_6 ),
        .Q(cycle_count_reg[1]),
        .R(clear));
  FDRE \cycle_count_reg[20] 
       (.C(s_axi_aclk),
        .CE(period_start),
        .D(\cycle_count_reg[20]_i_1_n_7 ),
        .Q(cycle_count_reg[20]),
        .R(clear));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \cycle_count_reg[20]_i_1 
       (.CI(\cycle_count_reg[16]_i_1_n_0 ),
        .CO({\cycle_count_reg[20]_i_1_n_0 ,\cycle_count_reg[20]_i_1_n_1 ,\cycle_count_reg[20]_i_1_n_2 ,\cycle_count_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cycle_count_reg[20]_i_1_n_4 ,\cycle_count_reg[20]_i_1_n_5 ,\cycle_count_reg[20]_i_1_n_6 ,\cycle_count_reg[20]_i_1_n_7 }),
        .S(cycle_count_reg[23:20]));
  FDRE \cycle_count_reg[21] 
       (.C(s_axi_aclk),
        .CE(period_start),
        .D(\cycle_count_reg[20]_i_1_n_6 ),
        .Q(cycle_count_reg[21]),
        .R(clear));
  FDRE \cycle_count_reg[22] 
       (.C(s_axi_aclk),
        .CE(period_start),
        .D(\cycle_count_reg[20]_i_1_n_5 ),
        .Q(cycle_count_reg[22]),
        .R(clear));
  FDRE \cycle_count_reg[23] 
       (.C(s_axi_aclk),
        .CE(period_start),
        .D(\cycle_count_reg[20]_i_1_n_4 ),
        .Q(cycle_count_reg[23]),
        .R(clear));
  FDRE \cycle_count_reg[24] 
       (.C(s_axi_aclk),
        .CE(period_start),
        .D(\cycle_count_reg[24]_i_1_n_7 ),
        .Q(cycle_count_reg[24]),
        .R(clear));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \cycle_count_reg[24]_i_1 
       (.CI(\cycle_count_reg[20]_i_1_n_0 ),
        .CO({\cycle_count_reg[24]_i_1_n_0 ,\cycle_count_reg[24]_i_1_n_1 ,\cycle_count_reg[24]_i_1_n_2 ,\cycle_count_reg[24]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cycle_count_reg[24]_i_1_n_4 ,\cycle_count_reg[24]_i_1_n_5 ,\cycle_count_reg[24]_i_1_n_6 ,\cycle_count_reg[24]_i_1_n_7 }),
        .S(cycle_count_reg[27:24]));
  FDRE \cycle_count_reg[25] 
       (.C(s_axi_aclk),
        .CE(period_start),
        .D(\cycle_count_reg[24]_i_1_n_6 ),
        .Q(cycle_count_reg[25]),
        .R(clear));
  FDRE \cycle_count_reg[26] 
       (.C(s_axi_aclk),
        .CE(period_start),
        .D(\cycle_count_reg[24]_i_1_n_5 ),
        .Q(cycle_count_reg[26]),
        .R(clear));
  FDRE \cycle_count_reg[27] 
       (.C(s_axi_aclk),
        .CE(period_start),
        .D(\cycle_count_reg[24]_i_1_n_4 ),
        .Q(cycle_count_reg[27]),
        .R(clear));
  FDRE \cycle_count_reg[28] 
       (.C(s_axi_aclk),
        .CE(period_start),
        .D(\cycle_count_reg[28]_i_1_n_7 ),
        .Q(cycle_count_reg[28]),
        .R(clear));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \cycle_count_reg[28]_i_1 
       (.CI(\cycle_count_reg[24]_i_1_n_0 ),
        .CO({\NLW_cycle_count_reg[28]_i_1_CO_UNCONNECTED [3],\cycle_count_reg[28]_i_1_n_1 ,\cycle_count_reg[28]_i_1_n_2 ,\cycle_count_reg[28]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cycle_count_reg[28]_i_1_n_4 ,\cycle_count_reg[28]_i_1_n_5 ,\cycle_count_reg[28]_i_1_n_6 ,\cycle_count_reg[28]_i_1_n_7 }),
        .S(cycle_count_reg[31:28]));
  FDRE \cycle_count_reg[29] 
       (.C(s_axi_aclk),
        .CE(period_start),
        .D(\cycle_count_reg[28]_i_1_n_6 ),
        .Q(cycle_count_reg[29]),
        .R(clear));
  FDRE \cycle_count_reg[2] 
       (.C(s_axi_aclk),
        .CE(period_start),
        .D(\cycle_count_reg[0]_i_1_n_5 ),
        .Q(cycle_count_reg[2]),
        .R(clear));
  FDRE \cycle_count_reg[30] 
       (.C(s_axi_aclk),
        .CE(period_start),
        .D(\cycle_count_reg[28]_i_1_n_5 ),
        .Q(cycle_count_reg[30]),
        .R(clear));
  FDRE \cycle_count_reg[31] 
       (.C(s_axi_aclk),
        .CE(period_start),
        .D(\cycle_count_reg[28]_i_1_n_4 ),
        .Q(cycle_count_reg[31]),
        .R(clear));
  FDRE \cycle_count_reg[3] 
       (.C(s_axi_aclk),
        .CE(period_start),
        .D(\cycle_count_reg[0]_i_1_n_4 ),
        .Q(cycle_count_reg[3]),
        .R(clear));
  FDRE \cycle_count_reg[4] 
       (.C(s_axi_aclk),
        .CE(period_start),
        .D(\cycle_count_reg[4]_i_1_n_7 ),
        .Q(cycle_count_reg[4]),
        .R(clear));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \cycle_count_reg[4]_i_1 
       (.CI(\cycle_count_reg[0]_i_1_n_0 ),
        .CO({\cycle_count_reg[4]_i_1_n_0 ,\cycle_count_reg[4]_i_1_n_1 ,\cycle_count_reg[4]_i_1_n_2 ,\cycle_count_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cycle_count_reg[4]_i_1_n_4 ,\cycle_count_reg[4]_i_1_n_5 ,\cycle_count_reg[4]_i_1_n_6 ,\cycle_count_reg[4]_i_1_n_7 }),
        .S(cycle_count_reg[7:4]));
  FDRE \cycle_count_reg[5] 
       (.C(s_axi_aclk),
        .CE(period_start),
        .D(\cycle_count_reg[4]_i_1_n_6 ),
        .Q(cycle_count_reg[5]),
        .R(clear));
  FDRE \cycle_count_reg[6] 
       (.C(s_axi_aclk),
        .CE(period_start),
        .D(\cycle_count_reg[4]_i_1_n_5 ),
        .Q(cycle_count_reg[6]),
        .R(clear));
  FDRE \cycle_count_reg[7] 
       (.C(s_axi_aclk),
        .CE(period_start),
        .D(\cycle_count_reg[4]_i_1_n_4 ),
        .Q(cycle_count_reg[7]),
        .R(clear));
  FDRE \cycle_count_reg[8] 
       (.C(s_axi_aclk),
        .CE(period_start),
        .D(\cycle_count_reg[8]_i_1_n_7 ),
        .Q(cycle_count_reg[8]),
        .R(clear));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \cycle_count_reg[8]_i_1 
       (.CI(\cycle_count_reg[4]_i_1_n_0 ),
        .CO({\cycle_count_reg[8]_i_1_n_0 ,\cycle_count_reg[8]_i_1_n_1 ,\cycle_count_reg[8]_i_1_n_2 ,\cycle_count_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cycle_count_reg[8]_i_1_n_4 ,\cycle_count_reg[8]_i_1_n_5 ,\cycle_count_reg[8]_i_1_n_6 ,\cycle_count_reg[8]_i_1_n_7 }),
        .S(cycle_count_reg[11:8]));
  FDRE \cycle_count_reg[9] 
       (.C(s_axi_aclk),
        .CE(period_start),
        .D(\cycle_count_reg[8]_i_1_n_6 ),
        .Q(cycle_count_reg[9]),
        .R(clear));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'hC008CC08)) 
    data_pending_i_1
       (.I0(s_axi_wvalid),
        .I1(s_axi_aresetn),
        .I2(s_axi_bvalid_reg_0),
        .I3(data_pending_reg_n_0),
        .I4(address_pending),
        .O(data_pending_i_1_n_0));
  FDRE data_pending_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(data_pending_i_1_n_0),
        .Q(data_pending_reg_n_0),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFFDFFFFFFF8888)) 
    error_sticky_i_1
       (.I0(error_sticky_i_2_n_0),
        .I1(s_axi_bresp1),
        .I2(p_5_out),
        .I3(p_0_in11_in),
        .I4(cfg_error),
        .I5(error_sticky),
        .O(error_sticky_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000000000010)) 
    error_sticky_i_2
       (.I0(error_sticky_i_3_n_0),
        .I1(\shadow_period[31]_i_3_n_0 ),
        .I2(address_pending0),
        .I3(error_sticky_i_4_n_0),
        .I4(write_address[2]),
        .I5(write_address[3]),
        .O(error_sticky_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    error_sticky_i_3
       (.I0(write_address[4]),
        .I1(write_address[5]),
        .I2(write_address[6]),
        .I3(write_address[7]),
        .O(error_sticky_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'hE)) 
    error_sticky_i_4
       (.I0(write_address[1]),
        .I1(write_address[0]),
        .O(error_sticky_i_4_n_0));
  FDRE error_sticky_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(error_sticky_i_1_n_0),
        .Q(error_sticky),
        .R(clear));
  system_pwm_control_b_0_fdw_pwm_core pwm_core
       (.CO(s_axi_bresp3),
        .D({pwm_core_n_9,pwm_core_n_10,pwm_core_n_11,pwm_core_n_12,pwm_core_n_13,pwm_core_n_14,pwm_core_n_15,pwm_core_n_16,pwm_core_n_17,pwm_core_n_18,pwm_core_n_19,pwm_core_n_20,pwm_core_n_21,pwm_core_n_22,pwm_core_n_23,pwm_core_n_24,pwm_core_n_25,pwm_core_n_26,pwm_core_n_27,pwm_core_n_28,pwm_core_n_29,pwm_core_n_30,pwm_core_n_31,pwm_core_n_32,pwm_core_n_33,pwm_core_n_34,pwm_core_n_35,pwm_core_n_36,pwm_core_n_37,pwm_core_n_38,pwm_core_n_39,pwm_core_n_40}),
        .E(commit_period),
        .Q({\commit_period_reg_n_0_[31] ,\commit_period_reg_n_0_[30] ,\commit_period_reg_n_0_[29] ,\commit_period_reg_n_0_[28] ,\commit_period_reg_n_0_[27] ,\commit_period_reg_n_0_[26] ,\commit_period_reg_n_0_[25] ,\commit_period_reg_n_0_[24] ,\commit_period_reg_n_0_[23] ,\commit_period_reg_n_0_[22] ,\commit_period_reg_n_0_[21] ,\commit_period_reg_n_0_[20] ,\commit_period_reg_n_0_[19] ,\commit_period_reg_n_0_[18] ,\commit_period_reg_n_0_[17] ,\commit_period_reg_n_0_[16] ,\commit_period_reg_n_0_[15] ,\commit_period_reg_n_0_[14] ,\commit_period_reg_n_0_[13] ,\commit_period_reg_n_0_[12] ,\commit_period_reg_n_0_[11] ,\commit_period_reg_n_0_[10] ,\commit_period_reg_n_0_[9] ,\commit_period_reg_n_0_[8] ,\commit_period_reg_n_0_[7] ,\commit_period_reg_n_0_[6] ,\commit_period_reg_n_0_[5] ,\commit_period_reg_n_0_[4] ,\commit_period_reg_n_0_[3] ,\commit_period_reg_n_0_[2] ,\commit_period_reg_n_0_[1] ,\commit_period_reg_n_0_[0] }),
        .activity(activity),
        .address_pending0(address_pending0),
        .cfg_applied(cfg_applied),
        .cfg_error(cfg_error),
        .cfg_error_reg_0(commit_valid_reg_n_0),
        .clear(clear),
        .commit_valid_reg({p_0_in10_in,\write_data_reg_n_0_[0] }),
        .cycle_count_reg(cycle_count_reg),
        .\pending_high_ticks_reg[31]_0 (commit_high),
        .period_start_reg_0(period_start),
        .pwm_enable(pwm_enable),
        .pwm_enable_reg(p_7_out),
        .pwm_enable_reg_0(error_sticky_i_2_n_0),
        .pwm_enable_reg_1(\s_axi_bresp[1]_i_10_n_0 ),
        .pwm_enable_reg_2(\commit_period[31]_i_3_n_0 ),
        .pwm_enable_reg_3(\s_axi_bresp[1]_i_7_n_0 ),
        .pwm_out(pwm_out),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_araddr(s_axi_araddr[4:0]),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_bresp(s_axi_bresp),
        .s_axi_bresp1(s_axi_bresp1),
        .\s_axi_bresp_reg[1] (\s_axi_bresp[1]_i_8_n_0 ),
        .\s_axi_bresp_reg[1]_0 (\s_axi_bresp[1]_i_9_n_0 ),
        .\s_axi_bresp_reg[1]_1 (\s_axi_bresp[1]_i_3_n_0 ),
        .\s_axi_bresp_reg[1]_2 (write_address[3:2]),
        .\s_axi_rdata_reg[1] (\s_axi_rdata[31]_i_3_n_0 ),
        .\s_axi_rdata_reg[2] (\s_axi_rdata[2]_i_3_n_0 ),
        .\s_axi_rdata_reg[31] ({shadow_high[31:4],shadow_high[1:0]}),
        .\s_axi_rdata_reg[31]_0 ({shadow_period[31:4],shadow_period[1:0]}),
        .\s_axi_rdata_reg[3] (\s_axi_rdata[3]_i_3_n_0 ),
        .\s_axi_rdata_reg[4] (\s_axi_rdata[31]_i_5_n_0 ),
        .\s_axi_rdata_reg[4]_0 (\s_axi_rdata[31]_i_6_n_0 ),
        .\s_axi_rdata_reg[4]_1 (\s_axi_rdata[31]_i_8_n_0 ),
        .\write_address_reg[2] (pwm_core_n_6),
        .\write_address_reg[2]_0 (pwm_core_n_43),
        .\write_data_reg[0] (pwm_core_n_42),
        .\write_data_reg[1] (pwm_core_n_5));
  FDRE pwm_enable_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(pwm_core_n_42),
        .Q(pwm_enable),
        .R(clear));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h2)) 
    s_axi_arready_INST_0
       (.I0(s_axi_aresetn),
        .I1(s_axi_rvalid_reg_0),
        .O(s_axi_arready));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'h04)) 
    s_axi_awready_INST_0
       (.I0(s_axi_bvalid_reg_0),
        .I1(s_axi_aresetn),
        .I2(address_pending),
        .O(s_axi_awready));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 s_axi_bresp3_carry
       (.CI(1'b0),
        .CO({s_axi_bresp3_carry_n_0,s_axi_bresp3_carry_n_1,s_axi_bresp3_carry_n_2,s_axi_bresp3_carry_n_3}),
        .CYINIT(1'b0),
        .DI({s_axi_bresp3_carry_i_1_n_0,s_axi_bresp3_carry_i_2_n_0,s_axi_bresp3_carry_i_3_n_0,s_axi_bresp3_carry_i_4_n_0}),
        .O(NLW_s_axi_bresp3_carry_O_UNCONNECTED[3:0]),
        .S({s_axi_bresp3_carry_i_5_n_0,s_axi_bresp3_carry_i_6_n_0,s_axi_bresp3_carry_i_7_n_0,s_axi_bresp3_carry_i_8_n_0}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 s_axi_bresp3_carry__0
       (.CI(s_axi_bresp3_carry_n_0),
        .CO({s_axi_bresp3_carry__0_n_0,s_axi_bresp3_carry__0_n_1,s_axi_bresp3_carry__0_n_2,s_axi_bresp3_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({s_axi_bresp3_carry__0_i_1_n_0,s_axi_bresp3_carry__0_i_2_n_0,s_axi_bresp3_carry__0_i_3_n_0,s_axi_bresp3_carry__0_i_4_n_0}),
        .O(NLW_s_axi_bresp3_carry__0_O_UNCONNECTED[3:0]),
        .S({s_axi_bresp3_carry__0_i_5_n_0,s_axi_bresp3_carry__0_i_6_n_0,s_axi_bresp3_carry__0_i_7_n_0,s_axi_bresp3_carry__0_i_8_n_0}));
  LUT4 #(
    .INIT(16'h2F02)) 
    s_axi_bresp3_carry__0_i_1
       (.I0(shadow_high[14]),
        .I1(shadow_period[14]),
        .I2(shadow_period[15]),
        .I3(shadow_high[15]),
        .O(s_axi_bresp3_carry__0_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    s_axi_bresp3_carry__0_i_2
       (.I0(shadow_high[12]),
        .I1(shadow_period[12]),
        .I2(shadow_period[13]),
        .I3(shadow_high[13]),
        .O(s_axi_bresp3_carry__0_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    s_axi_bresp3_carry__0_i_3
       (.I0(shadow_high[10]),
        .I1(shadow_period[10]),
        .I2(shadow_period[11]),
        .I3(shadow_high[11]),
        .O(s_axi_bresp3_carry__0_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    s_axi_bresp3_carry__0_i_4
       (.I0(shadow_high[8]),
        .I1(shadow_period[8]),
        .I2(shadow_period[9]),
        .I3(shadow_high[9]),
        .O(s_axi_bresp3_carry__0_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    s_axi_bresp3_carry__0_i_5
       (.I0(shadow_period[15]),
        .I1(shadow_high[15]),
        .I2(shadow_period[14]),
        .I3(shadow_high[14]),
        .O(s_axi_bresp3_carry__0_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    s_axi_bresp3_carry__0_i_6
       (.I0(shadow_period[13]),
        .I1(shadow_high[13]),
        .I2(shadow_period[12]),
        .I3(shadow_high[12]),
        .O(s_axi_bresp3_carry__0_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    s_axi_bresp3_carry__0_i_7
       (.I0(shadow_period[11]),
        .I1(shadow_high[11]),
        .I2(shadow_period[10]),
        .I3(shadow_high[10]),
        .O(s_axi_bresp3_carry__0_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    s_axi_bresp3_carry__0_i_8
       (.I0(shadow_period[9]),
        .I1(shadow_high[9]),
        .I2(shadow_period[8]),
        .I3(shadow_high[8]),
        .O(s_axi_bresp3_carry__0_i_8_n_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 s_axi_bresp3_carry__1
       (.CI(s_axi_bresp3_carry__0_n_0),
        .CO({s_axi_bresp3_carry__1_n_0,s_axi_bresp3_carry__1_n_1,s_axi_bresp3_carry__1_n_2,s_axi_bresp3_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({s_axi_bresp3_carry__1_i_1_n_0,s_axi_bresp3_carry__1_i_2_n_0,s_axi_bresp3_carry__1_i_3_n_0,s_axi_bresp3_carry__1_i_4_n_0}),
        .O(NLW_s_axi_bresp3_carry__1_O_UNCONNECTED[3:0]),
        .S({s_axi_bresp3_carry__1_i_5_n_0,s_axi_bresp3_carry__1_i_6_n_0,s_axi_bresp3_carry__1_i_7_n_0,s_axi_bresp3_carry__1_i_8_n_0}));
  LUT4 #(
    .INIT(16'h2F02)) 
    s_axi_bresp3_carry__1_i_1
       (.I0(shadow_high[22]),
        .I1(shadow_period[22]),
        .I2(shadow_period[23]),
        .I3(shadow_high[23]),
        .O(s_axi_bresp3_carry__1_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    s_axi_bresp3_carry__1_i_2
       (.I0(shadow_high[20]),
        .I1(shadow_period[20]),
        .I2(shadow_period[21]),
        .I3(shadow_high[21]),
        .O(s_axi_bresp3_carry__1_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    s_axi_bresp3_carry__1_i_3
       (.I0(shadow_high[18]),
        .I1(shadow_period[18]),
        .I2(shadow_period[19]),
        .I3(shadow_high[19]),
        .O(s_axi_bresp3_carry__1_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    s_axi_bresp3_carry__1_i_4
       (.I0(shadow_high[16]),
        .I1(shadow_period[16]),
        .I2(shadow_period[17]),
        .I3(shadow_high[17]),
        .O(s_axi_bresp3_carry__1_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    s_axi_bresp3_carry__1_i_5
       (.I0(shadow_period[23]),
        .I1(shadow_high[23]),
        .I2(shadow_period[22]),
        .I3(shadow_high[22]),
        .O(s_axi_bresp3_carry__1_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    s_axi_bresp3_carry__1_i_6
       (.I0(shadow_period[21]),
        .I1(shadow_high[21]),
        .I2(shadow_period[20]),
        .I3(shadow_high[20]),
        .O(s_axi_bresp3_carry__1_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    s_axi_bresp3_carry__1_i_7
       (.I0(shadow_period[19]),
        .I1(shadow_high[19]),
        .I2(shadow_period[18]),
        .I3(shadow_high[18]),
        .O(s_axi_bresp3_carry__1_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    s_axi_bresp3_carry__1_i_8
       (.I0(shadow_period[17]),
        .I1(shadow_high[17]),
        .I2(shadow_period[16]),
        .I3(shadow_high[16]),
        .O(s_axi_bresp3_carry__1_i_8_n_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 s_axi_bresp3_carry__2
       (.CI(s_axi_bresp3_carry__1_n_0),
        .CO({s_axi_bresp3,s_axi_bresp3_carry__2_n_1,s_axi_bresp3_carry__2_n_2,s_axi_bresp3_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({s_axi_bresp3_carry__2_i_1_n_0,s_axi_bresp3_carry__2_i_2_n_0,s_axi_bresp3_carry__2_i_3_n_0,s_axi_bresp3_carry__2_i_4_n_0}),
        .O(NLW_s_axi_bresp3_carry__2_O_UNCONNECTED[3:0]),
        .S({s_axi_bresp3_carry__2_i_5_n_0,s_axi_bresp3_carry__2_i_6_n_0,s_axi_bresp3_carry__2_i_7_n_0,s_axi_bresp3_carry__2_i_8_n_0}));
  LUT4 #(
    .INIT(16'h2F02)) 
    s_axi_bresp3_carry__2_i_1
       (.I0(shadow_high[30]),
        .I1(shadow_period[30]),
        .I2(shadow_period[31]),
        .I3(shadow_high[31]),
        .O(s_axi_bresp3_carry__2_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    s_axi_bresp3_carry__2_i_2
       (.I0(shadow_high[28]),
        .I1(shadow_period[28]),
        .I2(shadow_period[29]),
        .I3(shadow_high[29]),
        .O(s_axi_bresp3_carry__2_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    s_axi_bresp3_carry__2_i_3
       (.I0(shadow_high[26]),
        .I1(shadow_period[26]),
        .I2(shadow_period[27]),
        .I3(shadow_high[27]),
        .O(s_axi_bresp3_carry__2_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    s_axi_bresp3_carry__2_i_4
       (.I0(shadow_high[24]),
        .I1(shadow_period[24]),
        .I2(shadow_period[25]),
        .I3(shadow_high[25]),
        .O(s_axi_bresp3_carry__2_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    s_axi_bresp3_carry__2_i_5
       (.I0(shadow_period[31]),
        .I1(shadow_high[31]),
        .I2(shadow_period[30]),
        .I3(shadow_high[30]),
        .O(s_axi_bresp3_carry__2_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    s_axi_bresp3_carry__2_i_6
       (.I0(shadow_period[29]),
        .I1(shadow_high[29]),
        .I2(shadow_period[28]),
        .I3(shadow_high[28]),
        .O(s_axi_bresp3_carry__2_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    s_axi_bresp3_carry__2_i_7
       (.I0(shadow_period[27]),
        .I1(shadow_high[27]),
        .I2(shadow_period[26]),
        .I3(shadow_high[26]),
        .O(s_axi_bresp3_carry__2_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    s_axi_bresp3_carry__2_i_8
       (.I0(shadow_period[25]),
        .I1(shadow_high[25]),
        .I2(shadow_period[24]),
        .I3(shadow_high[24]),
        .O(s_axi_bresp3_carry__2_i_8_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    s_axi_bresp3_carry_i_1
       (.I0(shadow_high[6]),
        .I1(shadow_period[6]),
        .I2(shadow_period[7]),
        .I3(shadow_high[7]),
        .O(s_axi_bresp3_carry_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    s_axi_bresp3_carry_i_2
       (.I0(shadow_high[4]),
        .I1(shadow_period[4]),
        .I2(shadow_period[5]),
        .I3(shadow_high[5]),
        .O(s_axi_bresp3_carry_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    s_axi_bresp3_carry_i_3
       (.I0(shadow_high[2]),
        .I1(shadow_period[2]),
        .I2(shadow_period[3]),
        .I3(shadow_high[3]),
        .O(s_axi_bresp3_carry_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    s_axi_bresp3_carry_i_4
       (.I0(shadow_high[0]),
        .I1(shadow_period[0]),
        .I2(shadow_period[1]),
        .I3(shadow_high[1]),
        .O(s_axi_bresp3_carry_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    s_axi_bresp3_carry_i_5
       (.I0(shadow_period[7]),
        .I1(shadow_high[7]),
        .I2(shadow_period[6]),
        .I3(shadow_high[6]),
        .O(s_axi_bresp3_carry_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    s_axi_bresp3_carry_i_6
       (.I0(shadow_period[5]),
        .I1(shadow_high[5]),
        .I2(shadow_period[4]),
        .I3(shadow_high[4]),
        .O(s_axi_bresp3_carry_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    s_axi_bresp3_carry_i_7
       (.I0(shadow_period[3]),
        .I1(shadow_high[3]),
        .I2(shadow_period[2]),
        .I3(shadow_high[2]),
        .O(s_axi_bresp3_carry_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    s_axi_bresp3_carry_i_8
       (.I0(shadow_period[1]),
        .I1(shadow_high[1]),
        .I2(shadow_period[0]),
        .I3(shadow_high[0]),
        .O(s_axi_bresp3_carry_i_8_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \s_axi_bresp[1]_i_10 
       (.I0(\s_axi_bresp[1]_i_14_n_0 ),
        .I1(\s_axi_bresp[1]_i_15_n_0 ),
        .I2(\s_axi_bresp[1]_i_16_n_0 ),
        .I3(\s_axi_bresp[1]_i_17_n_0 ),
        .O(\s_axi_bresp[1]_i_10_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \s_axi_bresp[1]_i_12 
       (.I0(shadow_period[11]),
        .I1(shadow_period[10]),
        .I2(shadow_period[9]),
        .I3(shadow_period[8]),
        .O(\s_axi_bresp[1]_i_12_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \s_axi_bresp[1]_i_13 
       (.I0(shadow_period[7]),
        .I1(shadow_period[6]),
        .I2(shadow_period[5]),
        .I3(shadow_period[4]),
        .O(\s_axi_bresp[1]_i_13_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \s_axi_bresp[1]_i_14 
       (.I0(shadow_period[20]),
        .I1(shadow_period[21]),
        .I2(shadow_period[22]),
        .I3(shadow_period[23]),
        .O(\s_axi_bresp[1]_i_14_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \s_axi_bresp[1]_i_15 
       (.I0(shadow_period[16]),
        .I1(shadow_period[17]),
        .I2(shadow_period[18]),
        .I3(shadow_period[19]),
        .O(\s_axi_bresp[1]_i_15_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \s_axi_bresp[1]_i_16 
       (.I0(shadow_period[28]),
        .I1(shadow_period[29]),
        .I2(shadow_period[31]),
        .I3(shadow_period[30]),
        .O(\s_axi_bresp[1]_i_16_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \s_axi_bresp[1]_i_17 
       (.I0(shadow_period[24]),
        .I1(shadow_period[25]),
        .I2(shadow_period[26]),
        .I3(shadow_period[27]),
        .O(\s_axi_bresp[1]_i_17_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'hFFFFFEEE)) 
    \s_axi_bresp[1]_i_3 
       (.I0(write_address[1]),
        .I1(write_address[0]),
        .I2(write_address[2]),
        .I3(write_address[3]),
        .I4(\s_axi_bresp[1]_i_6_n_0 ),
        .O(\s_axi_bresp[1]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \s_axi_bresp[1]_i_5 
       (.I0(s_axi_bvalid_reg_0),
        .I1(data_pending_reg_n_0),
        .I2(address_pending),
        .O(address_pending0));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \s_axi_bresp[1]_i_6 
       (.I0(write_address[7]),
        .I1(write_address[6]),
        .I2(write_address[5]),
        .I3(write_address[4]),
        .I4(\shadow_period[31]_i_3_n_0 ),
        .O(\s_axi_bresp[1]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \s_axi_bresp[1]_i_7 
       (.I0(p_0_in10_in),
        .I1(p_7_out),
        .O(\s_axi_bresp[1]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h00010000)) 
    \s_axi_bresp[1]_i_8 
       (.I0(shadow_period[12]),
        .I1(shadow_period[13]),
        .I2(shadow_period[14]),
        .I3(shadow_period[15]),
        .I4(\s_axi_bresp[1]_i_12_n_0 ),
        .O(\s_axi_bresp[1]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h00010000)) 
    \s_axi_bresp[1]_i_9 
       (.I0(shadow_period[2]),
        .I1(shadow_period[3]),
        .I2(shadow_period[0]),
        .I3(shadow_period[1]),
        .I4(\s_axi_bresp[1]_i_13_n_0 ),
        .O(\s_axi_bresp[1]_i_9_n_0 ));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BRESP" *) 
  FDRE \s_axi_bresp_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(pwm_core_n_43),
        .Q(s_axi_bresp),
        .R(clear));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'h55C0)) 
    s_axi_bvalid_i_1
       (.I0(s_axi_bready),
        .I1(address_pending),
        .I2(data_pending_reg_n_0),
        .I3(s_axi_bvalid_reg_0),
        .O(s_axi_bvalid_i_1_n_0));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BVALID" *) 
  FDRE s_axi_bvalid_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_axi_bvalid_i_1_n_0),
        .Q(s_axi_bvalid_reg_0),
        .R(clear));
  LUT5 #(
    .INIT(32'hF0CCAA00)) 
    \s_axi_rdata[2]_i_3 
       (.I0(shadow_high[2]),
        .I1(shadow_period[2]),
        .I2(error_sticky),
        .I3(s_axi_araddr[3]),
        .I4(s_axi_araddr[2]),
        .O(\s_axi_rdata[2]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \s_axi_rdata[31]_i_1 
       (.I0(s_axi_arvalid),
        .I1(s_axi_rvalid_reg_0),
        .O(s_axi_rvalid013_out));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \s_axi_rdata[31]_i_3 
       (.I0(s_axi_araddr[1]),
        .I1(s_axi_araddr[0]),
        .I2(s_axi_araddr[9]),
        .I3(s_axi_araddr[10]),
        .I4(s_axi_araddr[6]),
        .I5(\s_axi_rdata[31]_i_7_n_0 ),
        .O(\s_axi_rdata[31]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'h04040004)) 
    \s_axi_rdata[31]_i_5 
       (.I0(s_axi_araddr[3]),
        .I1(s_axi_araddr[2]),
        .I2(s_axi_araddr[1]),
        .I3(s_axi_araddr[4]),
        .I4(s_axi_araddr[0]),
        .O(\s_axi_rdata[31]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'h04040004)) 
    \s_axi_rdata[31]_i_6 
       (.I0(s_axi_araddr[2]),
        .I1(s_axi_araddr[3]),
        .I2(s_axi_araddr[1]),
        .I3(s_axi_araddr[4]),
        .I4(s_axi_araddr[0]),
        .O(\s_axi_rdata[31]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \s_axi_rdata[31]_i_7 
       (.I0(s_axi_araddr[8]),
        .I1(s_axi_araddr[5]),
        .I2(s_axi_araddr[11]),
        .I3(s_axi_araddr[7]),
        .O(\s_axi_rdata[31]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'hF4)) 
    \s_axi_rdata[31]_i_8 
       (.I0(s_axi_araddr[0]),
        .I1(s_axi_araddr[4]),
        .I2(s_axi_araddr[1]),
        .O(\s_axi_rdata[31]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hF0CCAA00)) 
    \s_axi_rdata[3]_i_3 
       (.I0(shadow_high[3]),
        .I1(shadow_period[3]),
        .I2(applied_sticky),
        .I3(s_axi_araddr[3]),
        .I4(s_axi_araddr[2]),
        .O(\s_axi_rdata[3]_i_3_n_0 ));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[0] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid013_out),
        .D(pwm_core_n_40),
        .Q(s_axi_rdata[0]),
        .R(clear));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[10] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid013_out),
        .D(pwm_core_n_30),
        .Q(s_axi_rdata[10]),
        .R(clear));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[11] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid013_out),
        .D(pwm_core_n_29),
        .Q(s_axi_rdata[11]),
        .R(clear));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[12] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid013_out),
        .D(pwm_core_n_28),
        .Q(s_axi_rdata[12]),
        .R(clear));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[13] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid013_out),
        .D(pwm_core_n_27),
        .Q(s_axi_rdata[13]),
        .R(clear));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[14] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid013_out),
        .D(pwm_core_n_26),
        .Q(s_axi_rdata[14]),
        .R(clear));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[15] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid013_out),
        .D(pwm_core_n_25),
        .Q(s_axi_rdata[15]),
        .R(clear));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[16] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid013_out),
        .D(pwm_core_n_24),
        .Q(s_axi_rdata[16]),
        .R(clear));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[17] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid013_out),
        .D(pwm_core_n_23),
        .Q(s_axi_rdata[17]),
        .R(clear));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[18] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid013_out),
        .D(pwm_core_n_22),
        .Q(s_axi_rdata[18]),
        .R(clear));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[19] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid013_out),
        .D(pwm_core_n_21),
        .Q(s_axi_rdata[19]),
        .R(clear));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[1] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid013_out),
        .D(pwm_core_n_39),
        .Q(s_axi_rdata[1]),
        .R(clear));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[20] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid013_out),
        .D(pwm_core_n_20),
        .Q(s_axi_rdata[20]),
        .R(clear));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[21] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid013_out),
        .D(pwm_core_n_19),
        .Q(s_axi_rdata[21]),
        .R(clear));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[22] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid013_out),
        .D(pwm_core_n_18),
        .Q(s_axi_rdata[22]),
        .R(clear));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[23] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid013_out),
        .D(pwm_core_n_17),
        .Q(s_axi_rdata[23]),
        .R(clear));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[24] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid013_out),
        .D(pwm_core_n_16),
        .Q(s_axi_rdata[24]),
        .R(clear));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[25] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid013_out),
        .D(pwm_core_n_15),
        .Q(s_axi_rdata[25]),
        .R(clear));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[26] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid013_out),
        .D(pwm_core_n_14),
        .Q(s_axi_rdata[26]),
        .R(clear));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[27] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid013_out),
        .D(pwm_core_n_13),
        .Q(s_axi_rdata[27]),
        .R(clear));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[28] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid013_out),
        .D(pwm_core_n_12),
        .Q(s_axi_rdata[28]),
        .R(clear));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[29] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid013_out),
        .D(pwm_core_n_11),
        .Q(s_axi_rdata[29]),
        .R(clear));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[2] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid013_out),
        .D(pwm_core_n_38),
        .Q(s_axi_rdata[2]),
        .R(clear));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[30] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid013_out),
        .D(pwm_core_n_10),
        .Q(s_axi_rdata[30]),
        .R(clear));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[31] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid013_out),
        .D(pwm_core_n_9),
        .Q(s_axi_rdata[31]),
        .R(clear));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[3] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid013_out),
        .D(pwm_core_n_37),
        .Q(s_axi_rdata[3]),
        .R(clear));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[4] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid013_out),
        .D(pwm_core_n_36),
        .Q(s_axi_rdata[4]),
        .R(clear));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[5] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid013_out),
        .D(pwm_core_n_35),
        .Q(s_axi_rdata[5]),
        .R(clear));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[6] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid013_out),
        .D(pwm_core_n_34),
        .Q(s_axi_rdata[6]),
        .R(clear));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[7] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid013_out),
        .D(pwm_core_n_33),
        .Q(s_axi_rdata[7]),
        .R(clear));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[8] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid013_out),
        .D(pwm_core_n_32),
        .Q(s_axi_rdata[8]),
        .R(clear));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[9] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid013_out),
        .D(pwm_core_n_31),
        .Q(s_axi_rdata[9]),
        .R(clear));
  LUT1 #(
    .INIT(2'h1)) 
    \s_axi_rresp[1]_i_1 
       (.I0(\s_axi_rdata[31]_i_3_n_0 ),
        .O(\s_axi_rresp[1]_i_1_n_0 ));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RRESP" *) 
  FDRE \s_axi_rresp_reg[1] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid013_out),
        .D(\s_axi_rresp[1]_i_1_n_0 ),
        .Q(s_axi_rresp),
        .R(clear));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'h74)) 
    s_axi_rvalid_i_1
       (.I0(s_axi_rready),
        .I1(s_axi_rvalid_reg_0),
        .I2(s_axi_arvalid),
        .O(s_axi_rvalid_i_1_n_0));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RVALID" *) 
  FDRE s_axi_rvalid_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_axi_rvalid_i_1_n_0),
        .Q(s_axi_rvalid_reg_0),
        .R(clear));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h04)) 
    s_axi_wready_INST_0
       (.I0(s_axi_bvalid_reg_0),
        .I1(s_axi_aresetn),
        .I2(data_pending_reg_n_0),
        .O(s_axi_wready));
  LUT6 #(
    .INIT(64'h0000020000000000)) 
    \shadow_high[15]_i_1 
       (.I0(\shadow_period[31]_i_2_n_0 ),
        .I1(write_address[1]),
        .I2(write_address[0]),
        .I3(write_address[3]),
        .I4(write_address[2]),
        .I5(p_5_out),
        .O(\shadow_high[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000020000000000)) 
    \shadow_high[23]_i_1 
       (.I0(\shadow_period[31]_i_2_n_0 ),
        .I1(write_address[1]),
        .I2(write_address[0]),
        .I3(write_address[3]),
        .I4(write_address[2]),
        .I5(p_0_in0),
        .O(\shadow_high[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000020000000000)) 
    \shadow_high[31]_i_1 
       (.I0(\shadow_period[31]_i_2_n_0 ),
        .I1(write_address[1]),
        .I2(write_address[0]),
        .I3(write_address[3]),
        .I4(write_address[2]),
        .I5(\write_strobes_reg_n_0_[3] ),
        .O(\shadow_high[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000020000000000)) 
    \shadow_high[7]_i_1 
       (.I0(\shadow_period[31]_i_2_n_0 ),
        .I1(write_address[1]),
        .I2(write_address[0]),
        .I3(write_address[3]),
        .I4(write_address[2]),
        .I5(p_7_out),
        .O(\shadow_high[7]_i_1_n_0 ));
  FDRE \shadow_high_reg[0] 
       (.C(s_axi_aclk),
        .CE(\shadow_high[7]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[0] ),
        .Q(shadow_high[0]),
        .R(clear));
  FDRE \shadow_high_reg[10] 
       (.C(s_axi_aclk),
        .CE(\shadow_high[15]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[10] ),
        .Q(shadow_high[10]),
        .R(clear));
  FDRE \shadow_high_reg[11] 
       (.C(s_axi_aclk),
        .CE(\shadow_high[15]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[11] ),
        .Q(shadow_high[11]),
        .R(clear));
  FDRE \shadow_high_reg[12] 
       (.C(s_axi_aclk),
        .CE(\shadow_high[15]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[12] ),
        .Q(shadow_high[12]),
        .R(clear));
  FDRE \shadow_high_reg[13] 
       (.C(s_axi_aclk),
        .CE(\shadow_high[15]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[13] ),
        .Q(shadow_high[13]),
        .R(clear));
  FDRE \shadow_high_reg[14] 
       (.C(s_axi_aclk),
        .CE(\shadow_high[15]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[14] ),
        .Q(shadow_high[14]),
        .R(clear));
  FDRE \shadow_high_reg[15] 
       (.C(s_axi_aclk),
        .CE(\shadow_high[15]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[15] ),
        .Q(shadow_high[15]),
        .R(clear));
  FDRE \shadow_high_reg[16] 
       (.C(s_axi_aclk),
        .CE(\shadow_high[23]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[16] ),
        .Q(shadow_high[16]),
        .R(clear));
  FDRE \shadow_high_reg[17] 
       (.C(s_axi_aclk),
        .CE(\shadow_high[23]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[17] ),
        .Q(shadow_high[17]),
        .R(clear));
  FDRE \shadow_high_reg[18] 
       (.C(s_axi_aclk),
        .CE(\shadow_high[23]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[18] ),
        .Q(shadow_high[18]),
        .R(clear));
  FDRE \shadow_high_reg[19] 
       (.C(s_axi_aclk),
        .CE(\shadow_high[23]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[19] ),
        .Q(shadow_high[19]),
        .R(clear));
  FDRE \shadow_high_reg[1] 
       (.C(s_axi_aclk),
        .CE(\shadow_high[7]_i_1_n_0 ),
        .D(p_0_in10_in),
        .Q(shadow_high[1]),
        .R(clear));
  FDRE \shadow_high_reg[20] 
       (.C(s_axi_aclk),
        .CE(\shadow_high[23]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[20] ),
        .Q(shadow_high[20]),
        .R(clear));
  FDRE \shadow_high_reg[21] 
       (.C(s_axi_aclk),
        .CE(\shadow_high[23]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[21] ),
        .Q(shadow_high[21]),
        .R(clear));
  FDRE \shadow_high_reg[22] 
       (.C(s_axi_aclk),
        .CE(\shadow_high[23]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[22] ),
        .Q(shadow_high[22]),
        .R(clear));
  FDRE \shadow_high_reg[23] 
       (.C(s_axi_aclk),
        .CE(\shadow_high[23]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[23] ),
        .Q(shadow_high[23]),
        .R(clear));
  FDRE \shadow_high_reg[24] 
       (.C(s_axi_aclk),
        .CE(\shadow_high[31]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[24] ),
        .Q(shadow_high[24]),
        .R(clear));
  FDRE \shadow_high_reg[25] 
       (.C(s_axi_aclk),
        .CE(\shadow_high[31]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[25] ),
        .Q(shadow_high[25]),
        .R(clear));
  FDRE \shadow_high_reg[26] 
       (.C(s_axi_aclk),
        .CE(\shadow_high[31]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[26] ),
        .Q(shadow_high[26]),
        .R(clear));
  FDRE \shadow_high_reg[27] 
       (.C(s_axi_aclk),
        .CE(\shadow_high[31]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[27] ),
        .Q(shadow_high[27]),
        .R(clear));
  FDRE \shadow_high_reg[28] 
       (.C(s_axi_aclk),
        .CE(\shadow_high[31]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[28] ),
        .Q(shadow_high[28]),
        .R(clear));
  FDRE \shadow_high_reg[29] 
       (.C(s_axi_aclk),
        .CE(\shadow_high[31]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[29] ),
        .Q(shadow_high[29]),
        .R(clear));
  FDRE \shadow_high_reg[2] 
       (.C(s_axi_aclk),
        .CE(\shadow_high[7]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[2] ),
        .Q(shadow_high[2]),
        .R(clear));
  FDRE \shadow_high_reg[30] 
       (.C(s_axi_aclk),
        .CE(\shadow_high[31]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[30] ),
        .Q(shadow_high[30]),
        .R(clear));
  FDRE \shadow_high_reg[31] 
       (.C(s_axi_aclk),
        .CE(\shadow_high[31]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[31] ),
        .Q(shadow_high[31]),
        .R(clear));
  FDRE \shadow_high_reg[3] 
       (.C(s_axi_aclk),
        .CE(\shadow_high[7]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[3] ),
        .Q(shadow_high[3]),
        .R(clear));
  FDRE \shadow_high_reg[4] 
       (.C(s_axi_aclk),
        .CE(\shadow_high[7]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[4] ),
        .Q(shadow_high[4]),
        .R(clear));
  FDRE \shadow_high_reg[5] 
       (.C(s_axi_aclk),
        .CE(\shadow_high[7]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[5] ),
        .Q(shadow_high[5]),
        .R(clear));
  FDRE \shadow_high_reg[6] 
       (.C(s_axi_aclk),
        .CE(\shadow_high[7]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[6] ),
        .Q(shadow_high[6]),
        .R(clear));
  FDRE \shadow_high_reg[7] 
       (.C(s_axi_aclk),
        .CE(\shadow_high[7]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[7] ),
        .Q(shadow_high[7]),
        .R(clear));
  FDRE \shadow_high_reg[8] 
       (.C(s_axi_aclk),
        .CE(\shadow_high[15]_i_1_n_0 ),
        .D(p_0_in11_in),
        .Q(shadow_high[8]),
        .R(clear));
  FDRE \shadow_high_reg[9] 
       (.C(s_axi_aclk),
        .CE(\shadow_high[15]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[9] ),
        .Q(shadow_high[9]),
        .R(clear));
  LUT6 #(
    .INIT(64'h0004000000000000)) 
    \shadow_period[15]_i_1 
       (.I0(write_address[3]),
        .I1(\shadow_period[31]_i_2_n_0 ),
        .I2(write_address[1]),
        .I3(write_address[0]),
        .I4(write_address[2]),
        .I5(p_5_out),
        .O(p_1_in[8]));
  LUT6 #(
    .INIT(64'h0004000000000000)) 
    \shadow_period[23]_i_1 
       (.I0(write_address[3]),
        .I1(\shadow_period[31]_i_2_n_0 ),
        .I2(write_address[1]),
        .I3(write_address[0]),
        .I4(write_address[2]),
        .I5(p_0_in0),
        .O(p_1_in[16]));
  LUT6 #(
    .INIT(64'h0004000000000000)) 
    \shadow_period[31]_i_1 
       (.I0(write_address[3]),
        .I1(\shadow_period[31]_i_2_n_0 ),
        .I2(write_address[1]),
        .I3(write_address[0]),
        .I4(write_address[2]),
        .I5(\write_strobes_reg_n_0_[3] ),
        .O(p_1_in[24]));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    \shadow_period[31]_i_2 
       (.I0(address_pending0),
        .I1(\shadow_period[31]_i_3_n_0 ),
        .I2(write_address[4]),
        .I3(write_address[5]),
        .I4(write_address[6]),
        .I5(write_address[7]),
        .O(\shadow_period[31]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \shadow_period[31]_i_3 
       (.I0(write_address[8]),
        .I1(write_address[9]),
        .I2(write_address[10]),
        .I3(write_address[11]),
        .O(\shadow_period[31]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0004000000000000)) 
    \shadow_period[7]_i_1 
       (.I0(write_address[3]),
        .I1(\shadow_period[31]_i_2_n_0 ),
        .I2(write_address[1]),
        .I3(write_address[0]),
        .I4(write_address[2]),
        .I5(p_7_out),
        .O(p_1_in[0]));
  FDRE \shadow_period_reg[0] 
       (.C(s_axi_aclk),
        .CE(p_1_in[0]),
        .D(\write_data_reg_n_0_[0] ),
        .Q(shadow_period[0]),
        .R(clear));
  FDRE \shadow_period_reg[10] 
       (.C(s_axi_aclk),
        .CE(p_1_in[8]),
        .D(\write_data_reg_n_0_[10] ),
        .Q(shadow_period[10]),
        .R(clear));
  FDRE \shadow_period_reg[11] 
       (.C(s_axi_aclk),
        .CE(p_1_in[8]),
        .D(\write_data_reg_n_0_[11] ),
        .Q(shadow_period[11]),
        .R(clear));
  FDRE \shadow_period_reg[12] 
       (.C(s_axi_aclk),
        .CE(p_1_in[8]),
        .D(\write_data_reg_n_0_[12] ),
        .Q(shadow_period[12]),
        .R(clear));
  FDRE \shadow_period_reg[13] 
       (.C(s_axi_aclk),
        .CE(p_1_in[8]),
        .D(\write_data_reg_n_0_[13] ),
        .Q(shadow_period[13]),
        .R(clear));
  FDRE \shadow_period_reg[14] 
       (.C(s_axi_aclk),
        .CE(p_1_in[8]),
        .D(\write_data_reg_n_0_[14] ),
        .Q(shadow_period[14]),
        .R(clear));
  FDRE \shadow_period_reg[15] 
       (.C(s_axi_aclk),
        .CE(p_1_in[8]),
        .D(\write_data_reg_n_0_[15] ),
        .Q(shadow_period[15]),
        .R(clear));
  FDRE \shadow_period_reg[16] 
       (.C(s_axi_aclk),
        .CE(p_1_in[16]),
        .D(\write_data_reg_n_0_[16] ),
        .Q(shadow_period[16]),
        .R(clear));
  FDRE \shadow_period_reg[17] 
       (.C(s_axi_aclk),
        .CE(p_1_in[16]),
        .D(\write_data_reg_n_0_[17] ),
        .Q(shadow_period[17]),
        .R(clear));
  FDRE \shadow_period_reg[18] 
       (.C(s_axi_aclk),
        .CE(p_1_in[16]),
        .D(\write_data_reg_n_0_[18] ),
        .Q(shadow_period[18]),
        .R(clear));
  FDRE \shadow_period_reg[19] 
       (.C(s_axi_aclk),
        .CE(p_1_in[16]),
        .D(\write_data_reg_n_0_[19] ),
        .Q(shadow_period[19]),
        .R(clear));
  FDRE \shadow_period_reg[1] 
       (.C(s_axi_aclk),
        .CE(p_1_in[0]),
        .D(p_0_in10_in),
        .Q(shadow_period[1]),
        .R(clear));
  FDRE \shadow_period_reg[20] 
       (.C(s_axi_aclk),
        .CE(p_1_in[16]),
        .D(\write_data_reg_n_0_[20] ),
        .Q(shadow_period[20]),
        .R(clear));
  FDRE \shadow_period_reg[21] 
       (.C(s_axi_aclk),
        .CE(p_1_in[16]),
        .D(\write_data_reg_n_0_[21] ),
        .Q(shadow_period[21]),
        .R(clear));
  FDRE \shadow_period_reg[22] 
       (.C(s_axi_aclk),
        .CE(p_1_in[16]),
        .D(\write_data_reg_n_0_[22] ),
        .Q(shadow_period[22]),
        .R(clear));
  FDRE \shadow_period_reg[23] 
       (.C(s_axi_aclk),
        .CE(p_1_in[16]),
        .D(\write_data_reg_n_0_[23] ),
        .Q(shadow_period[23]),
        .R(clear));
  FDRE \shadow_period_reg[24] 
       (.C(s_axi_aclk),
        .CE(p_1_in[24]),
        .D(\write_data_reg_n_0_[24] ),
        .Q(shadow_period[24]),
        .R(clear));
  FDRE \shadow_period_reg[25] 
       (.C(s_axi_aclk),
        .CE(p_1_in[24]),
        .D(\write_data_reg_n_0_[25] ),
        .Q(shadow_period[25]),
        .R(clear));
  FDRE \shadow_period_reg[26] 
       (.C(s_axi_aclk),
        .CE(p_1_in[24]),
        .D(\write_data_reg_n_0_[26] ),
        .Q(shadow_period[26]),
        .R(clear));
  FDRE \shadow_period_reg[27] 
       (.C(s_axi_aclk),
        .CE(p_1_in[24]),
        .D(\write_data_reg_n_0_[27] ),
        .Q(shadow_period[27]),
        .R(clear));
  FDRE \shadow_period_reg[28] 
       (.C(s_axi_aclk),
        .CE(p_1_in[24]),
        .D(\write_data_reg_n_0_[28] ),
        .Q(shadow_period[28]),
        .R(clear));
  FDRE \shadow_period_reg[29] 
       (.C(s_axi_aclk),
        .CE(p_1_in[24]),
        .D(\write_data_reg_n_0_[29] ),
        .Q(shadow_period[29]),
        .R(clear));
  FDRE \shadow_period_reg[2] 
       (.C(s_axi_aclk),
        .CE(p_1_in[0]),
        .D(\write_data_reg_n_0_[2] ),
        .Q(shadow_period[2]),
        .R(clear));
  FDRE \shadow_period_reg[30] 
       (.C(s_axi_aclk),
        .CE(p_1_in[24]),
        .D(\write_data_reg_n_0_[30] ),
        .Q(shadow_period[30]),
        .R(clear));
  FDRE \shadow_period_reg[31] 
       (.C(s_axi_aclk),
        .CE(p_1_in[24]),
        .D(\write_data_reg_n_0_[31] ),
        .Q(shadow_period[31]),
        .R(clear));
  FDRE \shadow_period_reg[3] 
       (.C(s_axi_aclk),
        .CE(p_1_in[0]),
        .D(\write_data_reg_n_0_[3] ),
        .Q(shadow_period[3]),
        .R(clear));
  FDRE \shadow_period_reg[4] 
       (.C(s_axi_aclk),
        .CE(p_1_in[0]),
        .D(\write_data_reg_n_0_[4] ),
        .Q(shadow_period[4]),
        .R(clear));
  FDRE \shadow_period_reg[5] 
       (.C(s_axi_aclk),
        .CE(p_1_in[0]),
        .D(\write_data_reg_n_0_[5] ),
        .Q(shadow_period[5]),
        .R(clear));
  FDRE \shadow_period_reg[6] 
       (.C(s_axi_aclk),
        .CE(p_1_in[0]),
        .D(\write_data_reg_n_0_[6] ),
        .Q(shadow_period[6]),
        .R(clear));
  FDRE \shadow_period_reg[7] 
       (.C(s_axi_aclk),
        .CE(p_1_in[0]),
        .D(\write_data_reg_n_0_[7] ),
        .Q(shadow_period[7]),
        .R(clear));
  FDRE \shadow_period_reg[8] 
       (.C(s_axi_aclk),
        .CE(p_1_in[8]),
        .D(p_0_in11_in),
        .Q(shadow_period[8]),
        .R(clear));
  FDRE \shadow_period_reg[9] 
       (.C(s_axi_aclk),
        .CE(p_1_in[8]),
        .D(\write_data_reg_n_0_[9] ),
        .Q(shadow_period[9]),
        .R(clear));
  LUT3 #(
    .INIT(8'h10)) 
    \write_address[11]_i_1 
       (.I0(address_pending),
        .I1(s_axi_bvalid_reg_0),
        .I2(s_axi_awvalid),
        .O(write_address0));
  FDRE \write_address_reg[0] 
       (.C(s_axi_aclk),
        .CE(write_address0),
        .D(s_axi_awaddr[0]),
        .Q(write_address[0]),
        .R(clear));
  FDRE \write_address_reg[10] 
       (.C(s_axi_aclk),
        .CE(write_address0),
        .D(s_axi_awaddr[10]),
        .Q(write_address[10]),
        .R(clear));
  FDRE \write_address_reg[11] 
       (.C(s_axi_aclk),
        .CE(write_address0),
        .D(s_axi_awaddr[11]),
        .Q(write_address[11]),
        .R(clear));
  FDRE \write_address_reg[1] 
       (.C(s_axi_aclk),
        .CE(write_address0),
        .D(s_axi_awaddr[1]),
        .Q(write_address[1]),
        .R(clear));
  FDRE \write_address_reg[2] 
       (.C(s_axi_aclk),
        .CE(write_address0),
        .D(s_axi_awaddr[2]),
        .Q(write_address[2]),
        .R(clear));
  FDRE \write_address_reg[3] 
       (.C(s_axi_aclk),
        .CE(write_address0),
        .D(s_axi_awaddr[3]),
        .Q(write_address[3]),
        .R(clear));
  FDRE \write_address_reg[4] 
       (.C(s_axi_aclk),
        .CE(write_address0),
        .D(s_axi_awaddr[4]),
        .Q(write_address[4]),
        .R(clear));
  FDRE \write_address_reg[5] 
       (.C(s_axi_aclk),
        .CE(write_address0),
        .D(s_axi_awaddr[5]),
        .Q(write_address[5]),
        .R(clear));
  FDRE \write_address_reg[6] 
       (.C(s_axi_aclk),
        .CE(write_address0),
        .D(s_axi_awaddr[6]),
        .Q(write_address[6]),
        .R(clear));
  FDRE \write_address_reg[7] 
       (.C(s_axi_aclk),
        .CE(write_address0),
        .D(s_axi_awaddr[7]),
        .Q(write_address[7]),
        .R(clear));
  FDRE \write_address_reg[8] 
       (.C(s_axi_aclk),
        .CE(write_address0),
        .D(s_axi_awaddr[8]),
        .Q(write_address[8]),
        .R(clear));
  FDRE \write_address_reg[9] 
       (.C(s_axi_aclk),
        .CE(write_address0),
        .D(s_axi_awaddr[9]),
        .Q(write_address[9]),
        .R(clear));
  FDRE \write_data_reg[0] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[0]),
        .Q(\write_data_reg_n_0_[0] ),
        .R(clear));
  FDRE \write_data_reg[10] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[10]),
        .Q(\write_data_reg_n_0_[10] ),
        .R(clear));
  FDRE \write_data_reg[11] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[11]),
        .Q(\write_data_reg_n_0_[11] ),
        .R(clear));
  FDRE \write_data_reg[12] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[12]),
        .Q(\write_data_reg_n_0_[12] ),
        .R(clear));
  FDRE \write_data_reg[13] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[13]),
        .Q(\write_data_reg_n_0_[13] ),
        .R(clear));
  FDRE \write_data_reg[14] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[14]),
        .Q(\write_data_reg_n_0_[14] ),
        .R(clear));
  FDRE \write_data_reg[15] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[15]),
        .Q(\write_data_reg_n_0_[15] ),
        .R(clear));
  FDRE \write_data_reg[16] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[16]),
        .Q(\write_data_reg_n_0_[16] ),
        .R(clear));
  FDRE \write_data_reg[17] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[17]),
        .Q(\write_data_reg_n_0_[17] ),
        .R(clear));
  FDRE \write_data_reg[18] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[18]),
        .Q(\write_data_reg_n_0_[18] ),
        .R(clear));
  FDRE \write_data_reg[19] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[19]),
        .Q(\write_data_reg_n_0_[19] ),
        .R(clear));
  FDRE \write_data_reg[1] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[1]),
        .Q(p_0_in10_in),
        .R(clear));
  FDRE \write_data_reg[20] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[20]),
        .Q(\write_data_reg_n_0_[20] ),
        .R(clear));
  FDRE \write_data_reg[21] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[21]),
        .Q(\write_data_reg_n_0_[21] ),
        .R(clear));
  FDRE \write_data_reg[22] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[22]),
        .Q(\write_data_reg_n_0_[22] ),
        .R(clear));
  FDRE \write_data_reg[23] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[23]),
        .Q(\write_data_reg_n_0_[23] ),
        .R(clear));
  FDRE \write_data_reg[24] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[24]),
        .Q(\write_data_reg_n_0_[24] ),
        .R(clear));
  FDRE \write_data_reg[25] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[25]),
        .Q(\write_data_reg_n_0_[25] ),
        .R(clear));
  FDRE \write_data_reg[26] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[26]),
        .Q(\write_data_reg_n_0_[26] ),
        .R(clear));
  FDRE \write_data_reg[27] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[27]),
        .Q(\write_data_reg_n_0_[27] ),
        .R(clear));
  FDRE \write_data_reg[28] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[28]),
        .Q(\write_data_reg_n_0_[28] ),
        .R(clear));
  FDRE \write_data_reg[29] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[29]),
        .Q(\write_data_reg_n_0_[29] ),
        .R(clear));
  FDRE \write_data_reg[2] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[2]),
        .Q(\write_data_reg_n_0_[2] ),
        .R(clear));
  FDRE \write_data_reg[30] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[30]),
        .Q(\write_data_reg_n_0_[30] ),
        .R(clear));
  FDRE \write_data_reg[31] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[31]),
        .Q(\write_data_reg_n_0_[31] ),
        .R(clear));
  FDRE \write_data_reg[3] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[3]),
        .Q(\write_data_reg_n_0_[3] ),
        .R(clear));
  FDRE \write_data_reg[4] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[4]),
        .Q(\write_data_reg_n_0_[4] ),
        .R(clear));
  FDRE \write_data_reg[5] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[5]),
        .Q(\write_data_reg_n_0_[5] ),
        .R(clear));
  FDRE \write_data_reg[6] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[6]),
        .Q(\write_data_reg_n_0_[6] ),
        .R(clear));
  FDRE \write_data_reg[7] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[7]),
        .Q(\write_data_reg_n_0_[7] ),
        .R(clear));
  FDRE \write_data_reg[8] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[8]),
        .Q(p_0_in11_in),
        .R(clear));
  FDRE \write_data_reg[9] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[9]),
        .Q(\write_data_reg_n_0_[9] ),
        .R(clear));
  LUT3 #(
    .INIT(8'h10)) 
    \write_strobes[3]_i_1 
       (.I0(data_pending_reg_n_0),
        .I1(s_axi_bvalid_reg_0),
        .I2(s_axi_wvalid),
        .O(write_data0));
  FDRE \write_strobes_reg[0] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wstrb[0]),
        .Q(p_7_out),
        .R(clear));
  FDRE \write_strobes_reg[1] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wstrb[1]),
        .Q(p_5_out),
        .R(clear));
  FDRE \write_strobes_reg[2] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wstrb[2]),
        .Q(p_0_in0),
        .R(clear));
  FDRE \write_strobes_reg[3] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wstrb[3]),
        .Q(\write_strobes_reg_n_0_[3] ),
        .R(clear));
endmodule

(* ORIG_REF_NAME = "fdw_pwm_core" *) 
module system_pwm_control_b_0_fdw_pwm_core
   (cfg_applied,
    clear,
    pwm_out,
    period_start_reg_0,
    cfg_error,
    \write_data_reg[1] ,
    \write_address_reg[2] ,
    E,
    s_axi_bresp1,
    D,
    activity,
    \write_data_reg[0] ,
    \write_address_reg[2]_0 ,
    s_axi_aclk,
    s_axi_aresetn,
    cfg_error_reg_0,
    pwm_enable,
    Q,
    commit_valid_reg,
    pwm_enable_reg,
    pwm_enable_reg_0,
    CO,
    pwm_enable_reg_1,
    pwm_enable_reg_2,
    pwm_enable_reg_3,
    \s_axi_bresp_reg[1] ,
    \s_axi_bresp_reg[1]_0 ,
    \s_axi_rdata_reg[1] ,
    s_axi_araddr,
    \s_axi_rdata_reg[31] ,
    \s_axi_rdata_reg[31]_0 ,
    \pending_high_ticks_reg[31]_0 ,
    \s_axi_rdata_reg[2] ,
    \s_axi_rdata_reg[3] ,
    \s_axi_rdata_reg[4] ,
    \s_axi_rdata_reg[4]_0 ,
    cycle_count_reg,
    \s_axi_rdata_reg[4]_1 ,
    \s_axi_bresp_reg[1]_1 ,
    \s_axi_bresp_reg[1]_2 ,
    address_pending0,
    s_axi_bresp);
  output cfg_applied;
  output clear;
  output pwm_out;
  output period_start_reg_0;
  output cfg_error;
  output \write_data_reg[1] ;
  output \write_address_reg[2] ;
  output [0:0]E;
  output s_axi_bresp1;
  output [31:0]D;
  output activity;
  output \write_data_reg[0] ;
  output \write_address_reg[2]_0 ;
  input s_axi_aclk;
  input s_axi_aresetn;
  input cfg_error_reg_0;
  input pwm_enable;
  input [31:0]Q;
  input [1:0]commit_valid_reg;
  input [0:0]pwm_enable_reg;
  input pwm_enable_reg_0;
  input [0:0]CO;
  input pwm_enable_reg_1;
  input pwm_enable_reg_2;
  input pwm_enable_reg_3;
  input \s_axi_bresp_reg[1] ;
  input \s_axi_bresp_reg[1]_0 ;
  input \s_axi_rdata_reg[1] ;
  input [4:0]s_axi_araddr;
  input [29:0]\s_axi_rdata_reg[31] ;
  input [29:0]\s_axi_rdata_reg[31]_0 ;
  input [31:0]\pending_high_ticks_reg[31]_0 ;
  input \s_axi_rdata_reg[2] ;
  input \s_axi_rdata_reg[3] ;
  input \s_axi_rdata_reg[4] ;
  input \s_axi_rdata_reg[4]_0 ;
  input [31:0]cycle_count_reg;
  input \s_axi_rdata_reg[4]_1 ;
  input \s_axi_bresp_reg[1]_1 ;
  input [1:0]\s_axi_bresp_reg[1]_2 ;
  input address_pending0;
  input [0:0]s_axi_bresp;

  wire [0:0]CO;
  wire [31:0]D;
  wire [0:0]E;
  wire [31:0]Q;
  wire [31:0]active_high_ticks;
  wire [31:0]active_period_ticks;
  wire activity;
  wire address_pending0;
  wire cfg_applied;
  wire cfg_error;
  wire cfg_error_i_1_n_0;
  wire cfg_error_i_2_n_0;
  wire cfg_error_reg_0;
  wire clear;
  wire [1:0]commit_valid_reg;
  wire \counter[0]_i_1_n_0 ;
  wire [31:0]counter_reg;
  wire \counter_reg[0]_i_2_n_0 ;
  wire \counter_reg[0]_i_2_n_1 ;
  wire \counter_reg[0]_i_2_n_2 ;
  wire \counter_reg[0]_i_2_n_3 ;
  wire \counter_reg[0]_i_2_n_4 ;
  wire \counter_reg[0]_i_2_n_5 ;
  wire \counter_reg[0]_i_2_n_6 ;
  wire \counter_reg[0]_i_2_n_7 ;
  wire \counter_reg[12]_i_1_n_0 ;
  wire \counter_reg[12]_i_1_n_1 ;
  wire \counter_reg[12]_i_1_n_2 ;
  wire \counter_reg[12]_i_1_n_3 ;
  wire \counter_reg[12]_i_1_n_4 ;
  wire \counter_reg[12]_i_1_n_5 ;
  wire \counter_reg[12]_i_1_n_6 ;
  wire \counter_reg[12]_i_1_n_7 ;
  wire \counter_reg[16]_i_1_n_0 ;
  wire \counter_reg[16]_i_1_n_1 ;
  wire \counter_reg[16]_i_1_n_2 ;
  wire \counter_reg[16]_i_1_n_3 ;
  wire \counter_reg[16]_i_1_n_4 ;
  wire \counter_reg[16]_i_1_n_5 ;
  wire \counter_reg[16]_i_1_n_6 ;
  wire \counter_reg[16]_i_1_n_7 ;
  wire \counter_reg[20]_i_1_n_0 ;
  wire \counter_reg[20]_i_1_n_1 ;
  wire \counter_reg[20]_i_1_n_2 ;
  wire \counter_reg[20]_i_1_n_3 ;
  wire \counter_reg[20]_i_1_n_4 ;
  wire \counter_reg[20]_i_1_n_5 ;
  wire \counter_reg[20]_i_1_n_6 ;
  wire \counter_reg[20]_i_1_n_7 ;
  wire \counter_reg[24]_i_1_n_0 ;
  wire \counter_reg[24]_i_1_n_1 ;
  wire \counter_reg[24]_i_1_n_2 ;
  wire \counter_reg[24]_i_1_n_3 ;
  wire \counter_reg[24]_i_1_n_4 ;
  wire \counter_reg[24]_i_1_n_5 ;
  wire \counter_reg[24]_i_1_n_6 ;
  wire \counter_reg[24]_i_1_n_7 ;
  wire \counter_reg[28]_i_1_n_1 ;
  wire \counter_reg[28]_i_1_n_2 ;
  wire \counter_reg[28]_i_1_n_3 ;
  wire \counter_reg[28]_i_1_n_4 ;
  wire \counter_reg[28]_i_1_n_5 ;
  wire \counter_reg[28]_i_1_n_6 ;
  wire \counter_reg[28]_i_1_n_7 ;
  wire \counter_reg[4]_i_1_n_0 ;
  wire \counter_reg[4]_i_1_n_1 ;
  wire \counter_reg[4]_i_1_n_2 ;
  wire \counter_reg[4]_i_1_n_3 ;
  wire \counter_reg[4]_i_1_n_4 ;
  wire \counter_reg[4]_i_1_n_5 ;
  wire \counter_reg[4]_i_1_n_6 ;
  wire \counter_reg[4]_i_1_n_7 ;
  wire \counter_reg[8]_i_1_n_0 ;
  wire \counter_reg[8]_i_1_n_1 ;
  wire \counter_reg[8]_i_1_n_2 ;
  wire \counter_reg[8]_i_1_n_3 ;
  wire \counter_reg[8]_i_1_n_4 ;
  wire \counter_reg[8]_i_1_n_5 ;
  wire \counter_reg[8]_i_1_n_6 ;
  wire \counter_reg[8]_i_1_n_7 ;
  wire [31:0]cycle_count_reg;
  wire cycle_end0;
  wire cycle_end0_carry__0_i_1_n_0;
  wire cycle_end0_carry__0_i_2_n_0;
  wire cycle_end0_carry__0_i_3_n_0;
  wire cycle_end0_carry__0_i_4_n_0;
  wire cycle_end0_carry__0_n_0;
  wire cycle_end0_carry__0_n_1;
  wire cycle_end0_carry__0_n_2;
  wire cycle_end0_carry__0_n_3;
  wire cycle_end0_carry__1_i_1_n_0;
  wire cycle_end0_carry__1_i_2_n_0;
  wire cycle_end0_carry__1_i_3_n_0;
  wire cycle_end0_carry__1_n_2;
  wire cycle_end0_carry__1_n_3;
  wire cycle_end0_carry_i_1_n_0;
  wire cycle_end0_carry_i_2_n_0;
  wire cycle_end0_carry_i_3_n_0;
  wire cycle_end0_carry_i_4_n_0;
  wire cycle_end0_carry_n_0;
  wire cycle_end0_carry_n_1;
  wire cycle_end0_carry_n_2;
  wire cycle_end0_carry_n_3;
  wire [31:1]cycle_end1;
  wire cycle_end1_carry__0_i_1_n_0;
  wire cycle_end1_carry__0_i_2_n_0;
  wire cycle_end1_carry__0_i_3_n_0;
  wire cycle_end1_carry__0_i_4_n_0;
  wire cycle_end1_carry__0_n_0;
  wire cycle_end1_carry__0_n_1;
  wire cycle_end1_carry__0_n_2;
  wire cycle_end1_carry__0_n_3;
  wire cycle_end1_carry__1_i_1_n_0;
  wire cycle_end1_carry__1_i_2_n_0;
  wire cycle_end1_carry__1_i_3_n_0;
  wire cycle_end1_carry__1_i_4_n_0;
  wire cycle_end1_carry__1_n_0;
  wire cycle_end1_carry__1_n_1;
  wire cycle_end1_carry__1_n_2;
  wire cycle_end1_carry__1_n_3;
  wire cycle_end1_carry__2_i_1_n_0;
  wire cycle_end1_carry__2_i_2_n_0;
  wire cycle_end1_carry__2_i_3_n_0;
  wire cycle_end1_carry__2_i_4_n_0;
  wire cycle_end1_carry__2_n_0;
  wire cycle_end1_carry__2_n_1;
  wire cycle_end1_carry__2_n_2;
  wire cycle_end1_carry__2_n_3;
  wire cycle_end1_carry__3_i_1_n_0;
  wire cycle_end1_carry__3_i_2_n_0;
  wire cycle_end1_carry__3_i_3_n_0;
  wire cycle_end1_carry__3_i_4_n_0;
  wire cycle_end1_carry__3_n_0;
  wire cycle_end1_carry__3_n_1;
  wire cycle_end1_carry__3_n_2;
  wire cycle_end1_carry__3_n_3;
  wire cycle_end1_carry__4_i_1_n_0;
  wire cycle_end1_carry__4_i_2_n_0;
  wire cycle_end1_carry__4_i_3_n_0;
  wire cycle_end1_carry__4_i_4_n_0;
  wire cycle_end1_carry__4_n_0;
  wire cycle_end1_carry__4_n_1;
  wire cycle_end1_carry__4_n_2;
  wire cycle_end1_carry__4_n_3;
  wire cycle_end1_carry__5_i_1_n_0;
  wire cycle_end1_carry__5_i_2_n_0;
  wire cycle_end1_carry__5_i_3_n_0;
  wire cycle_end1_carry__5_i_4_n_0;
  wire cycle_end1_carry__5_n_0;
  wire cycle_end1_carry__5_n_1;
  wire cycle_end1_carry__5_n_2;
  wire cycle_end1_carry__5_n_3;
  wire cycle_end1_carry__6_i_1_n_0;
  wire cycle_end1_carry__6_i_2_n_0;
  wire cycle_end1_carry__6_i_3_n_0;
  wire cycle_end1_carry__6_n_2;
  wire cycle_end1_carry__6_n_3;
  wire cycle_end1_carry_i_1_n_0;
  wire cycle_end1_carry_i_2_n_0;
  wire cycle_end1_carry_i_3_n_0;
  wire cycle_end1_carry_i_4_n_0;
  wire cycle_end1_carry_n_0;
  wire cycle_end1_carry_n_1;
  wire cycle_end1_carry_n_2;
  wire cycle_end1_carry_n_3;
  wire [31:0]p_0_in;
  wire p_1_in_0;
  wire [31:0]pending_high_ticks;
  wire [31:0]\pending_high_ticks_reg[31]_0 ;
  wire [31:0]pending_period_ticks;
  wire pending_period_ticks1__31;
  wire pending_period_ticks2;
  wire pending_period_ticks2_carry__0_i_1_n_0;
  wire pending_period_ticks2_carry__0_i_2_n_0;
  wire pending_period_ticks2_carry__0_i_3_n_0;
  wire pending_period_ticks2_carry__0_i_4_n_0;
  wire pending_period_ticks2_carry__0_i_5_n_0;
  wire pending_period_ticks2_carry__0_i_6_n_0;
  wire pending_period_ticks2_carry__0_i_7_n_0;
  wire pending_period_ticks2_carry__0_i_8_n_0;
  wire pending_period_ticks2_carry__0_n_0;
  wire pending_period_ticks2_carry__0_n_1;
  wire pending_period_ticks2_carry__0_n_2;
  wire pending_period_ticks2_carry__0_n_3;
  wire pending_period_ticks2_carry__1_i_1_n_0;
  wire pending_period_ticks2_carry__1_i_2_n_0;
  wire pending_period_ticks2_carry__1_i_3_n_0;
  wire pending_period_ticks2_carry__1_i_4_n_0;
  wire pending_period_ticks2_carry__1_i_5_n_0;
  wire pending_period_ticks2_carry__1_i_6_n_0;
  wire pending_period_ticks2_carry__1_i_7_n_0;
  wire pending_period_ticks2_carry__1_i_8_n_0;
  wire pending_period_ticks2_carry__1_n_0;
  wire pending_period_ticks2_carry__1_n_1;
  wire pending_period_ticks2_carry__1_n_2;
  wire pending_period_ticks2_carry__1_n_3;
  wire pending_period_ticks2_carry__2_i_1_n_0;
  wire pending_period_ticks2_carry__2_i_2_n_0;
  wire pending_period_ticks2_carry__2_i_3_n_0;
  wire pending_period_ticks2_carry__2_i_4_n_0;
  wire pending_period_ticks2_carry__2_i_5_n_0;
  wire pending_period_ticks2_carry__2_i_6_n_0;
  wire pending_period_ticks2_carry__2_i_7_n_0;
  wire pending_period_ticks2_carry__2_i_8_n_0;
  wire pending_period_ticks2_carry__2_n_1;
  wire pending_period_ticks2_carry__2_n_2;
  wire pending_period_ticks2_carry__2_n_3;
  wire pending_period_ticks2_carry_i_1_n_0;
  wire pending_period_ticks2_carry_i_2_n_0;
  wire pending_period_ticks2_carry_i_3_n_0;
  wire pending_period_ticks2_carry_i_4_n_0;
  wire pending_period_ticks2_carry_i_5_n_0;
  wire pending_period_ticks2_carry_i_6_n_0;
  wire pending_period_ticks2_carry_i_7_n_0;
  wire pending_period_ticks2_carry_i_8_n_0;
  wire pending_period_ticks2_carry_n_0;
  wire pending_period_ticks2_carry_n_1;
  wire pending_period_ticks2_carry_n_2;
  wire pending_period_ticks2_carry_n_3;
  wire \pending_period_ticks[31]_i_10_n_0 ;
  wire \pending_period_ticks[31]_i_3_n_0 ;
  wire \pending_period_ticks[31]_i_4_n_0 ;
  wire \pending_period_ticks[31]_i_5_n_0 ;
  wire \pending_period_ticks[31]_i_6_n_0 ;
  wire \pending_period_ticks[31]_i_7_n_0 ;
  wire \pending_period_ticks[31]_i_8_n_0 ;
  wire \pending_period_ticks[31]_i_9_n_0 ;
  wire pending_valid;
  wire pending_valid0;
  wire pending_valid_i_1_n_0;
  wire pending_valid_reg_n_0;
  wire period_start_i_1_n_0;
  wire period_start_reg_0;
  wire pwm_enable;
  wire [0:0]pwm_enable_reg;
  wire pwm_enable_reg_0;
  wire pwm_enable_reg_1;
  wire pwm_enable_reg_2;
  wire pwm_enable_reg_3;
  wire pwm_out;
  wire pwm_out0_carry__0_i_10_n_0;
  wire pwm_out0_carry__0_i_10_n_1;
  wire pwm_out0_carry__0_i_10_n_2;
  wire pwm_out0_carry__0_i_10_n_3;
  wire pwm_out0_carry__0_i_1_n_0;
  wire pwm_out0_carry__0_i_2_n_0;
  wire pwm_out0_carry__0_i_3_n_0;
  wire pwm_out0_carry__0_i_4_n_0;
  wire pwm_out0_carry__0_i_5_n_0;
  wire pwm_out0_carry__0_i_6_n_0;
  wire pwm_out0_carry__0_i_7_n_0;
  wire pwm_out0_carry__0_i_8_n_0;
  wire pwm_out0_carry__0_i_9_n_0;
  wire pwm_out0_carry__0_i_9_n_1;
  wire pwm_out0_carry__0_i_9_n_2;
  wire pwm_out0_carry__0_i_9_n_3;
  wire pwm_out0_carry__0_n_0;
  wire pwm_out0_carry__0_n_1;
  wire pwm_out0_carry__0_n_2;
  wire pwm_out0_carry__0_n_3;
  wire pwm_out0_carry__1_i_10_n_0;
  wire pwm_out0_carry__1_i_10_n_1;
  wire pwm_out0_carry__1_i_10_n_2;
  wire pwm_out0_carry__1_i_10_n_3;
  wire pwm_out0_carry__1_i_1_n_0;
  wire pwm_out0_carry__1_i_2_n_0;
  wire pwm_out0_carry__1_i_3_n_0;
  wire pwm_out0_carry__1_i_4_n_0;
  wire pwm_out0_carry__1_i_5_n_0;
  wire pwm_out0_carry__1_i_6_n_0;
  wire pwm_out0_carry__1_i_7_n_0;
  wire pwm_out0_carry__1_i_8_n_0;
  wire pwm_out0_carry__1_i_9_n_0;
  wire pwm_out0_carry__1_i_9_n_1;
  wire pwm_out0_carry__1_i_9_n_2;
  wire pwm_out0_carry__1_i_9_n_3;
  wire pwm_out0_carry__1_n_0;
  wire pwm_out0_carry__1_n_1;
  wire pwm_out0_carry__1_n_2;
  wire pwm_out0_carry__1_n_3;
  wire pwm_out0_carry__2_i_10_n_0;
  wire pwm_out0_carry__2_i_10_n_1;
  wire pwm_out0_carry__2_i_10_n_2;
  wire pwm_out0_carry__2_i_10_n_3;
  wire pwm_out0_carry__2_i_1_n_0;
  wire pwm_out0_carry__2_i_2_n_0;
  wire pwm_out0_carry__2_i_3_n_0;
  wire pwm_out0_carry__2_i_4_n_0;
  wire pwm_out0_carry__2_i_5_n_0;
  wire pwm_out0_carry__2_i_6_n_0;
  wire pwm_out0_carry__2_i_7_n_0;
  wire pwm_out0_carry__2_i_8_n_0;
  wire pwm_out0_carry__2_i_9_n_2;
  wire pwm_out0_carry__2_i_9_n_3;
  wire pwm_out0_carry__2_n_0;
  wire pwm_out0_carry__2_n_1;
  wire pwm_out0_carry__2_n_2;
  wire pwm_out0_carry__2_n_3;
  wire pwm_out0_carry_i_10_n_0;
  wire pwm_out0_carry_i_10_n_1;
  wire pwm_out0_carry_i_10_n_2;
  wire pwm_out0_carry_i_10_n_3;
  wire pwm_out0_carry_i_1_n_0;
  wire pwm_out0_carry_i_2_n_0;
  wire pwm_out0_carry_i_3_n_0;
  wire pwm_out0_carry_i_4_n_0;
  wire pwm_out0_carry_i_5_n_0;
  wire pwm_out0_carry_i_6_n_0;
  wire pwm_out0_carry_i_7_n_0;
  wire pwm_out0_carry_i_8_n_0;
  wire pwm_out0_carry_i_9_n_0;
  wire pwm_out0_carry_i_9_n_1;
  wire pwm_out0_carry_i_9_n_2;
  wire pwm_out0_carry_i_9_n_3;
  wire pwm_out0_carry_n_0;
  wire pwm_out0_carry_n_1;
  wire pwm_out0_carry_n_2;
  wire pwm_out0_carry_n_3;
  wire pwm_out1;
  wire pwm_out_i_10_n_0;
  wire pwm_out_i_11_n_0;
  wire pwm_out_i_12_n_0;
  wire pwm_out_i_13_n_0;
  wire pwm_out_i_14_n_0;
  wire pwm_out_i_15_n_0;
  wire pwm_out_i_16_n_0;
  wire pwm_out_i_17_n_0;
  wire pwm_out_i_18_n_0;
  wire pwm_out_i_19_n_0;
  wire pwm_out_i_1_n_0;
  wire pwm_out_i_20_n_0;
  wire pwm_out_i_21_n_0;
  wire pwm_out_i_22_n_0;
  wire pwm_out_i_23_n_0;
  wire pwm_out_i_24_n_0;
  wire pwm_out_i_25_n_0;
  wire pwm_out_i_26_n_0;
  wire pwm_out_i_27_n_0;
  wire pwm_out_i_28_n_0;
  wire pwm_out_i_29_n_0;
  wire pwm_out_i_2_n_0;
  wire pwm_out_i_30_n_0;
  wire pwm_out_i_31_n_0;
  wire pwm_out_i_32_n_0;
  wire pwm_out_i_33_n_0;
  wire pwm_out_i_34_n_0;
  wire pwm_out_i_35_n_0;
  wire pwm_out_i_36_n_0;
  wire pwm_out_i_37_n_0;
  wire pwm_out_i_38_n_0;
  wire pwm_out_i_39_n_0;
  wire pwm_out_i_40_n_0;
  wire pwm_out_i_4_n_0;
  wire pwm_out_i_5_n_0;
  wire pwm_out_i_6_n_0;
  wire pwm_out_i_7_n_0;
  wire pwm_out_i_8_n_0;
  wire pwm_out_i_9_n_0;
  wire running;
  wire running_i_1_n_0;
  wire s_axi_aclk;
  wire [4:0]s_axi_araddr;
  wire s_axi_aresetn;
  wire [0:0]s_axi_bresp;
  wire s_axi_bresp1;
  wire \s_axi_bresp_reg[1] ;
  wire \s_axi_bresp_reg[1]_0 ;
  wire \s_axi_bresp_reg[1]_1 ;
  wire [1:0]\s_axi_bresp_reg[1]_2 ;
  wire \s_axi_rdata[0]_i_2_n_0 ;
  wire \s_axi_rdata[0]_i_3_n_0 ;
  wire \s_axi_rdata[10]_i_2_n_0 ;
  wire \s_axi_rdata[11]_i_2_n_0 ;
  wire \s_axi_rdata[12]_i_2_n_0 ;
  wire \s_axi_rdata[13]_i_2_n_0 ;
  wire \s_axi_rdata[14]_i_2_n_0 ;
  wire \s_axi_rdata[15]_i_2_n_0 ;
  wire \s_axi_rdata[16]_i_2_n_0 ;
  wire \s_axi_rdata[17]_i_2_n_0 ;
  wire \s_axi_rdata[18]_i_2_n_0 ;
  wire \s_axi_rdata[19]_i_2_n_0 ;
  wire \s_axi_rdata[1]_i_2_n_0 ;
  wire \s_axi_rdata[1]_i_3_n_0 ;
  wire \s_axi_rdata[20]_i_2_n_0 ;
  wire \s_axi_rdata[21]_i_2_n_0 ;
  wire \s_axi_rdata[22]_i_2_n_0 ;
  wire \s_axi_rdata[23]_i_2_n_0 ;
  wire \s_axi_rdata[24]_i_2_n_0 ;
  wire \s_axi_rdata[25]_i_2_n_0 ;
  wire \s_axi_rdata[26]_i_2_n_0 ;
  wire \s_axi_rdata[27]_i_2_n_0 ;
  wire \s_axi_rdata[28]_i_2_n_0 ;
  wire \s_axi_rdata[29]_i_2_n_0 ;
  wire \s_axi_rdata[2]_i_2_n_0 ;
  wire \s_axi_rdata[30]_i_2_n_0 ;
  wire \s_axi_rdata[31]_i_4_n_0 ;
  wire \s_axi_rdata[3]_i_2_n_0 ;
  wire \s_axi_rdata[4]_i_2_n_0 ;
  wire \s_axi_rdata[5]_i_2_n_0 ;
  wire \s_axi_rdata[6]_i_2_n_0 ;
  wire \s_axi_rdata[7]_i_2_n_0 ;
  wire \s_axi_rdata[8]_i_2_n_0 ;
  wire \s_axi_rdata[9]_i_2_n_0 ;
  wire \s_axi_rdata_reg[1] ;
  wire \s_axi_rdata_reg[2] ;
  wire [29:0]\s_axi_rdata_reg[31] ;
  wire [29:0]\s_axi_rdata_reg[31]_0 ;
  wire \s_axi_rdata_reg[3] ;
  wire \s_axi_rdata_reg[4] ;
  wire \s_axi_rdata_reg[4]_0 ;
  wire \s_axi_rdata_reg[4]_1 ;
  wire \write_address_reg[2] ;
  wire \write_address_reg[2]_0 ;
  wire \write_data_reg[0] ;
  wire \write_data_reg[1] ;
  wire [3:3]\NLW_counter_reg[28]_i_1_CO_UNCONNECTED ;
  wire [3:0]NLW_cycle_end0_carry_O_UNCONNECTED;
  wire [3:0]NLW_cycle_end0_carry__0_O_UNCONNECTED;
  wire [3:3]NLW_cycle_end0_carry__1_CO_UNCONNECTED;
  wire [3:0]NLW_cycle_end0_carry__1_O_UNCONNECTED;
  wire [3:2]NLW_cycle_end1_carry__6_CO_UNCONNECTED;
  wire [3:3]NLW_cycle_end1_carry__6_O_UNCONNECTED;
  wire [3:0]NLW_pending_period_ticks2_carry_O_UNCONNECTED;
  wire [3:0]NLW_pending_period_ticks2_carry__0_O_UNCONNECTED;
  wire [3:0]NLW_pending_period_ticks2_carry__1_O_UNCONNECTED;
  wire [3:0]NLW_pending_period_ticks2_carry__2_O_UNCONNECTED;
  wire [3:0]NLW_pwm_out0_carry_O_UNCONNECTED;
  wire [3:0]NLW_pwm_out0_carry__0_O_UNCONNECTED;
  wire [3:0]NLW_pwm_out0_carry__1_O_UNCONNECTED;
  wire [3:0]NLW_pwm_out0_carry__2_O_UNCONNECTED;
  wire [3:2]NLW_pwm_out0_carry__2_i_9_CO_UNCONNECTED;
  wire [3:3]NLW_pwm_out0_carry__2_i_9_O_UNCONNECTED;

  FDRE \active_high_ticks_reg[0] 
       (.C(s_axi_aclk),
        .CE(pending_valid0),
        .D(pending_high_ticks[0]),
        .Q(active_high_ticks[0]),
        .R(clear));
  FDRE \active_high_ticks_reg[10] 
       (.C(s_axi_aclk),
        .CE(pending_valid0),
        .D(pending_high_ticks[10]),
        .Q(active_high_ticks[10]),
        .R(clear));
  FDRE \active_high_ticks_reg[11] 
       (.C(s_axi_aclk),
        .CE(pending_valid0),
        .D(pending_high_ticks[11]),
        .Q(active_high_ticks[11]),
        .R(clear));
  FDRE \active_high_ticks_reg[12] 
       (.C(s_axi_aclk),
        .CE(pending_valid0),
        .D(pending_high_ticks[12]),
        .Q(active_high_ticks[12]),
        .R(clear));
  FDRE \active_high_ticks_reg[13] 
       (.C(s_axi_aclk),
        .CE(pending_valid0),
        .D(pending_high_ticks[13]),
        .Q(active_high_ticks[13]),
        .R(clear));
  FDRE \active_high_ticks_reg[14] 
       (.C(s_axi_aclk),
        .CE(pending_valid0),
        .D(pending_high_ticks[14]),
        .Q(active_high_ticks[14]),
        .R(clear));
  FDRE \active_high_ticks_reg[15] 
       (.C(s_axi_aclk),
        .CE(pending_valid0),
        .D(pending_high_ticks[15]),
        .Q(active_high_ticks[15]),
        .R(clear));
  FDRE \active_high_ticks_reg[16] 
       (.C(s_axi_aclk),
        .CE(pending_valid0),
        .D(pending_high_ticks[16]),
        .Q(active_high_ticks[16]),
        .R(clear));
  FDRE \active_high_ticks_reg[17] 
       (.C(s_axi_aclk),
        .CE(pending_valid0),
        .D(pending_high_ticks[17]),
        .Q(active_high_ticks[17]),
        .R(clear));
  FDRE \active_high_ticks_reg[18] 
       (.C(s_axi_aclk),
        .CE(pending_valid0),
        .D(pending_high_ticks[18]),
        .Q(active_high_ticks[18]),
        .R(clear));
  FDRE \active_high_ticks_reg[19] 
       (.C(s_axi_aclk),
        .CE(pending_valid0),
        .D(pending_high_ticks[19]),
        .Q(active_high_ticks[19]),
        .R(clear));
  FDRE \active_high_ticks_reg[1] 
       (.C(s_axi_aclk),
        .CE(pending_valid0),
        .D(pending_high_ticks[1]),
        .Q(active_high_ticks[1]),
        .R(clear));
  FDRE \active_high_ticks_reg[20] 
       (.C(s_axi_aclk),
        .CE(pending_valid0),
        .D(pending_high_ticks[20]),
        .Q(active_high_ticks[20]),
        .R(clear));
  FDRE \active_high_ticks_reg[21] 
       (.C(s_axi_aclk),
        .CE(pending_valid0),
        .D(pending_high_ticks[21]),
        .Q(active_high_ticks[21]),
        .R(clear));
  FDRE \active_high_ticks_reg[22] 
       (.C(s_axi_aclk),
        .CE(pending_valid0),
        .D(pending_high_ticks[22]),
        .Q(active_high_ticks[22]),
        .R(clear));
  FDRE \active_high_ticks_reg[23] 
       (.C(s_axi_aclk),
        .CE(pending_valid0),
        .D(pending_high_ticks[23]),
        .Q(active_high_ticks[23]),
        .R(clear));
  FDRE \active_high_ticks_reg[24] 
       (.C(s_axi_aclk),
        .CE(pending_valid0),
        .D(pending_high_ticks[24]),
        .Q(active_high_ticks[24]),
        .R(clear));
  FDRE \active_high_ticks_reg[25] 
       (.C(s_axi_aclk),
        .CE(pending_valid0),
        .D(pending_high_ticks[25]),
        .Q(active_high_ticks[25]),
        .R(clear));
  FDRE \active_high_ticks_reg[26] 
       (.C(s_axi_aclk),
        .CE(pending_valid0),
        .D(pending_high_ticks[26]),
        .Q(active_high_ticks[26]),
        .R(clear));
  FDRE \active_high_ticks_reg[27] 
       (.C(s_axi_aclk),
        .CE(pending_valid0),
        .D(pending_high_ticks[27]),
        .Q(active_high_ticks[27]),
        .R(clear));
  FDRE \active_high_ticks_reg[28] 
       (.C(s_axi_aclk),
        .CE(pending_valid0),
        .D(pending_high_ticks[28]),
        .Q(active_high_ticks[28]),
        .R(clear));
  FDRE \active_high_ticks_reg[29] 
       (.C(s_axi_aclk),
        .CE(pending_valid0),
        .D(pending_high_ticks[29]),
        .Q(active_high_ticks[29]),
        .R(clear));
  FDRE \active_high_ticks_reg[2] 
       (.C(s_axi_aclk),
        .CE(pending_valid0),
        .D(pending_high_ticks[2]),
        .Q(active_high_ticks[2]),
        .R(clear));
  FDRE \active_high_ticks_reg[30] 
       (.C(s_axi_aclk),
        .CE(pending_valid0),
        .D(pending_high_ticks[30]),
        .Q(active_high_ticks[30]),
        .R(clear));
  FDRE \active_high_ticks_reg[31] 
       (.C(s_axi_aclk),
        .CE(pending_valid0),
        .D(pending_high_ticks[31]),
        .Q(active_high_ticks[31]),
        .R(clear));
  FDRE \active_high_ticks_reg[3] 
       (.C(s_axi_aclk),
        .CE(pending_valid0),
        .D(pending_high_ticks[3]),
        .Q(active_high_ticks[3]),
        .R(clear));
  FDRE \active_high_ticks_reg[4] 
       (.C(s_axi_aclk),
        .CE(pending_valid0),
        .D(pending_high_ticks[4]),
        .Q(active_high_ticks[4]),
        .R(clear));
  FDRE \active_high_ticks_reg[5] 
       (.C(s_axi_aclk),
        .CE(pending_valid0),
        .D(pending_high_ticks[5]),
        .Q(active_high_ticks[5]),
        .R(clear));
  FDRE \active_high_ticks_reg[6] 
       (.C(s_axi_aclk),
        .CE(pending_valid0),
        .D(pending_high_ticks[6]),
        .Q(active_high_ticks[6]),
        .R(clear));
  FDRE \active_high_ticks_reg[7] 
       (.C(s_axi_aclk),
        .CE(pending_valid0),
        .D(pending_high_ticks[7]),
        .Q(active_high_ticks[7]),
        .R(clear));
  FDRE \active_high_ticks_reg[8] 
       (.C(s_axi_aclk),
        .CE(pending_valid0),
        .D(pending_high_ticks[8]),
        .Q(active_high_ticks[8]),
        .R(clear));
  FDRE \active_high_ticks_reg[9] 
       (.C(s_axi_aclk),
        .CE(pending_valid0),
        .D(pending_high_ticks[9]),
        .Q(active_high_ticks[9]),
        .R(clear));
  LUT4 #(
    .INIT(16'hA2AA)) 
    \active_period_ticks[31]_i_1 
       (.I0(pending_valid_reg_n_0),
        .I1(pwm_enable),
        .I2(cycle_end0),
        .I3(running),
        .O(pending_valid0));
  FDRE \active_period_ticks_reg[0] 
       (.C(s_axi_aclk),
        .CE(pending_valid0),
        .D(pending_period_ticks[0]),
        .Q(active_period_ticks[0]),
        .R(clear));
  FDRE \active_period_ticks_reg[10] 
       (.C(s_axi_aclk),
        .CE(pending_valid0),
        .D(pending_period_ticks[10]),
        .Q(active_period_ticks[10]),
        .R(clear));
  FDRE \active_period_ticks_reg[11] 
       (.C(s_axi_aclk),
        .CE(pending_valid0),
        .D(pending_period_ticks[11]),
        .Q(active_period_ticks[11]),
        .R(clear));
  FDRE \active_period_ticks_reg[12] 
       (.C(s_axi_aclk),
        .CE(pending_valid0),
        .D(pending_period_ticks[12]),
        .Q(active_period_ticks[12]),
        .R(clear));
  FDRE \active_period_ticks_reg[13] 
       (.C(s_axi_aclk),
        .CE(pending_valid0),
        .D(pending_period_ticks[13]),
        .Q(active_period_ticks[13]),
        .R(clear));
  FDRE \active_period_ticks_reg[14] 
       (.C(s_axi_aclk),
        .CE(pending_valid0),
        .D(pending_period_ticks[14]),
        .Q(active_period_ticks[14]),
        .R(clear));
  FDRE \active_period_ticks_reg[15] 
       (.C(s_axi_aclk),
        .CE(pending_valid0),
        .D(pending_period_ticks[15]),
        .Q(active_period_ticks[15]),
        .R(clear));
  FDRE \active_period_ticks_reg[16] 
       (.C(s_axi_aclk),
        .CE(pending_valid0),
        .D(pending_period_ticks[16]),
        .Q(active_period_ticks[16]),
        .R(clear));
  FDRE \active_period_ticks_reg[17] 
       (.C(s_axi_aclk),
        .CE(pending_valid0),
        .D(pending_period_ticks[17]),
        .Q(active_period_ticks[17]),
        .R(clear));
  FDRE \active_period_ticks_reg[18] 
       (.C(s_axi_aclk),
        .CE(pending_valid0),
        .D(pending_period_ticks[18]),
        .Q(active_period_ticks[18]),
        .R(clear));
  FDRE \active_period_ticks_reg[19] 
       (.C(s_axi_aclk),
        .CE(pending_valid0),
        .D(pending_period_ticks[19]),
        .Q(active_period_ticks[19]),
        .R(clear));
  FDRE \active_period_ticks_reg[1] 
       (.C(s_axi_aclk),
        .CE(pending_valid0),
        .D(pending_period_ticks[1]),
        .Q(active_period_ticks[1]),
        .R(clear));
  FDRE \active_period_ticks_reg[20] 
       (.C(s_axi_aclk),
        .CE(pending_valid0),
        .D(pending_period_ticks[20]),
        .Q(active_period_ticks[20]),
        .R(clear));
  FDRE \active_period_ticks_reg[21] 
       (.C(s_axi_aclk),
        .CE(pending_valid0),
        .D(pending_period_ticks[21]),
        .Q(active_period_ticks[21]),
        .R(clear));
  FDRE \active_period_ticks_reg[22] 
       (.C(s_axi_aclk),
        .CE(pending_valid0),
        .D(pending_period_ticks[22]),
        .Q(active_period_ticks[22]),
        .R(clear));
  FDRE \active_period_ticks_reg[23] 
       (.C(s_axi_aclk),
        .CE(pending_valid0),
        .D(pending_period_ticks[23]),
        .Q(active_period_ticks[23]),
        .R(clear));
  FDRE \active_period_ticks_reg[24] 
       (.C(s_axi_aclk),
        .CE(pending_valid0),
        .D(pending_period_ticks[24]),
        .Q(active_period_ticks[24]),
        .R(clear));
  FDRE \active_period_ticks_reg[25] 
       (.C(s_axi_aclk),
        .CE(pending_valid0),
        .D(pending_period_ticks[25]),
        .Q(active_period_ticks[25]),
        .R(clear));
  FDRE \active_period_ticks_reg[26] 
       (.C(s_axi_aclk),
        .CE(pending_valid0),
        .D(pending_period_ticks[26]),
        .Q(active_period_ticks[26]),
        .R(clear));
  FDRE \active_period_ticks_reg[27] 
       (.C(s_axi_aclk),
        .CE(pending_valid0),
        .D(pending_period_ticks[27]),
        .Q(active_period_ticks[27]),
        .R(clear));
  FDRE \active_period_ticks_reg[28] 
       (.C(s_axi_aclk),
        .CE(pending_valid0),
        .D(pending_period_ticks[28]),
        .Q(active_period_ticks[28]),
        .R(clear));
  FDRE \active_period_ticks_reg[29] 
       (.C(s_axi_aclk),
        .CE(pending_valid0),
        .D(pending_period_ticks[29]),
        .Q(active_period_ticks[29]),
        .R(clear));
  FDRE \active_period_ticks_reg[2] 
       (.C(s_axi_aclk),
        .CE(pending_valid0),
        .D(pending_period_ticks[2]),
        .Q(active_period_ticks[2]),
        .R(clear));
  FDRE \active_period_ticks_reg[30] 
       (.C(s_axi_aclk),
        .CE(pending_valid0),
        .D(pending_period_ticks[30]),
        .Q(active_period_ticks[30]),
        .R(clear));
  FDRE \active_period_ticks_reg[31] 
       (.C(s_axi_aclk),
        .CE(pending_valid0),
        .D(pending_period_ticks[31]),
        .Q(active_period_ticks[31]),
        .R(clear));
  FDRE \active_period_ticks_reg[3] 
       (.C(s_axi_aclk),
        .CE(pending_valid0),
        .D(pending_period_ticks[3]),
        .Q(active_period_ticks[3]),
        .R(clear));
  FDRE \active_period_ticks_reg[4] 
       (.C(s_axi_aclk),
        .CE(pending_valid0),
        .D(pending_period_ticks[4]),
        .Q(active_period_ticks[4]),
        .R(clear));
  FDRE \active_period_ticks_reg[5] 
       (.C(s_axi_aclk),
        .CE(pending_valid0),
        .D(pending_period_ticks[5]),
        .Q(active_period_ticks[5]),
        .R(clear));
  FDRE \active_period_ticks_reg[6] 
       (.C(s_axi_aclk),
        .CE(pending_valid0),
        .D(pending_period_ticks[6]),
        .Q(active_period_ticks[6]),
        .R(clear));
  FDRE \active_period_ticks_reg[7] 
       (.C(s_axi_aclk),
        .CE(pending_valid0),
        .D(pending_period_ticks[7]),
        .Q(active_period_ticks[7]),
        .R(clear));
  FDRE \active_period_ticks_reg[8] 
       (.C(s_axi_aclk),
        .CE(pending_valid0),
        .D(pending_period_ticks[8]),
        .Q(active_period_ticks[8]),
        .R(clear));
  FDRE \active_period_ticks_reg[9] 
       (.C(s_axi_aclk),
        .CE(pending_valid0),
        .D(pending_period_ticks[9]),
        .Q(active_period_ticks[9]),
        .R(clear));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hFFFEFFFF)) 
    activity_INST_0
       (.I0(running),
        .I1(pwm_enable),
        .I2(cfg_error_reg_0),
        .I3(pending_valid_reg_n_0),
        .I4(s_axi_aresetn),
        .O(activity));
  FDRE cfg_applied_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(pending_valid0),
        .Q(cfg_applied),
        .R(clear));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    cfg_error_i_1
       (.I0(s_axi_aresetn),
        .I1(pending_valid_reg_n_0),
        .I2(cfg_error_reg_0),
        .I3(cfg_error_i_2_n_0),
        .O(cfg_error_i_1_n_0));
  LUT5 #(
    .INIT(32'hFFFF1000)) 
    cfg_error_i_2
       (.I0(\pending_period_ticks[31]_i_6_n_0 ),
        .I1(\pending_period_ticks[31]_i_5_n_0 ),
        .I2(\pending_period_ticks[31]_i_4_n_0 ),
        .I3(\pending_period_ticks[31]_i_3_n_0 ),
        .I4(pending_period_ticks2),
        .O(cfg_error_i_2_n_0));
  FDRE cfg_error_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(cfg_error_i_1_n_0),
        .Q(cfg_error),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \commit_period[31]_i_1 
       (.I0(pwm_enable_reg),
        .I1(commit_valid_reg[1]),
        .I2(\write_address_reg[2] ),
        .O(E));
  LUT6 #(
    .INIT(64'h02000202AAAAAAAA)) 
    \commit_period[31]_i_2 
       (.I0(pwm_enable_reg_0),
        .I1(CO),
        .I2(p_1_in_0),
        .I3(pwm_enable_reg_1),
        .I4(pwm_enable_reg_2),
        .I5(pwm_enable_reg_3),
        .O(\write_address_reg[2] ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    commit_valid_i_1
       (.I0(commit_valid_reg[1]),
        .I1(pwm_enable_reg),
        .I2(s_axi_aresetn),
        .I3(\write_address_reg[2] ),
        .O(\write_data_reg[1] ));
  LUT4 #(
    .INIT(16'hDFFF)) 
    \counter[0]_i_1 
       (.I0(pwm_enable),
        .I1(cycle_end0),
        .I2(running),
        .I3(s_axi_aresetn),
        .O(\counter[0]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[0]_i_3 
       (.I0(counter_reg[0]),
        .O(p_0_in[0]));
  FDRE \counter_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\counter_reg[0]_i_2_n_7 ),
        .Q(counter_reg[0]),
        .R(\counter[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[0]_i_2 
       (.CI(1'b0),
        .CO({\counter_reg[0]_i_2_n_0 ,\counter_reg[0]_i_2_n_1 ,\counter_reg[0]_i_2_n_2 ,\counter_reg[0]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\counter_reg[0]_i_2_n_4 ,\counter_reg[0]_i_2_n_5 ,\counter_reg[0]_i_2_n_6 ,\counter_reg[0]_i_2_n_7 }),
        .S({counter_reg[3:1],p_0_in[0]}));
  FDRE \counter_reg[10] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\counter_reg[8]_i_1_n_5 ),
        .Q(counter_reg[10]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[11] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\counter_reg[8]_i_1_n_4 ),
        .Q(counter_reg[11]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[12] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\counter_reg[12]_i_1_n_7 ),
        .Q(counter_reg[12]),
        .R(\counter[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[12]_i_1 
       (.CI(\counter_reg[8]_i_1_n_0 ),
        .CO({\counter_reg[12]_i_1_n_0 ,\counter_reg[12]_i_1_n_1 ,\counter_reg[12]_i_1_n_2 ,\counter_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[12]_i_1_n_4 ,\counter_reg[12]_i_1_n_5 ,\counter_reg[12]_i_1_n_6 ,\counter_reg[12]_i_1_n_7 }),
        .S(counter_reg[15:12]));
  FDRE \counter_reg[13] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\counter_reg[12]_i_1_n_6 ),
        .Q(counter_reg[13]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[14] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\counter_reg[12]_i_1_n_5 ),
        .Q(counter_reg[14]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[15] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\counter_reg[12]_i_1_n_4 ),
        .Q(counter_reg[15]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[16] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\counter_reg[16]_i_1_n_7 ),
        .Q(counter_reg[16]),
        .R(\counter[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[16]_i_1 
       (.CI(\counter_reg[12]_i_1_n_0 ),
        .CO({\counter_reg[16]_i_1_n_0 ,\counter_reg[16]_i_1_n_1 ,\counter_reg[16]_i_1_n_2 ,\counter_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[16]_i_1_n_4 ,\counter_reg[16]_i_1_n_5 ,\counter_reg[16]_i_1_n_6 ,\counter_reg[16]_i_1_n_7 }),
        .S(counter_reg[19:16]));
  FDRE \counter_reg[17] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\counter_reg[16]_i_1_n_6 ),
        .Q(counter_reg[17]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[18] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\counter_reg[16]_i_1_n_5 ),
        .Q(counter_reg[18]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[19] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\counter_reg[16]_i_1_n_4 ),
        .Q(counter_reg[19]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\counter_reg[0]_i_2_n_6 ),
        .Q(counter_reg[1]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[20] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\counter_reg[20]_i_1_n_7 ),
        .Q(counter_reg[20]),
        .R(\counter[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[20]_i_1 
       (.CI(\counter_reg[16]_i_1_n_0 ),
        .CO({\counter_reg[20]_i_1_n_0 ,\counter_reg[20]_i_1_n_1 ,\counter_reg[20]_i_1_n_2 ,\counter_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[20]_i_1_n_4 ,\counter_reg[20]_i_1_n_5 ,\counter_reg[20]_i_1_n_6 ,\counter_reg[20]_i_1_n_7 }),
        .S(counter_reg[23:20]));
  FDRE \counter_reg[21] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\counter_reg[20]_i_1_n_6 ),
        .Q(counter_reg[21]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[22] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\counter_reg[20]_i_1_n_5 ),
        .Q(counter_reg[22]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[23] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\counter_reg[20]_i_1_n_4 ),
        .Q(counter_reg[23]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[24] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\counter_reg[24]_i_1_n_7 ),
        .Q(counter_reg[24]),
        .R(\counter[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[24]_i_1 
       (.CI(\counter_reg[20]_i_1_n_0 ),
        .CO({\counter_reg[24]_i_1_n_0 ,\counter_reg[24]_i_1_n_1 ,\counter_reg[24]_i_1_n_2 ,\counter_reg[24]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[24]_i_1_n_4 ,\counter_reg[24]_i_1_n_5 ,\counter_reg[24]_i_1_n_6 ,\counter_reg[24]_i_1_n_7 }),
        .S(counter_reg[27:24]));
  FDRE \counter_reg[25] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\counter_reg[24]_i_1_n_6 ),
        .Q(counter_reg[25]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[26] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\counter_reg[24]_i_1_n_5 ),
        .Q(counter_reg[26]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[27] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\counter_reg[24]_i_1_n_4 ),
        .Q(counter_reg[27]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[28] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\counter_reg[28]_i_1_n_7 ),
        .Q(counter_reg[28]),
        .R(\counter[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[28]_i_1 
       (.CI(\counter_reg[24]_i_1_n_0 ),
        .CO({\NLW_counter_reg[28]_i_1_CO_UNCONNECTED [3],\counter_reg[28]_i_1_n_1 ,\counter_reg[28]_i_1_n_2 ,\counter_reg[28]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[28]_i_1_n_4 ,\counter_reg[28]_i_1_n_5 ,\counter_reg[28]_i_1_n_6 ,\counter_reg[28]_i_1_n_7 }),
        .S(counter_reg[31:28]));
  FDRE \counter_reg[29] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\counter_reg[28]_i_1_n_6 ),
        .Q(counter_reg[29]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\counter_reg[0]_i_2_n_5 ),
        .Q(counter_reg[2]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[30] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\counter_reg[28]_i_1_n_5 ),
        .Q(counter_reg[30]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[31] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\counter_reg[28]_i_1_n_4 ),
        .Q(counter_reg[31]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[3] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\counter_reg[0]_i_2_n_4 ),
        .Q(counter_reg[3]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[4] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\counter_reg[4]_i_1_n_7 ),
        .Q(counter_reg[4]),
        .R(\counter[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[4]_i_1 
       (.CI(\counter_reg[0]_i_2_n_0 ),
        .CO({\counter_reg[4]_i_1_n_0 ,\counter_reg[4]_i_1_n_1 ,\counter_reg[4]_i_1_n_2 ,\counter_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[4]_i_1_n_4 ,\counter_reg[4]_i_1_n_5 ,\counter_reg[4]_i_1_n_6 ,\counter_reg[4]_i_1_n_7 }),
        .S(counter_reg[7:4]));
  FDRE \counter_reg[5] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\counter_reg[4]_i_1_n_6 ),
        .Q(counter_reg[5]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[6] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\counter_reg[4]_i_1_n_5 ),
        .Q(counter_reg[6]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[7] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\counter_reg[4]_i_1_n_4 ),
        .Q(counter_reg[7]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[8] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\counter_reg[8]_i_1_n_7 ),
        .Q(counter_reg[8]),
        .R(\counter[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[8]_i_1 
       (.CI(\counter_reg[4]_i_1_n_0 ),
        .CO({\counter_reg[8]_i_1_n_0 ,\counter_reg[8]_i_1_n_1 ,\counter_reg[8]_i_1_n_2 ,\counter_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[8]_i_1_n_4 ,\counter_reg[8]_i_1_n_5 ,\counter_reg[8]_i_1_n_6 ,\counter_reg[8]_i_1_n_7 }),
        .S(counter_reg[11:8]));
  FDRE \counter_reg[9] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\counter_reg[8]_i_1_n_6 ),
        .Q(counter_reg[9]),
        .R(\counter[0]_i_1_n_0 ));
  CARRY4 cycle_end0_carry
       (.CI(1'b0),
        .CO({cycle_end0_carry_n_0,cycle_end0_carry_n_1,cycle_end0_carry_n_2,cycle_end0_carry_n_3}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_cycle_end0_carry_O_UNCONNECTED[3:0]),
        .S({cycle_end0_carry_i_1_n_0,cycle_end0_carry_i_2_n_0,cycle_end0_carry_i_3_n_0,cycle_end0_carry_i_4_n_0}));
  CARRY4 cycle_end0_carry__0
       (.CI(cycle_end0_carry_n_0),
        .CO({cycle_end0_carry__0_n_0,cycle_end0_carry__0_n_1,cycle_end0_carry__0_n_2,cycle_end0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_cycle_end0_carry__0_O_UNCONNECTED[3:0]),
        .S({cycle_end0_carry__0_i_1_n_0,cycle_end0_carry__0_i_2_n_0,cycle_end0_carry__0_i_3_n_0,cycle_end0_carry__0_i_4_n_0}));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    cycle_end0_carry__0_i_1
       (.I0(counter_reg[22]),
        .I1(cycle_end1[22]),
        .I2(counter_reg[21]),
        .I3(cycle_end1[21]),
        .I4(cycle_end1[23]),
        .I5(counter_reg[23]),
        .O(cycle_end0_carry__0_i_1_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    cycle_end0_carry__0_i_2
       (.I0(counter_reg[19]),
        .I1(cycle_end1[19]),
        .I2(counter_reg[18]),
        .I3(cycle_end1[18]),
        .I4(cycle_end1[20]),
        .I5(counter_reg[20]),
        .O(cycle_end0_carry__0_i_2_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    cycle_end0_carry__0_i_3
       (.I0(counter_reg[16]),
        .I1(cycle_end1[16]),
        .I2(counter_reg[15]),
        .I3(cycle_end1[15]),
        .I4(cycle_end1[17]),
        .I5(counter_reg[17]),
        .O(cycle_end0_carry__0_i_3_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    cycle_end0_carry__0_i_4
       (.I0(counter_reg[13]),
        .I1(cycle_end1[13]),
        .I2(counter_reg[12]),
        .I3(cycle_end1[12]),
        .I4(cycle_end1[14]),
        .I5(counter_reg[14]),
        .O(cycle_end0_carry__0_i_4_n_0));
  CARRY4 cycle_end0_carry__1
       (.CI(cycle_end0_carry__0_n_0),
        .CO({NLW_cycle_end0_carry__1_CO_UNCONNECTED[3],cycle_end0,cycle_end0_carry__1_n_2,cycle_end0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_cycle_end0_carry__1_O_UNCONNECTED[3:0]),
        .S({1'b0,cycle_end0_carry__1_i_1_n_0,cycle_end0_carry__1_i_2_n_0,cycle_end0_carry__1_i_3_n_0}));
  LUT4 #(
    .INIT(16'h9009)) 
    cycle_end0_carry__1_i_1
       (.I0(counter_reg[30]),
        .I1(cycle_end1[30]),
        .I2(cycle_end1[31]),
        .I3(counter_reg[31]),
        .O(cycle_end0_carry__1_i_1_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    cycle_end0_carry__1_i_2
       (.I0(counter_reg[28]),
        .I1(cycle_end1[28]),
        .I2(counter_reg[27]),
        .I3(cycle_end1[27]),
        .I4(cycle_end1[29]),
        .I5(counter_reg[29]),
        .O(cycle_end0_carry__1_i_2_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    cycle_end0_carry__1_i_3
       (.I0(counter_reg[25]),
        .I1(cycle_end1[25]),
        .I2(counter_reg[24]),
        .I3(cycle_end1[24]),
        .I4(cycle_end1[26]),
        .I5(counter_reg[26]),
        .O(cycle_end0_carry__1_i_3_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    cycle_end0_carry_i_1
       (.I0(counter_reg[10]),
        .I1(cycle_end1[10]),
        .I2(counter_reg[9]),
        .I3(cycle_end1[9]),
        .I4(cycle_end1[11]),
        .I5(counter_reg[11]),
        .O(cycle_end0_carry_i_1_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    cycle_end0_carry_i_2
       (.I0(counter_reg[7]),
        .I1(cycle_end1[7]),
        .I2(counter_reg[6]),
        .I3(cycle_end1[6]),
        .I4(cycle_end1[8]),
        .I5(counter_reg[8]),
        .O(cycle_end0_carry_i_2_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    cycle_end0_carry_i_3
       (.I0(counter_reg[4]),
        .I1(cycle_end1[4]),
        .I2(counter_reg[3]),
        .I3(cycle_end1[3]),
        .I4(cycle_end1[5]),
        .I5(counter_reg[5]),
        .O(cycle_end0_carry_i_3_n_0));
  LUT6 #(
    .INIT(64'h0990000000000990)) 
    cycle_end0_carry_i_4
       (.I0(counter_reg[1]),
        .I1(cycle_end1[1]),
        .I2(active_period_ticks[0]),
        .I3(counter_reg[0]),
        .I4(cycle_end1[2]),
        .I5(counter_reg[2]),
        .O(cycle_end0_carry_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 cycle_end1_carry
       (.CI(1'b0),
        .CO({cycle_end1_carry_n_0,cycle_end1_carry_n_1,cycle_end1_carry_n_2,cycle_end1_carry_n_3}),
        .CYINIT(active_period_ticks[0]),
        .DI(active_period_ticks[4:1]),
        .O(cycle_end1[4:1]),
        .S({cycle_end1_carry_i_1_n_0,cycle_end1_carry_i_2_n_0,cycle_end1_carry_i_3_n_0,cycle_end1_carry_i_4_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 cycle_end1_carry__0
       (.CI(cycle_end1_carry_n_0),
        .CO({cycle_end1_carry__0_n_0,cycle_end1_carry__0_n_1,cycle_end1_carry__0_n_2,cycle_end1_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI(active_period_ticks[8:5]),
        .O(cycle_end1[8:5]),
        .S({cycle_end1_carry__0_i_1_n_0,cycle_end1_carry__0_i_2_n_0,cycle_end1_carry__0_i_3_n_0,cycle_end1_carry__0_i_4_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    cycle_end1_carry__0_i_1
       (.I0(active_period_ticks[8]),
        .O(cycle_end1_carry__0_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    cycle_end1_carry__0_i_2
       (.I0(active_period_ticks[7]),
        .O(cycle_end1_carry__0_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    cycle_end1_carry__0_i_3
       (.I0(active_period_ticks[6]),
        .O(cycle_end1_carry__0_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    cycle_end1_carry__0_i_4
       (.I0(active_period_ticks[5]),
        .O(cycle_end1_carry__0_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 cycle_end1_carry__1
       (.CI(cycle_end1_carry__0_n_0),
        .CO({cycle_end1_carry__1_n_0,cycle_end1_carry__1_n_1,cycle_end1_carry__1_n_2,cycle_end1_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI(active_period_ticks[12:9]),
        .O(cycle_end1[12:9]),
        .S({cycle_end1_carry__1_i_1_n_0,cycle_end1_carry__1_i_2_n_0,cycle_end1_carry__1_i_3_n_0,cycle_end1_carry__1_i_4_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    cycle_end1_carry__1_i_1
       (.I0(active_period_ticks[12]),
        .O(cycle_end1_carry__1_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    cycle_end1_carry__1_i_2
       (.I0(active_period_ticks[11]),
        .O(cycle_end1_carry__1_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    cycle_end1_carry__1_i_3
       (.I0(active_period_ticks[10]),
        .O(cycle_end1_carry__1_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    cycle_end1_carry__1_i_4
       (.I0(active_period_ticks[9]),
        .O(cycle_end1_carry__1_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 cycle_end1_carry__2
       (.CI(cycle_end1_carry__1_n_0),
        .CO({cycle_end1_carry__2_n_0,cycle_end1_carry__2_n_1,cycle_end1_carry__2_n_2,cycle_end1_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI(active_period_ticks[16:13]),
        .O(cycle_end1[16:13]),
        .S({cycle_end1_carry__2_i_1_n_0,cycle_end1_carry__2_i_2_n_0,cycle_end1_carry__2_i_3_n_0,cycle_end1_carry__2_i_4_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    cycle_end1_carry__2_i_1
       (.I0(active_period_ticks[16]),
        .O(cycle_end1_carry__2_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    cycle_end1_carry__2_i_2
       (.I0(active_period_ticks[15]),
        .O(cycle_end1_carry__2_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    cycle_end1_carry__2_i_3
       (.I0(active_period_ticks[14]),
        .O(cycle_end1_carry__2_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    cycle_end1_carry__2_i_4
       (.I0(active_period_ticks[13]),
        .O(cycle_end1_carry__2_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 cycle_end1_carry__3
       (.CI(cycle_end1_carry__2_n_0),
        .CO({cycle_end1_carry__3_n_0,cycle_end1_carry__3_n_1,cycle_end1_carry__3_n_2,cycle_end1_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI(active_period_ticks[20:17]),
        .O(cycle_end1[20:17]),
        .S({cycle_end1_carry__3_i_1_n_0,cycle_end1_carry__3_i_2_n_0,cycle_end1_carry__3_i_3_n_0,cycle_end1_carry__3_i_4_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    cycle_end1_carry__3_i_1
       (.I0(active_period_ticks[20]),
        .O(cycle_end1_carry__3_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    cycle_end1_carry__3_i_2
       (.I0(active_period_ticks[19]),
        .O(cycle_end1_carry__3_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    cycle_end1_carry__3_i_3
       (.I0(active_period_ticks[18]),
        .O(cycle_end1_carry__3_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    cycle_end1_carry__3_i_4
       (.I0(active_period_ticks[17]),
        .O(cycle_end1_carry__3_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 cycle_end1_carry__4
       (.CI(cycle_end1_carry__3_n_0),
        .CO({cycle_end1_carry__4_n_0,cycle_end1_carry__4_n_1,cycle_end1_carry__4_n_2,cycle_end1_carry__4_n_3}),
        .CYINIT(1'b0),
        .DI(active_period_ticks[24:21]),
        .O(cycle_end1[24:21]),
        .S({cycle_end1_carry__4_i_1_n_0,cycle_end1_carry__4_i_2_n_0,cycle_end1_carry__4_i_3_n_0,cycle_end1_carry__4_i_4_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    cycle_end1_carry__4_i_1
       (.I0(active_period_ticks[24]),
        .O(cycle_end1_carry__4_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    cycle_end1_carry__4_i_2
       (.I0(active_period_ticks[23]),
        .O(cycle_end1_carry__4_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    cycle_end1_carry__4_i_3
       (.I0(active_period_ticks[22]),
        .O(cycle_end1_carry__4_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    cycle_end1_carry__4_i_4
       (.I0(active_period_ticks[21]),
        .O(cycle_end1_carry__4_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 cycle_end1_carry__5
       (.CI(cycle_end1_carry__4_n_0),
        .CO({cycle_end1_carry__5_n_0,cycle_end1_carry__5_n_1,cycle_end1_carry__5_n_2,cycle_end1_carry__5_n_3}),
        .CYINIT(1'b0),
        .DI(active_period_ticks[28:25]),
        .O(cycle_end1[28:25]),
        .S({cycle_end1_carry__5_i_1_n_0,cycle_end1_carry__5_i_2_n_0,cycle_end1_carry__5_i_3_n_0,cycle_end1_carry__5_i_4_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    cycle_end1_carry__5_i_1
       (.I0(active_period_ticks[28]),
        .O(cycle_end1_carry__5_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    cycle_end1_carry__5_i_2
       (.I0(active_period_ticks[27]),
        .O(cycle_end1_carry__5_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    cycle_end1_carry__5_i_3
       (.I0(active_period_ticks[26]),
        .O(cycle_end1_carry__5_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    cycle_end1_carry__5_i_4
       (.I0(active_period_ticks[25]),
        .O(cycle_end1_carry__5_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 cycle_end1_carry__6
       (.CI(cycle_end1_carry__5_n_0),
        .CO({NLW_cycle_end1_carry__6_CO_UNCONNECTED[3:2],cycle_end1_carry__6_n_2,cycle_end1_carry__6_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,active_period_ticks[30:29]}),
        .O({NLW_cycle_end1_carry__6_O_UNCONNECTED[3],cycle_end1[31:29]}),
        .S({1'b0,cycle_end1_carry__6_i_1_n_0,cycle_end1_carry__6_i_2_n_0,cycle_end1_carry__6_i_3_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    cycle_end1_carry__6_i_1
       (.I0(active_period_ticks[31]),
        .O(cycle_end1_carry__6_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    cycle_end1_carry__6_i_2
       (.I0(active_period_ticks[30]),
        .O(cycle_end1_carry__6_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    cycle_end1_carry__6_i_3
       (.I0(active_period_ticks[29]),
        .O(cycle_end1_carry__6_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    cycle_end1_carry_i_1
       (.I0(active_period_ticks[4]),
        .O(cycle_end1_carry_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    cycle_end1_carry_i_2
       (.I0(active_period_ticks[3]),
        .O(cycle_end1_carry_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    cycle_end1_carry_i_3
       (.I0(active_period_ticks[2]),
        .O(cycle_end1_carry_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    cycle_end1_carry_i_4
       (.I0(active_period_ticks[1]),
        .O(cycle_end1_carry_i_4_n_0));
  FDRE \pending_high_ticks_reg[0] 
       (.C(s_axi_aclk),
        .CE(pending_valid),
        .D(\pending_high_ticks_reg[31]_0 [0]),
        .Q(pending_high_ticks[0]),
        .R(clear));
  FDRE \pending_high_ticks_reg[10] 
       (.C(s_axi_aclk),
        .CE(pending_valid),
        .D(\pending_high_ticks_reg[31]_0 [10]),
        .Q(pending_high_ticks[10]),
        .R(clear));
  FDRE \pending_high_ticks_reg[11] 
       (.C(s_axi_aclk),
        .CE(pending_valid),
        .D(\pending_high_ticks_reg[31]_0 [11]),
        .Q(pending_high_ticks[11]),
        .R(clear));
  FDRE \pending_high_ticks_reg[12] 
       (.C(s_axi_aclk),
        .CE(pending_valid),
        .D(\pending_high_ticks_reg[31]_0 [12]),
        .Q(pending_high_ticks[12]),
        .R(clear));
  FDRE \pending_high_ticks_reg[13] 
       (.C(s_axi_aclk),
        .CE(pending_valid),
        .D(\pending_high_ticks_reg[31]_0 [13]),
        .Q(pending_high_ticks[13]),
        .R(clear));
  FDRE \pending_high_ticks_reg[14] 
       (.C(s_axi_aclk),
        .CE(pending_valid),
        .D(\pending_high_ticks_reg[31]_0 [14]),
        .Q(pending_high_ticks[14]),
        .R(clear));
  FDRE \pending_high_ticks_reg[15] 
       (.C(s_axi_aclk),
        .CE(pending_valid),
        .D(\pending_high_ticks_reg[31]_0 [15]),
        .Q(pending_high_ticks[15]),
        .R(clear));
  FDRE \pending_high_ticks_reg[16] 
       (.C(s_axi_aclk),
        .CE(pending_valid),
        .D(\pending_high_ticks_reg[31]_0 [16]),
        .Q(pending_high_ticks[16]),
        .R(clear));
  FDRE \pending_high_ticks_reg[17] 
       (.C(s_axi_aclk),
        .CE(pending_valid),
        .D(\pending_high_ticks_reg[31]_0 [17]),
        .Q(pending_high_ticks[17]),
        .R(clear));
  FDRE \pending_high_ticks_reg[18] 
       (.C(s_axi_aclk),
        .CE(pending_valid),
        .D(\pending_high_ticks_reg[31]_0 [18]),
        .Q(pending_high_ticks[18]),
        .R(clear));
  FDRE \pending_high_ticks_reg[19] 
       (.C(s_axi_aclk),
        .CE(pending_valid),
        .D(\pending_high_ticks_reg[31]_0 [19]),
        .Q(pending_high_ticks[19]),
        .R(clear));
  FDRE \pending_high_ticks_reg[1] 
       (.C(s_axi_aclk),
        .CE(pending_valid),
        .D(\pending_high_ticks_reg[31]_0 [1]),
        .Q(pending_high_ticks[1]),
        .R(clear));
  FDRE \pending_high_ticks_reg[20] 
       (.C(s_axi_aclk),
        .CE(pending_valid),
        .D(\pending_high_ticks_reg[31]_0 [20]),
        .Q(pending_high_ticks[20]),
        .R(clear));
  FDRE \pending_high_ticks_reg[21] 
       (.C(s_axi_aclk),
        .CE(pending_valid),
        .D(\pending_high_ticks_reg[31]_0 [21]),
        .Q(pending_high_ticks[21]),
        .R(clear));
  FDRE \pending_high_ticks_reg[22] 
       (.C(s_axi_aclk),
        .CE(pending_valid),
        .D(\pending_high_ticks_reg[31]_0 [22]),
        .Q(pending_high_ticks[22]),
        .R(clear));
  FDRE \pending_high_ticks_reg[23] 
       (.C(s_axi_aclk),
        .CE(pending_valid),
        .D(\pending_high_ticks_reg[31]_0 [23]),
        .Q(pending_high_ticks[23]),
        .R(clear));
  FDRE \pending_high_ticks_reg[24] 
       (.C(s_axi_aclk),
        .CE(pending_valid),
        .D(\pending_high_ticks_reg[31]_0 [24]),
        .Q(pending_high_ticks[24]),
        .R(clear));
  FDRE \pending_high_ticks_reg[25] 
       (.C(s_axi_aclk),
        .CE(pending_valid),
        .D(\pending_high_ticks_reg[31]_0 [25]),
        .Q(pending_high_ticks[25]),
        .R(clear));
  FDRE \pending_high_ticks_reg[26] 
       (.C(s_axi_aclk),
        .CE(pending_valid),
        .D(\pending_high_ticks_reg[31]_0 [26]),
        .Q(pending_high_ticks[26]),
        .R(clear));
  FDRE \pending_high_ticks_reg[27] 
       (.C(s_axi_aclk),
        .CE(pending_valid),
        .D(\pending_high_ticks_reg[31]_0 [27]),
        .Q(pending_high_ticks[27]),
        .R(clear));
  FDRE \pending_high_ticks_reg[28] 
       (.C(s_axi_aclk),
        .CE(pending_valid),
        .D(\pending_high_ticks_reg[31]_0 [28]),
        .Q(pending_high_ticks[28]),
        .R(clear));
  FDRE \pending_high_ticks_reg[29] 
       (.C(s_axi_aclk),
        .CE(pending_valid),
        .D(\pending_high_ticks_reg[31]_0 [29]),
        .Q(pending_high_ticks[29]),
        .R(clear));
  FDRE \pending_high_ticks_reg[2] 
       (.C(s_axi_aclk),
        .CE(pending_valid),
        .D(\pending_high_ticks_reg[31]_0 [2]),
        .Q(pending_high_ticks[2]),
        .R(clear));
  FDRE \pending_high_ticks_reg[30] 
       (.C(s_axi_aclk),
        .CE(pending_valid),
        .D(\pending_high_ticks_reg[31]_0 [30]),
        .Q(pending_high_ticks[30]),
        .R(clear));
  FDRE \pending_high_ticks_reg[31] 
       (.C(s_axi_aclk),
        .CE(pending_valid),
        .D(\pending_high_ticks_reg[31]_0 [31]),
        .Q(pending_high_ticks[31]),
        .R(clear));
  FDRE \pending_high_ticks_reg[3] 
       (.C(s_axi_aclk),
        .CE(pending_valid),
        .D(\pending_high_ticks_reg[31]_0 [3]),
        .Q(pending_high_ticks[3]),
        .R(clear));
  FDRE \pending_high_ticks_reg[4] 
       (.C(s_axi_aclk),
        .CE(pending_valid),
        .D(\pending_high_ticks_reg[31]_0 [4]),
        .Q(pending_high_ticks[4]),
        .R(clear));
  FDRE \pending_high_ticks_reg[5] 
       (.C(s_axi_aclk),
        .CE(pending_valid),
        .D(\pending_high_ticks_reg[31]_0 [5]),
        .Q(pending_high_ticks[5]),
        .R(clear));
  FDRE \pending_high_ticks_reg[6] 
       (.C(s_axi_aclk),
        .CE(pending_valid),
        .D(\pending_high_ticks_reg[31]_0 [6]),
        .Q(pending_high_ticks[6]),
        .R(clear));
  FDRE \pending_high_ticks_reg[7] 
       (.C(s_axi_aclk),
        .CE(pending_valid),
        .D(\pending_high_ticks_reg[31]_0 [7]),
        .Q(pending_high_ticks[7]),
        .R(clear));
  FDRE \pending_high_ticks_reg[8] 
       (.C(s_axi_aclk),
        .CE(pending_valid),
        .D(\pending_high_ticks_reg[31]_0 [8]),
        .Q(pending_high_ticks[8]),
        .R(clear));
  FDRE \pending_high_ticks_reg[9] 
       (.C(s_axi_aclk),
        .CE(pending_valid),
        .D(\pending_high_ticks_reg[31]_0 [9]),
        .Q(pending_high_ticks[9]),
        .R(clear));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 pending_period_ticks2_carry
       (.CI(1'b0),
        .CO({pending_period_ticks2_carry_n_0,pending_period_ticks2_carry_n_1,pending_period_ticks2_carry_n_2,pending_period_ticks2_carry_n_3}),
        .CYINIT(1'b0),
        .DI({pending_period_ticks2_carry_i_1_n_0,pending_period_ticks2_carry_i_2_n_0,pending_period_ticks2_carry_i_3_n_0,pending_period_ticks2_carry_i_4_n_0}),
        .O(NLW_pending_period_ticks2_carry_O_UNCONNECTED[3:0]),
        .S({pending_period_ticks2_carry_i_5_n_0,pending_period_ticks2_carry_i_6_n_0,pending_period_ticks2_carry_i_7_n_0,pending_period_ticks2_carry_i_8_n_0}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 pending_period_ticks2_carry__0
       (.CI(pending_period_ticks2_carry_n_0),
        .CO({pending_period_ticks2_carry__0_n_0,pending_period_ticks2_carry__0_n_1,pending_period_ticks2_carry__0_n_2,pending_period_ticks2_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({pending_period_ticks2_carry__0_i_1_n_0,pending_period_ticks2_carry__0_i_2_n_0,pending_period_ticks2_carry__0_i_3_n_0,pending_period_ticks2_carry__0_i_4_n_0}),
        .O(NLW_pending_period_ticks2_carry__0_O_UNCONNECTED[3:0]),
        .S({pending_period_ticks2_carry__0_i_5_n_0,pending_period_ticks2_carry__0_i_6_n_0,pending_period_ticks2_carry__0_i_7_n_0,pending_period_ticks2_carry__0_i_8_n_0}));
  LUT4 #(
    .INIT(16'h2F02)) 
    pending_period_ticks2_carry__0_i_1
       (.I0(\pending_high_ticks_reg[31]_0 [14]),
        .I1(Q[14]),
        .I2(Q[15]),
        .I3(\pending_high_ticks_reg[31]_0 [15]),
        .O(pending_period_ticks2_carry__0_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pending_period_ticks2_carry__0_i_2
       (.I0(\pending_high_ticks_reg[31]_0 [12]),
        .I1(Q[12]),
        .I2(Q[13]),
        .I3(\pending_high_ticks_reg[31]_0 [13]),
        .O(pending_period_ticks2_carry__0_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pending_period_ticks2_carry__0_i_3
       (.I0(\pending_high_ticks_reg[31]_0 [10]),
        .I1(Q[10]),
        .I2(Q[11]),
        .I3(\pending_high_ticks_reg[31]_0 [11]),
        .O(pending_period_ticks2_carry__0_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pending_period_ticks2_carry__0_i_4
       (.I0(\pending_high_ticks_reg[31]_0 [8]),
        .I1(Q[8]),
        .I2(Q[9]),
        .I3(\pending_high_ticks_reg[31]_0 [9]),
        .O(pending_period_ticks2_carry__0_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pending_period_ticks2_carry__0_i_5
       (.I0(Q[15]),
        .I1(\pending_high_ticks_reg[31]_0 [15]),
        .I2(Q[14]),
        .I3(\pending_high_ticks_reg[31]_0 [14]),
        .O(pending_period_ticks2_carry__0_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pending_period_ticks2_carry__0_i_6
       (.I0(Q[13]),
        .I1(\pending_high_ticks_reg[31]_0 [13]),
        .I2(Q[12]),
        .I3(\pending_high_ticks_reg[31]_0 [12]),
        .O(pending_period_ticks2_carry__0_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pending_period_ticks2_carry__0_i_7
       (.I0(Q[11]),
        .I1(\pending_high_ticks_reg[31]_0 [11]),
        .I2(Q[10]),
        .I3(\pending_high_ticks_reg[31]_0 [10]),
        .O(pending_period_ticks2_carry__0_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pending_period_ticks2_carry__0_i_8
       (.I0(Q[9]),
        .I1(\pending_high_ticks_reg[31]_0 [9]),
        .I2(Q[8]),
        .I3(\pending_high_ticks_reg[31]_0 [8]),
        .O(pending_period_ticks2_carry__0_i_8_n_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 pending_period_ticks2_carry__1
       (.CI(pending_period_ticks2_carry__0_n_0),
        .CO({pending_period_ticks2_carry__1_n_0,pending_period_ticks2_carry__1_n_1,pending_period_ticks2_carry__1_n_2,pending_period_ticks2_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({pending_period_ticks2_carry__1_i_1_n_0,pending_period_ticks2_carry__1_i_2_n_0,pending_period_ticks2_carry__1_i_3_n_0,pending_period_ticks2_carry__1_i_4_n_0}),
        .O(NLW_pending_period_ticks2_carry__1_O_UNCONNECTED[3:0]),
        .S({pending_period_ticks2_carry__1_i_5_n_0,pending_period_ticks2_carry__1_i_6_n_0,pending_period_ticks2_carry__1_i_7_n_0,pending_period_ticks2_carry__1_i_8_n_0}));
  LUT4 #(
    .INIT(16'h2F02)) 
    pending_period_ticks2_carry__1_i_1
       (.I0(\pending_high_ticks_reg[31]_0 [22]),
        .I1(Q[22]),
        .I2(Q[23]),
        .I3(\pending_high_ticks_reg[31]_0 [23]),
        .O(pending_period_ticks2_carry__1_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pending_period_ticks2_carry__1_i_2
       (.I0(\pending_high_ticks_reg[31]_0 [20]),
        .I1(Q[20]),
        .I2(Q[21]),
        .I3(\pending_high_ticks_reg[31]_0 [21]),
        .O(pending_period_ticks2_carry__1_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pending_period_ticks2_carry__1_i_3
       (.I0(\pending_high_ticks_reg[31]_0 [18]),
        .I1(Q[18]),
        .I2(Q[19]),
        .I3(\pending_high_ticks_reg[31]_0 [19]),
        .O(pending_period_ticks2_carry__1_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pending_period_ticks2_carry__1_i_4
       (.I0(\pending_high_ticks_reg[31]_0 [16]),
        .I1(Q[16]),
        .I2(Q[17]),
        .I3(\pending_high_ticks_reg[31]_0 [17]),
        .O(pending_period_ticks2_carry__1_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pending_period_ticks2_carry__1_i_5
       (.I0(Q[23]),
        .I1(\pending_high_ticks_reg[31]_0 [23]),
        .I2(Q[22]),
        .I3(\pending_high_ticks_reg[31]_0 [22]),
        .O(pending_period_ticks2_carry__1_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pending_period_ticks2_carry__1_i_6
       (.I0(Q[21]),
        .I1(\pending_high_ticks_reg[31]_0 [21]),
        .I2(Q[20]),
        .I3(\pending_high_ticks_reg[31]_0 [20]),
        .O(pending_period_ticks2_carry__1_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pending_period_ticks2_carry__1_i_7
       (.I0(Q[19]),
        .I1(\pending_high_ticks_reg[31]_0 [19]),
        .I2(Q[18]),
        .I3(\pending_high_ticks_reg[31]_0 [18]),
        .O(pending_period_ticks2_carry__1_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pending_period_ticks2_carry__1_i_8
       (.I0(Q[17]),
        .I1(\pending_high_ticks_reg[31]_0 [17]),
        .I2(Q[16]),
        .I3(\pending_high_ticks_reg[31]_0 [16]),
        .O(pending_period_ticks2_carry__1_i_8_n_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 pending_period_ticks2_carry__2
       (.CI(pending_period_ticks2_carry__1_n_0),
        .CO({pending_period_ticks2,pending_period_ticks2_carry__2_n_1,pending_period_ticks2_carry__2_n_2,pending_period_ticks2_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({pending_period_ticks2_carry__2_i_1_n_0,pending_period_ticks2_carry__2_i_2_n_0,pending_period_ticks2_carry__2_i_3_n_0,pending_period_ticks2_carry__2_i_4_n_0}),
        .O(NLW_pending_period_ticks2_carry__2_O_UNCONNECTED[3:0]),
        .S({pending_period_ticks2_carry__2_i_5_n_0,pending_period_ticks2_carry__2_i_6_n_0,pending_period_ticks2_carry__2_i_7_n_0,pending_period_ticks2_carry__2_i_8_n_0}));
  LUT4 #(
    .INIT(16'h2F02)) 
    pending_period_ticks2_carry__2_i_1
       (.I0(\pending_high_ticks_reg[31]_0 [30]),
        .I1(Q[30]),
        .I2(Q[31]),
        .I3(\pending_high_ticks_reg[31]_0 [31]),
        .O(pending_period_ticks2_carry__2_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pending_period_ticks2_carry__2_i_2
       (.I0(\pending_high_ticks_reg[31]_0 [28]),
        .I1(Q[28]),
        .I2(Q[29]),
        .I3(\pending_high_ticks_reg[31]_0 [29]),
        .O(pending_period_ticks2_carry__2_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pending_period_ticks2_carry__2_i_3
       (.I0(\pending_high_ticks_reg[31]_0 [26]),
        .I1(Q[26]),
        .I2(Q[27]),
        .I3(\pending_high_ticks_reg[31]_0 [27]),
        .O(pending_period_ticks2_carry__2_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pending_period_ticks2_carry__2_i_4
       (.I0(\pending_high_ticks_reg[31]_0 [24]),
        .I1(Q[24]),
        .I2(Q[25]),
        .I3(\pending_high_ticks_reg[31]_0 [25]),
        .O(pending_period_ticks2_carry__2_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pending_period_ticks2_carry__2_i_5
       (.I0(Q[31]),
        .I1(\pending_high_ticks_reg[31]_0 [31]),
        .I2(Q[30]),
        .I3(\pending_high_ticks_reg[31]_0 [30]),
        .O(pending_period_ticks2_carry__2_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pending_period_ticks2_carry__2_i_6
       (.I0(Q[29]),
        .I1(\pending_high_ticks_reg[31]_0 [29]),
        .I2(Q[28]),
        .I3(\pending_high_ticks_reg[31]_0 [28]),
        .O(pending_period_ticks2_carry__2_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pending_period_ticks2_carry__2_i_7
       (.I0(Q[27]),
        .I1(\pending_high_ticks_reg[31]_0 [27]),
        .I2(Q[26]),
        .I3(\pending_high_ticks_reg[31]_0 [26]),
        .O(pending_period_ticks2_carry__2_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pending_period_ticks2_carry__2_i_8
       (.I0(Q[25]),
        .I1(\pending_high_ticks_reg[31]_0 [25]),
        .I2(Q[24]),
        .I3(\pending_high_ticks_reg[31]_0 [24]),
        .O(pending_period_ticks2_carry__2_i_8_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pending_period_ticks2_carry_i_1
       (.I0(\pending_high_ticks_reg[31]_0 [6]),
        .I1(Q[6]),
        .I2(Q[7]),
        .I3(\pending_high_ticks_reg[31]_0 [7]),
        .O(pending_period_ticks2_carry_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pending_period_ticks2_carry_i_2
       (.I0(\pending_high_ticks_reg[31]_0 [4]),
        .I1(Q[4]),
        .I2(Q[5]),
        .I3(\pending_high_ticks_reg[31]_0 [5]),
        .O(pending_period_ticks2_carry_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pending_period_ticks2_carry_i_3
       (.I0(\pending_high_ticks_reg[31]_0 [2]),
        .I1(Q[2]),
        .I2(Q[3]),
        .I3(\pending_high_ticks_reg[31]_0 [3]),
        .O(pending_period_ticks2_carry_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pending_period_ticks2_carry_i_4
       (.I0(\pending_high_ticks_reg[31]_0 [0]),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(\pending_high_ticks_reg[31]_0 [1]),
        .O(pending_period_ticks2_carry_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pending_period_ticks2_carry_i_5
       (.I0(Q[7]),
        .I1(\pending_high_ticks_reg[31]_0 [7]),
        .I2(Q[6]),
        .I3(\pending_high_ticks_reg[31]_0 [6]),
        .O(pending_period_ticks2_carry_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pending_period_ticks2_carry_i_6
       (.I0(Q[5]),
        .I1(\pending_high_ticks_reg[31]_0 [5]),
        .I2(Q[4]),
        .I3(\pending_high_ticks_reg[31]_0 [4]),
        .O(pending_period_ticks2_carry_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pending_period_ticks2_carry_i_7
       (.I0(Q[3]),
        .I1(\pending_high_ticks_reg[31]_0 [3]),
        .I2(Q[2]),
        .I3(\pending_high_ticks_reg[31]_0 [2]),
        .O(pending_period_ticks2_carry_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pending_period_ticks2_carry_i_8
       (.I0(Q[1]),
        .I1(\pending_high_ticks_reg[31]_0 [1]),
        .I2(Q[0]),
        .I3(\pending_high_ticks_reg[31]_0 [0]),
        .O(pending_period_ticks2_carry_i_8_n_0));
  LUT6 #(
    .INIT(64'h2222222222220222)) 
    \pending_period_ticks[31]_i_1 
       (.I0(pending_period_ticks1__31),
        .I1(pending_period_ticks2),
        .I2(\pending_period_ticks[31]_i_3_n_0 ),
        .I3(\pending_period_ticks[31]_i_4_n_0 ),
        .I4(\pending_period_ticks[31]_i_5_n_0 ),
        .I5(\pending_period_ticks[31]_i_6_n_0 ),
        .O(pending_valid));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \pending_period_ticks[31]_i_10 
       (.I0(Q[20]),
        .I1(Q[21]),
        .I2(Q[22]),
        .I3(Q[23]),
        .O(\pending_period_ticks[31]_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \pending_period_ticks[31]_i_2 
       (.I0(pending_valid_reg_n_0),
        .I1(cfg_error_reg_0),
        .I2(s_axi_aresetn),
        .O(pending_period_ticks1__31));
  LUT5 #(
    .INIT(32'h00010000)) 
    \pending_period_ticks[31]_i_3 
       (.I0(Q[12]),
        .I1(Q[13]),
        .I2(Q[14]),
        .I3(Q[15]),
        .I4(\pending_period_ticks[31]_i_7_n_0 ),
        .O(\pending_period_ticks[31]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h00010000)) 
    \pending_period_ticks[31]_i_4 
       (.I0(Q[2]),
        .I1(Q[3]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(\pending_period_ticks[31]_i_8_n_0 ),
        .O(\pending_period_ticks[31]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \pending_period_ticks[31]_i_5 
       (.I0(Q[27]),
        .I1(Q[26]),
        .I2(Q[25]),
        .I3(Q[24]),
        .I4(\pending_period_ticks[31]_i_9_n_0 ),
        .O(\pending_period_ticks[31]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \pending_period_ticks[31]_i_6 
       (.I0(Q[19]),
        .I1(Q[18]),
        .I2(Q[17]),
        .I3(Q[16]),
        .I4(\pending_period_ticks[31]_i_10_n_0 ),
        .O(\pending_period_ticks[31]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \pending_period_ticks[31]_i_7 
       (.I0(Q[11]),
        .I1(Q[10]),
        .I2(Q[9]),
        .I3(Q[8]),
        .O(\pending_period_ticks[31]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \pending_period_ticks[31]_i_8 
       (.I0(Q[7]),
        .I1(Q[6]),
        .I2(Q[5]),
        .I3(Q[4]),
        .O(\pending_period_ticks[31]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \pending_period_ticks[31]_i_9 
       (.I0(Q[28]),
        .I1(Q[29]),
        .I2(Q[31]),
        .I3(Q[30]),
        .O(\pending_period_ticks[31]_i_9_n_0 ));
  FDRE \pending_period_ticks_reg[0] 
       (.C(s_axi_aclk),
        .CE(pending_valid),
        .D(Q[0]),
        .Q(pending_period_ticks[0]),
        .R(clear));
  FDRE \pending_period_ticks_reg[10] 
       (.C(s_axi_aclk),
        .CE(pending_valid),
        .D(Q[10]),
        .Q(pending_period_ticks[10]),
        .R(clear));
  FDRE \pending_period_ticks_reg[11] 
       (.C(s_axi_aclk),
        .CE(pending_valid),
        .D(Q[11]),
        .Q(pending_period_ticks[11]),
        .R(clear));
  FDRE \pending_period_ticks_reg[12] 
       (.C(s_axi_aclk),
        .CE(pending_valid),
        .D(Q[12]),
        .Q(pending_period_ticks[12]),
        .R(clear));
  FDRE \pending_period_ticks_reg[13] 
       (.C(s_axi_aclk),
        .CE(pending_valid),
        .D(Q[13]),
        .Q(pending_period_ticks[13]),
        .R(clear));
  FDRE \pending_period_ticks_reg[14] 
       (.C(s_axi_aclk),
        .CE(pending_valid),
        .D(Q[14]),
        .Q(pending_period_ticks[14]),
        .R(clear));
  FDRE \pending_period_ticks_reg[15] 
       (.C(s_axi_aclk),
        .CE(pending_valid),
        .D(Q[15]),
        .Q(pending_period_ticks[15]),
        .R(clear));
  FDRE \pending_period_ticks_reg[16] 
       (.C(s_axi_aclk),
        .CE(pending_valid),
        .D(Q[16]),
        .Q(pending_period_ticks[16]),
        .R(clear));
  FDRE \pending_period_ticks_reg[17] 
       (.C(s_axi_aclk),
        .CE(pending_valid),
        .D(Q[17]),
        .Q(pending_period_ticks[17]),
        .R(clear));
  FDRE \pending_period_ticks_reg[18] 
       (.C(s_axi_aclk),
        .CE(pending_valid),
        .D(Q[18]),
        .Q(pending_period_ticks[18]),
        .R(clear));
  FDRE \pending_period_ticks_reg[19] 
       (.C(s_axi_aclk),
        .CE(pending_valid),
        .D(Q[19]),
        .Q(pending_period_ticks[19]),
        .R(clear));
  FDRE \pending_period_ticks_reg[1] 
       (.C(s_axi_aclk),
        .CE(pending_valid),
        .D(Q[1]),
        .Q(pending_period_ticks[1]),
        .R(clear));
  FDRE \pending_period_ticks_reg[20] 
       (.C(s_axi_aclk),
        .CE(pending_valid),
        .D(Q[20]),
        .Q(pending_period_ticks[20]),
        .R(clear));
  FDRE \pending_period_ticks_reg[21] 
       (.C(s_axi_aclk),
        .CE(pending_valid),
        .D(Q[21]),
        .Q(pending_period_ticks[21]),
        .R(clear));
  FDRE \pending_period_ticks_reg[22] 
       (.C(s_axi_aclk),
        .CE(pending_valid),
        .D(Q[22]),
        .Q(pending_period_ticks[22]),
        .R(clear));
  FDRE \pending_period_ticks_reg[23] 
       (.C(s_axi_aclk),
        .CE(pending_valid),
        .D(Q[23]),
        .Q(pending_period_ticks[23]),
        .R(clear));
  FDRE \pending_period_ticks_reg[24] 
       (.C(s_axi_aclk),
        .CE(pending_valid),
        .D(Q[24]),
        .Q(pending_period_ticks[24]),
        .R(clear));
  FDRE \pending_period_ticks_reg[25] 
       (.C(s_axi_aclk),
        .CE(pending_valid),
        .D(Q[25]),
        .Q(pending_period_ticks[25]),
        .R(clear));
  FDRE \pending_period_ticks_reg[26] 
       (.C(s_axi_aclk),
        .CE(pending_valid),
        .D(Q[26]),
        .Q(pending_period_ticks[26]),
        .R(clear));
  FDRE \pending_period_ticks_reg[27] 
       (.C(s_axi_aclk),
        .CE(pending_valid),
        .D(Q[27]),
        .Q(pending_period_ticks[27]),
        .R(clear));
  FDRE \pending_period_ticks_reg[28] 
       (.C(s_axi_aclk),
        .CE(pending_valid),
        .D(Q[28]),
        .Q(pending_period_ticks[28]),
        .R(clear));
  FDRE \pending_period_ticks_reg[29] 
       (.C(s_axi_aclk),
        .CE(pending_valid),
        .D(Q[29]),
        .Q(pending_period_ticks[29]),
        .R(clear));
  FDRE \pending_period_ticks_reg[2] 
       (.C(s_axi_aclk),
        .CE(pending_valid),
        .D(Q[2]),
        .Q(pending_period_ticks[2]),
        .R(clear));
  FDRE \pending_period_ticks_reg[30] 
       (.C(s_axi_aclk),
        .CE(pending_valid),
        .D(Q[30]),
        .Q(pending_period_ticks[30]),
        .R(clear));
  FDRE \pending_period_ticks_reg[31] 
       (.C(s_axi_aclk),
        .CE(pending_valid),
        .D(Q[31]),
        .Q(pending_period_ticks[31]),
        .R(clear));
  FDRE \pending_period_ticks_reg[3] 
       (.C(s_axi_aclk),
        .CE(pending_valid),
        .D(Q[3]),
        .Q(pending_period_ticks[3]),
        .R(clear));
  FDRE \pending_period_ticks_reg[4] 
       (.C(s_axi_aclk),
        .CE(pending_valid),
        .D(Q[4]),
        .Q(pending_period_ticks[4]),
        .R(clear));
  FDRE \pending_period_ticks_reg[5] 
       (.C(s_axi_aclk),
        .CE(pending_valid),
        .D(Q[5]),
        .Q(pending_period_ticks[5]),
        .R(clear));
  FDRE \pending_period_ticks_reg[6] 
       (.C(s_axi_aclk),
        .CE(pending_valid),
        .D(Q[6]),
        .Q(pending_period_ticks[6]),
        .R(clear));
  FDRE \pending_period_ticks_reg[7] 
       (.C(s_axi_aclk),
        .CE(pending_valid),
        .D(Q[7]),
        .Q(pending_period_ticks[7]),
        .R(clear));
  FDRE \pending_period_ticks_reg[8] 
       (.C(s_axi_aclk),
        .CE(pending_valid),
        .D(Q[8]),
        .Q(pending_period_ticks[8]),
        .R(clear));
  FDRE \pending_period_ticks_reg[9] 
       (.C(s_axi_aclk),
        .CE(pending_valid),
        .D(Q[9]),
        .Q(pending_period_ticks[9]),
        .R(clear));
  LUT6 #(
    .INIT(64'h0808C80808080808)) 
    pending_valid_i_1
       (.I0(pending_valid),
        .I1(s_axi_aresetn),
        .I2(pending_valid_reg_n_0),
        .I3(pwm_enable),
        .I4(cycle_end0),
        .I5(running),
        .O(pending_valid_i_1_n_0));
  FDRE pending_valid_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(pending_valid_i_1_n_0),
        .Q(pending_valid_reg_n_0),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hE2000000)) 
    period_start_i_1
       (.I0(pwm_out1),
        .I1(running),
        .I2(cycle_end0),
        .I3(pwm_enable),
        .I4(s_axi_aresetn),
        .O(period_start_i_1_n_0));
  FDRE period_start_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(period_start_i_1_n_0),
        .Q(period_start_reg_0),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'hBF80)) 
    pwm_enable_i_1
       (.I0(commit_valid_reg[0]),
        .I1(\write_address_reg[2] ),
        .I2(pwm_enable_reg),
        .I3(pwm_enable),
        .O(\write_data_reg[0] ));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 pwm_out0_carry
       (.CI(1'b0),
        .CO({pwm_out0_carry_n_0,pwm_out0_carry_n_1,pwm_out0_carry_n_2,pwm_out0_carry_n_3}),
        .CYINIT(1'b0),
        .DI({pwm_out0_carry_i_1_n_0,pwm_out0_carry_i_2_n_0,pwm_out0_carry_i_3_n_0,pwm_out0_carry_i_4_n_0}),
        .O(NLW_pwm_out0_carry_O_UNCONNECTED[3:0]),
        .S({pwm_out0_carry_i_5_n_0,pwm_out0_carry_i_6_n_0,pwm_out0_carry_i_7_n_0,pwm_out0_carry_i_8_n_0}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 pwm_out0_carry__0
       (.CI(pwm_out0_carry_n_0),
        .CO({pwm_out0_carry__0_n_0,pwm_out0_carry__0_n_1,pwm_out0_carry__0_n_2,pwm_out0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({pwm_out0_carry__0_i_1_n_0,pwm_out0_carry__0_i_2_n_0,pwm_out0_carry__0_i_3_n_0,pwm_out0_carry__0_i_4_n_0}),
        .O(NLW_pwm_out0_carry__0_O_UNCONNECTED[3:0]),
        .S({pwm_out0_carry__0_i_5_n_0,pwm_out0_carry__0_i_6_n_0,pwm_out0_carry__0_i_7_n_0,pwm_out0_carry__0_i_8_n_0}));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm_out0_carry__0_i_1
       (.I0(active_high_ticks[14]),
        .I1(p_0_in[14]),
        .I2(p_0_in[15]),
        .I3(active_high_ticks[15]),
        .O(pwm_out0_carry__0_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 pwm_out0_carry__0_i_10
       (.CI(pwm_out0_carry_i_9_n_0),
        .CO({pwm_out0_carry__0_i_10_n_0,pwm_out0_carry__0_i_10_n_1,pwm_out0_carry__0_i_10_n_2,pwm_out0_carry__0_i_10_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_0_in[12:9]),
        .S(counter_reg[12:9]));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm_out0_carry__0_i_2
       (.I0(active_high_ticks[12]),
        .I1(p_0_in[12]),
        .I2(p_0_in[13]),
        .I3(active_high_ticks[13]),
        .O(pwm_out0_carry__0_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm_out0_carry__0_i_3
       (.I0(active_high_ticks[10]),
        .I1(p_0_in[10]),
        .I2(p_0_in[11]),
        .I3(active_high_ticks[11]),
        .O(pwm_out0_carry__0_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm_out0_carry__0_i_4
       (.I0(active_high_ticks[8]),
        .I1(p_0_in[8]),
        .I2(p_0_in[9]),
        .I3(active_high_ticks[9]),
        .O(pwm_out0_carry__0_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_out0_carry__0_i_5
       (.I0(p_0_in[15]),
        .I1(active_high_ticks[15]),
        .I2(p_0_in[14]),
        .I3(active_high_ticks[14]),
        .O(pwm_out0_carry__0_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_out0_carry__0_i_6
       (.I0(p_0_in[13]),
        .I1(active_high_ticks[13]),
        .I2(p_0_in[12]),
        .I3(active_high_ticks[12]),
        .O(pwm_out0_carry__0_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_out0_carry__0_i_7
       (.I0(p_0_in[11]),
        .I1(active_high_ticks[11]),
        .I2(p_0_in[10]),
        .I3(active_high_ticks[10]),
        .O(pwm_out0_carry__0_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_out0_carry__0_i_8
       (.I0(p_0_in[9]),
        .I1(active_high_ticks[9]),
        .I2(p_0_in[8]),
        .I3(active_high_ticks[8]),
        .O(pwm_out0_carry__0_i_8_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 pwm_out0_carry__0_i_9
       (.CI(pwm_out0_carry__0_i_10_n_0),
        .CO({pwm_out0_carry__0_i_9_n_0,pwm_out0_carry__0_i_9_n_1,pwm_out0_carry__0_i_9_n_2,pwm_out0_carry__0_i_9_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_0_in[16:13]),
        .S(counter_reg[16:13]));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 pwm_out0_carry__1
       (.CI(pwm_out0_carry__0_n_0),
        .CO({pwm_out0_carry__1_n_0,pwm_out0_carry__1_n_1,pwm_out0_carry__1_n_2,pwm_out0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({pwm_out0_carry__1_i_1_n_0,pwm_out0_carry__1_i_2_n_0,pwm_out0_carry__1_i_3_n_0,pwm_out0_carry__1_i_4_n_0}),
        .O(NLW_pwm_out0_carry__1_O_UNCONNECTED[3:0]),
        .S({pwm_out0_carry__1_i_5_n_0,pwm_out0_carry__1_i_6_n_0,pwm_out0_carry__1_i_7_n_0,pwm_out0_carry__1_i_8_n_0}));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm_out0_carry__1_i_1
       (.I0(active_high_ticks[22]),
        .I1(p_0_in[22]),
        .I2(p_0_in[23]),
        .I3(active_high_ticks[23]),
        .O(pwm_out0_carry__1_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 pwm_out0_carry__1_i_10
       (.CI(pwm_out0_carry__0_i_9_n_0),
        .CO({pwm_out0_carry__1_i_10_n_0,pwm_out0_carry__1_i_10_n_1,pwm_out0_carry__1_i_10_n_2,pwm_out0_carry__1_i_10_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_0_in[20:17]),
        .S(counter_reg[20:17]));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm_out0_carry__1_i_2
       (.I0(active_high_ticks[20]),
        .I1(p_0_in[20]),
        .I2(p_0_in[21]),
        .I3(active_high_ticks[21]),
        .O(pwm_out0_carry__1_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm_out0_carry__1_i_3
       (.I0(active_high_ticks[18]),
        .I1(p_0_in[18]),
        .I2(p_0_in[19]),
        .I3(active_high_ticks[19]),
        .O(pwm_out0_carry__1_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm_out0_carry__1_i_4
       (.I0(active_high_ticks[16]),
        .I1(p_0_in[16]),
        .I2(p_0_in[17]),
        .I3(active_high_ticks[17]),
        .O(pwm_out0_carry__1_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_out0_carry__1_i_5
       (.I0(p_0_in[23]),
        .I1(active_high_ticks[23]),
        .I2(p_0_in[22]),
        .I3(active_high_ticks[22]),
        .O(pwm_out0_carry__1_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_out0_carry__1_i_6
       (.I0(p_0_in[21]),
        .I1(active_high_ticks[21]),
        .I2(p_0_in[20]),
        .I3(active_high_ticks[20]),
        .O(pwm_out0_carry__1_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_out0_carry__1_i_7
       (.I0(p_0_in[19]),
        .I1(active_high_ticks[19]),
        .I2(p_0_in[18]),
        .I3(active_high_ticks[18]),
        .O(pwm_out0_carry__1_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_out0_carry__1_i_8
       (.I0(p_0_in[17]),
        .I1(active_high_ticks[17]),
        .I2(p_0_in[16]),
        .I3(active_high_ticks[16]),
        .O(pwm_out0_carry__1_i_8_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 pwm_out0_carry__1_i_9
       (.CI(pwm_out0_carry__1_i_10_n_0),
        .CO({pwm_out0_carry__1_i_9_n_0,pwm_out0_carry__1_i_9_n_1,pwm_out0_carry__1_i_9_n_2,pwm_out0_carry__1_i_9_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_0_in[24:21]),
        .S(counter_reg[24:21]));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 pwm_out0_carry__2
       (.CI(pwm_out0_carry__1_n_0),
        .CO({pwm_out0_carry__2_n_0,pwm_out0_carry__2_n_1,pwm_out0_carry__2_n_2,pwm_out0_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({pwm_out0_carry__2_i_1_n_0,pwm_out0_carry__2_i_2_n_0,pwm_out0_carry__2_i_3_n_0,pwm_out0_carry__2_i_4_n_0}),
        .O(NLW_pwm_out0_carry__2_O_UNCONNECTED[3:0]),
        .S({pwm_out0_carry__2_i_5_n_0,pwm_out0_carry__2_i_6_n_0,pwm_out0_carry__2_i_7_n_0,pwm_out0_carry__2_i_8_n_0}));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm_out0_carry__2_i_1
       (.I0(active_high_ticks[30]),
        .I1(p_0_in[30]),
        .I2(p_0_in[31]),
        .I3(active_high_ticks[31]),
        .O(pwm_out0_carry__2_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 pwm_out0_carry__2_i_10
       (.CI(pwm_out0_carry__1_i_9_n_0),
        .CO({pwm_out0_carry__2_i_10_n_0,pwm_out0_carry__2_i_10_n_1,pwm_out0_carry__2_i_10_n_2,pwm_out0_carry__2_i_10_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_0_in[28:25]),
        .S(counter_reg[28:25]));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm_out0_carry__2_i_2
       (.I0(active_high_ticks[28]),
        .I1(p_0_in[28]),
        .I2(p_0_in[29]),
        .I3(active_high_ticks[29]),
        .O(pwm_out0_carry__2_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm_out0_carry__2_i_3
       (.I0(active_high_ticks[26]),
        .I1(p_0_in[26]),
        .I2(p_0_in[27]),
        .I3(active_high_ticks[27]),
        .O(pwm_out0_carry__2_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm_out0_carry__2_i_4
       (.I0(active_high_ticks[24]),
        .I1(p_0_in[24]),
        .I2(p_0_in[25]),
        .I3(active_high_ticks[25]),
        .O(pwm_out0_carry__2_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_out0_carry__2_i_5
       (.I0(p_0_in[31]),
        .I1(active_high_ticks[31]),
        .I2(p_0_in[30]),
        .I3(active_high_ticks[30]),
        .O(pwm_out0_carry__2_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_out0_carry__2_i_6
       (.I0(p_0_in[29]),
        .I1(active_high_ticks[29]),
        .I2(p_0_in[28]),
        .I3(active_high_ticks[28]),
        .O(pwm_out0_carry__2_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_out0_carry__2_i_7
       (.I0(p_0_in[27]),
        .I1(active_high_ticks[27]),
        .I2(p_0_in[26]),
        .I3(active_high_ticks[26]),
        .O(pwm_out0_carry__2_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_out0_carry__2_i_8
       (.I0(p_0_in[25]),
        .I1(active_high_ticks[25]),
        .I2(p_0_in[24]),
        .I3(active_high_ticks[24]),
        .O(pwm_out0_carry__2_i_8_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 pwm_out0_carry__2_i_9
       (.CI(pwm_out0_carry__2_i_10_n_0),
        .CO({NLW_pwm_out0_carry__2_i_9_CO_UNCONNECTED[3:2],pwm_out0_carry__2_i_9_n_2,pwm_out0_carry__2_i_9_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_pwm_out0_carry__2_i_9_O_UNCONNECTED[3],p_0_in[31:29]}),
        .S({1'b0,counter_reg[31:29]}));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm_out0_carry_i_1
       (.I0(active_high_ticks[6]),
        .I1(p_0_in[6]),
        .I2(p_0_in[7]),
        .I3(active_high_ticks[7]),
        .O(pwm_out0_carry_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 pwm_out0_carry_i_10
       (.CI(1'b0),
        .CO({pwm_out0_carry_i_10_n_0,pwm_out0_carry_i_10_n_1,pwm_out0_carry_i_10_n_2,pwm_out0_carry_i_10_n_3}),
        .CYINIT(counter_reg[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_0_in[4:1]),
        .S(counter_reg[4:1]));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm_out0_carry_i_2
       (.I0(active_high_ticks[4]),
        .I1(p_0_in[4]),
        .I2(p_0_in[5]),
        .I3(active_high_ticks[5]),
        .O(pwm_out0_carry_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm_out0_carry_i_3
       (.I0(active_high_ticks[2]),
        .I1(p_0_in[2]),
        .I2(p_0_in[3]),
        .I3(active_high_ticks[3]),
        .O(pwm_out0_carry_i_3_n_0));
  LUT4 #(
    .INIT(16'h8F08)) 
    pwm_out0_carry_i_4
       (.I0(active_high_ticks[0]),
        .I1(counter_reg[0]),
        .I2(p_0_in[1]),
        .I3(active_high_ticks[1]),
        .O(pwm_out0_carry_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_out0_carry_i_5
       (.I0(p_0_in[7]),
        .I1(active_high_ticks[7]),
        .I2(p_0_in[6]),
        .I3(active_high_ticks[6]),
        .O(pwm_out0_carry_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_out0_carry_i_6
       (.I0(p_0_in[5]),
        .I1(active_high_ticks[5]),
        .I2(p_0_in[4]),
        .I3(active_high_ticks[4]),
        .O(pwm_out0_carry_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_out0_carry_i_7
       (.I0(p_0_in[3]),
        .I1(active_high_ticks[3]),
        .I2(p_0_in[2]),
        .I3(active_high_ticks[2]),
        .O(pwm_out0_carry_i_7_n_0));
  LUT4 #(
    .INIT(16'h0990)) 
    pwm_out0_carry_i_8
       (.I0(p_0_in[1]),
        .I1(active_high_ticks[1]),
        .I2(active_high_ticks[0]),
        .I3(counter_reg[0]),
        .O(pwm_out0_carry_i_8_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 pwm_out0_carry_i_9
       (.CI(pwm_out0_carry_i_10_n_0),
        .CO({pwm_out0_carry_i_9_n_0,pwm_out0_carry_i_9_n_1,pwm_out0_carry_i_9_n_2,pwm_out0_carry_i_9_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_0_in[8:5]),
        .S(counter_reg[8:5]));
  LUT6 #(
    .INIT(64'h00000000E2E2F000)) 
    pwm_out_i_1
       (.I0(pwm_out0_carry__2_n_0),
        .I1(cycle_end0),
        .I2(pwm_out_i_2_n_0),
        .I3(pwm_out1),
        .I4(running),
        .I5(pwm_out_i_4_n_0),
        .O(pwm_out_i_1_n_0));
  LUT4 #(
    .INIT(16'h8880)) 
    pwm_out_i_10
       (.I0(pwm_out_i_25_n_0),
        .I1(pwm_out_i_26_n_0),
        .I2(pwm_out_i_27_n_0),
        .I3(pwm_out_i_28_n_0),
        .O(pwm_out_i_10_n_0));
  LUT6 #(
    .INIT(64'h0044034700000000)) 
    pwm_out_i_11
       (.I0(pending_period_ticks[8]),
        .I1(pending_valid_reg_n_0),
        .I2(active_period_ticks[8]),
        .I3(pending_period_ticks[10]),
        .I4(active_period_ticks[10]),
        .I5(pwm_out_i_29_n_0),
        .O(pwm_out_i_11_n_0));
  LUT6 #(
    .INIT(64'h10101010000000F0)) 
    pwm_out_i_12
       (.I0(pending_period_ticks[13]),
        .I1(pending_period_ticks[12]),
        .I2(pwm_out_i_30_n_0),
        .I3(active_period_ticks[13]),
        .I4(active_period_ticks[12]),
        .I5(pending_valid_reg_n_0),
        .O(pwm_out_i_12_n_0));
  LUT4 #(
    .INIT(16'h8880)) 
    pwm_out_i_13
       (.I0(pwm_out_i_31_n_0),
        .I1(pwm_out_i_32_n_0),
        .I2(pwm_out_i_33_n_0),
        .I3(pwm_out_i_34_n_0),
        .O(pwm_out_i_13_n_0));
  LUT6 #(
    .INIT(64'h0044034700000000)) 
    pwm_out_i_14
       (.I0(pending_period_ticks[24]),
        .I1(pending_valid_reg_n_0),
        .I2(active_period_ticks[24]),
        .I3(pending_period_ticks[26]),
        .I4(active_period_ticks[26]),
        .I5(pwm_out_i_35_n_0),
        .O(pwm_out_i_14_n_0));
  LUT6 #(
    .INIT(64'h10101010000000F0)) 
    pwm_out_i_15
       (.I0(pending_period_ticks[29]),
        .I1(pending_period_ticks[28]),
        .I2(pwm_out_i_36_n_0),
        .I3(active_period_ticks[29]),
        .I4(active_period_ticks[28]),
        .I5(pending_valid_reg_n_0),
        .O(pwm_out_i_15_n_0));
  LUT4 #(
    .INIT(16'h8880)) 
    pwm_out_i_16
       (.I0(pwm_out_i_37_n_0),
        .I1(pwm_out_i_38_n_0),
        .I2(pwm_out_i_39_n_0),
        .I3(pwm_out_i_40_n_0),
        .O(pwm_out_i_16_n_0));
  LUT5 #(
    .INIT(32'h1010101F)) 
    pwm_out_i_17
       (.I0(pending_high_ticks[9]),
        .I1(pending_high_ticks[11]),
        .I2(pending_valid_reg_n_0),
        .I3(active_high_ticks[9]),
        .I4(active_high_ticks[11]),
        .O(pwm_out_i_17_n_0));
  LUT5 #(
    .INIT(32'h1010101F)) 
    pwm_out_i_18
       (.I0(pending_high_ticks[15]),
        .I1(pending_high_ticks[14]),
        .I2(pending_valid_reg_n_0),
        .I3(active_high_ticks[14]),
        .I4(active_high_ticks[15]),
        .O(pwm_out_i_18_n_0));
  LUT5 #(
    .INIT(32'h1010101F)) 
    pwm_out_i_19
       (.I0(pending_high_ticks[3]),
        .I1(pending_high_ticks[2]),
        .I2(pending_valid_reg_n_0),
        .I3(active_high_ticks[2]),
        .I4(active_high_ticks[3]),
        .O(pwm_out_i_19_n_0));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    pwm_out_i_2
       (.I0(pwm_out_i_5_n_0),
        .I1(pwm_out_i_6_n_0),
        .I2(pwm_out_i_7_n_0),
        .I3(pwm_out_i_8_n_0),
        .I4(pwm_out_i_9_n_0),
        .I5(pwm_out_i_10_n_0),
        .O(pwm_out_i_2_n_0));
  LUT5 #(
    .INIT(32'h1010101F)) 
    pwm_out_i_20
       (.I0(pending_high_ticks[7]),
        .I1(pending_high_ticks[6]),
        .I2(pending_valid_reg_n_0),
        .I3(active_high_ticks[6]),
        .I4(active_high_ticks[7]),
        .O(pwm_out_i_20_n_0));
  LUT5 #(
    .INIT(32'h00000001)) 
    pwm_out_i_21
       (.I0(pending_valid_reg_n_0),
        .I1(active_high_ticks[0]),
        .I2(active_high_ticks[1]),
        .I3(active_high_ticks[5]),
        .I4(active_high_ticks[4]),
        .O(pwm_out_i_21_n_0));
  LUT5 #(
    .INIT(32'h00000002)) 
    pwm_out_i_22
       (.I0(pending_valid_reg_n_0),
        .I1(pending_high_ticks[0]),
        .I2(pending_high_ticks[1]),
        .I3(pending_high_ticks[5]),
        .I4(pending_high_ticks[4]),
        .O(pwm_out_i_22_n_0));
  LUT5 #(
    .INIT(32'h1010101F)) 
    pwm_out_i_23
       (.I0(pending_high_ticks[25]),
        .I1(pending_high_ticks[27]),
        .I2(pending_valid_reg_n_0),
        .I3(active_high_ticks[25]),
        .I4(active_high_ticks[27]),
        .O(pwm_out_i_23_n_0));
  LUT5 #(
    .INIT(32'h1010101F)) 
    pwm_out_i_24
       (.I0(pending_high_ticks[30]),
        .I1(pending_high_ticks[31]),
        .I2(pending_valid_reg_n_0),
        .I3(active_high_ticks[31]),
        .I4(active_high_ticks[30]),
        .O(pwm_out_i_24_n_0));
  LUT5 #(
    .INIT(32'h1010101F)) 
    pwm_out_i_25
       (.I0(pending_high_ticks[19]),
        .I1(pending_high_ticks[18]),
        .I2(pending_valid_reg_n_0),
        .I3(active_high_ticks[18]),
        .I4(active_high_ticks[19]),
        .O(pwm_out_i_25_n_0));
  LUT5 #(
    .INIT(32'h1010101F)) 
    pwm_out_i_26
       (.I0(pending_high_ticks[23]),
        .I1(pending_high_ticks[22]),
        .I2(pending_valid_reg_n_0),
        .I3(active_high_ticks[22]),
        .I4(active_high_ticks[23]),
        .O(pwm_out_i_26_n_0));
  LUT5 #(
    .INIT(32'h00000001)) 
    pwm_out_i_27
       (.I0(pending_valid_reg_n_0),
        .I1(active_high_ticks[16]),
        .I2(active_high_ticks[17]),
        .I3(active_high_ticks[21]),
        .I4(active_high_ticks[20]),
        .O(pwm_out_i_27_n_0));
  LUT5 #(
    .INIT(32'h00000002)) 
    pwm_out_i_28
       (.I0(pending_valid_reg_n_0),
        .I1(pending_high_ticks[16]),
        .I2(pending_high_ticks[17]),
        .I3(pending_high_ticks[21]),
        .I4(pending_high_ticks[20]),
        .O(pwm_out_i_28_n_0));
  LUT5 #(
    .INIT(32'h1010101F)) 
    pwm_out_i_29
       (.I0(pending_period_ticks[9]),
        .I1(pending_period_ticks[11]),
        .I2(pending_valid_reg_n_0),
        .I3(active_period_ticks[9]),
        .I4(active_period_ticks[11]),
        .O(pwm_out_i_29_n_0));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    pwm_out_i_3
       (.I0(pwm_out_i_11_n_0),
        .I1(pwm_out_i_12_n_0),
        .I2(pwm_out_i_13_n_0),
        .I3(pwm_out_i_14_n_0),
        .I4(pwm_out_i_15_n_0),
        .I5(pwm_out_i_16_n_0),
        .O(pwm_out1));
  LUT5 #(
    .INIT(32'h1010101F)) 
    pwm_out_i_30
       (.I0(pending_period_ticks[15]),
        .I1(pending_period_ticks[14]),
        .I2(pending_valid_reg_n_0),
        .I3(active_period_ticks[14]),
        .I4(active_period_ticks[15]),
        .O(pwm_out_i_30_n_0));
  LUT5 #(
    .INIT(32'h1010101F)) 
    pwm_out_i_31
       (.I0(pending_period_ticks[3]),
        .I1(pending_period_ticks[2]),
        .I2(pending_valid_reg_n_0),
        .I3(active_period_ticks[2]),
        .I4(active_period_ticks[3]),
        .O(pwm_out_i_31_n_0));
  LUT5 #(
    .INIT(32'h1010101F)) 
    pwm_out_i_32
       (.I0(pending_period_ticks[7]),
        .I1(pending_period_ticks[6]),
        .I2(pending_valid_reg_n_0),
        .I3(active_period_ticks[6]),
        .I4(active_period_ticks[7]),
        .O(pwm_out_i_32_n_0));
  LUT5 #(
    .INIT(32'h00000001)) 
    pwm_out_i_33
       (.I0(pending_valid_reg_n_0),
        .I1(active_period_ticks[0]),
        .I2(active_period_ticks[1]),
        .I3(active_period_ticks[5]),
        .I4(active_period_ticks[4]),
        .O(pwm_out_i_33_n_0));
  LUT5 #(
    .INIT(32'h00000002)) 
    pwm_out_i_34
       (.I0(pending_valid_reg_n_0),
        .I1(pending_period_ticks[0]),
        .I2(pending_period_ticks[1]),
        .I3(pending_period_ticks[5]),
        .I4(pending_period_ticks[4]),
        .O(pwm_out_i_34_n_0));
  LUT5 #(
    .INIT(32'h1010101F)) 
    pwm_out_i_35
       (.I0(pending_period_ticks[25]),
        .I1(pending_period_ticks[27]),
        .I2(pending_valid_reg_n_0),
        .I3(active_period_ticks[25]),
        .I4(active_period_ticks[27]),
        .O(pwm_out_i_35_n_0));
  LUT5 #(
    .INIT(32'h1010101F)) 
    pwm_out_i_36
       (.I0(pending_period_ticks[30]),
        .I1(pending_period_ticks[31]),
        .I2(pending_valid_reg_n_0),
        .I3(active_period_ticks[31]),
        .I4(active_period_ticks[30]),
        .O(pwm_out_i_36_n_0));
  LUT5 #(
    .INIT(32'h1010101F)) 
    pwm_out_i_37
       (.I0(pending_period_ticks[19]),
        .I1(pending_period_ticks[18]),
        .I2(pending_valid_reg_n_0),
        .I3(active_period_ticks[18]),
        .I4(active_period_ticks[19]),
        .O(pwm_out_i_37_n_0));
  LUT5 #(
    .INIT(32'h1010101F)) 
    pwm_out_i_38
       (.I0(pending_period_ticks[23]),
        .I1(pending_period_ticks[22]),
        .I2(pending_valid_reg_n_0),
        .I3(active_period_ticks[22]),
        .I4(active_period_ticks[23]),
        .O(pwm_out_i_38_n_0));
  LUT5 #(
    .INIT(32'h00000001)) 
    pwm_out_i_39
       (.I0(pending_valid_reg_n_0),
        .I1(active_period_ticks[16]),
        .I2(active_period_ticks[17]),
        .I3(active_period_ticks[21]),
        .I4(active_period_ticks[20]),
        .O(pwm_out_i_39_n_0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h7)) 
    pwm_out_i_4
       (.I0(s_axi_aresetn),
        .I1(pwm_enable),
        .O(pwm_out_i_4_n_0));
  LUT5 #(
    .INIT(32'h00000002)) 
    pwm_out_i_40
       (.I0(pending_valid_reg_n_0),
        .I1(pending_period_ticks[16]),
        .I2(pending_period_ticks[17]),
        .I3(pending_period_ticks[21]),
        .I4(pending_period_ticks[20]),
        .O(pwm_out_i_40_n_0));
  LUT6 #(
    .INIT(64'h0044034700000000)) 
    pwm_out_i_5
       (.I0(pending_high_ticks[8]),
        .I1(pending_valid_reg_n_0),
        .I2(active_high_ticks[8]),
        .I3(pending_high_ticks[10]),
        .I4(active_high_ticks[10]),
        .I5(pwm_out_i_17_n_0),
        .O(pwm_out_i_5_n_0));
  LUT6 #(
    .INIT(64'h10101010000000F0)) 
    pwm_out_i_6
       (.I0(pending_high_ticks[13]),
        .I1(pending_high_ticks[12]),
        .I2(pwm_out_i_18_n_0),
        .I3(active_high_ticks[13]),
        .I4(active_high_ticks[12]),
        .I5(pending_valid_reg_n_0),
        .O(pwm_out_i_6_n_0));
  LUT4 #(
    .INIT(16'h8880)) 
    pwm_out_i_7
       (.I0(pwm_out_i_19_n_0),
        .I1(pwm_out_i_20_n_0),
        .I2(pwm_out_i_21_n_0),
        .I3(pwm_out_i_22_n_0),
        .O(pwm_out_i_7_n_0));
  LUT6 #(
    .INIT(64'h0044034700000000)) 
    pwm_out_i_8
       (.I0(pending_high_ticks[24]),
        .I1(pending_valid_reg_n_0),
        .I2(active_high_ticks[24]),
        .I3(pending_high_ticks[26]),
        .I4(active_high_ticks[26]),
        .I5(pwm_out_i_23_n_0),
        .O(pwm_out_i_8_n_0));
  LUT6 #(
    .INIT(64'h10101010000000F0)) 
    pwm_out_i_9
       (.I0(pending_high_ticks[29]),
        .I1(pending_high_ticks[28]),
        .I2(pwm_out_i_24_n_0),
        .I3(active_high_ticks[29]),
        .I4(active_high_ticks[28]),
        .I5(pending_valid_reg_n_0),
        .O(pwm_out_i_9_n_0));
  FDRE pwm_out_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(pwm_out_i_1_n_0),
        .Q(pwm_out),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hE000)) 
    running_i_1
       (.I0(running),
        .I1(pwm_out1),
        .I2(pwm_enable),
        .I3(s_axi_aresetn),
        .O(running_i_1_n_0));
  FDRE running_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(running_i_1_n_0),
        .Q(running),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \s_axi_bresp[1]_i_1 
       (.I0(s_axi_aresetn),
        .O(clear));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hFD)) 
    \s_axi_bresp[1]_i_11 
       (.I0(s_axi_aresetn),
        .I1(pending_valid_reg_n_0),
        .I2(cfg_error_reg_0),
        .O(p_1_in_0));
  LUT6 #(
    .INIT(64'hAAAEFFFFAAAE0000)) 
    \s_axi_bresp[1]_i_2 
       (.I0(\s_axi_bresp_reg[1]_1 ),
        .I1(s_axi_bresp1),
        .I2(\s_axi_bresp_reg[1]_2 [0]),
        .I3(\s_axi_bresp_reg[1]_2 [1]),
        .I4(address_pending0),
        .I5(s_axi_bresp),
        .O(\write_address_reg[2]_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAA0080)) 
    \s_axi_bresp[1]_i_4 
       (.I0(pwm_enable_reg_3),
        .I1(\s_axi_bresp_reg[1] ),
        .I2(\s_axi_bresp_reg[1]_0 ),
        .I3(pwm_enable_reg_1),
        .I4(p_1_in_0),
        .I5(CO),
        .O(s_axi_bresp1));
  LUT6 #(
    .INIT(64'hA0C0A0C0A0A0A0C0)) 
    \s_axi_rdata[0]_i_1 
       (.I0(\s_axi_rdata[0]_i_2_n_0 ),
        .I1(\s_axi_rdata[0]_i_3_n_0 ),
        .I2(\s_axi_rdata_reg[1] ),
        .I3(s_axi_araddr[1]),
        .I4(s_axi_araddr[4]),
        .I5(s_axi_araddr[0]),
        .O(D[0]));
  LUT5 #(
    .INIT(32'hFFCAF0CA)) 
    \s_axi_rdata[0]_i_2 
       (.I0(active_period_ticks[0]),
        .I1(cycle_count_reg[0]),
        .I2(s_axi_araddr[3]),
        .I3(s_axi_araddr[2]),
        .I4(active_high_ticks[0]),
        .O(\s_axi_rdata[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s_axi_rdata[0]_i_3 
       (.I0(\s_axi_rdata_reg[31]_0 [0]),
        .I1(running),
        .I2(s_axi_araddr[2]),
        .I3(s_axi_araddr[3]),
        .I4(pwm_enable),
        .I5(\s_axi_rdata_reg[31] [0]),
        .O(\s_axi_rdata[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \s_axi_rdata[10]_i_1 
       (.I0(\s_axi_rdata_reg[1] ),
        .I1(\s_axi_rdata[10]_i_2_n_0 ),
        .I2(\s_axi_rdata_reg[31]_0 [8]),
        .I3(\s_axi_rdata_reg[4] ),
        .I4(\s_axi_rdata_reg[31] [8]),
        .I5(\s_axi_rdata_reg[4]_0 ),
        .O(D[10]));
  LUT6 #(
    .INIT(64'hFBCBF8C800000000)) 
    \s_axi_rdata[10]_i_2 
       (.I0(active_high_ticks[10]),
        .I1(s_axi_araddr[2]),
        .I2(s_axi_araddr[3]),
        .I3(cycle_count_reg[10]),
        .I4(active_period_ticks[10]),
        .I5(\s_axi_rdata_reg[4]_1 ),
        .O(\s_axi_rdata[10]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \s_axi_rdata[11]_i_1 
       (.I0(\s_axi_rdata_reg[1] ),
        .I1(\s_axi_rdata[11]_i_2_n_0 ),
        .I2(\s_axi_rdata_reg[31]_0 [9]),
        .I3(\s_axi_rdata_reg[4] ),
        .I4(\s_axi_rdata_reg[31] [9]),
        .I5(\s_axi_rdata_reg[4]_0 ),
        .O(D[11]));
  LUT6 #(
    .INIT(64'hFBCBF8C800000000)) 
    \s_axi_rdata[11]_i_2 
       (.I0(active_high_ticks[11]),
        .I1(s_axi_araddr[2]),
        .I2(s_axi_araddr[3]),
        .I3(cycle_count_reg[11]),
        .I4(active_period_ticks[11]),
        .I5(\s_axi_rdata_reg[4]_1 ),
        .O(\s_axi_rdata[11]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \s_axi_rdata[12]_i_1 
       (.I0(\s_axi_rdata_reg[1] ),
        .I1(\s_axi_rdata[12]_i_2_n_0 ),
        .I2(\s_axi_rdata_reg[31]_0 [10]),
        .I3(\s_axi_rdata_reg[4] ),
        .I4(\s_axi_rdata_reg[31] [10]),
        .I5(\s_axi_rdata_reg[4]_0 ),
        .O(D[12]));
  LUT6 #(
    .INIT(64'h7351624000000000)) 
    \s_axi_rdata[12]_i_2 
       (.I0(s_axi_araddr[3]),
        .I1(s_axi_araddr[2]),
        .I2(active_high_ticks[12]),
        .I3(cycle_count_reg[12]),
        .I4(active_period_ticks[12]),
        .I5(\s_axi_rdata_reg[4]_1 ),
        .O(\s_axi_rdata[12]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \s_axi_rdata[13]_i_1 
       (.I0(\s_axi_rdata_reg[1] ),
        .I1(\s_axi_rdata[13]_i_2_n_0 ),
        .I2(\s_axi_rdata_reg[31]_0 [11]),
        .I3(\s_axi_rdata_reg[4] ),
        .I4(\s_axi_rdata_reg[31] [11]),
        .I5(\s_axi_rdata_reg[4]_0 ),
        .O(D[13]));
  LUT6 #(
    .INIT(64'h7351624000000000)) 
    \s_axi_rdata[13]_i_2 
       (.I0(s_axi_araddr[3]),
        .I1(s_axi_araddr[2]),
        .I2(active_high_ticks[13]),
        .I3(cycle_count_reg[13]),
        .I4(active_period_ticks[13]),
        .I5(\s_axi_rdata_reg[4]_1 ),
        .O(\s_axi_rdata[13]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \s_axi_rdata[14]_i_1 
       (.I0(\s_axi_rdata_reg[1] ),
        .I1(\s_axi_rdata[14]_i_2_n_0 ),
        .I2(\s_axi_rdata_reg[31]_0 [12]),
        .I3(\s_axi_rdata_reg[4] ),
        .I4(\s_axi_rdata_reg[31] [12]),
        .I5(\s_axi_rdata_reg[4]_0 ),
        .O(D[14]));
  LUT6 #(
    .INIT(64'hFBCBF8C800000000)) 
    \s_axi_rdata[14]_i_2 
       (.I0(active_high_ticks[14]),
        .I1(s_axi_araddr[2]),
        .I2(s_axi_araddr[3]),
        .I3(cycle_count_reg[14]),
        .I4(active_period_ticks[14]),
        .I5(\s_axi_rdata_reg[4]_1 ),
        .O(\s_axi_rdata[14]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \s_axi_rdata[15]_i_1 
       (.I0(\s_axi_rdata_reg[1] ),
        .I1(\s_axi_rdata[15]_i_2_n_0 ),
        .I2(\s_axi_rdata_reg[31]_0 [13]),
        .I3(\s_axi_rdata_reg[4] ),
        .I4(\s_axi_rdata_reg[31] [13]),
        .I5(\s_axi_rdata_reg[4]_0 ),
        .O(D[15]));
  LUT6 #(
    .INIT(64'h7351624000000000)) 
    \s_axi_rdata[15]_i_2 
       (.I0(s_axi_araddr[3]),
        .I1(s_axi_araddr[2]),
        .I2(active_high_ticks[15]),
        .I3(cycle_count_reg[15]),
        .I4(active_period_ticks[15]),
        .I5(\s_axi_rdata_reg[4]_1 ),
        .O(\s_axi_rdata[15]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \s_axi_rdata[16]_i_1 
       (.I0(\s_axi_rdata_reg[1] ),
        .I1(\s_axi_rdata[16]_i_2_n_0 ),
        .I2(\s_axi_rdata_reg[31]_0 [14]),
        .I3(\s_axi_rdata_reg[4] ),
        .I4(\s_axi_rdata_reg[31] [14]),
        .I5(\s_axi_rdata_reg[4]_0 ),
        .O(D[16]));
  LUT6 #(
    .INIT(64'hFBCBF8C800000000)) 
    \s_axi_rdata[16]_i_2 
       (.I0(active_high_ticks[16]),
        .I1(s_axi_araddr[2]),
        .I2(s_axi_araddr[3]),
        .I3(cycle_count_reg[16]),
        .I4(active_period_ticks[16]),
        .I5(\s_axi_rdata_reg[4]_1 ),
        .O(\s_axi_rdata[16]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \s_axi_rdata[17]_i_1 
       (.I0(\s_axi_rdata_reg[1] ),
        .I1(\s_axi_rdata[17]_i_2_n_0 ),
        .I2(\s_axi_rdata_reg[31]_0 [15]),
        .I3(\s_axi_rdata_reg[4] ),
        .I4(\s_axi_rdata_reg[31] [15]),
        .I5(\s_axi_rdata_reg[4]_0 ),
        .O(D[17]));
  LUT6 #(
    .INIT(64'hFBCBF8C800000000)) 
    \s_axi_rdata[17]_i_2 
       (.I0(active_high_ticks[17]),
        .I1(s_axi_araddr[2]),
        .I2(s_axi_araddr[3]),
        .I3(cycle_count_reg[17]),
        .I4(active_period_ticks[17]),
        .I5(\s_axi_rdata_reg[4]_1 ),
        .O(\s_axi_rdata[17]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \s_axi_rdata[18]_i_1 
       (.I0(\s_axi_rdata_reg[1] ),
        .I1(\s_axi_rdata[18]_i_2_n_0 ),
        .I2(\s_axi_rdata_reg[31]_0 [16]),
        .I3(\s_axi_rdata_reg[4] ),
        .I4(\s_axi_rdata_reg[31] [16]),
        .I5(\s_axi_rdata_reg[4]_0 ),
        .O(D[18]));
  LUT6 #(
    .INIT(64'hFBCBF8C800000000)) 
    \s_axi_rdata[18]_i_2 
       (.I0(active_high_ticks[18]),
        .I1(s_axi_araddr[2]),
        .I2(s_axi_araddr[3]),
        .I3(cycle_count_reg[18]),
        .I4(active_period_ticks[18]),
        .I5(\s_axi_rdata_reg[4]_1 ),
        .O(\s_axi_rdata[18]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \s_axi_rdata[19]_i_1 
       (.I0(\s_axi_rdata_reg[1] ),
        .I1(\s_axi_rdata[19]_i_2_n_0 ),
        .I2(\s_axi_rdata_reg[31]_0 [17]),
        .I3(\s_axi_rdata_reg[4] ),
        .I4(\s_axi_rdata_reg[31] [17]),
        .I5(\s_axi_rdata_reg[4]_0 ),
        .O(D[19]));
  LUT6 #(
    .INIT(64'h7351624000000000)) 
    \s_axi_rdata[19]_i_2 
       (.I0(s_axi_araddr[3]),
        .I1(s_axi_araddr[2]),
        .I2(active_high_ticks[19]),
        .I3(cycle_count_reg[19]),
        .I4(active_period_ticks[19]),
        .I5(\s_axi_rdata_reg[4]_1 ),
        .O(\s_axi_rdata[19]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hA0C0A0C0A0A0A0C0)) 
    \s_axi_rdata[1]_i_1 
       (.I0(\s_axi_rdata[1]_i_2_n_0 ),
        .I1(\s_axi_rdata[1]_i_3_n_0 ),
        .I2(\s_axi_rdata_reg[1] ),
        .I3(s_axi_araddr[1]),
        .I4(s_axi_araddr[4]),
        .I5(s_axi_araddr[0]),
        .O(D[1]));
  LUT5 #(
    .INIT(32'h00CCF0AA)) 
    \s_axi_rdata[1]_i_2 
       (.I0(active_period_ticks[1]),
        .I1(cycle_count_reg[1]),
        .I2(active_high_ticks[1]),
        .I3(s_axi_araddr[2]),
        .I4(s_axi_araddr[3]),
        .O(\s_axi_rdata[1]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hF0CCAA00)) 
    \s_axi_rdata[1]_i_3 
       (.I0(\s_axi_rdata_reg[31] [1]),
        .I1(\s_axi_rdata_reg[31]_0 [1]),
        .I2(p_1_in_0),
        .I3(s_axi_araddr[3]),
        .I4(s_axi_araddr[2]),
        .O(\s_axi_rdata[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \s_axi_rdata[20]_i_1 
       (.I0(\s_axi_rdata_reg[1] ),
        .I1(\s_axi_rdata[20]_i_2_n_0 ),
        .I2(\s_axi_rdata_reg[31]_0 [18]),
        .I3(\s_axi_rdata_reg[4] ),
        .I4(\s_axi_rdata_reg[31] [18]),
        .I5(\s_axi_rdata_reg[4]_0 ),
        .O(D[20]));
  LUT6 #(
    .INIT(64'hFBCBF8C800000000)) 
    \s_axi_rdata[20]_i_2 
       (.I0(active_high_ticks[20]),
        .I1(s_axi_araddr[2]),
        .I2(s_axi_araddr[3]),
        .I3(cycle_count_reg[20]),
        .I4(active_period_ticks[20]),
        .I5(\s_axi_rdata_reg[4]_1 ),
        .O(\s_axi_rdata[20]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \s_axi_rdata[21]_i_1 
       (.I0(\s_axi_rdata_reg[1] ),
        .I1(\s_axi_rdata[21]_i_2_n_0 ),
        .I2(\s_axi_rdata_reg[31]_0 [19]),
        .I3(\s_axi_rdata_reg[4] ),
        .I4(\s_axi_rdata_reg[31] [19]),
        .I5(\s_axi_rdata_reg[4]_0 ),
        .O(D[21]));
  LUT6 #(
    .INIT(64'h7351624000000000)) 
    \s_axi_rdata[21]_i_2 
       (.I0(s_axi_araddr[3]),
        .I1(s_axi_araddr[2]),
        .I2(active_high_ticks[21]),
        .I3(cycle_count_reg[21]),
        .I4(active_period_ticks[21]),
        .I5(\s_axi_rdata_reg[4]_1 ),
        .O(\s_axi_rdata[21]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \s_axi_rdata[22]_i_1 
       (.I0(\s_axi_rdata_reg[1] ),
        .I1(\s_axi_rdata[22]_i_2_n_0 ),
        .I2(\s_axi_rdata_reg[31]_0 [20]),
        .I3(\s_axi_rdata_reg[4] ),
        .I4(\s_axi_rdata_reg[31] [20]),
        .I5(\s_axi_rdata_reg[4]_0 ),
        .O(D[22]));
  LUT6 #(
    .INIT(64'hFBCBF8C800000000)) 
    \s_axi_rdata[22]_i_2 
       (.I0(active_high_ticks[22]),
        .I1(s_axi_araddr[2]),
        .I2(s_axi_araddr[3]),
        .I3(cycle_count_reg[22]),
        .I4(active_period_ticks[22]),
        .I5(\s_axi_rdata_reg[4]_1 ),
        .O(\s_axi_rdata[22]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \s_axi_rdata[23]_i_1 
       (.I0(\s_axi_rdata_reg[1] ),
        .I1(\s_axi_rdata[23]_i_2_n_0 ),
        .I2(\s_axi_rdata_reg[31]_0 [21]),
        .I3(\s_axi_rdata_reg[4] ),
        .I4(\s_axi_rdata_reg[31] [21]),
        .I5(\s_axi_rdata_reg[4]_0 ),
        .O(D[23]));
  LUT6 #(
    .INIT(64'h7351624000000000)) 
    \s_axi_rdata[23]_i_2 
       (.I0(s_axi_araddr[3]),
        .I1(s_axi_araddr[2]),
        .I2(active_high_ticks[23]),
        .I3(cycle_count_reg[23]),
        .I4(active_period_ticks[23]),
        .I5(\s_axi_rdata_reg[4]_1 ),
        .O(\s_axi_rdata[23]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \s_axi_rdata[24]_i_1 
       (.I0(\s_axi_rdata_reg[1] ),
        .I1(\s_axi_rdata[24]_i_2_n_0 ),
        .I2(\s_axi_rdata_reg[31]_0 [22]),
        .I3(\s_axi_rdata_reg[4] ),
        .I4(\s_axi_rdata_reg[31] [22]),
        .I5(\s_axi_rdata_reg[4]_0 ),
        .O(D[24]));
  LUT6 #(
    .INIT(64'h7351624000000000)) 
    \s_axi_rdata[24]_i_2 
       (.I0(s_axi_araddr[3]),
        .I1(s_axi_araddr[2]),
        .I2(active_high_ticks[24]),
        .I3(cycle_count_reg[24]),
        .I4(active_period_ticks[24]),
        .I5(\s_axi_rdata_reg[4]_1 ),
        .O(\s_axi_rdata[24]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \s_axi_rdata[25]_i_1 
       (.I0(\s_axi_rdata_reg[1] ),
        .I1(\s_axi_rdata[25]_i_2_n_0 ),
        .I2(\s_axi_rdata_reg[31]_0 [23]),
        .I3(\s_axi_rdata_reg[4] ),
        .I4(\s_axi_rdata_reg[31] [23]),
        .I5(\s_axi_rdata_reg[4]_0 ),
        .O(D[25]));
  LUT6 #(
    .INIT(64'h7351624000000000)) 
    \s_axi_rdata[25]_i_2 
       (.I0(s_axi_araddr[3]),
        .I1(s_axi_araddr[2]),
        .I2(active_high_ticks[25]),
        .I3(cycle_count_reg[25]),
        .I4(active_period_ticks[25]),
        .I5(\s_axi_rdata_reg[4]_1 ),
        .O(\s_axi_rdata[25]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \s_axi_rdata[26]_i_1 
       (.I0(\s_axi_rdata_reg[1] ),
        .I1(\s_axi_rdata[26]_i_2_n_0 ),
        .I2(\s_axi_rdata_reg[31]_0 [24]),
        .I3(\s_axi_rdata_reg[4] ),
        .I4(\s_axi_rdata_reg[31] [24]),
        .I5(\s_axi_rdata_reg[4]_0 ),
        .O(D[26]));
  LUT6 #(
    .INIT(64'h7351624000000000)) 
    \s_axi_rdata[26]_i_2 
       (.I0(s_axi_araddr[3]),
        .I1(s_axi_araddr[2]),
        .I2(active_high_ticks[26]),
        .I3(cycle_count_reg[26]),
        .I4(active_period_ticks[26]),
        .I5(\s_axi_rdata_reg[4]_1 ),
        .O(\s_axi_rdata[26]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \s_axi_rdata[27]_i_1 
       (.I0(\s_axi_rdata_reg[1] ),
        .I1(\s_axi_rdata[27]_i_2_n_0 ),
        .I2(\s_axi_rdata_reg[31]_0 [25]),
        .I3(\s_axi_rdata_reg[4] ),
        .I4(\s_axi_rdata_reg[31] [25]),
        .I5(\s_axi_rdata_reg[4]_0 ),
        .O(D[27]));
  LUT6 #(
    .INIT(64'h7351624000000000)) 
    \s_axi_rdata[27]_i_2 
       (.I0(s_axi_araddr[3]),
        .I1(s_axi_araddr[2]),
        .I2(active_high_ticks[27]),
        .I3(cycle_count_reg[27]),
        .I4(active_period_ticks[27]),
        .I5(\s_axi_rdata_reg[4]_1 ),
        .O(\s_axi_rdata[27]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \s_axi_rdata[28]_i_1 
       (.I0(\s_axi_rdata_reg[1] ),
        .I1(\s_axi_rdata[28]_i_2_n_0 ),
        .I2(\s_axi_rdata_reg[31]_0 [26]),
        .I3(\s_axi_rdata_reg[4] ),
        .I4(\s_axi_rdata_reg[31] [26]),
        .I5(\s_axi_rdata_reg[4]_0 ),
        .O(D[28]));
  LUT6 #(
    .INIT(64'hFBCBF8C800000000)) 
    \s_axi_rdata[28]_i_2 
       (.I0(active_high_ticks[28]),
        .I1(s_axi_araddr[2]),
        .I2(s_axi_araddr[3]),
        .I3(cycle_count_reg[28]),
        .I4(active_period_ticks[28]),
        .I5(\s_axi_rdata_reg[4]_1 ),
        .O(\s_axi_rdata[28]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \s_axi_rdata[29]_i_1 
       (.I0(\s_axi_rdata_reg[1] ),
        .I1(\s_axi_rdata[29]_i_2_n_0 ),
        .I2(\s_axi_rdata_reg[31]_0 [27]),
        .I3(\s_axi_rdata_reg[4] ),
        .I4(\s_axi_rdata_reg[31] [27]),
        .I5(\s_axi_rdata_reg[4]_0 ),
        .O(D[29]));
  LUT6 #(
    .INIT(64'h7351624000000000)) 
    \s_axi_rdata[29]_i_2 
       (.I0(s_axi_araddr[3]),
        .I1(s_axi_araddr[2]),
        .I2(active_high_ticks[29]),
        .I3(cycle_count_reg[29]),
        .I4(active_period_ticks[29]),
        .I5(\s_axi_rdata_reg[4]_1 ),
        .O(\s_axi_rdata[29]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hA0C0A0C0A0A0A0C0)) 
    \s_axi_rdata[2]_i_1 
       (.I0(\s_axi_rdata[2]_i_2_n_0 ),
        .I1(\s_axi_rdata_reg[2] ),
        .I2(\s_axi_rdata_reg[1] ),
        .I3(s_axi_araddr[1]),
        .I4(s_axi_araddr[4]),
        .I5(s_axi_araddr[0]),
        .O(D[2]));
  LUT5 #(
    .INIT(32'h00CCF0AA)) 
    \s_axi_rdata[2]_i_2 
       (.I0(active_period_ticks[2]),
        .I1(cycle_count_reg[2]),
        .I2(active_high_ticks[2]),
        .I3(s_axi_araddr[2]),
        .I4(s_axi_araddr[3]),
        .O(\s_axi_rdata[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \s_axi_rdata[30]_i_1 
       (.I0(\s_axi_rdata_reg[1] ),
        .I1(\s_axi_rdata[30]_i_2_n_0 ),
        .I2(\s_axi_rdata_reg[31]_0 [28]),
        .I3(\s_axi_rdata_reg[4] ),
        .I4(\s_axi_rdata_reg[31] [28]),
        .I5(\s_axi_rdata_reg[4]_0 ),
        .O(D[30]));
  LUT6 #(
    .INIT(64'hFBCBF8C800000000)) 
    \s_axi_rdata[30]_i_2 
       (.I0(active_high_ticks[30]),
        .I1(s_axi_araddr[2]),
        .I2(s_axi_araddr[3]),
        .I3(cycle_count_reg[30]),
        .I4(active_period_ticks[30]),
        .I5(\s_axi_rdata_reg[4]_1 ),
        .O(\s_axi_rdata[30]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \s_axi_rdata[31]_i_2 
       (.I0(\s_axi_rdata_reg[1] ),
        .I1(\s_axi_rdata[31]_i_4_n_0 ),
        .I2(\s_axi_rdata_reg[31]_0 [29]),
        .I3(\s_axi_rdata_reg[4] ),
        .I4(\s_axi_rdata_reg[31] [29]),
        .I5(\s_axi_rdata_reg[4]_0 ),
        .O(D[31]));
  LUT6 #(
    .INIT(64'h7351624000000000)) 
    \s_axi_rdata[31]_i_4 
       (.I0(s_axi_araddr[3]),
        .I1(s_axi_araddr[2]),
        .I2(active_high_ticks[31]),
        .I3(cycle_count_reg[31]),
        .I4(active_period_ticks[31]),
        .I5(\s_axi_rdata_reg[4]_1 ),
        .O(\s_axi_rdata[31]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hA0C0A0C0A0A0A0C0)) 
    \s_axi_rdata[3]_i_1 
       (.I0(\s_axi_rdata[3]_i_2_n_0 ),
        .I1(\s_axi_rdata_reg[3] ),
        .I2(\s_axi_rdata_reg[1] ),
        .I3(s_axi_araddr[1]),
        .I4(s_axi_araddr[4]),
        .I5(s_axi_araddr[0]),
        .O(D[3]));
  LUT5 #(
    .INIT(32'h00CCF0AA)) 
    \s_axi_rdata[3]_i_2 
       (.I0(active_period_ticks[3]),
        .I1(cycle_count_reg[3]),
        .I2(active_high_ticks[3]),
        .I3(s_axi_araddr[2]),
        .I4(s_axi_araddr[3]),
        .O(\s_axi_rdata[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \s_axi_rdata[4]_i_1 
       (.I0(\s_axi_rdata_reg[1] ),
        .I1(\s_axi_rdata[4]_i_2_n_0 ),
        .I2(\s_axi_rdata_reg[31]_0 [2]),
        .I3(\s_axi_rdata_reg[4] ),
        .I4(\s_axi_rdata_reg[31] [2]),
        .I5(\s_axi_rdata_reg[4]_0 ),
        .O(D[4]));
  LUT6 #(
    .INIT(64'hFBCBF8C800000000)) 
    \s_axi_rdata[4]_i_2 
       (.I0(active_high_ticks[4]),
        .I1(s_axi_araddr[2]),
        .I2(s_axi_araddr[3]),
        .I3(cycle_count_reg[4]),
        .I4(active_period_ticks[4]),
        .I5(\s_axi_rdata_reg[4]_1 ),
        .O(\s_axi_rdata[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \s_axi_rdata[5]_i_1 
       (.I0(\s_axi_rdata_reg[1] ),
        .I1(\s_axi_rdata[5]_i_2_n_0 ),
        .I2(\s_axi_rdata_reg[31]_0 [3]),
        .I3(\s_axi_rdata_reg[4] ),
        .I4(\s_axi_rdata_reg[31] [3]),
        .I5(\s_axi_rdata_reg[4]_0 ),
        .O(D[5]));
  LUT6 #(
    .INIT(64'hFBCBF8C800000000)) 
    \s_axi_rdata[5]_i_2 
       (.I0(active_high_ticks[5]),
        .I1(s_axi_araddr[2]),
        .I2(s_axi_araddr[3]),
        .I3(cycle_count_reg[5]),
        .I4(active_period_ticks[5]),
        .I5(\s_axi_rdata_reg[4]_1 ),
        .O(\s_axi_rdata[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \s_axi_rdata[6]_i_1 
       (.I0(\s_axi_rdata_reg[1] ),
        .I1(\s_axi_rdata[6]_i_2_n_0 ),
        .I2(\s_axi_rdata_reg[31]_0 [4]),
        .I3(\s_axi_rdata_reg[4] ),
        .I4(\s_axi_rdata_reg[31] [4]),
        .I5(\s_axi_rdata_reg[4]_0 ),
        .O(D[6]));
  LUT6 #(
    .INIT(64'h7351624000000000)) 
    \s_axi_rdata[6]_i_2 
       (.I0(s_axi_araddr[3]),
        .I1(s_axi_araddr[2]),
        .I2(active_high_ticks[6]),
        .I3(cycle_count_reg[6]),
        .I4(active_period_ticks[6]),
        .I5(\s_axi_rdata_reg[4]_1 ),
        .O(\s_axi_rdata[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \s_axi_rdata[7]_i_1 
       (.I0(\s_axi_rdata_reg[1] ),
        .I1(\s_axi_rdata[7]_i_2_n_0 ),
        .I2(\s_axi_rdata_reg[31]_0 [5]),
        .I3(\s_axi_rdata_reg[4] ),
        .I4(\s_axi_rdata_reg[31] [5]),
        .I5(\s_axi_rdata_reg[4]_0 ),
        .O(D[7]));
  LUT6 #(
    .INIT(64'h7351624000000000)) 
    \s_axi_rdata[7]_i_2 
       (.I0(s_axi_araddr[3]),
        .I1(s_axi_araddr[2]),
        .I2(active_high_ticks[7]),
        .I3(cycle_count_reg[7]),
        .I4(active_period_ticks[7]),
        .I5(\s_axi_rdata_reg[4]_1 ),
        .O(\s_axi_rdata[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \s_axi_rdata[8]_i_1 
       (.I0(\s_axi_rdata_reg[1] ),
        .I1(\s_axi_rdata[8]_i_2_n_0 ),
        .I2(\s_axi_rdata_reg[31]_0 [6]),
        .I3(\s_axi_rdata_reg[4] ),
        .I4(\s_axi_rdata_reg[31] [6]),
        .I5(\s_axi_rdata_reg[4]_0 ),
        .O(D[8]));
  LUT6 #(
    .INIT(64'hFBCBF8C800000000)) 
    \s_axi_rdata[8]_i_2 
       (.I0(active_high_ticks[8]),
        .I1(s_axi_araddr[2]),
        .I2(s_axi_araddr[3]),
        .I3(cycle_count_reg[8]),
        .I4(active_period_ticks[8]),
        .I5(\s_axi_rdata_reg[4]_1 ),
        .O(\s_axi_rdata[8]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \s_axi_rdata[9]_i_1 
       (.I0(\s_axi_rdata_reg[1] ),
        .I1(\s_axi_rdata[9]_i_2_n_0 ),
        .I2(\s_axi_rdata_reg[31]_0 [7]),
        .I3(\s_axi_rdata_reg[4] ),
        .I4(\s_axi_rdata_reg[31] [7]),
        .I5(\s_axi_rdata_reg[4]_0 ),
        .O(D[9]));
  LUT6 #(
    .INIT(64'h7351624000000000)) 
    \s_axi_rdata[9]_i_2 
       (.I0(s_axi_araddr[3]),
        .I1(s_axi_araddr[2]),
        .I2(active_high_ticks[9]),
        .I3(cycle_count_reg[9]),
        .I4(active_period_ticks[9]),
        .I5(\s_axi_rdata_reg[4]_1 ),
        .O(\s_axi_rdata[9]_i_2_n_0 ));
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
