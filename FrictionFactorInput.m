function frictionFactor = FrictionFactorInput(Re, rough)

%given formula 1/sqrt(f) = -2*log((rough/3.7)+(2.51/(Re*sqrt(f))))
%a = rough/3.7 b = 2.51/(Re) y = 1/sqrt(f)
%y = -2*log(a + b*y)
%y + 2*log(a + b*y) =0

frictionFactor = fzero(@(f) (1/sqrt(f)) + 2*log10((rough/3.7) + (2.51/Re)*(1/sqrt(f))), [0.0001,1]);

end