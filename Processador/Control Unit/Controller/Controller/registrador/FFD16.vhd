library ieee;
use ieee.std_logic_1164.all;

-- entidade
entity FFDd is
  port (
    clk: in std_logic;
    load: in std_logic;
    d: in std_logic_vector(15 downto 0);
    q: out std_logic_vector(15 downto 0)
  );
end entity FFDd;

-- arquitetura
architecture Behavioral of FFDd is
	-- fios
  signal reg16: std_logic_vector(15 downto 0);
  
-- comportamento
begin

  process (clk)
  begin
    if rising_edge(clk) then
      if load = '1' then
        reg16 <= d;
      end if;
    end if;
  end process;

  q <= reg16;
  
end architecture Behavioral;