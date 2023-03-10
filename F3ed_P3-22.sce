clear; clc; 

//P3.22
//A + 2B -> 2C + D

a = 1
b = 2
c = 2
d = 1
deltav = d + c - b - a

T = 200 //ºC
P = 2500 //kPa
P0 = 506.5 //kPa
k = 0.01 //dm^6/mol^2*min
v0 = 0.5 //dm^3/s
Ob = b/a

ydc = P0/P

//Cálculo de Xcond

Xc = round(1000*(ydc*a*(1 + Ob))/(d - deltav*ydc))/1000

printf('Xcond = %g\n',Xc)

