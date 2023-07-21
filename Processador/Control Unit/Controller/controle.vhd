library ieee;
use ieee.std_logic_1164.all;

entity controle is
    port (
		-- relogio
      clock : in std_logic;
		  
      -- contador de programa
		pc_ld : out std_logic;
		pc_clr : out std_logic;
		pc_inc : out std_logic;
		
		-- registro de instrucao
		ir_ld : out std_logic;

		-- banco de registradores do datapath
		rf_w_wr : out std_logic;
		rf_rp_rd : out std_logic;
		rf_rq_rd : out std_logic;
		
		-- seletor do mux do datapath
		rf_s0 : out std_logic;
		rf_s1 : out std_logic;
		
		-- memoria ram
		d_rd : out std_logic;
		d_wr : out std_logic;
		
		-- memoria de instrucao
		i_rd : out std_logic;
		
		-- alu do datapath
		alu_s0 : out std_logic;
		alu_s1 : out std_logic;
		comp_ab : in std_logic;
		rf_rp_zero : in std_logic;
		
		ir : in std_logic_vector(15 downto 0);
		rf_w_addr : out std_logic_vector(3 downto 0);
		rf_rp_addr : out std_logic_vector(3 downto 0);
		rf_rq_addr : out std_logic_vector(3 downto 0);
		rf_w_data : out std_logic_vector(7 downto 0);
		d_addr : out std_logic_vector(7 downto 0)
    );
end entity controle;

architecture Behavioral of controle is

    component controlador is
         port(
		  --relogio
		  clk : in std_logic;
		  
        -- estados
		op0 : in std_logic;
		op1 : in std_logic;
		op2 : in std_logic;
		op3 : in std_logic;
		
		-- contador de programa
		pc_ld : out std_logic;
		pc_clr : out std_logic;
		pc_inc : out std_logic;
		
		-- registro de instrucao
		ir_ld : out std_logic;

		-- banco de registradores do datapath
		rf_w_wr : out std_logic;
		rf_rp_rd : out std_logic;
		rf_rq_rd : out std_logic;
		
		-- seletor do mux do datapath
		rf_s0 : out std_logic;
		rf_s1 : out std_logic;
		
		-- memoria ram
		d_rd : out std_logic;
		d_wr : out std_logic;
		
		-- memoria de instrucao
		i_rd : out std_logic;
		
		-- alu do datapath
		alu_s0 : out std_logic;
		alu_s1 : out std_logic;
		comp_ab : in std_logic;
		rf_rp_zero : in std_logic
    );
    end component controlador;
	 
	 component datapath_control is
        port (
			  clock : in std_logic;
			  entrada : in std_logic_vector(11 downto 0);
			  rf_w_addr : out std_logic_vector(3 downto 0);
			  rf_rp_addr : out std_logic_vector(3 downto 0);
			  rf_rq_addr : out std_logic_vector(3 downto 0);
			  rf_w_data : out std_logic_vector(7 downto 0);
			  d_addr : out std_logic_vector(7 downto 0)
    );
    end component datapath_control;

    
begin

    ctr0 : controlador
		port map(
			clk => clock,
			op0 => ir(12),
			op1 => ir(13),
			op2 => ir(14),
			op3 => ir(15),
			
			-- contador de programa
	
					pc_ld => pc_ld,
					pc_clr => pc_clr,
					pc_inc => pc_inc,
					
					-- registro de instrucao
					ir_ld => ir_ld,

					-- banco de registradores do datapath
					rf_w_wr => rf_w_wr,
					rf_rp_rd => rf_rp_rd,
					rf_rq_rd => rf_rq_rd,
					
					-- seletor do mux do datapath
					rf_s0 => rf_s0,
					rf_s1 => rf_s1,
					
					-- memoria ram
					d_rd => d_rd,
					d_wr => d_wr,
					
					-- memoria de instrucao
					i_rd => i_rd,
					
					-- alu do datapath
					alu_s0 => alu_s0,
					alu_s1 => alu_s1,
					comp_ab => comp_ab,
					rf_rp_zero => rf_rp_zero
	 );
	 
	 dp : datapath_control
	 port map(
		clock => clock,
		entrada => ir(11 downto 0),
		rf_w_addr => rf_w_addr,
		rf_rp_addr => rf_rp_addr,
		rf_rq_addr => rf_rq_addr,
		rf_w_data => rf_w_data,
		d_addr => d_addr
	 );
end architecture Behavioral;