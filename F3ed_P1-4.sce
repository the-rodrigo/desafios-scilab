clear; clc;

//Exemplo P1.4 - Batelada

//Dados do Problema
//na = 0.1na0
//k = 0,23 min^-1

//Equação do Reator
//Ca = na/v
//t = (1/k)*ln(Ca0/Ca). Logo, t = (1/k)*ln(na0/na)

k = 0.23
na = 0.1

t = (1/k)*log(1/na)

printf('O tempo necessário é %g min', t)
