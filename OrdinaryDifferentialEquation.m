%ordinary differential equations

y = 1;
t = 0;
dt = 0.1;

for i = 1 : 30
    y(i + 1) = y(i) - dt*y(i);
    t(i + 1) = t(i) + dt;
end

[t1, y1] = ode23('myfun', [0 3], 1);

ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
hold on;
grid on;
plot(t1, y1, t, y);
legend('ODE solver solution','Numerical solution')
    