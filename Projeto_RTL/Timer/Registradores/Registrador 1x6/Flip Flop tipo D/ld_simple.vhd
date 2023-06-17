-- Bibliotecas
library ieee;
use ieee.std_logic_1164.all;

-- Entidade
entity ld_simple is
    port (
        d, enable, reset : in std_logic;
        q : out std_logic
    );
end entity ld_simple;

-- Arquitetura
architecture behav of ld_simple is
    signal internal_state : std_logic;
begin
    process (d, enable, reset)
    begin
        if reset = '1' then
            internal_state <= '0';
        elsif enable = '1' then
            internal_state <= d;
        end if;
    end process;

    -- Atribuição das saídas Q
    q <= internal_state;
end architecture behav;