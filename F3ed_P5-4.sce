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

tau = [15,38,100,1200]
Ca = [1.5,1.25,1,0.5]
Ca0 = 2

for i=1:length(Ca)
    Y(i) = log((Ca0-Ca(i))/tau(i))
    X(i) = log(Ca(i))
end

[ang,line,r2] = minquad(X,Y)

alfa = ang
k = exp(line)

//Letra A

printf('\nk = %g\n',k)
printf('alfa = %g',alfa)
