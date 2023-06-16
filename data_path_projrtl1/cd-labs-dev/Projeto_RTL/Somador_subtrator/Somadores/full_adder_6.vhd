-- Bibliotecas
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Entidade
ENTITY full_adder_6 IS

	-- Constante
	GENERIC(
		tam : integer :=21
	);
	
	PORT(
		a, b : IN STD_LOGIC_VECTOR(tam DOWNTO 0);
		cin : IN STD_LOGIC_VECTOR (tam downto 0);
		s : OUT STD_LOGIC_VECTOR(tam DOWNTO 0);
		co : OUT STD_LOGIC_VECTOR (tam downto 0)
	);
	
END ENTITY full_adder_6;

-- Arquitetura
ARCHITECTURE comp OF full_adder_6 IS

	-- Declaracao da componente
	COMPONENT full_adder IS
		PORT(
			a, b : IN STD_LOGIC_VECTOR (tam downto 0);
			cin : IN STD_LOGIC_VECTOR (tam downto 0);
			s : OUT STD_LOGIC_VECTOR (tam downto 0);
			co : OUT STD_LOGIC_VECTOR (tam downto 0)
		);
	END COMPONENT full_adder;

	SIGNAL fa_6bits_wires : STD_LOGIC_VECTOR(tam DOWNTO 0);

BEGIN
	-- Instancias, objeto da componente full_adder
	inst0_fa : full_adder
	PORT MAP(
		a => a,
		b => b,
		cin => cin,
		co => fa_6bits_wires,
		s => s
	);
	
END ARCHITECTURE comp;
