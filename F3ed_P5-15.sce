clc; clear;

//Problema 5.15


function [ang,line,r2] = minquad(xi,yi)
    
    n = length(xi)
    
    //Somatórios
    
    som_1 = 0;
    for i=1:n
        som_1 = som_1 + xi(i)*yi(i);
    end
    
    som_2 = 0;
    for i=1:n
        som_2 = som_2 + xi(i);
    end
    
    som_3 = 0;
    for i=1:n
        som_3 = som_3 + yi(i);
    end
    
    som_4 = 0;
    for i=1:n
        som_4 = som_4 + (xi(i)^2);
    end
    
    som_5 = 0;
    for i=1:n
        som_5 = som_5 + (yi(i)^2);
    end
    
    //Termos
    
    term_1 = n * som_1;
    term_2 = som_2 * som_3;
    term_3 = n * som_4;
    term_4 = som_2^2;
    denominador = term_3 - term_4;
    
    ang = (term_1 - term_2)/denominador;
    
    //Calculo de b
        
    term_5 = som_4 * som_3;
    term_6 = som_2 * som_1;
    
    line = (term_5 - term_6)/denominador;
        
    //Calculo do Coeficiente de Correlação Linear
    
    term_7 = (n * som_4) - ((som_2)^2);
    term_8 = (n * som_5) - ((som_3)^2);
    denominador_2 = sqrt((term_7 * term_8));
    
    r2 = (((term_1 - term_2)/denominador_2)^2);
    
endfunction

r = [4.9*10^-4,1.1*10^-4,2.4*10^-3,2.2*10^-2,1.18*10^-1,1.82*10^-2]
C = [0.2,0.02,0.05,0.08,0.1,0.06]
T = [700,750,800,850,900,950]
R = 0.082

for i=1:length(C)
    if i == 3 then
        Y(i) = 0
        X(i) = 0
    else
        Y(i) = log(r(i)/r(3))/((1/(R*T(i)))-(1/(R*T(3))))
        X(i) = log(C(i)/C(3))/((1/(R*T(i)))-(1/(R*T(3))))
    end
end

[ang,line,r2] = minquad(X,Y)

E = -line
alfa = ang

k0 = r(1)*exp(E/(R*T(1)))/(C(1)^alfa)

printf('\nE = %gatm*L/mol\n',E)
printf('k = %g 1/s\n',k0)
printf('alfa = %g',alfa)

