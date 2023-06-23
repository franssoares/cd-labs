library verilog;
use verilog.vl_types.all;
entity calculadora is
    port(
        A               : in     vl_logic_vector(5 downto 0);
        B               : in     vl_logic_vector(5 downto 0);
        x               : in     vl_logic;
        y               : in     vl_logic;
        z               : in     vl_logic;
        en              : in     vl_logic;
        clk             : in     vl_logic;
        S               : out    vl_logic_vector(5 downto 0)
    );
end calculadora;
