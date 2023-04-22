library ieee; --biblioteca
use ieee_bit_1164.all; --pacotes

--entidade
entity or_gate is 
    port(
        a, b : in bit;
        z    : out bit
    );
end entity or_gate;

--arquitetura
architecture main of or_gate is
    begin
        z <= a or b;    
end architecture main;