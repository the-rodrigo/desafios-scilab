clear; close
exec('minquad.sci')
clc;

//Ex 2.5 - Comparing Volumes for CSTRs in Series

//Dados do Problema
//Fa0 = 0.867 mol/s
//Xa1 = 0.4
//Xa2 = 0.8
//Fa0/(-ra1) = 216.75 dm^3
//Fa0/(-ra2) = 693.6 dm^3

//Equações
//Vn = Fa0*(Xa(n) - Xa(n-1))*(1/(-ran))
//V1 = Fa0*Xa1*(1/(-ra1))
//V2 = Fa0*(Xa2 - Xa1)*(1/(-ra2))

//CSTR em Série

Fa0 = 0.867
Xa1 = 0.4
Xa2 = 0.8
y1 = 216.75
y2 = 693.6

V1 = Xa1*y1
V2 = (Xa2 - Xa1)*y2
Vt = V1 + V2

//CSTR único

Vcstr = y2*Xa2

//Calculo do Gráfico

X = 0:0.1:0.8
invel = [189,192,200,222,250,303,400,556,800]
y = Fa0*invel

for i=1:length(X)
    if X(i) == Xa1 then
        inv_vel1 = invel(i)
    end
    if X(i) == Xa2 then
        inv_vel2 = invel(i)
    end
end

[ang,line,r2] = minquad(X,y)

n=1
val = 0

while val >= 0 & val <= Xa1
    vet(n) = val
    val = val + 0.00004
    n = n + 1
end

for j=1:(n-1)
    yi(1,j) = Fa0 * inv_vel1
end

plot2d3('nn', vet', yi')

n=1
val = Xa1

while val >= Xa1 & val <= Xa2
    vet(n) = val
    val = val + 0.004
    n = n + 1
end

for j=1:(n-1)
    yi(1,j) = Fa0 * inv_vel2
end

plot2d3('nn', vet', yi')

plot(X,y,'r-','LineWidth',2)

//Comparação

printf("O volume total necessário para atingir a conversão global de 80%% é: %g dm^3\n", Vt)
printf("O volume necessário para chegarmos a uma conversão de 80%% utilizando um único CSTR é: %g dm^3\n", Vcstr)

if Vcstr > Vt then
    printf("O volume necessário para atingirmos 80%% de conversão é maior utilizando um único CSTR do que ao utilizarmos CSTRs em série.")
else
    printf("O volume necessário para atingirmos 80%% de conversão é maior utilizando uma série de CSTRs do que ao utilizarmos um único CSTR.")
end
