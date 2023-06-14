-- Bibliotecas
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Entidade
ENTITY divide_freq IS
	PORT(
		clk_60hz : IN STD_LOGIC;
		clk_1hz : OUT STD_LOGIC
	);
END ENTITY divide_freq;

-- Arquitetura
ARCHITECTURE behav OF divide_freq IS

	-- Componentes
	COMPONENT counter_wload_6 IS
		GENERIC(
			  w : INTEGER := 5
		 );
		 port(
			 in_data : IN STD_LOGIC_VECTOR(w DOWNTO 0);
			 out_data : OUT STD_LOGIC_VECTOR(w DOWNTO 0);
			 clk, load : IN STD_LOGIC;
			 sig : OUT STD_LOGIC
		 );
	END COMPONENT counter_wload_6;

-- Comportamento
BEGIN

	-- Instacia
	div : counter_wload_6
	PORT MAP(
		in_data => "000000",
		out_data => open,
		clk => clk_60hz,
		load => '1',
		sig => clk_1hz	
	);

END ARCHITECTURE behav;
