library ieee;
use ieee.std_logic_1164.all;

entity control_logic is
    port(A: in bit_vector(3 downto 0);
         L, S, R, T, E: in bit;
	 led_L, led_S, reset, ld_hour, ld_last, show: out bit;
	 N: out bit_vector(3 downto 0));
end control_logic;

architecture arc of control_logic is

signal aux0, aux1: bit;

begin

    -- leds
    led_L <= A(2) or A(1);
    led_S <= A(0);
    
    -- sinais ao datapath
    reset <= not A(3);
    ld_hour <= A(2);
    ld_last <= A(1);
    show <= A(0);
    
    -- sinais auxiliares
    aux0 <= not (R or T);
    aux1 <= A(3) and not A(2) and not A(1) and not A(0);
    
    -- novo estado
    N(3) <= aux0;
    N(2) <= aux0 and aux1 and not S and L and E;
    N(1) <= aux0 and aux1 and not S and L and not E;
    N(0) <= aux0 and aux1 and S;
    
end arc;
