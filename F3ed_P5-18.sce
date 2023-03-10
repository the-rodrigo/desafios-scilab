clc; clear; close; close; close; close
exec('minquad.sci');

//Problema 5.15

dCa_dt = [-0.43,-0.26,-0.15,-0.075]
Ca = [2,1.31,0.95,0.73]
t = [0,2,4,6]

n=1
val = t(1)

while val >= t(1) & val <= t(4)
    vet(n) = val
    val = val + 0.01
    n = n + 1
end

inte = interpln([t;Ca],vet);

figure(1)
plot(vet,inte)
plot(t,Ca,'sr')

for i=1:length(Ca)
    Y(i) = log(dCa_dt(i))
    X(i) = log(Ca(i))
end

[ang,line,r2] = minquad(X,Y)

for i=1:length(Y)
    Yg(i) = ang*X(i) + line
end

figure(2)
plot(X,Yg,'k')
plot(X,Y,'sr')

alfa = round(1000*ang)/1000
printf('\nOrdem da reação: %g',alfa)

alfa = round(ang)
printf('\nOrdem da reação pelo Polinômio: %g',alfa)
