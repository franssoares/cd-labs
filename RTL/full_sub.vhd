library ieee;
use ieee.std_logic_1164.all;

entity full_sub is
    port(a, b, ci: in bit;
	 co, s: out bit);
end full_sub;

architecture arc of full_sub is
begin
    co <= (not a and b) or (not a and ci) or (b and ci);
    s <= a xor b xor ci;
end arc;
