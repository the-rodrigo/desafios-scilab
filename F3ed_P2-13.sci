//P2.13

clear; clc; close; close; close; close

Fa0 = 5 //mol/min

//Letra A

Xa_A = [0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.85]
vel_A = [0.0053,0.0052,0.0050,0.0045,0.0040,0.0033,0.0025,0.0018,0.00125,0.001]

a0 = vel_A(1)
a2 = (vel_A(3) - (vel_A(2)*Xa_A(3)/Xa_A(2)) - a0*(1 - (Xa_A(3)/Xa_A(2))))/(Xa_A(3)^2 - Xa_A(2)*Xa_A(3))
a1 = (vel_A(2) - a0 - a2*Xa_A(2)^2)/Xa_A(2)

//EDO

function dV_dXa = funcaoA(X,V)
    dV_dXa = (Fa0/(a0+a1*X+a2*X^2))
endfunction

V0 = 0 
X0 = 0

volumeA = ode(V0, X0, Xa_A, funcaoA)

figure (1)
plot(Xa_A,volumeA,'k-','LineWidth',2)
xtitle ('Volume do PFR x Conversão')
xlabel('Conversão')
ylabel('Volume do PFR (L)')

//Volume CSTR

VcstrA = Xa_A(9)*Fa0/vel_A(9)

printf('Letra A\n')
printf('a0 = %g\n',a0)
printf('a1 = %g\n',a1)
printf('a2 = %g\n',a2)
printf('Vcstr = %g L para Xa=0.8\n\n',VcstrA)

//Letra B

Xa_B = [0,0.2,0.4,0.5,0.6,0.8,0.9]
vel_B = [10,14.67,50,50,50,12.5,909]

a0 = vel_B(1)
a2 = (vel_B(3) - (vel_B(2)*Xa_B(3)/Xa_B(2)) - a0*(1 - (Xa_B(3)/Xa_B(2))))/(Xa_B(3)^2 - Xa_B(2)*Xa_B(3))
a1 = (vel_B(2) - a0 - a2*Xa_B(2)^2)/Xa_B(2)

//EDO

function dV_dXa = funcaoB(X,V)
    dV_dXa = (Fa0/(a0+a1*X+a2*X^2))
endfunction

V0 = 0 
X0 = 0

volumeB = ode(V0, X0, Xa_B, funcaoB)

figure (2)
plot(Xa_B,volumeB,'k-','LineWidth',2)
xtitle ('Volume do PFR x Conversão')
xlabel('Conversão')
ylabel('Volume do PFR (L)')

//Volume CSTR

VcstrB = Xa_B(6)*Fa0/vel_B(6)

printf('Letra B\n')
printf('a0 = %g\n',a0)
printf('a1 = %g\n',a1)
printf('a2 = %g\n',a2)
printf('Vcstr = %g L para Xa=0.8\n\n',VcstrB)

//Letra C

Xa_C = [0,0.2,0.4,0.6]
vel_C = [0.00001,0.000005,0.000002,0.000001]

a0 = vel_C(1)
a2 = (vel_C(3) - (vel_C(2)*Xa_C(3)/Xa_C(2)) - a0*(1 - (Xa_C(3)/Xa_C(2))))/(Xa_C(3)^2 - Xa_C(2)*Xa_C(3))
a1 = (vel_C(2) - a0 - a2*Xa_C(2)^2)/Xa_C(2)

//EDO

function dV_dXa = funcaoC(X,V)
    dV_dXa = (Fa0/(a0+a1*X+a2*X^2))
endfunction

V0 = 0 
X0 = 0

volumeC = ode(V0, X0, Xa_C, funcaoC)

figure (3)
plot(Xa_C,volumeC,'k-','LineWidth',2)
xtitle ('Volume do PFR x Conversão')
xlabel('Conversão')
ylabel('Volume do PFR (L)')

//Volume CSTR

//VcstrC = Xa_C(5)*Fa0/vel_C(5)

printf('Letra C\n')
printf('a0 = %g\n',a0)
printf('a1 = %g\n',a1)
printf('a2 = %g\n\n',a2)
//printf('Vcstr = %g L para Xa=0.8\n\n',VcstrC)

//Letra D

Xa_D = [0,0.2,0.4,0.6,0.8]
vel_D = [60,30,19,19,30]

a0 = vel_D(1)
a2 = (vel_D(3) - (vel_D(2)*Xa_D(3)/Xa_D(2)) - a0*(1 - (Xa_D(3)/Xa_D(2))))/(Xa_D(3)^2 - Xa_D(2)*Xa_D(3))
a1 = (vel_D(2) - a0 - a2*Xa_D(2)^2)/Xa_D(2)

//EDO

function dV_dXa = funcaoD(X,V)
    dV_dXa = (Fa0/(a0+a1*X+a2*X^2))
endfunction

V0 = 0 
X0 = 0

volumeD = ode(V0, X0, Xa_D, funcaoD)

figure (4)
plot(Xa_D,volumeD,'k-','LineWidth',2)
xtitle ('Volume do PFR x Conversão')
xlabel('Conversão')
ylabel('Volume do PFR (L)')

//Volume CSTR

VcstrD = Xa_D(5)*Fa0/vel_D(5)

printf('Letra D\n')
printf('a0 = %g\n',a0)
printf('a1 = %g\n',a1)
printf('a2 = %g\n',a2)
printf('Vcstr = %g L para Xa=0.8\n\n',VcstrD)
