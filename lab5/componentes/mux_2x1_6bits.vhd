-- Bibliotecas
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Entidade
ENTITY mux_2x1_6bits IS

	-- Constante
	GENERIC(
		tam : integer :=5
	);
	
	PORT(
		i0, i1 : IN STD_LOGIC_VECTOR(tam DOWNTO 0);
		sel : IN STD_LOGIC;
		o : OUT STD_LOGIC_VECTOR(tam DOWNTO 0)
	);
	
END ENTITY mux_2x1_6bits;

-- Arquitetura
ARCHITECTURE comp OF mux_2x1_6bits IS

	-- Componente mux_2x1
	COMPONENT mux_2x1 IS
		PORT(
			i0, i1, sel : IN STD_LOGIC;
			o : OUT STD_LOGIC
		);
	END COMPONENT mux_2x1;

-- Comportamento
BEGIN

	-- Instancias
	inst0_mux_2x1 : mux_2x1
	PORT MAP(
		i0 => i0(0),
		i1 => i1(0),
		sel => sel,
		o => o(0)
	);
	
	inst1_mux_2x1 : mux_2x1
	PORT MAP(
		i0 => i0(1),
		i1 => i1(1),
		sel => sel,
		o => o(1)
	);
	
	inst2_mux_2x1 : mux_2x1
	PORT MAP(
		i0 => i0(2),
		i1 => i1(2),
		sel => sel,
		o => o(2)
	);
	
	inst3_mux_2x1 : mux_2x1
	PORT MAP(
		i0 => i0(3),
		i1 => i1(3),
		sel => sel,
		o => o(3)
	);
	
	inst4_mux_2x1 : mux_2x1
	PORT MAP(
		i0 => i0(4),
		i1 => i1(4),
		sel => sel,
		o => o(4)
	);
	
	inst5_mux_2x1 : mux_2x1
	PORT MAP(
		i0 => i0(5),
		i1 => i1(5),
		sel => sel,
		o => o(5)
	);
END ARCHITECTURE comp;