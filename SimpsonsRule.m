%simpsons 1/3rd rule
%integral(dx/(y - x)) 0.3 < x < 0.7 and y = ax/(1 + x(a - 1)) a = 10

%input values for step
a = 10;
i = input("Select an option for step: \n1. 0.1\n2. 0.05\n3. 0.025\n");
h = [0.1, 0.05, 0.025];
step = h(i);

if(i == 1 || i == 2 || i == 3)
   
    %Calculating the integral
    x = 0.3:step:0.7;
    y = (a*x)./((1 + (a - 1)*x));
    y1 = 1./(y - x);
    l = length(x);
    
    integral = 0.0;
    j = 1;
    
    while(j < l-1)
        integral = integral + (step/3)*(y1(j) + 4*y1(j + 1) + y1(j + 2));
        j = j  + 2;
    end
    
    integral
    
    %plotting the graph
    hold on
    grid on
    ax = gca;
    ax.XAxisLocation = 'origin';
    ax.YAxisLocation = 'origin';
    title('1/(y - x) vs x');
    xlabel('x');
    ylabel('1/(y - x)');
    f = (1./(y - x));
    r = 0:1;
    p = 0:1;
    plot(r, p, 'w');
    plot(x, f, 'b'); 
    plot(x, f, 'o');
    
else
    disp("Invalid input");
end
