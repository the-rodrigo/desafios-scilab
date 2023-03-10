clear; clc; close; close

//P2.6

Fa0 = 300 //mol/min

Xa_vet = [0,0.2,0.4,0.5,0.6,0.8,0.9]
vel_vet = [10,16.67,50,50,50,12.5,9.09] //mol/(d3*min)

n = 1
val = Xa_vet(1)

while val >= Xa_vet(1) & val <= Xa_vet(length(Xa_vet))
    vet(n) = val
    val = val + 0.001
    n = n + 1
end

inte = interpln([Xa_vet;vel_vet],vet)

//Letra A 

//PFR

Xa = 0.4
i = 1

while vet(i) <= Xa
    pos = i
    i = i + 1
end

for i=1:pos
    Xa_integral(i) = vet(i)
    invel_integral(i) = 1/inte(i)
end


integral = inttrap(Xa_integral,invel_integral)

Vpfr = round(100*Fa0*integral)/100

printf('Letra A\n')
printf('Vpfr = %g L\n',Vpfr)

//CSTR

Vcstr = Xa*Fa0/vel_vet(3)

printf('Vcstr = %g L\n\n',Vcstr)

//Letra B

m = 1
controle = -1
intervalo(1) = controle

for j=1:length(Xa_vet)
    Xa1 = Xa_vet(j)
    
    for i=1:length(Xa_vet)
        if Xa1 == Xa_vet(i) then
            invel_i = 1/vel_vet(i)
        end
    end
    
    for i=1:length(Xa)
        if Xa_vet(i) <= Xa1 then
            X_int(i) = Xa_vet(i)
            invel_int(i) = 1/vel_vet(i)
        end
    end
    
    Vcstr = Xa1*invel_i
    
    if Xa1 ~= 0 then
        Vpfr = inttrap(X_int,invel_int)
    else
        Vpfr=0
    end
    
    if Vcstr == Vpfr then
        intervalo(m) = Xa1
        m = m + 1
    end
end

printf("Letra B\n")
if intervalo(1) ~= controle then
    if intervalo(length(intervalo)) == 0 then
        printf("O ponto em que Vprf = Vcstr é quando Xa = 0\n\n")
    else
        printf("O intervalo em que Vcstr = Vpfr é [%g,%g].\n\n",intervalo(1),intervalo(length(intervalo)))
    end
else
    printf("O intervalo em que Vcstr = Vpfr não existe, pois o Vcstr é diferente do Vprf para qualquer valor de Conversão.\n\n")
end

//Letra C 

Vcstr = 10.5 //dm^3

for i=1:length(inte)
    Xa_aux(i) = (Vcstr/Fa0)*inte(i)
    if Xa_aux(i) <= 1 then
        Xa_max(i) = Xa_aux(i)
    end
end

Xa_maximo = max(Xa_max)

printf('Letra C\n')
printf('Com um reator CSTR de Vcstr = 10.5dm^3 o Xa máximo = %g\n\n',Xa_maximo)

//Letra D

Vpfr1 = 7.2

//Ponto Inicial

vet_int(1) = vet(1)
inv_int(1) = 1/inte(1)
integral_int(1) = 0
comparador (1) = 0

//Integral

for i=2:length(inte)
    vet_int(i) = vet(i)
    inv_int(i) = 1/inte(i)
    integral_int(i) = inttrap(vet_int,inv_int)
    comparador(i) = round(10000*integral_int(i))/10000
end

for i=1:length(inte)
    if comparador(i) == Vpfr1/Fa0 then
        certo = i
    end
end

Xa1 = vet(certo)

//CSTR

Vcstr1 = 2.4

for j=certo:length(inte)
    Xa2 = vet(j)
    comparador1(j) = round(10000*(Xa2 - Xa1)/inte(j))/10000
end


for i=certo:length(inte)
    if comparador1(i) == Vcstr1/Fa0 then
        certo1 = i
    end
end

printf('Letra D\n')
printf('Xa = %g\n\n',vet(certo1))

//Letra E

//CSTR

for i=1:length(inte)
    Xa1 = vet(i)
    comparador2(i) = round(100000*Xa1/inte(i))/100000
end

for i=1:length(inte)
    if comparador2(i) == Vcstr1/Fa0 then
        certo2 = i
    end
end

//PFR

//Ponto Inicial

for j=certo2:length(inte)
    vet_int3(j) = vet(j)
    inv_int3(j) = 1/inte(j)
    integral_int3(j) = inttrap(vet_int3,inv_int3)
    comparador3(j) = round(10000*integral_int3(j))/10000
end

for i=certo2:length(inte)
    if comparador3(i) == Vpfr1/Fa0 then
        certo3 = i
    end
end

Xa2 = vet(certo3)

printf('Letra E\n')
printf('Xa = %g\n\n',Xa2)

//Letra F

//Ponto Inicial

vet_int4(1) = vet(1)
inv_int4(1) = 1/inte(1)
integral_int4(1) = 0
V(1) = Fa0*integral_int4(1)

//Integral

for i=2:length(inte)
    vet_int4(i) = vet(i)
    inv_int4(i) = 1/inte(i)
    integral_int4(i) = inttrap(vet_int4,inv_int4)
    V(i) = Fa0*integral_int4(i)
end

for i=1:length(V)
    if V(i) <= 10 then
        pos = i
    end
end

for i=1:pos
    V_graf(i) = V(i)
    Xa_graf(i) = vet(i)
    vel_graf(i) = inte(i)
end

figure(1)
plot(V_graf,Xa_graf,'k-')
xtitle('Volume x Conversão')
ylabel('Conversão')
xlabel('Volume  (L)')

figure(2)
plot(V_graf,vel_graf,'r-')
xtitle('Volume x Velocidade da Reação')
ylabel('Velocidade da Reação  (mol/(dm^3*s))')
xlabel('Volume  (L)')
