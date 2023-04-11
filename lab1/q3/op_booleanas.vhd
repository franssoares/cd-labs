entity op_booleanas is
    port (
        a, b, c: in bit;
        o, p, q, r, s, t, u, v, w, x, y, z : out bit
    );
end op_booleanas;

architecture main of op_booleanas is
begin
         --Comutativa
            --Adição
         o <= a or b;
         p <= b or a;
            --Multiplicação
         q <= a and b;
         r <= b and a;
         --Associativa
            --Adição
         s <= a or (b or c);
         t <= (a or b) or c;
            --Multiplicação
         u <= a and (b and c);
         v <= (a and b) and c;
         --Distributiva
            --Adição
         w <= a and (b or c);
         x <= (a and b) or (a and c);
            --Multiplicação      
         y <= a or (b and c);
         z <= (a or b) and (a or c);
end architecture main;

