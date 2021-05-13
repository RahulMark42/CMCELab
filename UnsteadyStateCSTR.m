%Unsteady State Balance Equations

%Mole Balance of A : dCa/dt = (((Fo*Cao) - (F*Ca))/V) - (alpha*(e^(-E/RT))*Ca)
%Energy Balance in tank :dT/dt = (((Fo*To)-(F*T))/V) - ((U*A*(T - Tj))/(V*rho*Cp)) - (lambda*alpha*(e^(-E/RT))*Ca)/(rho*Cp)
%Enerby Balane for cooling fluid: dTj/dt = (Fj(Tjo - Tj))/Vj + (U*A*(T - Tj))/(Vj*rhoj*Cpj)

%linearized form of Ca*exp(-E/RT) = Cao*exp(-1*E/(R*To)) + (E/(R*To^2))*exp(-1*E/(R*To)*Ca*(T-To)) + exp(-1*E/(R*T))*(Ca - Cao)

%Given values are

Fo = 40; %ft^3/h
F = 40; %ft^3/h
Fj = 49.9; %ft^3/h
Cao = 0.55; %lb-mol/ft^3
Cp = 0.75; %btu/lbm. R
Cpj = 1.0; %btu/lbm. R
To = 530; %R
Tjo = 530; %R
alpha = 7.08 * 10^10; %h^-1
rho = 50; %lbm/ft^3
rhoj = 62.3; %lbm/ft^3
R = 1.9872; %btu/lb-mol.R
U = 150; %btu/h.ft^2.R
A = 250; %ft^2
V = 48; %ft^3
Vj = 12; %ft^3
lambda = -30000; %btu/lb-mol
E = 30000; %btu/lb-mol

%Simplifying constants
A1 = -1*F/V - alpha*(exp(-1*E/(R*To)));
B1 = -1*alpha*E*Cao/(R*(To^2));
C1 = (Fo*Cao/V) + (alpha*E*Cao)/(R*To);
G1 = (U*A)/(V*rho*Cp);
H1 = Fjo*Tjo/Vj;
I1 = Fj/Vj;
J1 = (U*A)/(Vj*rhoj*Cpj);















