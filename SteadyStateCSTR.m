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

T = 0:1000;
K = alpha*exp(-E./(R*T));
Ca = (Fo*Cao)./(F + V.*K);
Tj = ((rhoj*Cpj*Fj*Tjo)+(U*A*T))./((rhoj*Cpj*Fj)+(U*A));
fT = (rho*Cp*(Fo*To - F.*T)) - (lambda*V.*K.*Ca) - (U*A.*(T - (((rhoj*Cpj*Fj*Tjo)+(U*A*T))./((rhoj*Cpj*Fj)+(U*A)))));

TSteady(1) = fzero(@TempSolver, 500);
TSteady(2) = fzero(@TempSolver, 600);
TSteady(3) = fzero(@TempSolver, 650);
TSteady

KSteady(1) = alpha*exp(-E./(R*TSteady(1)));
KSteady(2) = alpha*exp(-E./(R*TSteady(2)));
KSteady(3) = alpha*exp(-E./(R*TSteady(3)));

CaSteady(1) = (Fo*Cao)./(F + V.*KSteady(1));
CaSteady(2) = (Fo*Cao)./(F + V.*KSteady(2));
CaSteady(3) = (Fo*Cao)./(F + V.*KSteady(3));

CaSteady

TjSteady(1) = ((rhoj*Cpj*Fj*Tjo)+(U*A*TSteady(1)))./((rhoj*Cpj*Fj)+(U*A));
TjSteady(2) = ((rhoj*Cpj*Fj*Tjo)+(U*A*TSteady(2)))./((rhoj*Cpj*Fj)+(U*A));
TjSteady(3) = ((rhoj*Cpj*Fj*Tjo)+(U*A*TSteady(3)))./((rhoj*Cpj*Fj)+(U*A));

TjSteady

hold on
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
plot(T, fT);

