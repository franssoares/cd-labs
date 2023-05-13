-- Bibliotecas
LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Entidade
ENTITY ff_d IS
  PORT(
       D, clk : IN STD_LOGIC;
       Q : OUT STD_LOGIC);
END ff_d;

-- Arquitetura
ARCHITECTURE behav OF ff_d IS
BEGIN
  PROCESS (D, clk)
  BEGIN
    IF (clk'EVENT AND clk = '1' AND D = '1') THEN
      Q <= '1';
    ELSIF (rising_edge(clk) AND D = '0') THEN
      Q <= '0';
    END IF; -- " clk'EVENT AND clk = '1' " equivale a "rising_edge(clk)"
  END PROCESS ;
END ARCHITECTURE behav;