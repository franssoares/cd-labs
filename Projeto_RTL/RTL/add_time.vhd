library ieee;
use ieee.std_logic_1164.all;

entity add_time is
    port(a, b: in bit_vector(21 downto 0);
         ci: in bit;
         s: out bit_vector(21 downto 0);
         co: out bit);
end add_time;

architecture arc of add_time is

signal seg0, seg1, seg2, min0, min1, min2: bit_vector(5 downto 0);
signal hour0, hour1, hour2, day0, day1, day2: bit_vector(4 downto 0);
signal u0, u1, u2: bit;

component add_min_seg is
    port(a, b: in bit_vector(5 downto 0);
         ci: in bit;
         s: out bit_vector(5 downto 0);
         co: out bit);
end component;

component add_hour is
    port(a, b: in bit_vector(4 downto 0);
         ci: in bit;
         s: out bit_vector(4 downto 0);
         co: out bit);
end component;

component adder5b is
    port(a, b: in bit_vector(4 downto 0); 
         ci: in bit;
         s: out bit_vector(4 downto 0);
         co: out bit);
end component;

begin

    seg0 <= a(5) & a(4) & a(3) & a(2) & a(1) & a(0);
    seg1 <= b(5) & b(4) & b(3) & b(2) & b(1) & b(0);
    
    min0 <= a(11) & a(10) & a(9) & a(8) & a(7) & a(6);
    min1 <= b(11) & b(10) & b(9) & b(8) & b(7) & b(6);
    
    hour0 <= a(16) & a(15) & a(14) & a(13) & a(12);
    hour1 <= b(16) & b(15) & b(14) & b(13) & b(12);
    
    day0 <= a(21) & a(20) & a(19) & a(18) & a(17);
    day1 <= b(21) & b(20) & b(19) & b(18) & b(17);
    
    seg : add_min_seg port map(a => seg0, b => seg1, ci => ci,
                                s => seg2, co => u0);
    
    min : add_min_seg port map(a => min0, b => min1, ci => u0,
                                s => min2, co => u1);
    
    hour : add_hour port map(a => hour0, b => hour1, ci => u1,
                                s => hour2, co => u2);
    
    day : adder5b port map(a => day0, b => day1, ci => u2,
                                s => day2, co => co);
				
    s <= day2 & hour2 & min2 & seg2;
    
end arc;
