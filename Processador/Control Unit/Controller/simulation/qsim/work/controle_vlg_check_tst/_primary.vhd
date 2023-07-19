library verilog;
use verilog.vl_types.all;
entity controle_vlg_check_tst is
    port(
        alu_s0          : in     vl_logic;
        alu_s1          : in     vl_logic;
        d_addr          : in     vl_logic_vector(7 downto 0);
        d_rd            : in     vl_logic;
        d_wr            : in     vl_logic;
        i_rd            : in     vl_logic;
        ir_ld           : in     vl_logic;
        pc_clr          : in     vl_logic;
        pc_inc          : in     vl_logic;
        pc_ld           : in     vl_logic;
        rf_rp_addr      : in     vl_logic_vector(3 downto 0);
        rf_rp_rd        : in     vl_logic;
        rf_rq_addr      : in     vl_logic_vector(3 downto 0);
        rf_rq_rd        : in     vl_logic;
        rf_s0           : in     vl_logic;
        rf_s1           : in     vl_logic;
        rf_w_addr       : in     vl_logic_vector(3 downto 0);
        rf_w_data       : in     vl_logic_vector(7 downto 0);
        rf_w_wr         : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end controle_vlg_check_tst;
