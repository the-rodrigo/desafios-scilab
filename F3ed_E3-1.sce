clear; clc; close

//Ex 3.1 - Determination of the Activation Energy
//A -> B + C

//Dados de Entrada

R = 8.314 //J/(mol*K)
T = [313,319,323,328,333] //K
k = [0.00043,0.00103,0.00180,0.00355,0.00717] //s^-1

for i=1:length(T)
    inv_T(i) = 1000/T(i)
end

//Gráfico semilog

figure(1)
plot2d('onl',inv_T,k)
plot(inv_T,k','sr')
xtitle('Velocidade Especifica x Concentração')
xlabel('10^3/T  (K^-1)')
ylabel('Velocidade Especifica da Reação  (s^-1)')

//Calculo de E

E = (-2.3*R*log10((k(2)/k(1))))/(inv_T(2) - inv_T(1))

printf('E = %g kJ/mol',E)
