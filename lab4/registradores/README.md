# Registradores

---
## Especificação: 1-bit Latch D 
- #### Descrição: Latch D em VHDL

``` vhdl
-- Bibliotecas
LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Entidade
ENTITY latchd IS
	PORT(
		D, clk : IN std_logic;
		Q, Q_bar : OUT std_logic
	);
END;

-- Arquitetura
ARCHITECTURE behav OF latchd IS

-- Comportamento sensível a nível
BEGIN
	PROCESS(D, clk)
	BEGIN
		IF(clk = '1' and D = '1') THEN
			Q <= '1';
			Q_bar <= '0';
		ELSIF (clk = '1' and D = '0') THEN
			Q <= '0';
			Q_bar <= '1';
		END IF;
	END PROCESS;
END;
```
- #### RTL Viewer

<img src = ".\latch_d\assets\RTL_Viewer.png" width = "720px" alig/>

- #### Quartus Simulator

<img src = ".\latch_d\assets\waveform_latch_d.png"  alig/>

---
## Especificação: 1-bit Flip-Flop D 
- #### Descrição: Flip-Flop D em VHDL

``` vhdl
-- Bibliotecas
LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Entidade
ENTITY ff_d IS
  PORT(
       D, clk : IN STD_LOGIC;
       Q, Q_bar : OUT STD_LOGIC);
END entITY ff_d;

-- Arquitetura
ARCHITECTURE behav OF ff_d IS
BEGIN
  PROCESS (D, clk)
  BEGIN
    IF (clk'event and clk = '1' AND D = '1') THEN
        Q <= '1';
	    Q_bar <= '0';
    ELSIF (rising_edge(clk) AND D = '0') THEN
        Q <= '0';
		Q_bar <= '1'; 
    END IF; -- " clk'EVENT AND clk = '1' " equivale a "rising_edge(clk)"
  END PROCESS ;
END arcHITECTURE behav;
```
- #### RTL Viewer

<img src = ".\flip-flop_d\assets\RTL_Viewer_ff_d2.png" width = "720px" alig/>

- #### Quartus Simulator

<img src = ".\flip-flop_d\assets\waveform_ff_d.png"  alig/>

---
## Especificação: Registrador 4-bit com Latch D
- #### Descrição: Registrador 4-bit com Latch D, em VHDL
***Componente:**
``` vhdl
-- Bibliotecas
LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Entidade
ENTITY latchd_comp IS
  PORT(
    D, clk : IN STD_LOGIC;
    Q, Q_bar : OUT STD_LOGIC
  );
END;

-- Arquitetura
ARCHITECTURE behav OF latchd_comp IS

-- Comportamento sensível a nível
BEGIN
  PROCESS(D, clk)
  BEGIN
    IF(clk = '1' AND D = '1') THEN
      Q <= '1';
      Q_bar <= '0';
    ELSIF (clk = '1' AND D = '0') THEN
      Q <= '0';
      Q_bar <= '1';
    END IF;
  END PROCESS;
END;
```
``` vhdl
-- Bibliotecas
LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Entidade
ENTITY reg_latch_d IS
  PORT(
    D_reg : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	clk_reg : IN STD_LOGIC;
    Q_reg, Q_bar_reg : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END ENTITY reg_latch_d;

-- Arquitetura
ARCHITECTURE behav OF reg_latch_d IS

	-- Declaração da componente
    COMPONENT latch_d is
        PORT(
            D, clk : IN STD_LOGIC;
				Q, Q_bar : OUT STD_LOGIC
        );
    END COMPONENT latch_d;

-- Comportamento sensível a nível
BEGIN

	inst0 : latch_d
		PORT MAP(
			D => D_reg(0),
			clk => clk_reg,
			Q => Q_reg(0),
			Q_bar => Q_bar_reg(0)
	);
		
	inst1 : latch_d
		PORT MAP(
			D => D_reg(1),
			clk => clk_reg,
			Q => Q_reg(1),
			Q_bar => Q_bar_reg(1)
	);	
	
	inst2 : latch_d
		PORT MAP(
			D => D_reg(2),
			clk => clk_reg,
			Q => Q_reg(2),
			Q_bar => Q_bar_reg(2)
	);	
	
	inst3 : latch_d
		PORT MAP(
			D => D_reg(3),
			clk => clk_reg,
			Q => Q_reg(3),
			Q_bar => Q_bar_reg(3)
	);	
		
END ARCHITECTURE behav;
```
- #### RTL Viewer

<img src = ".\reg_latch_d\assets\RTL_Viewer_latch_d_comp.png" width = "720px" alig/>

- #### Quartus Simulator

<img src = ".\reg_latch_d\assets\waveform_latch_d_comp.png" alig/>

---

## Especificação: Registrador 4-bit com Flip-Flop D
- #### Descrição: Registrador 4-bit com Flip-Flop D, em VHDL

***Componente:**
``` vhdl
-- Bibliotecas
LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Entidade
ENTITY ff_d IS
  PORT(
       D, clk : IN STD_LOGIC;
       Q, Q_bar : OUT STD_LOGIC);
END entITY ff_d;

-- Arquitetura
ARCHITECTURE componente OF ff_d IS
BEGIN
	PROCESS (D, clk)
	BEGIN
		IF (clk'event and clk = '1' AND D = '1') THEN
			Q <= '1';
			Q_bar <= '0';
		ELSIF (rising_edge(clk) AND D = '0') THEN
			Q <= '0';
			Q_bar <= '1'; 
      END IF; -- " clk'EVENT AND clk = '1' " equivale a "rising_edge(clk)"
	END PROCESS ;
END ARCHITECTURE componente;
```

``` vhdl
-- Bibliotecas
LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Entidade
ENTITY reg_ff_d IS
  PORT(
    D_reg : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	 clk_reg : IN STD_LOGIC;
    Q_reg, Q_bar_reg : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END ENTITY reg_ff_d;

-- Arquitetura
ARCHITECTURE behav OF reg_ff_d IS

	-- Declaração da componente
    COMPONENT ff_d is
        PORT(
            D, clk : IN STD_LOGIC;
				Q, Q_bar : OUT STD_LOGIC
        );
    END COMPONENT ff_d;

-- Comportamento sensível a borda de subida
BEGIN

	inst0 : ff_d
		PORT MAP(
			D => D_reg(0),
			clk => clk_reg,
			Q => Q_reg(0),
			Q_bar => Q_bar_reg(0)
	);
		
	inst1 : ff_d
		PORT MAP(
			D => D_reg(1),
			clk => clk_reg,
			Q => Q_reg(1),
			Q_bar => Q_bar_reg(1)
	);	
	
	inst2 : ff_d
		PORT MAP(
			D => D_reg(2),
			clk => clk_reg,
			Q => Q_reg(2),
			Q_bar => Q_bar_reg(2)
	);	
	
	inst3 : ff_d
		PORT MAP(
			D => D_reg(3),
			clk => clk_reg,
			Q => Q_reg(3),
			Q_bar => Q_bar_reg(3)
	);	
		
END ARCHITECTURE behav;
```
- #### RTL Viewer

<img src = ".\reg_flip-flop_d\assets\RTL_Viewer_reg_ff_d.png" width = "720px" alig/>

- #### Quartus Simulator

<img src = ".\reg_flip-flop_d\assets\waveform_reg_ff_d.png"  alig/>

---