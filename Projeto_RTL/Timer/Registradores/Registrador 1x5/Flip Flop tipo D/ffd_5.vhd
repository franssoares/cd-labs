-- Bibliotecas
LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Entidade
ENTITY ffd_5 IS
	PORT(
		D, clk, load, clear : IN STD_LOGIC;
        Q, Q_bar : OUT STD_LOGIC
	);
END ENTITY ffd_5;

-- Arquitetura
ARCHITECTURE behav OF ffd_5 IS
BEGIN
	PROCESS (D, clk)
	BEGIN
		IF clear = '1' THEN
			Q <= '0';
			Q_bar <= '1'; 
		ELSIF (rising_edge(clk)) THEN
			IF (D = '1' AND load = '1') THEN
				Q <= '1';
				Q_bar <= '0';
			ELSIF (D = '0' AND load = '1') THEN
				Q <= '0';
				Q_bar <= '1'; 
			END IF;
		END IF;
	END PROCESS;
END ARCHITECTURE behav;