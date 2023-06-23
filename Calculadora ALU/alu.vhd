library ieee;
use ieee.std_logic_1164.all;

-- entidade
entity alu is
	port(
		A, B : in std_logic_vector(5 downto 0);
		x, y, z : in std_logic;
		S : out std_logic_vector(5 downto 0)
	);
end entity;

-- arquitetura
architecture rtl of alu is

-- componentes
	-- extensor al
	component extensor_al is
		port(
			A, B : in std_logic_vector(5 downto 0);
			x, y, z : in std_logic;
			cin : out std_logic;
			IA, IB : out std_logic_vector(5 downto 0)
		);
	end component;
	
	-- somador
	component sum_6 is
		GENERIC(
			tam : integer :=5
		);
	
		PORT(
			a, b : IN STD_LOGIC_VECTOR(tam DOWNTO 0);
			cin : IN STD_LOGIC;
			s : OUT STD_LOGIC_VECTOR(tam DOWNTO 0);
			co : OUT STD_LOGIC
		);
	end component;
	
	-- fios
	signal extensor_al_wires_IA : std_logic_vector(5 downto 0);
	signal extensor_al_wires_IB : std_logic_vector(5 downto 0);
	signal cinext_wires : std_logic;
-- comportamento
begin
	
	-- EXTENSOR ALU
	extensor_al0 : extensor_al
	port map(
		A => A,
		B => B,
		x => x,
		y => y,
		z => z,
		cin => cinext_wires,
		IA => extensor_al_wires_IA,
		IB => extensor_al_wires_IB
	);
	
	-- SOMADOR
	sum_60 : sum_6
	port map(
		a => extensor_al_wires_IA,
		b => extensor_al_wires_IB,
		cin => cinext_wires,
		s => S,
		co => open
	);
	
end architecture;