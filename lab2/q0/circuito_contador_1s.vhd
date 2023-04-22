--bibliotecas
library ieee; 
use ieee.std_logic_1164.all;

--entidade
entity circuito_contador_1s is
    port(
        A,B,C : in bit;
        S1,S2 : out bit
    );
end entity circuito_contador_1s;

--arquitetura
architecture RTL of circuito_contador_1s is

    --Declaração das componentes(quase como classes em c++)
    component and_gate2 is
        port (
            ag2i1, ag2i2 : in bit;
            ag2o0  : out bit
        ); 
    end component;

    component and_gate3 is
        port(
            ag3i1, ag3i2, ag3i3: in bit;
            ag3o0 : out bit
        );
    end component;

    component or_gate3 is
        port(
            og3i1, og3i2, og3i3 : in bit;
            og3o0 : out bit
        );
    end component;

    component or_gate4 is
        port(
            og4i1, og4i2, og4i3, og4i4 : in bit;
            og4o0 : out bit
        );
    end component;

    --Declaração de sinais (Ligações fora entidades)
    signal in_inst12 : bit_vector(3 downto 0); --vetor que armazena as 4 entradas da porta lógica or_gate4        
    signal in_inst11 : bit_vector(2 downto 0); --vetor que armazena as 3 entradas da porta lógica or_gate3

--inicio da funcionalidade da entidade circuito_contador_1s(o início do código que descreve o comportamento do circuito digital)
begin

    --instâncias and_gate2(macrofunção) ideia: conectar as pontas das instâncias por fios(signals ou entidades)
    inst1 : and_gate2 
        port map(
            ag2i1 => A,
            ag2i2 => C,
            ag2o0 => in_inst11(2)
        );
    
    inst2 : and_gate2 
        port map(
            ag2i1 => C,
            ag2i2 => B,
            ag2o0 => in_inst11(0)
    );

    inst3 : and_gate2 
        port map(
            ag2i1 => A,
            ag2i2 => B,
            ag2o0 => in_inst11(1)
    );

    --instâncias and_gate3
    inst4 : and_gate3 
        port map(
            ag3i1 => not(A),
            ag3i2 => not(B),
            ag3i3 => C,
            ag3o0 => in_inst12(0)
    );

    inst5 : and_gate3 
        port map(
            ag3i1 => not(A),
            ag3i2 => B,
            ag3i3 => not(C),
            ag3o0 => in_inst12(3)
    );

    inst6 : and_gate3 
        port map(
            ag3i1 => A,
            ag3i2 => not(B),
            ag3i3 => not(C),
            ag3o0 => in_inst12(1)
    );

    inst7 : and_gate3 
        port map(
            ag3i1 => A,
            ag3i2 => B,
            ag3i3 => C,
            ag3o0 => in_inst12(2)
    );
	 
    --ultimas conexões
    inst11 : or_gate3
        port map(
            og3i1 => in_inst11(0),
            og3i2 => in_inst11(1),
            og3i3 => in_inst11(2),
            og3o0 => S1
	 );
	  inst12 : or_gate4
        port map(
            og4i1 => in_inst12(0),
            og4i2 => in_inst12(1),
            og4i3 => in_inst12(2),
			og4i4 => in_inst12(3),
            og4o0 => S2
    );
end architecture RTL;