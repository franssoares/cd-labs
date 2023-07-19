library verilog;
use verilog.vl_types.all;
entity cont_program is
    port(
        clock           : in     vl_logic;
        reset           : in     vl_logic;
        enable          : in     vl_logic;
        pc_inc          : in     vl_logic;
        input_data      : in     vl_logic_vector(7 downto 0);
        output          : out    vl_logic_vector(3 downto 0)
    );
end cont_program;
