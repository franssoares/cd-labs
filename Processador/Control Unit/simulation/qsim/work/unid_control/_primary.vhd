library verilog;
use verilog.vl_types.all;
entity unid_control is
    port(
        clk             : in     vl_logic;
        pc_addr         : out    vl_logic_vector(3 downto 0);
        data_rom        : in     vl_logic_vector(15 downto 0);
        rd              : out    vl_logic;
        rf_w_wr         : out    vl_logic;
        rf_rp_rd        : out    vl_logic;
        rf_rq_rd        : out    vl_logic;
        rf_s0           : out    vl_logic;
        rf_s1           : out    vl_logic;
        d_rd            : out    vl_logic;
        d_wr            : out    vl_logic;
        alu_s0          : out    vl_logic;
        alu_s1          : out    vl_logic;
        comp_ab         : in     vl_logic;
        rf_rp_zero      : in     vl_logic;
        rf_w_addr       : out    vl_logic_vector(3 downto 0);
        rf_rp_addr      : out    vl_logic_vector(3 downto 0);
        rf_rq_addr      : out    vl_logic_vector(3 downto 0);
        rf_w_data       : out    vl_logic_vector(7 downto 0);
        d_addr          : out    vl_logic_vector(7 downto 0)
    );
end unid_control;
