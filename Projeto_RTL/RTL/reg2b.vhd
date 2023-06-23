library ieee;
use ieee.std_logic_1164.all;

entity reg2b is
    port(clk, load, clr: in bit;
         D: in bit_vector(1 downto 0);
         Q: out bit_vector(1 downto 0));
end reg2b;

architecture arc of reg2b is

component ffd is
    port(clk, ld, clr, d: in bit;
         q: out bit);
end component;

begin
    ff0: ffd port map(clk => clk, ld => load, clr => clr, 
                      d => D(0), q => Q(0));
    ff1: ffd port map(clk => clk, ld => load, clr => clr, 
                      d => D(1), q => Q(1));                     
end arc;