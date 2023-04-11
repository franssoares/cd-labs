entity op_booleanas is
    port (
        a, b, c: in bit;
        o, p, q, r, s, t, u, v, w, x, y, z : out bit
    );
end op_booleanas;

architecture main of op_booleanas is
begin
         --Comutativa
            --Adi��o
         o <= a or b;
         p <= b or a;
            --Multiplica��o
         q <= a and b;
         r <= b and a;
         --Associativa
            --Adi��o
         s <= a or (b or c);
         t <= (a or b) or c;
            --Multiplica��o
         u <= a and (b and c);
         v <= (a and b) and c;
         --Distributiva
            --Adi��o
         w <= a and (b or c);
         x <= (a and b) or (a and c);
            --Multiplica��o      
         y <= a or (b and c);
         z <= (a or b) and (a or c);
end architecture main;

