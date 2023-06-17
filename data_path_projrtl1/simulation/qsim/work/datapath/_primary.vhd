library verilog;
use verilog.vl_types.all;
entity datapath is
    port(
        LD_HOURS        : in     vl_logic;
        LD_LAST         : in     vl_logic;
        SHOW            : in     vl_logic;
        RESET           : in     vl_logic;
        CLK             : in     vl_logic;
        KEY             : in     vl_logic_vector(2 downto 0);
        T               : out    vl_logic;
        E               : out    vl_logic
    );
end datapath;
