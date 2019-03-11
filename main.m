Dt = 0.01;
h = 0.01;
X = -6.3:h:6.3;
X = X'
U0 = cos(X);
s = shock1(U0,Dt,h);

figure
plot(X,s,X,U0)
