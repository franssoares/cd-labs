library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cont_program is
    port (
        clock       : in std_logic;
        reset       : in std_logic;
        pc_ld      : in std_logic;
        pc_inc      : in std_logic;
        input_data  : in std_logic_vector(7 downto 0);
        pc_addr      : out std_logic_vector(3 downto 0)
    );
end entity cont_program;

architecture Behavioral of cont_program is
    signal counter : unsigned(3 downto 0) := "0000";
begin
    process(clock, reset, pc_ld, pc_inc)
    begin
        if reset = '1' then
            counter <= "0000";
        elsif rising_edge(clock) then
		  
            if (pc_ld = '1') then
                 counter <= counter + 1; -- Incrementa
					  
            elsif (pc_ld = '1') then
					if pc_inc = '1' then
						counter <= counter + 2; -- Pula prÃƒÂ³xima instruÃƒÂ§ÃƒÂ£o
						
				
					end if;
            end if;
        end if;
    end process;

    pc_addr <= std_logic_vector(counter);
end architecture Behavioral;