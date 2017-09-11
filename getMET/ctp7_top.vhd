
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;

use work.ctp7_utils_pkg.all;


library UNISIM;
use UNISIM.VCOMPONENTS.all;

entity ctp7_top is
  generic (
    C_DATE_CODE      : std_logic_vector (31 downto 0) := x"00000000";
    C_GITHASH_CODE   : std_logic_vector (31 downto 0) := x"00000000";
    C_GIT_REPO_DIRTY : std_logic                      := '0'
    );
  Port (
  
      clk_200_diff_in_clk_p : in std_logic;
      clk_200_diff_in_clk_n : in std_logic;
    
      LEDs : out std_logic_vector (1 downto 0);
    
      LED_GREEN_o : out std_logic;
      LED_RED_o   : out std_logic;
      LED_BLUE_o  : out std_logic;
    
      axi_c2c_v7_to_zynq_data        : out std_logic_vector (16 downto 0);
      axi_c2c_v7_to_zynq_clk         : out std_logic;
      axi_c2c_zynq_to_v7_clk         : in  std_logic;
      axi_c2c_zynq_to_v7_data        : in  std_logic_vector (16 downto 0);
      axi_c2c_v7_to_zynq_link_status : out std_logic;
      axi_c2c_zynq_to_v7_reset       : in  std_logic
   );
end ctp7_top;

architecture ctp7_top_arch of ctp7_top is

  component v7_bd is
  port (

    clk_200_diff_in_clk_n : in STD_LOGIC;
    clk_200_diff_in_clk_p : in STD_LOGIC;
    
    axi_c2c_zynq_to_v7_clk : in STD_LOGIC;
    axi_c2c_zynq_to_v7_data : in STD_LOGIC_VECTOR ( 16 downto 0 );
    axi_c2c_v7_to_zynq_link_status : out STD_LOGIC;
    axi_c2c_v7_to_zynq_clk : out STD_LOGIC;
    axi_c2c_v7_to_zynq_data : out STD_LOGIC_VECTOR ( 16 downto 0 );
    axi_c2c_zynq_to_v7_reset : in STD_LOGIC;

    BRAM_CTRL_REG_FILE_addr : out STD_LOGIC_VECTOR ( 16 downto 0 );
    BRAM_CTRL_REG_FILE_clk : out STD_LOGIC;
    BRAM_CTRL_REG_FILE_din : out STD_LOGIC_VECTOR ( 31 downto 0 );
    BRAM_CTRL_REG_FILE_dout : in STD_LOGIC_VECTOR ( 31 downto 0 );
    BRAM_CTRL_REG_FILE_en : out STD_LOGIC;
    BRAM_CTRL_REG_FILE_rst : out STD_LOGIC;
    BRAM_CTRL_REG_FILE_we : out STD_LOGIC_VECTOR ( 3 downto 0 );

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
    
    clk_50mhz : out STD_LOGIC;
    clk_240mhz : out STD_LOGIC    
    
  );
  end component v7_bd;
  
