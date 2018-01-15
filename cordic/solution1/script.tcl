############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
############################################################
open_project cordic
open_solution "solution1"
set_part {xc7vx690tffg1927-2} -tool vivado
create_clock -period 4.16 -name default
#source "./cordic/solution1/directives.tcl"
#csim_design
csynth_design
#cosim_design
export_design -format ip_catalog
