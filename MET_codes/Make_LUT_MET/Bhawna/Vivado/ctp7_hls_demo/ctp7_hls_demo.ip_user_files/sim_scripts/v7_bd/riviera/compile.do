vlib work
vlib riviera

vlib riviera/xil_defaultlib
vlib riviera/xpm
vlib riviera/blk_mem_gen_v8_3_5
vlib riviera/axi_bram_ctrl_v4_0_10
vlib riviera/fifo_generator_v13_1_3
vlib riviera/axi_chip2chip_v4_2_11
vlib riviera/lib_cdc_v1_0_2
vlib riviera/proc_sys_reset_v5_0_10
vlib riviera/generic_baseblocks_v2_1_0
vlib riviera/axi_infrastructure_v1_1_0
vlib riviera/axi_register_slice_v2_1_11
vlib riviera/axi_data_fifo_v2_1_10
vlib riviera/axi_crossbar_v2_1_12
vlib riviera/axi_protocol_converter_v2_1_11

vmap xil_defaultlib riviera/xil_defaultlib
vmap xpm riviera/xpm
vmap blk_mem_gen_v8_3_5 riviera/blk_mem_gen_v8_3_5
vmap axi_bram_ctrl_v4_0_10 riviera/axi_bram_ctrl_v4_0_10
vmap fifo_generator_v13_1_3 riviera/fifo_generator_v13_1_3
vmap axi_chip2chip_v4_2_11 riviera/axi_chip2chip_v4_2_11
vmap lib_cdc_v1_0_2 riviera/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_10 riviera/proc_sys_reset_v5_0_10
vmap generic_baseblocks_v2_1_0 riviera/generic_baseblocks_v2_1_0
vmap axi_infrastructure_v1_1_0 riviera/axi_infrastructure_v1_1_0
vmap axi_register_slice_v2_1_11 riviera/axi_register_slice_v2_1_11
vmap axi_data_fifo_v2_1_10 riviera/axi_data_fifo_v2_1_10
vmap axi_crossbar_v2_1_12 riviera/axi_crossbar_v2_1_12
vmap axi_protocol_converter_v2_1_11 riviera/axi_protocol_converter_v2_1_11

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/100a" "+incdir+../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/7e3a/hdl" "+incdir+../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/100a" "+incdir+../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/7e3a/hdl" \
"/opt/Xilinx/Vivado/2016.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/opt/Xilinx/Vivado/2016.4/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"/opt/Xilinx/Vivado/2016.4/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work blk_mem_gen_v8_3_5  -v2k5 "+incdir+../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/100a" "+incdir+../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/7e3a/hdl" "+incdir+../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/100a" "+incdir+../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/7e3a/hdl" \
"../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/6273/simulation/blk_mem_gen_v8_3.v" \

vcom -work axi_bram_ctrl_v4_0_10 -93 \
"../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/91f5/hdl/axi_bram_ctrl_v4_0_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/v7_bd/ip/v7_bd_axi_bram_ctrl_cap_ram_0_0/sim/v7_bd_axi_bram_ctrl_cap_ram_0_0.vhd" \
"../../../bd/v7_bd/ip/v7_bd_axi_bram_ctrl_cap_ram_1_0/sim/v7_bd_axi_bram_ctrl_cap_ram_1_0.vhd" \
"../../../bd/v7_bd/ip/v7_bd_axi_bram_ctrl_cap_ram_3_0/sim/v7_bd_axi_bram_ctrl_cap_ram_3_0.vhd" \
"../../../bd/v7_bd/ip/v7_bd_axi_bram_ctrl_reg_file_0/sim/v7_bd_axi_bram_ctrl_reg_file_0.vhd" \

vlog -work fifo_generator_v13_1_3  -v2k5 "+incdir+../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/100a" "+incdir+../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/7e3a/hdl" "+incdir+../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/100a" "+incdir+../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/7e3a/hdl" \
"../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/564d/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_1_3 -93 \
"../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/564d/hdl/fifo_generator_v13_1_rfs.vhd" \

vlog -work fifo_generator_v13_1_3  -v2k5 "+incdir+../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/100a" "+incdir+../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/7e3a/hdl" "+incdir+../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/100a" "+incdir+../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/7e3a/hdl" \
"../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/564d/hdl/fifo_generator_v13_1_rfs.v" \

