clear; clc;

//Exemplo P1.3 - How Large Is It?

//Dados do Problema
//Ca = 0.1Ca0
//v0 = 10 dm^3/min
//k = 0,23 min^-1

//Equação do Reator
//V = (v0/k)*((Ca0 - Ca)/Ca)

v0 = 10
k = 0.23

V = (v0/k)*((1 - 0.1)/0.1)

printf('O volume necessário é %g dm^3', V)
