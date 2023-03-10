clc; clear

//Exemplo 4.2

Fc = 6.137
X = 0.8
Ca0 = 1
k = 0.311

Fa0 = Fc/X

va0 = Fa0/Ca0
vb0 = va0
v0 = va0 + vb0

V = v0*X/(k*(1-X))

//CSTR - Paralelo (2 Tanques)

Vp = 800

tau = (Vp/(v0/2))/7.48 //Converção de gal para ft^3 foi realizada

Xp = round(100*((tau*k)/(1+(tau*k))))/100

//CSTR - Série

taus = (Vp/v0)/7.48 //Converção de gal para ft^3 foi realizada

Xs = round(100*((taus*k)/(1+(taus*k))))/100

Xs_2 = round(100*((Xs + taus*k)/(1 + taus*k)))/100

printf('V = %g\n\n',V)
printf('Paralelo\n')
printf('X = %g\n\n',Xp)
printf('Série\n')
printf('X_1 = %g\n',Xs)
printf('X_2 = %g\n\n',Xs_2)
