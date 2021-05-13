clear
clc

for i = 1:11
    P = [12.3000 15.5100 18.6100 21.6300 24.0100 25.9200 27.9600 30.1200 31.7500 34.1500 36.0900]';
    x_1 = [0 0.0895 0.1981 0.3193 0.4232 0.5119 0.6096 0.7135 0.7934 0.9102 1.0000]';
    x_2 = [ones(1,11)' - x_1];
    y_1 = [0 0.2716 0.4565 0.5934 0.6815 0.7440 0.8050 0.8639 0.9048 0.9590 1.0000]';
    A_12 = 0.357980373;
    A_21 = 0.211348338;
    P_1sat = 36.09;
    P_2sat = 12.3;
    lngamma_1 = [(x_2.^2).*(A_12 + 2*(A_21 - A_12).*x_1)];
    lngamma_2 = [(x_1.^2).*(A_21 + 2*(A_12 - A_21).*x_2)];
    gamma_1 = [exp(lngamma_1)];
    gamma_2 = [exp(lngamma_2)];
%antoin's constants
    a1 = 14.1334;
    b1 = 2838.24;
    c1 = 218.69;
    a2 = 13.932;
    b2 = 3056.96;
    c2 = 217.625;

    T_1 = (b1/(a1 - log(P_1sat)))-c1;
    T_2 = (b2/(a2 - log(P_2sat)))-c2;
        
    T_guess = x_1.*T_1 + (1-x_1).*T_2;
    
    P1_vap = exp(a1 - (b1./(T_guess + c1)));
    P2_vap = exp(a2 - (b2./(T_guess + c2)));
    P_cal = [x_1.*gamma_1.*P1_vap + x_2.*gamma_2.*P2_vap];
    error_square = (P - P_cal).^2;
    y1_cal = [(x_1.*gamma_1.*P1_vap)./P_cal];
    y2_cal = [(x_2.*gamma_2.*P2_vap)./P_cal];
    
    for i = 1:11
        if (y1_cal + y1_cal) ==1
            break
        else
            f  = y1_cal + y2_cal - ones(1,11)';
            f_1 = y1_cal.*(b1./(T_guess + c1).^2) + y2_cal.*(b2./(T_guess + c2).^2);
            T_guess = T_guess - f./(f_1);
        end
    end
end
sigma_y = (y1_cal+y2_cal);
bubble_pressure = table(P,x_1,y_1,lngamma_1,lngamma_2,gamma_1,gamma_2,T_guess,P_cal,error_square,y1_cal,y2_cal,sigma_y)
total_error = sum(error_square)
T = ones(1,11)'*50;

ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
plot(x_1,T_guess,'o-',y1_cal,T_guess,'x-')
legend("x vs T guess", "y cal vs T guess")