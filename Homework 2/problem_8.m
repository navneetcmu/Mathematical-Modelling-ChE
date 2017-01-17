%HW2-Prb8
%Navneet Singh(nsingh1@andrew.cmu.edu) 
function problem_8

clc       %clear screen
clear all % clearing all stored variables
close all %close previous plots

l = [100, 100, 200, 75, 100, 75, 50]; %pipe lengths
guess = 0.1 * ones(1,7); %initial guess for flows

%The system has 7 non linear equations which can be solved using fsolve() 
options = optimset('display','off');
% calling fsolve 
[q, fval, exitflag,outtput] = fsolve(@flow, guess,options); 
%By checking value of exitflag we can see whether has converged or not. 

%Function flow describes 7 non-linear equations 
function f = flow(q)

    f(1) = q(1) - q(2) - q(6);
    f(2) = q(2) - q(4) - q(3);
    f(3) = q(5) - q(4) - q(3);
    f(4) = q(7) - q(5) - q(6); 
    f(5) = l(3) * (q(3)^2) - l(4) * (q(4)^2); 
    f(6) = l(2) * q(2)^2 + l(4) * q(4)^2 + l(5) * q(5)^2 - l(6) * q(6)^2;
    f(7) = l(1) * q(1)^2 + l(6) * q(6)^2 + l(7) * q(7)^2 - ((5.2*10^5)* pi^2 * 0.2^5)/(8 * 0.02 * 998);
        
end
fprintf('Flowrates are as follows:\nq1 = %f\nq2 = %f\nq3 = %f\nq4 = %f\nq5 = %f\nq6 = %f\nq7 = %f\n',q(1),q(2),q(3),q(4),q(5),q(6),q(7))
end