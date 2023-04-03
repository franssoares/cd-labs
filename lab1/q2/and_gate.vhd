library ieee; --biblioteca

--entidade
entity and_gate is 
    port(
        a, b : in bit;
        z    : out bit
    );
end entity and_gate;

--arquitetura
architecture main of and_gate is
    begin
        z <= a and b;    
end architecture main;