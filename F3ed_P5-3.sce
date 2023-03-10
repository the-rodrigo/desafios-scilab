clc; clear;

//Problema P5.3

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

//program

t = [0,3,5,8,10,12,15,17.5]
Ca = [4,2.89,2.25,1.45,1,0.65,0.25,0.07]

for i=1:length(t)
    if i==1 then
        ra(i) = Ca(i)/t(i)
    else
        ra(i) = (Ca(i)- Ca(i-1))/(t(i)-t(i-1))
    end
end

for i=2:length(ra)
    Y(i) = log(ra(i))
    X(i) = log(Ca(i))
end

//Letra A

[ang,line,r2] = minquad(X,Y)

alfa = round(10*real(ang))/10
k = round(100*real(-exp(line)))/100

printf('Letra A\n\n')
printf('k = %g\n',k)
printf('alfa = %g\n\n',alfa)
