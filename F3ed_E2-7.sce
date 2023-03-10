clear; clc; close; close

//Ex 2.7 - Comparing the Order of Sequencing Reactors

//Dados do Problema
//Fa0 = 0.867 mol/s
//Xa1 = 0.5
//Xa2 = 0.8

//Equações
//PFR em Série: Vn = integral de Xa(n-1) até Xa(n) de [(Fa0/-ra)dXa]
//CSTR em Série: Vn = Fa0*(Xa(n) - Xa(n-1))*(1/(-ran))

Fa0 = 0.867
Xa1 = 0.5
Xa2 = 0.8

Xa1_vet = [0,0.1,0.2,0.3,0.4,0.5]
Xa2_vet = [0.5,0.6,0.7,0.8]

invel1 = [189,192,200,222,250,303]
invel2 = [303,400,556,800]

y1 = Fa0*invel1
y2 = Fa0*invel2

//Caso A - CSTR(1) -> PFR(2)

//Cálculos

pos = 0

for i=1:length(Xa1_vet)
    if Xa1 == Xa1_vet(i) then
        pos = i
    end
end

V1A = Fa0*Xa1*invel1(pos)
V2A = inttrap(Xa2_vet,y2)
VtA = V1A + V2A

printf("Para o caso A (CSTR antes do PFR), temos:\n")
printf("V1 = %g m^3 \n", V1A)
printf("V2 = %g m^3 \n", V2A)
printf("O volume total é: %g m^3\n\n", VtA)

//Gráfico

figure(1)

n = 1
val = Xa1_vet(1)

while val >= Xa1_vet(1) & val <= Xa1_vet(length(Xa1_vet))
    vet(n) = val
    val = val + 0.01
    n = n + 1
end

for i=1:(n-1)
    yi(i) = Fa0*invel1(length(invel1))
end

plot2d3(vet,yi)

n = 1
val = Xa2_vet(1)

while val >= Xa2_vet(1) & val <= Xa2_vet(length(Xa2_vet))
    vet(n) = val
    val = val + 0.003
    n = n + 1
end

inte = interpln([Xa2_vet;y2],vet)

plot2d3('nn',vet',inte')

plot(Xa1_vet,y1,'r-',Xa2_vet,y2,'r-','LineWidth',2)
xtitle('CSTR e PFR em Série')
xlabel('Conversão')
ylabel('-Fa0/ra')

//Caso B - PRF(1) -> CSTR(2)

//Cálculos

pos = 0

for i=1:length(Xa2_vet)
    if Xa2 == Xa2_vet(i) then
        pos = i
    end
end

V1B = inttrap(Xa1_vet,y1)
V2B = Fa0*(Xa2-Xa1)*invel2(pos)
VtB = V1B + V2B

printf("Para o caso B (PFR antes do CSTR), temos:\n")
printf("V1 = %g m^3 \n", V1B)
printf("V2 = %g m^3 \n", V2B)
printf("O volume total é: %g m^3", VtB)

//Gráfico

figure(2)

n = 1
val = Xa1_vet(1)

while val >= Xa1_vet(1) & val <= Xa1_vet(length(Xa1_vet))
    vetC(n) = val
    val = val + 0.003
    n = n + 1
end

inte = interpln([Xa1_vet;y1],vetC)

plot2d3('nn',vetC,inte)

m = 1
val = 0.5

while val >= Xa2_vet(1) & val <= Xa2
    vetD(m) = val
    val = val + 0.01
    m = m + 1
end

for i=1:(m-1)
    yi2(i) = Fa0*invel2(length(invel2))
end

plot2d3('nn',vetD,yi2)

plot(Xa1_vet,y1,'r-',Xa2_vet,y2,'r-','LineWidth',2)
xtitle('PFR e CSTR em Série')
xlabel('Conversão')
ylabel('-Fa0/ra')
