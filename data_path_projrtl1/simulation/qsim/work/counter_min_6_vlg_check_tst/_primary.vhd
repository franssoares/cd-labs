library verilog;
use verilog.vl_types.all;
entity counter_min_6_vlg_check_tst is
    port(
        out_data        : in     vl_logic_vector(5 downto 0);
        sig             : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end counter_min_6_vlg_check_tst;
