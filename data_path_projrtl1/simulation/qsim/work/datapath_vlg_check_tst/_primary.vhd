library verilog;
use verilog.vl_types.all;
entity datapath_vlg_check_tst is
    port(
        E               : in     vl_logic;
        T               : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end datapath_vlg_check_tst;
