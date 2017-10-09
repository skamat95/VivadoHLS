
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
  signal s_clk_240        : std_logic;

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
 COMPONENT Make_lut_met_0
    PORT (
      ap_clk : IN STD_LOGIC;
      ap_rst : IN STD_LOGIC;
      ap_start : IN STD_LOGIC;
      ap_done : OUT STD_LOGIC;
      ap_idle : OUT STD_LOGIC;
      ap_ready : OUT STD_LOGIC;
      rgnET_0 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_1 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_2 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_3 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_4 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_5 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_6 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_7 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_8 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_9 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_10 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_11 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_12 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_13 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_14 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_15 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_16 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_17 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_18 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_19 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_20 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_21 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_22 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_23 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_24 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_25 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_26 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_27 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_28 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_29 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_30 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_31 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_32 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_33 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_34 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_35 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_36 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_37 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_38 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_39 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_40 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_41 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_42 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_43 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_44 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_45 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_46 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_47 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_48 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_49 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_50 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_51 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_52 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_53 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_54 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_55 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_56 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_57 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_58 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_59 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_60 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_61 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_62 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_63 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_64 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_65 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_66 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_67 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_68 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_69 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_70 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_71 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_72 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_73 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_74 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_75 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_76 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_77 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_78 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_79 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_80 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_81 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_82 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_83 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_84 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_85 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_86 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_87 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_88 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_89 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_90 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_91 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_92 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_93 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_94 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_95 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_96 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_97 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_98 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_99 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_100 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_101 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_102 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_103 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_104 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_105 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_106 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_107 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_108 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_109 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_110 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_111 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_112 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_113 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_114 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_115 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_116 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_117 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_118 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_119 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_120 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_121 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_122 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_123 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_124 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_125 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_126 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_127 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_128 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_129 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_130 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_131 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_132 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_133 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_134 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_135 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_136 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_137 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_138 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_139 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_140 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_141 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_142 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_143 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_144 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_145 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_146 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_147 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_148 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_149 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_150 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_151 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_152 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_153 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_154 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_155 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_156 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_157 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_158 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_159 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_160 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_161 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_162 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_163 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_164 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_165 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_166 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_167 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_168 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_169 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_170 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_171 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_172 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_173 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_174 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_175 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_176 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_177 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_178 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_179 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_180 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_181 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_182 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_183 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_184 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_185 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_186 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_187 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_188 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_189 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_190 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_191 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_192 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_193 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_194 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_195 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_196 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_197 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_198 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_199 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_200 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_201 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_202 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_203 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_204 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_205 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_206 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_207 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_208 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_209 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_210 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_211 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_212 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_213 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_214 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_215 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_216 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_217 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_218 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_219 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_220 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_221 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_222 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_223 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_224 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_225 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_226 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_227 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_228 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_229 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_230 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_231 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_232 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_233 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_234 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_235 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_236 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_237 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_238 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_239 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_240 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_241 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_242 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_243 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_244 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_245 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_246 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_247 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_248 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_249 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_250 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnET_251 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnPhi_0 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnPhi_1 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnPhi_2 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnPhi_3 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnPhi_4 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnPhi_5 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnPhi_6 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnPhi_7 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnPhi_8 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnPhi_9 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnPhi_10 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnPhi_11 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnPhi_12 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnPhi_13 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnPhi_14 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnPhi_15 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnPhi_16 : IN STD_LOGIC_VECTOR (15 downto 0);
      rgnPhi_17 : IN STD_LOGIC_VECTOR (15 downto 0);
      MET_0 : OUT STD_LOGIC_VECTOR (15 downto 0);
      MET_1 : OUT STD_LOGIC_VECTOR (15 downto 0);
      MET_2 : OUT STD_LOGIC_VECTOR (15 downto 0)

    );
  END COMPONENT;  

