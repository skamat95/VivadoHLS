

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


package ctp7_utils_pkg is

  type t_slv_arr_32 is array(integer range <>) of std_logic_vector(31 downto 0);
  type t_slv_arr_192 is array(integer range <>) of std_logic_vector(191 downto 0);

end ctp7_utils_pkg;

