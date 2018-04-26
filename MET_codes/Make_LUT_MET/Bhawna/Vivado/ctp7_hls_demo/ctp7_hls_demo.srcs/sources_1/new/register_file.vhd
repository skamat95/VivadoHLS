
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.ctp7_utils_pkg.all;

library UNISIM;
use UNISIM.vcomponents.all;

--============================================================================
--                                                          Entity declaration
--============================================================================
entity register_file is
  generic (
    C_DATE_CODE      : std_logic_vector (31 downto 0) := x"00000000";
    C_GITHASH_CODE   : std_logic_vector (31 downto 0) := x"00000000";
    C_GIT_REPO_DIRTY : std_logic                      := '0'
    );
  port (

    BRAM_CTRL_REG_FILE_en   : in  std_logic;
    BRAM_CTRL_REG_FILE_dout : out std_logic_vector (31 downto 0);
    BRAM_CTRL_REG_FILE_din  : in  std_logic_vector (31 downto 0);
    BRAM_CTRL_REG_FILE_we   : in  std_logic_vector (3 downto 0);
    BRAM_CTRL_REG_FILE_addr : in  std_logic_vector (16 downto 0);
    BRAM_CTRL_REG_FILE_clk  : in  std_logic;
    BRAM_CTRL_REG_FILE_rst  : in  std_logic;

    LED_FP_o : out std_logic_vector(31 downto 0);
    pattern_start_o : out std_logic;
    
    cfg_reg_o : out t_slv_arr_32(31 downto 0)

    );
end register_file;

--============================================================================
--                                                        Architecture section
--============================================================================
architecture register_file_arch of register_file is

--============================================================================
--                                                         Signal declarations
--============================================================================

signal s_LED_FP : std_logic_vector(31 downto 0);
signal s_pattern_start : std_logic;
signal s_cfg_reg : t_slv_arr_32(31 downto 0);

--============================================================================
--                                                          Architecture begin
--============================================================================

begin

LED_FP_o <= s_LED_FP;
pattern_start_o <= s_pattern_start;

cfg_reg_o <= s_cfg_reg;

----------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
--                                                                                                         BRAM Controller Write Section
----------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------

  process (BRAM_CTRL_REG_FILE_clk)
  begin
    if(rising_edge(BRAM_CTRL_REG_FILE_clk)) then

      if(BRAM_CTRL_REG_FILE_en = '1' and BRAM_CTRL_REG_FILE_we = "1111") then

        case (BRAM_CTRL_REG_FILE_addr) is
        
          when '0' & X"0000" => s_pattern_start <= BRAM_CTRL_REG_FILE_din(0);

          when '1' & X"0000" => s_cfg_reg(0) <= BRAM_CTRL_REG_FILE_din;
          when '1' & X"0004" => s_cfg_reg(1) <= BRAM_CTRL_REG_FILE_din;
          when '1' & X"0008" => s_cfg_reg(2) <= BRAM_CTRL_REG_FILE_din;
          when '1' & X"000c" => s_cfg_reg(3) <= BRAM_CTRL_REG_FILE_din;
          when '1' & X"0010" => s_cfg_reg(4) <= BRAM_CTRL_REG_FILE_din;
          when '1' & X"0014" => s_cfg_reg(5) <= BRAM_CTRL_REG_FILE_din;
          when '1' & X"0018" => s_cfg_reg(6) <= BRAM_CTRL_REG_FILE_din;
          when '1' & X"001c" => s_cfg_reg(7) <= BRAM_CTRL_REG_FILE_din;
          when '1' & X"0020" => s_cfg_reg(8) <= BRAM_CTRL_REG_FILE_din;
          when '1' & X"0024" => s_cfg_reg(9) <= BRAM_CTRL_REG_FILE_din;
          when '1' & X"0028" => s_cfg_reg(10) <= BRAM_CTRL_REG_FILE_din;
          when '1' & X"002c" => s_cfg_reg(11) <= BRAM_CTRL_REG_FILE_din;
          when '1' & X"0030" => s_cfg_reg(12) <= BRAM_CTRL_REG_FILE_din;
          when '1' & X"0034" => s_cfg_reg(13) <= BRAM_CTRL_REG_FILE_din;
          when '1' & X"0038" => s_cfg_reg(14) <= BRAM_CTRL_REG_FILE_din;
          when '1' & X"003c" => s_cfg_reg(15) <= BRAM_CTRL_REG_FILE_din;
          when '1' & X"0040" => s_cfg_reg(16) <= BRAM_CTRL_REG_FILE_din;
          when '1' & X"0044" => s_cfg_reg(17) <= BRAM_CTRL_REG_FILE_din;
          when '1' & X"0048" => s_cfg_reg(18) <= BRAM_CTRL_REG_FILE_din;
          when '1' & X"004c" => s_cfg_reg(19) <= BRAM_CTRL_REG_FILE_din;
          when '1' & X"0050" => s_cfg_reg(20) <= BRAM_CTRL_REG_FILE_din;
          when '1' & X"0054" => s_cfg_reg(21) <= BRAM_CTRL_REG_FILE_din;
          when '1' & X"0058" => s_cfg_reg(22) <= BRAM_CTRL_REG_FILE_din;
          when '1' & X"005c" => s_cfg_reg(23) <= BRAM_CTRL_REG_FILE_din;
          when '1' & X"0060" => s_cfg_reg(24) <= BRAM_CTRL_REG_FILE_din;
          when '1' & X"0064" => s_cfg_reg(25) <= BRAM_CTRL_REG_FILE_din;
          when '1' & X"0068" => s_cfg_reg(26) <= BRAM_CTRL_REG_FILE_din;
          when '1' & X"006c" => s_cfg_reg(27) <= BRAM_CTRL_REG_FILE_din;
          when '1' & X"0070" => s_cfg_reg(28) <= BRAM_CTRL_REG_FILE_din;
          when '1' & X"0074" => s_cfg_reg(29) <= BRAM_CTRL_REG_FILE_din;
          when '1' & X"0078" => s_cfg_reg(30) <= BRAM_CTRL_REG_FILE_din;
          when '1' & X"007c" => s_cfg_reg(31) <= BRAM_CTRL_REG_FILE_din;
       
          when '1' & X"C000" => s_LED_FP <= BRAM_CTRL_REG_FILE_din;

          when others => null;

        end case;
      end if;


