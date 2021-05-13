%Determine fugacity from vanderwalls equation of state

P = 1.4*10^6; %Pa
T = 310; %K
R = 8.314; %m3.Pa/K.mol
a = 0.3658; %Pa.m^6/mole^2
b = 4.286 * 10^-5;

B = (b*P)/(R*T);
A = (a*P)/(R*T)^2;

%y = z^3 - (1+B)*z^2 + A*z - AB;

p = [1 -(1+B) A -A*B ];

Z = max(roots(p))

fugacitycoeff = exp((-log(1-(B/Z))) - (A/Z) - log(Z) + (Z - 1))

fugacity = P*fugacitycoeff
