library verilog;
use verilog.vl_types.all;
entity bf_8x1_vlg_sample_tst is
    port(
        clear           : in     vl_logic;
        clk             : in     vl_logic;
        en              : in     vl_logic;
        load            : in     vl_logic;
        r_addr          : in     vl_logic_vector(2 downto 0);
        r_en            : in     vl_logic;
        w_addr          : in     vl_logic_vector(2 downto 0);
        w_data          : in     vl_logic;
        w_en            : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end bf_8x1_vlg_sample_tst;
