library verilog;
use verilog.vl_types.all;
entity reg_1x6_vlg_check_tst is
    port(
        Q_bar_reg       : in     vl_logic_vector(5 downto 0);
        Q_reg           : in     vl_logic_vector(5 downto 0);
        sampler_rx      : in     vl_logic
    );
end reg_1x6_vlg_check_tst;
