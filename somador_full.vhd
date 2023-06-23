library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity SOMADOR_FULL is

port(
	CIN : in std_logic;
	A : in std_logic;
	B : in std_logic;
	S : out std_logic;
	COUT : out std_logic
);
end SOMADOR_FULL;

architecture main of SOMADOR_FULL is
begin
	COUT <= (not(A) and B and CIN) or (A and not(B) and CIN) or (A and B and not(CIN));
	S <= (not(A)and not(B) and CIN) or (not(A) and B and not(CIN)) or (A and not(B) and CIN) or (A and B and CIN);
end architecture main;