library verilog;
use verilog.vl_types.all;
entity timer is
    port(
        CLK             : in     vl_logic;
        RESET           : in     vl_logic;
        T               : out    vl_logic;
        OUT_DATA        : out    vl_logic_vector(21 downto 0)
    );
end timer;
