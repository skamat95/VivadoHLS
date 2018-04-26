

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

use work.ctp7_utils_pkg.all;

entity pattern_io_engine is
  Port ( 
  
      clk_240_i : in std_logic;
      
      pattern_restart_i: in std_logic;
      
      algo_rst_o: out std_logic;
      algo_start_o: out std_logic;
      algo_done_i: in std_logic;

      
      INPUT_link_arr_o : out t_slv_arr_192(66 downto 0);
      OUTPUT_link_arr_i: in  t_slv_arr_192(47 downto 0);
      
      BRAM_CTRL_INPUT_RAM_0_addr : in STD_LOGIC_VECTOR ( 16 downto 0 );
      BRAM_CTRL_INPUT_RAM_0_clk : in STD_LOGIC;
      BRAM_CTRL_INPUT_RAM_0_din : in STD_LOGIC_VECTOR ( 31 downto 0 );
      BRAM_CTRL_INPUT_RAM_0_dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
      BRAM_CTRL_INPUT_RAM_0_en : in STD_LOGIC;
      BRAM_CTRL_INPUT_RAM_0_rst : in STD_LOGIC;
      BRAM_CTRL_INPUT_RAM_0_we : in STD_LOGIC_VECTOR ( 3 downto 0 );
 
      BRAM_CTRL_INPUT_RAM_1_addr : in STD_LOGIC_VECTOR ( 16 downto 0 );
      BRAM_CTRL_INPUT_RAM_1_clk : in STD_LOGIC;
      BRAM_CTRL_INPUT_RAM_1_din : in STD_LOGIC_VECTOR ( 31 downto 0 );
      BRAM_CTRL_INPUT_RAM_1_dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
      BRAM_CTRL_INPUT_RAM_1_en : in STD_LOGIC;
      BRAM_CTRL_INPUT_RAM_1_rst : in STD_LOGIC;
      BRAM_CTRL_INPUT_RAM_1_we : in STD_LOGIC_VECTOR ( 3 downto 0 );
      
      BRAM_CTRL_INPUT_RAM_2_addr : in STD_LOGIC_VECTOR ( 16 downto 0 );
      BRAM_CTRL_INPUT_RAM_2_clk : in STD_LOGIC;
      BRAM_CTRL_INPUT_RAM_2_din : in STD_LOGIC_VECTOR ( 31 downto 0 );
      BRAM_CTRL_INPUT_RAM_2_dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
      BRAM_CTRL_INPUT_RAM_2_en : in STD_LOGIC;
      BRAM_CTRL_INPUT_RAM_2_rst : in STD_LOGIC;
      BRAM_CTRL_INPUT_RAM_2_we : in STD_LOGIC_VECTOR ( 3 downto 0 );
            
      BRAM_CTRL_OUTPUT_RAM_0_addr : in STD_LOGIC_VECTOR ( 16 downto 0 );
      BRAM_CTRL_OUTPUT_RAM_0_clk : in STD_LOGIC;
      BRAM_CTRL_OUTPUT_RAM_0_din : in STD_LOGIC_VECTOR ( 31 downto 0 );
      BRAM_CTRL_OUTPUT_RAM_0_dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
      BRAM_CTRL_OUTPUT_RAM_0_en : in STD_LOGIC;
      BRAM_CTRL_OUTPUT_RAM_0_rst : in STD_LOGIC;
      BRAM_CTRL_OUTPUT_RAM_0_we : in STD_LOGIC_VECTOR ( 3 downto 0 );
 
      BRAM_CTRL_OUTPUT_RAM_1_addr : in STD_LOGIC_VECTOR ( 16 downto 0 );
      BRAM_CTRL_OUTPUT_RAM_1_clk : in STD_LOGIC;
      BRAM_CTRL_OUTPUT_RAM_1_din : in STD_LOGIC_VECTOR ( 31 downto 0 );
      BRAM_CTRL_OUTPUT_RAM_1_dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
      BRAM_CTRL_OUTPUT_RAM_1_en : in STD_LOGIC;
      BRAM_CTRL_OUTPUT_RAM_1_rst : in STD_LOGIC;
      BRAM_CTRL_OUTPUT_RAM_1_we : in STD_LOGIC_VECTOR ( 3 downto 0 )
   );
end pattern_io_engine;

architecture pattern_io_engine_arch of pattern_io_engine is

