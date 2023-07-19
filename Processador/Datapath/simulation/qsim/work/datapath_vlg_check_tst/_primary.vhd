library verilog;
use verilog.vl_types.all;
entity datapath_vlg_check_tst is
    port(
        alu_comp_gt     : in     vl_logic;
        data_ram_out    : in     vl_logic_vector(15 downto 0);
        RF_Rp_zero      : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end datapath_vlg_check_tst;
