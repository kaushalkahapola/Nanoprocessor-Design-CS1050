
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity TB_ROM is
--  Port ( );
end TB_ROM;

architecture Behavioral of TB_ROM is

component ROM is
    Port ( Sel      : in STD_LOGIC_VECTOR (2 downto 0);
           Ins  : out STD_LOGIC_VECTOR (11 downto 0));
end component;

signal Sel : std_logic_vector(2 downto 0);
signal Ins : std_logic_vector(11 downto 0);

begin

UUT : ROM port map(
        Sel     => Sel,
        Ins => Ins);
        
process
    begin
        Sel <= "010";
        wait for 100ns;
        
        Sel <= "001";
        wait for 100ns;
        
        Sel <= "111";
        wait for 100ns;
        
        Sel <= "110";
    wait;
end process;

end Behavioral;
