library ieee;
use ieee.std_logic_1164.all;

entity ffd is
    port (
        clock : in std_logic;
        d : in std_logic;
        q : out std_logic
    );
end entity ffd;

architecture Behavioral of ffd is
    signal q_reg : std_logic;
begin
    process(clock)
    begin
        if rising_edge(clock) then
            q_reg <= d;
        end if;
    end process;

    q <= q_reg;
end architecture Behavioral;