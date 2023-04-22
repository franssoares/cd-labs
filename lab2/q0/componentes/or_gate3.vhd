--bibliotecas
library ieee; 
use IEEE.bit_1164.all;

--entidade
entity or_gate3 is
    port(
        i1,i2,i3 : in bit;
        o0 : out bit
    );
end entity or_gate3;

--arquitetura
architecture main of or_gate3 is

begin
	o0 <= i1 and i2 and i3;

end architecture main;