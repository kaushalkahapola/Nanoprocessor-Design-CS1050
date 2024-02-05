library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ROM is
    Port ( Sel      : in STD_LOGIC_VECTOR (2 downto 0);
           Ins  : out STD_LOGIC_VECTOR (11 downto 0));
end ROM;

architecture Behavioral of ROM is

type rom_type is array( 0 to 7 ) of std_logic_vector (11 downto 0);
    signal Ins_ROM : rom_type := (
    "101110000011", --MOVI R7, 3  
    "101100000011", --MOVI R1, 3  
    "100100000001", --MOVI R2, 1  
    "010100000000", --NEG R2      
    "001100100000", --ADD R1, R2  
    "001111100000", --ADD R7, R1  
    "111100000110", --JZR R1, 6   
    "110000000100"  --JZR R0, 4   
     --"100010001010", --MOVI R1, 10 ; R1 ? 10
     --"100100000001", --MOVI R2, 1 ; R2 ? 1
     --"010100000000", --NEG R2 ; R2 ? -R2
     --"000010100000", --ADD R1, R2 ; R1 ? R1 + R2
     --"110010000111", --JZR R1, 7 ; If R1 = 0 jump to line 7
     --"110000000011", --JZR R0, 3 ; If R0 = 0 jump to line 3
     --"000000000000",
     --"000000000000"
        );

begin

Ins <= Ins_ROM(to_integer(unsigned(Sel)));

end Behavioral;