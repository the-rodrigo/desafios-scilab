clear; clc;

//Ex 3.5 - What Is the Limiting Reactant?
//3A + B -> 3C + D

//Dados do Problema
//Oc = Od = 0
//Ca0 = 10 mol/dm^3
//Cb0 = 2 mol/dm^3

//Equações
//On = Nn0/Na0
//Cn = Ca0*(On + (n/a)*Xa)

Ca0 = 10
Cb0 = 2
Ob = Cb0/Ca0

// Xa = 0.2

Xa1 = 0.2

Cd1 = Ca0*(Xa1/3)
Cb1 = Ca0*(Ob - (Xa1/3))

//Xa = 0.9

Xa2 = 0.9

Cd2 = Ca0*(Xa2/3)
Cb2 = Ca0*(Ob - (Xa2/3))

printf("Caso Xa = 0.2, então Cd = %g mol/L\n", Cd1)
printf(" Caso Xa = 0.2, então Cb = %g mol/L\n", Cb1)
printf(" Caso Xa = 0.9, então Cd = %g mol/L\n", Cd2)
printf(" Caso Xa = 0.9, então Cb = %g mol/L\n", Cb2)


if Cd1 < 0 | Cb1 < 0 then
    printf(" Concentração negativa é impossivel, chegamos a esse resultados, pois A é o reagente limitante, logo seria impossível obtermos 80%%\n de conversão de B, pois A seria completamente consumido antes disso")
end

if Cd2 < 0 | Cb2 < 0 then
    printf(" Concentração negativa é impossivel, chegamos a esse resultados, pois B é o reagente limitante, logo seria impossível obtermos 90%%\n de conversão de A, pois B seria completamente consumido antes disso")
end
