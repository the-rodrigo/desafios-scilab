clear; clc;

//P3.20

//Letra B
//CH3. + RBr -> CH3Br + R.

deltaH = -6 //kcal/mol

if deltaH == abs(deltaH) then
    C = 11.47 //kcal/mol
    alfa = -0.75
    deltaHr = -deltaH
else
    C = 11.47 //kcal/mol
    alfa = -0.25
    deltaHr = -deltaH
end

E = C - alfa*(deltaHr)

printf('Letra B\n')
printf('E = %g kcal/mol\n\n',E)

