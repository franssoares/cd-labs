library ieee;
use ieee.std_logic_1164.all;

entity sub6b is
    port(a, b: in bit_vector(5 downto 0); 
         ci: in bit;
	 s: out bit_vector(5 downto 0);
	 co: out bit);
end sub6b;

architecture arc of sub6b is

signal u0, u1, u2, u3, u4: bit;

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
                             co => u4, s => s(4));
                             
    sub5 : full_sub port map(a => a(5), b => b(5), ci => u4,
                             co => co, s => s(5));
                             
end arc;
