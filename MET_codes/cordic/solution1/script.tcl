############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
############################################################
open_project cordic
add_files cordic/CordicXIP.cc
add_files cordic/CordicXIP.h
add_files cordic/CordicXilinx.h
add_files cordic/cordic_v6_0_bitacc_cmodel.h
add_files cordic/fuzzer.h
add_files cordic/xip_common_bitacc_cmodel.h
add_files -tb cordic/test.cc
open_solution "solution1"
set_part {xc7vx690tffg1927-2} -tool vivado
create_clock -period 4.16 -name default
#source "./cordic/solution1/directives.tcl"
csim_design -compiler gcc
csynth_design
cosim_design
export_design -rtl verilog -format ip_catalog
