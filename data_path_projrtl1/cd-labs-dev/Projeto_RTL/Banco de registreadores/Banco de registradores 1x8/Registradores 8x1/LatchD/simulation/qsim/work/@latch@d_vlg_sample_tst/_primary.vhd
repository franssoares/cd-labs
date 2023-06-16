library verilog;
use verilog.vl_types.all;
entity LatchD_vlg_sample_tst is
    port(
        clear           : in     vl_logic;
        clk             : in     vl_logic;
        d               : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end LatchD_vlg_sample_tst;
