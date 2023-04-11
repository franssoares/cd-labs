entity de_morgan is
    port (
        a, b: in bit;
        w, x, y, z : out bit
    );
end de_morgan;

architecture main of de_morgan is
begin
         --1ª lei de De Morgan
         w <= not(a and b);
         x <= not(a) or not(b);
         --2ª lei de De Morgan
         y <= not(a or b);
         z <= not(a) and not(b);
end architecture main;
