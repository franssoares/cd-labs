--bibliotecas
library ieee; 
use ieee.std_logic_1164.all;

--entidade
entity mux_2x1_port is
    port(
        i0,i1,s : in bit;
        m       : out bit
    );
end entity mux_2x1_port;

--arquitetura
architecture RTL of mux_2x1_port is
    begin
        m <= i0 and not(s) or i1 and s;
end architecture RTL;