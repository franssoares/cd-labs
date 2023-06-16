library verilog;
use verilog.vl_types.all;
entity reg_8x1 is
    port(
        d_data          : in     vl_logic_vector(7 downto 0);
        clk             : in     vl_logic;
        clear           : in     vl_logic;
        load            : in     vl_logic;
        q_data          : out    vl_logic_vector(7 downto 0)
    );
end reg_8x1;