-- HLS Algo Control/Handshake Interface
      signal ap_clk :  STD_LOGIC;
      signal ap_rst :  STD_LOGIC;
      signal ap_start :  STD_LOGIC;
      signal ap_done :  STD_LOGIC;
      signal ap_idle :  STD_LOGIC;
      signal ap_ready :  STD_LOGIC;
      
      signal rgnET_0 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_1 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_2 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_3 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_4 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_5 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_6 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_7 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_8 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_9 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_10 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_11 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_12 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_13 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_14 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_15 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_16 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_17 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_18 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_19 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_20 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_21 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_22 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_23 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_24 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_25 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_26 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_27 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_28 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_29 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_30 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_31 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_32 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_33 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_34 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_35 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_36 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_37 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_38 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_39 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_40 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_41 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_42 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_43 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_44 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_45 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_46 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_47 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_48 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_49 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_50 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_51 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_52 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_53 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_54 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_55 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_56 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_57 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_58 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_59 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_60 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_61 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_62 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_63 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_64 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_65 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_66 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_67 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_68 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_69 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_70 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_71 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_72 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_73 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_74 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_75 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_76 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_77 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_78 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_79 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_80 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_81 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_82 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_83 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_84 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_85 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_86 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_87 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_88 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_89 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_90 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_91 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_92 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_93 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_94 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_95 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_96 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_97 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_98 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_99 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_100 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_101 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_102 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_103 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_104 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_105 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_106 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_107 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_108 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_109 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_110 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_111 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_112 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_113 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_114 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_115 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_116 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_117 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_118 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_119 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_120 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_121 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_122 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_123 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_124 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_125 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_126 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_127 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_128 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_129 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_130 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_131 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_132 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_133 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_134 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_135 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_136 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_137 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_138 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_139 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_140 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_141 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_142 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_143 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_144 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_145 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_146 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_147 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_148 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_149 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_150 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_151 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_152 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_153 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_154 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_155 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_156 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_157 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_158 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_159 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_160 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_161 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_162 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_163 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_164 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_165 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_166 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_167 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_168 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_169 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_170 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_171 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_172 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_173 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_174 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_175 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_176 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_177 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_178 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_179 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_180 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_181 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_182 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_183 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_184 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_185 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_186 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_187 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_188 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_189 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_190 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_191 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_192 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_193 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_194 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_195 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_196 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_197 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_198 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_199 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_200 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_201 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_202 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_203 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_204 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_205 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_206 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_207 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_208 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_209 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_210 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_211 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_212 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_213 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_214 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_215 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_216 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_217 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_218 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_219 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_220 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_221 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_222 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_223 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_224 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_225 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_226 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_227 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_228 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_229 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_230 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_231 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_232 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_233 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_234 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_235 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_236 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_237 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_238 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_239 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_240 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_241 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_242 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_243 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_244 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_245 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_246 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_247 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_248 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_249 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_250 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnET_251 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnPhi_0 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnPhi_1 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnPhi_2 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnPhi_3 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnPhi_4 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnPhi_5 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnPhi_6 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnPhi_7 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnPhi_8 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnPhi_9 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnPhi_10 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnPhi_11 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnPhi_12 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnPhi_13 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnPhi_14 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnPhi_15 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnPhi_16 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal rgnPhi_17 : STD_LOGIC_VECTOR(15 DOWNTO 0);
      signal MET_0 : STD_LOGIC_VECTOR (15 downto 0);
      signal MET_1 : STD_LOGIC_VECTOR (15 downto 0);
      signal MET_2 : STD_LOGIC_VECTOR (15 downto 0);

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
     
   i_Make_lut_met_0 : Make_lut_met_0
       PORT MAP (
         ap_clk => ap_clk,
         ap_rst => ap_rst,
         ap_start => ap_start,
         ap_done => ap_done,
         ap_idle => ap_idle,
         ap_ready => ap_ready,
         rgnET_0 => rgnET_0,
         rgnET_1 => rgnET_1,
         rgnET_2 => rgnET_2,
         rgnET_3 => rgnET_3,
         rgnET_4 => rgnET_4,
         rgnET_5 => rgnET_5,
         rgnET_6 => rgnET_6,
         rgnET_7 => rgnET_7,
         rgnET_8 => rgnET_8,
         rgnET_9 => rgnET_9,
         rgnET_10 => rgnET_10,
         rgnET_11 => rgnET_11,
         rgnET_12 => rgnET_12,
         rgnET_13 => rgnET_13,
         rgnET_14 => rgnET_14,
         rgnET_15 => rgnET_15,
         rgnET_16 => rgnET_16,
         rgnET_17 => rgnET_17,
         rgnET_18 => rgnET_18,
         rgnET_19 => rgnET_19,
         rgnET_20 => rgnET_20,
         rgnET_21 => rgnET_21,
         rgnET_22 => rgnET_22,
         rgnET_23 => rgnET_23,
         rgnET_24 => rgnET_24,
         rgnET_25 => rgnET_25,
         rgnET_26 => rgnET_26,
         rgnET_27 => rgnET_27,
         rgnET_28 => rgnET_28,
         rgnET_29 => rgnET_29,
         rgnET_30 => rgnET_30,
         rgnET_31 => rgnET_31,
         rgnET_32 => rgnET_32,
         rgnET_33 => rgnET_33,
         rgnET_34 => rgnET_34,
         rgnET_35 => rgnET_35,
         rgnET_36 => rgnET_36,
         rgnET_37 => rgnET_37,
         rgnET_38 => rgnET_38,
         rgnET_39 => rgnET_39,
         rgnET_40 => rgnET_40,
         rgnET_41 => rgnET_41,
         rgnET_42 => rgnET_42,
         rgnET_43 => rgnET_43,
         rgnET_44 => rgnET_44,
         rgnET_45 => rgnET_45,
         rgnET_46 => rgnET_46,
         rgnET_47 => rgnET_47,
         rgnET_48 => rgnET_48,
         rgnET_49 => rgnET_49,
         rgnET_50 => rgnET_50,
         rgnET_51 => rgnET_51,
         rgnET_52 => rgnET_52,
         rgnET_53 => rgnET_53,
         rgnET_54 => rgnET_54,
         rgnET_55 => rgnET_55,
         rgnET_56 => rgnET_56,
         rgnET_57 => rgnET_57,
         rgnET_58 => rgnET_58,
         rgnET_59 => rgnET_59,
         rgnET_60 => rgnET_60,
         rgnET_61 => rgnET_61,
         rgnET_62 => rgnET_62,
         rgnET_63 => rgnET_63,
         rgnET_64 => rgnET_64,
         rgnET_65 => rgnET_65,
         rgnET_66 => rgnET_66,
         rgnET_67 => rgnET_67,
         rgnET_68 => rgnET_68,
         rgnET_69 => rgnET_69,
         rgnET_70 => rgnET_70,
         rgnET_71 => rgnET_71,
         rgnET_72 => rgnET_72,
         rgnET_73 => rgnET_73,
         rgnET_74 => rgnET_74,
         rgnET_75 => rgnET_75,
         rgnET_76 => rgnET_76,
         rgnET_77 => rgnET_77,
         rgnET_78 => rgnET_78,
         rgnET_79 => rgnET_79,
         rgnET_80 => rgnET_80,
         rgnET_81 => rgnET_81,
         rgnET_82 => rgnET_82,
         rgnET_83 => rgnET_83,
         rgnET_84 => rgnET_84,
         rgnET_85 => rgnET_85,
         rgnET_86 => rgnET_86,
         rgnET_87 => rgnET_87,
         rgnET_88 => rgnET_88,
         rgnET_89 => rgnET_89,
         rgnET_90 => rgnET_90,
         rgnET_91 => rgnET_91,
         rgnET_92 => rgnET_92,
         rgnET_93 => rgnET_93,
         rgnET_94 => rgnET_94,
         rgnET_95 => rgnET_95,
         rgnET_96 => rgnET_96,
         rgnET_97 => rgnET_97,
         rgnET_98 => rgnET_98,
         rgnET_99 => rgnET_99,
         rgnET_100 => rgnET_100,
         rgnET_101 => rgnET_101,
         rgnET_102 => rgnET_102,
         rgnET_103 => rgnET_103,
         rgnET_104 => rgnET_104,
         rgnET_105 => rgnET_105,
         rgnET_106 => rgnET_106,
         rgnET_107 => rgnET_107,
         rgnET_108 => rgnET_108,
         rgnET_109 => rgnET_109,
         rgnET_110 => rgnET_110,
         rgnET_111 => rgnET_111,
         rgnET_112 => rgnET_112,
         rgnET_113 => rgnET_113,
         rgnET_114 => rgnET_114,
         rgnET_115 => rgnET_115,
         rgnET_116 => rgnET_116,
         rgnET_117 => rgnET_117,
         rgnET_118 => rgnET_118,
         rgnET_119 => rgnET_119,
         rgnET_120 => rgnET_120,
         rgnET_121 => rgnET_121,
         rgnET_122 => rgnET_122,
         rgnET_123 => rgnET_123,
         rgnET_124 => rgnET_124,
         rgnET_125 => rgnET_125,
         rgnET_126 => rgnET_126,
         rgnET_127 => rgnET_127,
         rgnET_128 => rgnET_128,
         rgnET_129 => rgnET_129,
         rgnET_130 => rgnET_130,
         rgnET_131 => rgnET_131,
         rgnET_132 => rgnET_132,
         rgnET_133 => rgnET_133,
         rgnET_134 => rgnET_134,
         rgnET_135 => rgnET_135,
         rgnET_136 => rgnET_136,
         rgnET_137 => rgnET_137,
         rgnET_138 => rgnET_138,
         rgnET_139 => rgnET_139,
         rgnET_140 => rgnET_140,
         rgnET_141 => rgnET_141,
         rgnET_142 => rgnET_142,
         rgnET_143 => rgnET_143,
         rgnET_144 => rgnET_144,
         rgnET_145 => rgnET_145,
         rgnET_146 => rgnET_146,
         rgnET_147 => rgnET_147,
         rgnET_148 => rgnET_148,
         rgnET_149 => rgnET_149,
         rgnET_150 => rgnET_150,
         rgnET_151 => rgnET_151,
         rgnET_152 => rgnET_152,
         rgnET_153 => rgnET_153,
         rgnET_154 => rgnET_154,
         rgnET_155 => rgnET_155,
         rgnET_156 => rgnET_156,
         rgnET_157 => rgnET_157,
         rgnET_158 => rgnET_158,
         rgnET_159 => rgnET_159,
         rgnET_160 => rgnET_160,
         rgnET_161 => rgnET_161,
         rgnET_162 => rgnET_162,
         rgnET_163 => rgnET_163,
         rgnET_164 => rgnET_164,
         rgnET_165 => rgnET_165,
         rgnET_166 => rgnET_166,
         rgnET_167 => rgnET_167,
         rgnET_168 => rgnET_168,
         rgnET_169 => rgnET_169,
         rgnET_170 => rgnET_170,
         rgnET_171 => rgnET_171,
         rgnET_172 => rgnET_172,
         rgnET_173 => rgnET_173,
         rgnET_174 => rgnET_174,
         rgnET_175 => rgnET_175,
         rgnET_176 => rgnET_176,
         rgnET_177 => rgnET_177,
         rgnET_178 => rgnET_178,
         rgnET_179 => rgnET_179,
         rgnET_180 => rgnET_180,
         rgnET_181 => rgnET_181,
         rgnET_182 => rgnET_182,
         rgnET_183 => rgnET_183,
         rgnET_184 => rgnET_184,
         rgnET_185 => rgnET_185,
         rgnET_186 => rgnET_186,
         rgnET_187 => rgnET_187,
         rgnET_188 => rgnET_188,
         rgnET_189 => rgnET_189,
         rgnET_190 => rgnET_190,
         rgnET_191 => rgnET_191,
         rgnET_192 => rgnET_192,
         rgnET_193 => rgnET_193,
         rgnET_194 => rgnET_194,
         rgnET_195 => rgnET_195,
         rgnET_196 => rgnET_196,
         rgnET_197 => rgnET_197,
         rgnET_198 => rgnET_198,
         rgnET_199 => rgnET_199,
         rgnET_200 => rgnET_200,
         rgnET_201 => rgnET_201,
         rgnET_202 => rgnET_202,
         rgnET_203 => rgnET_203,
         rgnET_204 => rgnET_204,
         rgnET_205 => rgnET_205,
         rgnET_206 => rgnET_206,
         rgnET_207 => rgnET_207,
         rgnET_208 => rgnET_208,
         rgnET_209 => rgnET_209,
         rgnET_210 => rgnET_210,
         rgnET_211 => rgnET_211,
         rgnET_212 => rgnET_212,
         rgnET_213 => rgnET_213,
         rgnET_214 => rgnET_214,
         rgnET_215 => rgnET_215,
         rgnET_216 => rgnET_216,
         rgnET_217 => rgnET_217,
         rgnET_218 => rgnET_218,
         rgnET_219 => rgnET_219,
         rgnET_220 => rgnET_220,
         rgnET_221 => rgnET_221,
         rgnET_222 => rgnET_222,
         rgnET_223 => rgnET_223,
         rgnET_224 => rgnET_224,
         rgnET_225 => rgnET_225,
         rgnET_226 => rgnET_226,
         rgnET_227 => rgnET_227,
         rgnET_228 => rgnET_228,
         rgnET_229 => rgnET_229,
         rgnET_230 => rgnET_230,
         rgnET_231 => rgnET_231,
         rgnET_232 => rgnET_232,
         rgnET_233 => rgnET_233,
         rgnET_234 => rgnET_234,
         rgnET_235 => rgnET_235,
         rgnET_236 => rgnET_236,
         rgnET_237 => rgnET_237,
         rgnET_238 => rgnET_238,
         rgnET_239 => rgnET_239,
         rgnET_240 => rgnET_240,
         rgnET_241 => rgnET_241,
         rgnET_242 => rgnET_242,
         rgnET_243 => rgnET_243,
         rgnET_244 => rgnET_244,
         rgnET_245 => rgnET_245,
         rgnET_246 => rgnET_246,
         rgnET_247 => rgnET_247,
         rgnET_248 => rgnET_248,
         rgnET_249 => rgnET_249,
         rgnET_250 => rgnET_250,
         rgnET_251 => rgnET_251,
         rgnPhi_0 => rgnPhi_0,
         rgnPhi_1 => rgnPhi_1,
         rgnPhi_2 => rgnPhi_2,
         rgnPhi_3 => rgnPhi_3,
         rgnPhi_4 => rgnPhi_4,
         rgnPhi_5 => rgnPhi_5,
         rgnPhi_6 => rgnPhi_6,
         rgnPhi_7 => rgnPhi_7,
         rgnPhi_8 => rgnPhi_8,
         rgnPhi_9 => rgnPhi_9,
         rgnPhi_10 => rgnPhi_10,
         rgnPhi_11 => rgnPhi_11,
         rgnPhi_12 => rgnPhi_12,
         rgnPhi_13 => rgnPhi_13,
         rgnPhi_14 => rgnPhi_14,
         rgnPhi_15 => rgnPhi_15,
         rgnPhi_16 => rgnPhi_16,
         rgnPhi_17 => rgnPhi_17,
         MET_0 => MET_0,
         MET_1 => MET_1,
         MET_2 => MET_2

       );

