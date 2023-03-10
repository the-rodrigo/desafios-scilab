clc; clear; close

//Problema P6.18

Ct0 = 2
Ft = 10
dFc_dV(1) = -0.332
dFa_dV(1) = 0.24
dFp_dV(1) = 0.24
dFo_dV(1) = 0

for i=1:50
    
    k1(i) = 0.12
    k2(i) = 0.046
    k3(i) = 0.02
    k4(i) = 0.034
    k5(i) = 0.04
    
    Cc(i) = dFc_dV(i)/(-k1(i)-k2(i))
    Ca(i) = dFo_dV(i)/k5(i)
    Cp(i) = (-dFp_dV(i)+k4(i)*Ca(i)+k1(i)*Cc(i))/k3(i)
    Co(i) = Ct0 - Cc(i) - Ca(i) - Cp(i)
    
    Fc(i) = Ft*Cc(i)/Ct0
    Fa(i) = Ft*Ca(i)/Ct0
    Fp(i) = Ft*Cp(i)/Ct0
    Fo(i) = Ft-Fp(i)-Fa(i)-Fc(i)
    
    if i<>1 then
        dFc_dV(i+1) = dFc_dV(i) + Fc(i) - Fc(i-1)
        dFa_dV(i+1) = dFa_dV(i) + Fa(i) - Fa(i-1)
        dFp_dV(i+1) = dFp_dV(i) + Fp(i) - Fp(i-1)
        dFo_dV(i+1) = dFo_dV(i) + Fo(i) - Fo(i-1)
    else
        dFc_dV(i+1) = dFc_dV(i) + Fc(i)
        dFa_dV(i+1) = dFa_dV(i) + Fa(i)
        dFp_dV(i+1) = dFp_dV(i) + Fp(i)
        dFo_dV(i+1) = dFo_dV(i) + Fo(i)
    end
end

for i=1:(length(Fc)-1)
    Fcg(i) = Fc(i)
    Fag(i) = Fa(i)
    Fpg(i) = Fp(i)
    Fog(i) = Fo(i)
    y(i) = i
end

plot(y,Fcg,'b') 
plot(y,Fag,'g') 
plot(y,Fpg,'y') 
plot(y,Fog,'r')
