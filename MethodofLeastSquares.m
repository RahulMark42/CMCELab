%Method of least squares

x = [1, 2, 3, 4, 5, 6, 7];
y = [0.5, 2.5, 2, 4, 3.5, 6, 5.5];

%sigmaxi2
sigmaxi2 = 0;
for i = 1 : length(x)
    sigmaxi2 = sigmaxi2 + x(i)^2;
end

%sigmaxiyi
sigmaxiyi = 0;
for i = 1 : length(x)
    sigmaxiyi = sigmaxiyi + (x(i)*y(i));
end

%sigmaxi
sigmaxi = sum(x);

%sigmayi
sigmayi = sum(y);

%n
n = length(x);

%forming matrix A
A(1,1) = sigmaxi2;
A(1,2) = sigmaxi;
A(2,1) = sigmaxi;
A(2,2) = n;

%forming matrix B
B(1,1) = sigmaxiyi;
B(2,1) = sigmayi;

%result
result = inv(A) * B;

%display
a = result(1,1)
b = result(2,1)

xreal = 0:0.01:10;
yreal = a*xreal + b;

hold on
grid on
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
plot(x, y, 'o')
hold on
plot(xreal, yreal);



