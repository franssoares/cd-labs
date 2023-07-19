library verilog;
use verilog.vl_types.all;
entity controle_vlg_sample_tst is
    port(
        clock           : in     vl_logic;
        comp_ab         : in     vl_logic;
        ir              : in     vl_logic_vector(15 downto 0);
        rf_rp_zero      : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end controle_vlg_sample_tst;
