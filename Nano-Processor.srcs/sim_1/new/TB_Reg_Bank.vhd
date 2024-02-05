----------------------------------------------------------------------------------

----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Reg_Bank is
--  Port ( );
end TB_Reg_Bank;

architecture Behavioral of TB_Reg_Bank is


component Reg_Bank is
    Port ( Reg_Bank_in   : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_EN        : in STD_LOGIC_VECTOR (2 downto 0);
           Clk          : in STD_LOGIC;
           R0     : out STD_LOGIC_VECTOR (3 downto 0);
           R1     : out STD_LOGIC_VECTOR (3 downto 0);
           R2     : out STD_LOGIC_VECTOR (3 downto 0);
           R3     : out STD_LOGIC_VECTOR (3 downto 0);
           R4     : out STD_LOGIC_VECTOR (3 downto 0);
           R5     : out STD_LOGIC_VECTOR (3 downto 0);
           R6     : out STD_LOGIC_VECTOR (3 downto 0);
           R7     : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal Reg_EN : std_logic_vector(2 downto 0);
signal Reg_Bank_in, R0, R1, R2, R3, R4, R5, R6, R7 : std_logic_vector(3 downto 0);
signal Clk : std_logic:='0';

begin

UUT : Reg_Bank port map(
        Reg_Bank_in => Reg_Bank_in,
        Reg_EN => Reg_EN,
        Clk => Clk,
        R0 => R0,
        R1 => R1,
        R2 => R2,
        R3 => R3,
        R4 => R4,
        R5 => R5,
        R6 => R6,
        R7 => R7);
        
clock_process : process
begin
    wait for 5ns;
    CLk<=NOT(CLk);
end process;
        
sim : process
    begin
        Reg_Bank_in <= "1010";
        Reg_EN      <= "001";
        wait for 100ns;
        
        Reg_Bank_in <= "0101";
        Reg_EN      <= "010";
        wait for 100ns;
        
        Reg_Bank_in <= "1111";
        Reg_EN      <= "011";
        wait for 100ns;
        
        Reg_Bank_in <= "1100";
        Reg_EN      <= "010";
        
    wait;
end process;

end Behavioral;