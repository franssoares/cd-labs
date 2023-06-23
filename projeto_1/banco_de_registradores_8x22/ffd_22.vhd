-- Biblioteca
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Entidade
ENTITY ffd_22 IS
	PORT(
	    d: IN STD_LOGIC_VECTOR(21 DOWNTO 0);
       clk, load : IN STD_LOGIC;
       q : OUT STD_LOGIC_VECTOR(21 DOWNTO 0)
	);
END ENTITY ffd_22;

-- Arquitetura
ARCHITECTURE behav OF ffd_22 IS

-- Comportamento
BEGIN
    PROCESS(clk, load)
    BEGIN
        IF((RISING_EDGE(clk)) AND (load = '1')) THEN
                q <= d;
        END IF;
    END PROCESS;
END ARCHITECTURE behav;