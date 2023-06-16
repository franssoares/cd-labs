-- Biblioteca
LIBRARY ieee;
USE ieee.std_logic_1164.all;
	 
-- Entidade
ENTITY bf_8x1 is
    port (
		w_data : in std_logic;
		w_addr : in STD_LOGIC_VECTOR(2 DOWNTO 0);
		w_en : in std_logic;
		r_data : out std_logic;
		r_addr : in STD_LOGIC_VECTOR(2 DOWNTO 0);
		r_en : in std_logic;
		
	   clk : in std_logic;
		en :  in std_logic;              
		clear : in std_logic;						
		load : in std_logic
	);
END ENTITY bf_8x1;

-- Arquitetura
ARCHITECTURE behav OF bf_8x1 IS

-- Componentes

	-- Registrador
	COMPONENT reg_8x1 is
		port (
			d_data : std_logic;    
			clk : in std_logic;                 
			clear : in std_logic;						
			load : in std_logic; 		  	
			q_data : out std_logic
		);
	END COMPONENT reg_8x1;

	--Decoder
	COMPONENT dcd_3x8 is
		PORT(
			in_id : STD_LOGIC_VECTOR(2 DOWNTO 0); -- ID
        	en : STD_LOGIC; --ENABLE
			d : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
		);
	END COMPONENT dcd_3x8;

	-- Driver de 3 estados
	COMPONENT tri_states_driver IS
		PORT(
			in_data : IN STD_LOGIC;
			enable : IN STD_LOGIC;
			out_data : OUT STD_LOGIC
		);
	END COMPONENT tri_states_driver;

-- Fios

	SIGNAL decoder0_wires : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL decoder1_wires : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL reg0_wires : STD_LOGIC_VECTOR(7 DOWNTO 0);
	
BEGIN

    -- Instancia
    decoder1 : dcd_3x8
    PORT MAP(
      in_id => w_addr,
	   en => w_en,
	   d => decoder0_wires
    );

	reg0_8x1 : reg_8x1
	PORT MAP(
		d_data => w_data,
		clk => clk,
		clear => clear,
		load => decoder0_wires(0),
		q_data => reg0_wires(0)
	);
	
	reg1_8x1 : reg_8x1
	PORT MAP(
		d_data => NOT(w_data),
		clk => clk,
		clear => clear,
		load => decoder0_wires(1),
		q_data => reg0_wires(1)
	);
	
	reg2_8x1 : reg_8x1
	PORT MAP(
		d_data => NOT(w_data),
		clk => clk,
		clear => clear,
		load => decoder0_wires(2),
		q_data => reg0_wires(2)
	);
	
	reg3_8x1 : reg_8x1
	PORT MAP(
		d_data => NOT(w_data),
		clk => clk,
		clear => clear,
		load => decoder0_wires(3),
		q_data => reg0_wires(3)
	);
	
	reg4_8x1 : reg_8x1
	PORT MAP(
		d_data => NOT(w_data),
		clk => clk,
		clear => clear,
		load => decoder0_wires(4),
		q_data => reg0_wires(4)
	);
	
	reg5_8x1 : reg_8x1
	PORT MAP(
		d_data => NOT(w_data),
		clk => clk,
		clear => clear,
		load => decoder0_wires(5),
		q_data => reg0_wires(5)
	);
	
	reg6_8x1 : reg_8x1
	PORT MAP(
		d_data => NOT(w_data),
		clk => clk,
		clear => clear,
		load => decoder0_wires(6),
		q_data => reg0_wires(6)
	);
	
	reg7_8x1 : reg_8x1
	PORT MAP(
		d_data => NOT(w_data),
		clk => clk,
		clear => clear,
		load => decoder0_wires(7),
		q_data => reg0_wires(7)
	);

	tsd0 : tri_states_driver
	PORT MAP(
		in_data => reg0_wires(0),
		enable => decoder1_wires(0),
		out_data => r_data
	);
	
	tsd1 : tri_states_driver
	PORT MAP(
		in_data => reg0_wires(1),
		enable => decoder1_wires(1),
		out_data => r_data
	);
	
	tsd2 : tri_states_driver
	PORT MAP(
		in_data => reg0_wires(2),
		enable => decoder1_wires(2),
		out_data => r_data
	);
	
	tsd3 : tri_states_driver
	PORT MAP(
		in_data => reg0_wires(3),
		enable => decoder1_wires(3),
		out_data => r_data
	);
	
	tsd4 : tri_states_driver
	PORT MAP(
		in_data => reg0_wires(4),
		enable => decoder1_wires(4),
		out_data => r_data
	);
	
	tsd5 : tri_states_driver
	PORT MAP(
		in_data => reg0_wires(5),
		enable => decoder1_wires(5),
		out_data => r_data
	);
	
	tsd6 : tri_states_driver
	PORT MAP(
		in_data => reg0_wires(6),
		enable => decoder1_wires(6),
		out_data => r_data
	);
	
	tsd7 : tri_states_driver
	PORT MAP(
		in_data => reg0_wires(7),
		enable => decoder1_wires(7),
		out_data => r_data
	);
	
	decoder2 : dcd_3x8
	PORT MAP(
		in_id => r_addr,
		en => r_en,
		d => decoder1_wires
	);

END ARCHITECTURE behav;