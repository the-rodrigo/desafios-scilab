clear; clc;

//Ex 2.1 - Using the Ideal Gas Law to Calculate Ca0

//Dados do Problema
//P0 = 10 atm
//v0 = 6dm^3/s (1L = 1dm^3)
//ya0 = 0.5 
//T0 = 422.2K
//R = 0.82(dm^3*atm)/(mol*K)

//Equações
//Pa0 = Ca0*R*T0
//Pa0 = ya0*P0
//Fa0 = Ca0*v0

P0 = 10
ya0 = 0.5
T0 = 422.2
R = 0.82
v0 = 6

Ca0 = (ya0*P0)/(R*T0)

Fa0 = Ca0*v0

printf("Ca0 = %g mol/L \n", Ca0)
printf("Fa0 = %g mol/s", Fa0)
