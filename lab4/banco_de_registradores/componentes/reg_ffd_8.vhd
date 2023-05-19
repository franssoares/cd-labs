-- Biblioteca
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Entidade
ENTITY reg_ffd_8 IS
	PORT(
		d_data : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		load : IN STD_LOGIC;
		clk : IN STD_LOGIC;
		q_data : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END ENTITY reg_ffd_8;

-- Arquitetura
ARCHITECTURE RTL OF reg_ffd_8 IS
-- Componente
COMPONENT ffd_8 is
	PORT(
		d: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        clk : IN STD_LOGIC;
		load : IN STD_LOGIC;
        q : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT ffd_8;

-- Comportamento
BEGIN	
	inst0 : ffd_8
		PORT MAP(
			d => d_data,
			load => load,
			clk => clk, -- Não há conflito de nomes porque a componente e a entidade têm escopos diferentes
			q => q_data
	);
END ARCHITECTURE RTL;