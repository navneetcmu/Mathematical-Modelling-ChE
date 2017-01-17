%HW2-Prb3
%Navneet Singh(nsingh1@andrew.cmu.edu) 

function Problem_3
clc       %clear screen
clear all %clearing all stored variables
close all %close previous plots


%Equation is a non-linear algebraic one which can be solved with fzero(). 

%Defining the function to be solved. 
function F = height(h)
F = 5 - sqrt(2*9.8*h) * tanh(0.3 * sqrt(2*9.8*h));
end

%Making an initial guess
guess = 4; 

%using fzero function to calculate height. 
[sol,fval,exitflag,output] = fzero(@height, guess);

fprintf('Height of water needed = %f mts \n',sol);

% Initial guess can be chnaged to check if multiple solution exists.
% I checked with different values of guess and got the same values always
% Though with some values of guess, equation was not solvable which could 
% be checked by seeing the value of exitflag. 
end

