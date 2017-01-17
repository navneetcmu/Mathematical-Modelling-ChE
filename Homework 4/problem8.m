function problem8
%Navneet Singh (nsingh1@andrew.cmu.edu)
%HW-4 Prb 8

clc       %clear screen
clear all %clearing all stored variables
close all %close previous plots

%making initial guess 
guess = 100;

%using fminunc for unconstrained optimization problem
options = optimoptions(@fminunc, 'Display', 'off','Algorithm', 'quasi-newton');
solfunc = fminunc(@obj, guess,options); 

fprintf('\nDiameter of pipe for minimum overall cost = %1.2f inches',solfunc)

%defining our objective function 
function f = obj(x)
       f = 200*x + (2e7)/x;
end
end

