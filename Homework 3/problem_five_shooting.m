function problem5
clc
clear all
close all


D = 10;
L = 1;
v = 0.1;
k = 5e-3;

for i = 1:10
    guess = random('normal',-0.9,0.05);   
    zspan = [0 1]; 
    initial = [1; guess];
    options = odeset('RelTol',1e-5,'AbsTol',[1e-5 1e-5]);
    [z, c] = ode45(@dudz,zspan,initial,options);
    
    result(i,1) = guess;
    result(i,2) = c(end,1);
    
    hold on
    plot(z, c(:,1),'bx');
    grid on
end


function f = dudz(z, u)
       f = zeros(2,1); 
       f(1) = u(2);
       f(2) = (k/D)*u(1) - (v/D)*u(2); 
end
figure
hold on 
plot(result(:,1),result(:,2),'bx')
end
