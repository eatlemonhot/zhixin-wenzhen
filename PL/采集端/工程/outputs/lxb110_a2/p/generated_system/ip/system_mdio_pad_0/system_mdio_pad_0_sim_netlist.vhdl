-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
-- Date        : Thu Oct 22 00:42:45 2026
-- Host        : xiaojun running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/33525/FDW_NEXT/outputs/lxb110_a2/p/generated_system/ip/system_mdio_pad_0/system_mdio_pad_0_sim_netlist.vhdl
-- Design      : system_mdio_pad_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg484-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_mdio_pad_0_fdw_lxb_mdio is
  port (
    mdio_i : out STD_LOGIC;
    mdio : inout STD_LOGIC;
    mdio_o : in STD_LOGIC;
    mdio_t : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_mdio_pad_0_fdw_lxb_mdio : entity is "fdw_lxb_mdio";
end system_mdio_pad_0_fdw_lxb_mdio;

architecture STRUCTURE of system_mdio_pad_0_fdw_lxb_mdio is
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of mdio_pad : label is "PRIMITIVE";
begin
mdio_pad: unisim.vcomponents.IOBUF
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => mdio_o,
      IO => mdio,
      O => mdio_i,
      T => mdio_t
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_mdio_pad_0 is
  port (
    mdio_o : in STD_LOGIC;
    mdio_t : in STD_LOGIC;
    mdio_i : out STD_LOGIC;
    mdio : inout STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of system_mdio_pad_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of system_mdio_pad_0 : entity is "system_mdio_pad_0,fdw_lxb_mdio,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of system_mdio_pad_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of system_mdio_pad_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of system_mdio_pad_0 : entity is "fdw_lxb_mdio,Vivado 2025.1";
end system_mdio_pad_0;

architecture STRUCTURE of system_mdio_pad_0 is
begin
inst: entity work.system_mdio_pad_0_fdw_lxb_mdio
     port map (
      mdio => mdio,
      mdio_i => mdio_i,
      mdio_o => mdio_o,
      mdio_t => mdio_t
    );
end STRUCTURE;
