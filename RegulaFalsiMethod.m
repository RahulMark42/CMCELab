%Regula Falsi Method
%function = x^2 - 5*x + 4
a = 0;
b = 2;

error = abs(a - b);

fa = a^2 - 5*a + 4;
fb = b^2 - 5*b + 4;

%plot graph
hold on
grid on
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';

x = -5:0.01:5;
y = x.^2 - 5*x + 4;
plot(x, y)


while(error > 10^-4)
    c = a - (fa*(b - a)/(fb - fa));
    fc = c^2 - 5*c + 4;
    root = c;
    if(fb * fc < 0)
        a = c;
    else
        b = c;
    end
    error = abs(a - b);
end

root


