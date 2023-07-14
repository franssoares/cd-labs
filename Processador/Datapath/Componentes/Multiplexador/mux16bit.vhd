-- biblioteca
library ieee;
use ieee.std_logic_1164.all;

-- entidade
entity mux16bit is
	 port (
		 sel0: in std_logic;
		 sel1: in std_logic;
		 data_i0: in std_logic_vector(15 downto 0);
		 data_i1: in std_logic_vector(15 downto 0);
		 data_i2: in std_logic_vector(7 downto 0);
		 data_o: out std_logic_vector(15 downto 0)
	  );
end entity mux16bit;

-- arquitetura
architecture behav of mux16bit is

-- comportamento
begin
  process (sel0, sel1, data_i0, data_i1, data_i2)
  begin
    if sel1 = '0' then
      if sel0 = '0' then
        data_o <= data_i0;
      else
        data_o <= data_i1;
      end if;
    else
      data_o(7 downto 0) <= data_i2;
    end if;
  end process;
  
end architecture behav;
