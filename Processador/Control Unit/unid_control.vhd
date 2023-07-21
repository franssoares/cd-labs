library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity unid_control is
    port(	
		-- relogio
      clk    : in  std_logic;
		  
		-- pc
		pc_addr : out std_logic_vector(3 downto 0);
		  
		-- ir
		data_rom : in std_logic_vector(15 downto 0);
		rd : out std_logic;

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
		
		-- alu do datapath
		alu_s0 : out std_logic;
		alu_s1 : out std_logic;
		comp_ab : in std_logic;
		rf_rp_zero : in std_logic;
		
		rf_w_addr : out std_logic_vector(3 downto 0);
		rf_rp_addr : out std_logic_vector(3 downto 0);
		rf_rq_addr : out std_logic_vector(3 downto 0);
		rf_w_data : out std_logic_vector(7 downto 0);
		d_addr : out std_logic_vector(7 downto 0)
    );
end entity unid_control;

architecture Behavioral of unid_control is

    component controle is
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
	 end component;
	 
	 
	 component ireader is
			generic (
			  IR_WIDTH : integer := 16
		 );
		 port (
			  clk    : in  std_logic;
			  IR_ld  : in  std_logic;
			  IR_in  : in  std_logic_vector(IR_WIDTH-1 downto 0);
			  IR_out : out std_logic_vector(IR_WIDTH-1 downto 0)
		 );
	 end component;
	 
	 component cont_program is
		port (
        clock       : in std_logic;
        reset       : in std_logic;
        pc_ld      : in std_logic;
        pc_inc      : in std_logic;
        pc_addr      : out std_logic_vector(3 downto 0)
    );
	 end component;
	 
	 signal wire_pc : std_logic_vector(2 downto 0);
	 signal wire_ir : std_logic;
	 signal wire_ir_data : std_logic_vector(15 downto 0);
	 
begin

   pc0 : cont_program
	port map (
		clock => clk,
		reset => wire_pc(0),
		pc_ld => wire_pc(1),
		pc_inc => wire_pc(2),
		pc_addr => pc_addr
	);
	
	ir0 : ireader
	port map(
		clk => clk,
		IR_ld => wire_ir,
		IR_in => data_rom,
		IR_out => wire_ir_data
	);
	
	ctrl0 : controle
	port map(
	-- relogio
      clock => clk,
		  
      -- contador de programa
		pc_ld => wire_pc(1),
		pc_clr => wire_pc(0),
		pc_inc => wire_pc(2),
		
		-- registro de instrucao
		ir_ld => wire_ir,

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
		i_rd => rd,
		
		-- alu do datapath
		alu_s0 => alu_s0,
		alu_s1 => alu_s1,
		comp_ab => comp_ab,
		rf_rp_zero => rf_rp_zero,
		
		ir => wire_ir_data,
		rf_w_addr => rf_w_addr,
		rf_rp_addr => rf_rp_addr,
		rf_rq_addr => rf_rq_addr,
		rf_w_data => rf_w_data,
		d_addr =>d_addr
	
	);
	
end architecture Behavioral;