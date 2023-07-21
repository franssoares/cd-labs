library ieee;
use ieee.std_logic_1164.all;

entity reg_states is
    port (
        clock : in std_logic;
        entrada : in std_logic_vector(3 downto 0);
        saida : out std_logic_vector(3 downto 0)
    );
end entity reg_states;

architecture Behavioral of reg_states is
    component FFDd is
        port (
            clock : in std_logic;
            d : in std_logic;
            q : out std_logic
        );
    end component FFDd;

    signal q0, q1, q2, q3 : std_logic;
begin
    FF0: FFDd port map (clock, entrada(0), q0);
    FF1: FFDd port map (clock, entrada(1), q1);
    FF2: FFDd port map (clock, entrada(2), q2);
    FF3: FFDd port map (clock, entrada(3), q3);

    saida <= q3 & q2 & q1 & q0;
end architecture Behavioral;