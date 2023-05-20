-- Biblioteca
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Entidade
ENTITY reg_file_4x8 IS
	PORT(
		w_data: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		w_addr, r_addr : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		w_en, r_en : IN STD_LOGIC;
		clk : IN STD_LOGIC;
		r_data : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END ENTITY reg_file_4x8;

-- Arquitetura
ARCHITECTURE RTL OF reg_file_4x8 IS

	-- Fios
	SIGNAL dcd_2x4_wires : STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL reg0_ffd_8_wires : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL reg1_ffd_8_wires : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL reg2_ffd_8_wires : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL reg3_ffd_8_wires : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL driver_wires : STD_LOGIC_VECTOR(3 DOWNTO 0);

	-- Componentes
	-- 1) Decodificador
	COMPONENT dcd_2x4 IS
		PORT(
			i0, i1, en : IN STD_LOGIC;
			d : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
		);
	END COMPONENT dcd_2x4;

	-- 2) Registrador ffd
	COMPONENT reg_ffd_8 IS
		PORT(
			d_data : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			load : IN STD_LOGIC;
			clk : IN STD_LOGIC;
			q_data : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
		);
	END COMPONENT reg_ffd_8;

	-- 3) Driver de 3 estados
	COMPONENT tri_states_driver IS
		PORT(
			in_data : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        	enable : IN STD_LOGIC;
			out_data : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
		);
	END COMPONENT tri_states_driver;

-- Comportamento
BEGIN

	-- Decodificador 1
	dcd1: dcd_2x4
		PORT MAP(
			i0 => w_addr(0),
			i1 => w_addr(1),
			en => w_en,
			d => dcd_2x4_wires
	);

	-- Registradores
	reg0_ffd_8 : reg_ffd_8
		PORT MAP(
			d_data => w_data,
			load => dcd_2x4_wires(0),
			clk => clk,
			q_data => reg0_ffd_8_wires
	);

	reg1_ffd_8 : reg_ffd_8
		PORT MAP(
			d_data => w_data,
			load => dcd_2x4_wires(1),
			clk => clk,
			q_data => reg1_ffd_8_wires
	);

	reg2_ffd_8 : reg_ffd_8
		PORT MAP(
			d_data => w_data,
			load => dcd_2x4_wires(2),
			clk => clk,
			q_data => reg2_ffd_8_wires
	);

	reg3_ffd_8 : reg_ffd_8
		PORT MAP(
			d_data => w_data,
			load => dcd_2x4_wires(3),
			clk => clk,
			q_data => reg3_ffd_8_wires
	);

	-- Decodificador 2
	dcd2: dcd_2x4
		PORT MAP(
			i0 => r_addr(0),
			i1 => r_addr(1),
			en => r_en,
			d(0) => driver_wires(0),
			d(1) => driver_wires(1),
			d(2) => driver_wires(2),
			d(3) => driver_wires(3)
	);

	-- Driver de 3 estados
	driver0 : tri_states_driver
		PORT MAP(
			in_data => reg0_ffd_8_wires,
			enable => driver_wires(0),
			out_data => r_data
	);

	driver1 : tri_states_driver
		PORT MAP(
			in_data => reg1_ffd_8_wires,
			enable => driver_wires(1),
			out_data => r_data
	);

	driver2 : tri_states_driver
		PORT MAP(
			in_data => reg2_ffd_8_wires,
			enable => driver_wires(2),
			out_data => r_data
	);

	driver3 : tri_states_driver
		PORT MAP(
			in_data => reg3_ffd_8_wires,
			enable => driver_wires(3),
			out_data => r_data
	);

END ARCHITECTURE RTL;