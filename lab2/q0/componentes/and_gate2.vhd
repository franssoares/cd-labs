--bibliotecas
library ieee; 
use IEEE.bit_1164.all;

--entidade
entity and_gate2 is
    port(
        i1,i2 : in bit;
        o0 : out bit
    );
end entity and_gate2;

--arquitetura
architecture main of and_gate2 is

begin
	o0 <= i1 and i2;

end architecture main;