clear; clc;

a = 1
b = 2
deltav = b - a

T = 340
R = 0.082
P = 2
ya0 = 1

Ca0 = (ya0/R)*(P/T)
kc = 0.1

//Letra A

eps=1
n =1
Xe(n) = 0.5

while eps>0.01
    Xe(n+1) = sqrt((kc*(1 - Xe(n)))/(4*Ca0))
    eps = abs(Xe(n+1)-Xe(n))
    Xe(n) = Xe(n+1)
    n = n + 1
end

Xe(n) = round(100*Xe(n))/100

printf('Letra A\n')
printf('Xe = %g\n\n',Xe(n))

//Letra B

epsilon = ya0*deltav/a

eps=1
n =1
Xe(n) = 0.5

while eps>0.01
    Xe(n+1) = sqrt((kc*(1 - Xe(n))*(1 + epsilon*Xe(n)))/(4*Ca0))
    eps = abs(Xe(n+1)-Xe(n))
    Xe(n) = Xe(n+1)
    n = n + 1
end

Xe(n) = round(100*Xe(n))/100

printf('Letra B\n')
printf('Xe = %g\n\n',Xe(n))

//Letra C 

printf('Letra C\n')
printf('As equações tanto do batelada quanto do continuo permanecem as mesmas.')
