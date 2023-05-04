# Etapa 1 - Multiplexadores

### Multiplexador 2x1 
- #### Descrição comportamental
``` vhdl
--bibliotecas
library ieee; 
use ieee.std_logic_1164.all;

--entidade
entity mux_2x1_comp is
    port(
        i0,i1,s : in bit;
        m       : out bit
    );
end entity mux_2x1_comp;

--arquitetura
architecture RTL of mux_2x1_comp is
begin
    with s select
        m <= i0 when '0',
             i1 when '1';
end architecture RTL;

```
- #### RTL Viwer

<img src = ".\assets\mux2x1_comportamento\mux_2x1_com.png" width = "1200px" height = "250px" alig/>

- #### Quartus Simulator

<img src = ".\assets\mux2x1_comportamento\mux_2x1_com_simula.png" width = "1200px" height = "250px" alig/>

- #### Descrição por portas lógicas

``` vhdl

--bibliotecas
library ieee; 
use ieee.std_logic_1164.all;

--entidade
entity mux_2x1_port is
    port(
        i0,i1,s : in bit;
        m       : out bit
    );
end entity mux_2x1_port;

--arquitetura
architecture RTL of mux_2x1_port is
    begin
        m <= i0 and not(s) or i1 and s;
end architecture RTL;

```
- #### RTL Viwer

<img src = ".\assets\mux2x1_portas_logicas\mux_2x1_port.png" width = "1200px" height = "250px" alig/>

- #### Quartus Simulator

<img src = ".\assets\mux2x1_portas_logicas\mux_2x1_port_simula.png" width = "1200px" height = "250px" alig/>

---

### Multiplexador 4x1 

- #### Descrição comportamental

``` vhdl 

--bibliotecas
library ieee; 
use ieee.std_logic_1164.all;

--entidade
entity mux_4x1_comp is
    port(
        i0,i1 : in bit_vector(3 downto 0);
        s     : in bit;
        m     : out bit_vector(3 downto 0)
    );
end entity mux_4x1_comp;

--arquitetura
architecture RTL of mux_4x1_comp is
    begin
        m(0) <= (i0(0) and not(s)) or (i1(0) and s);
        m(1) <= (i0(1) and not(s)) or (i1(1) and s);
        m(2) <= (i0(2) and not(s)) or (i1(2) and s);
        m(3) <= (i0(3) and not(s)) or (i1(3) and s);
end architecture RTL;

```
- #### RTL Viwer

<img src = ".\assets\mux4x1_comportamento\mux_4x1_comp.png" width = "1200px" height = "250px" alig/>

- #### Quartus Simulator

<img src = ".\assets\mux4x1_comportamento\mux_4x1_comp_simula.png" width = "1200px" height = "250px" alig/>

---

### Multiplexador 4x1 para 2x1

- #### Descrição comportamental

***Componente:**
``` vhdl 
--bibliotecas
library ieee; 
use ieee.std_logic_1164.all;

--entidade
entity mux_2x1_comp is
    port(
        i0,i1,s : in bit;
        m       : out bit
    );
end entity mux_2x1_comp;

--arquitetura
architecture RTL of mux_2x1_comp is
begin
    with s select
        m <= i0 when '0',
             i1 when '1';
end architecture RTL;

```

Início:
``` vhdl 

--bibliotecas
library ieee; 
use ieee.std_logic_1164.all;

--entidade
entity mux_4x1_comp is
    port(
        i0, i1 : in bit_vector(1 downto 0);
        s0, s1     : in bit;
        m     : out bit
    );
end entity mux_4x1_comp;

--arquitetura
architecture RTL of mux_4x1_comp is
    
    --declaração da componente
    component mux_2x1 is
        port(
            i0c, i1c, sc : in bit;
            mc         : out bit
        );
    end component mux_2x1;

    --declaração dos sinais
    signal data : bit_vector(1 downto 0);

--comportamento do circuito
begin

    --intância 1
    inst1 : mux_2x1
        port map(
            sc => s0,
            i0c => i0(0),
            i1c => i1(0),
            mc => data(0)
    );

    --intância 2
    inst2 : mux_2x1
        port map(
            sc => s0,
            i0c => i0(1),
            i1c => i1(1),
            mc => data(1)
    );

    --intância 3
    inst3 : mux_2x1
        port map(
            sc => s1,
            i0c => data(0),
            i1c => data(1),
            mc => m
    );

end architecture RTL;

```
- #### RTL Viwer

<img src = ".\assets\mux4x1_para_2x1\mux_4x1_2x1_componente.png" width = "1200px" height = "250px" alig/>

- #### Quartus Simulator

<img src = ".\assets\mux4x1_para_2x1\mux_4x1_2x1_componente_simula.png" width = "1200px" height = "250px" alig/>
---