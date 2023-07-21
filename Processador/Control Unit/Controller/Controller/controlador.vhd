-- biblioteca
library ieee;
use ieee.std_logic_1164.all;

-- entidade
entity controlador is
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
	 
end entity controlador;

-- arquitetura
architecture Behavioral of controlador is

    -- componentes
	 
		 -- logica combinacional
		 component comb_logic is
			  port (
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
					rf_rp_zero : in std_logic;
					
					-- registrador de estados
					
						--> saidas
						n0 : out std_logic;
						n1 : out std_logic;
						n2 : out std_logic;
						n3 : out std_logic;
						
						--> entradas
						s0 : in std_logic;
						s1 : in std_logic;
						s2 : in std_logic;
						s3 : in std_logic
					
				);
		 end component comb_logic;
		 
		 -- registrador
		 component reg_states is
			   port (
				  clock : in std_logic;
				  entrada : in std_logic_vector(3 downto 0);
				  saida : out std_logic_vector(3 downto 0)
				);
		 end component reg_states;

    signal wires : std_logic_vector(7 downto 0);

-- comportamento
begin
    -- instancias
	 
		cl : comb_logic
			port map(
				op0 => op0,
					op1 => op1,
					op2 => op2,
					op3 => op3,
					
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
					rf_rp_zero => rf_rp_zero,
					
					-- registrador de estados
					
						--> saidas
						n0 => wires(0),
						n1 => wires(1),
						n2 => wires(2),
						n3 => wires(3),
						
						--> entradas
						s0 => wires(4),
						s1 => wires(5),
						s2 => wires(6),
						s3 => wires(7)
			);
			
			reg : reg_states
				port map(
					-- entradas
					clock => clk,
					entrada(0) => wires(0),
					entrada(1) => wires(1),
					entrada(2) => wires(2),
					entrada(3) => wires(3),
					
					-- saidas
					saida(0) => wires(4),
					saida(1) => wires(5),
					saida(2) => wires(6),
					saida(3) => wires(7)
				);
				
end architecture Behavioral;