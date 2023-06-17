library verilog;
use verilog.vl_types.all;
entity timer_vlg_check_tst is
    port(
        OUT_DATA        : in     vl_logic_vector(21 downto 0);
        T               : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end timer_vlg_check_tst;
