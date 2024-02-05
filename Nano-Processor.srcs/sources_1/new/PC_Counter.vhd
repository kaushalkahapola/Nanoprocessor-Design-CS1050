library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PC is
    Port ( Clk      : in STD_LOGIC;
           Reset    : in STD_LOGIC;
           Jump_Flag : in STD_LOGIC;
           Jump_address  : in STD_LOGIC_VECTOR (2 downto 0);
           Sel   : out STD_LOGIC_VECTOR (2 downto 0));
end PC;

architecture Behavioral of PC is

component PC_Reg is
    Port (    Reg_in     : in STD_LOGIC_VECTOR (2 downto 0);
              reset     : in STD_LOGIC; 
              Clk   : in STD_LOGIC;
              Reg_out     : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component Adder_3 is
    Port (A0       : in STD_LOGIC;
           A1       : in STD_LOGIC;
           A2       : in STD_LOGIC;
           
           B0       : in STD_LOGIC;
           B1       : in STD_LOGIC;
           B2       : in STD_LOGIC;
           
           C_in     : in STD_LOGIC;
       
           S0       : out STD_LOGIC;
           S1       : out STD_LOGIC;
           S2       : out STD_LOGIC;
         
           C_out    : out STD_LOGIC);
end component;

component Mux_2_way_3 is
    Port ( Adder_out  : in STD_LOGIC_VECTOR (2 downto 0);
           JMP_address  : in STD_LOGIC_VECTOR (2 downto 0);
           JMP_Flag     : in STD_LOGIC;
           mux_out      : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal Mux_in           : std_logic_vector(2 downto 0);
signal Ins_Next          : std_logic_vector(2 downto 0);
signal Ins_Curr          : std_logic_vector(2 downto 0);

begin

    PC_Reg_0 : PC_Reg
        port map(
            Reg_in   => Ins_Next,
            reset   => Reset,
            Clk => Clk,
            Reg_out   => Ins_Curr);
            
    Adder_3_0 : Adder_3
        port map(
            A0      => Ins_Curr(0),
            A1      => Ins_Curr(1),
            A2      => Ins_Curr(2),
            B0      => '0',
            B1      => '0',
            B2      => '0',
            C_in    => '1',
            S0   => Mux_in(0),
            S1   => Mux_in(1),
            S2   => Mux_in(2)
            );
    Mux_2_way_3_0 : Mux_2_way_3
        port map(
            Adder_out => Mux_in,
            JMP_address => Jump_address,
            JMP_Flag    => JUMP_Flag,
            mux_out     => Ins_Next);
            
    Sel <= Ins_Curr;

end Behavioral;