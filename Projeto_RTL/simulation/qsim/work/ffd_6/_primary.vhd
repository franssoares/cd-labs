library verilog;
use verilog.vl_types.all;
entity ffd_6 is
    port(
        D               : in     vl_logic;
        clk             : in     vl_logic;
        load            : in     vl_logic;
        clear           : in     vl_logic;
        Q               : out    vl_logic;
        Q_bar           : out    vl_logic
    );
end ffd_6;
