library verilog;
use verilog.vl_types.all;
entity calculadora_vlg_sample_tst is
    port(
        A               : in     vl_logic_vector(5 downto 0);
        B               : in     vl_logic_vector(5 downto 0);
        clk             : in     vl_logic;
        en              : in     vl_logic;
        x               : in     vl_logic;
        y               : in     vl_logic;
        z               : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end calculadora_vlg_sample_tst;
