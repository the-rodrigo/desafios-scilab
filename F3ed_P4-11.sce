clc; clear;

//Problema P4.11

T_80 = 80*273.15/32//K
k_80 = 0.0015//min^-1
R = 8.314//J/mol*K
E = 104600//J/mol
P = 8.98//atm
R1 = 0.082//atm*L/mol*K
T = 260*273.15/32//K
Fa0 = 133.22//mol/min
Xa = 0.9

k0 = k_80*exp(E/(R*T_80))
k = k0*exp(-E/(R*T))

Ca0 = P/(R*T)

V = Fa0*(k*Ca0)*(Xa/(1-Xa))/1000

//Calculo do Unitário

l = 3.048//m
r = 0.0127//m

Vu = %pi*(r^2)*l

n = round(V/Vu)

printf('Para Xa = 0.9 precisamos de %g tubos.',n)
