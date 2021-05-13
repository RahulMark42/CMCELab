%ode solver method
%given equation is d2y/dt2 = -y 
%dy/dt = 3, y = 2 at t = 0
[t,y] = ode45('fun2',[0 10],[2, 3]);

hold on
grid on
plot(t, y(:, 1))

%Numerical solution finite difference method
t1(1) = 0;
dt = 0.2;
t1(2) = t1(1) + dt;
y1(1) = 2;
dy = 3;
y1(2) = y1(1) + dy*(dt);

for i = 2 : 50
    y1(i + 1) = -1*y1(i)*dt^2 + 2*y1(i) - y1(i - 1);
    t1(i + 1) = t1(i) + dt;
end

ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
plot(t1, y1);
legend('ODE Solver solution', 'Numerical method solution')