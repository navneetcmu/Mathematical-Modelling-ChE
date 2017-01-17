%HW1-Prb7(a) 
%Navneet Singh(nsingh1@andrew.cmu.edu)

clc       %clear screen
clear all % clearing all stored variables
close all %close previous plots 

% Initializing given variables
v  = 18*10^-3;   %m^3
e  = 7550;       %K
q  = 60*10^-6;   %m^3/sec
cp = 4000;       %J/Kg.K
ko = 4.5*10^6;   %sec-1
cf = 3;          %kmol/m^3
del_h = -8*10^8; %J/Kmol
ro = 1000;       %kg/m^3

n  = 10000;      %dividing temeprature range into 'n' parts

tf = linspace(298,450,n); % tf ranges from room temperature to 450K.

k(1,:) = ko*exp(-e./tf(1,:));  % calculating k at different temperatures between 298K and 450K. 

c(1,:) = (q*cf)./(q + k(1,:).*v); %calculating value of c (reactor concentration) at different temperatures. 

t(1,:) = tf(1,:) - ((del_h*v)/(ro*cp*q)) .*k(1,:) .*  c(1,:); %calculating reactor temperature at different feed temperatures.  

c_d = c/cf;  %making reactor concentration dimensionless
t_d = t./tf; %making reactor temperature dimensionless 

figure
hold on 
%plotting required variables. 
plot(tf,c_d,'b')  
plot(tf,t_d,'r') 
ylabel('Reactor Conc. and Temp.(dimensionless)','fontsize',15,'fontname','times new roman')
xlabel('Feed Temperature(K)','fontsize',15,'fontname','times new roman')
legend('Concentration','Temperature')
xlim([295,460]); %setting appropriate x-axis limits. 


