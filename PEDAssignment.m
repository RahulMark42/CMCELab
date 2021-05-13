%Feed consists of Ethane, propane, isobutane, n-pentane.

F = 20;
z = 0.25;

k = [4, 1, 0.5, 0.2];

%L = sigma(Fzi/(1+((V/L)*ki)))

%assumption p = (L/V) = 2.5

p = 2.5;

%applying the formula
L = sum((F*z)./(1 + k/p))

V = sum((F*z)./(p./k + 1))

%arrived value for (L/V)
LV = L/V

%difference between assumed and arrived values.
error = abs(LV - p) 

%F = L + V from this
%V = F/(1 + p)
%L = p*V

x1 = (20*0.25)/(L + 4*V);
x2 = (20*0.25)/(L + V);
x3 = (20*0.25)/(L + 0.5*V);
x4 = (20*0.25)/(L + 0.2*V);

xi = [x1, x2, x3, x4]

%checking liqiud mole fraction sum
sumxi = sum(xi)

y1 = 4*x1;
y2 = x2;
y3 = 0.5*x3;
y4 = 0.2*x4;

yi = [y1, y2, y3, y4]

%checking vapour mole fraction sum
sumyi = sum(yi)
