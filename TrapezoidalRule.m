%trapezoidal rule

x = 0:5:40;
y = [0, 6.67, 17.33, 42.67, 37.33, 30.1, 29.31, 28.74, 27.12];

range1 = 0;
range2 = 35;

integral = (y(1) + y(8) + 2*(sum(y(2:7))))*(range2 - range1)/8