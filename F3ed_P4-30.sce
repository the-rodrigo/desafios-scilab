clc; clear; close

//Problema P4.30

//Letra A

kc = 0.5

Xeq = kc/(1+kc)

printf('Letra A\n')
printf('Xeq = %g\n\n',Xeq)

//Letra B

Ca0 = 0.2
k = 0.05

i = 1
val = 0

while val <= Xeq then
    Xeq_vet(i) = val
    ra(i) = k*Ca0*((1-Xeq_vet(i))-(Xeq_vet(i)/kc))
    ra(i) = 40/ra(i)
    val = val + 0.02
    i = i + 1
end

plot(ra,Xeq_vet)
