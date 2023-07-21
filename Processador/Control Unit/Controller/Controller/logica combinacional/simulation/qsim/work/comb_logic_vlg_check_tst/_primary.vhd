library verilog;
use verilog.vl_types.all;
entity comb_logic_vlg_check_tst is
    port(
        alu_s0          : in     vl_logic;
        alu_s1          : in     vl_logic;
        d_rd            : in     vl_logic;
        d_wr            : in     vl_logic;
        i_rd            : in     vl_logic;
        ir_ld           : in     vl_logic;
        n0              : in     vl_logic;
        n1              : in     vl_logic;
        n2              : in     vl_logic;
        n3              : in     vl_logic;
        pc_clr          : in     vl_logic;
        pc_inc          : in     vl_logic;
        pc_ld           : in     vl_logic;
        rf_rp_rd        : in     vl_logic;
        rf_rq_rd        : in     vl_logic;
        rf_s0           : in     vl_logic;
        rf_s1           : in     vl_logic;
        rf_w_wr         : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end comb_logic_vlg_check_tst;
