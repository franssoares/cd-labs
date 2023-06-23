-- Bibliotecas
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Entidade
ENTITY full_adder_6 IS

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
	
END ENTITY full_adder_6;

-- Arquitetura
ARCHITECTURE comp OF full_adder_6 IS

	-- Declaracao da componente
	COMPONENT full_adder IS
		PORT(
			a, b : IN STD_LOGIC;
			cin : IN STD_LOGIC;
			s : OUT STD_LOGIC;
			co : OUT STD_LOGIC
		);
	END COMPONENT full_adder;

	SIGNAL fa_6bits_wires : STD_LOGIC_VECTOR(4 DOWNTO 0);

BEGIN
	-- Instancias, objeto da componente full_adder
	inst0_fa : full_adder
	PORT MAP(
		a => a(0),
		b => b(0),
		cin => cin,
		co => fa_6bits_wires(0),
		s => s(0)
	);
	
	inst1_fa : full_adder
	PORT MAP(
		a => a(1),
		b => b(1),
		cin => fa_6bits_wires(0),
		co => fa_6bits_wires(1),
		s => s(1)
	);
	
	inst2_fa : full_adder
	PORT MAP(
		a => a(2),
		b => b(2),
		cin => fa_6bits_wires(1),
		co => fa_6bits_wires(2),
		s => s(2)
	);
	
	inst3_fa : full_adder
	PORT MAP(
		a => a(3),
		b => b(3),
		cin => fa_6bits_wires(2),
		co => fa_6bits_wires(3),
		s => s(3)
	);
	
	inst4_fa : full_adder
	PORT MAP(
		a => a(4),
		b => b(4),
		cin => fa_6bits_wires(3),
		co => fa_6bits_wires(4),
		s => s(4)
	);
	
	inst5_fa : full_adder
	PORT MAP(
		a => a(5),
		b => b(5),
		cin => fa_6bits_wires(4),
		co => co,
		s => s(5)
	);
	
END ARCHITECTURE comp;