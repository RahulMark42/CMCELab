
%To Find Friction Factor
function y = FrictionFactor(f)

Re = 10000;
rough = 0.001;
y = 1/sqrt(f) + 2*log10((rough/3.7) + (2.51/Re)*(1/sqrt(f)));

end