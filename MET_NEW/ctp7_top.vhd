
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
 COMPONENT MET_O_1
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



rgn_in_0 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_1 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_2 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_3 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_4 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_5 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_6 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_7 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_8 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_9 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_10 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_11 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_12 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_13 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_14 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_15 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_16 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_17 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_18 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_19 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_20 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_21 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_22 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_23 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_24 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_25 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_26 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_27 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_28 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_29 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_30 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_31 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_32 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_33 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_34 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_35 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_36 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_37 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_38 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_39 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_40 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_41 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_42 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_43 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_44 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_45 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_46 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_47 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_48 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_49 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_50 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_51 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_52 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_53 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_54 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_55 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_56 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_57 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_58 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_59 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_60 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_61 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_62 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_63 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_64 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_65 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_66 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_67 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_68 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_69 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_70 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_71 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_72 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_73 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_74 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_75 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_76 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_77 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_78 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_79 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_80 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_81 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_82 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_83 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_84 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_85 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_86 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_87 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_88 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_89 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_90 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_91 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_92 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_93 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_94 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_95 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_96 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_97 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_98 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_99 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_100 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_101 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_102 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_103 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_104 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_105 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_106 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_107 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_108 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_109 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_110 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_111 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_112 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_113 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_114 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_115 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_116 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_117 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_118 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_119 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_120 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_121 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_122 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_123 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_124 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_125 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_126 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_127 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_128 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_129 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_130 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_131 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_132 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_133 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_134 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_135 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_136 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_137 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_138 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_139 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_140 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_141 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_142 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_143 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_144 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_145 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_146 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_147 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_148 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_149 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_150 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_151 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_152 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_153 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_154 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_155 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_156 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_157 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_158 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_159 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_160 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_161 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_162 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_163 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_164 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_165 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_166 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_167 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_168 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_169 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_170 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_171 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_172 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_173 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_174 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_175 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_176 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_177 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_178 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_179 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_180 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_181 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_182 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_183 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_184 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_185 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_186 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_187 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_188 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_189 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_190 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_191 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_192 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_193 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_194 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_195 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_196 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_197 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_198 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_199 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_200 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_201 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_202 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_203 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_204 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_205 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_206 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_207 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_208 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_209 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_210 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_211 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_212 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_213 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_214 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_215 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_216 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_217 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_218 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_219 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_220 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_221 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_222 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_223 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_224 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_225 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_226 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_227 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_228 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_229 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_230 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_231 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_232 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_233 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_234 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_235 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_236 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_237 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_238 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_239 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_240 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_241 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_242 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_243 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_244 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_245 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_246 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_247 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_248 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_249 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_250 : IN STD_LOGIC_VECTOR (15 downto 0);
rgn_in_251 : IN STD_LOGIC_VECTOR (15 downto 0);

output_MET_0_V : OUT STD_LOGIC_VECTOR(19 DOWNTO 0);
output_MET_1_V : OUT STD_LOGIC_VECTOR(19 DOWNTO 0);
output_sqrtX_out_V : OUT STD_LOGIC_VECTOR(13 DOWNTO 0);
output_atanX_phase_V : OUT STD_LOGIC_VECTOR(16 DOWNTO 0)

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

signal rgn_in_0 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_1 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_2 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_3 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_4 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_5 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_6 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_7 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_8 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_9 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_10 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_11 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_12 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_13 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_14 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_15 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_16 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_17 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_18 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_19 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_20 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_21 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_22 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_23 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_24 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_25 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_26 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_27 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_28 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_29 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_30 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_31 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_32 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_33 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_34 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_35 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_36 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_37 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_38 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_39 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_40 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_41 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_42 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_43 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_44 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_45 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_46 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_47 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_48 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_49 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_50 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_51 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_52 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_53 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_54 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_55 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_56 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_57 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_58 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_59 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_60 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_61 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_62 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_63 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_64 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_65 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_66 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_67 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_68 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_69 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_70 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_71 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_72 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_73 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_74 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_75 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_76 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_77 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_78 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_79 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_80 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_81 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_82 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_83 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_84 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_85 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_86 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_87 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_88 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_89 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_90 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_91 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_92 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_93 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_94 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_95 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_96 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_97 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_98 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_99 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_100 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_101 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_102 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_103 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_104 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_105 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_106 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_107 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_108 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_109 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_110 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_111 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_112 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_113 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_114 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_115 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_116 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_117 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_118 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_119 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_120 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_121 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_122 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_123 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_124 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_125 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_126 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_127 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_128 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_129 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_130 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_131 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_132 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_133 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_134 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_135 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_136 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_137 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_138 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_139 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_140 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_141 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_142 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_143 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_144 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_145 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_146 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_147 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_148 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_149 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_150 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_151 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_152 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_153 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_154 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_155 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_156 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_157 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_158 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_159 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_160 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_161 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_162 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_163 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_164 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_165 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_166 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_167 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_168 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_169 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_170 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_171 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_172 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_173 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_174 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_175 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_176 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_177 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_178 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_179 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_180 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_181 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_182 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_183 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_184 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_185 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_186 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_187 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_188 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_189 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_190 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_191 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_192 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_193 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_194 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_195 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_196 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_197 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_198 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_199 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_200 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_201 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_202 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_203 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_204 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_205 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_206 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_207 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_208 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_209 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_210 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_211 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_212 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_213 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_214 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_215 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_216 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_217 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_218 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_219 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_220 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_221 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_222 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_223 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_224 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_225 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_226 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_227 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_228 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_229 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_230 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_231 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_232 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_233 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_234 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_235 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_236 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_237 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_238 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_239 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_240 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_241 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_242 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_243 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_244 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_245 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_246 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_247 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_248 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_249 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_250 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rgn_in_251 : STD_LOGIC_VECTOR(15 DOWNTO 0);


