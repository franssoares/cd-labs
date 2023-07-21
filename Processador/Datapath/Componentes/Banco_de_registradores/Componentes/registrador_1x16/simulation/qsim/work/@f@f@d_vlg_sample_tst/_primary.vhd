library verilog;
use verilog.vl_types.all;
entity FFD_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        d               : in     vl_logic_vector(15 downto 0);
        load            : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end FFD_vlg_sample_tst;
