a12 = 0.347315634;
a21 = 0.195517067;

x = [0, 0.0895, 0.1981, 0.3193, 0.4232, 0.5119, 0.6096, 0.7135, 0.7934, 0.9102, 1];
y = [0, 0.2716, 0.4565, 0.5934, 0.6815, 0.744, 0.805, 0.8639, 0.9048, 0.959, 1];

Pgiven = [12.3, 15.51, 18.61, 21.63, 24.01, 25.92, 27.96, 30.12, 31.75, 34.15 ,36.09];  
lngamma1 =  ((1-x).^2).*(a12 + 2.*(a21 - a12).*x);
lngamma2 = (x.^2).*(a21 + 2.*(a12 - a21).*(1 - x));
Pcalc = x.*36.09.*(exp(lngamma1)) + (1 - x).*12.3.*(exp(lngamma2));

%Antoine Eqn ln Pvap = A + B/(C - T)
Pvaptol = 12.30; %P2sat
Pvapmek = 36.09; %P1sat

%Constants in Antoine's equation
Amek = 14.1334;
Bmek = 2838.24;
Cmek = 218.690;

Atol = 13.9320;
Btol = 3056.96;
Ctol = 217.625;

%Step 1
Ttol = -(Btol/(log(Pvaptol) - Atol)) + Ctol;
Tmek = -(Bmek/(log(Pvapmek) - Amek)) + Cmek;
5
Tguess = (Ttol + Tmek)/2;

%Step 2
Pvaptol1 = exp(Atol + (Btol/(Ctol - Tguess)));
Pvapmek1 = exp(Amek + (Bmek/(Cmek - Tguess)));

gamma1 = exp(lngamma1);
gamma2 = exp(lngamma2);

%Stem 3 and 4
Pi = (x.*gamma1.*Pvapmek1 + (1 - x).*gamma2.*Pvaptol1);

Ptotal = sum(Pi);

y1cal = x.*gamma1.*Pvapmek./Ptotal;
y2cal = (1 - x).*gamma2.*Pvaptol./Ptotal;

%Step 5
sum(y1cal + y2cal);

%Newton Raphson Method
Told = Tguess
%func = (x.*(gamma1).*exp(Amek + (Bmek)./(Cmek + Tfind)) + (1 - x).*gamma2.*exp(Atol + (Btol)./(Ctol + Tfind)))./Ptotal - 1;
TNew1 = zeros(1, 11);
for j = 1 : 11
    for i = 1 : 1000000
         f = (((1 - x(j)).*(gamma1).*exp(Amek + (Bmek)./(Cmek - Told)) + (x(j)).*gamma2.*exp(Atol + (Btol)./(Ctol - Told)))./Ptotal) - 1;
         df =((1 - x(j)).*(gamma1).*(Bmek./(Cmek - Told).^2).*exp(Amek + (Bmek)./(Cmek - Told)) + (x(j)).*gamma2.*(Btol./(Ctol - Told).^2).*exp(Atol + (Btol)./(Ctol - Told)))/Ptotal ;
         TNew = Told - f/df;
         if(abs(TNew - Told) < 10^-4)
             break;
         end
         Told = TNew;
    end
    TNew1(j) = TNew;
end


Pvaptolnew = exp(Atol + (Btol./(Ctol - TNew1)))
Pvapmeknew = exp(Amek + (Bmek./(Cmek - TNew1)))


hold on
grid on
ax = gca
ax.XAxisLocation = "origin";
ax.YAxisLocation = "origin";


plot(x, TNew1)
plot(y , TNew1)