-----------------------------------------------------------------------------
-- Configuration registers              
   
-----------------------------------------------------------------------------

-- Input Links
   rgnET_0 <= s_INPUT_LINK_ARR( 0 )(15 downto 0);
rgnET_1 <= s_INPUT_LINK_ARR( 0 )(31 downto 16);
rgnET_2 <= s_INPUT_LINK_ARR( 0 )(47 downto 32);
rgnET_3 <= s_INPUT_LINK_ARR( 0 )(63 downto 48);
rgnET_4 <= s_INPUT_LINK_ARR( 0 )(79 downto 64);
rgnET_5 <= s_INPUT_LINK_ARR( 0 )(95 downto 80);
rgnET_6 <= s_INPUT_LINK_ARR( 0 )(111 downto 96);
rgnET_7 <= s_INPUT_LINK_ARR( 0 )(127 downto 112);
rgnET_8 <= s_INPUT_LINK_ARR( 0 )(143 downto 128);
rgnET_9 <= s_INPUT_LINK_ARR( 0 )(159 downto 144);
rgnET_10 <= s_INPUT_LINK_ARR( 0 )(175 downto 160);
rgnET_11 <= s_INPUT_LINK_ARR( 0 )(191 downto 176);
rgnET_12 <= s_INPUT_LINK_ARR( 1 )(15 downto 0);
rgnET_13 <= s_INPUT_LINK_ARR( 1 )(31 downto 16);
rgnET_14 <= s_INPUT_LINK_ARR( 1 )(47 downto 32);
rgnET_15 <= s_INPUT_LINK_ARR( 1 )(63 downto 48);
rgnET_16 <= s_INPUT_LINK_ARR( 1 )(79 downto 64);
rgnET_17 <= s_INPUT_LINK_ARR( 1 )(95 downto 80);
rgnET_18 <= s_INPUT_LINK_ARR( 1 )(111 downto 96);
rgnET_19 <= s_INPUT_LINK_ARR( 1 )(127 downto 112);
rgnET_20 <= s_INPUT_LINK_ARR( 1 )(143 downto 128);
rgnET_21 <= s_INPUT_LINK_ARR( 1 )(159 downto 144);
rgnET_22 <= s_INPUT_LINK_ARR( 1 )(175 downto 160);
rgnET_23 <= s_INPUT_LINK_ARR( 1 )(191 downto 176);
rgnET_24 <= s_INPUT_LINK_ARR( 2 )(15 downto 0);
rgnET_25 <= s_INPUT_LINK_ARR( 2 )(31 downto 16);
rgnET_26 <= s_INPUT_LINK_ARR( 2 )(47 downto 32);
rgnET_27 <= s_INPUT_LINK_ARR( 2 )(63 downto 48);
rgnET_28 <= s_INPUT_LINK_ARR( 2 )(79 downto 64);
rgnET_29 <= s_INPUT_LINK_ARR( 2 )(95 downto 80);
rgnET_30 <= s_INPUT_LINK_ARR( 2 )(111 downto 96);
rgnET_31 <= s_INPUT_LINK_ARR( 2 )(127 downto 112);
rgnET_32 <= s_INPUT_LINK_ARR( 2 )(143 downto 128);
rgnET_33 <= s_INPUT_LINK_ARR( 2 )(159 downto 144);
rgnET_34 <= s_INPUT_LINK_ARR( 2 )(175 downto 160);
rgnET_35 <= s_INPUT_LINK_ARR( 2 )(191 downto 176);
rgnET_36 <= s_INPUT_LINK_ARR( 3 )(15 downto 0);
rgnET_37 <= s_INPUT_LINK_ARR( 3 )(31 downto 16);
rgnET_38 <= s_INPUT_LINK_ARR( 3 )(47 downto 32);
rgnET_39 <= s_INPUT_LINK_ARR( 3 )(63 downto 48);
rgnET_40 <= s_INPUT_LINK_ARR( 3 )(79 downto 64);
rgnET_41 <= s_INPUT_LINK_ARR( 3 )(95 downto 80);
rgnET_42 <= s_INPUT_LINK_ARR( 3 )(111 downto 96);
rgnET_43 <= s_INPUT_LINK_ARR( 3 )(127 downto 112);
rgnET_44 <= s_INPUT_LINK_ARR( 3 )(143 downto 128);
rgnET_45 <= s_INPUT_LINK_ARR( 3 )(159 downto 144);
rgnET_46 <= s_INPUT_LINK_ARR( 3 )(175 downto 160);
rgnET_47 <= s_INPUT_LINK_ARR( 3 )(191 downto 176);
rgnET_48 <= s_INPUT_LINK_ARR( 4 )(15 downto 0);
rgnET_49 <= s_INPUT_LINK_ARR( 4 )(31 downto 16);
rgnET_50 <= s_INPUT_LINK_ARR( 4 )(47 downto 32);
rgnET_51 <= s_INPUT_LINK_ARR( 4 )(63 downto 48);
rgnET_52 <= s_INPUT_LINK_ARR( 4 )(79 downto 64);
rgnET_53 <= s_INPUT_LINK_ARR( 4 )(95 downto 80);
rgnET_54 <= s_INPUT_LINK_ARR( 4 )(111 downto 96);
rgnET_55 <= s_INPUT_LINK_ARR( 4 )(127 downto 112);
rgnET_56 <= s_INPUT_LINK_ARR( 4 )(143 downto 128);
rgnET_57 <= s_INPUT_LINK_ARR( 4 )(159 downto 144);
rgnET_58 <= s_INPUT_LINK_ARR( 4 )(175 downto 160);
rgnET_59 <= s_INPUT_LINK_ARR( 4 )(191 downto 176);
rgnET_60 <= s_INPUT_LINK_ARR( 5 )(15 downto 0);
rgnET_61 <= s_INPUT_LINK_ARR( 5 )(31 downto 16);
rgnET_62 <= s_INPUT_LINK_ARR( 5 )(47 downto 32);
rgnET_63 <= s_INPUT_LINK_ARR( 5 )(63 downto 48);
rgnET_64 <= s_INPUT_LINK_ARR( 5 )(79 downto 64);
rgnET_65 <= s_INPUT_LINK_ARR( 5 )(95 downto 80);
rgnET_66 <= s_INPUT_LINK_ARR( 5 )(111 downto 96);
rgnET_67 <= s_INPUT_LINK_ARR( 5 )(127 downto 112);
rgnET_68 <= s_INPUT_LINK_ARR( 5 )(143 downto 128);
rgnET_69 <= s_INPUT_LINK_ARR( 5 )(159 downto 144);
rgnET_70 <= s_INPUT_LINK_ARR( 5 )(175 downto 160);
rgnET_71 <= s_INPUT_LINK_ARR( 5 )(191 downto 176);
rgnET_72 <= s_INPUT_LINK_ARR( 6 )(15 downto 0);
rgnET_73 <= s_INPUT_LINK_ARR( 6 )(31 downto 16);
rgnET_74 <= s_INPUT_LINK_ARR( 6 )(47 downto 32);
rgnET_75 <= s_INPUT_LINK_ARR( 6 )(63 downto 48);
rgnET_76 <= s_INPUT_LINK_ARR( 6 )(79 downto 64);
rgnET_77 <= s_INPUT_LINK_ARR( 6 )(95 downto 80);
rgnET_78 <= s_INPUT_LINK_ARR( 6 )(111 downto 96);
rgnET_79 <= s_INPUT_LINK_ARR( 6 )(127 downto 112);
rgnET_80 <= s_INPUT_LINK_ARR( 6 )(143 downto 128);
rgnET_81 <= s_INPUT_LINK_ARR( 6 )(159 downto 144);
rgnET_82 <= s_INPUT_LINK_ARR( 6 )(175 downto 160);
rgnET_83 <= s_INPUT_LINK_ARR( 6 )(191 downto 176);
rgnET_84 <= s_INPUT_LINK_ARR( 7 )(15 downto 0);
rgnET_85 <= s_INPUT_LINK_ARR( 7 )(31 downto 16);
rgnET_86 <= s_INPUT_LINK_ARR( 7 )(47 downto 32);
rgnET_87 <= s_INPUT_LINK_ARR( 7 )(63 downto 48);
rgnET_88 <= s_INPUT_LINK_ARR( 7 )(79 downto 64);
rgnET_89 <= s_INPUT_LINK_ARR( 7 )(95 downto 80);
rgnET_90 <= s_INPUT_LINK_ARR( 7 )(111 downto 96);
rgnET_91 <= s_INPUT_LINK_ARR( 7 )(127 downto 112);
rgnET_92 <= s_INPUT_LINK_ARR( 7 )(143 downto 128);
rgnET_93 <= s_INPUT_LINK_ARR( 7 )(159 downto 144);
rgnET_94 <= s_INPUT_LINK_ARR( 7 )(175 downto 160);
rgnET_95 <= s_INPUT_LINK_ARR( 7 )(191 downto 176);
rgnET_96 <= s_INPUT_LINK_ARR( 8 )(15 downto 0);
rgnET_97 <= s_INPUT_LINK_ARR( 8 )(31 downto 16);
rgnET_98 <= s_INPUT_LINK_ARR( 8 )(47 downto 32);
rgnET_99 <= s_INPUT_LINK_ARR( 8 )(63 downto 48);
rgnET_100 <= s_INPUT_LINK_ARR( 8 )(79 downto 64);
rgnET_101 <= s_INPUT_LINK_ARR( 8 )(95 downto 80);
rgnET_102 <= s_INPUT_LINK_ARR( 8 )(111 downto 96);
rgnET_103 <= s_INPUT_LINK_ARR( 8 )(127 downto 112);
rgnET_104 <= s_INPUT_LINK_ARR( 8 )(143 downto 128);
rgnET_105 <= s_INPUT_LINK_ARR( 8 )(159 downto 144);
rgnET_106 <= s_INPUT_LINK_ARR( 8 )(175 downto 160);
rgnET_107 <= s_INPUT_LINK_ARR( 8 )(191 downto 176);
rgnET_108 <= s_INPUT_LINK_ARR( 9 )(15 downto 0);
rgnET_109 <= s_INPUT_LINK_ARR( 9 )(31 downto 16);
rgnET_110 <= s_INPUT_LINK_ARR( 9 )(47 downto 32);
rgnET_111 <= s_INPUT_LINK_ARR( 9 )(63 downto 48);
rgnET_112 <= s_INPUT_LINK_ARR( 9 )(79 downto 64);
rgnET_113 <= s_INPUT_LINK_ARR( 9 )(95 downto 80);
rgnET_114 <= s_INPUT_LINK_ARR( 9 )(111 downto 96);
rgnET_115 <= s_INPUT_LINK_ARR( 9 )(127 downto 112);
rgnET_116 <= s_INPUT_LINK_ARR( 9 )(143 downto 128);
rgnET_117 <= s_INPUT_LINK_ARR( 9 )(159 downto 144);
rgnET_118 <= s_INPUT_LINK_ARR( 9 )(175 downto 160);
rgnET_119 <= s_INPUT_LINK_ARR( 9 )(191 downto 176);
rgnET_120 <= s_INPUT_LINK_ARR( 10 )(15 downto 0);
rgnET_121 <= s_INPUT_LINK_ARR( 10 )(31 downto 16);
rgnET_122 <= s_INPUT_LINK_ARR( 10 )(47 downto 32);
rgnET_123 <= s_INPUT_LINK_ARR( 10 )(63 downto 48);
rgnET_124 <= s_INPUT_LINK_ARR( 10 )(79 downto 64);
rgnET_125 <= s_INPUT_LINK_ARR( 10 )(95 downto 80);
rgnET_126 <= s_INPUT_LINK_ARR( 10 )(111 downto 96);
rgnET_127 <= s_INPUT_LINK_ARR( 10 )(127 downto 112);
rgnET_128 <= s_INPUT_LINK_ARR( 10 )(143 downto 128);
rgnET_129 <= s_INPUT_LINK_ARR( 10 )(159 downto 144);
rgnET_130 <= s_INPUT_LINK_ARR( 10 )(175 downto 160);
rgnET_131 <= s_INPUT_LINK_ARR( 10 )(191 downto 176);
rgnET_132 <= s_INPUT_LINK_ARR( 11 )(15 downto 0);
rgnET_133 <= s_INPUT_LINK_ARR( 11 )(31 downto 16);
rgnET_134 <= s_INPUT_LINK_ARR( 11 )(47 downto 32);
rgnET_135 <= s_INPUT_LINK_ARR( 11 )(63 downto 48);
rgnET_136 <= s_INPUT_LINK_ARR( 11 )(79 downto 64);
rgnET_137 <= s_INPUT_LINK_ARR( 11 )(95 downto 80);
rgnET_138 <= s_INPUT_LINK_ARR( 11 )(111 downto 96);
rgnET_139 <= s_INPUT_LINK_ARR( 11 )(127 downto 112);
rgnET_140 <= s_INPUT_LINK_ARR( 11 )(143 downto 128);
rgnET_141 <= s_INPUT_LINK_ARR( 11 )(159 downto 144);
rgnET_142 <= s_INPUT_LINK_ARR( 11 )(175 downto 160);
rgnET_143 <= s_INPUT_LINK_ARR( 11 )(191 downto 176);
rgnET_144 <= s_INPUT_LINK_ARR( 12 )(15 downto 0);
rgnET_145 <= s_INPUT_LINK_ARR( 12 )(31 downto 16);
rgnET_146 <= s_INPUT_LINK_ARR( 12 )(47 downto 32);
rgnET_147 <= s_INPUT_LINK_ARR( 12 )(63 downto 48);
rgnET_148 <= s_INPUT_LINK_ARR( 12 )(79 downto 64);
rgnET_149 <= s_INPUT_LINK_ARR( 12 )(95 downto 80);
rgnET_150 <= s_INPUT_LINK_ARR( 12 )(111 downto 96);
rgnET_151 <= s_INPUT_LINK_ARR( 12 )(127 downto 112);
rgnET_152 <= s_INPUT_LINK_ARR( 12 )(143 downto 128);
rgnET_153 <= s_INPUT_LINK_ARR( 12 )(159 downto 144);
rgnET_154 <= s_INPUT_LINK_ARR( 12 )(175 downto 160);
rgnET_155 <= s_INPUT_LINK_ARR( 12 )(191 downto 176);
rgnET_156 <= s_INPUT_LINK_ARR( 13 )(15 downto 0);
rgnET_157 <= s_INPUT_LINK_ARR( 13 )(31 downto 16);
rgnET_158 <= s_INPUT_LINK_ARR( 13 )(47 downto 32);
rgnET_159 <= s_INPUT_LINK_ARR( 13 )(63 downto 48);
rgnET_160 <= s_INPUT_LINK_ARR( 13 )(79 downto 64);
rgnET_161 <= s_INPUT_LINK_ARR( 13 )(95 downto 80);
rgnET_162 <= s_INPUT_LINK_ARR( 13 )(111 downto 96);
rgnET_163 <= s_INPUT_LINK_ARR( 13 )(127 downto 112);
rgnET_164 <= s_INPUT_LINK_ARR( 13 )(143 downto 128);
rgnET_165 <= s_INPUT_LINK_ARR( 13 )(159 downto 144);
rgnET_166 <= s_INPUT_LINK_ARR( 13 )(175 downto 160);
rgnET_167 <= s_INPUT_LINK_ARR( 13 )(191 downto 176);
rgnET_168 <= s_INPUT_LINK_ARR( 14 )(15 downto 0);
rgnET_169 <= s_INPUT_LINK_ARR( 14 )(31 downto 16);
rgnET_170 <= s_INPUT_LINK_ARR( 14 )(47 downto 32);
rgnET_171 <= s_INPUT_LINK_ARR( 14 )(63 downto 48);
rgnET_172 <= s_INPUT_LINK_ARR( 14 )(79 downto 64);
rgnET_173 <= s_INPUT_LINK_ARR( 14 )(95 downto 80);
rgnET_174 <= s_INPUT_LINK_ARR( 14 )(111 downto 96);
rgnET_175 <= s_INPUT_LINK_ARR( 14 )(127 downto 112);
rgnET_176 <= s_INPUT_LINK_ARR( 14 )(143 downto 128);
rgnET_177 <= s_INPUT_LINK_ARR( 14 )(159 downto 144);
rgnET_178 <= s_INPUT_LINK_ARR( 14 )(175 downto 160);
rgnET_179 <= s_INPUT_LINK_ARR( 14 )(191 downto 176);
rgnET_180 <= s_INPUT_LINK_ARR( 15 )(15 downto 0);
rgnET_181 <= s_INPUT_LINK_ARR( 15 )(31 downto 16);
rgnET_182 <= s_INPUT_LINK_ARR( 15 )(47 downto 32);
rgnET_183 <= s_INPUT_LINK_ARR( 15 )(63 downto 48);
rgnET_184 <= s_INPUT_LINK_ARR( 15 )(79 downto 64);
rgnET_185 <= s_INPUT_LINK_ARR( 15 )(95 downto 80);
rgnET_186 <= s_INPUT_LINK_ARR( 15 )(111 downto 96);
rgnET_187 <= s_INPUT_LINK_ARR( 15 )(127 downto 112);
rgnET_188 <= s_INPUT_LINK_ARR( 15 )(143 downto 128);
rgnET_189 <= s_INPUT_LINK_ARR( 15 )(159 downto 144);
rgnET_190 <= s_INPUT_LINK_ARR( 15 )(175 downto 160);
rgnET_191 <= s_INPUT_LINK_ARR( 15 )(191 downto 176);
rgnET_192 <= s_INPUT_LINK_ARR( 16 )(15 downto 0);
rgnET_193 <= s_INPUT_LINK_ARR( 16 )(31 downto 16);
rgnET_194 <= s_INPUT_LINK_ARR( 16 )(47 downto 32);
rgnET_195 <= s_INPUT_LINK_ARR( 16 )(63 downto 48);
rgnET_196 <= s_INPUT_LINK_ARR( 16 )(79 downto 64);
rgnET_197 <= s_INPUT_LINK_ARR( 16 )(95 downto 80);
rgnET_198 <= s_INPUT_LINK_ARR( 16 )(111 downto 96);
rgnET_199 <= s_INPUT_LINK_ARR( 16 )(127 downto 112);
rgnET_200 <= s_INPUT_LINK_ARR( 16 )(143 downto 128);
rgnET_201 <= s_INPUT_LINK_ARR( 16 )(159 downto 144);
rgnET_202 <= s_INPUT_LINK_ARR( 16 )(175 downto 160);
rgnET_203 <= s_INPUT_LINK_ARR( 16 )(191 downto 176);
rgnET_204 <= s_INPUT_LINK_ARR( 17 )(15 downto 0);
rgnET_205 <= s_INPUT_LINK_ARR( 17 )(31 downto 16);
rgnET_206 <= s_INPUT_LINK_ARR( 17 )(47 downto 32);
rgnET_207 <= s_INPUT_LINK_ARR( 17 )(63 downto 48);
rgnET_208 <= s_INPUT_LINK_ARR( 17 )(79 downto 64);
rgnET_209 <= s_INPUT_LINK_ARR( 17 )(95 downto 80);
rgnET_210 <= s_INPUT_LINK_ARR( 17 )(111 downto 96);
rgnET_211 <= s_INPUT_LINK_ARR( 17 )(127 downto 112);
rgnET_212 <= s_INPUT_LINK_ARR( 17 )(143 downto 128);
rgnET_213 <= s_INPUT_LINK_ARR( 17 )(159 downto 144);
rgnET_214 <= s_INPUT_LINK_ARR( 17 )(175 downto 160);
rgnET_215 <= s_INPUT_LINK_ARR( 17 )(191 downto 176);
rgnET_216 <= s_INPUT_LINK_ARR( 18 )(15 downto 0);
rgnET_217 <= s_INPUT_LINK_ARR( 18 )(31 downto 16);
rgnET_218 <= s_INPUT_LINK_ARR( 18 )(47 downto 32);
rgnET_219 <= s_INPUT_LINK_ARR( 18 )(63 downto 48);
rgnET_220 <= s_INPUT_LINK_ARR( 18 )(79 downto 64);
rgnET_221 <= s_INPUT_LINK_ARR( 18 )(95 downto 80);
rgnET_222 <= s_INPUT_LINK_ARR( 18 )(111 downto 96);
rgnET_223 <= s_INPUT_LINK_ARR( 18 )(127 downto 112);
rgnET_224 <= s_INPUT_LINK_ARR( 18 )(143 downto 128);
rgnET_225 <= s_INPUT_LINK_ARR( 18 )(159 downto 144);
rgnET_226 <= s_INPUT_LINK_ARR( 18 )(175 downto 160);
rgnET_227 <= s_INPUT_LINK_ARR( 18 )(191 downto 176);
rgnET_228 <= s_INPUT_LINK_ARR( 19 )(15 downto 0);
rgnET_229 <= s_INPUT_LINK_ARR( 19 )(31 downto 16);
rgnET_230 <= s_INPUT_LINK_ARR( 19 )(47 downto 32);
rgnET_231 <= s_INPUT_LINK_ARR( 19 )(63 downto 48);
rgnET_232 <= s_INPUT_LINK_ARR( 19 )(79 downto 64);
rgnET_233 <= s_INPUT_LINK_ARR( 19 )(95 downto 80);
rgnET_234 <= s_INPUT_LINK_ARR( 19 )(111 downto 96);
rgnET_235 <= s_INPUT_LINK_ARR( 19 )(127 downto 112);
rgnET_236 <= s_INPUT_LINK_ARR( 19 )(143 downto 128);
rgnET_237 <= s_INPUT_LINK_ARR( 19 )(159 downto 144);
rgnET_238 <= s_INPUT_LINK_ARR( 19 )(175 downto 160);
rgnET_239 <= s_INPUT_LINK_ARR( 19 )(191 downto 176);
rgnET_240 <= s_INPUT_LINK_ARR( 20 )(15 downto 0);
rgnET_241 <= s_INPUT_LINK_ARR( 20 )(31 downto 16);
rgnET_242 <= s_INPUT_LINK_ARR( 20 )(47 downto 32);
rgnET_243 <= s_INPUT_LINK_ARR( 20 )(63 downto 48);
rgnET_244 <= s_INPUT_LINK_ARR( 20 )(79 downto 64);
rgnET_245 <= s_INPUT_LINK_ARR( 20 )(95 downto 80);
rgnET_246 <= s_INPUT_LINK_ARR( 20 )(111 downto 96);
rgnET_247 <= s_INPUT_LINK_ARR( 20 )(127 downto 112);
rgnET_248 <= s_INPUT_LINK_ARR( 20 )(143 downto 128);
rgnET_249 <= s_INPUT_LINK_ARR( 20 )(159 downto 144);
rgnET_250 <= s_INPUT_LINK_ARR( 20 )(175 downto 160);
rgnET_251 <= s_INPUT_LINK_ARR( 20 )(191 downto 176);
rgnPhi_0 <= s_INPUT_LINK_ARR( 21 )(15 downto 0);
rgnPhi_1 <= s_INPUT_LINK_ARR( 21 )(31 downto 16);
rgnPhi_2 <= s_INPUT_LINK_ARR( 21 )(47 downto 32);
rgnPhi_3 <= s_INPUT_LINK_ARR( 21 )(63 downto 48);
rgnPhi_4 <= s_INPUT_LINK_ARR( 21 )(79 downto 64);
rgnPhi_5 <= s_INPUT_LINK_ARR( 21 )(95 downto 80);
rgnPhi_6 <= s_INPUT_LINK_ARR( 21 )(111 downto 96);
rgnPhi_7 <= s_INPUT_LINK_ARR( 21 )(127 downto 112);
rgnPhi_8 <= s_INPUT_LINK_ARR( 21 )(143 downto 128);
rgnPhi_9 <= s_INPUT_LINK_ARR( 21 )(159 downto 144);
rgnPhi_10 <= s_INPUT_LINK_ARR( 21 )(175 downto 160);
rgnPhi_11 <= s_INPUT_LINK_ARR( 21 )(191 downto 176);
rgnPhi_12 <= s_INPUT_LINK_ARR( 22 )(15 downto 0);
rgnPhi_13 <= s_INPUT_LINK_ARR( 22 )(31 downto 16);
rgnPhi_14 <= s_INPUT_LINK_ARR( 22 )(47 downto 32);
rgnPhi_15 <= s_INPUT_LINK_ARR( 22 )(63 downto 48);
rgnPhi_16 <= s_INPUT_LINK_ARR( 22 )(79 downto 64);
rgnPhi_17 <= s_INPUT_LINK_ARR( 22 )(95 downto 80);

-----------------------------------------------------------------------------
 
-- Output Links   
s_OUTPUT_LINK_ARR( 0 )(15 downto 0) <= MET_0;
s_OUTPUT_LINK_ARR( 0 )(31 downto 16) <= MET_1;
s_OUTPUT_LINK_ARR( 0 )(47 downto 32) <= MET_2;
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
-- End User_Code
-----------------------------------------------------------------------------

end ctp7_top_arch;
