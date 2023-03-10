clc; clear;

//Problema P4.5

R = 1.987*10^-3 //kcal/mol*K
T1 = 300 //K
E = 20 //kcal/mol
k_300 = 0.07 //dm^3/mol*min
Ca0 = 1
Cb0 = Ca0
X = 0.9

//Letra B

k0 = k_300*exp(E/(R*T1))

k_350 = k0*exp(-E/(R*350))

tau_350 = round(10*(X/(k_350*Ca0*((1-X)^2))))/10

printf('Letra B\n\n')
printf('O tempo é: %gmin\n\n',tau_350)

//Letra C

k_0 = k0*exp(-E/(R*273))

tau_0 = round(10*(X/(k_0*Ca0*((1-X)^2))))/10

tau_0 = tau_0/60
tau_0 = tau_0/24

printf('Letra C\n\n')
printf('O tempo é: %g dias',tau_0)
