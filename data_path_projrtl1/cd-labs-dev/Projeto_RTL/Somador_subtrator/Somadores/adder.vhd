-- Bibliotecas
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Entidade
ENTITY adder IS

	-- Constante
	GENERIC(
		tam : integer :=21
	);
	
	PORT(
		A, B : IN STD_LOGIC_VECTOR(tam DOWNTO 0);
		sub : IN STD_LOGIC;
		co : OUT STD_LOGIC;
		S : OUT STD_LOGIC_VECTOR(tam DOWNTO 0)
	);
	
END ENTITY adder;

-- Arquitetura
ARCHITECTURE comp OF adder IS

	-- 1) Componente: 22-bit mux 2X1
	COMPONENT mux_2x1_22 IS
			GENERIC(
				tam : integer :=21
			);
			PORT(
				i0, i1 : IN STD_LOGIC_VECTOR(tam DOWNTO 0);
				sel : IN STD_LOGIC;
				o : OUT STD_LOGIC_VECTOR(tam DOWNTO 0)
			);
	END COMPONENT mux_2x1_22;
	
	-- 2) Componente: somador/subtrator
	COMPONENT sum_sub IS
		GENERIC(
			tam : integer :=21
		);
		PORT(
			a, b : IN STD_LOGIC_VECTOR(tam DOWNTO 0);
			cin : IN STD_LOGIC;
			s : OUT STD_LOGIC_VECTOR(tam DOWNTO 0);
			co : OUT STD_LOGIC
		);
	END COMPONENT sum_sub;
	
	-- Fios
	SIGNAL mux_m_wires : STD_LOGIC_VECTOR(21 DOWNTO 0);
	SIGNAL S_wires : STD_LOGIC_VECTOR(21 DOWNTO 0);
	SIGNAL CO_wire : STD_LOGIC;

-- Comportamento
BEGIN
	
	-- Instancias
	insto : mux_2x1_22
	PORT MAP(
		i0 => B,
		i1 => NOT(B),
		sel => sub,
		o => mux_m_wires
	);
	
	inst1o : sum_sub	
	PORT MAP(
		a => A,
		b => mux_m_wires,
		cin => sub,
		s => S,
		co => co
	);

END ARCHITECTURE comp;
