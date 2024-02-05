library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Adder_3 is
    Port ( A0       : in STD_LOGIC;
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
end Adder_3;

architecture Behavioral of Adder_3 is

    component FA
        port (
            A       : in std_logic;
            B       : in std_logic;
            C_in    : in std_logic;
            S       : out std_logic;
            C_out   : out std_logic);
    end component;
    
signal FA0_C, FA1_C         : std_logic;

begin
   
  FA_0 : FA
      port map (
          A => A0,
          B => B0,
          C_in => C_in,
          S => S0,
          C_Out => FA0_C);
          
  FA_1 : FA
      port map (
          A => A1,
          B => B1,
          C_in => FA0_C,
          S => S1,
          C_Out => FA1_C);
          
  FA_2 : FA
      port map (
          A => A2,
          B => B2,
          C_in => FA1_C,
          S => S2,
          C_Out => C_Out);
end Behavioral;