signal output_MET_0_V : STD_LOGIC_VECTOR (19 downto 0);
signal output_MET_1_V : STD_LOGIC_VECTOR (19 downto 0);
signal output_sqrtX_out_V : STD_LOGIC_VECTOR (13 downto 0);
signal output_atanX_phase_V : STD_LOGIC_VECTOR (16 downto 0);



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
     
   i_MET_O_1 : MET_O_1
       PORT MAP (
         ap_clk => ap_clk,
         ap_rst => ap_rst,
         ap_start => ap_start,
         ap_done => ap_done,
         ap_idle => ap_idle,
         ap_ready => ap_ready,
         

rgn_in_0 => rgn_in_0,
rgn_in_1 => rgn_in_1,
rgn_in_2 => rgn_in_2,
rgn_in_3 => rgn_in_3,
rgn_in_4 => rgn_in_4,
rgn_in_5 => rgn_in_5,
rgn_in_6 => rgn_in_6,
rgn_in_7 => rgn_in_7,
rgn_in_8 => rgn_in_8,
rgn_in_9 => rgn_in_9,
rgn_in_10 => rgn_in_10,
rgn_in_11 => rgn_in_11,
rgn_in_12 => rgn_in_12,
rgn_in_13 => rgn_in_13,
rgn_in_14 => rgn_in_14,
rgn_in_15 => rgn_in_15,
rgn_in_16 => rgn_in_16,
rgn_in_17 => rgn_in_17,
rgn_in_18 => rgn_in_18,
rgn_in_19 => rgn_in_19,
rgn_in_20 => rgn_in_20,
rgn_in_21 => rgn_in_21,
rgn_in_22 => rgn_in_22,
rgn_in_23 => rgn_in_23,
rgn_in_24 => rgn_in_24,
rgn_in_25 => rgn_in_25,
rgn_in_26 => rgn_in_26,
rgn_in_27 => rgn_in_27,
rgn_in_28 => rgn_in_28,
rgn_in_29 => rgn_in_29,
rgn_in_30 => rgn_in_30,
rgn_in_31 => rgn_in_31,
rgn_in_32 => rgn_in_32,
rgn_in_33 => rgn_in_33,
rgn_in_34 => rgn_in_34,
rgn_in_35 => rgn_in_35,
rgn_in_36 => rgn_in_36,
rgn_in_37 => rgn_in_37,
rgn_in_38 => rgn_in_38,
rgn_in_39 => rgn_in_39,
rgn_in_40 => rgn_in_40,
rgn_in_41 => rgn_in_41,
rgn_in_42 => rgn_in_42,
rgn_in_43 => rgn_in_43,
rgn_in_44 => rgn_in_44,
rgn_in_45 => rgn_in_45,
rgn_in_46 => rgn_in_46,
rgn_in_47 => rgn_in_47,
rgn_in_48 => rgn_in_48,
rgn_in_49 => rgn_in_49,
rgn_in_50 => rgn_in_50,
rgn_in_51 => rgn_in_51,
rgn_in_52 => rgn_in_52,
rgn_in_53 => rgn_in_53,
rgn_in_54 => rgn_in_54,
rgn_in_55 => rgn_in_55,
rgn_in_56 => rgn_in_56,
rgn_in_57 => rgn_in_57,
rgn_in_58 => rgn_in_58,
rgn_in_59 => rgn_in_59,
rgn_in_60 => rgn_in_60,
rgn_in_61 => rgn_in_61,
rgn_in_62 => rgn_in_62,
rgn_in_63 => rgn_in_63,
rgn_in_64 => rgn_in_64,
rgn_in_65 => rgn_in_65,
rgn_in_66 => rgn_in_66,
rgn_in_67 => rgn_in_67,
rgn_in_68 => rgn_in_68,
rgn_in_69 => rgn_in_69,
rgn_in_70 => rgn_in_70,
rgn_in_71 => rgn_in_71,
rgn_in_72 => rgn_in_72,
rgn_in_73 => rgn_in_73,
rgn_in_74 => rgn_in_74,
rgn_in_75 => rgn_in_75,
rgn_in_76 => rgn_in_76,
rgn_in_77 => rgn_in_77,
rgn_in_78 => rgn_in_78,
rgn_in_79 => rgn_in_79,
rgn_in_80 => rgn_in_80,
rgn_in_81 => rgn_in_81,
rgn_in_82 => rgn_in_82,
rgn_in_83 => rgn_in_83,
rgn_in_84 => rgn_in_84,
rgn_in_85 => rgn_in_85,
rgn_in_86 => rgn_in_86,
rgn_in_87 => rgn_in_87,
rgn_in_88 => rgn_in_88,
rgn_in_89 => rgn_in_89,
rgn_in_90 => rgn_in_90,
rgn_in_91 => rgn_in_91,
rgn_in_92 => rgn_in_92,
rgn_in_93 => rgn_in_93,
rgn_in_94 => rgn_in_94,
rgn_in_95 => rgn_in_95,
rgn_in_96 => rgn_in_96,
rgn_in_97 => rgn_in_97,
rgn_in_98 => rgn_in_98,
rgn_in_99 => rgn_in_99,
rgn_in_100 => rgn_in_100,
rgn_in_101 => rgn_in_101,
rgn_in_102 => rgn_in_102,
rgn_in_103 => rgn_in_103,
rgn_in_104 => rgn_in_104,
rgn_in_105 => rgn_in_105,
rgn_in_106 => rgn_in_106,
rgn_in_107 => rgn_in_107,
rgn_in_108 => rgn_in_108,
rgn_in_109 => rgn_in_109,
rgn_in_110 => rgn_in_110,
rgn_in_111 => rgn_in_111,
rgn_in_112 => rgn_in_112,
rgn_in_113 => rgn_in_113,
rgn_in_114 => rgn_in_114,
rgn_in_115 => rgn_in_115,
rgn_in_116 => rgn_in_116,
rgn_in_117 => rgn_in_117,
rgn_in_118 => rgn_in_118,
rgn_in_119 => rgn_in_119,
rgn_in_120 => rgn_in_120,
rgn_in_121 => rgn_in_121,
rgn_in_122 => rgn_in_122,
rgn_in_123 => rgn_in_123,
rgn_in_124 => rgn_in_124,
rgn_in_125 => rgn_in_125,
rgn_in_126 => rgn_in_126,
rgn_in_127 => rgn_in_127,
rgn_in_128 => rgn_in_128,
rgn_in_129 => rgn_in_129,
rgn_in_130 => rgn_in_130,
rgn_in_131 => rgn_in_131,
rgn_in_132 => rgn_in_132,
rgn_in_133 => rgn_in_133,
rgn_in_134 => rgn_in_134,
rgn_in_135 => rgn_in_135,
rgn_in_136 => rgn_in_136,
rgn_in_137 => rgn_in_137,
rgn_in_138 => rgn_in_138,
rgn_in_139 => rgn_in_139,
rgn_in_140 => rgn_in_140,
rgn_in_141 => rgn_in_141,
rgn_in_142 => rgn_in_142,
rgn_in_143 => rgn_in_143,
rgn_in_144 => rgn_in_144,
rgn_in_145 => rgn_in_145,
rgn_in_146 => rgn_in_146,
rgn_in_147 => rgn_in_147,
rgn_in_148 => rgn_in_148,
rgn_in_149 => rgn_in_149,
rgn_in_150 => rgn_in_150,
rgn_in_151 => rgn_in_151,
rgn_in_152 => rgn_in_152,
rgn_in_153 => rgn_in_153,
rgn_in_154 => rgn_in_154,
rgn_in_155 => rgn_in_155,
rgn_in_156 => rgn_in_156,
rgn_in_157 => rgn_in_157,
rgn_in_158 => rgn_in_158,
rgn_in_159 => rgn_in_159,
rgn_in_160 => rgn_in_160,
rgn_in_161 => rgn_in_161,
rgn_in_162 => rgn_in_162,
rgn_in_163 => rgn_in_163,
rgn_in_164 => rgn_in_164,
rgn_in_165 => rgn_in_165,
rgn_in_166 => rgn_in_166,
rgn_in_167 => rgn_in_167,
rgn_in_168 => rgn_in_168,
rgn_in_169 => rgn_in_169,
rgn_in_170 => rgn_in_170,
rgn_in_171 => rgn_in_171,
rgn_in_172 => rgn_in_172,
rgn_in_173 => rgn_in_173,
rgn_in_174 => rgn_in_174,
rgn_in_175 => rgn_in_175,
rgn_in_176 => rgn_in_176,
rgn_in_177 => rgn_in_177,
rgn_in_178 => rgn_in_178,
rgn_in_179 => rgn_in_179,
rgn_in_180 => rgn_in_180,
rgn_in_181 => rgn_in_181,
rgn_in_182 => rgn_in_182,
rgn_in_183 => rgn_in_183,
rgn_in_184 => rgn_in_184,
rgn_in_185 => rgn_in_185,
rgn_in_186 => rgn_in_186,
rgn_in_187 => rgn_in_187,
rgn_in_188 => rgn_in_188,
rgn_in_189 => rgn_in_189,
rgn_in_190 => rgn_in_190,
rgn_in_191 => rgn_in_191,
rgn_in_192 => rgn_in_192,
rgn_in_193 => rgn_in_193,
rgn_in_194 => rgn_in_194,
rgn_in_195 => rgn_in_195,
rgn_in_196 => rgn_in_196,
rgn_in_197 => rgn_in_197,
rgn_in_198 => rgn_in_198,
rgn_in_199 => rgn_in_199,
rgn_in_200 => rgn_in_200,
rgn_in_201 => rgn_in_201,
rgn_in_202 => rgn_in_202,
rgn_in_203 => rgn_in_203,
rgn_in_204 => rgn_in_204,
rgn_in_205 => rgn_in_205,
rgn_in_206 => rgn_in_206,
rgn_in_207 => rgn_in_207,
rgn_in_208 => rgn_in_208,
rgn_in_209 => rgn_in_209,
rgn_in_210 => rgn_in_210,
rgn_in_211 => rgn_in_211,
rgn_in_212 => rgn_in_212,
rgn_in_213 => rgn_in_213,
rgn_in_214 => rgn_in_214,
rgn_in_215 => rgn_in_215,
rgn_in_216 => rgn_in_216,
rgn_in_217 => rgn_in_217,
rgn_in_218 => rgn_in_218,
rgn_in_219 => rgn_in_219,
rgn_in_220 => rgn_in_220,
rgn_in_221 => rgn_in_221,
rgn_in_222 => rgn_in_222,
rgn_in_223 => rgn_in_223,
rgn_in_224 => rgn_in_224,
rgn_in_225 => rgn_in_225,
rgn_in_226 => rgn_in_226,
rgn_in_227 => rgn_in_227,
rgn_in_228 => rgn_in_228,
rgn_in_229 => rgn_in_229,
rgn_in_230 => rgn_in_230,
rgn_in_231 => rgn_in_231,
rgn_in_232 => rgn_in_232,
rgn_in_233 => rgn_in_233,
rgn_in_234 => rgn_in_234,
rgn_in_235 => rgn_in_235,
rgn_in_236 => rgn_in_236,
rgn_in_237 => rgn_in_237,
rgn_in_238 => rgn_in_238,
rgn_in_239 => rgn_in_239,
rgn_in_240 => rgn_in_240,
rgn_in_241 => rgn_in_241,
rgn_in_242 => rgn_in_242,
rgn_in_243 => rgn_in_243,
rgn_in_244 => rgn_in_244,
rgn_in_245 => rgn_in_245,
rgn_in_246 => rgn_in_246,
rgn_in_247 => rgn_in_247,
rgn_in_248 => rgn_in_248,
rgn_in_249 => rgn_in_249,
rgn_in_250 => rgn_in_250,
rgn_in_251 => rgn_in_251,

output_MET_0_V => output_MET_0_V,
output_MET_1_V => output_MET_1_V,
output_sqrtX_out_V => output_sqrtX_out_V,
output_atanX_phase_V => output_atanX_phase_V
    );

