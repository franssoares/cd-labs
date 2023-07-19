-- biblioteca
library ieee;
use ieee.std_logic_1164.all;

-- entidade
entity processador is
	port(
		
		
	);
	
end entity datapath;

-- arquitetura
architecture RTL of datapath is

-- Componentes

	-- mux
	component mux16bit is
	   
	end component mux16bit;
	
	-- Banco de registradores
	component RF_16x16 is
		
	end component RF_16x16;
	
	-- comparador de zero
	component comp_zero is
		
	end component comp_zero;
	
	-- ULA
	component ula is
		
	end component;
	
	-- fios
	SIGNAL wires_mux_output : std_logic_vector(15 downto 0);
	SIGNAL wires_RF_Rp_data : std_logic_vector(15 downto 0);
	SIGNAL wires_RF_Rq_data  : std_logic_vector(15 downto 0);
	SIGNAL wires_ULA  : std_logic_vector(15 downto 0);
	
-- comportamento
begin

-- instancias

	
end architecture RTL;