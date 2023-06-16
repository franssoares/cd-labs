-- Biblioteca
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Entidade
ENTITY decoder_3x8 IS
	PORT(
		in_id : STD_LOGIC_VECTOR(2 DOWNTO 0); -- ID
      en : STD_LOGIC; --ENABLE
		d : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END ENTITY decoder_3x8;

-- Arquitetura
ARCHITECTURE behav OF decoder_3x8 IS

-- Comportamento
BEGIN
process (in_id)
    begin
        case in_id is
            when ("000") =>
            d <= "00000001"; -- SaÃ­da 0
            when ("001") =>
            d <= ("00000010"); -- SaÃ­da 1
            when "010" =>
            d <= ("00000100"); -- SaÃ­da 2
            when "011" =>
            d <= ("00001000"); -- SaÃ­da 3
            when "100" =>
            d <= ("00010000"); -- SaÃ­da 4
            when "101" =>
            d <= ("00100000"); -- SaÃ­da 5
            when "110" =>
            d <= ("01000000"); -- SaÃ­da 6
            when "111" =>
            d <= ("10000000"); -- SaÃ­da 7
            when others =>
            d <= "00000000"; -- SaÃ­da desativada
        end case;
    end process;
END ARCHITECTURE behav;