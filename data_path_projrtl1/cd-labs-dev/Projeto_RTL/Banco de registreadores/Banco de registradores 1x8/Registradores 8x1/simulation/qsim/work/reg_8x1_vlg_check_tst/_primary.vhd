library verilog;
use verilog.vl_types.all;
entity reg_8x1_vlg_check_tst is
    port(
        q_data          : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end reg_8x1_vlg_check_tst;
