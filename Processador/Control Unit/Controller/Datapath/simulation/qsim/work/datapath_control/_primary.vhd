library verilog;
use verilog.vl_types.all;
entity datapath_control is
    port(
        clock           : in     vl_logic;
        entrada         : in     vl_logic_vector(11 downto 0);
        rf_w_addr       : out    vl_logic_vector(3 downto 0);
        rf_rp_addr      : out    vl_logic_vector(3 downto 0);
        rf_rq_addr      : out    vl_logic_vector(3 downto 0);
        rf_w_data       : out    vl_logic_vector(7 downto 0);
        d_addr          : out    vl_logic_vector(7 downto 0)
    );
end datapath_control;
