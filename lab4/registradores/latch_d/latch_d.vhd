--biblioteca
LIBRARY ieee;
USE ieee.std_logic_1164.all;

--entidade
ENTITY latchd IS
	PORT(
		D, c : IN  std_logic;
		Q, Q_bar : OUT  std_logic
	);
END;

--arquitetura
ARCHITECTURE behav OF latchd IS

--comportamento da borda de subida
BEGIN
	PROCESS(D, c)
	BEGIN
		IF(c = '1' and D = '1') THEN
			Q <= '1';
			Q_bar <= '0';
		ELSIF (c = '1' and D = '0') THEN
			Q <= '0';
			Q_bar <= '1';
		END IF;
	END PROCESS;
END;