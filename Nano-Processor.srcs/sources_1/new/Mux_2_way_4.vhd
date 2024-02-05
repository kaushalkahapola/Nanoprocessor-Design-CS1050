
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux_2_way_4 is
    Port ( Im_val           : in STD_LOGIC_VECTOR (3 downto 0);
           Add_Sub_Out    : in STD_LOGIC_VECTOR (3 downto 0);
           Load_Sel          : in STD_LOGIC; --Load_Sel <= Mov
           mux_out          : out STD_LOGIC_VECTOR (3 downto 0));
end Mux_2_way_4;

architecture Behavioral of Mux_2_way_4 is

begin

    process(Im_val, Add_Sub_Out, Load_Sel)
        begin
            case Load_Sel is
            
                when '0'        => mux_out <= Add_Sub_Out;
                when '1'        => mux_out <= Im_val;
                when others     => mux_out <= "0000";
            
            end case;
        end process;

end Behavioral;