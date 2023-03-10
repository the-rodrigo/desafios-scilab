clear; clc;
exec('minquad.sci');

//P3.3B

//Dados de Entrada

//Vagalumes
T_v = [21,25,30]
brilho_min = [9,12.16,16.2]

//Grilos
T_g = [14.2,20.3,27]
som_min = [80,126,200]

//Formigas
T_f = [10,20,30,38]
v_f = [0.5,2,3.4,6.5]

//Abelhas
T_a = [25,30,35,40]
v_a = [0.7,1.8,3]

//Letra B

for i=1:3
    T_aux(i) = T_a(i)
    v_aux(i) = v_a(i)
end

[ang,line,r2] = minquad(T_aux,v_aux)

v_h(4) = round(10*(ang*T_a(4) + line))/10

printf('A velocidade das abelhas a 40ºC é: %g cm/s\n\n',v_h(4))