COMPONENT ila_hls
       
       PORT (
           clk : IN STD_LOGIC;
       
       
       
           probe0 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
           probe1 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
           probe2 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
           probe3 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
           probe4 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
           probe5 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
           probe6 : IN STD_LOGIC_VECTOR(191 DOWNTO 0);
           probe7 : IN STD_LOGIC_VECTOR(191 DOWNTO 0)
       );
       END COMPONENT  ;
  

  signal s_clk_50  : std_logic;
  signal s_clk_240 : std_logic;

  signal BRAM_CTRL_REG_FILE_en   : std_logic;
  signal BRAM_CTRL_REG_FILE_dout : std_logic_vector (31 downto 0);
  signal BRAM_CTRL_REG_FILE_din  : std_logic_vector (31 downto 0);
  signal BRAM_CTRL_REG_FILE_we   : std_logic_vector (3 downto 0);
  signal BRAM_CTRL_REG_FILE_addr : std_logic_vector (16 downto 0);
  signal BRAM_CTRL_REG_FILE_clk  : std_logic;
  signal BRAM_CTRL_REG_FILE_rst  : std_logic;

  signal BRAM_CTRL_INPUT_RAM_0_addr : std_logic_vector (16 downto 0);
  signal BRAM_CTRL_INPUT_RAM_0_clk  : std_logic;
  signal BRAM_CTRL_INPUT_RAM_0_din  : std_logic_vector (31 downto 0);
  signal BRAM_CTRL_INPUT_RAM_0_dout : std_logic_vector (31 downto 0);
  signal BRAM_CTRL_INPUT_RAM_0_en   : std_logic;
  signal BRAM_CTRL_INPUT_RAM_0_rst  : std_logic;
  signal BRAM_CTRL_INPUT_RAM_0_we   : std_logic_vector (3 downto 0);

  signal BRAM_CTRL_INPUT_RAM_1_addr : std_logic_vector (16 downto 0);
  signal BRAM_CTRL_INPUT_RAM_1_clk  : std_logic;
  signal BRAM_CTRL_INPUT_RAM_1_din  : std_logic_vector (31 downto 0);
  signal BRAM_CTRL_INPUT_RAM_1_dout : std_logic_vector (31 downto 0);
  signal BRAM_CTRL_INPUT_RAM_1_en   : std_logic;
  signal BRAM_CTRL_INPUT_RAM_1_rst  : std_logic;
  signal BRAM_CTRL_INPUT_RAM_1_we   : std_logic_vector (3 downto 0);
  
  signal BRAM_CTRL_INPUT_RAM_2_addr : std_logic_vector (16 downto 0);
  signal BRAM_CTRL_INPUT_RAM_2_clk  : std_logic;
  signal BRAM_CTRL_INPUT_RAM_2_din  : std_logic_vector (31 downto 0);
  signal BRAM_CTRL_INPUT_RAM_2_dout : std_logic_vector (31 downto 0);
  signal BRAM_CTRL_INPUT_RAM_2_en   : std_logic;
  signal BRAM_CTRL_INPUT_RAM_2_rst  : std_logic;
  signal BRAM_CTRL_INPUT_RAM_2_we   : std_logic_vector (3 downto 0);

  signal BRAM_CTRL_OUTPUT_RAM_0_addr : std_logic_vector (16 downto 0); 
  signal BRAM_CTRL_OUTPUT_RAM_0_clk  : std_logic;
  signal BRAM_CTRL_OUTPUT_RAM_0_din  : std_logic_vector (31 downto 0);
  signal BRAM_CTRL_OUTPUT_RAM_0_dout : std_logic_vector (31 downto 0);
  signal BRAM_CTRL_OUTPUT_RAM_0_en   : std_logic;
  signal BRAM_CTRL_OUTPUT_RAM_0_rst  : std_logic;
  signal BRAM_CTRL_OUTPUT_RAM_0_we   : std_logic_vector (3 downto 0);

  signal BRAM_CTRL_OUTPUT_RAM_1_addr : std_logic_vector (16 downto 0);
  signal BRAM_CTRL_OUTPUT_RAM_1_clk  : std_logic;
  signal BRAM_CTRL_OUTPUT_RAM_1_din  : std_logic_vector (31 downto 0);
  signal BRAM_CTRL_OUTPUT_RAM_1_dout : std_logic_vector (31 downto 0);
  signal BRAM_CTRL_OUTPUT_RAM_1_en   : std_logic;
  signal BRAM_CTRL_OUTPUT_RAM_1_rst  : std_logic;
  signal BRAM_CTRL_OUTPUT_RAM_1_we   : std_logic_vector (3 downto 0);

  signal s_LED_FP : std_logic_vector(31 downto 0);
  
  signal s_pattern_start_request: std_logic;
  signal s_algo_latency :  std_logic_vector ( 15 downto 0 );
  
  signal s_pattern_start, s_pattern_start_s1, s_pattern_start_s2:  std_logic;
  
  signal s_INPUT_RAM_start:  std_logic;
  signal s_OUTPUT_RAM_start:  std_logic;
  
  signal s_INPUT_link_arr :  t_slv_arr_192(66 downto 0) := (others => (others => '0'));
  signal s_OUTPUT_link_arr:   t_slv_arr_192(47 downto 0) := (others => (others => '0'));
  signal s_cfg_reg : t_slv_arr_32(31 downto 0);

