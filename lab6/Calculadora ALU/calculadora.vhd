library ieee;
use ieee.std_logic_1164.all;

-- entidade
entity calculadora is
	port(
		A, B : in std_logic_vector(5 downto 0);
		x, y, z, en : in std_logic;
		clk : in std_logic;
		S : out std_logic_vector(5 downto 0)
	);
end entity;

-- arquitetura
architecture rtl of calculadora is

	-- componentes
	-- alu
	component alu is
		port(
			A, B : in std_logic_vector(5 downto 0);
			x, y, z : in std_logic;
			S : out std_logic_vector(5 downto 0)
		);
	end component;
	
	-- 6-bit register
	component reg_6 is
		port(
			D_reg : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
		   clk_reg, en : IN STD_LOGIC;
		   Q_reg, Q_bar_reg : OUT STD_LOGIC_VECTOR(5 DOWNTO 0)
		);
	end component;
	
	-- fios
	signal alu_out_wires : std_logic_vector(5 downto 0);
	
-- comportamento
begin
	
	-- ALU
	alu0 : alu
	port map(
		A => A,
		B => B,
		x => x, 
		y => y,
		z => z,
		S => alu_out_wires
	);
	
	-- REGISTRADOR
	reg_60 : reg_6
	port map(
		D_reg => alu_out_wires,
		clk_reg => clk,
		Q_reg => S,
		en => en,
		Q_bar_reg => open
	
	);
	
end architecture;