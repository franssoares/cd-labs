--bibliotecas
library ieee; 
use ieee.std_logic_1164.all;

--entidade
entity mux_4x1_comp is
    port(
        i0,i1 : in bit_vector(3 downto 0);
        s     : in bit;
        m     : out bit_vector(3 downto 0)
    );
end entity mux_4x1_comp;

--arquitetura
architecture RTL of mux_4x1_comp is
    begin
        m(0) <= (i0(0) and not(s)) or (i1(0) and s);
        m(1) <= (i0(1) and not(s)) or (i1(1) and s);
        m(2) <= (i0(2) and not(s)) or (i1(2) and s);
        m(3) <= (i0(3) and not(s)) or (i1(3) and s);
end architecture RTL;