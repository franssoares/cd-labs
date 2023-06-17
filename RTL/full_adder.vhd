library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
    port(a, b, ci: in bit;
	 co, s: out bit);
end full_adder;

architecture arc of full_adder is
begin
    co <= (a and b) or (a and ci) or (b and ci);
    s <= a xor b xor ci;
end arc;
