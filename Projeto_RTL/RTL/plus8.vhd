library ieee;
use ieee.std_logic_1164.all;

entity plus8 is
    port(a: in bit_vector(4 downto 0); 
         ci: in bit;
	 s: out bit_vector(4 downto 0);
	 co: out bit);
end plus8;

architecture arc of plus8 is

signal u: bit_vector(4 downto 0);

component adder5b is
    port(a, b: in bit_vector(4 downto 0); 
         ci: in bit;
	 s: out bit_vector(4 downto 0);
	 co: out bit);
end component;

begin    
    u <= "01000";
    add0 : adder5b port map(a => a, b => u, ci => ci,
			    co => co, s => s);
end arc;
