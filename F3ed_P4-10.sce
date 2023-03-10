clc; clear;

//Problema P4.10

b = 2
d = 1
h = 1

P0 = 5//atm
T0 = 1033//K
R = 0.082//atm*L/mol*K
K = 0.3

//Letra A

Xe = round(100*(8*K - sqrtm((64*K^2)-(4*4*K*(4*K-1))))/(10*(4*K-1)^2))/100

printf('Letra A\n')
printf('Xe = %g\n\n',Xe)

//Letra C

X = 0.51
Fa0 = 10/60
Ca0 = 0.0037
ka = 1800

ra = ka*(Ca0^2)*(((1-X)^2)-((X^2)/(4*K)))
V = Fa0*X/ra

printf('Letra C\n')
printf('ra = %g\n',ra)
printf('V = %g ft^3',V)
