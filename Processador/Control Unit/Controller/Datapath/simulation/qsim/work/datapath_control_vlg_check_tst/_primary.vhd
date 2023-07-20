library verilog;
use verilog.vl_types.all;
entity datapath_control_vlg_check_tst is
    port(
        d_addr          : in     vl_logic_vector(7 downto 0);
        rf_rp_addr      : in     vl_logic_vector(3 downto 0);
        rf_rq_addr      : in     vl_logic_vector(3 downto 0);
        rf_w_addr       : in     vl_logic_vector(3 downto 0);
        rf_w_data       : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end datapath_control_vlg_check_tst;
