
################################################################
# This is a generated script based on design: system
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2025.1
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   if { [string compare $scripts_vivado_version $current_vivado_version] > 0 } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2042 -severity "ERROR" " This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Sourcing the script failed since it was created with a future version of Vivado."}

   } else {
     catch {common::send_gid_msg -ssname BD::TCL -id 2041 -severity "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   }

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source system_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# fdw_pwm_axi, fdw_digital_axi, fdw_probe_router, fdw_pwm_burst_axi, fdw_adc_trigger_gate, fdw_adc_phase_axis_source, fdw_dac902_phase_control, fdw_lxb_probe_io, fdw_pwm_axi, fdw_lxb_mdio

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7z020clg484-2
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name system

# This script was generated for a remote BD. To create a non-remote design,
# change the variable <run_remote_bd_flow> to <0>.

set run_remote_bd_flow 1
if { $run_remote_bd_flow == 1 } {
  # Set the reference directory for source file relative paths (by default 
  # the value is script directory path)
  set origin_dir ./sources

  # Use origin directory path location variable, if specified in the tcl shell
  if { [info exists ::origin_dir_loc] } {
     set origin_dir $::origin_dir_loc
  }

  set str_bd_folder [file normalize ${origin_dir}]
  set str_bd_filepath ${str_bd_folder}/${design_name}/${design_name}.bd

  # Check if remote design exists on disk
  if { [file exists $str_bd_filepath ] == 1 } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2030 -severity "ERROR" "The remote BD file path <$str_bd_filepath> already exists!"}
     common::send_gid_msg -ssname BD::TCL -id 2031 -severity "INFO" "To create a non-remote BD, change the variable <run_remote_bd_flow> to <0>."
     common::send_gid_msg -ssname BD::TCL -id 2032 -severity "INFO" "Also make sure there is no design <$design_name> existing in your current project."

     return 1
  }

  # Check if design exists in memory
  set list_existing_designs [get_bd_designs -quiet $design_name]
  if { $list_existing_designs ne "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2033 -severity "ERROR" "The design <$design_name> already exists in this project! Will not create the remote BD <$design_name> at the folder <$str_bd_folder>."}

     common::send_gid_msg -ssname BD::TCL -id 2034 -severity "INFO" "To create a non-remote BD, change the variable <run_remote_bd_flow> to <0> or please set a different value to variable <design_name>."

     return 1
  }

  # Check if design exists on disk within project
  set list_existing_designs [get_files -quiet */${design_name}.bd]
  if { $list_existing_designs ne "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2035 -severity "ERROR" "The design <$design_name> already exists in this project at location:
    $list_existing_designs"}
     catch {common::send_gid_msg -ssname BD::TCL -id 2036 -severity "ERROR" "Will not create the remote BD <$design_name> at the folder <$str_bd_folder>."}

     common::send_gid_msg -ssname BD::TCL -id 2037 -severity "INFO" "To create a non-remote BD, change the variable <run_remote_bd_flow> to <0> or please set a different value to variable <design_name>."

     return 1
  }

  # Now can create the remote BD
  # NOTE - usage of <-dir> will create <$str_bd_folder/$design_name/$design_name.bd>
  create_bd_design -dir $str_bd_folder $design_name
} else {

  # Create regular design
  if { [catch {create_bd_design $design_name} errmsg] } {
     common::send_gid_msg -ssname BD::TCL -id 2038 -severity "INFO" "Please set a different value to variable <design_name>."

     return 1
  }
}

current_bd_design $design_name

set bCheckIPsPassed 1
##################################################################
# CHECK IPs
##################################################################
set bCheckIPs 1
if { $bCheckIPs == 1 } {
   set list_check_ips "\ 
xilinx.com:ip:processing_system7:5.5\
xilinx.com:ip:proc_sys_reset:5.0\
xilinx.com:ip:xlconstant:1.1\
xilinx.com:ip:ila:6.2\
xilinx.com:ip:xlconcat:2.1\
xilinx.com:ip:axi_gpio:2.0\
xilinx.com:ip:util_vector_logic:2.0\
xilinx.com:ip:clk_wiz:6.0\
xilinx.com:ip:axis_data_fifo:2.0\
xilinx.com:ip:axi_dma:7.1\
xilinx.com:ip:xlslice:1.0\
xilinx.com:ip:gmii_to_rgmii:4.1\
"

   set list_ips_missing ""
   common::send_gid_msg -ssname BD::TCL -id 2011 -severity "INFO" "Checking if the following IPs exist in the project's IP catalog: $list_check_ips ."

   foreach ip_vlnv $list_check_ips {
      set ip_obj [get_ipdefs -all $ip_vlnv]
      if { $ip_obj eq "" } {
         lappend list_ips_missing $ip_vlnv
      }
   }

   if { $list_ips_missing ne "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2012 -severity "ERROR" "The following IPs are not found in the IP Catalog:\n  $list_ips_missing\n\nResolution: Please add the repository containing the IP(s) to the project." }
      set bCheckIPsPassed 0
   }

}

##################################################################
# CHECK Modules
##################################################################
set bCheckModules 1
if { $bCheckModules == 1 } {
   set list_check_mods "\ 
fdw_pwm_axi\
fdw_digital_axi\
fdw_probe_router\
fdw_pwm_burst_axi\
fdw_adc_trigger_gate\
fdw_adc_phase_axis_source\
fdw_dac902_phase_control\
fdw_lxb_probe_io\
fdw_pwm_axi\
fdw_lxb_mdio\
"

   set list_mods_missing ""
   common::send_gid_msg -ssname BD::TCL -id 2020 -severity "INFO" "Checking if the following modules exist in the project's sources: $list_check_mods ."

   foreach mod_vlnv $list_check_mods {
      if { [can_resolve_reference $mod_vlnv] == 0 } {
         lappend list_mods_missing $mod_vlnv
      }
   }

   if { $list_mods_missing ne "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2021 -severity "ERROR" "The following module(s) are not found in the project: $list_mods_missing" }
      common::send_gid_msg -ssname BD::TCL -id 2022 -severity "INFO" "Please add source files for the missing module(s) above."
      set bCheckIPsPassed 0
   }
}

