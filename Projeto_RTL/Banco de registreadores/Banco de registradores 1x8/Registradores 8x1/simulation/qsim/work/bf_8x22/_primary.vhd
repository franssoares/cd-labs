library verilog;
use verilog.vl_types.all;
entity bf_8x22 is
    port(
        w_data          : in     vl_logic_vector(21 downto 0);
        w_addr          : in     vl_logic_vector(2 downto 0);
        w_en            : in     vl_logic;
        r_data          : out    vl_logic_vector(21 downto 0);
        r_addr          : in     vl_logic_vector(2 downto 0);
        r_en            : in     vl_logic;
        clk             : in     vl_logic;
        en              : in     vl_logic;
        clear           : in     vl_logic;
        load            : in     vl_logic
    );
end bf_8x22;
