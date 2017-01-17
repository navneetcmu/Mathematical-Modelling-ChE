%HW-3 Prb-4
%Navneet Singh (nsingh1@andrew.cmu.edu)

%%
% The equation in simplified form is
%
% $$\frac{d^2 \theta}{dr^2} = (\frac{hA}{k(1-\epsilon)})\theta - \frac{1}{r}\frac{d \theta}{dr}$$
%
% Above problem is BVP. First we have converted it to system of FODEs. Then
% we have used shooting method to calculate variotion of $\theta$ with r. 


function problem4
clc       %clear screen
clear all %clearing all stored variables
close all %close previous plots

%Given data
h = 0.001; %cal/cm^2 s
e = 0.36;   %porosity
A = 15;     %cm^-1
k = 0.0034; %cal/cm s

%calculating values of constant to consise equations
a = (h*A)/(k*(1-e));

%radius of the reactor
rspan = [0 1.3];

%Dirichlet BC at r = R
bc = 1; 

%using fsolve to guess initial conditions 
%guess for fsolve
guess = 0.1;

options = optimset('Display','off');
sol = fsolve(@func, guess, options);
fprintf('u1(r=0) = %f\n', sol)

%function used to calculate Initial values
function y = func(guess)
    [r, u] = ode45(@dudt, rspan, [guess, 0]);
    y  = bc - u(end,1); %checking whether u1(r=1) matches our BC.  
end

%using initla values obtained to calculate theta as fucntion of r.    
initial = [sol, 0]; 
[r, u] = ode45(@dudt, rspan, initial);

%The second order ODE converted to two FODEs. 
function f = dudt(r, u)
     f = zeros(2,1);
     f(1) = u(2);
     if r == 0 %as equation contain 1/r it will get undefined at r=0. 
         f(2) = a*u(1);
     else
         f(2) = a*u(1) - (1/r)*u(2); 
     end
end
%plotting
plot(r, u(:,1))
title('\theta vs radius of the reactor')
xlabel('Radius of the reactor (cm)')
ylabel('\theta')
end
