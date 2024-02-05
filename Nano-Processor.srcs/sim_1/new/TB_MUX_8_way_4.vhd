
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_MUX_8_way_4 is
--  Port ( );
end TB_MUX_8_way_4;

architecture Behavioral of TB_MUX_8_way_4 is

component MUX_8_way_4 is
        Port ( R0       : in STD_LOGIC_VECTOR (3 downto 0);
       R1       : in STD_LOGIC_VECTOR (3 downto 0);
       R2       : in STD_LOGIC_VECTOR (3 downto 0);
       R3       : in STD_LOGIC_VECTOR (3 downto 0);
       R4       : in STD_LOGIC_VECTOR (3 downto 0);
       R5       : in STD_LOGIC_VECTOR (3 downto 0);
       R6       : in STD_LOGIC_VECTOR (3 downto 0);
       R7       : in STD_LOGIC_VECTOR (3 downto 0);
       Reg_sel   : in STD_LOGIC_VECTOR (2 downto 0);
       Q        : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal R0, R1, R2, R3, R4, R5, R6, R7, Q : std_logic_vector(3 downto 0);
signal Reg_Sel                            : std_logic_vector(2 downto 0);

begin

UUT : MUX_8_way_4 port map(
        R0      => R0,
        R1      => R1,
        R2      => R2,
        R3      => R3,
        R4      => R4,
        R5      => R5,
        R6      => R6,
        R7      => R7,
        Reg_sel  => Reg_sel,
        Q       => Q);
        
process
    begin
        R0 <= "0000";
        R1 <= "0001";
        R2 <= "0010";
        R3 <= "0011";
        R4 <= "0100";
        R5 <= "0101";
        R6 <= "0110";
        R7 <= "0111";
        Reg_sel <= "010";
        wait for 100ns;
        
        Reg_sel <= "001";
        wait for 100ns;
        
        Reg_sel <= "111";
        wait for 100ns;
        
        Reg_sel <= "110";
        wait for 100ns;
    wait;
end process;

end Behavioral;