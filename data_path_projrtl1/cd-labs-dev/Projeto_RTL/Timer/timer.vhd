-- Bibliotecas
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Entidade
ENTITY timer IS
	PORT(
		CLK, RESET, LOAD : IN STD_LOGIC;
		T : OUT STD_LOGIC;
		OUT_DATA : OUT STD_LOGIC_VECTOR(21 DOWNTO 0)
	);
END ENTITY timer;

-- Arquitetura
ARCHITECTURE behav OF timer IS

	-- Componente

	COMPONENT counter IS
		 port(
			  in_data : IN STD_LOGIC_VECTOR(21 DOWNTO 0);
			  out_data : OUT STD_LOGIC_VECTOR(21 DOWNTO 0);
			  clk, load, clear : IN STD_LOGIC;
			  t : OUT STD_LOGIC
		);
	END COMPONENT counter;

-- Comportamento
BEGIN
	
	counter0 : counter
	PORT MAP(
		in_data => "0000000000000000000000",
		clk => CLK,
		load => LOAD,
		clear => RESET,
		out_data => OUT_DATA,
		t => T
	);
	
END ARCHITECTURE behav;