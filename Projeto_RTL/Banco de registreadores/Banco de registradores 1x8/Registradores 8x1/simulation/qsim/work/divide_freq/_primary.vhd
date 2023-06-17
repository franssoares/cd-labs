library verilog;
use verilog.vl_types.all;
entity divide_freq is
    port(
        clk_60hz        : in     vl_logic;
        clear           : in     vl_logic;
        clk_1hz         : out    vl_logic
    );
end divide_freq;
