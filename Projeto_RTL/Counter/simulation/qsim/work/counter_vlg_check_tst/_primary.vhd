library verilog;
use verilog.vl_types.all;
entity counter_vlg_check_tst is
    port(
        out_data        : in     vl_logic_vector(21 downto 0);
        sampler_rx      : in     vl_logic
    );
end counter_vlg_check_tst;
