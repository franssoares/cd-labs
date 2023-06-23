LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Entidade
ENTITY dcd_3x8 IS
	PORT(
		i0, i1, i2, en : IN STD_LOGIC;
		d : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END ENTITY dcd_3x8;

-- Arquitetura
ARCHITECTURE behav OF dcd_3x8 IS

-- Comportamento
BEGIN
	d(0) <= NOT(i0) AND NOT(i1) AND NOT(i2) AND en;
	d(1) <= NOT(i0) AND NOT(i1) AND i2 AND en;
	d(2) <= NOT(i0) AND i1 AND NOT(i2) AND en;
	d(3) <= NOT(i0) AND i1 AND i2 AND en;
	d(4) <= i0 AND NOT(i1) AND NOT(i2) AND en;
	d(5) <= i0 AND NOT(i1) AND i2 AND en;
	d(6) <= i0 AND i1 AND NOT(i2) AND en;
	d(7) <= i0 AND i1 AND i2 AND en;
END ARCHITECTURE behav;