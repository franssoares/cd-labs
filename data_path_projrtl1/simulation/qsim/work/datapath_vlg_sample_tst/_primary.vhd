library verilog;
use verilog.vl_types.all;
entity datapath_vlg_sample_tst is
    port(
        CLK             : in     vl_logic;
        KEY             : in     vl_logic_vector(2 downto 0);
        LD_HOURS        : in     vl_logic;
        LD_LAST         : in     vl_logic;
        RESET           : in     vl_logic;
        SHOW            : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end datapath_vlg_sample_tst;