vlog -work axi_chip2chip_v4_2_11  -v2k5 "+incdir+../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/100a" "+incdir+../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/7e3a/hdl" "+incdir+../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/100a" "+incdir+../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/7e3a/hdl" \
"../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/0c6f/hdl/axi_chip2chip_v4_2_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/100a" "+incdir+../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/7e3a/hdl" "+incdir+../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/100a" "+incdir+../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/7e3a/hdl" \
"../../../bd/v7_bd/ip/v7_bd_axi_chip2chip_0_0/sim/v7_bd_axi_chip2chip_0_0.v" \
"../../../bd/v7_bd/ip/v7_bd_clk_wiz_0_0/v7_bd_clk_wiz_0_0_clk_wiz.v" \
"../../../bd/v7_bd/ip/v7_bd_clk_wiz_0_0/v7_bd_clk_wiz_0_0.v" \

vcom -work lib_cdc_v1_0_2 -93 \
"../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/52cb/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_10 -93 \
"../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/04b4/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/v7_bd/ip/v7_bd_proc_sys_reset_0_0/sim/v7_bd_proc_sys_reset_0_0.vhd" \
"../../../bd/v7_bd/ip/v7_bd_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/v7_bd_xadc_wiz_0_0_conv_funs_pkg.vhd" \
"../../../bd/v7_bd/ip/v7_bd_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/v7_bd_xadc_wiz_0_0_proc_common_pkg.vhd" \
"../../../bd/v7_bd/ip/v7_bd_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/v7_bd_xadc_wiz_0_0_ipif_pkg.vhd" \
"../../../bd/v7_bd/ip/v7_bd_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/v7_bd_xadc_wiz_0_0_family_support.vhd" \
"../../../bd/v7_bd/ip/v7_bd_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/v7_bd_xadc_wiz_0_0_family.vhd" \
"../../../bd/v7_bd/ip/v7_bd_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/v7_bd_xadc_wiz_0_0_soft_reset.vhd" \
"../../../bd/v7_bd/ip/v7_bd_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/v7_bd_xadc_wiz_0_0_pselect_f.vhd" \
"../../../bd/v7_bd/ip/v7_bd_xadc_wiz_0_0/axi_lite_ipif_v1_01_a/hdl/src/vhdl/v7_bd_xadc_wiz_0_0_address_decoder.vhd" \
"../../../bd/v7_bd/ip/v7_bd_xadc_wiz_0_0/axi_lite_ipif_v1_01_a/hdl/src/vhdl/v7_bd_xadc_wiz_0_0_slave_attachment.vhd" \
"../../../bd/v7_bd/ip/v7_bd_xadc_wiz_0_0/interrupt_control_v2_01_a/hdl/src/vhdl/v7_bd_xadc_wiz_0_0_interrupt_control.vhd" \
"../../../bd/v7_bd/ip/v7_bd_xadc_wiz_0_0/axi_lite_ipif_v1_01_a/hdl/src/vhdl/v7_bd_xadc_wiz_0_0_axi_lite_ipif.vhd" \
"../../../bd/v7_bd/ip/v7_bd_xadc_wiz_0_0/v7_bd_xadc_wiz_0_0_xadc_core_drp.vhd" \
"../../../bd/v7_bd/ip/v7_bd_xadc_wiz_0_0/v7_bd_xadc_wiz_0_0_axi_xadc.vhd" \
"../../../bd/v7_bd/ip/v7_bd_xadc_wiz_0_0/v7_bd_xadc_wiz_0_0.vhd" \
"../../../bd/v7_bd/ip/v7_bd_axi_bram_ctrl_reg_file_1/sim/v7_bd_axi_bram_ctrl_reg_file_1.vhd" \

