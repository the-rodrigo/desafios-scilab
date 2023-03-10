clear; clc; close; close

//P2.9

P0 = 10 //atm
T0 = 500.15 //K
R = 0.082 //(atm*L)/(mol*K)
ya = 0.333
yb = 0.667
v0 = 33.33 //dm^3/s

C0 = P0/(R*T0)
Ca0 = C0*ya
Cb0 = C0*yb

Xa_vet = [0,0.2,0.4,0.6]
vel_vet = [0.00001,0.000005,0.000002,0.000001]

for i=1:length(vel_vet)
    invel_vet(i) = 1/vel_vet(i)
end

//Letra A

n=1
val = Xa_vet(1)

while val >= Xa_vet(1) & val <= Xa_vet(4)
    vet(n) = val
    val = val + 0.01
    n = n + 1
end

inte = interpln([Xa_vet;vel_vet],vet)

for i=1:(n-1)
    if round(100*vet(i))/100 == 0.3 then
        pos = i
    end
end

vel = inte(pos)
Xa = vet(pos)

cont = 1
while cont < pos
    invel_integral(cont) = 1/inte(cont)
    Xa_integral(cont) = vet(cont)
    cont = cont + 1
end

integral = inttrap(Xa_integral,invel_integral)

Vpfr = Ca0*v0*integral

printf('Letra A\n')
printf('Vpfr = %g L\n\n',Vpfr)

//Letra B

for i=1:(n-1)
    if round(100*vet(i))/100 == 0.5 then
        pos = i
    end
end

vel = inte(pos)
Xa = vet(pos)

Vcstr = ((Xa - 0.3)/vel)*Ca0*v0

printf('Letra B\n')
printf("Vcstr = %g L\n\n",Vcstr)

//Letra C

Vt = Vcstr + Vpfr

printf("Letra C\n")
printf("Vtotal = %g L\n\n",Vt)

//Letra D

//Xa = 0.6

integral1 = inttrap(Xa_vet,invel_vet)

Vpfr1 = Ca0*v0*integral1

printf('Letra D\n')
printf('Para alcançarmos Xa = 0.6 precisamos de Vpfr = %g L\n\n',Vpfr1)

//Xa = 0.8
//Duvida IMPORTANTE - NÃO POSSO EXTRAPOLAR TABELAS

//Letra E 

Vcstr = Xa*Ca0*v0/vel

printf('Letra E\n')
printf('Para alcançarmos Xa = 0.5 precisamos de Vcstr = %g L\n\n',Vcstr)

//Letra F

Vcstr2 = (Xa_vet(4) - 0.5)*Ca0*v0/vel_vet(4)

printf('Letra F\n')
printf('Vcstr = %g L para alcançarmos na saida do segundo CSTR Xa = 0.6\n\n',Vcstr2)

//Letra G

for i=1:length(inte)
    V(i) = vet(i)*Ca0*v0/inte(i)
end

figure(1)
plot(vet,V,'k-')
xtitle('Conversão x Volume')
xlabel('Conversão')
ylabel('Volume  (L)')

figure(2)
plot(inte',V,'r-')
xtitle('Velocidade da Reação x Volume')
xlabel('Velocidade da Reação  (mol/(dm^3*s))')
ylabel('Volume  (L)')

