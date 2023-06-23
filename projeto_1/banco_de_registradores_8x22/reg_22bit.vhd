-- Biblioteca
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Entidade
ENTITY reg_22bit IS
	PORT(
		d_data : IN STD_LOGIC_VECTOR(21 DOWNTO 0);
		load : IN STD_LOGIC;
		clk : IN STD_LOGIC;
		q_data : OUT STD_LOGIC_VECTOR(21 DOWNTO 0)
	);
END ENTITY reg_22bit;

-- Arquitetura
ARCHITECTURE RTL OF reg_22bit IS
-- Componente
COMPONENT ffd_22 is
	PORT(
		d: IN STD_LOGIC_VECTOR(21 DOWNTO 0);
        clk : IN STD_LOGIC;
		load : IN STD_LOGIC;
        q : OUT STD_LOGIC_VECTOR(21 DOWNTO 0)
	);
END COMPONENT ffd_22;

-- Comportamento
BEGIN	
	inst0 : ffd_22
		PORT MAP(
			d => d_data,
			load => load,
			clk => clk, -- Não há conflito de nomes porque a componente e a entidade têm escopos diferentes
			q => q_data
	);
END ARCHITECTURE RTL;