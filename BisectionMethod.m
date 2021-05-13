%Bisection Method

%function is 2 - x + log(x)

a = 3;
b = 5;
error = abs(a - b);
fa = 2 - a + log(a);
fb = 2 - b + log(b);

%plotting the curve
hold on
grid on
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';

x = 0:0.0001:20;
y = 2 - x + log(x);

plot(x, y);

while(error > 10^-4)
    c = (a + b)/2;
    fc = 2 - c + log(c);
    root = c;
    if(fb * fc < 0)
        a = c;
    else
        b = c;
    end
    error = abs(a - b);
end

root