-----------------------------------------------------------------------------
-- Begin User_Code
-----------------------------------------------------------------------------
 COMPONENT getMET_2
    PORT (
      ap_clk : IN STD_LOGIC;
      ap_rst : IN STD_LOGIC;
      ap_start : IN STD_LOGIC;
      ap_done : OUT STD_LOGIC;
      ap_idle : OUT STD_LOGIC;
      ap_ready : OUT STD_LOGIC;
      
--      algo_config_cfg0_V : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
--      algo_config_cfg1_V : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
--      algo_config_cfg2_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
--      algo_in_a_V : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
--      algo_in_b_V : IN STD_LOGIC_VECTOR(19 DOWNTO 0);
--      algo_in_c_V : IN STD_LOGIC_VECTOR(30 DOWNTO 0);
--      algo_in_d_V : IN STD_LOGIC_VECTOR(18 DOWNTO 0);
--      algo_out_w_V : OUT STD_LOGIC_VECTOR(24 DOWNTO 0);
--      algo_out_x_V : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
--      algo_out_y_V : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
--      algo_out_z_V : OUT STD_LOGIC_VECTOR(8 DOWNTO 0)


TrackPT_0 : IN STD_LOGIC_VECTOR (31 downto 0);
TrackPT_1 : IN STD_LOGIC_VECTOR (31 downto 0);
TrackPT_2 : IN STD_LOGIC_VECTOR (31 downto 0);
TrackPT_3 : IN STD_LOGIC_VECTOR (31 downto 0);
TrackPT_4 : IN STD_LOGIC_VECTOR (31 downto 0);
TrackPT_5 : IN STD_LOGIC_VECTOR (31 downto 0);
TrackPT_6 : IN STD_LOGIC_VECTOR (31 downto 0);
TrackPT_7 : IN STD_LOGIC_VECTOR (31 downto 0);
TrackPT_8 : IN STD_LOGIC_VECTOR (31 downto 0);
TrackPT_9 : IN STD_LOGIC_VECTOR (31 downto 0);
TrackPhi_0 : IN STD_LOGIC_VECTOR (31 downto 0);
TrackPhi_1 : IN STD_LOGIC_VECTOR (31 downto 0);
TrackPhi_2 : IN STD_LOGIC_VECTOR (31 downto 0);
TrackPhi_3 : IN STD_LOGIC_VECTOR (31 downto 0);
TrackPhi_4 : IN STD_LOGIC_VECTOR (31 downto 0);
TrackPhi_5 : IN STD_LOGIC_VECTOR (31 downto 0);
TrackPhi_6 : IN STD_LOGIC_VECTOR (31 downto 0);
TrackPhi_7 : IN STD_LOGIC_VECTOR (31 downto 0);
TrackPhi_8 : IN STD_LOGIC_VECTOR (31 downto 0);
TrackPhi_9 : IN STD_LOGIC_VECTOR (31 downto 0);
CaloET_0 : IN STD_LOGIC_VECTOR (31 downto 0);
CaloET_1 : IN STD_LOGIC_VECTOR (31 downto 0);
CaloET_2 : IN STD_LOGIC_VECTOR (31 downto 0);
CaloET_3 : IN STD_LOGIC_VECTOR (31 downto 0);
CaloET_4 : IN STD_LOGIC_VECTOR (31 downto 0);
CaloET_5 : IN STD_LOGIC_VECTOR (31 downto 0);
CaloET_6 : IN STD_LOGIC_VECTOR (31 downto 0);
CaloET_7 : IN STD_LOGIC_VECTOR (31 downto 0);
CaloET_8 : IN STD_LOGIC_VECTOR (31 downto 0);
CaloET_9 : IN STD_LOGIC_VECTOR (31 downto 0);
CaloPhi_0 : IN STD_LOGIC_VECTOR (31 downto 0);
CaloPhi_1 : IN STD_LOGIC_VECTOR (31 downto 0);
CaloPhi_2 : IN STD_LOGIC_VECTOR (31 downto 0);
CaloPhi_3 : IN STD_LOGIC_VECTOR (31 downto 0);
CaloPhi_4 : IN STD_LOGIC_VECTOR (31 downto 0);
CaloPhi_5 : IN STD_LOGIC_VECTOR (31 downto 0);
CaloPhi_6 : IN STD_LOGIC_VECTOR (31 downto 0);
CaloPhi_7 : IN STD_LOGIC_VECTOR (31 downto 0);
CaloPhi_8 : IN STD_LOGIC_VECTOR (31 downto 0);
CaloPhi_9 : IN STD_LOGIC_VECTOR (31 downto 0);
out_0 : OUT STD_LOGIC_VECTOR (31 downto 0);
out_1 : OUT STD_LOGIC_VECTOR (31 downto 0)
--out_2 : OUT STD_LOGIC_VECTOR (31 downto 0)
    );
  END COMPONENT;  

-- HLS Algo Control/Handshake Interface
signal ap_clk :  STD_LOGIC;
signal ap_rst :  STD_LOGIC;
signal ap_start :  STD_LOGIC;
signal ap_done :  STD_LOGIC;
signal ap_idle :  STD_LOGIC;
signal ap_ready :  STD_LOGIC;
      
