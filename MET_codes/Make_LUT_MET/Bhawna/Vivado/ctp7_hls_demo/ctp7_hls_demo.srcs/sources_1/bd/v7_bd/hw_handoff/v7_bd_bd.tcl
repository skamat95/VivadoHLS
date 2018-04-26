
################################################################
# This is a generated script based on design: v7_bd
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
set scripts_vivado_version 2016.4
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source v7_bd_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7vx690tffg1927-2
}


# CHANGE DESIGN NAME HERE
set design_name v7_bd

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set BRAM_CTRL_INPUT_RAM_0 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:bram_rtl:1.0 BRAM_CTRL_INPUT_RAM_0 ]
  set_property -dict [ list \
CONFIG.MASTER_TYPE {BRAM_CTRL} \
 ] $BRAM_CTRL_INPUT_RAM_0
  set BRAM_CTRL_INPUT_RAM_1 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:bram_rtl:1.0 BRAM_CTRL_INPUT_RAM_1 ]
  set_property -dict [ list \
CONFIG.MASTER_TYPE {BRAM_CTRL} \
 ] $BRAM_CTRL_INPUT_RAM_1
  set BRAM_CTRL_INPUT_RAM_2 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:bram_rtl:1.0 BRAM_CTRL_INPUT_RAM_2 ]
  set_property -dict [ list \
CONFIG.MASTER_TYPE {BRAM_CTRL} \
 ] $BRAM_CTRL_INPUT_RAM_2
  set BRAM_CTRL_OUTPUT_RAM_0 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:bram_rtl:1.0 BRAM_CTRL_OUTPUT_RAM_0 ]
  set_property -dict [ list \
CONFIG.MASTER_TYPE {BRAM_CTRL} \
 ] $BRAM_CTRL_OUTPUT_RAM_0
  set BRAM_CTRL_OUTPUT_RAM_1 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:bram_rtl:1.0 BRAM_CTRL_OUTPUT_RAM_1 ]
  set_property -dict [ list \
CONFIG.MASTER_TYPE {BRAM_CTRL} \
 ] $BRAM_CTRL_OUTPUT_RAM_1
  set BRAM_CTRL_REG_FILE [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:bram_rtl:1.0 BRAM_CTRL_REG_FILE ]
  set_property -dict [ list \
CONFIG.MASTER_TYPE {BRAM_CTRL} \
 ] $BRAM_CTRL_REG_FILE
  set clk_200_diff_in [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 clk_200_diff_in ]
  set_property -dict [ list \
CONFIG.FREQ_HZ {200000000} \
 ] $clk_200_diff_in

  # Create ports
  set axi_c2c_v7_to_zynq_clk [ create_bd_port -dir O -type clk axi_c2c_v7_to_zynq_clk ]
  set axi_c2c_v7_to_zynq_data [ create_bd_port -dir O -from 16 -to 0 axi_c2c_v7_to_zynq_data ]
  set axi_c2c_v7_to_zynq_link_status [ create_bd_port -dir O axi_c2c_v7_to_zynq_link_status ]
  set axi_c2c_zynq_to_v7_clk [ create_bd_port -dir I -type clk axi_c2c_zynq_to_v7_clk ]
  set_property -dict [ list \
CONFIG.FREQ_HZ {300000000} \
 ] $axi_c2c_zynq_to_v7_clk
  set axi_c2c_zynq_to_v7_data [ create_bd_port -dir I -from 16 -to 0 axi_c2c_zynq_to_v7_data ]
  set axi_c2c_zynq_to_v7_reset [ create_bd_port -dir I -type rst axi_c2c_zynq_to_v7_reset ]
  set clk_240mhz [ create_bd_port -dir O -type clk clk_240mhz ]
  set clk_50mhz [ create_bd_port -dir O -type clk clk_50mhz ]

  # Create instance: axi_bram_ctrl_input_ram_0, and set properties
  set axi_bram_ctrl_input_ram_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl:4.0 axi_bram_ctrl_input_ram_0 ]
  set_property -dict [ list \
CONFIG.PROTOCOL {AXI4LITE} \
CONFIG.SINGLE_PORT_BRAM {1} \
 ] $axi_bram_ctrl_input_ram_0

  # Create instance: axi_bram_ctrl_input_ram_1, and set properties
  set axi_bram_ctrl_input_ram_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl:4.0 axi_bram_ctrl_input_ram_1 ]
  set_property -dict [ list \
CONFIG.PROTOCOL {AXI4LITE} \
CONFIG.SINGLE_PORT_BRAM {1} \
 ] $axi_bram_ctrl_input_ram_1

  # Create instance: axi_bram_ctrl_input_ram_2, and set properties
  set axi_bram_ctrl_input_ram_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl:4.0 axi_bram_ctrl_input_ram_2 ]
  set_property -dict [ list \
CONFIG.PROTOCOL {AXI4LITE} \
CONFIG.SINGLE_PORT_BRAM {1} \
 ] $axi_bram_ctrl_input_ram_2

  # Create instance: axi_bram_ctrl_output_ram_0, and set properties
  set axi_bram_ctrl_output_ram_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl:4.0 axi_bram_ctrl_output_ram_0 ]
  set_property -dict [ list \
CONFIG.PROTOCOL {AXI4LITE} \
CONFIG.SINGLE_PORT_BRAM {1} \
 ] $axi_bram_ctrl_output_ram_0

  # Create instance: axi_bram_ctrl_output_ram_1, and set properties
  set axi_bram_ctrl_output_ram_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl:4.0 axi_bram_ctrl_output_ram_1 ]
  set_property -dict [ list \
CONFIG.PROTOCOL {AXI4LITE} \
CONFIG.SINGLE_PORT_BRAM {1} \
 ] $axi_bram_ctrl_output_ram_1

  # Create instance: axi_bram_ctrl_reg_file, and set properties
  set axi_bram_ctrl_reg_file [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl:4.0 axi_bram_ctrl_reg_file ]
  set_property -dict [ list \
CONFIG.PROTOCOL {AXI4LITE} \
CONFIG.SINGLE_PORT_BRAM {1} \
 ] $axi_bram_ctrl_reg_file

  # Create instance: axi_chip2chip_0, and set properties
  set axi_chip2chip_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_chip2chip:4.2 axi_chip2chip_0 ]
  set_property -dict [ list \
CONFIG.C_AURORA_WIDTH {64} \
CONFIG.C_AXI_ADDR_WIDTH {32} \
CONFIG.C_AXI_ID_WIDTH {8} \
CONFIG.C_AXI_WUSER_WIDTH {0} \
CONFIG.C_COMMON_CLK {0} \
CONFIG.C_INCLUDE_AXILITE {2} \
CONFIG.C_INTERFACE_MODE {1} \
CONFIG.C_MASTER_FPGA {0} \
CONFIG.C_NUM_OF_IO {36} \
CONFIG.C_SELECTIO_PHY_CLK {300} \
 ] $axi_chip2chip_0

  # Create instance: axi_interconnect_0, and set properties
  set axi_interconnect_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_0 ]
  set_property -dict [ list \
CONFIG.M02_HAS_REGSLICE {4} \
CONFIG.NUM_MI {7} \
CONFIG.NUM_SI {1} \
CONFIG.S00_HAS_DATA_FIFO {2} \
CONFIG.S00_HAS_REGSLICE {4} \
 ] $axi_interconnect_0

  # Create instance: clk_wiz_0, and set properties
  set clk_wiz_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:5.3 clk_wiz_0 ]
  set_property -dict [ list \
CONFIG.AXI_DRP {false} \
CONFIG.CLKIN1_JITTER_PS {50.0} \
CONFIG.CLKOUT1_DRIVES {BUFGCE} \
CONFIG.CLKOUT1_JITTER {92.799} \
CONFIG.CLKOUT1_PHASE_ERROR {82.655} \
CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {200} \
CONFIG.CLKOUT1_REQUESTED_PHASE {0.00} \
CONFIG.CLKOUT2_DRIVES {BUFGCE} \
CONFIG.CLKOUT2_JITTER {106.024} \
CONFIG.CLKOUT2_PHASE_ERROR {82.655} \
CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {100} \
CONFIG.CLKOUT2_USED {true} \
CONFIG.CLKOUT3_DRIVES {BUFGCE} \
CONFIG.CLKOUT3_JITTER {121.478} \
CONFIG.CLKOUT3_PHASE_ERROR {82.655} \
CONFIG.CLKOUT3_REQUESTED_OUT_FREQ {50} \
CONFIG.CLKOUT3_USED {true} \
CONFIG.CLKOUT4_DRIVES {BUFGCE} \
CONFIG.CLKOUT4_JITTER {89.608} \
CONFIG.CLKOUT4_PHASE_ERROR {82.655} \
CONFIG.CLKOUT4_REQUESTED_OUT_FREQ {240} \
CONFIG.CLKOUT4_USED {true} \
CONFIG.CLKOUT5_DRIVES {BUFGCE} \
CONFIG.CLKOUT5_JITTER {127.032} \
CONFIG.CLKOUT5_PHASE_ERROR {82.655} \
CONFIG.CLKOUT5_USED {false} \
CONFIG.CLKOUT6_DRIVES {BUFGCE} \
CONFIG.CLKOUT7_DRIVES {BUFGCE} \
CONFIG.MMCM_CLKFBOUT_MULT_F {6.000} \
CONFIG.MMCM_CLKIN1_PERIOD {5.0} \
CONFIG.MMCM_CLKIN2_PERIOD {10.0} \
CONFIG.MMCM_CLKOUT0_DIVIDE_F {6.000} \
CONFIG.MMCM_CLKOUT1_DIVIDE {12} \
CONFIG.MMCM_CLKOUT2_DIVIDE {24} \
CONFIG.MMCM_CLKOUT3_DIVIDE {5} \
CONFIG.MMCM_COMPENSATION {ZHOLD} \
CONFIG.NUM_OUT_CLKS {4} \
CONFIG.PHASE_DUTY_CONFIG {false} \
CONFIG.PRIM_IN_FREQ {200} \
CONFIG.PRIM_SOURCE {Differential_clock_capable_pin} \
CONFIG.USE_DYN_RECONFIG {false} \
CONFIG.USE_PHASE_ALIGNMENT {false} \
CONFIG.USE_RESET {false} \
CONFIG.USE_SAFE_CLOCK_STARTUP {true} \
 ] $clk_wiz_0

  # Need to retain value_src of defaults
  set_property -dict [ list \
CONFIG.CLKOUT1_REQUESTED_PHASE.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUT4_DRIVES.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUT5_DRIVES.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUT6_DRIVES.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUT7_DRIVES.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKFBOUT_MULT_F.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKIN1_PERIOD.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKIN2_PERIOD.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKOUT0_DIVIDE_F.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKOUT1_DIVIDE.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKOUT2_DIVIDE.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKOUT3_DIVIDE.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_COMPENSATION.VALUE_SRC {DEFAULT} \
 ] $clk_wiz_0

  # Create instance: proc_sys_reset_0, and set properties
  set proc_sys_reset_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_0 ]
  set_property -dict [ list \
CONFIG.C_AUX_RESET_HIGH {0} \
 ] $proc_sys_reset_0

  # Create instance: xadc_wiz_0, and set properties
  set xadc_wiz_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xadc_wiz:3.3 xadc_wiz_0 ]
  set_property -dict [ list \
CONFIG.ADC_CONVERSION_RATE {962} \
CONFIG.CHANNEL_AVERAGING {64} \
CONFIG.CHANNEL_ENABLE_VP_VN {false} \
CONFIG.DCLK_FREQUENCY {50} \
CONFIG.ENABLE_RESET {false} \
CONFIG.INTERFACE_SELECTION {Enable_AXI} \
CONFIG.OT_ALARM {false} \
CONFIG.USER_TEMP_ALARM {false} \
CONFIG.VCCAUX_ALARM {false} \
CONFIG.VCCINT_ALARM {false} \
 ] $xadc_wiz_0

  # Need to retain value_src of defaults
  set_property -dict [ list \
CONFIG.CHANNEL_ENABLE_VP_VN.VALUE_SRC {DEFAULT} \
CONFIG.ENABLE_RESET.VALUE_SRC {DEFAULT} \
 ] $xadc_wiz_0

  # Create interface connections
  connect_bd_intf_net -intf_net axi_bram_ctrl_1_BRAM_PORTA [get_bd_intf_ports BRAM_CTRL_REG_FILE] [get_bd_intf_pins axi_bram_ctrl_reg_file/BRAM_PORTA]
  connect_bd_intf_net -intf_net axi_bram_ctrl_1_BRAM_PORTA2 [get_bd_intf_ports BRAM_CTRL_INPUT_RAM_0] [get_bd_intf_pins axi_bram_ctrl_input_ram_0/BRAM_PORTA]
  connect_bd_intf_net -intf_net axi_bram_ctrl_input_ram_1_BRAM_PORTA [get_bd_intf_ports BRAM_CTRL_INPUT_RAM_1] [get_bd_intf_pins axi_bram_ctrl_input_ram_1/BRAM_PORTA]
  connect_bd_intf_net -intf_net axi_bram_ctrl_input_ram_2_BRAM_PORTA [get_bd_intf_ports BRAM_CTRL_INPUT_RAM_2] [get_bd_intf_pins axi_bram_ctrl_input_ram_2/BRAM_PORTA]
  connect_bd_intf_net -intf_net axi_bram_ctrl_output_ram_0_BRAM_PORTA [get_bd_intf_ports BRAM_CTRL_OUTPUT_RAM_0] [get_bd_intf_pins axi_bram_ctrl_output_ram_0/BRAM_PORTA]
  connect_bd_intf_net -intf_net axi_bram_ctrl_output_ram_1_BRAM_PORTA [get_bd_intf_ports BRAM_CTRL_OUTPUT_RAM_1] [get_bd_intf_pins axi_bram_ctrl_output_ram_1/BRAM_PORTA]
  connect_bd_intf_net -intf_net axi_chip2chip_0_m_axi_lite [get_bd_intf_pins axi_chip2chip_0/m_axi_lite] [get_bd_intf_pins axi_interconnect_0/S00_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M00_AXI [get_bd_intf_pins axi_interconnect_0/M00_AXI] [get_bd_intf_pins xadc_wiz_0/s_axi_lite]
  connect_bd_intf_net -intf_net axi_interconnect_0_M01_AXI [get_bd_intf_pins axi_bram_ctrl_reg_file/S_AXI] [get_bd_intf_pins axi_interconnect_0/M01_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M02_AXI [get_bd_intf_pins axi_bram_ctrl_input_ram_0/S_AXI] [get_bd_intf_pins axi_interconnect_0/M02_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M03_AXI [get_bd_intf_pins axi_bram_ctrl_input_ram_1/S_AXI] [get_bd_intf_pins axi_interconnect_0/M03_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M04_AXI [get_bd_intf_pins axi_bram_ctrl_input_ram_2/S_AXI] [get_bd_intf_pins axi_interconnect_0/M04_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M05_AXI [get_bd_intf_pins axi_bram_ctrl_output_ram_0/S_AXI] [get_bd_intf_pins axi_interconnect_0/M05_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M06_AXI [get_bd_intf_pins axi_bram_ctrl_output_ram_1/S_AXI] [get_bd_intf_pins axi_interconnect_0/M06_AXI]
  connect_bd_intf_net -intf_net clk_200_diff_in_1 [get_bd_intf_ports clk_200_diff_in] [get_bd_intf_pins clk_wiz_0/CLK_IN1_D]

  # Create port connections
  connect_bd_net -net ARESETN_1 [get_bd_pins axi_chip2chip_0/m_aresetn] [get_bd_pins axi_interconnect_0/ARESETN] [get_bd_pins proc_sys_reset_0/interconnect_aresetn]
  connect_bd_net -net axi_c2c_zynq_to_v7_clk_1 [get_bd_ports axi_c2c_zynq_to_v7_clk] [get_bd_pins axi_chip2chip_0/axi_c2c_selio_rx_clk_in]
  connect_bd_net -net axi_c2c_zynq_to_v7_data_1 [get_bd_ports axi_c2c_zynq_to_v7_data] [get_bd_pins axi_chip2chip_0/axi_c2c_selio_rx_data_in]
  connect_bd_net -net axi_chip2chip_0_axi_c2c_link_status_out [get_bd_ports axi_c2c_v7_to_zynq_link_status] [get_bd_pins axi_chip2chip_0/axi_c2c_link_status_out]
  connect_bd_net -net axi_chip2chip_0_axi_c2c_selio_tx_clk_out [get_bd_ports axi_c2c_v7_to_zynq_clk] [get_bd_pins axi_chip2chip_0/axi_c2c_selio_tx_clk_out]
  connect_bd_net -net axi_chip2chip_0_axi_c2c_selio_tx_data_out [get_bd_ports axi_c2c_v7_to_zynq_data] [get_bd_pins axi_chip2chip_0/axi_c2c_selio_tx_data_out]
  connect_bd_net -net clk_wiz_0_clk_out1 [get_bd_pins axi_chip2chip_0/idelay_ref_clk] [get_bd_pins clk_wiz_0/clk_out1]
  connect_bd_net -net clk_wiz_0_clk_out3 [get_bd_ports clk_50mhz] [get_bd_pins axi_bram_ctrl_input_ram_0/s_axi_aclk] [get_bd_pins axi_bram_ctrl_input_ram_1/s_axi_aclk] [get_bd_pins axi_bram_ctrl_input_ram_2/s_axi_aclk] [get_bd_pins axi_bram_ctrl_output_ram_0/s_axi_aclk] [get_bd_pins axi_bram_ctrl_output_ram_1/s_axi_aclk] [get_bd_pins axi_bram_ctrl_reg_file/s_axi_aclk] [get_bd_pins axi_chip2chip_0/m_aclk] [get_bd_pins axi_chip2chip_0/m_axi_lite_aclk] [get_bd_pins axi_interconnect_0/ACLK] [get_bd_pins axi_interconnect_0/M00_ACLK] [get_bd_pins axi_interconnect_0/M01_ACLK] [get_bd_pins axi_interconnect_0/M02_ACLK] [get_bd_pins axi_interconnect_0/M03_ACLK] [get_bd_pins axi_interconnect_0/M04_ACLK] [get_bd_pins axi_interconnect_0/M05_ACLK] [get_bd_pins axi_interconnect_0/M06_ACLK] [get_bd_pins axi_interconnect_0/S00_ACLK] [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins proc_sys_reset_0/slowest_sync_clk] [get_bd_pins xadc_wiz_0/s_axi_aclk]
  connect_bd_net -net clk_wiz_0_clk_out4 [get_bd_ports clk_240mhz] [get_bd_pins clk_wiz_0/clk_out4]
  connect_bd_net -net clk_wiz_0_locked [get_bd_pins clk_wiz_0/locked] [get_bd_pins proc_sys_reset_0/dcm_locked]
  connect_bd_net -net m_aresetn_1 [get_bd_ports axi_c2c_zynq_to_v7_reset] [get_bd_pins proc_sys_reset_0/ext_reset_in]
  connect_bd_net -net vio_0_probe_out0 [get_bd_pins axi_bram_ctrl_input_ram_0/s_axi_aresetn] [get_bd_pins axi_bram_ctrl_input_ram_1/s_axi_aresetn] [get_bd_pins axi_bram_ctrl_input_ram_2/s_axi_aresetn] [get_bd_pins axi_bram_ctrl_output_ram_0/s_axi_aresetn] [get_bd_pins axi_bram_ctrl_output_ram_1/s_axi_aresetn] [get_bd_pins axi_bram_ctrl_reg_file/s_axi_aresetn] [get_bd_pins axi_interconnect_0/M00_ARESETN] [get_bd_pins axi_interconnect_0/M01_ARESETN] [get_bd_pins axi_interconnect_0/M02_ARESETN] [get_bd_pins axi_interconnect_0/M03_ARESETN] [get_bd_pins axi_interconnect_0/M04_ARESETN] [get_bd_pins axi_interconnect_0/M05_ARESETN] [get_bd_pins axi_interconnect_0/M06_ARESETN] [get_bd_pins axi_interconnect_0/S00_ARESETN] [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins xadc_wiz_0/s_axi_aresetn]

  # Create address segments
  create_bd_addr_seg -range 0x00020000 -offset 0x65000000 [get_bd_addr_spaces axi_chip2chip_0/MAXI-Lite] [get_bd_addr_segs axi_bram_ctrl_input_ram_0/S_AXI/Mem0] SEG_axi_bram_ctrl_input_ram_0_Mem0
  create_bd_addr_seg -range 0x00020000 -offset 0x65020000 [get_bd_addr_spaces axi_chip2chip_0/MAXI-Lite] [get_bd_addr_segs axi_bram_ctrl_input_ram_1/S_AXI/Mem0] SEG_axi_bram_ctrl_input_ram_1_Mem0
  create_bd_addr_seg -range 0x00020000 -offset 0x65040000 [get_bd_addr_spaces axi_chip2chip_0/MAXI-Lite] [get_bd_addr_segs axi_bram_ctrl_input_ram_2/S_AXI/Mem0] SEG_axi_bram_ctrl_input_ram_2_Mem0
  create_bd_addr_seg -range 0x00020000 -offset 0x66000000 [get_bd_addr_spaces axi_chip2chip_0/MAXI-Lite] [get_bd_addr_segs axi_bram_ctrl_output_ram_0/S_AXI/Mem0] SEG_axi_bram_ctrl_output_ram_0_Mem0
  create_bd_addr_seg -range 0x00020000 -offset 0x66020000 [get_bd_addr_spaces axi_chip2chip_0/MAXI-Lite] [get_bd_addr_segs axi_bram_ctrl_output_ram_1/S_AXI/Mem0] SEG_axi_bram_ctrl_output_ram_1_Mem0
  create_bd_addr_seg -range 0x00020000 -offset 0x62000000 [get_bd_addr_spaces axi_chip2chip_0/MAXI-Lite] [get_bd_addr_segs axi_bram_ctrl_reg_file/S_AXI/Mem0] SEG_axi_bram_ctrl_reg_file_Mem0
  create_bd_addr_seg -range 0x00010000 -offset 0x68000000 [get_bd_addr_spaces axi_chip2chip_0/MAXI-Lite] [get_bd_addr_segs xadc_wiz_0/s_axi_lite/Reg] SEG_xadc_wiz_0_Reg

  # Perform GUI Layout
  regenerate_bd_layout -layout_string {
   guistr: "# # String gsaved with Nlview 6.6.5b  2016-09-06 bk=1.3687 VDI=39 GEI=35 GUI=JA:1.6
#  -string -flagsOSRD
preplace port clk_240mhz -pg 1 -y 710 -defaultsOSRD
preplace port axi_c2c_v7_to_zynq_link_status -pg 1 -y 640 -defaultsOSRD
preplace port BRAM_CTRL_INPUT_RAM_0 -pg 1 -y 60 -defaultsOSRD
preplace port BRAM_CTRL_INPUT_RAM_1 -pg 1 -y 300 -defaultsOSRD
preplace port clk_50mhz -pg 1 -y 970 -defaultsOSRD
preplace port axi_c2c_v7_to_zynq_clk -pg 1 -y 600 -defaultsOSRD
preplace port BRAM_CTRL_INPUT_RAM_2 -pg 1 -y 440 -defaultsOSRD
preplace port clk_200_diff_in -pg 1 -y 640 -defaultsOSRD
preplace port BRAM_CTRL_OUTPUT_RAM_0 -pg 1 -y 780 -defaultsOSRD
preplace port BRAM_CTRL_REG_FILE -pg 1 -y 180 -defaultsOSRD
preplace port axi_c2c_zynq_to_v7_clk -pg 1 -y 720 -defaultsOSRD
preplace port BRAM_CTRL_OUTPUT_RAM_1 -pg 1 -y 900 -defaultsOSRD
preplace port axi_c2c_zynq_to_v7_reset -pg 1 -y 480 -defaultsOSRD
preplace portBus axi_c2c_zynq_to_v7_data -pg 1 -y 740 -defaultsOSRD
preplace portBus axi_c2c_v7_to_zynq_data -pg 1 -y 620 -defaultsOSRD
preplace inst xadc_wiz_0 -pg 1 -lvl 3 -y 1070 -defaultsOSRD
preplace inst axi_bram_ctrl_reg_file -pg 1 -lvl 3 -y 180 -defaultsOSRD
preplace inst proc_sys_reset_0 -pg 1 -lvl 1 -y 500 -defaultsOSRD
preplace inst axi_bram_ctrl_input_ram_0 -pg 1 -lvl 3 -y 60 -defaultsOSRD
preplace inst axi_bram_ctrl_input_ram_1 -pg 1 -lvl 3 -y 300 -defaultsOSRD
preplace inst axi_bram_ctrl_input_ram_2 -pg 1 -lvl 3 -y 440 -defaultsOSRD
preplace inst axi_interconnect_0 -pg 1 -lvl 2 -y 280 -defaultsOSRD
preplace inst axi_bram_ctrl_output_ram_0 -pg 1 -lvl 3 -y 780 -defaultsOSRD
preplace inst clk_wiz_0 -pg 1 -lvl 2 -y 640 -defaultsOSRD
preplace inst axi_bram_ctrl_output_ram_1 -pg 1 -lvl 3 -y 900 -defaultsOSRD
preplace inst axi_chip2chip_0 -pg 1 -lvl 3 -y 600 -defaultsOSRD
preplace netloc axi_chip2chip_0_m_axi_lite 1 1 3 410 520 760J 370 1240
preplace netloc clk_wiz_0_locked 1 0 3 10 410 380J 550 690
preplace netloc axi_bram_ctrl_1_BRAM_PORTA2 1 3 1 NJ
preplace netloc axi_bram_ctrl_input_ram_2_BRAM_PORTA 1 3 1 N
preplace netloc axi_bram_ctrl_output_ram_1_BRAM_PORTA 1 3 1 N
preplace netloc axi_interconnect_0_M02_AXI 1 2 1 690
preplace netloc axi_chip2chip_0_axi_c2c_link_status_out 1 3 1 NJ
preplace netloc ARESETN_1 1 1 2 400 530 720
preplace netloc axi_bram_ctrl_output_ram_0_BRAM_PORTA 1 3 1 N
preplace netloc m_aresetn_1 1 0 1 NJ
preplace netloc clk_200_diff_in_1 1 0 2 NJ 640 NJ
preplace netloc vio_0_probe_out0 1 1 2 390 540 750
preplace netloc axi_interconnect_0_M04_AXI 1 2 1 770
preplace netloc axi_c2c_zynq_to_v7_clk_1 1 0 3 NJ 720 360J 730 790J
preplace netloc axi_bram_ctrl_input_ram_1_BRAM_PORTA 1 3 1 N
preplace netloc clk_wiz_0_clk_out1 1 2 1 N
preplace netloc axi_c2c_zynq_to_v7_data_1 1 0 3 NJ 740 NJ 740 800J
preplace netloc axi_interconnect_0_M05_AXI 1 2 1 730
preplace netloc axi_interconnect_0_M00_AXI 1 2 1 740
preplace netloc axi_interconnect_0_M01_AXI 1 2 1 710
preplace netloc clk_wiz_0_clk_out3 1 0 4 20 970 370 970 780 970 NJ
preplace netloc axi_chip2chip_0_axi_c2c_selio_tx_data_out 1 3 1 NJ
preplace netloc axi_interconnect_0_M06_AXI 1 2 1 710
preplace netloc axi_bram_ctrl_1_BRAM_PORTA 1 3 1 NJ
preplace netloc clk_wiz_0_clk_out4 1 2 2 700J 710 NJ
preplace netloc axi_interconnect_0_M03_AXI 1 2 1 N
preplace netloc axi_chip2chip_0_axi_c2c_selio_tx_clk_out 1 3 1 NJ
levelinfo -pg 1 -10 190 550 1020 1260 -top 0 -bot 1160
",
}

  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


