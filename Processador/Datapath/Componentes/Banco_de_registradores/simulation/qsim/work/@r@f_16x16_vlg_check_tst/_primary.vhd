library verilog;
use verilog.vl_types.all;
entity RF_16x16_vlg_check_tst is
    port(
        Rp_data         : in     vl_logic_vector(15 downto 0);
        Rq_data         : in     vl_logic_vector(15 downto 0);
        sampler_rx      : in     vl_logic
    );
end RF_16x16_vlg_check_tst;
