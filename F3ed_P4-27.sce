clc; clear; close

//Problema P4.27

t = [0,5,10,15,20,25,30,35,40,45,50,55,60]

for i=1:length(t)
    X(i) = 1 - ((((100+5*t(i))/100)^2)/(exp(0.1*t(i))))
end

//Letra B

n=1
val = t(1)

while val >= t(1) & val <= t(length(t))
    vet(n) = val
    val = val + 5
    n = n + 1
end

inte = interpln([t;X'],vet)

plot(vet,inte,'k')

