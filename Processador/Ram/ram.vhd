-- biblioteca
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- entidade
entity RAM256x16 is
    generic (
        ADDR_WIDTH : integer := 8; -- Largura do endereço
        DATA_WIDTH : integer := 16 -- Largura dos dados
    );
    port (
        clk    : in  std_logic; -- Sinal de clock
        en_w   : in  std_logic; -- Sinal de enable de escrita
        en_r   : in  std_logic; -- Sinal de enable de leitura
        addr   : in  std_logic_vector(ADDR_WIDTH - 1 downto 0); -- Sinal de endereço
        data_w : in  std_logic_vector(DATA_WIDTH - 1 downto 0); -- Sinal de dados de escrita
        data_r : out std_logic_vector(DATA_WIDTH - 1 downto 0) -- Sinal de dados de leitura
    );
end RAM256x16;

-- arquitetura
architecture behavioral of RAM256x16 is
    type ram_array is array (0 to 2**ADDR_WIDTH - 1) of std_logic_vector(DATA_WIDTH - 1 downto 0);
    signal ram : ram_array;
begin
    process (clk)
    begin
        if rising_edge(clk) then
            if en_w = '1' then -- Se o sinal de enable de escrita estiver ativo
                ram(to_integer(unsigned(addr))) <= data_w; -- Escreve os dados no endereço correspondente
            end if;

            if en_r = '1' then -- Se o sinal de enable de leitura estiver ativo
                data_r <= ram(to_integer(unsigned(addr))); -- Lê os dados do endereço correspondente
            end if;
        end if;
    end process;
end behavioral;