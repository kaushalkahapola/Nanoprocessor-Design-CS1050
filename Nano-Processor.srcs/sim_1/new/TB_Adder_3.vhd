library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Adder_3 is
--  Port ( );
end TB_Adder_3;

architecture Behavioral of TB_Adder_3 is

component Adder_3 is
    Port ( A       : in STD_LOGIC_VECTOR (2 downto 0);
           
           B       : in STD_LOGIC_VECTOR (2 downto 0);
           
           C_in     : in STD_LOGIC;
       
           S       : out STD_LOGIC_VECTOR (2 downto 0);
         
           C_out    : out STD_LOGIC);
end component;

signal A,B,S : STD_LOGIC_VECTOR (2 downto 0);
signal C_in,C_out : STD_LOGIC;

begin

UUT : Adder_3 port map(
        A      => A,
        B      => B,
        C_in    => C_in,
        S      => S,
        C_out   => C_out);
        
process
    begin
        B <= "000";
        C_in <= '1';
        A <= "010";
        wait for 100ns;
        
        A <= "011";
        wait for 100ns;
        
        A <= "100";
        wait for 100ns;
        
        A <= "111";
    wait;
end process;

end Behavioral;