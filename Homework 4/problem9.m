function problem9

%Navneet Singh (nsingh1@andrew.cmu.edu)
%HW-4 Prb 9

clc       %clear screen
clear all %clearing all stored variables
close all %close previous plots

% Y axis was assumed along height of the building and X-axis perpendicular to that.
% Two ends of ladder would be at points (0, x1) and (x2, 0). 
% Our objective function is length = x1^2 + x2^2, which we have to minimize

% As ladder cann't be inside room, two obvious constrains are x1 >10, x2>10

%To be sure that ladder is not inside room, we another contrained that
%normal distance of ladder from origin should be greater that sqrt(2)*10 (height and width of room is 10)

% We will make use of above function and constrains to solve this problem
% as optimization problem. 

%making initial guess
guess = [20,20]; 

%setting lower and upper bound on variables
lb = [10 10];
ub = [Inf Inf]; 

Aeq = [];
beq = [];
A =[];
b= [];

% non-liner constraints
nonlcon = @nonlin; 
options = optimoptions(@fmincon, 'Display', 'off');
[x,val] = fmincon(@obj,guess,A,b,Aeq,beq,lb,ub,nonlcon,options);

fprintf('Length of the shortest ladder = %1.1f mts\n', val);

%normal distance of ladder from origin > sqrt(2)*10
function [c, ceq] = nonlin(x)
    c = 10*sqrt(2) - x(1)*x(2)/(sqrt(x(1)^2 + x(2)^2));
    ceq = []; 
end

% Objective function is defind below. 
function f = obj(x)
      f = sqrt(x(1)^2 + x(2)^2);
end


end


         
