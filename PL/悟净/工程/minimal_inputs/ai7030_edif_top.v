
module ai7030_edif_top (
  inout     [53 : 0]     FIXED_IO_0_mio            ,
  inout     [14 : 0]     DDR_0_addr                , 
  inout     [2  : 0]     DDR_0_ba                  , 
  inout                  DDR_0_cas_n               , 
  inout                  DDR_0_ck_n                , 
  inout                  DDR_0_ck_p                , 
  inout                  DDR_0_cke                 , 
  inout                  DDR_0_cs_n                , 
  inout     [3  : 0]     DDR_0_dm                  , 
  inout     [31 : 0]     DDR_0_dq                  , 
  inout     [3  : 0]     DDR_0_dqs_n               , 
  inout     [3  : 0]     DDR_0_dqs_p               , 
  inout                  DDR_0_odt                 , 
  inout                  DDR_0_ras_n               , 
  inout                  DDR_0_reset_n             , 
  inout                  DDR_0_we_n                , 
  inout                  FIXED_IO_0_ddr_vrn        , 
  inout                  FIXED_IO_0_ddr_vrp        , 
  inout                  FIXED_IO_0_ps_clk         ,
  inout                  FIXED_IO_0_ps_porb        ,
  inout                  FIXED_IO_0_ps_srstb       ,
         
  inout     [ 63 : 0]    ddr3_dq                   ,
  inout     [  7 : 0]    ddr3_dqs_n                ,
  inout     [  7 : 0]    ddr3_dqs_p                ,
  output    [  7 : 0]    ddr3_dm                   ,
  output    [ 14 : 0]    ddr3_addr                 ,
  output    [  2 : 0]    ddr3_ba                   ,
  output                 ddr3_ras_n                ,
  output                 ddr3_cas_n                ,
  output                 ddr3_we_n                 ,
  output                 ddr3_reset_n              ,
  output    [  0 : 0]    ddr3_ck_p                 ,
  output    [  0 : 0]    ddr3_ck_n                 ,
  output    [  0 : 0]    ddr3_cke                  ,
  output    [  0 : 0]    ddr3_cs_n                 ,
  output    [  0 : 0]    ddr3_odt                  ,
       
  input                  sys_rst                   ,
  input                  sys_clk_p                 ,
  input                  sys_clk_n                 ,


 
  output    [  1 : 0]    led                       ,
  inout     [  1 : 0]    servo_pwm_j17
);

  wire   [ 31 : 0]  User_Reg_awwaddr        ;
  wire   [ 31 : 0]  User_Reg_awwdata        ;
  wire              User_Reg_awwvalid       ;
  wire              User_Reg_awwready       ;
  wire   [ 31 : 0]  User_Reg_araddr         ;
  wire              User_Reg_arvalid        ;
  wire              User_Reg_arready        ;
  wire   [ 31 : 0]  User_Reg_rdata          ;
  wire              User_Reg_rvalid         ;
  wire              User_Reg_rready         ;

  wire   [ 31 : 0]  User_Ddr_awwaddr  ;
  wire   [511 : 0]  User_Ddr_awwdata  ;
  wire   [ 71 : 0]  User_Ddr_awwinfo  ;
  wire              User_Ddr_awwvalid ;
  wire              User_Ddr_awwready ;
  wire   [ 31 : 0]  User_Ddr_araddr   ;
  wire              User_Ddr_arvalid  ;
  wire   [ 31 : 0]  User_Ddr_arinfo   ;
  wire              User_Ddr_arready  ;
  wire   [511 : 0]  User_Ddr_rdata    ;
  wire              User_Ddr_rvalid   ;
  wire   [ 31 : 0]  User_Ddr_rinfo    ;
  wire              User_Ddr_rready   ;
  wire              gp_clk            ;
  wire              hp_clk            ;
  wire              gp_clk_rst        ;
  wire              hp_clk_rst        ;
  wire              FMC_HPC_DP0_C2M_N ;
  wire              FMC_HPC_DP0_C2M_P ;
  (* KEEP="true" *) wire              led1              ;
  (* KEEP="true" *) wire              led2              ;
  (* KEEP="true" *) wire              led3              ;
  (* KEEP="true" *) wire              cam_hs            ;
  (* KEEP="true" *) wire              cam_vs            ;
  (* KEEP="true" *) wire   [ 23  :0]  cam_rgb           ;
  (* KEEP="true" *) wire              cam_clk           ;
  (* KEEP="true" *) wire              cam_data_en       ;


