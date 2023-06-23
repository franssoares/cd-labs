library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity SOMADOR_HALF is

port(
	A_HALF : in std_logic;
	B_HALF : in std_logic;
	S_HALF : out std_logic;
	COUT_HALF : out std_logic
);
end SOMADOR_HALF;

architecture main of SOMADOR_HALF is
begin
	COUT_HALF <= A_HALF and B_HALF;
	S_HALF <= (not(A_HALF)and B_HALF) or (A_HALF and not(B_HALF));
end architecture main;