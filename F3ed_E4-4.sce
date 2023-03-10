clc; clear

//Exemplo 4.4

a = 1
b = 1
c = 1
deltav = b + c - a

Fb = 0.34
X = 0.8
ya0 = 1
P0 = 6
T0 = 1980
R0 = 0.73

k1 = 0.072
T2 = 1100
T1 = 1000
R = 1.987
E = 82000

Fa0 = Fb/X
Ca0 = (ya0*P0)/(R0*T0)

epsilon = ya0*deltav/a

k2 = round(100*(k1*exp((E*(T2-T1))/(R*T1*T2))))/100

V = (Fa0/(Ca0*k2))*((2*log(1/(1-X)))-X)
N = round((V/(0.0205*40))/10)*10

printf('V = %g ft^3\n\n',V)
printf('Número de canos: %g\n\n',N)