--      signal algo_config_cfg0_V :  STD_LOGIC_VECTOR(31 DOWNTO 0);
--      signal algo_config_cfg1_V :  STD_LOGIC_VECTOR(15 DOWNTO 0);
--      signal algo_config_cfg2_V :  STD_LOGIC_VECTOR(7 DOWNTO 0);
--      signal algo_in_a_V :  STD_LOGIC_VECTOR(4 DOWNTO 0);
--      signal algo_in_b_V :  STD_LOGIC_VECTOR(19 DOWNTO 0);
--      signal algo_in_c_V :  STD_LOGIC_VECTOR(30 DOWNTO 0);
--      signal algo_in_d_V :  STD_LOGIC_VECTOR(18 DOWNTO 0);
--      signal algo_out_w_V :  STD_LOGIC_VECTOR(24 DOWNTO 0);
--      signal algo_out_x_V :  STD_LOGIC_VECTOR(17 DOWNTO 0);
--      signal algo_out_y_V :  STD_LOGIC_VECTOR(31 DOWNTO 0);
--      signal algo_out_z_V :  STD_LOGIC_VECTOR(8 DOWNTO 0);

signal TrackPT_0 : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal TrackPT_1 : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal TrackPT_2 : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal TrackPT_3 : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal TrackPT_4 : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal TrackPT_5 : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal TrackPT_6 : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal TrackPT_7 : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal TrackPT_8 : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal TrackPT_9 : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal TrackPhi_0 : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal TrackPhi_1 : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal TrackPhi_2 : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal TrackPhi_3 : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal TrackPhi_4 : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal TrackPhi_5 : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal TrackPhi_6 : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal TrackPhi_7 : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal TrackPhi_8 : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal TrackPhi_9 : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CaloET_0 : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CaloET_1 : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CaloET_2 : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CaloET_3 : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CaloET_4 : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CaloET_5 : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CaloET_6 : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CaloET_7 : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CaloET_8 : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CaloET_9 : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CaloPhi_0 : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CaloPhi_1 : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CaloPhi_2 : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CaloPhi_3 : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CaloPhi_4 : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CaloPhi_5 : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CaloPhi_6 : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CaloPhi_7 : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CaloPhi_8 : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal CaloPhi_9 : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal out_0_s : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal out_1_s : STD_LOGIC_VECTOR(31 DOWNTO 0);
--signal out_2_s : STD_LOGIC_VECTOR(31 DOWNTO 0);

-----------------------------------------------------------------------------
-- End User_Code
-----------------------------------------------------------------------------
           
