library verilog;
use verilog.vl_types.all;
entity RF_16x16 is
    port(
        clk             : in     vl_logic;
        W_data          : in     vl_logic_vector(15 downto 0);
        W_addr          : in     vl_logic_vector(3 downto 0);
        W_wr            : in     vl_logic;
        Rp_addr         : in     vl_logic_vector(3 downto 0);
        Rp_rd           : in     vl_logic;
        Rp_data         : out    vl_logic_vector(15 downto 0);
        Rq_addr         : in     vl_logic_vector(3 downto 0);
        Rq_rd           : in     vl_logic;
        Rq_data         : out    vl_logic_vector(15 downto 0)
    );
end RF_16x16;
