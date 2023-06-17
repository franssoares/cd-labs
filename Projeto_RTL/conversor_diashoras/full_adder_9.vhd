-- Bibliotecas
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Entidade
ENTITY full_adder_9 IS
	PORT(
		a_9, b_9 : IN STD_LOGIC_VECTOR (8 downto 0);
		cin_9 : IN STD_LOGIC;
		s_9 : OUT STD_LOGIC_VECTOR (8 downto 0);
		co_9 : OUT STD_LOGIC
	);
END ENTITY full_adder_9;

-- Arquitetura
ARCHITECTURE behav OF full_adder_9 IS
	COMPONENT full_adder IS
		PORT(
			a, b : IN STD_LOGIC;
			cin : IN STD_LOGIC;
			s : OUT STD_LOGIC;
			co : OUT STD_LOGIC
		);
	END COMPONENT full_adder;
	
	SIGNAL fa_9bits_wires : STD_LOGIC_VECTOR(7 DOWNTO 0);
-- Comportamento
BEGIN

	inst0 : full_adder
	PORT MAP(
		a => a_9(0),
		b => b_9(0),
		cin => cin_9,
		co => fa_9bits_wires(0),
		s => s_9(0)
	);
	
	inst1 : full_adder
	PORT MAP(
		a => a_9(1),
		b => b_9(1),
		cin => fa_9bits_wires(0),
		co => fa_9bits_wires(1),
		s => s_9(1)
	);
	
	inst2 : full_adder
	PORT MAP(
		a => a_9(2),
		b => b_9(2),
		cin => fa_9bits_wires(1),
		co => fa_9bits_wires(2),
		s => s_9(2)
	);
	
	inst3 : full_adder
	PORT MAP(
		a => a_9(3),
		b => b_9(3),
		cin => fa_9bits_wires(2),
		co => fa_9bits_wires(3),
		s => s_9(3)
	);
	
	inst4 : full_adder
	PORT MAP(
		a => a_9(4),
		b => b_9(4),
		cin => fa_9bits_wires(3),
		co => fa_9bits_wires(4),
		s => s_9(4)
	);
	
	inst5 : full_adder
	PORT MAP(
		a => a_9(5),
		b => b_9(5),
		cin => fa_9bits_wires(4),
		co => fa_9bits_wires(5),
		s => s_9(5)
	);
	
	inst6 : full_adder
	PORT MAP(
		a => a_9(6),
		b => b_9(6),
		cin => fa_9bits_wires(5),
		co => fa_9bits_wires(6),
		s => s_9(6)
	);
	
	inst7 : full_adder
	PORT MAP(
		a => a_9(7),
		b => b_9(7),
		cin => fa_9bits_wires(6),
		co => fa_9bits_wires(7),
		s => s_9(7)
	);
	
	inst8 : full_adder
	PORT MAP(
		a => a_9(8),
		b => b_9(8),
		cin => fa_9bits_wires(7),
		co => fa_9bits_wires(8),
		s => s_9(8)
	);
	
END ARCHITECTURE behav;