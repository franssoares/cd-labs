-- Bibliotecas
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
-- PAREI AQUI: IMPLEMENTAR UM FULL ADDER DE 22 BITS :<
-- Entidade
ENTITY full_adder IS
	
	GENERIC(
		tam : INTEGER :=21
	);
	
	PORT(
		a, b : IN STD_LOGIC;
		cin : IN STD_LOGIC;
		s : OUT STD_LOGIC;
		co : OUT STD_LOGIC
	);
END ENTITY full_adder;

-- Arquitetura
ARCHITECTURE behav OF full_adder IS

-- Comportamento
BEGIN

	co <= (b AND cin) OR (a AND cin) OR (a AND b);
	s <= a XOR b XOR cin;
	
END ARCHITECTURE behav;
