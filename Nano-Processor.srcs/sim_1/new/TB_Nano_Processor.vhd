----------------------------------------------------------------------------------

----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Nano_Processor is
--  Port ( );
end TB_Nano_Processor;

architecture Behavioral of TB_Nano_Processor is

component Nano_Processor is
    Port ( Clk          : in STD_LOGIC;
           Reset        : in STD_LOGIC;
           Overflow     : out STD_LOGIC;
           Zero         : out STD_LOGIC;
           Led_Out        : out STD_LOGIC_VECTOR (3 downto 0);
           Out_7Seg  : out STD_LOGIC_VECTOR(6 downto 0));
end component;

signal Reset, Overflow, Zero   : std_logic;
signal Led_Out                        : std_logic_vector(3 downto 0);
signal Out_7Seg                  : std_logic_vector(6 downto 0);
signal Clk : std_logic :='0';


begin

UUT : Nano_Processor port map(
        Clk         => Clk,
        Reset       => Reset,
        Overflow    => Overflow,
        Zero        => Zero,
        Led_Out       => Led_Out,
        Out_7Seg => Out_7Seg);

clock_process : process
    begin
        wait for 10ns;
        Clk <= NOT(Clk);
end process;

sim : process
    begin
        Reset <= '0';
        wait for 100ns;
        Reset <= '1';
        wait for 100ns;
        Reset <= '0';
    wait;
end process;

end behavioral;