begin

    LED_GREEN_o <= s_LED_FP(0);
    LED_RED_o   <= s_LED_FP(1);
    LED_BLUE_o  <= s_LED_FP(2);

  i_v7_bd : v7_bd
    port map (
    
        axi_c2c_v7_to_zynq_clk               => axi_c2c_v7_to_zynq_clk,
        axi_c2c_v7_to_zynq_data(16 downto 0) => axi_c2c_v7_to_zynq_data(16 downto 0),
        axi_c2c_v7_to_zynq_link_status       => axi_c2c_v7_to_zynq_link_status,
        axi_c2c_zynq_to_v7_clk               => axi_c2c_zynq_to_v7_clk,
        axi_c2c_zynq_to_v7_data(16 downto 0) => axi_c2c_zynq_to_v7_data(16 downto 0),
        axi_c2c_zynq_to_v7_reset             => axi_c2c_zynq_to_v7_reset,
    
        clk_200_diff_in_clk_n => clk_200_diff_in_clk_n,
        clk_200_diff_in_clk_p => clk_200_diff_in_clk_p,
        
        BRAM_CTRL_REG_FILE_addr => BRAM_CTRL_REG_FILE_addr,
        BRAM_CTRL_REG_FILE_clk  => BRAM_CTRL_REG_FILE_clk,
        BRAM_CTRL_REG_FILE_din  => BRAM_CTRL_REG_FILE_din,
        BRAM_CTRL_REG_FILE_dout => BRAM_CTRL_REG_FILE_dout,
        BRAM_CTRL_REG_FILE_en   => BRAM_CTRL_REG_FILE_en,
        BRAM_CTRL_REG_FILE_rst  => BRAM_CTRL_REG_FILE_rst,
        BRAM_CTRL_REG_FILE_we   => BRAM_CTRL_REG_FILE_we,

        BRAM_CTRL_INPUT_RAM_0_addr => BRAM_CTRL_INPUT_RAM_0_addr,
        BRAM_CTRL_INPUT_RAM_0_clk  => BRAM_CTRL_INPUT_RAM_0_clk,
        BRAM_CTRL_INPUT_RAM_0_din  => BRAM_CTRL_INPUT_RAM_0_din,
        BRAM_CTRL_INPUT_RAM_0_dout => BRAM_CTRL_INPUT_RAM_0_dout,
        BRAM_CTRL_INPUT_RAM_0_en   => BRAM_CTRL_INPUT_RAM_0_en,
        BRAM_CTRL_INPUT_RAM_0_rst  => BRAM_CTRL_INPUT_RAM_0_rst,
        BRAM_CTRL_INPUT_RAM_0_we   => BRAM_CTRL_INPUT_RAM_0_we,

        BRAM_CTRL_INPUT_RAM_1_addr => BRAM_CTRL_INPUT_RAM_1_addr,
        BRAM_CTRL_INPUT_RAM_1_clk  => BRAM_CTRL_INPUT_RAM_1_clk,
        BRAM_CTRL_INPUT_RAM_1_din  => BRAM_CTRL_INPUT_RAM_1_din,
        BRAM_CTRL_INPUT_RAM_1_dout => BRAM_CTRL_INPUT_RAM_1_dout,
        BRAM_CTRL_INPUT_RAM_1_en   => BRAM_CTRL_INPUT_RAM_1_en,
        BRAM_CTRL_INPUT_RAM_1_rst  => BRAM_CTRL_INPUT_RAM_1_rst,
        BRAM_CTRL_INPUT_RAM_1_we   => BRAM_CTRL_INPUT_RAM_1_we,
        
        BRAM_CTRL_INPUT_RAM_2_addr => BRAM_CTRL_INPUT_RAM_2_addr,
        BRAM_CTRL_INPUT_RAM_2_clk  => BRAM_CTRL_INPUT_RAM_2_clk,
        BRAM_CTRL_INPUT_RAM_2_din  => BRAM_CTRL_INPUT_RAM_2_din,
        BRAM_CTRL_INPUT_RAM_2_dout => BRAM_CTRL_INPUT_RAM_2_dout,
        BRAM_CTRL_INPUT_RAM_2_en   => BRAM_CTRL_INPUT_RAM_2_en,
        BRAM_CTRL_INPUT_RAM_2_rst  => BRAM_CTRL_INPUT_RAM_2_rst,
        BRAM_CTRL_INPUT_RAM_2_we   => BRAM_CTRL_INPUT_RAM_2_we,
        
        BRAM_CTRL_OUTPUT_RAM_0_addr => BRAM_CTRL_OUTPUT_RAM_0_addr,
        BRAM_CTRL_OUTPUT_RAM_0_clk  => BRAM_CTRL_OUTPUT_RAM_0_clk,
        BRAM_CTRL_OUTPUT_RAM_0_din  => BRAM_CTRL_OUTPUT_RAM_0_din,
        BRAM_CTRL_OUTPUT_RAM_0_dout => BRAM_CTRL_OUTPUT_RAM_0_dout,
        BRAM_CTRL_OUTPUT_RAM_0_en   => BRAM_CTRL_OUTPUT_RAM_0_en,
        BRAM_CTRL_OUTPUT_RAM_0_rst  => BRAM_CTRL_OUTPUT_RAM_0_rst,
        BRAM_CTRL_OUTPUT_RAM_0_we   => BRAM_CTRL_OUTPUT_RAM_0_we,
 
        BRAM_CTRL_OUTPUT_RAM_1_addr => BRAM_CTRL_OUTPUT_RAM_1_addr,
        BRAM_CTRL_OUTPUT_RAM_1_clk  => BRAM_CTRL_OUTPUT_RAM_1_clk,
        BRAM_CTRL_OUTPUT_RAM_1_din  => BRAM_CTRL_OUTPUT_RAM_1_din,
        BRAM_CTRL_OUTPUT_RAM_1_dout => BRAM_CTRL_OUTPUT_RAM_1_dout,
        BRAM_CTRL_OUTPUT_RAM_1_en   => BRAM_CTRL_OUTPUT_RAM_1_en,
        BRAM_CTRL_OUTPUT_RAM_1_rst  => BRAM_CTRL_OUTPUT_RAM_1_rst,
        BRAM_CTRL_OUTPUT_RAM_1_we   => BRAM_CTRL_OUTPUT_RAM_1_we,        
        
        clk_50mhz  => s_clk_50,
        clk_240mhz => s_clk_240
      );
      
  i_register_file : entity work.register_file
        generic map(
          C_DATE_CODE      => C_DATE_CODE,
          C_GITHASH_CODE   => C_GITHASH_CODE,
          C_GIT_REPO_DIRTY => C_GIT_REPO_DIRTY
          )
        port map (
    
          LED_FP_o => s_led_FP,
   
          BRAM_CTRL_REG_FILE_addr => BRAM_CTRL_REG_FILE_addr,
          BRAM_CTRL_REG_FILE_clk  => BRAM_CTRL_REG_FILE_clk,
          BRAM_CTRL_REG_FILE_din  => BRAM_CTRL_REG_FILE_din,
          BRAM_CTRL_REG_FILE_dout => BRAM_CTRL_REG_FILE_dout,
          BRAM_CTRL_REG_FILE_en   => BRAM_CTRL_REG_FILE_en,
          BRAM_CTRL_REG_FILE_rst  => BRAM_CTRL_REG_FILE_rst,
          BRAM_CTRL_REG_FILE_we   => BRAM_CTRL_REG_FILE_we,
          
          pattern_start_o => s_pattern_start,
          cfg_reg_o  => s_cfg_reg

          );   
          
