clc; clear; close

//Problema P5.4

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

Ca0 = [0.025,0.01,0.0133,0.05,0.075]
t_meia = [4.1,9.8,7.7,1.96,1.3]

for i=1:length(Ca0)
    Y(i) = log(t_meia(i))
    X(i) = log(Ca0(i))
end

//Letra A

[ang,line,r2] = minquad(X,Y)

alfa = 1 - ang
k = ((2^(alfa-1)-1)*exp(-line))/(alfa-1)

printf('Letra A')
printf('\nk = %g\n',k)
printf('alfa = %g\n\n',alfa)

//Letra B

k1 = 100 + 273.15
k2 = 110 + 273.15
T1 = 10.52
T2 = 20
R = 8.314

E = round(10000*(-R*log(k2/k1))/((1/T1)-(1/T2)))/10000

printf('Letra B')
printf('\nE = %gkJ/mol\n',E)
