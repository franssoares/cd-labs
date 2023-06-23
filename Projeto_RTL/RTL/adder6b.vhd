library ieee;
use ieee.std_logic_1164.all;

entity adder6b is
    port(a, b: in bit_vector(5 downto 0); 
         ci: in bit;
	 s: out bit_vector(5 downto 0);
	 co: out bit);
end adder6b;

architecture arc of adder6b is

signal u0, u1, u2, u3, u4: bit;

component full_adder is
    port(a, b, ci: in bit;
	 co, s: out bit);
end component;

begin
    
    add0 : full_adder port map(a => a(0), b => b(0), ci => ci, 
                               co => u0, s => s(0));
			       
    add1 : full_adder port map(a => a(1), b => b(1), ci => u0,
                               co => u1, s => s(1));
			       
    add2 : full_adder port map(a => a(2), b => b(2), ci => u1,
                               co => u2, s => s(2));
			       
    add3 : full_adder port map(a => a(3), b => b(3), ci => u2,
                               co => u3, s => s(3));
			       
    add4 : full_adder port map(a => a(4), b => b(4), ci => u3,
                               co => u4, s => s(4));
			       
    add5 : full_adder port map(a => a(5), b => b(5), ci => u4,
                               co => co, s => s(5));
			           
end arc;
