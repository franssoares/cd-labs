-- Bibliotecas
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Entidade
ENTITY full_adder_16 IS

	-- Constante
	GENERIC(
		tam : integer :=15
	);
	
	PORT(
		a, b : IN STD_LOGIC_VECTOR(tam DOWNTO 0);
		cin : IN STD_LOGIC;
		s : OUT STD_LOGIC_VECTOR(tam DOWNTO 0);
		co : OUT STD_LOGIC
	);
	
END ENTITY full_adder_16;

-- Arquitetura
ARCHITECTURE comp OF full_adder_16 IS

	-- Declaracao da componente
	COMPONENT full_adder IS
		PORT(
			a, b : IN STD_LOGIC;
			cin : IN STD_LOGIC;
			s : OUT STD_LOGIC;
			co : OUT STD_LOGIC
		);
	END COMPONENT full_adder;

	SIGNAL fa_16bits_wires : STD_LOGIC_VECTOR(15 DOWNTO 0);

-- Comportamento
BEGIN

-----------------full_adder--------------------
	inst0_fa : full_adder
		PORT MAP(
			a => a(0),
			b => b(0),
			cin => cin,
			co => fa_16bits_wires(0),
			s => s(0)
		);
	
	gen_fa: for i in 1 to 14 generate
		fa : full_adder
			PORT MAP(
				a => a(i),
				b => b(i),
				cin => fa_16bits_wires(i-1),
				co => fa_16bits_wires(i),
				s => s(i)
			);
	end generate gen_fa;	
	
	inst1_fa : full_adder
		PORT MAP(
			a => a(15),
			b => b(15),
			cin => fa_16bits_wires(14),
			co => co,
			s => s(15)
		);
	
-----------------------------------------------

END ARCHITECTURE comp;