library ieee;
use ieee.std_logic_1164.all;

entity binbcd5b is
	port(A: in bit_vector(4 downto 0);
		  M, C: out bit_vector(3 downto 0));
end binbcd5b;

architecture arc of binbcd5b is

signal u0, u1, u2: bit;

component aux_bin_bcd is
	port(A: in bit_vector(3 downto 0);
		  S: out bit_vector(3 downto 0));
end component;

begin
	M(3) <= '0';
	M(2) <= '0';
	aux0 : aux_bin_bcd port map(A(3) => '0', A(2) => A(4), A(1) => A(3), A(0) => A(2),
										 S(3) => M(1), S(2) => u2, S(1) => u1, S(0) => u0);
	aux1 : aux_bin_bcd port map(A(3) => u2, A(2) => u1, A(1) => u0, A(0) => A(1),
										 S(3) => M(0), S(2) => C(3), S(1) => C(2), S(0) => C(1));
	C(0) <= A(0);
end arc;