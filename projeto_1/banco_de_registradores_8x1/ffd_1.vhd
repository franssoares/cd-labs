-- Biblioteca
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Entidade
ENTITY ffd_1 IS
	PORT(
	    d: IN STD_LOGIC;
       clk, load : IN STD_LOGIC;
       q : OUT STD_LOGIC
	);
END ENTITY ffd_1;

-- Arquitetura
ARCHITECTURE behav OF ffd_1 IS

-- Comportamento
BEGIN
    PROCESS(clk, load)
    BEGIN
        IF((RISING_EDGE(clk)) AND (load = '1')) THEN
                q <= d;
        END IF;
    END PROCESS;
END ARCHITECTURE behav;