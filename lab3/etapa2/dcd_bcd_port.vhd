--bibliotecas
library ieee; 
use ieee.std_logic_1164.all;

--entidade
entity dcd_bcd is
    port(
        a : in bit_Vector(3 downto 0);
        s : out bit_Vector(6 downto 0)
    );
end entity dcd_bcd;

--arquitetura
architecture RTL of dcd_bcd is

    --inicio do comportamento
    begin
        s(0) <= (not(a(0)) and not(a(1)) and not(a(2)) and not(a(3)))
                or (not(a(0)) and not(a(1)) and a(2) and not(a(3)))
                or (a(0) and a(1) and not(a(2)) and not(a(3)))
                or (a(0) and not(a(1)) and a(2) and not(a(3)))
                or (not(a(0)) and a(1) and a(2) and not(a(3)))
                or (a(0) and a(1) and a(2) and not(a(3)))
                or (not(a(0)) and not(a(1)) and not(a(2)) and not(a(3)))
                or ((not(a(0)) and not(a(1)) and not(a(2)) and a(3)))
                or (a(0) and not(a(1)) and not(a(2)) and a(3));

        s(1) <= (not(a(0)) and not(a(1)) and not(a(2)) and not(a(3)))
                or (a(0) and not(a(1)) and not(a(2)) and not(a(3)))
                or (not(a(0)) and a(1) and not(a(2)) and not(a(3)))
                or (a(0) and a(1) and not(a(2)) and not(a(3)))
                or (not(a(0)) and not(a(1)) and a(2) and not(a(3)))
                or (a(0) and a(1) and a(2) and not(a(3)))
                or (not(a(0)) and not(a(1)) and not(a(2)) and a(3))
                or (a(0) and not(a(1)) and not(a(2)) and a(3));
        
        s(2) <= (not(a(0)) and not(a(1)) and not(a(2)) and not(a(3)))
                or (a(0) and not(a(1)) and not(a(2)) and not(a(3)))
                or (a(0) and a(1) and not(a(2)) and not(a(3)))
                or (not(a(0)) and not(a(1)) and a(2) and not(a(3)))
                or (a(0) and not(a(1)) and a(2) and not(a(3)))
                or (not(a(0)) and a(1) and a(2) and not(a(3)))
                or (a(0) and a(1) and a(2) and not(a(3)))
                or (not(a(0)) and not(a(1)) and not(a(2)) and a(3))
                or (a(0) and not(a(1)) and not(a(2)) and a(3));
        
        s(3) <= (not(a(0)) and not(a(1)) and not(a(2)) and not(a(3)))
                or (not(a(0)) and a(1) and not(a(2)) and not(a(3)))
                or (a(0) and a(1) and not(a(2)) and not(a(3)))
                or (a(0) and not(a(1)) and a(2) and not(a(3)))
                or (not(a(0)) and a(1) and a(2) and not(a(3)))
                or (not(a(0)) and not(a(1)) and not(a(2)) and a(3));
        
        s(4) <= (not(a(0)) and not(a(1)) and not(a(2)) and not(a(3)))
                or (not(a(0)) and a(1) and not(a(2)) and not(a(3)))
                or (not(a(0)) and a(1) and a(2) and not(a(3)))
                or (not(a(0)) and not(a(1)) and not(a(2)) and a(3))
                or (not(a(0)) and not(a(1)) and not(a(2)) and not(a(3)));
        
        s(5) <= (not(a(0)) and not(a(1)) and not(a(2)) and not(a(3)))
                or (not(a(0)) and not(a(1)) and a(2) and not(a(3)))
                or (a(0) and not(a(1)) and a(2) and not(a(3)))
                or (not(a(0)) and a(1) and a(2) and not(a(3)))
                or (not(a(0)) and not(a(1)) and not(a(2)) and a(3))
                or (a(0) and not(a(1)) and not(a(2)) and a(3));

        s(6) <= (not(a(0)) and a(1) and not(a(2)) and not(a(3)))
                or (a(0) and a(1) and not(a(2)) and not(a(3)))
                or (not(a(0)) and not(a(1)) and a(2) and not(a(3)))
                or (a(0) and not(a(1)) and a(2) and not(a(3)))
                or (not(a(0)) and a(1) and a(2) and not(a(3)))
                or (not(a(0)) and not(a(1)) and not(a(2)) and a(3))
                or (a(0) and not(a(1)) and not(a(2)) and a(3));

end architecture RTL;