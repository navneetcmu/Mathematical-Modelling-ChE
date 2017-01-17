function problem1

%Navneet Singh (nsingh1@andrew.cmu.edu)
%HW-4 Prb 1

clc       %clear screen
clear all %clearing all stored variables
close all %close previous plots


%Defining the objective function
% f(x) = x1 + x2 
f = [1 1];

%Defining inequality constraints in for Ax < b 

%Defining A matrix
A =[-3  1;
     1  2;
     1  1;
    -1  0;
     0 -1]; 
 
 %Defining b vector
 b = [-3;
       5;
       4;
       0;
       0];
   
%using linprog function to get optimized value
[x val]= linprog(f, A, b);

fprintf('Minimum value of function is %f\nAt Min,\n', val)
fprintf('Value of x1 = %f \nValue of x2 = %f\n', x(1),x(2))

end
