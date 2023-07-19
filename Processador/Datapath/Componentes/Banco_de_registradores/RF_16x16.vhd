-- Biblioteca
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Entidade
ENTITY RF_16x16 IS
	PORT(
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
END ENTITY RF_16x16;

-- Arquitetura
ARCHITECTURE mem OF RF_16x16 IS

-- Componentes

	-- 1) Decodificador 
	COMPONENT dcd_4x16 IS
		port (
			 input: in std_logic_vector(3 downto 0);
			 enable: in std_logic;
			 output: out std_logic_vector(15 downto 0)
		);
	END COMPONENT dcd_4x16;

	-- 2) Registrador ffd
	COMPONENT FFD_RF IS
		port (
			 clk: in std_logic;
			 load: in std_logic;
			 d: in std_logic_vector(15 downto 0);
			 q: out std_logic_vector(15 downto 0)
		);
	END COMPONENT FFD_RF;

	-- 3) Driver de 3 estados
	COMPONENT tri_states_driver_16bit IS
		PORT(
			in_data : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			enable : IN STD_LOGIC;
			out_data : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
		);
	END COMPONENT tri_states_driver_16bit;


	
-- Tipagem
	TYPE register_array IS ARRAY (0 TO 15) OF std_logic_vector(15 DOWNTO 0);
	
-- Fios
	SIGNAL wires_dcd_w : STD_LOGIC_VECTOR(15 DOWNTO 0); -- escrita
	SIGNAL wires_dcd_rp : STD_LOGIC_VECTOR(15 DOWNTO 0); -- leitura P
	SIGNAL wires_dcd_rq : STD_LOGIC_VECTOR(15 DOWNTO 0); -- leitura Q
	SIGNAL wires_reg : register_array; -- fios de 16 bits
	
-- Comportamento
BEGIN

-----------------DECODIFICADORES--------------------------------

-- Decodificador de escrita
	dcdw: dcd_4x16
		PORT MAP(
			input => W_addr,
			enable => W_wr,
			output => wires_dcd_w
	);

	-- Decodificador de leitura P
	dcdp: dcd_4x16
		PORT MAP(
			input => Rp_addr,
			enable => Rp_rd,
			output => wires_dcd_rp
	);
	
	-- Decodificador de leitura Q
	dcdq: dcd_4x16
		PORT MAP(
			input => Rq_addr,
			enable => Rq_rd,
			output => wires_dcd_rq
	);
	
-----------------------REGISTRADORES------------------------------------------
	-- Registradores 0 a 15
	gen_registers: for i in 0 to 15 generate
		reg : FFD_RF
			PORT MAP(
				clk => clk,
				load => wires_dcd_w(i),
				d => W_data,
				q => wires_reg(i)
			);
	end generate gen_registers;
------------------------------DRIVER DE 3 ESTADOS----------------------------------------------
	
	-- Driver de 3 estados P
	gen_3sdp: for i in 0 to 15 generate
		driverp : tri_states_driver_16bit
			PORT MAP(
				in_data => wires_reg(i),
				enable => wires_dcd_rp(i),
				out_data => Rp_data
			);
	end generate gen_3sdp;
	
	-- Driver de 3 estados Q
	gen_3sdq: for i in 0 to 15 generate
		driverq : tri_states_driver_16bit
			PORT MAP(
				in_data => wires_reg(i),
				enable => wires_dcd_rq(i),
				out_data => Rq_data
			);
	end generate gen_3sdq;
----------------------------------------------------------------------------

END ARCHITECTURE mem;