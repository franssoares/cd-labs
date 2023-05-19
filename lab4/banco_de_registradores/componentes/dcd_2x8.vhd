-- Biblioteca
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Entidade
ENTITY dcd_2x8 IS
	PORT(
		i0, i1, en : IN STD_LOGIC;
		d : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END ENTITY dcd_2x8;

-- Arquitetura
ARCHITECTURE behav OF dcd_2x8 IS

-- Comportamento
BEGIN
	d(0) <= NOT(i0) AND NOT(i1) AND en;
	d(1) <= NOT(i0) AND i1 AND en;
	d(2) <= i0 AND NOT(i1) AND en;
	d(3) <= i0 AND i1 AND en;
END ARCHITECTURE behav;