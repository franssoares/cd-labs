library ieee;
use ieee.std_logic_1164.all;

-- entidade
entity extensor_al is
	port(
		A, B : in std_logic_vector(5 downto 0);
		x, y, z : in std_logic;
		cin : out std_logic;
		IA, IB : out std_logic_vector(5 downto 0)
	);
end entity;

-- arquitetura
architecture rtl of extensor_al is

	-- componentes
	-- alu
	component abext is
		port(
		  x, y, z, a, b: in std_logic;
		  ia, ib: out std_logic
		);
	end component;
	
	-- 6-bit register
	component cinext is
		port(
			x, y, z: in std_logic;
		   cin: out std_logic
		);
	end component;
	
-- comportamento
begin
	
	-- ABEXT
	abext0 : abext
	port map(
		x => x,
		y => y,
		z => z,
		a => A(0),
		b => B(0),
		ia => IA(0),
		ib => IB(0)
	);
	
	abext1 : abext
	port map(
		x => x,
		y => y,
		z => z,
		a => A(1),
		b => B(1),
		ia => IA(1),
		ib => IB(1)
	);
	
	abext2 : abext
	port map(
		x => x,
		y => y,
		z => z,
		a => A(2),
		b => B(2),
		ia => IA(2),
		ib => IB(2)
	);
	
	abext3 : abext
	port map(
		x => x,
		y => y,
		z => z,
		a => A(3),
		b => B(3),
		ia => IA(3),
		ib => IB(3)
	);
	
	abext4 : abext
	port map(
		x => x,
		y => y,
		z => z,
		a => A(4),
		b => B(4),
		ia => IA(4),
		ib => IB(4)
	);
	
	abext5 : abext
	port map(
		x => x,
		y => y,
		z => z,
		a => A(5),
		b => B(5),
		ia => IA(5),
		ib => IB(5)
	);
	
	-- CINEXT
	cinext0 : cinext
	port map(
		x => x,
		y => y,
		z => z,
		cin => cin
	);


	
end architecture;