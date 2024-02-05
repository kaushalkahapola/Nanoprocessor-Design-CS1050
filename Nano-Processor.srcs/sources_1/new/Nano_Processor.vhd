----------------------------------------------------------------------------------

----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Nano_Processor is
    Port ( Clk          : in STD_LOGIC;
           Reset        : in STD_LOGIC;
           Overflow     : out STD_LOGIC;
           Zero         : out STD_LOGIC;
           LED_Out        : out STD_LOGIC_VECTOR (3 downto 0);
           Out_7Seg  : out STD_LOGIC_VECTOR(6 downto 0));
end Nano_Processor;

architecture Behavioral of Nano_Processor is

component Slow_Clk is
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end component;

signal SlowClk : std_logic;

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
           JMp_Address         : out STD_LOGIC_VECTOR (2 downto 0);
           Neg          : out STD_LOGIC);
end component;

signal ins                                  : std_logic_vector(11 downto 0);
signal imVal                               : std_logic_vector(3 downto 0);
signal regEn, regSelA, regSelB, jmpAdd      : std_logic_vector(2 downto 0);
signal loadSel, addSubSel, jmpFlag, negSel  : std_logic;

component PC is
    Port ( Clk      : in STD_LOGIC;
           Reset    : in STD_LOGIC;
           Jump_Flag : in STD_LOGIC;
           Jump_Address  : in STD_LOGIC_VECTOR (2 downto 0);
           Sel   : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal memSel : std_logic_vector(2 downto 0);

component ROM is
    Port ( Sel      : in STD_LOGIC_VECTOR (2 downto 0);
           Ins  : out STD_LOGIC_VECTOR (11 downto 0));
end component;

component Reg_bank is
    Port ( Reg_Bank_in   : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_EN        : in STD_LOGIC_VECTOR (2 downto 0);
           Reset :      in STD_LOGIC;
           Clk          : in STD_LOGIC;
           R0   : out STD_LOGIC_VECTOR (3 downto 0);
           R1   : out STD_LOGIC_VECTOR (3 downto 0);
           R2   : out STD_LOGIC_VECTOR (3 downto 0);
           R3   : out STD_LOGIC_VECTOR (3 downto 0);
           R4   : out STD_LOGIC_VECTOR (3 downto 0);
           R5   : out STD_LOGIC_VECTOR (3 downto 0);
           R6   : out STD_LOGIC_VECTOR (3 downto 0);
           R7   : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal regBankIn, r0, r1, r2, r3, r4, r5, r6, r7 : std_logic_vector(3 downto 0);

component MUX_8_way_4 is
    Port ( R0       : in STD_LOGIC_VECTOR (3 downto 0);
           R1       : in STD_LOGIC_VECTOR (3 downto 0);
           R2       : in STD_LOGIC_VECTOR (3 downto 0);
           R3       : in STD_LOGIC_VECTOR (3 downto 0);
           R4       : in STD_LOGIC_VECTOR (3 downto 0);
           R5       : in STD_LOGIC_VECTOR (3 downto 0);
           R6       : in STD_LOGIC_VECTOR (3 downto 0);
           R7       : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_Sel   : in STD_LOGIC_VECTOR (2 downto 0);
           Q        : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal muxOut0, muxOut1 : std_logic_vector(3 downto 0);

component Add_Sub_4 is
    Port ( Mux1_out     : in STD_LOGIC_VECTOR (3 downto 0);
           Mux2_out     : in STD_LOGIC_VECTOR (3 downto 0);
           Add_Sub_sel  : in STD_LOGIC;
           Neg_sel      : in STD_LOGIC;
           Add_Sub_out  : out STD_LOGIC_VECTOR (3 downto 0);
           overflow     : out STD_LOGIC;
           zero         : out STD_LOGIC);
end component;

signal addSubOut        : std_logic_vector(3 downto 0);

component Mux_2_way_4 is
    Port ( im_Val           : in STD_LOGIC_VECTOR (3 downto 0);
           add_Sub_Out    : in STD_LOGIC_VECTOR (3 downto 0);
           load_Sel          : in STD_LOGIC;
           mux_out          : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component LUT_7seg is
    Port ( Address  : in STD_LOGIC_VECTOR (3 downto 0);
           Data     : out STD_LOGIC_VECTOR (6 downto 0));
end component;

begin

Slow_Clk_0 : Slow_Clk
    port map(
        Clk_in => Clk,         
        Clk_out => SlowClk);
        
RegisterBank_0 : Reg_bank
    port map(
        Reg_Bank_in  => regBankIn,
        Reg_EN       => regEn,   
        Reset           => Reset, 
        Clk         => SlowClk,   
        R0    => r0,
        R1    => r1,
        R2    => r2,
        R3    => r3,
        R4    => r4,
        R5    => r5,
        R6    => r6,
        R7    => r7);

Mux8_4bit_A : MUX_8_way_4
    port map(
        R0 => r0,          
        R1 => r1,          
        R2 => r2,          
        R3 => r3,          
        R4 => r4,          
        R5 => r5,          
        R6 => r6,          
        R7 => r7,          
        Reg_Sel => regSelA,
        Q => muxOut0);
        
Mux8_4bit_B : MUX_8_way_4
    port map(
        R0      => r0,       
        R1      => r1,       
        R2      => r2,       
        R3      => r3,       
        R4      => r4,       
        R5      => r5,       
        R6      => r6,       
        R7      => r7,       
        Reg_Sel  => regSelB, 
        Q       => muxOut1);
        
AddSubUnit_0 : Add_Sub_4
    port map(
        Mux1_out    => muxOut0,     
        Mux2_out    => muxOut1,     
        Add_Sub_sel => addSubSel,   
        Neg_Sel     => negSel,      
        Add_Sub_out => addSubOut,
        overflow    => Overflow,    
        zero        => Zero);       
                
Mux2_4bit_0 : Mux_2_way_4
    port map(
        im_Val => imVal,          
        add_Sub_Out => addSubOut, 
        load_Sel => loadSel,        
        mux_out => regBankIn);

Ins_Decoder_0 : Instruction_Decoder
    port map(
        I => ins,    
        JMP_Check   => muxOut0,  
        Reg_En      => regEn,
        Load_Sel    => loadSel,
        Im_Val     => imVal,
        Reg_Sel_0   => regSelA,
        Reg_Sel_1   => regSelB,
        Add_Sub_Sel  => addSubSel,
        JMP_Flag   => jmpFlag,
        JMP_Address    => jmpAdd,
        NEG     => negSel); 
        
Program_ROM_0 : ROM
    port map(
        Sel     => memSel,      
        Ins => ins);        
        
ProgramCounter_0 : PC
    port map(
        Clk         => SlowClk,   
        Reset       => Reset,       
        Jump_Flag    => jmpFlag,     
        Jump_Address     => jmpAdd,      
        Sel      => memSel);
        
LUT_7seg_0 : LUT_7seg
    port map(
        Address => r7,
        Data    => Out_7Seg);
        
    LED_Out <= r7; 

end Behavioral;