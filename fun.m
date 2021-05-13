function xdot = fun(t, x)
    xdot(1) = x(2);
    xdot(2) = 20 - 7*x(2) - 10*x(1);
    xdot = xdot'
end