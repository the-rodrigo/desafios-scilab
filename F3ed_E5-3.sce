clc; clear; close
exec('minquad.sci')

//Exemplo 5.3

r = [0.34,0.74,1.2,1.36,2]
C = [0.1,0.5,1,2,4]

for i=1:length(r)
    r(i) = log(r(i))
    C(i) = log(C(i))
end

[ang,line,r2] = minquad(C,r)

for i=1:length(C)
    rg(i) = ang*C(i) + line
end

plot(C,rg,'k')
plot(C,r,'sr')
