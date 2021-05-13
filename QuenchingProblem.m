%Quenching problem to find out steady state temperature 
%dependent variables Tl, Ts
%independent variables t

%steel ball properties
vs = 1000; %cc
ds = 1.25; %g/cc
cps = 0.8; %cal/g/C
ts = 100; %C

%vessel liquid properties
vl = 5000; %cc
tl = 20; %C
cpl = 1; %cal/g/C
dl = 1; %g/cc

%heat transfer rate
ua = 1000; %cal/s/C

A = ua/(vs*ds*cps);
B = ua/(vl*dl*cpl);

%writing equations in vector form
X = [-A A; B -B];
%dT = X*T;

[eigenVec, eigenVal] = eig(X);
eigenVal = diag(eigenVal);

%equations for temp is of form T = c1*e^ev1*t + c2*e^ev2*t
%we need to solve for c1 and c2

Ti = [ts; tl];
c = inv(eigenVec)*Ti;

t = 0 : 100;
T = c(1)*eigenVec(:, 1)*exp(eigenVal(1,1) * t) + c(2)*eigenVec(:, 2)*exp(eigenVal(2, 1) * t);

%plotting the graph
hold on
grid on
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
plot(t, T);
xlabel('Time');
ylabel('Temperature');
title('Plot of Temperature profiles')












