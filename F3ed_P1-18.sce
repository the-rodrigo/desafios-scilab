//P1.18

close; clc; close; close

//Dados de Entrada

k1 = 0.02 // dia^-1
k2 = 0.00004 // 1/(dia*nºraposas)
k3 = 0.0004 // 1/(dia*nºcoelhos)
k4 = 0.04 // dia^-1

//Funções

function dx_dt = funcao1(t,x,y)
    dx_dt = k1*x - k2*x*y
endfunction

function dy_dt = funcao2(t,x,y)
    dy_dt = k3*x*y - k4*y
endfunction

function [t, x, y] = euler(x0,y0)
    funcprot(0)
    t = [1:500]
    h = (t(length(t)) - t(1))/length(t)
    x(1) = x0
    y(1) = y0
    
    for i=1:(length(t)-1)
        x_aux = funcao1(t(i),x(i),y(i))
        y_aux = funcao2(t(i),x(i),y(i))
        x(i+1) = x(i) + x_aux*h
        y(i+1) = y(i) + y_aux*h
    end
endfunction

x0 = 500
y0 = 200

[t, x, y] = euler(x0,y0)

//Gráficos

figure(1)
plot(t,x','k-','LineWidth',2)
xtitle('t versus x')
xlabel('t (dias)')
ylabel('x (nº de coelhos)')

figure(2)
plot(t,y','k-','LineWidth',2)
xtitle('t versus y')
xlabel('t (dias)')
ylabel('y (nº de raposas)')
