library ieee;
use ieee.std_logic_1164.all;

entity sub5b is
    port(a, b: in bit_vector(4 downto 0); 
         ci: in bit;
	 s: out bit_vector(4 downto 0);
	 co: out bit);
end sub5b;

architecture arc of sub5b is

signal u0, u1, u2, u3: bit;

component full_sub is
    port(a, b, ci: in bit;
	 co, s: out bit);
end component;

begin
    
    sub0 : full_sub port map(a => a(0), b => b(0), ci => ci, 
                             co => u0, s => s(0));
                             
    sub1 : full_sub port map(a => a(1), b => b(1), ci => u0, 
                             co => u1, s => s(1));
                             
    sub2 : full_sub port map(a => a(2), b => b(2), ci => u1, 
                             co => u2, s => s(2));
                             
    sub3 : full_sub port map(a => a(3), b => b(3), ci => u2, 
                             co => u3, s => s(3));
                             
    sub4 : full_sub port map(a => a(4), b => b(4), ci => u3, 
                             co => co, s => s(4));    
end arc;
