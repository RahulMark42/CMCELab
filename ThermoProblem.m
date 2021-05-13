a12 = 0.347315634;
a21 = 0.195517067;

x = [0, 0.0895, 0.1981, 0.3193, 0.4232, 0.5119, 0.6096, 0.7135, 0.7934, 0.9102, 1];
y = [0, 0.2716, 0.4565, 0.5934, 0.6815, 0.744, 0.805, 0.8639, 0.9048, 0.959, 1];

Pgiven = [12.3, 15.51, 18.61, 21.63, 24.01, 25.92, 27.96, 30.12, 31.75, 34.15 ,36.09];  
lngamma1 =  ((1-x).^2).*(a12 + 2.*(a21 - a12).*x);
lngamma2 = (x.^2).*(a21 + 2.*(a12 - a21).*(1 - x));
Pcalc = x.*36.09.*(exp(lngamma1)) + (1 - x).*12.3.*(exp(lngamma2));

hold on
grid on
ax = gca
ax.XAxisLocation = "origin";
ax.YAxisLocation = "origin";

plot(x, Pgiven, 'r');
plot(y, Pgiven, 'b');
plot(x, Pcalc, 'g');
plot(y, Pcalc, 'y');









