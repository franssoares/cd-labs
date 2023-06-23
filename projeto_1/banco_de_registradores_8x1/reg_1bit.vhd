-- Biblioteca
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Entidade
ENTITY reg_1bit IS
	PORT(
		d_data : IN STD_LOGIC;
		load : IN STD_LOGIC;
		clk : IN STD_LOGIC;
		q_data : OUT STD_LOGIC
	);
END ENTITY reg_1bit;

-- Arquitetura
ARCHITECTURE RTL OF reg_1bit IS
-- Componente
COMPONENT ffd_1 is
	PORT(
		d: IN STD_LOGIC;
        clk : IN STD_LOGIC;
		load : IN STD_LOGIC;
        q : OUT STD_LOGIC
	);
END COMPONENT ffd_1;

-- Comportamento
BEGIN	
	inst0 : ffd_1
		PORT MAP(
			d => d_data,
			load => load,
			clk => clk, -- Não há conflito de nomes porque a componente e a entidade têm escopos diferentes
			q => q_data
	);
END ARCHITECTURE RTL;