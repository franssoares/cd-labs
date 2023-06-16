-- Biblioteca
LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Entidade
entity LatchD is
    port(
        d: in std_logic;        -- Entrada de dados
        clk: in std_logic;		  -- Sinal de clock
		  load: in std_logic;	  -- Carregar de clock
        clear: in std_logic;    -- Sinal de clear
        q: out std_logic        -- Saída
    );
end LatchD;

-- Arquitetura
architecture behav of LatchD is
    
begin
    process (clk, d)
    begin
        if (clear = '1' or d = '0') then
            q <= '0';  -- Zera a saída quando o clear é ativado
        elsif (rising_edge(clk) and d = '1') then
            q <= d;    -- Atualiza a saída com o dado de entrada na borda de subida do clock
        end if;
    end process;
   
end behav;