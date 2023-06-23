library ieee;
use ieee.std_logic_1164.all;

entity plus4 is
    port(a: in bit_vector(5 downto 0); 
         ci: in bit;
	 s: out bit_vector(5 downto 0);
	 co: out bit);
end plus4;

architecture arc of plus4 is

signal u: bit_vector(5 downto 0);

component adder6b is
    port(a, b: in bit_vector(5 downto 0); 
         ci: in bit;
	 s: out bit_vector(5 downto 0);
	 co: out bit);
end component;

begin    
    u <= "000100";
    add0 : adder6b port map(a => a, b => u, ci => ci, 
                               co => co, s => s);
end arc;
