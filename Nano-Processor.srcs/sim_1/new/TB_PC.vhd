library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_PC is
--  Port ( );
end TB_PC;

architecture Behavioral of TB_PC is

component PC is
    Port (
        Clk           : in STD_LOGIC;
        Reset         : in STD_LOGIC;
        Jump_Flag     : in STD_LOGIC;
        Jump_address  : in STD_LOGIC_VECTOR (2 downto 0);
        Sel           : out STD_LOGIC_VECTOR (2 downto 0)
    );
end component;

signal Reset, Jump_Flag : std_logic;
signal Jump_address, Sel : std_logic_vector(2 downto 0);
signal Clk : std_logic := '0';


begin

UUT : PC port map (
        Clk           => Clk,
        Reset         => Reset,
        Jump_Flag     => Jump_Flag,
        Jump_address  => Jump_address,
        Sel           => Sel
);

process
begin
    wait for 5ns;
    Clk <= NOT(Clk);
end process;
stimulus_process : process
    begin
        Jump_Flag <= '0';
        wait for 100ns;
        
        Jump_Flag <= '1';
        Jump_Address  <= "010";
        wait for 100ns;
        
        Jump_Flag <= '0';
        Reset <= '1';
        wait for 100ns;
        Reset <= '0';
        
        Jump_Flag <= '1';
        Jump_Address  <= "001";
        wait for 100ns;
        
        Jump_Flag <= '0';
        wait for 100ns;
        
        Jump_Flag <= '1';
        Jump_Address  <= "111";
    wait;
end process;

end Behavioral;
