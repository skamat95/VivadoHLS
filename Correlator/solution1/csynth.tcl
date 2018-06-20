############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
############################################################
open_project Correlator
set_top getClusterTrackLinker
add_files Correlator/ClusterFinder.cc
add_files Correlator/ClusterFinder.hh
add_files Correlator/ClusterTrackLinker.cc
add_files Correlator/ClusterTrackLinker.hh
add_files -tb Correlator/test1_correlator.cc
open_solution "solution1"
set_part {xc7vx690tffg1927-2}
create_clock -period 4.16 -name default
#source "./Correlator/solution1/directives.tcl"
csynth_design
