-- Biblioteca
library ieee;
use ieee.std_logic_1164.all;

-- Entidade
entity comp16bit is
  port (
    A: in std_logic_vector(15 downto 0);
    B: in std_logic_vector(15 downto 0);
    comp_gt: out std_logic
  );
end entity comp16bit;

-- Arquitetura
architecture behav of comp16bit is

-- Comportamento
begin

  process (A, B)
  begin
    if A > B then
      comp_gt <= '1';
    else
      comp_gt <= '0';
    end if;
  end process;
  
end architecture behav;