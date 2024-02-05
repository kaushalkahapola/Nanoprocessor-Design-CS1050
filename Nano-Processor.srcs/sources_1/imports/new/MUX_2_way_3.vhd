
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_2_way_3 is
    Port ( Adder_out  : in STD_LOGIC_VECTOR (2 downto 0);
           JMP_Address  : in STD_LOGIC_VECTOR (2 downto 0);
           JMP_Flag     : in STD_LOGIC;
           mux_out      : out STD_LOGIC_VECTOR (2 downto 0));
end MUX_2_way_3;

architecture Behavioral of MUX_2_way_3 is

begin

    process(Adder_out, JMP_Address, JMP_Flag)
        begin
            case JMP_Flag is
            
                when '1'    => mux_out <= JMP_Address;
                when '0'    => mux_out <= Adder_out;
                when others => mux_out <= "000";
            
            end case;
        end process;

end Behavioral;