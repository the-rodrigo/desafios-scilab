clc; clear; close

//Problema P6-7

k1 = 10
k2 = 0.192
martinis = 80
fluido = 40
Ca0 = martinis/fluido

aux = 1
i = 1
t(1) = 0

while aux >= 0 then
    Cb(i) = Ca0*(1-exp(-k1*t(i))) - (k2*t(i))
    
    aux = Cb(i)
    i = i + 1
    t(i) = t(i-1) + 0.01
end

for i=1:(length(Cb)-1)
    Cbg(i) = Cb(i)
    tg(i) = t(i)
end

tp = 0:0.25:10.41

for i=1:length(tp)
        Cbp(i) = Ca0*(1-exp(-k1*tp(i))) - (k2*tp(i))
end

plot(tp,Cbp,'sr')
plot(tg,Cbg,'k')
