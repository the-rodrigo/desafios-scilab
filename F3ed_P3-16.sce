clear; clc; close

a = 2
b = 4
c = 2
deltav = c - a - b

P0 = 10 //atm
R = 1.987 //cal/(mol*K)
T0 = 1000 //K
ya0 = 0.5
yb0 = 0.5
v0 = 2.5 //dm^3/min
k = 4 //dm^3/(gmol*min)
E = 15000 //cal/gmol

C0 = P0/(R*T0)
Ca0 = C0*ya0
Cb0 = C0*yb0

epsilon = ya0*deltav/a
Ob = Cb0/Ca0

//Letra A

Xa1 = 0.25

v = round(100*v0*(1+epsilon*Xa1))/100

printf('Letra A\n')
printf('A vazão Volúmetrica é: %g dm^3/min\n\n',v)

//Letra B

velA = k*Ca0*Cb0

printf('Letra B\n')
printf('-ra = %g gmol/dm^3*min\n\n',velA)

//Letra C 

Xa1 = 0.4

Ca = Ca0*(1-Xa1)/(1+epsilon*Xa1)
Cb = Ca0*(Ob-(b/a)*Xa1)/(1+epsilon*Xa1)
velA = k*Ca*Cb

printf('Letra C\n')
printf('-ra = %g gmol/dm^3*min\n\n',velA)

//Letra D

printf('Letra D\n')
printf('Ca0 = %g gmol/dm^3\n\n',Ca0)

//Letra E

printf('Letra E\n')
printf('Ca = %g gmol/dm^3\n\n',Ca)

//Letra F

T1 = 1500 //K

ln_k0 = log(k) + E/(R*T0)
ln_k = ln_k0 - E/(R*T1)
k1 = exp(ln_k)

printf('Letra F\n')
printf('k = %g dm^3/gmol*min\n\n',k1)
