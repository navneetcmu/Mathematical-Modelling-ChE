%HW2-Prb9
%Navneet Singh(nsingh1@andrew.cmu.edu) 
function problem_9
clc       %clear screen
clear all % clearing all stored variables
close all %close previous plots

k = [1, 1, 0.5, 1]; %1/min
tspan = [0 30]; %min, range of integration 
initial = [10; 0; 0; 0]; %M, initial values of concentrations

%We have a system of 4 ODES and it can be solve using ODE45()
%Here we have called ODE45 function to solve 
[t,c] = ode45(@conc, tspan, initial);  

%Defining conc function which gives 4 ODEs as a column vector
function dcdt = conc(t,c)
    %initializing conc vector
    dcdt = zeros(4,1); 
    
    %Four ODEs
    dcdt(1) = - k(1) * c(1) ;
    dcdt(2) = k(1)*c(1) - (k(2)+k(4))*c(2) + k(3)*c(3);
    dcdt(3) = k(2)*c(2) - k(3)*c(3);
    dcdt(4) = k(4)*c(2);        
end
%Plotting Concentrations vs Time
hold on
subplot(2,2,1);
plot(t,c(:,1),'b');
xlabel('Time (min)','fontsize',15,'fontname','times new roman')
ylabel('Conc of A (M)','fontsize',15,'fontname','times new roman')

subplot(2,2,2);
plot(t,c(:,2),'g');
xlabel('Time (min)','fontsize',15,'fontname','times new roman')
ylabel('Conc of B (M)','fontsize',15,'fontname','times new roman')


subplot(2,2,3);
plot(t,c(:,3),'r');
xlabel('Time (min)','fontsize',15,'fontname','times new roman')
ylabel('Conc of C (M)','fontsize',15,'fontname','times new roman')


subplot(2,2,4);
plot(t,c(:,4),'c');
xlabel('Time (min)','fontsize',15,'fontname','times new roman')
ylabel('Conc of D (M)','fontsize',15,'fontname','times new roman')

end