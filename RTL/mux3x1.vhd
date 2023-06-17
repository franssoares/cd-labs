library ieee;
use ieee.std_logic_1164.all;

entity mux3x1 is
    port(a, b, c, k0, k1: in bit;
	     s: out bit);
end mux3x1;

architecture arc of mux3x1 is
begin
    s <= (a and (k0 and not k1)) or 
         (b and (k0 xnor k1)) or 
         (c and (not k0 and k1));
end arc;
