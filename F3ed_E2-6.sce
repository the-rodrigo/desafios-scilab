clear; close
exec('minquad.sci')
clc;

//Ex 2.6 - Sizing Plug-Flow Reactors in Series

//Dados do Problema
//Xa1 = 0.4
//Xa2 = 0.8
//Fa0 = 0.867 mol/s
//Fa0/(-ra1) = 2.05 m^3 = y1
//Fa0/(-ra2) = 8 m^3 = y2

//Equação do PFR em Série
//Vn = integral de Xa(n-1) até Xa(n) de [(Fa0/-ra)dXa]

//PFR em Série

Fa0 = 0.867
Xa1 = [0,0.1,0.2,0.3,0.4]
Xa2 = [0.4,0.5,0.6,0.7,0.8]
invel1 = [189,192,200,222,250]
y1 = Fa0 * invel1
invel2 = [250,303,400,556,800]
y2 = Fa0 * invel2

V1 = inttrap(Xa1,y1)
V2 = inttrap (Xa2,y2)
Vt = V1 + V2

printf("V1 = %g m^3 \n", V1)
printf("V2 = %g m^3 \n", V2)
printf("O volume total é: %g m^3", Vt)

//Gráficos

n = 1
val = Xa1(1)

while val >= Xa1(1) & val <= Xa1(5)
    vet(n) = val
    val = val + 0.02
    n = n + 1
end

inte = interpln([Xa1;y1],vet)

plot2d3('nn',vet',inte')

n = 1
val = Xa2(1)

while val >= Xa2(1) & val <= Xa2(5)
    vet(n) = val
    val = val + 0.003
    n = n + 1
end

inte = interpln([Xa2;y2],vet)

plot2d3('nn',vet',inte')

plot(Xa1,y1,'r-',Xa2,y2,'r-','LineWidth',2)
