# Laboratório 4 - Registradires, contadores e banco de registradores

### Objetivos

1. Experimentar a descrição em VHDL de registradores, contadores e bancos de
registradores.
2. Reforçar os conceitos de latches, flip-flops, registradores e contadores assíncronos e síncronos.
3. Pôr em prática conceitos aprendidos na disciplina Circuitos Digitais - Teoria.

### Atividades

1) Registradores:
> a) Utilizando a linguagem VHDL, crie um latch D para 1 Bit.

> b) Utilizando a linguagem VHDL, desenvolva um flip-flop D para 1 bit.

> c) Utilizando a linguagem VHDL, desenvolva um registrador de quatro bits,
baseado em latches D. Utilize componentes que contenham latches de 1 bit.

> d) Utilizando a linguagem VHDL, desenvolva um registrador de quatro bits,
baseado em flip-flops D. Utilize componentes que contenham flip-flops de 1
bit.

2) Contadores:
>a) Implemente um contador crescente de 4 bits que conte até sua última
contagem e retorne ao seu valor inicial. Adicione o sinal indicativo de término
de contagem: tc=1 quando o contador atingir 1111 e tc=0 caso contrário.
b) Implemente um contador decrescente de 4 bits. Adicione o sinal indicativo de
término de contagem: tc=1 quando o contador atingir 0000 e tc=0 caso
contrário.

3) Bancos de registradores:
>a) Implemente um banco de registradores 4x8, baseado na Figura 13. Siga as
seguintes instruções:
i) Desconsidere o fênomeno de fanout (ou seja, não é necessário
implementar o driver simples, de uma entrada e uma saída).
ii) Utilize flip-flops para formar os registradores.
iii) Implemente os drivers de três estados usando descrição
comportamental.


## Metodologia

<img src = "/lab1/q1/assets/fluxograma.png" width = "780px" height = "700px" alig/>

[visualizar](https://github.com/franssoares/cd-labs/blob/dev/lab1/q1/assets/fluxograma.png)
