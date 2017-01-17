%HW-3 Prb-8
%Navneet Singh (nsingh1@andrew.cmu.edu)
function problem8

%The given problem is non-linear BVP. Sp we can't solve it by making system
% as Ax =b. We will have non-linear algebraic system which we will solve
% using fsolve. After disctretizing the given differential equation, we get

%%
% 
% $$ \frac{\theta_{i+1}-2\theta_i+\theta_{i-1}}{h^2} + B\phi^2(1 - \frac{\theta_i}{B})exp(\frac{\gamma \theta_i}{\gamma+\theta_i}) $$
% 

%Thus we will have 'n' nonlinear equation which we will solve using fsolve.
%

clc %clearning screen
clear all %clearing previous stored variables
close all %closing previous plots

%Given data
B = 0.6;
sy = 0.25;
gam = 30; 

%number of equations
n=250; 
%guess for solving with fsolve
guess = (linspace(0,1,n))';
z = linspace(0,1,n);
%distance between two consecutive mesh points
h = 1/(n-1); 

%using fsolve to solve system of non=linear equations
options = optimset('display','off');
sol = fsolve(@eqn, guess, options);

%descrining system of non-linear equations
function f = eqn(x)
         f = zeros(n,1);
         f(1) = (x(2) - x(1))/h - 0; %Neumann BC
         f(n)  = x(n)-0; %Dirichlet BC
         for i =2:n-1
             f(i) = x(i+1) - 2*x(i) + x(i-1) + h^2 * B * sy * (1 - x(i)/B)*exp( gam*x(i)/(gam + x(i)) );
         end
end
%plotting 
plot(z, sol)
title('Plot of \theta(z)')
xlabel('z')
ylabel('\theta')
end

            
             