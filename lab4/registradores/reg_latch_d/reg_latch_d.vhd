-- Bibliotecas
LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Entidade
ENTITY reg_latch_d IS
  PORT(
    D_reg : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	 clk_reg : IN STD_LOGIC;
    Q_reg, Q_bar_reg : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END ENTITY reg_latch_d;

-- Arquitetura
ARCHITECTURE behav OF reg_latch_d IS

	--declaração da componente
    COMPONENT latchd_comp is
        PORT(
            D, clk : IN  STD_LOGIC;
				Q, Q_bar : OUT  STD_LOGIC
        );
    END COMPONENT latchd_comp;

--comportamento sensível a nível
BEGIN

	inst0 : latchd_comp
		PORT MAP(
			D => D_reg(0),
			clk => clk_reg,
			Q => Q_reg(0),
			Q_bar => Q_bar_reg(0)
	);
		
	inst1 : latchd_comp
		PORT MAP(
			D => D_reg(1),
			clk => clk_reg,
			Q => Q_reg(1),
			Q_bar => Q_bar_reg(1)
	);	
	
	inst2 : latchd_comp
		PORT MAP(
			D => D_reg(2),
			clk => clk_reg,
			Q => Q_reg(2),
			Q_bar => Q_bar_reg(2)
	);	
	
	inst3 : latchd_comp
		PORT MAP(
			D => D_reg(3),
			clk => clk_reg,
			Q => Q_reg(3),
			Q_bar => Q_bar_reg(3)
	);	
		
END ARCHITECTURE behav;