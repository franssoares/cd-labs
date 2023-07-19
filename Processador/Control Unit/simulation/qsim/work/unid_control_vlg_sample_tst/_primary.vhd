library verilog;
use verilog.vl_types.all;
entity unid_control_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        comp_ab         : in     vl_logic;
        data_rom        : in     vl_logic_vector(15 downto 0);
        rf_rp_zero      : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end unid_control_vlg_sample_tst;
