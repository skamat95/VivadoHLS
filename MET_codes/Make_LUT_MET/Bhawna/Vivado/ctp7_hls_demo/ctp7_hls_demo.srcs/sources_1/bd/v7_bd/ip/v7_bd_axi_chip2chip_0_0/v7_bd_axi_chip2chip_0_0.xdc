##   set phy_type [get_param_value C_INTERFACE_TYPE]
##   set phy_mode [get_param_value C_INTERFACE_MODE]
##   set dwidth [get_param_value C_AXI_DATA_WIDTH]
##   set awidth [get_param_value C_AXI_ADDR_WIDTH]
##     if { $phy_type > 2 && $dwidth == 32 && $awidth == 32 && $phy_mode == 1} {

# file: v7_bd_axi_chip2chip_0_0.xdc
# (c) Copyright 2009 - 2011 Xilinx, Inc. All rights reserved.
# 
# This file contains confidential and proprietary information
# of Xilinx, Inc. and is protected under U.S. and
# international copyright and other intellectual property
# laws.
# 
# DISCLAIMER
# This disclaimer is not a license and does not grant any
# rights to the materials distributed herewith. Except as
# otherwise provided in a valid license issued to you by
# Xilinx, and to the maximum extent permitted by applicable
# law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
# WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
# AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
# BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
# INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
# (2) Xilinx shall not be liable (whether in contract or tort,
# including negligence, or under any other theory of
# liability) for any loss or damage of any kind or nature
# related to, arising under or in connection with these
# materials, including for any direct, or any indirect,
# special, incidental, or consequential loss or damage
# (including loss of data, profits, goodwill, or any type of
# loss or damage suffered as a result of any action brought
# by a third party) even if such damage or loss was
# reasonably foreseeable or Xilinx had been advised of the
# possibility of the same.
# 
# CRITICAL APPLICATIONS
# Xilinx products are not designed or intended to be fail-
# safe, or for use in any application requiring fail-safe
# performance, such as life-support or safety devices or
# systems, Class III medical devices, nuclear facilities,
# applications related to the deployment of airbags, or any
# other applications that could lead to death, personal
# injury, or severe property or environmental damage
# (individually and collectively, "Critical
# Applications"). Customer assumes the sole risk and
# liability of any use of Xilinx products in Critical
# Applications, subject only to applicable laws and
# regulations governing limitations on product liability.
# 
# THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
# PART OF THIS FILE AT ALL TIMES.

create_clock -name axi_c2c_selio_rx_clk_in -period 3.333 -waveform {0  1.667} [get_ports axi_c2c_selio_rx_clk_in]

set_false_path -from [get_cells -hierarchical -filter {NAME =~ *rstblk*/*rst_reg_reg[*]}]

#Independent BRAM FIFO constraints in SLAVE INDEPENDENT mode
#Independent DIST RAM FIFO constraints in SLAVE INDEPENDENT mode 
#Independent DIST RAM FIFO constraints in AXILITE-SLAVE INDEPENDENT mode 
##set_false_path -to [get_pins -hierarchical -filter {NAME =~*/*rstblk*/*CLR}]
set_false_path -from [get_cells -hierarchical -filter {NAME =~*/axi_chip2chip_ch0_ctrl_inst/intr_data_reg[*]}]


set_max_delay -from [get_pins -hierarchical -filter {NAME=~*slave_fpga_gen.axi_chip2chip_slave_phy_inst/slave_sio_phy.rx_reset_sync_inst/sync_reset_out_reg/C}] -datapath_only 3.333
set_max_delay -from [get_pins -hierarchical -filter {NAME=~*slave_fpga_gen.axi_chip2chip_slave_phy_inst/axi_chip2chip_phy_init_inst/calib_error_flop_reg/C}] -to [get_pins -hierarchical -filter {NAME=~*slave_fpga_gen.axi_chip2chip_slave_phy_inst/axi_chip2chip_phy_init_inst/axi_chip2chip_sync_cell_inst/sync_flop_0_reg[1]/D}] -datapath_only 3.333
###set_max_delay -from [get_pins -hierarchical -filter {NAME=~*slave_fpga_gen.axi_chip2chip_slave_phy_inst/axi_chip2chip_phy_init_inst/calib_done_flop_reg/C}] -to [get_pins -hierarchical -filter {NAME=~*slave_fpga_gen.axi_chip2chip_slave_phy_inst/axi_chip2chip_phy_init_inst/axi_chip2chip_sync_cell_inst/sync_flop_0_reg[2]/D}] -datapath_only 3.333
set_false_path -to [get_pins -hierarchical  -filter {NAME =~*/*rstblk*/PRE}]
set_false_path -from [get_pins -hierarchical  -filter {NAME =~*/*fifo_reset_reg/C}]
set_false_path -to [get_pins -hierarchical  -filter {NAME =~*/*fifo_reset_reg/PRE}]
set_false_path -to [get_pins -hierarchical  -filter {NAME =~*/*sync_reset*/PRE}]
set_false_path -to [get_pins -hierarchical -filter {NAME=~*axi_chip2chip_sync_cell*sync_flop_0*/D}]
set_false_path -from [get_cells -hierarchical -filter {NAME =~ *gsckt_wrst.gic_rst.sckt_wrst_i_reg}] -to [get_cells -hierarchical -filter {NAME =~ *gsckt_wrst.gic_rst.garst_sync_ic[1].rd_rst_inst/Q_reg_reg[0]}]
set_false_path -from [get_cells -hierarchical -filter {NAME =~ *gsckt_wrst.gic_rst.garst_sync_ic[3].rd_rst_inst/Q_reg_reg[0]}] -to [get_cells -hierarchical -filter {NAME =~ *gsckt_wrst.gic_rst.garst_sync_ic[1].rd_rst_wr_inst/Q_reg_reg[0]}]


