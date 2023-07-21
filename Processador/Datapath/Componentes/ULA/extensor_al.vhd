library ieee;
use ieee.std_logic_1164.all;

-- entidade
entity extensor_al is
	port(
		A, B : in std_logic_vector(15 downto 0);
		x, y, z : in std_logic;
		cin : out std_logic;
		IA, IB : out std_logic_vector(15 downto 0)
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
			x, y, z : in std_logic;
		   cin: out std_logic
		);
	end component;
	
-- comportamento
begin
	
-----------------------ABEXT-----------------------
	
	gen_abext: for i in 0 to 15 generate
		inst_abext : abext
			port map(
				x => x,
				y => y,
				z => z,
				a => A(i),
				b => B(i),
				ia => IA(i),
				ib => IB(i)
			);
	end generate gen_abext;

---------------------------------------------------
	
	-- CINEXT
	inst_cinext : cinext
	port map(
		x => x,
		y => y,
		z => z,
		cin => cin
	);

end architecture;