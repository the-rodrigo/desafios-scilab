clear; clc; close;

//E3.7 - Determining Cf = hf (X) for a Gas-Phase Reaction

//aA + bB -> cC

//Ar = 0.79 de N e 0.21 de O
//N é inerte

//Dados de Entrada

a = 1
b = 0.5
c = 1
deltav = c - a - b

R = 8.314 //(kPa*dm^3)/(mol*K)
P0 = 1485 //kPa
T0 = 500 //K

ya0 = 0.28
yar0 = 0.72
yN0 = 0.79
yO0 = 0.21

//Calculos Iniciais

epsilon = ya0*deltav/a

Ct0 = P0/(R*T0)
Ca0 = ya0*Ct0

//Estequiometria

Ob = (yar0*yO0)/ya0
Oi = (yar0*yN0)/ya0

printf('Ob = %g\n',Ob)
printf('Oi = %g\n',Oi)

//Calculo das Concentrações

X = [0:0.1:1]

for i=1:length(X)
    Ca(i) = Ca0*((1-X(i))/(1+epsilon*X(i)))
    Cb(i) = Ca0*((Ob - 0.5*X(i))/(1+epsilon*X(i)))
    Cc(i) = Ca0*(X(i)/(1+epsilon*X(i)))
    Ci(i) = Ca0*(Oi/(1+epsilon*X(i)))
end

figure(1)
plot(X',Ca,'k-')
plot(X',Cb,'r-')
plot(X',Cc,'b-')
plot(X',Ci,'g-')
xtitle('Conversão x Concentração')
legend('SO2','O2','SO3','N2',5)
xlabel('Conversão')
ylabel('Concentração (mol/L)')
