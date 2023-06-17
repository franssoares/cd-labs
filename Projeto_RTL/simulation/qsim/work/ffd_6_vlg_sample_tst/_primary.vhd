library verilog;
use verilog.vl_types.all;
entity ffd_6_vlg_sample_tst is
    port(
        clear           : in     vl_logic;
        clk             : in     vl_logic;
        D               : in     vl_logic;
        load            : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end ffd_6_vlg_sample_tst;