s_pattern_start_s1 <= s_pattern_start when rising_edge(s_clk_240);
s_pattern_start_s2 <= s_pattern_start_s1 when rising_edge(s_clk_240);

          
i_pattern_io_engine : entity work.pattern_io_engine 
    Port map( 
    
        clk_240_i => s_clk_240,
        
        pattern_restart_i  => s_pattern_start_s2,
        
        algo_rst_o  => ap_rst,
        algo_start_o  => ap_start,
        algo_done_i  => ap_done,
        
        INPUT_link_arr_o  => s_INPUT_link_arr,
        OUTPUT_link_arr_i => s_OUTPUT_link_arr,
        
        BRAM_CTRL_INPUT_RAM_0_addr => BRAM_CTRL_INPUT_RAM_0_addr,
        BRAM_CTRL_INPUT_RAM_0_clk  => BRAM_CTRL_INPUT_RAM_0_clk,
        BRAM_CTRL_INPUT_RAM_0_din  => BRAM_CTRL_INPUT_RAM_0_din,
        BRAM_CTRL_INPUT_RAM_0_dout => BRAM_CTRL_INPUT_RAM_0_dout,
        BRAM_CTRL_INPUT_RAM_0_en   => BRAM_CTRL_INPUT_RAM_0_en,
        BRAM_CTRL_INPUT_RAM_0_rst  => BRAM_CTRL_INPUT_RAM_0_rst,
        BRAM_CTRL_INPUT_RAM_0_we   => BRAM_CTRL_INPUT_RAM_0_we,

        BRAM_CTRL_INPUT_RAM_1_addr => BRAM_CTRL_INPUT_RAM_1_addr,
        BRAM_CTRL_INPUT_RAM_1_clk  => BRAM_CTRL_INPUT_RAM_1_clk,
        BRAM_CTRL_INPUT_RAM_1_din  => BRAM_CTRL_INPUT_RAM_1_din,
        BRAM_CTRL_INPUT_RAM_1_dout => BRAM_CTRL_INPUT_RAM_1_dout,
        BRAM_CTRL_INPUT_RAM_1_en   => BRAM_CTRL_INPUT_RAM_1_en,
        BRAM_CTRL_INPUT_RAM_1_rst  => BRAM_CTRL_INPUT_RAM_1_rst,
        BRAM_CTRL_INPUT_RAM_1_we   => BRAM_CTRL_INPUT_RAM_1_we,
        
        BRAM_CTRL_INPUT_RAM_2_addr => BRAM_CTRL_INPUT_RAM_2_addr,
        BRAM_CTRL_INPUT_RAM_2_clk  => BRAM_CTRL_INPUT_RAM_2_clk,
        BRAM_CTRL_INPUT_RAM_2_din  => BRAM_CTRL_INPUT_RAM_2_din,
        BRAM_CTRL_INPUT_RAM_2_dout => BRAM_CTRL_INPUT_RAM_2_dout,
        BRAM_CTRL_INPUT_RAM_2_en   => BRAM_CTRL_INPUT_RAM_2_en,
        BRAM_CTRL_INPUT_RAM_2_rst  => BRAM_CTRL_INPUT_RAM_2_rst,
        BRAM_CTRL_INPUT_RAM_2_we   => BRAM_CTRL_INPUT_RAM_2_we,
        
        BRAM_CTRL_OUTPUT_RAM_0_addr => BRAM_CTRL_OUTPUT_RAM_0_addr,
        BRAM_CTRL_OUTPUT_RAM_0_clk  => BRAM_CTRL_OUTPUT_RAM_0_clk,
        BRAM_CTRL_OUTPUT_RAM_0_din  => BRAM_CTRL_OUTPUT_RAM_0_din,
        BRAM_CTRL_OUTPUT_RAM_0_dout => BRAM_CTRL_OUTPUT_RAM_0_dout,
        BRAM_CTRL_OUTPUT_RAM_0_en   => BRAM_CTRL_OUTPUT_RAM_0_en,
        BRAM_CTRL_OUTPUT_RAM_0_rst  => BRAM_CTRL_OUTPUT_RAM_0_rst,
        BRAM_CTRL_OUTPUT_RAM_0_we   => BRAM_CTRL_OUTPUT_RAM_0_we,
 
        BRAM_CTRL_OUTPUT_RAM_1_addr => BRAM_CTRL_OUTPUT_RAM_1_addr,
        BRAM_CTRL_OUTPUT_RAM_1_clk  => BRAM_CTRL_OUTPUT_RAM_1_clk,
        BRAM_CTRL_OUTPUT_RAM_1_din  => BRAM_CTRL_OUTPUT_RAM_1_din,
        BRAM_CTRL_OUTPUT_RAM_1_dout => BRAM_CTRL_OUTPUT_RAM_1_dout,
        BRAM_CTRL_OUTPUT_RAM_1_en   => BRAM_CTRL_OUTPUT_RAM_1_en,
        BRAM_CTRL_OUTPUT_RAM_1_rst  => BRAM_CTRL_OUTPUT_RAM_1_rst,
        BRAM_CTRL_OUTPUT_RAM_1_we   => BRAM_CTRL_OUTPUT_RAM_1_we
     );          
     
     ap_clk <= s_clk_240; 
     
     i_ila_hls : ila_hls
     PORT MAP (
         clk => s_clk_240,     
         probe0(0) => ap_rst, 
         probe1(0) => ap_rst, 
         probe2(0) => ap_start, 
         probe3(0) => ap_done, 
         probe4(0) => ap_idle, 
         probe5(0) => ap_ready, 
         probe6 => s_INPUT_link_arr(0),
         probe7 => s_OUTPUT_link_arr(0)
     );
     
