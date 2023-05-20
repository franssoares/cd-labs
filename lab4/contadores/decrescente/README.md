# Especificação: Contador Decrescente

---

- #### Descrição: Contador crescente de 4-bit em VHDL

``` vhdl
-- Biblioteca
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Entidade
ENTITY contador_d IS
	PORT(
		clk: IN BIT;
		ld: IN BIT;
		reset: IN BIT;
		data: IN INTEGER RANGE 15 DOWNTO 0;
		tc: OUT BIT;
		q: OUT INTEGER RANGE 15 DOWNTO 0
	);
END ENTITY contador_d;

-- Arquitetura
ARCHITECTURE main OF contador_d IS

-- Comportamento
BEGIN 
	PROCESS(clk, reset)
	VARIABLE qv: INTEGER RANGE 15 DOWNTO 0;
	BEGIN
		IF(reset='1') THEN
			qv := 15;
			ELSIF(clk' event and clk ='1') THEN
				IF(ld='1') THEN
					qv:=data;
				ELSE
				IF(qv = 0) THEN
					qv := 15;
					tc <= '1';
				ELSE
					tc <= '0';
					qv := qv - 1;
				END IF;
			END IF;
		END IF;
		q <= qv;
	END PROCESS;
END ARCHITECTURE main;
```
- #### RTL Viewer

<img src = ".\assets\rtl_contador_decrescente.png" alig/>

- #### Quartus Simulator VWF

<img src = ".\assets\waveform_contador_decrescente.png"  alig/>

---