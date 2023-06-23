library ieee;
use ieee.std_logic_1164.all;

entity mux2x1_5b is
    port(a, b: in bit_vector(4 downto 0);
         k: in bit;
	 s: out bit_vector(4 downto 0));
end mux2x1_5b;

architecture arc of mux2x1_5b is

component mux2x1 is
    port(a, b, k: in bit;
	     s: out bit);
end component;

begin
    mux0 : mux2x1 port map(a => a(0), b => b(0), k => k, s => s(0));
    mux1 : mux2x1 port map(a => a(1), b => b(1), k => k, s => s(1));
    mux2 : mux2x1 port map(a => a(2), b => b(2), k => k, s => s(2));
    mux3 : mux2x1 port map(a => a(3), b => b(3), k => k, s => s(3));
    mux4 : mux2x1 port map(a => a(4), b => b(4), k => k, s => s(4));
end arc;
