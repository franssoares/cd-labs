library ieee;
use ieee.std_logic_1164.all;

entity sub_hour is
    port(a, b: in bit_vector(4 downto 0);
         ci: in bit;
	 s: out bit_vector(4 downto 0);
	 co: out bit);
end sub_hour;

architecture arc of sub_hour is

signal u0, u1: bit_vector(4 downto 0);
signal v0, v1: bit;

component sub5b is
    port(a, b: in bit_vector(4 downto 0); 
         ci: in bit;
	 s: out bit_vector(4 downto 0);
	 co: out bit);
end component;

component minus8 is
    port(a: in bit_vector(4 downto 0); 
         ci: in bit;
	 s: out bit_vector(4 downto 0);
	 co: out bit);
end component;

component mux2x1_5b is
    port(a, b: in bit_vector(4 downto 0);
         k: in bit;
	 s: out bit_vector(4 downto 0));
end component;

begin
    sub0 : sub5b port map(a => a, b => b, ci => ci, s => u1, co => v0);			   
    m8: minus8 port map(a => u1, ci => '0', s => u0, co => v1);			   
    mux0 : mux2x1_5b port map(a => u0, b => u1, k => v0, s => s);
    co <= v0;
end arc;
