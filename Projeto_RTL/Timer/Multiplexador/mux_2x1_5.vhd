-- Bibliotecas
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Entidade
ENTITY mux_2x1_5 IS
	GENERIC(
		w : INTEGER := 4
	); 
   PORT(
		i0, i1 : IN STD_LOGIC_VECTOR(w DOWNTO 0);
      sel : IN STD_LOGIC;
      o : OUT STD_LOGIC_VECTOR(w DOWNTO 0)
   );
END ENTITY mux_2x1_5;

-- Arquitetura
ARCHITECTURE behav OF mux_2x1_5 IS
	COMPONENT mux_2x1 IS
		PORT(
			i0, i1 : IN STD_LOGIC;
			sel : IN STD_LOGIC;
			o : OUT STD_LOGIC
		);
	END COMPONENT mux_2x1;

-- Comportamento
BEGIN

	mux0 : mux_2x1
	PORT MAP(
		i0 => i0(0),
		i1 => i1(0),
		o => o(0),
		sel => sel
	);
	
	mux1 : mux_2x1
	PORT MAP(
		i0 => i0(1),
		i1 => i1(1),
		o => o(1),
		sel => sel
	);
	
	mux2 : mux_2x1
	PORT MAP(
		i0 => i0(2),
		i1 => i1(2),
		o => o(2),
		sel => sel
	);
	
	mux3 : mux_2x1
	PORT MAP(
		i0 => i0(3),
		i1 => i1(3),
		o => o(3),
		sel => sel
	);
	
	mux4 : mux_2x1
	PORT MAP(
		i0 => i0(4),
		i1 => i1(4),
		o => o(4),
		sel => sel
	);

END ARCHITECTURE behav;