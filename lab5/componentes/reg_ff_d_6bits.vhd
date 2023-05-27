-- Bibliotecas
LIBRARY ieee;
USE ieee.std_logic_1164.all;

--(VERIFICAR C0 DO ADDER RECEBER OU NAO UM ESPACO EM UM FLIP FLOP)

-- Entidade
ENTITY reg_ff_d_6bits IS

	GENERIC(
				tam : integer :=5
	);

	PORT(
		D_reg : IN STD_LOGIC_VECTOR(tam DOWNTO 0);
	   clk_reg, load : IN STD_LOGIC;
      Q_reg, Q_bar_reg : OUT STD_LOGIC_VECTOR(tam DOWNTO 0)
	);
  
END ENTITY reg_ff_d_6bits;

-- Arquitetura
ARCHITECTURE comp OF reg_ff_d_6bits IS

	-- Declaração da componente
    COMPONENT ff_d is
        PORT(
            D, clk, load : IN STD_LOGIC;
				Q, Q_bar : OUT STD_LOGIC
        );
    END COMPONENT ff_d;

-- Comportamento sensível a borda de subida
BEGIN

	inst0 : ff_d
		PORT MAP(
			D => D_reg(0),
			clk => clk_reg,
			load => load,
			Q => Q_reg(0),
			Q_bar => Q_bar_reg(0)
	);
		
	inst1 : ff_d
		PORT MAP(
			D => D_reg(1),
			clk => clk_reg,
			load => load,
			Q => Q_reg(1),
			Q_bar => Q_bar_reg(1)
	);	
	
	inst2 : ff_d
		PORT MAP(
			D => D_reg(2),
			clk => clk_reg,
			load => load,
			Q => Q_reg(2),
			Q_bar => Q_bar_reg(2)
	);	
	
	inst3 : ff_d
		PORT MAP(
			D => D_reg(3),
			clk => clk_reg,
			load => load,
			Q => Q_reg(3),
			Q_bar => Q_bar_reg(3)
	);
	
	inst4 : ff_d
		PORT MAP(
			D => D_reg(4),
			clk => clk_reg,
			load => load,
			Q => Q_reg(4),
			Q_bar => Q_bar_reg(4)
	);
	
	inst5 : ff_d
		PORT MAP(
			D => D_reg(5),
			clk => clk_reg,
			load => load,
			Q => Q_reg(5),
			Q_bar => Q_bar_reg(5)
	);
		
END ARCHITECTURE comp;