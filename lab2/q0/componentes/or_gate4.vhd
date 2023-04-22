--bibliotecas
library ieee; 
use IEEE.bit_1164.all;

--entidade
entity or_gate4 is
    port(
        i1,i2,i3,i4 : in bit;
        o0 : out bit
    );
end entity or_gate4;

--arquitetura
architecture main of or_gate4 is

begin
	o0 <= i1 and i2 and i3 and i4;

end architecture main;