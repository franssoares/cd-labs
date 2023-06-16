-- Bibliotecas
LIBRARY ieee;
USE ieee.std_logic_1164.all;

--(VERIFICAR C0 DO ADDER RECEBER OU NAO UM ESPACO EM UM FLIP FLOP)

-- Entidade
ENTITY reg_1x6 IS

	GENERIC(
		tam : integer :=5
	);

	PORT(
		D_reg : IN STD_LOGIC_VECTOR(tam DOWNTO 0);
	    clk_reg, load, clear : IN STD_LOGIC;
        Q_reg, Q_bar_reg : OUT STD_LOGIC_VECTOR(tam DOWNTO 0)
	);
  
END ENTITY reg_1x6;

-- Arquitetura
ARCHITECTURE comp OF reg_1x6 IS

	-- Declaração da componente
    COMPONENT ffd_6 is
        PORT(
				D, clk, load, clear : IN STD_LOGIC;
				Q, Q_bar : OUT STD_LOGIC
		  );
    END COMPONENT ffd_6;

-- Comportamento sensível a borda de subida
BEGIN

	inst0 : ffd_6
		PORT MAP(
			d => D_reg(0),
			clk => clk_reg,
			load => load,
			clear => clear,
			q => Q_reg(0)
	);
		
	inst1 : ffd_6
		PORT MAP(
			d => D_reg(1),
			clk => clk_reg,
			load => load,
			clear => clear,
			q => Q_reg(1)
	);	
	
	inst2 : ffd_6
		PORT MAP(
			d => D_reg(2),
			clk => clk_reg,
			load => load,
			clear => clear,
			q => Q_reg(2)
			
	);	
	
	inst3 : ffd_6
		PORT MAP(
			d => D_reg(3),
			clk => clk_reg,
			load => load,
			clear => clear,
			q => Q_reg(3)
			
	);
	
	inst4 : ffd_6
		PORT MAP(
			d => D_reg(4),
			clk => clk_reg,
			load => load,
			clear => clear,
			q => Q_reg(4)
			
	);
	
	inst5 : ffd_6
		PORT MAP(
			d => D_reg(5),
			clk => clk_reg,
			load => load,
			clear => clear,
			q => Q_reg(5)
			
	);
		
END ARCHITECTURE comp;