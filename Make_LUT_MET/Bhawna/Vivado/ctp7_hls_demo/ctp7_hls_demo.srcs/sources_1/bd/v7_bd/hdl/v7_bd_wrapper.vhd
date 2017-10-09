--Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2016.4 (lin64) Build 1756540 Mon Jan 23 19:11:19 MST 2017
--Date        : Sat Jul 22 18:13:30 2017
--Host        : moonraker.cern.ch running 64-bit Scientific Linux CERN SLC release 6.9 (Carbon)
--Command     : generate_target v7_bd_wrapper.bd
--Design      : v7_bd_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity v7_bd_wrapper is
  port (
    BRAM_CTRL_INPUT_RAM_0_addr : out STD_LOGIC_VECTOR ( 16 downto 0 );
    BRAM_CTRL_INPUT_RAM_0_clk : out STD_LOGIC;
    BRAM_CTRL_INPUT_RAM_0_din : out STD_LOGIC_VECTOR ( 31 downto 0 );
    BRAM_CTRL_INPUT_RAM_0_dout : in STD_LOGIC_VECTOR ( 31 downto 0 );
    BRAM_CTRL_INPUT_RAM_0_en : out STD_LOGIC;
    BRAM_CTRL_INPUT_RAM_0_rst : out STD_LOGIC;
    BRAM_CTRL_INPUT_RAM_0_we : out STD_LOGIC_VECTOR ( 3 downto 0 );
    BRAM_CTRL_INPUT_RAM_1_addr : out STD_LOGIC_VECTOR ( 16 downto 0 );
    BRAM_CTRL_INPUT_RAM_1_clk : out STD_LOGIC;
    BRAM_CTRL_INPUT_RAM_1_din : out STD_LOGIC_VECTOR ( 31 downto 0 );
    BRAM_CTRL_INPUT_RAM_1_dout : in STD_LOGIC_VECTOR ( 31 downto 0 );
    BRAM_CTRL_INPUT_RAM_1_en : out STD_LOGIC;
    BRAM_CTRL_INPUT_RAM_1_rst : out STD_LOGIC;
    BRAM_CTRL_INPUT_RAM_1_we : out STD_LOGIC_VECTOR ( 3 downto 0 );
    BRAM_CTRL_INPUT_RAM_2_addr : out STD_LOGIC_VECTOR ( 16 downto 0 );
    BRAM_CTRL_INPUT_RAM_2_clk : out STD_LOGIC;
    BRAM_CTRL_INPUT_RAM_2_din : out STD_LOGIC_VECTOR ( 31 downto 0 );
    BRAM_CTRL_INPUT_RAM_2_dout : in STD_LOGIC_VECTOR ( 31 downto 0 );
    BRAM_CTRL_INPUT_RAM_2_en : out STD_LOGIC;
    BRAM_CTRL_INPUT_RAM_2_rst : out STD_LOGIC;
    BRAM_CTRL_INPUT_RAM_2_we : out STD_LOGIC_VECTOR ( 3 downto 0 );
    BRAM_CTRL_OUTPUT_RAM_0_addr : out STD_LOGIC_VECTOR ( 16 downto 0 );
    BRAM_CTRL_OUTPUT_RAM_0_clk : out STD_LOGIC;
    BRAM_CTRL_OUTPUT_RAM_0_din : out STD_LOGIC_VECTOR ( 31 downto 0 );
    BRAM_CTRL_OUTPUT_RAM_0_dout : in STD_LOGIC_VECTOR ( 31 downto 0 );
    BRAM_CTRL_OUTPUT_RAM_0_en : out STD_LOGIC;
    BRAM_CTRL_OUTPUT_RAM_0_rst : out STD_LOGIC;
    BRAM_CTRL_OUTPUT_RAM_0_we : out STD_LOGIC_VECTOR ( 3 downto 0 );
    BRAM_CTRL_OUTPUT_RAM_1_addr : out STD_LOGIC_VECTOR ( 16 downto 0 );
    BRAM_CTRL_OUTPUT_RAM_1_clk : out STD_LOGIC;
    BRAM_CTRL_OUTPUT_RAM_1_din : out STD_LOGIC_VECTOR ( 31 downto 0 );
    BRAM_CTRL_OUTPUT_RAM_1_dout : in STD_LOGIC_VECTOR ( 31 downto 0 );
    BRAM_CTRL_OUTPUT_RAM_1_en : out STD_LOGIC;
    BRAM_CTRL_OUTPUT_RAM_1_rst : out STD_LOGIC;
    BRAM_CTRL_OUTPUT_RAM_1_we : out STD_LOGIC_VECTOR ( 3 downto 0 );
    BRAM_CTRL_REG_FILE_addr : out STD_LOGIC_VECTOR ( 16 downto 0 );
    BRAM_CTRL_REG_FILE_clk : out STD_LOGIC;
    BRAM_CTRL_REG_FILE_din : out STD_LOGIC_VECTOR ( 31 downto 0 );
    BRAM_CTRL_REG_FILE_dout : in STD_LOGIC_VECTOR ( 31 downto 0 );
    BRAM_CTRL_REG_FILE_en : out STD_LOGIC;
    BRAM_CTRL_REG_FILE_rst : out STD_LOGIC;
    BRAM_CTRL_REG_FILE_we : out STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_c2c_v7_to_zynq_clk : out STD_LOGIC;
    axi_c2c_v7_to_zynq_data : out STD_LOGIC_VECTOR ( 16 downto 0 );
    axi_c2c_v7_to_zynq_link_status : out STD_LOGIC;
    axi_c2c_zynq_to_v7_clk : in STD_LOGIC;
    axi_c2c_zynq_to_v7_data : in STD_LOGIC_VECTOR ( 16 downto 0 );
    axi_c2c_zynq_to_v7_reset : in STD_LOGIC;
    clk_200_diff_in_clk_n : in STD_LOGIC;
    clk_200_diff_in_clk_p : in STD_LOGIC;
    clk_240mhz : out STD_LOGIC;
    clk_50mhz : out STD_LOGIC
  );
