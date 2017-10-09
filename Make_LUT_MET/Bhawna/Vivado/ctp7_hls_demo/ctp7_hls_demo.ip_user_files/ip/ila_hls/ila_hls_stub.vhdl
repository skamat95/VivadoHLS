-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.4 (lin64) Build 1756540 Mon Jan 23 19:11:19 MST 2017
-- Date        : Tue Jul 25 18:05:23 2017
-- Host        : moonraker.cern.ch running 64-bit Scientific Linux CERN SLC release 6.9 (Carbon)
-- Command     : write_vhdl -force -mode synth_stub
--               /data/alex/hls_ventures/ctp7_hls_demo/ctp7_hls_demo.runs/ila_hls_synth_1/ila_hls_stub.vhdl
-- Design      : ila_hls
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7vx690tffg1927-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ila_hls is
  Port ( 
    clk : in STD_LOGIC;
    probe0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe3 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe4 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe5 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe6 : in STD_LOGIC_VECTOR ( 191 downto 0 );
    probe7 : in STD_LOGIC_VECTOR ( 191 downto 0 )
  );

end ila_hls;

architecture stub of ila_hls is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,probe0[0:0],probe1[0:0],probe2[0:0],probe3[0:0],probe4[0:0],probe5[0:0],probe6[191:0],probe7[191:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "ila,Vivado 2016.4";
begin
end;
