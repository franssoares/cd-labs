-- biblioteca
library ieee;
use ieee.std_logic_1164.all;

-- entidade
entity datapath is
	port(
		-- dados
		data_ram_in : in std_logic_vector(15 downto 0);
		data_ram_out : out std_logic_vector(15 downto 0);
		
		RF_W_data : in std_logic_vector(7 downto 0);
		 
		-- enderecos
		RF_W_addr : in std_logic_vector(3 downto 0);
		RF_Rp_addr : in std_logic_vector(3 downto 0);
		RF_Rq_addr : in std_logic_vector(3 downto 0);
		
		-- sinais
		RF_s1 : in std_logic;
		RF_s0 : in std_logic;
		
		RF_W_wr : in std_logic;
		RF_Rp_rd : in std_logic;
		RF_Rq_rd : in std_logic;
		RF_Rp_zero : out std_logic;
		
		alu_s1 : in std_logic;
		alu_s0 : in std_logic;
		
		alu_comp_gt : out std_logic;
		
		-- relogio
		clk : in std_logic
		
	);
	
end entity datapath;

-- arquitetura
architecture RTL of datapath is

-- Componentes

	-- mux
	component mux16bit is
	   port (
			 sel0: in std_logic;
			 sel1: in std_logic;
			 data_i0: in std_logic_vector(15 downto 0);
			 data_i1: in std_logic_vector(15 downto 0);
			 data_i2: in std_logic_vector(7 downto 0);
			 data_o: out std_logic_vector(15 downto 0)
	  );
	end component mux16bit;
	
	-- Banco de registradores
	component RF_16x16 is
		port(
			-- relogio
			clk : IN STD_LOGIC;
			
			-- escrita
			W_data: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			W_addr : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			W_wr : IN STD_LOGIC;
			
			-- leitura P
			Rp_addr : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			Rp_rd : IN STD_LOGIC;
			Rp_data: OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
			
			-- leitura Q
			Rq_addr : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			Rq_rd : IN STD_LOGIC;
			Rq_data: OUT STD_LOGIC_VECTOR(15 DOWNTO 0)

		);
	end component RF_16x16;
	
	-- comparador de zero
	component comp_zero is
		port (
		   output: in std_logic_vector(15 downto 0);
		   isZero: out std_logic
	   );
	end component comp_zero;
	
	-- ULA
	component ula is
		port(
			A, B : in std_logic_vector(15 downto 0);
			x, y, z : in std_logic; 
			S : out std_logic_vector(15 downto 0);
			comp_gt : out std_logic
		);
	end component;
	
	-- fios
	SIGNAL wires_mux_output : std_logic_vector(15 downto 0);
	SIGNAL wires_RF_Rp_data : std_logic_vector(15 downto 0);
	SIGNAL wires_RF_Rq_data  : std_logic_vector(15 downto 0);
	SIGNAL wires_ULA  : std_logic_vector(15 downto 0);
	
-- comportamento
begin

-- instancias

	-- mux
	mux0 : mux16bit
		port map(
			data_i2 => RF_W_data,
			data_i1 => data_ram_in,
			data_i0 => wires_ULA,
			sel1 => RF_s1,
			sel0 => RF_s0,
			data_o => wires_mux_output
		);
		
	-- RF
	rf_0 : rf_16x16
		port map(
			W_data => wires_mux_output,
			W_addr => RF_W_addr,
			W_wr => RF_W_wr,
			
			Rp_addr => RF_Rp_addr,
			Rp_rd => RF_Rp_rd,
			Rq_addr => RF_Rq_addr,
			Rq_rd => RF_Rq_rd,
			
			Rp_data => wires_RF_Rp_data,
			Rq_data => wires_RF_Rq_data,
			clk => clk
		);
	
	-- ULA
		ula_0 : ula
			port map(
				A => wires_RF_Rp_data,
				B => wires_RF_Rq_data,
				z => alu_s0,
				y => alu_s1,
				x => '0',
				S => wires_ULA,
				comp_gt => alu_comp_gt	
			);
			
	-- comparador zero
	comp_0 : comp_zero
		port map(
				output => wires_RF_Rp_data,
				iszero => RF_rp_zero
		);
			
	data_ram_out <= wires_RF_Rp_data;
			
  
end architecture RTL;