-----------------------------------------------------------------------------
-- Begin User_Code
-----------------------------------------------------------------------------
     
   i_getMET_2 : getMET_2
       PORT MAP (
         ap_clk => ap_clk,
         ap_rst => ap_rst,
         ap_start => ap_start,
         ap_done => ap_done,
         ap_idle => ap_idle,
         ap_ready => ap_ready,
         
TrackPT_0 => TrackPT_0,
TrackPT_1 => TrackPT_1,
TrackPT_2 => TrackPT_2,
TrackPT_3 => TrackPT_3,
TrackPT_4 => TrackPT_4,
TrackPT_5 => TrackPT_5,
TrackPT_6 => TrackPT_6,
TrackPT_7 => TrackPT_7,
TrackPT_8 => TrackPT_8,
TrackPT_9 => TrackPT_9,
TrackPhi_0 => TrackPhi_0,
TrackPhi_1 => TrackPhi_1,
TrackPhi_2 => TrackPhi_2,
TrackPhi_3 => TrackPhi_3,
TrackPhi_4 => TrackPhi_4,
TrackPhi_5 => TrackPhi_5,
TrackPhi_6 => TrackPhi_6,
TrackPhi_7 => TrackPhi_7,
TrackPhi_8 => TrackPhi_8,
TrackPhi_9 => TrackPhi_9,
CaloET_0 => CaloET_0,
CaloET_1 => CaloET_1,
CaloET_2 => CaloET_2,
CaloET_3 => CaloET_3,
CaloET_4 => CaloET_4,
CaloET_5 => CaloET_5,
CaloET_6 => CaloET_6,
CaloET_7 => CaloET_7,
CaloET_8 => CaloET_8,
CaloET_9 => CaloET_9,
CaloPhi_0 => CaloPhi_0,
CaloPhi_1 => CaloPhi_1,
CaloPhi_2 => CaloPhi_2,
CaloPhi_3 => CaloPhi_3,
CaloPhi_4 => CaloPhi_4,
CaloPhi_5 => CaloPhi_5,
CaloPhi_6 => CaloPhi_6,
CaloPhi_7 => CaloPhi_7,
CaloPhi_8 => CaloPhi_8,
CaloPhi_9 => CaloPhi_9,
out_0 => out_0_s,
out_1 => out_1_s
--out_2 => out_2_s
       );

