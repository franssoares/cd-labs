-- Bibliotecas
LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Entidade
ENTITY counter_days_5 IS

    -- Constante
    GENERIC(
        w : INTEGER := 4
    );

    port(
       in_data : IN STD_LOGIC_VECTOR(w DOWNTO 0);
       out_data : OUT STD_LOGIC_VECTOR(w DOWNTO 0);
       clk, load, cin, clear : IN STD_LOGIC;
       sig : OUT STD_LOGIC
    );

END ENTITY counter_days_5;

-- Arquitetura
ARCHITECTURE bhv OF counter_days_5 IS

    -- Componentes

        --MUX
        COMPONENT mux_2x1_5 IS 
            GENERIC(
                w : INTEGER := 4
            );
            PORT(
                i0, i1 : IN STD_LOGIC_VECTOR(w DOWNTO 0);
                sel : IN STD_LOGIC;
                o : OUT STD_LOGIC_VECTOR(w DOWNTO 0)
            );
        END COMPONENT mux_2x1_5;
        
        --INCREMENTER
        COMPONENT incrementer5 IS
            GENERIC(
                w : INTEGER := 4
            );
            port(
                in_data : in STD_LOGIC_VECTOR(w DOWNTO 0);
				cin : in std_logic;
                out_data : out STD_LOGIC_VECTOR(w DOWNTO 0)
            );
        END COMPONENT incrementer5;

        --COMPARATOR
        COMPONENT comparator_5 IS
            GENERIC(
                w : INTEGER := 4
            );
            port(
                a : IN STD_LOGIC_VECTOR(w DOWNTO 0);
                b : IN STD_LOGIC_VECTOR(w DOWNTO 0);
                eq : OUT STD_LOGIC
            );
        END COMPONENT comparator_5;

        --REGISTER
        COMPONENT reg_1x5 IS
            GENERIC(
                tam : integer :=4
            );
            PORT(
                D_reg : IN STD_LOGIC_VECTOR(tam DOWNTO 0);
                clk_reg, load, clear : IN STD_LOGIC;
                Q_reg, Q_bar_reg : OUT STD_LOGIC_VECTOR(tam DOWNTO 0)
            );
        END COMPONENT reg_1x5;

    -- Fios
    SIGNAL wires : STD_LOGIC;
    SIGNAL wires0 : STD_LOGIC_VECTOR(4 DOWNTO 0);
	 SIGNAL wires2 : STD_LOGIC_VECTOR(4 DOWNTO 0);
	 SIGNAL wires3 : STD_LOGIC_VECTOR(4 DOWNTO 0);

-- Comportamento:
BEGIN
    -- Instancias
    mux0 : mux_2x1_5
    PORT MAP(
        i0 => wires0, -- 00000000...
        i1 => in_data, -- fio de retorno do incrementador
        sel => wires, -- fio para resetar
        o => wires2  -- fio que vai para o registrador
    );

    bit_register_5 : reg_1x5
    PORT MAP(
        D_reg => wires2, --ok
        clk_reg => clk,
        load => (wires or load),
        clear => clear,
        Q_reg => wires3,
        Q_bar_reg => open
    );

    adder0 : incrementer5
    PORT MAP(
        in_data => wires3,
		  cin => cin,
        out_data => wires0 --ok
    );

    comp0 : comparator_5
    PORT MAP(
        a => wires3,
        b => "11101", --29 em dec
        eq => wires
    );
	 
	 out_data <= wires3;
	 sig <= wires;

END ARCHITECTURE bhv;