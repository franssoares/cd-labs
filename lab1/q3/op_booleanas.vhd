entity op_booleanas is
    port (
        a, b, c: in bit;
        o, p, q, r, s, t, u, v, w, x, y, z : out bit
    );
end op_booleanas;

architecture main of op_booleanas is
begin
         --Comutativa
            --Adicao
         o <= a or b;
         p <= b or a;
            --Multiplicacao
         q <= a and b;
         r <= b and a;s
         --Associativa
            --Adicao
         s <= a or (b or c);
         t <= (a or b) or c;
            --Multiplicacao
         u <= a and (b and c);
         v <= (a and b) and c;
         --Distributiva
            --Adicao
         w <= a and (b or c);
         x <= (a and b) or (a and c);
            --Multiplicacao      
         y <= a or (b and c);
         z <= (a or b) and (a or c);
         
end architecture main;