clear; clc;

//P3.17

//Letra A
//A + B -> C

a = 1
b = 1
c = 1
deltav = c - a - b

kc = 10 //dm^3/mol
Ca0 = 2 //mol/dm^3
Cb0 = 2 //mol/dm^3
Cc0 = 0 //mol/dm^3
Ct0 = Ca0 + Cb0 + Cc0

a0 = Ca0*Cb0*kc - Cc0*Ct0
a1 = -kc*(a*Cb0+b*Ca0) - Cc0*deltav - c*Ct0
a2 = a*b*kc - c*deltav

p = poly([a0,a1,a2],'x','c')
x = roots(p)

for i=1:length(x)
    raiz = x(i)
    Ca(i) = Ca0 - a*raiz
    if Ca(i) == abs(Ca(i)) then
        Ca_real = Ca(i)
    end
end

Xe = round(100*(Ca0 - Ca_real)/Ca0)/100

printf('Letra A\n')
printf('Xe = %g\n\n',Xe)

//Letra B
//A <-> 3C

a = 1
c = 3
deltav = c - a

P0 = 10 //atm
T0 = 400 //K
R = 0.082 //(atm*dm^3)/(mol*K)
kc = 0.25 //dm^3/mol^2
ya0 = 1

C0 = P0/(R*T0)
Ca0 = ya0*C0

epsilon = ya0*deltav/a

erro = 1
n = 1
Xe(1) = 0.5

while erro > 0.01
    Xe(n+1) = (kc/(Ca0^2*(c/a)^3)*(1-Xe(n))*(1+epsilon*Xe(n))^2)^(1/3)
    erro = abs(Xe(n+1)-Xe(n))
    Xe(n) = Xe(n+1)
    n = n + 1
end

Xe_real = round(100*Xe(n))/100

printf('Letra B\n')
printf('Xe = %g\n\n',Xe_real)

//Letra C

erro = 1
n = 1
Xe(1) = 0.5

while erro > 0.01
    Xe(n+1) = (kc/(Ca0^2*(c/a)^3)*(1-Xe(n)))^(1/3)
    erro = abs(Xe(n+1)-Xe(n))
    Xe(n) = Xe(n+1)
    n = n + 1
end

Xe_real = round(100*Xe(n))/100

printf('Letra C\n')
printf('Xe = %g\n\n',Xe_real)

//Letra D

erro = 1
n = 1
Xe(1) = 0.5

while erro > 0.01
    Xe(n+1) = (kc/(Ca0^2*(c/a)^3)*(1-Xe(n))*(1+epsilon*Xe(n))^2)^(1/3)
    erro = abs(Xe(n+1)-Xe(n))
    Xe(n) = Xe(n+1)
    n = n + 1
end

Xe_real = round(100*Xe(n))/100

printf('Letra D\n')
printf('Xe = %g\n\n',Xe_real)
