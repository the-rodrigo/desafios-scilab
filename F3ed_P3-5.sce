clear; clc;
exec('minquad.sci');

//P3.5

k = [0.001,0.050] //min^-1
k = k/60 //s^-1
T = [273,373] //K
R = 8.314 //J/mol*K

for i=1:length(T)
    inv_T(i) = 1/T(i)
    log_k = log10(k)
end

//Letra B

E = (-2.3*R*log10((k(2)/k(1))))/(inv_T(2) - inv_T(1))/1000
A = k(1)*exp(E/(R*T(1)))

printf('Letra B\n')
printf('A = %g s^-1\n',A)
printf('E = %g kJ/mol\n',E)
