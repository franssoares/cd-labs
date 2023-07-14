-- biblioteca
library ieee;
use ieee.std_logic_1164.all;

-- entidade
entity comp_zero is
  port (
    output: in std_logic_vector(15 downto 0);
    isZero: out std_logic
  );
end entity comp_zero;

-- arquitetura
architecture behav of comp_zero is

-- comportamento
begin

  process (output)
  begin
    if output = "0000000000000000" then
      isZero <= '1';
    else
      isZero <= '0';
    end if;
  end process;
  
end architecture behav;