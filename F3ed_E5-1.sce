clc; clear; close
exec('minquad.sci');

//Exemplo 5.1

t = [0,2.5,5,10,15,20]
P = [7.5,10.5,12.5,15.8,17.9,19.4]

for i=1:(length(P)-1)
    dP(i) = P(i+1) - P(i)
    dt(i) = t(i+1) - t(i)
    dP_dt(i) = dP(i)/dt(i)
    Y(i) = log(dP_dt(i))
    X(i) = log((3*P(1))-P(i))
end

[ang,line,r2] = minquad(X,Y)

alfa = round(ang)
k = round(100*dP_dt(1)/exp(X(1)))/100

printf('\nalfa = %g\n',alfa)
printf('k = %g',k)
