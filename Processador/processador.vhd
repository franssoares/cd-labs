-- biblioteca
library ieee;
use ieee.std_logic_1164.all;

-- entidade
entity processador is
	port(
		clk : in std_logic;
		t_rf_addr, t_rf_rp_addr : out std_logic_vector(3 downto 0); 
		rom_data: out std_logic_vector(15 downto 0)
	);
	
end entity processador;

-- arquitetura
architecture RTL of processador is

-- Componentes

	-- rom
	component ROM7X16 is
	   generic (
        DATA_WIDTH : integer := 16 -- Largura dos dados
    );
    port (
			enable : in std_logic; -- Sinal de habilitação da leitura
        addr   : in  std_logic_vector(3 downto 0); -- Sinal de endereço
        data_r : out std_logic_vector(DATA_WIDTH - 1 downto 0) -- Sinal de dados de leitura
    );
	end component ROM7X16;
	
	-- unidade de controle
	component unid_control is
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
	end component unid_control;
	
	-- RAM
	component RAM256x16 is
		generic (
        ADDR_WIDTH : integer := 8; -- Largura do endereço
        DATA_WIDTH : integer := 16 -- Largura dos dados
    );
    port (
        clk    : in  std_logic; -- Sinal de clock
        en_w   : in  std_logic; -- Sinal de enable de escrita
        en_r   : in  std_logic; -- Sinal de enable de leitura
        addr   : in  std_logic_vector(ADDR_WIDTH - 1 downto 0); -- Sinal de endereço
        data_w : in  std_logic_vector(DATA_WIDTH - 1 downto 0); -- Sinal de dados de escrita
        data_r : out std_logic_vector(DATA_WIDTH - 1 downto 0) -- Sinal de dados de leitura
    );
	end component RAM256x16;
	
	-- datapath
	component datapath is
		port(
		-- dados
		data_ram_in : in std_logic_vector(15 downto 0);
		data_ram_out : out std_logic_vector(15 downto 0);
		
		RF_W_data : in std_logic_vector(7 downto 0);
		 
		-- enderecos
		RF_W_addr : in std_logic_vector(3 downto 0);
		RF_Rp_addr : in std_logic_vector(3 downto 0);
		RF_Rq_addr : in std_logic_vector(3 downto 0);
		
		-- sinais
		RF_s1 : in std_logic;
		RF_s0 : in std_logic;
		
		RF_W_wr : in std_logic;
		RF_Rp_rd : in std_logic;
		RF_Rq_rd : in std_logic;
		RF_Rp_zero : out std_logic;
		
		alu_s1 : in std_logic;
		alu_s0 : in std_logic;
		
		alu_comp_gt : out std_logic;
		
		-- relogio
		clk : in std_logic
		
	);
	end component;
	
	-- datapath 
	signal wires_datapath_rf : std_logic_vector(3 downto 0);
	signal wires_datapath_mux : std_logic_vector(1 downto 0);
	
	--ram
	signal wires_uctrl : std_logic_vector(1 downto 0);
	signal wires_d_addr : std_logic_vector(7 downto 0);
	
	-- alu
	signal wires_alu : std_logic_vector(3 downto 0);
	
	-- rom
	SIGNAL wires_rom_addr : std_logic_vector(3 downto 0);
	signal wires_rom_data : std_logic_vector(15 downto 0);
	signal wires_rom_enable : std_logic;
	
	-- rf
	signal wires_rf_w_addr : std_logic_vector(3 downto 0);
	signal wires_rf_addr : std_logic_vector(3 downto 0);
	signal wires_rf_rq_addr : std_logic_vector(3 downto 0);
	signal wires_rf_w_data : std_logic_vector(7 downto 0);

	
	
	signal wires_data_ram_in : std_logic_vector(15 downto 0);
	signal wires_data_ram_out : std_logic_vector(15 downto 0);
	
-- comportamento
begin

-- instancias
	rom0 : rom7X16
	port map(
		enable => wires_rom_enable,
		addr =>  wires_rom_addr,
		data_r => wires_rom_data
	);
	
	uctr0 : unid_control
	port map(
		clk => clk,
		pc_addr => wires_rom_addr,
		data_rom => wires_rom_data,
		rd => wires_rom_enable,
		
		rf_w_wr => wires_datapath_rf(0),
		rf_rp_rd => wires_datapath_rf(1),
		rf_rq_rd => wires_datapath_rf(2),
		
		rf_s0 => wires_datapath_mux(0),
		rf_s1 => wires_datapath_mux(1),
		
		d_rd => wires_uctrl(0),
		d_wr => wires_uctrl(1),
		
		alu_s0 => wires_alu(0),
		alu_s1 => wires_alu(1),
		comp_ab => wires_alu(2),
		rf_rp_zero => wires_alu(3),
		
		rf_w_addr => wires_rf_w_addr,
		rf_rp_addr => wires_rf_addr,
		rf_rq_addr => wires_rf_rq_addr,
		rf_w_data => wires_rf_w_data,
		d_addr => wires_d_addr
	);
	
	
	
	dp : datapath
		port map(
			data_ram_in => wires_data_ram_in,
			data_ram_out => wires_data_ram_out,
			
			RF_W_data => wires_rf_w_data,
			 
			-- enderecos
			RF_W_addr => wires_rf_w_addr,
			RF_Rp_addr => wires_rf_addr,
			RF_Rq_addr => wires_rf_rq_addr,
			
			
			-- sinais
			RF_s1 => wires_datapath_mux(1),
			RF_s0 => wires_datapath_mux(0),
			
			RF_W_wr => wires_datapath_rf(0),
			RF_Rp_rd => wires_datapath_rf(1),
			RF_Rq_rd => wires_datapath_rf(2),
			RF_Rp_zero => wires_alu(3),
			
			alu_s1 => wires_alu(1),
			alu_s0  => wires_alu(0),
			
			alu_comp_gt => wires_alu(2),
			
			-- relogio
			clk => clk
			
		);
		
	
	ram0 : ram256x16
	port map(
		  clk    => clk,
        en_w   => wires_uctrl(1),
        en_r   => wires_uctrl(0),
        addr   => wires_d_addr,
        data_w => wires_data_ram_out,
        data_r => wires_data_ram_in
	);
	
	t_rf_addr <= wires_rf_w_addr;
	t_rf_rp_addr <= wires_rf_addr;
	rom_data <= wires_rom_data;
		
end architecture RTL;