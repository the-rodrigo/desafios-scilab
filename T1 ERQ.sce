clc; clear;
exec('minquad.sci');

y = [10.37833,6.042244,6.237126,6.269349,6.663291,7.339442]
x = [0.43589,0.984886,1.378405,2.012461,2.738613,3.456877]

[ang,line,r2] = minquad(x,y)

disp(ang)
disp(line)
disp(r2)

