-- Bibliotecas
LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Entidade
ENTITY half_adder_6 IS

    port(
        a : IN STD_LOGIC;
        one : IN STD_LOGIC;
        co, s : OUT STD_LOGIC
    );

END ENTITY half_adder_6;

-- Arquitetura
ARCHITECTURE bhv OF half_adder_6 IS

-- Comportamento:
BEGIN

    co <= (a and one);
    s <= (a xor one);
	
END ARCHITECTURE bhv;