-- biblioteca
library ieee;
use ieee.std_logic_1164.all;

-- entidade
entity comb_logic is
	port(
		
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
end entity comb_logic;

-- arquitetura
architecture behav of comb_logic is

-- comportamento
begin

	pc_ld <= NOT(s3) AND NOT(s2) AND NOT(s1) AND s0;
	pc_clr <= NOT(s3) AND NOT(s2) AND NOT(s1) AND NOT(s0);
	pc_inc <= (s3 AND NOT(s2) AND NOT(s1) AND s0) OR (s3 AND NOT(s2) AND s1 AND s0);
	--pc_sel <= s3 AND NOT(s2) AND s1 AND s0;
	i_rd <= NOT(s3) AND NOT(s2) AND NOT(s1) AND s0;
	ir_ld <= NOT(s3) AND NOT(s2) AND NOT(s1) AND s0;
	d_rd <= NOT(s3) AND NOT(s2) AND s1 AND s0;
	d_wr <= NOT(s3) AND s2 AND NOT(s1) AND NOT(s0);
	rf_w_wr <= (NOT(s3) AND NOT(s2) AND s1 AND s0) OR (NOT(s3) AND s2 AND NOT(s1) AND s0) OR (NOT(s3) AND s2 AND s1 AND NOT(s0)) OR (NOT(s3) AND s2 AND s1 AND s0);
	rf_s1 <= NOT(s3) AND s2 AND s1 AND NOT(s0);
	rf_s0 <= NOT(s3) AND NOT(s2) AND s1 AND s0;
	rf_rp_rd <= (NOT(s3) AND s2 AND NOT(s1) AND NOT(s0)) OR (NOT(s3) AND s2 AND NOT(s1) AND s0) OR (NOT(s3) AND s2 AND s1 AND s0) OR (s3 AND NOT(s2) AND NOT(s1) AND NOT(s0)) OR (s3 AND NOT(s2) AND s1 AND NOT(s0)) OR (s3 AND NOT(s2) AND s1 AND s0);     
	rf_rq_rd <= (NOT(s3) AND s2 AND NOT(s1) AND s0) OR (NOT(s3) AND s2 AND s1 AND s0) OR (s3 AND NOT(s2) AND s1 AND NOT(s0));
	alu_s0 <= (NOT(s3) AND s2 AND s1 AND s0);
	
	n3 <= (NOT(s3) AND NOT(s2) AND s1 AND NOT(s0) AND NOT(op3) AND op2 AND NOT(op1) AND op0) OR 
      (NOT(s3) AND NOT(s2) AND s1 AND NOT(s0) AND NOT(op3) AND op2 AND op1 AND NOT(op0)) OR
      (s3 AND NOT(s2) AND NOT(s1) AND NOT(s0) AND rf_rp_zero) OR
      (s3 AND NOT(s2) AND s1 AND NOT(s0) AND comp_ab);

	n2 <= (NOT(s3) AND NOT(s2) AND s1 AND NOT(s0) AND NOT(op3) AND NOT(op2) AND NOT(op1) AND op0) OR
      (NOT(s3) AND NOT(s2) AND s1 AND NOT(s0) AND NOT(op3) AND NOT(op2) AND op1 AND NOT(op0)) OR
      (NOT(s3) AND NOT(s2) AND s1 AND NOT(s0) AND NOT(op3) AND NOT(op2) AND op1 AND op0) OR
      (NOT(s3) AND NOT(s2) AND s1 AND NOT(s0) AND NOT(op3) AND op2 AND NOT(op1) AND NOT(op0));
		
	n1 <= (NOT(s3) AND NOT(s2) AND NOT(s1) AND s0) OR 
	      (NOT(s3) AND NOT(s2) AND s1 AND NOT(s0) AND NOT(op3) AND NOT(op2) AND NOT(op1) AND NOT(op0)) OR 
			(s3 AND NOT(s2) AND s1 AND NOT(s0) AND comp_ab) OR 
			(NOT(s3) AND NOT(s2) AND s1 AND NOT(s0) AND NOT(op3) AND NOT(op2) AND op1 AND op0) OR 
			(NOT(s3) AND NOT(s2) AND s1 AND NOT(s0) AND NOT(op3) AND op2 AND NOT(op1) AND NOT(op0)) OR 
			(NOT(s3) AND NOT(s2) AND s1 AND NOT(s0) AND NOT(op3) AND op2 AND op1 AND NOT(op0));
			
	n0 <= (NOT(s3) AND NOT(s2) AND NOT(s1) AND NOT(s0)) OR 
	     (NOT(s3) AND NOT(s2) AND s1 AND NOT(s0) AND NOT(op3) AND NOT(op2) AND NOT(op1) AND NOT(op0)) OR 
		  (NOT(s3) AND NOT(s2) AND s1 AND NOT(s0) AND NOT(op3) AND NOT(op2) AND op1 AND NOT(op0)) OR 
		  (NOT(s3) AND NOT(s2) AND s1 AND s0) OR 
		  (NOT(s3) AND s2 AND NOT(s1) AND NOT(s0)) OR 
		  (NOT(s3) AND s2 AND NOT(s1) AND s0) OR 
		  (NOT(s3) AND s2 AND s1 AND NOT(s0)) OR 
		  (NOT(s3) AND s2 AND s1 AND s0) OR 
		  (s3 AND NOT(s2) AND NOT(s1) AND NOT(s0) AND rf_rp_zero) OR 
		  (s3 AND NOT(s2) AND NOT(s1) AND s0) OR 
		  (s3 AND NOT(s2) AND s1 AND NOT(s0) AND comp_ab) OR 
		  (s3 AND NOT(s2) AND s1 AND s0) OR 
		  (NOT(s3) AND NOT(s2) AND s1 AND NOT(s0) AND NOT(op3) AND op2 AND NOT(op1) AND NOT(op0));
			
end architecture behav;