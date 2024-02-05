library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_PC_Register is
--  Port ( );
end TB_PC_Register;

architecture Behavioral of TB_PC_Register is

component PC_Reg is
    Port (
        Reg_in    : in STD_LOGIC_VECTOR (2 downto 0);
        reset     : in STD_LOGIC;                         -- reset push button
        clk       : in STD_LOGIC;
        Reg_out   : out STD_LOGIC_VECTOR (2 downto 0)     -- memory select
    );
end component;

signal Reg_in, Reg_out : std_logic_vector(2 downto 0);
signal reset : std_logic;
signal Clk : std_logic := '0';

begin

UUT : PC_Reg port map (
        Reg_in   => Reg_in,
        reset    => reset,
        clk      => clk,
        Reg_out  => Reg_out
);

process
 begin
 wait for 5ns;
 Clk <= NOT(Clk);
 
end process;

  process
 begin
 Reg_in <= "010";
 reset <= '0';
 wait for 100ns;

 reset <= '1';
 wait;
end process;
end Behavioral;


