function problem5
%Navneet Singh (nsingh1@andrew.cmu.edu)
%HW-4 Prb 5

clc       %clear screen
clear all %clearing all stored variables
close all %close previous plots

%Lagarange function is L = 5x1^2 + 4x2^2 - lambda(x1 + 4x2 - 5)
%We have differentiated this w.r.t to x1, x2 and lambda to get 3 equations
%these 3 equations were solved using fsolve

%making initial guess
guess = [1,1.5,2];

%using fsolve to solve equations
options = optimset('Display','off');
sol = fsolve(@eqn, guess,options);

%calculating function value
val = 5*sol(1)^2 + 4*sol(2)^2;

fprintf('Minimum value of function = %f',val)
fprintf('\nAt min value,\nValue of X_1 = %f\nValue of X_2 = %f\n',sol(1),sol(2))

%defining system of equations. 
function f = eqn(x)
       f = zeros(3,1);
       f(1) = 10*x(1) - x(3);
       f(2) = 8*x(2) - 4*x(3);
       f(3) = -x(1) - 4*x(2) +5;
end
end
