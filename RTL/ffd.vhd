library ieee;
use ieee.std_logic_1164.all;

entity ffd is
    port(clk, load, clr, d: in bit;
         q: out bit);
end ffd;

architecture arc of ffd is
begin
    process (clk, load, clr)
    begin
        if (clr = '1') then
            q <= '0';
        elsif (clk'event and clk = '1') then
            if (load = '1') then
                q <= d;
            end if;
        end if;
    end process;
end arc;
