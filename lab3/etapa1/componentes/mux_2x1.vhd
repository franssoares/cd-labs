--componente mux_2x1
entity mux_2x1 is
    port(
        i0c, i1c, sc : in bit;
        mc         : out bit
    );
end entity mux_2x1;

architecture main of mux_2x1 is 
begin
    with sc select
        mc <= i0c when '0',
        i1c when '1';
end architecture main;