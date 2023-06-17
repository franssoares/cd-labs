library verilog;
use verilog.vl_types.all;
entity reg_1x6_vlg_sample_tst is
    port(
        clear           : in     vl_logic;
        clk_reg         : in     vl_logic;
        D_reg           : in     vl_logic_vector(5 downto 0);
        load            : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end reg_1x6_vlg_sample_tst;
