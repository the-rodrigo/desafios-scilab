clc; clear; close
exec('minquad.sci')
//Exemplo 5.2
//Havia selecionado, porém não vi muita utilidade

t = [0,2.5,5,10,15,20]
P = [1.5,10.5,12.5,15.8,17.9,19.4]
P0 = P(1)

for i=1:length(P)
    Y(i) = log((2*P0)/((3*P0)-P(i)))
end

[ang,line,r2] = minquad(t,Y)

for i=1:length(t)
    Yg(i) = ang*t(i) + line
end

plot(t,Yg,'k')
plot(t,Y,'sr')
