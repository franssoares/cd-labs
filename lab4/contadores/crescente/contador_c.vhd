-- Biblioteca
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Entidade
ENTITY contador_c IS
	PORT(
		clk: IN BIT;
		ld: IN BIT;
		reset: IN BIT;
		data: IN INTEGER RANGE 15 DOWNTO 0;
		tc: OUT BIT;
		q: OUT INTEGER RANGE 15 DOWNTO 0
	);
END ENTITY contador_c;

-- Arquitetura
ARCHITECTURE main OF contador_c IS

-- Comportamento
BEGIN
	PROCESS(clk, reset)
	VARIABLE qv: INTEGER RANGE 15 DOWNTO 0;
	BEGIN
		IF(reset='1') THEN
			qv := 0;
			ELSIF(clk' event and clk ='1') THEN
				IF(ld='1') THEN
					qv:=data;
				ELSE
				IF(qv >= 15) THEN
					qv := 0;
					tc <= '1';
				ELSE
					tc <= '0';
					qv := qv + 1;
				END IF;
			END IF;
		END IF;
		q <= qv;
	END PROCESS;
END ARCHITECTURE main;