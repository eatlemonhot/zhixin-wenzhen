//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
//Date        : Thu Oct 22 00:28:29 2026
//Host        : xiaojun running 64-bit major release  (build 9200)
//Command     : generate_target system_wrapper.bd
//Design      : system_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module system_wrapper
   (DDR_0_addr,
    DDR_0_ba,
    DDR_0_cas_n,
    DDR_0_ck_n,
    DDR_0_ck_p,
    DDR_0_cke,
    DDR_0_cs_n,
    DDR_0_dm,
    DDR_0_dq,
    DDR_0_dqs_n,
    DDR_0_dqs_p,
    DDR_0_odt,
    DDR_0_ras_n,
    DDR_0_reset_n,
    DDR_0_we_n,
    FIXED_IO_0_ddr_vrn,
    FIXED_IO_0_ddr_vrp,
    FIXED_IO_0_mio,
    FIXED_IO_0_ps_clk,
    FIXED_IO_0_ps_porb,
    FIXED_IO_0_ps_srstb,
    adc_clk,
    adc_data,
    adc_otr,
    dac_clk,
    dac_data,
    eth_mdc,
    eth_mdio,
    eth_rx_ctl,
    eth_rxc,
    eth_rxd,
    eth_tx_ctl,
    eth_txc,
    eth_txd,
    k1_ctrl,
    k2_ctrl,
    k3_ctrl,
    k4_ctrl,
    k5_ctrl,
    k6_ctrl,
    k7_ctrl,
    probe_io,
    uart_rx,
    uart_tx);
  inout [14:0]DDR_0_addr;
  inout [2:0]DDR_0_ba;
  inout DDR_0_cas_n;
  inout DDR_0_ck_n;
  inout DDR_0_ck_p;
  inout DDR_0_cke;
  inout DDR_0_cs_n;
  inout [3:0]DDR_0_dm;
  inout [31:0]DDR_0_dq;
  inout [3:0]DDR_0_dqs_n;
  inout [3:0]DDR_0_dqs_p;
  inout DDR_0_odt;
  inout DDR_0_ras_n;
  inout DDR_0_reset_n;
  inout DDR_0_we_n;
  inout FIXED_IO_0_ddr_vrn;
  inout FIXED_IO_0_ddr_vrp;
  inout [53:0]FIXED_IO_0_mio;
  inout FIXED_IO_0_ps_clk;
  inout FIXED_IO_0_ps_porb;
  inout FIXED_IO_0_ps_srstb;
  output adc_clk;
  input [11:0]adc_data;
  input adc_otr;
  output dac_clk;
  output [11:0]dac_data;
  output eth_mdc;
  inout eth_mdio;
  input eth_rx_ctl;
  input eth_rxc;
  input [3:0]eth_rxd;
  output eth_tx_ctl;
  output eth_txc;
  output [3:0]eth_txd;
  output [0:0]k1_ctrl;
  output [0:0]k2_ctrl;
  output [0:0]k3_ctrl;
  output [0:0]k4_ctrl;
  output [0:0]k5_ctrl;
  output [0:0]k6_ctrl;
  output [0:0]k7_ctrl;
  inout [1:0]probe_io;
  input uart_rx;
  output uart_tx;

  wire [14:0]DDR_0_addr;
  wire [2:0]DDR_0_ba;
  wire DDR_0_cas_n;
  wire DDR_0_ck_n;
  wire DDR_0_ck_p;
  wire DDR_0_cke;
  wire DDR_0_cs_n;
  wire [3:0]DDR_0_dm;
  wire [31:0]DDR_0_dq;
  wire [3:0]DDR_0_dqs_n;
  wire [3:0]DDR_0_dqs_p;
  wire DDR_0_odt;
  wire DDR_0_ras_n;
  wire DDR_0_reset_n;
  wire DDR_0_we_n;
  wire FIXED_IO_0_ddr_vrn;
  wire FIXED_IO_0_ddr_vrp;
  wire [53:0]FIXED_IO_0_mio;
  wire FIXED_IO_0_ps_clk;
  wire FIXED_IO_0_ps_porb;
  wire FIXED_IO_0_ps_srstb;
  wire adc_clk;
  wire [11:0]adc_data;
  wire adc_otr;
  wire dac_clk;
  wire [11:0]dac_data;
  wire eth_mdc;
  wire eth_mdio;
  wire eth_rx_ctl;
  wire eth_rxc;
  wire [3:0]eth_rxd;
  wire eth_tx_ctl;
  wire eth_txc;
  wire [3:0]eth_txd;
  wire [0:0]k1_ctrl;
  wire [0:0]k2_ctrl;
  wire [0:0]k3_ctrl;
  wire [0:0]k4_ctrl;
  wire [0:0]k5_ctrl;
  wire [0:0]k6_ctrl;
  wire [0:0]k7_ctrl;
  wire [1:0]probe_io;
  wire uart_rx;
  wire uart_tx;

  system system_i
       (.DDR_0_addr(DDR_0_addr),
        .DDR_0_ba(DDR_0_ba),
        .DDR_0_cas_n(DDR_0_cas_n),
        .DDR_0_ck_n(DDR_0_ck_n),
        .DDR_0_ck_p(DDR_0_ck_p),
        .DDR_0_cke(DDR_0_cke),
        .DDR_0_cs_n(DDR_0_cs_n),
        .DDR_0_dm(DDR_0_dm),
        .DDR_0_dq(DDR_0_dq),
        .DDR_0_dqs_n(DDR_0_dqs_n),
        .DDR_0_dqs_p(DDR_0_dqs_p),
        .DDR_0_odt(DDR_0_odt),
        .DDR_0_ras_n(DDR_0_ras_n),
        .DDR_0_reset_n(DDR_0_reset_n),
        .DDR_0_we_n(DDR_0_we_n),
        .FIXED_IO_0_ddr_vrn(FIXED_IO_0_ddr_vrn),
        .FIXED_IO_0_ddr_vrp(FIXED_IO_0_ddr_vrp),
        .FIXED_IO_0_mio(FIXED_IO_0_mio),
        .FIXED_IO_0_ps_clk(FIXED_IO_0_ps_clk),
        .FIXED_IO_0_ps_porb(FIXED_IO_0_ps_porb),
        .FIXED_IO_0_ps_srstb(FIXED_IO_0_ps_srstb),
        .adc_clk(adc_clk),
        .adc_data(adc_data),
        .adc_otr(adc_otr),
        .dac_clk(dac_clk),
        .dac_data(dac_data),
        .eth_mdc(eth_mdc),
        .eth_mdio(eth_mdio),
        .eth_rx_ctl(eth_rx_ctl),
        .eth_rxc(eth_rxc),
        .eth_rxd(eth_rxd),
        .eth_tx_ctl(eth_tx_ctl),
        .eth_txc(eth_txc),
        .eth_txd(eth_txd),
        .k1_ctrl(k1_ctrl),
        .k2_ctrl(k2_ctrl),
        .k3_ctrl(k3_ctrl),
        .k4_ctrl(k4_ctrl),
        .k5_ctrl(k5_ctrl),
        .k6_ctrl(k6_ctrl),
        .k7_ctrl(k7_ctrl),
        .probe_io(probe_io),
        .uart_rx(uart_rx),
        .uart_tx(uart_tx));
endmodule
