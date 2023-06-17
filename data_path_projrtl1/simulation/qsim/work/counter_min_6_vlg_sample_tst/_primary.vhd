library verilog;
use verilog.vl_types.all;
entity counter_min_6_vlg_sample_tst is
    port(
        cin             : in     vl_logic;
        clear           : in     vl_logic;
        clk             : in     vl_logic;
        in_data         : in     vl_logic_vector(5 downto 0);
        load            : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end counter_min_6_vlg_sample_tst;
