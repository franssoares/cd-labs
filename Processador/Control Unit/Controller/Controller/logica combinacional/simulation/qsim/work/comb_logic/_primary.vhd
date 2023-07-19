library verilog;
use verilog.vl_types.all;
entity comb_logic is
    port(
        op0             : in     vl_logic;
        op1             : in     vl_logic;
        op2             : in     vl_logic;
        op3             : in     vl_logic;
        pc_ld           : out    vl_logic;
        pc_clr          : out    vl_logic;
        pc_inc          : out    vl_logic;
        ir_ld           : out    vl_logic;
        rf_w_wr         : out    vl_logic;
        rf_rp_rd        : out    vl_logic;
        rf_rq_rd        : out    vl_logic;
        rf_s0           : out    vl_logic;
        rf_s1           : out    vl_logic;
        d_rd            : out    vl_logic;
        d_wr            : out    vl_logic;
        i_rd            : out    vl_logic;
        alu_s0          : out    vl_logic;
        alu_s1          : out    vl_logic;
        comp_ab         : in     vl_logic;
        rf_rp_zero      : in     vl_logic;
        n0              : out    vl_logic;
        n1              : out    vl_logic;
        n2              : out    vl_logic;
        n3              : out    vl_logic;
        s0              : in     vl_logic;
        s1              : in     vl_logic;
        s2              : in     vl_logic;
        s3              : in     vl_logic
    );
end comb_logic;
