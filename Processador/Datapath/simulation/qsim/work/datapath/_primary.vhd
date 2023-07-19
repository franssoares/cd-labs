library verilog;
use verilog.vl_types.all;
entity datapath is
    port(
        data_ram_in     : in     vl_logic_vector(15 downto 0);
        data_ram_out    : out    vl_logic_vector(15 downto 0);
        RF_W_data       : in     vl_logic_vector(7 downto 0);
        RF_W_addr       : in     vl_logic_vector(3 downto 0);
        RF_Rp_addr      : in     vl_logic_vector(3 downto 0);
        RF_Rq_addr      : in     vl_logic_vector(3 downto 0);
        RF_s1           : in     vl_logic;
        RF_s0           : in     vl_logic;
        RF_W_wr         : in     vl_logic;
        RF_Rp_rd        : in     vl_logic;
        RF_Rq_rd        : in     vl_logic;
        RF_Rp_zero      : out    vl_logic;
        alu_s1          : in     vl_logic;
        alu_s0          : in     vl_logic;
        alu_comp_gt     : out    vl_logic;
        clk             : in     vl_logic
    );
end datapath;
