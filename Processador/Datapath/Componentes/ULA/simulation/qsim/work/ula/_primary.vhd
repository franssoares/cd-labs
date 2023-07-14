library verilog;
use verilog.vl_types.all;
entity ula is
    port(
        A               : in     vl_logic_vector(15 downto 0);
        B               : in     vl_logic_vector(15 downto 0);
        x               : in     vl_logic;
        y               : in     vl_logic;
        z               : in     vl_logic;
        S               : out    vl_logic_vector(15 downto 0);
        comp_gt         : out    vl_logic
    );
end ula;
