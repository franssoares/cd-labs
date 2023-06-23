library ieee;
use ieee.std_logic_1164.all;

entity debouncer_logic is
    port(A: in bit_vector(1 downto 0);
         bi: in bit;
         N: out bit_vector(1 downto 0);
         bo: out bit);
end debouncer_logic;

architecture arc of debouncer_logic is

begin
    N(1) <= not A(0) and bi;
    N(0) <= bi;
    bo <= A(1) and A(0);
end arc;