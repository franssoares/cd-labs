-- Biblioteca
LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Entidade
entity LatchD_22 is
    port(
        d: in std_logic_vector(21 downto 0);        -- Entrada de dados
        clk: in std_logic;		  -- Sinal de clock
		  load: in std_logic;	  -- Carregar de clock
        clear: in std_logic;    -- Sinal de clear
        q: out std_logic_vector(21 downto 0)       -- Saída
    );
end LatchD_22;

-- Arquitetura
architecture behav of LatchD_22 is
    
begin
    process (clk, clear)
    begin
        if clear = '1' then
            q <= "0000000000000000000000";  -- Zera a saída quando o clear é ativado
        elsif (rising_edge(clk) and load = '1') then
            q <= d;    -- Atualiza a saída com o dado de entrada na borda de subida do clock
        end if;
    end process;
   
end behav;