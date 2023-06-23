library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity SOMADOR_MAIN is

generic(
	WIDTH : integer := 6
);

port(
	CIN : in std_logic;
	A : in std_logic_vector(WIDTH - 1 downto 0);
	B : in std_logic_vector(WIDTH - 1 downto 0);
	S : out std_logic_vector(WIDTH - 1 downto 0);
	COUT : out std_logic
);
end SOMADOR_MAIN;

architecture main of SOMADOR_MAIN is

	signal mux_2x1_wires : std_logic_vector(1 downto 0);
	signal full_add_0_wires : std_logic_vector(1 downto 0);
	signal full_add_1_wires : std_logic_vector(1 downto 0);
	signal full_add_2_wires : std_logic_vector(1 downto 0);
	signal full_add_3_wires : std_logic_vector(1 downto 0);
	signal full_add_4_wires : std_logic_vector(1 downto 0);
	signal half_add_wires : std_logic_vector(1 downto 0);

component SOMADOR_FULL
port(
	CIN : in std_logic;
	A : in std_logic;
	B : in std_logic;
	S : out std_logic;
	COUT : out std_logic
);
end component SOMADOR_FULL;

component SOMADOR_HALF
port(
	A_HALF : in std_logic;
	B_HALF : in std_logic;
	S_HALF : out std_logic;
	COUT_HALF : out std_logic
);

begin
	fa0 : SOMADOR_FULL
	port map()
	
