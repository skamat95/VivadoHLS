// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (lin64) Build 1756540 Mon Jan 23 19:11:19 MST 2017
// Date        : Wed Jul 26 02:24:43 2017
// Host        : moonraker.cern.ch running 64-bit Scientific Linux CERN SLC release 6.9 (Carbon)
// Command     : write_verilog -force -mode synth_stub
//               /data/alex/hls_ventures/ctp7_hls_demo/ctp7_hls_demo.runs/hls_demo_0_synth_1/hls_demo_0_stub.v
// Design      : hls_demo_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7vx690tffg1927-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "hls_demo,Vivado 2016.4" *)
module hls_demo_0(ap_clk, ap_rst, ap_start, ap_done, ap_idle, 
  ap_ready, algo_config_cfg0_V, algo_config_cfg1_V, algo_config_cfg2_V, algo_in_a_V, 
  algo_in_b_V, algo_in_c_V, algo_in_d_V, algo_out_w_V, algo_out_x_V, algo_out_y_V, 
  algo_out_z_V)
/* synthesis syn_black_box black_box_pad_pin="ap_clk,ap_rst,ap_start,ap_done,ap_idle,ap_ready,algo_config_cfg0_V[31:0],algo_config_cfg1_V[15:0],algo_config_cfg2_V[7:0],algo_in_a_V[4:0],algo_in_b_V[19:0],algo_in_c_V[30:0],algo_in_d_V[18:0],algo_out_w_V[24:0],algo_out_x_V[17:0],algo_out_y_V[31:0],algo_out_z_V[8:0]" */;
  input ap_clk;
  input ap_rst;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  input [31:0]algo_config_cfg0_V;
  input [15:0]algo_config_cfg1_V;
  input [7:0]algo_config_cfg2_V;
  input [4:0]algo_in_a_V;
  input [19:0]algo_in_b_V;
  input [30:0]algo_in_c_V;
  input [18:0]algo_in_d_V;
  output [24:0]algo_out_w_V;
  output [17:0]algo_out_x_V;
  output [31:0]algo_out_y_V;
  output [8:0]algo_out_z_V;
endmodule
