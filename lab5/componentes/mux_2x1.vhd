-- Bibliotecas
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Entidade
ENTITY mux_2x1 IS
	PORT(
		i0, i1, sel : IN STD_LOGIC;
		o : OUT STD_LOGIC
	);
END ENTITY mux_2x1;

-- Arquitetura
ARCHITECTURE behav OF mux_2x1 IS

-- Comportamento
BEGIN

	o <= (i0 AND NOT(sel)) OR (i1 AND sel);

END ARCHITECTURE behav;