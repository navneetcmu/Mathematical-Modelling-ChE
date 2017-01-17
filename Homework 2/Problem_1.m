%HW2-Prb1
%Navneet Singh(nsingh1@andrew.cmu.edu) 

clc       %clear screen
clear all % clearing all stored variables
close all %close previous plots

k = [0.1,0.2,0.1,0.8]; %sec^-1 
V = 10; %Litres
v = 1 ; %L/sec
feed = [5,0,0,1]'; %M, feed concentrations

t = V/v; %sec 
A = zeros(4,4); %initializing A matrix. 

A(1,:) = [1+k(1)*t, 0, 0, 0]; 
A(2,:) = [-k(1)*t, 1 + (k(2)+k(4))*t, 0, -k(3)*t]; 
A(3,:) = [0, -k(4)*t, 1, 0];
A(4,:) = [0, -k(2)*t, 0, 1+ k(3)*t];

%Doing LU decomposition on A matrix. 
[L,U,P] = lu(A); 

% Our problem was Ax = feed. After decomposing into LU, our problem became
% LUx = feed which can be solved in two steps. Let Ux = b, then our problem
%becomes Lb = feed. b = L^-1 * feed. Then we have to solve Ux = b. 

fprintf('Vector formed as a result of the first multiplication of a triangular matrix by the feed vector:')
f1 = P*feed; %matlab pivot elements while calcultaing LU, so multiplying by permutation matrix is necessary to get right results.
b = L\(f1)  

fprintf('Steady State Reactor Concentrations are:')
c_ss = U\b %Caculating results

 