vlog -work generic_baseblocks_v2_1_0  -v2k5 "+incdir+../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/100a" "+incdir+../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/7e3a/hdl" "+incdir+../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/100a" "+incdir+../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/7e3a/hdl" \
"../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/7ee0/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/100a" "+incdir+../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/7e3a/hdl" "+incdir+../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/100a" "+incdir+../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/7e3a/hdl" \
"../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/7e3a/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_11  -v2k5 "+incdir+../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/100a" "+incdir+../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/7e3a/hdl" "+incdir+../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/100a" "+incdir+../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/7e3a/hdl" \
"../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/0b6b/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work axi_data_fifo_v2_1_10  -v2k5 "+incdir+../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/100a" "+incdir+../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/7e3a/hdl" "+incdir+../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/100a" "+incdir+../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/7e3a/hdl" \
"../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/39ba/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_12  -v2k5 "+incdir+../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/100a" "+incdir+../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/7e3a/hdl" "+incdir+../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/100a" "+incdir+../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/7e3a/hdl" \
"../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/896d/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/100a" "+incdir+../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/7e3a/hdl" "+incdir+../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/100a" "+incdir+../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/7e3a/hdl" \
"../../../bd/v7_bd/ip/v7_bd_xbar_0/sim/v7_bd_xbar_0.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/v7_bd/hdl/v7_bd.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/100a" "+incdir+../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/7e3a/hdl" "+incdir+../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/100a" "+incdir+../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/7e3a/hdl" \
"../../../bd/v7_bd/ip/v7_bd_clk_wiz_1_0/v7_bd_clk_wiz_1_0_mmcm_pll_drp.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/v7_bd/ip/v7_bd_clk_wiz_1_0/proc_common_v3_00_a/hdl/src/vhdl/v7_bd_clk_wiz_1_0_conv_funs_pkg.vhd" \
"../../../bd/v7_bd/ip/v7_bd_clk_wiz_1_0/proc_common_v3_00_a/hdl/src/vhdl/v7_bd_clk_wiz_1_0_proc_common_pkg.vhd" \
"../../../bd/v7_bd/ip/v7_bd_clk_wiz_1_0/proc_common_v3_00_a/hdl/src/vhdl/v7_bd_clk_wiz_1_0_ipif_pkg.vhd" \
"../../../bd/v7_bd/ip/v7_bd_clk_wiz_1_0/proc_common_v3_00_a/hdl/src/vhdl/v7_bd_clk_wiz_1_0_family_support.vhd" \
"../../../bd/v7_bd/ip/v7_bd_clk_wiz_1_0/proc_common_v3_00_a/hdl/src/vhdl/v7_bd_clk_wiz_1_0_family.vhd" \
"../../../bd/v7_bd/ip/v7_bd_clk_wiz_1_0/proc_common_v3_00_a/hdl/src/vhdl/v7_bd_clk_wiz_1_0_soft_reset.vhd" \
"../../../bd/v7_bd/ip/v7_bd_clk_wiz_1_0/proc_common_v3_00_a/hdl/src/vhdl/v7_bd_clk_wiz_1_0_pselect_f.vhd" \
"../../../bd/v7_bd/ip/v7_bd_clk_wiz_1_0/axi_lite_ipif_v1_01_a/hdl/src/vhdl/v7_bd_clk_wiz_1_0_address_decoder.vhd" \
"../../../bd/v7_bd/ip/v7_bd_clk_wiz_1_0/axi_lite_ipif_v1_01_a/hdl/src/vhdl/v7_bd_clk_wiz_1_0_slave_attachment.vhd" \
"../../../bd/v7_bd/ip/v7_bd_clk_wiz_1_0/axi_lite_ipif_v1_01_a/hdl/src/vhdl/v7_bd_clk_wiz_1_0_axi_lite_ipif.vhd" \
"../../../bd/v7_bd/ip/v7_bd_clk_wiz_1_0/v7_bd_clk_wiz_1_0_clk_wiz_drp.vhd" \
"../../../bd/v7_bd/ip/v7_bd_clk_wiz_1_0/v7_bd_clk_wiz_1_0_axi_clk_config.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/100a" "+incdir+../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/7e3a/hdl" "+incdir+../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/100a" "+incdir+../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/7e3a/hdl" \
"../../../bd/v7_bd/ip/v7_bd_clk_wiz_1_0/v7_bd_clk_wiz_1_0_clk_wiz.v" \
"../../../bd/v7_bd/ip/v7_bd_clk_wiz_1_0/v7_bd_clk_wiz_1_0.v" \
"../../../bd/v7_bd/ip/v7_bd_s00_regslice_0/sim/v7_bd_s00_regslice_0.v" \
"../../../bd/v7_bd/ip/v7_bd_s00_data_fifo_0/sim/v7_bd_s00_data_fifo_0.v" \
"../../../bd/v7_bd/ip/v7_bd_m02_regslice_0/sim/v7_bd_m02_regslice_0.v" \

vlog -work axi_protocol_converter_v2_1_11  -v2k5 "+incdir+../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/100a" "+incdir+../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/7e3a/hdl" "+incdir+../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/100a" "+incdir+../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/7e3a/hdl" \
"../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/df1b/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/100a" "+incdir+../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/7e3a/hdl" "+incdir+../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/100a" "+incdir+../../../../ctp7_hls_demo.srcs/sources_1/bd/v7_bd/ipshared/7e3a/hdl" \
"../../../bd/v7_bd/ip/v7_bd_auto_pc_0/sim/v7_bd_auto_pc_0.v" \

vlog -work xil_defaultlib "glbl.v"

