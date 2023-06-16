library verilog;
use verilog.vl_types.all;
entity reg_8x1_vlg_sample_tst is
    port(
        clear           : in     vl_logic;
        clk             : in     vl_logic;
        d_data          : in     vl_logic_vector(7 downto 0);
        load            : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end reg_8x1_vlg_sample_tst;
