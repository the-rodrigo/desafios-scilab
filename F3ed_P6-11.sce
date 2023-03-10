clc; clear

//Problema P6.11

k1a = 0.7
k2d = 0.3
k3e = 0.2
Ca = 0.1
Cb = 0.93
Cc = 0.51
Cd = 0.049
v0 = 100
Ca0 = 3

r1a = -k1a*Ca
r2d = k2d*(Cc^2)*Ca
r3e = k3e*Cd*Cc

//Letra A

r2a = -r2d/3
r3a = 0*r3e

printf('Letra A\n')
printf('r1a = %g\n',r1a)
printf('r2a = %g\n',r2a)
printf('r3a = %g\n\n',r3a)

//Letra B

r1b = -r1a/3
r2b = 0*r2d
r3b = 0*r3e

printf('Letra B\n')
printf('r1b = %g\n',r1b)
printf('r2b = %g\n',r2b)
printf('r3b = %g\n\n',r3b)

//Letra C

r1c = r1b
r2c = (-2/3)*r2d
r3c = -r3e

printf('Letra C\n')
printf('r1c = %g\n',r1c)
printf('r2c = %g\n',r2c)
printf('r3c = %g\n\n',r3c)

//Letra D

r1d = 0*r1a
r3d = (-4/3)*r3e

printf('Letra D\n')
printf('r1d = %g\n',r1d)
printf('r2d = %g\n',r2d)
printf('r3d = %g\n\n',r3d)

//Letra E

r1e = 0*r1a
r2e = 0*r2d

printf('Letra E\n')
printf('r1e = %g\n',r1e)
printf('r2e = %g\n',r2e)
printf('r3e = %g\n\n',r3e)

//Letra F

ra = r1a + r2a + r3a
rb = r1b + r2b + r3b
rc = r1c + r2c + r3c
rd = r1d + r2d + r3d
re = r1e + r2e + r3e

printf('Letra F\n')
printf('ra = %g\n',ra)
printf('rb = %g\n',rb)
printf('rc = %g\n',rc)
printf('rd = %g\n',rd)
printf('re = %g\n\n',re)

//Letra G

V = round((v0*(Ca0-Ca)/(-ra))/100)*100

printf('Letra G\n')
printf('V = %g mol/dm^3\n\n',V)

//Letra H

C = Ca0 - V*(-ra)/v0

printf('Letra H\n')
printf('C = %g dm^3\n',C)
