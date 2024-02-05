library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Add_Sub_4 is
--  Port ( );
end TB_Add_Sub_4;

architecture Behavioral of TB_Add_Sub_4 is

component Add_Sub_4 is
    Port (
        Mux1_out     : in STD_LOGIC_VECTOR (3 downto 0);
        Mux2_out     : in STD_LOGIC_VECTOR (3 downto 0);
        Add_Sub_sel  : in STD_LOGIC;
        Neg_Sel      : in STD_LOGIC;
        Add_Sub_out  : out STD_LOGIC_VECTOR (3 downto 0);
        overflow     : out STD_LOGIC;
        zero         : out STD_LOGIC
    );
end component;

signal Mux1_out, Mux2_out, Add_Sub_out      : std_logic_vector(3 downto 0);
signal Add_Sub_sel, Neg_Sel, overflow, zero  : std_logic;

begin

UUT : Add_Sub_4 port map(
        Mux1_out     => Mux1_out,
        Mux2_out     => Mux2_out,
        Add_Sub_sel  => Add_Sub_sel,
        Neg_Sel      => Neg_Sel,
        Add_Sub_out  => Add_Sub_out,
        overflow     => overflow,
        zero         => zero);
        
process
    begin
        Mux1_out    <= "1010";
        Mux2_out    <= "0101";
        Add_Sub_sel <= '1';
        Neg_Sel     <= '0';
        wait for 100ns;
        
        Mux2_out    <= "1111";
        wait for 100ns;
        
        Mux1_out    <= "1111";
        Mux2_out    <= "0000";
        Neg_Sel     <= '1';
        
        wait for 100ns;
        
        Mux1_out    <= "1111";
        Mux2_out    <= "0001";
        Neg_Sel     <= '0';
        wait;
    end process;

end Behavioral;
