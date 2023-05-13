-- Bibliotecas
LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Entidade
ENTITY latch_d IS
  PORT(
    D, clk : IN  STD_LOGIC;
    Q, Q_bar : OUT  STD_LOGIC
  );
END ENTITY latch_d;

-- Arquitetura
ARCHITECTURE componente OF latch_d IS

--comportamento sensível a nível
BEGIN
  PROCESS(D, clk)
  BEGIN
    IF(clk = '1' AND D = '1') THEN
      Q <= '1';
      Q_bar <= '0';
    ELSIF (clk = '1' AND D = '0') THEN
      Q <= '0';
      Q_bar <= '1';
    END IF;
  END PROCESS;
END ARCHITECTURE componente;