
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity LUT_7seg is
    Port ( Address : in STD_LOGIC_VECTOR (3 downto 0);
           Data : out STD_LOGIC_VECTOR (6 downto 0));
end LUT_7seg;

architecture Behavioral of LUT_7seg is

type rom_type is array (0 to 15) of std_logic_vector(6 downto 0);
signal sevenSegROM : rom_type := (
    "1000000", --0
    "1111001", --1
    "0100100", --2
    "0110000", --3
    "0011001", --4
    "0010010", --5
    "0000010", --6
    "1111000", --7
    "0000000", --8
    "0000100", --9
    "0001000", --A
    "0000011", --B
    "1000110", --C
    "0100001", --D
    "0000110", --E
    "0001110"  --F
    );

begin

Data <= sevenSegROM(to_integer(unsigned(Address)));

end Behavioral;