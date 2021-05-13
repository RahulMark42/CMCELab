%Method of least squares

x = [1.5, 3, 4.5, 6, 8, 10.5];
y = [9, 28, 50, 90, 140, 250];

%sigmaxi2
sigmaxi2 = 0;
for i = 1 : length(x)
    sigmaxi2 = sigmaxi2 + x(i)^2;
end

%sigmaxi3
sigmaxi3 = 0;
for i = 1 : length(x)
    sigmaxi3 = sigmaxi3 + x(i)^3;
end

%sigmaxi4
sigmaxi4 = 0;
for i = 1 : length(x)
    sigmaxi4 = sigmaxi4 + x(i)^4;
end

%sigmaxiyi
sigmaxiyi = 0;
for i = 1 : length(x)
    sigmaxiyi = sigmaxiyi + (x(i)*y(i));
end

%sigmaxi2yi
sigmaxi2yi = 0;
for i = 1 : length(x)
    sigmaxi2yi = sigmaxi2yi + ((x(i)^2)*y(i));
end

%sigmaxi
sigmaxi = sum(x);

%sigmayi
sigmayi = sum(y);

%n
n = length(x);

%forming matrix A
A(1,1) = n;
A(1,2) = sigmaxi;
A(1,3) = sigmaxi2;
A(2,1) = sigmaxi;
A(2,2) = sigmaxi2;
A(2,3) = sigmaxi3;
A(3,1) = sigmaxi2;
A(3,2) = sigmaxi3;
A(3,3) = sigmaxi4;

%forming matrix B
B(1,1) = sigmayi;
B(2,1) = sigmaxiyi;
B(3,1) = sigmaxi2yi;

%result
result = inv(A) * B;

%display
a = result(1,1)
b = result(2,1)
c = result(3,1)

%plot graph of function
xreal = 0:0.01:12;
yreal = c*(xreal.^2) + b*(xreal) + a;

hold on
grid on
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
plot(x, y, 'o');
plot(xreal, yreal);



