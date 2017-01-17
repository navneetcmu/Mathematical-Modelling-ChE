%HW1-Prb6
%Navneet Singh(nsingh1@andrew.cmu.edu)

% lnK = lnKo - (1/RT)*Ea , here we have two unknowns Ko and Ea. 
%We have been given 5 values of K and T. So we have 2 unknowns and 
% 5 equations. So this a problem of overdeterminant system. This can be
% solved by least square systems. After conevrting equation to Ax = b form
% x = [inv(A'A)*A']*b. 

clc       %clear screen
clear all %clearing all stored variables
close all %close previous plots

%Initializing given variables
R = 8.314;                                     %J/K
T = [430, 450, 470, 480, 490]';                %K
k = [0.0026, 0.0118, 0.0460, 0.0873, 0.1800]'; %s-1

b = log(k);  % Generating vector b. we have taken natural log on both sides to model this as a linear problem. 

%Initializing Matrix A
A = zeros(5,2);
A(:,1) = 1.0;          %first column of matrix A
A(:,2) = (-1)./(R.*T); %second column of matrix A


x = (inv(A'*A)*A')*b ; %solving unknowns using pseudoinverse of A.

ko = exp(x(1));        % calculating value pre-exponential factor, ko. 
Ea = x(2);             % calculating activation energy, Ea.
fprintf('Pre exponential factor, Ko = %d sec^-1 \n',ko)
fprintf('Activation Energy, Ea = %d J \n',Ea)

ls = x(1) - Ea./(R.*T); %calculating least square fit of data. 

hold on 
plot(T,b,'bx')  %plotting data points. 
plot(T,ls,'g-') %plotting least square fit. 
legend('data points','least square fit')
xlabel('Temperature (K)','fontsize',15,'fontname','times new roman')
ylabel('ln k','fontsize',15,'fontname','times new roman')



 
