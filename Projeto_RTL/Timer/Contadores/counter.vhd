-- Bibliotecas
LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Entidade
ENTITY counter IS
    port(
        in_data : IN STD_LOGIC_VECTOR(21 DOWNTO 0);
        out_data : OUT STD_LOGIC_VECTOR(21 DOWNTO 0);
        clk, load, clear : IN STD_LOGIC;
		  t : OUT STD_LOGIC
    );
END ENTITY counter;

-- Arquitetura
ARCHITECTURE rtl OF counter IS

    -- Componentes

    -- Contador de 6 bits
    COMPONENT counter_seg_6 IS
        GENERIC(
            w : INTEGER := 5
        );
        port(
            in_data : IN STD_LOGIC_VECTOR(w DOWNTO 0);
            out_data : OUT STD_LOGIC_VECTOR(w DOWNTO 0);
            clk, load, clear : IN STD_LOGIC;
            sig : OUT STD_LOGIC
        );
    END COMPONENT counter_seg_6;
	 
	 -- Contador de 6 bits
    COMPONENT counter_min_6 IS
        GENERIC(
            w : INTEGER := 5
        );
        port(
            in_data : IN STD_LOGIC_VECTOR(w DOWNTO 0);
            out_data : OUT STD_LOGIC_VECTOR(w DOWNTO 0);
            clk, load, cin, clear : IN STD_LOGIC;
            sig : OUT STD_LOGIC
        );
    END COMPONENT counter_min_6;
	 
	 -- Contadores de 5 bits
	 COMPONENT counter_hours_5 IS
		 GENERIC(
				w : INTEGER := 4
		 );
		 port(
				in_data : IN STD_LOGIC_VECTOR(w DOWNTO 0);
				out_data : OUT STD_LOGIC_VECTOR(w DOWNTO 0);
				clk, load,cin, clear : IN STD_LOGIC;
				sig : OUT STD_LOGIC
		 );
	 END COMPONENT counter_hours_5;

	 COMPONENT counter_days_5 IS
		 GENERIC(
			w : INTEGER := 4
		 );
		 port(
				in_data : IN STD_LOGIC_VECTOR(w DOWNTO 0);
				out_data : OUT STD_LOGIC_VECTOR(w DOWNTO 0);
				clk, load,cin, clear : IN STD_LOGIC;
				sig : OUT STD_LOGIC
		 );
	 END COMPONENT counter_days_5;

    -- Fios
    SIGNAL wires : STD_LOGIC_VECTOR(3 DOWNTO 0);

-- Comportamento:
BEGIN

    -- Instancias
    seconds : counter_seg_6
    PORT MAP(
        in_data => in_data(5 DOWNTO 0),
        out_data => out_data(5 DOWNTO 0),
        clk => clk,
        load => load,
        clear => clear,
        sig => wires(0)
    );

    minutes : counter_min_6
    PORT MAP(
        in_data => in_data(11 DOWNTO 6),
        out_data => out_data(11 DOWNTO 6),
        clk => clk,
		  cin => wires(0),
        load => load,
        clear => clear,
        sig => wires(1)
    );
	 
	 hours : counter_hours_5
    PORT MAP(
        in_data => in_data(16 DOWNTO 12),
        out_data => out_data(16 DOWNTO 12),
        clk => clk,
		  cin => wires(1),
        load => load,
        clear => clear,
        sig => wires(2)
    );
	 
	 days : counter_days_5
    PORT MAP(
        in_data => in_data(21 DOWNTO 17),
        out_data => out_data(21 DOWNTO 17),
        clk => clk,
		  cin => wires(2),
        load => load,
        clear => clear,
        sig => t
    ); 
	 
	
END ARCHITECTURE rtl;