library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Instruction_Decoder is
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
           NEG          : out STD_LOGIC);
end Instruction_Decoder;

architecture Behavioral of Instruction_Decoder is

component Decoder_2_to_4 is
    Port ( I : in STD_LOGIC_VECTOR (1 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal Address, Neg0, Mov, Jmp, En_Sel : std_logic;

begin

    Decoder_2_to_4_0: Decoder_2_to_4
        port map(
                I(0)    => I(10),
                I(1)    => I(11),
                EN      => '1',
                Y(0)    => Address,
                Y(1)    => Neg0,
                Y(2)    => Mov,
                Y(3)    => Jmp);
                
    Load_Sel    <= Mov;
    Add_Sub_Sel  <= Address or Neg0;
    NEG     <= Neg0;
    
    En_Sel      <= Address or Mov or Neg0;
    
    Im_Val     <= I(3 downto 0);
    
    Reg_En(0)   <= En_Sel and I(7);
    Reg_En(1)   <= En_Sel and I(8);
    Reg_En(2)   <= En_Sel and I(9);
    
    Reg_Sel_0   <= I(9 downto 7);
    Reg_Sel_1   <= I(6 downto 4);
    
    JMP_Flag   <= Jmp and (not (JMP_Check(0) or JMP_Check(1) or JMP_Check(2) or JMP_Check(3)));
    JMP_Address    <= I(2 downto 0); 

end Behavioral;