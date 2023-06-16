library verilog;
use verilog.vl_types.all;
entity bf_8x22_vlg_check_tst is
    port(
        r_data          : in     vl_logic_vector(21 downto 0);
        sampler_rx      : in     vl_logic
    );
end bf_8x22_vlg_check_tst;
