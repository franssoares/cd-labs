--bibliotecas
library ieee; 
use ieee.std_logic_1164.all;

--entidade
entity mux_2x1_comp is
    port(
        i0,i1,s : in bit;
        m       : out bit
    );
end entity mux_2x1_comp;

--arquitetura
architecture RTL of mux_2x1_comp is
begin
    with s select
        m <= i0 when '0',
             i1 when '1';
end architecture RTL;