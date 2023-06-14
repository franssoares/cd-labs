-- Bibliotecas
LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Entidade
ENTITY counter_min_6 IS

    -- Constante
    GENERIC(
        w : INTEGER := 5
    );

    port(
       in_data : IN STD_LOGIC_VECTOR(w DOWNTO 0);
       out_data : OUT STD_LOGIC_VECTOR(w DOWNTO 0);
       clk, load, cin : IN STD_LOGIC;
		 sig : OUT STD_LOGIC
    );

END ENTITY counter_min_6;

-- Arquitetura
ARCHITECTURE bhv OF counter_min_6 IS

    -- Componentes

        --MUX
        COMPONENT mux_2x1_6 IS
				GENERIC(
					 w : INTEGER := 5
				); 
            PORT(
                i0, i1 : IN STD_LOGIC_VECTOR(w DOWNTO 0);
                sel : IN STD_LOGIC;
                o : OUT STD_LOGIC_VECTOR(w DOWNTO 0)
            );
        END COMPONENT mux_2x1_6;
        
        --INCREMENTER
        COMPONENT incrementer6 IS
            GENERIC(
                w : INTEGER := 5
            );
            port(
                in_data : in STD_LOGIC_VECTOR(w DOWNTO 0);
					 cin : in std_logic;
					 out_data : out STD_LOGIC_VECTOR(w DOWNTO 0)
            );
        END COMPONENT incrementer6;

        --COMPARATOR
        COMPONENT comparator_6 IS
            GENERIC(
                w : INTEGER := 5
            );
            port(
                a : IN STD_LOGIC_VECTOR(w DOWNTO 0);
                b : IN STD_LOGIC_VECTOR(w DOWNTO 0);
                eq : OUT STD_LOGIC
            );
        END COMPONENT comparator_6;

        --REGISTER
        COMPONENT reg_ff_d_6bits IS
            GENERIC(
                tam : integer :=5
            );
            PORT(
                D_reg : IN STD_LOGIC_VECTOR(tam DOWNTO 0);
                clk_reg, load : IN STD_LOGIC;
                Q_reg, Q_bar_reg : OUT STD_LOGIC_VECTOR(tam DOWNTO 0)
            );
        END COMPONENT reg_ff_d_6bits;

    -- Fios
	 SIGNAL wires : STD_LOGIC;
    SIGNAL wires0 : STD_LOGIC_VECTOR(5 DOWNTO 0);
	 SIGNAL wires2 : STD_LOGIC_VECTOR(5 DOWNTO 0);
	 SIGNAL wires3 : STD_LOGIC_VECTOR(5 DOWNTO 0);

-- Comportamento:
BEGIN
    -- Instancias
    mux06 : mux_2x1_6
    PORT MAP(
        i0 => wires0, -- 00000000...
        i1 => in_data, -- fio de retorno do incrementador
        sel => wires, -- fio para resetar
        o => wires2  -- fio que vai para o registrador
    );

    bit_register_6 : reg_ff_d_6bits
    PORT MAP(
        D_reg => wires2, --ok
        clk_reg => clk,
        load => (wires or load),
        Q_reg => wires3,
        Q_bar_reg => open
    );

    adder06 : incrementer6
    PORT MAP(
        in_data => wires3,
		  cin => cin,
        out_data => wires0 --ok
    );

    comp06 : comparator_6
    PORT MAP(
        a => wires3,
        b => "111011", --59 em dec
        eq => wires
    );
	 
	 out_data <= wires3;
	 sig <= wires;

END ARCHITECTURE bhv;