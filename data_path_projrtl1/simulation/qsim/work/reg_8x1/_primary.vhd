library verilog;
use verilog.vl_types.all;
entity reg_8x1 is
    port(
        d_data          : in     vl_logic;
        clk             : in     vl_logic;
        clear           : in     vl_logic;
        load            : in     vl_logic;
        q_data          : out    vl_logic
    );
end reg_8x1;