-----------------------------------------------------------------------------
-- Configuration registers              
  
-----------------------------------------------------------------------------

-- Input Links
TrackPT_0 <= s_INPUT_LINK_ARR( 0 )(31 downto 0);
TrackPT_1 <= s_INPUT_LINK_ARR( 0 )(63 downto 32);
TrackPT_2 <= s_INPUT_LINK_ARR( 0 )(95 downto 64);
TrackPT_3 <= s_INPUT_LINK_ARR( 1 )(31 downto 0);
TrackPT_4 <= s_INPUT_LINK_ARR( 1 )(63 downto 32);
TrackPT_5 <= s_INPUT_LINK_ARR( 1 )(95 downto 64);
TrackPT_6 <= s_INPUT_LINK_ARR( 2 )(31 downto 0);
TrackPT_7 <= s_INPUT_LINK_ARR( 2 )(63 downto 32);
TrackPT_8 <= s_INPUT_LINK_ARR( 2 )(95 downto 64);
TrackPT_9 <= s_INPUT_LINK_ARR( 3 )(31 downto 0);
TrackPhi_0 <= s_INPUT_LINK_ARR( 3 )(63 downto 32);
TrackPhi_1 <= s_INPUT_LINK_ARR( 3 )(95 downto 64);
TrackPhi_2 <= s_INPUT_LINK_ARR( 4 )(31 downto 0);
TrackPhi_3 <= s_INPUT_LINK_ARR( 4 )(63 downto 32);
TrackPhi_4 <= s_INPUT_LINK_ARR( 4 )(95 downto 64);
TrackPhi_5 <= s_INPUT_LINK_ARR( 5 )(31 downto 0);
TrackPhi_6 <= s_INPUT_LINK_ARR( 5 )(63 downto 32);
TrackPhi_7 <= s_INPUT_LINK_ARR( 5 )(95 downto 64);
TrackPhi_8 <= s_INPUT_LINK_ARR( 6 )(31 downto 0);
TrackPhi_9 <= s_INPUT_LINK_ARR( 6 )(63 downto 32);
CaloET_0 <= s_INPUT_LINK_ARR( 6 )(95 downto 64);
CaloET_1 <= s_INPUT_LINK_ARR( 7 )(31 downto 0);
CaloET_2 <= s_INPUT_LINK_ARR( 7 )(63 downto 32);
CaloET_3 <= s_INPUT_LINK_ARR( 7 )(95 downto 64);
CaloET_4 <= s_INPUT_LINK_ARR( 8 )(31 downto 0);
CaloET_5 <= s_INPUT_LINK_ARR( 8 )(63 downto 32);
CaloET_6 <= s_INPUT_LINK_ARR( 8 )(95 downto 64);
CaloET_7 <= s_INPUT_LINK_ARR( 9 )(31 downto 0);
CaloET_8 <= s_INPUT_LINK_ARR( 9 )(63 downto 32);
CaloET_9 <= s_INPUT_LINK_ARR( 9 )(95 downto 64);
CaloPhi_0 <= s_INPUT_LINK_ARR( 10 )(31 downto 0);
CaloPhi_1 <= s_INPUT_LINK_ARR( 10 )(63 downto 32);
CaloPhi_2 <= s_INPUT_LINK_ARR( 10 )(95 downto 64);
CaloPhi_3 <= s_INPUT_LINK_ARR( 11 )(31 downto 0);
CaloPhi_4 <= s_INPUT_LINK_ARR( 11 )(63 downto 32);
CaloPhi_5 <= s_INPUT_LINK_ARR( 11 )(95 downto 64);
CaloPhi_6 <= s_INPUT_LINK_ARR( 12 )(31 downto 0);
CaloPhi_7 <= s_INPUT_LINK_ARR( 12 )(63 downto 32);
CaloPhi_8 <= s_INPUT_LINK_ARR( 12 )(95 downto 64);
CaloPhi_9 <= s_INPUT_LINK_ARR( 13 )(31 downto 0);
-----------------------------------------------------------------------------
 
-- Output Links   

s_OUTPUT_LINK_ARR( 0 )(31 downto 0) <= out_0_s; 
s_OUTPUT_LINK_ARR( 0 )(63 downto 32) <= out_1_s;
--s_OUTPUT_LINK_ARR( 0 )(95 downto 64) <= out_2_s;
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
-- End User_Code
-----------------------------------------------------------------------------

end ctp7_top_arch;
