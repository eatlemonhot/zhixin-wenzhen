-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
-- Date        : Thu Oct 22 00:39:10 2026
-- Host        : xiaojun running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/33525/FDW_NEXT/outputs/lxb110_a2/p/generated_system/ip/system_probe_pads_0/system_probe_pads_0_sim_netlist.vhdl
-- Design      : system_probe_pads_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg484-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_probe_pads_0_fdw_lxb_probe_io is
  port (
    digital_in : out STD_LOGIC_VECTOR ( 1 downto 0 );
    probe_io : inout STD_LOGIC_VECTOR ( 1 downto 0 );
    pwm_a : in STD_LOGIC;
    pwm_b : in STD_LOGIC;
    permit : in STD_LOGIC;
    resetn : in STD_LOGIC;
    output_mask : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_probe_pads_0_fdw_lxb_probe_io : entity is "fdw_lxb_probe_io";
end system_probe_pads_0_fdw_lxb_probe_io;

architecture STRUCTURE of system_probe_pads_0_fdw_lxb_probe_io is
  signal T0 : STD_LOGIC;
  signal probe_b_i_1_n_0 : STD_LOGIC;
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of probe_a : label is "PRIMITIVE";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of probe_a_i_1 : label is "soft_lutpair0";
  attribute BOX_TYPE of probe_b : label is "PRIMITIVE";
  attribute SOFT_HLUTNM of probe_b_i_1 : label is "soft_lutpair0";
begin
probe_a: unisim.vcomponents.IOBUF
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => pwm_a,
      IO => probe_io(0),
      O => digital_in(0),
      T => T0
    );
probe_a_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => permit,
      I1 => resetn,
      I2 => output_mask(0),
      O => T0
    );
probe_b: unisim.vcomponents.IOBUF
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => pwm_b,
      IO => probe_io(1),
      O => digital_in(1),
      T => probe_b_i_1_n_0
    );
probe_b_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => permit,
      I1 => resetn,
      I2 => output_mask(1),
      O => probe_b_i_1_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_probe_pads_0 is
  port (
    resetn : in STD_LOGIC;
    permit : in STD_LOGIC;
    output_mask : in STD_LOGIC_VECTOR ( 1 downto 0 );
    pwm_a : in STD_LOGIC;
    pwm_b : in STD_LOGIC;
    digital_in : out STD_LOGIC_VECTOR ( 1 downto 0 );
    probe_io : inout STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of system_probe_pads_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of system_probe_pads_0 : entity is "system_probe_pads_0,fdw_lxb_probe_io,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of system_probe_pads_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of system_probe_pads_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of system_probe_pads_0 : entity is "fdw_lxb_probe_io,Vivado 2025.1";
end system_probe_pads_0;

architecture STRUCTURE of system_probe_pads_0 is
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of resetn : signal is "xilinx.com:signal:reset:1.0 resetn RST";
  attribute X_INTERFACE_MODE : string;
  attribute X_INTERFACE_MODE of resetn : signal is "slave";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of resetn : signal is "XIL_INTERFACENAME resetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
begin
inst: entity work.system_probe_pads_0_fdw_lxb_probe_io
     port map (
      digital_in(1 downto 0) => digital_in(1 downto 0),
      output_mask(1 downto 0) => output_mask(1 downto 0),
      permit => permit,
      probe_io(1 downto 0) => probe_io(1 downto 0),
      pwm_a => pwm_a,
      pwm_b => pwm_b,
      resetn => resetn
    );
end STRUCTURE;
