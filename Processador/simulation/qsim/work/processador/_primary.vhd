library verilog;
use verilog.vl_types.all;
entity processador is
    port(
        clk             : in     vl_logic;
        sinal_zero      : out    vl_logic;
        sinal_maior     : out    vl_logic;
        t_rf_addr       : out    vl_logic_vector(3 downto 0);
        t_rf_rp_addr    : out    vl_logic_vector(3 downto 0);
        rom_data        : out    vl_logic_vector(15 downto 0)
    );
end processador;
