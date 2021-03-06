-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2016.4
-- Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity addsub_2 is
port (
    a_V : IN STD_LOGIC_VECTOR (78 downto 0);
    b_V : IN STD_LOGIC_VECTOR (76 downto 0);
    add_V : IN STD_LOGIC_VECTOR (0 downto 0);
    ap_return : OUT STD_LOGIC_VECTOR (79 downto 0) );
end;


architecture behav of addsub_2 is 
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv77_0 : STD_LOGIC_VECTOR (76 downto 0) := "00000000000000000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';

    signal p_Val2_s_fu_38_p2 : STD_LOGIC_VECTOR (76 downto 0);
    signal p_Val2_s_31_fu_44_p3 : STD_LOGIC_VECTOR (76 downto 0);
    signal tmp_s_fu_52_p1 : STD_LOGIC_VECTOR (79 downto 0);
    signal tmp_36_fu_56_p1 : STD_LOGIC_VECTOR (79 downto 0);


begin



    ap_return <= std_logic_vector(signed(tmp_s_fu_52_p1) + signed(tmp_36_fu_56_p1));
    p_Val2_s_31_fu_44_p3 <= 
        b_V when (add_V(0) = '1') else 
        p_Val2_s_fu_38_p2;
    p_Val2_s_fu_38_p2 <= std_logic_vector(unsigned(ap_const_lv77_0) - unsigned(b_V));
        tmp_36_fu_56_p1 <= std_logic_vector(resize(signed(p_Val2_s_31_fu_44_p3),80));

        tmp_s_fu_52_p1 <= std_logic_vector(resize(signed(a_V),80));

end behav;
