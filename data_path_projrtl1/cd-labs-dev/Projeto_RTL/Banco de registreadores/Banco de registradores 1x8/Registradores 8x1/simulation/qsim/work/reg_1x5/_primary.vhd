library verilog;
use verilog.vl_types.all;
entity reg_1x5 is
    port(
        D_reg           : in     vl_logic_vector(4 downto 0);
        clk_reg         : in     vl_logic;
        load            : in     vl_logic;
        clear           : in     vl_logic;
        Q_reg           : out    vl_logic_vector(4 downto 0);
        Q_bar_reg       : out    vl_logic_vector(4 downto 0)
    );
end reg_1x5;
