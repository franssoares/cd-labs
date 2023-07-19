library verilog;
use verilog.vl_types.all;
entity cont_program_vlg_sample_tst is
    port(
        clock           : in     vl_logic;
        enable          : in     vl_logic;
        input_data      : in     vl_logic_vector(7 downto 0);
        pc_inc          : in     vl_logic;
        reset           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end cont_program_vlg_sample_tst;
