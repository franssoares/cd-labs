-- Bibliotecas
LIBRARY ieee;
USE ieee.std_logic_1164.all;

--(VERIFICAR C0 DO ADDER RECEBER OU NAO UM ESPACO EM UM FLIP FLOP)

-- Entidade
ENTITY reg_1x6_s IS

	GENERIC(
		tam : integer :=5
	);

	PORT(
		D_reg : IN STD_LOGIC_VECTOR(tam DOWNTO 0);
	    clk_reg, load, clear : IN STD_LOGIC;
        Q_reg, Q_bar_reg : OUT STD_LOGIC_VECTOR(tam DOWNTO 0)
	);
  
END ENTITY reg_1x6_s;

-- Arquitetura
ARCHITECTURE comp OF reg_1x6_s IS

	-- Declaração da componente
    COMPONENT ld_simple is
        port(
        d: in std_logic;        -- Entrada de dados
        clk: in std_logic;		  -- Sinal de clock
		  enable: in std_logic;	  -- Carregar de clock
        clear: in std_logic;    -- Sinal de clear
        q: out std_logic        -- Saída
    );
    END COMPONENT ld_simple;

-- Comportamento sensível a borda de subida
BEGIN

	inst0 : ld_simple
		PORT MAP(
			d => D_reg(0),
			clk => clk_reg,
			enable => '1',
			clear => clear,
			q => Q_reg(0)
	);
		
	inst1 : ld_simple
		PORT MAP(
			d => D_reg(1),
			clk => clk_reg,
			enable => '1',
			clear => clear,
			q => Q_reg(1)
	);	
	
	inst2 : ld_simple
		PORT MAP(
			d => D_reg(2),
			clk => clk_reg,
			enable => '1',
			clear => clear,
			q => Q_reg(2)
			
	);	
	
	inst3 : ld_simple
		PORT MAP(
			d => D_reg(3),
			clk => clk_reg,
			enable => '1',
			clear => clear,
			q => Q_reg(3)
			
	);
	
	inst4 : ld_simple
		PORT MAP(
			d => D_reg(4),
			clk => clk_reg,
			enable => '1',
			clear => clear,
			q => Q_reg(4)
			
	);
	
	inst5 : ld_simple
		PORT MAP(
			d => D_reg(5),
			clk => clk_reg,
			enable => '1',
			clear => clear,
			q => Q_reg(5)
			
	);
		
END ARCHITECTURE comp;