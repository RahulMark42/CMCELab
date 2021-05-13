%ode solver method
[t,x] = ode45('fun',[0 5],[5, 3])

%numerical method
x1(1) = 5;
t1(1) = 0;
dt = 0.1;
t1(2) = t1(1) + dt;
dx = 3;
x1(2) = x1(1) + dt*(dx);

for i = 2 : 50
    x1(i + 1) = (20 - (x(i)*((-2/dt^2) - (7/dt) + 10)) - (x(i - 1)/dt^2))/((1/dt^2) + (7/dt));
    t1(i + 1) = t1(i) + dt;
end

hold on
grid on
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
plot(t, x(:,1))
plot(t1, x1)
legend('ODE solver solution', 'Numerical method solution')

