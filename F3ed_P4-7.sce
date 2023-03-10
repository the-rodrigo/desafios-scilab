clc; clear;

//Problema P4.7

a = 1
b = 1
c = 2
deltav = c + b - a
ya0 = 1

P = 10 //atm
R = 8.314 //J/mol*K
Ratm = 0.082 //L*atm/mol*K
E = 85000 //J/mol
T0 = 50+273.15 //K
T = 400.15 //K
Fa0 = 2.5 //mol/min
k_50 = 10^(-4) //min^-1
X = 0.9

Ca0=P/(Ratm*T)
epsilon = ya0*deltav/a

k0 = k_50*exp(E/(R*T0))
k = k0*exp(-E/(R*T))

//Letra A

v0= Fa0/Ca0
v = v0*T/T0
Ca = Ca0*((1-X)/(1+(epsilon*X)))
vel_a = k*Ca

Vcstr = ((Ca0*v0)-(Ca*v))/vel_a

printf('Letra A\n')
printf('Vcstr = %g \n\n', Vcstr)

//Letra B

ktau = (-1)*(1+epsilon)*log(1-X)-(epsilon*X)
Vpfr = v0*ktau/k

printf('Letra B\n')
printf('Vpfr = %g \n\n', Vpfr)


