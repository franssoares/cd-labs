-- Bibliotecas
LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Entidade
ENTITY ffd_6 IS
	PORT(
		D, clk, load, clear : IN STD_LOGIC;
        Q, Q_bar : OUT STD_LOGIC
	);
END ENTITY ffd_6;

-- Arquitetura
ARCHITECTURE behav OF ffd_6 IS
BEGIN
	PROCESS (D, clk, load)
	BEGIN
		IF clear = '1' THEN
			Q <= '0';
			Q_bar <= '1'; 
		ELSIF (rising_edge(clk)) THEN
			IF (D = '1' AND load = '1') THEN
				Q <= '1';
				Q_bar <= '0';
			ELSIF (load = '1') THEN
				Q <= D;
				Q_bar <= not(D); 
			END IF;
		END IF;
	END PROCESS;
END ARCHITECTURE behav;