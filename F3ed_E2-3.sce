clear; clc; close

//Ex 2.3 - Sizing a PFR

//Dados do Problema
//Fa0 = 0.867 mol/s
//Xa = 0.8

//Equação
//y = Fa0/(-ra)
//V = integral de 0 a Xa de [dX/y(X)]

X = [0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8]
y = [189,192,200,222,250,303,400,556,800]

V = inttrap(X,y)

printf("V = %g dm^3 \n", V)

//Plotando Gráfico

i=1
val = 0

while val >= 0 & val <= 0.8
    vet(1,i) = val
    val = val + 0.0019
    i = i + 1
end

inte = interpln([X;y],vet)

plot2d3('nn',vet',inte')
plot(X,y,'r-','LineWidth',2)
