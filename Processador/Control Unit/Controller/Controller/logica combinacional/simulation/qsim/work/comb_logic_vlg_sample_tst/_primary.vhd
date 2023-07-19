library verilog;
use verilog.vl_types.all;
entity comb_logic_vlg_sample_tst is
    port(
        comp_ab         : in     vl_logic;
        op0             : in     vl_logic;
        op1             : in     vl_logic;
        op2             : in     vl_logic;
        op3             : in     vl_logic;
        rf_rp_zero      : in     vl_logic;
        s0              : in     vl_logic;
        s1              : in     vl_logic;
        s2              : in     vl_logic;
        s3              : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end comb_logic_vlg_sample_tst;
