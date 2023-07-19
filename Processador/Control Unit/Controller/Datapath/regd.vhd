library ieee;
use ieee.std_logic_1164.all;

entity regd is
    port (
        clock : in std_logic;
        entrada : in std_logic_vector(7 downto 0);
        saida : out std_logic_vector(7 downto 0)
    );
end entity regd;

architecture Behavioral of regd is
    component ffd1bit is
        port (
            clock : in std_logic;
            d : in std_logic;
            q : out std_logic
        );
    end component ffd1bit;

    signal q0, q1, q2, q3, q4, q5, q6, q7 : std_logic;
begin
    FF0: ffd1bit port map (clock, entrada(0), q0);
    FF1: ffd1bit port map (clock, entrada(1), q1);
    FF2: ffd1bit port map (clock, entrada(2), q2);
    FF3: ffd1bit port map (clock, entrada(3), q3);
    FF4: ffd1bit port map (clock, entrada(4), q4);
    FF5: ffd1bit port map (clock, entrada(5), q5);
    FF6: ffd1bit port map (clock, entrada(6), q6);
    FF7: ffd1bit port map (clock, entrada(7), q7);

    saida <= q7 & q6 & q5 & q4 & q3 & q2 & q1 & q0;
end architecture Behavioral;

