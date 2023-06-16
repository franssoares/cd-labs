-- Bibliotecas
LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Entidade
ENTITY comparator_5 IS

	-- Constante
    GENERIC(
        w : INTEGER := 4
    );

    port(
        a : IN STD_LOGIC_VECTOR(w DOWNTO 0);
        b : IN STD_LOGIC_VECTOR(w DOWNTO 0); -- comparar com 
        eq : OUT STD_LOGIC
    );
	
END ENTITY comparator_5;

-- Arquitetura
ARCHITECTURE behav OF comparator_5 IS

-- Comportamento: Borda de subida
BEGIN
	eq <= (a(0) xnor b(0)) and (a(1) xnor b(1)) 
          and (a(2) xnor b(2)) and (a(3) xnor b(3)) 
          and (a(4) xnor b(4));
	
END ARCHITECTURE behav;