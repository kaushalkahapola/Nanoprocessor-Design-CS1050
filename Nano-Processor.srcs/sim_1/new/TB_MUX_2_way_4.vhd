library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_MUX_2_way_4 is
--  Port ( );
end TB_MUX_2_way_4;

architecture Behavioral of TB_MUX_2_way_4 is

component Mux_2_way_4 is
    Port ( im_val           : in STD_LOGIC_VECTOR (3 downto 0);
           Add_sub_out    : in STD_LOGIC_VECTOR (3 downto 0);
           Load_sel          : in STD_LOGIC; 
           mux_out          : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal im_val, Add_sub_out, mux_out   : std_logic_vector(3 downto 0);
signal Load_sel                          : std_logic;

begin

UUT : Mux_2_way_4 port map(
        im_val          => im_val,
        Add_sub_out   => Add_sub_out,
        Load_sel         => Load_sel,
        mux_out         => mux_out);

process
    begin
        -- Test case 1
        im_val    <= "1010";
        Load_sel  <= '1';
        Add_sub_out <= "0000";
        wait for 100 ns;

        -- Test case 2
        im_val    <= "0101";
        Load_sel  <= '0';
        Add_sub_out <= "0001";
        wait for 100 ns;

        -- Test case 3
        im_val    <= "1111";
        Load_sel  <= '1';
        Add_sub_out <= "0010";
        wait for 100 ns;

        -- Test case 4
        im_val    <= "1100";
        Load_sel  <= '0';
        Add_sub_out <= "0011";
        wait for 100 ns;

        wait;
    end process;


end Behavioral;