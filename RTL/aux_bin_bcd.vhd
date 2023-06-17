library ieee;
use ieee.std_logic_1164.all;

entity aux_bin_bcd is
	port(A: in bit_vector(3 downto 0);
		  S: out bit_vector(3 downto 0));
end aux_bin_bcd;

architecture arc of aux_bin_bcd is

begin

	S(3) <= (A(2) and A(0)) or (A(2) and A(1)) or A(3);
	S(2) <= (A(2) and not A(1) and not A(0)) or (A(3) and A(0));
	S(1) <= (not A(2) and A(1)) or (A(1) and A(0)) or (A(3) and not A(0));
	S(0) <= (not A(3) and not A(2) and A(0)) or (A(2) and A(1) and not A(0)) or (A(3) and not A(0));

end arc;