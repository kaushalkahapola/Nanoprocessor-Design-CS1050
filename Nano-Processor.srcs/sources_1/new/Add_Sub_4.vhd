----------------------------------------------------------------------------------

----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Add_Sub_4 is
    Port ( Mux1_out     : in STD_LOGIC_VECTOR (3 downto 0);     
           Mux2_out     : in STD_LOGIC_VECTOR (3 downto 0);
           Add_Sub_sel  : in STD_LOGIC;                        
           Neg_Sel       : in STD_LOGIC;                        
           Add_Sub_out  : out STD_LOGIC_VECTOR (3 downto 0);    
           overflow     : out STD_LOGIC;                        
           zero         : out STD_LOGIC);     --zero flag :- '1' if output is zero
end Add_Sub_4;

architecture Behavioral of Add_Sub_4 is

component RCA_4
    Port ( A0       : in STD_LOGIC;
           A1       : in STD_LOGIC;
           A2       : in STD_LOGIC;
           A3       : in STD_LOGIC;
           B0       : in STD_LOGIC;
           B1       : in STD_LOGIC;
           B2       : in STD_LOGIC;
           B3       : in STD_LOGIC;
           C_in     : in STD_LOGIC;
           S0       : out STD_LOGIC;
           S1       : out STD_LOGIC;
           S2       : out STD_LOGIC;
           S3       : out STD_LOGIC;
           C_out    : out STD_LOGIC);
end component;

signal FA0_in, FA1_in, FA2_in, FA3_in   : STD_LOGIC; 

signal RCA_out       : STD_LOGIC_VECTOR (3 downto 0); 
signal RCA_Carryout  : STD_LOGIC; 

begin
    FA0_in <= Mux1_out(0) xor Neg_Sel;
    FA1_in <= Mux1_out(1) xor Neg_Sel;
    FA2_in <= Mux1_out(2) xor Neg_Sel;
    FA3_in <= Mux1_out(3) xor Neg_Sel;
        
    RCA_4_0 : RCA_4
        port map(
            A0      => FA0_in,
            A1      => FA1_in,
            A2      => FA2_in,
            A3      => FA3_in,
            B0      => Mux2_out(0),
            B1      => Mux2_out(1),
            B2      => Mux2_out(2),
            B3      => Mux2_out(3),
            C_in    => Neg_Sel,
            S0      => RCA_out(0),
            S1      => RCA_out(1),
            S2      => RCA_out(2),
            S3      => RCA_out(3),
            C_out   => overflow);
        
        process(Add_Sub_sel, RCA_out)
            begin
            
                if (Add_Sub_sel = '1') then
                    Add_Sub_out <= RCA_out;
                end if;
                
            end process;
            
        zero <= not(RCA_out(0) or RCA_out(1) or RCA_out(2) or RCA_out(3));

end Behavioral;