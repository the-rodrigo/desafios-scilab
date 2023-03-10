clear; clc;

//P3.18

//A + B -> 8C

a = 1
b = 1
c = 8
deltav = c - a - b

k1 = 1 //((ft^3/lbmol)^2)/s
V0 = 0.15 //ft^3
T = 140 + 459.67 //ºR
R = 0.73 //ft^3*atm/lbmol*ºR
P0 = V0/0.1 //atm

ya0 = 0.5
yb0 = 0.5

C0 = P0/(R*T)
Ca0 = ya0*C0
Cb0 = yb0*C0
Ob = Cb0/Ca0

epsilon = ya0*deltav/a

//Letra A

a0 = round(10^11*k1*Ca0^3)/10^11

//-ra = ((k1*Ca0^3)*((1 - X)^2)*(Ob - (b/a)*X))/((1 + epsilon*X)^3)

if Ob == 1 & (b/a) == 1 then
    printf('Letra A\n')
    printf('-ra = %g*[(1 - X)^3/(1 + %gX)^3]\n\n',a0,epsilon)
else
    printf('Letra A\n')
    printf('-ra = %g*[((1 - X)^2)*(%g - %g*X)/(1 + %gX)^3]\n\n',a0,Ob,(b/a),epsilon)
end

//Letra B

V = 0.2 //ft^3
P = V/0.1

Xa = round(1000*(1/epsilon)*(((V*P)/(V0*P0))-1))/1000

velA = round(10^12*((k1*(P*Ca0/P0)^3)*((1-Xa)^2)*(Ob-(b/a)*Xa))/((1+epsilon*Xa)^3))/10^12

printf('Letra B\n')
printf('Xa = %g\n',Xa)
printf('-ra = %g lbmol/ft^3*s\n\n',velA)
