// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
// Date        : Thu Oct 22 00:37:11 2026
// Host        : xiaojun running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/33525/FDW_NEXT/outputs/lxb110_a2/p/generated_system/ip/system_finite_pwm_0/system_finite_pwm_0_sim_netlist.v
// Design      : system_finite_pwm_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "system_finite_pwm_0,fdw_pwm_burst_axi,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "fdw_pwm_burst_axi,Vivado 2025.1" *) 
(* NotValidForBitStream *)
module system_finite_pwm_0
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
    burst_start,
    done_event,
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
  output burst_start;
  output done_event;
  output activity;

  wire \<const0> ;
  wire activity;
  wire burst_start;
  wire done_event;
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
  system_finite_pwm_0_fdw_pwm_burst_axi inst
       (.burst_start(burst_start),
        .done_event(done_event),
        .launch_valid_reg_0(activity),
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

(* ORIG_REF_NAME = "fdw_pwm_burst" *) 
module system_finite_pwm_0_fdw_pwm_burst
   (SR,
    pwm_out,
    period_start,
    done_event,
    \write_address_reg[3] ,
    \write_address_reg[3]_0 ,
    launch_valid_reg,
    \write_address_reg[3]_1 ,
    \write_address_reg[3]_2 ,
    E,
    D,
    burst_start,
    \s_axi_bresp_reg[1] ,
    \write_address_reg[2] ,
    s_axi_aclk,
    s_axi_aresetn,
    \counter_reg[0]_0 ,
    Q,
    \error_sticky_reg[2] ,
    \error_sticky_reg[1] ,
    \error_sticky_reg[1]_0 ,
    \error_sticky_reg[1]_1 ,
    \error_sticky_reg[1]_2 ,
    \error_sticky_reg[1]_3 ,
    \error_sticky_reg[1]_4 ,
    \error_sticky_reg[2]_0 ,
    done_sticky_reg,
    done_sticky_reg_0,
    data1,
    cancelled_sticky_reg,
    cfg_error_reg_0,
    \active_period_ticks_reg[31]_0 ,
    \active_period_count_reg[31]_0 ,
    \s_axi_bresp_reg[1]_0 ,
    \s_axi_bresp_reg[1]_1 ,
    address_pending0,
    \launch_count_reg[0] ,
    \launch_count_reg[0]_0 ,
    cancelled_sticky_reg_0,
    CO,
    \s_axi_bresp[1]_i_4_0 ,
    \s_axi_bresp[1]_i_4_1 ,
    \s_axi_bresp[1]_i_4_2 ,
    \s_axi_bresp[1]_i_4_3 ,
    \s_axi_rdata_reg[1] ,
    \s_axi_rdata_reg[1]_0 ,
    \s_axi_rdata_reg[1]_1 ,
    \s_axi_rdata_reg[1]_2 ,
    \active_high_ticks_reg[31]_0 ,
    \s_axi_rdata_reg[3] ,
    \s_axi_rdata_reg[4] ,
    \s_axi_rdata_reg[5] ,
    \s_axi_rdata_reg[5]_0 ,
    \s_axi_rdata_reg[6] ,
    \s_axi_rdata_reg[7] ,
    \s_axi_rdata_reg[8] ,
    \s_axi_rdata_reg[8]_0 ,
    \s_axi_rdata_reg[9] ,
    \s_axi_rdata_reg[9]_0 ,
    \s_axi_rdata_reg[9]_1 ,
    \s_axi_rdata_reg[10] ,
    \s_axi_rdata_reg[11] ,
    \s_axi_rdata_reg[12] ,
    \s_axi_rdata_reg[12]_0 ,
    \s_axi_rdata_reg[13] ,
    \s_axi_rdata_reg[14] ,
    \s_axi_rdata_reg[15] ,
    \s_axi_rdata_reg[16] ,
    \s_axi_rdata_reg[17] ,
    \s_axi_rdata_reg[18] ,
    \s_axi_rdata_reg[19] ,
    \s_axi_rdata_reg[20] ,
    \s_axi_rdata_reg[21] ,
    \s_axi_rdata_reg[22] ,
    \s_axi_rdata_reg[23] ,
    \s_axi_rdata_reg[24] ,
    \s_axi_rdata_reg[25] ,
    \s_axi_rdata_reg[26] ,
    \s_axi_rdata_reg[27] ,
    \s_axi_rdata_reg[28] ,
    \s_axi_rdata_reg[29] ,
    \s_axi_rdata_reg[30] ,
    \s_axi_rdata_reg[31] ,
    \s_axi_rdata_reg[2] ,
    \s_axi_rdata_reg[2]_0 ,
    \s_axi_rdata_reg[0] ,
    \s_axi_bresp_reg[1]_2 ,
    \s_axi_bresp_reg[1]_3 ,
    \s_axi_bresp_reg[1]_4 ,
    s_axi_bresp,
    launch_valid_reg_0);
  output [0:0]SR;
  output pwm_out;
  output period_start;
  output done_event;
  output \write_address_reg[3] ;
  output \write_address_reg[3]_0 ;
  output launch_valid_reg;
  output \write_address_reg[3]_1 ;
  output \write_address_reg[3]_2 ;
  output [0:0]E;
  output [31:0]D;
  output burst_start;
  output \s_axi_bresp_reg[1] ;
  output \write_address_reg[2] ;
  input s_axi_aclk;
  input s_axi_aresetn;
  input \counter_reg[0]_0 ;
  input [2:0]Q;
  input [2:0]\error_sticky_reg[2] ;
  input \error_sticky_reg[1] ;
  input \error_sticky_reg[1]_0 ;
  input \error_sticky_reg[1]_1 ;
  input \error_sticky_reg[1]_2 ;
  input \error_sticky_reg[1]_3 ;
  input \error_sticky_reg[1]_4 ;
  input \error_sticky_reg[2]_0 ;
  input done_sticky_reg;
  input done_sticky_reg_0;
  input [1:0]data1;
  input cancelled_sticky_reg;
  input cfg_error_reg_0;
  input [31:0]\active_period_ticks_reg[31]_0 ;
  input [31:0]\active_period_count_reg[31]_0 ;
  input \s_axi_bresp_reg[1]_0 ;
  input [0:0]\s_axi_bresp_reg[1]_1 ;
  input address_pending0;
  input \launch_count_reg[0] ;
  input \launch_count_reg[0]_0 ;
  input cancelled_sticky_reg_0;
  input [0:0]CO;
  input \s_axi_bresp[1]_i_4_0 ;
  input \s_axi_bresp[1]_i_4_1 ;
  input \s_axi_bresp[1]_i_4_2 ;
  input \s_axi_bresp[1]_i_4_3 ;
  input \s_axi_rdata_reg[1] ;
  input \s_axi_rdata_reg[1]_0 ;
  input \s_axi_rdata_reg[1]_1 ;
  input \s_axi_rdata_reg[1]_2 ;
  input [31:0]\active_high_ticks_reg[31]_0 ;
  input \s_axi_rdata_reg[3] ;
  input \s_axi_rdata_reg[4] ;
  input \s_axi_rdata_reg[5] ;
  input \s_axi_rdata_reg[5]_0 ;
  input \s_axi_rdata_reg[6] ;
  input \s_axi_rdata_reg[7] ;
  input \s_axi_rdata_reg[8] ;
  input \s_axi_rdata_reg[8]_0 ;
  input \s_axi_rdata_reg[9] ;
  input \s_axi_rdata_reg[9]_0 ;
  input \s_axi_rdata_reg[9]_1 ;
  input \s_axi_rdata_reg[10] ;
  input \s_axi_rdata_reg[11] ;
  input \s_axi_rdata_reg[12] ;
  input \s_axi_rdata_reg[12]_0 ;
  input \s_axi_rdata_reg[13] ;
  input \s_axi_rdata_reg[14] ;
  input \s_axi_rdata_reg[15] ;
  input \s_axi_rdata_reg[16] ;
  input \s_axi_rdata_reg[17] ;
  input \s_axi_rdata_reg[18] ;
  input \s_axi_rdata_reg[19] ;
  input \s_axi_rdata_reg[20] ;
  input \s_axi_rdata_reg[21] ;
  input \s_axi_rdata_reg[22] ;
  input \s_axi_rdata_reg[23] ;
  input \s_axi_rdata_reg[24] ;
  input \s_axi_rdata_reg[25] ;
  input \s_axi_rdata_reg[26] ;
  input \s_axi_rdata_reg[27] ;
  input \s_axi_rdata_reg[28] ;
  input \s_axi_rdata_reg[29] ;
  input \s_axi_rdata_reg[30] ;
  input \s_axi_rdata_reg[31] ;
  input \s_axi_rdata_reg[2] ;
  input \s_axi_rdata_reg[2]_0 ;
  input \s_axi_rdata_reg[0] ;
  input \s_axi_bresp_reg[1]_2 ;
  input \s_axi_bresp_reg[1]_3 ;
  input \s_axi_bresp_reg[1]_4 ;
  input [0:0]s_axi_bresp;
  input launch_valid_reg_0;

  wire [0:0]CO;
  wire [31:0]D;
  wire [0:0]E;
  wire [2:0]Q;
  wire [0:0]SR;
  wire [31:0]active_count;
  wire [31:0]active_high;
  wire [31:0]\active_high_ticks_reg[31]_0 ;
  wire [31:0]active_period;
  wire \active_period_count[31]_i_10_n_0 ;
  wire \active_period_count[31]_i_11_n_0 ;
  wire \active_period_count[31]_i_12_n_0 ;
  wire \active_period_count[31]_i_13_n_0 ;
  wire \active_period_count[31]_i_14_n_0 ;
  wire \active_period_count[31]_i_15_n_0 ;
  wire \active_period_count[31]_i_16_n_0 ;
  wire \active_period_count[31]_i_17_n_0 ;
  wire \active_period_count[31]_i_18_n_0 ;
  wire \active_period_count[31]_i_1_n_0 ;
  wire \active_period_count[31]_i_2_n_0 ;
  wire \active_period_count[31]_i_3_n_0 ;
  wire \active_period_count[31]_i_4_n_0 ;
  wire \active_period_count[31]_i_5_n_0 ;
  wire \active_period_count[31]_i_6_n_0 ;
  wire \active_period_count[31]_i_7_n_0 ;
  wire \active_period_count[31]_i_8_n_0 ;
  wire \active_period_count[31]_i_9_n_0 ;
  wire [31:0]\active_period_count_reg[31]_0 ;
  wire [31:0]\active_period_ticks_reg[31]_0 ;
  wire address_pending0;
  wire burst_start;
  wire burst_start_INST_0_i_1_n_0;
  wire burst_start_INST_0_i_2_n_0;
  wire burst_start_INST_0_i_3_n_0;
  wire burst_start_INST_0_i_4_n_0;
  wire burst_start_INST_0_i_5_n_0;
  wire burst_start_INST_0_i_6_n_0;
  wire burst_start_INST_0_i_7_n_0;
  wire burst_start_INST_0_i_8_n_0;
  wire cancelled;
  wire cancelled_i_1_n_0;
  wire cancelled_sticky0;
  wire cancelled_sticky_reg;
  wire cancelled_sticky_reg_0;
  wire cfg_error;
  wire cfg_error_i_1_n_0;
  wire cfg_error_i_2_n_0;
  wire cfg_error_reg_0;
  wire [31:0]completed_count;
  wire \completed_periods[0]_i_1_n_0 ;
  wire \completed_periods[0]_i_2_n_0 ;
  wire \completed_periods_reg[0]_i_3_n_0 ;
  wire \completed_periods_reg[0]_i_3_n_1 ;
  wire \completed_periods_reg[0]_i_3_n_2 ;
  wire \completed_periods_reg[0]_i_3_n_3 ;
  wire \completed_periods_reg[0]_i_3_n_4 ;
  wire \completed_periods_reg[0]_i_3_n_5 ;
  wire \completed_periods_reg[0]_i_3_n_6 ;
  wire \completed_periods_reg[0]_i_3_n_7 ;
  wire \completed_periods_reg[12]_i_1_n_0 ;
  wire \completed_periods_reg[12]_i_1_n_1 ;
  wire \completed_periods_reg[12]_i_1_n_2 ;
  wire \completed_periods_reg[12]_i_1_n_3 ;
  wire \completed_periods_reg[12]_i_1_n_4 ;
  wire \completed_periods_reg[12]_i_1_n_5 ;
  wire \completed_periods_reg[12]_i_1_n_6 ;
  wire \completed_periods_reg[12]_i_1_n_7 ;
  wire \completed_periods_reg[16]_i_1_n_0 ;
  wire \completed_periods_reg[16]_i_1_n_1 ;
  wire \completed_periods_reg[16]_i_1_n_2 ;
  wire \completed_periods_reg[16]_i_1_n_3 ;
  wire \completed_periods_reg[16]_i_1_n_4 ;
  wire \completed_periods_reg[16]_i_1_n_5 ;
  wire \completed_periods_reg[16]_i_1_n_6 ;
  wire \completed_periods_reg[16]_i_1_n_7 ;
  wire \completed_periods_reg[20]_i_1_n_0 ;
  wire \completed_periods_reg[20]_i_1_n_1 ;
  wire \completed_periods_reg[20]_i_1_n_2 ;
  wire \completed_periods_reg[20]_i_1_n_3 ;
  wire \completed_periods_reg[20]_i_1_n_4 ;
  wire \completed_periods_reg[20]_i_1_n_5 ;
  wire \completed_periods_reg[20]_i_1_n_6 ;
  wire \completed_periods_reg[20]_i_1_n_7 ;
  wire \completed_periods_reg[24]_i_1_n_0 ;
  wire \completed_periods_reg[24]_i_1_n_1 ;
  wire \completed_periods_reg[24]_i_1_n_2 ;
  wire \completed_periods_reg[24]_i_1_n_3 ;
  wire \completed_periods_reg[24]_i_1_n_4 ;
  wire \completed_periods_reg[24]_i_1_n_5 ;
  wire \completed_periods_reg[24]_i_1_n_6 ;
  wire \completed_periods_reg[24]_i_1_n_7 ;
  wire \completed_periods_reg[28]_i_1_n_1 ;
  wire \completed_periods_reg[28]_i_1_n_2 ;
  wire \completed_periods_reg[28]_i_1_n_3 ;
  wire \completed_periods_reg[28]_i_1_n_4 ;
  wire \completed_periods_reg[28]_i_1_n_5 ;
  wire \completed_periods_reg[28]_i_1_n_6 ;
  wire \completed_periods_reg[28]_i_1_n_7 ;
  wire \completed_periods_reg[4]_i_1_n_0 ;
  wire \completed_periods_reg[4]_i_1_n_1 ;
  wire \completed_periods_reg[4]_i_1_n_2 ;
  wire \completed_periods_reg[4]_i_1_n_3 ;
  wire \completed_periods_reg[4]_i_1_n_4 ;
  wire \completed_periods_reg[4]_i_1_n_5 ;
  wire \completed_periods_reg[4]_i_1_n_6 ;
  wire \completed_periods_reg[4]_i_1_n_7 ;
  wire \completed_periods_reg[8]_i_1_n_0 ;
  wire \completed_periods_reg[8]_i_1_n_1 ;
  wire \completed_periods_reg[8]_i_1_n_2 ;
  wire \completed_periods_reg[8]_i_1_n_3 ;
  wire \completed_periods_reg[8]_i_1_n_4 ;
  wire \completed_periods_reg[8]_i_1_n_5 ;
  wire \completed_periods_reg[8]_i_1_n_6 ;
  wire \completed_periods_reg[8]_i_1_n_7 ;
  wire \counter[0]_i_1_n_0 ;
  wire [31:0]counter_reg;
  wire \counter_reg[0]_0 ;
  wire \counter_reg[0]_i_3_n_0 ;
  wire \counter_reg[0]_i_3_n_1 ;
  wire \counter_reg[0]_i_3_n_2 ;
  wire \counter_reg[0]_i_3_n_3 ;
  wire \counter_reg[0]_i_3_n_4 ;
  wire \counter_reg[0]_i_3_n_5 ;
  wire \counter_reg[0]_i_3_n_6 ;
  wire \counter_reg[0]_i_3_n_7 ;
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
  wire [1:0]data1;
  wire done;
  wire done_event;
  wire done_event_i_1_n_0;
  wire done_i_1_n_0;
  wire done_sticky0;
  wire done_sticky_i_3_n_0;
  wire done_sticky_reg;
  wire done_sticky_reg_0;
  wire \error_sticky[1]_i_2_n_0 ;
  wire \error_sticky[2]_i_2_n_0 ;
  wire \error_sticky_reg[1] ;
  wire \error_sticky_reg[1]_0 ;
  wire \error_sticky_reg[1]_1 ;
  wire \error_sticky_reg[1]_2 ;
  wire \error_sticky_reg[1]_3 ;
  wire \error_sticky_reg[1]_4 ;
  wire [2:0]\error_sticky_reg[2] ;
  wire \error_sticky_reg[2]_0 ;
  wire \launch_count_reg[0] ;
  wire \launch_count_reg[0]_0 ;
  wire launch_valid_reg;
  wire launch_valid_reg_0;
  wire [31:0]p_0_in;
  wire parameters_ok1;
  wire parameters_ok1_carry__0_i_1_n_0;
  wire parameters_ok1_carry__0_i_2_n_0;
  wire parameters_ok1_carry__0_i_3_n_0;
  wire parameters_ok1_carry__0_i_4_n_0;
  wire parameters_ok1_carry__0_i_5_n_0;
  wire parameters_ok1_carry__0_i_6_n_0;
  wire parameters_ok1_carry__0_i_7_n_0;
  wire parameters_ok1_carry__0_i_8_n_0;
  wire parameters_ok1_carry__0_n_0;
  wire parameters_ok1_carry__0_n_1;
  wire parameters_ok1_carry__0_n_2;
  wire parameters_ok1_carry__0_n_3;
  wire parameters_ok1_carry__1_i_1_n_0;
  wire parameters_ok1_carry__1_i_2_n_0;
  wire parameters_ok1_carry__1_i_3_n_0;
  wire parameters_ok1_carry__1_i_4_n_0;
  wire parameters_ok1_carry__1_i_5_n_0;
  wire parameters_ok1_carry__1_i_6_n_0;
  wire parameters_ok1_carry__1_i_7_n_0;
  wire parameters_ok1_carry__1_i_8_n_0;
  wire parameters_ok1_carry__1_n_0;
  wire parameters_ok1_carry__1_n_1;
  wire parameters_ok1_carry__1_n_2;
  wire parameters_ok1_carry__1_n_3;
  wire parameters_ok1_carry__2_i_1_n_0;
  wire parameters_ok1_carry__2_i_2_n_0;
  wire parameters_ok1_carry__2_i_3_n_0;
  wire parameters_ok1_carry__2_i_4_n_0;
  wire parameters_ok1_carry__2_i_5_n_0;
  wire parameters_ok1_carry__2_i_6_n_0;
  wire parameters_ok1_carry__2_i_7_n_0;
  wire parameters_ok1_carry__2_i_8_n_0;
  wire parameters_ok1_carry__2_n_1;
  wire parameters_ok1_carry__2_n_2;
  wire parameters_ok1_carry__2_n_3;
  wire parameters_ok1_carry_i_1_n_0;
  wire parameters_ok1_carry_i_2_n_0;
  wire parameters_ok1_carry_i_3_n_0;
  wire parameters_ok1_carry_i_4_n_0;
  wire parameters_ok1_carry_i_5_n_0;
  wire parameters_ok1_carry_i_6_n_0;
  wire parameters_ok1_carry_i_7_n_0;
  wire parameters_ok1_carry_i_8_n_0;
  wire parameters_ok1_carry_n_0;
  wire parameters_ok1_carry_n_1;
  wire parameters_ok1_carry_n_2;
  wire parameters_ok1_carry_n_3;
  wire period_start;
  wire period_start_i_1_n_0;
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
  wire pwm_out5_out;
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
  wire pwm_out_i_2_n_0;
  wire pwm_out_i_3_n_0;
  wire pwm_out_i_4_n_0;
  wire pwm_out_i_5_n_0;
  wire pwm_out_i_6_n_0;
  wire pwm_out_i_7_n_0;
  wire pwm_out_i_8_n_0;
  wire pwm_out_i_9_n_0;
  wire running;
  wire running0;
  wire running0_carry__0_i_1_n_0;
  wire running0_carry__0_i_2_n_0;
  wire running0_carry__0_i_3_n_0;
  wire running0_carry__0_i_4_n_0;
  wire running0_carry__0_i_5_n_0;
  wire running0_carry__0_i_5_n_1;
  wire running0_carry__0_i_5_n_2;
  wire running0_carry__0_i_5_n_3;
  wire running0_carry__0_i_6_n_0;
  wire running0_carry__0_i_6_n_1;
  wire running0_carry__0_i_6_n_2;
  wire running0_carry__0_i_6_n_3;
  wire running0_carry__0_i_7_n_0;
  wire running0_carry__0_i_7_n_1;
  wire running0_carry__0_i_7_n_2;
  wire running0_carry__0_i_7_n_3;
  wire running0_carry__0_n_0;
  wire running0_carry__0_n_1;
  wire running0_carry__0_n_2;
  wire running0_carry__0_n_3;
  wire running0_carry__1_i_1_n_0;
  wire running0_carry__1_i_2_n_0;
  wire running0_carry__1_i_3_n_0;
  wire running0_carry__1_i_4_n_2;
  wire running0_carry__1_i_4_n_3;
  wire running0_carry__1_i_5_n_0;
  wire running0_carry__1_i_5_n_1;
  wire running0_carry__1_i_5_n_2;
  wire running0_carry__1_i_5_n_3;
  wire running0_carry__1_n_2;
  wire running0_carry__1_n_3;
  wire running0_carry_i_1_n_0;
  wire running0_carry_i_2_n_0;
  wire running0_carry_i_3_n_0;
  wire running0_carry_i_4_n_0;
  wire running0_carry_i_5_n_0;
  wire running0_carry_i_5_n_1;
  wire running0_carry_i_5_n_2;
  wire running0_carry_i_5_n_3;
  wire running0_carry_i_6_n_0;
  wire running0_carry_i_6_n_1;
  wire running0_carry_i_6_n_2;
  wire running0_carry_i_6_n_3;
  wire running0_carry_i_7_n_0;
  wire running0_carry_i_7_n_1;
  wire running0_carry_i_7_n_2;
  wire running0_carry_i_7_n_3;
  wire running0_carry_n_0;
  wire running0_carry_n_1;
  wire running0_carry_n_2;
  wire running0_carry_n_3;
  wire [31:0]running1;
  wire running_i_1_n_0;
  wire s_axi_aclk;
  wire s_axi_aresetn;
  wire [0:0]s_axi_bresp;
  wire \s_axi_bresp[1]_i_4_0 ;
  wire \s_axi_bresp[1]_i_4_1 ;
  wire \s_axi_bresp[1]_i_4_2 ;
  wire \s_axi_bresp[1]_i_4_3 ;
  wire \s_axi_bresp[1]_i_4_n_0 ;
  wire \s_axi_bresp[1]_i_8_n_0 ;
  wire \s_axi_bresp_reg[1] ;
  wire \s_axi_bresp_reg[1]_0 ;
  wire [0:0]\s_axi_bresp_reg[1]_1 ;
  wire \s_axi_bresp_reg[1]_2 ;
  wire \s_axi_bresp_reg[1]_3 ;
  wire \s_axi_bresp_reg[1]_4 ;
  wire \s_axi_rdata[0]_i_2_n_0 ;
  wire \s_axi_rdata[0]_i_3_n_0 ;
  wire \s_axi_rdata[10]_i_3_n_0 ;
  wire \s_axi_rdata[11]_i_3_n_0 ;
  wire \s_axi_rdata[12]_i_3_n_0 ;
  wire \s_axi_rdata[13]_i_3_n_0 ;
  wire \s_axi_rdata[14]_i_3_n_0 ;
  wire \s_axi_rdata[15]_i_3_n_0 ;
  wire \s_axi_rdata[16]_i_3_n_0 ;
  wire \s_axi_rdata[17]_i_3_n_0 ;
  wire \s_axi_rdata[18]_i_3_n_0 ;
  wire \s_axi_rdata[19]_i_3_n_0 ;
  wire \s_axi_rdata[1]_i_2_n_0 ;
  wire \s_axi_rdata[20]_i_3_n_0 ;
  wire \s_axi_rdata[21]_i_3_n_0 ;
  wire \s_axi_rdata[22]_i_3_n_0 ;
  wire \s_axi_rdata[23]_i_3_n_0 ;
  wire \s_axi_rdata[24]_i_3_n_0 ;
  wire \s_axi_rdata[25]_i_3_n_0 ;
  wire \s_axi_rdata[26]_i_3_n_0 ;
  wire \s_axi_rdata[27]_i_3_n_0 ;
  wire \s_axi_rdata[28]_i_3_n_0 ;
  wire \s_axi_rdata[29]_i_3_n_0 ;
  wire \s_axi_rdata[2]_i_2_n_0 ;
  wire \s_axi_rdata[2]_i_3_n_0 ;
  wire \s_axi_rdata[30]_i_5_n_0 ;
  wire \s_axi_rdata[31]_i_5_n_0 ;
  wire \s_axi_rdata[3]_i_3_n_0 ;
  wire \s_axi_rdata[4]_i_3_n_0 ;
  wire \s_axi_rdata[5]_i_4_n_0 ;
  wire \s_axi_rdata[6]_i_3_n_0 ;
  wire \s_axi_rdata[7]_i_3_n_0 ;
  wire \s_axi_rdata[8]_i_3_n_0 ;
  wire \s_axi_rdata[9]_i_5_n_0 ;
  wire \s_axi_rdata_reg[0] ;
  wire \s_axi_rdata_reg[10] ;
  wire \s_axi_rdata_reg[11] ;
  wire \s_axi_rdata_reg[12] ;
  wire \s_axi_rdata_reg[12]_0 ;
  wire \s_axi_rdata_reg[13] ;
  wire \s_axi_rdata_reg[14] ;
  wire \s_axi_rdata_reg[15] ;
  wire \s_axi_rdata_reg[16] ;
  wire \s_axi_rdata_reg[17] ;
  wire \s_axi_rdata_reg[18] ;
  wire \s_axi_rdata_reg[19] ;
  wire \s_axi_rdata_reg[1] ;
  wire \s_axi_rdata_reg[1]_0 ;
  wire \s_axi_rdata_reg[1]_1 ;
  wire \s_axi_rdata_reg[1]_2 ;
  wire \s_axi_rdata_reg[20] ;
  wire \s_axi_rdata_reg[21] ;
  wire \s_axi_rdata_reg[22] ;
  wire \s_axi_rdata_reg[23] ;
  wire \s_axi_rdata_reg[24] ;
  wire \s_axi_rdata_reg[25] ;
  wire \s_axi_rdata_reg[26] ;
  wire \s_axi_rdata_reg[27] ;
  wire \s_axi_rdata_reg[28] ;
  wire \s_axi_rdata_reg[29] ;
  wire \s_axi_rdata_reg[2] ;
  wire \s_axi_rdata_reg[2]_0 ;
  wire \s_axi_rdata_reg[30] ;
  wire \s_axi_rdata_reg[31] ;
  wire \s_axi_rdata_reg[3] ;
  wire \s_axi_rdata_reg[4] ;
  wire \s_axi_rdata_reg[5] ;
  wire \s_axi_rdata_reg[5]_0 ;
  wire \s_axi_rdata_reg[6] ;
  wire \s_axi_rdata_reg[7] ;
  wire \s_axi_rdata_reg[8] ;
  wire \s_axi_rdata_reg[8]_0 ;
  wire \s_axi_rdata_reg[9] ;
  wire \s_axi_rdata_reg[9]_0 ;
  wire \s_axi_rdata_reg[9]_1 ;
  wire \write_address_reg[2] ;
  wire \write_address_reg[3] ;
  wire \write_address_reg[3]_0 ;
  wire \write_address_reg[3]_1 ;
  wire \write_address_reg[3]_2 ;
  wire [3:3]\NLW_completed_periods_reg[28]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_counter_reg[28]_i_1_CO_UNCONNECTED ;
  wire [3:0]NLW_cycle_end0_carry_O_UNCONNECTED;
  wire [3:0]NLW_cycle_end0_carry__0_O_UNCONNECTED;
  wire [3:3]NLW_cycle_end0_carry__1_CO_UNCONNECTED;
  wire [3:0]NLW_cycle_end0_carry__1_O_UNCONNECTED;
  wire [3:2]NLW_cycle_end1_carry__6_CO_UNCONNECTED;
  wire [3:3]NLW_cycle_end1_carry__6_O_UNCONNECTED;
  wire [3:0]NLW_parameters_ok1_carry_O_UNCONNECTED;
  wire [3:0]NLW_parameters_ok1_carry__0_O_UNCONNECTED;
  wire [3:0]NLW_parameters_ok1_carry__1_O_UNCONNECTED;
  wire [3:0]NLW_parameters_ok1_carry__2_O_UNCONNECTED;
  wire [3:0]NLW_pwm_out0_carry_O_UNCONNECTED;
  wire [3:0]NLW_pwm_out0_carry__0_O_UNCONNECTED;
  wire [3:0]NLW_pwm_out0_carry__1_O_UNCONNECTED;
  wire [3:0]NLW_pwm_out0_carry__2_O_UNCONNECTED;
  wire [3:2]NLW_pwm_out0_carry__2_i_9_CO_UNCONNECTED;
  wire [3:3]NLW_pwm_out0_carry__2_i_9_O_UNCONNECTED;
  wire [3:0]NLW_running0_carry_O_UNCONNECTED;
  wire [3:0]NLW_running0_carry__0_O_UNCONNECTED;
  wire [3:3]NLW_running0_carry__1_CO_UNCONNECTED;
  wire [3:0]NLW_running0_carry__1_O_UNCONNECTED;
  wire [3:2]NLW_running0_carry__1_i_4_CO_UNCONNECTED;
  wire [3:3]NLW_running0_carry__1_i_4_O_UNCONNECTED;

  FDRE \active_high_ticks_reg[0] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_high_ticks_reg[31]_0 [0]),
        .Q(active_high[0]),
        .R(SR));
  FDRE \active_high_ticks_reg[10] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_high_ticks_reg[31]_0 [10]),
        .Q(active_high[10]),
        .R(SR));
  FDRE \active_high_ticks_reg[11] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_high_ticks_reg[31]_0 [11]),
        .Q(active_high[11]),
        .R(SR));
  FDRE \active_high_ticks_reg[12] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_high_ticks_reg[31]_0 [12]),
        .Q(active_high[12]),
        .R(SR));
  FDRE \active_high_ticks_reg[13] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_high_ticks_reg[31]_0 [13]),
        .Q(active_high[13]),
        .R(SR));
  FDRE \active_high_ticks_reg[14] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_high_ticks_reg[31]_0 [14]),
        .Q(active_high[14]),
        .R(SR));
  FDRE \active_high_ticks_reg[15] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_high_ticks_reg[31]_0 [15]),
        .Q(active_high[15]),
        .R(SR));
  FDRE \active_high_ticks_reg[16] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_high_ticks_reg[31]_0 [16]),
        .Q(active_high[16]),
        .R(SR));
  FDRE \active_high_ticks_reg[17] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_high_ticks_reg[31]_0 [17]),
        .Q(active_high[17]),
        .R(SR));
  FDRE \active_high_ticks_reg[18] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_high_ticks_reg[31]_0 [18]),
        .Q(active_high[18]),
        .R(SR));
  FDRE \active_high_ticks_reg[19] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_high_ticks_reg[31]_0 [19]),
        .Q(active_high[19]),
        .R(SR));
  FDRE \active_high_ticks_reg[1] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_high_ticks_reg[31]_0 [1]),
        .Q(active_high[1]),
        .R(SR));
  FDRE \active_high_ticks_reg[20] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_high_ticks_reg[31]_0 [20]),
        .Q(active_high[20]),
        .R(SR));
  FDRE \active_high_ticks_reg[21] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_high_ticks_reg[31]_0 [21]),
        .Q(active_high[21]),
        .R(SR));
  FDRE \active_high_ticks_reg[22] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_high_ticks_reg[31]_0 [22]),
        .Q(active_high[22]),
        .R(SR));
  FDRE \active_high_ticks_reg[23] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_high_ticks_reg[31]_0 [23]),
        .Q(active_high[23]),
        .R(SR));
  FDRE \active_high_ticks_reg[24] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_high_ticks_reg[31]_0 [24]),
        .Q(active_high[24]),
        .R(SR));
  FDRE \active_high_ticks_reg[25] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_high_ticks_reg[31]_0 [25]),
        .Q(active_high[25]),
        .R(SR));
  FDRE \active_high_ticks_reg[26] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_high_ticks_reg[31]_0 [26]),
        .Q(active_high[26]),
        .R(SR));
  FDRE \active_high_ticks_reg[27] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_high_ticks_reg[31]_0 [27]),
        .Q(active_high[27]),
        .R(SR));
  FDRE \active_high_ticks_reg[28] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_high_ticks_reg[31]_0 [28]),
        .Q(active_high[28]),
        .R(SR));
  FDRE \active_high_ticks_reg[29] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_high_ticks_reg[31]_0 [29]),
        .Q(active_high[29]),
        .R(SR));
  FDRE \active_high_ticks_reg[2] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_high_ticks_reg[31]_0 [2]),
        .Q(active_high[2]),
        .R(SR));
  FDRE \active_high_ticks_reg[30] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_high_ticks_reg[31]_0 [30]),
        .Q(active_high[30]),
        .R(SR));
  FDRE \active_high_ticks_reg[31] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_high_ticks_reg[31]_0 [31]),
        .Q(active_high[31]),
        .R(SR));
  FDRE \active_high_ticks_reg[3] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_high_ticks_reg[31]_0 [3]),
        .Q(active_high[3]),
        .R(SR));
  FDRE \active_high_ticks_reg[4] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_high_ticks_reg[31]_0 [4]),
        .Q(active_high[4]),
        .R(SR));
  FDRE \active_high_ticks_reg[5] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_high_ticks_reg[31]_0 [5]),
        .Q(active_high[5]),
        .R(SR));
  FDRE \active_high_ticks_reg[6] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_high_ticks_reg[31]_0 [6]),
        .Q(active_high[6]),
        .R(SR));
  FDRE \active_high_ticks_reg[7] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_high_ticks_reg[31]_0 [7]),
        .Q(active_high[7]),
        .R(SR));
  FDRE \active_high_ticks_reg[8] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_high_ticks_reg[31]_0 [8]),
        .Q(active_high[8]),
        .R(SR));
  FDRE \active_high_ticks_reg[9] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_high_ticks_reg[31]_0 [9]),
        .Q(active_high[9]),
        .R(SR));
  LUT6 #(
    .INIT(64'h8808880800008808)) 
    \active_period_count[31]_i_1 
       (.I0(\active_period_count[31]_i_2_n_0 ),
        .I1(parameters_ok1),
        .I2(\active_period_count[31]_i_3_n_0 ),
        .I3(\active_period_count[31]_i_4_n_0 ),
        .I4(\active_period_count[31]_i_5_n_0 ),
        .I5(\active_period_count[31]_i_6_n_0 ),
        .O(\active_period_count[31]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \active_period_count[31]_i_10 
       (.I0(\active_period_ticks_reg[31]_0 [8]),
        .I1(\active_period_ticks_reg[31]_0 [11]),
        .I2(\active_period_ticks_reg[31]_0 [9]),
        .I3(\active_period_ticks_reg[31]_0 [10]),
        .I4(\active_period_count[31]_i_16_n_0 ),
        .O(\active_period_count[31]_i_10_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \active_period_count[31]_i_11 
       (.I0(\active_period_count_reg[31]_0 [25]),
        .I1(\active_period_count_reg[31]_0 [9]),
        .I2(\active_period_count_reg[31]_0 [15]),
        .I3(\active_period_count_reg[31]_0 [7]),
        .O(\active_period_count[31]_i_11_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \active_period_count[31]_i_12 
       (.I0(\active_period_count_reg[31]_0 [6]),
        .I1(\active_period_count_reg[31]_0 [10]),
        .I2(\active_period_count_reg[31]_0 [4]),
        .I3(\active_period_count_reg[31]_0 [12]),
        .I4(\active_period_count[31]_i_17_n_0 ),
        .O(\active_period_count[31]_i_12_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \active_period_count[31]_i_13 
       (.I0(\active_period_count_reg[31]_0 [23]),
        .I1(\active_period_count_reg[31]_0 [11]),
        .I2(\active_period_count_reg[31]_0 [14]),
        .I3(\active_period_count_reg[31]_0 [8]),
        .O(\active_period_count[31]_i_13_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \active_period_count[31]_i_14 
       (.I0(\active_period_count_reg[31]_0 [19]),
        .I1(\active_period_count_reg[31]_0 [21]),
        .I2(\active_period_count_reg[31]_0 [16]),
        .I3(\active_period_count_reg[31]_0 [22]),
        .I4(\active_period_count[31]_i_18_n_0 ),
        .O(\active_period_count[31]_i_14_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \active_period_count[31]_i_15 
       (.I0(\active_period_ticks_reg[31]_0 [29]),
        .I1(\active_period_ticks_reg[31]_0 [28]),
        .I2(\active_period_ticks_reg[31]_0 [31]),
        .I3(\active_period_ticks_reg[31]_0 [30]),
        .O(\active_period_count[31]_i_15_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \active_period_count[31]_i_16 
       (.I0(\active_period_ticks_reg[31]_0 [13]),
        .I1(\active_period_ticks_reg[31]_0 [12]),
        .I2(\active_period_ticks_reg[31]_0 [15]),
        .I3(\active_period_ticks_reg[31]_0 [14]),
        .O(\active_period_count[31]_i_16_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \active_period_count[31]_i_17 
       (.I0(\active_period_count_reg[31]_0 [18]),
        .I1(\active_period_count_reg[31]_0 [17]),
        .I2(\active_period_count_reg[31]_0 [26]),
        .I3(\active_period_count_reg[31]_0 [13]),
        .O(\active_period_count[31]_i_17_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \active_period_count[31]_i_18 
       (.I0(\active_period_count_reg[31]_0 [27]),
        .I1(\active_period_count_reg[31]_0 [3]),
        .I2(\active_period_count_reg[31]_0 [28]),
        .I3(\active_period_count_reg[31]_0 [2]),
        .O(\active_period_count[31]_i_18_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    \active_period_count[31]_i_2 
       (.I0(cfg_error_reg_0),
        .I1(\counter_reg[0]_0 ),
        .I2(s_axi_aresetn),
        .I3(running),
        .O(\active_period_count[31]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \active_period_count[31]_i_3 
       (.I0(\active_period_count[31]_i_7_n_0 ),
        .I1(\active_period_ticks_reg[31]_0 [18]),
        .I2(\active_period_ticks_reg[31]_0 [17]),
        .I3(\active_period_ticks_reg[31]_0 [19]),
        .I4(\active_period_ticks_reg[31]_0 [16]),
        .I5(\active_period_count[31]_i_8_n_0 ),
        .O(\active_period_count[31]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \active_period_count[31]_i_4 
       (.I0(\active_period_count[31]_i_9_n_0 ),
        .I1(\active_period_ticks_reg[31]_0 [1]),
        .I2(\active_period_ticks_reg[31]_0 [0]),
        .I3(\active_period_ticks_reg[31]_0 [3]),
        .I4(\active_period_ticks_reg[31]_0 [2]),
        .I5(\active_period_count[31]_i_10_n_0 ),
        .O(\active_period_count[31]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \active_period_count[31]_i_5 
       (.I0(\active_period_count[31]_i_11_n_0 ),
        .I1(\active_period_count_reg[31]_0 [30]),
        .I2(\active_period_count_reg[31]_0 [5]),
        .I3(\active_period_count_reg[31]_0 [20]),
        .I4(\active_period_count_reg[31]_0 [1]),
        .I5(\active_period_count[31]_i_12_n_0 ),
        .O(\active_period_count[31]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \active_period_count[31]_i_6 
       (.I0(\active_period_count[31]_i_13_n_0 ),
        .I1(\active_period_count_reg[31]_0 [31]),
        .I2(\active_period_count_reg[31]_0 [29]),
        .I3(\active_period_count_reg[31]_0 [24]),
        .I4(\active_period_count_reg[31]_0 [0]),
        .I5(\active_period_count[31]_i_14_n_0 ),
        .O(\active_period_count[31]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \active_period_count[31]_i_7 
       (.I0(\active_period_ticks_reg[31]_0 [21]),
        .I1(\active_period_ticks_reg[31]_0 [20]),
        .I2(\active_period_ticks_reg[31]_0 [23]),
        .I3(\active_period_ticks_reg[31]_0 [22]),
        .O(\active_period_count[31]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \active_period_count[31]_i_8 
       (.I0(\active_period_ticks_reg[31]_0 [24]),
        .I1(\active_period_ticks_reg[31]_0 [27]),
        .I2(\active_period_ticks_reg[31]_0 [25]),
        .I3(\active_period_ticks_reg[31]_0 [26]),
        .I4(\active_period_count[31]_i_15_n_0 ),
        .O(\active_period_count[31]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \active_period_count[31]_i_9 
       (.I0(\active_period_ticks_reg[31]_0 [6]),
        .I1(\active_period_ticks_reg[31]_0 [5]),
        .I2(\active_period_ticks_reg[31]_0 [7]),
        .I3(\active_period_ticks_reg[31]_0 [4]),
        .O(\active_period_count[31]_i_9_n_0 ));
  FDRE \active_period_count_reg[0] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_period_count_reg[31]_0 [0]),
        .Q(active_count[0]),
        .R(SR));
  FDRE \active_period_count_reg[10] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_period_count_reg[31]_0 [10]),
        .Q(active_count[10]),
        .R(SR));
  FDRE \active_period_count_reg[11] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_period_count_reg[31]_0 [11]),
        .Q(active_count[11]),
        .R(SR));
  FDRE \active_period_count_reg[12] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_period_count_reg[31]_0 [12]),
        .Q(active_count[12]),
        .R(SR));
  FDRE \active_period_count_reg[13] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_period_count_reg[31]_0 [13]),
        .Q(active_count[13]),
        .R(SR));
  FDRE \active_period_count_reg[14] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_period_count_reg[31]_0 [14]),
        .Q(active_count[14]),
        .R(SR));
  FDRE \active_period_count_reg[15] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_period_count_reg[31]_0 [15]),
        .Q(active_count[15]),
        .R(SR));
  FDRE \active_period_count_reg[16] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_period_count_reg[31]_0 [16]),
        .Q(active_count[16]),
        .R(SR));
  FDRE \active_period_count_reg[17] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_period_count_reg[31]_0 [17]),
        .Q(active_count[17]),
        .R(SR));
  FDRE \active_period_count_reg[18] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_period_count_reg[31]_0 [18]),
        .Q(active_count[18]),
        .R(SR));
  FDRE \active_period_count_reg[19] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_period_count_reg[31]_0 [19]),
        .Q(active_count[19]),
        .R(SR));
  FDRE \active_period_count_reg[1] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_period_count_reg[31]_0 [1]),
        .Q(active_count[1]),
        .R(SR));
  FDRE \active_period_count_reg[20] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_period_count_reg[31]_0 [20]),
        .Q(active_count[20]),
        .R(SR));
  FDRE \active_period_count_reg[21] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_period_count_reg[31]_0 [21]),
        .Q(active_count[21]),
        .R(SR));
  FDRE \active_period_count_reg[22] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_period_count_reg[31]_0 [22]),
        .Q(active_count[22]),
        .R(SR));
  FDRE \active_period_count_reg[23] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_period_count_reg[31]_0 [23]),
        .Q(active_count[23]),
        .R(SR));
  FDRE \active_period_count_reg[24] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_period_count_reg[31]_0 [24]),
        .Q(active_count[24]),
        .R(SR));
  FDRE \active_period_count_reg[25] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_period_count_reg[31]_0 [25]),
        .Q(active_count[25]),
        .R(SR));
  FDRE \active_period_count_reg[26] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_period_count_reg[31]_0 [26]),
        .Q(active_count[26]),
        .R(SR));
  FDRE \active_period_count_reg[27] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_period_count_reg[31]_0 [27]),
        .Q(active_count[27]),
        .R(SR));
  FDRE \active_period_count_reg[28] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_period_count_reg[31]_0 [28]),
        .Q(active_count[28]),
        .R(SR));
  FDRE \active_period_count_reg[29] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_period_count_reg[31]_0 [29]),
        .Q(active_count[29]),
        .R(SR));
  FDRE \active_period_count_reg[2] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_period_count_reg[31]_0 [2]),
        .Q(active_count[2]),
        .R(SR));
  FDRE \active_period_count_reg[30] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_period_count_reg[31]_0 [30]),
        .Q(active_count[30]),
        .R(SR));
  FDRE \active_period_count_reg[31] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_period_count_reg[31]_0 [31]),
        .Q(active_count[31]),
        .R(SR));
  FDRE \active_period_count_reg[3] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_period_count_reg[31]_0 [3]),
        .Q(active_count[3]),
        .R(SR));
  FDRE \active_period_count_reg[4] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_period_count_reg[31]_0 [4]),
        .Q(active_count[4]),
        .R(SR));
  FDRE \active_period_count_reg[5] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_period_count_reg[31]_0 [5]),
        .Q(active_count[5]),
        .R(SR));
  FDRE \active_period_count_reg[6] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_period_count_reg[31]_0 [6]),
        .Q(active_count[6]),
        .R(SR));
  FDRE \active_period_count_reg[7] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_period_count_reg[31]_0 [7]),
        .Q(active_count[7]),
        .R(SR));
  FDRE \active_period_count_reg[8] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_period_count_reg[31]_0 [8]),
        .Q(active_count[8]),
        .R(SR));
  FDRE \active_period_count_reg[9] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_period_count_reg[31]_0 [9]),
        .Q(active_count[9]),
        .R(SR));
  FDRE \active_period_ticks_reg[0] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_period_ticks_reg[31]_0 [0]),
        .Q(active_period[0]),
        .R(SR));
  FDRE \active_period_ticks_reg[10] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_period_ticks_reg[31]_0 [10]),
        .Q(active_period[10]),
        .R(SR));
  FDRE \active_period_ticks_reg[11] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_period_ticks_reg[31]_0 [11]),
        .Q(active_period[11]),
        .R(SR));
  FDRE \active_period_ticks_reg[12] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_period_ticks_reg[31]_0 [12]),
        .Q(active_period[12]),
        .R(SR));
  FDRE \active_period_ticks_reg[13] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_period_ticks_reg[31]_0 [13]),
        .Q(active_period[13]),
        .R(SR));
  FDRE \active_period_ticks_reg[14] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_period_ticks_reg[31]_0 [14]),
        .Q(active_period[14]),
        .R(SR));
  FDRE \active_period_ticks_reg[15] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_period_ticks_reg[31]_0 [15]),
        .Q(active_period[15]),
        .R(SR));
  FDRE \active_period_ticks_reg[16] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_period_ticks_reg[31]_0 [16]),
        .Q(active_period[16]),
        .R(SR));
  FDRE \active_period_ticks_reg[17] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_period_ticks_reg[31]_0 [17]),
        .Q(active_period[17]),
        .R(SR));
  FDRE \active_period_ticks_reg[18] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_period_ticks_reg[31]_0 [18]),
        .Q(active_period[18]),
        .R(SR));
  FDRE \active_period_ticks_reg[19] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_period_ticks_reg[31]_0 [19]),
        .Q(active_period[19]),
        .R(SR));
  FDRE \active_period_ticks_reg[1] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_period_ticks_reg[31]_0 [1]),
        .Q(active_period[1]),
        .R(SR));
  FDRE \active_period_ticks_reg[20] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_period_ticks_reg[31]_0 [20]),
        .Q(active_period[20]),
        .R(SR));
  FDRE \active_period_ticks_reg[21] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_period_ticks_reg[31]_0 [21]),
        .Q(active_period[21]),
        .R(SR));
  FDRE \active_period_ticks_reg[22] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_period_ticks_reg[31]_0 [22]),
        .Q(active_period[22]),
        .R(SR));
  FDRE \active_period_ticks_reg[23] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_period_ticks_reg[31]_0 [23]),
        .Q(active_period[23]),
        .R(SR));
  FDRE \active_period_ticks_reg[24] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_period_ticks_reg[31]_0 [24]),
        .Q(active_period[24]),
        .R(SR));
  FDRE \active_period_ticks_reg[25] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_period_ticks_reg[31]_0 [25]),
        .Q(active_period[25]),
        .R(SR));
  FDRE \active_period_ticks_reg[26] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_period_ticks_reg[31]_0 [26]),
        .Q(active_period[26]),
        .R(SR));
  FDRE \active_period_ticks_reg[27] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_period_ticks_reg[31]_0 [27]),
        .Q(active_period[27]),
        .R(SR));
  FDRE \active_period_ticks_reg[28] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_period_ticks_reg[31]_0 [28]),
        .Q(active_period[28]),
        .R(SR));
  FDRE \active_period_ticks_reg[29] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_period_ticks_reg[31]_0 [29]),
        .Q(active_period[29]),
        .R(SR));
  FDRE \active_period_ticks_reg[2] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_period_ticks_reg[31]_0 [2]),
        .Q(active_period[2]),
        .R(SR));
  FDRE \active_period_ticks_reg[30] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_period_ticks_reg[31]_0 [30]),
        .Q(active_period[30]),
        .R(SR));
  FDRE \active_period_ticks_reg[31] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_period_ticks_reg[31]_0 [31]),
        .Q(active_period[31]),
        .R(SR));
  FDRE \active_period_ticks_reg[3] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_period_ticks_reg[31]_0 [3]),
        .Q(active_period[3]),
        .R(SR));
  FDRE \active_period_ticks_reg[4] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_period_ticks_reg[31]_0 [4]),
        .Q(active_period[4]),
        .R(SR));
  FDRE \active_period_ticks_reg[5] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_period_ticks_reg[31]_0 [5]),
        .Q(active_period[5]),
        .R(SR));
  FDRE \active_period_ticks_reg[6] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_period_ticks_reg[31]_0 [6]),
        .Q(active_period[6]),
        .R(SR));
  FDRE \active_period_ticks_reg[7] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_period_ticks_reg[31]_0 [7]),
        .Q(active_period[7]),
        .R(SR));
  FDRE \active_period_ticks_reg[8] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_period_ticks_reg[31]_0 [8]),
        .Q(active_period[8]),
        .R(SR));
  FDRE \active_period_ticks_reg[9] 
       (.C(s_axi_aclk),
        .CE(\active_period_count[31]_i_1_n_0 ),
        .D(\active_period_ticks_reg[31]_0 [9]),
        .Q(active_period[9]),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hFFEF)) 
    activity_INST_0
       (.I0(cfg_error_reg_0),
        .I1(\counter_reg[0]_0 ),
        .I2(s_axi_aresetn),
        .I3(running),
        .O(launch_valid_reg));
  LUT4 #(
    .INIT(16'h0002)) 
    burst_start_INST_0
       (.I0(burst_start_INST_0_i_1_n_0),
        .I1(burst_start_INST_0_i_2_n_0),
        .I2(burst_start_INST_0_i_3_n_0),
        .I3(burst_start_INST_0_i_4_n_0),
        .O(burst_start));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    burst_start_INST_0_i_1
       (.I0(completed_count[22]),
        .I1(completed_count[24]),
        .I2(completed_count[6]),
        .I3(completed_count[15]),
        .I4(burst_start_INST_0_i_5_n_0),
        .I5(burst_start_INST_0_i_6_n_0),
        .O(burst_start_INST_0_i_1_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    burst_start_INST_0_i_2
       (.I0(completed_count[2]),
        .I1(completed_count[30]),
        .I2(completed_count[0]),
        .I3(completed_count[5]),
        .I4(burst_start_INST_0_i_7_n_0),
        .O(burst_start_INST_0_i_2_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    burst_start_INST_0_i_3
       (.I0(completed_count[13]),
        .I1(completed_count[23]),
        .I2(completed_count[10]),
        .I3(completed_count[18]),
        .I4(burst_start_INST_0_i_8_n_0),
        .O(burst_start_INST_0_i_3_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFEFF)) 
    burst_start_INST_0_i_4
       (.I0(completed_count[27]),
        .I1(completed_count[11]),
        .I2(completed_count[7]),
        .I3(running),
        .I4(completed_count[20]),
        .I5(completed_count[21]),
        .O(burst_start_INST_0_i_4_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    burst_start_INST_0_i_5
       (.I0(completed_count[12]),
        .I1(completed_count[4]),
        .I2(completed_count[17]),
        .I3(completed_count[9]),
        .O(burst_start_INST_0_i_5_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    burst_start_INST_0_i_6
       (.I0(completed_count[25]),
        .I1(completed_count[3]),
        .I2(completed_count[26]),
        .I3(completed_count[8]),
        .O(burst_start_INST_0_i_6_n_0));
  LUT4 #(
    .INIT(16'hFFEF)) 
    burst_start_INST_0_i_7
       (.I0(completed_count[19]),
        .I1(completed_count[1]),
        .I2(period_start),
        .I3(completed_count[16]),
        .O(burst_start_INST_0_i_7_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    burst_start_INST_0_i_8
       (.I0(completed_count[31]),
        .I1(completed_count[29]),
        .I2(completed_count[28]),
        .I3(completed_count[14]),
        .O(burst_start_INST_0_i_8_n_0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h80)) 
    cancelled_i_1
       (.I0(\counter_reg[0]_0 ),
        .I1(running),
        .I2(s_axi_aresetn),
        .O(cancelled_i_1_n_0));
  FDRE cancelled_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(cancelled_i_1_n_0),
        .Q(cancelled),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFFB8FFFFFF0000)) 
    cancelled_sticky_i_1
       (.I0(cancelled_sticky_reg),
        .I1(Q[1]),
        .I2(done_sticky_i_3_n_0),
        .I3(done_sticky_reg_0),
        .I4(cancelled_sticky0),
        .I5(data1[1]),
        .O(\write_address_reg[3]_2 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAA8AAAAAA)) 
    cancelled_sticky_i_3
       (.I0(cancelled),
        .I1(\error_sticky_reg[1]_3 ),
        .I2(launch_valid_reg),
        .I3(\s_axi_bresp_reg[1]_0 ),
        .I4(\error_sticky_reg[1] ),
        .I5(cancelled_sticky_reg_0),
        .O(cancelled_sticky0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h04000000)) 
    cfg_error_i_1
       (.I0(running),
        .I1(s_axi_aresetn),
        .I2(\counter_reg[0]_0 ),
        .I3(cfg_error_reg_0),
        .I4(cfg_error_i_2_n_0),
        .O(cfg_error_i_1_n_0));
  LUT5 #(
    .INIT(32'h4F44FFFF)) 
    cfg_error_i_2
       (.I0(\active_period_count[31]_i_6_n_0 ),
        .I1(\active_period_count[31]_i_5_n_0 ),
        .I2(\active_period_count[31]_i_4_n_0 ),
        .I3(\active_period_count[31]_i_3_n_0 ),
        .I4(parameters_ok1),
        .O(cfg_error_i_2_n_0));
  FDRE cfg_error_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(cfg_error_i_1_n_0),
        .Q(cfg_error),
        .R(1'b0));
  LUT2 #(
    .INIT(4'hB)) 
    \completed_periods[0]_i_1 
       (.I0(\active_period_count[31]_i_1_n_0 ),
        .I1(s_axi_aresetn),
        .O(\completed_periods[0]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h40)) 
    \completed_periods[0]_i_2 
       (.I0(\counter_reg[0]_0 ),
        .I1(running),
        .I2(cycle_end0),
        .O(\completed_periods[0]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \completed_periods[0]_i_4 
       (.I0(completed_count[0]),
        .O(running1[0]));
  FDRE \completed_periods_reg[0] 
       (.C(s_axi_aclk),
        .CE(\completed_periods[0]_i_2_n_0 ),
        .D(\completed_periods_reg[0]_i_3_n_7 ),
        .Q(completed_count[0]),
        .R(\completed_periods[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \completed_periods_reg[0]_i_3 
       (.CI(1'b0),
        .CO({\completed_periods_reg[0]_i_3_n_0 ,\completed_periods_reg[0]_i_3_n_1 ,\completed_periods_reg[0]_i_3_n_2 ,\completed_periods_reg[0]_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\completed_periods_reg[0]_i_3_n_4 ,\completed_periods_reg[0]_i_3_n_5 ,\completed_periods_reg[0]_i_3_n_6 ,\completed_periods_reg[0]_i_3_n_7 }),
        .S({completed_count[3:1],running1[0]}));
  FDRE \completed_periods_reg[10] 
       (.C(s_axi_aclk),
        .CE(\completed_periods[0]_i_2_n_0 ),
        .D(\completed_periods_reg[8]_i_1_n_5 ),
        .Q(completed_count[10]),
        .R(\completed_periods[0]_i_1_n_0 ));
  FDRE \completed_periods_reg[11] 
       (.C(s_axi_aclk),
        .CE(\completed_periods[0]_i_2_n_0 ),
        .D(\completed_periods_reg[8]_i_1_n_4 ),
        .Q(completed_count[11]),
        .R(\completed_periods[0]_i_1_n_0 ));
  FDRE \completed_periods_reg[12] 
       (.C(s_axi_aclk),
        .CE(\completed_periods[0]_i_2_n_0 ),
        .D(\completed_periods_reg[12]_i_1_n_7 ),
        .Q(completed_count[12]),
        .R(\completed_periods[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \completed_periods_reg[12]_i_1 
       (.CI(\completed_periods_reg[8]_i_1_n_0 ),
        .CO({\completed_periods_reg[12]_i_1_n_0 ,\completed_periods_reg[12]_i_1_n_1 ,\completed_periods_reg[12]_i_1_n_2 ,\completed_periods_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\completed_periods_reg[12]_i_1_n_4 ,\completed_periods_reg[12]_i_1_n_5 ,\completed_periods_reg[12]_i_1_n_6 ,\completed_periods_reg[12]_i_1_n_7 }),
        .S(completed_count[15:12]));
  FDRE \completed_periods_reg[13] 
       (.C(s_axi_aclk),
        .CE(\completed_periods[0]_i_2_n_0 ),
        .D(\completed_periods_reg[12]_i_1_n_6 ),
        .Q(completed_count[13]),
        .R(\completed_periods[0]_i_1_n_0 ));
  FDRE \completed_periods_reg[14] 
       (.C(s_axi_aclk),
        .CE(\completed_periods[0]_i_2_n_0 ),
        .D(\completed_periods_reg[12]_i_1_n_5 ),
        .Q(completed_count[14]),
        .R(\completed_periods[0]_i_1_n_0 ));
  FDRE \completed_periods_reg[15] 
       (.C(s_axi_aclk),
        .CE(\completed_periods[0]_i_2_n_0 ),
        .D(\completed_periods_reg[12]_i_1_n_4 ),
        .Q(completed_count[15]),
        .R(\completed_periods[0]_i_1_n_0 ));
  FDRE \completed_periods_reg[16] 
       (.C(s_axi_aclk),
        .CE(\completed_periods[0]_i_2_n_0 ),
        .D(\completed_periods_reg[16]_i_1_n_7 ),
        .Q(completed_count[16]),
        .R(\completed_periods[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \completed_periods_reg[16]_i_1 
       (.CI(\completed_periods_reg[12]_i_1_n_0 ),
        .CO({\completed_periods_reg[16]_i_1_n_0 ,\completed_periods_reg[16]_i_1_n_1 ,\completed_periods_reg[16]_i_1_n_2 ,\completed_periods_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\completed_periods_reg[16]_i_1_n_4 ,\completed_periods_reg[16]_i_1_n_5 ,\completed_periods_reg[16]_i_1_n_6 ,\completed_periods_reg[16]_i_1_n_7 }),
        .S(completed_count[19:16]));
  FDRE \completed_periods_reg[17] 
       (.C(s_axi_aclk),
        .CE(\completed_periods[0]_i_2_n_0 ),
        .D(\completed_periods_reg[16]_i_1_n_6 ),
        .Q(completed_count[17]),
        .R(\completed_periods[0]_i_1_n_0 ));
  FDRE \completed_periods_reg[18] 
       (.C(s_axi_aclk),
        .CE(\completed_periods[0]_i_2_n_0 ),
        .D(\completed_periods_reg[16]_i_1_n_5 ),
        .Q(completed_count[18]),
        .R(\completed_periods[0]_i_1_n_0 ));
  FDRE \completed_periods_reg[19] 
       (.C(s_axi_aclk),
        .CE(\completed_periods[0]_i_2_n_0 ),
        .D(\completed_periods_reg[16]_i_1_n_4 ),
        .Q(completed_count[19]),
        .R(\completed_periods[0]_i_1_n_0 ));
  FDRE \completed_periods_reg[1] 
       (.C(s_axi_aclk),
        .CE(\completed_periods[0]_i_2_n_0 ),
        .D(\completed_periods_reg[0]_i_3_n_6 ),
        .Q(completed_count[1]),
        .R(\completed_periods[0]_i_1_n_0 ));
  FDRE \completed_periods_reg[20] 
       (.C(s_axi_aclk),
        .CE(\completed_periods[0]_i_2_n_0 ),
        .D(\completed_periods_reg[20]_i_1_n_7 ),
        .Q(completed_count[20]),
        .R(\completed_periods[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \completed_periods_reg[20]_i_1 
       (.CI(\completed_periods_reg[16]_i_1_n_0 ),
        .CO({\completed_periods_reg[20]_i_1_n_0 ,\completed_periods_reg[20]_i_1_n_1 ,\completed_periods_reg[20]_i_1_n_2 ,\completed_periods_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\completed_periods_reg[20]_i_1_n_4 ,\completed_periods_reg[20]_i_1_n_5 ,\completed_periods_reg[20]_i_1_n_6 ,\completed_periods_reg[20]_i_1_n_7 }),
        .S(completed_count[23:20]));
  FDRE \completed_periods_reg[21] 
       (.C(s_axi_aclk),
        .CE(\completed_periods[0]_i_2_n_0 ),
        .D(\completed_periods_reg[20]_i_1_n_6 ),
        .Q(completed_count[21]),
        .R(\completed_periods[0]_i_1_n_0 ));
  FDRE \completed_periods_reg[22] 
       (.C(s_axi_aclk),
        .CE(\completed_periods[0]_i_2_n_0 ),
        .D(\completed_periods_reg[20]_i_1_n_5 ),
        .Q(completed_count[22]),
        .R(\completed_periods[0]_i_1_n_0 ));
  FDRE \completed_periods_reg[23] 
       (.C(s_axi_aclk),
        .CE(\completed_periods[0]_i_2_n_0 ),
        .D(\completed_periods_reg[20]_i_1_n_4 ),
        .Q(completed_count[23]),
        .R(\completed_periods[0]_i_1_n_0 ));
  FDRE \completed_periods_reg[24] 
       (.C(s_axi_aclk),
        .CE(\completed_periods[0]_i_2_n_0 ),
        .D(\completed_periods_reg[24]_i_1_n_7 ),
        .Q(completed_count[24]),
        .R(\completed_periods[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \completed_periods_reg[24]_i_1 
       (.CI(\completed_periods_reg[20]_i_1_n_0 ),
        .CO({\completed_periods_reg[24]_i_1_n_0 ,\completed_periods_reg[24]_i_1_n_1 ,\completed_periods_reg[24]_i_1_n_2 ,\completed_periods_reg[24]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\completed_periods_reg[24]_i_1_n_4 ,\completed_periods_reg[24]_i_1_n_5 ,\completed_periods_reg[24]_i_1_n_6 ,\completed_periods_reg[24]_i_1_n_7 }),
        .S(completed_count[27:24]));
  FDRE \completed_periods_reg[25] 
       (.C(s_axi_aclk),
        .CE(\completed_periods[0]_i_2_n_0 ),
        .D(\completed_periods_reg[24]_i_1_n_6 ),
        .Q(completed_count[25]),
        .R(\completed_periods[0]_i_1_n_0 ));
  FDRE \completed_periods_reg[26] 
       (.C(s_axi_aclk),
        .CE(\completed_periods[0]_i_2_n_0 ),
        .D(\completed_periods_reg[24]_i_1_n_5 ),
        .Q(completed_count[26]),
        .R(\completed_periods[0]_i_1_n_0 ));
  FDRE \completed_periods_reg[27] 
       (.C(s_axi_aclk),
        .CE(\completed_periods[0]_i_2_n_0 ),
        .D(\completed_periods_reg[24]_i_1_n_4 ),
        .Q(completed_count[27]),
        .R(\completed_periods[0]_i_1_n_0 ));
  FDRE \completed_periods_reg[28] 
       (.C(s_axi_aclk),
        .CE(\completed_periods[0]_i_2_n_0 ),
        .D(\completed_periods_reg[28]_i_1_n_7 ),
        .Q(completed_count[28]),
        .R(\completed_periods[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \completed_periods_reg[28]_i_1 
       (.CI(\completed_periods_reg[24]_i_1_n_0 ),
        .CO({\NLW_completed_periods_reg[28]_i_1_CO_UNCONNECTED [3],\completed_periods_reg[28]_i_1_n_1 ,\completed_periods_reg[28]_i_1_n_2 ,\completed_periods_reg[28]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\completed_periods_reg[28]_i_1_n_4 ,\completed_periods_reg[28]_i_1_n_5 ,\completed_periods_reg[28]_i_1_n_6 ,\completed_periods_reg[28]_i_1_n_7 }),
        .S(completed_count[31:28]));
  FDRE \completed_periods_reg[29] 
       (.C(s_axi_aclk),
        .CE(\completed_periods[0]_i_2_n_0 ),
        .D(\completed_periods_reg[28]_i_1_n_6 ),
        .Q(completed_count[29]),
        .R(\completed_periods[0]_i_1_n_0 ));
  FDRE \completed_periods_reg[2] 
       (.C(s_axi_aclk),
        .CE(\completed_periods[0]_i_2_n_0 ),
        .D(\completed_periods_reg[0]_i_3_n_5 ),
        .Q(completed_count[2]),
        .R(\completed_periods[0]_i_1_n_0 ));
  FDRE \completed_periods_reg[30] 
       (.C(s_axi_aclk),
        .CE(\completed_periods[0]_i_2_n_0 ),
        .D(\completed_periods_reg[28]_i_1_n_5 ),
        .Q(completed_count[30]),
        .R(\completed_periods[0]_i_1_n_0 ));
  FDRE \completed_periods_reg[31] 
       (.C(s_axi_aclk),
        .CE(\completed_periods[0]_i_2_n_0 ),
        .D(\completed_periods_reg[28]_i_1_n_4 ),
        .Q(completed_count[31]),
        .R(\completed_periods[0]_i_1_n_0 ));
  FDRE \completed_periods_reg[3] 
       (.C(s_axi_aclk),
        .CE(\completed_periods[0]_i_2_n_0 ),
        .D(\completed_periods_reg[0]_i_3_n_4 ),
        .Q(completed_count[3]),
        .R(\completed_periods[0]_i_1_n_0 ));
  FDRE \completed_periods_reg[4] 
       (.C(s_axi_aclk),
        .CE(\completed_periods[0]_i_2_n_0 ),
        .D(\completed_periods_reg[4]_i_1_n_7 ),
        .Q(completed_count[4]),
        .R(\completed_periods[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \completed_periods_reg[4]_i_1 
       (.CI(\completed_periods_reg[0]_i_3_n_0 ),
        .CO({\completed_periods_reg[4]_i_1_n_0 ,\completed_periods_reg[4]_i_1_n_1 ,\completed_periods_reg[4]_i_1_n_2 ,\completed_periods_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\completed_periods_reg[4]_i_1_n_4 ,\completed_periods_reg[4]_i_1_n_5 ,\completed_periods_reg[4]_i_1_n_6 ,\completed_periods_reg[4]_i_1_n_7 }),
        .S(completed_count[7:4]));
  FDRE \completed_periods_reg[5] 
       (.C(s_axi_aclk),
        .CE(\completed_periods[0]_i_2_n_0 ),
        .D(\completed_periods_reg[4]_i_1_n_6 ),
        .Q(completed_count[5]),
        .R(\completed_periods[0]_i_1_n_0 ));
  FDRE \completed_periods_reg[6] 
       (.C(s_axi_aclk),
        .CE(\completed_periods[0]_i_2_n_0 ),
        .D(\completed_periods_reg[4]_i_1_n_5 ),
        .Q(completed_count[6]),
        .R(\completed_periods[0]_i_1_n_0 ));
  FDRE \completed_periods_reg[7] 
       (.C(s_axi_aclk),
        .CE(\completed_periods[0]_i_2_n_0 ),
        .D(\completed_periods_reg[4]_i_1_n_4 ),
        .Q(completed_count[7]),
        .R(\completed_periods[0]_i_1_n_0 ));
  FDRE \completed_periods_reg[8] 
       (.C(s_axi_aclk),
        .CE(\completed_periods[0]_i_2_n_0 ),
        .D(\completed_periods_reg[8]_i_1_n_7 ),
        .Q(completed_count[8]),
        .R(\completed_periods[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \completed_periods_reg[8]_i_1 
       (.CI(\completed_periods_reg[4]_i_1_n_0 ),
        .CO({\completed_periods_reg[8]_i_1_n_0 ,\completed_periods_reg[8]_i_1_n_1 ,\completed_periods_reg[8]_i_1_n_2 ,\completed_periods_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\completed_periods_reg[8]_i_1_n_4 ,\completed_periods_reg[8]_i_1_n_5 ,\completed_periods_reg[8]_i_1_n_6 ,\completed_periods_reg[8]_i_1_n_7 }),
        .S(completed_count[11:8]));
  FDRE \completed_periods_reg[9] 
       (.C(s_axi_aclk),
        .CE(\completed_periods[0]_i_2_n_0 ),
        .D(\completed_periods_reg[8]_i_1_n_6 ),
        .Q(completed_count[9]),
        .R(\completed_periods[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hF0ECFFFF)) 
    \counter[0]_i_1 
       (.I0(cycle_end0),
        .I1(\active_period_count[31]_i_1_n_0 ),
        .I2(running),
        .I3(\counter_reg[0]_0 ),
        .I4(s_axi_aresetn),
        .O(\counter[0]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hBA)) 
    \counter[0]_i_2 
       (.I0(\active_period_count[31]_i_1_n_0 ),
        .I1(\counter_reg[0]_0 ),
        .I2(running),
        .O(pwm_out5_out));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[0]_i_4 
       (.I0(counter_reg[0]),
        .O(p_0_in[0]));
  FDRE \counter_reg[0] 
       (.C(s_axi_aclk),
        .CE(pwm_out5_out),
        .D(\counter_reg[0]_i_3_n_7 ),
        .Q(counter_reg[0]),
        .R(\counter[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[0]_i_3 
       (.CI(1'b0),
        .CO({\counter_reg[0]_i_3_n_0 ,\counter_reg[0]_i_3_n_1 ,\counter_reg[0]_i_3_n_2 ,\counter_reg[0]_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\counter_reg[0]_i_3_n_4 ,\counter_reg[0]_i_3_n_5 ,\counter_reg[0]_i_3_n_6 ,\counter_reg[0]_i_3_n_7 }),
        .S({counter_reg[3:1],p_0_in[0]}));
  FDRE \counter_reg[10] 
       (.C(s_axi_aclk),
        .CE(pwm_out5_out),
        .D(\counter_reg[8]_i_1_n_5 ),
        .Q(counter_reg[10]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[11] 
       (.C(s_axi_aclk),
        .CE(pwm_out5_out),
        .D(\counter_reg[8]_i_1_n_4 ),
        .Q(counter_reg[11]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[12] 
       (.C(s_axi_aclk),
        .CE(pwm_out5_out),
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
        .CE(pwm_out5_out),
        .D(\counter_reg[12]_i_1_n_6 ),
        .Q(counter_reg[13]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[14] 
       (.C(s_axi_aclk),
        .CE(pwm_out5_out),
        .D(\counter_reg[12]_i_1_n_5 ),
        .Q(counter_reg[14]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[15] 
       (.C(s_axi_aclk),
        .CE(pwm_out5_out),
        .D(\counter_reg[12]_i_1_n_4 ),
        .Q(counter_reg[15]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[16] 
       (.C(s_axi_aclk),
        .CE(pwm_out5_out),
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
        .CE(pwm_out5_out),
        .D(\counter_reg[16]_i_1_n_6 ),
        .Q(counter_reg[17]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[18] 
       (.C(s_axi_aclk),
        .CE(pwm_out5_out),
        .D(\counter_reg[16]_i_1_n_5 ),
        .Q(counter_reg[18]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[19] 
       (.C(s_axi_aclk),
        .CE(pwm_out5_out),
        .D(\counter_reg[16]_i_1_n_4 ),
        .Q(counter_reg[19]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[1] 
       (.C(s_axi_aclk),
        .CE(pwm_out5_out),
        .D(\counter_reg[0]_i_3_n_6 ),
        .Q(counter_reg[1]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[20] 
       (.C(s_axi_aclk),
        .CE(pwm_out5_out),
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
        .CE(pwm_out5_out),
        .D(\counter_reg[20]_i_1_n_6 ),
        .Q(counter_reg[21]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[22] 
       (.C(s_axi_aclk),
        .CE(pwm_out5_out),
        .D(\counter_reg[20]_i_1_n_5 ),
        .Q(counter_reg[22]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[23] 
       (.C(s_axi_aclk),
        .CE(pwm_out5_out),
        .D(\counter_reg[20]_i_1_n_4 ),
        .Q(counter_reg[23]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[24] 
       (.C(s_axi_aclk),
        .CE(pwm_out5_out),
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
        .CE(pwm_out5_out),
        .D(\counter_reg[24]_i_1_n_6 ),
        .Q(counter_reg[25]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[26] 
       (.C(s_axi_aclk),
        .CE(pwm_out5_out),
        .D(\counter_reg[24]_i_1_n_5 ),
        .Q(counter_reg[26]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[27] 
       (.C(s_axi_aclk),
        .CE(pwm_out5_out),
        .D(\counter_reg[24]_i_1_n_4 ),
        .Q(counter_reg[27]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[28] 
       (.C(s_axi_aclk),
        .CE(pwm_out5_out),
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
        .CE(pwm_out5_out),
        .D(\counter_reg[28]_i_1_n_6 ),
        .Q(counter_reg[29]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[2] 
       (.C(s_axi_aclk),
        .CE(pwm_out5_out),
        .D(\counter_reg[0]_i_3_n_5 ),
        .Q(counter_reg[2]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[30] 
       (.C(s_axi_aclk),
        .CE(pwm_out5_out),
        .D(\counter_reg[28]_i_1_n_5 ),
        .Q(counter_reg[30]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[31] 
       (.C(s_axi_aclk),
        .CE(pwm_out5_out),
        .D(\counter_reg[28]_i_1_n_4 ),
        .Q(counter_reg[31]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[3] 
       (.C(s_axi_aclk),
        .CE(pwm_out5_out),
        .D(\counter_reg[0]_i_3_n_4 ),
        .Q(counter_reg[3]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[4] 
       (.C(s_axi_aclk),
        .CE(pwm_out5_out),
        .D(\counter_reg[4]_i_1_n_7 ),
        .Q(counter_reg[4]),
        .R(\counter[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[4]_i_1 
       (.CI(\counter_reg[0]_i_3_n_0 ),
        .CO({\counter_reg[4]_i_1_n_0 ,\counter_reg[4]_i_1_n_1 ,\counter_reg[4]_i_1_n_2 ,\counter_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[4]_i_1_n_4 ,\counter_reg[4]_i_1_n_5 ,\counter_reg[4]_i_1_n_6 ,\counter_reg[4]_i_1_n_7 }),
        .S(counter_reg[7:4]));
  FDRE \counter_reg[5] 
       (.C(s_axi_aclk),
        .CE(pwm_out5_out),
        .D(\counter_reg[4]_i_1_n_6 ),
        .Q(counter_reg[5]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[6] 
       (.C(s_axi_aclk),
        .CE(pwm_out5_out),
        .D(\counter_reg[4]_i_1_n_5 ),
        .Q(counter_reg[6]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[7] 
       (.C(s_axi_aclk),
        .CE(pwm_out5_out),
        .D(\counter_reg[4]_i_1_n_4 ),
        .Q(counter_reg[7]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[8] 
       (.C(s_axi_aclk),
        .CE(pwm_out5_out),
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
        .CE(pwm_out5_out),
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
       (.I0(counter_reg[12]),
        .I1(cycle_end1[12]),
        .I2(counter_reg[13]),
        .I3(cycle_end1[13]),
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
       (.I0(cycle_end1[31]),
        .I1(counter_reg[31]),
        .I2(cycle_end1[30]),
        .I3(counter_reg[30]),
        .O(cycle_end0_carry__1_i_1_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    cycle_end0_carry__1_i_2
       (.I0(counter_reg[27]),
        .I1(cycle_end1[27]),
        .I2(counter_reg[28]),
        .I3(cycle_end1[28]),
        .I4(cycle_end1[29]),
        .I5(counter_reg[29]),
        .O(cycle_end0_carry__1_i_2_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    cycle_end0_carry__1_i_3
       (.I0(counter_reg[24]),
        .I1(cycle_end1[24]),
        .I2(counter_reg[25]),
        .I3(cycle_end1[25]),
        .I4(cycle_end1[26]),
        .I5(counter_reg[26]),
        .O(cycle_end0_carry__1_i_3_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    cycle_end0_carry_i_1
       (.I0(counter_reg[9]),
        .I1(cycle_end1[9]),
        .I2(counter_reg[10]),
        .I3(cycle_end1[10]),
        .I4(cycle_end1[11]),
        .I5(counter_reg[11]),
        .O(cycle_end0_carry_i_1_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    cycle_end0_carry_i_2
       (.I0(counter_reg[6]),
        .I1(cycle_end1[6]),
        .I2(counter_reg[7]),
        .I3(cycle_end1[7]),
        .I4(cycle_end1[8]),
        .I5(counter_reg[8]),
        .O(cycle_end0_carry_i_2_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    cycle_end0_carry_i_3
       (.I0(counter_reg[3]),
        .I1(cycle_end1[3]),
        .I2(counter_reg[4]),
        .I3(cycle_end1[4]),
        .I4(cycle_end1[5]),
        .I5(counter_reg[5]),
        .O(cycle_end0_carry_i_3_n_0));
  LUT6 #(
    .INIT(64'h0990000000000990)) 
    cycle_end0_carry_i_4
       (.I0(counter_reg[1]),
        .I1(cycle_end1[1]),
        .I2(counter_reg[0]),
        .I3(active_period[0]),
        .I4(cycle_end1[2]),
        .I5(counter_reg[2]),
        .O(cycle_end0_carry_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 cycle_end1_carry
       (.CI(1'b0),
        .CO({cycle_end1_carry_n_0,cycle_end1_carry_n_1,cycle_end1_carry_n_2,cycle_end1_carry_n_3}),
        .CYINIT(active_period[0]),
        .DI(active_period[4:1]),
        .O(cycle_end1[4:1]),
        .S({cycle_end1_carry_i_1_n_0,cycle_end1_carry_i_2_n_0,cycle_end1_carry_i_3_n_0,cycle_end1_carry_i_4_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 cycle_end1_carry__0
       (.CI(cycle_end1_carry_n_0),
        .CO({cycle_end1_carry__0_n_0,cycle_end1_carry__0_n_1,cycle_end1_carry__0_n_2,cycle_end1_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI(active_period[8:5]),
        .O(cycle_end1[8:5]),
        .S({cycle_end1_carry__0_i_1_n_0,cycle_end1_carry__0_i_2_n_0,cycle_end1_carry__0_i_3_n_0,cycle_end1_carry__0_i_4_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    cycle_end1_carry__0_i_1
       (.I0(active_period[8]),
        .O(cycle_end1_carry__0_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    cycle_end1_carry__0_i_2
       (.I0(active_period[7]),
        .O(cycle_end1_carry__0_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    cycle_end1_carry__0_i_3
       (.I0(active_period[6]),
        .O(cycle_end1_carry__0_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    cycle_end1_carry__0_i_4
       (.I0(active_period[5]),
        .O(cycle_end1_carry__0_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 cycle_end1_carry__1
       (.CI(cycle_end1_carry__0_n_0),
        .CO({cycle_end1_carry__1_n_0,cycle_end1_carry__1_n_1,cycle_end1_carry__1_n_2,cycle_end1_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI(active_period[12:9]),
        .O(cycle_end1[12:9]),
        .S({cycle_end1_carry__1_i_1_n_0,cycle_end1_carry__1_i_2_n_0,cycle_end1_carry__1_i_3_n_0,cycle_end1_carry__1_i_4_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    cycle_end1_carry__1_i_1
       (.I0(active_period[12]),
        .O(cycle_end1_carry__1_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    cycle_end1_carry__1_i_2
       (.I0(active_period[11]),
        .O(cycle_end1_carry__1_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    cycle_end1_carry__1_i_3
       (.I0(active_period[10]),
        .O(cycle_end1_carry__1_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    cycle_end1_carry__1_i_4
       (.I0(active_period[9]),
        .O(cycle_end1_carry__1_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 cycle_end1_carry__2
       (.CI(cycle_end1_carry__1_n_0),
        .CO({cycle_end1_carry__2_n_0,cycle_end1_carry__2_n_1,cycle_end1_carry__2_n_2,cycle_end1_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI(active_period[16:13]),
        .O(cycle_end1[16:13]),
        .S({cycle_end1_carry__2_i_1_n_0,cycle_end1_carry__2_i_2_n_0,cycle_end1_carry__2_i_3_n_0,cycle_end1_carry__2_i_4_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    cycle_end1_carry__2_i_1
       (.I0(active_period[16]),
        .O(cycle_end1_carry__2_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    cycle_end1_carry__2_i_2
       (.I0(active_period[15]),
        .O(cycle_end1_carry__2_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    cycle_end1_carry__2_i_3
       (.I0(active_period[14]),
        .O(cycle_end1_carry__2_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    cycle_end1_carry__2_i_4
       (.I0(active_period[13]),
        .O(cycle_end1_carry__2_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 cycle_end1_carry__3
       (.CI(cycle_end1_carry__2_n_0),
        .CO({cycle_end1_carry__3_n_0,cycle_end1_carry__3_n_1,cycle_end1_carry__3_n_2,cycle_end1_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI(active_period[20:17]),
        .O(cycle_end1[20:17]),
        .S({cycle_end1_carry__3_i_1_n_0,cycle_end1_carry__3_i_2_n_0,cycle_end1_carry__3_i_3_n_0,cycle_end1_carry__3_i_4_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    cycle_end1_carry__3_i_1
       (.I0(active_period[20]),
        .O(cycle_end1_carry__3_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    cycle_end1_carry__3_i_2
       (.I0(active_period[19]),
        .O(cycle_end1_carry__3_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    cycle_end1_carry__3_i_3
       (.I0(active_period[18]),
        .O(cycle_end1_carry__3_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    cycle_end1_carry__3_i_4
       (.I0(active_period[17]),
        .O(cycle_end1_carry__3_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 cycle_end1_carry__4
       (.CI(cycle_end1_carry__3_n_0),
        .CO({cycle_end1_carry__4_n_0,cycle_end1_carry__4_n_1,cycle_end1_carry__4_n_2,cycle_end1_carry__4_n_3}),
        .CYINIT(1'b0),
        .DI(active_period[24:21]),
        .O(cycle_end1[24:21]),
        .S({cycle_end1_carry__4_i_1_n_0,cycle_end1_carry__4_i_2_n_0,cycle_end1_carry__4_i_3_n_0,cycle_end1_carry__4_i_4_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    cycle_end1_carry__4_i_1
       (.I0(active_period[24]),
        .O(cycle_end1_carry__4_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    cycle_end1_carry__4_i_2
       (.I0(active_period[23]),
        .O(cycle_end1_carry__4_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    cycle_end1_carry__4_i_3
       (.I0(active_period[22]),
        .O(cycle_end1_carry__4_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    cycle_end1_carry__4_i_4
       (.I0(active_period[21]),
        .O(cycle_end1_carry__4_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 cycle_end1_carry__5
       (.CI(cycle_end1_carry__4_n_0),
        .CO({cycle_end1_carry__5_n_0,cycle_end1_carry__5_n_1,cycle_end1_carry__5_n_2,cycle_end1_carry__5_n_3}),
        .CYINIT(1'b0),
        .DI(active_period[28:25]),
        .O(cycle_end1[28:25]),
        .S({cycle_end1_carry__5_i_1_n_0,cycle_end1_carry__5_i_2_n_0,cycle_end1_carry__5_i_3_n_0,cycle_end1_carry__5_i_4_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    cycle_end1_carry__5_i_1
       (.I0(active_period[28]),
        .O(cycle_end1_carry__5_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    cycle_end1_carry__5_i_2
       (.I0(active_period[27]),
        .O(cycle_end1_carry__5_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    cycle_end1_carry__5_i_3
       (.I0(active_period[26]),
        .O(cycle_end1_carry__5_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    cycle_end1_carry__5_i_4
       (.I0(active_period[25]),
        .O(cycle_end1_carry__5_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 cycle_end1_carry__6
       (.CI(cycle_end1_carry__5_n_0),
        .CO({NLW_cycle_end1_carry__6_CO_UNCONNECTED[3:2],cycle_end1_carry__6_n_2,cycle_end1_carry__6_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,active_period[30:29]}),
        .O({NLW_cycle_end1_carry__6_O_UNCONNECTED[3],cycle_end1[31:29]}),
        .S({1'b0,cycle_end1_carry__6_i_1_n_0,cycle_end1_carry__6_i_2_n_0,cycle_end1_carry__6_i_3_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    cycle_end1_carry__6_i_1
       (.I0(active_period[31]),
        .O(cycle_end1_carry__6_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    cycle_end1_carry__6_i_2
       (.I0(active_period[30]),
        .O(cycle_end1_carry__6_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    cycle_end1_carry__6_i_3
       (.I0(active_period[29]),
        .O(cycle_end1_carry__6_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    cycle_end1_carry_i_1
       (.I0(active_period[4]),
        .O(cycle_end1_carry_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    cycle_end1_carry_i_2
       (.I0(active_period[3]),
        .O(cycle_end1_carry_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    cycle_end1_carry_i_3
       (.I0(active_period[2]),
        .O(cycle_end1_carry_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    cycle_end1_carry_i_4
       (.I0(active_period[1]),
        .O(cycle_end1_carry_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h40000000)) 
    done_event_i_1
       (.I0(\counter_reg[0]_0 ),
        .I1(running0),
        .I2(cycle_end0),
        .I3(running),
        .I4(s_axi_aresetn),
        .O(done_event_i_1_n_0));
  FDRE done_event_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(done_event_i_1_n_0),
        .Q(done_event),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0444044404040000)) 
    done_i_1
       (.I0(\active_period_count[31]_i_1_n_0 ),
        .I1(s_axi_aresetn),
        .I2(\counter_reg[0]_0 ),
        .I3(running),
        .I4(pwm_out_i_5_n_0),
        .I5(done),
        .O(done_i_1_n_0));
  FDRE done_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(done_i_1_n_0),
        .Q(done),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFFB8FFFFFF0000)) 
    done_sticky_i_1
       (.I0(done_sticky_reg),
        .I1(Q[1]),
        .I2(done_sticky_i_3_n_0),
        .I3(done_sticky_reg_0),
        .I4(done_sticky0),
        .I5(data1[0]),
        .O(\write_address_reg[3]_1 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFEF)) 
    done_sticky_i_3
       (.I0(cfg_error_reg_0),
        .I1(\counter_reg[0]_0 ),
        .I2(s_axi_aresetn),
        .I3(running),
        .I4(\error_sticky_reg[1]_3 ),
        .I5(\launch_count_reg[0]_0 ),
        .O(done_sticky_i_3_n_0));
  LUT6 #(
    .INIT(64'hAAAAAAAAA8AAAAAA)) 
    done_sticky_i_5
       (.I0(done_event),
        .I1(\error_sticky_reg[1]_3 ),
        .I2(launch_valid_reg),
        .I3(\s_axi_bresp_reg[1]_0 ),
        .I4(\error_sticky_reg[1] ),
        .I5(cancelled_sticky_reg_0),
        .O(done_sticky0));
  LUT6 #(
    .INIT(64'hFF70FFFFFF500000)) 
    \error_sticky[1]_i_1 
       (.I0(Q[1]),
        .I1(\error_sticky_reg[2] [1]),
        .I2(\error_sticky_reg[1] ),
        .I3(cfg_error),
        .I4(\error_sticky[1]_i_2_n_0 ),
        .I5(\error_sticky_reg[1]_0 ),
        .O(\write_address_reg[3] ));
  LUT5 #(
    .INIT(32'hFFFF7500)) 
    \error_sticky[1]_i_2 
       (.I0(\error_sticky_reg[1]_1 ),
        .I1(\error_sticky_reg[1]_2 ),
        .I2(\error_sticky_reg[1]_3 ),
        .I3(\error_sticky_reg[1]_4 ),
        .I4(cfg_error),
        .O(\error_sticky[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h2E00FFFF22000000)) 
    \error_sticky[2]_i_1 
       (.I0(launch_valid_reg),
        .I1(Q[1]),
        .I2(\error_sticky_reg[2] [2]),
        .I3(\error_sticky_reg[1] ),
        .I4(\error_sticky[2]_i_2_n_0 ),
        .I5(\error_sticky_reg[2]_0 ),
        .O(\write_address_reg[3]_0 ));
  LUT5 #(
    .INIT(32'h0020AAAA)) 
    \error_sticky[2]_i_2 
       (.I0(\error_sticky_reg[1]_4 ),
        .I1(\error_sticky_reg[1]_2 ),
        .I2(launch_valid_reg),
        .I3(\error_sticky_reg[1]_3 ),
        .I4(\error_sticky_reg[1]_1 ),
        .O(\error_sticky[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000002000000000)) 
    \launch_period[31]_i_1 
       (.I0(address_pending0),
        .I1(done_sticky_i_3_n_0),
        .I2(Q[0]),
        .I3(Q[2]),
        .I4(\launch_count_reg[0] ),
        .I5(\error_sticky_reg[1] ),
        .O(E));
  LUT5 #(
    .INIT(32'h08000000)) 
    launch_valid_i_1
       (.I0(launch_valid_reg_0),
        .I1(Q[0]),
        .I2(done_sticky_i_3_n_0),
        .I3(address_pending0),
        .I4(s_axi_aresetn),
        .O(\write_address_reg[2] ));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 parameters_ok1_carry
       (.CI(1'b0),
        .CO({parameters_ok1_carry_n_0,parameters_ok1_carry_n_1,parameters_ok1_carry_n_2,parameters_ok1_carry_n_3}),
        .CYINIT(1'b1),
        .DI({parameters_ok1_carry_i_1_n_0,parameters_ok1_carry_i_2_n_0,parameters_ok1_carry_i_3_n_0,parameters_ok1_carry_i_4_n_0}),
        .O(NLW_parameters_ok1_carry_O_UNCONNECTED[3:0]),
        .S({parameters_ok1_carry_i_5_n_0,parameters_ok1_carry_i_6_n_0,parameters_ok1_carry_i_7_n_0,parameters_ok1_carry_i_8_n_0}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 parameters_ok1_carry__0
       (.CI(parameters_ok1_carry_n_0),
        .CO({parameters_ok1_carry__0_n_0,parameters_ok1_carry__0_n_1,parameters_ok1_carry__0_n_2,parameters_ok1_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({parameters_ok1_carry__0_i_1_n_0,parameters_ok1_carry__0_i_2_n_0,parameters_ok1_carry__0_i_3_n_0,parameters_ok1_carry__0_i_4_n_0}),
        .O(NLW_parameters_ok1_carry__0_O_UNCONNECTED[3:0]),
        .S({parameters_ok1_carry__0_i_5_n_0,parameters_ok1_carry__0_i_6_n_0,parameters_ok1_carry__0_i_7_n_0,parameters_ok1_carry__0_i_8_n_0}));
  LUT4 #(
    .INIT(16'h22B2)) 
    parameters_ok1_carry__0_i_1
       (.I0(\active_period_ticks_reg[31]_0 [15]),
        .I1(\active_high_ticks_reg[31]_0 [15]),
        .I2(\active_period_ticks_reg[31]_0 [14]),
        .I3(\active_high_ticks_reg[31]_0 [14]),
        .O(parameters_ok1_carry__0_i_1_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    parameters_ok1_carry__0_i_2
       (.I0(\active_period_ticks_reg[31]_0 [13]),
        .I1(\active_high_ticks_reg[31]_0 [13]),
        .I2(\active_period_ticks_reg[31]_0 [12]),
        .I3(\active_high_ticks_reg[31]_0 [12]),
        .O(parameters_ok1_carry__0_i_2_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    parameters_ok1_carry__0_i_3
       (.I0(\active_period_ticks_reg[31]_0 [11]),
        .I1(\active_high_ticks_reg[31]_0 [11]),
        .I2(\active_period_ticks_reg[31]_0 [10]),
        .I3(\active_high_ticks_reg[31]_0 [10]),
        .O(parameters_ok1_carry__0_i_3_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    parameters_ok1_carry__0_i_4
       (.I0(\active_period_ticks_reg[31]_0 [9]),
        .I1(\active_high_ticks_reg[31]_0 [9]),
        .I2(\active_period_ticks_reg[31]_0 [8]),
        .I3(\active_high_ticks_reg[31]_0 [8]),
        .O(parameters_ok1_carry__0_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    parameters_ok1_carry__0_i_5
       (.I0(\active_high_ticks_reg[31]_0 [15]),
        .I1(\active_period_ticks_reg[31]_0 [15]),
        .I2(\active_high_ticks_reg[31]_0 [14]),
        .I3(\active_period_ticks_reg[31]_0 [14]),
        .O(parameters_ok1_carry__0_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    parameters_ok1_carry__0_i_6
       (.I0(\active_high_ticks_reg[31]_0 [13]),
        .I1(\active_period_ticks_reg[31]_0 [13]),
        .I2(\active_high_ticks_reg[31]_0 [12]),
        .I3(\active_period_ticks_reg[31]_0 [12]),
        .O(parameters_ok1_carry__0_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    parameters_ok1_carry__0_i_7
       (.I0(\active_high_ticks_reg[31]_0 [11]),
        .I1(\active_period_ticks_reg[31]_0 [11]),
        .I2(\active_high_ticks_reg[31]_0 [10]),
        .I3(\active_period_ticks_reg[31]_0 [10]),
        .O(parameters_ok1_carry__0_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    parameters_ok1_carry__0_i_8
       (.I0(\active_high_ticks_reg[31]_0 [9]),
        .I1(\active_period_ticks_reg[31]_0 [9]),
        .I2(\active_high_ticks_reg[31]_0 [8]),
        .I3(\active_period_ticks_reg[31]_0 [8]),
        .O(parameters_ok1_carry__0_i_8_n_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 parameters_ok1_carry__1
       (.CI(parameters_ok1_carry__0_n_0),
        .CO({parameters_ok1_carry__1_n_0,parameters_ok1_carry__1_n_1,parameters_ok1_carry__1_n_2,parameters_ok1_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({parameters_ok1_carry__1_i_1_n_0,parameters_ok1_carry__1_i_2_n_0,parameters_ok1_carry__1_i_3_n_0,parameters_ok1_carry__1_i_4_n_0}),
        .O(NLW_parameters_ok1_carry__1_O_UNCONNECTED[3:0]),
        .S({parameters_ok1_carry__1_i_5_n_0,parameters_ok1_carry__1_i_6_n_0,parameters_ok1_carry__1_i_7_n_0,parameters_ok1_carry__1_i_8_n_0}));
  LUT4 #(
    .INIT(16'h22B2)) 
    parameters_ok1_carry__1_i_1
       (.I0(\active_period_ticks_reg[31]_0 [23]),
        .I1(\active_high_ticks_reg[31]_0 [23]),
        .I2(\active_period_ticks_reg[31]_0 [22]),
        .I3(\active_high_ticks_reg[31]_0 [22]),
        .O(parameters_ok1_carry__1_i_1_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    parameters_ok1_carry__1_i_2
       (.I0(\active_period_ticks_reg[31]_0 [21]),
        .I1(\active_high_ticks_reg[31]_0 [21]),
        .I2(\active_period_ticks_reg[31]_0 [20]),
        .I3(\active_high_ticks_reg[31]_0 [20]),
        .O(parameters_ok1_carry__1_i_2_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    parameters_ok1_carry__1_i_3
       (.I0(\active_period_ticks_reg[31]_0 [19]),
        .I1(\active_high_ticks_reg[31]_0 [19]),
        .I2(\active_period_ticks_reg[31]_0 [18]),
        .I3(\active_high_ticks_reg[31]_0 [18]),
        .O(parameters_ok1_carry__1_i_3_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    parameters_ok1_carry__1_i_4
       (.I0(\active_period_ticks_reg[31]_0 [17]),
        .I1(\active_high_ticks_reg[31]_0 [17]),
        .I2(\active_period_ticks_reg[31]_0 [16]),
        .I3(\active_high_ticks_reg[31]_0 [16]),
        .O(parameters_ok1_carry__1_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    parameters_ok1_carry__1_i_5
       (.I0(\active_high_ticks_reg[31]_0 [23]),
        .I1(\active_period_ticks_reg[31]_0 [23]),
        .I2(\active_high_ticks_reg[31]_0 [22]),
        .I3(\active_period_ticks_reg[31]_0 [22]),
        .O(parameters_ok1_carry__1_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    parameters_ok1_carry__1_i_6
       (.I0(\active_high_ticks_reg[31]_0 [21]),
        .I1(\active_period_ticks_reg[31]_0 [21]),
        .I2(\active_high_ticks_reg[31]_0 [20]),
        .I3(\active_period_ticks_reg[31]_0 [20]),
        .O(parameters_ok1_carry__1_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    parameters_ok1_carry__1_i_7
       (.I0(\active_high_ticks_reg[31]_0 [19]),
        .I1(\active_period_ticks_reg[31]_0 [19]),
        .I2(\active_high_ticks_reg[31]_0 [18]),
        .I3(\active_period_ticks_reg[31]_0 [18]),
        .O(parameters_ok1_carry__1_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    parameters_ok1_carry__1_i_8
       (.I0(\active_high_ticks_reg[31]_0 [17]),
        .I1(\active_period_ticks_reg[31]_0 [17]),
        .I2(\active_high_ticks_reg[31]_0 [16]),
        .I3(\active_period_ticks_reg[31]_0 [16]),
        .O(parameters_ok1_carry__1_i_8_n_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 parameters_ok1_carry__2
       (.CI(parameters_ok1_carry__1_n_0),
        .CO({parameters_ok1,parameters_ok1_carry__2_n_1,parameters_ok1_carry__2_n_2,parameters_ok1_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({parameters_ok1_carry__2_i_1_n_0,parameters_ok1_carry__2_i_2_n_0,parameters_ok1_carry__2_i_3_n_0,parameters_ok1_carry__2_i_4_n_0}),
        .O(NLW_parameters_ok1_carry__2_O_UNCONNECTED[3:0]),
        .S({parameters_ok1_carry__2_i_5_n_0,parameters_ok1_carry__2_i_6_n_0,parameters_ok1_carry__2_i_7_n_0,parameters_ok1_carry__2_i_8_n_0}));
  LUT4 #(
    .INIT(16'h22B2)) 
    parameters_ok1_carry__2_i_1
       (.I0(\active_period_ticks_reg[31]_0 [31]),
        .I1(\active_high_ticks_reg[31]_0 [31]),
        .I2(\active_period_ticks_reg[31]_0 [30]),
        .I3(\active_high_ticks_reg[31]_0 [30]),
        .O(parameters_ok1_carry__2_i_1_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    parameters_ok1_carry__2_i_2
       (.I0(\active_period_ticks_reg[31]_0 [29]),
        .I1(\active_high_ticks_reg[31]_0 [29]),
        .I2(\active_period_ticks_reg[31]_0 [28]),
        .I3(\active_high_ticks_reg[31]_0 [28]),
        .O(parameters_ok1_carry__2_i_2_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    parameters_ok1_carry__2_i_3
       (.I0(\active_period_ticks_reg[31]_0 [27]),
        .I1(\active_high_ticks_reg[31]_0 [27]),
        .I2(\active_period_ticks_reg[31]_0 [26]),
        .I3(\active_high_ticks_reg[31]_0 [26]),
        .O(parameters_ok1_carry__2_i_3_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    parameters_ok1_carry__2_i_4
       (.I0(\active_period_ticks_reg[31]_0 [25]),
        .I1(\active_high_ticks_reg[31]_0 [25]),
        .I2(\active_period_ticks_reg[31]_0 [24]),
        .I3(\active_high_ticks_reg[31]_0 [24]),
        .O(parameters_ok1_carry__2_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    parameters_ok1_carry__2_i_5
       (.I0(\active_high_ticks_reg[31]_0 [31]),
        .I1(\active_period_ticks_reg[31]_0 [31]),
        .I2(\active_high_ticks_reg[31]_0 [30]),
        .I3(\active_period_ticks_reg[31]_0 [30]),
        .O(parameters_ok1_carry__2_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    parameters_ok1_carry__2_i_6
       (.I0(\active_high_ticks_reg[31]_0 [29]),
        .I1(\active_period_ticks_reg[31]_0 [29]),
        .I2(\active_high_ticks_reg[31]_0 [28]),
        .I3(\active_period_ticks_reg[31]_0 [28]),
        .O(parameters_ok1_carry__2_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    parameters_ok1_carry__2_i_7
       (.I0(\active_high_ticks_reg[31]_0 [27]),
        .I1(\active_period_ticks_reg[31]_0 [27]),
        .I2(\active_high_ticks_reg[31]_0 [26]),
        .I3(\active_period_ticks_reg[31]_0 [26]),
        .O(parameters_ok1_carry__2_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    parameters_ok1_carry__2_i_8
       (.I0(\active_high_ticks_reg[31]_0 [25]),
        .I1(\active_period_ticks_reg[31]_0 [25]),
        .I2(\active_high_ticks_reg[31]_0 [24]),
        .I3(\active_period_ticks_reg[31]_0 [24]),
        .O(parameters_ok1_carry__2_i_8_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    parameters_ok1_carry_i_1
       (.I0(\active_period_ticks_reg[31]_0 [7]),
        .I1(\active_high_ticks_reg[31]_0 [7]),
        .I2(\active_period_ticks_reg[31]_0 [6]),
        .I3(\active_high_ticks_reg[31]_0 [6]),
        .O(parameters_ok1_carry_i_1_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    parameters_ok1_carry_i_2
       (.I0(\active_period_ticks_reg[31]_0 [5]),
        .I1(\active_high_ticks_reg[31]_0 [5]),
        .I2(\active_period_ticks_reg[31]_0 [4]),
        .I3(\active_high_ticks_reg[31]_0 [4]),
        .O(parameters_ok1_carry_i_2_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    parameters_ok1_carry_i_3
       (.I0(\active_period_ticks_reg[31]_0 [3]),
        .I1(\active_high_ticks_reg[31]_0 [3]),
        .I2(\active_period_ticks_reg[31]_0 [2]),
        .I3(\active_high_ticks_reg[31]_0 [2]),
        .O(parameters_ok1_carry_i_3_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    parameters_ok1_carry_i_4
       (.I0(\active_period_ticks_reg[31]_0 [1]),
        .I1(\active_high_ticks_reg[31]_0 [1]),
        .I2(\active_period_ticks_reg[31]_0 [0]),
        .I3(\active_high_ticks_reg[31]_0 [0]),
        .O(parameters_ok1_carry_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    parameters_ok1_carry_i_5
       (.I0(\active_high_ticks_reg[31]_0 [7]),
        .I1(\active_period_ticks_reg[31]_0 [7]),
        .I2(\active_high_ticks_reg[31]_0 [6]),
        .I3(\active_period_ticks_reg[31]_0 [6]),
        .O(parameters_ok1_carry_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    parameters_ok1_carry_i_6
       (.I0(\active_high_ticks_reg[31]_0 [5]),
        .I1(\active_period_ticks_reg[31]_0 [5]),
        .I2(\active_high_ticks_reg[31]_0 [4]),
        .I3(\active_period_ticks_reg[31]_0 [4]),
        .O(parameters_ok1_carry_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    parameters_ok1_carry_i_7
       (.I0(\active_high_ticks_reg[31]_0 [3]),
        .I1(\active_period_ticks_reg[31]_0 [3]),
        .I2(\active_high_ticks_reg[31]_0 [2]),
        .I3(\active_period_ticks_reg[31]_0 [2]),
        .O(parameters_ok1_carry_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    parameters_ok1_carry_i_8
       (.I0(\active_high_ticks_reg[31]_0 [1]),
        .I1(\active_period_ticks_reg[31]_0 [1]),
        .I2(\active_high_ticks_reg[31]_0 [0]),
        .I3(\active_period_ticks_reg[31]_0 [0]),
        .O(parameters_ok1_carry_i_8_n_0));
  LUT6 #(
    .INIT(64'h1010300030003000)) 
    period_start_i_1
       (.I0(running0),
        .I1(\counter_reg[0]_0 ),
        .I2(s_axi_aresetn),
        .I3(\active_period_count[31]_i_1_n_0 ),
        .I4(running),
        .I5(cycle_end0),
        .O(period_start_i_1_n_0));
  FDRE period_start_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(period_start_i_1_n_0),
        .Q(period_start),
        .R(1'b0));
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
    .INIT(16'h22B2)) 
    pwm_out0_carry__0_i_1
       (.I0(active_high[15]),
        .I1(p_0_in[15]),
        .I2(active_high[14]),
        .I3(p_0_in[14]),
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
    .INIT(16'h22B2)) 
    pwm_out0_carry__0_i_2
       (.I0(active_high[13]),
        .I1(p_0_in[13]),
        .I2(active_high[12]),
        .I3(p_0_in[12]),
        .O(pwm_out0_carry__0_i_2_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    pwm_out0_carry__0_i_3
       (.I0(active_high[11]),
        .I1(p_0_in[11]),
        .I2(active_high[10]),
        .I3(p_0_in[10]),
        .O(pwm_out0_carry__0_i_3_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    pwm_out0_carry__0_i_4
       (.I0(active_high[9]),
        .I1(p_0_in[9]),
        .I2(active_high[8]),
        .I3(p_0_in[8]),
        .O(pwm_out0_carry__0_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_out0_carry__0_i_5
       (.I0(p_0_in[15]),
        .I1(active_high[15]),
        .I2(p_0_in[14]),
        .I3(active_high[14]),
        .O(pwm_out0_carry__0_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_out0_carry__0_i_6
       (.I0(p_0_in[13]),
        .I1(active_high[13]),
        .I2(p_0_in[12]),
        .I3(active_high[12]),
        .O(pwm_out0_carry__0_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_out0_carry__0_i_7
       (.I0(p_0_in[11]),
        .I1(active_high[11]),
        .I2(p_0_in[10]),
        .I3(active_high[10]),
        .O(pwm_out0_carry__0_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_out0_carry__0_i_8
       (.I0(p_0_in[9]),
        .I1(active_high[9]),
        .I2(p_0_in[8]),
        .I3(active_high[8]),
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
    .INIT(16'h22B2)) 
    pwm_out0_carry__1_i_1
       (.I0(active_high[23]),
        .I1(p_0_in[23]),
        .I2(active_high[22]),
        .I3(p_0_in[22]),
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
    .INIT(16'h22B2)) 
    pwm_out0_carry__1_i_2
       (.I0(active_high[21]),
        .I1(p_0_in[21]),
        .I2(active_high[20]),
        .I3(p_0_in[20]),
        .O(pwm_out0_carry__1_i_2_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    pwm_out0_carry__1_i_3
       (.I0(active_high[19]),
        .I1(p_0_in[19]),
        .I2(active_high[18]),
        .I3(p_0_in[18]),
        .O(pwm_out0_carry__1_i_3_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    pwm_out0_carry__1_i_4
       (.I0(active_high[17]),
        .I1(p_0_in[17]),
        .I2(active_high[16]),
        .I3(p_0_in[16]),
        .O(pwm_out0_carry__1_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_out0_carry__1_i_5
       (.I0(p_0_in[23]),
        .I1(active_high[23]),
        .I2(p_0_in[22]),
        .I3(active_high[22]),
        .O(pwm_out0_carry__1_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_out0_carry__1_i_6
       (.I0(p_0_in[21]),
        .I1(active_high[21]),
        .I2(p_0_in[20]),
        .I3(active_high[20]),
        .O(pwm_out0_carry__1_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_out0_carry__1_i_7
       (.I0(p_0_in[19]),
        .I1(active_high[19]),
        .I2(p_0_in[18]),
        .I3(active_high[18]),
        .O(pwm_out0_carry__1_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_out0_carry__1_i_8
       (.I0(p_0_in[17]),
        .I1(active_high[17]),
        .I2(p_0_in[16]),
        .I3(active_high[16]),
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
    .INIT(16'h22B2)) 
    pwm_out0_carry__2_i_1
       (.I0(active_high[31]),
        .I1(p_0_in[31]),
        .I2(active_high[30]),
        .I3(p_0_in[30]),
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
    .INIT(16'h22B2)) 
    pwm_out0_carry__2_i_2
       (.I0(active_high[29]),
        .I1(p_0_in[29]),
        .I2(active_high[28]),
        .I3(p_0_in[28]),
        .O(pwm_out0_carry__2_i_2_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    pwm_out0_carry__2_i_3
       (.I0(active_high[27]),
        .I1(p_0_in[27]),
        .I2(active_high[26]),
        .I3(p_0_in[26]),
        .O(pwm_out0_carry__2_i_3_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    pwm_out0_carry__2_i_4
       (.I0(active_high[25]),
        .I1(p_0_in[25]),
        .I2(active_high[24]),
        .I3(p_0_in[24]),
        .O(pwm_out0_carry__2_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_out0_carry__2_i_5
       (.I0(p_0_in[31]),
        .I1(active_high[31]),
        .I2(p_0_in[30]),
        .I3(active_high[30]),
        .O(pwm_out0_carry__2_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_out0_carry__2_i_6
       (.I0(p_0_in[29]),
        .I1(active_high[29]),
        .I2(p_0_in[28]),
        .I3(active_high[28]),
        .O(pwm_out0_carry__2_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_out0_carry__2_i_7
       (.I0(p_0_in[27]),
        .I1(active_high[27]),
        .I2(p_0_in[26]),
        .I3(active_high[26]),
        .O(pwm_out0_carry__2_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_out0_carry__2_i_8
       (.I0(p_0_in[25]),
        .I1(active_high[25]),
        .I2(p_0_in[24]),
        .I3(active_high[24]),
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
    .INIT(16'h22B2)) 
    pwm_out0_carry_i_1
       (.I0(active_high[7]),
        .I1(p_0_in[7]),
        .I2(active_high[6]),
        .I3(p_0_in[6]),
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
    .INIT(16'h22B2)) 
    pwm_out0_carry_i_2
       (.I0(active_high[5]),
        .I1(p_0_in[5]),
        .I2(active_high[4]),
        .I3(p_0_in[4]),
        .O(pwm_out0_carry_i_2_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    pwm_out0_carry_i_3
       (.I0(active_high[3]),
        .I1(p_0_in[3]),
        .I2(active_high[2]),
        .I3(p_0_in[2]),
        .O(pwm_out0_carry_i_3_n_0));
  LUT4 #(
    .INIT(16'hB222)) 
    pwm_out0_carry_i_4
       (.I0(active_high[1]),
        .I1(p_0_in[1]),
        .I2(counter_reg[0]),
        .I3(active_high[0]),
        .O(pwm_out0_carry_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_out0_carry_i_5
       (.I0(p_0_in[7]),
        .I1(active_high[7]),
        .I2(p_0_in[6]),
        .I3(active_high[6]),
        .O(pwm_out0_carry_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_out0_carry_i_6
       (.I0(p_0_in[5]),
        .I1(active_high[5]),
        .I2(p_0_in[4]),
        .I3(active_high[4]),
        .O(pwm_out0_carry_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_out0_carry_i_7
       (.I0(p_0_in[3]),
        .I1(active_high[3]),
        .I2(p_0_in[2]),
        .I3(active_high[2]),
        .O(pwm_out0_carry_i_7_n_0));
  LUT4 #(
    .INIT(16'h6006)) 
    pwm_out0_carry_i_8
       (.I0(active_high[0]),
        .I1(counter_reg[0]),
        .I2(p_0_in[1]),
        .I3(active_high[1]),
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
    .INIT(64'h00000000888A8880)) 
    pwm_out_i_1
       (.I0(pwm_out_i_2_n_0),
        .I1(pwm_out_i_3_n_0),
        .I2(\active_period_count[31]_i_1_n_0 ),
        .I3(pwm_out_i_4_n_0),
        .I4(pwm_out),
        .I5(pwm_out_i_5_n_0),
        .O(pwm_out_i_1_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    pwm_out_i_10
       (.I0(\active_high_ticks_reg[31]_0 [1]),
        .I1(\active_high_ticks_reg[31]_0 [0]),
        .I2(\active_high_ticks_reg[31]_0 [3]),
        .I3(\active_high_ticks_reg[31]_0 [2]),
        .O(pwm_out_i_10_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    pwm_out_i_11
       (.I0(\active_high_ticks_reg[31]_0 [8]),
        .I1(\active_high_ticks_reg[31]_0 [11]),
        .I2(\active_high_ticks_reg[31]_0 [9]),
        .I3(\active_high_ticks_reg[31]_0 [10]),
        .I4(pwm_out_i_18_n_0),
        .O(pwm_out_i_11_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    pwm_out_i_12
       (.I0(\active_high_ticks_reg[31]_0 [17]),
        .I1(\active_high_ticks_reg[31]_0 [16]),
        .I2(\active_high_ticks_reg[31]_0 [19]),
        .I3(\active_high_ticks_reg[31]_0 [18]),
        .O(pwm_out_i_12_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    pwm_out_i_13
       (.I0(\active_high_ticks_reg[31]_0 [24]),
        .I1(\active_high_ticks_reg[31]_0 [27]),
        .I2(\active_high_ticks_reg[31]_0 [25]),
        .I3(\active_high_ticks_reg[31]_0 [26]),
        .I4(pwm_out_i_19_n_0),
        .O(pwm_out_i_13_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    pwm_out_i_14
       (.I0(active_high[4]),
        .I1(active_high[7]),
        .I2(active_high[5]),
        .I3(active_high[6]),
        .I4(pwm_out_i_20_n_0),
        .O(pwm_out_i_14_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    pwm_out_i_15
       (.I0(active_high[8]),
        .I1(active_high[11]),
        .I2(active_high[9]),
        .I3(active_high[10]),
        .I4(pwm_out_i_21_n_0),
        .O(pwm_out_i_15_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    pwm_out_i_16
       (.I0(active_high[24]),
        .I1(active_high[27]),
        .I2(active_high[25]),
        .I3(active_high[26]),
        .I4(pwm_out_i_22_n_0),
        .O(pwm_out_i_16_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    pwm_out_i_17
       (.I0(active_high[20]),
        .I1(active_high[23]),
        .I2(active_high[21]),
        .I3(active_high[22]),
        .I4(pwm_out_i_23_n_0),
        .O(pwm_out_i_17_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    pwm_out_i_18
       (.I0(\active_high_ticks_reg[31]_0 [14]),
        .I1(\active_high_ticks_reg[31]_0 [13]),
        .I2(\active_high_ticks_reg[31]_0 [15]),
        .I3(\active_high_ticks_reg[31]_0 [12]),
        .O(pwm_out_i_18_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    pwm_out_i_19
       (.I0(\active_high_ticks_reg[31]_0 [29]),
        .I1(\active_high_ticks_reg[31]_0 [28]),
        .I2(\active_high_ticks_reg[31]_0 [31]),
        .I3(\active_high_ticks_reg[31]_0 [30]),
        .O(pwm_out_i_19_n_0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    pwm_out_i_2
       (.I0(s_axi_aresetn),
        .I1(\counter_reg[0]_0 ),
        .I2(running),
        .O(pwm_out_i_2_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    pwm_out_i_20
       (.I0(active_high[1]),
        .I1(active_high[0]),
        .I2(active_high[3]),
        .I3(active_high[2]),
        .O(pwm_out_i_20_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    pwm_out_i_21
       (.I0(active_high[13]),
        .I1(active_high[12]),
        .I2(active_high[15]),
        .I3(active_high[14]),
        .O(pwm_out_i_21_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    pwm_out_i_22
       (.I0(active_high[29]),
        .I1(active_high[28]),
        .I2(active_high[31]),
        .I3(active_high[30]),
        .O(pwm_out_i_22_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    pwm_out_i_23
       (.I0(active_high[17]),
        .I1(active_high[16]),
        .I2(active_high[19]),
        .I3(active_high[18]),
        .O(pwm_out_i_23_n_0));
  LUT6 #(
    .INIT(64'hEFE0EFEFEFE0E0E0)) 
    pwm_out_i_3
       (.I0(pwm_out_i_6_n_0),
        .I1(pwm_out_i_7_n_0),
        .I2(\active_period_count[31]_i_2_n_0 ),
        .I3(pwm_out0_carry__2_n_0),
        .I4(pwm_out_i_8_n_0),
        .I5(pwm_out_i_9_n_0),
        .O(pwm_out_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h2)) 
    pwm_out_i_4
       (.I0(running),
        .I1(\counter_reg[0]_0 ),
        .O(pwm_out_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h80)) 
    pwm_out_i_5
       (.I0(running0),
        .I1(cycle_end0),
        .I2(running),
        .O(pwm_out_i_5_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    pwm_out_i_6
       (.I0(pwm_out_i_10_n_0),
        .I1(\active_high_ticks_reg[31]_0 [7]),
        .I2(\active_high_ticks_reg[31]_0 [4]),
        .I3(\active_high_ticks_reg[31]_0 [6]),
        .I4(\active_high_ticks_reg[31]_0 [5]),
        .I5(pwm_out_i_11_n_0),
        .O(pwm_out_i_6_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    pwm_out_i_7
       (.I0(pwm_out_i_12_n_0),
        .I1(\active_high_ticks_reg[31]_0 [23]),
        .I2(\active_high_ticks_reg[31]_0 [20]),
        .I3(\active_high_ticks_reg[31]_0 [22]),
        .I4(\active_high_ticks_reg[31]_0 [21]),
        .I5(pwm_out_i_13_n_0),
        .O(pwm_out_i_7_n_0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h7)) 
    pwm_out_i_8
       (.I0(running),
        .I1(cycle_end0),
        .O(pwm_out_i_8_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    pwm_out_i_9
       (.I0(pwm_out_i_14_n_0),
        .I1(pwm_out_i_15_n_0),
        .I2(pwm_out_i_16_n_0),
        .I3(pwm_out_i_17_n_0),
        .O(pwm_out_i_9_n_0));
  FDRE pwm_out_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(pwm_out_i_1_n_0),
        .Q(pwm_out),
        .R(1'b0));
  CARRY4 running0_carry
       (.CI(1'b0),
        .CO({running0_carry_n_0,running0_carry_n_1,running0_carry_n_2,running0_carry_n_3}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_running0_carry_O_UNCONNECTED[3:0]),
        .S({running0_carry_i_1_n_0,running0_carry_i_2_n_0,running0_carry_i_3_n_0,running0_carry_i_4_n_0}));
  CARRY4 running0_carry__0
       (.CI(running0_carry_n_0),
        .CO({running0_carry__0_n_0,running0_carry__0_n_1,running0_carry__0_n_2,running0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_running0_carry__0_O_UNCONNECTED[3:0]),
        .S({running0_carry__0_i_1_n_0,running0_carry__0_i_2_n_0,running0_carry__0_i_3_n_0,running0_carry__0_i_4_n_0}));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    running0_carry__0_i_1
       (.I0(active_count[23]),
        .I1(running1[23]),
        .I2(running1[21]),
        .I3(active_count[21]),
        .I4(running1[22]),
        .I5(active_count[22]),
        .O(running0_carry__0_i_1_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    running0_carry__0_i_2
       (.I0(active_count[20]),
        .I1(running1[20]),
        .I2(running1[18]),
        .I3(active_count[18]),
        .I4(running1[19]),
        .I5(active_count[19]),
        .O(running0_carry__0_i_2_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    running0_carry__0_i_3
       (.I0(active_count[17]),
        .I1(running1[17]),
        .I2(running1[16]),
        .I3(active_count[16]),
        .I4(running1[15]),
        .I5(active_count[15]),
        .O(running0_carry__0_i_3_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    running0_carry__0_i_4
       (.I0(active_count[14]),
        .I1(running1[14]),
        .I2(running1[12]),
        .I3(active_count[12]),
        .I4(running1[13]),
        .I5(active_count[13]),
        .O(running0_carry__0_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 running0_carry__0_i_5
       (.CI(running0_carry__0_i_6_n_0),
        .CO({running0_carry__0_i_5_n_0,running0_carry__0_i_5_n_1,running0_carry__0_i_5_n_2,running0_carry__0_i_5_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(running1[24:21]),
        .S(completed_count[24:21]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 running0_carry__0_i_6
       (.CI(running0_carry__0_i_7_n_0),
        .CO({running0_carry__0_i_6_n_0,running0_carry__0_i_6_n_1,running0_carry__0_i_6_n_2,running0_carry__0_i_6_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(running1[20:17]),
        .S(completed_count[20:17]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 running0_carry__0_i_7
       (.CI(running0_carry_i_5_n_0),
        .CO({running0_carry__0_i_7_n_0,running0_carry__0_i_7_n_1,running0_carry__0_i_7_n_2,running0_carry__0_i_7_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(running1[16:13]),
        .S(completed_count[16:13]));
  CARRY4 running0_carry__1
       (.CI(running0_carry__0_n_0),
        .CO({NLW_running0_carry__1_CO_UNCONNECTED[3],running0,running0_carry__1_n_2,running0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_running0_carry__1_O_UNCONNECTED[3:0]),
        .S({1'b0,running0_carry__1_i_1_n_0,running0_carry__1_i_2_n_0,running0_carry__1_i_3_n_0}));
  LUT4 #(
    .INIT(16'h9009)) 
    running0_carry__1_i_1
       (.I0(active_count[31]),
        .I1(running1[31]),
        .I2(active_count[30]),
        .I3(running1[30]),
        .O(running0_carry__1_i_1_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    running0_carry__1_i_2
       (.I0(active_count[29]),
        .I1(running1[29]),
        .I2(running1[27]),
        .I3(active_count[27]),
        .I4(running1[28]),
        .I5(active_count[28]),
        .O(running0_carry__1_i_2_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    running0_carry__1_i_3
       (.I0(active_count[26]),
        .I1(running1[26]),
        .I2(running1[24]),
        .I3(active_count[24]),
        .I4(running1[25]),
        .I5(active_count[25]),
        .O(running0_carry__1_i_3_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 running0_carry__1_i_4
       (.CI(running0_carry__1_i_5_n_0),
        .CO({NLW_running0_carry__1_i_4_CO_UNCONNECTED[3:2],running0_carry__1_i_4_n_2,running0_carry__1_i_4_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_running0_carry__1_i_4_O_UNCONNECTED[3],running1[31:29]}),
        .S({1'b0,completed_count[31:29]}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 running0_carry__1_i_5
       (.CI(running0_carry__0_i_5_n_0),
        .CO({running0_carry__1_i_5_n_0,running0_carry__1_i_5_n_1,running0_carry__1_i_5_n_2,running0_carry__1_i_5_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(running1[28:25]),
        .S(completed_count[28:25]));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    running0_carry_i_1
       (.I0(active_count[11]),
        .I1(running1[11]),
        .I2(running1[9]),
        .I3(active_count[9]),
        .I4(running1[10]),
        .I5(active_count[10]),
        .O(running0_carry_i_1_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    running0_carry_i_2
       (.I0(active_count[8]),
        .I1(running1[8]),
        .I2(running1[6]),
        .I3(active_count[6]),
        .I4(running1[7]),
        .I5(active_count[7]),
        .O(running0_carry_i_2_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    running0_carry_i_3
       (.I0(running1[3]),
        .I1(active_count[3]),
        .I2(running1[4]),
        .I3(active_count[4]),
        .I4(active_count[5]),
        .I5(running1[5]),
        .O(running0_carry_i_3_n_0));
  LUT6 #(
    .INIT(64'h0990000000000990)) 
    running0_carry_i_4
       (.I0(active_count[2]),
        .I1(running1[2]),
        .I2(active_count[0]),
        .I3(completed_count[0]),
        .I4(running1[1]),
        .I5(active_count[1]),
        .O(running0_carry_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 running0_carry_i_5
       (.CI(running0_carry_i_6_n_0),
        .CO({running0_carry_i_5_n_0,running0_carry_i_5_n_1,running0_carry_i_5_n_2,running0_carry_i_5_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(running1[12:9]),
        .S(completed_count[12:9]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 running0_carry_i_6
       (.CI(running0_carry_i_7_n_0),
        .CO({running0_carry_i_6_n_0,running0_carry_i_6_n_1,running0_carry_i_6_n_2,running0_carry_i_6_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(running1[8:5]),
        .S(completed_count[8:5]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 running0_carry_i_7
       (.CI(1'b0),
        .CO({running0_carry_i_7_n_0,running0_carry_i_7_n_1,running0_carry_i_7_n_2,running0_carry_i_7_n_3}),
        .CYINIT(completed_count[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(running1[4:1]),
        .S(completed_count[4:1]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h000A0038)) 
    running_i_1
       (.I0(cfg_error_reg_0),
        .I1(\active_period_count[31]_i_1_n_0 ),
        .I2(running),
        .I3(\counter_reg[0]_0 ),
        .I4(pwm_out_i_5_n_0),
        .O(running_i_1_n_0));
  FDRE running_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(running_i_1_n_0),
        .Q(running),
        .R(SR));
  LUT1 #(
    .INIT(2'h1)) 
    \s_axi_bresp[1]_i_1 
       (.I0(s_axi_aresetn),
        .O(SR));
  LUT6 #(
    .INIT(64'hFBAAFFFFFBAA0000)) 
    \s_axi_bresp[1]_i_2 
       (.I0(\s_axi_bresp_reg[1]_2 ),
        .I1(\s_axi_bresp[1]_i_4_n_0 ),
        .I2(\s_axi_bresp_reg[1]_3 ),
        .I3(\s_axi_bresp_reg[1]_4 ),
        .I4(address_pending0),
        .I5(s_axi_bresp),
        .O(\s_axi_bresp_reg[1] ));
  LUT6 #(
    .INIT(64'hFFFFFFFF5700FFFF)) 
    \s_axi_bresp[1]_i_4 
       (.I0(\error_sticky_reg[2] [0]),
        .I1(\s_axi_bresp[1]_i_8_n_0 ),
        .I2(\error_sticky_reg[2] [1]),
        .I3(\s_axi_bresp_reg[1]_0 ),
        .I4(\s_axi_bresp_reg[1]_1 ),
        .I5(Q[1]),
        .O(\s_axi_bresp[1]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFBABAFFBA)) 
    \s_axi_bresp[1]_i_8 
       (.I0(CO),
        .I1(\s_axi_bresp[1]_i_4_0 ),
        .I2(\s_axi_bresp[1]_i_4_1 ),
        .I3(\s_axi_bresp[1]_i_4_2 ),
        .I4(\s_axi_bresp[1]_i_4_3 ),
        .I5(launch_valid_reg),
        .O(\s_axi_bresp[1]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'h02A2)) 
    \s_axi_rdata[0]_i_1 
       (.I0(\s_axi_rdata_reg[1] ),
        .I1(\s_axi_rdata[0]_i_2_n_0 ),
        .I2(\s_axi_rdata_reg[1]_1 ),
        .I3(\s_axi_rdata[0]_i_3_n_0 ),
        .O(D[0]));
  LUT5 #(
    .INIT(32'h040CF4FC)) 
    \s_axi_rdata[0]_i_2 
       (.I0(running),
        .I1(\s_axi_rdata_reg[12] ),
        .I2(\s_axi_rdata_reg[8] ),
        .I3(\s_axi_rdata_reg[2] ),
        .I4(\s_axi_rdata_reg[0] ),
        .O(\s_axi_rdata[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h505F3030505F3F3F)) 
    \s_axi_rdata[0]_i_3 
       (.I0(completed_count[0]),
        .I1(active_count[0]),
        .I2(\s_axi_rdata_reg[12] ),
        .I3(active_high[0]),
        .I4(\s_axi_rdata_reg[2] ),
        .I5(active_period[0]),
        .O(\s_axi_rdata[0]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h8A88)) 
    \s_axi_rdata[10]_i_1 
       (.I0(\s_axi_rdata_reg[1] ),
        .I1(\s_axi_rdata_reg[10] ),
        .I2(\s_axi_rdata[10]_i_3_n_0 ),
        .I3(\s_axi_rdata_reg[1]_1 ),
        .O(D[10]));
  LUT6 #(
    .INIT(64'h5050303F5F5F303F)) 
    \s_axi_rdata[10]_i_3 
       (.I0(completed_count[10]),
        .I1(active_count[10]),
        .I2(\s_axi_rdata_reg[12] ),
        .I3(active_period[10]),
        .I4(\s_axi_rdata_reg[2] ),
        .I5(active_high[10]),
        .O(\s_axi_rdata[10]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h8A88)) 
    \s_axi_rdata[11]_i_1 
       (.I0(\s_axi_rdata_reg[1] ),
        .I1(\s_axi_rdata_reg[11] ),
        .I2(\s_axi_rdata[11]_i_3_n_0 ),
        .I3(\s_axi_rdata_reg[1]_1 ),
        .O(D[11]));
  LUT6 #(
    .INIT(64'h3030505F3F3F505F)) 
    \s_axi_rdata[11]_i_3 
       (.I0(active_count[11]),
        .I1(completed_count[11]),
        .I2(\s_axi_rdata_reg[12] ),
        .I3(active_period[11]),
        .I4(\s_axi_rdata_reg[2] ),
        .I5(active_high[11]),
        .O(\s_axi_rdata[11]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h000000A2AA00AAA2)) 
    \s_axi_rdata[12]_i_1 
       (.I0(\s_axi_rdata_reg[1] ),
        .I1(\s_axi_rdata_reg[12] ),
        .I2(\s_axi_rdata_reg[8] ),
        .I3(\s_axi_rdata_reg[1]_1 ),
        .I4(\s_axi_rdata_reg[12]_0 ),
        .I5(\s_axi_rdata[12]_i_3_n_0 ),
        .O(D[12]));
  LUT6 #(
    .INIT(64'h5050303F5F5F303F)) 
    \s_axi_rdata[12]_i_3 
       (.I0(completed_count[12]),
        .I1(active_count[12]),
        .I2(\s_axi_rdata_reg[12] ),
        .I3(active_period[12]),
        .I4(\s_axi_rdata_reg[2] ),
        .I5(active_high[12]),
        .O(\s_axi_rdata[12]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h8A88)) 
    \s_axi_rdata[13]_i_1 
       (.I0(\s_axi_rdata_reg[1] ),
        .I1(\s_axi_rdata_reg[13] ),
        .I2(\s_axi_rdata[13]_i_3_n_0 ),
        .I3(\s_axi_rdata_reg[1]_1 ),
        .O(D[13]));
  LUT6 #(
    .INIT(64'h5050303F5F5F303F)) 
    \s_axi_rdata[13]_i_3 
       (.I0(completed_count[13]),
        .I1(active_count[13]),
        .I2(\s_axi_rdata_reg[12] ),
        .I3(active_period[13]),
        .I4(\s_axi_rdata_reg[2] ),
        .I5(active_high[13]),
        .O(\s_axi_rdata[13]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h000000A2AA00AAA2)) 
    \s_axi_rdata[14]_i_1 
       (.I0(\s_axi_rdata_reg[1] ),
        .I1(\s_axi_rdata_reg[12] ),
        .I2(\s_axi_rdata_reg[8] ),
        .I3(\s_axi_rdata_reg[1]_1 ),
        .I4(\s_axi_rdata_reg[14] ),
        .I5(\s_axi_rdata[14]_i_3_n_0 ),
        .O(D[14]));
  LUT6 #(
    .INIT(64'h3030505F3F3F505F)) 
    \s_axi_rdata[14]_i_3 
       (.I0(active_count[14]),
        .I1(completed_count[14]),
        .I2(\s_axi_rdata_reg[12] ),
        .I3(active_period[14]),
        .I4(\s_axi_rdata_reg[2] ),
        .I5(active_high[14]),
        .O(\s_axi_rdata[14]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h8A88)) 
    \s_axi_rdata[15]_i_1 
       (.I0(\s_axi_rdata_reg[1] ),
        .I1(\s_axi_rdata_reg[15] ),
        .I2(\s_axi_rdata[15]_i_3_n_0 ),
        .I3(\s_axi_rdata_reg[1]_1 ),
        .O(D[15]));
  LUT6 #(
    .INIT(64'h5050303F5F5F303F)) 
    \s_axi_rdata[15]_i_3 
       (.I0(completed_count[15]),
        .I1(active_count[15]),
        .I2(\s_axi_rdata_reg[12] ),
        .I3(active_period[15]),
        .I4(\s_axi_rdata_reg[2] ),
        .I5(active_high[15]),
        .O(\s_axi_rdata[15]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h000000A2AA00AAA2)) 
    \s_axi_rdata[16]_i_1 
       (.I0(\s_axi_rdata_reg[1] ),
        .I1(\s_axi_rdata_reg[12] ),
        .I2(\s_axi_rdata_reg[8] ),
        .I3(\s_axi_rdata_reg[1]_1 ),
        .I4(\s_axi_rdata_reg[16] ),
        .I5(\s_axi_rdata[16]_i_3_n_0 ),
        .O(D[16]));
  LUT6 #(
    .INIT(64'h5050303F5F5F303F)) 
    \s_axi_rdata[16]_i_3 
       (.I0(completed_count[16]),
        .I1(active_count[16]),
        .I2(\s_axi_rdata_reg[12] ),
        .I3(active_period[16]),
        .I4(\s_axi_rdata_reg[2] ),
        .I5(active_high[16]),
        .O(\s_axi_rdata[16]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h8A88)) 
    \s_axi_rdata[17]_i_1 
       (.I0(\s_axi_rdata_reg[1] ),
        .I1(\s_axi_rdata_reg[17] ),
        .I2(\s_axi_rdata[17]_i_3_n_0 ),
        .I3(\s_axi_rdata_reg[1]_1 ),
        .O(D[17]));
  LUT6 #(
    .INIT(64'h3030505F3F3F505F)) 
    \s_axi_rdata[17]_i_3 
       (.I0(active_count[17]),
        .I1(completed_count[17]),
        .I2(\s_axi_rdata_reg[12] ),
        .I3(active_period[17]),
        .I4(\s_axi_rdata_reg[2] ),
        .I5(active_high[17]),
        .O(\s_axi_rdata[17]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h000000A2AA00AAA2)) 
    \s_axi_rdata[18]_i_1 
       (.I0(\s_axi_rdata_reg[1] ),
        .I1(\s_axi_rdata_reg[12] ),
        .I2(\s_axi_rdata_reg[8] ),
        .I3(\s_axi_rdata_reg[1]_1 ),
        .I4(\s_axi_rdata_reg[18] ),
        .I5(\s_axi_rdata[18]_i_3_n_0 ),
        .O(D[18]));
  LUT6 #(
    .INIT(64'h5050303F5F5F303F)) 
    \s_axi_rdata[18]_i_3 
       (.I0(completed_count[18]),
        .I1(active_count[18]),
        .I2(\s_axi_rdata_reg[12] ),
        .I3(active_period[18]),
        .I4(\s_axi_rdata_reg[2] ),
        .I5(active_high[18]),
        .O(\s_axi_rdata[18]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h8A88)) 
    \s_axi_rdata[19]_i_1 
       (.I0(\s_axi_rdata_reg[1] ),
        .I1(\s_axi_rdata_reg[19] ),
        .I2(\s_axi_rdata[19]_i_3_n_0 ),
        .I3(\s_axi_rdata_reg[1]_1 ),
        .O(D[19]));
  LUT6 #(
    .INIT(64'h5050303F5F5F303F)) 
    \s_axi_rdata[19]_i_3 
       (.I0(completed_count[19]),
        .I1(active_count[19]),
        .I2(\s_axi_rdata_reg[12] ),
        .I3(active_period[19]),
        .I4(\s_axi_rdata_reg[2] ),
        .I5(active_high[19]),
        .O(\s_axi_rdata[19]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h20AA2020AAAAAAAA)) 
    \s_axi_rdata[1]_i_1 
       (.I0(\s_axi_rdata_reg[1] ),
        .I1(\s_axi_rdata_reg[1]_0 ),
        .I2(launch_valid_reg),
        .I3(\s_axi_rdata[1]_i_2_n_0 ),
        .I4(\s_axi_rdata_reg[1]_1 ),
        .I5(\s_axi_rdata_reg[1]_2 ),
        .O(D[1]));
  LUT6 #(
    .INIT(64'h5050303F5F5F303F)) 
    \s_axi_rdata[1]_i_2 
       (.I0(completed_count[1]),
        .I1(active_count[1]),
        .I2(\s_axi_rdata_reg[12] ),
        .I3(active_period[1]),
        .I4(\s_axi_rdata_reg[2] ),
        .I5(active_high[1]),
        .O(\s_axi_rdata[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h000000A2AA00AAA2)) 
    \s_axi_rdata[20]_i_1 
       (.I0(\s_axi_rdata_reg[1] ),
        .I1(\s_axi_rdata_reg[12] ),
        .I2(\s_axi_rdata_reg[8] ),
        .I3(\s_axi_rdata_reg[1]_1 ),
        .I4(\s_axi_rdata_reg[20] ),
        .I5(\s_axi_rdata[20]_i_3_n_0 ),
        .O(D[20]));
  LUT6 #(
    .INIT(64'h3030505F3F3F505F)) 
    \s_axi_rdata[20]_i_3 
       (.I0(active_count[20]),
        .I1(completed_count[20]),
        .I2(\s_axi_rdata_reg[12] ),
        .I3(active_period[20]),
        .I4(\s_axi_rdata_reg[2] ),
        .I5(active_high[20]),
        .O(\s_axi_rdata[20]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h8A88)) 
    \s_axi_rdata[21]_i_1 
       (.I0(\s_axi_rdata_reg[1] ),
        .I1(\s_axi_rdata_reg[21] ),
        .I2(\s_axi_rdata[21]_i_3_n_0 ),
        .I3(\s_axi_rdata_reg[1]_1 ),
        .O(D[21]));
  LUT6 #(
    .INIT(64'h5050303F5F5F303F)) 
    \s_axi_rdata[21]_i_3 
       (.I0(completed_count[21]),
        .I1(active_count[21]),
        .I2(\s_axi_rdata_reg[12] ),
        .I3(active_period[21]),
        .I4(\s_axi_rdata_reg[2] ),
        .I5(active_high[21]),
        .O(\s_axi_rdata[21]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h000000A2AA00AAA2)) 
    \s_axi_rdata[22]_i_1 
       (.I0(\s_axi_rdata_reg[1] ),
        .I1(\s_axi_rdata_reg[12] ),
        .I2(\s_axi_rdata_reg[8] ),
        .I3(\s_axi_rdata_reg[1]_1 ),
        .I4(\s_axi_rdata_reg[22] ),
        .I5(\s_axi_rdata[22]_i_3_n_0 ),
        .O(D[22]));
  LUT6 #(
    .INIT(64'h5050303F5F5F303F)) 
    \s_axi_rdata[22]_i_3 
       (.I0(completed_count[22]),
        .I1(active_count[22]),
        .I2(\s_axi_rdata_reg[12] ),
        .I3(active_period[22]),
        .I4(\s_axi_rdata_reg[2] ),
        .I5(active_high[22]),
        .O(\s_axi_rdata[22]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h8A88)) 
    \s_axi_rdata[23]_i_1 
       (.I0(\s_axi_rdata_reg[1] ),
        .I1(\s_axi_rdata_reg[23] ),
        .I2(\s_axi_rdata[23]_i_3_n_0 ),
        .I3(\s_axi_rdata_reg[1]_1 ),
        .O(D[23]));
  LUT6 #(
    .INIT(64'h3030505F3F3F505F)) 
    \s_axi_rdata[23]_i_3 
       (.I0(active_count[23]),
        .I1(completed_count[23]),
        .I2(\s_axi_rdata_reg[12] ),
        .I3(active_period[23]),
        .I4(\s_axi_rdata_reg[2] ),
        .I5(active_high[23]),
        .O(\s_axi_rdata[23]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h8A88)) 
    \s_axi_rdata[24]_i_1 
       (.I0(\s_axi_rdata_reg[1] ),
        .I1(\s_axi_rdata_reg[24] ),
        .I2(\s_axi_rdata[24]_i_3_n_0 ),
        .I3(\s_axi_rdata_reg[1]_1 ),
        .O(D[24]));
  LUT6 #(
    .INIT(64'h5050303F5F5F303F)) 
    \s_axi_rdata[24]_i_3 
       (.I0(completed_count[24]),
        .I1(active_count[24]),
        .I2(\s_axi_rdata_reg[12] ),
        .I3(active_period[24]),
        .I4(\s_axi_rdata_reg[2] ),
        .I5(active_high[24]),
        .O(\s_axi_rdata[24]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h000000A2AA00AAA2)) 
    \s_axi_rdata[25]_i_1 
       (.I0(\s_axi_rdata_reg[1] ),
        .I1(\s_axi_rdata_reg[12] ),
        .I2(\s_axi_rdata_reg[8] ),
        .I3(\s_axi_rdata_reg[1]_1 ),
        .I4(\s_axi_rdata_reg[25] ),
        .I5(\s_axi_rdata[25]_i_3_n_0 ),
        .O(D[25]));
  LUT6 #(
    .INIT(64'h5050303F5F5F303F)) 
    \s_axi_rdata[25]_i_3 
       (.I0(completed_count[25]),
        .I1(active_count[25]),
        .I2(\s_axi_rdata_reg[12] ),
        .I3(active_period[25]),
        .I4(\s_axi_rdata_reg[2] ),
        .I5(active_high[25]),
        .O(\s_axi_rdata[25]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h8A88)) 
    \s_axi_rdata[26]_i_1 
       (.I0(\s_axi_rdata_reg[1] ),
        .I1(\s_axi_rdata_reg[26] ),
        .I2(\s_axi_rdata[26]_i_3_n_0 ),
        .I3(\s_axi_rdata_reg[1]_1 ),
        .O(D[26]));
  LUT6 #(
    .INIT(64'h3030505F3F3F505F)) 
    \s_axi_rdata[26]_i_3 
       (.I0(active_count[26]),
        .I1(completed_count[26]),
        .I2(\s_axi_rdata_reg[12] ),
        .I3(active_period[26]),
        .I4(\s_axi_rdata_reg[2] ),
        .I5(active_high[26]),
        .O(\s_axi_rdata[26]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h8A88)) 
    \s_axi_rdata[27]_i_1 
       (.I0(\s_axi_rdata_reg[1] ),
        .I1(\s_axi_rdata_reg[27] ),
        .I2(\s_axi_rdata[27]_i_3_n_0 ),
        .I3(\s_axi_rdata_reg[1]_1 ),
        .O(D[27]));
  LUT6 #(
    .INIT(64'h5050303F5F5F303F)) 
    \s_axi_rdata[27]_i_3 
       (.I0(completed_count[27]),
        .I1(active_count[27]),
        .I2(\s_axi_rdata_reg[12] ),
        .I3(active_period[27]),
        .I4(\s_axi_rdata_reg[2] ),
        .I5(active_high[27]),
        .O(\s_axi_rdata[27]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h8A88)) 
    \s_axi_rdata[28]_i_1 
       (.I0(\s_axi_rdata_reg[1] ),
        .I1(\s_axi_rdata_reg[28] ),
        .I2(\s_axi_rdata[28]_i_3_n_0 ),
        .I3(\s_axi_rdata_reg[1]_1 ),
        .O(D[28]));
  LUT6 #(
    .INIT(64'h5050303F5F5F303F)) 
    \s_axi_rdata[28]_i_3 
       (.I0(completed_count[28]),
        .I1(active_count[28]),
        .I2(\s_axi_rdata_reg[12] ),
        .I3(active_period[28]),
        .I4(\s_axi_rdata_reg[2] ),
        .I5(active_high[28]),
        .O(\s_axi_rdata[28]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h8A88)) 
    \s_axi_rdata[29]_i_1 
       (.I0(\s_axi_rdata_reg[1] ),
        .I1(\s_axi_rdata_reg[29] ),
        .I2(\s_axi_rdata[29]_i_3_n_0 ),
        .I3(\s_axi_rdata_reg[1]_1 ),
        .O(D[29]));
  LUT6 #(
    .INIT(64'h3030505F3F3F505F)) 
    \s_axi_rdata[29]_i_3 
       (.I0(active_count[29]),
        .I1(completed_count[29]),
        .I2(\s_axi_rdata_reg[12] ),
        .I3(active_period[29]),
        .I4(\s_axi_rdata_reg[2] ),
        .I5(active_high[29]),
        .O(\s_axi_rdata[29]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h8A88)) 
    \s_axi_rdata[2]_i_1 
       (.I0(\s_axi_rdata_reg[1] ),
        .I1(\s_axi_rdata[2]_i_2_n_0 ),
        .I2(\s_axi_rdata[2]_i_3_n_0 ),
        .I3(\s_axi_rdata_reg[1]_1 ),
        .O(D[2]));
  LUT6 #(
    .INIT(64'h0000FFFF08000800)) 
    \s_axi_rdata[2]_i_2 
       (.I0(\s_axi_rdata_reg[12] ),
        .I1(\s_axi_rdata_reg[2] ),
        .I2(\s_axi_rdata_reg[1]_1 ),
        .I3(done),
        .I4(\s_axi_rdata_reg[2]_0 ),
        .I5(\s_axi_rdata_reg[8] ),
        .O(\s_axi_rdata[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h303F5050303F5F5F)) 
    \s_axi_rdata[2]_i_3 
       (.I0(active_count[2]),
        .I1(completed_count[2]),
        .I2(\s_axi_rdata_reg[12] ),
        .I3(active_high[2]),
        .I4(\s_axi_rdata_reg[2] ),
        .I5(active_period[2]),
        .O(\s_axi_rdata[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00008808AAAA8808)) 
    \s_axi_rdata[30]_i_1 
       (.I0(\s_axi_rdata_reg[1] ),
        .I1(\s_axi_rdata_reg[30] ),
        .I2(\s_axi_rdata_reg[12] ),
        .I3(\s_axi_rdata_reg[8] ),
        .I4(\s_axi_rdata_reg[1]_1 ),
        .I5(\s_axi_rdata[30]_i_5_n_0 ),
        .O(D[30]));
  LUT6 #(
    .INIT(64'h5050303F5F5F303F)) 
    \s_axi_rdata[30]_i_5 
       (.I0(completed_count[30]),
        .I1(active_count[30]),
        .I2(\s_axi_rdata_reg[12] ),
        .I3(active_period[30]),
        .I4(\s_axi_rdata_reg[2] ),
        .I5(active_high[30]),
        .O(\s_axi_rdata[30]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h8A88)) 
    \s_axi_rdata[31]_i_2 
       (.I0(\s_axi_rdata_reg[1] ),
        .I1(\s_axi_rdata_reg[31] ),
        .I2(\s_axi_rdata[31]_i_5_n_0 ),
        .I3(\s_axi_rdata_reg[1]_1 ),
        .O(D[31]));
  LUT6 #(
    .INIT(64'h5050303F5F5F303F)) 
    \s_axi_rdata[31]_i_5 
       (.I0(completed_count[31]),
        .I1(active_count[31]),
        .I2(\s_axi_rdata_reg[12] ),
        .I3(active_period[31]),
        .I4(\s_axi_rdata_reg[2] ),
        .I5(active_high[31]),
        .O(\s_axi_rdata[31]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h20AA2020AAAAAAAA)) 
    \s_axi_rdata[3]_i_1 
       (.I0(\s_axi_rdata_reg[1] ),
        .I1(\s_axi_rdata_reg[1]_0 ),
        .I2(data1[0]),
        .I3(\s_axi_rdata[3]_i_3_n_0 ),
        .I4(\s_axi_rdata_reg[1]_1 ),
        .I5(\s_axi_rdata_reg[3] ),
        .O(D[3]));
  LUT6 #(
    .INIT(64'h5050303F5F5F303F)) 
    \s_axi_rdata[3]_i_3 
       (.I0(completed_count[3]),
        .I1(active_count[3]),
        .I2(\s_axi_rdata_reg[12] ),
        .I3(active_period[3]),
        .I4(\s_axi_rdata_reg[2] ),
        .I5(active_high[3]),
        .O(\s_axi_rdata[3]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hA808)) 
    \s_axi_rdata[4]_i_1 
       (.I0(\s_axi_rdata_reg[1] ),
        .I1(\s_axi_rdata_reg[4] ),
        .I2(\s_axi_rdata_reg[1]_1 ),
        .I3(\s_axi_rdata[4]_i_3_n_0 ),
        .O(D[4]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[4]_i_3 
       (.I0(completed_count[4]),
        .I1(active_count[4]),
        .I2(\s_axi_rdata_reg[12] ),
        .I3(active_high[4]),
        .I4(\s_axi_rdata_reg[2] ),
        .I5(active_period[4]),
        .O(\s_axi_rdata[4]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hAA200020)) 
    \s_axi_rdata[5]_i_1 
       (.I0(\s_axi_rdata_reg[1] ),
        .I1(\s_axi_rdata_reg[5] ),
        .I2(\s_axi_rdata_reg[5]_0 ),
        .I3(\s_axi_rdata_reg[1]_1 ),
        .I4(\s_axi_rdata[5]_i_4_n_0 ),
        .O(D[5]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[5]_i_4 
       (.I0(completed_count[5]),
        .I1(active_count[5]),
        .I2(\s_axi_rdata_reg[12] ),
        .I3(active_high[5]),
        .I4(\s_axi_rdata_reg[2] ),
        .I5(active_period[5]),
        .O(\s_axi_rdata[5]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h8A88)) 
    \s_axi_rdata[6]_i_1 
       (.I0(\s_axi_rdata_reg[1] ),
        .I1(\s_axi_rdata_reg[6] ),
        .I2(\s_axi_rdata[6]_i_3_n_0 ),
        .I3(\s_axi_rdata_reg[1]_1 ),
        .O(D[6]));
  LUT6 #(
    .INIT(64'h5050303F5F5F303F)) 
    \s_axi_rdata[6]_i_3 
       (.I0(completed_count[6]),
        .I1(active_count[6]),
        .I2(\s_axi_rdata_reg[12] ),
        .I3(active_period[6]),
        .I4(\s_axi_rdata_reg[2] ),
        .I5(active_high[6]),
        .O(\s_axi_rdata[6]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h8A88)) 
    \s_axi_rdata[7]_i_1 
       (.I0(\s_axi_rdata_reg[1] ),
        .I1(\s_axi_rdata_reg[7] ),
        .I2(\s_axi_rdata[7]_i_3_n_0 ),
        .I3(\s_axi_rdata_reg[1]_1 ),
        .O(D[7]));
  LUT6 #(
    .INIT(64'h5050303F5F5F303F)) 
    \s_axi_rdata[7]_i_3 
       (.I0(completed_count[7]),
        .I1(active_count[7]),
        .I2(\s_axi_rdata_reg[12] ),
        .I3(active_period[7]),
        .I4(\s_axi_rdata_reg[2] ),
        .I5(active_high[7]),
        .O(\s_axi_rdata[7]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h08AA0808)) 
    \s_axi_rdata[8]_i_1 
       (.I0(\s_axi_rdata_reg[1] ),
        .I1(\s_axi_rdata_reg[8] ),
        .I2(\s_axi_rdata_reg[8]_0 ),
        .I3(\s_axi_rdata[8]_i_3_n_0 ),
        .I4(\s_axi_rdata_reg[1]_1 ),
        .O(D[8]));
  LUT6 #(
    .INIT(64'h3030505F3F3F505F)) 
    \s_axi_rdata[8]_i_3 
       (.I0(active_count[8]),
        .I1(completed_count[8]),
        .I2(\s_axi_rdata_reg[12] ),
        .I3(active_period[8]),
        .I4(\s_axi_rdata_reg[2] ),
        .I5(active_high[8]),
        .O(\s_axi_rdata[8]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h8880AAAA88808880)) 
    \s_axi_rdata[9]_i_1 
       (.I0(\s_axi_rdata_reg[1] ),
        .I1(\s_axi_rdata_reg[9] ),
        .I2(\s_axi_rdata_reg[9]_0 ),
        .I3(\s_axi_rdata_reg[9]_1 ),
        .I4(\s_axi_rdata[9]_i_5_n_0 ),
        .I5(\s_axi_rdata_reg[1]_1 ),
        .O(D[9]));
  LUT6 #(
    .INIT(64'h5050303F5F5F303F)) 
    \s_axi_rdata[9]_i_5 
       (.I0(completed_count[9]),
        .I1(active_count[9]),
        .I2(\s_axi_rdata_reg[12] ),
        .I3(active_period[9]),
        .I4(\s_axi_rdata_reg[2] ),
        .I5(active_high[9]),
        .O(\s_axi_rdata[9]_i_5_n_0 ));
endmodule

(* ORIG_REF_NAME = "fdw_pwm_burst_axi" *) 
module system_finite_pwm_0_fdw_pwm_burst_axi
   (launch_valid_reg_0,
    s_axi_rdata,
    s_axi_rresp,
    pwm_out,
    done_event,
    s_axi_wready,
    s_axi_bvalid_reg_0,
    s_axi_awready,
    s_axi_arready,
    s_axi_rvalid_reg_0,
    burst_start,
    period_start,
    s_axi_bresp,
    s_axi_aresetn,
    s_axi_araddr,
    s_axi_aclk,
    s_axi_awaddr,
    s_axi_wstrb,
    s_axi_wdata,
    s_axi_awvalid,
    s_axi_wvalid,
    s_axi_arvalid,
    s_axi_bready,
    s_axi_rready);
  output launch_valid_reg_0;
  output [31:0]s_axi_rdata;
  output [0:0]s_axi_rresp;
  output pwm_out;
  output done_event;
  output s_axi_wready;
  output s_axi_bvalid_reg_0;
  output s_axi_awready;
  output s_axi_arready;
  output s_axi_rvalid_reg_0;
  output burst_start;
  output period_start;
  output [0:0]s_axi_bresp;
  input s_axi_aresetn;
  input [11:0]s_axi_araddr;
  input s_axi_aclk;
  input [11:0]s_axi_awaddr;
  input [3:0]s_axi_wstrb;
  input [31:0]s_axi_wdata;
  input s_axi_awvalid;
  input s_axi_wvalid;
  input s_axi_arvalid;
  input s_axi_bready;
  input s_axi_rready;

  wire address_pending;
  wire address_pending0;
  wire address_pending_i_1_n_0;
  wire burst_start;
  wire cancel_pulse_i_1_n_0;
  wire cancel_pulse_i_2_n_0;
  wire cancel_pulse_reg_n_0;
  wire cancelled_sticky_i_2_n_0;
  wire core_n_10;
  wire core_n_11;
  wire core_n_12;
  wire core_n_13;
  wire core_n_14;
  wire core_n_15;
  wire core_n_16;
  wire core_n_17;
  wire core_n_18;
  wire core_n_19;
  wire core_n_20;
  wire core_n_21;
  wire core_n_22;
  wire core_n_23;
  wire core_n_24;
  wire core_n_25;
  wire core_n_26;
  wire core_n_27;
  wire core_n_28;
  wire core_n_29;
  wire core_n_30;
  wire core_n_31;
  wire core_n_32;
  wire core_n_33;
  wire core_n_34;
  wire core_n_35;
  wire core_n_36;
  wire core_n_37;
  wire core_n_38;
  wire core_n_39;
  wire core_n_4;
  wire core_n_40;
  wire core_n_41;
  wire core_n_43;
  wire core_n_44;
  wire core_n_5;
  wire core_n_7;
  wire core_n_8;
  wire core_n_9;
  wire [9:8]data1;
  wire data_pending_i_1_n_0;
  wire data_pending_reg_n_0;
  wire done_event;
  wire done_sticky_i_2_n_0;
  wire done_sticky_i_4_n_0;
  wire done_sticky_i_6_n_0;
  wire done_sticky_i_7_n_0;
  wire done_sticky_i_8_n_0;
  wire \error_sticky[0]_i_1_n_0 ;
  wire \error_sticky[0]_i_2_n_0 ;
  wire \error_sticky[0]_i_3_n_0 ;
  wire \error_sticky[0]_i_4_n_0 ;
  wire \error_sticky[0]_i_5_n_0 ;
  wire \error_sticky[0]_i_6_n_0 ;
  wire \error_sticky[0]_i_7_n_0 ;
  wire \error_sticky[2]_i_3_n_0 ;
  wire \error_sticky[2]_i_4_n_0 ;
  wire \error_sticky[2]_i_5_n_0 ;
  wire \error_sticky[2]_i_6_n_0 ;
  wire \error_sticky[2]_i_7_n_0 ;
  wire \error_sticky[3]_i_1_n_0 ;
  wire \error_sticky[3]_i_2_n_0 ;
  wire \error_sticky[3]_i_3_n_0 ;
  wire \error_sticky[3]_i_4_n_0 ;
  wire \error_sticky[3]_i_5_n_0 ;
  wire \error_sticky_reg_n_0_[0] ;
  wire \error_sticky_reg_n_0_[1] ;
  wire \error_sticky_reg_n_0_[2] ;
  wire \error_sticky_reg_n_0_[3] ;
  wire [31:0]launch_count;
  wire [31:0]launch_high;
  wire \launch_period[31]_i_2_n_0 ;
  wire \launch_period_reg_n_0_[0] ;
  wire \launch_period_reg_n_0_[10] ;
  wire \launch_period_reg_n_0_[11] ;
  wire \launch_period_reg_n_0_[12] ;
  wire \launch_period_reg_n_0_[13] ;
  wire \launch_period_reg_n_0_[14] ;
  wire \launch_period_reg_n_0_[15] ;
  wire \launch_period_reg_n_0_[16] ;
  wire \launch_period_reg_n_0_[17] ;
  wire \launch_period_reg_n_0_[18] ;
  wire \launch_period_reg_n_0_[19] ;
  wire \launch_period_reg_n_0_[1] ;
  wire \launch_period_reg_n_0_[20] ;
  wire \launch_period_reg_n_0_[21] ;
  wire \launch_period_reg_n_0_[22] ;
  wire \launch_period_reg_n_0_[23] ;
  wire \launch_period_reg_n_0_[24] ;
  wire \launch_period_reg_n_0_[25] ;
  wire \launch_period_reg_n_0_[26] ;
  wire \launch_period_reg_n_0_[27] ;
  wire \launch_period_reg_n_0_[28] ;
  wire \launch_period_reg_n_0_[29] ;
  wire \launch_period_reg_n_0_[2] ;
  wire \launch_period_reg_n_0_[30] ;
  wire \launch_period_reg_n_0_[31] ;
  wire \launch_period_reg_n_0_[3] ;
  wire \launch_period_reg_n_0_[4] ;
  wire \launch_period_reg_n_0_[5] ;
  wire \launch_period_reg_n_0_[6] ;
  wire \launch_period_reg_n_0_[7] ;
  wire \launch_period_reg_n_0_[8] ;
  wire \launch_period_reg_n_0_[9] ;
  wire launch_valid_i_2_n_0;
  wire launch_valid_reg_0;
  wire launch_valid_reg_n_0;
  wire p_0_in0;
  wire p_0_in__0;
  wire [24:0]p_1_in;
  wire p_1_in5_in;
  wire p_5_out;
  wire p_7_out;
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
  wire [0:0]s_axi_bresp;
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
  wire \s_axi_bresp[1]_i_11_n_0 ;
  wire \s_axi_bresp[1]_i_12_n_0 ;
  wire \s_axi_bresp[1]_i_13_n_0 ;
  wire \s_axi_bresp[1]_i_14_n_0 ;
  wire \s_axi_bresp[1]_i_15_n_0 ;
  wire \s_axi_bresp[1]_i_16_n_0 ;
  wire \s_axi_bresp[1]_i_17_n_0 ;
  wire \s_axi_bresp[1]_i_18_n_0 ;
  wire \s_axi_bresp[1]_i_19_n_0 ;
  wire \s_axi_bresp[1]_i_20_n_0 ;
  wire \s_axi_bresp[1]_i_21_n_0 ;
  wire \s_axi_bresp[1]_i_22_n_0 ;
  wire \s_axi_bresp[1]_i_23_n_0 ;
  wire \s_axi_bresp[1]_i_24_n_0 ;
  wire \s_axi_bresp[1]_i_25_n_0 ;
  wire \s_axi_bresp[1]_i_26_n_0 ;
  wire \s_axi_bresp[1]_i_27_n_0 ;
  wire \s_axi_bresp[1]_i_28_n_0 ;
  wire \s_axi_bresp[1]_i_29_n_0 ;
  wire \s_axi_bresp[1]_i_3_n_0 ;
  wire \s_axi_bresp[1]_i_5_n_0 ;
  wire \s_axi_bresp[1]_i_6_n_0 ;
  wire \s_axi_bresp[1]_i_9_n_0 ;
  wire s_axi_bvalid_i_1_n_0;
  wire s_axi_bvalid_reg_0;
  wire [31:0]s_axi_rdata;
  wire \s_axi_rdata[0]_i_4_n_0 ;
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
  wire \s_axi_rdata[1]_i_3_n_0 ;
  wire \s_axi_rdata[1]_i_4_n_0 ;
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
  wire \s_axi_rdata[2]_i_4_n_0 ;
  wire \s_axi_rdata[30]_i_2_n_0 ;
  wire \s_axi_rdata[30]_i_3_n_0 ;
  wire \s_axi_rdata[30]_i_4_n_0 ;
  wire \s_axi_rdata[31]_i_3_n_0 ;
  wire \s_axi_rdata[31]_i_4_n_0 ;
  wire \s_axi_rdata[31]_i_6_n_0 ;
  wire \s_axi_rdata[31]_i_7_n_0 ;
  wire \s_axi_rdata[3]_i_2_n_0 ;
  wire \s_axi_rdata[3]_i_4_n_0 ;
  wire \s_axi_rdata[3]_i_5_n_0 ;
  wire \s_axi_rdata[4]_i_2_n_0 ;
  wire \s_axi_rdata[4]_i_4_n_0 ;
  wire \s_axi_rdata[5]_i_2_n_0 ;
  wire \s_axi_rdata[5]_i_3_n_0 ;
  wire \s_axi_rdata[5]_i_5_n_0 ;
  wire \s_axi_rdata[6]_i_2_n_0 ;
  wire \s_axi_rdata[7]_i_2_n_0 ;
  wire \s_axi_rdata[8]_i_2_n_0 ;
  wire \s_axi_rdata[9]_i_2_n_0 ;
  wire \s_axi_rdata[9]_i_3_n_0 ;
  wire \s_axi_rdata[9]_i_4_n_0 ;
  wire s_axi_rready;
  wire [0:0]s_axi_rresp;
  wire \s_axi_rresp[1]_i_1_n_0 ;
  wire \s_axi_rresp[1]_i_2_n_0 ;
  wire s_axi_rvalid014_out;
  wire s_axi_rvalid_i_1_n_0;
  wire s_axi_rvalid_reg_0;
  wire [31:0]s_axi_wdata;
  wire s_axi_wready;
  wire [3:0]s_axi_wstrb;
  wire s_axi_wvalid;
  wire [31:0]shadow_count;
  wire \shadow_count[31]_i_2_n_0 ;
  wire [31:0]shadow_high;
  wire \shadow_high[15]_i_1_n_0 ;
  wire \shadow_high[23]_i_1_n_0 ;
  wire \shadow_high[31]_i_1_n_0 ;
  wire \shadow_high[7]_i_1_n_0 ;
  wire [31:0]shadow_period;
  wire \shadow_period[15]_i_1_n_0 ;
  wire \shadow_period[23]_i_1_n_0 ;
  wire \shadow_period[31]_i_1_n_0 ;
  wire \shadow_period[7]_i_1_n_0 ;
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
  wire \write_data_reg_n_0_[1] ;
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
  wire [3:0]NLW_s_axi_bresp3_carry_O_UNCONNECTED;
  wire [3:0]NLW_s_axi_bresp3_carry__0_O_UNCONNECTED;
  wire [3:0]NLW_s_axi_bresp3_carry__1_O_UNCONNECTED;
  wire [3:0]NLW_s_axi_bresp3_carry__2_O_UNCONNECTED;

  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT5 #(
    .INIT(32'hC008CC08)) 
    address_pending_i_1
       (.I0(s_axi_awvalid),
        .I1(s_axi_aresetn),
        .I2(s_axi_bvalid_reg_0),
        .I3(address_pending),
        .I4(data_pending_reg_n_0),
        .O(address_pending_i_1_n_0));
  FDRE address_pending_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(address_pending_i_1_n_0),
        .Q(address_pending),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0004000000000000)) 
    cancel_pulse_i_1
       (.I0(cancel_pulse_i_2_n_0),
        .I1(\error_sticky[3]_i_4_n_0 ),
        .I2(\launch_period[31]_i_2_n_0 ),
        .I3(write_address[4]),
        .I4(address_pending0),
        .I5(s_axi_aresetn),
        .O(cancel_pulse_i_1_n_0));
  LUT5 #(
    .INIT(32'hFF7FFFFF)) 
    cancel_pulse_i_2
       (.I0(\s_axi_bresp[1]_i_9_n_0 ),
        .I1(p_7_out),
        .I2(write_address[2]),
        .I3(\write_data_reg_n_0_[0] ),
        .I4(\write_data_reg_n_0_[1] ),
        .O(cancel_pulse_i_2_n_0));
  FDRE cancel_pulse_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(cancel_pulse_i_1_n_0),
        .Q(cancel_pulse_reg_n_0),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h7)) 
    cancelled_sticky_i_2
       (.I0(p_5_out),
        .I1(\write_data_reg_n_0_[9] ),
        .O(cancelled_sticky_i_2_n_0));
  FDRE cancelled_sticky_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(core_n_8),
        .Q(data1[9]),
        .R(p_0_in__0));
  system_finite_pwm_0_fdw_pwm_burst core
       (.CO(s_axi_bresp3),
        .D({core_n_10,core_n_11,core_n_12,core_n_13,core_n_14,core_n_15,core_n_16,core_n_17,core_n_18,core_n_19,core_n_20,core_n_21,core_n_22,core_n_23,core_n_24,core_n_25,core_n_26,core_n_27,core_n_28,core_n_29,core_n_30,core_n_31,core_n_32,core_n_33,core_n_34,core_n_35,core_n_36,core_n_37,core_n_38,core_n_39,core_n_40,core_n_41}),
        .E(core_n_9),
        .Q(write_address[4:2]),
        .SR(p_0_in__0),
        .\active_high_ticks_reg[31]_0 (launch_high),
        .\active_period_count_reg[31]_0 (launch_count),
        .\active_period_ticks_reg[31]_0 ({\launch_period_reg_n_0_[31] ,\launch_period_reg_n_0_[30] ,\launch_period_reg_n_0_[29] ,\launch_period_reg_n_0_[28] ,\launch_period_reg_n_0_[27] ,\launch_period_reg_n_0_[26] ,\launch_period_reg_n_0_[25] ,\launch_period_reg_n_0_[24] ,\launch_period_reg_n_0_[23] ,\launch_period_reg_n_0_[22] ,\launch_period_reg_n_0_[21] ,\launch_period_reg_n_0_[20] ,\launch_period_reg_n_0_[19] ,\launch_period_reg_n_0_[18] ,\launch_period_reg_n_0_[17] ,\launch_period_reg_n_0_[16] ,\launch_period_reg_n_0_[15] ,\launch_period_reg_n_0_[14] ,\launch_period_reg_n_0_[13] ,\launch_period_reg_n_0_[12] ,\launch_period_reg_n_0_[11] ,\launch_period_reg_n_0_[10] ,\launch_period_reg_n_0_[9] ,\launch_period_reg_n_0_[8] ,\launch_period_reg_n_0_[7] ,\launch_period_reg_n_0_[6] ,\launch_period_reg_n_0_[5] ,\launch_period_reg_n_0_[4] ,\launch_period_reg_n_0_[3] ,\launch_period_reg_n_0_[2] ,\launch_period_reg_n_0_[1] ,\launch_period_reg_n_0_[0] }),
        .address_pending0(address_pending0),
        .burst_start(burst_start),
        .cancelled_sticky_reg(cancelled_sticky_i_2_n_0),
        .cancelled_sticky_reg_0(done_sticky_i_7_n_0),
        .cfg_error_reg_0(launch_valid_reg_n_0),
        .\counter_reg[0]_0 (cancel_pulse_reg_n_0),
        .data1(data1),
        .done_event(done_event),
        .done_sticky_reg(done_sticky_i_2_n_0),
        .done_sticky_reg_0(done_sticky_i_4_n_0),
        .\error_sticky_reg[1] (\error_sticky[3]_i_4_n_0 ),
        .\error_sticky_reg[1]_0 (\error_sticky_reg_n_0_[1] ),
        .\error_sticky_reg[1]_1 (\error_sticky[0]_i_4_n_0 ),
        .\error_sticky_reg[1]_2 (\error_sticky[2]_i_4_n_0 ),
        .\error_sticky_reg[1]_3 (\error_sticky[2]_i_5_n_0 ),
        .\error_sticky_reg[1]_4 (\error_sticky[2]_i_3_n_0 ),
        .\error_sticky_reg[2] ({\write_data_reg_n_0_[2] ,\write_data_reg_n_0_[1] ,\write_data_reg_n_0_[0] }),
        .\error_sticky_reg[2]_0 (\error_sticky_reg_n_0_[2] ),
        .\launch_count_reg[0] (\launch_period[31]_i_2_n_0 ),
        .\launch_count_reg[0]_0 (done_sticky_i_6_n_0),
        .launch_valid_reg(launch_valid_reg_0),
        .launch_valid_reg_0(launch_valid_i_2_n_0),
        .period_start(period_start),
        .pwm_out(pwm_out),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_bresp(s_axi_bresp),
        .\s_axi_bresp[1]_i_4_0 (\s_axi_bresp[1]_i_10_n_0 ),
        .\s_axi_bresp[1]_i_4_1 (\s_axi_bresp[1]_i_11_n_0 ),
        .\s_axi_bresp[1]_i_4_2 (\s_axi_bresp[1]_i_12_n_0 ),
        .\s_axi_bresp[1]_i_4_3 (\s_axi_bresp[1]_i_13_n_0 ),
        .\s_axi_bresp_reg[1] (core_n_43),
        .\s_axi_bresp_reg[1]_0 (\s_axi_bresp[1]_i_9_n_0 ),
        .\s_axi_bresp_reg[1]_1 (p_7_out),
        .\s_axi_bresp_reg[1]_2 (\s_axi_bresp[1]_i_3_n_0 ),
        .\s_axi_bresp_reg[1]_3 (\s_axi_bresp[1]_i_5_n_0 ),
        .\s_axi_bresp_reg[1]_4 (\s_axi_bresp[1]_i_6_n_0 ),
        .\s_axi_rdata_reg[0] (\s_axi_rdata[0]_i_4_n_0 ),
        .\s_axi_rdata_reg[10] (\s_axi_rdata[10]_i_2_n_0 ),
        .\s_axi_rdata_reg[11] (\s_axi_rdata[11]_i_2_n_0 ),
        .\s_axi_rdata_reg[12] (\s_axi_rdata[30]_i_3_n_0 ),
        .\s_axi_rdata_reg[12]_0 (\s_axi_rdata[12]_i_2_n_0 ),
        .\s_axi_rdata_reg[13] (\s_axi_rdata[13]_i_2_n_0 ),
        .\s_axi_rdata_reg[14] (\s_axi_rdata[14]_i_2_n_0 ),
        .\s_axi_rdata_reg[15] (\s_axi_rdata[15]_i_2_n_0 ),
        .\s_axi_rdata_reg[16] (\s_axi_rdata[16]_i_2_n_0 ),
        .\s_axi_rdata_reg[17] (\s_axi_rdata[17]_i_2_n_0 ),
        .\s_axi_rdata_reg[18] (\s_axi_rdata[18]_i_2_n_0 ),
        .\s_axi_rdata_reg[19] (\s_axi_rdata[19]_i_2_n_0 ),
        .\s_axi_rdata_reg[1] (\s_axi_rdata[31]_i_3_n_0 ),
        .\s_axi_rdata_reg[1]_0 (\s_axi_rdata[3]_i_2_n_0 ),
        .\s_axi_rdata_reg[1]_1 (\s_axi_rdata[31]_i_6_n_0 ),
        .\s_axi_rdata_reg[1]_2 (\s_axi_rdata[1]_i_3_n_0 ),
        .\s_axi_rdata_reg[20] (\s_axi_rdata[20]_i_2_n_0 ),
        .\s_axi_rdata_reg[21] (\s_axi_rdata[21]_i_2_n_0 ),
        .\s_axi_rdata_reg[22] (\s_axi_rdata[22]_i_2_n_0 ),
        .\s_axi_rdata_reg[23] (\s_axi_rdata[23]_i_2_n_0 ),
        .\s_axi_rdata_reg[24] (\s_axi_rdata[24]_i_2_n_0 ),
        .\s_axi_rdata_reg[25] (\s_axi_rdata[25]_i_2_n_0 ),
        .\s_axi_rdata_reg[26] (\s_axi_rdata[26]_i_2_n_0 ),
        .\s_axi_rdata_reg[27] (\s_axi_rdata[27]_i_2_n_0 ),
        .\s_axi_rdata_reg[28] (\s_axi_rdata[28]_i_2_n_0 ),
        .\s_axi_rdata_reg[29] (\s_axi_rdata[29]_i_2_n_0 ),
        .\s_axi_rdata_reg[2] (\s_axi_rdata[31]_i_7_n_0 ),
        .\s_axi_rdata_reg[2]_0 (\s_axi_rdata[2]_i_4_n_0 ),
        .\s_axi_rdata_reg[30] (\s_axi_rdata[30]_i_2_n_0 ),
        .\s_axi_rdata_reg[31] (\s_axi_rdata[31]_i_4_n_0 ),
        .\s_axi_rdata_reg[3] (\s_axi_rdata[3]_i_4_n_0 ),
        .\s_axi_rdata_reg[4] (\s_axi_rdata[4]_i_2_n_0 ),
        .\s_axi_rdata_reg[5] (\s_axi_rdata[5]_i_2_n_0 ),
        .\s_axi_rdata_reg[5]_0 (\s_axi_rdata[5]_i_3_n_0 ),
        .\s_axi_rdata_reg[6] (\s_axi_rdata[6]_i_2_n_0 ),
        .\s_axi_rdata_reg[7] (\s_axi_rdata[7]_i_2_n_0 ),
        .\s_axi_rdata_reg[8] (\s_axi_rdata[30]_i_4_n_0 ),
        .\s_axi_rdata_reg[8]_0 (\s_axi_rdata[8]_i_2_n_0 ),
        .\s_axi_rdata_reg[9] (\s_axi_rdata[9]_i_2_n_0 ),
        .\s_axi_rdata_reg[9]_0 (\s_axi_rdata[9]_i_3_n_0 ),
        .\s_axi_rdata_reg[9]_1 (\s_axi_rdata[9]_i_4_n_0 ),
        .\write_address_reg[2] (core_n_44),
        .\write_address_reg[3] (core_n_4),
        .\write_address_reg[3]_0 (core_n_5),
        .\write_address_reg[3]_1 (core_n_7),
        .\write_address_reg[3]_2 (core_n_8));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'hC0CC0808)) 
    data_pending_i_1
       (.I0(s_axi_wvalid),
        .I1(s_axi_aresetn),
        .I2(s_axi_bvalid_reg_0),
        .I3(address_pending),
        .I4(data_pending_reg_n_0),
        .O(data_pending_i_1_n_0));
  FDRE data_pending_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(data_pending_i_1_n_0),
        .Q(data_pending_reg_n_0),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h7)) 
    done_sticky_i_2
       (.I0(p_5_out),
        .I1(p_1_in5_in),
        .O(done_sticky_i_2_n_0));
  LUT6 #(
    .INIT(64'h0000000800000000)) 
    done_sticky_i_4
       (.I0(address_pending0),
        .I1(\error_sticky[3]_i_4_n_0 ),
        .I2(write_address[1]),
        .I3(write_address[0]),
        .I4(write_address[4]),
        .I5(write_address[2]),
        .O(done_sticky_i_4_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFBF)) 
    done_sticky_i_6
       (.I0(\error_sticky[0]_i_5_n_0 ),
        .I1(p_7_out),
        .I2(\write_data_reg_n_0_[0] ),
        .I3(\write_data_reg_n_0_[1] ),
        .I4(\write_data_reg_n_0_[7] ),
        .O(done_sticky_i_6_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFDFFFFF)) 
    done_sticky_i_7
       (.I0(\write_data_reg_n_0_[0] ),
        .I1(\write_data_reg_n_0_[1] ),
        .I2(p_7_out),
        .I3(done_sticky_i_8_n_0),
        .I4(address_pending0),
        .I5(\launch_period[31]_i_2_n_0 ),
        .O(done_sticky_i_7_n_0));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'hB)) 
    done_sticky_i_8
       (.I0(write_address[4]),
        .I1(write_address[2]),
        .O(done_sticky_i_8_n_0));
  FDRE done_sticky_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(core_n_7),
        .Q(data1[8]),
        .R(p_0_in__0));
  LUT6 #(
    .INIT(64'h7FFF7F7F40004040)) 
    \error_sticky[0]_i_1 
       (.I0(\error_sticky[0]_i_2_n_0 ),
        .I1(\error_sticky[3]_i_4_n_0 ),
        .I2(address_pending0),
        .I3(\error_sticky[0]_i_3_n_0 ),
        .I4(\error_sticky[0]_i_4_n_0 ),
        .I5(\error_sticky_reg_n_0_[0] ),
        .O(\error_sticky[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCCCC4444CCCC4447)) 
    \error_sticky[0]_i_2 
       (.I0(\error_sticky_reg_n_0_[0] ),
        .I1(write_address[3]),
        .I2(\write_data_reg_n_0_[1] ),
        .I3(\write_data_reg_n_0_[7] ),
        .I4(\write_data_reg_n_0_[0] ),
        .I5(\error_sticky[0]_i_5_n_0 ),
        .O(\error_sticky[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h000000000000FEFA)) 
    \error_sticky[0]_i_3 
       (.I0(\error_sticky[0]_i_5_n_0 ),
        .I1(\write_data_reg_n_0_[0] ),
        .I2(\write_data_reg_n_0_[7] ),
        .I3(\write_data_reg_n_0_[1] ),
        .I4(\error_sticky[0]_i_6_n_0 ),
        .I5(\error_sticky[0]_i_7_n_0 ),
        .O(\error_sticky[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFF7FF)) 
    \error_sticky[0]_i_4 
       (.I0(p_7_out),
        .I1(write_address[3]),
        .I2(write_address[4]),
        .I3(write_address[2]),
        .I4(write_address[0]),
        .I5(write_address[1]),
        .O(\error_sticky[0]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \error_sticky[0]_i_5 
       (.I0(\write_data_reg_n_0_[6] ),
        .I1(\write_data_reg_n_0_[4] ),
        .I2(\write_data_reg_n_0_[2] ),
        .I3(\write_data_reg_n_0_[3] ),
        .I4(\write_data_reg_n_0_[5] ),
        .O(\error_sticky[0]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'hFFFFFF8B)) 
    \error_sticky[0]_i_6 
       (.I0(write_address[3]),
        .I1(write_address[2]),
        .I2(write_address[4]),
        .I3(write_address[0]),
        .I4(write_address[1]),
        .O(\error_sticky[0]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h5555555555557DF5)) 
    \error_sticky[0]_i_7 
       (.I0(p_7_out),
        .I1(write_address[3]),
        .I2(write_address[4]),
        .I3(write_address[2]),
        .I4(write_address[0]),
        .I5(write_address[1]),
        .O(\error_sticky[0]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h0800)) 
    \error_sticky[2]_i_3 
       (.I0(data_pending_reg_n_0),
        .I1(address_pending),
        .I2(s_axi_bvalid_reg_0),
        .I3(\error_sticky[3]_i_4_n_0 ),
        .O(\error_sticky[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFB)) 
    \error_sticky[2]_i_4 
       (.I0(write_address[3]),
        .I1(write_address[2]),
        .I2(write_address[4]),
        .I3(write_address[0]),
        .I4(write_address[1]),
        .I5(done_sticky_i_6_n_0),
        .O(\error_sticky[2]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF0404FF04)) 
    \error_sticky[2]_i_5 
       (.I0(\s_axi_bresp[1]_i_13_n_0 ),
        .I1(\error_sticky[2]_i_6_n_0 ),
        .I2(\error_sticky[2]_i_7_n_0 ),
        .I3(\s_axi_bresp[1]_i_11_n_0 ),
        .I4(\s_axi_bresp[1]_i_10_n_0 ),
        .I5(s_axi_bresp3),
        .O(\error_sticky[2]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'h00000001)) 
    \error_sticky[2]_i_6 
       (.I0(shadow_period[0]),
        .I1(shadow_period[3]),
        .I2(shadow_period[1]),
        .I3(shadow_period[2]),
        .I4(\s_axi_bresp[1]_i_22_n_0 ),
        .O(\error_sticky[2]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \error_sticky[2]_i_7 
       (.I0(shadow_period[8]),
        .I1(shadow_period[11]),
        .I2(shadow_period[9]),
        .I3(shadow_period[10]),
        .I4(\s_axi_bresp[1]_i_24_n_0 ),
        .O(\error_sticky[2]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hBFFFBFBFA000A0A0)) 
    \error_sticky[3]_i_1 
       (.I0(\error_sticky[3]_i_2_n_0 ),
        .I1(\write_data_reg_n_0_[3] ),
        .I2(address_pending0),
        .I3(\error_sticky[3]_i_3_n_0 ),
        .I4(\error_sticky[3]_i_4_n_0 ),
        .I5(\error_sticky_reg_n_0_[3] ),
        .O(\error_sticky[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'hFFFDFFFF)) 
    \error_sticky[3]_i_2 
       (.I0(write_address[2]),
        .I1(write_address[4]),
        .I2(write_address[0]),
        .I3(write_address[1]),
        .I4(\error_sticky[3]_i_4_n_0 ),
        .O(\error_sticky[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFEFFEEEFFEEFEEEF)) 
    \error_sticky[3]_i_3 
       (.I0(write_address[1]),
        .I1(write_address[0]),
        .I2(write_address[2]),
        .I3(write_address[4]),
        .I4(write_address[3]),
        .I5(p_7_out),
        .O(\error_sticky[3]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \error_sticky[3]_i_4 
       (.I0(write_address[5]),
        .I1(write_address[8]),
        .I2(write_address[10]),
        .I3(\error_sticky[3]_i_5_n_0 ),
        .O(\error_sticky[3]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \error_sticky[3]_i_5 
       (.I0(write_address[7]),
        .I1(write_address[6]),
        .I2(write_address[11]),
        .I3(write_address[9]),
        .O(\error_sticky[3]_i_5_n_0 ));
  FDRE \error_sticky_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\error_sticky[0]_i_1_n_0 ),
        .Q(\error_sticky_reg_n_0_[0] ),
        .R(p_0_in__0));
  FDRE \error_sticky_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(core_n_4),
        .Q(\error_sticky_reg_n_0_[1] ),
        .R(p_0_in__0));
  FDRE \error_sticky_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(core_n_5),
        .Q(\error_sticky_reg_n_0_[2] ),
        .R(p_0_in__0));
  FDRE \error_sticky_reg[3] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\error_sticky[3]_i_1_n_0 ),
        .Q(\error_sticky_reg_n_0_[3] ),
        .R(p_0_in__0));
  FDRE \launch_count_reg[0] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_count[0]),
        .Q(launch_count[0]),
        .R(p_0_in__0));
  FDRE \launch_count_reg[10] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_count[10]),
        .Q(launch_count[10]),
        .R(p_0_in__0));
  FDRE \launch_count_reg[11] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_count[11]),
        .Q(launch_count[11]),
        .R(p_0_in__0));
  FDRE \launch_count_reg[12] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_count[12]),
        .Q(launch_count[12]),
        .R(p_0_in__0));
  FDRE \launch_count_reg[13] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_count[13]),
        .Q(launch_count[13]),
        .R(p_0_in__0));
  FDRE \launch_count_reg[14] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_count[14]),
        .Q(launch_count[14]),
        .R(p_0_in__0));
  FDRE \launch_count_reg[15] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_count[15]),
        .Q(launch_count[15]),
        .R(p_0_in__0));
  FDRE \launch_count_reg[16] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_count[16]),
        .Q(launch_count[16]),
        .R(p_0_in__0));
  FDRE \launch_count_reg[17] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_count[17]),
        .Q(launch_count[17]),
        .R(p_0_in__0));
  FDRE \launch_count_reg[18] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_count[18]),
        .Q(launch_count[18]),
        .R(p_0_in__0));
  FDRE \launch_count_reg[19] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_count[19]),
        .Q(launch_count[19]),
        .R(p_0_in__0));
  FDRE \launch_count_reg[1] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_count[1]),
        .Q(launch_count[1]),
        .R(p_0_in__0));
  FDRE \launch_count_reg[20] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_count[20]),
        .Q(launch_count[20]),
        .R(p_0_in__0));
  FDRE \launch_count_reg[21] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_count[21]),
        .Q(launch_count[21]),
        .R(p_0_in__0));
  FDRE \launch_count_reg[22] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_count[22]),
        .Q(launch_count[22]),
        .R(p_0_in__0));
  FDRE \launch_count_reg[23] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_count[23]),
        .Q(launch_count[23]),
        .R(p_0_in__0));
  FDRE \launch_count_reg[24] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_count[24]),
        .Q(launch_count[24]),
        .R(p_0_in__0));
  FDRE \launch_count_reg[25] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_count[25]),
        .Q(launch_count[25]),
        .R(p_0_in__0));
  FDRE \launch_count_reg[26] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_count[26]),
        .Q(launch_count[26]),
        .R(p_0_in__0));
  FDRE \launch_count_reg[27] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_count[27]),
        .Q(launch_count[27]),
        .R(p_0_in__0));
  FDRE \launch_count_reg[28] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_count[28]),
        .Q(launch_count[28]),
        .R(p_0_in__0));
  FDRE \launch_count_reg[29] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_count[29]),
        .Q(launch_count[29]),
        .R(p_0_in__0));
  FDRE \launch_count_reg[2] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_count[2]),
        .Q(launch_count[2]),
        .R(p_0_in__0));
  FDRE \launch_count_reg[30] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_count[30]),
        .Q(launch_count[30]),
        .R(p_0_in__0));
  FDRE \launch_count_reg[31] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_count[31]),
        .Q(launch_count[31]),
        .R(p_0_in__0));
  FDRE \launch_count_reg[3] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_count[3]),
        .Q(launch_count[3]),
        .R(p_0_in__0));
  FDRE \launch_count_reg[4] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_count[4]),
        .Q(launch_count[4]),
        .R(p_0_in__0));
  FDRE \launch_count_reg[5] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_count[5]),
        .Q(launch_count[5]),
        .R(p_0_in__0));
  FDRE \launch_count_reg[6] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_count[6]),
        .Q(launch_count[6]),
        .R(p_0_in__0));
  FDRE \launch_count_reg[7] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_count[7]),
        .Q(launch_count[7]),
        .R(p_0_in__0));
  FDRE \launch_count_reg[8] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_count[8]),
        .Q(launch_count[8]),
        .R(p_0_in__0));
  FDRE \launch_count_reg[9] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_count[9]),
        .Q(launch_count[9]),
        .R(p_0_in__0));
  FDRE \launch_high_reg[0] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_high[0]),
        .Q(launch_high[0]),
        .R(p_0_in__0));
  FDRE \launch_high_reg[10] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_high[10]),
        .Q(launch_high[10]),
        .R(p_0_in__0));
  FDRE \launch_high_reg[11] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_high[11]),
        .Q(launch_high[11]),
        .R(p_0_in__0));
  FDRE \launch_high_reg[12] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_high[12]),
        .Q(launch_high[12]),
        .R(p_0_in__0));
  FDRE \launch_high_reg[13] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_high[13]),
        .Q(launch_high[13]),
        .R(p_0_in__0));
  FDRE \launch_high_reg[14] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_high[14]),
        .Q(launch_high[14]),
        .R(p_0_in__0));
  FDRE \launch_high_reg[15] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_high[15]),
        .Q(launch_high[15]),
        .R(p_0_in__0));
  FDRE \launch_high_reg[16] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_high[16]),
        .Q(launch_high[16]),
        .R(p_0_in__0));
  FDRE \launch_high_reg[17] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_high[17]),
        .Q(launch_high[17]),
        .R(p_0_in__0));
  FDRE \launch_high_reg[18] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_high[18]),
        .Q(launch_high[18]),
        .R(p_0_in__0));
  FDRE \launch_high_reg[19] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_high[19]),
        .Q(launch_high[19]),
        .R(p_0_in__0));
  FDRE \launch_high_reg[1] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_high[1]),
        .Q(launch_high[1]),
        .R(p_0_in__0));
  FDRE \launch_high_reg[20] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_high[20]),
        .Q(launch_high[20]),
        .R(p_0_in__0));
  FDRE \launch_high_reg[21] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_high[21]),
        .Q(launch_high[21]),
        .R(p_0_in__0));
  FDRE \launch_high_reg[22] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_high[22]),
        .Q(launch_high[22]),
        .R(p_0_in__0));
  FDRE \launch_high_reg[23] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_high[23]),
        .Q(launch_high[23]),
        .R(p_0_in__0));
  FDRE \launch_high_reg[24] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_high[24]),
        .Q(launch_high[24]),
        .R(p_0_in__0));
  FDRE \launch_high_reg[25] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_high[25]),
        .Q(launch_high[25]),
        .R(p_0_in__0));
  FDRE \launch_high_reg[26] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_high[26]),
        .Q(launch_high[26]),
        .R(p_0_in__0));
  FDRE \launch_high_reg[27] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_high[27]),
        .Q(launch_high[27]),
        .R(p_0_in__0));
  FDRE \launch_high_reg[28] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_high[28]),
        .Q(launch_high[28]),
        .R(p_0_in__0));
  FDRE \launch_high_reg[29] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_high[29]),
        .Q(launch_high[29]),
        .R(p_0_in__0));
  FDRE \launch_high_reg[2] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_high[2]),
        .Q(launch_high[2]),
        .R(p_0_in__0));
  FDRE \launch_high_reg[30] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_high[30]),
        .Q(launch_high[30]),
        .R(p_0_in__0));
  FDRE \launch_high_reg[31] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_high[31]),
        .Q(launch_high[31]),
        .R(p_0_in__0));
  FDRE \launch_high_reg[3] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_high[3]),
        .Q(launch_high[3]),
        .R(p_0_in__0));
  FDRE \launch_high_reg[4] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_high[4]),
        .Q(launch_high[4]),
        .R(p_0_in__0));
  FDRE \launch_high_reg[5] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_high[5]),
        .Q(launch_high[5]),
        .R(p_0_in__0));
  FDRE \launch_high_reg[6] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_high[6]),
        .Q(launch_high[6]),
        .R(p_0_in__0));
  FDRE \launch_high_reg[7] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_high[7]),
        .Q(launch_high[7]),
        .R(p_0_in__0));
  FDRE \launch_high_reg[8] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_high[8]),
        .Q(launch_high[8]),
        .R(p_0_in__0));
  FDRE \launch_high_reg[9] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_high[9]),
        .Q(launch_high[9]),
        .R(p_0_in__0));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \launch_period[31]_i_2 
       (.I0(write_address[3]),
        .I1(write_address[1]),
        .I2(write_address[0]),
        .O(\launch_period[31]_i_2_n_0 ));
  FDRE \launch_period_reg[0] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_period[0]),
        .Q(\launch_period_reg_n_0_[0] ),
        .R(p_0_in__0));
  FDRE \launch_period_reg[10] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_period[10]),
        .Q(\launch_period_reg_n_0_[10] ),
        .R(p_0_in__0));
  FDRE \launch_period_reg[11] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_period[11]),
        .Q(\launch_period_reg_n_0_[11] ),
        .R(p_0_in__0));
  FDRE \launch_period_reg[12] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_period[12]),
        .Q(\launch_period_reg_n_0_[12] ),
        .R(p_0_in__0));
  FDRE \launch_period_reg[13] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_period[13]),
        .Q(\launch_period_reg_n_0_[13] ),
        .R(p_0_in__0));
  FDRE \launch_period_reg[14] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_period[14]),
        .Q(\launch_period_reg_n_0_[14] ),
        .R(p_0_in__0));
  FDRE \launch_period_reg[15] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_period[15]),
        .Q(\launch_period_reg_n_0_[15] ),
        .R(p_0_in__0));
  FDRE \launch_period_reg[16] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_period[16]),
        .Q(\launch_period_reg_n_0_[16] ),
        .R(p_0_in__0));
  FDRE \launch_period_reg[17] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_period[17]),
        .Q(\launch_period_reg_n_0_[17] ),
        .R(p_0_in__0));
  FDRE \launch_period_reg[18] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_period[18]),
        .Q(\launch_period_reg_n_0_[18] ),
        .R(p_0_in__0));
  FDRE \launch_period_reg[19] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_period[19]),
        .Q(\launch_period_reg_n_0_[19] ),
        .R(p_0_in__0));
  FDRE \launch_period_reg[1] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_period[1]),
        .Q(\launch_period_reg_n_0_[1] ),
        .R(p_0_in__0));
  FDRE \launch_period_reg[20] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_period[20]),
        .Q(\launch_period_reg_n_0_[20] ),
        .R(p_0_in__0));
  FDRE \launch_period_reg[21] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_period[21]),
        .Q(\launch_period_reg_n_0_[21] ),
        .R(p_0_in__0));
  FDRE \launch_period_reg[22] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_period[22]),
        .Q(\launch_period_reg_n_0_[22] ),
        .R(p_0_in__0));
  FDRE \launch_period_reg[23] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_period[23]),
        .Q(\launch_period_reg_n_0_[23] ),
        .R(p_0_in__0));
  FDRE \launch_period_reg[24] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_period[24]),
        .Q(\launch_period_reg_n_0_[24] ),
        .R(p_0_in__0));
  FDRE \launch_period_reg[25] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_period[25]),
        .Q(\launch_period_reg_n_0_[25] ),
        .R(p_0_in__0));
  FDRE \launch_period_reg[26] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_period[26]),
        .Q(\launch_period_reg_n_0_[26] ),
        .R(p_0_in__0));
  FDRE \launch_period_reg[27] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_period[27]),
        .Q(\launch_period_reg_n_0_[27] ),
        .R(p_0_in__0));
  FDRE \launch_period_reg[28] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_period[28]),
        .Q(\launch_period_reg_n_0_[28] ),
        .R(p_0_in__0));
  FDRE \launch_period_reg[29] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_period[29]),
        .Q(\launch_period_reg_n_0_[29] ),
        .R(p_0_in__0));
  FDRE \launch_period_reg[2] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_period[2]),
        .Q(\launch_period_reg_n_0_[2] ),
        .R(p_0_in__0));
  FDRE \launch_period_reg[30] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_period[30]),
        .Q(\launch_period_reg_n_0_[30] ),
        .R(p_0_in__0));
  FDRE \launch_period_reg[31] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_period[31]),
        .Q(\launch_period_reg_n_0_[31] ),
        .R(p_0_in__0));
  FDRE \launch_period_reg[3] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_period[3]),
        .Q(\launch_period_reg_n_0_[3] ),
        .R(p_0_in__0));
  FDRE \launch_period_reg[4] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_period[4]),
        .Q(\launch_period_reg_n_0_[4] ),
        .R(p_0_in__0));
  FDRE \launch_period_reg[5] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_period[5]),
        .Q(\launch_period_reg_n_0_[5] ),
        .R(p_0_in__0));
  FDRE \launch_period_reg[6] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_period[6]),
        .Q(\launch_period_reg_n_0_[6] ),
        .R(p_0_in__0));
  FDRE \launch_period_reg[7] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_period[7]),
        .Q(\launch_period_reg_n_0_[7] ),
        .R(p_0_in__0));
  FDRE \launch_period_reg[8] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_period[8]),
        .Q(\launch_period_reg_n_0_[8] ),
        .R(p_0_in__0));
  FDRE \launch_period_reg[9] 
       (.C(s_axi_aclk),
        .CE(core_n_9),
        .D(shadow_period[9]),
        .Q(\launch_period_reg_n_0_[9] ),
        .R(p_0_in__0));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'h00000002)) 
    launch_valid_i_2
       (.I0(\error_sticky[3]_i_4_n_0 ),
        .I1(write_address[3]),
        .I2(write_address[1]),
        .I3(write_address[0]),
        .I4(write_address[4]),
        .O(launch_valid_i_2_n_0));
  FDRE launch_valid_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(core_n_44),
        .Q(launch_valid_reg_n_0),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h2)) 
    s_axi_arready_INST_0
       (.I0(s_axi_aresetn),
        .I1(s_axi_rvalid_reg_0),
        .O(s_axi_arready));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'h04)) 
    s_axi_awready_INST_0
       (.I0(address_pending),
        .I1(s_axi_aresetn),
        .I2(s_axi_bvalid_reg_0),
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
    .INIT(16'h22B2)) 
    s_axi_bresp3_carry__0_i_1
       (.I0(shadow_high[15]),
        .I1(shadow_period[15]),
        .I2(shadow_high[14]),
        .I3(shadow_period[14]),
        .O(s_axi_bresp3_carry__0_i_1_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    s_axi_bresp3_carry__0_i_2
       (.I0(shadow_high[13]),
        .I1(shadow_period[13]),
        .I2(shadow_high[12]),
        .I3(shadow_period[12]),
        .O(s_axi_bresp3_carry__0_i_2_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    s_axi_bresp3_carry__0_i_3
       (.I0(shadow_high[11]),
        .I1(shadow_period[11]),
        .I2(shadow_high[10]),
        .I3(shadow_period[10]),
        .O(s_axi_bresp3_carry__0_i_3_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    s_axi_bresp3_carry__0_i_4
       (.I0(shadow_high[9]),
        .I1(shadow_period[9]),
        .I2(shadow_high[8]),
        .I3(shadow_period[8]),
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
    .INIT(16'h22B2)) 
    s_axi_bresp3_carry__1_i_1
       (.I0(shadow_high[23]),
        .I1(shadow_period[23]),
        .I2(shadow_high[22]),
        .I3(shadow_period[22]),
        .O(s_axi_bresp3_carry__1_i_1_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    s_axi_bresp3_carry__1_i_2
       (.I0(shadow_high[21]),
        .I1(shadow_period[21]),
        .I2(shadow_high[20]),
        .I3(shadow_period[20]),
        .O(s_axi_bresp3_carry__1_i_2_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    s_axi_bresp3_carry__1_i_3
       (.I0(shadow_high[19]),
        .I1(shadow_period[19]),
        .I2(shadow_high[18]),
        .I3(shadow_period[18]),
        .O(s_axi_bresp3_carry__1_i_3_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    s_axi_bresp3_carry__1_i_4
       (.I0(shadow_high[17]),
        .I1(shadow_period[17]),
        .I2(shadow_high[16]),
        .I3(shadow_period[16]),
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
    .INIT(16'h22B2)) 
    s_axi_bresp3_carry__2_i_1
       (.I0(shadow_high[31]),
        .I1(shadow_period[31]),
        .I2(shadow_high[30]),
        .I3(shadow_period[30]),
        .O(s_axi_bresp3_carry__2_i_1_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    s_axi_bresp3_carry__2_i_2
       (.I0(shadow_high[29]),
        .I1(shadow_period[29]),
        .I2(shadow_high[28]),
        .I3(shadow_period[28]),
        .O(s_axi_bresp3_carry__2_i_2_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    s_axi_bresp3_carry__2_i_3
       (.I0(shadow_high[27]),
        .I1(shadow_period[27]),
        .I2(shadow_high[26]),
        .I3(shadow_period[26]),
        .O(s_axi_bresp3_carry__2_i_3_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    s_axi_bresp3_carry__2_i_4
       (.I0(shadow_high[25]),
        .I1(shadow_period[25]),
        .I2(shadow_high[24]),
        .I3(shadow_period[24]),
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
    .INIT(16'h22B2)) 
    s_axi_bresp3_carry_i_1
       (.I0(shadow_high[7]),
        .I1(shadow_period[7]),
        .I2(shadow_high[6]),
        .I3(shadow_period[6]),
        .O(s_axi_bresp3_carry_i_1_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    s_axi_bresp3_carry_i_2
       (.I0(shadow_high[5]),
        .I1(shadow_period[5]),
        .I2(shadow_high[4]),
        .I3(shadow_period[4]),
        .O(s_axi_bresp3_carry_i_2_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    s_axi_bresp3_carry_i_3
       (.I0(shadow_high[3]),
        .I1(shadow_period[3]),
        .I2(shadow_high[2]),
        .I3(shadow_period[2]),
        .O(s_axi_bresp3_carry_i_3_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    s_axi_bresp3_carry_i_4
       (.I0(shadow_high[1]),
        .I1(shadow_period[1]),
        .I2(shadow_high[0]),
        .I3(shadow_period[0]),
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
    .INIT(16'h0004)) 
    \s_axi_bresp[1]_i_11 
       (.I0(\s_axi_bresp[1]_i_18_n_0 ),
        .I1(\s_axi_bresp[1]_i_19_n_0 ),
        .I2(\s_axi_bresp[1]_i_20_n_0 ),
        .I3(\s_axi_bresp[1]_i_21_n_0 ),
        .O(\s_axi_bresp[1]_i_11_n_0 ));
  LUT4 #(
    .INIT(16'h0004)) 
    \s_axi_bresp[1]_i_12 
       (.I0(\s_axi_bresp[1]_i_22_n_0 ),
        .I1(\s_axi_bresp[1]_i_23_n_0 ),
        .I2(\s_axi_bresp[1]_i_24_n_0 ),
        .I3(\s_axi_bresp[1]_i_25_n_0 ),
        .O(\s_axi_bresp[1]_i_12_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \s_axi_bresp[1]_i_13 
       (.I0(\s_axi_bresp[1]_i_26_n_0 ),
        .I1(\s_axi_bresp[1]_i_27_n_0 ),
        .I2(\s_axi_bresp[1]_i_28_n_0 ),
        .I3(\s_axi_bresp[1]_i_29_n_0 ),
        .O(\s_axi_bresp[1]_i_13_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \s_axi_bresp[1]_i_14 
       (.I0(shadow_count[19]),
        .I1(shadow_count[16]),
        .I2(shadow_count[18]),
        .I3(shadow_count[17]),
        .O(\s_axi_bresp[1]_i_14_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \s_axi_bresp[1]_i_15 
       (.I0(shadow_count[3]),
        .I1(shadow_count[0]),
        .I2(shadow_count[2]),
        .I3(shadow_count[1]),
        .O(\s_axi_bresp[1]_i_15_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \s_axi_bresp[1]_i_16 
       (.I0(shadow_count[7]),
        .I1(shadow_count[4]),
        .I2(shadow_count[6]),
        .I3(shadow_count[5]),
        .O(\s_axi_bresp[1]_i_16_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \s_axi_bresp[1]_i_17 
       (.I0(shadow_count[23]),
        .I1(shadow_count[20]),
        .I2(shadow_count[22]),
        .I3(shadow_count[21]),
        .O(\s_axi_bresp[1]_i_17_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \s_axi_bresp[1]_i_18 
       (.I0(shadow_count[11]),
        .I1(shadow_count[8]),
        .I2(shadow_count[10]),
        .I3(shadow_count[9]),
        .O(\s_axi_bresp[1]_i_18_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \s_axi_bresp[1]_i_19 
       (.I0(shadow_count[27]),
        .I1(shadow_count[24]),
        .I2(shadow_count[26]),
        .I3(shadow_count[25]),
        .O(\s_axi_bresp[1]_i_19_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \s_axi_bresp[1]_i_20 
       (.I0(shadow_count[30]),
        .I1(shadow_count[28]),
        .I2(shadow_count[31]),
        .I3(shadow_count[29]),
        .O(\s_axi_bresp[1]_i_20_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \s_axi_bresp[1]_i_21 
       (.I0(shadow_count[15]),
        .I1(shadow_count[12]),
        .I2(shadow_count[14]),
        .I3(shadow_count[13]),
        .O(\s_axi_bresp[1]_i_21_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \s_axi_bresp[1]_i_22 
       (.I0(shadow_period[5]),
        .I1(shadow_period[4]),
        .I2(shadow_period[7]),
        .I3(shadow_period[6]),
        .O(\s_axi_bresp[1]_i_22_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \s_axi_bresp[1]_i_23 
       (.I0(shadow_period[2]),
        .I1(shadow_period[1]),
        .I2(shadow_period[3]),
        .I3(shadow_period[0]),
        .O(\s_axi_bresp[1]_i_23_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \s_axi_bresp[1]_i_24 
       (.I0(shadow_period[13]),
        .I1(shadow_period[12]),
        .I2(shadow_period[15]),
        .I3(shadow_period[14]),
        .O(\s_axi_bresp[1]_i_24_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \s_axi_bresp[1]_i_25 
       (.I0(shadow_period[10]),
        .I1(shadow_period[9]),
        .I2(shadow_period[11]),
        .I3(shadow_period[8]),
        .O(\s_axi_bresp[1]_i_25_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \s_axi_bresp[1]_i_26 
       (.I0(shadow_period[21]),
        .I1(shadow_period[20]),
        .I2(shadow_period[23]),
        .I3(shadow_period[22]),
        .O(\s_axi_bresp[1]_i_26_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \s_axi_bresp[1]_i_27 
       (.I0(shadow_period[18]),
        .I1(shadow_period[17]),
        .I2(shadow_period[19]),
        .I3(shadow_period[16]),
        .O(\s_axi_bresp[1]_i_27_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \s_axi_bresp[1]_i_28 
       (.I0(shadow_period[29]),
        .I1(shadow_period[28]),
        .I2(shadow_period[31]),
        .I3(shadow_period[30]),
        .O(\s_axi_bresp[1]_i_28_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \s_axi_bresp[1]_i_29 
       (.I0(shadow_period[26]),
        .I1(shadow_period[25]),
        .I2(shadow_period[27]),
        .I3(shadow_period[24]),
        .O(\s_axi_bresp[1]_i_29_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hFD)) 
    \s_axi_bresp[1]_i_3 
       (.I0(\error_sticky[3]_i_4_n_0 ),
        .I1(write_address[1]),
        .I2(write_address[0]),
        .O(\s_axi_bresp[1]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \s_axi_bresp[1]_i_5 
       (.I0(write_address[4]),
        .I1(write_address[2]),
        .O(\s_axi_bresp[1]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \s_axi_bresp[1]_i_6 
       (.I0(write_address[3]),
        .I1(write_address[4]),
        .O(\s_axi_bresp[1]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \s_axi_bresp[1]_i_7 
       (.I0(s_axi_bvalid_reg_0),
        .I1(address_pending),
        .I2(data_pending_reg_n_0),
        .O(address_pending0));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \s_axi_bresp[1]_i_9 
       (.I0(\write_data_reg_n_0_[7] ),
        .I1(\write_data_reg_n_0_[5] ),
        .I2(\write_data_reg_n_0_[3] ),
        .I3(\write_data_reg_n_0_[2] ),
        .I4(\write_data_reg_n_0_[4] ),
        .I5(\write_data_reg_n_0_[6] ),
        .O(\s_axi_bresp[1]_i_9_n_0 ));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BRESP" *) 
  FDRE \s_axi_bresp_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(core_n_43),
        .Q(s_axi_bresp),
        .R(p_0_in__0));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'h55C0)) 
    s_axi_bvalid_i_1
       (.I0(s_axi_bready),
        .I1(data_pending_reg_n_0),
        .I2(address_pending),
        .I3(s_axi_bvalid_reg_0),
        .O(s_axi_bvalid_i_1_n_0));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BVALID" *) 
  FDRE s_axi_bvalid_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_axi_bvalid_i_1_n_0),
        .Q(s_axi_bvalid_reg_0),
        .R(p_0_in__0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[0]_i_4 
       (.I0(shadow_count[0]),
        .I1(shadow_high[0]),
        .I2(\s_axi_rdata[30]_i_3_n_0 ),
        .I3(shadow_period[0]),
        .I4(\s_axi_rdata[31]_i_7_n_0 ),
        .I5(\error_sticky_reg_n_0_[0] ),
        .O(\s_axi_rdata[0]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAA80888022800080)) 
    \s_axi_rdata[10]_i_2 
       (.I0(\s_axi_rdata[30]_i_4_n_0 ),
        .I1(\s_axi_rdata[31]_i_7_n_0 ),
        .I2(shadow_period[10]),
        .I3(\s_axi_rdata[30]_i_3_n_0 ),
        .I4(shadow_high[10]),
        .I5(shadow_count[10]),
        .O(\s_axi_rdata[10]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAA80888022800080)) 
    \s_axi_rdata[11]_i_2 
       (.I0(\s_axi_rdata[30]_i_4_n_0 ),
        .I1(\s_axi_rdata[31]_i_7_n_0 ),
        .I2(shadow_period[11]),
        .I3(\s_axi_rdata[30]_i_3_n_0 ),
        .I4(shadow_high[11]),
        .I5(shadow_count[11]),
        .O(\s_axi_rdata[11]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h002A222ACC2AEE2A)) 
    \s_axi_rdata[12]_i_2 
       (.I0(\s_axi_rdata[30]_i_4_n_0 ),
        .I1(\s_axi_rdata[31]_i_7_n_0 ),
        .I2(shadow_period[12]),
        .I3(\s_axi_rdata[30]_i_3_n_0 ),
        .I4(shadow_high[12]),
        .I5(shadow_count[12]),
        .O(\s_axi_rdata[12]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAA80888022800080)) 
    \s_axi_rdata[13]_i_2 
       (.I0(\s_axi_rdata[30]_i_4_n_0 ),
        .I1(\s_axi_rdata[31]_i_7_n_0 ),
        .I2(shadow_period[13]),
        .I3(\s_axi_rdata[30]_i_3_n_0 ),
        .I4(shadow_high[13]),
        .I5(shadow_count[13]),
        .O(\s_axi_rdata[13]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h002A222ACC2AEE2A)) 
    \s_axi_rdata[14]_i_2 
       (.I0(\s_axi_rdata[30]_i_4_n_0 ),
        .I1(\s_axi_rdata[31]_i_7_n_0 ),
        .I2(shadow_period[14]),
        .I3(\s_axi_rdata[30]_i_3_n_0 ),
        .I4(shadow_high[14]),
        .I5(shadow_count[14]),
        .O(\s_axi_rdata[14]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAA80888022800080)) 
    \s_axi_rdata[15]_i_2 
       (.I0(\s_axi_rdata[30]_i_4_n_0 ),
        .I1(\s_axi_rdata[31]_i_7_n_0 ),
        .I2(shadow_period[15]),
        .I3(\s_axi_rdata[30]_i_3_n_0 ),
        .I4(shadow_high[15]),
        .I5(shadow_count[15]),
        .O(\s_axi_rdata[15]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h002A222ACC2AEE2A)) 
    \s_axi_rdata[16]_i_2 
       (.I0(\s_axi_rdata[30]_i_4_n_0 ),
        .I1(\s_axi_rdata[31]_i_7_n_0 ),
        .I2(shadow_period[16]),
        .I3(\s_axi_rdata[30]_i_3_n_0 ),
        .I4(shadow_high[16]),
        .I5(shadow_count[16]),
        .O(\s_axi_rdata[16]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAA80888022800080)) 
    \s_axi_rdata[17]_i_2 
       (.I0(\s_axi_rdata[30]_i_4_n_0 ),
        .I1(\s_axi_rdata[31]_i_7_n_0 ),
        .I2(shadow_period[17]),
        .I3(\s_axi_rdata[30]_i_3_n_0 ),
        .I4(shadow_high[17]),
        .I5(shadow_count[17]),
        .O(\s_axi_rdata[17]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h002A222ACC2AEE2A)) 
    \s_axi_rdata[18]_i_2 
       (.I0(\s_axi_rdata[30]_i_4_n_0 ),
        .I1(\s_axi_rdata[31]_i_7_n_0 ),
        .I2(shadow_period[18]),
        .I3(\s_axi_rdata[30]_i_3_n_0 ),
        .I4(shadow_high[18]),
        .I5(shadow_count[18]),
        .O(\s_axi_rdata[18]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAA80888022800080)) 
    \s_axi_rdata[19]_i_2 
       (.I0(\s_axi_rdata[30]_i_4_n_0 ),
        .I1(\s_axi_rdata[31]_i_7_n_0 ),
        .I2(shadow_period[19]),
        .I3(\s_axi_rdata[30]_i_3_n_0 ),
        .I4(shadow_high[19]),
        .I5(shadow_count[19]),
        .O(\s_axi_rdata[19]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF0145)) 
    \s_axi_rdata[1]_i_3 
       (.I0(\s_axi_rdata[30]_i_3_n_0 ),
        .I1(\s_axi_rdata[31]_i_7_n_0 ),
        .I2(\error_sticky_reg_n_0_[1] ),
        .I3(shadow_period[1]),
        .I4(\s_axi_rdata[1]_i_4_n_0 ),
        .O(\s_axi_rdata[1]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h10B0FFFF)) 
    \s_axi_rdata[1]_i_4 
       (.I0(\s_axi_rdata[31]_i_7_n_0 ),
        .I1(shadow_high[1]),
        .I2(\s_axi_rdata[30]_i_3_n_0 ),
        .I3(shadow_count[1]),
        .I4(\s_axi_rdata[30]_i_4_n_0 ),
        .O(\s_axi_rdata[1]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h002A222ACC2AEE2A)) 
    \s_axi_rdata[20]_i_2 
       (.I0(\s_axi_rdata[30]_i_4_n_0 ),
        .I1(\s_axi_rdata[31]_i_7_n_0 ),
        .I2(shadow_period[20]),
        .I3(\s_axi_rdata[30]_i_3_n_0 ),
        .I4(shadow_high[20]),
        .I5(shadow_count[20]),
        .O(\s_axi_rdata[20]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAA80888022800080)) 
    \s_axi_rdata[21]_i_2 
       (.I0(\s_axi_rdata[30]_i_4_n_0 ),
        .I1(\s_axi_rdata[31]_i_7_n_0 ),
        .I2(shadow_period[21]),
        .I3(\s_axi_rdata[30]_i_3_n_0 ),
        .I4(shadow_high[21]),
        .I5(shadow_count[21]),
        .O(\s_axi_rdata[21]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h002A222ACC2AEE2A)) 
    \s_axi_rdata[22]_i_2 
       (.I0(\s_axi_rdata[30]_i_4_n_0 ),
        .I1(\s_axi_rdata[31]_i_7_n_0 ),
        .I2(shadow_period[22]),
        .I3(\s_axi_rdata[30]_i_3_n_0 ),
        .I4(shadow_high[22]),
        .I5(shadow_count[22]),
        .O(\s_axi_rdata[22]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAA80888022800080)) 
    \s_axi_rdata[23]_i_2 
       (.I0(\s_axi_rdata[30]_i_4_n_0 ),
        .I1(\s_axi_rdata[31]_i_7_n_0 ),
        .I2(shadow_period[23]),
        .I3(\s_axi_rdata[30]_i_3_n_0 ),
        .I4(shadow_high[23]),
        .I5(shadow_count[23]),
        .O(\s_axi_rdata[23]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAA80888022800080)) 
    \s_axi_rdata[24]_i_2 
       (.I0(\s_axi_rdata[30]_i_4_n_0 ),
        .I1(\s_axi_rdata[31]_i_7_n_0 ),
        .I2(shadow_period[24]),
        .I3(\s_axi_rdata[30]_i_3_n_0 ),
        .I4(shadow_high[24]),
        .I5(shadow_count[24]),
        .O(\s_axi_rdata[24]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h002A222ACC2AEE2A)) 
    \s_axi_rdata[25]_i_2 
       (.I0(\s_axi_rdata[30]_i_4_n_0 ),
        .I1(\s_axi_rdata[31]_i_7_n_0 ),
        .I2(shadow_period[25]),
        .I3(\s_axi_rdata[30]_i_3_n_0 ),
        .I4(shadow_high[25]),
        .I5(shadow_count[25]),
        .O(\s_axi_rdata[25]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAA80888022800080)) 
    \s_axi_rdata[26]_i_2 
       (.I0(\s_axi_rdata[30]_i_4_n_0 ),
        .I1(\s_axi_rdata[31]_i_7_n_0 ),
        .I2(shadow_period[26]),
        .I3(\s_axi_rdata[30]_i_3_n_0 ),
        .I4(shadow_high[26]),
        .I5(shadow_count[26]),
        .O(\s_axi_rdata[26]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAA80888022800080)) 
    \s_axi_rdata[27]_i_2 
       (.I0(\s_axi_rdata[30]_i_4_n_0 ),
        .I1(\s_axi_rdata[31]_i_7_n_0 ),
        .I2(shadow_period[27]),
        .I3(\s_axi_rdata[30]_i_3_n_0 ),
        .I4(shadow_high[27]),
        .I5(shadow_count[27]),
        .O(\s_axi_rdata[27]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAA80888022800080)) 
    \s_axi_rdata[28]_i_2 
       (.I0(\s_axi_rdata[30]_i_4_n_0 ),
        .I1(\s_axi_rdata[31]_i_7_n_0 ),
        .I2(shadow_period[28]),
        .I3(\s_axi_rdata[30]_i_3_n_0 ),
        .I4(shadow_high[28]),
        .I5(shadow_count[28]),
        .O(\s_axi_rdata[28]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAA80888022800080)) 
    \s_axi_rdata[29]_i_2 
       (.I0(\s_axi_rdata[30]_i_4_n_0 ),
        .I1(\s_axi_rdata[31]_i_7_n_0 ),
        .I2(shadow_period[29]),
        .I3(\s_axi_rdata[30]_i_3_n_0 ),
        .I4(shadow_high[29]),
        .I5(shadow_count[29]),
        .O(\s_axi_rdata[29]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h505F3030505F3F3F)) 
    \s_axi_rdata[2]_i_4 
       (.I0(shadow_count[2]),
        .I1(shadow_high[2]),
        .I2(\s_axi_rdata[30]_i_3_n_0 ),
        .I3(shadow_period[2]),
        .I4(\s_axi_rdata[31]_i_7_n_0 ),
        .I5(\error_sticky_reg_n_0_[2] ),
        .O(\s_axi_rdata[2]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFD5DDD533D511D5)) 
    \s_axi_rdata[30]_i_2 
       (.I0(\s_axi_rdata[30]_i_4_n_0 ),
        .I1(\s_axi_rdata[31]_i_7_n_0 ),
        .I2(shadow_period[30]),
        .I3(\s_axi_rdata[30]_i_3_n_0 ),
        .I4(shadow_high[30]),
        .I5(shadow_count[30]),
        .O(\s_axi_rdata[30]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFEFFFEFEFFEE)) 
    \s_axi_rdata[30]_i_3 
       (.I0(s_axi_araddr[1]),
        .I1(s_axi_araddr[0]),
        .I2(s_axi_araddr[4]),
        .I3(s_axi_araddr[2]),
        .I4(s_axi_araddr[5]),
        .I5(s_axi_araddr[3]),
        .O(\s_axi_rdata[30]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0001010101000000)) 
    \s_axi_rdata[30]_i_4 
       (.I0(s_axi_araddr[0]),
        .I1(s_axi_araddr[1]),
        .I2(s_axi_araddr[5]),
        .I3(s_axi_araddr[3]),
        .I4(s_axi_araddr[2]),
        .I5(s_axi_araddr[4]),
        .O(\s_axi_rdata[30]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \s_axi_rdata[31]_i_1 
       (.I0(s_axi_arvalid),
        .I1(s_axi_rvalid_reg_0),
        .O(s_axi_rvalid014_out));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \s_axi_rdata[31]_i_3 
       (.I0(s_axi_araddr[10]),
        .I1(s_axi_araddr[9]),
        .I2(s_axi_araddr[6]),
        .I3(s_axi_araddr[11]),
        .I4(s_axi_araddr[7]),
        .I5(s_axi_araddr[8]),
        .O(\s_axi_rdata[31]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hF8A8580800000000)) 
    \s_axi_rdata[31]_i_4 
       (.I0(\s_axi_rdata[31]_i_7_n_0 ),
        .I1(shadow_period[31]),
        .I2(\s_axi_rdata[30]_i_3_n_0 ),
        .I3(shadow_high[31]),
        .I4(shadow_count[31]),
        .I5(\s_axi_rdata[30]_i_4_n_0 ),
        .O(\s_axi_rdata[31]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'h0010)) 
    \s_axi_rdata[31]_i_6 
       (.I0(s_axi_araddr[1]),
        .I1(s_axi_araddr[0]),
        .I2(s_axi_araddr[5]),
        .I3(s_axi_araddr[4]),
        .O(\s_axi_rdata[31]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h00011001)) 
    \s_axi_rdata[31]_i_7 
       (.I0(s_axi_araddr[1]),
        .I1(s_axi_araddr[0]),
        .I2(s_axi_araddr[5]),
        .I3(s_axi_araddr[2]),
        .I4(s_axi_araddr[4]),
        .O(\s_axi_rdata[31]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hFFF7)) 
    \s_axi_rdata[3]_i_2 
       (.I0(\s_axi_rdata[30]_i_3_n_0 ),
        .I1(\s_axi_rdata[31]_i_7_n_0 ),
        .I2(\s_axi_rdata[30]_i_4_n_0 ),
        .I3(\s_axi_rdata[31]_i_6_n_0 ),
        .O(\s_axi_rdata[3]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF0145)) 
    \s_axi_rdata[3]_i_4 
       (.I0(\s_axi_rdata[30]_i_3_n_0 ),
        .I1(\s_axi_rdata[31]_i_7_n_0 ),
        .I2(\error_sticky_reg_n_0_[3] ),
        .I3(shadow_period[3]),
        .I4(\s_axi_rdata[3]_i_5_n_0 ),
        .O(\s_axi_rdata[3]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h10B0FFFF)) 
    \s_axi_rdata[3]_i_5 
       (.I0(\s_axi_rdata[31]_i_7_n_0 ),
        .I1(shadow_high[3]),
        .I2(\s_axi_rdata[30]_i_3_n_0 ),
        .I3(shadow_count[3]),
        .I4(\s_axi_rdata[30]_i_4_n_0 ),
        .O(\s_axi_rdata[3]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFCCCB3B33000B3B3)) 
    \s_axi_rdata[4]_i_2 
       (.I0(data1[9]),
        .I1(\s_axi_rdata[30]_i_3_n_0 ),
        .I2(\s_axi_rdata[31]_i_7_n_0 ),
        .I3(shadow_period[4]),
        .I4(\s_axi_rdata[30]_i_4_n_0 ),
        .I5(\s_axi_rdata[4]_i_4_n_0 ),
        .O(\s_axi_rdata[4]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \s_axi_rdata[4]_i_4 
       (.I0(shadow_count[4]),
        .I1(\s_axi_rdata[31]_i_7_n_0 ),
        .I2(shadow_high[4]),
        .O(\s_axi_rdata[4]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h5050303000F0F0F0)) 
    \s_axi_rdata[5]_i_2 
       (.I0(shadow_count[5]),
        .I1(shadow_high[5]),
        .I2(\s_axi_rdata[30]_i_4_n_0 ),
        .I3(shadow_period[5]),
        .I4(\s_axi_rdata[31]_i_7_n_0 ),
        .I5(\s_axi_rdata[30]_i_3_n_0 ),
        .O(\s_axi_rdata[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFD55555555)) 
    \s_axi_rdata[5]_i_3 
       (.I0(\s_axi_rdata[5]_i_5_n_0 ),
        .I1(\error_sticky_reg_n_0_[3] ),
        .I2(\error_sticky_reg_n_0_[0] ),
        .I3(\error_sticky_reg_n_0_[2] ),
        .I4(\error_sticky_reg_n_0_[1] ),
        .I5(\s_axi_rdata[31]_i_7_n_0 ),
        .O(\s_axi_rdata[5]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFA94)) 
    \s_axi_rdata[5]_i_5 
       (.I0(s_axi_araddr[4]),
        .I1(s_axi_araddr[2]),
        .I2(s_axi_araddr[3]),
        .I3(s_axi_araddr[5]),
        .I4(s_axi_araddr[1]),
        .I5(s_axi_araddr[0]),
        .O(\s_axi_rdata[5]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAA80888022800080)) 
    \s_axi_rdata[6]_i_2 
       (.I0(\s_axi_rdata[30]_i_4_n_0 ),
        .I1(\s_axi_rdata[31]_i_7_n_0 ),
        .I2(shadow_period[6]),
        .I3(\s_axi_rdata[30]_i_3_n_0 ),
        .I4(shadow_high[6]),
        .I5(shadow_count[6]),
        .O(\s_axi_rdata[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAA80888022800080)) 
    \s_axi_rdata[7]_i_2 
       (.I0(\s_axi_rdata[30]_i_4_n_0 ),
        .I1(\s_axi_rdata[31]_i_7_n_0 ),
        .I2(shadow_period[7]),
        .I3(\s_axi_rdata[30]_i_3_n_0 ),
        .I4(shadow_high[7]),
        .I5(shadow_count[7]),
        .O(\s_axi_rdata[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h505F3030505F3F3F)) 
    \s_axi_rdata[8]_i_2 
       (.I0(shadow_count[8]),
        .I1(shadow_high[8]),
        .I2(\s_axi_rdata[30]_i_3_n_0 ),
        .I3(shadow_period[8]),
        .I4(\s_axi_rdata[31]_i_7_n_0 ),
        .I5(data1[8]),
        .O(\s_axi_rdata[8]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0001010101000001)) 
    \s_axi_rdata[9]_i_2 
       (.I0(s_axi_araddr[0]),
        .I1(s_axi_araddr[1]),
        .I2(s_axi_araddr[5]),
        .I3(s_axi_araddr[3]),
        .I4(s_axi_araddr[2]),
        .I5(s_axi_araddr[4]),
        .O(\s_axi_rdata[9]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[9]_i_3 
       (.I0(shadow_count[9]),
        .I1(shadow_high[9]),
        .I2(\s_axi_rdata[30]_i_3_n_0 ),
        .I3(shadow_period[9]),
        .I4(\s_axi_rdata[31]_i_7_n_0 ),
        .I5(data1[9]),
        .O(\s_axi_rdata[9]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h15)) 
    \s_axi_rdata[9]_i_4 
       (.I0(\s_axi_rdata[30]_i_4_n_0 ),
        .I1(\s_axi_rdata[30]_i_3_n_0 ),
        .I2(\s_axi_rdata[31]_i_7_n_0 ),
        .O(\s_axi_rdata[9]_i_4_n_0 ));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[0] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid014_out),
        .D(core_n_41),
        .Q(s_axi_rdata[0]),
        .R(p_0_in__0));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[10] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid014_out),
        .D(core_n_31),
        .Q(s_axi_rdata[10]),
        .R(p_0_in__0));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[11] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid014_out),
        .D(core_n_30),
        .Q(s_axi_rdata[11]),
        .R(p_0_in__0));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[12] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid014_out),
        .D(core_n_29),
        .Q(s_axi_rdata[12]),
        .R(p_0_in__0));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[13] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid014_out),
        .D(core_n_28),
        .Q(s_axi_rdata[13]),
        .R(p_0_in__0));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[14] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid014_out),
        .D(core_n_27),
        .Q(s_axi_rdata[14]),
        .R(p_0_in__0));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[15] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid014_out),
        .D(core_n_26),
        .Q(s_axi_rdata[15]),
        .R(p_0_in__0));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[16] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid014_out),
        .D(core_n_25),
        .Q(s_axi_rdata[16]),
        .R(p_0_in__0));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[17] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid014_out),
        .D(core_n_24),
        .Q(s_axi_rdata[17]),
        .R(p_0_in__0));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[18] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid014_out),
        .D(core_n_23),
        .Q(s_axi_rdata[18]),
        .R(p_0_in__0));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[19] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid014_out),
        .D(core_n_22),
        .Q(s_axi_rdata[19]),
        .R(p_0_in__0));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[1] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid014_out),
        .D(core_n_40),
        .Q(s_axi_rdata[1]),
        .R(p_0_in__0));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[20] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid014_out),
        .D(core_n_21),
        .Q(s_axi_rdata[20]),
        .R(p_0_in__0));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[21] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid014_out),
        .D(core_n_20),
        .Q(s_axi_rdata[21]),
        .R(p_0_in__0));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[22] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid014_out),
        .D(core_n_19),
        .Q(s_axi_rdata[22]),
        .R(p_0_in__0));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[23] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid014_out),
        .D(core_n_18),
        .Q(s_axi_rdata[23]),
        .R(p_0_in__0));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[24] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid014_out),
        .D(core_n_17),
        .Q(s_axi_rdata[24]),
        .R(p_0_in__0));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[25] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid014_out),
        .D(core_n_16),
        .Q(s_axi_rdata[25]),
        .R(p_0_in__0));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[26] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid014_out),
        .D(core_n_15),
        .Q(s_axi_rdata[26]),
        .R(p_0_in__0));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[27] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid014_out),
        .D(core_n_14),
        .Q(s_axi_rdata[27]),
        .R(p_0_in__0));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[28] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid014_out),
        .D(core_n_13),
        .Q(s_axi_rdata[28]),
        .R(p_0_in__0));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[29] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid014_out),
        .D(core_n_12),
        .Q(s_axi_rdata[29]),
        .R(p_0_in__0));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[2] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid014_out),
        .D(core_n_39),
        .Q(s_axi_rdata[2]),
        .R(p_0_in__0));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[30] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid014_out),
        .D(core_n_11),
        .Q(s_axi_rdata[30]),
        .R(p_0_in__0));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[31] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid014_out),
        .D(core_n_10),
        .Q(s_axi_rdata[31]),
        .R(p_0_in__0));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[3] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid014_out),
        .D(core_n_38),
        .Q(s_axi_rdata[3]),
        .R(p_0_in__0));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[4] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid014_out),
        .D(core_n_37),
        .Q(s_axi_rdata[4]),
        .R(p_0_in__0));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[5] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid014_out),
        .D(core_n_36),
        .Q(s_axi_rdata[5]),
        .R(p_0_in__0));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[6] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid014_out),
        .D(core_n_35),
        .Q(s_axi_rdata[6]),
        .R(p_0_in__0));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[7] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid014_out),
        .D(core_n_34),
        .Q(s_axi_rdata[7]),
        .R(p_0_in__0));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[8] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid014_out),
        .D(core_n_33),
        .Q(s_axi_rdata[8]),
        .R(p_0_in__0));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[9] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid014_out),
        .D(core_n_32),
        .Q(s_axi_rdata[9]),
        .R(p_0_in__0));
  LUT6 #(
    .INIT(64'hEEEEEAAAFFFFFFFF)) 
    \s_axi_rresp[1]_i_1 
       (.I0(\s_axi_rresp[1]_i_2_n_0 ),
        .I1(s_axi_araddr[4]),
        .I2(s_axi_araddr[3]),
        .I3(s_axi_araddr[2]),
        .I4(s_axi_araddr[5]),
        .I5(\s_axi_rdata[31]_i_3_n_0 ),
        .O(\s_axi_rresp[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \s_axi_rresp[1]_i_2 
       (.I0(s_axi_araddr[0]),
        .I1(s_axi_araddr[1]),
        .O(\s_axi_rresp[1]_i_2_n_0 ));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RRESP" *) 
  FDRE \s_axi_rresp_reg[1] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid014_out),
        .D(\s_axi_rresp[1]_i_1_n_0 ),
        .Q(s_axi_rresp),
        .R(p_0_in__0));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'h3A)) 
    s_axi_rvalid_i_1
       (.I0(s_axi_arvalid),
        .I1(s_axi_rready),
        .I2(s_axi_rvalid_reg_0),
        .O(s_axi_rvalid_i_1_n_0));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RVALID" *) 
  FDRE s_axi_rvalid_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_axi_rvalid_i_1_n_0),
        .Q(s_axi_rvalid_reg_0),
        .R(p_0_in__0));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'h04)) 
    s_axi_wready_INST_0
       (.I0(data_pending_reg_n_0),
        .I1(s_axi_aresetn),
        .I2(s_axi_bvalid_reg_0),
        .O(s_axi_wready));
  LUT6 #(
    .INIT(64'h0000000000040000)) 
    \shadow_count[15]_i_1 
       (.I0(write_address[2]),
        .I1(write_address[3]),
        .I2(write_address[0]),
        .I3(write_address[1]),
        .I4(p_5_out),
        .I5(\shadow_count[31]_i_2_n_0 ),
        .O(p_1_in[8]));
  LUT6 #(
    .INIT(64'h0000000000040000)) 
    \shadow_count[23]_i_1 
       (.I0(write_address[2]),
        .I1(write_address[3]),
        .I2(write_address[0]),
        .I3(write_address[1]),
        .I4(p_0_in0),
        .I5(\shadow_count[31]_i_2_n_0 ),
        .O(p_1_in[16]));
  LUT6 #(
    .INIT(64'h0000000000040000)) 
    \shadow_count[31]_i_1 
       (.I0(write_address[2]),
        .I1(write_address[3]),
        .I2(write_address[0]),
        .I3(write_address[1]),
        .I4(\write_strobes_reg_n_0_[3] ),
        .I5(\shadow_count[31]_i_2_n_0 ),
        .O(p_1_in[24]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'hF7FFFFFF)) 
    \shadow_count[31]_i_2 
       (.I0(write_address[4]),
        .I1(\error_sticky[3]_i_4_n_0 ),
        .I2(s_axi_bvalid_reg_0),
        .I3(address_pending),
        .I4(data_pending_reg_n_0),
        .O(\shadow_count[31]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000040000)) 
    \shadow_count[7]_i_1 
       (.I0(write_address[2]),
        .I1(write_address[3]),
        .I2(write_address[0]),
        .I3(write_address[1]),
        .I4(p_7_out),
        .I5(\shadow_count[31]_i_2_n_0 ),
        .O(p_1_in[0]));
  FDRE \shadow_count_reg[0] 
       (.C(s_axi_aclk),
        .CE(p_1_in[0]),
        .D(\write_data_reg_n_0_[0] ),
        .Q(shadow_count[0]),
        .R(p_0_in__0));
  FDRE \shadow_count_reg[10] 
       (.C(s_axi_aclk),
        .CE(p_1_in[8]),
        .D(\write_data_reg_n_0_[10] ),
        .Q(shadow_count[10]),
        .R(p_0_in__0));
  FDRE \shadow_count_reg[11] 
       (.C(s_axi_aclk),
        .CE(p_1_in[8]),
        .D(\write_data_reg_n_0_[11] ),
        .Q(shadow_count[11]),
        .R(p_0_in__0));
  FDRE \shadow_count_reg[12] 
       (.C(s_axi_aclk),
        .CE(p_1_in[8]),
        .D(\write_data_reg_n_0_[12] ),
        .Q(shadow_count[12]),
        .R(p_0_in__0));
  FDRE \shadow_count_reg[13] 
       (.C(s_axi_aclk),
        .CE(p_1_in[8]),
        .D(\write_data_reg_n_0_[13] ),
        .Q(shadow_count[13]),
        .R(p_0_in__0));
  FDRE \shadow_count_reg[14] 
       (.C(s_axi_aclk),
        .CE(p_1_in[8]),
        .D(\write_data_reg_n_0_[14] ),
        .Q(shadow_count[14]),
        .R(p_0_in__0));
  FDRE \shadow_count_reg[15] 
       (.C(s_axi_aclk),
        .CE(p_1_in[8]),
        .D(\write_data_reg_n_0_[15] ),
        .Q(shadow_count[15]),
        .R(p_0_in__0));
  FDRE \shadow_count_reg[16] 
       (.C(s_axi_aclk),
        .CE(p_1_in[16]),
        .D(\write_data_reg_n_0_[16] ),
        .Q(shadow_count[16]),
        .R(p_0_in__0));
  FDRE \shadow_count_reg[17] 
       (.C(s_axi_aclk),
        .CE(p_1_in[16]),
        .D(\write_data_reg_n_0_[17] ),
        .Q(shadow_count[17]),
        .R(p_0_in__0));
  FDRE \shadow_count_reg[18] 
       (.C(s_axi_aclk),
        .CE(p_1_in[16]),
        .D(\write_data_reg_n_0_[18] ),
        .Q(shadow_count[18]),
        .R(p_0_in__0));
  FDRE \shadow_count_reg[19] 
       (.C(s_axi_aclk),
        .CE(p_1_in[16]),
        .D(\write_data_reg_n_0_[19] ),
        .Q(shadow_count[19]),
        .R(p_0_in__0));
  FDRE \shadow_count_reg[1] 
       (.C(s_axi_aclk),
        .CE(p_1_in[0]),
        .D(\write_data_reg_n_0_[1] ),
        .Q(shadow_count[1]),
        .R(p_0_in__0));
  FDRE \shadow_count_reg[20] 
       (.C(s_axi_aclk),
        .CE(p_1_in[16]),
        .D(\write_data_reg_n_0_[20] ),
        .Q(shadow_count[20]),
        .R(p_0_in__0));
  FDRE \shadow_count_reg[21] 
       (.C(s_axi_aclk),
        .CE(p_1_in[16]),
        .D(\write_data_reg_n_0_[21] ),
        .Q(shadow_count[21]),
        .R(p_0_in__0));
  FDRE \shadow_count_reg[22] 
       (.C(s_axi_aclk),
        .CE(p_1_in[16]),
        .D(\write_data_reg_n_0_[22] ),
        .Q(shadow_count[22]),
        .R(p_0_in__0));
  FDRE \shadow_count_reg[23] 
       (.C(s_axi_aclk),
        .CE(p_1_in[16]),
        .D(\write_data_reg_n_0_[23] ),
        .Q(shadow_count[23]),
        .R(p_0_in__0));
  FDRE \shadow_count_reg[24] 
       (.C(s_axi_aclk),
        .CE(p_1_in[24]),
        .D(\write_data_reg_n_0_[24] ),
        .Q(shadow_count[24]),
        .R(p_0_in__0));
  FDRE \shadow_count_reg[25] 
       (.C(s_axi_aclk),
        .CE(p_1_in[24]),
        .D(\write_data_reg_n_0_[25] ),
        .Q(shadow_count[25]),
        .R(p_0_in__0));
  FDRE \shadow_count_reg[26] 
       (.C(s_axi_aclk),
        .CE(p_1_in[24]),
        .D(\write_data_reg_n_0_[26] ),
        .Q(shadow_count[26]),
        .R(p_0_in__0));
  FDRE \shadow_count_reg[27] 
       (.C(s_axi_aclk),
        .CE(p_1_in[24]),
        .D(\write_data_reg_n_0_[27] ),
        .Q(shadow_count[27]),
        .R(p_0_in__0));
  FDRE \shadow_count_reg[28] 
       (.C(s_axi_aclk),
        .CE(p_1_in[24]),
        .D(\write_data_reg_n_0_[28] ),
        .Q(shadow_count[28]),
        .R(p_0_in__0));
  FDRE \shadow_count_reg[29] 
       (.C(s_axi_aclk),
        .CE(p_1_in[24]),
        .D(\write_data_reg_n_0_[29] ),
        .Q(shadow_count[29]),
        .R(p_0_in__0));
  FDRE \shadow_count_reg[2] 
       (.C(s_axi_aclk),
        .CE(p_1_in[0]),
        .D(\write_data_reg_n_0_[2] ),
        .Q(shadow_count[2]),
        .R(p_0_in__0));
  FDRE \shadow_count_reg[30] 
       (.C(s_axi_aclk),
        .CE(p_1_in[24]),
        .D(\write_data_reg_n_0_[30] ),
        .Q(shadow_count[30]),
        .R(p_0_in__0));
  FDRE \shadow_count_reg[31] 
       (.C(s_axi_aclk),
        .CE(p_1_in[24]),
        .D(\write_data_reg_n_0_[31] ),
        .Q(shadow_count[31]),
        .R(p_0_in__0));
  FDRE \shadow_count_reg[3] 
       (.C(s_axi_aclk),
        .CE(p_1_in[0]),
        .D(\write_data_reg_n_0_[3] ),
        .Q(shadow_count[3]),
        .R(p_0_in__0));
  FDRE \shadow_count_reg[4] 
       (.C(s_axi_aclk),
        .CE(p_1_in[0]),
        .D(\write_data_reg_n_0_[4] ),
        .Q(shadow_count[4]),
        .R(p_0_in__0));
  FDRE \shadow_count_reg[5] 
       (.C(s_axi_aclk),
        .CE(p_1_in[0]),
        .D(\write_data_reg_n_0_[5] ),
        .Q(shadow_count[5]),
        .R(p_0_in__0));
  FDRE \shadow_count_reg[6] 
       (.C(s_axi_aclk),
        .CE(p_1_in[0]),
        .D(\write_data_reg_n_0_[6] ),
        .Q(shadow_count[6]),
        .R(p_0_in__0));
  FDRE \shadow_count_reg[7] 
       (.C(s_axi_aclk),
        .CE(p_1_in[0]),
        .D(\write_data_reg_n_0_[7] ),
        .Q(shadow_count[7]),
        .R(p_0_in__0));
  FDRE \shadow_count_reg[8] 
       (.C(s_axi_aclk),
        .CE(p_1_in[8]),
        .D(p_1_in5_in),
        .Q(shadow_count[8]),
        .R(p_0_in__0));
  FDRE \shadow_count_reg[9] 
       (.C(s_axi_aclk),
        .CE(p_1_in[8]),
        .D(\write_data_reg_n_0_[9] ),
        .Q(shadow_count[9]),
        .R(p_0_in__0));
  LUT6 #(
    .INIT(64'h0000000001000000)) 
    \shadow_high[15]_i_1 
       (.I0(write_address[3]),
        .I1(write_address[1]),
        .I2(write_address[0]),
        .I3(write_address[2]),
        .I4(p_5_out),
        .I5(\shadow_count[31]_i_2_n_0 ),
        .O(\shadow_high[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000001000000)) 
    \shadow_high[23]_i_1 
       (.I0(write_address[3]),
        .I1(write_address[1]),
        .I2(write_address[0]),
        .I3(write_address[2]),
        .I4(p_0_in0),
        .I5(\shadow_count[31]_i_2_n_0 ),
        .O(\shadow_high[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000001000000)) 
    \shadow_high[31]_i_1 
       (.I0(write_address[3]),
        .I1(write_address[1]),
        .I2(write_address[0]),
        .I3(write_address[2]),
        .I4(\write_strobes_reg_n_0_[3] ),
        .I5(\shadow_count[31]_i_2_n_0 ),
        .O(\shadow_high[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000001000000)) 
    \shadow_high[7]_i_1 
       (.I0(write_address[3]),
        .I1(write_address[1]),
        .I2(write_address[0]),
        .I3(write_address[2]),
        .I4(p_7_out),
        .I5(\shadow_count[31]_i_2_n_0 ),
        .O(\shadow_high[7]_i_1_n_0 ));
  FDRE \shadow_high_reg[0] 
       (.C(s_axi_aclk),
        .CE(\shadow_high[7]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[0] ),
        .Q(shadow_high[0]),
        .R(p_0_in__0));
  FDRE \shadow_high_reg[10] 
       (.C(s_axi_aclk),
        .CE(\shadow_high[15]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[10] ),
        .Q(shadow_high[10]),
        .R(p_0_in__0));
  FDRE \shadow_high_reg[11] 
       (.C(s_axi_aclk),
        .CE(\shadow_high[15]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[11] ),
        .Q(shadow_high[11]),
        .R(p_0_in__0));
  FDRE \shadow_high_reg[12] 
       (.C(s_axi_aclk),
        .CE(\shadow_high[15]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[12] ),
        .Q(shadow_high[12]),
        .R(p_0_in__0));
  FDRE \shadow_high_reg[13] 
       (.C(s_axi_aclk),
        .CE(\shadow_high[15]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[13] ),
        .Q(shadow_high[13]),
        .R(p_0_in__0));
  FDRE \shadow_high_reg[14] 
       (.C(s_axi_aclk),
        .CE(\shadow_high[15]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[14] ),
        .Q(shadow_high[14]),
        .R(p_0_in__0));
  FDRE \shadow_high_reg[15] 
       (.C(s_axi_aclk),
        .CE(\shadow_high[15]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[15] ),
        .Q(shadow_high[15]),
        .R(p_0_in__0));
  FDRE \shadow_high_reg[16] 
       (.C(s_axi_aclk),
        .CE(\shadow_high[23]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[16] ),
        .Q(shadow_high[16]),
        .R(p_0_in__0));
  FDRE \shadow_high_reg[17] 
       (.C(s_axi_aclk),
        .CE(\shadow_high[23]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[17] ),
        .Q(shadow_high[17]),
        .R(p_0_in__0));
  FDRE \shadow_high_reg[18] 
       (.C(s_axi_aclk),
        .CE(\shadow_high[23]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[18] ),
        .Q(shadow_high[18]),
        .R(p_0_in__0));
  FDRE \shadow_high_reg[19] 
       (.C(s_axi_aclk),
        .CE(\shadow_high[23]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[19] ),
        .Q(shadow_high[19]),
        .R(p_0_in__0));
  FDRE \shadow_high_reg[1] 
       (.C(s_axi_aclk),
        .CE(\shadow_high[7]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[1] ),
        .Q(shadow_high[1]),
        .R(p_0_in__0));
  FDRE \shadow_high_reg[20] 
       (.C(s_axi_aclk),
        .CE(\shadow_high[23]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[20] ),
        .Q(shadow_high[20]),
        .R(p_0_in__0));
  FDRE \shadow_high_reg[21] 
       (.C(s_axi_aclk),
        .CE(\shadow_high[23]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[21] ),
        .Q(shadow_high[21]),
        .R(p_0_in__0));
  FDRE \shadow_high_reg[22] 
       (.C(s_axi_aclk),
        .CE(\shadow_high[23]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[22] ),
        .Q(shadow_high[22]),
        .R(p_0_in__0));
  FDRE \shadow_high_reg[23] 
       (.C(s_axi_aclk),
        .CE(\shadow_high[23]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[23] ),
        .Q(shadow_high[23]),
        .R(p_0_in__0));
  FDRE \shadow_high_reg[24] 
       (.C(s_axi_aclk),
        .CE(\shadow_high[31]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[24] ),
        .Q(shadow_high[24]),
        .R(p_0_in__0));
  FDRE \shadow_high_reg[25] 
       (.C(s_axi_aclk),
        .CE(\shadow_high[31]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[25] ),
        .Q(shadow_high[25]),
        .R(p_0_in__0));
  FDRE \shadow_high_reg[26] 
       (.C(s_axi_aclk),
        .CE(\shadow_high[31]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[26] ),
        .Q(shadow_high[26]),
        .R(p_0_in__0));
  FDRE \shadow_high_reg[27] 
       (.C(s_axi_aclk),
        .CE(\shadow_high[31]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[27] ),
        .Q(shadow_high[27]),
        .R(p_0_in__0));
  FDRE \shadow_high_reg[28] 
       (.C(s_axi_aclk),
        .CE(\shadow_high[31]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[28] ),
        .Q(shadow_high[28]),
        .R(p_0_in__0));
  FDRE \shadow_high_reg[29] 
       (.C(s_axi_aclk),
        .CE(\shadow_high[31]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[29] ),
        .Q(shadow_high[29]),
        .R(p_0_in__0));
  FDRE \shadow_high_reg[2] 
       (.C(s_axi_aclk),
        .CE(\shadow_high[7]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[2] ),
        .Q(shadow_high[2]),
        .R(p_0_in__0));
  FDRE \shadow_high_reg[30] 
       (.C(s_axi_aclk),
        .CE(\shadow_high[31]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[30] ),
        .Q(shadow_high[30]),
        .R(p_0_in__0));
  FDRE \shadow_high_reg[31] 
       (.C(s_axi_aclk),
        .CE(\shadow_high[31]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[31] ),
        .Q(shadow_high[31]),
        .R(p_0_in__0));
  FDRE \shadow_high_reg[3] 
       (.C(s_axi_aclk),
        .CE(\shadow_high[7]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[3] ),
        .Q(shadow_high[3]),
        .R(p_0_in__0));
  FDRE \shadow_high_reg[4] 
       (.C(s_axi_aclk),
        .CE(\shadow_high[7]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[4] ),
        .Q(shadow_high[4]),
        .R(p_0_in__0));
  FDRE \shadow_high_reg[5] 
       (.C(s_axi_aclk),
        .CE(\shadow_high[7]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[5] ),
        .Q(shadow_high[5]),
        .R(p_0_in__0));
  FDRE \shadow_high_reg[6] 
       (.C(s_axi_aclk),
        .CE(\shadow_high[7]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[6] ),
        .Q(shadow_high[6]),
        .R(p_0_in__0));
  FDRE \shadow_high_reg[7] 
       (.C(s_axi_aclk),
        .CE(\shadow_high[7]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[7] ),
        .Q(shadow_high[7]),
        .R(p_0_in__0));
  FDRE \shadow_high_reg[8] 
       (.C(s_axi_aclk),
        .CE(\shadow_high[15]_i_1_n_0 ),
        .D(p_1_in5_in),
        .Q(shadow_high[8]),
        .R(p_0_in__0));
  FDRE \shadow_high_reg[9] 
       (.C(s_axi_aclk),
        .CE(\shadow_high[15]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[9] ),
        .Q(shadow_high[9]),
        .R(p_0_in__0));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    \shadow_period[15]_i_1 
       (.I0(p_5_out),
        .I1(\shadow_count[31]_i_2_n_0 ),
        .I2(write_address[3]),
        .I3(write_address[1]),
        .I4(write_address[0]),
        .I5(write_address[2]),
        .O(\shadow_period[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    \shadow_period[23]_i_1 
       (.I0(p_0_in0),
        .I1(\shadow_count[31]_i_2_n_0 ),
        .I2(write_address[3]),
        .I3(write_address[1]),
        .I4(write_address[0]),
        .I5(write_address[2]),
        .O(\shadow_period[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    \shadow_period[31]_i_1 
       (.I0(\write_strobes_reg_n_0_[3] ),
        .I1(\shadow_count[31]_i_2_n_0 ),
        .I2(write_address[3]),
        .I3(write_address[1]),
        .I4(write_address[0]),
        .I5(write_address[2]),
        .O(\shadow_period[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    \shadow_period[7]_i_1 
       (.I0(p_7_out),
        .I1(\shadow_count[31]_i_2_n_0 ),
        .I2(write_address[3]),
        .I3(write_address[1]),
        .I4(write_address[0]),
        .I5(write_address[2]),
        .O(\shadow_period[7]_i_1_n_0 ));
  FDRE \shadow_period_reg[0] 
       (.C(s_axi_aclk),
        .CE(\shadow_period[7]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[0] ),
        .Q(shadow_period[0]),
        .R(p_0_in__0));
  FDRE \shadow_period_reg[10] 
       (.C(s_axi_aclk),
        .CE(\shadow_period[15]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[10] ),
        .Q(shadow_period[10]),
        .R(p_0_in__0));
  FDRE \shadow_period_reg[11] 
       (.C(s_axi_aclk),
        .CE(\shadow_period[15]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[11] ),
        .Q(shadow_period[11]),
        .R(p_0_in__0));
  FDRE \shadow_period_reg[12] 
       (.C(s_axi_aclk),
        .CE(\shadow_period[15]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[12] ),
        .Q(shadow_period[12]),
        .R(p_0_in__0));
  FDRE \shadow_period_reg[13] 
       (.C(s_axi_aclk),
        .CE(\shadow_period[15]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[13] ),
        .Q(shadow_period[13]),
        .R(p_0_in__0));
  FDRE \shadow_period_reg[14] 
       (.C(s_axi_aclk),
        .CE(\shadow_period[15]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[14] ),
        .Q(shadow_period[14]),
        .R(p_0_in__0));
  FDRE \shadow_period_reg[15] 
       (.C(s_axi_aclk),
        .CE(\shadow_period[15]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[15] ),
        .Q(shadow_period[15]),
        .R(p_0_in__0));
  FDRE \shadow_period_reg[16] 
       (.C(s_axi_aclk),
        .CE(\shadow_period[23]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[16] ),
        .Q(shadow_period[16]),
        .R(p_0_in__0));
  FDRE \shadow_period_reg[17] 
       (.C(s_axi_aclk),
        .CE(\shadow_period[23]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[17] ),
        .Q(shadow_period[17]),
        .R(p_0_in__0));
  FDRE \shadow_period_reg[18] 
       (.C(s_axi_aclk),
        .CE(\shadow_period[23]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[18] ),
        .Q(shadow_period[18]),
        .R(p_0_in__0));
  FDRE \shadow_period_reg[19] 
       (.C(s_axi_aclk),
        .CE(\shadow_period[23]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[19] ),
        .Q(shadow_period[19]),
        .R(p_0_in__0));
  FDRE \shadow_period_reg[1] 
       (.C(s_axi_aclk),
        .CE(\shadow_period[7]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[1] ),
        .Q(shadow_period[1]),
        .R(p_0_in__0));
  FDRE \shadow_period_reg[20] 
       (.C(s_axi_aclk),
        .CE(\shadow_period[23]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[20] ),
        .Q(shadow_period[20]),
        .R(p_0_in__0));
  FDRE \shadow_period_reg[21] 
       (.C(s_axi_aclk),
        .CE(\shadow_period[23]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[21] ),
        .Q(shadow_period[21]),
        .R(p_0_in__0));
  FDRE \shadow_period_reg[22] 
       (.C(s_axi_aclk),
        .CE(\shadow_period[23]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[22] ),
        .Q(shadow_period[22]),
        .R(p_0_in__0));
  FDRE \shadow_period_reg[23] 
       (.C(s_axi_aclk),
        .CE(\shadow_period[23]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[23] ),
        .Q(shadow_period[23]),
        .R(p_0_in__0));
  FDRE \shadow_period_reg[24] 
       (.C(s_axi_aclk),
        .CE(\shadow_period[31]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[24] ),
        .Q(shadow_period[24]),
        .R(p_0_in__0));
  FDRE \shadow_period_reg[25] 
       (.C(s_axi_aclk),
        .CE(\shadow_period[31]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[25] ),
        .Q(shadow_period[25]),
        .R(p_0_in__0));
  FDRE \shadow_period_reg[26] 
       (.C(s_axi_aclk),
        .CE(\shadow_period[31]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[26] ),
        .Q(shadow_period[26]),
        .R(p_0_in__0));
  FDRE \shadow_period_reg[27] 
       (.C(s_axi_aclk),
        .CE(\shadow_period[31]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[27] ),
        .Q(shadow_period[27]),
        .R(p_0_in__0));
  FDRE \shadow_period_reg[28] 
       (.C(s_axi_aclk),
        .CE(\shadow_period[31]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[28] ),
        .Q(shadow_period[28]),
        .R(p_0_in__0));
  FDRE \shadow_period_reg[29] 
       (.C(s_axi_aclk),
        .CE(\shadow_period[31]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[29] ),
        .Q(shadow_period[29]),
        .R(p_0_in__0));
  FDRE \shadow_period_reg[2] 
       (.C(s_axi_aclk),
        .CE(\shadow_period[7]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[2] ),
        .Q(shadow_period[2]),
        .R(p_0_in__0));
  FDRE \shadow_period_reg[30] 
       (.C(s_axi_aclk),
        .CE(\shadow_period[31]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[30] ),
        .Q(shadow_period[30]),
        .R(p_0_in__0));
  FDRE \shadow_period_reg[31] 
       (.C(s_axi_aclk),
        .CE(\shadow_period[31]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[31] ),
        .Q(shadow_period[31]),
        .R(p_0_in__0));
  FDRE \shadow_period_reg[3] 
       (.C(s_axi_aclk),
        .CE(\shadow_period[7]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[3] ),
        .Q(shadow_period[3]),
        .R(p_0_in__0));
  FDRE \shadow_period_reg[4] 
       (.C(s_axi_aclk),
        .CE(\shadow_period[7]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[4] ),
        .Q(shadow_period[4]),
        .R(p_0_in__0));
  FDRE \shadow_period_reg[5] 
       (.C(s_axi_aclk),
        .CE(\shadow_period[7]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[5] ),
        .Q(shadow_period[5]),
        .R(p_0_in__0));
  FDRE \shadow_period_reg[6] 
       (.C(s_axi_aclk),
        .CE(\shadow_period[7]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[6] ),
        .Q(shadow_period[6]),
        .R(p_0_in__0));
  FDRE \shadow_period_reg[7] 
       (.C(s_axi_aclk),
        .CE(\shadow_period[7]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[7] ),
        .Q(shadow_period[7]),
        .R(p_0_in__0));
  FDRE \shadow_period_reg[8] 
       (.C(s_axi_aclk),
        .CE(\shadow_period[15]_i_1_n_0 ),
        .D(p_1_in5_in),
        .Q(shadow_period[8]),
        .R(p_0_in__0));
  FDRE \shadow_period_reg[9] 
       (.C(s_axi_aclk),
        .CE(\shadow_period[15]_i_1_n_0 ),
        .D(\write_data_reg_n_0_[9] ),
        .Q(shadow_period[9]),
        .R(p_0_in__0));
  LUT3 #(
    .INIT(8'h02)) 
    \write_address[11]_i_1 
       (.I0(s_axi_awvalid),
        .I1(s_axi_bvalid_reg_0),
        .I2(address_pending),
        .O(write_address0));
  FDRE \write_address_reg[0] 
       (.C(s_axi_aclk),
        .CE(write_address0),
        .D(s_axi_awaddr[0]),
        .Q(write_address[0]),
        .R(p_0_in__0));
  FDRE \write_address_reg[10] 
       (.C(s_axi_aclk),
        .CE(write_address0),
        .D(s_axi_awaddr[10]),
        .Q(write_address[10]),
        .R(p_0_in__0));
  FDRE \write_address_reg[11] 
       (.C(s_axi_aclk),
        .CE(write_address0),
        .D(s_axi_awaddr[11]),
        .Q(write_address[11]),
        .R(p_0_in__0));
  FDRE \write_address_reg[1] 
       (.C(s_axi_aclk),
        .CE(write_address0),
        .D(s_axi_awaddr[1]),
        .Q(write_address[1]),
        .R(p_0_in__0));
  FDRE \write_address_reg[2] 
       (.C(s_axi_aclk),
        .CE(write_address0),
        .D(s_axi_awaddr[2]),
        .Q(write_address[2]),
        .R(p_0_in__0));
  FDRE \write_address_reg[3] 
       (.C(s_axi_aclk),
        .CE(write_address0),
        .D(s_axi_awaddr[3]),
        .Q(write_address[3]),
        .R(p_0_in__0));
  FDRE \write_address_reg[4] 
       (.C(s_axi_aclk),
        .CE(write_address0),
        .D(s_axi_awaddr[4]),
        .Q(write_address[4]),
        .R(p_0_in__0));
  FDRE \write_address_reg[5] 
       (.C(s_axi_aclk),
        .CE(write_address0),
        .D(s_axi_awaddr[5]),
        .Q(write_address[5]),
        .R(p_0_in__0));
  FDRE \write_address_reg[6] 
       (.C(s_axi_aclk),
        .CE(write_address0),
        .D(s_axi_awaddr[6]),
        .Q(write_address[6]),
        .R(p_0_in__0));
  FDRE \write_address_reg[7] 
       (.C(s_axi_aclk),
        .CE(write_address0),
        .D(s_axi_awaddr[7]),
        .Q(write_address[7]),
        .R(p_0_in__0));
  FDRE \write_address_reg[8] 
       (.C(s_axi_aclk),
        .CE(write_address0),
        .D(s_axi_awaddr[8]),
        .Q(write_address[8]),
        .R(p_0_in__0));
  FDRE \write_address_reg[9] 
       (.C(s_axi_aclk),
        .CE(write_address0),
        .D(s_axi_awaddr[9]),
        .Q(write_address[9]),
        .R(p_0_in__0));
  FDRE \write_data_reg[0] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[0]),
        .Q(\write_data_reg_n_0_[0] ),
        .R(p_0_in__0));
  FDRE \write_data_reg[10] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[10]),
        .Q(\write_data_reg_n_0_[10] ),
        .R(p_0_in__0));
  FDRE \write_data_reg[11] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[11]),
        .Q(\write_data_reg_n_0_[11] ),
        .R(p_0_in__0));
  FDRE \write_data_reg[12] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[12]),
        .Q(\write_data_reg_n_0_[12] ),
        .R(p_0_in__0));
  FDRE \write_data_reg[13] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[13]),
        .Q(\write_data_reg_n_0_[13] ),
        .R(p_0_in__0));
  FDRE \write_data_reg[14] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[14]),
        .Q(\write_data_reg_n_0_[14] ),
        .R(p_0_in__0));
  FDRE \write_data_reg[15] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[15]),
        .Q(\write_data_reg_n_0_[15] ),
        .R(p_0_in__0));
  FDRE \write_data_reg[16] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[16]),
        .Q(\write_data_reg_n_0_[16] ),
        .R(p_0_in__0));
  FDRE \write_data_reg[17] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[17]),
        .Q(\write_data_reg_n_0_[17] ),
        .R(p_0_in__0));
  FDRE \write_data_reg[18] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[18]),
        .Q(\write_data_reg_n_0_[18] ),
        .R(p_0_in__0));
  FDRE \write_data_reg[19] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[19]),
        .Q(\write_data_reg_n_0_[19] ),
        .R(p_0_in__0));
  FDRE \write_data_reg[1] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[1]),
        .Q(\write_data_reg_n_0_[1] ),
        .R(p_0_in__0));
  FDRE \write_data_reg[20] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[20]),
        .Q(\write_data_reg_n_0_[20] ),
        .R(p_0_in__0));
  FDRE \write_data_reg[21] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[21]),
        .Q(\write_data_reg_n_0_[21] ),
        .R(p_0_in__0));
  FDRE \write_data_reg[22] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[22]),
        .Q(\write_data_reg_n_0_[22] ),
        .R(p_0_in__0));
  FDRE \write_data_reg[23] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[23]),
        .Q(\write_data_reg_n_0_[23] ),
        .R(p_0_in__0));
  FDRE \write_data_reg[24] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[24]),
        .Q(\write_data_reg_n_0_[24] ),
        .R(p_0_in__0));
  FDRE \write_data_reg[25] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[25]),
        .Q(\write_data_reg_n_0_[25] ),
        .R(p_0_in__0));
  FDRE \write_data_reg[26] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[26]),
        .Q(\write_data_reg_n_0_[26] ),
        .R(p_0_in__0));
  FDRE \write_data_reg[27] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[27]),
        .Q(\write_data_reg_n_0_[27] ),
        .R(p_0_in__0));
  FDRE \write_data_reg[28] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[28]),
        .Q(\write_data_reg_n_0_[28] ),
        .R(p_0_in__0));
  FDRE \write_data_reg[29] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[29]),
        .Q(\write_data_reg_n_0_[29] ),
        .R(p_0_in__0));
  FDRE \write_data_reg[2] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[2]),
        .Q(\write_data_reg_n_0_[2] ),
        .R(p_0_in__0));
  FDRE \write_data_reg[30] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[30]),
        .Q(\write_data_reg_n_0_[30] ),
        .R(p_0_in__0));
  FDRE \write_data_reg[31] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[31]),
        .Q(\write_data_reg_n_0_[31] ),
        .R(p_0_in__0));
  FDRE \write_data_reg[3] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[3]),
        .Q(\write_data_reg_n_0_[3] ),
        .R(p_0_in__0));
  FDRE \write_data_reg[4] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[4]),
        .Q(\write_data_reg_n_0_[4] ),
        .R(p_0_in__0));
  FDRE \write_data_reg[5] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[5]),
        .Q(\write_data_reg_n_0_[5] ),
        .R(p_0_in__0));
  FDRE \write_data_reg[6] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[6]),
        .Q(\write_data_reg_n_0_[6] ),
        .R(p_0_in__0));
  FDRE \write_data_reg[7] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[7]),
        .Q(\write_data_reg_n_0_[7] ),
        .R(p_0_in__0));
  FDRE \write_data_reg[8] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[8]),
        .Q(p_1_in5_in),
        .R(p_0_in__0));
  FDRE \write_data_reg[9] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[9]),
        .Q(\write_data_reg_n_0_[9] ),
        .R(p_0_in__0));
  LUT3 #(
    .INIT(8'h02)) 
    \write_strobes[3]_i_1 
       (.I0(s_axi_wvalid),
        .I1(s_axi_bvalid_reg_0),
        .I2(data_pending_reg_n_0),
        .O(write_data0));
  FDRE \write_strobes_reg[0] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wstrb[0]),
        .Q(p_7_out),
        .R(p_0_in__0));
  FDRE \write_strobes_reg[1] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wstrb[1]),
        .Q(p_5_out),
        .R(p_0_in__0));
  FDRE \write_strobes_reg[2] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wstrb[2]),
        .Q(p_0_in0),
        .R(p_0_in__0));
  FDRE \write_strobes_reg[3] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wstrb[3]),
        .Q(\write_strobes_reg_n_0_[3] ),
        .R(p_0_in__0));
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
