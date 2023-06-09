-- Bibliotecas
LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Entidade
ENTITY reg_6 IS
  PORT(
    D_reg : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
	 clk_reg, en : IN STD_LOGIC;
    Q_reg, Q_bar_reg : OUT STD_LOGIC_VECTOR(5 DOWNTO 0)
  );
END ENTITY reg_6;

-- Arquitetura
ARCHITECTURE behav OF reg_6 IS

	-- Declaração da componente
    COMPONENT ffd is   
          PORT(
				D, clk, load : IN STD_LOGIC;
				Q, Q_bar : OUT STD_LOGIC
        );
    END COMPONENT ffd;

-- Comportamento sensível a borda de subida
BEGIN

	inst0 : ffd
		PORT MAP(
			D => D_reg(0),
			clk => clk_reg,
			Q => Q_reg(0),
			load => en,
			Q_bar => Q_bar_reg(0)
	);
		
	inst1 : ffd
		PORT MAP(
			D => D_reg(1),
			clk => clk_reg,
			Q => Q_reg(1),
			load => en,
			Q_bar => Q_bar_reg(1)
	);	
	
	inst2 : ffd
		PORT MAP(
			D => D_reg(2),
			clk => clk_reg,
			Q => Q_reg(2),
			load => en,
			Q_bar => Q_bar_reg(2)
	);	
	
	inst3 : ffd
		PORT MAP(
			D => D_reg(3),
			clk => clk_reg,
			Q => Q_reg(3),
			load => en,
			Q_bar => Q_bar_reg(3)
	);	
	
	inst4 : ffd
		PORT MAP(
			D => D_reg(4),
			clk => clk_reg,
			Q => Q_reg(4),
			load => en,
			Q_bar => Q_bar_reg(4)
	);	
	
	inst5 : ffd
		PORT MAP(
			D => D_reg(5),
			clk => clk_reg,
			Q => Q_reg(5),
			load => en,
			Q_bar => Q_bar_reg(5)
	);	
		
END ARCHITECTURE behav;