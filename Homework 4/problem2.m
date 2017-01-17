function problem2

%Navneet Singh (nsingh1@andrew.cmu.edu)
%HW-4 Prb 2

clc       %clear screen
clear all %clearing all stored variables
close all %close previous plots

%Profit = Selling price of products - cost of raw materials
% Profit = Selling price of gasoline+diesel - cost of crude oil 

%To use linprog function, we have formulated our objective
%function such as to minimize negative of profit (which is equivalent to maximizing profit)

%Defining objective function
f = [135/42, 95/42, -4.25, -4.85];

%Defining bounds on quantities of crude and products.
%0 < Light crude < 500,000 barrels
% 0 < Heavy Crude < unlimited
% 0 < Gasoline < 2,000,000 gallons
% 0< Diesel < 3,000,000

lb = [0,0,0,0];
ub = [5e5*42, Inf, 2e6, 3e6];

%Equality constraints
% 1 barrel of light crude yields 0.5 barrels gasoline and 0.4 barrels
% diesel. 1 barrel of heavy crude yield 0.4 barrels gasoline and 0.2
% barrels diesel. 
Aeq = [0.5, 0.4, -1, 0; 
       0.4, 0.2, 0, -1];

beq = [0;
       0];

%Inequality constraints
A = [];
b = [];

%Using linprog function to maximize profits 
[x val] = linprog(f, A, b, Aeq, beq, lb, ub);

fprintf('Max profit = %7.0f $\n\n',-val)
fprintf('At max profit,\n\nLight crude used = %1.0f gallons\nHeavy crude used = %1.0f gallons\nGasoline produced = %1.0f gallons\nDiesel Produced = %1.0f gallons\n',x(1),x(2),x(3),x(4));

end
