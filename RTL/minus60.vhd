library ieee;
use ieee.std_logic_1164.all;

entity minus60 is
    port(a: in bit_vector(5 downto 0); 
         ci: in bit;
	 s: out bit_vector(5 downto 0);
	 co: out bit);
end minus60;

architecture arc of minus60 is

signal u: bit_vector(5 downto 0);

component sub6b is
    port(a, b: in bit_vector(5 downto 0); 
         ci: in bit;
	 s: out bit_vector(5 downto 0);
	 co: out bit);
end component;

begin    
    u <= "111100";
    sub0 : sub6b port map(a => a, b => u, ci => ci, 
			  co => co, s => s);
end arc;
