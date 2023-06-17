library ieee;
use ieee.std_logic_1164.all;

entity binbcd11b is
	port(A: in bit_vector(10 downto 0);
		  M, C, D, U: out bit_vector(3 downto 0));
end binbcd11b;

architecture arc of binbcd11b is

signal u0, u1, u2, u3, u4, u5, u6, u7, u8, u9, u10, u11,
       u12, u13, u14, u15, u16, u17, u18, u19, u20, u21, u22, u23,
       u24, u25, u26, u27, u28, u29, u30, u31, u32, u33, u34, u35,
       u36, u37, u38, u39, u40, u41, u42, u43, u44, u45, u46, u47: bit;

component aux_bin_bcd is
	port(A: in bit_vector(3 downto 0);
		  S: out bit_vector(3 downto 0));
end component;

begin

	M(3) <= '0';
	M(2) <= '0';
	aux0 : aux_bin_bcd port map(A(3) => '0', A(2) => A(10), A(1) => A(9), A(0) => A(8),
										 S(3) => u3, S(2) => u2, S(1) => u1, S(0) => u0);
	aux1 : aux_bin_bcd port map(A(3) => u2, A(2) => u1, A(1) => u0, A(0) => A(7),
										 S(3) => u7, S(2) => u6, S(1) => u5, S(0) => u4);
	aux2 : aux_bin_bcd port map(A(3) => u6, A(2) => u5, A(1) => u4, A(0) => A(6),
										 S(3) => u11, S(2) => u10, S(1) => u9, S(0) => u8);
	aux3 : aux_bin_bcd port map(A(3) => u10, A(2) => u9, A(1) => u8, A(0) => A(5),
										 S(3) => u15, S(2) => u14, S(1) => u13, S(0) => u12);
    aux4 : aux_bin_bcd port map(A(3) => '0', A(2) => u3, A(1) => u7, A(0) => u11,
										 S(3) => u19, S(2) => u18, S(1) => u17, S(0) => u16);
	aux5 : aux_bin_bcd port map(A(3) => u14, A(2) => u13, A(1) => u12, A(0) => A(4),
										 S(3) => u23, S(2) => u22, S(1) => u21, S(0) => u20);
    aux6 : aux_bin_bcd port map(A(3) => u18, A(2) => u17, A(1) => u16, A(0) => u15,
										 S(3) => u27, S(2) => u26, S(1) => u25, S(0) => u24);
	aux7 : aux_bin_bcd port map(A(3) => u22, A(2) => u21, A(1) => u20, A(0) => A(3),
										 S(3) => u31, S(2) => u30, S(1) => u29, S(0) => u28);
    aux8 : aux_bin_bcd port map(A(3) => u26, A(2) => u25, A(1) => u24, A(0) => u23,
										 S(3) => u35, S(2) => u34, S(1) => u33, S(0) => u32);
	aux9 : aux_bin_bcd port map(A(3) => u30, A(2) => u29, A(1) => u28, A(0) => A(2),
										 S(3) => u39, S(2) => u38, S(1) => u37, S(0) => u36);
    aux10 : aux_bin_bcd port map(A(3) => u34, A(2) => u33, A(1) => u32, A(0) => u31,
										 S(3) => u43, S(2) => u42, S(1) => u41, S(0) => u40);
	aux11 : aux_bin_bcd port map(A(3) => '0', A(2) => u19, A(1) => u27, A(0) => u35,
										 S(3) => M(1), S(2) => u46, S(1) => u45, S(0) => u44);
    aux12 : aux_bin_bcd port map(A(3) => u38, A(2) => u37, A(1) => u36, A(0) => A(1),
										 S(3) => D(0), S(2) => U(3), S(1) => U(2), S(0) => U(1));
	aux13 : aux_bin_bcd port map(A(3) => u42, A(2) => u41, A(1) => u40, A(0) => u39,
										 S(3) => C(0), S(2) => D(3), S(1) => D(2), S(0) => D(1));
    aux14 : aux_bin_bcd port map(A(3) => u46, A(2) => u45, A(1) => u44, A(0) => u43,
										 S(3) => M(0), S(2) => C(3), S(1) => C(2), S(0) => C(1));
	U(0) <= A(0);

end arc;