-----------------------------------------------------------------------------
-- Configuration registers              
  
-----------------------------------------------------------------------------

-- Input Links
rgn_in_0 <= s_INPUT_LINK_ARR( 0 )(15 downto 0);
rgn_in_1 <= s_INPUT_LINK_ARR( 0 )(31 downto 16);
rgn_in_2 <= s_INPUT_LINK_ARR( 0 )(47 downto 32);
rgn_in_3 <= s_INPUT_LINK_ARR( 0 )(63 downto 48);
rgn_in_4 <= s_INPUT_LINK_ARR( 0 )(79 downto 64);
rgn_in_5 <= s_INPUT_LINK_ARR( 0 )(95 downto 80);
rgn_in_6 <= s_INPUT_LINK_ARR( 0 )(111 downto 96);
rgn_in_7 <= s_INPUT_LINK_ARR( 0 )(127 downto 112);
rgn_in_8 <= s_INPUT_LINK_ARR( 0 )(143 downto 128);
rgn_in_9 <= s_INPUT_LINK_ARR( 0 )(159 downto 144);
rgn_in_10 <= s_INPUT_LINK_ARR( 0 )(175 downto 160);
rgn_in_11 <= s_INPUT_LINK_ARR( 0 )(191 downto 176);
rgn_in_12 <= s_INPUT_LINK_ARR( 1 )(15 downto 0);
rgn_in_13 <= s_INPUT_LINK_ARR( 1 )(31 downto 16);
rgn_in_14 <= s_INPUT_LINK_ARR( 1 )(47 downto 32);
rgn_in_15 <= s_INPUT_LINK_ARR( 1 )(63 downto 48);
rgn_in_16 <= s_INPUT_LINK_ARR( 1 )(79 downto 64);
rgn_in_17 <= s_INPUT_LINK_ARR( 1 )(95 downto 80);
rgn_in_18 <= s_INPUT_LINK_ARR( 1 )(111 downto 96);
rgn_in_19 <= s_INPUT_LINK_ARR( 1 )(127 downto 112);
rgn_in_20 <= s_INPUT_LINK_ARR( 1 )(143 downto 128);
rgn_in_21 <= s_INPUT_LINK_ARR( 1 )(159 downto 144);
rgn_in_22 <= s_INPUT_LINK_ARR( 1 )(175 downto 160);
rgn_in_23 <= s_INPUT_LINK_ARR( 1 )(191 downto 176);
rgn_in_24 <= s_INPUT_LINK_ARR( 2 )(15 downto 0);
rgn_in_25 <= s_INPUT_LINK_ARR( 2 )(31 downto 16);
rgn_in_26 <= s_INPUT_LINK_ARR( 2 )(47 downto 32);
rgn_in_27 <= s_INPUT_LINK_ARR( 2 )(63 downto 48);
rgn_in_28 <= s_INPUT_LINK_ARR( 2 )(79 downto 64);
rgn_in_29 <= s_INPUT_LINK_ARR( 2 )(95 downto 80);
rgn_in_30 <= s_INPUT_LINK_ARR( 2 )(111 downto 96);
rgn_in_31 <= s_INPUT_LINK_ARR( 2 )(127 downto 112);
rgn_in_32 <= s_INPUT_LINK_ARR( 2 )(143 downto 128);
rgn_in_33 <= s_INPUT_LINK_ARR( 2 )(159 downto 144);
rgn_in_34 <= s_INPUT_LINK_ARR( 2 )(175 downto 160);
rgn_in_35 <= s_INPUT_LINK_ARR( 2 )(191 downto 176);
rgn_in_36 <= s_INPUT_LINK_ARR( 3 )(15 downto 0);
rgn_in_37 <= s_INPUT_LINK_ARR( 3 )(31 downto 16);
rgn_in_38 <= s_INPUT_LINK_ARR( 3 )(47 downto 32);
rgn_in_39 <= s_INPUT_LINK_ARR( 3 )(63 downto 48);
rgn_in_40 <= s_INPUT_LINK_ARR( 3 )(79 downto 64);
rgn_in_41 <= s_INPUT_LINK_ARR( 3 )(95 downto 80);
rgn_in_42 <= s_INPUT_LINK_ARR( 3 )(111 downto 96);
rgn_in_43 <= s_INPUT_LINK_ARR( 3 )(127 downto 112);
rgn_in_44 <= s_INPUT_LINK_ARR( 3 )(143 downto 128);
rgn_in_45 <= s_INPUT_LINK_ARR( 3 )(159 downto 144);
rgn_in_46 <= s_INPUT_LINK_ARR( 3 )(175 downto 160);
rgn_in_47 <= s_INPUT_LINK_ARR( 3 )(191 downto 176);
rgn_in_48 <= s_INPUT_LINK_ARR( 4 )(15 downto 0);
rgn_in_49 <= s_INPUT_LINK_ARR( 4 )(31 downto 16);
rgn_in_50 <= s_INPUT_LINK_ARR( 4 )(47 downto 32);
rgn_in_51 <= s_INPUT_LINK_ARR( 4 )(63 downto 48);
rgn_in_52 <= s_INPUT_LINK_ARR( 4 )(79 downto 64);
rgn_in_53 <= s_INPUT_LINK_ARR( 4 )(95 downto 80);
rgn_in_54 <= s_INPUT_LINK_ARR( 4 )(111 downto 96);
rgn_in_55 <= s_INPUT_LINK_ARR( 4 )(127 downto 112);
rgn_in_56 <= s_INPUT_LINK_ARR( 4 )(143 downto 128);
rgn_in_57 <= s_INPUT_LINK_ARR( 4 )(159 downto 144);
rgn_in_58 <= s_INPUT_LINK_ARR( 4 )(175 downto 160);
rgn_in_59 <= s_INPUT_LINK_ARR( 4 )(191 downto 176);
rgn_in_60 <= s_INPUT_LINK_ARR( 5 )(15 downto 0);
rgn_in_61 <= s_INPUT_LINK_ARR( 5 )(31 downto 16);
rgn_in_62 <= s_INPUT_LINK_ARR( 5 )(47 downto 32);
rgn_in_63 <= s_INPUT_LINK_ARR( 5 )(63 downto 48);
rgn_in_64 <= s_INPUT_LINK_ARR( 5 )(79 downto 64);
rgn_in_65 <= s_INPUT_LINK_ARR( 5 )(95 downto 80);
rgn_in_66 <= s_INPUT_LINK_ARR( 5 )(111 downto 96);
rgn_in_67 <= s_INPUT_LINK_ARR( 5 )(127 downto 112);
rgn_in_68 <= s_INPUT_LINK_ARR( 5 )(143 downto 128);
rgn_in_69 <= s_INPUT_LINK_ARR( 5 )(159 downto 144);
rgn_in_70 <= s_INPUT_LINK_ARR( 5 )(175 downto 160);
rgn_in_71 <= s_INPUT_LINK_ARR( 5 )(191 downto 176);
rgn_in_72 <= s_INPUT_LINK_ARR( 6 )(15 downto 0);
rgn_in_73 <= s_INPUT_LINK_ARR( 6 )(31 downto 16);
rgn_in_74 <= s_INPUT_LINK_ARR( 6 )(47 downto 32);
rgn_in_75 <= s_INPUT_LINK_ARR( 6 )(63 downto 48);
rgn_in_76 <= s_INPUT_LINK_ARR( 6 )(79 downto 64);
rgn_in_77 <= s_INPUT_LINK_ARR( 6 )(95 downto 80);
rgn_in_78 <= s_INPUT_LINK_ARR( 6 )(111 downto 96);
rgn_in_79 <= s_INPUT_LINK_ARR( 6 )(127 downto 112);
rgn_in_80 <= s_INPUT_LINK_ARR( 6 )(143 downto 128);
rgn_in_81 <= s_INPUT_LINK_ARR( 6 )(159 downto 144);
rgn_in_82 <= s_INPUT_LINK_ARR( 6 )(175 downto 160);
rgn_in_83 <= s_INPUT_LINK_ARR( 6 )(191 downto 176);
rgn_in_84 <= s_INPUT_LINK_ARR( 7 )(15 downto 0);
rgn_in_85 <= s_INPUT_LINK_ARR( 7 )(31 downto 16);
rgn_in_86 <= s_INPUT_LINK_ARR( 7 )(47 downto 32);
rgn_in_87 <= s_INPUT_LINK_ARR( 7 )(63 downto 48);
rgn_in_88 <= s_INPUT_LINK_ARR( 7 )(79 downto 64);
rgn_in_89 <= s_INPUT_LINK_ARR( 7 )(95 downto 80);
rgn_in_90 <= s_INPUT_LINK_ARR( 7 )(111 downto 96);
rgn_in_91 <= s_INPUT_LINK_ARR( 7 )(127 downto 112);
rgn_in_92 <= s_INPUT_LINK_ARR( 7 )(143 downto 128);
rgn_in_93 <= s_INPUT_LINK_ARR( 7 )(159 downto 144);
rgn_in_94 <= s_INPUT_LINK_ARR( 7 )(175 downto 160);
rgn_in_95 <= s_INPUT_LINK_ARR( 7 )(191 downto 176);
rgn_in_96 <= s_INPUT_LINK_ARR( 8 )(15 downto 0);
rgn_in_97 <= s_INPUT_LINK_ARR( 8 )(31 downto 16);
rgn_in_98 <= s_INPUT_LINK_ARR( 8 )(47 downto 32);
rgn_in_99 <= s_INPUT_LINK_ARR( 8 )(63 downto 48);
rgn_in_100 <= s_INPUT_LINK_ARR( 8 )(79 downto 64);
rgn_in_101 <= s_INPUT_LINK_ARR( 8 )(95 downto 80);
rgn_in_102 <= s_INPUT_LINK_ARR( 8 )(111 downto 96);
rgn_in_103 <= s_INPUT_LINK_ARR( 8 )(127 downto 112);
rgn_in_104 <= s_INPUT_LINK_ARR( 8 )(143 downto 128);
rgn_in_105 <= s_INPUT_LINK_ARR( 8 )(159 downto 144);
rgn_in_106 <= s_INPUT_LINK_ARR( 8 )(175 downto 160);
rgn_in_107 <= s_INPUT_LINK_ARR( 8 )(191 downto 176);
rgn_in_108 <= s_INPUT_LINK_ARR( 9 )(15 downto 0);
rgn_in_109 <= s_INPUT_LINK_ARR( 9 )(31 downto 16);
rgn_in_110 <= s_INPUT_LINK_ARR( 9 )(47 downto 32);
rgn_in_111 <= s_INPUT_LINK_ARR( 9 )(63 downto 48);
rgn_in_112 <= s_INPUT_LINK_ARR( 9 )(79 downto 64);
rgn_in_113 <= s_INPUT_LINK_ARR( 9 )(95 downto 80);
rgn_in_114 <= s_INPUT_LINK_ARR( 9 )(111 downto 96);
rgn_in_115 <= s_INPUT_LINK_ARR( 9 )(127 downto 112);
rgn_in_116 <= s_INPUT_LINK_ARR( 9 )(143 downto 128);
rgn_in_117 <= s_INPUT_LINK_ARR( 9 )(159 downto 144);
rgn_in_118 <= s_INPUT_LINK_ARR( 9 )(175 downto 160);
rgn_in_119 <= s_INPUT_LINK_ARR( 9 )(191 downto 176);
rgn_in_120 <= s_INPUT_LINK_ARR( 10 )(15 downto 0);
rgn_in_121 <= s_INPUT_LINK_ARR( 10 )(31 downto 16);
rgn_in_122 <= s_INPUT_LINK_ARR( 10 )(47 downto 32);
rgn_in_123 <= s_INPUT_LINK_ARR( 10 )(63 downto 48);
rgn_in_124 <= s_INPUT_LINK_ARR( 10 )(79 downto 64);
rgn_in_125 <= s_INPUT_LINK_ARR( 10 )(95 downto 80);
rgn_in_126 <= s_INPUT_LINK_ARR( 10 )(111 downto 96);
rgn_in_127 <= s_INPUT_LINK_ARR( 10 )(127 downto 112);
rgn_in_128 <= s_INPUT_LINK_ARR( 10 )(143 downto 128);
rgn_in_129 <= s_INPUT_LINK_ARR( 10 )(159 downto 144);
rgn_in_130 <= s_INPUT_LINK_ARR( 10 )(175 downto 160);
rgn_in_131 <= s_INPUT_LINK_ARR( 10 )(191 downto 176);
rgn_in_132 <= s_INPUT_LINK_ARR( 11 )(15 downto 0);
rgn_in_133 <= s_INPUT_LINK_ARR( 11 )(31 downto 16);
rgn_in_134 <= s_INPUT_LINK_ARR( 11 )(47 downto 32);
rgn_in_135 <= s_INPUT_LINK_ARR( 11 )(63 downto 48);
rgn_in_136 <= s_INPUT_LINK_ARR( 11 )(79 downto 64);
rgn_in_137 <= s_INPUT_LINK_ARR( 11 )(95 downto 80);
rgn_in_138 <= s_INPUT_LINK_ARR( 11 )(111 downto 96);
rgn_in_139 <= s_INPUT_LINK_ARR( 11 )(127 downto 112);
rgn_in_140 <= s_INPUT_LINK_ARR( 11 )(143 downto 128);
rgn_in_141 <= s_INPUT_LINK_ARR( 11 )(159 downto 144);
rgn_in_142 <= s_INPUT_LINK_ARR( 11 )(175 downto 160);
rgn_in_143 <= s_INPUT_LINK_ARR( 11 )(191 downto 176);
rgn_in_144 <= s_INPUT_LINK_ARR( 12 )(15 downto 0);
rgn_in_145 <= s_INPUT_LINK_ARR( 12 )(31 downto 16);
rgn_in_146 <= s_INPUT_LINK_ARR( 12 )(47 downto 32);
rgn_in_147 <= s_INPUT_LINK_ARR( 12 )(63 downto 48);
rgn_in_148 <= s_INPUT_LINK_ARR( 12 )(79 downto 64);
rgn_in_149 <= s_INPUT_LINK_ARR( 12 )(95 downto 80);
rgn_in_150 <= s_INPUT_LINK_ARR( 12 )(111 downto 96);
rgn_in_151 <= s_INPUT_LINK_ARR( 12 )(127 downto 112);
rgn_in_152 <= s_INPUT_LINK_ARR( 12 )(143 downto 128);
rgn_in_153 <= s_INPUT_LINK_ARR( 12 )(159 downto 144);
rgn_in_154 <= s_INPUT_LINK_ARR( 12 )(175 downto 160);
rgn_in_155 <= s_INPUT_LINK_ARR( 12 )(191 downto 176);
rgn_in_156 <= s_INPUT_LINK_ARR( 13 )(15 downto 0);
rgn_in_157 <= s_INPUT_LINK_ARR( 13 )(31 downto 16);
rgn_in_158 <= s_INPUT_LINK_ARR( 13 )(47 downto 32);
rgn_in_159 <= s_INPUT_LINK_ARR( 13 )(63 downto 48);
rgn_in_160 <= s_INPUT_LINK_ARR( 13 )(79 downto 64);
rgn_in_161 <= s_INPUT_LINK_ARR( 13 )(95 downto 80);
rgn_in_162 <= s_INPUT_LINK_ARR( 13 )(111 downto 96);
rgn_in_163 <= s_INPUT_LINK_ARR( 13 )(127 downto 112);
rgn_in_164 <= s_INPUT_LINK_ARR( 13 )(143 downto 128);
rgn_in_165 <= s_INPUT_LINK_ARR( 13 )(159 downto 144);
rgn_in_166 <= s_INPUT_LINK_ARR( 13 )(175 downto 160);
rgn_in_167 <= s_INPUT_LINK_ARR( 13 )(191 downto 176);
rgn_in_168 <= s_INPUT_LINK_ARR( 14 )(15 downto 0);
rgn_in_169 <= s_INPUT_LINK_ARR( 14 )(31 downto 16);
rgn_in_170 <= s_INPUT_LINK_ARR( 14 )(47 downto 32);
rgn_in_171 <= s_INPUT_LINK_ARR( 14 )(63 downto 48);
rgn_in_172 <= s_INPUT_LINK_ARR( 14 )(79 downto 64);
rgn_in_173 <= s_INPUT_LINK_ARR( 14 )(95 downto 80);
rgn_in_174 <= s_INPUT_LINK_ARR( 14 )(111 downto 96);
rgn_in_175 <= s_INPUT_LINK_ARR( 14 )(127 downto 112);
rgn_in_176 <= s_INPUT_LINK_ARR( 14 )(143 downto 128);
rgn_in_177 <= s_INPUT_LINK_ARR( 14 )(159 downto 144);
rgn_in_178 <= s_INPUT_LINK_ARR( 14 )(175 downto 160);
rgn_in_179 <= s_INPUT_LINK_ARR( 14 )(191 downto 176);
rgn_in_180 <= s_INPUT_LINK_ARR( 15 )(15 downto 0);
rgn_in_181 <= s_INPUT_LINK_ARR( 15 )(31 downto 16);
rgn_in_182 <= s_INPUT_LINK_ARR( 15 )(47 downto 32);
rgn_in_183 <= s_INPUT_LINK_ARR( 15 )(63 downto 48);
rgn_in_184 <= s_INPUT_LINK_ARR( 15 )(79 downto 64);
rgn_in_185 <= s_INPUT_LINK_ARR( 15 )(95 downto 80);
rgn_in_186 <= s_INPUT_LINK_ARR( 15 )(111 downto 96);
rgn_in_187 <= s_INPUT_LINK_ARR( 15 )(127 downto 112);
rgn_in_188 <= s_INPUT_LINK_ARR( 15 )(143 downto 128);
rgn_in_189 <= s_INPUT_LINK_ARR( 15 )(159 downto 144);
rgn_in_190 <= s_INPUT_LINK_ARR( 15 )(175 downto 160);
rgn_in_191 <= s_INPUT_LINK_ARR( 15 )(191 downto 176);
rgn_in_192 <= s_INPUT_LINK_ARR( 16 )(15 downto 0);
rgn_in_193 <= s_INPUT_LINK_ARR( 16 )(31 downto 16);
rgn_in_194 <= s_INPUT_LINK_ARR( 16 )(47 downto 32);
rgn_in_195 <= s_INPUT_LINK_ARR( 16 )(63 downto 48);
rgn_in_196 <= s_INPUT_LINK_ARR( 16 )(79 downto 64);
rgn_in_197 <= s_INPUT_LINK_ARR( 16 )(95 downto 80);
rgn_in_198 <= s_INPUT_LINK_ARR( 16 )(111 downto 96);
rgn_in_199 <= s_INPUT_LINK_ARR( 16 )(127 downto 112);
rgn_in_200 <= s_INPUT_LINK_ARR( 16 )(143 downto 128);
rgn_in_201 <= s_INPUT_LINK_ARR( 16 )(159 downto 144);
rgn_in_202 <= s_INPUT_LINK_ARR( 16 )(175 downto 160);
rgn_in_203 <= s_INPUT_LINK_ARR( 16 )(191 downto 176);
rgn_in_204 <= s_INPUT_LINK_ARR( 17 )(15 downto 0);
rgn_in_205 <= s_INPUT_LINK_ARR( 17 )(31 downto 16);
rgn_in_206 <= s_INPUT_LINK_ARR( 17 )(47 downto 32);
rgn_in_207 <= s_INPUT_LINK_ARR( 17 )(63 downto 48);
rgn_in_208 <= s_INPUT_LINK_ARR( 17 )(79 downto 64);
rgn_in_209 <= s_INPUT_LINK_ARR( 17 )(95 downto 80);
rgn_in_210 <= s_INPUT_LINK_ARR( 17 )(111 downto 96);
rgn_in_211 <= s_INPUT_LINK_ARR( 17 )(127 downto 112);
rgn_in_212 <= s_INPUT_LINK_ARR( 17 )(143 downto 128);
rgn_in_213 <= s_INPUT_LINK_ARR( 17 )(159 downto 144);
rgn_in_214 <= s_INPUT_LINK_ARR( 17 )(175 downto 160);
rgn_in_215 <= s_INPUT_LINK_ARR( 17 )(191 downto 176);
rgn_in_216 <= s_INPUT_LINK_ARR( 18 )(15 downto 0);
rgn_in_217 <= s_INPUT_LINK_ARR( 18 )(31 downto 16);
rgn_in_218 <= s_INPUT_LINK_ARR( 18 )(47 downto 32);
rgn_in_219 <= s_INPUT_LINK_ARR( 18 )(63 downto 48);
rgn_in_220 <= s_INPUT_LINK_ARR( 18 )(79 downto 64);
rgn_in_221 <= s_INPUT_LINK_ARR( 18 )(95 downto 80);
rgn_in_222 <= s_INPUT_LINK_ARR( 18 )(111 downto 96);
rgn_in_223 <= s_INPUT_LINK_ARR( 18 )(127 downto 112);
rgn_in_224 <= s_INPUT_LINK_ARR( 18 )(143 downto 128);
rgn_in_225 <= s_INPUT_LINK_ARR( 18 )(159 downto 144);
rgn_in_226 <= s_INPUT_LINK_ARR( 18 )(175 downto 160);
rgn_in_227 <= s_INPUT_LINK_ARR( 18 )(191 downto 176);
rgn_in_228 <= s_INPUT_LINK_ARR( 19 )(15 downto 0);
rgn_in_229 <= s_INPUT_LINK_ARR( 19 )(31 downto 16);
rgn_in_230 <= s_INPUT_LINK_ARR( 19 )(47 downto 32);
rgn_in_231 <= s_INPUT_LINK_ARR( 19 )(63 downto 48);
rgn_in_232 <= s_INPUT_LINK_ARR( 19 )(79 downto 64);
rgn_in_233 <= s_INPUT_LINK_ARR( 19 )(95 downto 80);
rgn_in_234 <= s_INPUT_LINK_ARR( 19 )(111 downto 96);
rgn_in_235 <= s_INPUT_LINK_ARR( 19 )(127 downto 112);
rgn_in_236 <= s_INPUT_LINK_ARR( 19 )(143 downto 128);
rgn_in_237 <= s_INPUT_LINK_ARR( 19 )(159 downto 144);
rgn_in_238 <= s_INPUT_LINK_ARR( 19 )(175 downto 160);
rgn_in_239 <= s_INPUT_LINK_ARR( 19 )(191 downto 176);
rgn_in_240 <= s_INPUT_LINK_ARR( 20 )(15 downto 0);
rgn_in_241 <= s_INPUT_LINK_ARR( 20 )(31 downto 16);
rgn_in_242 <= s_INPUT_LINK_ARR( 20 )(47 downto 32);
rgn_in_243 <= s_INPUT_LINK_ARR( 20 )(63 downto 48);
rgn_in_244 <= s_INPUT_LINK_ARR( 20 )(79 downto 64);
rgn_in_245 <= s_INPUT_LINK_ARR( 20 )(95 downto 80);
rgn_in_246 <= s_INPUT_LINK_ARR( 20 )(111 downto 96);
rgn_in_247 <= s_INPUT_LINK_ARR( 20 )(127 downto 112);
rgn_in_248 <= s_INPUT_LINK_ARR( 20 )(143 downto 128);
rgn_in_249 <= s_INPUT_LINK_ARR( 20 )(159 downto 144);
rgn_in_250 <= s_INPUT_LINK_ARR( 20 )(175 downto 160);
rgn_in_251 <= s_INPUT_LINK_ARR( 20 )(191 downto 176);


-----------------------------------------------------------------------------
 
-- Output Links   
s_OUTPUT_LINK_ARR( 0 )(19 downto 0) <= output_MET_0_V;
s_OUTPUT_LINK_ARR( 0 )(39 downto 20) <= output_MET_1_V;
s_OUTPUT_LINK_ARR( 0 )(53 downto 40) <= output_sqrtX_out_V;
s_OUTPUT_LINK_ARR( 0 )(70 downto 54) <= output_atanX_phase_V;


-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
-- End User_Code
-----------------------------------------------------------------------------

end ctp7_top_arch;
