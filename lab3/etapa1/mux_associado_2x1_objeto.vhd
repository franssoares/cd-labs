--bibliotecas
library ieee; 
use ieee.std_logic_1164.all;

--entidade
entity mux_4x1_comp is
    port(
        i0, i1 : in bit_vector(1 downto 0);
        s0, s1     : in bit;
        m     : out bit_vector
    );
end entity mux_4x1_comp;

--arquitetura
architecture RTL of mux_4x1_comp is
    
    --declaração da componente
    component mux_2x1 is
        port(
            i0c, i1c, sc : in bit;
            mc         : out bit
        );
    end component;

    --declaração dos sinais
    signal in_inst : bit_vector(3 downto 0);

--comportamento do circuito
begin

    --intância 1
    inst1 : mux_2x1
        port map(
            sc => s0,
            i0c => i0(0),
            i1c => i1(0),
            mc => in_inst(0)
    );

    --intância 2
    inst2 : mux_2x1
        port map(
            sc => s0,
            i0c => i0(1),
            i1c => i1(1),
            mc => in_inst(1)
    );

    --intância 3
    inst3 : mux_2x1
        port map(
            sc => s1,
            i0c => in_inst(0),
            i1c => in_inst(1),
            mc => m
    );

end architecture RTL;