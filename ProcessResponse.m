%process response

%calculating output response from t = 0 to 10
t = 0:0.005:20;
%y = 1/9*(1 - exp(-0.5*t).*cos((sqrt(35)/2) * t) - (exp(-0.5*t) .* sin((sqrt(35)/2) * t))/sqrt(35));

y1 = 1/9 - (exp(-t/2).*(cos((35^(1/2)*t)/2) + (35^(1/2)*sin((35^(1/2)*t)/2))/35))/9;
y1(256)


%plotting the graph
hold on
grid on
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
plot(t, y1)
xlabel('time');
ylabel('output response');

decayRatio = exp((-2*pi*(1/6))/sqrt(1 - (1/6)^2))
overshoot = sqrt(decayRatio)