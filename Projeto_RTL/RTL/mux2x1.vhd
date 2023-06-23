library ieee;
use ieee.std_logic_1164.all;

entity mux2x1 is
    port(a, b, k: in bit;
	     s: out bit);
end mux2x1;

architecture arc of mux2x1 is
begin
    s <= (a and k) or (b and not k);
end arc;
