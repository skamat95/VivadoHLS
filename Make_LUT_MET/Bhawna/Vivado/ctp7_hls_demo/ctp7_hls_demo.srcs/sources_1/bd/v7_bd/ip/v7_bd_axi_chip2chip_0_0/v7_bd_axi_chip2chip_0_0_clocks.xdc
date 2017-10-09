
set xm_aclk     [get_clocks -of_objects [get_ports m_aclk]]
set xm_axi_lite_aclk       [get_clocks -of_objects [get_ports m_axi_lite_aclk]]
set_false_path -to [get_pins -hierarchical -filter {NAME =~ *gsckt_wrst.garst_sync[1].arst_sync_inst/Q_reg_reg[0]/D}]

set skew_value [expr {(($xm_aclk < $phy_time) ? $xm_aclk : $phy_time)} ]


#Independent BRAM FIFO constraints in SLAVE INDEPENDENT mode
#read to write
set_max_delay -from [get_cells -hierarchical -filter {NAME =~*slave_fpga_gen.axi_chip2chip_slave_inst/axi_chip2chip_aw_fifo_inst/axi_chip2chip_async_fifo_inst/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/*rd_pntr_gc_reg[*]}] -to [get_cells -hierarchical -filter {NAME =~*slave_fpga_gen.axi_chip2chip_slave_inst/axi_chip2chip_aw_fifo_inst/axi_chip2chip_async_fifo_inst/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/*gsync_stage[1].wr_stg_inst/Q_reg_reg[*]}] -datapath_only 3.3333333333333335


set_bus_skew -from [get_cells  -hierarchical -filter {NAME =~*master_fpga_gen.axi_chip2chip_master_inst/axi_chip2chip_a*_fifo_inst/axi_chip2chip_async_fifo_inst/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/*rd_pntr_gc_reg[*]}] -to [get_cells inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/*gsync_stage[1].wr_stg_inst/Q_reg_reg[*]] $skew_value


set_max_delay -from [get_cells -hierarchical -filter {NAME =~*slave_fpga_gen.axi_chip2chip_slave_inst/axi_chip2chip_ar_fifo_inst/axi_chip2chip_async_fifo_inst/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/*rd_pntr_gc_reg[*]}] -to [get_cells -hierarchical -filter {NAME =~*slave_fpga_gen.axi_chip2chip_slave_inst/axi_chip2chip_ar_fifo_inst/axi_chip2chip_async_fifo_inst/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/*gsync_stage[1].wr_stg_inst/Q_reg_reg[*]}] -datapath_only 3.3333333333333335
set_max_delay -from [get_cells -hierarchical -filter {NAME =~*slave_fpga_gen.axi_chip2chip_slave_inst/axi_chip2chip_w_fifo_inst/axi_chip2chip_async_fifo_inst/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/*rd_pntr_gc_reg[*]}] -to  [get_cells -hierarchical -filter {NAME =~*slave_fpga_gen.axi_chip2chip_slave_inst/axi_chip2chip_w_fifo_inst/axi_chip2chip_async_fifo_inst/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/*gsync_stage[1].wr_stg_inst/Q_reg_reg[*]}] -datapath_only 3.3333333333333335
set_max_delay -from [get_cells -hierarchical -filter {NAME =~*slave_fpga_gen.axi_chip2chip_slave_inst/axi_chip2chip_r_fifo_inst/axi_chip2chip_async_fifo_inst/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/*rd_pntr_gc_reg[*]}] -to [get_cells -hierarchical -filter {NAME =~*slave_fpga_gen.axi_chip2chip_slave_inst/axi_chip2chip_r_fifo_inst/axi_chip2chip_async_fifo_inst/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/*gsync_stage[1].wr_stg_inst/Q_reg_reg[*]}] -datapath_only [get_property -min PERIOD $xm_aclk] 
#write to read
set_max_delay -from [get_cells -hierarchical -filter {NAME =~*slave_fpga_gen.axi_chip2chip_slave_inst/axi_chip2chip_aw_fifo_inst/axi_chip2chip_async_fifo_inst/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/*wr_pntr_gc_reg[*]}] -to [get_cells -hierarchical -filter {NAME =~*slave_fpga_gen.axi_chip2chip_slave_inst/axi_chip2chip_aw_fifo_inst/axi_chip2chip_async_fifo_inst/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/*gsync_stage[1].rd_stg_inst/Q_reg_reg[*]}]  -datapath_only [get_property -min PERIOD $xm_aclk]

set_bus_skew -from [get_cells -hierarchical -filter {NAME =~*slave_fpga_gen.axi_chip2chip_slave_inst/axi_chip2chip_a*_fifo_inst/axi_chip2chip_async_fifo_inst/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/*wr_pntr_gc_reg[*]}] -to [get_cells -hierarchical -filter {NAME =~*slave_fpga_gen.axi_chip2chip_slave_inst/axi_chip2chip_aw_fifo_inst/axi_chip2chip_async_fifo_inst/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/*gsync_stage[1].rd_stg_inst/Q_reg_reg[*]}] $skew_value

set_max_delay -from [get_cells -hierarchical -filter {NAME =~*slave_fpga_gen.axi_chip2chip_slave_inst/axi_chip2chip_ar_fifo_inst/axi_chip2chip_async_fifo_inst/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/*wr_pntr_gc_reg[*]}] -to [get_cells -hierarchical -filter {NAME =~*slave_fpga_gen.axi_chip2chip_slave_inst/axi_chip2chip_ar_fifo_inst/axi_chip2chip_async_fifo_inst/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/*gsync_stage[1].rd_stg_inst/Q_reg_reg[*]}]  -datapath_only [get_property -min PERIOD $xm_aclk]
set_max_delay -from [get_cells -hierarchical -filter {NAME =~*slave_fpga_gen.axi_chip2chip_slave_inst/axi_chip2chip_w_fifo_inst/axi_chip2chip_async_fifo_inst/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/*wr_pntr_gc_reg[*]}] -to  [get_cells -hierarchical -filter {NAME =~*slave_fpga_gen.axi_chip2chip_slave_inst/axi_chip2chip_w_fifo_inst/axi_chip2chip_async_fifo_inst/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/*gsync_stage[1].rd_stg_inst/Q_reg_reg[*]}]   -datapath_only [get_property -min PERIOD $xm_aclk] 
set_max_delay -from [get_cells -hierarchical -filter {NAME =~*slave_fpga_gen.axi_chip2chip_slave_inst/axi_chip2chip_r_fifo_inst/axi_chip2chip_async_fifo_inst/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/*wr_pntr_gc_reg[*]}] -to [get_cells -hierarchical -filter {NAME =~*slave_fpga_gen.axi_chip2chip_slave_inst/axi_chip2chip_r_fifo_inst/axi_chip2chip_async_fifo_inst/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/*gsync_stage[1].rd_stg_inst/Q_reg_reg[*]}]  -datapath_only 3.3333333333333335

#Independent DIST RAM FIFO constraints in SLAVE INDEPENDENT mode 
#read to write
set_max_delay -from [get_cells -hierarchical -filter {NAME =~*slave_fpga_gen.axi_chip2chip_slave_inst/axi_chip2chip_b_fifo_inst/axi_chip2chip_async_fifo_inst/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/*rd_pntr_gc_reg[*]}] -to [get_cells -hierarchical -filter {NAME =~*slave_fpga_gen.axi_chip2chip_slave_inst/axi_chip2chip_b_fifo_inst/axi_chip2chip_async_fifo_inst/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/*gsync_stage[1].wr_stg_inst/Q_reg_reg[*]}] -datapath_only [get_property -min PERIOD $xm_aclk] 
#write to read
set_max_delay -from [get_cells -hierarchical -filter {NAME =~*slave_fpga_gen.axi_chip2chip_slave_inst/axi_chip2chip_b_fifo_inst/axi_chip2chip_async_fifo_inst/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/*wr_pntr_gc_reg[*]}] -to [get_cells -hierarchical -filter {NAME =~*slave_fpga_gen.axi_chip2chip_slave_inst/axi_chip2chip_b_fifo_inst/axi_chip2chip_async_fifo_inst/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/*gsync_stage[1].rd_stg_inst/Q_reg_reg[*]}]  -datapath_only 3.3333333333333335

# Ignore paths from the write clock to the read data registers for Asynchronous Distributed RAM based FIFO


set_disable_timing -from CLK -to O [filter [all_fanout -from [get_ports m_aclk] -flat -endpoints_only -only_cells] {PRIMITIVE_SUBGROUP==dram || PRIMITIVE_SUBGROUP==LUTRAM}] 
set_disable_timing -from CLK -to O [filter [all_fanout -from [get_pins -hier *mmcm_adv_inst/CLKOUT0] -flat -endpoints_only -only_cells] {PRIMITIVE_SUBGROUP==dram || PRIMITIVE_SUBGROUP==LUTRAM}]
set_disable_timing -from CLK -to O [filter [all_fanout -from [get_ports m_axi_lite_aclk] -flat -endpoints_only -only_cells] {PRIMITIVE_SUBGROUP==dram || PRIMITIVE_SUBGROUP==LUTRAM}] 



#Independent DIST RAM FIFO constraints in AXILITE-SLAVE INDEPENDENT mode 
#read to write
set_max_delay -from [get_cells -hierarchical -filter {NAME =~*axi_lite_slave_gen.axi_chip2chip_lite_slave_inst/axi_chip2chip_lite_slave_tx_fifo/axi_chip2chip_async_fifo_inst/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/*rd_pntr_gc_reg[*]}] -to [get_cells -hierarchical -filter {NAME =~*axi_lite_slave_gen.axi_chip2chip_lite_slave_inst/axi_chip2chip_lite_slave_tx_fifo/axi_chip2chip_async_fifo_inst/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/*gsync_stage[1].wr_stg_inst/Q_reg_reg[*]}] -datapath_only [get_property -min PERIOD $xm_axi_lite_aclk]
#write to read
set_max_delay -from [get_cells -hierarchical -filter {NAME =~*axi_lite_slave_gen.axi_chip2chip_lite_slave_inst/axi_chip2chip_lite_slave_tx_fifo/axi_chip2chip_async_fifo_inst/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/*wr_pntr_gc_reg[*]}] -to [get_cells -hierarchical -filter {NAME =~*axi_lite_slave_gen.axi_chip2chip_lite_slave_inst/axi_chip2chip_lite_slave_tx_fifo/axi_chip2chip_async_fifo_inst/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/*gsync_stage[1].rd_stg_inst/Q_reg_reg[*]}]  -datapath_only 3.3333333333333335
#read to write
set_max_delay -from [get_cells -hierarchical -filter {NAME =~*axi_lite_slave_gen.axi_chip2chip_lite_slave_inst/axi_chip2chip_lite_slave_rx_fifo/axi_chip2chip_async_fifo_inst/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/*rd_pntr_gc_reg[*]}] -to [get_cells -hierarchical -filter {NAME =~*axi_lite_slave_gen.axi_chip2chip_lite_slave_inst/axi_chip2chip_lite_slave_rx_fifo/axi_chip2chip_async_fifo_inst/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/*gsync_stage[1].wr_stg_inst/Q_reg_reg[*]}] -datapath_only  3.3333333333333335
#write to read
set_max_delay -from [get_cells -hierarchical -filter {NAME =~*axi_lite_slave_gen.axi_chip2chip_lite_slave_inst/axi_chip2chip_lite_slave_rx_fifo/axi_chip2chip_async_fifo_inst/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/*wr_pntr_gc_reg[*]}] -to [get_cells -hierarchical -filter {NAME =~*axi_lite_slave_gen.axi_chip2chip_lite_slave_inst/axi_chip2chip_lite_slave_rx_fifo/axi_chip2chip_async_fifo_inst/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/*gsync_stage[1].rd_stg_inst/Q_reg_reg[*]}]  -datapath_only [get_property -min PERIOD $xm_axi_lite_aclk]

# Ignore paths from the write clock to the read data registers for Asynchronous Distributed RAM based FIFO

set_max_delay -from [get_pins -hierarchical -filter {NAME =~*axi_lite_slave_gen.reset_sync_lite_slv/sync_reset_out_reg/C}] -to [get_pins -hierarchical -filter {NAME =~*axi_lite_slave_gen.axi_chip2chip_lite_slave_inst/fifo_reset_reg/PRE}] -datapath_only [get_property -min PERIOD $xm_axi_lite_aclk]
