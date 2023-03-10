clear; close
exec('minquad.sci')
clc;

//Ex 2.2 - Sizing a CSTR

//Dados do Problema
//v0 = 6 dm^3/s
//P0 = 10 atm -> P0 = 1013kPa
//ya0 = 0.5
// T0 = 422.2K
//Xa = 0.8
//R = 8.314(dm^3*kPa)/(mol*K)
//1/(-ra) = 800 (dm^3*s)/mol (Tabela 2.2)

//Equação do CSTR
//Fa0 = (ya0*P0*v0)/(R*T0)
//V = Xa*Fa0*(1/(-ra))

v0 = 6
P0 = 1013
ya0 = 0.5
T0 = 422.2
R = 8.314

Fa0 = (ya0*P0*v0)/(R*T0)

Xa = 0.8
inv_vel = 800 //Valor de 1/(-ra)

V = Xa*Fa0*inv_vel

printf("V = %g dm^3", V)

//Gerando gráfico 1/(-ra) versus Conversão

X = [0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8]
invel = [189,192,200,222,250,303,400,556,800]
y = Fa0*invel

[ang,line,r2] = minquad(X,y)

n=1
val = 0

while val >= 0 & val <= 0.8
    vet(1,n) = val
    val = val + 0.007
    n = n + 1
end

for j=1:(n-1)
    yi(1,j) = Fa0 * inv_vel
end

plot2d3('nn', vet, yi)
plot(X,y,'r-', 'LineWidth', 2)
