library ieee;
use ieee.std_logic_1164.all;

entity debouncer is
    port(bi, clk: in bit;
         bo: out bit);
end debouncer;

architecture arc of debouncer is

signal u, v: bit_vector(1 downto 0);

component debouncer_logic is
    port(A: in bit_vector(1 downto 0);
         bi: in bit;
         N: out bit_vector(1 downto 0);
         bo: out bit);
end component;

component reg2b is
    port(clk, load, clr: in bit;
         D: in bit_vector(1 downto 0);
         Q: out bit_vector(1 downto 0));
end component;

begin
    logic: debouncer_logic port map(A => u, bi => bi, N => v, bo => bo);
    reg: reg2b port map(clk => clk, load => '1', clr => '0', D => v, Q => u);
end arc;