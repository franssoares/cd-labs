library verilog;
use verilog.vl_types.all;
entity datapath_control_vlg_sample_tst is
    port(
        clock           : in     vl_logic;
        entrada         : in     vl_logic_vector(11 downto 0);
        sampler_tx      : out    vl_logic
    );
end datapath_control_vlg_sample_tst;
