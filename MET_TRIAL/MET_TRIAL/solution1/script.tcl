############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
############################################################
open_project MET_TRIAL
set_top MET_O
add_files MET_TRIAL/sine1.h
add_files MET_TRIAL/cos1.h
add_files MET_TRIAL/MET_LUT.h
add_files MET_TRIAL/MET.cc
add_files -tb MET_TRIAL/test_MET_LUT.cpp
open_solution "solution1"
set_part {xc7vx690tffg1927-2} -tool vivado
create_clock -period 4.16 -name default
#source "./MET_TRIAL/solution1/directives.tcl"
csim_design -compiler gcc
csynth_design
cosim_design
export_design -format ip_catalog
