library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PC_Reg is
    Port (
        Reg_in   : in STD_LOGIC_VECTOR (2 downto 0);
        reset        : in STD_LOGIC;                         -- reset push button
        clk        : in STD_LOGIC;
        Reg_out  : out STD_LOGIC_VECTOR (2 downto 0)     -- memory select
    );
end PC_Reg;

architecture Behavioral of PC_Reg is

begin

    process (Clk) begin
        if (rising_edge(Clk)) then
            if reset = '1' then
                Reg_out <= "000";
            else 
                if Reg_in = "UUU" then
                    Reg_out <= "000";
                else
                    Reg_out <= Reg_in;
                end if;
            end if;
        end if;
    end process;
    
end Behavioral;
