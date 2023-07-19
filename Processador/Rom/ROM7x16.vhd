-- biblioteca
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- entidade
entity ROM7x16 is
    generic (
        DATA_WIDTH : integer := 16 -- Largura dos dados
    );
    port (
        enable : in std_logic; -- Sinal de habilitação da leitura
        addr   : in std_logic_vector(3 downto 0); -- Sinal de endereço
        data_r : out std_logic_vector(DATA_WIDTH - 1 downto 0) -- Sinal de dados de leitura
    );
end ROM7x16;

-- arquitetura
architecture behav of ROM7x16 is
    type rom_array is array (0 to 15) of std_logic_vector(DATA_WIDTH - 1 downto 0);
    constant rom_data : rom_array := (
        "0011000000000010", -- Intrução 0
        "0011000100000011", -- Intrução 1
        "0010001000000001", -- Intrução 2
        "0001001000000000", -- Intrução 3
        "0000001100000000", -- Intrução 4
        "0100010000110011", -- Intrução 5
        "0101010000000000", -- Intrução 6
        "0110000000010000", -- Intrução 7
        "0000000000000000", -- Intrução 8
        "0000000000000000", -- Intrução 9
        "0000000000000000", -- Intrução 10
        "0000000000000000", -- Intrução 11
        "0000000000000000", -- Intrução 12
        "0000000000000000", -- Intrução 13
        "0000000000000000", -- Intrução 14
        "0000000000000000"  -- Intrução 15
    );
begin
    process(enable, addr)
    begin
        if enable = '1' then
            data_r <= rom_data(to_integer(unsigned(addr))); -- Lê os dados do endereço correspondente
        else
            data_r <= (others => '0'); -- Saída de dados é zerada quando não habilitada
        end if;
    end process;
end behav;