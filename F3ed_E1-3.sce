clear; clc; close

//Exemplo 4.1 - Determinando k

Ca0 = 1

t = [0, 0.5, 1, 1.5, 2, 3, 4, 6, 10]
Cc = [0,0.145, 0.27, 0.376, 0.467, 0.61, 0.715, 0.848, 0.957]

for i=1:length(Cc)
    y(i) = (Ca0 - Cc(i))/Ca0
    ln_y(i) = log(y(i))
end

disp(ln_y)

plot(t,y,'r')

