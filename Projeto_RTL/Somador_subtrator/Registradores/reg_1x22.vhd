-- Bibliotecas
LIBRARY ieee;
USE ieee.std_logic_1164.all;

--(VERIFICAR C0 DO ADDER RECEBER OU NAO UM ESPACO EM UM FLIP FLOP)

-- Entidade
ENTITY reg_1x22 IS

	GENERIC(
		tam : integer :=21
	);

	PORT(
		D_reg : IN STD_LOGIC_VECTOR(tam DOWNTO 0);
	   clk_reg, load: IN STD_LOGIC;
       Q_reg : OUT STD_LOGIC_VECTOR(tam DOWNTO 0)
	);
  
END ENTITY reg_1x22;

-- Arquitetura
ARCHITECTURE comp OF reg_1x22 IS

	-- Declaração da componente
    COMPONENT ffd is
        port (
			clk : IN  std_logic;
			d : IN  std_logic_vector(21 downto 0);
			en : IN  std_logic;
			q  : OUT std_logic_vector(21 downto 0)
    	);
    END COMPONENT ffd;

-- Comportamento sensível a borda de subida
BEGIN

	inst00 : ffd
		PORT MAP(
			d => D_reg,
			clk => clk_reg,
			en => load,
			q => Q_reg
	);
		
END ARCHITECTURE comp;