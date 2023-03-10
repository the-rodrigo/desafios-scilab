clc; clear; close

//Problema P6-8

Ca(1) = 6.25
Cb(1) = 0

for i=1:80
    k1(i) = 0.15
    k2(i) = 0.6
    k4(i) = 0.2
    
    if Cb < 0 then
        k3(i) = k1*Ca - k4*Cb
    else
        k3(i) = 0
    end
    
    dCa_dt(i) = -k1(i)*Ca(i) -k2(i)*Ca(i)
    dCb_dt(i) = k1(i)*Ca(i)-k3(i)-k4(i)*Cb(i)
    
    Ca(i+1) = Ca(i) + dCa_dt(i)
    Cb(i+1) = Cb(i) + dCb_dt(i)
end

for i=1:(length(Cb)-1)
    Cbg(i) = Cb(i)
    y(i) = i
end

printf('Plot do Gráfico observado em Pop Up')
plot(y,Cbg)
