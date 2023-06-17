library verilog;
use verilog.vl_types.all;
entity ffd_6_vlg_check_tst is
    port(
        Q               : in     vl_logic;
        Q_bar           : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end ffd_6_vlg_check_tst;
