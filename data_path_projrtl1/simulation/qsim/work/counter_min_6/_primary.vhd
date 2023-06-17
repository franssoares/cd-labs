library verilog;
use verilog.vl_types.all;
entity counter_min_6 is
    port(
        in_data         : in     vl_logic_vector(5 downto 0);
        out_data        : out    vl_logic_vector(5 downto 0);
        clk             : in     vl_logic;
        load            : in     vl_logic;
        cin             : in     vl_logic;
        clear           : in     vl_logic;
        sig             : out    vl_logic
    );
end counter_min_6;
