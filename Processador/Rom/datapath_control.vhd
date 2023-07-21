library ieee;
use ieee.std_logic_1164.all;

entity datapath_control is
    port (
        clock : in std_logic;
        entrada : in std_logic_vector(11 downto 0);
        rf_w_addr : out std_logic_vector(3 downto 0);
		  rf_rp_addr : out std_logic_vector(3 downto 0);
		  rf_rq_addr : out std_logic_vector(3 downto 0);
		  rf_w_data : out std_logic_vector(7 downto 0);
		  d_addr : out std_logic_vector(7 downto 0)
		  
    );
end entity datapath_control;

architecture Behavioral of datapath_control is
    
	 component regd is
        port (
			  clock : in std_logic;
			  entrada : in std_logic_vector(7 downto 0);
			  saida : out std_logic_vector(7 downto 0)
		  );
    end component regd;
	 
	 component reg4bits is
      port (
        clock : in std_logic;
        entrada : in std_logic_vector(3 downto 0);
        saida : out std_logic_vector(3 downto 0)
		);
    end component reg4bits;
	 
	 signal wires : std_logic_vector(7 downto 0);

begin

	Ra : reg4bits
	port map (
		clock => clock,
		entrada => entrada(11 downto 8),
		saida => rf_rp_addr
	);
	
	Rb : reg4bits
	port map (
		clock => clock,
		entrada => entrada(7 downto 4),
		saida => rf_rq_addr
	);
	
	Rc : reg4bits
	port map (
		clock => clock,
		entrada => entrada(3 downto 0),
		saida => rf_w_addr
	);
	
	d : regd
	port map (
		clock => clock,
		entrada => entrada(7 downto 0),
		saida => wires
	);
	
   rf_w_data <= wires;
	d_addr <= wires;
	
end architecture Behavioral;