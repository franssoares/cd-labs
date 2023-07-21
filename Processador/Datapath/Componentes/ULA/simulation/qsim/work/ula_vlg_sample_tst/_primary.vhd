library verilog;
use verilog.vl_types.all;
entity ula_vlg_sample_tst is
    port(
        A               : in     vl_logic_vector(15 downto 0);
        B               : in     vl_logic_vector(15 downto 0);
        x               : in     vl_logic;
        y               : in     vl_logic;
        z               : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end ula_vlg_sample_tst;
