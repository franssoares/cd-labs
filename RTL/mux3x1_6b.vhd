library ieee;
use ieee.std_logic_1164.all;

entity mux3x1_6b is
    port(a, b, c: in bit_vector(5 downto 0);
         k0, k1: in bit;
	 s: out bit_vector(5 downto 0));
end mux3x1_6b;

architecture arc of mux3x1_6b is

component mux3x1 is
    port(a, b, c, k0, k1: in bit;
         s: out bit);
end component;

begin

    mux0 : mux3x1 port map(a => a(0), b => b(0), c => c(0),
                           k0 => k0, k1 => k1,
			   s => s(0));
			   
    mux1 : mux3x1 port map(a => a(1), b => b(1), c => c(1),
                           k0 => k0, k1 => k1,
			   s => s(1));

    mux2 : mux3x1 port map(a => a(2), b => b(2), c => c(2),
                           k0 => k0, k1 => k1,
			   s => s(2));
			   
    mux3 : mux3x1 port map(a => a(3), b => b(3), c => c(3),
                           k0 => k0, k1 => k1,
			   s => s(3));
			   
    mux4 : mux3x1 port map(a => a(4), b => b(4), c => c(4),
                           k0 => k0, k1 => k1,
			   s => s(4));
    
    mux5 : mux3x1 port map(a => a(5), b => b(5), c => c(5),
                           k0 => k0, k1 => k1,
			   s => s(5));
end arc;
