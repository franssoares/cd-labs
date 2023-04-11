entity postulados is
    port (
        a: in bit;
        x, y, z : out bit
    );
end postulados;

architecture main of postulados is
begin
         x <= a or '0';
         y <= a and '1';
         z <= not(not(a));
end architecture main;