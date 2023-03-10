clc; clear; close; close; close; close

//Desafio 3.1 - P3.21
//Reação: A + 4B -> 4C + D(g,l)

a = 1
b = 4
c = 4
d = 1
deltav = c + d - a - b

Ca0 = a
Cb0 = b
Cc0 = 0
Cd0 = 0
Ct0 = Ca0 + Cb0 + Cc0 + Cd0

Ob = Cb0/Ca0
Oc = Cc0/Ca0
Od = Cd0/Ca0
ya0 = Ca0/(Ct0)

epsilon = ya0*deltav/a

Pvd = 95 //kPa
P = 950 //kPa
v0 = 0.4 //dm^3/s
k = 0.01 //dm^6/mol^2*min

//Saturação

yd = Pvd/P

//Condensação

Xc = ((1+Ob+Oc+Od)*yd - Od)/((d/a) - deltav*yd/a)

printf('Quando a condensação começa X = Xcond\n')
printf('Xcond = %g',Xc)

// Calculo de -ra

function ra = Funcao(Ca,Cb,k)
    ra = k*Ca*Cb^2
endfunction

// Antes da Condensação

X1 = [0:0.01:Xc]

for i=1:length(X1)
    Ca1 = Ca0*(1-X1(i))/(1+epsilon*X1(i))
    Cb1 = Ca0*(Ob-(b/a)*X1(i))/(1+epsilon*X1(i)) 
    [ra] = Funcao(Ca1,Cb1,k)
    ra1(i) = ra
end

// Depois da Condensação

X2 = [round(100*Xc)/100:0.01:1]

for i=1:length(X2)
    Ca2 = Ca0*(1-X2(i))/(1+epsilon*X2(i))
    Cb2 = Ca0*(Ob-(b/a)*X2(i))/(1+epsilon*X2(i)) 
    [ra] = Funcao(Ca2,Cb2,k)
    ra2(i) = ra
end

//Calculo de Fd

for i=1:length(X1)
    Fdg1(i) = Ca0*v0*(Od + (d/a)*X1(i))
    Fdg (i) = Fdg1(i)
    X(i) = X1(i)
end

j = i 

for i=1:length(X2)
    Fdg2(i) = Ca0*v0*yd*((1+Ob+Oc)+(c-b-a)*X2(i)/a)/(1-yd)
    Fdl(i) = Ca0*v0*X2(i) - Fdg2(i)
    j = j + 1
    Fdg(j) = Fdg2(i)
    X(j) = X2(i)
end

//Calculo das Concentrações

for i=1:length(X)
    Ca(i) = Ca0*v0*(1-X(i))/(1+epsilon*X(i))
    Cb(i) = Ca0*v0*(Ob-(b/a)*X(i))/(1+epsilon*X(i))
    Cc(i) = Ca0*v0*(Oc+(c/a)*X(i))/(1+epsilon*X(i))
    Cd(i) = Fdg(i)/v0
end

//Calculo das Vazões Molares

for i=1:length(X)
    Fa(i) = Ca(i)*v0
    Fb(i) = Cb(i)*v0
    Fc(i) = Cc(i)*v0
    Ft(i) = Fa(i) + Fb(i) + Fc(i) + Fdg(i)
end

//Gráfico

Fgraf = Ca0*v0*yd*((1+Ob+Oc)+(c-b-a)*Xc/a)/(1-yd)

Ca_graf = Ca0*v0*(1-Xc)/(1+epsilon*Xc)
Cb_graf = Ca0*v0*(Ob-(b/a)*Xc)/(1+epsilon*Xc)
Cc_graf = Ca0*v0*(Oc+(c/a)*Xc)/(1+epsilon*Xc)
Cd_graf = Fgraf/v0

Fa_graf = Ca_graf*v0
Fb_graf = Cb_graf*v0
Fc_graf = Cc_graf*v0
Ft_graf = Fa_graf + Fb_graf +  Fc_graf + Fgraf

figure(1)
plot(X,Fdg,'k-',Xc,Fgraf,'ks')
xlabel('Conversão')
ylabel('Fd (g)')
legend('Curva Fd (g)','Ponto Xc',2)

figure(2)
plot(X,Ca,'b-',X,Cb,'r-',X,Cc,'g-',X,Cd,'k-',Xc,Ca_graf,'bs',Xc,Cb_graf,'rs',Xc,Cc_graf,'gs',Xc,Cd_graf,'ks')
xlabel('Conversão')
ylabel('Concentração')
legend('Ca','Cb','Cc','Cd',5)

figure(3)
plot(X,Fa,'b-',X,Fb,'r-',X,Fc,'g-',Xc,Fa_graf,'bs',Xc,Fb_graf,'rs',Xc,Fc_graf,'gs')
xlabel('Conversão')
ylabel('Vazão Molar')
legend('Fa','Fb','Fc')

figure(4)
plot(X,Ft,'k-',Xc,Ft_graf,'ks')
xlabel('Conversão')
ylabel('Vazão Molar')
legend('Ftotal')
