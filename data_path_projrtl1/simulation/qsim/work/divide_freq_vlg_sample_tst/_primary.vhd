library verilog;
use verilog.vl_types.all;
entity divide_freq_vlg_sample_tst is
    port(
        clear           : in     vl_logic;
        clk_60hz        : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end divide_freq_vlg_sample_tst;
