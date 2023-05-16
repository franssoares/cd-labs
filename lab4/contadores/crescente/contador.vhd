ENTITY contador IS
PORT(
	clk: IN BIT;
	ld: IN BIT;
	reset: IN BIT;
	data: IN INTEGER RANGE 15 DOWNTO 0;
	tc: OUT BIT;
	q: OUT INTEGER RANGE 15 DOWNTO 0);
END contador;

ARCHITECTURE main OF contador IS
	BEGIN PROCESS(clk, reset)
		VARIABLE qv: INTEGER RANGE 15 DOWNTO 0;
		BEGIN
			IF(reset='1') THEN
				qv := 0;
				ELSIF(clk' event and clk ='1') THEN
					IF(ld='1') THEN
						qv:=data;
					ELSE
					IF(qv >= 15) THEN
						qv := 0;
						tc <= '1';
					ELSE
						tc <= '0';
						qv := qv + 1;
					END IF;
				END IF;
			END IF;
			q <= qv;
			END PROCESS;
		END;