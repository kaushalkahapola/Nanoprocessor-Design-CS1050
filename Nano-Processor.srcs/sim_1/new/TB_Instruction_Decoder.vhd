----------------------------------------------------------------------------------

----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Instruction_Decoder is
--  Port ( );
end TB_Instruction_Decoder;

architecture Behavioral of TB_Instruction_Decoder is

component Instruction_Decoder is
    Port ( I      : in STD_LOGIC_VECTOR (11 downto 0);
           JMP_Check        : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_En           : out STD_LOGIC_VECTOR (2 downto 0);
           Load_Sel         : out STD_LOGIC;
           Im_Val          : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_Sel_0        : out STD_LOGIC_VECTOR (2 downto 0);
           Reg_Sel_1        : out STD_LOGIC_VECTOR (2 downto 0);
           Add_Sub_Sel       : out STD_LOGIC;
           JMP_Flag        : out STD_LOGIC;
           JMP_Address         : out STD_LOGIC_VECTOR (2 downto 0);
           Neg          : out STD_LOGIC);
end component;

signal I                              : std_logic_vector(11 downto 0);
signal JMP_Check, Im_Val                       : std_logic_vector(3 downto 0);
signal Reg_En, Reg_Sel_0, Reg_Sel_1, JMP_Address   : std_logic_vector(2 downto 0);
signal Load_Sel, Add_Sub_Sel, JMP_Flag, Neg : std_logic;

begin

UUT : Instruction_Decoder port map(
        I => I,
        JMP_Check   => JMP_Check,
        Reg_En      => Reg_En,
        Load_Sel    => Load_Sel,
        Im_Val     => Im_Val,
        Reg_Sel_0   => Reg_Sel_0,
        Reg_Sel_1   => Reg_Sel_1,
        Add_Sub_Sel  => Add_Sub_Sel,
        JMP_Flag   => JMP_Flag,
        JMP_Address    => JMP_Address,
        Neg     => Neg);
        
process
    begin
        I <= "100010001010";
        JMP_Check   <= "1010";
        wait for 100ns;
        
        I <= "100100000001";
        JMP_Check   <= "0101";
        wait for 100ns;
        
        I <= "010100000000";
        JMP_Check   <= "1111";
        wait for 100ns;
        
        I <= "000010100000";
        JMP_Check   <= "1100";        
    wait;
end process;

end Behavioral;

