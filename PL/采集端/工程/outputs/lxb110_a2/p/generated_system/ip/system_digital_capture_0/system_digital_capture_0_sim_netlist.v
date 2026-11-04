// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
// Date        : Thu Oct 22 00:38:11 2026
// Host        : xiaojun running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/33525/FDW_NEXT/outputs/lxb110_a2/p/generated_system/ip/system_digital_capture_0/system_digital_capture_0_sim_netlist.v
// Design      : system_digital_capture_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "system_digital_capture_0,fdw_digital_axi,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "fdw_digital_axi,Vivado 2025.1" *) 
(* NotValidForBitStream *)
module system_digital_capture_0
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
    sample_in,
    trigger_in,
    invalidate_in,
    capture_active);
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
  input [1:0]sample_in;
  input trigger_in;
  input invalidate_in;
  output capture_active;

  wire \<const0> ;
  wire capture_active;
  wire invalidate_in;
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
  wire [1:0]sample_in;
  wire trigger_in;

  assign s_axi_bresp[1] = \^s_axi_bresp [1];
  assign s_axi_bresp[0] = \<const0> ;
  assign s_axi_rresp[1] = \^s_axi_rresp [1];
  assign s_axi_rresp[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  system_digital_capture_0_fdw_digital_axi inst
       (.capture_active(capture_active),
        .invalidate_in(invalidate_in),
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
        .s_axi_wvalid(s_axi_wvalid),
        .sample_in(sample_in),
        .trigger_in(trigger_in));
endmodule

(* ORIG_REF_NAME = "fdw_digital_axi" *) 
module system_digital_capture_0_fdw_digital_axi
   (s_axi_rvalid_reg_0,
    s_axi_rdata,
    s_axi_rresp,
    capture_active,
    s_axi_wready,
    s_axi_bvalid_reg_0,
    s_axi_awready,
    s_axi_arready,
    s_axi_bresp,
    s_axi_araddr,
    invalidate_in,
    s_axi_aresetn,
    trigger_in,
    s_axi_aclk,
    sample_in,
    s_axi_awaddr,
    s_axi_wstrb,
    s_axi_wdata,
    s_axi_arvalid,
    s_axi_rready,
    s_axi_awvalid,
    s_axi_wvalid,
    s_axi_bready);
  output s_axi_rvalid_reg_0;
  output [31:0]s_axi_rdata;
  output [0:0]s_axi_rresp;
  output capture_active;
  output s_axi_wready;
  output s_axi_bvalid_reg_0;
  output s_axi_awready;
  output s_axi_arready;
  output [0:0]s_axi_bresp;
  input [11:0]s_axi_araddr;
  input invalidate_in;
  input s_axi_aresetn;
  input trigger_in;
  input s_axi_aclk;
  input [1:0]sample_in;
  input [11:0]s_axi_awaddr;
  input [3:0]s_axi_wstrb;
  input [31:0]s_axi_wdata;
  input s_axi_arvalid;
  input s_axi_rready;
  input s_axi_awvalid;
  input s_axi_wvalid;
  input s_axi_bready;

  wire address_pending;
  wire address_pending0;
  wire address_pending_i_1_n_0;
  wire [31:0]arm_count;
  wire \arm_interval[31]_i_10_n_0 ;
  wire \arm_interval[31]_i_11_n_0 ;
  wire \arm_interval[31]_i_12_n_0 ;
  wire \arm_interval[31]_i_13_n_0 ;
  wire \arm_interval[31]_i_14_n_0 ;
  wire \arm_interval[31]_i_15_n_0 ;
  wire \arm_interval[31]_i_16_n_0 ;
  wire \arm_interval[31]_i_17_n_0 ;
  wire \arm_interval[31]_i_18_n_0 ;
  wire \arm_interval[31]_i_19_n_0 ;
  wire \arm_interval[31]_i_20_n_0 ;
  wire \arm_interval[31]_i_21_n_0 ;
  wire \arm_interval[31]_i_22_n_0 ;
  wire \arm_interval[31]_i_23_n_0 ;
  wire \arm_interval[31]_i_24_n_0 ;
  wire \arm_interval[31]_i_25_n_0 ;
  wire \arm_interval[31]_i_26_n_0 ;
  wire \arm_interval[31]_i_27_n_0 ;
  wire \arm_interval[31]_i_28_n_0 ;
  wire \arm_interval[31]_i_29_n_0 ;
  wire \arm_interval[31]_i_2_n_0 ;
  wire \arm_interval[31]_i_30_n_0 ;
  wire \arm_interval[31]_i_31_n_0 ;
  wire \arm_interval[31]_i_3_n_0 ;
  wire \arm_interval[31]_i_5_n_0 ;
  wire \arm_interval[31]_i_6_n_0 ;
  wire \arm_interval[31]_i_7_n_0 ;
  wire \arm_interval[31]_i_8_n_0 ;
  wire \arm_interval[31]_i_9_n_0 ;
  wire \arm_interval_reg_n_0_[0] ;
  wire \arm_interval_reg_n_0_[10] ;
  wire \arm_interval_reg_n_0_[11] ;
  wire \arm_interval_reg_n_0_[12] ;
  wire \arm_interval_reg_n_0_[13] ;
  wire \arm_interval_reg_n_0_[14] ;
  wire \arm_interval_reg_n_0_[15] ;
  wire \arm_interval_reg_n_0_[16] ;
  wire \arm_interval_reg_n_0_[17] ;
  wire \arm_interval_reg_n_0_[18] ;
  wire \arm_interval_reg_n_0_[19] ;
  wire \arm_interval_reg_n_0_[1] ;
  wire \arm_interval_reg_n_0_[20] ;
  wire \arm_interval_reg_n_0_[21] ;
  wire \arm_interval_reg_n_0_[22] ;
  wire \arm_interval_reg_n_0_[23] ;
  wire \arm_interval_reg_n_0_[24] ;
  wire \arm_interval_reg_n_0_[25] ;
  wire \arm_interval_reg_n_0_[26] ;
  wire \arm_interval_reg_n_0_[27] ;
  wire \arm_interval_reg_n_0_[28] ;
  wire \arm_interval_reg_n_0_[29] ;
  wire \arm_interval_reg_n_0_[2] ;
  wire \arm_interval_reg_n_0_[30] ;
  wire \arm_interval_reg_n_0_[31] ;
  wire \arm_interval_reg_n_0_[3] ;
  wire \arm_interval_reg_n_0_[4] ;
  wire \arm_interval_reg_n_0_[5] ;
  wire \arm_interval_reg_n_0_[6] ;
  wire \arm_interval_reg_n_0_[7] ;
  wire \arm_interval_reg_n_0_[8] ;
  wire \arm_interval_reg_n_0_[9] ;
  wire arm_valid7_out;
  wire arm_valid_i_2_n_0;
  wire arm_valid_i_3_n_0;
  wire arm_valid_i_4_n_0;
  wire arm_valid_reg_n_0;
  wire arm_wait_reg_n_0;
  wire cancel_pulse_i_2_n_0;
  wire cancel_pulse_reg_n_0;
  wire cancel_sticky;
  wire cancel_sticky_i_1_n_0;
  wire cancelled;
  wire capture_active;
  wire capture_n_10;
  wire capture_n_11;
  wire capture_n_12;
  wire capture_n_14;
  wire capture_n_15;
  wire capture_n_17;
  wire capture_n_18;
  wire capture_n_20;
  wire capture_n_22;
  wire capture_n_23;
  wire capture_n_24;
  wire capture_n_25;
  wire capture_n_28;
  wire capture_n_29;
  wire capture_n_32;
  wire capture_n_33;
  wire capture_n_36;
  wire capture_n_38;
  wire capture_n_4;
  wire capture_n_41;
  wire capture_n_43;
  wire capture_n_44;
  wire capture_n_45;
  wire capture_n_46;
  wire capture_n_47;
  wire capture_n_6;
  wire capture_n_7;
  wire capture_n_8;
  wire cfg_error;
  wire data00;
  wire data_pending_i_1_n_0;
  wire data_pending_reg_n_0;
  wire error_sticky;
  wire error_sticky_i_1_n_0;
  wire invalidate_in;
  wire [31:10]memory_index;
  wire memory_index_1;
  wire \memory_index_reg_n_0_[0] ;
  wire \memory_index_reg_n_0_[1] ;
  wire \memory_index_reg_n_0_[2] ;
  wire \memory_index_reg_n_0_[3] ;
  wire \memory_index_reg_n_0_[4] ;
  wire \memory_index_reg_n_0_[5] ;
  wire \memory_index_reg_n_0_[6] ;
  wire \memory_index_reg_n_0_[7] ;
  wire \memory_index_reg_n_0_[8] ;
  wire \memory_index_reg_n_0_[9] ;
  wire memory_pending_reg_n_0;
  wire memory_request;
  wire p_0_in0;
  wire [1:1]p_0_out;
  wire [30:0]p_2_in;
  wire [31:0]read_index;
  wire \read_index[15]_i_1_n_0 ;
  wire \read_index[23]_i_1_n_0 ;
  wire \read_index[31]_i_1_n_0 ;
  wire \read_index[31]_i_2_n_0 ;
  wire \read_index[7]_i_1_n_0 ;
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
  wire \s_axi_bresp[1]_i_10_n_0 ;
  wire \s_axi_bresp[1]_i_11_n_0 ;
  wire \s_axi_bresp[1]_i_13_n_0 ;
  wire \s_axi_bresp[1]_i_1_n_0 ;
  wire \s_axi_bresp[1]_i_4_n_0 ;
  wire \s_axi_bresp[1]_i_6_n_0 ;
  wire \s_axi_bresp[1]_i_7_n_0 ;
  wire \s_axi_bresp[1]_i_9_n_0 ;
  wire s_axi_bvalid_i_1_n_0;
  wire s_axi_bvalid_reg_0;
  wire [31:0]s_axi_rdata;
  wire \s_axi_rdata[10]_i_3_n_0 ;
  wire \s_axi_rdata[1]_i_2_n_0 ;
  wire \s_axi_rdata[1]_i_5_n_0 ;
  wire \s_axi_rdata[31]_i_11_n_0 ;
  wire \s_axi_rdata[31]_i_1_n_0 ;
  wire \s_axi_rdata[31]_i_4_n_0 ;
  wire \s_axi_rdata[31]_i_6_n_0 ;
  wire \s_axi_rdata[31]_i_7_n_0 ;
  wire \s_axi_rdata[31]_i_8_n_0 ;
  wire \s_axi_rdata[5]_i_3_n_0 ;
  wire s_axi_rready;
  wire [0:0]s_axi_rresp;
  wire \s_axi_rresp[1]_i_1_n_0 ;
  wire s_axi_rvalid0;
  wire s_axi_rvalid_i_1_n_0;
  wire s_axi_rvalid_reg_0;
  wire [31:0]s_axi_wdata;
  wire s_axi_wready;
  wire [3:0]s_axi_wstrb;
  wire s_axi_wvalid;
  wire [1:0]sample_in;
  wire [31:0]shadow_count;
  wire \shadow_count[15]_i_1_n_0 ;
  wire \shadow_count[23]_i_1_n_0 ;
  wire \shadow_count[31]_i_1_n_0 ;
  wire \shadow_count[31]_i_2_n_0 ;
  wire \shadow_count[7]_i_1_n_0 ;
  wire [31:0]shadow_interval;
  wire \shadow_interval[15]_i_1_n_0 ;
  wire \shadow_interval[23]_i_1_n_0 ;
  wire \shadow_interval[31]_i_1_n_0 ;
  wire \shadow_interval[31]_i_2_n_0 ;
  wire \shadow_interval[31]_i_3_n_0 ;
  wire \shadow_interval[7]_i_1_n_0 ;
  wire shadow_wait;
  wire shadow_wait_i_1_n_0;
  wire shadow_wait_i_2_n_0;
  wire shadow_wait_i_3_n_0;
  wire shadow_wait_i_4_n_0;
  wire shadow_wait_i_5_n_0;
  wire shadow_wait_i_6_n_0;
  wire shadow_wait_i_7_n_0;
  wire soft_trigger_reg_n_0;
  wire trigger_in;
  wire trigger_seen;
  wire trigger_sticky;
  wire trigger_sticky_0;
  wire trigger_sticky_i_1_n_0;
  wire write_address0;
  wire \write_address_reg_n_0_[0] ;
  wire \write_address_reg_n_0_[10] ;
  wire \write_address_reg_n_0_[11] ;
  wire \write_address_reg_n_0_[1] ;
  wire \write_address_reg_n_0_[2] ;
  wire \write_address_reg_n_0_[3] ;
  wire \write_address_reg_n_0_[4] ;
  wire \write_address_reg_n_0_[5] ;
  wire \write_address_reg_n_0_[7] ;
  wire \write_address_reg_n_0_[8] ;
  wire \write_address_reg_n_0_[9] ;
  wire [31:0]write_data;
  wire write_data0;
  wire \write_strobes_reg_n_0_[0] ;
  wire \write_strobes_reg_n_0_[2] ;
  wire \write_strobes_reg_n_0_[3] ;

  (* SOFT_HLUTNM = "soft_lutpair16" *) 
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
  FDRE \arm_count_reg[0] 
       (.C(s_axi_aclk),
        .CE(arm_valid7_out),
        .D(shadow_count[0]),
        .Q(arm_count[0]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \arm_count_reg[10] 
       (.C(s_axi_aclk),
        .CE(arm_valid7_out),
        .D(shadow_count[10]),
        .Q(arm_count[10]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \arm_count_reg[11] 
       (.C(s_axi_aclk),
        .CE(arm_valid7_out),
        .D(shadow_count[11]),
        .Q(arm_count[11]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \arm_count_reg[12] 
       (.C(s_axi_aclk),
        .CE(arm_valid7_out),
        .D(shadow_count[12]),
        .Q(arm_count[12]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \arm_count_reg[13] 
       (.C(s_axi_aclk),
        .CE(arm_valid7_out),
        .D(shadow_count[13]),
        .Q(arm_count[13]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \arm_count_reg[14] 
       (.C(s_axi_aclk),
        .CE(arm_valid7_out),
        .D(shadow_count[14]),
        .Q(arm_count[14]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \arm_count_reg[15] 
       (.C(s_axi_aclk),
        .CE(arm_valid7_out),
        .D(shadow_count[15]),
        .Q(arm_count[15]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \arm_count_reg[16] 
       (.C(s_axi_aclk),
        .CE(arm_valid7_out),
        .D(shadow_count[16]),
        .Q(arm_count[16]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \arm_count_reg[17] 
       (.C(s_axi_aclk),
        .CE(arm_valid7_out),
        .D(shadow_count[17]),
        .Q(arm_count[17]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \arm_count_reg[18] 
       (.C(s_axi_aclk),
        .CE(arm_valid7_out),
        .D(shadow_count[18]),
        .Q(arm_count[18]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \arm_count_reg[19] 
       (.C(s_axi_aclk),
        .CE(arm_valid7_out),
        .D(shadow_count[19]),
        .Q(arm_count[19]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \arm_count_reg[1] 
       (.C(s_axi_aclk),
        .CE(arm_valid7_out),
        .D(shadow_count[1]),
        .Q(arm_count[1]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \arm_count_reg[20] 
       (.C(s_axi_aclk),
        .CE(arm_valid7_out),
        .D(shadow_count[20]),
        .Q(arm_count[20]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \arm_count_reg[21] 
       (.C(s_axi_aclk),
        .CE(arm_valid7_out),
        .D(shadow_count[21]),
        .Q(arm_count[21]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \arm_count_reg[22] 
       (.C(s_axi_aclk),
        .CE(arm_valid7_out),
        .D(shadow_count[22]),
        .Q(arm_count[22]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \arm_count_reg[23] 
       (.C(s_axi_aclk),
        .CE(arm_valid7_out),
        .D(shadow_count[23]),
        .Q(arm_count[23]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \arm_count_reg[24] 
       (.C(s_axi_aclk),
        .CE(arm_valid7_out),
        .D(shadow_count[24]),
        .Q(arm_count[24]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \arm_count_reg[25] 
       (.C(s_axi_aclk),
        .CE(arm_valid7_out),
        .D(shadow_count[25]),
        .Q(arm_count[25]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \arm_count_reg[26] 
       (.C(s_axi_aclk),
        .CE(arm_valid7_out),
        .D(shadow_count[26]),
        .Q(arm_count[26]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \arm_count_reg[27] 
       (.C(s_axi_aclk),
        .CE(arm_valid7_out),
        .D(shadow_count[27]),
        .Q(arm_count[27]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \arm_count_reg[28] 
       (.C(s_axi_aclk),
        .CE(arm_valid7_out),
        .D(shadow_count[28]),
        .Q(arm_count[28]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \arm_count_reg[29] 
       (.C(s_axi_aclk),
        .CE(arm_valid7_out),
        .D(shadow_count[29]),
        .Q(arm_count[29]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \arm_count_reg[2] 
       (.C(s_axi_aclk),
        .CE(arm_valid7_out),
        .D(shadow_count[2]),
        .Q(arm_count[2]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \arm_count_reg[30] 
       (.C(s_axi_aclk),
        .CE(arm_valid7_out),
        .D(shadow_count[30]),
        .Q(arm_count[30]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \arm_count_reg[31] 
       (.C(s_axi_aclk),
        .CE(arm_valid7_out),
        .D(shadow_count[31]),
        .Q(arm_count[31]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \arm_count_reg[3] 
       (.C(s_axi_aclk),
        .CE(arm_valid7_out),
        .D(shadow_count[3]),
        .Q(arm_count[3]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \arm_count_reg[4] 
       (.C(s_axi_aclk),
        .CE(arm_valid7_out),
        .D(shadow_count[4]),
        .Q(arm_count[4]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \arm_count_reg[5] 
       (.C(s_axi_aclk),
        .CE(arm_valid7_out),
        .D(shadow_count[5]),
        .Q(arm_count[5]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \arm_count_reg[6] 
       (.C(s_axi_aclk),
        .CE(arm_valid7_out),
        .D(shadow_count[6]),
        .Q(arm_count[6]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \arm_count_reg[7] 
       (.C(s_axi_aclk),
        .CE(arm_valid7_out),
        .D(shadow_count[7]),
        .Q(arm_count[7]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \arm_count_reg[8] 
       (.C(s_axi_aclk),
        .CE(arm_valid7_out),
        .D(shadow_count[8]),
        .Q(arm_count[8]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \arm_count_reg[9] 
       (.C(s_axi_aclk),
        .CE(arm_valid7_out),
        .D(shadow_count[9]),
        .Q(arm_count[9]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'hFFC0EAC0)) 
    \arm_interval[31]_i_10 
       (.I0(write_data[9]),
        .I1(\write_strobes_reg_n_0_[2] ),
        .I2(write_data[19]),
        .I3(data00),
        .I4(write_data[11]),
        .O(\arm_interval[31]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFE0000)) 
    \arm_interval[31]_i_11 
       (.I0(write_data[14]),
        .I1(write_data[13]),
        .I2(write_data[15]),
        .I3(write_data[10]),
        .I4(data00),
        .I5(\arm_interval[31]_i_26_n_0 ),
        .O(\arm_interval[31]_i_11_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \arm_interval[31]_i_12 
       (.I0(shadow_interval[1]),
        .I1(shadow_interval[2]),
        .I2(shadow_interval[0]),
        .I3(shadow_interval[3]),
        .I4(\arm_interval[31]_i_27_n_0 ),
        .O(\arm_interval[31]_i_12_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \arm_interval[31]_i_13 
       (.I0(shadow_interval[21]),
        .I1(shadow_interval[22]),
        .I2(shadow_interval[20]),
        .I3(shadow_interval[23]),
        .I4(\arm_interval[31]_i_28_n_0 ),
        .O(\arm_interval[31]_i_13_n_0 ));
  LUT5 #(
    .INIT(32'h00000001)) 
    \arm_interval[31]_i_14 
       (.I0(shadow_interval[25]),
        .I1(shadow_interval[26]),
        .I2(shadow_interval[24]),
        .I3(shadow_interval[27]),
        .I4(\arm_interval[31]_i_29_n_0 ),
        .O(\arm_interval[31]_i_14_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \arm_interval[31]_i_15 
       (.I0(shadow_interval[13]),
        .I1(shadow_interval[14]),
        .I2(shadow_interval[12]),
        .I3(shadow_interval[15]),
        .I4(\arm_interval[31]_i_30_n_0 ),
        .O(\arm_interval[31]_i_15_n_0 ));
  LUT5 #(
    .INIT(32'h00000001)) 
    \arm_interval[31]_i_16 
       (.I0(shadow_count[4]),
        .I1(shadow_count[6]),
        .I2(shadow_count[1]),
        .I3(shadow_count[2]),
        .I4(\arm_interval[31]_i_31_n_0 ),
        .O(\arm_interval[31]_i_16_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \arm_interval[31]_i_17 
       (.I0(\s_axi_bresp[1]_i_13_n_0 ),
        .I1(arm_valid_reg_n_0),
        .I2(shadow_count[20]),
        .I3(invalidate_in),
        .I4(\arm_interval[31]_i_18_n_0 ),
        .O(\arm_interval[31]_i_17_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \arm_interval[31]_i_18 
       (.I0(shadow_count[24]),
        .I1(shadow_count[12]),
        .I2(shadow_count[19]),
        .I3(shadow_count[15]),
        .O(\arm_interval[31]_i_18_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \arm_interval[31]_i_19 
       (.I0(shadow_count[23]),
        .I1(shadow_count[11]),
        .I2(shadow_count[10]),
        .I3(shadow_count[20]),
        .I4(shadow_count[17]),
        .I5(shadow_count[18]),
        .O(\arm_interval[31]_i_19_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFBA)) 
    \arm_interval[31]_i_2 
       (.I0(\arm_interval[31]_i_8_n_0 ),
        .I1(\arm_interval[31]_i_9_n_0 ),
        .I2(write_data[2]),
        .I3(\arm_interval[31]_i_10_n_0 ),
        .I4(\arm_interval[31]_i_11_n_0 ),
        .O(\arm_interval[31]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hA8)) 
    \arm_interval[31]_i_20 
       (.I0(\write_strobes_reg_n_0_[2] ),
        .I1(write_data[23]),
        .I2(write_data[22]),
        .O(\arm_interval[31]_i_20_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \arm_interval[31]_i_21 
       (.I0(write_data[7]),
        .I1(\write_strobes_reg_n_0_[0] ),
        .I2(write_data[12]),
        .I3(data00),
        .O(\arm_interval[31]_i_21_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAAAA8)) 
    \arm_interval[31]_i_22 
       (.I0(\write_strobes_reg_n_0_[3] ),
        .I1(write_data[24]),
        .I2(write_data[30]),
        .I3(write_data[29]),
        .I4(write_data[31]),
        .O(\arm_interval[31]_i_22_n_0 ));
  LUT4 #(
    .INIT(16'hAAA8)) 
    \arm_interval[31]_i_23 
       (.I0(\write_strobes_reg_n_0_[2] ),
        .I1(write_data[17]),
        .I2(write_data[18]),
        .I3(write_data[21]),
        .O(\arm_interval[31]_i_23_n_0 ));
  LUT4 #(
    .INIT(16'hAAA8)) 
    \arm_interval[31]_i_24 
       (.I0(\write_strobes_reg_n_0_[3] ),
        .I1(write_data[25]),
        .I2(write_data[26]),
        .I3(write_data[28]),
        .O(\arm_interval[31]_i_24_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAAAA8)) 
    \arm_interval[31]_i_25 
       (.I0(\write_strobes_reg_n_0_[0] ),
        .I1(write_data[3]),
        .I2(write_data[6]),
        .I3(write_data[4]),
        .I4(write_data[5]),
        .O(\arm_interval[31]_i_25_n_0 ));
  LUT5 #(
    .INIT(32'hFFF88888)) 
    \arm_interval[31]_i_26 
       (.I0(write_data[27]),
        .I1(\write_strobes_reg_n_0_[3] ),
        .I2(write_data[16]),
        .I3(write_data[20]),
        .I4(\write_strobes_reg_n_0_[2] ),
        .O(\arm_interval[31]_i_26_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \arm_interval[31]_i_27 
       (.I0(shadow_interval[19]),
        .I1(shadow_interval[16]),
        .I2(shadow_interval[18]),
        .I3(shadow_interval[17]),
        .O(\arm_interval[31]_i_27_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \arm_interval[31]_i_28 
       (.I0(shadow_interval[7]),
        .I1(shadow_interval[4]),
        .I2(shadow_interval[6]),
        .I3(shadow_interval[5]),
        .O(\arm_interval[31]_i_28_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \arm_interval[31]_i_29 
       (.I0(shadow_interval[11]),
        .I1(shadow_interval[8]),
        .I2(shadow_interval[10]),
        .I3(shadow_interval[9]),
        .O(\arm_interval[31]_i_29_n_0 ));
  LUT6 #(
    .INIT(64'h0010FFFF00100010)) 
    \arm_interval[31]_i_3 
       (.I0(\arm_interval[31]_i_12_n_0 ),
        .I1(\arm_interval[31]_i_13_n_0 ),
        .I2(\arm_interval[31]_i_14_n_0 ),
        .I3(\arm_interval[31]_i_15_n_0 ),
        .I4(\arm_interval[31]_i_16_n_0 ),
        .I5(shadow_count[10]),
        .O(\arm_interval[31]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \arm_interval[31]_i_30 
       (.I0(shadow_interval[30]),
        .I1(shadow_interval[28]),
        .I2(shadow_interval[31]),
        .I3(shadow_interval[29]),
        .O(\arm_interval[31]_i_30_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \arm_interval[31]_i_31 
       (.I0(shadow_count[9]),
        .I1(shadow_count[0]),
        .I2(shadow_count[5]),
        .I3(shadow_count[7]),
        .I4(shadow_count[3]),
        .I5(shadow_count[8]),
        .O(\arm_interval[31]_i_31_n_0 ));
  LUT4 #(
    .INIT(16'hFEFF)) 
    \arm_interval[31]_i_5 
       (.I0(\s_axi_bresp[1]_i_7_n_0 ),
        .I1(\arm_interval[31]_i_18_n_0 ),
        .I2(\arm_interval[31]_i_19_n_0 ),
        .I3(\arm_interval[31]_i_16_n_0 ),
        .O(\arm_interval[31]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'hFFBF)) 
    \arm_interval[31]_i_6 
       (.I0(cancel_pulse_i_2_n_0),
        .I1(data_pending_reg_n_0),
        .I2(address_pending),
        .I3(s_axi_bvalid_reg_0),
        .O(\arm_interval[31]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \arm_interval[31]_i_7 
       (.I0(\write_strobes_reg_n_0_[0] ),
        .I1(write_data[0]),
        .O(\arm_interval[31]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \arm_interval[31]_i_8 
       (.I0(\arm_interval[31]_i_20_n_0 ),
        .I1(\arm_interval[31]_i_21_n_0 ),
        .I2(\arm_interval[31]_i_22_n_0 ),
        .I3(\arm_interval[31]_i_23_n_0 ),
        .I4(\arm_interval[31]_i_24_n_0 ),
        .I5(\arm_interval[31]_i_25_n_0 ),
        .O(\arm_interval[31]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'h1F)) 
    \arm_interval[31]_i_9 
       (.I0(write_data[0]),
        .I1(write_data[1]),
        .I2(\write_strobes_reg_n_0_[0] ),
        .O(\arm_interval[31]_i_9_n_0 ));
  FDRE \arm_interval_reg[0] 
       (.C(s_axi_aclk),
        .CE(arm_valid7_out),
        .D(shadow_interval[0]),
        .Q(\arm_interval_reg_n_0_[0] ),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \arm_interval_reg[10] 
       (.C(s_axi_aclk),
        .CE(arm_valid7_out),
        .D(shadow_interval[10]),
        .Q(\arm_interval_reg_n_0_[10] ),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \arm_interval_reg[11] 
       (.C(s_axi_aclk),
        .CE(arm_valid7_out),
        .D(shadow_interval[11]),
        .Q(\arm_interval_reg_n_0_[11] ),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \arm_interval_reg[12] 
       (.C(s_axi_aclk),
        .CE(arm_valid7_out),
        .D(shadow_interval[12]),
        .Q(\arm_interval_reg_n_0_[12] ),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \arm_interval_reg[13] 
       (.C(s_axi_aclk),
        .CE(arm_valid7_out),
        .D(shadow_interval[13]),
        .Q(\arm_interval_reg_n_0_[13] ),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \arm_interval_reg[14] 
       (.C(s_axi_aclk),
        .CE(arm_valid7_out),
        .D(shadow_interval[14]),
        .Q(\arm_interval_reg_n_0_[14] ),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \arm_interval_reg[15] 
       (.C(s_axi_aclk),
        .CE(arm_valid7_out),
        .D(shadow_interval[15]),
        .Q(\arm_interval_reg_n_0_[15] ),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \arm_interval_reg[16] 
       (.C(s_axi_aclk),
        .CE(arm_valid7_out),
        .D(shadow_interval[16]),
        .Q(\arm_interval_reg_n_0_[16] ),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \arm_interval_reg[17] 
       (.C(s_axi_aclk),
        .CE(arm_valid7_out),
        .D(shadow_interval[17]),
        .Q(\arm_interval_reg_n_0_[17] ),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \arm_interval_reg[18] 
       (.C(s_axi_aclk),
        .CE(arm_valid7_out),
        .D(shadow_interval[18]),
        .Q(\arm_interval_reg_n_0_[18] ),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \arm_interval_reg[19] 
       (.C(s_axi_aclk),
        .CE(arm_valid7_out),
        .D(shadow_interval[19]),
        .Q(\arm_interval_reg_n_0_[19] ),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \arm_interval_reg[1] 
       (.C(s_axi_aclk),
        .CE(arm_valid7_out),
        .D(shadow_interval[1]),
        .Q(\arm_interval_reg_n_0_[1] ),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \arm_interval_reg[20] 
       (.C(s_axi_aclk),
        .CE(arm_valid7_out),
        .D(shadow_interval[20]),
        .Q(\arm_interval_reg_n_0_[20] ),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \arm_interval_reg[21] 
       (.C(s_axi_aclk),
        .CE(arm_valid7_out),
        .D(shadow_interval[21]),
        .Q(\arm_interval_reg_n_0_[21] ),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \arm_interval_reg[22] 
       (.C(s_axi_aclk),
        .CE(arm_valid7_out),
        .D(shadow_interval[22]),
        .Q(\arm_interval_reg_n_0_[22] ),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \arm_interval_reg[23] 
       (.C(s_axi_aclk),
        .CE(arm_valid7_out),
        .D(shadow_interval[23]),
        .Q(\arm_interval_reg_n_0_[23] ),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \arm_interval_reg[24] 
       (.C(s_axi_aclk),
        .CE(arm_valid7_out),
        .D(shadow_interval[24]),
        .Q(\arm_interval_reg_n_0_[24] ),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \arm_interval_reg[25] 
       (.C(s_axi_aclk),
        .CE(arm_valid7_out),
        .D(shadow_interval[25]),
        .Q(\arm_interval_reg_n_0_[25] ),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \arm_interval_reg[26] 
       (.C(s_axi_aclk),
        .CE(arm_valid7_out),
        .D(shadow_interval[26]),
        .Q(\arm_interval_reg_n_0_[26] ),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \arm_interval_reg[27] 
       (.C(s_axi_aclk),
        .CE(arm_valid7_out),
        .D(shadow_interval[27]),
        .Q(\arm_interval_reg_n_0_[27] ),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \arm_interval_reg[28] 
       (.C(s_axi_aclk),
        .CE(arm_valid7_out),
        .D(shadow_interval[28]),
        .Q(\arm_interval_reg_n_0_[28] ),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \arm_interval_reg[29] 
       (.C(s_axi_aclk),
        .CE(arm_valid7_out),
        .D(shadow_interval[29]),
        .Q(\arm_interval_reg_n_0_[29] ),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \arm_interval_reg[2] 
       (.C(s_axi_aclk),
        .CE(arm_valid7_out),
        .D(shadow_interval[2]),
        .Q(\arm_interval_reg_n_0_[2] ),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \arm_interval_reg[30] 
       (.C(s_axi_aclk),
        .CE(arm_valid7_out),
        .D(shadow_interval[30]),
        .Q(\arm_interval_reg_n_0_[30] ),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \arm_interval_reg[31] 
       (.C(s_axi_aclk),
        .CE(arm_valid7_out),
        .D(shadow_interval[31]),
        .Q(\arm_interval_reg_n_0_[31] ),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \arm_interval_reg[3] 
       (.C(s_axi_aclk),
        .CE(arm_valid7_out),
        .D(shadow_interval[3]),
        .Q(\arm_interval_reg_n_0_[3] ),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \arm_interval_reg[4] 
       (.C(s_axi_aclk),
        .CE(arm_valid7_out),
        .D(shadow_interval[4]),
        .Q(\arm_interval_reg_n_0_[4] ),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \arm_interval_reg[5] 
       (.C(s_axi_aclk),
        .CE(arm_valid7_out),
        .D(shadow_interval[5]),
        .Q(\arm_interval_reg_n_0_[5] ),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \arm_interval_reg[6] 
       (.C(s_axi_aclk),
        .CE(arm_valid7_out),
        .D(shadow_interval[6]),
        .Q(\arm_interval_reg_n_0_[6] ),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \arm_interval_reg[7] 
       (.C(s_axi_aclk),
        .CE(arm_valid7_out),
        .D(shadow_interval[7]),
        .Q(\arm_interval_reg_n_0_[7] ),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \arm_interval_reg[8] 
       (.C(s_axi_aclk),
        .CE(arm_valid7_out),
        .D(shadow_interval[8]),
        .Q(\arm_interval_reg_n_0_[8] ),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \arm_interval_reg[9] 
       (.C(s_axi_aclk),
        .CE(arm_valid7_out),
        .D(shadow_interval[9]),
        .Q(\arm_interval_reg_n_0_[9] ),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'h10110000)) 
    arm_valid_i_2
       (.I0(shadow_wait_i_4_n_0),
        .I1(\write_address_reg_n_0_[4] ),
        .I2(\write_address_reg_n_0_[1] ),
        .I3(\write_address_reg_n_0_[0] ),
        .I4(address_pending0),
        .O(arm_valid_i_2_n_0));
  LUT6 #(
    .INIT(64'h00000000000000A8)) 
    arm_valid_i_3
       (.I0(\write_strobes_reg_n_0_[0] ),
        .I1(write_data[1]),
        .I2(write_data[0]),
        .I3(arm_valid_i_4_n_0),
        .I4(\write_address_reg_n_0_[3] ),
        .I5(\write_address_reg_n_0_[2] ),
        .O(arm_valid_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    arm_valid_i_4
       (.I0(\write_address_reg_n_0_[5] ),
        .I1(\write_address_reg_n_0_[1] ),
        .I2(\write_address_reg_n_0_[4] ),
        .O(arm_valid_i_4_n_0));
  FDRE arm_valid_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(capture_n_44),
        .Q(arm_valid_reg_n_0),
        .R(trigger_sticky_0));
  FDRE arm_wait_reg
       (.C(s_axi_aclk),
        .CE(arm_valid7_out),
        .D(shadow_wait),
        .Q(arm_wait_reg_n_0),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    cancel_pulse_i_2
       (.I0(shadow_wait_i_4_n_0),
        .I1(\write_address_reg_n_0_[5] ),
        .I2(\s_axi_bresp[1]_i_9_n_0 ),
        .I3(\write_address_reg_n_0_[3] ),
        .I4(\write_address_reg_n_0_[2] ),
        .O(cancel_pulse_i_2_n_0));
  FDRE cancel_pulse_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(capture_n_45),
        .Q(cancel_pulse_reg_n_0),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFFBFFFFFFF0000)) 
    cancel_sticky_i_1
       (.I0(\arm_interval[31]_i_6_n_0 ),
        .I1(write_data[8]),
        .I2(data00),
        .I3(capture_n_38),
        .I4(cancelled),
        .I5(cancel_sticky),
        .O(cancel_sticky_i_1_n_0));
  FDRE cancel_sticky_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(cancel_sticky_i_1_n_0),
        .Q(cancel_sticky),
        .R(trigger_sticky_0));
  system_digital_capture_0_fdw_digital_capture capture
       (.D({capture_n_4,p_2_in[30],capture_n_6,capture_n_7,capture_n_8,p_2_in[26],capture_n_10,capture_n_11,capture_n_12,p_2_in[22],capture_n_14,capture_n_15,p_2_in[19],capture_n_17,capture_n_18,p_2_in[16],capture_n_20,p_2_in[14],capture_n_22,capture_n_23,capture_n_24,capture_n_25,p_2_in[9:8],capture_n_28,capture_n_29,p_2_in[5:4],capture_n_32,capture_n_33,p_2_in[1:0]}),
        .E(arm_valid7_out),
        .Q({shadow_interval[31:11],shadow_interval[9:2],shadow_interval[0]}),
        .\active_interval_ticks_reg[31]_0 ({\arm_interval_reg_n_0_[31] ,\arm_interval_reg_n_0_[30] ,\arm_interval_reg_n_0_[29] ,\arm_interval_reg_n_0_[28] ,\arm_interval_reg_n_0_[27] ,\arm_interval_reg_n_0_[26] ,\arm_interval_reg_n_0_[25] ,\arm_interval_reg_n_0_[24] ,\arm_interval_reg_n_0_[23] ,\arm_interval_reg_n_0_[22] ,\arm_interval_reg_n_0_[21] ,\arm_interval_reg_n_0_[20] ,\arm_interval_reg_n_0_[19] ,\arm_interval_reg_n_0_[18] ,\arm_interval_reg_n_0_[17] ,\arm_interval_reg_n_0_[16] ,\arm_interval_reg_n_0_[15] ,\arm_interval_reg_n_0_[14] ,\arm_interval_reg_n_0_[13] ,\arm_interval_reg_n_0_[12] ,\arm_interval_reg_n_0_[11] ,\arm_interval_reg_n_0_[10] ,\arm_interval_reg_n_0_[9] ,\arm_interval_reg_n_0_[8] ,\arm_interval_reg_n_0_[7] ,\arm_interval_reg_n_0_[6] ,\arm_interval_reg_n_0_[5] ,\arm_interval_reg_n_0_[4] ,\arm_interval_reg_n_0_[3] ,\arm_interval_reg_n_0_[2] ,\arm_interval_reg_n_0_[1] ,\arm_interval_reg_n_0_[0] }),
        .\active_sample_count_reg[31]_0 (arm_count),
        .address_pending0(address_pending0),
        .arm_valid_reg(capture_n_44),
        .arm_valid_reg_0(arm_valid_reg_n_0),
        .arm_valid_reg_1(\s_axi_bresp[1]_i_6_n_0 ),
        .arm_valid_reg_2(\s_axi_bresp[1]_i_7_n_0 ),
        .arm_valid_reg_3(arm_valid_i_2_n_0),
        .arm_valid_reg_4(arm_valid_i_3_n_0),
        .arm_wait_reg(\arm_interval[31]_i_2_n_0 ),
        .arm_wait_reg_0(\arm_interval[31]_i_3_n_0 ),
        .arm_wait_reg_1(\arm_interval[31]_i_5_n_0 ),
        .arm_wait_reg_2(\arm_interval[31]_i_6_n_0 ),
        .arm_wait_reg_3(\arm_interval[31]_i_7_n_0 ),
        .arm_wait_reg_4(\arm_interval[31]_i_17_n_0 ),
        .busy_reg_0(arm_wait_reg_n_0),
        .cancel_pulse_reg(cancel_pulse_i_2_n_0),
        .cancel_pulse_reg_0(\write_strobes_reg_n_0_[0] ),
        .cancel_sticky(cancel_sticky),
        .cancelled(cancelled),
        .capture_active(capture_active),
        .capture_active_0(s_axi_rvalid_reg_0),
        .\captured_count_reg[0]_0 (cancel_pulse_reg_n_0),
        .cfg_error(cfg_error),
        .error_sticky(error_sticky),
        .invalidate_in(invalidate_in),
        .memory_index_1(memory_index_1),
        .memory_pending_reg(capture_n_41),
        .memory_pending_reg_0(memory_pending_reg_n_0),
        .memory_request(memory_request),
        .p_0_out(p_0_out),
        .rd_error1_carry__2_0({memory_index,\memory_index_reg_n_0_[9] ,\memory_index_reg_n_0_[8] ,\memory_index_reg_n_0_[7] ,\memory_index_reg_n_0_[6] ,\memory_index_reg_n_0_[5] ,\memory_index_reg_n_0_[4] ,\memory_index_reg_n_0_[3] ,\memory_index_reg_n_0_[2] ,\memory_index_reg_n_0_[1] ,\memory_index_reg_n_0_[0] }),
        .rd_valid_reg_0(capture_n_36),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_araddr(s_axi_araddr[5:2]),
        .\s_axi_araddr[3] (s_axi_rvalid0),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_bresp(s_axi_bresp),
        .\s_axi_bresp[1]_i_3_0 (\arm_interval[31]_i_18_n_0 ),
        .\s_axi_bresp[1]_i_3_1 (\s_axi_bresp[1]_i_13_n_0 ),
        .\s_axi_bresp_reg[1] ({\write_address_reg_n_0_[3] ,\write_address_reg_n_0_[2] }),
        .\s_axi_bresp_reg[1]_0 (\s_axi_bresp[1]_i_4_n_0 ),
        .\s_axi_rdata_reg[0] (\s_axi_rdata[31]_i_8_n_0 ),
        .\s_axi_rdata_reg[0]_0 (\s_axi_rdata[31]_i_6_n_0 ),
        .\s_axi_rdata_reg[0]_1 (\s_axi_rdata[31]_i_4_n_0 ),
        .\s_axi_rdata_reg[0]_2 (\s_axi_rdata[31]_i_7_n_0 ),
        .\s_axi_rdata_reg[10] (\s_axi_rdata[10]_i_3_n_0 ),
        .\s_axi_rdata_reg[1] (\s_axi_rdata[1]_i_2_n_0 ),
        .\s_axi_rdata_reg[31] ({shadow_count[31:11],shadow_count[9:2],shadow_count[0]}),
        .\s_axi_rdata_reg[31]_0 ({read_index[31:11],read_index[9:2],read_index[0]}),
        .\s_axi_rdata_reg[4] (\s_axi_rdata[5]_i_3_n_0 ),
        .s_axi_rready(s_axi_rready),
        .s_axi_rvalid_reg(capture_n_43),
        .sample_in(sample_in),
        .sample_memory_reg_0(soft_trigger_reg_n_0),
        .\shadow_count_reg[24] (capture_n_38),
        .shadow_wait(shadow_wait),
        .soft_trigger_reg(write_data[2:1]),
        .trigger_in(trigger_in),
        .trigger_seen(trigger_seen),
        .trigger_sticky(trigger_sticky),
        .trigger_sticky_0(trigger_sticky_0),
        .\write_address_reg[3] (capture_n_47),
        .\write_data_reg[1] (capture_n_45),
        .\write_data_reg[2] (capture_n_46));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
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
  LUT6 #(
    .INIT(64'hFFFFFF7FFFFF0055)) 
    error_sticky_i_1
       (.I0(capture_n_38),
        .I1(write_data[8]),
        .I2(data00),
        .I3(\arm_interval[31]_i_6_n_0 ),
        .I4(cfg_error),
        .I5(error_sticky),
        .O(error_sticky_i_1_n_0));
  FDRE error_sticky_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(error_sticky_i_1_n_0),
        .Q(error_sticky),
        .R(trigger_sticky_0));
  LUT5 #(
    .INIT(32'h00000008)) 
    \memory_index[31]_i_1 
       (.I0(s_axi_araddr[5]),
        .I1(s_axi_araddr[4]),
        .I2(\s_axi_rdata[31]_i_8_n_0 ),
        .I3(s_axi_araddr[2]),
        .I4(s_axi_araddr[3]),
        .O(memory_index_1));
  FDRE \memory_index_reg[0] 
       (.C(s_axi_aclk),
        .CE(memory_index_1),
        .D(read_index[0]),
        .Q(\memory_index_reg_n_0_[0] ),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \memory_index_reg[10] 
       (.C(s_axi_aclk),
        .CE(memory_index_1),
        .D(read_index[10]),
        .Q(memory_index[10]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \memory_index_reg[11] 
       (.C(s_axi_aclk),
        .CE(memory_index_1),
        .D(read_index[11]),
        .Q(memory_index[11]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \memory_index_reg[12] 
       (.C(s_axi_aclk),
        .CE(memory_index_1),
        .D(read_index[12]),
        .Q(memory_index[12]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \memory_index_reg[13] 
       (.C(s_axi_aclk),
        .CE(memory_index_1),
        .D(read_index[13]),
        .Q(memory_index[13]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \memory_index_reg[14] 
       (.C(s_axi_aclk),
        .CE(memory_index_1),
        .D(read_index[14]),
        .Q(memory_index[14]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \memory_index_reg[15] 
       (.C(s_axi_aclk),
        .CE(memory_index_1),
        .D(read_index[15]),
        .Q(memory_index[15]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \memory_index_reg[16] 
       (.C(s_axi_aclk),
        .CE(memory_index_1),
        .D(read_index[16]),
        .Q(memory_index[16]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \memory_index_reg[17] 
       (.C(s_axi_aclk),
        .CE(memory_index_1),
        .D(read_index[17]),
        .Q(memory_index[17]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \memory_index_reg[18] 
       (.C(s_axi_aclk),
        .CE(memory_index_1),
        .D(read_index[18]),
        .Q(memory_index[18]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \memory_index_reg[19] 
       (.C(s_axi_aclk),
        .CE(memory_index_1),
        .D(read_index[19]),
        .Q(memory_index[19]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \memory_index_reg[1] 
       (.C(s_axi_aclk),
        .CE(memory_index_1),
        .D(read_index[1]),
        .Q(\memory_index_reg_n_0_[1] ),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \memory_index_reg[20] 
       (.C(s_axi_aclk),
        .CE(memory_index_1),
        .D(read_index[20]),
        .Q(memory_index[20]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \memory_index_reg[21] 
       (.C(s_axi_aclk),
        .CE(memory_index_1),
        .D(read_index[21]),
        .Q(memory_index[21]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \memory_index_reg[22] 
       (.C(s_axi_aclk),
        .CE(memory_index_1),
        .D(read_index[22]),
        .Q(memory_index[22]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \memory_index_reg[23] 
       (.C(s_axi_aclk),
        .CE(memory_index_1),
        .D(read_index[23]),
        .Q(memory_index[23]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \memory_index_reg[24] 
       (.C(s_axi_aclk),
        .CE(memory_index_1),
        .D(read_index[24]),
        .Q(memory_index[24]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \memory_index_reg[25] 
       (.C(s_axi_aclk),
        .CE(memory_index_1),
        .D(read_index[25]),
        .Q(memory_index[25]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \memory_index_reg[26] 
       (.C(s_axi_aclk),
        .CE(memory_index_1),
        .D(read_index[26]),
        .Q(memory_index[26]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \memory_index_reg[27] 
       (.C(s_axi_aclk),
        .CE(memory_index_1),
        .D(read_index[27]),
        .Q(memory_index[27]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \memory_index_reg[28] 
       (.C(s_axi_aclk),
        .CE(memory_index_1),
        .D(read_index[28]),
        .Q(memory_index[28]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \memory_index_reg[29] 
       (.C(s_axi_aclk),
        .CE(memory_index_1),
        .D(read_index[29]),
        .Q(memory_index[29]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \memory_index_reg[2] 
       (.C(s_axi_aclk),
        .CE(memory_index_1),
        .D(read_index[2]),
        .Q(\memory_index_reg_n_0_[2] ),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \memory_index_reg[30] 
       (.C(s_axi_aclk),
        .CE(memory_index_1),
        .D(read_index[30]),
        .Q(memory_index[30]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \memory_index_reg[31] 
       (.C(s_axi_aclk),
        .CE(memory_index_1),
        .D(read_index[31]),
        .Q(memory_index[31]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \memory_index_reg[3] 
       (.C(s_axi_aclk),
        .CE(memory_index_1),
        .D(read_index[3]),
        .Q(\memory_index_reg_n_0_[3] ),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \memory_index_reg[4] 
       (.C(s_axi_aclk),
        .CE(memory_index_1),
        .D(read_index[4]),
        .Q(\memory_index_reg_n_0_[4] ),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \memory_index_reg[5] 
       (.C(s_axi_aclk),
        .CE(memory_index_1),
        .D(read_index[5]),
        .Q(\memory_index_reg_n_0_[5] ),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \memory_index_reg[6] 
       (.C(s_axi_aclk),
        .CE(memory_index_1),
        .D(read_index[6]),
        .Q(\memory_index_reg_n_0_[6] ),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \memory_index_reg[7] 
       (.C(s_axi_aclk),
        .CE(memory_index_1),
        .D(read_index[7]),
        .Q(\memory_index_reg_n_0_[7] ),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \memory_index_reg[8] 
       (.C(s_axi_aclk),
        .CE(memory_index_1),
        .D(read_index[8]),
        .Q(\memory_index_reg_n_0_[8] ),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \memory_index_reg[9] 
       (.C(s_axi_aclk),
        .CE(memory_index_1),
        .D(read_index[9]),
        .Q(\memory_index_reg_n_0_[9] ),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE memory_pending_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(capture_n_36),
        .Q(memory_pending_reg_n_0),
        .R(1'b0));
  FDRE memory_request_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(memory_index_1),
        .Q(memory_request),
        .R(trigger_sticky_0));
  LUT6 #(
    .INIT(64'h0000008000000000)) 
    \read_index[15]_i_1 
       (.I0(\read_index[31]_i_2_n_0 ),
        .I1(data00),
        .I2(\write_address_reg_n_0_[3] ),
        .I3(\write_address_reg_n_0_[4] ),
        .I4(\write_address_reg_n_0_[1] ),
        .I5(\write_address_reg_n_0_[5] ),
        .O(\read_index[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000008000000000)) 
    \read_index[23]_i_1 
       (.I0(\read_index[31]_i_2_n_0 ),
        .I1(\write_strobes_reg_n_0_[2] ),
        .I2(\write_address_reg_n_0_[3] ),
        .I3(\write_address_reg_n_0_[4] ),
        .I4(\write_address_reg_n_0_[1] ),
        .I5(\write_address_reg_n_0_[5] ),
        .O(\read_index[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000008000000000)) 
    \read_index[31]_i_1 
       (.I0(\read_index[31]_i_2_n_0 ),
        .I1(\write_strobes_reg_n_0_[3] ),
        .I2(\write_address_reg_n_0_[3] ),
        .I3(\write_address_reg_n_0_[4] ),
        .I4(\write_address_reg_n_0_[1] ),
        .I5(\write_address_reg_n_0_[5] ),
        .O(\read_index[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'hD500)) 
    \read_index[31]_i_2 
       (.I0(\write_address_reg_n_0_[5] ),
        .I1(\write_address_reg_n_0_[3] ),
        .I2(\write_address_reg_n_0_[2] ),
        .I3(arm_valid_i_2_n_0),
        .O(\read_index[31]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000008000000000)) 
    \read_index[7]_i_1 
       (.I0(\read_index[31]_i_2_n_0 ),
        .I1(\write_strobes_reg_n_0_[0] ),
        .I2(\write_address_reg_n_0_[3] ),
        .I3(\write_address_reg_n_0_[4] ),
        .I4(\write_address_reg_n_0_[1] ),
        .I5(\write_address_reg_n_0_[5] ),
        .O(\read_index[7]_i_1_n_0 ));
  FDRE \read_index_reg[0] 
       (.C(s_axi_aclk),
        .CE(\read_index[7]_i_1_n_0 ),
        .D(write_data[0]),
        .Q(read_index[0]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \read_index_reg[10] 
       (.C(s_axi_aclk),
        .CE(\read_index[15]_i_1_n_0 ),
        .D(write_data[10]),
        .Q(read_index[10]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \read_index_reg[11] 
       (.C(s_axi_aclk),
        .CE(\read_index[15]_i_1_n_0 ),
        .D(write_data[11]),
        .Q(read_index[11]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \read_index_reg[12] 
       (.C(s_axi_aclk),
        .CE(\read_index[15]_i_1_n_0 ),
        .D(write_data[12]),
        .Q(read_index[12]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \read_index_reg[13] 
       (.C(s_axi_aclk),
        .CE(\read_index[15]_i_1_n_0 ),
        .D(write_data[13]),
        .Q(read_index[13]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \read_index_reg[14] 
       (.C(s_axi_aclk),
        .CE(\read_index[15]_i_1_n_0 ),
        .D(write_data[14]),
        .Q(read_index[14]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \read_index_reg[15] 
       (.C(s_axi_aclk),
        .CE(\read_index[15]_i_1_n_0 ),
        .D(write_data[15]),
        .Q(read_index[15]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \read_index_reg[16] 
       (.C(s_axi_aclk),
        .CE(\read_index[23]_i_1_n_0 ),
        .D(write_data[16]),
        .Q(read_index[16]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \read_index_reg[17] 
       (.C(s_axi_aclk),
        .CE(\read_index[23]_i_1_n_0 ),
        .D(write_data[17]),
        .Q(read_index[17]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \read_index_reg[18] 
       (.C(s_axi_aclk),
        .CE(\read_index[23]_i_1_n_0 ),
        .D(write_data[18]),
        .Q(read_index[18]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \read_index_reg[19] 
       (.C(s_axi_aclk),
        .CE(\read_index[23]_i_1_n_0 ),
        .D(write_data[19]),
        .Q(read_index[19]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \read_index_reg[1] 
       (.C(s_axi_aclk),
        .CE(\read_index[7]_i_1_n_0 ),
        .D(write_data[1]),
        .Q(read_index[1]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \read_index_reg[20] 
       (.C(s_axi_aclk),
        .CE(\read_index[23]_i_1_n_0 ),
        .D(write_data[20]),
        .Q(read_index[20]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \read_index_reg[21] 
       (.C(s_axi_aclk),
        .CE(\read_index[23]_i_1_n_0 ),
        .D(write_data[21]),
        .Q(read_index[21]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \read_index_reg[22] 
       (.C(s_axi_aclk),
        .CE(\read_index[23]_i_1_n_0 ),
        .D(write_data[22]),
        .Q(read_index[22]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \read_index_reg[23] 
       (.C(s_axi_aclk),
        .CE(\read_index[23]_i_1_n_0 ),
        .D(write_data[23]),
        .Q(read_index[23]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \read_index_reg[24] 
       (.C(s_axi_aclk),
        .CE(\read_index[31]_i_1_n_0 ),
        .D(write_data[24]),
        .Q(read_index[24]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \read_index_reg[25] 
       (.C(s_axi_aclk),
        .CE(\read_index[31]_i_1_n_0 ),
        .D(write_data[25]),
        .Q(read_index[25]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \read_index_reg[26] 
       (.C(s_axi_aclk),
        .CE(\read_index[31]_i_1_n_0 ),
        .D(write_data[26]),
        .Q(read_index[26]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \read_index_reg[27] 
       (.C(s_axi_aclk),
        .CE(\read_index[31]_i_1_n_0 ),
        .D(write_data[27]),
        .Q(read_index[27]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \read_index_reg[28] 
       (.C(s_axi_aclk),
        .CE(\read_index[31]_i_1_n_0 ),
        .D(write_data[28]),
        .Q(read_index[28]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \read_index_reg[29] 
       (.C(s_axi_aclk),
        .CE(\read_index[31]_i_1_n_0 ),
        .D(write_data[29]),
        .Q(read_index[29]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \read_index_reg[2] 
       (.C(s_axi_aclk),
        .CE(\read_index[7]_i_1_n_0 ),
        .D(write_data[2]),
        .Q(read_index[2]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \read_index_reg[30] 
       (.C(s_axi_aclk),
        .CE(\read_index[31]_i_1_n_0 ),
        .D(write_data[30]),
        .Q(read_index[30]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \read_index_reg[31] 
       (.C(s_axi_aclk),
        .CE(\read_index[31]_i_1_n_0 ),
        .D(write_data[31]),
        .Q(read_index[31]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \read_index_reg[3] 
       (.C(s_axi_aclk),
        .CE(\read_index[7]_i_1_n_0 ),
        .D(write_data[3]),
        .Q(read_index[3]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \read_index_reg[4] 
       (.C(s_axi_aclk),
        .CE(\read_index[7]_i_1_n_0 ),
        .D(write_data[4]),
        .Q(read_index[4]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \read_index_reg[5] 
       (.C(s_axi_aclk),
        .CE(\read_index[7]_i_1_n_0 ),
        .D(write_data[5]),
        .Q(read_index[5]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \read_index_reg[6] 
       (.C(s_axi_aclk),
        .CE(\read_index[7]_i_1_n_0 ),
        .D(write_data[6]),
        .Q(read_index[6]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \read_index_reg[7] 
       (.C(s_axi_aclk),
        .CE(\read_index[7]_i_1_n_0 ),
        .D(write_data[7]),
        .Q(read_index[7]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \read_index_reg[8] 
       (.C(s_axi_aclk),
        .CE(\read_index[15]_i_1_n_0 ),
        .D(write_data[8]),
        .Q(read_index[8]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \read_index_reg[9] 
       (.C(s_axi_aclk),
        .CE(\read_index[15]_i_1_n_0 ),
        .D(write_data[9]),
        .Q(read_index[9]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h02)) 
    s_axi_arready_INST_0
       (.I0(s_axi_aresetn),
        .I1(memory_pending_reg_n_0),
        .I2(s_axi_rvalid_reg_0),
        .O(s_axi_arready));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'h04)) 
    s_axi_awready_INST_0
       (.I0(address_pending),
        .I1(s_axi_aresetn),
        .I2(s_axi_bvalid_reg_0),
        .O(s_axi_awready));
  LUT1 #(
    .INIT(2'h1)) 
    \s_axi_bresp[1]_i_1 
       (.I0(s_axi_aresetn),
        .O(\s_axi_bresp[1]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \s_axi_bresp[1]_i_10 
       (.I0(shadow_count[25]),
        .I1(shadow_count[21]),
        .I2(shadow_count[26]),
        .I3(shadow_count[22]),
        .O(\s_axi_bresp[1]_i_10_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \s_axi_bresp[1]_i_11 
       (.I0(shadow_count[31]),
        .I1(shadow_count[14]),
        .I2(shadow_count[28]),
        .I3(shadow_count[13]),
        .O(\s_axi_bresp[1]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFEEE)) 
    \s_axi_bresp[1]_i_13 
       (.I0(shadow_count[23]),
        .I1(shadow_count[11]),
        .I2(\write_strobes_reg_n_0_[0] ),
        .I3(write_data[1]),
        .I4(shadow_count[17]),
        .I5(shadow_count[18]),
        .O(\s_axi_bresp[1]_i_13_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFCEFCFCFC)) 
    \s_axi_bresp[1]_i_4 
       (.I0(shadow_wait_i_2_n_0),
        .I1(\s_axi_bresp[1]_i_9_n_0 ),
        .I2(\write_address_reg_n_0_[5] ),
        .I3(\write_address_reg_n_0_[3] ),
        .I4(\write_address_reg_n_0_[2] ),
        .I5(shadow_wait_i_4_n_0),
        .O(\s_axi_bresp[1]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \s_axi_bresp[1]_i_5 
       (.I0(s_axi_bvalid_reg_0),
        .I1(address_pending),
        .I2(data_pending_reg_n_0),
        .O(address_pending0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFD)) 
    \s_axi_bresp[1]_i_6 
       (.I0(\arm_interval[31]_i_16_n_0 ),
        .I1(\arm_interval[31]_i_19_n_0 ),
        .I2(shadow_count[24]),
        .I3(shadow_count[12]),
        .I4(shadow_count[19]),
        .I5(shadow_count[15]),
        .O(\s_axi_bresp[1]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \s_axi_bresp[1]_i_7 
       (.I0(shadow_count[29]),
        .I1(shadow_count[30]),
        .I2(shadow_count[16]),
        .I3(shadow_count[27]),
        .I4(\s_axi_bresp[1]_i_10_n_0 ),
        .I5(\s_axi_bresp[1]_i_11_n_0 ),
        .O(\s_axi_bresp[1]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \s_axi_bresp[1]_i_9 
       (.I0(\write_address_reg_n_0_[0] ),
        .I1(\write_address_reg_n_0_[1] ),
        .I2(\write_address_reg_n_0_[4] ),
        .O(\s_axi_bresp[1]_i_9_n_0 ));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BRESP" *) 
  FDRE \s_axi_bresp_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(capture_n_47),
        .Q(s_axi_bresp),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
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
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hC00FC000E0A0E0A0)) 
    \s_axi_rdata[10]_i_3 
       (.I0(shadow_interval[10]),
        .I1(read_index[10]),
        .I2(s_axi_araddr[2]),
        .I3(s_axi_araddr[5]),
        .I4(shadow_count[10]),
        .I5(s_axi_araddr[3]),
        .O(\s_axi_rdata[10]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000045CDFFFF)) 
    \s_axi_rdata[1]_i_2 
       (.I0(s_axi_araddr[5]),
        .I1(s_axi_araddr[2]),
        .I2(shadow_count[1]),
        .I3(read_index[1]),
        .I4(s_axi_araddr[3]),
        .I5(\s_axi_rdata[1]_i_5_n_0 ),
        .O(\s_axi_rdata[1]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT5 #(
    .INIT(32'hAAAAAAEA)) 
    \s_axi_rdata[1]_i_5 
       (.I0(s_axi_araddr[4]),
        .I1(s_axi_araddr[2]),
        .I2(shadow_interval[1]),
        .I3(s_axi_araddr[3]),
        .I4(s_axi_araddr[5]),
        .O(\s_axi_rdata[1]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hE0FF)) 
    \s_axi_rdata[31]_i_1 
       (.I0(memory_pending_reg_n_0),
        .I1(memory_index_1),
        .I2(invalidate_in),
        .I3(s_axi_aresetn),
        .O(\s_axi_rdata[31]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \s_axi_rdata[31]_i_11 
       (.I0(s_axi_araddr[10]),
        .I1(s_axi_araddr[11]),
        .I2(s_axi_araddr[9]),
        .I3(s_axi_araddr[0]),
        .O(\s_axi_rdata[31]_i_11_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'h0008)) 
    \s_axi_rdata[31]_i_4 
       (.I0(s_axi_arvalid),
        .I1(s_axi_aresetn),
        .I2(memory_pending_reg_n_0),
        .I3(s_axi_rvalid_reg_0),
        .O(\s_axi_rdata[31]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \s_axi_rdata[31]_i_6 
       (.I0(s_axi_araddr[4]),
        .I1(s_axi_araddr[5]),
        .O(\s_axi_rdata[31]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \s_axi_rdata[31]_i_7 
       (.I0(s_axi_araddr[6]),
        .I1(s_axi_araddr[8]),
        .I2(s_axi_araddr[1]),
        .I3(s_axi_araddr[7]),
        .I4(\s_axi_rdata[31]_i_11_n_0 ),
        .O(\s_axi_rdata[31]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT5 #(
    .INIT(32'hFEFFFFFF)) 
    \s_axi_rdata[31]_i_8 
       (.I0(\s_axi_rdata[31]_i_7_n_0 ),
        .I1(s_axi_rvalid_reg_0),
        .I2(memory_pending_reg_n_0),
        .I3(s_axi_aresetn),
        .I4(s_axi_arvalid),
        .O(\s_axi_rdata[31]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \s_axi_rdata[5]_i_3 
       (.I0(s_axi_araddr[4]),
        .I1(s_axi_araddr[5]),
        .O(\s_axi_rdata[5]_i_3_n_0 ));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[0] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid0),
        .D(p_2_in[0]),
        .Q(s_axi_rdata[0]),
        .R(\s_axi_rdata[31]_i_1_n_0 ));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[10] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid0),
        .D(capture_n_25),
        .Q(s_axi_rdata[10]),
        .R(\s_axi_rdata[31]_i_1_n_0 ));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[11] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid0),
        .D(capture_n_24),
        .Q(s_axi_rdata[11]),
        .R(\s_axi_rdata[31]_i_1_n_0 ));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[12] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid0),
        .D(capture_n_23),
        .Q(s_axi_rdata[12]),
        .R(\s_axi_rdata[31]_i_1_n_0 ));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[13] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid0),
        .D(capture_n_22),
        .Q(s_axi_rdata[13]),
        .R(\s_axi_rdata[31]_i_1_n_0 ));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[14] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid0),
        .D(p_2_in[14]),
        .Q(s_axi_rdata[14]),
        .R(\s_axi_rdata[31]_i_1_n_0 ));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[15] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid0),
        .D(capture_n_20),
        .Q(s_axi_rdata[15]),
        .R(\s_axi_rdata[31]_i_1_n_0 ));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[16] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid0),
        .D(p_2_in[16]),
        .Q(s_axi_rdata[16]),
        .R(\s_axi_rdata[31]_i_1_n_0 ));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[17] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid0),
        .D(capture_n_18),
        .Q(s_axi_rdata[17]),
        .R(\s_axi_rdata[31]_i_1_n_0 ));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[18] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid0),
        .D(capture_n_17),
        .Q(s_axi_rdata[18]),
        .R(\s_axi_rdata[31]_i_1_n_0 ));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[19] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid0),
        .D(p_2_in[19]),
        .Q(s_axi_rdata[19]),
        .R(\s_axi_rdata[31]_i_1_n_0 ));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[1] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid0),
        .D(p_2_in[1]),
        .Q(s_axi_rdata[1]),
        .R(\s_axi_rdata[31]_i_1_n_0 ));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[20] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid0),
        .D(capture_n_15),
        .Q(s_axi_rdata[20]),
        .R(\s_axi_rdata[31]_i_1_n_0 ));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[21] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid0),
        .D(capture_n_14),
        .Q(s_axi_rdata[21]),
        .R(\s_axi_rdata[31]_i_1_n_0 ));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[22] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid0),
        .D(p_2_in[22]),
        .Q(s_axi_rdata[22]),
        .R(\s_axi_rdata[31]_i_1_n_0 ));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[23] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid0),
        .D(capture_n_12),
        .Q(s_axi_rdata[23]),
        .R(\s_axi_rdata[31]_i_1_n_0 ));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[24] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid0),
        .D(capture_n_11),
        .Q(s_axi_rdata[24]),
        .R(\s_axi_rdata[31]_i_1_n_0 ));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[25] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid0),
        .D(capture_n_10),
        .Q(s_axi_rdata[25]),
        .R(\s_axi_rdata[31]_i_1_n_0 ));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[26] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid0),
        .D(p_2_in[26]),
        .Q(s_axi_rdata[26]),
        .R(\s_axi_rdata[31]_i_1_n_0 ));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[27] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid0),
        .D(capture_n_8),
        .Q(s_axi_rdata[27]),
        .R(\s_axi_rdata[31]_i_1_n_0 ));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[28] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid0),
        .D(capture_n_7),
        .Q(s_axi_rdata[28]),
        .R(\s_axi_rdata[31]_i_1_n_0 ));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[29] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid0),
        .D(capture_n_6),
        .Q(s_axi_rdata[29]),
        .R(\s_axi_rdata[31]_i_1_n_0 ));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[2] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid0),
        .D(capture_n_33),
        .Q(s_axi_rdata[2]),
        .R(\s_axi_rdata[31]_i_1_n_0 ));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[30] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid0),
        .D(p_2_in[30]),
        .Q(s_axi_rdata[30]),
        .R(\s_axi_rdata[31]_i_1_n_0 ));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[31] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid0),
        .D(capture_n_4),
        .Q(s_axi_rdata[31]),
        .R(\s_axi_rdata[31]_i_1_n_0 ));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[3] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid0),
        .D(capture_n_32),
        .Q(s_axi_rdata[3]),
        .R(\s_axi_rdata[31]_i_1_n_0 ));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[4] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid0),
        .D(p_2_in[4]),
        .Q(s_axi_rdata[4]),
        .R(\s_axi_rdata[31]_i_1_n_0 ));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[5] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid0),
        .D(p_2_in[5]),
        .Q(s_axi_rdata[5]),
        .R(\s_axi_rdata[31]_i_1_n_0 ));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[6] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid0),
        .D(capture_n_29),
        .Q(s_axi_rdata[6]),
        .R(\s_axi_rdata[31]_i_1_n_0 ));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[7] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid0),
        .D(capture_n_28),
        .Q(s_axi_rdata[7]),
        .R(\s_axi_rdata[31]_i_1_n_0 ));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[8] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid0),
        .D(p_2_in[8]),
        .Q(s_axi_rdata[8]),
        .R(\s_axi_rdata[31]_i_1_n_0 ));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[9] 
       (.C(s_axi_aclk),
        .CE(s_axi_rvalid0),
        .D(p_2_in[9]),
        .Q(s_axi_rdata[9]),
        .R(\s_axi_rdata[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFBBBBBFFF88888)) 
    \s_axi_rresp[1]_i_1 
       (.I0(p_0_out),
        .I1(capture_n_43),
        .I2(memory_pending_reg_n_0),
        .I3(memory_index_1),
        .I4(invalidate_in),
        .I5(s_axi_rresp),
        .O(\s_axi_rresp[1]_i_1_n_0 ));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RRESP" *) 
  FDRE \s_axi_rresp_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\s_axi_rresp[1]_i_1_n_0 ),
        .Q(s_axi_rresp),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFBBBBBFFF88888)) 
    s_axi_rvalid_i_1
       (.I0(s_axi_rvalid0),
        .I1(capture_n_41),
        .I2(memory_pending_reg_n_0),
        .I3(memory_index_1),
        .I4(invalidate_in),
        .I5(s_axi_rvalid_reg_0),
        .O(s_axi_rvalid_i_1_n_0));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RVALID" *) 
  FDRE s_axi_rvalid_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_axi_rvalid_i_1_n_0),
        .Q(s_axi_rvalid_reg_0),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'h04)) 
    s_axi_wready_INST_0
       (.I0(data_pending_reg_n_0),
        .I1(s_axi_aresetn),
        .I2(s_axi_bvalid_reg_0),
        .O(s_axi_wready));
  LUT6 #(
    .INIT(64'h0000000000000800)) 
    \shadow_count[15]_i_1 
       (.I0(\shadow_count[31]_i_2_n_0 ),
        .I1(data00),
        .I2(\write_address_reg_n_0_[5] ),
        .I3(\write_address_reg_n_0_[3] ),
        .I4(\write_address_reg_n_0_[4] ),
        .I5(\write_address_reg_n_0_[1] ),
        .O(\shadow_count[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000800)) 
    \shadow_count[23]_i_1 
       (.I0(\shadow_count[31]_i_2_n_0 ),
        .I1(\write_strobes_reg_n_0_[2] ),
        .I2(\write_address_reg_n_0_[5] ),
        .I3(\write_address_reg_n_0_[3] ),
        .I4(\write_address_reg_n_0_[4] ),
        .I5(\write_address_reg_n_0_[1] ),
        .O(\shadow_count[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000800)) 
    \shadow_count[31]_i_1 
       (.I0(\shadow_count[31]_i_2_n_0 ),
        .I1(\write_strobes_reg_n_0_[3] ),
        .I2(\write_address_reg_n_0_[5] ),
        .I3(\write_address_reg_n_0_[3] ),
        .I4(\write_address_reg_n_0_[4] ),
        .I5(\write_address_reg_n_0_[1] ),
        .O(\shadow_count[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'h002A)) 
    \shadow_count[31]_i_2 
       (.I0(arm_valid_i_2_n_0),
        .I1(\write_address_reg_n_0_[3] ),
        .I2(\write_address_reg_n_0_[2] ),
        .I3(\write_address_reg_n_0_[5] ),
        .O(\shadow_count[31]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000800)) 
    \shadow_count[7]_i_1 
       (.I0(\shadow_count[31]_i_2_n_0 ),
        .I1(\write_strobes_reg_n_0_[0] ),
        .I2(\write_address_reg_n_0_[5] ),
        .I3(\write_address_reg_n_0_[3] ),
        .I4(\write_address_reg_n_0_[4] ),
        .I5(\write_address_reg_n_0_[1] ),
        .O(\shadow_count[7]_i_1_n_0 ));
  FDRE \shadow_count_reg[0] 
       (.C(s_axi_aclk),
        .CE(\shadow_count[7]_i_1_n_0 ),
        .D(write_data[0]),
        .Q(shadow_count[0]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \shadow_count_reg[10] 
       (.C(s_axi_aclk),
        .CE(\shadow_count[15]_i_1_n_0 ),
        .D(write_data[10]),
        .Q(shadow_count[10]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \shadow_count_reg[11] 
       (.C(s_axi_aclk),
        .CE(\shadow_count[15]_i_1_n_0 ),
        .D(write_data[11]),
        .Q(shadow_count[11]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \shadow_count_reg[12] 
       (.C(s_axi_aclk),
        .CE(\shadow_count[15]_i_1_n_0 ),
        .D(write_data[12]),
        .Q(shadow_count[12]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \shadow_count_reg[13] 
       (.C(s_axi_aclk),
        .CE(\shadow_count[15]_i_1_n_0 ),
        .D(write_data[13]),
        .Q(shadow_count[13]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \shadow_count_reg[14] 
       (.C(s_axi_aclk),
        .CE(\shadow_count[15]_i_1_n_0 ),
        .D(write_data[14]),
        .Q(shadow_count[14]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \shadow_count_reg[15] 
       (.C(s_axi_aclk),
        .CE(\shadow_count[15]_i_1_n_0 ),
        .D(write_data[15]),
        .Q(shadow_count[15]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \shadow_count_reg[16] 
       (.C(s_axi_aclk),
        .CE(\shadow_count[23]_i_1_n_0 ),
        .D(write_data[16]),
        .Q(shadow_count[16]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \shadow_count_reg[17] 
       (.C(s_axi_aclk),
        .CE(\shadow_count[23]_i_1_n_0 ),
        .D(write_data[17]),
        .Q(shadow_count[17]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \shadow_count_reg[18] 
       (.C(s_axi_aclk),
        .CE(\shadow_count[23]_i_1_n_0 ),
        .D(write_data[18]),
        .Q(shadow_count[18]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \shadow_count_reg[19] 
       (.C(s_axi_aclk),
        .CE(\shadow_count[23]_i_1_n_0 ),
        .D(write_data[19]),
        .Q(shadow_count[19]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \shadow_count_reg[1] 
       (.C(s_axi_aclk),
        .CE(\shadow_count[7]_i_1_n_0 ),
        .D(write_data[1]),
        .Q(shadow_count[1]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \shadow_count_reg[20] 
       (.C(s_axi_aclk),
        .CE(\shadow_count[23]_i_1_n_0 ),
        .D(write_data[20]),
        .Q(shadow_count[20]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \shadow_count_reg[21] 
       (.C(s_axi_aclk),
        .CE(\shadow_count[23]_i_1_n_0 ),
        .D(write_data[21]),
        .Q(shadow_count[21]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \shadow_count_reg[22] 
       (.C(s_axi_aclk),
        .CE(\shadow_count[23]_i_1_n_0 ),
        .D(write_data[22]),
        .Q(shadow_count[22]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \shadow_count_reg[23] 
       (.C(s_axi_aclk),
        .CE(\shadow_count[23]_i_1_n_0 ),
        .D(write_data[23]),
        .Q(shadow_count[23]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \shadow_count_reg[24] 
       (.C(s_axi_aclk),
        .CE(\shadow_count[31]_i_1_n_0 ),
        .D(write_data[24]),
        .Q(shadow_count[24]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \shadow_count_reg[25] 
       (.C(s_axi_aclk),
        .CE(\shadow_count[31]_i_1_n_0 ),
        .D(write_data[25]),
        .Q(shadow_count[25]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \shadow_count_reg[26] 
       (.C(s_axi_aclk),
        .CE(\shadow_count[31]_i_1_n_0 ),
        .D(write_data[26]),
        .Q(shadow_count[26]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \shadow_count_reg[27] 
       (.C(s_axi_aclk),
        .CE(\shadow_count[31]_i_1_n_0 ),
        .D(write_data[27]),
        .Q(shadow_count[27]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \shadow_count_reg[28] 
       (.C(s_axi_aclk),
        .CE(\shadow_count[31]_i_1_n_0 ),
        .D(write_data[28]),
        .Q(shadow_count[28]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \shadow_count_reg[29] 
       (.C(s_axi_aclk),
        .CE(\shadow_count[31]_i_1_n_0 ),
        .D(write_data[29]),
        .Q(shadow_count[29]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \shadow_count_reg[2] 
       (.C(s_axi_aclk),
        .CE(\shadow_count[7]_i_1_n_0 ),
        .D(write_data[2]),
        .Q(shadow_count[2]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \shadow_count_reg[30] 
       (.C(s_axi_aclk),
        .CE(\shadow_count[31]_i_1_n_0 ),
        .D(write_data[30]),
        .Q(shadow_count[30]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \shadow_count_reg[31] 
       (.C(s_axi_aclk),
        .CE(\shadow_count[31]_i_1_n_0 ),
        .D(write_data[31]),
        .Q(shadow_count[31]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \shadow_count_reg[3] 
       (.C(s_axi_aclk),
        .CE(\shadow_count[7]_i_1_n_0 ),
        .D(write_data[3]),
        .Q(shadow_count[3]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \shadow_count_reg[4] 
       (.C(s_axi_aclk),
        .CE(\shadow_count[7]_i_1_n_0 ),
        .D(write_data[4]),
        .Q(shadow_count[4]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \shadow_count_reg[5] 
       (.C(s_axi_aclk),
        .CE(\shadow_count[7]_i_1_n_0 ),
        .D(write_data[5]),
        .Q(shadow_count[5]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \shadow_count_reg[6] 
       (.C(s_axi_aclk),
        .CE(\shadow_count[7]_i_1_n_0 ),
        .D(write_data[6]),
        .Q(shadow_count[6]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \shadow_count_reg[7] 
       (.C(s_axi_aclk),
        .CE(\shadow_count[7]_i_1_n_0 ),
        .D(write_data[7]),
        .Q(shadow_count[7]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \shadow_count_reg[8] 
       (.C(s_axi_aclk),
        .CE(\shadow_count[15]_i_1_n_0 ),
        .D(write_data[8]),
        .Q(shadow_count[8]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \shadow_count_reg[9] 
       (.C(s_axi_aclk),
        .CE(\shadow_count[15]_i_1_n_0 ),
        .D(write_data[9]),
        .Q(shadow_count[9]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h5504000000000000)) 
    \shadow_interval[15]_i_1 
       (.I0(\shadow_interval[31]_i_2_n_0 ),
        .I1(\write_address_reg_n_0_[2] ),
        .I2(\write_address_reg_n_0_[3] ),
        .I3(\write_address_reg_n_0_[5] ),
        .I4(\shadow_interval[31]_i_3_n_0 ),
        .I5(data00),
        .O(\shadow_interval[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h5504000000000000)) 
    \shadow_interval[23]_i_1 
       (.I0(\shadow_interval[31]_i_2_n_0 ),
        .I1(\write_address_reg_n_0_[2] ),
        .I2(\write_address_reg_n_0_[3] ),
        .I3(\write_address_reg_n_0_[5] ),
        .I4(\shadow_interval[31]_i_3_n_0 ),
        .I5(\write_strobes_reg_n_0_[2] ),
        .O(\shadow_interval[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h5504000000000000)) 
    \shadow_interval[31]_i_1 
       (.I0(\shadow_interval[31]_i_2_n_0 ),
        .I1(\write_address_reg_n_0_[2] ),
        .I2(\write_address_reg_n_0_[3] ),
        .I3(\write_address_reg_n_0_[5] ),
        .I4(\shadow_interval[31]_i_3_n_0 ),
        .I5(\write_strobes_reg_n_0_[3] ),
        .O(\shadow_interval[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFF7F7FFF7)) 
    \shadow_interval[31]_i_2 
       (.I0(data_pending_reg_n_0),
        .I1(address_pending),
        .I2(s_axi_bvalid_reg_0),
        .I3(\write_address_reg_n_0_[0] ),
        .I4(\write_address_reg_n_0_[1] ),
        .I5(\write_address_reg_n_0_[4] ),
        .O(\shadow_interval[31]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'h00000001)) 
    \shadow_interval[31]_i_3 
       (.I0(shadow_wait_i_4_n_0),
        .I1(\write_address_reg_n_0_[5] ),
        .I2(\write_address_reg_n_0_[1] ),
        .I3(\write_address_reg_n_0_[4] ),
        .I4(\write_address_reg_n_0_[3] ),
        .O(\shadow_interval[31]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h5504000000000000)) 
    \shadow_interval[7]_i_1 
       (.I0(\shadow_interval[31]_i_2_n_0 ),
        .I1(\write_address_reg_n_0_[2] ),
        .I2(\write_address_reg_n_0_[3] ),
        .I3(\write_address_reg_n_0_[5] ),
        .I4(\shadow_interval[31]_i_3_n_0 ),
        .I5(\write_strobes_reg_n_0_[0] ),
        .O(\shadow_interval[7]_i_1_n_0 ));
  FDRE \shadow_interval_reg[0] 
       (.C(s_axi_aclk),
        .CE(\shadow_interval[7]_i_1_n_0 ),
        .D(write_data[0]),
        .Q(shadow_interval[0]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \shadow_interval_reg[10] 
       (.C(s_axi_aclk),
        .CE(\shadow_interval[15]_i_1_n_0 ),
        .D(write_data[10]),
        .Q(shadow_interval[10]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \shadow_interval_reg[11] 
       (.C(s_axi_aclk),
        .CE(\shadow_interval[15]_i_1_n_0 ),
        .D(write_data[11]),
        .Q(shadow_interval[11]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \shadow_interval_reg[12] 
       (.C(s_axi_aclk),
        .CE(\shadow_interval[15]_i_1_n_0 ),
        .D(write_data[12]),
        .Q(shadow_interval[12]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \shadow_interval_reg[13] 
       (.C(s_axi_aclk),
        .CE(\shadow_interval[15]_i_1_n_0 ),
        .D(write_data[13]),
        .Q(shadow_interval[13]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \shadow_interval_reg[14] 
       (.C(s_axi_aclk),
        .CE(\shadow_interval[15]_i_1_n_0 ),
        .D(write_data[14]),
        .Q(shadow_interval[14]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \shadow_interval_reg[15] 
       (.C(s_axi_aclk),
        .CE(\shadow_interval[15]_i_1_n_0 ),
        .D(write_data[15]),
        .Q(shadow_interval[15]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \shadow_interval_reg[16] 
       (.C(s_axi_aclk),
        .CE(\shadow_interval[23]_i_1_n_0 ),
        .D(write_data[16]),
        .Q(shadow_interval[16]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \shadow_interval_reg[17] 
       (.C(s_axi_aclk),
        .CE(\shadow_interval[23]_i_1_n_0 ),
        .D(write_data[17]),
        .Q(shadow_interval[17]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \shadow_interval_reg[18] 
       (.C(s_axi_aclk),
        .CE(\shadow_interval[23]_i_1_n_0 ),
        .D(write_data[18]),
        .Q(shadow_interval[18]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \shadow_interval_reg[19] 
       (.C(s_axi_aclk),
        .CE(\shadow_interval[23]_i_1_n_0 ),
        .D(write_data[19]),
        .Q(shadow_interval[19]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \shadow_interval_reg[1] 
       (.C(s_axi_aclk),
        .CE(\shadow_interval[7]_i_1_n_0 ),
        .D(write_data[1]),
        .Q(shadow_interval[1]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \shadow_interval_reg[20] 
       (.C(s_axi_aclk),
        .CE(\shadow_interval[23]_i_1_n_0 ),
        .D(write_data[20]),
        .Q(shadow_interval[20]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \shadow_interval_reg[21] 
       (.C(s_axi_aclk),
        .CE(\shadow_interval[23]_i_1_n_0 ),
        .D(write_data[21]),
        .Q(shadow_interval[21]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \shadow_interval_reg[22] 
       (.C(s_axi_aclk),
        .CE(\shadow_interval[23]_i_1_n_0 ),
        .D(write_data[22]),
        .Q(shadow_interval[22]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \shadow_interval_reg[23] 
       (.C(s_axi_aclk),
        .CE(\shadow_interval[23]_i_1_n_0 ),
        .D(write_data[23]),
        .Q(shadow_interval[23]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \shadow_interval_reg[24] 
       (.C(s_axi_aclk),
        .CE(\shadow_interval[31]_i_1_n_0 ),
        .D(write_data[24]),
        .Q(shadow_interval[24]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \shadow_interval_reg[25] 
       (.C(s_axi_aclk),
        .CE(\shadow_interval[31]_i_1_n_0 ),
        .D(write_data[25]),
        .Q(shadow_interval[25]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \shadow_interval_reg[26] 
       (.C(s_axi_aclk),
        .CE(\shadow_interval[31]_i_1_n_0 ),
        .D(write_data[26]),
        .Q(shadow_interval[26]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \shadow_interval_reg[27] 
       (.C(s_axi_aclk),
        .CE(\shadow_interval[31]_i_1_n_0 ),
        .D(write_data[27]),
        .Q(shadow_interval[27]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \shadow_interval_reg[28] 
       (.C(s_axi_aclk),
        .CE(\shadow_interval[31]_i_1_n_0 ),
        .D(write_data[28]),
        .Q(shadow_interval[28]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \shadow_interval_reg[29] 
       (.C(s_axi_aclk),
        .CE(\shadow_interval[31]_i_1_n_0 ),
        .D(write_data[29]),
        .Q(shadow_interval[29]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \shadow_interval_reg[2] 
       (.C(s_axi_aclk),
        .CE(\shadow_interval[7]_i_1_n_0 ),
        .D(write_data[2]),
        .Q(shadow_interval[2]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \shadow_interval_reg[30] 
       (.C(s_axi_aclk),
        .CE(\shadow_interval[31]_i_1_n_0 ),
        .D(write_data[30]),
        .Q(shadow_interval[30]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \shadow_interval_reg[31] 
       (.C(s_axi_aclk),
        .CE(\shadow_interval[31]_i_1_n_0 ),
        .D(write_data[31]),
        .Q(shadow_interval[31]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \shadow_interval_reg[3] 
       (.C(s_axi_aclk),
        .CE(\shadow_interval[7]_i_1_n_0 ),
        .D(write_data[3]),
        .Q(shadow_interval[3]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \shadow_interval_reg[4] 
       (.C(s_axi_aclk),
        .CE(\shadow_interval[7]_i_1_n_0 ),
        .D(write_data[4]),
        .Q(shadow_interval[4]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \shadow_interval_reg[5] 
       (.C(s_axi_aclk),
        .CE(\shadow_interval[7]_i_1_n_0 ),
        .D(write_data[5]),
        .Q(shadow_interval[5]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \shadow_interval_reg[6] 
       (.C(s_axi_aclk),
        .CE(\shadow_interval[7]_i_1_n_0 ),
        .D(write_data[6]),
        .Q(shadow_interval[6]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \shadow_interval_reg[7] 
       (.C(s_axi_aclk),
        .CE(\shadow_interval[7]_i_1_n_0 ),
        .D(write_data[7]),
        .Q(shadow_interval[7]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \shadow_interval_reg[8] 
       (.C(s_axi_aclk),
        .CE(\shadow_interval[15]_i_1_n_0 ),
        .D(write_data[8]),
        .Q(shadow_interval[8]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \shadow_interval_reg[9] 
       (.C(s_axi_aclk),
        .CE(\shadow_interval[15]_i_1_n_0 ),
        .D(write_data[9]),
        .Q(shadow_interval[9]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFE00000002)) 
    shadow_wait_i_1
       (.I0(write_data[0]),
        .I1(shadow_wait_i_2_n_0),
        .I2(shadow_wait_i_3_n_0),
        .I3(\write_address_reg_n_0_[5] ),
        .I4(shadow_wait_i_4_n_0),
        .I5(shadow_wait),
        .O(shadow_wait_i_1_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    shadow_wait_i_2
       (.I0(\arm_interval[31]_i_8_n_0 ),
        .I1(shadow_wait_i_5_n_0),
        .I2(shadow_wait_i_6_n_0),
        .I3(\arm_interval[31]_i_11_n_0 ),
        .O(shadow_wait_i_2_n_0));
  LUT6 #(
    .INIT(64'hFEFFFFFFFFFFFFFF)) 
    shadow_wait_i_3
       (.I0(\write_address_reg_n_0_[4] ),
        .I1(\write_address_reg_n_0_[1] ),
        .I2(\write_address_reg_n_0_[0] ),
        .I3(shadow_wait_i_7_n_0),
        .I4(\write_strobes_reg_n_0_[0] ),
        .I5(address_pending0),
        .O(shadow_wait_i_3_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    shadow_wait_i_4
       (.I0(\write_address_reg_n_0_[10] ),
        .I1(\write_address_reg_n_0_[9] ),
        .I2(p_0_in0),
        .I3(\write_address_reg_n_0_[11] ),
        .I4(\write_address_reg_n_0_[7] ),
        .I5(\write_address_reg_n_0_[8] ),
        .O(shadow_wait_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    shadow_wait_i_5
       (.I0(write_data[11]),
        .I1(data00),
        .I2(write_data[19]),
        .I3(\write_strobes_reg_n_0_[2] ),
        .O(shadow_wait_i_5_n_0));
  LUT6 #(
    .INIT(64'hFFFFF0A0FCECF0A0)) 
    shadow_wait_i_6
       (.I0(write_data[8]),
        .I1(write_data[2]),
        .I2(data00),
        .I3(write_data[9]),
        .I4(\write_strobes_reg_n_0_[0] ),
        .I5(write_data[1]),
        .O(shadow_wait_i_6_n_0));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h8)) 
    shadow_wait_i_7
       (.I0(\write_address_reg_n_0_[3] ),
        .I1(\write_address_reg_n_0_[2] ),
        .O(shadow_wait_i_7_n_0));
  FDRE shadow_wait_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(shadow_wait_i_1_n_0),
        .Q(shadow_wait),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE soft_trigger_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(capture_n_46),
        .Q(soft_trigger_reg_n_0),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFFBFFFFFFF0000)) 
    trigger_sticky_i_1
       (.I0(\arm_interval[31]_i_6_n_0 ),
        .I1(write_data[8]),
        .I2(data00),
        .I3(capture_n_38),
        .I4(trigger_seen),
        .I5(trigger_sticky),
        .O(trigger_sticky_i_1_n_0));
  FDRE trigger_sticky_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(trigger_sticky_i_1_n_0),
        .Q(trigger_sticky),
        .R(trigger_sticky_0));
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
        .Q(\write_address_reg_n_0_[0] ),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \write_address_reg[10] 
       (.C(s_axi_aclk),
        .CE(write_address0),
        .D(s_axi_awaddr[10]),
        .Q(\write_address_reg_n_0_[10] ),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \write_address_reg[11] 
       (.C(s_axi_aclk),
        .CE(write_address0),
        .D(s_axi_awaddr[11]),
        .Q(\write_address_reg_n_0_[11] ),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \write_address_reg[1] 
       (.C(s_axi_aclk),
        .CE(write_address0),
        .D(s_axi_awaddr[1]),
        .Q(\write_address_reg_n_0_[1] ),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \write_address_reg[2] 
       (.C(s_axi_aclk),
        .CE(write_address0),
        .D(s_axi_awaddr[2]),
        .Q(\write_address_reg_n_0_[2] ),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \write_address_reg[3] 
       (.C(s_axi_aclk),
        .CE(write_address0),
        .D(s_axi_awaddr[3]),
        .Q(\write_address_reg_n_0_[3] ),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \write_address_reg[4] 
       (.C(s_axi_aclk),
        .CE(write_address0),
        .D(s_axi_awaddr[4]),
        .Q(\write_address_reg_n_0_[4] ),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \write_address_reg[5] 
       (.C(s_axi_aclk),
        .CE(write_address0),
        .D(s_axi_awaddr[5]),
        .Q(\write_address_reg_n_0_[5] ),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \write_address_reg[6] 
       (.C(s_axi_aclk),
        .CE(write_address0),
        .D(s_axi_awaddr[6]),
        .Q(p_0_in0),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \write_address_reg[7] 
       (.C(s_axi_aclk),
        .CE(write_address0),
        .D(s_axi_awaddr[7]),
        .Q(\write_address_reg_n_0_[7] ),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \write_address_reg[8] 
       (.C(s_axi_aclk),
        .CE(write_address0),
        .D(s_axi_awaddr[8]),
        .Q(\write_address_reg_n_0_[8] ),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \write_address_reg[9] 
       (.C(s_axi_aclk),
        .CE(write_address0),
        .D(s_axi_awaddr[9]),
        .Q(\write_address_reg_n_0_[9] ),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \write_data_reg[0] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[0]),
        .Q(write_data[0]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \write_data_reg[10] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[10]),
        .Q(write_data[10]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \write_data_reg[11] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[11]),
        .Q(write_data[11]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \write_data_reg[12] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[12]),
        .Q(write_data[12]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \write_data_reg[13] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[13]),
        .Q(write_data[13]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \write_data_reg[14] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[14]),
        .Q(write_data[14]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \write_data_reg[15] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[15]),
        .Q(write_data[15]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \write_data_reg[16] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[16]),
        .Q(write_data[16]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \write_data_reg[17] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[17]),
        .Q(write_data[17]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \write_data_reg[18] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[18]),
        .Q(write_data[18]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \write_data_reg[19] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[19]),
        .Q(write_data[19]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \write_data_reg[1] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[1]),
        .Q(write_data[1]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \write_data_reg[20] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[20]),
        .Q(write_data[20]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \write_data_reg[21] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[21]),
        .Q(write_data[21]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \write_data_reg[22] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[22]),
        .Q(write_data[22]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \write_data_reg[23] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[23]),
        .Q(write_data[23]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \write_data_reg[24] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[24]),
        .Q(write_data[24]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \write_data_reg[25] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[25]),
        .Q(write_data[25]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \write_data_reg[26] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[26]),
        .Q(write_data[26]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \write_data_reg[27] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[27]),
        .Q(write_data[27]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \write_data_reg[28] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[28]),
        .Q(write_data[28]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \write_data_reg[29] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[29]),
        .Q(write_data[29]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \write_data_reg[2] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[2]),
        .Q(write_data[2]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \write_data_reg[30] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[30]),
        .Q(write_data[30]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \write_data_reg[31] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[31]),
        .Q(write_data[31]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \write_data_reg[3] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[3]),
        .Q(write_data[3]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \write_data_reg[4] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[4]),
        .Q(write_data[4]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \write_data_reg[5] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[5]),
        .Q(write_data[5]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \write_data_reg[6] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[6]),
        .Q(write_data[6]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \write_data_reg[7] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[7]),
        .Q(write_data[7]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \write_data_reg[8] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[8]),
        .Q(write_data[8]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \write_data_reg[9] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wdata[9]),
        .Q(write_data[9]),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
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
        .Q(\write_strobes_reg_n_0_[0] ),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \write_strobes_reg[1] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wstrb[1]),
        .Q(data00),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \write_strobes_reg[2] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wstrb[2]),
        .Q(\write_strobes_reg_n_0_[2] ),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
  FDRE \write_strobes_reg[3] 
       (.C(s_axi_aclk),
        .CE(write_data0),
        .D(s_axi_wstrb[3]),
        .Q(\write_strobes_reg_n_0_[3] ),
        .R(\s_axi_bresp[1]_i_1_n_0 ));
endmodule

(* ORIG_REF_NAME = "fdw_digital_capture" *) 
module system_digital_capture_0_fdw_digital_capture
   (trigger_sticky_0,
    cancelled,
    cfg_error,
    trigger_seen,
    D,
    rd_valid_reg_0,
    E,
    \shadow_count_reg[24] ,
    capture_active,
    p_0_out,
    memory_pending_reg,
    \s_axi_araddr[3] ,
    s_axi_rvalid_reg,
    arm_valid_reg,
    \write_data_reg[1] ,
    \write_data_reg[2] ,
    \write_address_reg[3] ,
    memory_request,
    s_axi_aclk,
    \captured_count_reg[0]_0 ,
    \s_axi_rdata_reg[0] ,
    s_axi_araddr,
    \s_axi_rdata_reg[10] ,
    Q,
    arm_valid_reg_0,
    \s_axi_rdata_reg[31] ,
    trigger_sticky,
    shadow_wait,
    \s_axi_rdata_reg[31]_0 ,
    sample_memory_reg_0,
    trigger_in,
    busy_reg_0,
    s_axi_aresetn,
    invalidate_in,
    memory_index_1,
    memory_pending_reg_0,
    arm_wait_reg,
    arm_wait_reg_0,
    arm_wait_reg_1,
    arm_wait_reg_2,
    arm_wait_reg_3,
    arm_valid_reg_1,
    arm_valid_reg_2,
    arm_wait_reg_4,
    \s_axi_bresp[1]_i_3_0 ,
    \s_axi_bresp[1]_i_3_1 ,
    \active_sample_count_reg[31]_0 ,
    \active_interval_ticks_reg[31]_0 ,
    capture_active_0,
    \s_axi_rdata_reg[0]_0 ,
    \s_axi_rdata_reg[0]_1 ,
    \s_axi_rdata_reg[1] ,
    s_axi_arvalid,
    s_axi_rready,
    \s_axi_rdata_reg[0]_2 ,
    \s_axi_rdata_reg[4] ,
    rd_error1_carry__2_0,
    error_sticky,
    cancel_sticky,
    arm_valid_reg_3,
    arm_valid_reg_4,
    cancel_pulse_reg,
    soft_trigger_reg,
    cancel_pulse_reg_0,
    address_pending0,
    \s_axi_bresp_reg[1] ,
    \s_axi_bresp_reg[1]_0 ,
    s_axi_bresp,
    sample_in);
  output trigger_sticky_0;
  output cancelled;
  output cfg_error;
  output trigger_seen;
  output [31:0]D;
  output rd_valid_reg_0;
  output [0:0]E;
  output \shadow_count_reg[24] ;
  output capture_active;
  output [0:0]p_0_out;
  output memory_pending_reg;
  output [0:0]\s_axi_araddr[3] ;
  output s_axi_rvalid_reg;
  output arm_valid_reg;
  output \write_data_reg[1] ;
  output \write_data_reg[2] ;
  output \write_address_reg[3] ;
  input memory_request;
  input s_axi_aclk;
  input \captured_count_reg[0]_0 ;
  input \s_axi_rdata_reg[0] ;
  input [3:0]s_axi_araddr;
  input \s_axi_rdata_reg[10] ;
  input [29:0]Q;
  input arm_valid_reg_0;
  input [29:0]\s_axi_rdata_reg[31] ;
  input trigger_sticky;
  input shadow_wait;
  input [29:0]\s_axi_rdata_reg[31]_0 ;
  input sample_memory_reg_0;
  input trigger_in;
  input busy_reg_0;
  input s_axi_aresetn;
  input invalidate_in;
  input memory_index_1;
  input memory_pending_reg_0;
  input arm_wait_reg;
  input arm_wait_reg_0;
  input arm_wait_reg_1;
  input arm_wait_reg_2;
  input arm_wait_reg_3;
  input arm_valid_reg_1;
  input arm_valid_reg_2;
  input arm_wait_reg_4;
  input \s_axi_bresp[1]_i_3_0 ;
  input \s_axi_bresp[1]_i_3_1 ;
  input [31:0]\active_sample_count_reg[31]_0 ;
  input [31:0]\active_interval_ticks_reg[31]_0 ;
  input capture_active_0;
  input \s_axi_rdata_reg[0]_0 ;
  input \s_axi_rdata_reg[0]_1 ;
  input \s_axi_rdata_reg[1] ;
  input s_axi_arvalid;
  input s_axi_rready;
  input \s_axi_rdata_reg[0]_2 ;
  input \s_axi_rdata_reg[4] ;
  input [31:0]rd_error1_carry__2_0;
  input error_sticky;
  input cancel_sticky;
  input arm_valid_reg_3;
  input arm_valid_reg_4;
  input cancel_pulse_reg;
  input [1:0]soft_trigger_reg;
  input [0:0]cancel_pulse_reg_0;
  input address_pending0;
  input [1:0]\s_axi_bresp_reg[1] ;
  input \s_axi_bresp_reg[1]_0 ;
  input [0:0]s_axi_bresp;
  input [1:0]sample_in;

  wire [31:0]D;
  wire [0:0]E;
  wire [29:0]Q;
  wire [31:0]active_interval_ticks;
  wire \active_interval_ticks[31]_i_10_n_0 ;
  wire \active_interval_ticks[31]_i_11_n_0 ;
  wire \active_interval_ticks[31]_i_12_n_0 ;
  wire \active_interval_ticks[31]_i_13_n_0 ;
  wire \active_interval_ticks[31]_i_14_n_0 ;
  wire \active_interval_ticks[31]_i_15_n_0 ;
  wire \active_interval_ticks[31]_i_16_n_0 ;
  wire \active_interval_ticks[31]_i_17_n_0 ;
  wire \active_interval_ticks[31]_i_18_n_0 ;
  wire \active_interval_ticks[31]_i_19_n_0 ;
  wire \active_interval_ticks[31]_i_2_n_0 ;
  wire \active_interval_ticks[31]_i_3_n_0 ;
  wire \active_interval_ticks[31]_i_4_n_0 ;
  wire \active_interval_ticks[31]_i_5_n_0 ;
  wire \active_interval_ticks[31]_i_6_n_0 ;
  wire \active_interval_ticks[31]_i_7_n_0 ;
  wire \active_interval_ticks[31]_i_8_n_0 ;
  wire \active_interval_ticks[31]_i_9_n_0 ;
  wire [31:0]\active_interval_ticks_reg[31]_0 ;
  wire [31:0]active_sample_count;
  wire [31:0]\active_sample_count_reg[31]_0 ;
  wire address_pending0;
  wire \arm_interval[31]_i_4_n_0 ;
  wire arm_valid_reg;
  wire arm_valid_reg_0;
  wire arm_valid_reg_1;
  wire arm_valid_reg_2;
  wire arm_valid_reg_3;
  wire arm_valid_reg_4;
  wire arm_wait_reg;
  wire arm_wait_reg_0;
  wire arm_wait_reg_1;
  wire arm_wait_reg_2;
  wire arm_wait_reg_3;
  wire arm_wait_reg_4;
  wire armed;
  wire armed7_out;
  wire armed_i_1_n_0;
  wire armed_i_2_n_0;
  wire busy;
  wire busy0;
  wire busy0_carry__0_i_1_n_0;
  wire busy0_carry__0_i_2_n_0;
  wire busy0_carry__0_i_3_n_0;
  wire busy0_carry__0_i_4_n_0;
  wire busy0_carry__0_i_5_n_0;
  wire busy0_carry__0_i_5_n_1;
  wire busy0_carry__0_i_5_n_2;
  wire busy0_carry__0_i_5_n_3;
  wire busy0_carry__0_i_6_n_0;
  wire busy0_carry__0_i_6_n_1;
  wire busy0_carry__0_i_6_n_2;
  wire busy0_carry__0_i_6_n_3;
  wire busy0_carry__0_i_7_n_0;
  wire busy0_carry__0_i_7_n_1;
  wire busy0_carry__0_i_7_n_2;
  wire busy0_carry__0_i_7_n_3;
  wire busy0_carry__0_n_0;
  wire busy0_carry__0_n_1;
  wire busy0_carry__0_n_2;
  wire busy0_carry__0_n_3;
  wire busy0_carry__1_i_1_n_0;
  wire busy0_carry__1_i_2_n_0;
  wire busy0_carry__1_i_3_n_0;
  wire busy0_carry__1_i_4_n_2;
  wire busy0_carry__1_i_4_n_3;
  wire busy0_carry__1_i_5_n_0;
  wire busy0_carry__1_i_5_n_1;
  wire busy0_carry__1_i_5_n_2;
  wire busy0_carry__1_i_5_n_3;
  wire busy0_carry__1_n_2;
  wire busy0_carry__1_n_3;
  wire busy0_carry_i_1_n_0;
  wire busy0_carry_i_2_n_0;
  wire busy0_carry_i_3_n_0;
  wire busy0_carry_i_4_n_0;
  wire busy0_carry_i_5_n_0;
  wire busy0_carry_i_5_n_1;
  wire busy0_carry_i_5_n_2;
  wire busy0_carry_i_5_n_3;
  wire busy0_carry_i_6_n_0;
  wire busy0_carry_i_6_n_1;
  wire busy0_carry_i_6_n_2;
  wire busy0_carry_i_6_n_3;
  wire busy0_carry_i_7_n_0;
  wire busy0_carry_i_7_n_1;
  wire busy0_carry_i_7_n_2;
  wire busy0_carry_i_7_n_3;
  wire busy0_carry_n_0;
  wire busy0_carry_n_1;
  wire busy0_carry_n_2;
  wire busy0_carry_n_3;
  wire busy_i_1_n_0;
  wire busy_reg_0;
  wire cancel_pulse_reg;
  wire [0:0]cancel_pulse_reg_0;
  wire cancel_sticky;
  wire cancelled;
  wire cancelled_i_1_n_0;
  wire capture_active;
  wire capture_active_0;
  wire [9:0]captured_count;
  wire \captured_count[0]_i_1_n_0 ;
  wire \captured_count[0]_i_4_n_0 ;
  wire [31:10]captured_count_reg;
  wire \captured_count_reg[0]_0 ;
  wire \captured_count_reg[0]_i_3_n_0 ;
  wire \captured_count_reg[0]_i_3_n_1 ;
  wire \captured_count_reg[0]_i_3_n_2 ;
  wire \captured_count_reg[0]_i_3_n_3 ;
  wire \captured_count_reg[0]_i_3_n_4 ;
  wire \captured_count_reg[0]_i_3_n_5 ;
  wire \captured_count_reg[0]_i_3_n_6 ;
  wire \captured_count_reg[0]_i_3_n_7 ;
  wire \captured_count_reg[12]_i_1_n_0 ;
  wire \captured_count_reg[12]_i_1_n_1 ;
  wire \captured_count_reg[12]_i_1_n_2 ;
  wire \captured_count_reg[12]_i_1_n_3 ;
  wire \captured_count_reg[12]_i_1_n_4 ;
  wire \captured_count_reg[12]_i_1_n_5 ;
  wire \captured_count_reg[12]_i_1_n_6 ;
  wire \captured_count_reg[12]_i_1_n_7 ;
  wire \captured_count_reg[16]_i_1_n_0 ;
  wire \captured_count_reg[16]_i_1_n_1 ;
  wire \captured_count_reg[16]_i_1_n_2 ;
  wire \captured_count_reg[16]_i_1_n_3 ;
  wire \captured_count_reg[16]_i_1_n_4 ;
  wire \captured_count_reg[16]_i_1_n_5 ;
  wire \captured_count_reg[16]_i_1_n_6 ;
  wire \captured_count_reg[16]_i_1_n_7 ;
  wire \captured_count_reg[20]_i_1_n_0 ;
  wire \captured_count_reg[20]_i_1_n_1 ;
  wire \captured_count_reg[20]_i_1_n_2 ;
  wire \captured_count_reg[20]_i_1_n_3 ;
  wire \captured_count_reg[20]_i_1_n_4 ;
  wire \captured_count_reg[20]_i_1_n_5 ;
  wire \captured_count_reg[20]_i_1_n_6 ;
  wire \captured_count_reg[20]_i_1_n_7 ;
  wire \captured_count_reg[24]_i_1_n_0 ;
  wire \captured_count_reg[24]_i_1_n_1 ;
  wire \captured_count_reg[24]_i_1_n_2 ;
  wire \captured_count_reg[24]_i_1_n_3 ;
  wire \captured_count_reg[24]_i_1_n_4 ;
  wire \captured_count_reg[24]_i_1_n_5 ;
  wire \captured_count_reg[24]_i_1_n_6 ;
  wire \captured_count_reg[24]_i_1_n_7 ;
  wire \captured_count_reg[28]_i_1_n_1 ;
  wire \captured_count_reg[28]_i_1_n_2 ;
  wire \captured_count_reg[28]_i_1_n_3 ;
  wire \captured_count_reg[28]_i_1_n_4 ;
  wire \captured_count_reg[28]_i_1_n_5 ;
  wire \captured_count_reg[28]_i_1_n_6 ;
  wire \captured_count_reg[28]_i_1_n_7 ;
  wire \captured_count_reg[4]_i_1_n_0 ;
  wire \captured_count_reg[4]_i_1_n_1 ;
  wire \captured_count_reg[4]_i_1_n_2 ;
  wire \captured_count_reg[4]_i_1_n_3 ;
  wire \captured_count_reg[4]_i_1_n_4 ;
  wire \captured_count_reg[4]_i_1_n_5 ;
  wire \captured_count_reg[4]_i_1_n_6 ;
  wire \captured_count_reg[4]_i_1_n_7 ;
  wire \captured_count_reg[8]_i_1_n_0 ;
  wire \captured_count_reg[8]_i_1_n_1 ;
  wire \captured_count_reg[8]_i_1_n_2 ;
  wire \captured_count_reg[8]_i_1_n_3 ;
  wire \captured_count_reg[8]_i_1_n_4 ;
  wire \captured_count_reg[8]_i_1_n_5 ;
  wire \captured_count_reg[8]_i_1_n_6 ;
  wire \captured_count_reg[8]_i_1_n_7 ;
  wire cfg_error;
  wire cfg_error_i_1_n_0;
  wire cfg_error_i_2_n_0;
  wire cfg_error_i_3_n_0;
  wire cfg_error_i_4_n_0;
  wire done_i_1_n_0;
  wire error_sticky;
  wire interval_remaining;
  wire \interval_remaining[0]_i_1_n_0 ;
  wire \interval_remaining[0]_i_4_n_0 ;
  wire \interval_remaining[0]_i_5_n_0 ;
  wire \interval_remaining[0]_i_6_n_0 ;
  wire \interval_remaining[0]_i_7_n_0 ;
  wire \interval_remaining[12]_i_2_n_0 ;
  wire \interval_remaining[12]_i_3_n_0 ;
  wire \interval_remaining[12]_i_4_n_0 ;
  wire \interval_remaining[12]_i_5_n_0 ;
  wire \interval_remaining[16]_i_2_n_0 ;
  wire \interval_remaining[16]_i_3_n_0 ;
  wire \interval_remaining[16]_i_4_n_0 ;
  wire \interval_remaining[16]_i_5_n_0 ;
  wire \interval_remaining[20]_i_2_n_0 ;
  wire \interval_remaining[20]_i_3_n_0 ;
  wire \interval_remaining[20]_i_4_n_0 ;
  wire \interval_remaining[20]_i_5_n_0 ;
  wire \interval_remaining[24]_i_2_n_0 ;
  wire \interval_remaining[24]_i_3_n_0 ;
  wire \interval_remaining[24]_i_4_n_0 ;
  wire \interval_remaining[24]_i_5_n_0 ;
  wire \interval_remaining[28]_i_2_n_0 ;
  wire \interval_remaining[28]_i_3_n_0 ;
  wire \interval_remaining[28]_i_4_n_0 ;
  wire \interval_remaining[28]_i_5_n_0 ;
  wire \interval_remaining[4]_i_2_n_0 ;
  wire \interval_remaining[4]_i_3_n_0 ;
  wire \interval_remaining[4]_i_4_n_0 ;
  wire \interval_remaining[4]_i_5_n_0 ;
  wire \interval_remaining[8]_i_2_n_0 ;
  wire \interval_remaining[8]_i_3_n_0 ;
  wire \interval_remaining[8]_i_4_n_0 ;
  wire \interval_remaining[8]_i_5_n_0 ;
  wire [31:0]interval_remaining_reg;
  wire \interval_remaining_reg[0]_i_3_n_0 ;
  wire \interval_remaining_reg[0]_i_3_n_1 ;
  wire \interval_remaining_reg[0]_i_3_n_2 ;
  wire \interval_remaining_reg[0]_i_3_n_3 ;
  wire \interval_remaining_reg[0]_i_3_n_4 ;
  wire \interval_remaining_reg[0]_i_3_n_5 ;
  wire \interval_remaining_reg[0]_i_3_n_6 ;
  wire \interval_remaining_reg[0]_i_3_n_7 ;
  wire \interval_remaining_reg[12]_i_1_n_0 ;
  wire \interval_remaining_reg[12]_i_1_n_1 ;
  wire \interval_remaining_reg[12]_i_1_n_2 ;
  wire \interval_remaining_reg[12]_i_1_n_3 ;
  wire \interval_remaining_reg[12]_i_1_n_4 ;
  wire \interval_remaining_reg[12]_i_1_n_5 ;
  wire \interval_remaining_reg[12]_i_1_n_6 ;
  wire \interval_remaining_reg[12]_i_1_n_7 ;
  wire \interval_remaining_reg[16]_i_1_n_0 ;
  wire \interval_remaining_reg[16]_i_1_n_1 ;
  wire \interval_remaining_reg[16]_i_1_n_2 ;
  wire \interval_remaining_reg[16]_i_1_n_3 ;
  wire \interval_remaining_reg[16]_i_1_n_4 ;
  wire \interval_remaining_reg[16]_i_1_n_5 ;
  wire \interval_remaining_reg[16]_i_1_n_6 ;
  wire \interval_remaining_reg[16]_i_1_n_7 ;
  wire \interval_remaining_reg[20]_i_1_n_0 ;
  wire \interval_remaining_reg[20]_i_1_n_1 ;
  wire \interval_remaining_reg[20]_i_1_n_2 ;
  wire \interval_remaining_reg[20]_i_1_n_3 ;
  wire \interval_remaining_reg[20]_i_1_n_4 ;
  wire \interval_remaining_reg[20]_i_1_n_5 ;
  wire \interval_remaining_reg[20]_i_1_n_6 ;
  wire \interval_remaining_reg[20]_i_1_n_7 ;
  wire \interval_remaining_reg[24]_i_1_n_0 ;
  wire \interval_remaining_reg[24]_i_1_n_1 ;
  wire \interval_remaining_reg[24]_i_1_n_2 ;
  wire \interval_remaining_reg[24]_i_1_n_3 ;
  wire \interval_remaining_reg[24]_i_1_n_4 ;
  wire \interval_remaining_reg[24]_i_1_n_5 ;
  wire \interval_remaining_reg[24]_i_1_n_6 ;
  wire \interval_remaining_reg[24]_i_1_n_7 ;
  wire \interval_remaining_reg[28]_i_1_n_1 ;
  wire \interval_remaining_reg[28]_i_1_n_2 ;
  wire \interval_remaining_reg[28]_i_1_n_3 ;
  wire \interval_remaining_reg[28]_i_1_n_4 ;
  wire \interval_remaining_reg[28]_i_1_n_5 ;
  wire \interval_remaining_reg[28]_i_1_n_6 ;
  wire \interval_remaining_reg[28]_i_1_n_7 ;
  wire \interval_remaining_reg[4]_i_1_n_0 ;
  wire \interval_remaining_reg[4]_i_1_n_1 ;
  wire \interval_remaining_reg[4]_i_1_n_2 ;
  wire \interval_remaining_reg[4]_i_1_n_3 ;
  wire \interval_remaining_reg[4]_i_1_n_4 ;
  wire \interval_remaining_reg[4]_i_1_n_5 ;
  wire \interval_remaining_reg[4]_i_1_n_6 ;
  wire \interval_remaining_reg[4]_i_1_n_7 ;
  wire \interval_remaining_reg[8]_i_1_n_0 ;
  wire \interval_remaining_reg[8]_i_1_n_1 ;
  wire \interval_remaining_reg[8]_i_1_n_2 ;
  wire \interval_remaining_reg[8]_i_1_n_3 ;
  wire \interval_remaining_reg[8]_i_1_n_4 ;
  wire \interval_remaining_reg[8]_i_1_n_5 ;
  wire \interval_remaining_reg[8]_i_1_n_6 ;
  wire \interval_remaining_reg[8]_i_1_n_7 ;
  wire invalidate_in;
  wire [1:0]memory_data;
  wire memory_index_1;
  wire memory_pending_reg;
  wire memory_pending_reg_0;
  wire memory_request;
  wire memory_valid;
  wire [31:0]p_0_in;
  wire [0:0]p_0_out;
  wire rd_error;
  wire rd_error1;
  wire rd_error1_carry__0_i_1_n_0;
  wire rd_error1_carry__0_i_2_n_0;
  wire rd_error1_carry__0_i_3_n_0;
  wire rd_error1_carry__0_i_4_n_0;
  wire rd_error1_carry__0_i_5_n_0;
  wire rd_error1_carry__0_i_6_n_0;
  wire rd_error1_carry__0_i_7_n_0;
  wire rd_error1_carry__0_i_8_n_0;
  wire rd_error1_carry__0_n_0;
  wire rd_error1_carry__0_n_1;
  wire rd_error1_carry__0_n_2;
  wire rd_error1_carry__0_n_3;
  wire rd_error1_carry__1_i_1_n_0;
  wire rd_error1_carry__1_i_2_n_0;
  wire rd_error1_carry__1_i_3_n_0;
  wire rd_error1_carry__1_i_4_n_0;
  wire rd_error1_carry__1_i_5_n_0;
  wire rd_error1_carry__1_i_6_n_0;
  wire rd_error1_carry__1_i_7_n_0;
  wire rd_error1_carry__1_i_8_n_0;
  wire rd_error1_carry__1_n_0;
  wire rd_error1_carry__1_n_1;
  wire rd_error1_carry__1_n_2;
  wire rd_error1_carry__1_n_3;
  wire [31:0]rd_error1_carry__2_0;
  wire rd_error1_carry__2_i_1_n_0;
  wire rd_error1_carry__2_i_2_n_0;
  wire rd_error1_carry__2_i_3_n_0;
  wire rd_error1_carry__2_i_4_n_0;
  wire rd_error1_carry__2_i_5_n_0;
  wire rd_error1_carry__2_i_6_n_0;
  wire rd_error1_carry__2_i_7_n_0;
  wire rd_error1_carry__2_i_8_n_0;
  wire rd_error1_carry__2_n_1;
  wire rd_error1_carry__2_n_2;
  wire rd_error1_carry__2_n_3;
  wire rd_error1_carry_i_1_n_0;
  wire rd_error1_carry_i_2_n_0;
  wire rd_error1_carry_i_3_n_0;
  wire rd_error1_carry_i_4_n_0;
  wire rd_error1_carry_i_5_n_0;
  wire rd_error1_carry_i_6_n_0;
  wire rd_error1_carry_i_7_n_0;
  wire rd_error1_carry_i_8_n_0;
  wire rd_error1_carry_n_0;
  wire rd_error1_carry_n_1;
  wire rd_error1_carry_n_2;
  wire rd_error1_carry_n_3;
  wire rd_error_i_1_n_0;
  wire rd_error_i_2_n_0;
  wire rd_valid_reg_0;
  wire record_valid;
  wire s_axi_aclk;
  wire [3:0]s_axi_araddr;
  wire [0:0]\s_axi_araddr[3] ;
  wire s_axi_aresetn;
  wire s_axi_arvalid;
  wire [0:0]s_axi_bresp;
  wire \s_axi_bresp[1]_i_12_n_0 ;
  wire \s_axi_bresp[1]_i_3_0 ;
  wire \s_axi_bresp[1]_i_3_1 ;
  wire \s_axi_bresp[1]_i_8_n_0 ;
  wire [1:0]\s_axi_bresp_reg[1] ;
  wire \s_axi_bresp_reg[1]_0 ;
  wire \s_axi_rdata[0]_i_2_n_0 ;
  wire \s_axi_rdata[0]_i_3_n_0 ;
  wire \s_axi_rdata[0]_i_4_n_0 ;
  wire \s_axi_rdata[0]_i_5_n_0 ;
  wire \s_axi_rdata[10]_i_2_n_0 ;
  wire \s_axi_rdata[11]_i_2_n_0 ;
  wire \s_axi_rdata[11]_i_3_n_0 ;
  wire \s_axi_rdata[11]_i_4_n_0 ;
  wire \s_axi_rdata[12]_i_2_n_0 ;
  wire \s_axi_rdata[12]_i_3_n_0 ;
  wire \s_axi_rdata[12]_i_4_n_0 ;
  wire \s_axi_rdata[13]_i_2_n_0 ;
  wire \s_axi_rdata[13]_i_3_n_0 ;
  wire \s_axi_rdata[13]_i_4_n_0 ;
  wire \s_axi_rdata[14]_i_2_n_0 ;
  wire \s_axi_rdata[14]_i_3_n_0 ;
  wire \s_axi_rdata[14]_i_4_n_0 ;
  wire \s_axi_rdata[15]_i_2_n_0 ;
  wire \s_axi_rdata[15]_i_3_n_0 ;
  wire \s_axi_rdata[15]_i_4_n_0 ;
  wire \s_axi_rdata[16]_i_2_n_0 ;
  wire \s_axi_rdata[16]_i_3_n_0 ;
  wire \s_axi_rdata[16]_i_4_n_0 ;
  wire \s_axi_rdata[17]_i_2_n_0 ;
  wire \s_axi_rdata[17]_i_3_n_0 ;
  wire \s_axi_rdata[17]_i_4_n_0 ;
  wire \s_axi_rdata[18]_i_2_n_0 ;
  wire \s_axi_rdata[18]_i_3_n_0 ;
  wire \s_axi_rdata[18]_i_4_n_0 ;
  wire \s_axi_rdata[19]_i_2_n_0 ;
  wire \s_axi_rdata[19]_i_3_n_0 ;
  wire \s_axi_rdata[19]_i_4_n_0 ;
  wire \s_axi_rdata[1]_i_3_n_0 ;
  wire \s_axi_rdata[1]_i_4_n_0 ;
  wire \s_axi_rdata[20]_i_2_n_0 ;
  wire \s_axi_rdata[20]_i_3_n_0 ;
  wire \s_axi_rdata[20]_i_4_n_0 ;
  wire \s_axi_rdata[21]_i_2_n_0 ;
  wire \s_axi_rdata[21]_i_3_n_0 ;
  wire \s_axi_rdata[21]_i_4_n_0 ;
  wire \s_axi_rdata[22]_i_2_n_0 ;
  wire \s_axi_rdata[22]_i_3_n_0 ;
  wire \s_axi_rdata[22]_i_4_n_0 ;
  wire \s_axi_rdata[23]_i_2_n_0 ;
  wire \s_axi_rdata[23]_i_3_n_0 ;
  wire \s_axi_rdata[23]_i_4_n_0 ;
  wire \s_axi_rdata[24]_i_2_n_0 ;
  wire \s_axi_rdata[24]_i_3_n_0 ;
  wire \s_axi_rdata[24]_i_4_n_0 ;
  wire \s_axi_rdata[25]_i_2_n_0 ;
  wire \s_axi_rdata[25]_i_3_n_0 ;
  wire \s_axi_rdata[25]_i_4_n_0 ;
  wire \s_axi_rdata[26]_i_2_n_0 ;
  wire \s_axi_rdata[26]_i_3_n_0 ;
  wire \s_axi_rdata[26]_i_4_n_0 ;
  wire \s_axi_rdata[27]_i_2_n_0 ;
  wire \s_axi_rdata[27]_i_3_n_0 ;
  wire \s_axi_rdata[27]_i_4_n_0 ;
  wire \s_axi_rdata[28]_i_2_n_0 ;
  wire \s_axi_rdata[28]_i_3_n_0 ;
  wire \s_axi_rdata[28]_i_4_n_0 ;
  wire \s_axi_rdata[29]_i_2_n_0 ;
  wire \s_axi_rdata[29]_i_3_n_0 ;
  wire \s_axi_rdata[29]_i_4_n_0 ;
  wire \s_axi_rdata[2]_i_2_n_0 ;
  wire \s_axi_rdata[2]_i_3_n_0 ;
  wire \s_axi_rdata[2]_i_4_n_0 ;
  wire \s_axi_rdata[30]_i_2_n_0 ;
  wire \s_axi_rdata[30]_i_3_n_0 ;
  wire \s_axi_rdata[30]_i_4_n_0 ;
  wire \s_axi_rdata[31]_i_10_n_0 ;
  wire \s_axi_rdata[31]_i_12_n_0 ;
  wire \s_axi_rdata[31]_i_5_n_0 ;
  wire \s_axi_rdata[31]_i_9_n_0 ;
  wire \s_axi_rdata[3]_i_2_n_0 ;
  wire \s_axi_rdata[3]_i_3_n_0 ;
  wire \s_axi_rdata[3]_i_4_n_0 ;
  wire \s_axi_rdata[4]_i_2_n_0 ;
  wire \s_axi_rdata[4]_i_3_n_0 ;
  wire \s_axi_rdata[4]_i_4_n_0 ;
  wire \s_axi_rdata[5]_i_2_n_0 ;
  wire \s_axi_rdata[5]_i_4_n_0 ;
  wire \s_axi_rdata[5]_i_5_n_0 ;
  wire \s_axi_rdata[6]_i_2_n_0 ;
  wire \s_axi_rdata[6]_i_3_n_0 ;
  wire \s_axi_rdata[6]_i_4_n_0 ;
  wire \s_axi_rdata[7]_i_2_n_0 ;
  wire \s_axi_rdata[7]_i_3_n_0 ;
  wire \s_axi_rdata[7]_i_4_n_0 ;
  wire \s_axi_rdata[8]_i_2_n_0 ;
  wire \s_axi_rdata[8]_i_3_n_0 ;
  wire \s_axi_rdata[8]_i_4_n_0 ;
  wire \s_axi_rdata[9]_i_2_n_0 ;
  wire \s_axi_rdata[9]_i_3_n_0 ;
  wire \s_axi_rdata[9]_i_4_n_0 ;
  wire \s_axi_rdata_reg[0] ;
  wire \s_axi_rdata_reg[0]_0 ;
  wire \s_axi_rdata_reg[0]_1 ;
  wire \s_axi_rdata_reg[0]_2 ;
  wire \s_axi_rdata_reg[10] ;
  wire \s_axi_rdata_reg[1] ;
  wire [29:0]\s_axi_rdata_reg[31] ;
  wire [29:0]\s_axi_rdata_reg[31]_0 ;
  wire \s_axi_rdata_reg[4] ;
  wire s_axi_rready;
  wire s_axi_rvalid_reg;
  wire sample_fire0;
  wire [1:0]sample_in;
  wire sample_memory_reg_0;
  wire sample_memory_reg_i_10_n_0;
  wire sample_memory_reg_i_11_n_0;
  wire sample_memory_reg_i_12_n_0;
  wire sample_memory_reg_i_13_n_0;
  wire sample_memory_reg_i_2_n_0;
  wire sample_memory_reg_i_3_n_0;
  wire sample_memory_reg_i_4_n_0;
  wire sample_memory_reg_i_5_n_0;
  wire sample_memory_reg_i_6_n_0;
  wire sample_memory_reg_i_7_n_0;
  wire sample_memory_reg_i_8_n_0;
  wire sample_memory_reg_i_9_n_0;
  wire \shadow_count_reg[24] ;
  wire shadow_wait;
  wire [1:0]soft_trigger_reg;
  wire trigger_in;
  wire trigger_seen;
  wire trigger_seen_i_1_n_0;
  wire trigger_sticky;
  wire trigger_sticky_0;
  wire \write_address_reg[3] ;
  wire \write_data_reg[1] ;
  wire \write_data_reg[2] ;
  wire [3:0]NLW_busy0_carry_O_UNCONNECTED;
  wire [3:0]NLW_busy0_carry__0_O_UNCONNECTED;
  wire [3:3]NLW_busy0_carry__1_CO_UNCONNECTED;
  wire [3:0]NLW_busy0_carry__1_O_UNCONNECTED;
  wire [3:2]NLW_busy0_carry__1_i_4_CO_UNCONNECTED;
  wire [3:3]NLW_busy0_carry__1_i_4_O_UNCONNECTED;
  wire [3:3]\NLW_captured_count_reg[28]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_interval_remaining_reg[28]_i_1_CO_UNCONNECTED ;
  wire [3:0]NLW_rd_error1_carry_O_UNCONNECTED;
  wire [3:0]NLW_rd_error1_carry__0_O_UNCONNECTED;
  wire [3:0]NLW_rd_error1_carry__1_O_UNCONNECTED;
  wire [3:0]NLW_rd_error1_carry__2_O_UNCONNECTED;
  wire [15:0]NLW_sample_memory_reg_DOADO_UNCONNECTED;
  wire [15:2]NLW_sample_memory_reg_DOBDO_UNCONNECTED;
  wire [1:0]NLW_sample_memory_reg_DOPADOP_UNCONNECTED;
  wire [1:0]NLW_sample_memory_reg_DOPBDOP_UNCONNECTED;

  LUT2 #(
    .INIT(4'hB)) 
    \active_interval_ticks[31]_i_1 
       (.I0(invalidate_in),
        .I1(s_axi_aresetn),
        .O(trigger_sticky_0));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \active_interval_ticks[31]_i_10 
       (.I0(\active_interval_ticks_reg[31]_0 [19]),
        .I1(\active_interval_ticks_reg[31]_0 [21]),
        .I2(\active_interval_ticks_reg[31]_0 [0]),
        .I3(\active_interval_ticks_reg[31]_0 [31]),
        .I4(\active_interval_ticks[31]_i_17_n_0 ),
        .O(\active_interval_ticks[31]_i_10_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \active_interval_ticks[31]_i_11 
       (.I0(\active_interval_ticks_reg[31]_0 [1]),
        .I1(\active_interval_ticks_reg[31]_0 [30]),
        .I2(\active_interval_ticks_reg[31]_0 [2]),
        .I3(\active_interval_ticks_reg[31]_0 [25]),
        .I4(\active_interval_ticks[31]_i_18_n_0 ),
        .O(\active_interval_ticks[31]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \active_interval_ticks[31]_i_12 
       (.I0(\active_sample_count_reg[31]_0 [6]),
        .I1(\active_sample_count_reg[31]_0 [0]),
        .I2(\active_sample_count_reg[31]_0 [1]),
        .I3(\active_sample_count_reg[31]_0 [9]),
        .I4(\active_sample_count_reg[31]_0 [2]),
        .I5(\active_sample_count_reg[31]_0 [4]),
        .O(\active_interval_ticks[31]_i_12_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \active_interval_ticks[31]_i_13 
       (.I0(\active_sample_count_reg[31]_0 [27]),
        .I1(\active_sample_count_reg[31]_0 [26]),
        .I2(\active_sample_count_reg[31]_0 [25]),
        .I3(\active_sample_count_reg[31]_0 [24]),
        .O(\active_interval_ticks[31]_i_13_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \active_interval_ticks[31]_i_14 
       (.I0(\active_sample_count_reg[31]_0 [22]),
        .I1(\active_sample_count_reg[31]_0 [23]),
        .I2(\active_sample_count_reg[31]_0 [20]),
        .I3(\active_sample_count_reg[31]_0 [21]),
        .I4(\active_interval_ticks[31]_i_19_n_0 ),
        .O(\active_interval_ticks[31]_i_14_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \active_interval_ticks[31]_i_15 
       (.I0(\active_interval_ticks_reg[31]_0 [23]),
        .I1(\active_interval_ticks_reg[31]_0 [17]),
        .I2(\active_interval_ticks_reg[31]_0 [14]),
        .I3(\active_interval_ticks_reg[31]_0 [4]),
        .O(\active_interval_ticks[31]_i_15_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \active_interval_ticks[31]_i_16 
       (.I0(\active_interval_ticks_reg[31]_0 [16]),
        .I1(\active_interval_ticks_reg[31]_0 [12]),
        .I2(\active_interval_ticks_reg[31]_0 [24]),
        .I3(\active_interval_ticks_reg[31]_0 [6]),
        .O(\active_interval_ticks[31]_i_16_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \active_interval_ticks[31]_i_17 
       (.I0(\active_interval_ticks_reg[31]_0 [22]),
        .I1(\active_interval_ticks_reg[31]_0 [10]),
        .I2(\active_interval_ticks_reg[31]_0 [15]),
        .I3(\active_interval_ticks_reg[31]_0 [9]),
        .O(\active_interval_ticks[31]_i_17_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \active_interval_ticks[31]_i_18 
       (.I0(\active_interval_ticks_reg[31]_0 [27]),
        .I1(\active_interval_ticks_reg[31]_0 [5]),
        .I2(\active_interval_ticks_reg[31]_0 [28]),
        .I3(\active_interval_ticks_reg[31]_0 [26]),
        .O(\active_interval_ticks[31]_i_18_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \active_interval_ticks[31]_i_19 
       (.I0(\active_sample_count_reg[31]_0 [19]),
        .I1(\active_sample_count_reg[31]_0 [18]),
        .I2(\active_sample_count_reg[31]_0 [17]),
        .I3(\active_sample_count_reg[31]_0 [16]),
        .O(\active_interval_ticks[31]_i_19_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000002002)) 
    \active_interval_ticks[31]_i_2 
       (.I0(\active_interval_ticks[31]_i_3_n_0 ),
        .I1(\active_interval_ticks[31]_i_4_n_0 ),
        .I2(\active_sample_count_reg[31]_0 [10]),
        .I3(\active_interval_ticks[31]_i_5_n_0 ),
        .I4(\active_interval_ticks[31]_i_6_n_0 ),
        .I5(\active_interval_ticks[31]_i_7_n_0 ),
        .O(\active_interval_ticks[31]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000020000)) 
    \active_interval_ticks[31]_i_3 
       (.I0(arm_valid_reg_0),
        .I1(busy),
        .I2(armed),
        .I3(\captured_count_reg[0]_0 ),
        .I4(s_axi_aresetn),
        .I5(invalidate_in),
        .O(\active_interval_ticks[31]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h0004)) 
    \active_interval_ticks[31]_i_4 
       (.I0(\active_interval_ticks[31]_i_8_n_0 ),
        .I1(\active_interval_ticks[31]_i_9_n_0 ),
        .I2(\active_interval_ticks[31]_i_10_n_0 ),
        .I3(\active_interval_ticks[31]_i_11_n_0 ),
        .O(\active_interval_ticks[31]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h00000001)) 
    \active_interval_ticks[31]_i_5 
       (.I0(\active_sample_count_reg[31]_0 [5]),
        .I1(\active_sample_count_reg[31]_0 [7]),
        .I2(\active_sample_count_reg[31]_0 [3]),
        .I3(\active_sample_count_reg[31]_0 [8]),
        .I4(\active_interval_ticks[31]_i_12_n_0 ),
        .O(\active_interval_ticks[31]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \active_interval_ticks[31]_i_6 
       (.I0(\active_sample_count_reg[31]_0 [11]),
        .I1(\active_sample_count_reg[31]_0 [14]),
        .I2(\active_sample_count_reg[31]_0 [15]),
        .I3(\active_sample_count_reg[31]_0 [12]),
        .I4(\active_sample_count_reg[31]_0 [13]),
        .O(\active_interval_ticks[31]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \active_interval_ticks[31]_i_7 
       (.I0(\active_interval_ticks[31]_i_13_n_0 ),
        .I1(\active_sample_count_reg[31]_0 [30]),
        .I2(\active_sample_count_reg[31]_0 [31]),
        .I3(\active_sample_count_reg[31]_0 [29]),
        .I4(\active_sample_count_reg[31]_0 [28]),
        .I5(\active_interval_ticks[31]_i_14_n_0 ),
        .O(\active_interval_ticks[31]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \active_interval_ticks[31]_i_8 
       (.I0(\active_interval_ticks_reg[31]_0 [7]),
        .I1(\active_interval_ticks_reg[31]_0 [11]),
        .I2(\active_interval_ticks_reg[31]_0 [8]),
        .I3(\active_interval_ticks_reg[31]_0 [13]),
        .I4(\active_interval_ticks[31]_i_15_n_0 ),
        .O(\active_interval_ticks[31]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'h00000001)) 
    \active_interval_ticks[31]_i_9 
       (.I0(\active_interval_ticks_reg[31]_0 [3]),
        .I1(\active_interval_ticks_reg[31]_0 [29]),
        .I2(\active_interval_ticks_reg[31]_0 [18]),
        .I3(\active_interval_ticks_reg[31]_0 [20]),
        .I4(\active_interval_ticks[31]_i_16_n_0 ),
        .O(\active_interval_ticks[31]_i_9_n_0 ));
  FDRE \active_interval_ticks_reg[0] 
       (.C(s_axi_aclk),
        .CE(\active_interval_ticks[31]_i_2_n_0 ),
        .D(\active_interval_ticks_reg[31]_0 [0]),
        .Q(active_interval_ticks[0]),
        .R(trigger_sticky_0));
  FDRE \active_interval_ticks_reg[10] 
       (.C(s_axi_aclk),
        .CE(\active_interval_ticks[31]_i_2_n_0 ),
        .D(\active_interval_ticks_reg[31]_0 [10]),
        .Q(active_interval_ticks[10]),
        .R(trigger_sticky_0));
  FDRE \active_interval_ticks_reg[11] 
       (.C(s_axi_aclk),
        .CE(\active_interval_ticks[31]_i_2_n_0 ),
        .D(\active_interval_ticks_reg[31]_0 [11]),
        .Q(active_interval_ticks[11]),
        .R(trigger_sticky_0));
  FDRE \active_interval_ticks_reg[12] 
       (.C(s_axi_aclk),
        .CE(\active_interval_ticks[31]_i_2_n_0 ),
        .D(\active_interval_ticks_reg[31]_0 [12]),
        .Q(active_interval_ticks[12]),
        .R(trigger_sticky_0));
  FDRE \active_interval_ticks_reg[13] 
       (.C(s_axi_aclk),
        .CE(\active_interval_ticks[31]_i_2_n_0 ),
        .D(\active_interval_ticks_reg[31]_0 [13]),
        .Q(active_interval_ticks[13]),
        .R(trigger_sticky_0));
  FDRE \active_interval_ticks_reg[14] 
       (.C(s_axi_aclk),
        .CE(\active_interval_ticks[31]_i_2_n_0 ),
        .D(\active_interval_ticks_reg[31]_0 [14]),
        .Q(active_interval_ticks[14]),
        .R(trigger_sticky_0));
  FDRE \active_interval_ticks_reg[15] 
       (.C(s_axi_aclk),
        .CE(\active_interval_ticks[31]_i_2_n_0 ),
        .D(\active_interval_ticks_reg[31]_0 [15]),
        .Q(active_interval_ticks[15]),
        .R(trigger_sticky_0));
  FDRE \active_interval_ticks_reg[16] 
       (.C(s_axi_aclk),
        .CE(\active_interval_ticks[31]_i_2_n_0 ),
        .D(\active_interval_ticks_reg[31]_0 [16]),
        .Q(active_interval_ticks[16]),
        .R(trigger_sticky_0));
  FDRE \active_interval_ticks_reg[17] 
       (.C(s_axi_aclk),
        .CE(\active_interval_ticks[31]_i_2_n_0 ),
        .D(\active_interval_ticks_reg[31]_0 [17]),
        .Q(active_interval_ticks[17]),
        .R(trigger_sticky_0));
  FDRE \active_interval_ticks_reg[18] 
       (.C(s_axi_aclk),
        .CE(\active_interval_ticks[31]_i_2_n_0 ),
        .D(\active_interval_ticks_reg[31]_0 [18]),
        .Q(active_interval_ticks[18]),
        .R(trigger_sticky_0));
  FDRE \active_interval_ticks_reg[19] 
       (.C(s_axi_aclk),
        .CE(\active_interval_ticks[31]_i_2_n_0 ),
        .D(\active_interval_ticks_reg[31]_0 [19]),
        .Q(active_interval_ticks[19]),
        .R(trigger_sticky_0));
  FDRE \active_interval_ticks_reg[1] 
       (.C(s_axi_aclk),
        .CE(\active_interval_ticks[31]_i_2_n_0 ),
        .D(\active_interval_ticks_reg[31]_0 [1]),
        .Q(active_interval_ticks[1]),
        .R(trigger_sticky_0));
  FDRE \active_interval_ticks_reg[20] 
       (.C(s_axi_aclk),
        .CE(\active_interval_ticks[31]_i_2_n_0 ),
        .D(\active_interval_ticks_reg[31]_0 [20]),
        .Q(active_interval_ticks[20]),
        .R(trigger_sticky_0));
  FDRE \active_interval_ticks_reg[21] 
       (.C(s_axi_aclk),
        .CE(\active_interval_ticks[31]_i_2_n_0 ),
        .D(\active_interval_ticks_reg[31]_0 [21]),
        .Q(active_interval_ticks[21]),
        .R(trigger_sticky_0));
  FDRE \active_interval_ticks_reg[22] 
       (.C(s_axi_aclk),
        .CE(\active_interval_ticks[31]_i_2_n_0 ),
        .D(\active_interval_ticks_reg[31]_0 [22]),
        .Q(active_interval_ticks[22]),
        .R(trigger_sticky_0));
  FDRE \active_interval_ticks_reg[23] 
       (.C(s_axi_aclk),
        .CE(\active_interval_ticks[31]_i_2_n_0 ),
        .D(\active_interval_ticks_reg[31]_0 [23]),
        .Q(active_interval_ticks[23]),
        .R(trigger_sticky_0));
  FDRE \active_interval_ticks_reg[24] 
       (.C(s_axi_aclk),
        .CE(\active_interval_ticks[31]_i_2_n_0 ),
        .D(\active_interval_ticks_reg[31]_0 [24]),
        .Q(active_interval_ticks[24]),
        .R(trigger_sticky_0));
  FDRE \active_interval_ticks_reg[25] 
       (.C(s_axi_aclk),
        .CE(\active_interval_ticks[31]_i_2_n_0 ),
        .D(\active_interval_ticks_reg[31]_0 [25]),
        .Q(active_interval_ticks[25]),
        .R(trigger_sticky_0));
  FDRE \active_interval_ticks_reg[26] 
       (.C(s_axi_aclk),
        .CE(\active_interval_ticks[31]_i_2_n_0 ),
        .D(\active_interval_ticks_reg[31]_0 [26]),
        .Q(active_interval_ticks[26]),
        .R(trigger_sticky_0));
  FDRE \active_interval_ticks_reg[27] 
       (.C(s_axi_aclk),
        .CE(\active_interval_ticks[31]_i_2_n_0 ),
        .D(\active_interval_ticks_reg[31]_0 [27]),
        .Q(active_interval_ticks[27]),
        .R(trigger_sticky_0));
  FDRE \active_interval_ticks_reg[28] 
       (.C(s_axi_aclk),
        .CE(\active_interval_ticks[31]_i_2_n_0 ),
        .D(\active_interval_ticks_reg[31]_0 [28]),
        .Q(active_interval_ticks[28]),
        .R(trigger_sticky_0));
  FDRE \active_interval_ticks_reg[29] 
       (.C(s_axi_aclk),
        .CE(\active_interval_ticks[31]_i_2_n_0 ),
        .D(\active_interval_ticks_reg[31]_0 [29]),
        .Q(active_interval_ticks[29]),
        .R(trigger_sticky_0));
  FDRE \active_interval_ticks_reg[2] 
       (.C(s_axi_aclk),
        .CE(\active_interval_ticks[31]_i_2_n_0 ),
        .D(\active_interval_ticks_reg[31]_0 [2]),
        .Q(active_interval_ticks[2]),
        .R(trigger_sticky_0));
  FDRE \active_interval_ticks_reg[30] 
       (.C(s_axi_aclk),
        .CE(\active_interval_ticks[31]_i_2_n_0 ),
        .D(\active_interval_ticks_reg[31]_0 [30]),
        .Q(active_interval_ticks[30]),
        .R(trigger_sticky_0));
  FDRE \active_interval_ticks_reg[31] 
       (.C(s_axi_aclk),
        .CE(\active_interval_ticks[31]_i_2_n_0 ),
        .D(\active_interval_ticks_reg[31]_0 [31]),
        .Q(active_interval_ticks[31]),
        .R(trigger_sticky_0));
  FDRE \active_interval_ticks_reg[3] 
       (.C(s_axi_aclk),
        .CE(\active_interval_ticks[31]_i_2_n_0 ),
        .D(\active_interval_ticks_reg[31]_0 [3]),
        .Q(active_interval_ticks[3]),
        .R(trigger_sticky_0));
  FDRE \active_interval_ticks_reg[4] 
       (.C(s_axi_aclk),
        .CE(\active_interval_ticks[31]_i_2_n_0 ),
        .D(\active_interval_ticks_reg[31]_0 [4]),
        .Q(active_interval_ticks[4]),
        .R(trigger_sticky_0));
  FDRE \active_interval_ticks_reg[5] 
       (.C(s_axi_aclk),
        .CE(\active_interval_ticks[31]_i_2_n_0 ),
        .D(\active_interval_ticks_reg[31]_0 [5]),
        .Q(active_interval_ticks[5]),
        .R(trigger_sticky_0));
  FDRE \active_interval_ticks_reg[6] 
       (.C(s_axi_aclk),
        .CE(\active_interval_ticks[31]_i_2_n_0 ),
        .D(\active_interval_ticks_reg[31]_0 [6]),
        .Q(active_interval_ticks[6]),
        .R(trigger_sticky_0));
  FDRE \active_interval_ticks_reg[7] 
       (.C(s_axi_aclk),
        .CE(\active_interval_ticks[31]_i_2_n_0 ),
        .D(\active_interval_ticks_reg[31]_0 [7]),
        .Q(active_interval_ticks[7]),
        .R(trigger_sticky_0));
  FDRE \active_interval_ticks_reg[8] 
       (.C(s_axi_aclk),
        .CE(\active_interval_ticks[31]_i_2_n_0 ),
        .D(\active_interval_ticks_reg[31]_0 [8]),
        .Q(active_interval_ticks[8]),
        .R(trigger_sticky_0));
  FDRE \active_interval_ticks_reg[9] 
       (.C(s_axi_aclk),
        .CE(\active_interval_ticks[31]_i_2_n_0 ),
        .D(\active_interval_ticks_reg[31]_0 [9]),
        .Q(active_interval_ticks[9]),
        .R(trigger_sticky_0));
  FDRE \active_sample_count_reg[0] 
       (.C(s_axi_aclk),
        .CE(\active_interval_ticks[31]_i_2_n_0 ),
        .D(\active_sample_count_reg[31]_0 [0]),
        .Q(active_sample_count[0]),
        .R(trigger_sticky_0));
  FDRE \active_sample_count_reg[10] 
       (.C(s_axi_aclk),
        .CE(\active_interval_ticks[31]_i_2_n_0 ),
        .D(\active_sample_count_reg[31]_0 [10]),
        .Q(active_sample_count[10]),
        .R(trigger_sticky_0));
  FDRE \active_sample_count_reg[11] 
       (.C(s_axi_aclk),
        .CE(\active_interval_ticks[31]_i_2_n_0 ),
        .D(\active_sample_count_reg[31]_0 [11]),
        .Q(active_sample_count[11]),
        .R(trigger_sticky_0));
  FDRE \active_sample_count_reg[12] 
       (.C(s_axi_aclk),
        .CE(\active_interval_ticks[31]_i_2_n_0 ),
        .D(\active_sample_count_reg[31]_0 [12]),
        .Q(active_sample_count[12]),
        .R(trigger_sticky_0));
  FDRE \active_sample_count_reg[13] 
       (.C(s_axi_aclk),
        .CE(\active_interval_ticks[31]_i_2_n_0 ),
        .D(\active_sample_count_reg[31]_0 [13]),
        .Q(active_sample_count[13]),
        .R(trigger_sticky_0));
  FDRE \active_sample_count_reg[14] 
       (.C(s_axi_aclk),
        .CE(\active_interval_ticks[31]_i_2_n_0 ),
        .D(\active_sample_count_reg[31]_0 [14]),
        .Q(active_sample_count[14]),
        .R(trigger_sticky_0));
  FDRE \active_sample_count_reg[15] 
       (.C(s_axi_aclk),
        .CE(\active_interval_ticks[31]_i_2_n_0 ),
        .D(\active_sample_count_reg[31]_0 [15]),
        .Q(active_sample_count[15]),
        .R(trigger_sticky_0));
  FDRE \active_sample_count_reg[16] 
       (.C(s_axi_aclk),
        .CE(\active_interval_ticks[31]_i_2_n_0 ),
        .D(\active_sample_count_reg[31]_0 [16]),
        .Q(active_sample_count[16]),
        .R(trigger_sticky_0));
  FDRE \active_sample_count_reg[17] 
       (.C(s_axi_aclk),
        .CE(\active_interval_ticks[31]_i_2_n_0 ),
        .D(\active_sample_count_reg[31]_0 [17]),
        .Q(active_sample_count[17]),
        .R(trigger_sticky_0));
  FDRE \active_sample_count_reg[18] 
       (.C(s_axi_aclk),
        .CE(\active_interval_ticks[31]_i_2_n_0 ),
        .D(\active_sample_count_reg[31]_0 [18]),
        .Q(active_sample_count[18]),
        .R(trigger_sticky_0));
  FDRE \active_sample_count_reg[19] 
       (.C(s_axi_aclk),
        .CE(\active_interval_ticks[31]_i_2_n_0 ),
        .D(\active_sample_count_reg[31]_0 [19]),
        .Q(active_sample_count[19]),
        .R(trigger_sticky_0));
  FDRE \active_sample_count_reg[1] 
       (.C(s_axi_aclk),
        .CE(\active_interval_ticks[31]_i_2_n_0 ),
        .D(\active_sample_count_reg[31]_0 [1]),
        .Q(active_sample_count[1]),
        .R(trigger_sticky_0));
  FDRE \active_sample_count_reg[20] 
       (.C(s_axi_aclk),
        .CE(\active_interval_ticks[31]_i_2_n_0 ),
        .D(\active_sample_count_reg[31]_0 [20]),
        .Q(active_sample_count[20]),
        .R(trigger_sticky_0));
  FDRE \active_sample_count_reg[21] 
       (.C(s_axi_aclk),
        .CE(\active_interval_ticks[31]_i_2_n_0 ),
        .D(\active_sample_count_reg[31]_0 [21]),
        .Q(active_sample_count[21]),
        .R(trigger_sticky_0));
  FDRE \active_sample_count_reg[22] 
       (.C(s_axi_aclk),
        .CE(\active_interval_ticks[31]_i_2_n_0 ),
        .D(\active_sample_count_reg[31]_0 [22]),
        .Q(active_sample_count[22]),
        .R(trigger_sticky_0));
  FDRE \active_sample_count_reg[23] 
       (.C(s_axi_aclk),
        .CE(\active_interval_ticks[31]_i_2_n_0 ),
        .D(\active_sample_count_reg[31]_0 [23]),
        .Q(active_sample_count[23]),
        .R(trigger_sticky_0));
  FDRE \active_sample_count_reg[24] 
       (.C(s_axi_aclk),
        .CE(\active_interval_ticks[31]_i_2_n_0 ),
        .D(\active_sample_count_reg[31]_0 [24]),
        .Q(active_sample_count[24]),
        .R(trigger_sticky_0));
  FDRE \active_sample_count_reg[25] 
       (.C(s_axi_aclk),
        .CE(\active_interval_ticks[31]_i_2_n_0 ),
        .D(\active_sample_count_reg[31]_0 [25]),
        .Q(active_sample_count[25]),
        .R(trigger_sticky_0));
  FDRE \active_sample_count_reg[26] 
       (.C(s_axi_aclk),
        .CE(\active_interval_ticks[31]_i_2_n_0 ),
        .D(\active_sample_count_reg[31]_0 [26]),
        .Q(active_sample_count[26]),
        .R(trigger_sticky_0));
  FDRE \active_sample_count_reg[27] 
       (.C(s_axi_aclk),
        .CE(\active_interval_ticks[31]_i_2_n_0 ),
        .D(\active_sample_count_reg[31]_0 [27]),
        .Q(active_sample_count[27]),
        .R(trigger_sticky_0));
  FDRE \active_sample_count_reg[28] 
       (.C(s_axi_aclk),
        .CE(\active_interval_ticks[31]_i_2_n_0 ),
        .D(\active_sample_count_reg[31]_0 [28]),
        .Q(active_sample_count[28]),
        .R(trigger_sticky_0));
  FDRE \active_sample_count_reg[29] 
       (.C(s_axi_aclk),
        .CE(\active_interval_ticks[31]_i_2_n_0 ),
        .D(\active_sample_count_reg[31]_0 [29]),
        .Q(active_sample_count[29]),
        .R(trigger_sticky_0));
  FDRE \active_sample_count_reg[2] 
       (.C(s_axi_aclk),
        .CE(\active_interval_ticks[31]_i_2_n_0 ),
        .D(\active_sample_count_reg[31]_0 [2]),
        .Q(active_sample_count[2]),
        .R(trigger_sticky_0));
  FDRE \active_sample_count_reg[30] 
       (.C(s_axi_aclk),
        .CE(\active_interval_ticks[31]_i_2_n_0 ),
        .D(\active_sample_count_reg[31]_0 [30]),
        .Q(active_sample_count[30]),
        .R(trigger_sticky_0));
  FDRE \active_sample_count_reg[31] 
       (.C(s_axi_aclk),
        .CE(\active_interval_ticks[31]_i_2_n_0 ),
        .D(\active_sample_count_reg[31]_0 [31]),
        .Q(active_sample_count[31]),
        .R(trigger_sticky_0));
  FDRE \active_sample_count_reg[3] 
       (.C(s_axi_aclk),
        .CE(\active_interval_ticks[31]_i_2_n_0 ),
        .D(\active_sample_count_reg[31]_0 [3]),
        .Q(active_sample_count[3]),
        .R(trigger_sticky_0));
  FDRE \active_sample_count_reg[4] 
       (.C(s_axi_aclk),
        .CE(\active_interval_ticks[31]_i_2_n_0 ),
        .D(\active_sample_count_reg[31]_0 [4]),
        .Q(active_sample_count[4]),
        .R(trigger_sticky_0));
  FDRE \active_sample_count_reg[5] 
       (.C(s_axi_aclk),
        .CE(\active_interval_ticks[31]_i_2_n_0 ),
        .D(\active_sample_count_reg[31]_0 [5]),
        .Q(active_sample_count[5]),
        .R(trigger_sticky_0));
  FDRE \active_sample_count_reg[6] 
       (.C(s_axi_aclk),
        .CE(\active_interval_ticks[31]_i_2_n_0 ),
        .D(\active_sample_count_reg[31]_0 [6]),
        .Q(active_sample_count[6]),
        .R(trigger_sticky_0));
  FDRE \active_sample_count_reg[7] 
       (.C(s_axi_aclk),
        .CE(\active_interval_ticks[31]_i_2_n_0 ),
        .D(\active_sample_count_reg[31]_0 [7]),
        .Q(active_sample_count[7]),
        .R(trigger_sticky_0));
  FDRE \active_sample_count_reg[8] 
       (.C(s_axi_aclk),
        .CE(\active_interval_ticks[31]_i_2_n_0 ),
        .D(\active_sample_count_reg[31]_0 [8]),
        .Q(active_sample_count[8]),
        .R(trigger_sticky_0));
  FDRE \active_sample_count_reg[9] 
       (.C(s_axi_aclk),
        .CE(\active_interval_ticks[31]_i_2_n_0 ),
        .D(\active_sample_count_reg[31]_0 [9]),
        .Q(active_sample_count[9]),
        .R(trigger_sticky_0));
  LUT6 #(
    .INIT(64'h0000000000000100)) 
    \arm_interval[31]_i_1 
       (.I0(arm_wait_reg),
        .I1(arm_wait_reg_0),
        .I2(\arm_interval[31]_i_4_n_0 ),
        .I3(arm_wait_reg_1),
        .I4(arm_wait_reg_2),
        .I5(arm_wait_reg_3),
        .O(E));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \arm_interval[31]_i_4 
       (.I0(arm_valid_reg_2),
        .I1(arm_wait_reg_4),
        .I2(trigger_sticky_0),
        .I3(\captured_count_reg[0]_0 ),
        .I4(armed),
        .I5(busy),
        .O(\arm_interval[31]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hABBBBBBBA8888888)) 
    arm_valid_i_1
       (.I0(E),
        .I1(\active_interval_ticks[31]_i_3_n_0 ),
        .I2(arm_valid_reg_3),
        .I3(arm_valid_reg_4),
        .I4(\shadow_count_reg[24] ),
        .I5(arm_valid_reg_0),
        .O(arm_valid_reg));
  LUT6 #(
    .INIT(64'h00000000FE020202)) 
    armed_i_1
       (.I0(armed),
        .I1(\active_interval_ticks[31]_i_2_n_0 ),
        .I2(armed7_out),
        .I3(busy_reg_0),
        .I4(\active_interval_ticks[31]_i_3_n_0 ),
        .I5(armed_i_2_n_0),
        .O(armed_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hFFFDDDDD)) 
    armed_i_2
       (.I0(s_axi_aresetn),
        .I1(invalidate_in),
        .I2(busy),
        .I3(armed),
        .I4(\captured_count_reg[0]_0 ),
        .O(armed_i_2_n_0));
  FDRE armed_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(armed_i_1_n_0),
        .Q(armed),
        .R(1'b0));
  CARRY4 busy0_carry
       (.CI(1'b0),
        .CO({busy0_carry_n_0,busy0_carry_n_1,busy0_carry_n_2,busy0_carry_n_3}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_busy0_carry_O_UNCONNECTED[3:0]),
        .S({busy0_carry_i_1_n_0,busy0_carry_i_2_n_0,busy0_carry_i_3_n_0,busy0_carry_i_4_n_0}));
  CARRY4 busy0_carry__0
       (.CI(busy0_carry_n_0),
        .CO({busy0_carry__0_n_0,busy0_carry__0_n_1,busy0_carry__0_n_2,busy0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_busy0_carry__0_O_UNCONNECTED[3:0]),
        .S({busy0_carry__0_i_1_n_0,busy0_carry__0_i_2_n_0,busy0_carry__0_i_3_n_0,busy0_carry__0_i_4_n_0}));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    busy0_carry__0_i_1
       (.I0(active_sample_count[23]),
        .I1(p_0_in[23]),
        .I2(p_0_in[22]),
        .I3(active_sample_count[22]),
        .I4(p_0_in[21]),
        .I5(active_sample_count[21]),
        .O(busy0_carry__0_i_1_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    busy0_carry__0_i_2
       (.I0(active_sample_count[20]),
        .I1(p_0_in[20]),
        .I2(p_0_in[18]),
        .I3(active_sample_count[18]),
        .I4(p_0_in[19]),
        .I5(active_sample_count[19]),
        .O(busy0_carry__0_i_2_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    busy0_carry__0_i_3
       (.I0(active_sample_count[17]),
        .I1(p_0_in[17]),
        .I2(p_0_in[15]),
        .I3(active_sample_count[15]),
        .I4(p_0_in[16]),
        .I5(active_sample_count[16]),
        .O(busy0_carry__0_i_3_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    busy0_carry__0_i_4
       (.I0(active_sample_count[14]),
        .I1(p_0_in[14]),
        .I2(p_0_in[12]),
        .I3(active_sample_count[12]),
        .I4(p_0_in[13]),
        .I5(active_sample_count[13]),
        .O(busy0_carry__0_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 busy0_carry__0_i_5
       (.CI(busy0_carry__0_i_6_n_0),
        .CO({busy0_carry__0_i_5_n_0,busy0_carry__0_i_5_n_1,busy0_carry__0_i_5_n_2,busy0_carry__0_i_5_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_0_in[24:21]),
        .S(captured_count_reg[24:21]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 busy0_carry__0_i_6
       (.CI(busy0_carry__0_i_7_n_0),
        .CO({busy0_carry__0_i_6_n_0,busy0_carry__0_i_6_n_1,busy0_carry__0_i_6_n_2,busy0_carry__0_i_6_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_0_in[20:17]),
        .S(captured_count_reg[20:17]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 busy0_carry__0_i_7
       (.CI(busy0_carry_i_5_n_0),
        .CO({busy0_carry__0_i_7_n_0,busy0_carry__0_i_7_n_1,busy0_carry__0_i_7_n_2,busy0_carry__0_i_7_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_0_in[16:13]),
        .S(captured_count_reg[16:13]));
  CARRY4 busy0_carry__1
       (.CI(busy0_carry__0_n_0),
        .CO({NLW_busy0_carry__1_CO_UNCONNECTED[3],busy0,busy0_carry__1_n_2,busy0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_busy0_carry__1_O_UNCONNECTED[3:0]),
        .S({1'b0,busy0_carry__1_i_1_n_0,busy0_carry__1_i_2_n_0,busy0_carry__1_i_3_n_0}));
  LUT4 #(
    .INIT(16'h9009)) 
    busy0_carry__1_i_1
       (.I0(active_sample_count[31]),
        .I1(p_0_in[31]),
        .I2(active_sample_count[30]),
        .I3(p_0_in[30]),
        .O(busy0_carry__1_i_1_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    busy0_carry__1_i_2
       (.I0(active_sample_count[29]),
        .I1(p_0_in[29]),
        .I2(p_0_in[27]),
        .I3(active_sample_count[27]),
        .I4(p_0_in[28]),
        .I5(active_sample_count[28]),
        .O(busy0_carry__1_i_2_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    busy0_carry__1_i_3
       (.I0(active_sample_count[26]),
        .I1(p_0_in[26]),
        .I2(p_0_in[24]),
        .I3(active_sample_count[24]),
        .I4(p_0_in[25]),
        .I5(active_sample_count[25]),
        .O(busy0_carry__1_i_3_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 busy0_carry__1_i_4
       (.CI(busy0_carry__1_i_5_n_0),
        .CO({NLW_busy0_carry__1_i_4_CO_UNCONNECTED[3:2],busy0_carry__1_i_4_n_2,busy0_carry__1_i_4_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_busy0_carry__1_i_4_O_UNCONNECTED[3],p_0_in[31:29]}),
        .S({1'b0,captured_count_reg[31:29]}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 busy0_carry__1_i_5
       (.CI(busy0_carry__0_i_5_n_0),
        .CO({busy0_carry__1_i_5_n_0,busy0_carry__1_i_5_n_1,busy0_carry__1_i_5_n_2,busy0_carry__1_i_5_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_0_in[28:25]),
        .S(captured_count_reg[28:25]));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    busy0_carry_i_1
       (.I0(active_sample_count[11]),
        .I1(p_0_in[11]),
        .I2(p_0_in[9]),
        .I3(active_sample_count[9]),
        .I4(p_0_in[10]),
        .I5(active_sample_count[10]),
        .O(busy0_carry_i_1_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    busy0_carry_i_2
       (.I0(active_sample_count[8]),
        .I1(p_0_in[8]),
        .I2(p_0_in[7]),
        .I3(active_sample_count[7]),
        .I4(p_0_in[6]),
        .I5(active_sample_count[6]),
        .O(busy0_carry_i_2_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    busy0_carry_i_3
       (.I0(active_sample_count[5]),
        .I1(p_0_in[5]),
        .I2(p_0_in[4]),
        .I3(active_sample_count[4]),
        .I4(p_0_in[3]),
        .I5(active_sample_count[3]),
        .O(busy0_carry_i_3_n_0));
  LUT6 #(
    .INIT(64'h6006000000006006)) 
    busy0_carry_i_4
       (.I0(captured_count[0]),
        .I1(active_sample_count[0]),
        .I2(p_0_in[2]),
        .I3(active_sample_count[2]),
        .I4(p_0_in[1]),
        .I5(active_sample_count[1]),
        .O(busy0_carry_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 busy0_carry_i_5
       (.CI(busy0_carry_i_6_n_0),
        .CO({busy0_carry_i_5_n_0,busy0_carry_i_5_n_1,busy0_carry_i_5_n_2,busy0_carry_i_5_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_0_in[12:9]),
        .S({captured_count_reg[12:10],captured_count[9]}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 busy0_carry_i_6
       (.CI(busy0_carry_i_7_n_0),
        .CO({busy0_carry_i_6_n_0,busy0_carry_i_6_n_1,busy0_carry_i_6_n_2,busy0_carry_i_6_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_0_in[8:5]),
        .S(captured_count[8:5]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 busy0_carry_i_7
       (.CI(1'b0),
        .CO({busy0_carry_i_7_n_0,busy0_carry_i_7_n_1,busy0_carry_i_7_n_2,busy0_carry_i_7_n_3}),
        .CYINIT(captured_count[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_0_in[4:1]),
        .S(captured_count[4:1]));
  LUT6 #(
    .INIT(64'h0000151055551510)) 
    busy_i_1
       (.I0(armed_i_2_n_0),
        .I1(busy_reg_0),
        .I2(\active_interval_ticks[31]_i_2_n_0 ),
        .I3(busy),
        .I4(armed7_out),
        .I5(busy0),
        .O(busy_i_1_n_0));
  FDRE busy_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(busy_i_1_n_0),
        .Q(busy),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0000000040000000)) 
    cancel_pulse_i_1
       (.I0(cancel_pulse_reg),
        .I1(soft_trigger_reg[0]),
        .I2(cancel_pulse_reg_0),
        .I3(\shadow_count_reg[24] ),
        .I4(address_pending0),
        .I5(trigger_sticky_0),
        .O(\write_data_reg[1] ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hA8)) 
    cancelled_i_1
       (.I0(\captured_count_reg[0]_0 ),
        .I1(armed),
        .I2(busy),
        .O(cancelled_i_1_n_0));
  FDRE cancelled_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(cancelled_i_1_n_0),
        .Q(cancelled),
        .R(trigger_sticky_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    capture_active_INST_0
       (.I0(capture_active_0),
        .I1(memory_pending_reg_0),
        .I2(busy),
        .I3(armed),
        .I4(arm_valid_reg_0),
        .O(capture_active));
  LUT3 #(
    .INIT(8'hFD)) 
    \captured_count[0]_i_1 
       (.I0(s_axi_aresetn),
        .I1(invalidate_in),
        .I2(\active_interval_ticks[31]_i_2_n_0 ),
        .O(\captured_count[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h1111111100000010)) 
    \captured_count[0]_i_2 
       (.I0(trigger_sticky_0),
        .I1(\captured_count_reg[0]_0 ),
        .I2(sample_memory_reg_i_7_n_0),
        .I3(sample_memory_reg_i_6_n_0),
        .I4(sample_memory_reg_i_5_n_0),
        .I5(\captured_count[0]_i_4_n_0 ),
        .O(armed7_out));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hA8)) 
    \captured_count[0]_i_4 
       (.I0(armed),
        .I1(trigger_in),
        .I2(sample_memory_reg_0),
        .O(\captured_count[0]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \captured_count[0]_i_5 
       (.I0(captured_count[0]),
        .O(p_0_in[0]));
  FDRE \captured_count_reg[0] 
       (.C(s_axi_aclk),
        .CE(armed7_out),
        .D(\captured_count_reg[0]_i_3_n_7 ),
        .Q(captured_count[0]),
        .R(\captured_count[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \captured_count_reg[0]_i_3 
       (.CI(1'b0),
        .CO({\captured_count_reg[0]_i_3_n_0 ,\captured_count_reg[0]_i_3_n_1 ,\captured_count_reg[0]_i_3_n_2 ,\captured_count_reg[0]_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\captured_count_reg[0]_i_3_n_4 ,\captured_count_reg[0]_i_3_n_5 ,\captured_count_reg[0]_i_3_n_6 ,\captured_count_reg[0]_i_3_n_7 }),
        .S({captured_count[3:1],p_0_in[0]}));
  FDRE \captured_count_reg[10] 
       (.C(s_axi_aclk),
        .CE(armed7_out),
        .D(\captured_count_reg[8]_i_1_n_5 ),
        .Q(captured_count_reg[10]),
        .R(\captured_count[0]_i_1_n_0 ));
  FDRE \captured_count_reg[11] 
       (.C(s_axi_aclk),
        .CE(armed7_out),
        .D(\captured_count_reg[8]_i_1_n_4 ),
        .Q(captured_count_reg[11]),
        .R(\captured_count[0]_i_1_n_0 ));
  FDRE \captured_count_reg[12] 
       (.C(s_axi_aclk),
        .CE(armed7_out),
        .D(\captured_count_reg[12]_i_1_n_7 ),
        .Q(captured_count_reg[12]),
        .R(\captured_count[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \captured_count_reg[12]_i_1 
       (.CI(\captured_count_reg[8]_i_1_n_0 ),
        .CO({\captured_count_reg[12]_i_1_n_0 ,\captured_count_reg[12]_i_1_n_1 ,\captured_count_reg[12]_i_1_n_2 ,\captured_count_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\captured_count_reg[12]_i_1_n_4 ,\captured_count_reg[12]_i_1_n_5 ,\captured_count_reg[12]_i_1_n_6 ,\captured_count_reg[12]_i_1_n_7 }),
        .S(captured_count_reg[15:12]));
  FDRE \captured_count_reg[13] 
       (.C(s_axi_aclk),
        .CE(armed7_out),
        .D(\captured_count_reg[12]_i_1_n_6 ),
        .Q(captured_count_reg[13]),
        .R(\captured_count[0]_i_1_n_0 ));
  FDRE \captured_count_reg[14] 
       (.C(s_axi_aclk),
        .CE(armed7_out),
        .D(\captured_count_reg[12]_i_1_n_5 ),
        .Q(captured_count_reg[14]),
        .R(\captured_count[0]_i_1_n_0 ));
  FDRE \captured_count_reg[15] 
       (.C(s_axi_aclk),
        .CE(armed7_out),
        .D(\captured_count_reg[12]_i_1_n_4 ),
        .Q(captured_count_reg[15]),
        .R(\captured_count[0]_i_1_n_0 ));
  FDRE \captured_count_reg[16] 
       (.C(s_axi_aclk),
        .CE(armed7_out),
        .D(\captured_count_reg[16]_i_1_n_7 ),
        .Q(captured_count_reg[16]),
        .R(\captured_count[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \captured_count_reg[16]_i_1 
       (.CI(\captured_count_reg[12]_i_1_n_0 ),
        .CO({\captured_count_reg[16]_i_1_n_0 ,\captured_count_reg[16]_i_1_n_1 ,\captured_count_reg[16]_i_1_n_2 ,\captured_count_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\captured_count_reg[16]_i_1_n_4 ,\captured_count_reg[16]_i_1_n_5 ,\captured_count_reg[16]_i_1_n_6 ,\captured_count_reg[16]_i_1_n_7 }),
        .S(captured_count_reg[19:16]));
  FDRE \captured_count_reg[17] 
       (.C(s_axi_aclk),
        .CE(armed7_out),
        .D(\captured_count_reg[16]_i_1_n_6 ),
        .Q(captured_count_reg[17]),
        .R(\captured_count[0]_i_1_n_0 ));
  FDRE \captured_count_reg[18] 
       (.C(s_axi_aclk),
        .CE(armed7_out),
        .D(\captured_count_reg[16]_i_1_n_5 ),
        .Q(captured_count_reg[18]),
        .R(\captured_count[0]_i_1_n_0 ));
  FDRE \captured_count_reg[19] 
       (.C(s_axi_aclk),
        .CE(armed7_out),
        .D(\captured_count_reg[16]_i_1_n_4 ),
        .Q(captured_count_reg[19]),
        .R(\captured_count[0]_i_1_n_0 ));
  FDRE \captured_count_reg[1] 
       (.C(s_axi_aclk),
        .CE(armed7_out),
        .D(\captured_count_reg[0]_i_3_n_6 ),
        .Q(captured_count[1]),
        .R(\captured_count[0]_i_1_n_0 ));
  FDRE \captured_count_reg[20] 
       (.C(s_axi_aclk),
        .CE(armed7_out),
        .D(\captured_count_reg[20]_i_1_n_7 ),
        .Q(captured_count_reg[20]),
        .R(\captured_count[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \captured_count_reg[20]_i_1 
       (.CI(\captured_count_reg[16]_i_1_n_0 ),
        .CO({\captured_count_reg[20]_i_1_n_0 ,\captured_count_reg[20]_i_1_n_1 ,\captured_count_reg[20]_i_1_n_2 ,\captured_count_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\captured_count_reg[20]_i_1_n_4 ,\captured_count_reg[20]_i_1_n_5 ,\captured_count_reg[20]_i_1_n_6 ,\captured_count_reg[20]_i_1_n_7 }),
        .S(captured_count_reg[23:20]));
  FDRE \captured_count_reg[21] 
       (.C(s_axi_aclk),
        .CE(armed7_out),
        .D(\captured_count_reg[20]_i_1_n_6 ),
        .Q(captured_count_reg[21]),
        .R(\captured_count[0]_i_1_n_0 ));
  FDRE \captured_count_reg[22] 
       (.C(s_axi_aclk),
        .CE(armed7_out),
        .D(\captured_count_reg[20]_i_1_n_5 ),
        .Q(captured_count_reg[22]),
        .R(\captured_count[0]_i_1_n_0 ));
  FDRE \captured_count_reg[23] 
       (.C(s_axi_aclk),
        .CE(armed7_out),
        .D(\captured_count_reg[20]_i_1_n_4 ),
        .Q(captured_count_reg[23]),
        .R(\captured_count[0]_i_1_n_0 ));
  FDRE \captured_count_reg[24] 
       (.C(s_axi_aclk),
        .CE(armed7_out),
        .D(\captured_count_reg[24]_i_1_n_7 ),
        .Q(captured_count_reg[24]),
        .R(\captured_count[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \captured_count_reg[24]_i_1 
       (.CI(\captured_count_reg[20]_i_1_n_0 ),
        .CO({\captured_count_reg[24]_i_1_n_0 ,\captured_count_reg[24]_i_1_n_1 ,\captured_count_reg[24]_i_1_n_2 ,\captured_count_reg[24]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\captured_count_reg[24]_i_1_n_4 ,\captured_count_reg[24]_i_1_n_5 ,\captured_count_reg[24]_i_1_n_6 ,\captured_count_reg[24]_i_1_n_7 }),
        .S(captured_count_reg[27:24]));
  FDRE \captured_count_reg[25] 
       (.C(s_axi_aclk),
        .CE(armed7_out),
        .D(\captured_count_reg[24]_i_1_n_6 ),
        .Q(captured_count_reg[25]),
        .R(\captured_count[0]_i_1_n_0 ));
  FDRE \captured_count_reg[26] 
       (.C(s_axi_aclk),
        .CE(armed7_out),
        .D(\captured_count_reg[24]_i_1_n_5 ),
        .Q(captured_count_reg[26]),
        .R(\captured_count[0]_i_1_n_0 ));
  FDRE \captured_count_reg[27] 
       (.C(s_axi_aclk),
        .CE(armed7_out),
        .D(\captured_count_reg[24]_i_1_n_4 ),
        .Q(captured_count_reg[27]),
        .R(\captured_count[0]_i_1_n_0 ));
  FDRE \captured_count_reg[28] 
       (.C(s_axi_aclk),
        .CE(armed7_out),
        .D(\captured_count_reg[28]_i_1_n_7 ),
        .Q(captured_count_reg[28]),
        .R(\captured_count[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \captured_count_reg[28]_i_1 
       (.CI(\captured_count_reg[24]_i_1_n_0 ),
        .CO({\NLW_captured_count_reg[28]_i_1_CO_UNCONNECTED [3],\captured_count_reg[28]_i_1_n_1 ,\captured_count_reg[28]_i_1_n_2 ,\captured_count_reg[28]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\captured_count_reg[28]_i_1_n_4 ,\captured_count_reg[28]_i_1_n_5 ,\captured_count_reg[28]_i_1_n_6 ,\captured_count_reg[28]_i_1_n_7 }),
        .S(captured_count_reg[31:28]));
  FDRE \captured_count_reg[29] 
       (.C(s_axi_aclk),
        .CE(armed7_out),
        .D(\captured_count_reg[28]_i_1_n_6 ),
        .Q(captured_count_reg[29]),
        .R(\captured_count[0]_i_1_n_0 ));
  FDRE \captured_count_reg[2] 
       (.C(s_axi_aclk),
        .CE(armed7_out),
        .D(\captured_count_reg[0]_i_3_n_5 ),
        .Q(captured_count[2]),
        .R(\captured_count[0]_i_1_n_0 ));
  FDRE \captured_count_reg[30] 
       (.C(s_axi_aclk),
        .CE(armed7_out),
        .D(\captured_count_reg[28]_i_1_n_5 ),
        .Q(captured_count_reg[30]),
        .R(\captured_count[0]_i_1_n_0 ));
  FDRE \captured_count_reg[31] 
       (.C(s_axi_aclk),
        .CE(armed7_out),
        .D(\captured_count_reg[28]_i_1_n_4 ),
        .Q(captured_count_reg[31]),
        .R(\captured_count[0]_i_1_n_0 ));
  FDRE \captured_count_reg[3] 
       (.C(s_axi_aclk),
        .CE(armed7_out),
        .D(\captured_count_reg[0]_i_3_n_4 ),
        .Q(captured_count[3]),
        .R(\captured_count[0]_i_1_n_0 ));
  FDRE \captured_count_reg[4] 
       (.C(s_axi_aclk),
        .CE(armed7_out),
        .D(\captured_count_reg[4]_i_1_n_7 ),
        .Q(captured_count[4]),
        .R(\captured_count[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \captured_count_reg[4]_i_1 
       (.CI(\captured_count_reg[0]_i_3_n_0 ),
        .CO({\captured_count_reg[4]_i_1_n_0 ,\captured_count_reg[4]_i_1_n_1 ,\captured_count_reg[4]_i_1_n_2 ,\captured_count_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\captured_count_reg[4]_i_1_n_4 ,\captured_count_reg[4]_i_1_n_5 ,\captured_count_reg[4]_i_1_n_6 ,\captured_count_reg[4]_i_1_n_7 }),
        .S(captured_count[7:4]));
  FDRE \captured_count_reg[5] 
       (.C(s_axi_aclk),
        .CE(armed7_out),
        .D(\captured_count_reg[4]_i_1_n_6 ),
        .Q(captured_count[5]),
        .R(\captured_count[0]_i_1_n_0 ));
  FDRE \captured_count_reg[6] 
       (.C(s_axi_aclk),
        .CE(armed7_out),
        .D(\captured_count_reg[4]_i_1_n_5 ),
        .Q(captured_count[6]),
        .R(\captured_count[0]_i_1_n_0 ));
  FDRE \captured_count_reg[7] 
       (.C(s_axi_aclk),
        .CE(armed7_out),
        .D(\captured_count_reg[4]_i_1_n_4 ),
        .Q(captured_count[7]),
        .R(\captured_count[0]_i_1_n_0 ));
  FDRE \captured_count_reg[8] 
       (.C(s_axi_aclk),
        .CE(armed7_out),
        .D(\captured_count_reg[8]_i_1_n_7 ),
        .Q(captured_count[8]),
        .R(\captured_count[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \captured_count_reg[8]_i_1 
       (.CI(\captured_count_reg[4]_i_1_n_0 ),
        .CO({\captured_count_reg[8]_i_1_n_0 ,\captured_count_reg[8]_i_1_n_1 ,\captured_count_reg[8]_i_1_n_2 ,\captured_count_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\captured_count_reg[8]_i_1_n_4 ,\captured_count_reg[8]_i_1_n_5 ,\captured_count_reg[8]_i_1_n_6 ,\captured_count_reg[8]_i_1_n_7 }),
        .S({captured_count_reg[11:10],captured_count[9:8]}));
  FDRE \captured_count_reg[9] 
       (.C(s_axi_aclk),
        .CE(armed7_out),
        .D(\captured_count_reg[8]_i_1_n_6 ),
        .Q(captured_count[9]),
        .R(\captured_count[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0001000000000000)) 
    cfg_error_i_1
       (.I0(trigger_sticky_0),
        .I1(\captured_count_reg[0]_0 ),
        .I2(armed),
        .I3(busy),
        .I4(arm_valid_reg_0),
        .I5(cfg_error_i_2_n_0),
        .O(cfg_error_i_1_n_0));
  LUT6 #(
    .INIT(64'hEFFEEFFEFFFFEFFE)) 
    cfg_error_i_2
       (.I0(\active_interval_ticks[31]_i_7_n_0 ),
        .I1(\active_interval_ticks[31]_i_6_n_0 ),
        .I2(\active_interval_ticks[31]_i_5_n_0 ),
        .I3(\active_sample_count_reg[31]_0 [10]),
        .I4(cfg_error_i_3_n_0),
        .I5(cfg_error_i_4_n_0),
        .O(cfg_error_i_2_n_0));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    cfg_error_i_3
       (.I0(\active_interval_ticks[31]_i_16_n_0 ),
        .I1(\active_interval_ticks_reg[31]_0 [20]),
        .I2(\active_interval_ticks_reg[31]_0 [18]),
        .I3(\active_interval_ticks_reg[31]_0 [29]),
        .I4(\active_interval_ticks_reg[31]_0 [3]),
        .I5(\active_interval_ticks[31]_i_8_n_0 ),
        .O(cfg_error_i_3_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    cfg_error_i_4
       (.I0(\active_interval_ticks[31]_i_18_n_0 ),
        .I1(\active_interval_ticks_reg[31]_0 [25]),
        .I2(\active_interval_ticks_reg[31]_0 [2]),
        .I3(\active_interval_ticks_reg[31]_0 [30]),
        .I4(\active_interval_ticks_reg[31]_0 [1]),
        .I5(\active_interval_ticks[31]_i_10_n_0 ),
        .O(cfg_error_i_4_n_0));
  FDRE cfg_error_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(cfg_error_i_1_n_0),
        .Q(cfg_error),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h00000000000000EA)) 
    done_i_1
       (.I0(record_valid),
        .I1(busy0),
        .I2(armed7_out),
        .I3(trigger_sticky_0),
        .I4(\active_interval_ticks[31]_i_2_n_0 ),
        .I5(cancelled_i_1_n_0),
        .O(done_i_1_n_0));
  FDRE done_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(done_i_1_n_0),
        .Q(record_valid),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFFFFE0FFFFFFFF)) 
    \interval_remaining[0]_i_1 
       (.I0(busy),
        .I1(armed),
        .I2(\captured_count_reg[0]_0 ),
        .I3(\active_interval_ticks[31]_i_2_n_0 ),
        .I4(invalidate_in),
        .I5(s_axi_aresetn),
        .O(\interval_remaining[0]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hBA)) 
    \interval_remaining[0]_i_2 
       (.I0(armed7_out),
        .I1(\captured_count_reg[0]_0 ),
        .I2(busy),
        .O(interval_remaining));
  LUT3 #(
    .INIT(8'h1D)) 
    \interval_remaining[0]_i_4 
       (.I0(interval_remaining_reg[3]),
        .I1(armed7_out),
        .I2(active_interval_ticks[3]),
        .O(\interval_remaining[0]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h1D)) 
    \interval_remaining[0]_i_5 
       (.I0(interval_remaining_reg[2]),
        .I1(armed7_out),
        .I2(active_interval_ticks[2]),
        .O(\interval_remaining[0]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h1D)) 
    \interval_remaining[0]_i_6 
       (.I0(interval_remaining_reg[1]),
        .I1(armed7_out),
        .I2(active_interval_ticks[1]),
        .O(\interval_remaining[0]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'h1D)) 
    \interval_remaining[0]_i_7 
       (.I0(interval_remaining_reg[0]),
        .I1(armed7_out),
        .I2(active_interval_ticks[0]),
        .O(\interval_remaining[0]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'h1D)) 
    \interval_remaining[12]_i_2 
       (.I0(interval_remaining_reg[15]),
        .I1(armed7_out),
        .I2(active_interval_ticks[15]),
        .O(\interval_remaining[12]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h1D)) 
    \interval_remaining[12]_i_3 
       (.I0(interval_remaining_reg[14]),
        .I1(armed7_out),
        .I2(active_interval_ticks[14]),
        .O(\interval_remaining[12]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h1D)) 
    \interval_remaining[12]_i_4 
       (.I0(interval_remaining_reg[13]),
        .I1(armed7_out),
        .I2(active_interval_ticks[13]),
        .O(\interval_remaining[12]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h1D)) 
    \interval_remaining[12]_i_5 
       (.I0(interval_remaining_reg[12]),
        .I1(armed7_out),
        .I2(active_interval_ticks[12]),
        .O(\interval_remaining[12]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h1D)) 
    \interval_remaining[16]_i_2 
       (.I0(interval_remaining_reg[19]),
        .I1(armed7_out),
        .I2(active_interval_ticks[19]),
        .O(\interval_remaining[16]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h1D)) 
    \interval_remaining[16]_i_3 
       (.I0(interval_remaining_reg[18]),
        .I1(armed7_out),
        .I2(active_interval_ticks[18]),
        .O(\interval_remaining[16]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h1D)) 
    \interval_remaining[16]_i_4 
       (.I0(interval_remaining_reg[17]),
        .I1(armed7_out),
        .I2(active_interval_ticks[17]),
        .O(\interval_remaining[16]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h1D)) 
    \interval_remaining[16]_i_5 
       (.I0(interval_remaining_reg[16]),
        .I1(armed7_out),
        .I2(active_interval_ticks[16]),
        .O(\interval_remaining[16]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h1D)) 
    \interval_remaining[20]_i_2 
       (.I0(interval_remaining_reg[23]),
        .I1(armed7_out),
        .I2(active_interval_ticks[23]),
        .O(\interval_remaining[20]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h1D)) 
    \interval_remaining[20]_i_3 
       (.I0(interval_remaining_reg[22]),
        .I1(armed7_out),
        .I2(active_interval_ticks[22]),
        .O(\interval_remaining[20]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h1D)) 
    \interval_remaining[20]_i_4 
       (.I0(interval_remaining_reg[21]),
        .I1(armed7_out),
        .I2(active_interval_ticks[21]),
        .O(\interval_remaining[20]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h1D)) 
    \interval_remaining[20]_i_5 
       (.I0(interval_remaining_reg[20]),
        .I1(armed7_out),
        .I2(active_interval_ticks[20]),
        .O(\interval_remaining[20]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h1D)) 
    \interval_remaining[24]_i_2 
       (.I0(interval_remaining_reg[27]),
        .I1(armed7_out),
        .I2(active_interval_ticks[27]),
        .O(\interval_remaining[24]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h1D)) 
    \interval_remaining[24]_i_3 
       (.I0(interval_remaining_reg[26]),
        .I1(armed7_out),
        .I2(active_interval_ticks[26]),
        .O(\interval_remaining[24]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h1D)) 
    \interval_remaining[24]_i_4 
       (.I0(interval_remaining_reg[25]),
        .I1(armed7_out),
        .I2(active_interval_ticks[25]),
        .O(\interval_remaining[24]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h1D)) 
    \interval_remaining[24]_i_5 
       (.I0(interval_remaining_reg[24]),
        .I1(armed7_out),
        .I2(active_interval_ticks[24]),
        .O(\interval_remaining[24]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h1D)) 
    \interval_remaining[28]_i_2 
       (.I0(interval_remaining_reg[31]),
        .I1(armed7_out),
        .I2(active_interval_ticks[31]),
        .O(\interval_remaining[28]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h1D)) 
    \interval_remaining[28]_i_3 
       (.I0(interval_remaining_reg[30]),
        .I1(armed7_out),
        .I2(active_interval_ticks[30]),
        .O(\interval_remaining[28]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h1D)) 
    \interval_remaining[28]_i_4 
       (.I0(interval_remaining_reg[29]),
        .I1(armed7_out),
        .I2(active_interval_ticks[29]),
        .O(\interval_remaining[28]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h1D)) 
    \interval_remaining[28]_i_5 
       (.I0(interval_remaining_reg[28]),
        .I1(armed7_out),
        .I2(active_interval_ticks[28]),
        .O(\interval_remaining[28]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h1D)) 
    \interval_remaining[4]_i_2 
       (.I0(interval_remaining_reg[7]),
        .I1(armed7_out),
        .I2(active_interval_ticks[7]),
        .O(\interval_remaining[4]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h1D)) 
    \interval_remaining[4]_i_3 
       (.I0(interval_remaining_reg[6]),
        .I1(armed7_out),
        .I2(active_interval_ticks[6]),
        .O(\interval_remaining[4]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h1D)) 
    \interval_remaining[4]_i_4 
       (.I0(interval_remaining_reg[5]),
        .I1(armed7_out),
        .I2(active_interval_ticks[5]),
        .O(\interval_remaining[4]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h1D)) 
    \interval_remaining[4]_i_5 
       (.I0(interval_remaining_reg[4]),
        .I1(armed7_out),
        .I2(active_interval_ticks[4]),
        .O(\interval_remaining[4]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h1D)) 
    \interval_remaining[8]_i_2 
       (.I0(interval_remaining_reg[11]),
        .I1(armed7_out),
        .I2(active_interval_ticks[11]),
        .O(\interval_remaining[8]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h1D)) 
    \interval_remaining[8]_i_3 
       (.I0(interval_remaining_reg[10]),
        .I1(armed7_out),
        .I2(active_interval_ticks[10]),
        .O(\interval_remaining[8]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h1D)) 
    \interval_remaining[8]_i_4 
       (.I0(interval_remaining_reg[9]),
        .I1(armed7_out),
        .I2(active_interval_ticks[9]),
        .O(\interval_remaining[8]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h1D)) 
    \interval_remaining[8]_i_5 
       (.I0(interval_remaining_reg[8]),
        .I1(armed7_out),
        .I2(active_interval_ticks[8]),
        .O(\interval_remaining[8]_i_5_n_0 ));
  FDRE \interval_remaining_reg[0] 
       (.C(s_axi_aclk),
        .CE(interval_remaining),
        .D(\interval_remaining_reg[0]_i_3_n_7 ),
        .Q(interval_remaining_reg[0]),
        .R(\interval_remaining[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \interval_remaining_reg[0]_i_3 
       (.CI(1'b0),
        .CO({\interval_remaining_reg[0]_i_3_n_0 ,\interval_remaining_reg[0]_i_3_n_1 ,\interval_remaining_reg[0]_i_3_n_2 ,\interval_remaining_reg[0]_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b1,1'b1,1'b1,1'b1}),
        .O({\interval_remaining_reg[0]_i_3_n_4 ,\interval_remaining_reg[0]_i_3_n_5 ,\interval_remaining_reg[0]_i_3_n_6 ,\interval_remaining_reg[0]_i_3_n_7 }),
        .S({\interval_remaining[0]_i_4_n_0 ,\interval_remaining[0]_i_5_n_0 ,\interval_remaining[0]_i_6_n_0 ,\interval_remaining[0]_i_7_n_0 }));
  FDRE \interval_remaining_reg[10] 
       (.C(s_axi_aclk),
        .CE(interval_remaining),
        .D(\interval_remaining_reg[8]_i_1_n_5 ),
        .Q(interval_remaining_reg[10]),
        .R(\interval_remaining[0]_i_1_n_0 ));
  FDRE \interval_remaining_reg[11] 
       (.C(s_axi_aclk),
        .CE(interval_remaining),
        .D(\interval_remaining_reg[8]_i_1_n_4 ),
        .Q(interval_remaining_reg[11]),
        .R(\interval_remaining[0]_i_1_n_0 ));
  FDRE \interval_remaining_reg[12] 
       (.C(s_axi_aclk),
        .CE(interval_remaining),
        .D(\interval_remaining_reg[12]_i_1_n_7 ),
        .Q(interval_remaining_reg[12]),
        .R(\interval_remaining[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \interval_remaining_reg[12]_i_1 
       (.CI(\interval_remaining_reg[8]_i_1_n_0 ),
        .CO({\interval_remaining_reg[12]_i_1_n_0 ,\interval_remaining_reg[12]_i_1_n_1 ,\interval_remaining_reg[12]_i_1_n_2 ,\interval_remaining_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b1,1'b1,1'b1,1'b1}),
        .O({\interval_remaining_reg[12]_i_1_n_4 ,\interval_remaining_reg[12]_i_1_n_5 ,\interval_remaining_reg[12]_i_1_n_6 ,\interval_remaining_reg[12]_i_1_n_7 }),
        .S({\interval_remaining[12]_i_2_n_0 ,\interval_remaining[12]_i_3_n_0 ,\interval_remaining[12]_i_4_n_0 ,\interval_remaining[12]_i_5_n_0 }));
  FDRE \interval_remaining_reg[13] 
       (.C(s_axi_aclk),
        .CE(interval_remaining),
        .D(\interval_remaining_reg[12]_i_1_n_6 ),
        .Q(interval_remaining_reg[13]),
        .R(\interval_remaining[0]_i_1_n_0 ));
  FDRE \interval_remaining_reg[14] 
       (.C(s_axi_aclk),
        .CE(interval_remaining),
        .D(\interval_remaining_reg[12]_i_1_n_5 ),
        .Q(interval_remaining_reg[14]),
        .R(\interval_remaining[0]_i_1_n_0 ));
  FDRE \interval_remaining_reg[15] 
       (.C(s_axi_aclk),
        .CE(interval_remaining),
        .D(\interval_remaining_reg[12]_i_1_n_4 ),
        .Q(interval_remaining_reg[15]),
        .R(\interval_remaining[0]_i_1_n_0 ));
  FDRE \interval_remaining_reg[16] 
       (.C(s_axi_aclk),
        .CE(interval_remaining),
        .D(\interval_remaining_reg[16]_i_1_n_7 ),
        .Q(interval_remaining_reg[16]),
        .R(\interval_remaining[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \interval_remaining_reg[16]_i_1 
       (.CI(\interval_remaining_reg[12]_i_1_n_0 ),
        .CO({\interval_remaining_reg[16]_i_1_n_0 ,\interval_remaining_reg[16]_i_1_n_1 ,\interval_remaining_reg[16]_i_1_n_2 ,\interval_remaining_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b1,1'b1,1'b1,1'b1}),
        .O({\interval_remaining_reg[16]_i_1_n_4 ,\interval_remaining_reg[16]_i_1_n_5 ,\interval_remaining_reg[16]_i_1_n_6 ,\interval_remaining_reg[16]_i_1_n_7 }),
        .S({\interval_remaining[16]_i_2_n_0 ,\interval_remaining[16]_i_3_n_0 ,\interval_remaining[16]_i_4_n_0 ,\interval_remaining[16]_i_5_n_0 }));
  FDRE \interval_remaining_reg[17] 
       (.C(s_axi_aclk),
        .CE(interval_remaining),
        .D(\interval_remaining_reg[16]_i_1_n_6 ),
        .Q(interval_remaining_reg[17]),
        .R(\interval_remaining[0]_i_1_n_0 ));
  FDRE \interval_remaining_reg[18] 
       (.C(s_axi_aclk),
        .CE(interval_remaining),
        .D(\interval_remaining_reg[16]_i_1_n_5 ),
        .Q(interval_remaining_reg[18]),
        .R(\interval_remaining[0]_i_1_n_0 ));
  FDRE \interval_remaining_reg[19] 
       (.C(s_axi_aclk),
        .CE(interval_remaining),
        .D(\interval_remaining_reg[16]_i_1_n_4 ),
        .Q(interval_remaining_reg[19]),
        .R(\interval_remaining[0]_i_1_n_0 ));
  FDRE \interval_remaining_reg[1] 
       (.C(s_axi_aclk),
        .CE(interval_remaining),
        .D(\interval_remaining_reg[0]_i_3_n_6 ),
        .Q(interval_remaining_reg[1]),
        .R(\interval_remaining[0]_i_1_n_0 ));
  FDRE \interval_remaining_reg[20] 
       (.C(s_axi_aclk),
        .CE(interval_remaining),
        .D(\interval_remaining_reg[20]_i_1_n_7 ),
        .Q(interval_remaining_reg[20]),
        .R(\interval_remaining[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \interval_remaining_reg[20]_i_1 
       (.CI(\interval_remaining_reg[16]_i_1_n_0 ),
        .CO({\interval_remaining_reg[20]_i_1_n_0 ,\interval_remaining_reg[20]_i_1_n_1 ,\interval_remaining_reg[20]_i_1_n_2 ,\interval_remaining_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b1,1'b1,1'b1,1'b1}),
        .O({\interval_remaining_reg[20]_i_1_n_4 ,\interval_remaining_reg[20]_i_1_n_5 ,\interval_remaining_reg[20]_i_1_n_6 ,\interval_remaining_reg[20]_i_1_n_7 }),
        .S({\interval_remaining[20]_i_2_n_0 ,\interval_remaining[20]_i_3_n_0 ,\interval_remaining[20]_i_4_n_0 ,\interval_remaining[20]_i_5_n_0 }));
  FDRE \interval_remaining_reg[21] 
       (.C(s_axi_aclk),
        .CE(interval_remaining),
        .D(\interval_remaining_reg[20]_i_1_n_6 ),
        .Q(interval_remaining_reg[21]),
        .R(\interval_remaining[0]_i_1_n_0 ));
  FDRE \interval_remaining_reg[22] 
       (.C(s_axi_aclk),
        .CE(interval_remaining),
        .D(\interval_remaining_reg[20]_i_1_n_5 ),
        .Q(interval_remaining_reg[22]),
        .R(\interval_remaining[0]_i_1_n_0 ));
  FDRE \interval_remaining_reg[23] 
       (.C(s_axi_aclk),
        .CE(interval_remaining),
        .D(\interval_remaining_reg[20]_i_1_n_4 ),
        .Q(interval_remaining_reg[23]),
        .R(\interval_remaining[0]_i_1_n_0 ));
  FDRE \interval_remaining_reg[24] 
       (.C(s_axi_aclk),
        .CE(interval_remaining),
        .D(\interval_remaining_reg[24]_i_1_n_7 ),
        .Q(interval_remaining_reg[24]),
        .R(\interval_remaining[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \interval_remaining_reg[24]_i_1 
       (.CI(\interval_remaining_reg[20]_i_1_n_0 ),
        .CO({\interval_remaining_reg[24]_i_1_n_0 ,\interval_remaining_reg[24]_i_1_n_1 ,\interval_remaining_reg[24]_i_1_n_2 ,\interval_remaining_reg[24]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b1,1'b1,1'b1,1'b1}),
        .O({\interval_remaining_reg[24]_i_1_n_4 ,\interval_remaining_reg[24]_i_1_n_5 ,\interval_remaining_reg[24]_i_1_n_6 ,\interval_remaining_reg[24]_i_1_n_7 }),
        .S({\interval_remaining[24]_i_2_n_0 ,\interval_remaining[24]_i_3_n_0 ,\interval_remaining[24]_i_4_n_0 ,\interval_remaining[24]_i_5_n_0 }));
  FDRE \interval_remaining_reg[25] 
       (.C(s_axi_aclk),
        .CE(interval_remaining),
        .D(\interval_remaining_reg[24]_i_1_n_6 ),
        .Q(interval_remaining_reg[25]),
        .R(\interval_remaining[0]_i_1_n_0 ));
  FDRE \interval_remaining_reg[26] 
       (.C(s_axi_aclk),
        .CE(interval_remaining),
        .D(\interval_remaining_reg[24]_i_1_n_5 ),
        .Q(interval_remaining_reg[26]),
        .R(\interval_remaining[0]_i_1_n_0 ));
  FDRE \interval_remaining_reg[27] 
       (.C(s_axi_aclk),
        .CE(interval_remaining),
        .D(\interval_remaining_reg[24]_i_1_n_4 ),
        .Q(interval_remaining_reg[27]),
        .R(\interval_remaining[0]_i_1_n_0 ));
  FDRE \interval_remaining_reg[28] 
       (.C(s_axi_aclk),
        .CE(interval_remaining),
        .D(\interval_remaining_reg[28]_i_1_n_7 ),
        .Q(interval_remaining_reg[28]),
        .R(\interval_remaining[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \interval_remaining_reg[28]_i_1 
       (.CI(\interval_remaining_reg[24]_i_1_n_0 ),
        .CO({\NLW_interval_remaining_reg[28]_i_1_CO_UNCONNECTED [3],\interval_remaining_reg[28]_i_1_n_1 ,\interval_remaining_reg[28]_i_1_n_2 ,\interval_remaining_reg[28]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b1,1'b1,1'b1}),
        .O({\interval_remaining_reg[28]_i_1_n_4 ,\interval_remaining_reg[28]_i_1_n_5 ,\interval_remaining_reg[28]_i_1_n_6 ,\interval_remaining_reg[28]_i_1_n_7 }),
        .S({\interval_remaining[28]_i_2_n_0 ,\interval_remaining[28]_i_3_n_0 ,\interval_remaining[28]_i_4_n_0 ,\interval_remaining[28]_i_5_n_0 }));
  FDRE \interval_remaining_reg[29] 
       (.C(s_axi_aclk),
        .CE(interval_remaining),
        .D(\interval_remaining_reg[28]_i_1_n_6 ),
        .Q(interval_remaining_reg[29]),
        .R(\interval_remaining[0]_i_1_n_0 ));
  FDRE \interval_remaining_reg[2] 
       (.C(s_axi_aclk),
        .CE(interval_remaining),
        .D(\interval_remaining_reg[0]_i_3_n_5 ),
        .Q(interval_remaining_reg[2]),
        .R(\interval_remaining[0]_i_1_n_0 ));
  FDRE \interval_remaining_reg[30] 
       (.C(s_axi_aclk),
        .CE(interval_remaining),
        .D(\interval_remaining_reg[28]_i_1_n_5 ),
        .Q(interval_remaining_reg[30]),
        .R(\interval_remaining[0]_i_1_n_0 ));
  FDRE \interval_remaining_reg[31] 
       (.C(s_axi_aclk),
        .CE(interval_remaining),
        .D(\interval_remaining_reg[28]_i_1_n_4 ),
        .Q(interval_remaining_reg[31]),
        .R(\interval_remaining[0]_i_1_n_0 ));
  FDRE \interval_remaining_reg[3] 
       (.C(s_axi_aclk),
        .CE(interval_remaining),
        .D(\interval_remaining_reg[0]_i_3_n_4 ),
        .Q(interval_remaining_reg[3]),
        .R(\interval_remaining[0]_i_1_n_0 ));
  FDRE \interval_remaining_reg[4] 
       (.C(s_axi_aclk),
        .CE(interval_remaining),
        .D(\interval_remaining_reg[4]_i_1_n_7 ),
        .Q(interval_remaining_reg[4]),
        .R(\interval_remaining[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \interval_remaining_reg[4]_i_1 
       (.CI(\interval_remaining_reg[0]_i_3_n_0 ),
        .CO({\interval_remaining_reg[4]_i_1_n_0 ,\interval_remaining_reg[4]_i_1_n_1 ,\interval_remaining_reg[4]_i_1_n_2 ,\interval_remaining_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b1,1'b1,1'b1,1'b1}),
        .O({\interval_remaining_reg[4]_i_1_n_4 ,\interval_remaining_reg[4]_i_1_n_5 ,\interval_remaining_reg[4]_i_1_n_6 ,\interval_remaining_reg[4]_i_1_n_7 }),
        .S({\interval_remaining[4]_i_2_n_0 ,\interval_remaining[4]_i_3_n_0 ,\interval_remaining[4]_i_4_n_0 ,\interval_remaining[4]_i_5_n_0 }));
  FDRE \interval_remaining_reg[5] 
       (.C(s_axi_aclk),
        .CE(interval_remaining),
        .D(\interval_remaining_reg[4]_i_1_n_6 ),
        .Q(interval_remaining_reg[5]),
        .R(\interval_remaining[0]_i_1_n_0 ));
  FDRE \interval_remaining_reg[6] 
       (.C(s_axi_aclk),
        .CE(interval_remaining),
        .D(\interval_remaining_reg[4]_i_1_n_5 ),
        .Q(interval_remaining_reg[6]),
        .R(\interval_remaining[0]_i_1_n_0 ));
  FDRE \interval_remaining_reg[7] 
       (.C(s_axi_aclk),
        .CE(interval_remaining),
        .D(\interval_remaining_reg[4]_i_1_n_4 ),
        .Q(interval_remaining_reg[7]),
        .R(\interval_remaining[0]_i_1_n_0 ));
  FDRE \interval_remaining_reg[8] 
       (.C(s_axi_aclk),
        .CE(interval_remaining),
        .D(\interval_remaining_reg[8]_i_1_n_7 ),
        .Q(interval_remaining_reg[8]),
        .R(\interval_remaining[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \interval_remaining_reg[8]_i_1 
       (.CI(\interval_remaining_reg[4]_i_1_n_0 ),
        .CO({\interval_remaining_reg[8]_i_1_n_0 ,\interval_remaining_reg[8]_i_1_n_1 ,\interval_remaining_reg[8]_i_1_n_2 ,\interval_remaining_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b1,1'b1,1'b1,1'b1}),
        .O({\interval_remaining_reg[8]_i_1_n_4 ,\interval_remaining_reg[8]_i_1_n_5 ,\interval_remaining_reg[8]_i_1_n_6 ,\interval_remaining_reg[8]_i_1_n_7 }),
        .S({\interval_remaining[8]_i_2_n_0 ,\interval_remaining[8]_i_3_n_0 ,\interval_remaining[8]_i_4_n_0 ,\interval_remaining[8]_i_5_n_0 }));
  FDRE \interval_remaining_reg[9] 
       (.C(s_axi_aclk),
        .CE(interval_remaining),
        .D(\interval_remaining_reg[8]_i_1_n_6 ),
        .Q(interval_remaining_reg[9]),
        .R(\interval_remaining[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h0C040C00)) 
    memory_pending_i_1
       (.I0(memory_valid),
        .I1(s_axi_aresetn),
        .I2(invalidate_in),
        .I3(memory_index_1),
        .I4(memory_pending_reg_0),
        .O(rd_valid_reg_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 rd_error1_carry
       (.CI(1'b0),
        .CO({rd_error1_carry_n_0,rd_error1_carry_n_1,rd_error1_carry_n_2,rd_error1_carry_n_3}),
        .CYINIT(1'b0),
        .DI({rd_error1_carry_i_1_n_0,rd_error1_carry_i_2_n_0,rd_error1_carry_i_3_n_0,rd_error1_carry_i_4_n_0}),
        .O(NLW_rd_error1_carry_O_UNCONNECTED[3:0]),
        .S({rd_error1_carry_i_5_n_0,rd_error1_carry_i_6_n_0,rd_error1_carry_i_7_n_0,rd_error1_carry_i_8_n_0}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 rd_error1_carry__0
       (.CI(rd_error1_carry_n_0),
        .CO({rd_error1_carry__0_n_0,rd_error1_carry__0_n_1,rd_error1_carry__0_n_2,rd_error1_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({rd_error1_carry__0_i_1_n_0,rd_error1_carry__0_i_2_n_0,rd_error1_carry__0_i_3_n_0,rd_error1_carry__0_i_4_n_0}),
        .O(NLW_rd_error1_carry__0_O_UNCONNECTED[3:0]),
        .S({rd_error1_carry__0_i_5_n_0,rd_error1_carry__0_i_6_n_0,rd_error1_carry__0_i_7_n_0,rd_error1_carry__0_i_8_n_0}));
  LUT4 #(
    .INIT(16'h22B2)) 
    rd_error1_carry__0_i_1
       (.I0(captured_count_reg[15]),
        .I1(rd_error1_carry__2_0[15]),
        .I2(captured_count_reg[14]),
        .I3(rd_error1_carry__2_0[14]),
        .O(rd_error1_carry__0_i_1_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    rd_error1_carry__0_i_2
       (.I0(captured_count_reg[13]),
        .I1(rd_error1_carry__2_0[13]),
        .I2(captured_count_reg[12]),
        .I3(rd_error1_carry__2_0[12]),
        .O(rd_error1_carry__0_i_2_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    rd_error1_carry__0_i_3
       (.I0(captured_count_reg[11]),
        .I1(rd_error1_carry__2_0[11]),
        .I2(captured_count_reg[10]),
        .I3(rd_error1_carry__2_0[10]),
        .O(rd_error1_carry__0_i_3_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    rd_error1_carry__0_i_4
       (.I0(captured_count[9]),
        .I1(rd_error1_carry__2_0[9]),
        .I2(captured_count[8]),
        .I3(rd_error1_carry__2_0[8]),
        .O(rd_error1_carry__0_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    rd_error1_carry__0_i_5
       (.I0(rd_error1_carry__2_0[15]),
        .I1(captured_count_reg[15]),
        .I2(rd_error1_carry__2_0[14]),
        .I3(captured_count_reg[14]),
        .O(rd_error1_carry__0_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    rd_error1_carry__0_i_6
       (.I0(rd_error1_carry__2_0[13]),
        .I1(captured_count_reg[13]),
        .I2(rd_error1_carry__2_0[12]),
        .I3(captured_count_reg[12]),
        .O(rd_error1_carry__0_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    rd_error1_carry__0_i_7
       (.I0(rd_error1_carry__2_0[11]),
        .I1(captured_count_reg[11]),
        .I2(rd_error1_carry__2_0[10]),
        .I3(captured_count_reg[10]),
        .O(rd_error1_carry__0_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    rd_error1_carry__0_i_8
       (.I0(rd_error1_carry__2_0[9]),
        .I1(captured_count[9]),
        .I2(rd_error1_carry__2_0[8]),
        .I3(captured_count[8]),
        .O(rd_error1_carry__0_i_8_n_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 rd_error1_carry__1
       (.CI(rd_error1_carry__0_n_0),
        .CO({rd_error1_carry__1_n_0,rd_error1_carry__1_n_1,rd_error1_carry__1_n_2,rd_error1_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({rd_error1_carry__1_i_1_n_0,rd_error1_carry__1_i_2_n_0,rd_error1_carry__1_i_3_n_0,rd_error1_carry__1_i_4_n_0}),
        .O(NLW_rd_error1_carry__1_O_UNCONNECTED[3:0]),
        .S({rd_error1_carry__1_i_5_n_0,rd_error1_carry__1_i_6_n_0,rd_error1_carry__1_i_7_n_0,rd_error1_carry__1_i_8_n_0}));
  LUT4 #(
    .INIT(16'h22B2)) 
    rd_error1_carry__1_i_1
       (.I0(captured_count_reg[23]),
        .I1(rd_error1_carry__2_0[23]),
        .I2(captured_count_reg[22]),
        .I3(rd_error1_carry__2_0[22]),
        .O(rd_error1_carry__1_i_1_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    rd_error1_carry__1_i_2
       (.I0(captured_count_reg[21]),
        .I1(rd_error1_carry__2_0[21]),
        .I2(captured_count_reg[20]),
        .I3(rd_error1_carry__2_0[20]),
        .O(rd_error1_carry__1_i_2_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    rd_error1_carry__1_i_3
       (.I0(captured_count_reg[19]),
        .I1(rd_error1_carry__2_0[19]),
        .I2(captured_count_reg[18]),
        .I3(rd_error1_carry__2_0[18]),
        .O(rd_error1_carry__1_i_3_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    rd_error1_carry__1_i_4
       (.I0(captured_count_reg[17]),
        .I1(rd_error1_carry__2_0[17]),
        .I2(captured_count_reg[16]),
        .I3(rd_error1_carry__2_0[16]),
        .O(rd_error1_carry__1_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    rd_error1_carry__1_i_5
       (.I0(rd_error1_carry__2_0[23]),
        .I1(captured_count_reg[23]),
        .I2(rd_error1_carry__2_0[22]),
        .I3(captured_count_reg[22]),
        .O(rd_error1_carry__1_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    rd_error1_carry__1_i_6
       (.I0(rd_error1_carry__2_0[21]),
        .I1(captured_count_reg[21]),
        .I2(rd_error1_carry__2_0[20]),
        .I3(captured_count_reg[20]),
        .O(rd_error1_carry__1_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    rd_error1_carry__1_i_7
       (.I0(rd_error1_carry__2_0[19]),
        .I1(captured_count_reg[19]),
        .I2(rd_error1_carry__2_0[18]),
        .I3(captured_count_reg[18]),
        .O(rd_error1_carry__1_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    rd_error1_carry__1_i_8
       (.I0(rd_error1_carry__2_0[17]),
        .I1(captured_count_reg[17]),
        .I2(rd_error1_carry__2_0[16]),
        .I3(captured_count_reg[16]),
        .O(rd_error1_carry__1_i_8_n_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 rd_error1_carry__2
       (.CI(rd_error1_carry__1_n_0),
        .CO({rd_error1,rd_error1_carry__2_n_1,rd_error1_carry__2_n_2,rd_error1_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({rd_error1_carry__2_i_1_n_0,rd_error1_carry__2_i_2_n_0,rd_error1_carry__2_i_3_n_0,rd_error1_carry__2_i_4_n_0}),
        .O(NLW_rd_error1_carry__2_O_UNCONNECTED[3:0]),
        .S({rd_error1_carry__2_i_5_n_0,rd_error1_carry__2_i_6_n_0,rd_error1_carry__2_i_7_n_0,rd_error1_carry__2_i_8_n_0}));
  LUT4 #(
    .INIT(16'h22B2)) 
    rd_error1_carry__2_i_1
       (.I0(captured_count_reg[31]),
        .I1(rd_error1_carry__2_0[31]),
        .I2(captured_count_reg[30]),
        .I3(rd_error1_carry__2_0[30]),
        .O(rd_error1_carry__2_i_1_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    rd_error1_carry__2_i_2
       (.I0(captured_count_reg[29]),
        .I1(rd_error1_carry__2_0[29]),
        .I2(captured_count_reg[28]),
        .I3(rd_error1_carry__2_0[28]),
        .O(rd_error1_carry__2_i_2_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    rd_error1_carry__2_i_3
       (.I0(captured_count_reg[27]),
        .I1(rd_error1_carry__2_0[27]),
        .I2(captured_count_reg[26]),
        .I3(rd_error1_carry__2_0[26]),
        .O(rd_error1_carry__2_i_3_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    rd_error1_carry__2_i_4
       (.I0(captured_count_reg[25]),
        .I1(rd_error1_carry__2_0[25]),
        .I2(captured_count_reg[24]),
        .I3(rd_error1_carry__2_0[24]),
        .O(rd_error1_carry__2_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    rd_error1_carry__2_i_5
       (.I0(rd_error1_carry__2_0[31]),
        .I1(captured_count_reg[31]),
        .I2(rd_error1_carry__2_0[30]),
        .I3(captured_count_reg[30]),
        .O(rd_error1_carry__2_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    rd_error1_carry__2_i_6
       (.I0(rd_error1_carry__2_0[29]),
        .I1(captured_count_reg[29]),
        .I2(rd_error1_carry__2_0[28]),
        .I3(captured_count_reg[28]),
        .O(rd_error1_carry__2_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    rd_error1_carry__2_i_7
       (.I0(rd_error1_carry__2_0[27]),
        .I1(captured_count_reg[27]),
        .I2(rd_error1_carry__2_0[26]),
        .I3(captured_count_reg[26]),
        .O(rd_error1_carry__2_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    rd_error1_carry__2_i_8
       (.I0(rd_error1_carry__2_0[25]),
        .I1(captured_count_reg[25]),
        .I2(rd_error1_carry__2_0[24]),
        .I3(captured_count_reg[24]),
        .O(rd_error1_carry__2_i_8_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    rd_error1_carry_i_1
       (.I0(captured_count[7]),
        .I1(rd_error1_carry__2_0[7]),
        .I2(captured_count[6]),
        .I3(rd_error1_carry__2_0[6]),
        .O(rd_error1_carry_i_1_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    rd_error1_carry_i_2
       (.I0(captured_count[5]),
        .I1(rd_error1_carry__2_0[5]),
        .I2(captured_count[4]),
        .I3(rd_error1_carry__2_0[4]),
        .O(rd_error1_carry_i_2_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    rd_error1_carry_i_3
       (.I0(captured_count[3]),
        .I1(rd_error1_carry__2_0[3]),
        .I2(captured_count[2]),
        .I3(rd_error1_carry__2_0[2]),
        .O(rd_error1_carry_i_3_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    rd_error1_carry_i_4
       (.I0(captured_count[1]),
        .I1(rd_error1_carry__2_0[1]),
        .I2(captured_count[0]),
        .I3(rd_error1_carry__2_0[0]),
        .O(rd_error1_carry_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    rd_error1_carry_i_5
       (.I0(rd_error1_carry__2_0[7]),
        .I1(captured_count[7]),
        .I2(rd_error1_carry__2_0[6]),
        .I3(captured_count[6]),
        .O(rd_error1_carry_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    rd_error1_carry_i_6
       (.I0(rd_error1_carry__2_0[5]),
        .I1(captured_count[5]),
        .I2(rd_error1_carry__2_0[4]),
        .I3(captured_count[4]),
        .O(rd_error1_carry_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    rd_error1_carry_i_7
       (.I0(rd_error1_carry__2_0[3]),
        .I1(captured_count[3]),
        .I2(rd_error1_carry__2_0[2]),
        .I3(captured_count[2]),
        .O(rd_error1_carry_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    rd_error1_carry_i_8
       (.I0(rd_error1_carry__2_0[1]),
        .I1(captured_count[1]),
        .I2(rd_error1_carry__2_0[0]),
        .I3(captured_count[0]),
        .O(rd_error1_carry_i_8_n_0));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAA8AAA)) 
    rd_error_i_1
       (.I0(memory_request),
        .I1(rd_error_i_2_n_0),
        .I2(record_valid),
        .I3(rd_error1),
        .I4(\captured_count_reg[0]_0 ),
        .I5(\active_interval_ticks[31]_i_2_n_0 ),
        .O(rd_error_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'hE)) 
    rd_error_i_2
       (.I0(busy),
        .I1(armed),
        .O(rd_error_i_2_n_0));
  FDRE rd_error_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(rd_error_i_1_n_0),
        .Q(rd_error),
        .R(trigger_sticky_0));
  FDRE rd_valid_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(memory_request),
        .Q(memory_valid),
        .R(trigger_sticky_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFB)) 
    \s_axi_bresp[1]_i_12 
       (.I0(invalidate_in),
        .I1(s_axi_aresetn),
        .I2(\captured_count_reg[0]_0 ),
        .I3(armed),
        .I4(busy),
        .O(\s_axi_bresp[1]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'hFF01FFFFFF010000)) 
    \s_axi_bresp[1]_i_2 
       (.I0(\s_axi_bresp_reg[1] [1]),
        .I1(\s_axi_bresp_reg[1] [0]),
        .I2(\shadow_count_reg[24] ),
        .I3(\s_axi_bresp_reg[1]_0 ),
        .I4(address_pending0),
        .I5(s_axi_bresp),
        .O(\write_address_reg[3] ));
  LUT6 #(
    .INIT(64'h00000000FFFF0002)) 
    \s_axi_bresp[1]_i_3 
       (.I0(arm_valid_reg_1),
        .I1(arm_valid_reg_2),
        .I2(\s_axi_bresp[1]_i_8_n_0 ),
        .I3(arm_wait_reg_0),
        .I4(arm_wait_reg_3),
        .I5(arm_wait_reg),
        .O(\shadow_count_reg[24] ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \s_axi_bresp[1]_i_8 
       (.I0(\s_axi_bresp[1]_i_12_n_0 ),
        .I1(\s_axi_bresp[1]_i_3_0 ),
        .I2(invalidate_in),
        .I3(\s_axi_rdata_reg[31] [18]),
        .I4(arm_valid_reg_0),
        .I5(\s_axi_bresp[1]_i_3_1 ),
        .O(\s_axi_bresp[1]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h444F444F444F4444)) 
    \s_axi_rdata[0]_i_1 
       (.I0(\s_axi_rdata_reg[0]_1 ),
        .I1(memory_data[0]),
        .I2(\s_axi_rdata[0]_i_2_n_0 ),
        .I3(\s_axi_rdata_reg[0] ),
        .I4(\s_axi_rdata[0]_i_3_n_0 ),
        .I5(\s_axi_rdata[0]_i_4_n_0 ),
        .O(D[0]));
  LUT6 #(
    .INIT(64'h00000000FFFF4733)) 
    \s_axi_rdata[0]_i_2 
       (.I0(memory_data[0]),
        .I1(s_axi_araddr[3]),
        .I2(armed),
        .I3(s_axi_araddr[2]),
        .I4(s_axi_araddr[1]),
        .I5(\s_axi_rdata[0]_i_5_n_0 ),
        .O(\s_axi_rdata[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h33E200E200000000)) 
    \s_axi_rdata[0]_i_3 
       (.I0(shadow_wait),
        .I1(s_axi_araddr[3]),
        .I2(\s_axi_rdata_reg[31]_0 [0]),
        .I3(s_axi_araddr[2]),
        .I4(active_sample_count[0]),
        .I5(s_axi_araddr[1]),
        .O(\s_axi_rdata[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h11011000FFFFFFFF)) 
    \s_axi_rdata[0]_i_4 
       (.I0(s_axi_araddr[3]),
        .I1(s_axi_araddr[1]),
        .I2(s_axi_araddr[2]),
        .I3(captured_count[0]),
        .I4(Q[0]),
        .I5(s_axi_araddr[0]),
        .O(\s_axi_rdata[0]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hBABABAAAAAAABAAA)) 
    \s_axi_rdata[0]_i_5 
       (.I0(s_axi_araddr[0]),
        .I1(s_axi_araddr[3]),
        .I2(s_axi_araddr[1]),
        .I3(\s_axi_rdata_reg[31] [0]),
        .I4(s_axi_araddr[2]),
        .I5(active_interval_ticks[0]),
        .O(\s_axi_rdata[0]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0555005505100010)) 
    \s_axi_rdata[10]_i_1 
       (.I0(\s_axi_rdata_reg[0] ),
        .I1(s_axi_araddr[1]),
        .I2(s_axi_araddr[3]),
        .I3(s_axi_araddr[2]),
        .I4(\s_axi_rdata[10]_i_2_n_0 ),
        .I5(\s_axi_rdata_reg[10] ),
        .O(D[10]));
  LUT5 #(
    .INIT(32'hAFA0C0C0)) 
    \s_axi_rdata[10]_i_2 
       (.I0(active_sample_count[10]),
        .I1(captured_count_reg[10]),
        .I2(s_axi_araddr[0]),
        .I3(active_interval_ticks[10]),
        .I4(s_axi_araddr[1]),
        .O(\s_axi_rdata[10]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h0151)) 
    \s_axi_rdata[11]_i_1 
       (.I0(\s_axi_rdata_reg[0] ),
        .I1(\s_axi_rdata[11]_i_2_n_0 ),
        .I2(s_axi_araddr[0]),
        .I3(\s_axi_rdata[11]_i_3_n_0 ),
        .O(D[11]));
  LUT5 #(
    .INIT(32'hBBBFFFBF)) 
    \s_axi_rdata[11]_i_2 
       (.I0(s_axi_araddr[3]),
        .I1(s_axi_araddr[1]),
        .I2(\s_axi_rdata_reg[31] [9]),
        .I3(s_axi_araddr[2]),
        .I4(active_interval_ticks[11]),
        .O(\s_axi_rdata[11]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hC7F7FFFFC7F70000)) 
    \s_axi_rdata[11]_i_3 
       (.I0(active_sample_count[11]),
        .I1(s_axi_araddr[2]),
        .I2(s_axi_araddr[3]),
        .I3(\s_axi_rdata_reg[31]_0 [9]),
        .I4(s_axi_araddr[1]),
        .I5(\s_axi_rdata[11]_i_4_n_0 ),
        .O(\s_axi_rdata[11]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hABFB)) 
    \s_axi_rdata[11]_i_4 
       (.I0(s_axi_araddr[3]),
        .I1(Q[9]),
        .I2(s_axi_araddr[2]),
        .I3(captured_count_reg[11]),
        .O(\s_axi_rdata[11]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h0151)) 
    \s_axi_rdata[12]_i_1 
       (.I0(\s_axi_rdata_reg[0] ),
        .I1(\s_axi_rdata[12]_i_2_n_0 ),
        .I2(s_axi_araddr[0]),
        .I3(\s_axi_rdata[12]_i_3_n_0 ),
        .O(D[12]));
  LUT5 #(
    .INIT(32'hBBBFFFBF)) 
    \s_axi_rdata[12]_i_2 
       (.I0(s_axi_araddr[3]),
        .I1(s_axi_araddr[1]),
        .I2(\s_axi_rdata_reg[31] [10]),
        .I3(s_axi_araddr[2]),
        .I4(active_interval_ticks[12]),
        .O(\s_axi_rdata[12]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hC7F7FFFFC7F70000)) 
    \s_axi_rdata[12]_i_3 
       (.I0(active_sample_count[12]),
        .I1(s_axi_araddr[2]),
        .I2(s_axi_araddr[3]),
        .I3(\s_axi_rdata_reg[31]_0 [10]),
        .I4(s_axi_araddr[1]),
        .I5(\s_axi_rdata[12]_i_4_n_0 ),
        .O(\s_axi_rdata[12]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hABFB)) 
    \s_axi_rdata[12]_i_4 
       (.I0(s_axi_araddr[3]),
        .I1(Q[10]),
        .I2(s_axi_araddr[2]),
        .I3(captured_count_reg[12]),
        .O(\s_axi_rdata[12]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h0151)) 
    \s_axi_rdata[13]_i_1 
       (.I0(\s_axi_rdata_reg[0] ),
        .I1(\s_axi_rdata[13]_i_2_n_0 ),
        .I2(s_axi_araddr[0]),
        .I3(\s_axi_rdata[13]_i_3_n_0 ),
        .O(D[13]));
  LUT5 #(
    .INIT(32'hBBBFFFBF)) 
    \s_axi_rdata[13]_i_2 
       (.I0(s_axi_araddr[3]),
        .I1(s_axi_araddr[1]),
        .I2(\s_axi_rdata_reg[31] [11]),
        .I3(s_axi_araddr[2]),
        .I4(active_interval_ticks[13]),
        .O(\s_axi_rdata[13]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hC7F7FFFFC7F70000)) 
    \s_axi_rdata[13]_i_3 
       (.I0(active_sample_count[13]),
        .I1(s_axi_araddr[2]),
        .I2(s_axi_araddr[3]),
        .I3(\s_axi_rdata_reg[31]_0 [11]),
        .I4(s_axi_araddr[1]),
        .I5(\s_axi_rdata[13]_i_4_n_0 ),
        .O(\s_axi_rdata[13]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hABFB)) 
    \s_axi_rdata[13]_i_4 
       (.I0(s_axi_araddr[3]),
        .I1(Q[11]),
        .I2(s_axi_araddr[2]),
        .I3(captured_count_reg[13]),
        .O(\s_axi_rdata[13]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \s_axi_rdata[14]_i_1 
       (.I0(\s_axi_rdata[14]_i_2_n_0 ),
        .I1(\s_axi_rdata[14]_i_3_n_0 ),
        .I2(\s_axi_rdata_reg[0] ),
        .O(D[14]));
  LUT6 #(
    .INIT(64'hFFFFFFFF38080000)) 
    \s_axi_rdata[14]_i_2 
       (.I0(active_sample_count[14]),
        .I1(s_axi_araddr[2]),
        .I2(s_axi_araddr[3]),
        .I3(\s_axi_rdata_reg[31]_0 [12]),
        .I4(s_axi_araddr[1]),
        .I5(\s_axi_rdata[14]_i_4_n_0 ),
        .O(\s_axi_rdata[14]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h4545415155554151)) 
    \s_axi_rdata[14]_i_3 
       (.I0(s_axi_araddr[0]),
        .I1(s_axi_araddr[3]),
        .I2(s_axi_araddr[1]),
        .I3(\s_axi_rdata_reg[31] [12]),
        .I4(s_axi_araddr[2]),
        .I5(active_interval_ticks[14]),
        .O(\s_axi_rdata[14]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h11011000FFFFFFFF)) 
    \s_axi_rdata[14]_i_4 
       (.I0(s_axi_araddr[3]),
        .I1(s_axi_araddr[1]),
        .I2(s_axi_araddr[2]),
        .I3(captured_count_reg[14]),
        .I4(Q[12]),
        .I5(s_axi_araddr[0]),
        .O(\s_axi_rdata[14]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h0151)) 
    \s_axi_rdata[15]_i_1 
       (.I0(\s_axi_rdata_reg[0] ),
        .I1(\s_axi_rdata[15]_i_2_n_0 ),
        .I2(s_axi_araddr[0]),
        .I3(\s_axi_rdata[15]_i_3_n_0 ),
        .O(D[15]));
  LUT5 #(
    .INIT(32'hBBBFFFBF)) 
    \s_axi_rdata[15]_i_2 
       (.I0(s_axi_araddr[3]),
        .I1(s_axi_araddr[1]),
        .I2(\s_axi_rdata_reg[31] [13]),
        .I3(s_axi_araddr[2]),
        .I4(active_interval_ticks[15]),
        .O(\s_axi_rdata[15]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hC7F7FFFFC7F70000)) 
    \s_axi_rdata[15]_i_3 
       (.I0(active_sample_count[15]),
        .I1(s_axi_araddr[2]),
        .I2(s_axi_araddr[3]),
        .I3(\s_axi_rdata_reg[31]_0 [13]),
        .I4(s_axi_araddr[1]),
        .I5(\s_axi_rdata[15]_i_4_n_0 ),
        .O(\s_axi_rdata[15]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hABFB)) 
    \s_axi_rdata[15]_i_4 
       (.I0(s_axi_araddr[3]),
        .I1(Q[13]),
        .I2(s_axi_araddr[2]),
        .I3(captured_count_reg[15]),
        .O(\s_axi_rdata[15]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \s_axi_rdata[16]_i_1 
       (.I0(\s_axi_rdata[16]_i_2_n_0 ),
        .I1(\s_axi_rdata[16]_i_3_n_0 ),
        .I2(\s_axi_rdata_reg[0] ),
        .O(D[16]));
  LUT6 #(
    .INIT(64'hFFFFFFFF38080000)) 
    \s_axi_rdata[16]_i_2 
       (.I0(active_sample_count[16]),
        .I1(s_axi_araddr[2]),
        .I2(s_axi_araddr[3]),
        .I3(\s_axi_rdata_reg[31]_0 [14]),
        .I4(s_axi_araddr[1]),
        .I5(\s_axi_rdata[16]_i_4_n_0 ),
        .O(\s_axi_rdata[16]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h4545415155554151)) 
    \s_axi_rdata[16]_i_3 
       (.I0(s_axi_araddr[0]),
        .I1(s_axi_araddr[3]),
        .I2(s_axi_araddr[1]),
        .I3(\s_axi_rdata_reg[31] [14]),
        .I4(s_axi_araddr[2]),
        .I5(active_interval_ticks[16]),
        .O(\s_axi_rdata[16]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h11100010FFFFFFFF)) 
    \s_axi_rdata[16]_i_4 
       (.I0(s_axi_araddr[3]),
        .I1(s_axi_araddr[1]),
        .I2(Q[14]),
        .I3(s_axi_araddr[2]),
        .I4(captured_count_reg[16]),
        .I5(s_axi_araddr[0]),
        .O(\s_axi_rdata[16]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h0151)) 
    \s_axi_rdata[17]_i_1 
       (.I0(\s_axi_rdata_reg[0] ),
        .I1(\s_axi_rdata[17]_i_2_n_0 ),
        .I2(s_axi_araddr[0]),
        .I3(\s_axi_rdata[17]_i_3_n_0 ),
        .O(D[17]));
  LUT5 #(
    .INIT(32'hBBBFFFBF)) 
    \s_axi_rdata[17]_i_2 
       (.I0(s_axi_araddr[3]),
        .I1(s_axi_araddr[1]),
        .I2(\s_axi_rdata_reg[31] [15]),
        .I3(s_axi_araddr[2]),
        .I4(active_interval_ticks[17]),
        .O(\s_axi_rdata[17]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hC7F7FFFFC7F70000)) 
    \s_axi_rdata[17]_i_3 
       (.I0(active_sample_count[17]),
        .I1(s_axi_araddr[2]),
        .I2(s_axi_araddr[3]),
        .I3(\s_axi_rdata_reg[31]_0 [15]),
        .I4(s_axi_araddr[1]),
        .I5(\s_axi_rdata[17]_i_4_n_0 ),
        .O(\s_axi_rdata[17]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hABFB)) 
    \s_axi_rdata[17]_i_4 
       (.I0(s_axi_araddr[3]),
        .I1(Q[15]),
        .I2(s_axi_araddr[2]),
        .I3(captured_count_reg[17]),
        .O(\s_axi_rdata[17]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h0151)) 
    \s_axi_rdata[18]_i_1 
       (.I0(\s_axi_rdata_reg[0] ),
        .I1(\s_axi_rdata[18]_i_2_n_0 ),
        .I2(s_axi_araddr[0]),
        .I3(\s_axi_rdata[18]_i_3_n_0 ),
        .O(D[18]));
  LUT5 #(
    .INIT(32'hBBBFFFBF)) 
    \s_axi_rdata[18]_i_2 
       (.I0(s_axi_araddr[3]),
        .I1(s_axi_araddr[1]),
        .I2(\s_axi_rdata_reg[31] [16]),
        .I3(s_axi_araddr[2]),
        .I4(active_interval_ticks[18]),
        .O(\s_axi_rdata[18]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hC7F7FFFFC7F70000)) 
    \s_axi_rdata[18]_i_3 
       (.I0(active_sample_count[18]),
        .I1(s_axi_araddr[2]),
        .I2(s_axi_araddr[3]),
        .I3(\s_axi_rdata_reg[31]_0 [16]),
        .I4(s_axi_araddr[1]),
        .I5(\s_axi_rdata[18]_i_4_n_0 ),
        .O(\s_axi_rdata[18]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hABFB)) 
    \s_axi_rdata[18]_i_4 
       (.I0(s_axi_araddr[3]),
        .I1(Q[16]),
        .I2(s_axi_araddr[2]),
        .I3(captured_count_reg[18]),
        .O(\s_axi_rdata[18]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \s_axi_rdata[19]_i_1 
       (.I0(\s_axi_rdata[19]_i_2_n_0 ),
        .I1(\s_axi_rdata[19]_i_3_n_0 ),
        .I2(\s_axi_rdata_reg[0] ),
        .O(D[19]));
  LUT6 #(
    .INIT(64'hFFFFFFFF38080000)) 
    \s_axi_rdata[19]_i_2 
       (.I0(active_sample_count[19]),
        .I1(s_axi_araddr[2]),
        .I2(s_axi_araddr[3]),
        .I3(\s_axi_rdata_reg[31]_0 [17]),
        .I4(s_axi_araddr[1]),
        .I5(\s_axi_rdata[19]_i_4_n_0 ),
        .O(\s_axi_rdata[19]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h4545415155554151)) 
    \s_axi_rdata[19]_i_3 
       (.I0(s_axi_araddr[0]),
        .I1(s_axi_araddr[3]),
        .I2(s_axi_araddr[1]),
        .I3(\s_axi_rdata_reg[31] [17]),
        .I4(s_axi_araddr[2]),
        .I5(active_interval_ticks[19]),
        .O(\s_axi_rdata[19]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h11100010FFFFFFFF)) 
    \s_axi_rdata[19]_i_4 
       (.I0(s_axi_araddr[3]),
        .I1(s_axi_araddr[1]),
        .I2(Q[17]),
        .I3(s_axi_araddr[2]),
        .I4(captured_count_reg[19]),
        .I5(s_axi_araddr[0]),
        .O(\s_axi_rdata[19]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h444F444F444F4444)) 
    \s_axi_rdata[1]_i_1 
       (.I0(\s_axi_rdata_reg[0]_1 ),
        .I1(memory_data[1]),
        .I2(\s_axi_rdata_reg[0] ),
        .I3(\s_axi_rdata_reg[1] ),
        .I4(\s_axi_rdata[1]_i_3_n_0 ),
        .I5(\s_axi_rdata[1]_i_4_n_0 ),
        .O(D[1]));
  LUT6 #(
    .INIT(64'h0000000033E200E2)) 
    \s_axi_rdata[1]_i_3 
       (.I0(busy),
        .I1(s_axi_araddr[3]),
        .I2(memory_data[1]),
        .I3(s_axi_araddr[1]),
        .I4(active_interval_ticks[1]),
        .I5(s_axi_araddr[0]),
        .O(\s_axi_rdata[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h54040000FFFFFFFF)) 
    \s_axi_rdata[1]_i_4 
       (.I0(s_axi_araddr[3]),
        .I1(captured_count[1]),
        .I2(s_axi_araddr[1]),
        .I3(active_sample_count[1]),
        .I4(s_axi_araddr[0]),
        .I5(s_axi_araddr[2]),
        .O(\s_axi_rdata[1]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h0151)) 
    \s_axi_rdata[20]_i_1 
       (.I0(\s_axi_rdata_reg[0] ),
        .I1(\s_axi_rdata[20]_i_2_n_0 ),
        .I2(s_axi_araddr[0]),
        .I3(\s_axi_rdata[20]_i_3_n_0 ),
        .O(D[20]));
  LUT5 #(
    .INIT(32'hBBBFFFBF)) 
    \s_axi_rdata[20]_i_2 
       (.I0(s_axi_araddr[3]),
        .I1(s_axi_araddr[1]),
        .I2(\s_axi_rdata_reg[31] [18]),
        .I3(s_axi_araddr[2]),
        .I4(active_interval_ticks[20]),
        .O(\s_axi_rdata[20]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hC7F7FFFFC7F70000)) 
    \s_axi_rdata[20]_i_3 
       (.I0(active_sample_count[20]),
        .I1(s_axi_araddr[2]),
        .I2(s_axi_araddr[3]),
        .I3(\s_axi_rdata_reg[31]_0 [18]),
        .I4(s_axi_araddr[1]),
        .I5(\s_axi_rdata[20]_i_4_n_0 ),
        .O(\s_axi_rdata[20]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hABFB)) 
    \s_axi_rdata[20]_i_4 
       (.I0(s_axi_araddr[3]),
        .I1(Q[18]),
        .I2(s_axi_araddr[2]),
        .I3(captured_count_reg[20]),
        .O(\s_axi_rdata[20]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h0151)) 
    \s_axi_rdata[21]_i_1 
       (.I0(\s_axi_rdata_reg[0] ),
        .I1(\s_axi_rdata[21]_i_2_n_0 ),
        .I2(s_axi_araddr[0]),
        .I3(\s_axi_rdata[21]_i_3_n_0 ),
        .O(D[21]));
  LUT5 #(
    .INIT(32'hBBBFFFBF)) 
    \s_axi_rdata[21]_i_2 
       (.I0(s_axi_araddr[3]),
        .I1(s_axi_araddr[1]),
        .I2(\s_axi_rdata_reg[31] [19]),
        .I3(s_axi_araddr[2]),
        .I4(active_interval_ticks[21]),
        .O(\s_axi_rdata[21]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hC7F7FFFFC7F70000)) 
    \s_axi_rdata[21]_i_3 
       (.I0(active_sample_count[21]),
        .I1(s_axi_araddr[2]),
        .I2(s_axi_araddr[3]),
        .I3(\s_axi_rdata_reg[31]_0 [19]),
        .I4(s_axi_araddr[1]),
        .I5(\s_axi_rdata[21]_i_4_n_0 ),
        .O(\s_axi_rdata[21]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hABFB)) 
    \s_axi_rdata[21]_i_4 
       (.I0(s_axi_araddr[3]),
        .I1(Q[19]),
        .I2(s_axi_araddr[2]),
        .I3(captured_count_reg[21]),
        .O(\s_axi_rdata[21]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \s_axi_rdata[22]_i_1 
       (.I0(\s_axi_rdata[22]_i_2_n_0 ),
        .I1(\s_axi_rdata[22]_i_3_n_0 ),
        .I2(\s_axi_rdata_reg[0] ),
        .O(D[22]));
  LUT6 #(
    .INIT(64'hFFFFFFFF38080000)) 
    \s_axi_rdata[22]_i_2 
       (.I0(active_sample_count[22]),
        .I1(s_axi_araddr[2]),
        .I2(s_axi_araddr[3]),
        .I3(\s_axi_rdata_reg[31]_0 [20]),
        .I4(s_axi_araddr[1]),
        .I5(\s_axi_rdata[22]_i_4_n_0 ),
        .O(\s_axi_rdata[22]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h4545415155554151)) 
    \s_axi_rdata[22]_i_3 
       (.I0(s_axi_araddr[0]),
        .I1(s_axi_araddr[3]),
        .I2(s_axi_araddr[1]),
        .I3(\s_axi_rdata_reg[31] [20]),
        .I4(s_axi_araddr[2]),
        .I5(active_interval_ticks[22]),
        .O(\s_axi_rdata[22]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h11100010FFFFFFFF)) 
    \s_axi_rdata[22]_i_4 
       (.I0(s_axi_araddr[3]),
        .I1(s_axi_araddr[1]),
        .I2(Q[20]),
        .I3(s_axi_araddr[2]),
        .I4(captured_count_reg[22]),
        .I5(s_axi_araddr[0]),
        .O(\s_axi_rdata[22]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h0151)) 
    \s_axi_rdata[23]_i_1 
       (.I0(\s_axi_rdata_reg[0] ),
        .I1(\s_axi_rdata[23]_i_2_n_0 ),
        .I2(s_axi_araddr[0]),
        .I3(\s_axi_rdata[23]_i_3_n_0 ),
        .O(D[23]));
  LUT5 #(
    .INIT(32'hBBBFFFBF)) 
    \s_axi_rdata[23]_i_2 
       (.I0(s_axi_araddr[3]),
        .I1(s_axi_araddr[1]),
        .I2(\s_axi_rdata_reg[31] [21]),
        .I3(s_axi_araddr[2]),
        .I4(active_interval_ticks[23]),
        .O(\s_axi_rdata[23]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hC7F7FFFFC7F70000)) 
    \s_axi_rdata[23]_i_3 
       (.I0(active_sample_count[23]),
        .I1(s_axi_araddr[2]),
        .I2(s_axi_araddr[3]),
        .I3(\s_axi_rdata_reg[31]_0 [21]),
        .I4(s_axi_araddr[1]),
        .I5(\s_axi_rdata[23]_i_4_n_0 ),
        .O(\s_axi_rdata[23]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hABFB)) 
    \s_axi_rdata[23]_i_4 
       (.I0(s_axi_araddr[3]),
        .I1(Q[21]),
        .I2(s_axi_araddr[2]),
        .I3(captured_count_reg[23]),
        .O(\s_axi_rdata[23]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h0151)) 
    \s_axi_rdata[24]_i_1 
       (.I0(\s_axi_rdata_reg[0] ),
        .I1(\s_axi_rdata[24]_i_2_n_0 ),
        .I2(s_axi_araddr[0]),
        .I3(\s_axi_rdata[24]_i_3_n_0 ),
        .O(D[24]));
  LUT5 #(
    .INIT(32'hBBBFFFBF)) 
    \s_axi_rdata[24]_i_2 
       (.I0(s_axi_araddr[3]),
        .I1(s_axi_araddr[1]),
        .I2(\s_axi_rdata_reg[31] [22]),
        .I3(s_axi_araddr[2]),
        .I4(active_interval_ticks[24]),
        .O(\s_axi_rdata[24]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hC7F7FFFFC7F70000)) 
    \s_axi_rdata[24]_i_3 
       (.I0(active_sample_count[24]),
        .I1(s_axi_araddr[2]),
        .I2(s_axi_araddr[3]),
        .I3(\s_axi_rdata_reg[31]_0 [22]),
        .I4(s_axi_araddr[1]),
        .I5(\s_axi_rdata[24]_i_4_n_0 ),
        .O(\s_axi_rdata[24]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hABFB)) 
    \s_axi_rdata[24]_i_4 
       (.I0(s_axi_araddr[3]),
        .I1(Q[22]),
        .I2(s_axi_araddr[2]),
        .I3(captured_count_reg[24]),
        .O(\s_axi_rdata[24]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h0151)) 
    \s_axi_rdata[25]_i_1 
       (.I0(\s_axi_rdata_reg[0] ),
        .I1(\s_axi_rdata[25]_i_2_n_0 ),
        .I2(s_axi_araddr[0]),
        .I3(\s_axi_rdata[25]_i_3_n_0 ),
        .O(D[25]));
  LUT5 #(
    .INIT(32'hBBBFFFBF)) 
    \s_axi_rdata[25]_i_2 
       (.I0(s_axi_araddr[3]),
        .I1(s_axi_araddr[1]),
        .I2(\s_axi_rdata_reg[31] [23]),
        .I3(s_axi_araddr[2]),
        .I4(active_interval_ticks[25]),
        .O(\s_axi_rdata[25]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hC7F7FFFFC7F70000)) 
    \s_axi_rdata[25]_i_3 
       (.I0(active_sample_count[25]),
        .I1(s_axi_araddr[2]),
        .I2(s_axi_araddr[3]),
        .I3(\s_axi_rdata_reg[31]_0 [23]),
        .I4(s_axi_araddr[1]),
        .I5(\s_axi_rdata[25]_i_4_n_0 ),
        .O(\s_axi_rdata[25]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hABFB)) 
    \s_axi_rdata[25]_i_4 
       (.I0(s_axi_araddr[3]),
        .I1(Q[23]),
        .I2(s_axi_araddr[2]),
        .I3(captured_count_reg[25]),
        .O(\s_axi_rdata[25]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \s_axi_rdata[26]_i_1 
       (.I0(\s_axi_rdata[26]_i_2_n_0 ),
        .I1(\s_axi_rdata[26]_i_3_n_0 ),
        .I2(\s_axi_rdata_reg[0] ),
        .O(D[26]));
  LUT6 #(
    .INIT(64'hFFFFFFFF38080000)) 
    \s_axi_rdata[26]_i_2 
       (.I0(active_sample_count[26]),
        .I1(s_axi_araddr[2]),
        .I2(s_axi_araddr[3]),
        .I3(\s_axi_rdata_reg[31]_0 [24]),
        .I4(s_axi_araddr[1]),
        .I5(\s_axi_rdata[26]_i_4_n_0 ),
        .O(\s_axi_rdata[26]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h4545415155554151)) 
    \s_axi_rdata[26]_i_3 
       (.I0(s_axi_araddr[0]),
        .I1(s_axi_araddr[3]),
        .I2(s_axi_araddr[1]),
        .I3(\s_axi_rdata_reg[31] [24]),
        .I4(s_axi_araddr[2]),
        .I5(active_interval_ticks[26]),
        .O(\s_axi_rdata[26]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h11100010FFFFFFFF)) 
    \s_axi_rdata[26]_i_4 
       (.I0(s_axi_araddr[3]),
        .I1(s_axi_araddr[1]),
        .I2(Q[24]),
        .I3(s_axi_araddr[2]),
        .I4(captured_count_reg[26]),
        .I5(s_axi_araddr[0]),
        .O(\s_axi_rdata[26]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h0151)) 
    \s_axi_rdata[27]_i_1 
       (.I0(\s_axi_rdata_reg[0] ),
        .I1(\s_axi_rdata[27]_i_2_n_0 ),
        .I2(s_axi_araddr[0]),
        .I3(\s_axi_rdata[27]_i_3_n_0 ),
        .O(D[27]));
  LUT5 #(
    .INIT(32'hBBBFFFBF)) 
    \s_axi_rdata[27]_i_2 
       (.I0(s_axi_araddr[3]),
        .I1(s_axi_araddr[1]),
        .I2(\s_axi_rdata_reg[31] [25]),
        .I3(s_axi_araddr[2]),
        .I4(active_interval_ticks[27]),
        .O(\s_axi_rdata[27]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hC7F7FFFFC7F70000)) 
    \s_axi_rdata[27]_i_3 
       (.I0(active_sample_count[27]),
        .I1(s_axi_araddr[2]),
        .I2(s_axi_araddr[3]),
        .I3(\s_axi_rdata_reg[31]_0 [25]),
        .I4(s_axi_araddr[1]),
        .I5(\s_axi_rdata[27]_i_4_n_0 ),
        .O(\s_axi_rdata[27]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hABFB)) 
    \s_axi_rdata[27]_i_4 
       (.I0(s_axi_araddr[3]),
        .I1(Q[25]),
        .I2(s_axi_araddr[2]),
        .I3(captured_count_reg[27]),
        .O(\s_axi_rdata[27]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h0151)) 
    \s_axi_rdata[28]_i_1 
       (.I0(\s_axi_rdata_reg[0] ),
        .I1(\s_axi_rdata[28]_i_2_n_0 ),
        .I2(s_axi_araddr[0]),
        .I3(\s_axi_rdata[28]_i_3_n_0 ),
        .O(D[28]));
  LUT5 #(
    .INIT(32'hBBBFFFBF)) 
    \s_axi_rdata[28]_i_2 
       (.I0(s_axi_araddr[3]),
        .I1(s_axi_araddr[1]),
        .I2(\s_axi_rdata_reg[31] [26]),
        .I3(s_axi_araddr[2]),
        .I4(active_interval_ticks[28]),
        .O(\s_axi_rdata[28]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hC7F7FFFFC7F70000)) 
    \s_axi_rdata[28]_i_3 
       (.I0(active_sample_count[28]),
        .I1(s_axi_araddr[2]),
        .I2(s_axi_araddr[3]),
        .I3(\s_axi_rdata_reg[31]_0 [26]),
        .I4(s_axi_araddr[1]),
        .I5(\s_axi_rdata[28]_i_4_n_0 ),
        .O(\s_axi_rdata[28]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hABFB)) 
    \s_axi_rdata[28]_i_4 
       (.I0(s_axi_araddr[3]),
        .I1(Q[26]),
        .I2(s_axi_araddr[2]),
        .I3(captured_count_reg[28]),
        .O(\s_axi_rdata[28]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h0151)) 
    \s_axi_rdata[29]_i_1 
       (.I0(\s_axi_rdata_reg[0] ),
        .I1(\s_axi_rdata[29]_i_2_n_0 ),
        .I2(s_axi_araddr[0]),
        .I3(\s_axi_rdata[29]_i_3_n_0 ),
        .O(D[29]));
  LUT5 #(
    .INIT(32'hBBBFFFBF)) 
    \s_axi_rdata[29]_i_2 
       (.I0(s_axi_araddr[3]),
        .I1(s_axi_araddr[1]),
        .I2(\s_axi_rdata_reg[31] [27]),
        .I3(s_axi_araddr[2]),
        .I4(active_interval_ticks[29]),
        .O(\s_axi_rdata[29]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hC7F7FFFFC7F70000)) 
    \s_axi_rdata[29]_i_3 
       (.I0(active_sample_count[29]),
        .I1(s_axi_araddr[2]),
        .I2(s_axi_araddr[3]),
        .I3(\s_axi_rdata_reg[31]_0 [27]),
        .I4(s_axi_araddr[1]),
        .I5(\s_axi_rdata[29]_i_4_n_0 ),
        .O(\s_axi_rdata[29]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hABFB)) 
    \s_axi_rdata[29]_i_4 
       (.I0(s_axi_araddr[3]),
        .I1(Q[27]),
        .I2(s_axi_araddr[2]),
        .I3(captured_count_reg[29]),
        .O(\s_axi_rdata[29]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h0151)) 
    \s_axi_rdata[2]_i_1 
       (.I0(\s_axi_rdata_reg[0] ),
        .I1(\s_axi_rdata[2]_i_2_n_0 ),
        .I2(s_axi_araddr[0]),
        .I3(\s_axi_rdata[2]_i_3_n_0 ),
        .O(D[2]));
  LUT6 #(
    .INIT(64'hFFFFF0F0303F5F5F)) 
    \s_axi_rdata[2]_i_2 
       (.I0(\s_axi_rdata_reg[31] [1]),
        .I1(active_interval_ticks[2]),
        .I2(s_axi_araddr[1]),
        .I3(record_valid),
        .I4(s_axi_araddr[2]),
        .I5(s_axi_araddr[3]),
        .O(\s_axi_rdata[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hC7F7FFFFC7F70000)) 
    \s_axi_rdata[2]_i_3 
       (.I0(active_sample_count[2]),
        .I1(s_axi_araddr[2]),
        .I2(s_axi_araddr[3]),
        .I3(\s_axi_rdata_reg[31]_0 [1]),
        .I4(s_axi_araddr[1]),
        .I5(\s_axi_rdata[2]_i_4_n_0 ),
        .O(\s_axi_rdata[2]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hABFB)) 
    \s_axi_rdata[2]_i_4 
       (.I0(s_axi_araddr[3]),
        .I1(Q[1]),
        .I2(s_axi_araddr[2]),
        .I3(captured_count[2]),
        .O(\s_axi_rdata[2]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \s_axi_rdata[30]_i_1 
       (.I0(\s_axi_rdata[30]_i_2_n_0 ),
        .I1(\s_axi_rdata[30]_i_3_n_0 ),
        .I2(\s_axi_rdata_reg[0] ),
        .O(D[30]));
  LUT6 #(
    .INIT(64'hFFFFFFFF38080000)) 
    \s_axi_rdata[30]_i_2 
       (.I0(active_sample_count[30]),
        .I1(s_axi_araddr[2]),
        .I2(s_axi_araddr[3]),
        .I3(\s_axi_rdata_reg[31]_0 [28]),
        .I4(s_axi_araddr[1]),
        .I5(\s_axi_rdata[30]_i_4_n_0 ),
        .O(\s_axi_rdata[30]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h4545415155554151)) 
    \s_axi_rdata[30]_i_3 
       (.I0(s_axi_araddr[0]),
        .I1(s_axi_araddr[3]),
        .I2(s_axi_araddr[1]),
        .I3(\s_axi_rdata_reg[31] [28]),
        .I4(s_axi_araddr[2]),
        .I5(active_interval_ticks[30]),
        .O(\s_axi_rdata[30]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h11100010FFFFFFFF)) 
    \s_axi_rdata[30]_i_4 
       (.I0(s_axi_araddr[3]),
        .I1(s_axi_araddr[1]),
        .I2(Q[28]),
        .I3(s_axi_araddr[2]),
        .I4(captured_count_reg[30]),
        .I5(s_axi_araddr[0]),
        .O(\s_axi_rdata[30]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hC7F7FFFFC7F70000)) 
    \s_axi_rdata[31]_i_10 
       (.I0(active_sample_count[31]),
        .I1(s_axi_araddr[2]),
        .I2(s_axi_araddr[3]),
        .I3(\s_axi_rdata_reg[31]_0 [29]),
        .I4(s_axi_araddr[1]),
        .I5(\s_axi_rdata[31]_i_12_n_0 ),
        .O(\s_axi_rdata[31]_i_10_n_0 ));
  LUT4 #(
    .INIT(16'hABFB)) 
    \s_axi_rdata[31]_i_12 
       (.I0(s_axi_araddr[3]),
        .I1(Q[29]),
        .I2(s_axi_araddr[2]),
        .I3(captured_count_reg[31]),
        .O(\s_axi_rdata[31]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'hFFAAFFAAFFAAFFA8)) 
    \s_axi_rdata[31]_i_2 
       (.I0(\s_axi_rdata_reg[0]_1 ),
        .I1(s_axi_araddr[1]),
        .I2(s_axi_araddr[0]),
        .I3(\s_axi_rdata[31]_i_5_n_0 ),
        .I4(\s_axi_rdata_reg[0]_0 ),
        .I5(\s_axi_rdata_reg[0]_2 ),
        .O(\s_axi_araddr[3] ));
  LUT4 #(
    .INIT(16'h0151)) 
    \s_axi_rdata[31]_i_3 
       (.I0(\s_axi_rdata_reg[0] ),
        .I1(\s_axi_rdata[31]_i_9_n_0 ),
        .I2(s_axi_araddr[0]),
        .I3(\s_axi_rdata[31]_i_10_n_0 ),
        .O(D[31]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_axi_rdata[31]_i_5 
       (.I0(memory_pending_reg_0),
        .I1(memory_valid),
        .O(\s_axi_rdata[31]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hFF1DFFFF)) 
    \s_axi_rdata[31]_i_9 
       (.I0(\s_axi_rdata_reg[31] [29]),
        .I1(s_axi_araddr[2]),
        .I2(active_interval_ticks[31]),
        .I3(s_axi_araddr[3]),
        .I4(s_axi_araddr[1]),
        .O(\s_axi_rdata[31]_i_9_n_0 ));
  LUT4 #(
    .INIT(16'h0151)) 
    \s_axi_rdata[3]_i_1 
       (.I0(\s_axi_rdata_reg[0] ),
        .I1(\s_axi_rdata[3]_i_2_n_0 ),
        .I2(s_axi_araddr[0]),
        .I3(\s_axi_rdata[3]_i_3_n_0 ),
        .O(D[3]));
  LUT6 #(
    .INIT(64'hAABFAFBFFABFFFBF)) 
    \s_axi_rdata[3]_i_2 
       (.I0(s_axi_araddr[3]),
        .I1(record_valid),
        .I2(s_axi_araddr[2]),
        .I3(s_axi_araddr[1]),
        .I4(\s_axi_rdata_reg[31] [2]),
        .I5(active_interval_ticks[3]),
        .O(\s_axi_rdata[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hC7F7FFFFC7F70000)) 
    \s_axi_rdata[3]_i_3 
       (.I0(active_sample_count[3]),
        .I1(s_axi_araddr[2]),
        .I2(s_axi_araddr[3]),
        .I3(\s_axi_rdata_reg[31]_0 [2]),
        .I4(s_axi_araddr[1]),
        .I5(\s_axi_rdata[3]_i_4_n_0 ),
        .O(\s_axi_rdata[3]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hABFB)) 
    \s_axi_rdata[3]_i_4 
       (.I0(s_axi_araddr[3]),
        .I1(Q[2]),
        .I2(s_axi_araddr[2]),
        .I3(captured_count[3]),
        .O(\s_axi_rdata[3]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00000000AAAAAA02)) 
    \s_axi_rdata[4]_i_1 
       (.I0(\s_axi_rdata[4]_i_2_n_0 ),
        .I1(s_axi_araddr[1]),
        .I2(\s_axi_rdata_reg[4] ),
        .I3(s_axi_araddr[0]),
        .I4(\s_axi_rdata[4]_i_3_n_0 ),
        .I5(\s_axi_rdata_reg[0] ),
        .O(D[4]));
  LUT6 #(
    .INIT(64'hFFFFFFFF38080000)) 
    \s_axi_rdata[4]_i_2 
       (.I0(active_sample_count[4]),
        .I1(s_axi_araddr[2]),
        .I2(s_axi_araddr[3]),
        .I3(\s_axi_rdata_reg[31]_0 [3]),
        .I4(s_axi_araddr[1]),
        .I5(\s_axi_rdata[4]_i_4_n_0 ),
        .O(\s_axi_rdata[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00000000ACACF000)) 
    \s_axi_rdata[4]_i_3 
       (.I0(active_interval_ticks[4]),
        .I1(\s_axi_rdata_reg[31] [3]),
        .I2(s_axi_araddr[2]),
        .I3(error_sticky),
        .I4(s_axi_araddr[1]),
        .I5(s_axi_araddr[3]),
        .O(\s_axi_rdata[4]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h11100010FFFFFFFF)) 
    \s_axi_rdata[4]_i_4 
       (.I0(s_axi_araddr[3]),
        .I1(s_axi_araddr[1]),
        .I2(Q[3]),
        .I3(s_axi_araddr[2]),
        .I4(captured_count[4]),
        .I5(s_axi_araddr[0]),
        .O(\s_axi_rdata[4]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00000000AAAAAA02)) 
    \s_axi_rdata[5]_i_1 
       (.I0(\s_axi_rdata[5]_i_2_n_0 ),
        .I1(s_axi_araddr[1]),
        .I2(\s_axi_rdata_reg[4] ),
        .I3(s_axi_araddr[0]),
        .I4(\s_axi_rdata[5]_i_4_n_0 ),
        .I5(\s_axi_rdata_reg[0] ),
        .O(D[5]));
  LUT6 #(
    .INIT(64'hFFFFFFFF38080000)) 
    \s_axi_rdata[5]_i_2 
       (.I0(active_sample_count[5]),
        .I1(s_axi_araddr[2]),
        .I2(s_axi_araddr[3]),
        .I3(\s_axi_rdata_reg[31]_0 [4]),
        .I4(s_axi_araddr[1]),
        .I5(\s_axi_rdata[5]_i_5_n_0 ),
        .O(\s_axi_rdata[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00000000CACAF000)) 
    \s_axi_rdata[5]_i_4 
       (.I0(\s_axi_rdata_reg[31] [4]),
        .I1(active_interval_ticks[5]),
        .I2(s_axi_araddr[2]),
        .I3(cancel_sticky),
        .I4(s_axi_araddr[1]),
        .I5(s_axi_araddr[3]),
        .O(\s_axi_rdata[5]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h11100010FFFFFFFF)) 
    \s_axi_rdata[5]_i_5 
       (.I0(s_axi_araddr[3]),
        .I1(s_axi_araddr[1]),
        .I2(Q[4]),
        .I3(s_axi_araddr[2]),
        .I4(captured_count[5]),
        .I5(s_axi_araddr[0]),
        .O(\s_axi_rdata[5]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h0151)) 
    \s_axi_rdata[6]_i_1 
       (.I0(\s_axi_rdata_reg[0] ),
        .I1(\s_axi_rdata[6]_i_2_n_0 ),
        .I2(s_axi_araddr[0]),
        .I3(\s_axi_rdata[6]_i_3_n_0 ),
        .O(D[6]));
  LUT6 #(
    .INIT(64'hAABFAFBFFABFFFBF)) 
    \s_axi_rdata[6]_i_2 
       (.I0(s_axi_araddr[3]),
        .I1(trigger_sticky),
        .I2(s_axi_araddr[2]),
        .I3(s_axi_araddr[1]),
        .I4(\s_axi_rdata_reg[31] [5]),
        .I5(active_interval_ticks[6]),
        .O(\s_axi_rdata[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hC7F7FFFFC7F70000)) 
    \s_axi_rdata[6]_i_3 
       (.I0(active_sample_count[6]),
        .I1(s_axi_araddr[2]),
        .I2(s_axi_araddr[3]),
        .I3(\s_axi_rdata_reg[31]_0 [5]),
        .I4(s_axi_araddr[1]),
        .I5(\s_axi_rdata[6]_i_4_n_0 ),
        .O(\s_axi_rdata[6]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hABFB)) 
    \s_axi_rdata[6]_i_4 
       (.I0(s_axi_araddr[3]),
        .I1(Q[5]),
        .I2(s_axi_araddr[2]),
        .I3(captured_count[6]),
        .O(\s_axi_rdata[6]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h0151)) 
    \s_axi_rdata[7]_i_1 
       (.I0(\s_axi_rdata_reg[0] ),
        .I1(\s_axi_rdata[7]_i_2_n_0 ),
        .I2(s_axi_araddr[0]),
        .I3(\s_axi_rdata[7]_i_3_n_0 ),
        .O(D[7]));
  LUT6 #(
    .INIT(64'hAABFBBBFEEBFFFBF)) 
    \s_axi_rdata[7]_i_2 
       (.I0(s_axi_araddr[3]),
        .I1(s_axi_araddr[2]),
        .I2(arm_valid_reg_0),
        .I3(s_axi_araddr[1]),
        .I4(\s_axi_rdata_reg[31] [6]),
        .I5(active_interval_ticks[7]),
        .O(\s_axi_rdata[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hC7F7FFFFC7F70000)) 
    \s_axi_rdata[7]_i_3 
       (.I0(active_sample_count[7]),
        .I1(s_axi_araddr[2]),
        .I2(s_axi_araddr[3]),
        .I3(\s_axi_rdata_reg[31]_0 [6]),
        .I4(s_axi_araddr[1]),
        .I5(\s_axi_rdata[7]_i_4_n_0 ),
        .O(\s_axi_rdata[7]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hABFB)) 
    \s_axi_rdata[7]_i_4 
       (.I0(s_axi_araddr[3]),
        .I1(Q[6]),
        .I2(s_axi_araddr[2]),
        .I3(captured_count[7]),
        .O(\s_axi_rdata[7]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \s_axi_rdata[8]_i_1 
       (.I0(\s_axi_rdata[8]_i_2_n_0 ),
        .I1(\s_axi_rdata[8]_i_3_n_0 ),
        .I2(\s_axi_rdata_reg[0] ),
        .O(D[8]));
  LUT6 #(
    .INIT(64'hFFFFFFFF38080000)) 
    \s_axi_rdata[8]_i_2 
       (.I0(active_sample_count[8]),
        .I1(s_axi_araddr[2]),
        .I2(s_axi_araddr[3]),
        .I3(\s_axi_rdata_reg[31]_0 [7]),
        .I4(s_axi_araddr[1]),
        .I5(\s_axi_rdata[8]_i_4_n_0 ),
        .O(\s_axi_rdata[8]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h4545415155554151)) 
    \s_axi_rdata[8]_i_3 
       (.I0(s_axi_araddr[0]),
        .I1(s_axi_araddr[3]),
        .I2(s_axi_araddr[1]),
        .I3(\s_axi_rdata_reg[31] [7]),
        .I4(s_axi_araddr[2]),
        .I5(active_interval_ticks[8]),
        .O(\s_axi_rdata[8]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h11100010FFFFFFFF)) 
    \s_axi_rdata[8]_i_4 
       (.I0(s_axi_araddr[3]),
        .I1(s_axi_araddr[1]),
        .I2(Q[7]),
        .I3(s_axi_araddr[2]),
        .I4(captured_count[8]),
        .I5(s_axi_araddr[0]),
        .O(\s_axi_rdata[8]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \s_axi_rdata[9]_i_1 
       (.I0(\s_axi_rdata[9]_i_2_n_0 ),
        .I1(\s_axi_rdata[9]_i_3_n_0 ),
        .I2(\s_axi_rdata_reg[0] ),
        .O(D[9]));
  LUT6 #(
    .INIT(64'hFFFFFFFF38080000)) 
    \s_axi_rdata[9]_i_2 
       (.I0(active_sample_count[9]),
        .I1(s_axi_araddr[2]),
        .I2(s_axi_araddr[3]),
        .I3(\s_axi_rdata_reg[31]_0 [8]),
        .I4(s_axi_araddr[1]),
        .I5(\s_axi_rdata[9]_i_4_n_0 ),
        .O(\s_axi_rdata[9]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h4541554145515551)) 
    \s_axi_rdata[9]_i_3 
       (.I0(s_axi_araddr[0]),
        .I1(s_axi_araddr[3]),
        .I2(s_axi_araddr[1]),
        .I3(s_axi_araddr[2]),
        .I4(active_interval_ticks[9]),
        .I5(\s_axi_rdata_reg[31] [8]),
        .O(\s_axi_rdata[9]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h11100010FFFFFFFF)) 
    \s_axi_rdata[9]_i_4 
       (.I0(s_axi_araddr[3]),
        .I1(s_axi_araddr[1]),
        .I2(Q[8]),
        .I3(s_axi_araddr[2]),
        .I4(captured_count[9]),
        .I5(s_axi_araddr[0]),
        .O(\s_axi_rdata[9]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFF0EFF0EFF0E0000)) 
    \s_axi_rresp[1]_i_2 
       (.I0(s_axi_araddr[0]),
        .I1(s_axi_araddr[1]),
        .I2(\s_axi_rdata_reg[0]_0 ),
        .I3(\s_axi_rdata_reg[0] ),
        .I4(rd_error),
        .I5(\s_axi_rdata_reg[0]_1 ),
        .O(p_0_out));
  LUT5 #(
    .INIT(32'hFF004040)) 
    \s_axi_rresp[1]_i_3 
       (.I0(capture_active_0),
        .I1(s_axi_aresetn),
        .I2(s_axi_arvalid),
        .I3(memory_valid),
        .I4(memory_pending_reg_0),
        .O(s_axi_rvalid_reg));
  LUT6 #(
    .INIT(64'hFFFF8888D888D888)) 
    s_axi_rvalid_i_2
       (.I0(memory_pending_reg_0),
        .I1(memory_valid),
        .I2(s_axi_arvalid),
        .I3(s_axi_aresetn),
        .I4(s_axi_rready),
        .I5(capture_active_0),
        .O(memory_pending_reg));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d2" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p0_d2" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "2048" *) 
  (* RTL_RAM_NAME = "system_digital_capture_0/inst/capture/sample_memory_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "1023" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "1" *) 
  RAMB18E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    sample_memory_reg
       (.ADDRARDADDR({captured_count,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({rd_error1_carry__2_0[9:0],1'b1,1'b1,1'b1,1'b1}),
        .CLKARDCLK(s_axi_aclk),
        .CLKBWRCLK(s_axi_aclk),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,sample_in}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1}),
        .DIPADIP({1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0}),
        .DOADO(NLW_sample_memory_reg_DOADO_UNCONNECTED[15:0]),
        .DOBDO({NLW_sample_memory_reg_DOBDO_UNCONNECTED[15:2],memory_data}),
        .DOPADOP(NLW_sample_memory_reg_DOPADOP_UNCONNECTED[1:0]),
        .DOPBDOP(NLW_sample_memory_reg_DOPBDOP_UNCONNECTED[1:0]),
        .ENARDEN(sample_fire0),
        .ENBWREN(sample_memory_reg_i_2_n_0),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(sample_memory_reg_i_3_n_0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .WEA({sample_memory_reg_i_4_n_0,sample_memory_reg_i_4_n_0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
  LUT6 #(
    .INIT(64'hE0E0E0FFE0E0E0E0)) 
    sample_memory_reg_i_1
       (.I0(sample_memory_reg_0),
        .I1(trigger_in),
        .I2(armed),
        .I3(sample_memory_reg_i_5_n_0),
        .I4(sample_memory_reg_i_6_n_0),
        .I5(sample_memory_reg_i_7_n_0),
        .O(sample_fire0));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    sample_memory_reg_i_10
       (.I0(interval_remaining_reg[16]),
        .I1(interval_remaining_reg[19]),
        .I2(interval_remaining_reg[11]),
        .I3(interval_remaining_reg[30]),
        .I4(sample_memory_reg_i_13_n_0),
        .O(sample_memory_reg_i_10_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    sample_memory_reg_i_11
       (.I0(interval_remaining_reg[31]),
        .I1(interval_remaining_reg[25]),
        .I2(interval_remaining_reg[29]),
        .I3(interval_remaining_reg[12]),
        .O(sample_memory_reg_i_11_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    sample_memory_reg_i_12
       (.I0(interval_remaining_reg[13]),
        .I1(interval_remaining_reg[8]),
        .I2(interval_remaining_reg[4]),
        .I3(interval_remaining_reg[0]),
        .O(sample_memory_reg_i_12_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    sample_memory_reg_i_13
       (.I0(interval_remaining_reg[24]),
        .I1(interval_remaining_reg[23]),
        .I2(interval_remaining_reg[28]),
        .I3(interval_remaining_reg[14]),
        .O(sample_memory_reg_i_13_n_0));
  LUT3 #(
    .INIT(8'hFB)) 
    sample_memory_reg_i_2
       (.I0(invalidate_in),
        .I1(s_axi_aresetn),
        .I2(memory_request),
        .O(sample_memory_reg_i_2_n_0));
  LUT5 #(
    .INIT(32'hFFFDDDDD)) 
    sample_memory_reg_i_3
       (.I0(s_axi_aresetn),
        .I1(invalidate_in),
        .I2(\active_interval_ticks[31]_i_2_n_0 ),
        .I3(sample_memory_reg_i_8_n_0),
        .I4(memory_request),
        .O(sample_memory_reg_i_3_n_0));
  LUT3 #(
    .INIT(8'h04)) 
    sample_memory_reg_i_4
       (.I0(invalidate_in),
        .I1(s_axi_aresetn),
        .I2(\captured_count_reg[0]_0 ),
        .O(sample_memory_reg_i_4_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFEFF)) 
    sample_memory_reg_i_5
       (.I0(interval_remaining_reg[17]),
        .I1(interval_remaining_reg[3]),
        .I2(interval_remaining_reg[9]),
        .I3(busy),
        .I4(interval_remaining_reg[5]),
        .I5(interval_remaining_reg[22]),
        .O(sample_memory_reg_i_5_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    sample_memory_reg_i_6
       (.I0(sample_memory_reg_i_9_n_0),
        .I1(interval_remaining_reg[7]),
        .I2(interval_remaining_reg[6]),
        .I3(interval_remaining_reg[15]),
        .I4(interval_remaining_reg[1]),
        .I5(sample_memory_reg_i_10_n_0),
        .O(sample_memory_reg_i_6_n_0));
  LUT5 #(
    .INIT(32'h00000001)) 
    sample_memory_reg_i_7
       (.I0(interval_remaining_reg[26]),
        .I1(interval_remaining_reg[10]),
        .I2(interval_remaining_reg[27]),
        .I3(sample_memory_reg_i_11_n_0),
        .I4(sample_memory_reg_i_12_n_0),
        .O(sample_memory_reg_i_7_n_0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'hFFFFEFFF)) 
    sample_memory_reg_i_8
       (.I0(armed),
        .I1(busy),
        .I2(record_valid),
        .I3(rd_error1),
        .I4(\captured_count_reg[0]_0 ),
        .O(sample_memory_reg_i_8_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    sample_memory_reg_i_9
       (.I0(interval_remaining_reg[21]),
        .I1(interval_remaining_reg[2]),
        .I2(interval_remaining_reg[20]),
        .I3(interval_remaining_reg[18]),
        .O(sample_memory_reg_i_9_n_0));
  LUT6 #(
    .INIT(64'h0000000040000000)) 
    soft_trigger_i_1
       (.I0(cancel_pulse_reg),
        .I1(soft_trigger_reg[1]),
        .I2(cancel_pulse_reg_0),
        .I3(\shadow_count_reg[24] ),
        .I4(address_pending0),
        .I5(trigger_sticky_0),
        .O(\write_data_reg[2] ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h8)) 
    trigger_seen_i_1
       (.I0(armed),
        .I1(armed7_out),
        .O(trigger_seen_i_1_n_0));
  FDRE trigger_seen_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(trigger_seen_i_1_n_0),
        .Q(trigger_seen),
        .R(1'b0));
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
