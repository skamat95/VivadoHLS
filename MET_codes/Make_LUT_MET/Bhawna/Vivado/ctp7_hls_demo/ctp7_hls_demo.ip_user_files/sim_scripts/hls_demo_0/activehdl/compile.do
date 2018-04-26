vlib work
vlib activehdl

vlib activehdl/xil_defaultlib
vlib activehdl/xpm

vmap xil_defaultlib activehdl/xil_defaultlib
vmap xpm activehdl/xpm

vlog -work xil_defaultlib  -sv2k12 \
"/opt/Xilinx/Vivado/2016.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/opt/Xilinx/Vivado/2016.4/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"/opt/Xilinx/Vivado/2016.4/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xil_defaultlib -93 \
"../../../ipstatic/hdl/vhdl/hls_demo.vhd" \
"../../../ipstatic/hdl/vhdl/hls_demo_sdiv_20nbkb.vhd" \
"../../../ipstatic/hdl/vhdl/hls_demo_mul_31s_cud.vhd" \
"../../../ip/hls_demo_0/sim/hls_demo_0.vhd" \

vlog -work xil_defaultlib "glbl.v"

