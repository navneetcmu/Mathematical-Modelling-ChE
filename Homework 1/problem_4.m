%HW1-Prb4
%Navneet Singh (nsingh1@andrew.cmu.edu) 

clc       %clear screen
clear all %clearing all stored variables
close all %close previous plots

k1 = 3.0/60.0;   %min-1
k2 = 0.1;        %min-1
tau = 0:0.1:900; %initiualizing tau
a = zeros(3);    %initializing a matrix
co = [5; 0; 0];  %concentration of feed stream, assuming only 'a' is present in feed stream.  

for i = 1:length(tau) 
    %defining matrix A
    a = [1+k1*tau(i), 0, 0; -k1*tau(i), 1+k2*tau(i), 0; 0, -k2*tau(i), 1];
    rxn = a\co;  %calculating concentration in the reactor. 
    Ca(1,i) = rxn(1);
    Cb(1,i) = rxn(2);
    Cc(1,i) = rxn(3);
end

%Plotting
hold on
plot(tau,Ca,'red')
plot(tau,Cb,'blue')
plot(tau,Cc,'green')
legend('Ca','Cb','Cc')
xlabel('Residence time (min)','fontsize',15,'fontname','times new roman')
ylabel('Reactor concentrations (mol/lt)','fontsize',15,'fontname','times new roman')
title('4a : Reactor conc vs residence time','fontsize',16,'fontname','times new roman')

%Part B
t  = 30;          %seconds, residence time
k_1   = 0.5/60;   %seconds^-1
k_2 = 0:0.01:1;   %seconds^-1 , intializing range of k2
Ca_in = 5;        %mol/l 

k2_1 = k_2(1,:)./k_1;  %defining k2/k1 

%writing concentration in terms of k1 and k2 and calculating
c(1,:) = Ca_in * ((k_1*t)/(1+k_1*t)) * ((k_2.*t)./(1+k_2.*t)); 

figure
plot(k2_1,c); 
xlabel('k2/k1','fontsize',15,'fontname','times new roman')
ylabel('Conc. of C (mol/l)','fontsize',15,'fontname','times new roman')
title('4b : Plot of Cc vs K2/K1','fontsize',16,'fontname','times new roman') 





