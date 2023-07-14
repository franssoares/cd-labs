library verilog;
use verilog.vl_types.all;
entity ula_vlg_check_tst is
    port(
        comp_gt         : in     vl_logic;
        S               : in     vl_logic_vector(15 downto 0);
        sampler_rx      : in     vl_logic
    );
end ula_vlg_check_tst;
