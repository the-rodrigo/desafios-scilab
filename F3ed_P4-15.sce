clc; clear;

//Problema P4.11

T1 = 200*273.15/32//K
k1 = 0.00152//s^-1
T2 = 300*273.15/32//K
k2 = 0.0740//s^-1
R = 8.314//J/mol*K
R1 = 0.082//atm*L/mol*K

Xa = 0.8

Fa0 = 0.863//mol/s
P = 6.8//atm

E = log(k1/k2)*R*T1*T2/(T1-T2)
k0 = k1*exp(E/(R*T1))

n = 50
l = 40*0.3048//m
r = 0.75*0.0254//m

Vt = (1000*n*l*r^2*%pi)//L
ra = round(10000*Xa*Fa0/Vt)/10000

i=1
TF(1) = 200

while TF(i)<500 then
        i = i + 1
        TF(i) = TF(i-1) + 5
        T(i) = TF(i)*273.15/32
end

aux = 1

for i=1:length(T)
    ka(i) = k0*exp(-E/(R*T(i)))
    Ca(i) = (P/R1)*(1-Xa)*(1/T(i))
    Y(i) = round(10000*Ca(i)*ka(i))/10000
    if  Y(i) == ra then
        aux = i
    end
end

printf('T = %gºF',TF(aux))
