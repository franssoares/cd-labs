-- Bibliotecas
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Entidade
entity mux_2x1_22 is
    Port (
        i0    : in  std_logic_vector(21 downto 0);
        i1    : in  std_logic_vector(21 downto 0);
        sel   : in  std_logic;
        out_m   : out std_logic_vector(21 downto 0)
    );
end mux_2x1_22;

-- Arquitetura
architecture bhv of mux_2x1_22 is
begin
    -- Processo para seleção dos dados de entrada
    process(i0, i1, sel)
    begin
        if sel = '0' then
            out_m <= i0;  -- Se Select for 0
        else
			out_m <= i1;  -- Se Select for 1
        end if;
    end process;
end architecture bhv;