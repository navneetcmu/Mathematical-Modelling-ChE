%HW-3 Prb-3
%Navneet Singh (nsingh1@andrew.cmu.edu) 
function problem3
clc       %clear screen
clear all % clearing all stored variables
close all %close previous plots

%Given data
ro1 = 62; %lbm/ft^3
ro2 = 139; %lbm/ft^3
cp1 = 1; %Btu/lbmF
cp2 = 0.2; %Btu/lbmF
v1 = 0.03; %ft^3
v2 = 0.003; %ft^3
ai = 0.4; %ft^2
a0 = 0.5; %ft^2
h = 8.8;  %Btu/hr/ft^3/F


initial = [150, 150]; %F, initial temperature of container and liquid
tspan = [0, 8]; %time interval of integration 

[t, temp] = ode45(@dTdt, tspan, initial); %solving set of ODEs

%Defining coupled ODEs to be solved
function f = dTdt(t, temp)
     f = zeros(2,1);
     f(1) = (ai*h)/(ro1*cp1*v1) * (temp(2) - temp(1));
     f(2) = (a0*h)/(ro2*cp2*v2) * (32 - temp(2)) + (ai*h)/(ro2*cp2*v2) * (temp(1) - temp(2));
end

%plotting results
hold on
plot(t, temp(:,1))
plot(t, temp(:,2))
legend('liquid', 'container')
xlabel('Time(Hr)')
ylabel('Temperature(F)')
title('Temperature of Liquid and Container vs Time')
end