----------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
--                                                                                                          BRAM Controller Read Section
----------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------

      BRAM_CTRL_REG_FILE_dout <= (others => '0');  --default BRAM dout assignment

      case (BRAM_CTRL_REG_FILE_addr) is

        when '0' & X"0000" => BRAM_CTRL_REG_FILE_dout(0) <= s_pattern_start;

        when '1' & X"0000" => BRAM_CTRL_REG_FILE_dout <= s_cfg_reg(0);
        when '1' & X"0004" => BRAM_CTRL_REG_FILE_dout <= s_cfg_reg(1);
        when '1' & X"0008" => BRAM_CTRL_REG_FILE_dout <= s_cfg_reg(2);
        when '1' & X"000c" => BRAM_CTRL_REG_FILE_dout <= s_cfg_reg(3);
        when '1' & X"0010" => BRAM_CTRL_REG_FILE_dout <= s_cfg_reg(4);
        when '1' & X"0014" => BRAM_CTRL_REG_FILE_dout <= s_cfg_reg(5);
        when '1' & X"0018" => BRAM_CTRL_REG_FILE_dout <= s_cfg_reg(6);
        when '1' & X"001c" => BRAM_CTRL_REG_FILE_dout <= s_cfg_reg(7);
        when '1' & X"0020" => BRAM_CTRL_REG_FILE_dout <= s_cfg_reg(8);
        when '1' & X"0024" => BRAM_CTRL_REG_FILE_dout <= s_cfg_reg(9);
        when '1' & X"0028" => BRAM_CTRL_REG_FILE_dout <= s_cfg_reg(10);
        when '1' & X"002c" => BRAM_CTRL_REG_FILE_dout <= s_cfg_reg(11);
        when '1' & X"0030" => BRAM_CTRL_REG_FILE_dout <= s_cfg_reg(12);
        when '1' & X"0034" => BRAM_CTRL_REG_FILE_dout <= s_cfg_reg(13);
        when '1' & X"0038" => BRAM_CTRL_REG_FILE_dout <= s_cfg_reg(14);
        when '1' & X"003c" => BRAM_CTRL_REG_FILE_dout <= s_cfg_reg(15);
        when '1' & X"0040" => BRAM_CTRL_REG_FILE_dout <= s_cfg_reg(16);
        when '1' & X"0044" => BRAM_CTRL_REG_FILE_dout <= s_cfg_reg(17);
        when '1' & X"0048" => BRAM_CTRL_REG_FILE_dout <= s_cfg_reg(18);
        when '1' & X"004c" => BRAM_CTRL_REG_FILE_dout <= s_cfg_reg(19);
        when '1' & X"0050" => BRAM_CTRL_REG_FILE_dout <= s_cfg_reg(20);
        when '1' & X"0054" => BRAM_CTRL_REG_FILE_dout <= s_cfg_reg(21);
        when '1' & X"0058" => BRAM_CTRL_REG_FILE_dout <= s_cfg_reg(22);
        when '1' & X"005c" => BRAM_CTRL_REG_FILE_dout <= s_cfg_reg(23);
        when '1' & X"0060" => BRAM_CTRL_REG_FILE_dout <= s_cfg_reg(24);
        when '1' & X"0064" => BRAM_CTRL_REG_FILE_dout <= s_cfg_reg(25);
        when '1' & X"0068" => BRAM_CTRL_REG_FILE_dout <= s_cfg_reg(26);
        when '1' & X"006c" => BRAM_CTRL_REG_FILE_dout <= s_cfg_reg(27);
        when '1' & X"0070" => BRAM_CTRL_REG_FILE_dout <= s_cfg_reg(28);
        when '1' & X"0074" => BRAM_CTRL_REG_FILE_dout <= s_cfg_reg(29);
        when '1' & X"0078" => BRAM_CTRL_REG_FILE_dout <= s_cfg_reg(30);
        when '1' & X"007c" => BRAM_CTRL_REG_FILE_dout <= s_cfg_reg(31);

        when '1' & X"C000" => BRAM_CTRL_REG_FILE_dout(31 downto 0) <= s_LED_FP;
   
--------------------------------------------------------------------------------

   --     when '1' & X"FF0C" => BRAM_CTRL_REG_FILE_dout(23 downto 0) <= BCFG_FW_VERSION_MAJOR &
   --                                                                   BCFG_FW_VERSION_MINOR &
   --                                                                   BCFG_FW_VERSION_PATCH;
--------------------------------------------------------------------------------

        when others => BRAM_CTRL_REG_FILE_dout <= (others => '0');

      end case;

    end if;
  end process;

---

end register_file_arch;
--============================================================================
--                                                            Architecture end
--============================================================================
