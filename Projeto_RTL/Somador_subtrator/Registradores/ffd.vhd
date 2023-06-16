-- Bibliotecas
LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Entidade
entity ffd is
    port (
        clk : in  std_logic;
        d : in  std_logic_vector(21 downto 0);
        en : in  std_logic;
        q  : out std_logic_vector(21 downto 0)
    );
  end entity ffd;

-- Arquitetura
architecture bhv of ffd is

begin
    process(clk)
    begin
      if rising_edge(clk) then
        if en = '1' then
          q <= d;
        end if;
      end if;
    end process;
end architecture bhv;
