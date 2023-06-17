-- Bibliotecas
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Entidade
ENTITY mult_24 IS
	PORT(
		tempo : IN STD_LOGIC_VECTOR (21 downto 0);
		horas_t : OUT STD_LOGIC_VECTOR (8 downto 0)
	);
END ENTITY mult_24;

-- Arquitetura
ARCHITECTURE behav OF mult_24 IS
	COMPONENT full_adder_9 IS
		PORT(
			a_9, b_9 : IN STD_LOGIC_VECTOR (8 downto 0);
			cin_9 : IN STD_LOGIC;
			s_9 : OUT STD_LOGIC_VECTOR (8 downto 0);
			co_9 : OUT STD_LOGIC
		);
	END COMPONENT full_adder_9;
	
-- Comportamento
BEGIN
	
	inst0_shf : full_adder_9
	PORT MAP(
		a_9(0) => '0',
		b_9(0) => '0',
		s_9(0) => horas_t(0),
		cin_9 => '0'
	);
	
	inst1_shf : full_adder_9
	PORT MAP(
		a_9(1) => '0',
		b_9(1) => '0',
		s_9(1) => horas_t(1),
		cin_9 => '0'
	);
	
	inst2_shf : full_adder_9
	PORT MAP(
		a_9(2) => '0',
		b_9(2) => '0',
		s_9(2) => horas_t(2),
		cin_9 => '0'
	);
	
	inst3_shf : full_adder_9
	PORT MAP(
		a_9(3) => tempo(17),
		b_9(3) => '0',
		s_9(3) => horas_t(3),
		cin_9 => '0'
	);
	
	inst4_shf : full_adder_9
	PORT MAP(
		a_9(4) => tempo(18),
		b_9(4) => tempo(17),
		s_9(4) => horas_t(4),
		cin_9 => '0'
	);
	
	inst5_shf : full_adder_9
	PORT MAP(
		a_9(5) => tempo(19),
		b_9(5) => tempo(18),
		s_9(5) => horas_t(5),
		cin_9 => '0'
	);
	
	inst6_shf : full_adder_9
	PORT MAP(
		a_9(6) => tempo(20),
		b_9(6) => tempo(19),
		s_9(6) => horas_t(6),
		cin_9 => '0'
	);
	
	inst7_shf : full_adder_9
	PORT MAP(
		a_9(7) => tempo(21),
		b_9(7) => tempo(20),
		s_9(7) => horas_t(7),
		cin_9 => '0'
	);
	
	inst8_shf : full_adder_9
	PORT MAP(
		a_9(8) => '0',
		b_9(8) => tempo(21),
		s_9(8) => horas_t(8),
		cin_9 => '0'
	);
	
END ARCHITECTURE behav;