clear; clc; close
exec('minquad.sci')


//Ex 2.4 - Comparing CSTR and PFR Sizes

//Dados do Problema
//Fa0 = 5 mol/s
//Xa = 0.6
//1/(-ra) = 400 (dm^3*s)/mol (Tabela 2.2)

Fa0 = 5
Xa = 0.6

//Equação do CSTR
//V = Xa*Fa0*(1/(-ra))

inv_vel = 400 //Valor de 1/(-ra)

Vcstr = Xa*Fa0*inv_vel

printf("Vcstr = %g dm^3 \n", Vcstr)

//Equação do PFR
//y = Fa0/(-ra)
//V = integral de 0 a Xa de [dXa/y(Xa)]

X = [0,0.1,0.2,0.3,0.4,0.5,0.6]
invel = [189,192,200,222,250,303,400]
y = Fa0*invel

Vpfr = inttrap(X,y)

printf("Vpfr = %g dm^3 \n", Vpfr)

//Comparação

dif = abs(Vpfr-Vcstr)

printf("A diferença de volume entre os dois reatores é: %g dm^3. ", dif)

if Vpfr > Vcstr then
    printf("Logo, ao utilizarmos o CSTR necessitamos de um volume menor para \natingirmos a conversão desejada.")
else
    printf("Logo, ao utilizarmos o PFR necessitamos de um volume menor para \natingirmos a conversão desejada.")
end

//Gráficos

[ang,line,r2] = minquad(X,y)

n=1
val = 0

while val >= 0 & val <= 0.6
    vet(1,n) = val
    val = val + 0.006
    n = n + 1
end

for j=1:(n-1)
    yi(1,j) = Fa0 * inv_vel
end

plot2d3('nn', vet, yi)
plot(X,y,'r-', 'LineWidth', 2)

n=1
val = 0

while val >= 0 & val <= 0.6
    vet(1,n) = val
    val = val + 0.0001
    n = n + 1
end

inte = interpln([X;y],vet)

plot2d3('nn',vet',inte')
plot(X,y,'r-','LineWidth',2)
