-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.4 (lin64) Build 1756540 Mon Jan 23 19:11:19 MST 2017
-- Date        : Wed Jul 26 02:24:43 2017
-- Host        : moonraker.cern.ch running 64-bit Scientific Linux CERN SLC release 6.9 (Carbon)
-- Command     : write_vhdl -force -mode synth_stub
--               /data/alex/hls_ventures/ctp7_hls_demo/ctp7_hls_demo.runs/hls_demo_0_synth_1/hls_demo_0_stub.vhdl
-- Design      : hls_demo_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7vx690tffg1927-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity hls_demo_0 is
  Port ( 
    ap_clk : in STD_LOGIC;
    ap_rst : in STD_LOGIC;
    ap_start : in STD_LOGIC;
    ap_done : out STD_LOGIC;
    ap_idle : out STD_LOGIC;
    ap_ready : out STD_LOGIC;
    algo_config_cfg0_V : in STD_LOGIC_VECTOR ( 31 downto 0 );
    algo_config_cfg1_V : in STD_LOGIC_VECTOR ( 15 downto 0 );
    algo_config_cfg2_V : in STD_LOGIC_VECTOR ( 7 downto 0 );
    algo_in_a_V : in STD_LOGIC_VECTOR ( 4 downto 0 );
    algo_in_b_V : in STD_LOGIC_VECTOR ( 19 downto 0 );
    algo_in_c_V : in STD_LOGIC_VECTOR ( 30 downto 0 );
    algo_in_d_V : in STD_LOGIC_VECTOR ( 18 downto 0 );
    algo_out_w_V : out STD_LOGIC_VECTOR ( 24 downto 0 );
    algo_out_x_V : out STD_LOGIC_VECTOR ( 17 downto 0 );
    algo_out_y_V : out STD_LOGIC_VECTOR ( 31 downto 0 );
    algo_out_z_V : out STD_LOGIC_VECTOR ( 8 downto 0 )
  );

end hls_demo_0;

architecture stub of hls_demo_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "ap_clk,ap_rst,ap_start,ap_done,ap_idle,ap_ready,algo_config_cfg0_V[31:0],algo_config_cfg1_V[15:0],algo_config_cfg2_V[7:0],algo_in_a_V[4:0],algo_in_b_V[19:0],algo_in_c_V[30:0],algo_in_d_V[18:0],algo_out_w_V[24:0],algo_out_x_V[17:0],algo_out_y_V[31:0],algo_out_z_V[8:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "hls_demo,Vivado 2016.4";
begin
end;