end v7_bd_wrapper;

architecture STRUCTURE of v7_bd_wrapper is
  component v7_bd is
  port (
    BRAM_CTRL_INPUT_RAM_0_addr : out STD_LOGIC_VECTOR ( 16 downto 0 );
    BRAM_CTRL_INPUT_RAM_0_clk : out STD_LOGIC;
    BRAM_CTRL_INPUT_RAM_0_din : out STD_LOGIC_VECTOR ( 31 downto 0 );
    BRAM_CTRL_INPUT_RAM_0_dout : in STD_LOGIC_VECTOR ( 31 downto 0 );
    BRAM_CTRL_INPUT_RAM_0_en : out STD_LOGIC;
    BRAM_CTRL_INPUT_RAM_0_rst : out STD_LOGIC;
    BRAM_CTRL_INPUT_RAM_0_we : out STD_LOGIC_VECTOR ( 3 downto 0 );
    BRAM_CTRL_REG_FILE_addr : out STD_LOGIC_VECTOR ( 16 downto 0 );
    BRAM_CTRL_REG_FILE_clk : out STD_LOGIC;
    BRAM_CTRL_REG_FILE_din : out STD_LOGIC_VECTOR ( 31 downto 0 );
    BRAM_CTRL_REG_FILE_dout : in STD_LOGIC_VECTOR ( 31 downto 0 );
    BRAM_CTRL_REG_FILE_en : out STD_LOGIC;
    BRAM_CTRL_REG_FILE_rst : out STD_LOGIC;
    BRAM_CTRL_REG_FILE_we : out STD_LOGIC_VECTOR ( 3 downto 0 );
    clk_200_diff_in_clk_n : in STD_LOGIC;
    clk_200_diff_in_clk_p : in STD_LOGIC;
    axi_c2c_zynq_to_v7_clk : in STD_LOGIC;
    axi_c2c_zynq_to_v7_data : in STD_LOGIC_VECTOR ( 16 downto 0 );
    axi_c2c_v7_to_zynq_link_status : out STD_LOGIC;
    axi_c2c_v7_to_zynq_clk : out STD_LOGIC;
    axi_c2c_v7_to_zynq_data : out STD_LOGIC_VECTOR ( 16 downto 0 );
    clk_50mhz : out STD_LOGIC;
    axi_c2c_zynq_to_v7_reset : in STD_LOGIC;
    clk_240mhz : out STD_LOGIC;
    BRAM_CTRL_INPUT_RAM_1_addr : out STD_LOGIC_VECTOR ( 16 downto 0 );
    BRAM_CTRL_INPUT_RAM_1_clk : out STD_LOGIC;
    BRAM_CTRL_INPUT_RAM_1_din : out STD_LOGIC_VECTOR ( 31 downto 0 );
    BRAM_CTRL_INPUT_RAM_1_dout : in STD_LOGIC_VECTOR ( 31 downto 0 );
    BRAM_CTRL_INPUT_RAM_1_en : out STD_LOGIC;
    BRAM_CTRL_INPUT_RAM_1_rst : out STD_LOGIC;
    BRAM_CTRL_INPUT_RAM_1_we : out STD_LOGIC_VECTOR ( 3 downto 0 );
    BRAM_CTRL_INPUT_RAM_2_addr : out STD_LOGIC_VECTOR ( 16 downto 0 );
    BRAM_CTRL_INPUT_RAM_2_clk : out STD_LOGIC;
    BRAM_CTRL_INPUT_RAM_2_din : out STD_LOGIC_VECTOR ( 31 downto 0 );
    BRAM_CTRL_INPUT_RAM_2_dout : in STD_LOGIC_VECTOR ( 31 downto 0 );
    BRAM_CTRL_INPUT_RAM_2_en : out STD_LOGIC;
    BRAM_CTRL_INPUT_RAM_2_rst : out STD_LOGIC;
    BRAM_CTRL_INPUT_RAM_2_we : out STD_LOGIC_VECTOR ( 3 downto 0 );
    BRAM_CTRL_OUTPUT_RAM_0_addr : out STD_LOGIC_VECTOR ( 16 downto 0 );
    BRAM_CTRL_OUTPUT_RAM_0_clk : out STD_LOGIC;
    BRAM_CTRL_OUTPUT_RAM_0_din : out STD_LOGIC_VECTOR ( 31 downto 0 );
    BRAM_CTRL_OUTPUT_RAM_0_dout : in STD_LOGIC_VECTOR ( 31 downto 0 );
    BRAM_CTRL_OUTPUT_RAM_0_en : out STD_LOGIC;
    BRAM_CTRL_OUTPUT_RAM_0_rst : out STD_LOGIC;
    BRAM_CTRL_OUTPUT_RAM_0_we : out STD_LOGIC_VECTOR ( 3 downto 0 );
    BRAM_CTRL_OUTPUT_RAM_1_addr : out STD_LOGIC_VECTOR ( 16 downto 0 );
    BRAM_CTRL_OUTPUT_RAM_1_clk : out STD_LOGIC;
    BRAM_CTRL_OUTPUT_RAM_1_din : out STD_LOGIC_VECTOR ( 31 downto 0 );
    BRAM_CTRL_OUTPUT_RAM_1_dout : in STD_LOGIC_VECTOR ( 31 downto 0 );
    BRAM_CTRL_OUTPUT_RAM_1_en : out STD_LOGIC;
    BRAM_CTRL_OUTPUT_RAM_1_rst : out STD_LOGIC;
    BRAM_CTRL_OUTPUT_RAM_1_we : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  end component v7_bd;
begin
v7_bd_i: component v7_bd
     port map (
      BRAM_CTRL_INPUT_RAM_0_addr(16 downto 0) => BRAM_CTRL_INPUT_RAM_0_addr(16 downto 0),
      BRAM_CTRL_INPUT_RAM_0_clk => BRAM_CTRL_INPUT_RAM_0_clk,
      BRAM_CTRL_INPUT_RAM_0_din(31 downto 0) => BRAM_CTRL_INPUT_RAM_0_din(31 downto 0),
      BRAM_CTRL_INPUT_RAM_0_dout(31 downto 0) => BRAM_CTRL_INPUT_RAM_0_dout(31 downto 0),
      BRAM_CTRL_INPUT_RAM_0_en => BRAM_CTRL_INPUT_RAM_0_en,
      BRAM_CTRL_INPUT_RAM_0_rst => BRAM_CTRL_INPUT_RAM_0_rst,
      BRAM_CTRL_INPUT_RAM_0_we(3 downto 0) => BRAM_CTRL_INPUT_RAM_0_we(3 downto 0),
      BRAM_CTRL_INPUT_RAM_1_addr(16 downto 0) => BRAM_CTRL_INPUT_RAM_1_addr(16 downto 0),
      BRAM_CTRL_INPUT_RAM_1_clk => BRAM_CTRL_INPUT_RAM_1_clk,
      BRAM_CTRL_INPUT_RAM_1_din(31 downto 0) => BRAM_CTRL_INPUT_RAM_1_din(31 downto 0),
      BRAM_CTRL_INPUT_RAM_1_dout(31 downto 0) => BRAM_CTRL_INPUT_RAM_1_dout(31 downto 0),
      BRAM_CTRL_INPUT_RAM_1_en => BRAM_CTRL_INPUT_RAM_1_en,
      BRAM_CTRL_INPUT_RAM_1_rst => BRAM_CTRL_INPUT_RAM_1_rst,
      BRAM_CTRL_INPUT_RAM_1_we(3 downto 0) => BRAM_CTRL_INPUT_RAM_1_we(3 downto 0),
      BRAM_CTRL_INPUT_RAM_2_addr(16 downto 0) => BRAM_CTRL_INPUT_RAM_2_addr(16 downto 0),
      BRAM_CTRL_INPUT_RAM_2_clk => BRAM_CTRL_INPUT_RAM_2_clk,
      BRAM_CTRL_INPUT_RAM_2_din(31 downto 0) => BRAM_CTRL_INPUT_RAM_2_din(31 downto 0),
      BRAM_CTRL_INPUT_RAM_2_dout(31 downto 0) => BRAM_CTRL_INPUT_RAM_2_dout(31 downto 0),
      BRAM_CTRL_INPUT_RAM_2_en => BRAM_CTRL_INPUT_RAM_2_en,
      BRAM_CTRL_INPUT_RAM_2_rst => BRAM_CTRL_INPUT_RAM_2_rst,
      BRAM_CTRL_INPUT_RAM_2_we(3 downto 0) => BRAM_CTRL_INPUT_RAM_2_we(3 downto 0),
      BRAM_CTRL_OUTPUT_RAM_0_addr(16 downto 0) => BRAM_CTRL_OUTPUT_RAM_0_addr(16 downto 0),
      BRAM_CTRL_OUTPUT_RAM_0_clk => BRAM_CTRL_OUTPUT_RAM_0_clk,
      BRAM_CTRL_OUTPUT_RAM_0_din(31 downto 0) => BRAM_CTRL_OUTPUT_RAM_0_din(31 downto 0),
      BRAM_CTRL_OUTPUT_RAM_0_dout(31 downto 0) => BRAM_CTRL_OUTPUT_RAM_0_dout(31 downto 0),
      BRAM_CTRL_OUTPUT_RAM_0_en => BRAM_CTRL_OUTPUT_RAM_0_en,
      BRAM_CTRL_OUTPUT_RAM_0_rst => BRAM_CTRL_OUTPUT_RAM_0_rst,
      BRAM_CTRL_OUTPUT_RAM_0_we(3 downto 0) => BRAM_CTRL_OUTPUT_RAM_0_we(3 downto 0),
      BRAM_CTRL_OUTPUT_RAM_1_addr(16 downto 0) => BRAM_CTRL_OUTPUT_RAM_1_addr(16 downto 0),
      BRAM_CTRL_OUTPUT_RAM_1_clk => BRAM_CTRL_OUTPUT_RAM_1_clk,
      BRAM_CTRL_OUTPUT_RAM_1_din(31 downto 0) => BRAM_CTRL_OUTPUT_RAM_1_din(31 downto 0),
      BRAM_CTRL_OUTPUT_RAM_1_dout(31 downto 0) => BRAM_CTRL_OUTPUT_RAM_1_dout(31 downto 0),
      BRAM_CTRL_OUTPUT_RAM_1_en => BRAM_CTRL_OUTPUT_RAM_1_en,
      BRAM_CTRL_OUTPUT_RAM_1_rst => BRAM_CTRL_OUTPUT_RAM_1_rst,
      BRAM_CTRL_OUTPUT_RAM_1_we(3 downto 0) => BRAM_CTRL_OUTPUT_RAM_1_we(3 downto 0),
      BRAM_CTRL_REG_FILE_addr(16 downto 0) => BRAM_CTRL_REG_FILE_addr(16 downto 0),
      BRAM_CTRL_REG_FILE_clk => BRAM_CTRL_REG_FILE_clk,
      BRAM_CTRL_REG_FILE_din(31 downto 0) => BRAM_CTRL_REG_FILE_din(31 downto 0),
      BRAM_CTRL_REG_FILE_dout(31 downto 0) => BRAM_CTRL_REG_FILE_dout(31 downto 0),
      BRAM_CTRL_REG_FILE_en => BRAM_CTRL_REG_FILE_en,
      BRAM_CTRL_REG_FILE_rst => BRAM_CTRL_REG_FILE_rst,
      BRAM_CTRL_REG_FILE_we(3 downto 0) => BRAM_CTRL_REG_FILE_we(3 downto 0),
      axi_c2c_v7_to_zynq_clk => axi_c2c_v7_to_zynq_clk,
      axi_c2c_v7_to_zynq_data(16 downto 0) => axi_c2c_v7_to_zynq_data(16 downto 0),
      axi_c2c_v7_to_zynq_link_status => axi_c2c_v7_to_zynq_link_status,
      axi_c2c_zynq_to_v7_clk => axi_c2c_zynq_to_v7_clk,
      axi_c2c_zynq_to_v7_data(16 downto 0) => axi_c2c_zynq_to_v7_data(16 downto 0),
      axi_c2c_zynq_to_v7_reset => axi_c2c_zynq_to_v7_reset,
      clk_200_diff_in_clk_n => clk_200_diff_in_clk_n,
      clk_200_diff_in_clk_p => clk_200_diff_in_clk_p,
      clk_240mhz => clk_240mhz,
      clk_50mhz => clk_50mhz
    );
end STRUCTURE;
