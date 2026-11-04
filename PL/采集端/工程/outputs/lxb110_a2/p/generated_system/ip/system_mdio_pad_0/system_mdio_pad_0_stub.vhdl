-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
-- Date        : Thu Oct 22 00:42:45 2026
-- Host        : xiaojun running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/33525/FDW_NEXT/outputs/lxb110_a2/p/generated_system/ip/system_mdio_pad_0/system_mdio_pad_0_stub.vhdl
-- Design      : system_mdio_pad_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg484-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity system_mdio_pad_0 is
  Port ( 
    mdio_o : in STD_LOGIC;
    mdio_t : in STD_LOGIC;
    mdio_i : out STD_LOGIC;
    mdio : inout STD_LOGIC
  );

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of system_mdio_pad_0 : entity is "system_mdio_pad_0,fdw_lxb_mdio,{}";
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of system_mdio_pad_0 : entity is "system_mdio_pad_0,fdw_lxb_mdio,{x_ipProduct=Vivado 2025.1,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=fdw_lxb_mdio,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of system_mdio_pad_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of system_mdio_pad_0 : entity is "module_ref";
end system_mdio_pad_0;

architecture stub of system_mdio_pad_0 is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "mdio_o,mdio_t,mdio_i,mdio";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of stub : architecture is "fdw_lxb_mdio,Vivado 2025.1";
begin
end;
