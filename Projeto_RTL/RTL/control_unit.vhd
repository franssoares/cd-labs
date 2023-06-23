library ieee;
use ieee.std_logic_1164.all;

entity control_unit is
    port(clk, L, S, R, T, E: in bit;
	 led_L, led_S, reset, ld_hour, ld_last, show: out bit);
end control_unit;

architecture arc of control_unit is

signal A, N: bit_vector(3 downto 0);

component control_logic is
    port(A: in bit_vector(3 downto 0);
         L, S, R, T, E: in bit;
	 led_L, led_S, reset, ld_hour, ld_last, show: out bit;
	 N: out bit_vector(3 downto 0));
end component;

component reg4b is
    port(clk, load, clr: in bit;
         D: in bit_vector(3 downto 0);
         Q: out bit_vector(3 downto 0));
end component;

begin

    logic : control_logic port map(A => A, L => L, S => S, R => R, T => T, E => E,
                                   led_L => led_L, led_S => led_S,
                                   reset => reset, ld_hour => ld_hour, ld_last => ld_last, show => show,
                                   N => N);

    reg : reg4b port map(clk => clk, load => '1', clr => R, D => N, Q => A); 
                                   
end arc;