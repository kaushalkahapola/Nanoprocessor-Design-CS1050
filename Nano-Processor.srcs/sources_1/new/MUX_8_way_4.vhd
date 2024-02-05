library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_8_way_4 is
    Port ( R0       : in STD_LOGIC_VECTOR (3 downto 0);
           R1       : in STD_LOGIC_VECTOR (3 downto 0);
           R2       : in STD_LOGIC_VECTOR (3 downto 0);
           R3       : in STD_LOGIC_VECTOR (3 downto 0);
           R4       : in STD_LOGIC_VECTOR (3 downto 0);
           R5       : in STD_LOGIC_VECTOR (3 downto 0);
           R6       : in STD_LOGIC_VECTOR (3 downto 0);
           R7       : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_sel   : in STD_LOGIC_VECTOR (2 downto 0);
           Q        : out STD_LOGIC_VECTOR (3 downto 0));
end MUX_8_way_4;

architecture Behavioral of MUX_8_way_4 is

begin

    process(R0, R1, R2, R3, R4, R5, R6, R7, Reg_sel)
        begin
            case Reg_sel is
            
                when "000" => Q <= R0;
                when "001" => Q <= R1;
                when "010" => Q <= R2;
                when "011" => Q <= R3;
                when "100" => Q <= R4;
                when "101" => Q <= R5;
                when "110" => Q <= R6;
                when "111" => Q <= R7;
                when others => Q <= "0000";
            
            end case;
        end process;

end Behavioral;