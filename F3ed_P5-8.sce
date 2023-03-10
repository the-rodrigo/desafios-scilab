clc; clear; close
exec('minquad.sci');

//Problema P5.8

t = [10,20,30,40,50,60]
Ca = [2.45,1.74,1.23,0.88,0.62,0.44]

for i=1:(length(Ca)-1)
    dCa(i) = Ca(i+1) - Ca(i)
    dt(i) = t(i+1) - t(i)
    dCa_dt(i) = dCa(i)/dt(i)
    Y(i) = log(dCa_dt(i))
    X(i) = log(Ca(i))
end

[ang,line,r2] = minquad(X,Y)

alfa = round(ang)
k = round(100*exp(real(line)))/100

for i=1:length(Y)
    Yg(i) = ang*X(i) + line
end

plot(X,Yg,'k')
plot(X,Y,'sr')

printf('Letra A\n')
printf('Ordem da reação: %g\n',alfa)
printf('k = %g (1/min)\n\n',k)

//Letra B

ra = -0.0344 //mg/L*min
Fb = 25000*ra*60/1000*3.7851/453.6

printf('Letra B\n')
printf('Fb = %g lbm/h\n\n',Fb)
