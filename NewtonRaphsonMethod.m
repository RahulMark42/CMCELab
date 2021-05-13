%Newton Raphson Method

x0 = 1.1;
xOld = x0;

%plot graph of function 2 - x + log(x)
hold on
grid on
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';

x = 0:0.000001:20;
y = 2 - x + log(x);

plot(x, y)

%entering iterations
for i = 1 : 50
    f = 2 - xOld + log(xOld);
    df = -1 + (1/xOld);
    xNew = xOld - f/df;
    if(abs(xNew - xOld) < 10^-4)
        break;
    end
    xOld = xNew;
end

xNew