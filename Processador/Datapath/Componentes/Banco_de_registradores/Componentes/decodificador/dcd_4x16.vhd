library ieee;
use ieee.std_logic_1164.all;

entity dcd_4x16 is
  port (
    input: in std_logic_vector(3 downto 0);
	 enable: in std_logic;
    output: out std_logic_vector(15 downto 0)
  );
end entity dcd_4x16;

architecture Behavioral of dcd_4x16 is
begin
  process (input, enable)
  begin
    if enable = '1' then
      case input is
        when "0000" =>
          output <= "0000000000000001";
        when "0001" =>
          output <= "0000000000000010";
        when "0010" =>
          output <= "0000000000000100";
        when "0011" =>
          output <= "0000000000001000";
        when "0100" =>
          output <= "0000000000010000";
        when "0101" =>
          output <= "0000000000100000";
        when "0110" =>
          output <= "0000000001000000";
        when "0111" =>
          output <= "0000000010000000";
        when "1000" =>
          output <= "0000000100000000";
        when "1001" =>
          output <= "0000001000000000";
        when "1010" =>
          output <= "0000010000000000";
        when "1011" =>
          output <= "0000100000000000";
        when "1100" =>
          output <= "0001000000000000";
        when "1101" =>
          output <= "0010000000000000";
        when "1110" =>
          output <= "0100000000000000";
        when "1111" =>
          output <= "1000000000000000";
        when others =>
          output <= (others => '0');
      end case;
    else
      output <= (others => '0');
    end if;
  end process;
end architecture Behavioral;