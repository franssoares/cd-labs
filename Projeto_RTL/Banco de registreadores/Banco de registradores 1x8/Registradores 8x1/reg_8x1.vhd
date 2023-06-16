-- Biblioteca
LIBRARY ieee;
USE ieee.std_logic_1164.all;
	 
-- Entidade
entity reg_8x1 is
    port (
        d_data : in std_logic;        -- Entrada de dados
        clk : in std_logic;                 -- Sinal de clock
        clear : in std_logic;						-- Sinal de clear
		  load : in std_logic; 		  				-- Sinal de carga
        q_data : out std_logic
    );
end reg_8x1;

-- Arquitetura
architecture behav of reg_8x1 is

-- Componente
	COMPONENT LatchD is
		port(
			d: in std_logic;        -- Entrada de dados
			clk: in std_logic;      -- Sinal de clock
			clear: in std_logic;    -- Sinal de clear
			load: in std_logic;    -- Sinal de carga
			q: out std_logic       -- SaÃ­da
		);
	END COMPONENT LatchD;

BEGIN

    -- Instancia
    latchd0 : LatchD
    PORT MAP(
        d => d_data,
        clk => clk,
		load => load,
        clear => clear,
        q => q_data
    );
   
end behav;