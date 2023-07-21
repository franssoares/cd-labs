library verilog;
use verilog.vl_types.all;
entity processador_vlg_check_tst is
    port(
        rom_data        : in     vl_logic_vector(15 downto 0);
        sinal_maior     : in     vl_logic;
        sinal_zero      : in     vl_logic;
        t_rf_addr       : in     vl_logic_vector(3 downto 0);
        t_rf_rp_addr    : in     vl_logic_vector(3 downto 0);
        sampler_rx      : in     vl_logic
    );
end processador_vlg_check_tst;