wire [1:0] servo_signals;
ps_ai_peripheral U0_ps_ai_peripheral(
  .FIXED_IO_0_mio         ( FIXED_IO_0_mio      ),
  .DDR_0_addr             ( DDR_0_addr          ), 
  .DDR_0_ba               ( DDR_0_ba            ), 
  .DDR_0_cas_n            ( DDR_0_cas_n         ), 
  .DDR_0_ck_n             ( DDR_0_ck_n          ), 
  .DDR_0_ck_p             ( DDR_0_ck_p          ), 
  .DDR_0_cke              ( DDR_0_cke           ), 
  .DDR_0_cs_n             ( DDR_0_cs_n          ), 
  .DDR_0_dm               ( DDR_0_dm            ), 
  .DDR_0_dq               ( DDR_0_dq            ), 
  .DDR_0_dqs_n            ( DDR_0_dqs_n         ), 
  .DDR_0_dqs_p            ( DDR_0_dqs_p         ), 
  .DDR_0_odt              ( DDR_0_odt           ), 
  .DDR_0_ras_n            ( DDR_0_ras_n         ), 
  .DDR_0_reset_n          ( DDR_0_reset_n       ), 
  .DDR_0_we_n             ( DDR_0_we_n          ), 
  .FIXED_IO_0_ddr_vrn     ( FIXED_IO_0_ddr_vrn  ), 
  .FIXED_IO_0_ddr_vrp     ( FIXED_IO_0_ddr_vrp  ), 
  .FIXED_IO_0_ps_clk      ( FIXED_IO_0_ps_clk   ),
  .FIXED_IO_0_ps_porb     ( FIXED_IO_0_ps_porb  ),
  .FIXED_IO_0_ps_srstb    ( FIXED_IO_0_ps_srstb ),

  .ddr3_dq                ( ddr3_dq            ),
  .ddr3_dqs_n             ( ddr3_dqs_n         ),
  .ddr3_dqs_p             ( ddr3_dqs_p         ),
  .ddr3_dm                ( ddr3_dm            ),
  .ddr3_addr              ( ddr3_addr          ),
  .ddr3_ba                ( ddr3_ba            ),
  .ddr3_ras_n             ( ddr3_ras_n         ),
  .ddr3_cas_n             ( ddr3_cas_n         ),
  .ddr3_we_n              ( ddr3_we_n          ),
  .ddr3_reset_n           ( ddr3_reset_n       ),
  .ddr3_ck_p              ( ddr3_ck_p          ),
  .ddr3_ck_n              ( ddr3_ck_n          ),
  .ddr3_cke               ( ddr3_cke           ),
  .ddr3_cs_n              ( ddr3_cs_n          ),
  .ddr3_odt               ( ddr3_odt           ),
       
  .sys_rst                ( sys_rst            ),
  .sys_clk_p              ( sys_clk_p          ),
  .sys_clk_n              ( sys_clk_n          ),

  .cam_vs                 ( 1'b0               ),
  .cam_rgb                ( 24'b0              ),
  .cam_clk                ( gp_clk              ),
  .cam_data_en            ( 1'b0               ),

 
  .led                    ( led                ),
  .led3                   ( 1'b0               ),

  .gp_clk                 ( gp_clk             ),
  .hp_clk                 ( hp_clk             ),
  .gp_clk_rst             ( gp_clk_rst         ),
  .hp_clk_rst             ( hp_clk_rst         ),

  .User_Reg_awwaddr       ( User_Reg_awwaddr   ),
  .User_Reg_awwdata       ( User_Reg_awwdata   ),
  .User_Reg_awwvalid      ( User_Reg_awwvalid  ),
  .User_Reg_awwready      ( User_Reg_awwready  ),
  .User_Reg_araddr        ( User_Reg_araddr    ),
  .User_Reg_arvalid       ( User_Reg_arvalid   ),
  .User_Reg_arready       ( User_Reg_arready   ),
  .User_Reg_rdata         ( User_Reg_rdata     ),
  .User_Reg_rvalid        ( User_Reg_rvalid    ),
  .User_Reg_rready        ( User_Reg_rready    ),

  .User_Ddr_awwaddr       ( User_Ddr_awwaddr   ),
  .User_Ddr_awwdata       ( User_Ddr_awwdata   ),
  .User_Ddr_awwinfo       ( User_Ddr_awwinfo   ),
  .User_Ddr_awwvalid      ( User_Ddr_awwvalid  ),
  .User_Ddr_awwready      ( User_Ddr_awwready  ),
  .User_Ddr_araddr        ( User_Ddr_araddr    ),
  .User_Ddr_arvalid       ( User_Ddr_arvalid   ),
  .User_Ddr_arinfo        ( User_Ddr_arinfo    ),
  .User_Ddr_arready       ( User_Ddr_arready   ),
  .User_Ddr_rdata         ( User_Ddr_rdata     ),
  .User_Ddr_rvalid        ( User_Ddr_rvalid    ),
  .User_Ddr_rinfo         ( User_Ddr_rinfo     ),
  .User_Ddr_rready        ( User_Ddr_rready    ) 
);




assign User_Ddr_awwinfo = {1'b0, {64{1'b1}}, 6'b0, 1'b1};
assign User_Ddr_arinfo  = {25'h0, 6'b0, 1'b1};

fdw_wujing_dsp_top U_fdw_dsp_top(
  .itf_ra_awaddr    (User_Reg_awwaddr      ),
  .itf_ra_awdata    (User_Reg_awwdata      ),
  .itf_ra_awvalid   (User_Reg_awwvalid     ),
  .itf_ra_awready   (User_Reg_awwready     ),
  .itf_ra_araddr    (User_Reg_araddr       ),
  .itf_ra_arvalid   (User_Reg_arvalid      ),
  .itf_ra_arready   (User_Reg_arready      ),
  .itf_ra_rdata     (User_Reg_rdata        ),
  .itf_ra_rvalid    (User_Reg_rvalid       ),
  .itf_ra_rready    (User_Reg_rready       ),
   
  .itf_awaddr       (User_Ddr_awwaddr      ),
  .itf_awdata       (User_Ddr_awwdata      ),
  .itf_awvalid      (User_Ddr_awwvalid     ),
  .itf_awready      (User_Ddr_awwready     ),
  .itf_araddr       (User_Ddr_araddr       ),
  .itf_arvalid      (User_Ddr_arvalid      ),
  .itf_arready      (User_Ddr_arready      ),
  .itf_rdata        (User_Ddr_rdata        ),
  .itf_rvalid       (User_Ddr_rvalid       ),
  .itf_rready       (User_Ddr_rready       ),


  .clk              (hp_clk                ),
  .ra_clk           (gp_clk                ),
  .rst_n            (~hp_clk_rst           ),
  .ra_rst_n         (~gp_clk_rst           ),
  .servo_pwm        (servo_signals)
);


genvar servo_index;
generate for(servo_index=0;servo_index<2;servo_index=servo_index+1) begin: servo_pads
    IOBUF #(.IOSTANDARD("LVCMOS33"),.DRIVE(4),.SLEW("SLOW")) buffer(
        .I(servo_signals[servo_index]),.O(),.T(1'b0),.IO(servo_pwm_j17[servo_index]));
end endgenerate
endmodule
