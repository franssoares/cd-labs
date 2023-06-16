-- Biblioteca
LIBRARY ieee;
USE ieee.std_logic_1164.all;
	 
-- Entidade
entity reg_8x22 is
    port (
        d_data : in std_logic_vector(21 downto 0);        -- Entrada de dados
        clk : in std_logic;                 -- Sinal de clock
        clear : in std_logic;						-- Sinal de clear
		load : in std_logic; 		  				-- Sinal de carga
        q_data : out std_logic_vector(21 downto 0)
    );
end reg_8x22;

-- Arquitetura
architecture behav of reg_8x22 is

-- Componente
	COMPONENT LatchD_22 is
		port(
            d: in std_logic_vector(21 downto 0);        -- Entrada de dados
            clk: in std_logic;		  -- Sinal de clock
            load: in std_logic;	  -- Carregar de clock
            clear: in std_logic;    -- Sinal de clear
            q: out std_logic_vector(21 downto 0)       -- Saída
		);
	END COMPONENT LatchD_22;

BEGIN

    -- Instancia
    latchd0 : LatchD_22
    PORT MAP(
        d => d_data,
        clk => clk,
		load => load,
        clear => clear,
        q => q_data
    );
   
end behav;