library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_MUX_2_way_3 is
end TB_MUX_2_way_3;

architecture Behavioral of TB_MUX_2_way_3 is
    component MUX_2_way_3 is
        Port (
            Adder_out   : in STD_LOGIC_VECTOR (2 downto 0);
            JMP_Address : in STD_LOGIC_VECTOR (2 downto 0);
            JMP_Flag    : in STD_LOGIC;
            mux_out     : out STD_LOGIC_VECTOR (2 downto 0)
        );
    end component;

    signal Adder_out, JMP_Address : STD_LOGIC_VECTOR (2 downto 0);
    signal JMP_Flag              : STD_LOGIC;
    signal mux_out               : STD_LOGIC_VECTOR (2 downto 0);
begin
    UUT : MUX_2_way_3
        port map (
            Adder_out   => Adder_out,
            JMP_Address => JMP_Address,
            JMP_Flag    => JMP_Flag,
            mux_out     => mux_out
        );

    stimulus_process : process
    begin
        -- Test case 1
        Adder_out   <= "010";
        JMP_Address <= "000";
        JMP_Flag    <= '0';
        wait for 100 ns;
        
        -- Test case 2
        Adder_out   <= "011";
        JMP_Address <= "001";
        JMP_Flag    <= '0';
        wait for 100 ns;
        
        -- Test case 3
        Adder_out   <= "100";
        JMP_Address <= "101";
        JMP_Flag    <= '0';
        wait for 100 ns;
        
        -- Test case 4
        Adder_out   <= "111";
        JMP_Address <= "110";
        JMP_Flag    <= '1';
        wait for 100 ns;
        
        wait;
    end process;
end Behavioral;
