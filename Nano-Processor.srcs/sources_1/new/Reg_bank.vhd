library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Reg_bank is
    Port ( Reg_Bank_in   : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_EN        : in STD_LOGIC_VECTOR (2 downto 0);
           Reset : in STD_LOGIC;
           Clk          : in STD_LOGIC;
           R0     : out STD_LOGIC_VECTOR (3 downto 0);
           R1     : out STD_LOGIC_VECTOR (3 downto 0);
           R2     : out STD_LOGIC_VECTOR (3 downto 0);
           R3     : out STD_LOGIC_VECTOR (3 downto 0);
           R4     : out STD_LOGIC_VECTOR (3 downto 0);
           R5     : out STD_LOGIC_VECTOR (3 downto 0);
           R6     : out STD_LOGIC_VECTOR (3 downto 0);
           R7     : out STD_LOGIC_VECTOR (3 downto 0));
end Reg_bank;

architecture Behavioral of Reg_bank is

component Reg
    Port ( D    : in STD_LOGIC_VECTOR (3 downto 0);
           En   : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Clk  : in STD_LOGIC;
           Q    : out STD_LOGIC_VECTOR (3 downto 0));
end component;

 --works as register enabling unit
component Decoder_3_to_8
    Port ( I    : in STD_LOGIC_VECTOR (2 downto 0);
           EN   : in STD_LOGIC;
           Y    : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal in_Reg_EN : STD_LOGIC_VECTOR (7 downto 0); 

begin

    Decoder_3_to_8_0 : Decoder_3_to_8
        port map (
        I(2 downto 0)   => Reg_EN(2 downto 0),
        EN              => '1',
        Y(7 downto 0)   => in_Reg_EN(7 downto 0));
        
    Reg_0 : Reg
        port map(
            D(3 downto 0)   => "0000", -- Reg_0 is readOnly 
            En              => '1',
            Reset           => Reset,
            Clk             => Clk,
            Q(3 downto 0)   => R0(3 downto 0));
        
    Reg_1 : Reg
        port map(
            D(3 downto 0)   => Reg_Bank_in(3 downto 0),
            En              => in_Reg_EN(1),
            Reset           => Reset,
            Clk             => Clk,
            Q(3 downto 0)   => R1(3 downto 0));
                
    Reg_2 : Reg
        port map(
            D(3 downto 0)   => Reg_Bank_in(3 downto 0),
            En              => in_Reg_EN(2),
            Reset           => Reset,
            Clk             => Clk,
            Q(3 downto 0)   => R2(3 downto 0));
                        
    Reg_3 : Reg
        port map(
            D(3 downto 0)   => Reg_Bank_in(3 downto 0),
            En              => in_Reg_EN(3),
            Reset           => Reset,
            Clk             => Clk,
            Q(3 downto 0)   => R3(3 downto 0));
                                
    Reg_4 : Reg
        port map(
            D(3 downto 0)   => Reg_Bank_in(3 downto 0),
            En              => in_Reg_EN(4),
            Reset           => Reset,
            Clk             => Clk,
            Q(3 downto 0)   => R4(3 downto 0));
                                        
    Reg_5 : Reg
        port map(
            D(3 downto 0)   => Reg_Bank_in(3 downto 0),
            En              => in_Reg_EN(5),
            Reset           => Reset,
            Clk             => Clk,
            Q(3 downto 0)   => R5(3 downto 0));
                                                
    Reg_6 : Reg
        port map(
            D(3 downto 0)   => Reg_Bank_in(3 downto 0),
            En              => in_Reg_EN(6),
            Reset           => Reset,
            Clk             => Clk,
            Q(3 downto 0)   => R6(3 downto 0));
                                                        
    Reg_7 : Reg
        port map(
            D(3 downto 0)   => Reg_Bank_in(3 downto 0),
            En              => in_Reg_EN(7),
            Reset           => Reset,
            Clk             => Clk,
            Q(3 downto 0)   => R7(3 downto 0));

end Behavioral;