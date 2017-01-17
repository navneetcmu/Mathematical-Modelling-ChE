%HW2-Prb5
%Navneet Singh(nsingh1@andrew.cmu.edu) 
function Problem_5
clc
clear all 
close all

% Initializing given variables
v  = 18*10^-3;   %m^3
e  = 7550;       %K
q  = 60*10^-6;   %m^3/sec
cp = 4000;       %J/Kg.K
ko = 4.5*10^6;   %sec-1
cf = 3;          %kmol/m^3
del_h = -8*10^7; %J/Kmol
ro = 1000;       %kg/m^3

n  = 1000;      %dividing temeprature range into 'n' parts
tf = linspace(298,450,n); % tf ranges from room temperature to 450K.

%running loop for all feed temperatures 
for i = 1:length(tf)
    x0 = [cf  tf(i)];
    options = optimset('display','off');
    %calling fsolve to solve equations
    [x(:,i),val,f] = fsolve(@eqn,x0,options); 
     
end
 %Defining equation
function f = eqn(x)
    k = ko * exp(-e/x(2));  % k as a function of reactor temp
    f(1) = q * (cf - x(1)) - k * x(1) * v; %concentration equation
    f(2) = tf(i) - x(2) - ((del_h*v)/(ro*cp*q)) * k * x(1);  %temperature equation
end 


figure
hold on 
%plotting required variables.  
plot(tf,x(1,:)/cf,'b')
plot(tf, x(2,:)./tf , 'r')
ylabel('Reactor Conc. and Temp.(dimensionless)','fontsize',15,'fontname','times new roman')
xlabel('Feed Temperature(K)','fontsize',15,'fontname','times new roman')
legend('Concentration','Temperature')
xlim([295,460]); %setting appropriate x-axis limits. 



end