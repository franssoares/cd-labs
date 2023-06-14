-- Bibliotecas
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Entidade
ENTITY timer IS
	PORT(
		CLK, RESET : IN STD_LOGIC;
		T : OUT STD_LOGIC;
		OUT_DATA : OUT STD_LOGIC_VECTOR(21 DOWNTO 0)
	);
END ENTITY timer;

-- Arquitetura
ARCHITECTURE behav OF timer IS

	-- Componentes
	COMPONENT counter IS
		 PORT(
			in_data : IN STD_LOGIC_VECTOR(21 DOWNTO 0);
         out_data : OUT STD_LOGIC_VECTOR(21 DOWNTO 0);
         clk, load : IN STD_LOGIC;
		   t : OUT STD_LOGIC
		 );
	END COMPONENT counter;
	
	COMPONENT divide_freq IS
		PORT(
			clk_60hz : IN STD_LOGIC;
			clk_1hz : OUT STD_LOGIC
		);
	END COMPONENT divide_freq;
	
	-- Fio
	SIGNAL wire : STD_LOGIC;

-- Comportamento
BEGIN

	-- Instacia
	divfrq : divide_freq
	PORT MAP(
		clk_60hz => clk,
		clk_1hz => wire
	);
	
	counter0 : counter
	PORT MAP(
		in_data => "0000000000000000000000", -- IN_DATA vem do registrador que devo criar
		clk => wire,
		load => "1",
		out_data => OUT_DATA,
		t => T
	);
	
	RESET <= load
	

END ARCHITECTURE behav;
