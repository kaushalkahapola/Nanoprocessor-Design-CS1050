library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Decoder_2_to_4 is
    Port ( I    : in STD_LOGIC_VECTOR (1 downto 0); --2-bit input
           EN   : in STD_LOGIC;
           Y    : out STD_LOGIC_VECTOR (3 downto 0)); --4-bit output
end Decoder_2_to_4;

architecture Behavioral of Decoder_2_to_4 is

begin

process (I, EN)
    begin
        if (EN = '1') then
            case I is
                when "00" => Y <= "0001";
                when "01" => Y <= "0010";
                when "10" => Y <= "0100";
                when "11" => Y <= "1000";
                when others => null;
            end case;
        end if;
end process;

end Behavioral;