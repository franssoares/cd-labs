-- Bibliotecas
-- Bibliotecas
LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Entidade
ENTITY incrementer6 IS

    -- Constante
    GENERIC(
        w : INTEGER := 5
    );

    port(
        in_data : in STD_LOGIC_VECTOR(w DOWNTO 0);
		  cin : in std_logic;
        out_data : out STD_LOGIC_VECTOR(w DOWNTO 0)
    );

END ENTITY incrementer6;

-- Arquitetura
ARCHITECTURE rtl OF incrementer6 IS

    -- Componente
    COMPONENT half_adder_6 IS
        port(
            a : IN STD_LOGIC;
            one : IN STD_LOGIC;
            co, s : OUT STD_LOGIC
        );
    END COMPONENT half_adder_6;

    -- Fios
    SIGNAL co_wires : STD_LOGIC_VECTOR(4 DOWNTO 0);

-- Comportamento:
BEGIN

    -- Instancia
    adder0 : half_adder_6
    PORT MAP(
        a => in_data(0),
        one => cin,
        co => co_wires(0),
        s => out_data(0)
    );
	
    adder1 : half_adder_6
    PORT MAP(
        a => in_data(1),
        one => co_wires(0),
        co => co_wires(1),
        s => out_data(1)
    );

    adder2 : half_adder_6
    PORT MAP(
        a => in_data(2),
        one => co_wires(1),
        co => co_wires(2),
        s => out_data(2)
    );

    adder3 : half_adder_6
    PORT MAP(
        a => in_data(3),
        one => co_wires(2),
        co => co_wires(3),
        s => out_data(3)
    );

    adder4 : half_adder_6
    PORT MAP(
        a => in_data(4),
        one => co_wires(3),
        co => co_wires(4),
        s => out_data(4)
    );

    adder5 : half_adder_6
    PORT MAP(
        a => in_data(5),
        one => co_wires(4),
        co => open, -- aberto: alta impedancia
        s => out_data(5)
    );

END ARCHITECTURE rtl;