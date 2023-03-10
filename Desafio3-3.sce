clc; clear; close

//Desafio 3.2 - P3.22
//Reação: 3A + 4B -> C + 12D

a = 3
b = 4
c = 1
d = 12
deltav = c + d - a - b

Ob = 1
ya0 = 0.5

epsilon = ya0*deltav/a

P = 1 //Pa
R = 8314
T = 973
v0 = 0.5 //dm^3/s
k = 0.01 //dm^6/mol^2*min

Ct0 = P/(R*T)
Ca0 = ya0*Ct0

X = [0:0.01:1]

for i=1:length(X)
    Ca(i) = Ca0*(1-X(i))/(1+epsilon*X(i))
    Cb(i) = Ca0*(Ob-(b/a)*X(i))/(1+epsilon*X(i))
    Cc(i) = Ca0*(c/a)*X(i)/(1+epsilon*X(i))
    Cd(i) = Ca0*(d/a)*X(i)/(1+epsilon*X(i))
end

figure(1)
plot(X,Ca,'b-',X,Cb,'r-',X,Cc,'g-',X,Cd,'k-')
xtitle('Conversão X Concentração')
xlabel('Conversão')
ylabel('Concentração')
legend('Ca','Cb','Cc','Cd',2)