COMPONENT pattern_bram
  PORT (
    clka : IN STD_LOGIC;
    rsta : IN STD_LOGIC;
    ena : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    clkb : IN STD_LOGIC;
    enb : IN STD_LOGIC;
    web : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addrb : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
    dinb : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    doutb : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END COMPONENT;

COMPONENT ila_0

PORT (
	clk : IN STD_LOGIC;



	probe0 : IN STD_LOGIC_VECTOR(31 DOWNTO 0); 
	probe1 : IN STD_LOGIC_VECTOR(31 DOWNTO 0); 
	probe2 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
	probe3 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
	probe4 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
	probe5 : IN STD_LOGIC_VECTOR(9 DOWNTO 0); 
	probe6 : IN STD_LOGIC_VECTOR(9 DOWNTO 0); 
	probe7 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	probe8 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	probe9 : IN STD_LOGIC_VECTOR(191 DOWNTO 0);
    probe10 : IN STD_LOGIC_VECTOR(191 DOWNTO 0)	
);
END COMPONENT  ;


signal s_BRAM_CTRL_INPUT_RAM_0_rst : std_logic_vector(31 downto 0);
signal s_BRAM_CTRL_INPUT_RAM_0_we : std_logic_vector(31 downto 0);
signal s_BRAM_CTRL_INPUT_RAM_0_dout_arr : t_slv_arr_32(31 downto 0) := (others => (others => '0'));

signal s_BRAM_CTRL_INPUT_RAM_1_rst : std_logic_vector(31 downto 0);
signal s_BRAM_CTRL_INPUT_RAM_1_we : std_logic_vector(31 downto 0);
signal s_BRAM_CTRL_INPUT_RAM_1_dout_arr : t_slv_arr_32(31 downto 0) := (others => (others => '0'));

signal s_BRAM_CTRL_INPUT_RAM_2_rst : std_logic_vector(2 downto 0);
signal s_BRAM_CTRL_INPUT_RAM_2_we : std_logic_vector(2 downto 0);
signal s_BRAM_CTRL_INPUT_RAM_2_dout_arr : t_slv_arr_32(2 downto 0) := (others => (others => '0'));
---
signal s_BRAM_CTRL_OUTPUT_RAM_0_rst : std_logic_vector(31 downto 0);
signal s_BRAM_CTRL_OUTPUT_RAM_0_we : std_logic_vector(31 downto 0);
signal s_BRAM_CTRL_OUTPUT_RAM_0_dout_arr : t_slv_arr_32(31 downto 0) := (others => (others => '0'));

signal s_BRAM_CTRL_OUTPUT_RAM_1_rst : std_logic_vector(15 downto 0);
signal s_BRAM_CTRL_OUTPUT_RAM_1_we : std_logic_vector(15 downto 0);
signal s_BRAM_CTRL_OUTPUT_RAM_1_dout_arr : t_slv_arr_32(15 downto 0) := (others => (others => '0'));

---

signal s_INPUT_RAM_dout_arr : t_slv_arr_32(66 downto 0) := (others => (others => '0'));
signal s_OUTPUT_RAM_din_arr : t_slv_arr_32(47 downto 0) := (others => (others => '0'));

signal s_INPUT_RAM_addr : std_logic_vector(9 downto 0);
signal s_OUTPUT_RAM_addr : std_logic_vector(9 downto 0);

signal s_INPUT_RAM_cycle : std_logic_vector(2 downto 0);
signal s_OUTPUT_RAM_cycle : std_logic_vector(2 downto 0);

signal s_OUTPUT_RAM_we : std_logic;

signal s_INPUT_link_arr : t_slv_arr_192(66 downto 0) := (others => (others => '0'));
signal s_OUTPUT_link_arr : t_slv_arr_192(47 downto 0) := (others => (others => '0'));
signal s_OUTPUT_link_arr_d1 : t_slv_arr_192(47 downto 0) := (others => (others => '0'));


signal s_pattern_restart_d1, s_pattern_restart_d2, 
       s_pattern_restart_d3, s_pattern_restart_d4,
       s_pattern_restart_d5, s_pattern_restart_d6, 
       s_pattern_restart_d7, s_pattern_restart_d8,
       s_pattern_restart_d9 : std_logic;

signal s_output_capture : std_logic;

begin

algo_rst_o <= not s_pattern_restart_d2;
algo_start_o <= s_pattern_restart_d9;
      
    process(clk_240_i) is
      begin
          if rising_edge(clk_240_i) then
             s_pattern_restart_d1 <= pattern_restart_i;
             s_pattern_restart_d2 <= s_pattern_restart_d1;
             s_pattern_restart_d3 <= s_pattern_restart_d2;
             s_pattern_restart_d4 <= s_pattern_restart_d3;
             s_pattern_restart_d5 <= s_pattern_restart_d4;
             s_pattern_restart_d6 <= s_pattern_restart_d5;
             s_pattern_restart_d7 <= s_pattern_restart_d6;
             s_pattern_restart_d8 <= s_pattern_restart_d7;
             s_pattern_restart_d9 <= s_pattern_restart_d8;
          end if;
       end process;
---------
-- Input
---------

    process(clk_240_i) is
    begin
        if rising_edge(clk_240_i) then
        if (pattern_restart_i = '0') then
            s_INPUT_RAM_addr <= "0000000000";
        elsif (s_INPUT_RAM_addr = "1111111111") then
            s_INPUT_RAM_addr <= "1111111111";
        else
            s_INPUT_RAM_addr <= std_logic_vector(unsigned(s_INPUT_RAM_addr) + 1);
        end if;
      end if;
    end process;
    
    process(clk_240_i) is
    begin
    if rising_edge(clk_240_i) then
        if (s_pattern_restart_d2 = '0') then
            s_INPUT_RAM_cycle <= "000";
        elsif (s_INPUT_RAM_cycle = "101") then
            s_INPUT_RAM_cycle <= "000";
        else
            s_INPUT_RAM_cycle <= std_logic_vector(unsigned(s_INPUT_RAM_cycle) + 1);
        end if;
     end if;
    end process;
    
  gen_input_link_assign : for idx in 0 to 66 generate
    process(clk_240_i) is
    begin
    if rising_edge(clk_240_i) then
       case(s_INPUT_RAM_cycle) is
        
            when "000" => s_INPUT_link_arr(idx)(31 downto 0) <= s_INPUT_RAM_dout_arr(idx);
            when "001" => s_INPUT_link_arr(idx)(63 downto 32) <= s_INPUT_RAM_dout_arr(idx);
            when "010" => s_INPUT_link_arr(idx)(95 downto 64) <= s_INPUT_RAM_dout_arr(idx);
            when "011" => s_INPUT_link_arr(idx)(127 downto 96) <= s_INPUT_RAM_dout_arr(idx);
            when "100" => s_INPUT_link_arr(idx)(159 downto 128) <= s_INPUT_RAM_dout_arr(idx);
            when others => s_INPUT_link_arr(idx)(191 downto 160) <= s_INPUT_RAM_dout_arr(idx);

        end case;
        
        if (s_INPUT_RAM_cycle = "000") then
              INPUT_link_arr_o(idx) <= s_INPUT_link_arr(idx);
        end if;
        
    end if;
    end process; 
 end generate;
   
---------
 -- Output
 ---------
 
 process(clk_240_i) is
 begin
     if rising_edge(clk_240_i) then
        if ( s_pattern_restart_d2 = '0') then
            s_output_capture <= '0';
        elsif(algo_done_i = '1') then
            s_output_capture <= '1';
        end if;
     end if;
 end process;
 
 process(clk_240_i) is
 begin
     if rising_edge(clk_240_i) then
        if(algo_done_i = '1') then
            s_OUTPUT_link_arr <= OUTPUT_link_arr_i;       
     end if;
     end if;
 end process; 
 
 
     process(clk_240_i) is
     begin
         if rising_edge(clk_240_i) then
             if (s_output_capture = '0') then
                 s_OUTPUT_RAM_addr <= "1111111111";
                 s_OUTPUT_RAM_we <= '0'; 
             elsif (s_OUTPUT_RAM_addr = "1111111110") then
                 s_OUTPUT_RAM_addr <= "1111111110";
                 s_OUTPUT_RAM_we <= '0';
             else
                 s_OUTPUT_RAM_addr <= std_logic_vector(unsigned(s_OUTPUT_RAM_addr) + 1);
                 s_OUTPUT_RAM_we <= '1';
             end if;
       end if;
     end process;
     
     process(clk_240_i) is
     begin
     if rising_edge(clk_240_i) then
         if (s_output_capture = '0') then
             s_OUTPUT_RAM_cycle <= "000";
         elsif (s_OUTPUT_RAM_cycle = "101") then
             s_OUTPUT_RAM_cycle <= "000";
         else
             s_OUTPUT_RAM_cycle <= std_logic_vector(unsigned(s_OUTPUT_RAM_cycle) + 1);
         end if;
      end if;
     end process;
     
   gen_OUTPUT_link_assign : for idx in 0 to 47 generate
     process(clk_240_i) is
     begin
     if rising_edge(clk_240_i) then
        case(s_OUTPUT_RAM_cycle) is
         
             when "000" => s_OUTPUT_RAM_din_arr(idx) <= s_OUTPUT_link_arr(idx)(31 downto 0) ;
             when "001" => s_OUTPUT_RAM_din_arr(idx) <= s_OUTPUT_link_arr(idx)(63 downto 32);
             when "010" => s_OUTPUT_RAM_din_arr(idx) <= s_OUTPUT_link_arr(idx)(95 downto 64);
             when "011" => s_OUTPUT_RAM_din_arr(idx) <= s_OUTPUT_link_arr(idx)(127 downto 96);
             when "100" => s_OUTPUT_RAM_din_arr(idx) <= s_OUTPUT_link_arr(idx)(159 downto 128);
             when others => s_OUTPUT_RAM_din_arr(idx) <= s_OUTPUT_link_arr(idx)(191 downto 160);
 
         end case;
         
         s_OUTPUT_link_arr_d1(idx) <= OUTPUT_link_arr_i(idx);
         
         if (s_OUTPUT_RAM_cycle = "101") then
--               s_OUTPUT_link_arr(idx) <= OUTPUT_link_arr_i(idx);
         end if;
         
     end if;
     end process; 
  end generate;

i_ila_pattern_engine : ila_0
PORT MAP (
	clk => clk_240_i,

	probe0 => s_INPUT_RAM_dout_arr(0), 
	probe1 => s_OUTPUT_RAM_din_arr(0),
	probe2(0) => pattern_restart_i, 
	probe3(0) => s_output_capture, 
	probe4(0) => s_OUTPUT_RAM_we, 
	probe5 => s_INPUT_RAM_addr, 
	probe6 => s_OUTPUT_RAM_addr, 
	probe7 => s_INPUT_RAM_cycle,
	probe8 => s_OUTPUT_RAM_cycle,
	probe9 => s_INPUT_link_arr(0),
    probe10 => s_OUTPUT_link_arr(0)	
);

-----
-- INPUT_RAM_0
----

    gen_input_bram_0 : for idx in 0 to 31 generate
    
        input_bram : pattern_bram
          PORT MAP (
            clka => BRAM_CTRL_INPUT_RAM_0_clk,
            rsta => s_BRAM_CTRL_INPUT_RAM_0_rst(idx),
            ena => BRAM_CTRL_INPUT_RAM_0_en,
            wea(0) => s_BRAM_CTRL_INPUT_RAM_0_we(idx),
            addra => BRAM_CTRL_INPUT_RAM_0_addr(11 downto 2),
            dina => BRAM_CTRL_INPUT_RAM_0_din,
            douta => s_BRAM_CTRL_INPUT_RAM_0_dout_arr(idx),
            
            clkb => clk_240_i,
            enb => '1',
            web(0) => '0', 
            addrb => s_INPUT_RAM_addr,
            dinb => x"00000000",
            doutb => s_INPUT_RAM_dout_arr(0 * 32 + idx)
          );
    end generate;

  s_BRAM_CTRL_INPUT_RAM_0_we(0)  <= '1' when ((BRAM_CTRL_INPUT_RAM_0_addr(16 downto 12) = "00000") and (BRAM_CTRL_INPUT_RAM_0_we = "1111")) else '0';
  s_BRAM_CTRL_INPUT_RAM_0_we(1)  <= '1' when ((BRAM_CTRL_INPUT_RAM_0_addr(16 downto 12) = "00001") and (BRAM_CTRL_INPUT_RAM_0_we = "1111")) else '0';
  s_BRAM_CTRL_INPUT_RAM_0_we(2)  <= '1' when ((BRAM_CTRL_INPUT_RAM_0_addr(16 downto 12) = "00010") and (BRAM_CTRL_INPUT_RAM_0_we = "1111")) else '0';
  s_BRAM_CTRL_INPUT_RAM_0_we(3)  <= '1' when ((BRAM_CTRL_INPUT_RAM_0_addr(16 downto 12) = "00011") and (BRAM_CTRL_INPUT_RAM_0_we = "1111")) else '0';
  s_BRAM_CTRL_INPUT_RAM_0_we(4)  <= '1' when ((BRAM_CTRL_INPUT_RAM_0_addr(16 downto 12) = "00100") and (BRAM_CTRL_INPUT_RAM_0_we = "1111")) else '0';
  s_BRAM_CTRL_INPUT_RAM_0_we(5)  <= '1' when ((BRAM_CTRL_INPUT_RAM_0_addr(16 downto 12) = "00101") and (BRAM_CTRL_INPUT_RAM_0_we = "1111")) else '0';
  s_BRAM_CTRL_INPUT_RAM_0_we(6)  <= '1' when ((BRAM_CTRL_INPUT_RAM_0_addr(16 downto 12) = "00110") and (BRAM_CTRL_INPUT_RAM_0_we = "1111")) else '0';
  s_BRAM_CTRL_INPUT_RAM_0_we(7)  <= '1' when ((BRAM_CTRL_INPUT_RAM_0_addr(16 downto 12) = "00111") and (BRAM_CTRL_INPUT_RAM_0_we = "1111")) else '0';
  s_BRAM_CTRL_INPUT_RAM_0_we(8)  <= '1' when ((BRAM_CTRL_INPUT_RAM_0_addr(16 downto 12) = "01000") and (BRAM_CTRL_INPUT_RAM_0_we = "1111")) else '0';
  s_BRAM_CTRL_INPUT_RAM_0_we(9)  <= '1' when ((BRAM_CTRL_INPUT_RAM_0_addr(16 downto 12) = "01001") and (BRAM_CTRL_INPUT_RAM_0_we = "1111")) else '0';
  s_BRAM_CTRL_INPUT_RAM_0_we(10) <= '1' when ((BRAM_CTRL_INPUT_RAM_0_addr(16 downto 12) = "01010") and (BRAM_CTRL_INPUT_RAM_0_we = "1111")) else '0';
  s_BRAM_CTRL_INPUT_RAM_0_we(11) <= '1' when ((BRAM_CTRL_INPUT_RAM_0_addr(16 downto 12) = "01011") and (BRAM_CTRL_INPUT_RAM_0_we = "1111")) else '0';
  s_BRAM_CTRL_INPUT_RAM_0_we(12) <= '1' when ((BRAM_CTRL_INPUT_RAM_0_addr(16 downto 12) = "01100") and (BRAM_CTRL_INPUT_RAM_0_we = "1111")) else '0';
  s_BRAM_CTRL_INPUT_RAM_0_we(13) <= '1' when ((BRAM_CTRL_INPUT_RAM_0_addr(16 downto 12) = "01101") and (BRAM_CTRL_INPUT_RAM_0_we = "1111")) else '0';
  s_BRAM_CTRL_INPUT_RAM_0_we(14) <= '1' when ((BRAM_CTRL_INPUT_RAM_0_addr(16 downto 12) = "01110") and (BRAM_CTRL_INPUT_RAM_0_we = "1111")) else '0';
  s_BRAM_CTRL_INPUT_RAM_0_we(15) <= '1' when ((BRAM_CTRL_INPUT_RAM_0_addr(16 downto 12) = "01111") and (BRAM_CTRL_INPUT_RAM_0_we = "1111")) else '0';
  s_BRAM_CTRL_INPUT_RAM_0_we(16) <= '1' when ((BRAM_CTRL_INPUT_RAM_0_addr(16 downto 12) = "10000") and (BRAM_CTRL_INPUT_RAM_0_we = "1111")) else '0';
  s_BRAM_CTRL_INPUT_RAM_0_we(17) <= '1' when ((BRAM_CTRL_INPUT_RAM_0_addr(16 downto 12) = "10001") and (BRAM_CTRL_INPUT_RAM_0_we = "1111")) else '0';
  s_BRAM_CTRL_INPUT_RAM_0_we(18) <= '1' when ((BRAM_CTRL_INPUT_RAM_0_addr(16 downto 12) = "10010") and (BRAM_CTRL_INPUT_RAM_0_we = "1111")) else '0';
  s_BRAM_CTRL_INPUT_RAM_0_we(19) <= '1' when ((BRAM_CTRL_INPUT_RAM_0_addr(16 downto 12) = "10011") and (BRAM_CTRL_INPUT_RAM_0_we = "1111")) else '0';
  s_BRAM_CTRL_INPUT_RAM_0_we(20) <= '1' when ((BRAM_CTRL_INPUT_RAM_0_addr(16 downto 12) = "10100") and (BRAM_CTRL_INPUT_RAM_0_we = "1111")) else '0';
  s_BRAM_CTRL_INPUT_RAM_0_we(21) <= '1' when ((BRAM_CTRL_INPUT_RAM_0_addr(16 downto 12) = "10101") and (BRAM_CTRL_INPUT_RAM_0_we = "1111")) else '0';
  s_BRAM_CTRL_INPUT_RAM_0_we(22) <= '1' when ((BRAM_CTRL_INPUT_RAM_0_addr(16 downto 12) = "10110") and (BRAM_CTRL_INPUT_RAM_0_we = "1111")) else '0';
  s_BRAM_CTRL_INPUT_RAM_0_we(23) <= '1' when ((BRAM_CTRL_INPUT_RAM_0_addr(16 downto 12) = "10111") and (BRAM_CTRL_INPUT_RAM_0_we = "1111")) else '0';
  s_BRAM_CTRL_INPUT_RAM_0_we(24) <= '1' when ((BRAM_CTRL_INPUT_RAM_0_addr(16 downto 12) = "11000") and (BRAM_CTRL_INPUT_RAM_0_we = "1111")) else '0';
  s_BRAM_CTRL_INPUT_RAM_0_we(25) <= '1' when ((BRAM_CTRL_INPUT_RAM_0_addr(16 downto 12) = "11001") and (BRAM_CTRL_INPUT_RAM_0_we = "1111")) else '0';
  s_BRAM_CTRL_INPUT_RAM_0_we(26) <= '1' when ((BRAM_CTRL_INPUT_RAM_0_addr(16 downto 12) = "11010") and (BRAM_CTRL_INPUT_RAM_0_we = "1111")) else '0';
  s_BRAM_CTRL_INPUT_RAM_0_we(27) <= '1' when ((BRAM_CTRL_INPUT_RAM_0_addr(16 downto 12) = "11011") and (BRAM_CTRL_INPUT_RAM_0_we = "1111")) else '0';
  s_BRAM_CTRL_INPUT_RAM_0_we(28) <= '1' when ((BRAM_CTRL_INPUT_RAM_0_addr(16 downto 12) = "11100") and (BRAM_CTRL_INPUT_RAM_0_we = "1111")) else '0';
  s_BRAM_CTRL_INPUT_RAM_0_we(29) <= '1' when ((BRAM_CTRL_INPUT_RAM_0_addr(16 downto 12) = "11101") and (BRAM_CTRL_INPUT_RAM_0_we = "1111")) else '0';
  s_BRAM_CTRL_INPUT_RAM_0_we(30) <= '1' when ((BRAM_CTRL_INPUT_RAM_0_addr(16 downto 12) = "11110") and (BRAM_CTRL_INPUT_RAM_0_we = "1111")) else '0';
  s_BRAM_CTRL_INPUT_RAM_0_we(31) <= '1' when ((BRAM_CTRL_INPUT_RAM_0_addr(16 downto 12) = "11111") and (BRAM_CTRL_INPUT_RAM_0_we = "1111")) else '0';

  process(BRAM_CTRL_INPUT_RAM_0_addr(16 downto 12))
  begin
    case(BRAM_CTRL_INPUT_RAM_0_addr(16 downto 12)) is

        when "00000" => s_BRAM_CTRL_INPUT_RAM_0_rst <= "11111111111111111111111111111110";
        when "00001" => s_BRAM_CTRL_INPUT_RAM_0_rst <= "11111111111111111111111111111101";
        when "00010" => s_BRAM_CTRL_INPUT_RAM_0_rst <= "11111111111111111111111111111011";
        when "00011" => s_BRAM_CTRL_INPUT_RAM_0_rst <= "11111111111111111111111111110111";
        when "00100" => s_BRAM_CTRL_INPUT_RAM_0_rst <= "11111111111111111111111111101111";
        when "00101" => s_BRAM_CTRL_INPUT_RAM_0_rst <= "11111111111111111111111111011111";
        when "00110" => s_BRAM_CTRL_INPUT_RAM_0_rst <= "11111111111111111111111110111111";
        when "00111" => s_BRAM_CTRL_INPUT_RAM_0_rst <= "11111111111111111111111101111111";
        when "01000" => s_BRAM_CTRL_INPUT_RAM_0_rst <= "11111111111111111111111011111111";
        when "01001" => s_BRAM_CTRL_INPUT_RAM_0_rst <= "11111111111111111111110111111111";
        when "01010" => s_BRAM_CTRL_INPUT_RAM_0_rst <= "11111111111111111111101111111111";
        when "01011" => s_BRAM_CTRL_INPUT_RAM_0_rst <= "11111111111111111111011111111111";
        when "01100" => s_BRAM_CTRL_INPUT_RAM_0_rst <= "11111111111111111110111111111111";
        when "01101" => s_BRAM_CTRL_INPUT_RAM_0_rst <= "11111111111111111101111111111111";
        when "01110" => s_BRAM_CTRL_INPUT_RAM_0_rst <= "11111111111111111011111111111111";
        when "01111" => s_BRAM_CTRL_INPUT_RAM_0_rst <= "11111111111111110111111111111111";
        when "10000" => s_BRAM_CTRL_INPUT_RAM_0_rst <= "11111111111111101111111111111111";
        when "10001" => s_BRAM_CTRL_INPUT_RAM_0_rst <= "11111111111111011111111111111111";
        when "10010" => s_BRAM_CTRL_INPUT_RAM_0_rst <= "11111111111110111111111111111111";
        when "10011" => s_BRAM_CTRL_INPUT_RAM_0_rst <= "11111111111101111111111111111111";
        when "10100" => s_BRAM_CTRL_INPUT_RAM_0_rst <= "11111111111011111111111111111111";
        when "10101" => s_BRAM_CTRL_INPUT_RAM_0_rst <= "11111111110111111111111111111111";
        when "10110" => s_BRAM_CTRL_INPUT_RAM_0_rst <= "11111111101111111111111111111111";
        when "10111" => s_BRAM_CTRL_INPUT_RAM_0_rst <= "11111111011111111111111111111111";
        when "11000" => s_BRAM_CTRL_INPUT_RAM_0_rst <= "11111110111111111111111111111111";
        when "11001" => s_BRAM_CTRL_INPUT_RAM_0_rst <= "11111101111111111111111111111111";
        when "11010" => s_BRAM_CTRL_INPUT_RAM_0_rst <= "11111011111111111111111111111111";
        when "11011" => s_BRAM_CTRL_INPUT_RAM_0_rst <= "11110111111111111111111111111111";
        when "11100" => s_BRAM_CTRL_INPUT_RAM_0_rst <= "11101111111111111111111111111111";
        when "11101" => s_BRAM_CTRL_INPUT_RAM_0_rst <= "11011111111111111111111111111111";
        when "11110" => s_BRAM_CTRL_INPUT_RAM_0_rst <= "10111111111111111111111111111111";
        when  others => s_BRAM_CTRL_INPUT_RAM_0_rst <= "01111111111111111111111111111111";

  end case;
end process;


gen_INPUT_RAM_0_dout :
  for j in 0 to 31 generate
    BRAM_CTRL_INPUT_RAM_0_dout(j) <=
      s_BRAM_CTRL_INPUT_RAM_0_dout_arr(0)(j) or
      s_BRAM_CTRL_INPUT_RAM_0_dout_arr(1)(j) or
      s_BRAM_CTRL_INPUT_RAM_0_dout_arr(2)(j) or
      s_BRAM_CTRL_INPUT_RAM_0_dout_arr(3)(j) or
      s_BRAM_CTRL_INPUT_RAM_0_dout_arr(4)(j) or
      s_BRAM_CTRL_INPUT_RAM_0_dout_arr(5)(j) or
      s_BRAM_CTRL_INPUT_RAM_0_dout_arr(6)(j) or
      s_BRAM_CTRL_INPUT_RAM_0_dout_arr(7)(j) or
      s_BRAM_CTRL_INPUT_RAM_0_dout_arr(8)(j) or
      s_BRAM_CTRL_INPUT_RAM_0_dout_arr(9)(j) or
      s_BRAM_CTRL_INPUT_RAM_0_dout_arr(10)(j) or
      s_BRAM_CTRL_INPUT_RAM_0_dout_arr(11)(j) or
      s_BRAM_CTRL_INPUT_RAM_0_dout_arr(12)(j) or
      s_BRAM_CTRL_INPUT_RAM_0_dout_arr(13)(j) or
      s_BRAM_CTRL_INPUT_RAM_0_dout_arr(14)(j) or
      s_BRAM_CTRL_INPUT_RAM_0_dout_arr(15)(j) or
      s_BRAM_CTRL_INPUT_RAM_0_dout_arr(16)(j) or
      s_BRAM_CTRL_INPUT_RAM_0_dout_arr(17)(j) or
      s_BRAM_CTRL_INPUT_RAM_0_dout_arr(18)(j) or
      s_BRAM_CTRL_INPUT_RAM_0_dout_arr(19)(j) or
      s_BRAM_CTRL_INPUT_RAM_0_dout_arr(20)(j) or
      s_BRAM_CTRL_INPUT_RAM_0_dout_arr(21)(j) or
      s_BRAM_CTRL_INPUT_RAM_0_dout_arr(22)(j) or
      s_BRAM_CTRL_INPUT_RAM_0_dout_arr(23)(j) or
      s_BRAM_CTRL_INPUT_RAM_0_dout_arr(24)(j) or
      s_BRAM_CTRL_INPUT_RAM_0_dout_arr(25)(j) or
      s_BRAM_CTRL_INPUT_RAM_0_dout_arr(26)(j) or
      s_BRAM_CTRL_INPUT_RAM_0_dout_arr(27)(j) or
      s_BRAM_CTRL_INPUT_RAM_0_dout_arr(28)(j) or
      s_BRAM_CTRL_INPUT_RAM_0_dout_arr(29)(j) or
      s_BRAM_CTRL_INPUT_RAM_0_dout_arr(30)(j) or      
      s_BRAM_CTRL_INPUT_RAM_0_dout_arr(31)(j);

  end generate;

--------------

-----
-- INPUT_RAM_1
----

    gen_input_bRAM_1 : for idx in 0 to 31 generate
    
        input_bram : pattern_bram
          PORT MAP (
            clka => BRAM_CTRL_INPUT_RAM_1_clk,
            rsta => s_BRAM_CTRL_INPUT_RAM_1_rst(idx),
            ena => BRAM_CTRL_INPUT_RAM_1_en,
            wea(0) => s_BRAM_CTRL_INPUT_RAM_1_we(idx),
            addra => BRAM_CTRL_INPUT_RAM_1_addr(11 downto 2),
            dina => BRAM_CTRL_INPUT_RAM_1_din,
            douta => s_BRAM_CTRL_INPUT_RAM_1_dout_arr(idx),
            
            clkb => clk_240_i,
            enb => '1',
            web(0) => '0', 
            addrb => s_INPUT_RAM_addr,
            dinb => x"00000000",
            doutb => s_INPUT_RAM_dout_arr(1 * 32 + idx)
          );
    end generate;

  s_BRAM_CTRL_INPUT_RAM_1_we(0)  <= '1' when ((BRAM_CTRL_INPUT_RAM_1_addr(16 downto 12) = "00000") and (BRAM_CTRL_INPUT_RAM_1_we = "1111")) else '0';
  s_BRAM_CTRL_INPUT_RAM_1_we(1)  <= '1' when ((BRAM_CTRL_INPUT_RAM_1_addr(16 downto 12) = "00001") and (BRAM_CTRL_INPUT_RAM_1_we = "1111")) else '0';
  s_BRAM_CTRL_INPUT_RAM_1_we(2)  <= '1' when ((BRAM_CTRL_INPUT_RAM_1_addr(16 downto 12) = "00010") and (BRAM_CTRL_INPUT_RAM_1_we = "1111")) else '0';
  s_BRAM_CTRL_INPUT_RAM_1_we(3)  <= '1' when ((BRAM_CTRL_INPUT_RAM_1_addr(16 downto 12) = "00011") and (BRAM_CTRL_INPUT_RAM_1_we = "1111")) else '0';
  s_BRAM_CTRL_INPUT_RAM_1_we(4)  <= '1' when ((BRAM_CTRL_INPUT_RAM_1_addr(16 downto 12) = "00100") and (BRAM_CTRL_INPUT_RAM_1_we = "1111")) else '0';
  s_BRAM_CTRL_INPUT_RAM_1_we(5)  <= '1' when ((BRAM_CTRL_INPUT_RAM_1_addr(16 downto 12) = "00101") and (BRAM_CTRL_INPUT_RAM_1_we = "1111")) else '0';
  s_BRAM_CTRL_INPUT_RAM_1_we(6)  <= '1' when ((BRAM_CTRL_INPUT_RAM_1_addr(16 downto 12) = "00110") and (BRAM_CTRL_INPUT_RAM_1_we = "1111")) else '0';
  s_BRAM_CTRL_INPUT_RAM_1_we(7)  <= '1' when ((BRAM_CTRL_INPUT_RAM_1_addr(16 downto 12) = "00111") and (BRAM_CTRL_INPUT_RAM_1_we = "1111")) else '0';
  s_BRAM_CTRL_INPUT_RAM_1_we(8)  <= '1' when ((BRAM_CTRL_INPUT_RAM_1_addr(16 downto 12) = "01000") and (BRAM_CTRL_INPUT_RAM_1_we = "1111")) else '0';
  s_BRAM_CTRL_INPUT_RAM_1_we(9)  <= '1' when ((BRAM_CTRL_INPUT_RAM_1_addr(16 downto 12) = "01001") and (BRAM_CTRL_INPUT_RAM_1_we = "1111")) else '0';
  s_BRAM_CTRL_INPUT_RAM_1_we(10) <= '1' when ((BRAM_CTRL_INPUT_RAM_1_addr(16 downto 12) = "01010") and (BRAM_CTRL_INPUT_RAM_1_we = "1111")) else '0';
  s_BRAM_CTRL_INPUT_RAM_1_we(11) <= '1' when ((BRAM_CTRL_INPUT_RAM_1_addr(16 downto 12) = "01011") and (BRAM_CTRL_INPUT_RAM_1_we = "1111")) else '0';
  s_BRAM_CTRL_INPUT_RAM_1_we(12) <= '1' when ((BRAM_CTRL_INPUT_RAM_1_addr(16 downto 12) = "01100") and (BRAM_CTRL_INPUT_RAM_1_we = "1111")) else '0';
  s_BRAM_CTRL_INPUT_RAM_1_we(13) <= '1' when ((BRAM_CTRL_INPUT_RAM_1_addr(16 downto 12) = "01101") and (BRAM_CTRL_INPUT_RAM_1_we = "1111")) else '0';
  s_BRAM_CTRL_INPUT_RAM_1_we(14) <= '1' when ((BRAM_CTRL_INPUT_RAM_1_addr(16 downto 12) = "01110") and (BRAM_CTRL_INPUT_RAM_1_we = "1111")) else '0';
  s_BRAM_CTRL_INPUT_RAM_1_we(15) <= '1' when ((BRAM_CTRL_INPUT_RAM_1_addr(16 downto 12) = "01111") and (BRAM_CTRL_INPUT_RAM_1_we = "1111")) else '0';
  s_BRAM_CTRL_INPUT_RAM_1_we(16) <= '1' when ((BRAM_CTRL_INPUT_RAM_1_addr(16 downto 12) = "10000") and (BRAM_CTRL_INPUT_RAM_1_we = "1111")) else '0';
  s_BRAM_CTRL_INPUT_RAM_1_we(17) <= '1' when ((BRAM_CTRL_INPUT_RAM_1_addr(16 downto 12) = "10001") and (BRAM_CTRL_INPUT_RAM_1_we = "1111")) else '0';
  s_BRAM_CTRL_INPUT_RAM_1_we(18) <= '1' when ((BRAM_CTRL_INPUT_RAM_1_addr(16 downto 12) = "10010") and (BRAM_CTRL_INPUT_RAM_1_we = "1111")) else '0';
  s_BRAM_CTRL_INPUT_RAM_1_we(19) <= '1' when ((BRAM_CTRL_INPUT_RAM_1_addr(16 downto 12) = "10011") and (BRAM_CTRL_INPUT_RAM_1_we = "1111")) else '0';
  s_BRAM_CTRL_INPUT_RAM_1_we(20) <= '1' when ((BRAM_CTRL_INPUT_RAM_1_addr(16 downto 12) = "10100") and (BRAM_CTRL_INPUT_RAM_1_we = "1111")) else '0';
  s_BRAM_CTRL_INPUT_RAM_1_we(21) <= '1' when ((BRAM_CTRL_INPUT_RAM_1_addr(16 downto 12) = "10101") and (BRAM_CTRL_INPUT_RAM_1_we = "1111")) else '0';
  s_BRAM_CTRL_INPUT_RAM_1_we(22) <= '1' when ((BRAM_CTRL_INPUT_RAM_1_addr(16 downto 12) = "10110") and (BRAM_CTRL_INPUT_RAM_1_we = "1111")) else '0';
  s_BRAM_CTRL_INPUT_RAM_1_we(23) <= '1' when ((BRAM_CTRL_INPUT_RAM_1_addr(16 downto 12) = "10111") and (BRAM_CTRL_INPUT_RAM_1_we = "1111")) else '0';
  s_BRAM_CTRL_INPUT_RAM_1_we(24) <= '1' when ((BRAM_CTRL_INPUT_RAM_1_addr(16 downto 12) = "11000") and (BRAM_CTRL_INPUT_RAM_1_we = "1111")) else '0';
  s_BRAM_CTRL_INPUT_RAM_1_we(25) <= '1' when ((BRAM_CTRL_INPUT_RAM_1_addr(16 downto 12) = "11001") and (BRAM_CTRL_INPUT_RAM_1_we = "1111")) else '0';
  s_BRAM_CTRL_INPUT_RAM_1_we(26) <= '1' when ((BRAM_CTRL_INPUT_RAM_1_addr(16 downto 12) = "11010") and (BRAM_CTRL_INPUT_RAM_1_we = "1111")) else '0';
  s_BRAM_CTRL_INPUT_RAM_1_we(27) <= '1' when ((BRAM_CTRL_INPUT_RAM_1_addr(16 downto 12) = "11011") and (BRAM_CTRL_INPUT_RAM_1_we = "1111")) else '0';
  s_BRAM_CTRL_INPUT_RAM_1_we(28) <= '1' when ((BRAM_CTRL_INPUT_RAM_1_addr(16 downto 12) = "11100") and (BRAM_CTRL_INPUT_RAM_1_we = "1111")) else '0';
  s_BRAM_CTRL_INPUT_RAM_1_we(29) <= '1' when ((BRAM_CTRL_INPUT_RAM_1_addr(16 downto 12) = "11101") and (BRAM_CTRL_INPUT_RAM_1_we = "1111")) else '0';
  s_BRAM_CTRL_INPUT_RAM_1_we(30) <= '1' when ((BRAM_CTRL_INPUT_RAM_1_addr(16 downto 12) = "11110") and (BRAM_CTRL_INPUT_RAM_1_we = "1111")) else '0';
  s_BRAM_CTRL_INPUT_RAM_1_we(31) <= '1' when ((BRAM_CTRL_INPUT_RAM_1_addr(16 downto 12) = "11111") and (BRAM_CTRL_INPUT_RAM_1_we = "1111")) else '0';

  process(BRAM_CTRL_INPUT_RAM_1_addr(16 downto 12))
  begin
    case(BRAM_CTRL_INPUT_RAM_1_addr(16 downto 12)) is

        when "00000" => s_BRAM_CTRL_INPUT_RAM_1_rst <= "11111111111111111111111111111110";
        when "00001" => s_BRAM_CTRL_INPUT_RAM_1_rst <= "11111111111111111111111111111101";
        when "00010" => s_BRAM_CTRL_INPUT_RAM_1_rst <= "11111111111111111111111111111011";
        when "00011" => s_BRAM_CTRL_INPUT_RAM_1_rst <= "11111111111111111111111111110111";
        when "00100" => s_BRAM_CTRL_INPUT_RAM_1_rst <= "11111111111111111111111111101111";
        when "00101" => s_BRAM_CTRL_INPUT_RAM_1_rst <= "11111111111111111111111111011111";
        when "00110" => s_BRAM_CTRL_INPUT_RAM_1_rst <= "11111111111111111111111110111111";
        when "00111" => s_BRAM_CTRL_INPUT_RAM_1_rst <= "11111111111111111111111101111111";
        when "01000" => s_BRAM_CTRL_INPUT_RAM_1_rst <= "11111111111111111111111011111111";
        when "01001" => s_BRAM_CTRL_INPUT_RAM_1_rst <= "11111111111111111111110111111111";
        when "01010" => s_BRAM_CTRL_INPUT_RAM_1_rst <= "11111111111111111111101111111111";
        when "01011" => s_BRAM_CTRL_INPUT_RAM_1_rst <= "11111111111111111111011111111111";
        when "01100" => s_BRAM_CTRL_INPUT_RAM_1_rst <= "11111111111111111110111111111111";
        when "01101" => s_BRAM_CTRL_INPUT_RAM_1_rst <= "11111111111111111101111111111111";
        when "01110" => s_BRAM_CTRL_INPUT_RAM_1_rst <= "11111111111111111011111111111111";
        when "01111" => s_BRAM_CTRL_INPUT_RAM_1_rst <= "11111111111111110111111111111111";
        when "10000" => s_BRAM_CTRL_INPUT_RAM_1_rst <= "11111111111111101111111111111111";
        when "10001" => s_BRAM_CTRL_INPUT_RAM_1_rst <= "11111111111111011111111111111111";
        when "10010" => s_BRAM_CTRL_INPUT_RAM_1_rst <= "11111111111110111111111111111111";
        when "10011" => s_BRAM_CTRL_INPUT_RAM_1_rst <= "11111111111101111111111111111111";
        when "10100" => s_BRAM_CTRL_INPUT_RAM_1_rst <= "11111111111011111111111111111111";
        when "10101" => s_BRAM_CTRL_INPUT_RAM_1_rst <= "11111111110111111111111111111111";
        when "10110" => s_BRAM_CTRL_INPUT_RAM_1_rst <= "11111111101111111111111111111111";
        when "10111" => s_BRAM_CTRL_INPUT_RAM_1_rst <= "11111111011111111111111111111111";
        when "11000" => s_BRAM_CTRL_INPUT_RAM_1_rst <= "11111110111111111111111111111111";
        when "11001" => s_BRAM_CTRL_INPUT_RAM_1_rst <= "11111101111111111111111111111111";
        when "11010" => s_BRAM_CTRL_INPUT_RAM_1_rst <= "11111011111111111111111111111111";
        when "11011" => s_BRAM_CTRL_INPUT_RAM_1_rst <= "11110111111111111111111111111111";
        when "11100" => s_BRAM_CTRL_INPUT_RAM_1_rst <= "11101111111111111111111111111111";
        when "11101" => s_BRAM_CTRL_INPUT_RAM_1_rst <= "11011111111111111111111111111111";
        when "11110" => s_BRAM_CTRL_INPUT_RAM_1_rst <= "10111111111111111111111111111111";
        when  others => s_BRAM_CTRL_INPUT_RAM_1_rst <= "01111111111111111111111111111111";

  end case;
end process;


gen_INPUT_RAM_1_dout :
  for j in 0 to 31 generate
    BRAM_CTRL_INPUT_RAM_1_dout(j) <=
      s_BRAM_CTRL_INPUT_RAM_1_dout_arr(0)(j) or
      s_BRAM_CTRL_INPUT_RAM_1_dout_arr(1)(j) or
      s_BRAM_CTRL_INPUT_RAM_1_dout_arr(2)(j) or
      s_BRAM_CTRL_INPUT_RAM_1_dout_arr(3)(j) or
      s_BRAM_CTRL_INPUT_RAM_1_dout_arr(4)(j) or
      s_BRAM_CTRL_INPUT_RAM_1_dout_arr(5)(j) or
      s_BRAM_CTRL_INPUT_RAM_1_dout_arr(6)(j) or
      s_BRAM_CTRL_INPUT_RAM_1_dout_arr(7)(j) or
      s_BRAM_CTRL_INPUT_RAM_1_dout_arr(8)(j) or
      s_BRAM_CTRL_INPUT_RAM_1_dout_arr(9)(j) or
      s_BRAM_CTRL_INPUT_RAM_1_dout_arr(10)(j) or
      s_BRAM_CTRL_INPUT_RAM_1_dout_arr(11)(j) or
      s_BRAM_CTRL_INPUT_RAM_1_dout_arr(12)(j) or
      s_BRAM_CTRL_INPUT_RAM_1_dout_arr(13)(j) or
      s_BRAM_CTRL_INPUT_RAM_1_dout_arr(14)(j) or
      s_BRAM_CTRL_INPUT_RAM_1_dout_arr(15)(j) or
      s_BRAM_CTRL_INPUT_RAM_1_dout_arr(16)(j) or
      s_BRAM_CTRL_INPUT_RAM_1_dout_arr(17)(j) or
      s_BRAM_CTRL_INPUT_RAM_1_dout_arr(18)(j) or
      s_BRAM_CTRL_INPUT_RAM_1_dout_arr(19)(j) or
      s_BRAM_CTRL_INPUT_RAM_1_dout_arr(20)(j) or
      s_BRAM_CTRL_INPUT_RAM_1_dout_arr(21)(j) or
      s_BRAM_CTRL_INPUT_RAM_1_dout_arr(22)(j) or
      s_BRAM_CTRL_INPUT_RAM_1_dout_arr(23)(j) or
      s_BRAM_CTRL_INPUT_RAM_1_dout_arr(24)(j) or
      s_BRAM_CTRL_INPUT_RAM_1_dout_arr(25)(j) or
      s_BRAM_CTRL_INPUT_RAM_1_dout_arr(26)(j) or
      s_BRAM_CTRL_INPUT_RAM_1_dout_arr(27)(j) or
      s_BRAM_CTRL_INPUT_RAM_1_dout_arr(28)(j) or
      s_BRAM_CTRL_INPUT_RAM_1_dout_arr(29)(j) or
      s_BRAM_CTRL_INPUT_RAM_1_dout_arr(30)(j) or      
      s_BRAM_CTRL_INPUT_RAM_1_dout_arr(31)(j);

  end generate;

--------------

-----
-- INPUT_RAM_2
----

    gen_input_bRAM_2 : for idx in 0 to 2 generate
    
        input_bram : pattern_bram
          PORT MAP (
            clka => BRAM_CTRL_INPUT_RAM_2_clk,
            rsta => s_BRAM_CTRL_INPUT_RAM_2_rst(idx),
            ena => BRAM_CTRL_INPUT_RAM_2_en,
            wea(0) => s_BRAM_CTRL_INPUT_RAM_2_we(idx),
            addra => BRAM_CTRL_INPUT_RAM_2_addr(11 downto 2),
            dina => BRAM_CTRL_INPUT_RAM_2_din,
            douta => s_BRAM_CTRL_INPUT_RAM_2_dout_arr(idx),
            
            clkb => clk_240_i,
            enb => '1',
            web(0) => '0', 
            addrb => s_INPUT_RAM_addr,
            dinb => x"00000000",
            doutb => s_INPUT_RAM_dout_arr(2 * 32 + idx)
          );
    end generate;

  s_BRAM_CTRL_INPUT_RAM_2_we(0)  <= '1' when ((BRAM_CTRL_INPUT_RAM_2_addr(16 downto 12) = "00000") and (BRAM_CTRL_INPUT_RAM_2_we = "1111")) else '0';
  s_BRAM_CTRL_INPUT_RAM_2_we(1)  <= '1' when ((BRAM_CTRL_INPUT_RAM_2_addr(16 downto 12) = "00001") and (BRAM_CTRL_INPUT_RAM_2_we = "1111")) else '0';
  s_BRAM_CTRL_INPUT_RAM_2_we(2)  <= '1' when ((BRAM_CTRL_INPUT_RAM_2_addr(16 downto 12) = "00010") and (BRAM_CTRL_INPUT_RAM_2_we = "1111")) else '0';
 
  process(BRAM_CTRL_INPUT_RAM_2_addr(16 downto 12))
  begin
    case(BRAM_CTRL_INPUT_RAM_2_addr(16 downto 12)) is

        when "00000" => s_BRAM_CTRL_INPUT_RAM_2_rst <= "110";
        when "00001" => s_BRAM_CTRL_INPUT_RAM_2_rst <= "101";
        when "00010" => s_BRAM_CTRL_INPUT_RAM_2_rst <= "011";
        when  others => s_BRAM_CTRL_INPUT_RAM_2_rst <= "111";

  end case;
end process;


gen_INPUT_RAM_2_dout :
  for j in 0 to 31 generate
    BRAM_CTRL_INPUT_RAM_2_dout(j) <=
      s_BRAM_CTRL_INPUT_RAM_2_dout_arr(0)(j) or
      s_BRAM_CTRL_INPUT_RAM_2_dout_arr(1)(j) or
      s_BRAM_CTRL_INPUT_RAM_2_dout_arr(2)(j);

  end generate;

--------------

-----
-- OUTPUT_RAM_0
----

    gen_OUTPUT_bram_0 : for idx in 0 to 31 generate
    
        OUTPUT_bram : pattern_bram
          PORT MAP (
            clka => BRAM_CTRL_OUTPUT_RAM_0_clk,
            rsta => s_BRAM_CTRL_OUTPUT_RAM_0_rst(idx),
            ena => BRAM_CTRL_OUTPUT_RAM_0_en,
            wea(0) => s_BRAM_CTRL_OUTPUT_RAM_0_we(idx),
            addra => BRAM_CTRL_OUTPUT_RAM_0_addr(11 downto 2),
            dina => BRAM_CTRL_OUTPUT_RAM_0_din,
            douta => s_BRAM_CTRL_OUTPUT_RAM_0_dout_arr(idx),
            
            clkb => clk_240_i,
            enb => '1',
            web(0) => s_OUTPUT_RAM_we, 
            addrb => s_OUTPUT_RAM_addr,
            dinb => s_OUTPUT_RAM_din_arr(0 * 32 + idx),
            doutb => open
          );
    end generate;

  s_BRAM_CTRL_OUTPUT_RAM_0_we(0)  <= '1' when ((BRAM_CTRL_OUTPUT_RAM_0_addr(16 downto 12) = "00000") and (BRAM_CTRL_OUTPUT_RAM_0_we = "1111")) else '0';
  s_BRAM_CTRL_OUTPUT_RAM_0_we(1)  <= '1' when ((BRAM_CTRL_OUTPUT_RAM_0_addr(16 downto 12) = "00001") and (BRAM_CTRL_OUTPUT_RAM_0_we = "1111")) else '0';
  s_BRAM_CTRL_OUTPUT_RAM_0_we(2)  <= '1' when ((BRAM_CTRL_OUTPUT_RAM_0_addr(16 downto 12) = "00010") and (BRAM_CTRL_OUTPUT_RAM_0_we = "1111")) else '0';
  s_BRAM_CTRL_OUTPUT_RAM_0_we(3)  <= '1' when ((BRAM_CTRL_OUTPUT_RAM_0_addr(16 downto 12) = "00011") and (BRAM_CTRL_OUTPUT_RAM_0_we = "1111")) else '0';
  s_BRAM_CTRL_OUTPUT_RAM_0_we(4)  <= '1' when ((BRAM_CTRL_OUTPUT_RAM_0_addr(16 downto 12) = "00100") and (BRAM_CTRL_OUTPUT_RAM_0_we = "1111")) else '0';
  s_BRAM_CTRL_OUTPUT_RAM_0_we(5)  <= '1' when ((BRAM_CTRL_OUTPUT_RAM_0_addr(16 downto 12) = "00101") and (BRAM_CTRL_OUTPUT_RAM_0_we = "1111")) else '0';
  s_BRAM_CTRL_OUTPUT_RAM_0_we(6)  <= '1' when ((BRAM_CTRL_OUTPUT_RAM_0_addr(16 downto 12) = "00110") and (BRAM_CTRL_OUTPUT_RAM_0_we = "1111")) else '0';
  s_BRAM_CTRL_OUTPUT_RAM_0_we(7)  <= '1' when ((BRAM_CTRL_OUTPUT_RAM_0_addr(16 downto 12) = "00111") and (BRAM_CTRL_OUTPUT_RAM_0_we = "1111")) else '0';
  s_BRAM_CTRL_OUTPUT_RAM_0_we(8)  <= '1' when ((BRAM_CTRL_OUTPUT_RAM_0_addr(16 downto 12) = "01000") and (BRAM_CTRL_OUTPUT_RAM_0_we = "1111")) else '0';
  s_BRAM_CTRL_OUTPUT_RAM_0_we(9)  <= '1' when ((BRAM_CTRL_OUTPUT_RAM_0_addr(16 downto 12) = "01001") and (BRAM_CTRL_OUTPUT_RAM_0_we = "1111")) else '0';
  s_BRAM_CTRL_OUTPUT_RAM_0_we(10) <= '1' when ((BRAM_CTRL_OUTPUT_RAM_0_addr(16 downto 12) = "01010") and (BRAM_CTRL_OUTPUT_RAM_0_we = "1111")) else '0';
  s_BRAM_CTRL_OUTPUT_RAM_0_we(11) <= '1' when ((BRAM_CTRL_OUTPUT_RAM_0_addr(16 downto 12) = "01011") and (BRAM_CTRL_OUTPUT_RAM_0_we = "1111")) else '0';
  s_BRAM_CTRL_OUTPUT_RAM_0_we(12) <= '1' when ((BRAM_CTRL_OUTPUT_RAM_0_addr(16 downto 12) = "01100") and (BRAM_CTRL_OUTPUT_RAM_0_we = "1111")) else '0';
  s_BRAM_CTRL_OUTPUT_RAM_0_we(13) <= '1' when ((BRAM_CTRL_OUTPUT_RAM_0_addr(16 downto 12) = "01101") and (BRAM_CTRL_OUTPUT_RAM_0_we = "1111")) else '0';
  s_BRAM_CTRL_OUTPUT_RAM_0_we(14) <= '1' when ((BRAM_CTRL_OUTPUT_RAM_0_addr(16 downto 12) = "01110") and (BRAM_CTRL_OUTPUT_RAM_0_we = "1111")) else '0';
  s_BRAM_CTRL_OUTPUT_RAM_0_we(15) <= '1' when ((BRAM_CTRL_OUTPUT_RAM_0_addr(16 downto 12) = "01111") and (BRAM_CTRL_OUTPUT_RAM_0_we = "1111")) else '0';
  s_BRAM_CTRL_OUTPUT_RAM_0_we(16) <= '1' when ((BRAM_CTRL_OUTPUT_RAM_0_addr(16 downto 12) = "10000") and (BRAM_CTRL_OUTPUT_RAM_0_we = "1111")) else '0';
  s_BRAM_CTRL_OUTPUT_RAM_0_we(17) <= '1' when ((BRAM_CTRL_OUTPUT_RAM_0_addr(16 downto 12) = "10001") and (BRAM_CTRL_OUTPUT_RAM_0_we = "1111")) else '0';
  s_BRAM_CTRL_OUTPUT_RAM_0_we(18) <= '1' when ((BRAM_CTRL_OUTPUT_RAM_0_addr(16 downto 12) = "10010") and (BRAM_CTRL_OUTPUT_RAM_0_we = "1111")) else '0';
  s_BRAM_CTRL_OUTPUT_RAM_0_we(19) <= '1' when ((BRAM_CTRL_OUTPUT_RAM_0_addr(16 downto 12) = "10011") and (BRAM_CTRL_OUTPUT_RAM_0_we = "1111")) else '0';
  s_BRAM_CTRL_OUTPUT_RAM_0_we(20) <= '1' when ((BRAM_CTRL_OUTPUT_RAM_0_addr(16 downto 12) = "10100") and (BRAM_CTRL_OUTPUT_RAM_0_we = "1111")) else '0';
  s_BRAM_CTRL_OUTPUT_RAM_0_we(21) <= '1' when ((BRAM_CTRL_OUTPUT_RAM_0_addr(16 downto 12) = "10101") and (BRAM_CTRL_OUTPUT_RAM_0_we = "1111")) else '0';
  s_BRAM_CTRL_OUTPUT_RAM_0_we(22) <= '1' when ((BRAM_CTRL_OUTPUT_RAM_0_addr(16 downto 12) = "10110") and (BRAM_CTRL_OUTPUT_RAM_0_we = "1111")) else '0';
  s_BRAM_CTRL_OUTPUT_RAM_0_we(23) <= '1' when ((BRAM_CTRL_OUTPUT_RAM_0_addr(16 downto 12) = "10111") and (BRAM_CTRL_OUTPUT_RAM_0_we = "1111")) else '0';
  s_BRAM_CTRL_OUTPUT_RAM_0_we(24) <= '1' when ((BRAM_CTRL_OUTPUT_RAM_0_addr(16 downto 12) = "11000") and (BRAM_CTRL_OUTPUT_RAM_0_we = "1111")) else '0';
  s_BRAM_CTRL_OUTPUT_RAM_0_we(25) <= '1' when ((BRAM_CTRL_OUTPUT_RAM_0_addr(16 downto 12) = "11001") and (BRAM_CTRL_OUTPUT_RAM_0_we = "1111")) else '0';
  s_BRAM_CTRL_OUTPUT_RAM_0_we(26) <= '1' when ((BRAM_CTRL_OUTPUT_RAM_0_addr(16 downto 12) = "11010") and (BRAM_CTRL_OUTPUT_RAM_0_we = "1111")) else '0';
  s_BRAM_CTRL_OUTPUT_RAM_0_we(27) <= '1' when ((BRAM_CTRL_OUTPUT_RAM_0_addr(16 downto 12) = "11011") and (BRAM_CTRL_OUTPUT_RAM_0_we = "1111")) else '0';
  s_BRAM_CTRL_OUTPUT_RAM_0_we(28) <= '1' when ((BRAM_CTRL_OUTPUT_RAM_0_addr(16 downto 12) = "11100") and (BRAM_CTRL_OUTPUT_RAM_0_we = "1111")) else '0';
  s_BRAM_CTRL_OUTPUT_RAM_0_we(29) <= '1' when ((BRAM_CTRL_OUTPUT_RAM_0_addr(16 downto 12) = "11101") and (BRAM_CTRL_OUTPUT_RAM_0_we = "1111")) else '0';
  s_BRAM_CTRL_OUTPUT_RAM_0_we(30) <= '1' when ((BRAM_CTRL_OUTPUT_RAM_0_addr(16 downto 12) = "11110") and (BRAM_CTRL_OUTPUT_RAM_0_we = "1111")) else '0';
  s_BRAM_CTRL_OUTPUT_RAM_0_we(31) <= '1' when ((BRAM_CTRL_OUTPUT_RAM_0_addr(16 downto 12) = "11111") and (BRAM_CTRL_OUTPUT_RAM_0_we = "1111")) else '0';

  process(BRAM_CTRL_OUTPUT_RAM_0_addr(16 downto 12))
  begin
    case(BRAM_CTRL_OUTPUT_RAM_0_addr(16 downto 12)) is

        when "00000" => s_BRAM_CTRL_OUTPUT_RAM_0_rst <= "11111111111111111111111111111110";
        when "00001" => s_BRAM_CTRL_OUTPUT_RAM_0_rst <= "11111111111111111111111111111101";
        when "00010" => s_BRAM_CTRL_OUTPUT_RAM_0_rst <= "11111111111111111111111111111011";
        when "00011" => s_BRAM_CTRL_OUTPUT_RAM_0_rst <= "11111111111111111111111111110111";
        when "00100" => s_BRAM_CTRL_OUTPUT_RAM_0_rst <= "11111111111111111111111111101111";
        when "00101" => s_BRAM_CTRL_OUTPUT_RAM_0_rst <= "11111111111111111111111111011111";
        when "00110" => s_BRAM_CTRL_OUTPUT_RAM_0_rst <= "11111111111111111111111110111111";
        when "00111" => s_BRAM_CTRL_OUTPUT_RAM_0_rst <= "11111111111111111111111101111111";
        when "01000" => s_BRAM_CTRL_OUTPUT_RAM_0_rst <= "11111111111111111111111011111111";
        when "01001" => s_BRAM_CTRL_OUTPUT_RAM_0_rst <= "11111111111111111111110111111111";
        when "01010" => s_BRAM_CTRL_OUTPUT_RAM_0_rst <= "11111111111111111111101111111111";
        when "01011" => s_BRAM_CTRL_OUTPUT_RAM_0_rst <= "11111111111111111111011111111111";
        when "01100" => s_BRAM_CTRL_OUTPUT_RAM_0_rst <= "11111111111111111110111111111111";
        when "01101" => s_BRAM_CTRL_OUTPUT_RAM_0_rst <= "11111111111111111101111111111111";
        when "01110" => s_BRAM_CTRL_OUTPUT_RAM_0_rst <= "11111111111111111011111111111111";
        when "01111" => s_BRAM_CTRL_OUTPUT_RAM_0_rst <= "11111111111111110111111111111111";
        when "10000" => s_BRAM_CTRL_OUTPUT_RAM_0_rst <= "11111111111111101111111111111111";
        when "10001" => s_BRAM_CTRL_OUTPUT_RAM_0_rst <= "11111111111111011111111111111111";
        when "10010" => s_BRAM_CTRL_OUTPUT_RAM_0_rst <= "11111111111110111111111111111111";
        when "10011" => s_BRAM_CTRL_OUTPUT_RAM_0_rst <= "11111111111101111111111111111111";
        when "10100" => s_BRAM_CTRL_OUTPUT_RAM_0_rst <= "11111111111011111111111111111111";
        when "10101" => s_BRAM_CTRL_OUTPUT_RAM_0_rst <= "11111111110111111111111111111111";
        when "10110" => s_BRAM_CTRL_OUTPUT_RAM_0_rst <= "11111111101111111111111111111111";
        when "10111" => s_BRAM_CTRL_OUTPUT_RAM_0_rst <= "11111111011111111111111111111111";
        when "11000" => s_BRAM_CTRL_OUTPUT_RAM_0_rst <= "11111110111111111111111111111111";
        when "11001" => s_BRAM_CTRL_OUTPUT_RAM_0_rst <= "11111101111111111111111111111111";
        when "11010" => s_BRAM_CTRL_OUTPUT_RAM_0_rst <= "11111011111111111111111111111111";
        when "11011" => s_BRAM_CTRL_OUTPUT_RAM_0_rst <= "11110111111111111111111111111111";
        when "11100" => s_BRAM_CTRL_OUTPUT_RAM_0_rst <= "11101111111111111111111111111111";
        when "11101" => s_BRAM_CTRL_OUTPUT_RAM_0_rst <= "11011111111111111111111111111111";
        when "11110" => s_BRAM_CTRL_OUTPUT_RAM_0_rst <= "10111111111111111111111111111111";
        when  others => s_BRAM_CTRL_OUTPUT_RAM_0_rst <= "01111111111111111111111111111111";

  end case;
end process;


gen_OUTPUT_RAM_0_dout :
  for j in 0 to 31 generate
    BRAM_CTRL_OUTPUT_RAM_0_dout(j) <=
      s_BRAM_CTRL_OUTPUT_RAM_0_dout_arr(0)(j) or
      s_BRAM_CTRL_OUTPUT_RAM_0_dout_arr(1)(j) or
      s_BRAM_CTRL_OUTPUT_RAM_0_dout_arr(2)(j) or
      s_BRAM_CTRL_OUTPUT_RAM_0_dout_arr(3)(j) or
      s_BRAM_CTRL_OUTPUT_RAM_0_dout_arr(4)(j) or
      s_BRAM_CTRL_OUTPUT_RAM_0_dout_arr(5)(j) or
      s_BRAM_CTRL_OUTPUT_RAM_0_dout_arr(6)(j) or
      s_BRAM_CTRL_OUTPUT_RAM_0_dout_arr(7)(j) or
      s_BRAM_CTRL_OUTPUT_RAM_0_dout_arr(8)(j) or
      s_BRAM_CTRL_OUTPUT_RAM_0_dout_arr(9)(j) or
      s_BRAM_CTRL_OUTPUT_RAM_0_dout_arr(10)(j) or
      s_BRAM_CTRL_OUTPUT_RAM_0_dout_arr(11)(j) or
      s_BRAM_CTRL_OUTPUT_RAM_0_dout_arr(12)(j) or
      s_BRAM_CTRL_OUTPUT_RAM_0_dout_arr(13)(j) or
      s_BRAM_CTRL_OUTPUT_RAM_0_dout_arr(14)(j) or
      s_BRAM_CTRL_OUTPUT_RAM_0_dout_arr(15)(j) or
      s_BRAM_CTRL_OUTPUT_RAM_0_dout_arr(16)(j) or
      s_BRAM_CTRL_OUTPUT_RAM_0_dout_arr(17)(j) or
      s_BRAM_CTRL_OUTPUT_RAM_0_dout_arr(18)(j) or
      s_BRAM_CTRL_OUTPUT_RAM_0_dout_arr(19)(j) or
      s_BRAM_CTRL_OUTPUT_RAM_0_dout_arr(20)(j) or
      s_BRAM_CTRL_OUTPUT_RAM_0_dout_arr(21)(j) or
      s_BRAM_CTRL_OUTPUT_RAM_0_dout_arr(22)(j) or
      s_BRAM_CTRL_OUTPUT_RAM_0_dout_arr(23)(j) or
      s_BRAM_CTRL_OUTPUT_RAM_0_dout_arr(24)(j) or
      s_BRAM_CTRL_OUTPUT_RAM_0_dout_arr(25)(j) or
      s_BRAM_CTRL_OUTPUT_RAM_0_dout_arr(26)(j) or
      s_BRAM_CTRL_OUTPUT_RAM_0_dout_arr(27)(j) or
      s_BRAM_CTRL_OUTPUT_RAM_0_dout_arr(28)(j) or
      s_BRAM_CTRL_OUTPUT_RAM_0_dout_arr(29)(j) or
      s_BRAM_CTRL_OUTPUT_RAM_0_dout_arr(30)(j) or      
      s_BRAM_CTRL_OUTPUT_RAM_0_dout_arr(31)(j);

  end generate;

--------------

-----
-- OUTPUT_RAM_1
----

    gen_OUTPUT_bRAM_1 : for idx in 0 to 15 generate
    
        OUTPUT_bram : pattern_bram
          PORT MAP (
            clka => BRAM_CTRL_OUTPUT_RAM_1_clk,
            rsta => s_BRAM_CTRL_OUTPUT_RAM_1_rst(idx),
            ena => BRAM_CTRL_OUTPUT_RAM_1_en,
            wea(0) => s_BRAM_CTRL_OUTPUT_RAM_1_we(idx),
            addra => BRAM_CTRL_OUTPUT_RAM_1_addr(11 downto 2),
            dina => BRAM_CTRL_OUTPUT_RAM_1_din,
            douta => s_BRAM_CTRL_OUTPUT_RAM_1_dout_arr(idx),
            
            clkb => clk_240_i,
            enb => '1',
            web(0) => s_OUTPUT_RAM_we, 
            addrb => s_OUTPUT_RAM_addr,
            dinb => s_OUTPUT_RAM_din_arr(1 * 32 + idx),
            doutb => open
          );
    end generate;

  s_BRAM_CTRL_OUTPUT_RAM_1_we(0)  <= '1' when ((BRAM_CTRL_OUTPUT_RAM_1_addr(16 downto 12) = "00000") and (BRAM_CTRL_OUTPUT_RAM_1_we = "1111")) else '0';
  s_BRAM_CTRL_OUTPUT_RAM_1_we(1)  <= '1' when ((BRAM_CTRL_OUTPUT_RAM_1_addr(16 downto 12) = "00001") and (BRAM_CTRL_OUTPUT_RAM_1_we = "1111")) else '0';
  s_BRAM_CTRL_OUTPUT_RAM_1_we(2)  <= '1' when ((BRAM_CTRL_OUTPUT_RAM_1_addr(16 downto 12) = "00010") and (BRAM_CTRL_OUTPUT_RAM_1_we = "1111")) else '0';
  s_BRAM_CTRL_OUTPUT_RAM_1_we(3)  <= '1' when ((BRAM_CTRL_OUTPUT_RAM_1_addr(16 downto 12) = "00011") and (BRAM_CTRL_OUTPUT_RAM_1_we = "1111")) else '0';
  s_BRAM_CTRL_OUTPUT_RAM_1_we(4)  <= '1' when ((BRAM_CTRL_OUTPUT_RAM_1_addr(16 downto 12) = "00100") and (BRAM_CTRL_OUTPUT_RAM_1_we = "1111")) else '0';
  s_BRAM_CTRL_OUTPUT_RAM_1_we(5)  <= '1' when ((BRAM_CTRL_OUTPUT_RAM_1_addr(16 downto 12) = "00101") and (BRAM_CTRL_OUTPUT_RAM_1_we = "1111")) else '0';
  s_BRAM_CTRL_OUTPUT_RAM_1_we(6)  <= '1' when ((BRAM_CTRL_OUTPUT_RAM_1_addr(16 downto 12) = "00110") and (BRAM_CTRL_OUTPUT_RAM_1_we = "1111")) else '0';
  s_BRAM_CTRL_OUTPUT_RAM_1_we(7)  <= '1' when ((BRAM_CTRL_OUTPUT_RAM_1_addr(16 downto 12) = "00111") and (BRAM_CTRL_OUTPUT_RAM_1_we = "1111")) else '0';
  s_BRAM_CTRL_OUTPUT_RAM_1_we(8)  <= '1' when ((BRAM_CTRL_OUTPUT_RAM_1_addr(16 downto 12) = "01000") and (BRAM_CTRL_OUTPUT_RAM_1_we = "1111")) else '0';
  s_BRAM_CTRL_OUTPUT_RAM_1_we(9)  <= '1' when ((BRAM_CTRL_OUTPUT_RAM_1_addr(16 downto 12) = "01001") and (BRAM_CTRL_OUTPUT_RAM_1_we = "1111")) else '0';
  s_BRAM_CTRL_OUTPUT_RAM_1_we(10) <= '1' when ((BRAM_CTRL_OUTPUT_RAM_1_addr(16 downto 12) = "01010") and (BRAM_CTRL_OUTPUT_RAM_1_we = "1111")) else '0';
  s_BRAM_CTRL_OUTPUT_RAM_1_we(11) <= '1' when ((BRAM_CTRL_OUTPUT_RAM_1_addr(16 downto 12) = "01011") and (BRAM_CTRL_OUTPUT_RAM_1_we = "1111")) else '0';
  s_BRAM_CTRL_OUTPUT_RAM_1_we(12) <= '1' when ((BRAM_CTRL_OUTPUT_RAM_1_addr(16 downto 12) = "01100") and (BRAM_CTRL_OUTPUT_RAM_1_we = "1111")) else '0';
  s_BRAM_CTRL_OUTPUT_RAM_1_we(13) <= '1' when ((BRAM_CTRL_OUTPUT_RAM_1_addr(16 downto 12) = "01101") and (BRAM_CTRL_OUTPUT_RAM_1_we = "1111")) else '0';
  s_BRAM_CTRL_OUTPUT_RAM_1_we(14) <= '1' when ((BRAM_CTRL_OUTPUT_RAM_1_addr(16 downto 12) = "01110") and (BRAM_CTRL_OUTPUT_RAM_1_we = "1111")) else '0';
  s_BRAM_CTRL_OUTPUT_RAM_1_we(15) <= '1' when ((BRAM_CTRL_OUTPUT_RAM_1_addr(16 downto 12) = "01111") and (BRAM_CTRL_OUTPUT_RAM_1_we = "1111")) else '0';

  process(BRAM_CTRL_OUTPUT_RAM_1_addr(16 downto 12))
  begin
    case(BRAM_CTRL_OUTPUT_RAM_1_addr(16 downto 12)) is

        when "00000" => s_BRAM_CTRL_OUTPUT_RAM_1_rst <= "1111111111111110";
        when "00001" => s_BRAM_CTRL_OUTPUT_RAM_1_rst <= "1111111111111101";
        when "00010" => s_BRAM_CTRL_OUTPUT_RAM_1_rst <= "1111111111111011";
        when "00011" => s_BRAM_CTRL_OUTPUT_RAM_1_rst <= "1111111111110111";
        when "00100" => s_BRAM_CTRL_OUTPUT_RAM_1_rst <= "1111111111101111";
        when "00101" => s_BRAM_CTRL_OUTPUT_RAM_1_rst <= "1111111111011111";
        when "00110" => s_BRAM_CTRL_OUTPUT_RAM_1_rst <= "1111111110111111";
        when "00111" => s_BRAM_CTRL_OUTPUT_RAM_1_rst <= "1111111101111111";
        when "01000" => s_BRAM_CTRL_OUTPUT_RAM_1_rst <= "1111111011111111";
        when "01001" => s_BRAM_CTRL_OUTPUT_RAM_1_rst <= "1111110111111111";
        when "01010" => s_BRAM_CTRL_OUTPUT_RAM_1_rst <= "1111101111111111";
        when "01011" => s_BRAM_CTRL_OUTPUT_RAM_1_rst <= "1111011111111111";
        when "01100" => s_BRAM_CTRL_OUTPUT_RAM_1_rst <= "1110111111111111";
        when "01101" => s_BRAM_CTRL_OUTPUT_RAM_1_rst <= "1101111111111111";
        when "01110" => s_BRAM_CTRL_OUTPUT_RAM_1_rst <= "1011111111111111";
        when "01111" => s_BRAM_CTRL_OUTPUT_RAM_1_rst <= "0111111111111111";

        when  others => s_BRAM_CTRL_OUTPUT_RAM_1_rst <= "1111111111111111";

  end case;
end process;


gen_OUTPUT_RAM_1_dout :
  for j in 0 to 31 generate
    BRAM_CTRL_OUTPUT_RAM_1_dout(j) <=
      s_BRAM_CTRL_OUTPUT_RAM_1_dout_arr(0)(j) or
      s_BRAM_CTRL_OUTPUT_RAM_1_dout_arr(1)(j) or
      s_BRAM_CTRL_OUTPUT_RAM_1_dout_arr(2)(j) or
      s_BRAM_CTRL_OUTPUT_RAM_1_dout_arr(3)(j) or
      s_BRAM_CTRL_OUTPUT_RAM_1_dout_arr(4)(j) or
      s_BRAM_CTRL_OUTPUT_RAM_1_dout_arr(5)(j) or
      s_BRAM_CTRL_OUTPUT_RAM_1_dout_arr(6)(j) or
      s_BRAM_CTRL_OUTPUT_RAM_1_dout_arr(7)(j) or
      s_BRAM_CTRL_OUTPUT_RAM_1_dout_arr(8)(j) or
      s_BRAM_CTRL_OUTPUT_RAM_1_dout_arr(9)(j) or
      s_BRAM_CTRL_OUTPUT_RAM_1_dout_arr(10)(j) or
      s_BRAM_CTRL_OUTPUT_RAM_1_dout_arr(11)(j) or
      s_BRAM_CTRL_OUTPUT_RAM_1_dout_arr(12)(j) or
      s_BRAM_CTRL_OUTPUT_RAM_1_dout_arr(13)(j) or
      s_BRAM_CTRL_OUTPUT_RAM_1_dout_arr(14)(j) or
      s_BRAM_CTRL_OUTPUT_RAM_1_dout_arr(15)(j);

  end generate;

end pattern_io_engine_arch;
