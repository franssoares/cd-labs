-- Bibliotecas
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Entidade
ENTITY sum_sub IS

	-- Constante
	GENERIC(
		tam : integer :=5
	);
	
	PORT(
		a, b : IN STD_LOGIC_VECTOR(tam DOWNTO 0);
		cin : IN STD_LOGIC;
		s : OUT STD_LOGIC_VECTOR(tam DOWNTO 0);
		co : OUT STD_LOGIC
	);
	
END ENTITY sum_sub;

-- Arquitetura
ARCHITECTURE comp OF sum_sub IS

	-- 1) Componente: Full Adder 6 bits
	COMPONENT full_adder_6bits IS
		GENERIC(
			tam : integer :=5
		);
		PORT(
			a, b : IN STD_LOGIC_VECTOR(tam DOWNTO 0);
			cin : IN STD_LOGIC;
			s : OUT STD_LOGIC_VECTOR(tam DOWNTO 0);
			co : OUT STD_LOGIC
		);
	END COMPONENT full_adder_6bits;
	
-- Comportamento
BEGIN

	-- Instancias
	inst0_full_adder_6bits : full_adder_6bits
	PORT MAP(
		a => a,
		b => b,
		cin => cin,
		s => s,
		co => co
	);
	
END ARCHITECTURE comp;