clear; clc; close; close;close
//P3.21

a = 1
b = 4
c = 4
d = 1
deltav = c + d - a - b

T = 348 //K
P = 950 //kPa
Pc = 95 //kPa
v0 = 0.4 //L/s
R = 8.314 // kPa*L/mol*K
Ca0 = a
Cb0 = b
Fa0 = Ca0*v0

Xa = [0:0.01:1]

//Tabela Estequiométrica

esteq1 = [' ','Entrada','Mudança','Antes da Condensação','Depois da Condensação']
esteq2 = ['A','Fa0','-Fa0*X','Fa0*(1-X)','Fa0*(1-X)']
esteq3 = ['B','4*Fa0','-4*Fa0','Fa0*(Ob-(b/a)*X)','Fa0*(Ob-(b/a)*X)']
esteq4 = ['C','-','Fa0*X','Fa0*(c/a)*X','yce*Ft']
esteq5 = ['D','-','4*Fa0*X','Fa0*(d/a)*X','Fa0*(d/a)*X']
esteq6 = ['Total','5*Fa0','-','Ft','yce*Ft+Fa0*(1-X)+Fa0*(d/a)*X+Fa0*(Ob-(b/a)*X)']

for i=1:5
    esteq(1,i) = esteq1(i)
end
for i=1:5
    esteq(2,i) = esteq2(i)
end
for i=1:5
    esteq(3,i) = esteq3(i)
end
for i=1:5
    esteq(4,i) = esteq4(i)
end
for i=1:5
    esteq(5,i) = esteq5(i)
end
for i=1:5
    esteq(6,i) = esteq6(i)
end

printf('Tabela Estequiométrica - 4Cl2 + CH4 -> CCl4 + 4HCl\n')
disp(esteq)

//Estequiometria

Ob = Cb0/Ca0

//Calculo da Conversão

yc = Pc/P
Xc = (yc*(1+Ob))/((d/a)-(deltav*yc/a))

printf('\n\n Xc = %g\n',Xc)

//Calculo das Concentrações

for i=1:length(Xa)
    Ca(i) = Ca0*(1-Xa(i))
    Cb(i) = Ca0*(Ob-(b/a)*Xa(i))
    Cc(i) = Ca0*(c/a)*Xa(i)
    Cd(i) = Ca0*(d/a)*Xa(i)
    Ct(i) = Ca(i) + Cb(i) + Cc(i) + Cd(i)
end

//ERRADO A PARTIR DAQUI!!!!!

//Calculo dos Fluxos Molares

for i=1:length(Xa)
//    Fcg(i) = (yc*Fa0*(1+Ob+(Xa(i)*((c/a)-(b/a)-1))))/(1-yc)
    Fcg(i) = 0.375*Fa0*(1.5-Xa(i))
    Fcl(i) = Fa0*Xa(i)*Fcg(i)
    Ft(i) = (Fa0*(1+Ob+(Xa(i)*((c/a)-(b/a)-1))))/(1-yc)
end

for i=1:length(Xa)
    Fa(i) = Ca(i)*v0
    Fb(i) = Cb(i)*v0
    Fd(i) = Cd(i)*v0
end

//Gráfico

figure(1)
plot(Xa',Ca,'k-','LineWidth',2)
plot(Xa',Cb,'r-','LineWidth',2)
plot(Xa',Cc,'c-','LineWidth',2)
plot(Xa',Cd,'g-','LineWidth',2)
plot(Xa',Ct,'m','LineWidth',2)
xtitle('Concentração x Conversão')
xlabel('Conversão')
ylabel('Concentração (mol/L)')
legend('Ca','Cb','Cc','Cd','Ctotal',2)

figure(2)
plot(Xa',Fa,'k-','LineWidth',2)
plot(Xa',Fb,'r-','LineWidth',2)
plot(Xa',Fcg,'c-','LineWidth',2)
plot(Xa',Fd,'g-','LineWidth',2)
plot(Xa',Ft,'m','LineWidth',2)
xtitle('Fluxo Molar x Conversão')
xlabel('Conversão')
ylabel('Fluxo Molar (mol/s)')
legend('Fa','Fb','Fc','Fd','Ftotal',2)

figure(3)
plot(Xa',Fcg,'c-','LineWidth',2)
