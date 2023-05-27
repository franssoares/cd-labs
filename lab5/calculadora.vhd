-- Bibliotecas
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Entidade
ENTITY calculadora IS

	-- Constante
	GENERIC(
		tam : integer :=5
	);
	
	PORT(
		A, B : IN STD_LOGIC_VECTOR(tam DOWNTO 0);
		f, clk, load : IN STD_LOGIC;
		S : OUT STD_LOGIC_VECTOR(tam DOWNTO 0)
	);
	
END ENTITY calculadora;

-- Arquitetura
ARCHITECTURE comp OF calculadora IS

	-- 1) Componente: adder
	COMPONENT adder IS
		GENERIC(
			tam : integer :=5
		);		
		PORT(
			A, B : IN STD_LOGIC_VECTOR(tam DOWNTO 0);
			sub : IN STD_LOGIC;
			S : OUT STD_LOGIC_VECTOR(5 DOWNTO 0)
		);
	END COMPONENT adder;
	
	-- 2) Componente: Registrador de 6 bits
	COMPONENT reg_ff_d_6bits IS
		PORT(
			D_reg : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
			clk_reg, load : IN STD_LOGIC;
			Q_reg, Q_bar_reg : OUT STD_LOGIC_VECTOR(5 DOWNTO 0)
		); 
	END COMPONENT reg_ff_d_6bits;
	
	-- Fios
	SIGNAL out_adder : STD_LOGIC_VECTOR(5 DOWNTO 0);
  
-- Comportamento
BEGIN	

	-- Instancias
	int0 : adder
	PORT MAP(
		A => A,
		B => B,
		sub => f,
		S => out_adder
	);
	
	int1 : reg_ff_d_6bits
	PORT MAP(
		D_reg => out_adder,
		clk_reg => clk,
		load => load,
		Q_reg => S,
		Q_bar_reg => open -- NOT USED: Variável interna da componente não utilizada
	);

END ARCHITECTURE comp;