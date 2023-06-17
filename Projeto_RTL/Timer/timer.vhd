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
	COMPONENT counter_seg_6 IS
		 GENERIC(
			  w : INTEGER := 5
		 );
		 port(
			  in_data : IN STD_LOGIC_VECTOR(w DOWNTO 0);
			  out_data : OUT STD_LOGIC_VECTOR(w DOWNTO 0);
			  clk, load, clear : IN STD_LOGIC;
			  sig : OUT STD_LOGIC
		 );
	END COMPONENT counter_seg_6;

	COMPONENT counter IS
		 port(
			  in_data : IN STD_LOGIC_VECTOR(21 DOWNTO 0);
			  out_data : OUT STD_LOGIC_VECTOR(21 DOWNTO 0);
			  clk, load, clear : IN STD_LOGIC;
			  t : OUT STD_LOGIC
		);
	END COMPONENT counter;

	
	-- Fio
	SIGNAL wire : STD_LOGIC;

-- Comportamento
BEGIN

	-- Instacia
	divfrq : counter_seg_6
	PORT MAP(
		in_data => "111011",
		out_data => open,
		clk => CLK,
		clear => RESET,
		load => '1',
		sig => wire
	);
	
	counter0 : counter
	PORT MAP(
		in_data => "1001111000110011111110",
		clk => wire,
		load => LOAD,
		clear => RESET,
		out_data => OUT_DATA,
		t => T
	);
	
END ARCHITECTURE behav;