if { $bCheckIPsPassed != 1 } {
  common::send_gid_msg -ssname BD::TCL -id 2023 -severity "WARNING" "Will not continue with creation of design due to the error(s) above."
  return 3
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set DDR_0 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddrx_rtl:1.0 DDR_0 ]

  set FIXED_IO_0 [ create_bd_intf_port -mode Master -vlnv xilinx.com:display_processing_system7:fixedio_rtl:1.0 FIXED_IO_0 ]


  # Create ports
  set adc_data [ create_bd_port -dir I -from 11 -to 0 adc_data ]
  set adc_otr [ create_bd_port -dir I adc_otr ]
  set adc_clk [ create_bd_port -dir O -type clk adc_clk ]
  set dac_data [ create_bd_port -dir O -from 11 -to 0 dac_data ]
  set dac_clk [ create_bd_port -dir O dac_clk ]
  set probe_io [ create_bd_port -dir IO -from 1 -to 0 probe_io ]
  set k1_ctrl [ create_bd_port -dir O -from 0 -to 0 k1_ctrl ]
  set k2_ctrl [ create_bd_port -dir O -from 0 -to 0 k2_ctrl ]
  set k3_ctrl [ create_bd_port -dir O -from 0 -to 0 k3_ctrl ]
  set k4_ctrl [ create_bd_port -dir O -from 0 -to 0 k4_ctrl ]
  set k5_ctrl [ create_bd_port -dir O -from 0 -to 0 k5_ctrl ]
  set k6_ctrl [ create_bd_port -dir O -from 0 -to 0 k6_ctrl ]
  set k7_ctrl [ create_bd_port -dir O -from 0 -to 0 k7_ctrl ]
  set eth_txd [ create_bd_port -dir O -from 3 -to 0 eth_txd ]
  set eth_txc [ create_bd_port -dir O eth_txc ]
  set eth_tx_ctl [ create_bd_port -dir O eth_tx_ctl ]
  set eth_rxd [ create_bd_port -dir I -from 3 -to 0 eth_rxd ]
  set eth_rxc [ create_bd_port -dir I eth_rxc ]
  set eth_rx_ctl [ create_bd_port -dir I eth_rx_ctl ]
  set eth_mdc [ create_bd_port -dir O eth_mdc ]
  set eth_mdio [ create_bd_port -dir IO eth_mdio ]
  set uart_tx [ create_bd_port -dir O uart_tx ]
  set uart_rx [ create_bd_port -dir I uart_rx ]

  # Create instance: processing_system7_0, and set properties
  set processing_system7_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 processing_system7_0 ]
  set_property -dict [list \
    CONFIG.PCW_ACT_APU_PERIPHERAL_FREQMHZ {666.666687} \
    CONFIG.PCW_ACT_CAN_PERIPHERAL_FREQMHZ {10.000000} \
    CONFIG.PCW_ACT_DCI_PERIPHERAL_FREQMHZ {10.158730} \
    CONFIG.PCW_ACT_ENET0_PERIPHERAL_FREQMHZ {125.000000} \
    CONFIG.PCW_ACT_ENET1_PERIPHERAL_FREQMHZ {10.000000} \
    CONFIG.PCW_ACT_FPGA0_PERIPHERAL_FREQMHZ {100.000000} \
    CONFIG.PCW_ACT_FPGA1_PERIPHERAL_FREQMHZ {200.000000} \
    CONFIG.PCW_ACT_FPGA2_PERIPHERAL_FREQMHZ {10.000000} \
    CONFIG.PCW_ACT_FPGA3_PERIPHERAL_FREQMHZ {10.000000} \
    CONFIG.PCW_ACT_PCAP_PERIPHERAL_FREQMHZ {200.000000} \
    CONFIG.PCW_ACT_QSPI_PERIPHERAL_FREQMHZ {200.000000} \
    CONFIG.PCW_ACT_SDIO_PERIPHERAL_FREQMHZ {100.000000} \
    CONFIG.PCW_ACT_SMC_PERIPHERAL_FREQMHZ {10.000000} \
    CONFIG.PCW_ACT_SPI_PERIPHERAL_FREQMHZ {10.000000} \
    CONFIG.PCW_ACT_TPIU_PERIPHERAL_FREQMHZ {200.000000} \
    CONFIG.PCW_ACT_TTC0_CLK0_PERIPHERAL_FREQMHZ {111.111115} \
    CONFIG.PCW_ACT_TTC0_CLK1_PERIPHERAL_FREQMHZ {111.111115} \
    CONFIG.PCW_ACT_TTC0_CLK2_PERIPHERAL_FREQMHZ {111.111115} \
    CONFIG.PCW_ACT_TTC1_CLK0_PERIPHERAL_FREQMHZ {111.111115} \
    CONFIG.PCW_ACT_TTC1_CLK1_PERIPHERAL_FREQMHZ {111.111115} \
    CONFIG.PCW_ACT_TTC1_CLK2_PERIPHERAL_FREQMHZ {111.111115} \
    CONFIG.PCW_ACT_UART_PERIPHERAL_FREQMHZ {100.000000} \
    CONFIG.PCW_ACT_WDT_PERIPHERAL_FREQMHZ {111.111115} \
    CONFIG.PCW_CLK0_FREQ {100000000} \
    CONFIG.PCW_CLK1_FREQ {200000000} \
    CONFIG.PCW_CLK2_FREQ {10000000} \
    CONFIG.PCW_CLK3_FREQ {10000000} \
    CONFIG.PCW_DDR_RAM_HIGHADDR {0x1FFFFFFF} \
    CONFIG.PCW_ENET0_ENET0_IO {EMIO} \
    CONFIG.PCW_ENET0_GRP_MDIO_ENABLE {1} \
    CONFIG.PCW_ENET0_GRP_MDIO_IO {EMIO} \
    CONFIG.PCW_ENET0_PERIPHERAL_ENABLE {1} \
    CONFIG.PCW_ENET0_PERIPHERAL_FREQMHZ {1000 Mbps} \
    CONFIG.PCW_EN_CLK0_PORT {1} \
    CONFIG.PCW_EN_CLK1_PORT {1} \
    CONFIG.PCW_EN_EMIO_CD_SDIO0 {0} \
    CONFIG.PCW_EN_EMIO_ENET0 {1} \
    CONFIG.PCW_EN_EMIO_UART0 {1} \
    CONFIG.PCW_EN_ENET0 {1} \
    CONFIG.PCW_EN_QSPI {1} \
    CONFIG.PCW_EN_RST0_PORT {1} \
    CONFIG.PCW_EN_SDIO0 {1} \
    CONFIG.PCW_EN_UART0 {1} \
    CONFIG.PCW_FCLK_CLK0_BUF {FALSE} \
    CONFIG.PCW_FCLK_CLK1_BUF {TRUE} \
    CONFIG.PCW_FPGA0_PERIPHERAL_FREQMHZ {100.000000} \
    CONFIG.PCW_FPGA1_PERIPHERAL_FREQMHZ {200.000000} \
    CONFIG.PCW_FPGA_FCLK0_ENABLE {1} \
    CONFIG.PCW_FPGA_FCLK1_ENABLE {1} \
    CONFIG.PCW_MIO_1_IOTYPE {LVCMOS 3.3V} \
    CONFIG.PCW_MIO_1_PULLUP {enabled} \
    CONFIG.PCW_MIO_1_SLEW {slow} \
    CONFIG.PCW_MIO_2_IOTYPE {LVCMOS 3.3V} \
    CONFIG.PCW_MIO_2_SLEW {slow} \
    CONFIG.PCW_MIO_3_IOTYPE {LVCMOS 3.3V} \
    CONFIG.PCW_MIO_3_SLEW {slow} \
    CONFIG.PCW_MIO_40_IOTYPE {LVCMOS 3.3V} \
    CONFIG.PCW_MIO_40_PULLUP {enabled} \
    CONFIG.PCW_MIO_40_SLEW {slow} \
    CONFIG.PCW_MIO_41_IOTYPE {LVCMOS 3.3V} \
    CONFIG.PCW_MIO_41_PULLUP {enabled} \
    CONFIG.PCW_MIO_41_SLEW {slow} \
    CONFIG.PCW_MIO_42_IOTYPE {LVCMOS 3.3V} \
    CONFIG.PCW_MIO_42_PULLUP {enabled} \
    CONFIG.PCW_MIO_42_SLEW {slow} \
    CONFIG.PCW_MIO_43_IOTYPE {LVCMOS 3.3V} \
    CONFIG.PCW_MIO_43_PULLUP {enabled} \
    CONFIG.PCW_MIO_43_SLEW {slow} \
    CONFIG.PCW_MIO_44_IOTYPE {LVCMOS 3.3V} \
    CONFIG.PCW_MIO_44_PULLUP {enabled} \
    CONFIG.PCW_MIO_44_SLEW {slow} \
    CONFIG.PCW_MIO_45_IOTYPE {LVCMOS 3.3V} \
    CONFIG.PCW_MIO_45_PULLUP {enabled} \
    CONFIG.PCW_MIO_45_SLEW {slow} \
    CONFIG.PCW_MIO_47_IOTYPE {LVCMOS 3.3V} \
    CONFIG.PCW_MIO_47_PULLUP {enabled} \
    CONFIG.PCW_MIO_47_SLEW {slow} \
    CONFIG.PCW_MIO_4_IOTYPE {LVCMOS 3.3V} \
    CONFIG.PCW_MIO_4_SLEW {slow} \
    CONFIG.PCW_MIO_5_IOTYPE {LVCMOS 3.3V} \
    CONFIG.PCW_MIO_5_SLEW {slow} \
    CONFIG.PCW_MIO_6_IOTYPE {LVCMOS 3.3V} \
    CONFIG.PCW_MIO_6_SLEW {slow} \
    CONFIG.PCW_MIO_TREE_PERIPHERALS {unassigned#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#SD\
0#SD 0#SD 0#SD 0#SD 0#SD 0#unassigned#SD 0#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned} \
    CONFIG.PCW_MIO_TREE_SIGNALS {unassigned#qspi0_ss_b#qspi0_io[0]#qspi0_io[1]#qspi0_io[2]#qspi0_io[3]/HOLD_B#qspi0_sclk#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#clk#cmd#data[0]#data[1]#data[2]#data[3]#unassigned#cd#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned}\
\
    CONFIG.PCW_PRESET_BANK1_VOLTAGE {LVCMOS 3.3V} \
    CONFIG.PCW_QSPI_GRP_FBCLK_ENABLE {0} \
    CONFIG.PCW_QSPI_GRP_IO1_ENABLE {0} \
    CONFIG.PCW_QSPI_GRP_SINGLE_SS_ENABLE {1} \
    CONFIG.PCW_QSPI_GRP_SINGLE_SS_IO {MIO 1 .. 6} \
    CONFIG.PCW_QSPI_GRP_SS1_ENABLE {0} \
    CONFIG.PCW_QSPI_PERIPHERAL_ENABLE {1} \
    CONFIG.PCW_QSPI_PERIPHERAL_FREQMHZ {200} \
    CONFIG.PCW_QSPI_QSPI_IO {MIO 1 .. 6} \
    CONFIG.PCW_SD0_GRP_CD_ENABLE {1} \
    CONFIG.PCW_SD0_GRP_CD_IO {MIO 47} \
    CONFIG.PCW_SD0_GRP_POW_ENABLE {0} \
    CONFIG.PCW_SD0_GRP_WP_ENABLE {0} \
    CONFIG.PCW_SD0_PERIPHERAL_ENABLE {1} \
    CONFIG.PCW_SD0_SD0_IO {MIO 40 .. 45} \
    CONFIG.PCW_SDIO_PERIPHERAL_FREQMHZ {100} \
    CONFIG.PCW_SDIO_PERIPHERAL_VALID {1} \
    CONFIG.PCW_SINGLE_QSPI_DATA_MODE {x4} \
    CONFIG.PCW_UART0_GRP_FULL_ENABLE {0} \
    CONFIG.PCW_UART0_PERIPHERAL_ENABLE {1} \
    CONFIG.PCW_UART0_UART0_IO {EMIO} \
    CONFIG.PCW_UART_PERIPHERAL_FREQMHZ {100} \
    CONFIG.PCW_UART_PERIPHERAL_VALID {1} \
    CONFIG.PCW_UIPARAM_ACT_DDR_FREQ_MHZ {533.333374} \
    CONFIG.PCW_UIPARAM_DDR_BL {8} \
    CONFIG.PCW_UIPARAM_DDR_BUS_WIDTH {16 Bit} \
    CONFIG.PCW_UIPARAM_DDR_ECC {Disabled} \
    CONFIG.PCW_UIPARAM_DDR_MEMORY_TYPE {DDR 3} \
    CONFIG.PCW_UIPARAM_DDR_PARTNO {MT41K256M16 RE-125} \
    CONFIG.PCW_USE_FABRIC_INTERRUPT {0} \
    CONFIG.PCW_USE_M_AXI_GP0 {1} \
    CONFIG.PCW_USE_S_AXI_HP0 {1} \
  ] $processing_system7_0


  # Create instance: pwm_control, and set properties
  set block_name fdw_pwm_axi
  set block_cell_name pwm_control
  if { [catch {set pwm_control [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $pwm_control eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: rst_ps7_0_100M, and set properties
  set rst_ps7_0_100M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_ps7_0_100M ]

  # Create instance: constant_one, and set properties
  set constant_one [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 constant_one ]
  set_property CONFIG.CONST_VAL {1} $constant_one


  # Create instance: ps7_0_axi_periph, and set properties
  set ps7_0_axi_periph [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 ps7_0_axi_periph ]
  set_property CONFIG.NUM_MI {9} $ps7_0_axi_periph


  # Create instance: ila_pwm, and set properties
  set ila_pwm [ create_bd_cell -type ip -vlnv xilinx.com:ip:ila:6.2 ila_pwm ]
  set_property -dict [list \
    CONFIG.C_DATA_DEPTH {1024} \
    CONFIG.C_MONITOR_TYPE {Native} \
    CONFIG.C_NUM_OF_PROBES {2} \
    CONFIG.C_PROBE0_WIDTH {1} \
    CONFIG.C_PROBE1_WIDTH {1} \
  ] $ila_pwm


  # Create instance: digital_capture, and set properties
  set block_name fdw_digital_axi
  set block_cell_name digital_capture
  if { [catch {set digital_capture [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $digital_capture eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [list \
    CONFIG.MAX_SAMPLES {1024} \
    CONFIG.SAMPLE_WIDTH {2} \
  ] $digital_capture


  # Create instance: sample_vector, and set properties
  set sample_vector [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 sample_vector ]
  set_property CONFIG.NUM_PORTS {2} $sample_vector


  # Create instance: probe_router, and set properties
  set block_name fdw_probe_router
  set block_cell_name probe_router
  if { [catch {set probe_router [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $probe_router eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: finite_pwm, and set properties
  set block_name fdw_pwm_burst_axi
  set block_cell_name finite_pwm
  if { [catch {set finite_pwm [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $finite_pwm eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: probe_gpio, and set properties
  set probe_gpio [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 probe_gpio ]
  set_property -dict [list \
    CONFIG.C_ALL_INPUTS_2 {1} \
    CONFIG.C_ALL_OUTPUTS {1} \
    CONFIG.C_DOUT_DEFAULT {0x00000000} \
    CONFIG.C_GPIO2_WIDTH {32} \
    CONFIG.C_GPIO_WIDTH {32} \
    CONFIG.C_IS_DUAL {1} \
  ] $probe_gpio


  # Create instance: pwm_activity_or, and set properties
  set pwm_activity_or [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 pwm_activity_or ]
  set_property -dict [list \
    CONFIG.C_OPERATION {or} \
    CONFIG.C_SIZE {1} \
  ] $pwm_activity_or


  # Create instance: adc_clk_wiz, and set properties
  set adc_clk_wiz [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:6.0 adc_clk_wiz ]
  set_property -dict [list \
    CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {25.000} \
    CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {25.000} \
    CONFIG.CLKOUT2_REQUESTED_PHASE {180.000} \
    CONFIG.CLKOUT2_USED {true} \
    CONFIG.PRIM_IN_FREQ {100.000} \
    CONFIG.RESET_TYPE {ACTIVE_LOW} \
  ] $adc_clk_wiz


  # Create instance: rst_adc_25m, and set properties
  set rst_adc_25m [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_adc_25m ]

  # Create instance: adc_axis_fifo, and set properties
  set adc_axis_fifo [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 adc_axis_fifo ]
  set_property -dict [list \
    CONFIG.FIFO_DEPTH {16384} \
    CONFIG.HAS_TLAST {1} \
    CONFIG.IS_ACLK_ASYNC {1} \
    CONFIG.TDATA_NUM_BYTES {2} \
  ] $adc_axis_fifo


  # Create instance: adc_dma, and set properties
  set adc_dma [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dma:7.1 adc_dma ]
  set_property -dict [list \
    CONFIG.c_include_mm2s {0} \
    CONFIG.c_include_s2mm {1} \
    CONFIG.c_include_sg {0} \
    CONFIG.c_m_axi_s2mm_data_width {32} \
    CONFIG.c_s2mm_burst_size {16} \
    CONFIG.c_s_axis_s2mm_tdata_width {16} \
    CONFIG.c_sg_length_width {23} \
  ] $adc_dma


  # Create instance: capture_gpio, and set properties
  set capture_gpio [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 capture_gpio ]
  set_property -dict [list \
    CONFIG.C_ALL_INPUTS_2 {1} \
    CONFIG.C_ALL_OUTPUTS {1} \
    CONFIG.C_DOUT_DEFAULT {0x00000000} \
    CONFIG.C_GPIO2_WIDTH {32} \
    CONFIG.C_GPIO_WIDTH {32} \
    CONFIG.C_IS_DUAL {1} \
  ] $capture_gpio


  # Create instance: dma_memory_interconnect, and set properties
  set dma_memory_interconnect [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 dma_memory_interconnect ]
  set_property -dict [list \
    CONFIG.NUM_MI {1} \
    CONFIG.NUM_SI {1} \
  ] $dma_memory_interconnect


  # Create instance: adc_status_concat, and set properties
  set adc_status_concat [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 adc_status_concat ]
  set_property -dict [list \
    CONFIG.IN3_WIDTH {4} \
    CONFIG.NUM_PORTS {4} \
  ] $adc_status_concat


  # Create instance: adc_trigger_gate, and set properties
  set block_name fdw_adc_trigger_gate
  set block_cell_name adc_trigger_gate
  if { [catch {set adc_trigger_gate [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $adc_trigger_gate eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: dac_gpio, and set properties
  set dac_gpio [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 dac_gpio ]
  set_property -dict [list \
    CONFIG.C_ALL_INPUTS_2 {1} \
    CONFIG.C_ALL_OUTPUTS {1} \
    CONFIG.C_DOUT_DEFAULT {0x00000000} \
    CONFIG.C_GPIO2_WIDTH {32} \
    CONFIG.C_GPIO_WIDTH {32} \
    CONFIG.C_IS_DUAL {1} \
  ] $dac_gpio


  # Create instance: adc_capture, and set properties
  set block_name fdw_adc_phase_axis_source
  set block_cell_name adc_capture
  if { [catch {set adc_capture [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $adc_capture eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property CONFIG.FRAME_SAMPLES {8192} $adc_capture


  # Create instance: dac902_control, and set properties
  set block_name fdw_dac902_phase_control
  set block_cell_name dac902_control
  if { [catch {set dac902_control [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $dac902_control eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property CONFIG.ROM_FILE {c:/Users/33525/FDW_NEXT/hardware/7020/candidates/lxb_r4_port/rtl/fdw_sine12_4096.mem} $dac902_control


  # Create instance: capture_control_slice, and set properties
  set capture_control_slice [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 capture_control_slice ]
  set_property -dict [list \
    CONFIG.DIN_FROM {2} \
    CONFIG.DIN_TO {0} \
    CONFIG.DIN_WIDTH {32} \
    CONFIG.DOUT_WIDTH {3} \
  ] $capture_control_slice


  # Create instance: probe_pads, and set properties
  set block_name fdw_lxb_probe_io
  set block_cell_name probe_pads
  if { [catch {set probe_pads [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $probe_pads eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: pwm_control_b, and set properties
  set block_name fdw_pwm_axi
  set block_cell_name pwm_control_b
  if { [catch {set pwm_control_b [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $pwm_control_b eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: lxb_gpio, and set properties
  set lxb_gpio [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 lxb_gpio ]
  set_property -dict [list \
    CONFIG.C_ALL_OUTPUTS {1} \
    CONFIG.C_ALL_OUTPUTS_2 {1} \
    CONFIG.C_DOUT_DEFAULT {0x00000000} \
    CONFIG.C_DOUT_DEFAULT_2 {0x00000000} \
    CONFIG.C_GPIO2_WIDTH {2} \
    CONFIG.C_GPIO_WIDTH {7} \
    CONFIG.C_IS_DUAL {1} \
  ] $lxb_gpio


  # Create instance: output_permit, and set properties
  set output_permit [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 output_permit ]
  set_property -dict [list \
    CONFIG.DIN_FROM {3} \
    CONFIG.DIN_TO {3} \
    CONFIG.DIN_WIDTH {32} \
    CONFIG.DOUT_WIDTH {1} \
  ] $output_permit


  # Create instance: all_pwm_activity, and set properties
  set all_pwm_activity [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 all_pwm_activity ]
  set_property -dict [list \
    CONFIG.C_OPERATION {or} \
    CONFIG.C_SIZE {1} \
  ] $all_pwm_activity


  # Create instance: relay_bit_0, and set properties
  set relay_bit_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 relay_bit_0 ]
  set_property -dict [list \
    CONFIG.DIN_FROM {0} \
    CONFIG.DIN_TO {0} \
    CONFIG.DIN_WIDTH {7} \
    CONFIG.DOUT_WIDTH {1} \
  ] $relay_bit_0


  # Create instance: relay_bit_1, and set properties
  set relay_bit_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 relay_bit_1 ]
  set_property -dict [list \
    CONFIG.DIN_FROM {1} \
    CONFIG.DIN_TO {1} \
    CONFIG.DIN_WIDTH {7} \
    CONFIG.DOUT_WIDTH {1} \
  ] $relay_bit_1


  # Create instance: relay_bit_2, and set properties
  set relay_bit_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 relay_bit_2 ]
  set_property -dict [list \
    CONFIG.DIN_FROM {2} \
    CONFIG.DIN_TO {2} \
    CONFIG.DIN_WIDTH {7} \
    CONFIG.DOUT_WIDTH {1} \
  ] $relay_bit_2


  # Create instance: relay_bit_3, and set properties
  set relay_bit_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 relay_bit_3 ]
  set_property -dict [list \
    CONFIG.DIN_FROM {3} \
    CONFIG.DIN_TO {3} \
    CONFIG.DIN_WIDTH {7} \
    CONFIG.DOUT_WIDTH {1} \
  ] $relay_bit_3


  # Create instance: relay_bit_4, and set properties
  set relay_bit_4 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 relay_bit_4 ]
  set_property -dict [list \
    CONFIG.DIN_FROM {4} \
    CONFIG.DIN_TO {4} \
    CONFIG.DIN_WIDTH {7} \
    CONFIG.DOUT_WIDTH {1} \
  ] $relay_bit_4


  # Create instance: relay_bit_5, and set properties
  set relay_bit_5 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 relay_bit_5 ]
  set_property -dict [list \
    CONFIG.DIN_FROM {5} \
    CONFIG.DIN_TO {5} \
    CONFIG.DIN_WIDTH {7} \
    CONFIG.DOUT_WIDTH {1} \
  ] $relay_bit_5


  # Create instance: relay_bit_6, and set properties
  set relay_bit_6 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 relay_bit_6 ]
  set_property -dict [list \
    CONFIG.DIN_FROM {6} \
    CONFIG.DIN_TO {6} \
    CONFIG.DIN_WIDTH {7} \
    CONFIG.DOUT_WIDTH {1} \
  ] $relay_bit_6


  # Create instance: ethernet_bridge, and set properties
  set ethernet_bridge [ create_bd_cell -type ip -vlnv xilinx.com:ip:gmii_to_rgmii:4.1 ethernet_bridge ]
  set_property -dict [list \
    CONFIG.C_EXTERNAL_CLOCK {false} \
    CONFIG.C_PHYADDR {8} \
    CONFIG.RGMII_TXC_SKEW {0} \
    CONFIG.SupportLevel {Include_Shared_Logic_in_Core} \
  ] $ethernet_bridge


  # Create instance: mdio_pad, and set properties
  set block_name fdw_lxb_mdio
  set block_cell_name mdio_pad
  if { [catch {set mdio_pad [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $mdio_pad eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: no_phy_interrupt, and set properties
  set no_phy_interrupt [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 no_phy_interrupt ]
  set_property CONFIG.CONST_VAL {0} $no_phy_interrupt


  # Create interface connections
  connect_bd_intf_net -intf_net adc_axis_fifo_M_AXIS [get_bd_intf_pins adc_axis_fifo/M_AXIS] [get_bd_intf_pins adc_dma/S_AXIS_S2MM]
  connect_bd_intf_net -intf_net adc_dma_M_AXI_S2MM [get_bd_intf_pins adc_dma/M_AXI_S2MM] [get_bd_intf_pins dma_memory_interconnect/S00_AXI]
  connect_bd_intf_net -intf_net dma_memory_interconnect_M00_AXI [get_bd_intf_pins dma_memory_interconnect/M00_AXI] [get_bd_intf_pins processing_system7_0/S_AXI_HP0]
  connect_bd_intf_net -intf_net processing_system7_0_DDR [get_bd_intf_ports DDR_0] [get_bd_intf_pins processing_system7_0/DDR]
  connect_bd_intf_net -intf_net processing_system7_0_FIXED_IO [get_bd_intf_ports FIXED_IO_0] [get_bd_intf_pins processing_system7_0/FIXED_IO]
  connect_bd_intf_net -intf_net processing_system7_0_GMII_ETHERNET_0 [get_bd_intf_pins processing_system7_0/GMII_ETHERNET_0] [get_bd_intf_pins ethernet_bridge/GMII]
  connect_bd_intf_net -intf_net processing_system7_0_MDIO_ETHERNET_0 [get_bd_intf_pins processing_system7_0/MDIO_ETHERNET_0] [get_bd_intf_pins ethernet_bridge/MDIO_GEM]
  connect_bd_intf_net -intf_net processing_system7_0_M_AXI_GP0 [get_bd_intf_pins processing_system7_0/M_AXI_GP0] [get_bd_intf_pins ps7_0_axi_periph/S00_AXI]
  connect_bd_intf_net -intf_net ps7_0_axi_periph_M00_AXI [get_bd_intf_pins ps7_0_axi_periph/M00_AXI] [get_bd_intf_pins pwm_control/S_AXI]
  connect_bd_intf_net -intf_net ps7_0_axi_periph_M01_AXI [get_bd_intf_pins ps7_0_axi_periph/M01_AXI] [get_bd_intf_pins digital_capture/S_AXI]
  connect_bd_intf_net -intf_net ps7_0_axi_periph_M02_AXI [get_bd_intf_pins ps7_0_axi_periph/M02_AXI] [get_bd_intf_pins probe_gpio/S_AXI]
  connect_bd_intf_net -intf_net ps7_0_axi_periph_M03_AXI [get_bd_intf_pins ps7_0_axi_periph/M03_AXI] [get_bd_intf_pins finite_pwm/S_AXI]
  connect_bd_intf_net -intf_net ps7_0_axi_periph_M04_AXI [get_bd_intf_pins ps7_0_axi_periph/M04_AXI] [get_bd_intf_pins adc_dma/S_AXI_LITE]
  connect_bd_intf_net -intf_net ps7_0_axi_periph_M05_AXI [get_bd_intf_pins ps7_0_axi_periph/M05_AXI] [get_bd_intf_pins capture_gpio/S_AXI]
  connect_bd_intf_net -intf_net ps7_0_axi_periph_M06_AXI [get_bd_intf_pins ps7_0_axi_periph/M06_AXI] [get_bd_intf_pins dac_gpio/S_AXI]
  connect_bd_intf_net -intf_net ps7_0_axi_periph_M07_AXI [get_bd_intf_pins ps7_0_axi_periph/M07_AXI] [get_bd_intf_pins lxb_gpio/S_AXI]
  connect_bd_intf_net -intf_net ps7_0_axi_periph_M08_AXI [get_bd_intf_pins ps7_0_axi_periph/M08_AXI] [get_bd_intf_pins pwm_control_b/S_AXI]

  # Create port connections
  connect_bd_net -net Net  [get_bd_ports probe_io] \
  [get_bd_pins probe_pads/probe_io]
  connect_bd_net -net Net1  [get_bd_ports eth_mdio] \
  [get_bd_pins mdio_pad/mdio]
  connect_bd_net -net adc_axis_fifo_s_axis_tready  [get_bd_pins adc_axis_fifo/s_axis_tready] \
  [get_bd_pins adc_capture/m_axis_tready]
  connect_bd_net -net adc_capture_adc_clk  [get_bd_pins adc_capture/adc_clk] \
  [get_bd_ports adc_clk]
  connect_bd_net -net adc_capture_capture_active  [get_bd_pins adc_capture/capture_active] \
  [get_bd_pins adc_status_concat/In0]
  connect_bd_net -net adc_capture_capture_clear_ack  [get_bd_pins adc_capture/capture_clear_ack] \
  [get_bd_pins adc_status_concat/In2]
  connect_bd_net -net adc_capture_capture_done  [get_bd_pins adc_capture/capture_done] \
  [get_bd_pins adc_status_concat/In1]
  connect_bd_net -net adc_capture_fifo_aresetn  [get_bd_pins adc_capture/fifo_aresetn] \
  [get_bd_pins adc_axis_fifo/s_axis_aresetn]
  connect_bd_net -net adc_capture_m_axis_tdata  [get_bd_pins adc_capture/m_axis_tdata] \
  [get_bd_pins adc_axis_fifo/s_axis_tdata]
  connect_bd_net -net adc_capture_m_axis_tlast  [get_bd_pins adc_capture/m_axis_tlast] \
  [get_bd_pins adc_axis_fifo/s_axis_tlast]
  connect_bd_net -net adc_capture_m_axis_tvalid  [get_bd_pins adc_capture/m_axis_tvalid] \
  [get_bd_pins adc_axis_fifo/s_axis_tvalid]
  connect_bd_net -net adc_capture_phase_status_word  [get_bd_pins adc_capture/phase_status_word] \
  [get_bd_pins capture_gpio/gpio2_io_i]
  connect_bd_net -net adc_clk_wiz_clk_out1  [get_bd_pins adc_clk_wiz/clk_out1] \
  [get_bd_pins adc_capture/adc_clk_0] \
  [get_bd_pins dac902_control/sample_clk]
  connect_bd_net -net adc_clk_wiz_clk_out2  [get_bd_pins adc_clk_wiz/clk_out2] \
  [get_bd_pins adc_axis_fifo/s_axis_aclk] \
  [get_bd_pins rst_adc_25m/slowest_sync_clk] \
  [get_bd_pins adc_trigger_gate/sample_clk] \
  [get_bd_pins adc_capture/sample_clk]
  connect_bd_net -net adc_clk_wiz_locked  [get_bd_pins adc_clk_wiz/locked] \
  [get_bd_pins rst_adc_25m/dcm_locked]
  connect_bd_net -net adc_data_1  [get_bd_ports adc_data] \
  [get_bd_pins adc_capture/adc_data]
  connect_bd_net -net adc_otr_1  [get_bd_ports adc_otr] \
  [get_bd_pins adc_capture/adc_otr]
  connect_bd_net -net adc_status_concat_dout  [get_bd_pins adc_status_concat/dout] \
  [get_bd_pins adc_capture/legacy_status]
  connect_bd_net -net adc_trigger_gate_legacy_control  [get_bd_pins adc_trigger_gate/legacy_control] \
  [get_bd_pins adc_capture/capture_control]
  connect_bd_net -net adc_trigger_gate_trigger_status  [get_bd_pins adc_trigger_gate/trigger_status] \
  [get_bd_pins adc_status_concat/In3]
  connect_bd_net -net all_pwm_activity_Res  [get_bd_pins all_pwm_activity/Res] \
  [get_bd_pins probe_router/pwm_active]
  connect_bd_net -net capture_control_slice_Dout  [get_bd_pins capture_control_slice/Dout] \
  [get_bd_pins adc_trigger_gate/capture_control]
  connect_bd_net -net capture_gpio_gpio_io_o  [get_bd_pins capture_gpio/gpio_io_o] \
  [get_bd_pins capture_control_slice/Din] \
  [get_bd_pins adc_capture/phase_command_word]
  connect_bd_net -net constant_one_dout  [get_bd_pins constant_one/dout] \
  [get_bd_pins rst_ps7_0_100M/dcm_locked]
  connect_bd_net -net dac902_control_dac_clk  [get_bd_pins dac902_control/dac_clk] \
  [get_bd_ports dac_clk]
  connect_bd_net -net dac902_control_dac_data  [get_bd_pins dac902_control/dac_data] \
  [get_bd_ports dac_data]
  connect_bd_net -net dac902_control_reference_ftw  [get_bd_pins dac902_control/reference_ftw] \
  [get_bd_pins adc_capture/reference_ftw]
  connect_bd_net -net dac902_control_reference_inverted  [get_bd_pins dac902_control/reference_inverted] \
  [get_bd_pins adc_capture/reference_inverted]
  connect_bd_net -net dac902_control_reference_phase  [get_bd_pins dac902_control/reference_phase] \
  [get_bd_pins adc_capture/reference_phase]
  connect_bd_net -net dac902_control_reference_tag  [get_bd_pins dac902_control/reference_tag] \
  [get_bd_pins adc_capture/reference_tag]
  connect_bd_net -net dac902_control_reference_valid  [get_bd_pins dac902_control/reference_valid] \
  [get_bd_pins adc_capture/reference_valid]
  connect_bd_net -net dac902_control_status_word  [get_bd_pins dac902_control/status_word] \
  [get_bd_pins dac_gpio/gpio2_io_i]
  connect_bd_net -net dac_gpio_gpio_io_o  [get_bd_pins dac_gpio/gpio_io_o] \
  [get_bd_pins dac902_control/command_word]
  connect_bd_net -net digital_capture_capture_active  [get_bd_pins digital_capture/capture_active] \
  [get_bd_pins probe_router/capture_active]
  connect_bd_net -net eth_rx_ctl_1  [get_bd_ports eth_rx_ctl] \
  [get_bd_pins ethernet_bridge/rgmii_rx_ctl]
  connect_bd_net -net eth_rxc_1  [get_bd_ports eth_rxc] \
  [get_bd_pins ethernet_bridge/rgmii_rxc]
  connect_bd_net -net eth_rxd_1  [get_bd_ports eth_rxd] \
  [get_bd_pins ethernet_bridge/rgmii_rxd]
  connect_bd_net -net ethernet_bridge_mdio_phy_mdc  [get_bd_pins ethernet_bridge/mdio_phy_mdc] \
  [get_bd_ports eth_mdc]
  connect_bd_net -net ethernet_bridge_mdio_phy_o  [get_bd_pins ethernet_bridge/mdio_phy_o] \
  [get_bd_pins mdio_pad/mdio_o]
  connect_bd_net -net ethernet_bridge_mdio_phy_t  [get_bd_pins ethernet_bridge/mdio_phy_t] \
  [get_bd_pins mdio_pad/mdio_t]
  connect_bd_net -net ethernet_bridge_rgmii_tx_ctl  [get_bd_pins ethernet_bridge/rgmii_tx_ctl] \
  [get_bd_ports eth_tx_ctl]
  connect_bd_net -net ethernet_bridge_rgmii_txc  [get_bd_pins ethernet_bridge/rgmii_txc] \
  [get_bd_ports eth_txc]
  connect_bd_net -net ethernet_bridge_rgmii_txd  [get_bd_pins ethernet_bridge/rgmii_txd] \
  [get_bd_ports eth_txd]
  connect_bd_net -net finite_pwm_activity  [get_bd_pins finite_pwm/activity] \
  [get_bd_pins pwm_activity_or/Op2]
  connect_bd_net -net finite_pwm_burst_start  [get_bd_pins finite_pwm/burst_start] \
  [get_bd_pins probe_router/finite_event]
  connect_bd_net -net finite_pwm_pwm_out  [get_bd_pins finite_pwm/pwm_out] \
  [get_bd_pins probe_router/finite_pwm]
  connect_bd_net -net lxb_gpio_gpio2_io_o  [get_bd_pins lxb_gpio/gpio2_io_o] \
  [get_bd_pins probe_pads/output_mask]
  connect_bd_net -net lxb_gpio_gpio_io_o  [get_bd_pins lxb_gpio/gpio_io_o] \
  [get_bd_pins relay_bit_0/Din] \
  [get_bd_pins relay_bit_1/Din] \
  [get_bd_pins relay_bit_2/Din] \
  [get_bd_pins relay_bit_3/Din] \
  [get_bd_pins relay_bit_4/Din] \
  [get_bd_pins relay_bit_5/Din] \
  [get_bd_pins relay_bit_6/Din]
  connect_bd_net -net mdio_pad_mdio_i  [get_bd_pins mdio_pad/mdio_i] \
  [get_bd_pins ethernet_bridge/mdio_phy_i]
  connect_bd_net -net no_phy_interrupt_dout  [get_bd_pins no_phy_interrupt/dout] \
  [get_bd_pins processing_system7_0/ENET0_EXT_INTIN]
  connect_bd_net -net output_permit_Dout  [get_bd_pins output_permit/Dout] \
  [get_bd_pins probe_pads/permit]
  connect_bd_net -net probe_gpio_gpio_io_o  [get_bd_pins probe_gpio/gpio_io_o] \
  [get_bd_pins probe_router/control_word]
  connect_bd_net -net probe_pads_digital_in  [get_bd_pins probe_pads/digital_in] \
  [get_bd_pins probe_router/digital_in]
  connect_bd_net -net probe_router_invalidate_capture  [get_bd_pins probe_router/invalidate_capture] \
  [get_bd_pins digital_capture/invalidate_in]
  connect_bd_net -net probe_router_pwm_out  [get_bd_pins probe_router/pwm_out] \
  [get_bd_pins probe_pads/pwm_a]
  connect_bd_net -net probe_router_sample_out  [get_bd_pins probe_router/sample_out] \
  [get_bd_pins digital_capture/sample_in]
  connect_bd_net -net probe_router_status_word  [get_bd_pins probe_router/status_word] \
  [get_bd_pins probe_gpio/gpio2_io_i] \
  [get_bd_pins output_permit/Din]
  connect_bd_net -net probe_router_trigger_out  [get_bd_pins probe_router/trigger_out] \
  [get_bd_pins adc_trigger_gate/trigger_event] \
  [get_bd_pins digital_capture/trigger_in]
  connect_bd_net -net processing_system7_0_FCLK_CLK0  [get_bd_pins processing_system7_0/FCLK_CLK0] \
  [get_bd_pins processing_system7_0/M_AXI_GP0_ACLK] \
  [get_bd_pins rst_ps7_0_100M/slowest_sync_clk] \
  [get_bd_pins ps7_0_axi_periph/S00_ACLK] \
  [get_bd_pins ps7_0_axi_periph/M00_ACLK] \
  [get_bd_pins ps7_0_axi_periph/ACLK] \
  [get_bd_pins ila_pwm/clk] \
  [get_bd_pins ps7_0_axi_periph/M01_ACLK] \
  [get_bd_pins probe_gpio/s_axi_aclk] \
  [get_bd_pins ps7_0_axi_periph/M02_ACLK] \
  [get_bd_pins ps7_0_axi_periph/M03_ACLK] \
  [get_bd_pins pwm_control/s_axi_aclk] \
  [get_bd_pins probe_router/clk] \
  [get_bd_pins finite_pwm/s_axi_aclk] \
  [get_bd_pins processing_system7_0/S_AXI_HP0_ACLK] \
  [get_bd_pins adc_clk_wiz/clk_in1] \
  [get_bd_pins adc_dma/s_axi_lite_aclk] \
  [get_bd_pins adc_dma/m_axi_s2mm_aclk] \
  [get_bd_pins capture_gpio/s_axi_aclk] \
  [get_bd_pins ps7_0_axi_periph/M04_ACLK] \
  [get_bd_pins ps7_0_axi_periph/M05_ACLK] \
  [get_bd_pins dma_memory_interconnect/ACLK] \
  [get_bd_pins dma_memory_interconnect/S00_ACLK] \
  [get_bd_pins dma_memory_interconnect/M00_ACLK] \
  [get_bd_pins adc_axis_fifo/m_axis_aclk] \
  [get_bd_pins adc_trigger_gate/control_clk] \
  [get_bd_pins dac_gpio/s_axi_aclk] \
  [get_bd_pins ps7_0_axi_periph/M06_ACLK] \
  [get_bd_pins digital_capture/s_axi_aclk] \
  [get_bd_pins dac902_control/control_clk] \
  [get_bd_pins adc_capture/control_clk] \
  [get_bd_pins lxb_gpio/s_axi_aclk] \
  [get_bd_pins pwm_control_b/s_axi_aclk] \
  [get_bd_pins ps7_0_axi_periph/M07_ACLK] \
  [get_bd_pins ps7_0_axi_periph/M08_ACLK]
  connect_bd_net -net processing_system7_0_FCLK_CLK1  [get_bd_pins processing_system7_0/FCLK_CLK1] \
  [get_bd_pins ethernet_bridge/clkin]
  connect_bd_net -net processing_system7_0_FCLK_RESET0_N  [get_bd_pins processing_system7_0/FCLK_RESET0_N] \
  [get_bd_pins rst_ps7_0_100M/ext_reset_in] \
  [get_bd_pins adc_clk_wiz/resetn] \
  [get_bd_pins rst_adc_25m/ext_reset_in]
  connect_bd_net -net processing_system7_0_UART0_TX  [get_bd_pins processing_system7_0/UART0_TX] \
  [get_bd_ports uart_tx]
  connect_bd_net -net pwm_activity_or_Res  [get_bd_pins pwm_activity_or/Res] \
  [get_bd_pins all_pwm_activity/Op1]
  connect_bd_net -net pwm_control_activity  [get_bd_pins pwm_control/activity] \
  [get_bd_pins pwm_activity_or/Op1]
  connect_bd_net -net pwm_control_b_activity  [get_bd_pins pwm_control_b/activity] \
  [get_bd_pins all_pwm_activity/Op2]
  connect_bd_net -net pwm_control_b_pwm_out  [get_bd_pins pwm_control_b/pwm_out] \
  [get_bd_pins probe_pads/pwm_b]
  connect_bd_net -net pwm_control_period_start  [get_bd_pins pwm_control/period_start] \
  [get_bd_pins ila_pwm/probe1] \
  [get_bd_pins sample_vector/In1] \
  [get_bd_pins probe_router/continuous_event]
  connect_bd_net -net pwm_control_pwm_out  [get_bd_pins pwm_control/pwm_out] \
  [get_bd_pins ila_pwm/probe0] \
  [get_bd_pins sample_vector/In0] \
  [get_bd_pins probe_router/continuous_pwm]
  connect_bd_net -net relay_bit_0_Dout  [get_bd_pins relay_bit_0/Dout] \
  [get_bd_ports k1_ctrl]
  connect_bd_net -net relay_bit_1_Dout  [get_bd_pins relay_bit_1/Dout] \
  [get_bd_ports k2_ctrl]
  connect_bd_net -net relay_bit_2_Dout  [get_bd_pins relay_bit_2/Dout] \
  [get_bd_ports k3_ctrl]
  connect_bd_net -net relay_bit_3_Dout  [get_bd_pins relay_bit_3/Dout] \
  [get_bd_ports k4_ctrl]
  connect_bd_net -net relay_bit_4_Dout  [get_bd_pins relay_bit_4/Dout] \
  [get_bd_ports k5_ctrl]
  connect_bd_net -net relay_bit_5_Dout  [get_bd_pins relay_bit_5/Dout] \
  [get_bd_ports k6_ctrl]
  connect_bd_net -net relay_bit_6_Dout  [get_bd_pins relay_bit_6/Dout] \
  [get_bd_ports k7_ctrl]
  connect_bd_net -net rst_adc_25m_peripheral_aresetn  [get_bd_pins rst_adc_25m/peripheral_aresetn] \
  [get_bd_pins adc_trigger_gate/sample_resetn] \
  [get_bd_pins adc_capture/aresetn] \
  [get_bd_pins dac902_control/sample_resetn]
  connect_bd_net -net rst_ps7_0_100M_interconnect_aresetn  [get_bd_pins rst_ps7_0_100M/interconnect_aresetn] \
  [get_bd_pins ps7_0_axi_periph/M01_ARESETN] \
  [get_bd_pins ps7_0_axi_periph/M02_ARESETN] \
  [get_bd_pins ps7_0_axi_periph/M03_ARESETN] \
  [get_bd_pins ps7_0_axi_periph/M04_ARESETN] \
  [get_bd_pins ps7_0_axi_periph/M05_ARESETN] \
  [get_bd_pins dma_memory_interconnect/ARESETN] \
  [get_bd_pins dma_memory_interconnect/S00_ARESETN] \
  [get_bd_pins dma_memory_interconnect/M00_ARESETN] \
  [get_bd_pins ps7_0_axi_periph/M06_ARESETN] \
  [get_bd_pins ps7_0_axi_periph/M07_ARESETN] \
  [get_bd_pins ps7_0_axi_periph/M08_ARESETN]
  connect_bd_net -net rst_ps7_0_100M_peripheral_aresetn  [get_bd_pins rst_ps7_0_100M/peripheral_aresetn] \
  [get_bd_pins ps7_0_axi_periph/S00_ARESETN] \
  [get_bd_pins ps7_0_axi_periph/M00_ARESETN] \
  [get_bd_pins ps7_0_axi_periph/ARESETN] \
  [get_bd_pins probe_gpio/s_axi_aresetn] \
  [get_bd_pins pwm_control/s_axi_aresetn] \
  [get_bd_pins probe_router/resetn] \
  [get_bd_pins finite_pwm/s_axi_aresetn] \
  [get_bd_pins adc_dma/axi_resetn] \
  [get_bd_pins capture_gpio/s_axi_aresetn] \
  [get_bd_pins adc_trigger_gate/control_resetn] \
  [get_bd_pins dac_gpio/s_axi_aresetn] \
  [get_bd_pins digital_capture/s_axi_aresetn] \
  [get_bd_pins dac902_control/control_resetn] \
  [get_bd_pins adc_capture/control_resetn] \
  [get_bd_pins lxb_gpio/s_axi_aresetn] \
  [get_bd_pins pwm_control_b/s_axi_aresetn] \
  [get_bd_pins probe_pads/resetn]
  connect_bd_net -net rst_ps7_0_100M_peripheral_reset  [get_bd_pins rst_ps7_0_100M/peripheral_reset] \
  [get_bd_pins ethernet_bridge/tx_reset] \
  [get_bd_pins ethernet_bridge/rx_reset]
  connect_bd_net -net sample_vector_dout  [get_bd_pins sample_vector/dout]
  connect_bd_net -net uart_rx_1  [get_bd_ports uart_rx] \
  [get_bd_pins processing_system7_0/UART0_RX]

  # Create address segments
  assign_bd_address -offset 0x40400000 -range 0x00010000 -target_address_space [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs adc_dma/S_AXI_LITE/Reg] -force
  assign_bd_address -offset 0x41200000 -range 0x00010000 -target_address_space [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs capture_gpio/S_AXI/Reg] -force
  assign_bd_address -offset 0x41210000 -range 0x00010000 -target_address_space [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs dac_gpio/S_AXI/Reg] -force
  assign_bd_address -offset 0x43C10000 -range 0x00001000 -target_address_space [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs digital_capture/S_AXI/reg0] -force
  assign_bd_address -offset 0x43C30000 -range 0x00001000 -target_address_space [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs finite_pwm/S_AXI/reg0] -force
  assign_bd_address -offset 0x41220000 -range 0x00010000 -target_address_space [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs lxb_gpio/S_AXI/Reg] -force
  assign_bd_address -offset 0x43C20000 -range 0x00001000 -target_address_space [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs probe_gpio/S_AXI/Reg] -force
  assign_bd_address -offset 0x43C40000 -range 0x00001000 -target_address_space [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs pwm_control_b/S_AXI/reg0] -force
  assign_bd_address -offset 0x43C00000 -range 0x00001000 -target_address_space [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs pwm_control/S_AXI/reg0] -force
  assign_bd_address -offset 0x00000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces adc_dma/Data_S2MM] [get_bd_addr_segs processing_system7_0/S_AXI_HP0/HP0_DDR_LOWOCM] -force


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


