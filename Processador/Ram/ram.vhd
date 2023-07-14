library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RAM is
    generic (
        N : natural := 8; -- Número de bits para endereçamento
        M : natural := 16 -- Número de bits para dados
    );
    port (
        CLK     : in  std_logic;
        ADDR    : in  std_logic_vector(N-1 downto 0);
        RD      : in  std_logic;
        WR      : in  std_logic;
        W_DATA  : in  std_logic_vector(M-1 downto 0);
        R_DATA  : out std_logic_vector(M-1 downto 0)
    );
end entity RAM;

architecture Behavioral of RAM is
    type MemoryArray is array (natural range <>) of std_logic_vector(M-1 downto 0);
    signal memory : MemoryArray(0 to 2**N - 1);
    signal data_reg : std_logic_vector(M-1 downto 0);
begin
    process (CLK)
    begin
        if rising_edge(CLK) then
            if RD = '1' and WR = '0' then
                data_reg <= memory(to_integer(unsigned(ADDR)));
            elsif RD = '0' and WR = '1' then
                memory(to_integer(unsigned(ADDR))) <= W_DATA;
            end if;
        end if;
    end process;

    R_DATA <= data_reg;
end architecture Behavioral;