# Laboratório 2 - Circuitos Combinacionais

### Resumo

Vamos projetar um circuito que conta o número de bits iguais a 1 presente em três entradas (A, B, C) e, como saída, fornece esse número em binário, por meio de duas saídas S1 e S2.

> **Exemplo**:
> -  Se a entrada for ABC = 111, então a saída deve produzir o número 3 em binário, ou seja: 
$\\ S1S2 = 11$
> - Se a entrada for 100, então a saída deve produzir o número 1 em binário, ou seja:
$\\ S1S2 = 01$
> -  Se a entrada for 000, então a saída deve produzir o número 0 em binário, ou seja: 
$\\ S1S2 = 00$

O número de 1’s nas entradas pode variar de 0 a 3. Assim, uma saída com dois bitsé o suficiente. Um circuito contador de 1’s pode ser útil em diversas situações, como, por exemplo estacionamentos em que sensores, localizados na parte superior das vagas e conectados a sinais luminosos, informam aos motoristas o número de vagas disponíveis em um andar específico.

### Objetivos

- Montar a tabela verdade do circuito, explicitando quais são as entradas e quais são as saídas e todas as possibilidades que o circuito lógico pode vale.
- Simplificar as equações usando postulados e identidades Booleana:
> ${\newline}$
    > **$𝑆1 = 𝐴'⋅𝐵⋅𝐶 + 𝐴⋅𝐵'⋅𝐶 + 𝐴⋅𝐵⋅𝐶' + 𝐴⋅𝐵⋅𝐶 \\$**
    > **$𝑆2 = 𝐴'⋅𝐵'⋅𝐶+𝐴'⋅𝐵⋅𝐶' + 𝐴⋅𝐵'·𝐶'+ 𝐴⋅𝐵⋅𝐶$**
 ${\newline}$
- Representar os circuitos na forma de portas lógicas (caso simplifique a equação,
represente o circuito simplificado).
- Descrever o circuito em VHDL e simule-o utilizando o Quartus/Modelsim. Para utilizar as portas lógicas, crie um projeto separado para cada porta e utilize o comando “COMPONENT” e “PORT MAP”.
- Elaborar e entregue um relatório contendo a execução correta dos itens 1 a 4.

## Mapeamento da metodologia

<img src = "/lab1/q1/assets/fluxograma.png" width = "780px" height = "700px" alig/>

[visualizar](./lab1/q1/assets/fluxograma.png)