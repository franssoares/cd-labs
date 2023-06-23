library ieee;
use ieee.std_logic_1164.all;

entity binbcd6b is
	port(A: in bit_vector(5 downto 0);
		  D, U: out bit_vector(3 downto 0));
end binbcd6b;

architecture arc of binbcd6b is

signal u0, u1, u2, u3, u4, u5: bit;

component aux_bin_bcd is
	port(A: in bit_vector(3 downto 0);
		  S: out bit_vector(3 downto 0));
end component;

begin
	D(3) <= '0';
	aux0 : aux_bin_bcd port map(A(3) => '0', A(2) => A(5), A(1) => A(4), A(0) => A(3),
										 S(3) => D(2), S(2) => u2, S(1) => u1, S(0) => u0);
	aux1 : aux_bin_bcd port map(A(3) => u2, A(2) => u1, A(1) => u0, A(0) => A(2),
										 S(3) => D(1), S(2) => u5, S(1) => u4, S(0) => u3);
    aux2 : aux_bin_bcd port map(A(3) => u5, A(2) => u4, A(1) => u3, A(0) => A(1),
										 S(3) => D(0), S(2) => U(3), S(1) => U(2), S(0) => U(1));
	U(0) <= A(0);
end arc;