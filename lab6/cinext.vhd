library ieee;
use ieee.std_logic_1164.all;

entity cinext is
	port(x, y, z: in bit;
		  cin: out bit);
end cinext;

architecture arc of cinext is

begin
	cin <= (not x and not y and z) or (not x and y and not z);
end arc;