library verilog;
use verilog.vl_types.all;
entity counter is
    port(
        in_data         : in     vl_logic_vector(21 downto 0);
        out_data        : out    vl_logic_vector(21 downto 0);
        clk             : in     vl_logic;
        load            : in     vl_logic
    );
end counter;
