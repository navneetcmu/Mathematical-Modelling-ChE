%HW-3 Prb-5
%Navneet Singh (nsingh1@andrew.cmu.edu) 

%Using method of finite differences, we convert system to Ax = b form. 
% where x is vector containing concentration at various nodes. 

%relevent equations are in pulished pdf file

clc       %clear screen
clear all % clearing all stored variables
close all %close previous plots

%Given data
D = 10;   %um^2/sec
L =1000;  %um
v = 0.1;  %um/sec
k = 5e-3; %sec^-1

%Dirichlet boundary conditions
C0 = 1; %M, conc at entrance
CN = 0.1; %M, conc at exit

%Method of finite difference
n = 500;        %no of mesh points
h = 1/(n-1);    %distance between two mesh points
z_star = linspace(0,1,500);   %z_star, scaled distance

%Creating A matrix ( from our system, Ax = b)
a = (v*L)/D;
b = (-k*(L^2))/D; 
alpha = 1 - a*h/2;
beta = -2 + b*(h^2);
gamma = 1 + a*h/2;

alph = alpha* ones(1, n-1);
bet = beta* ones(1, n);
gam = gamma* ones(1, n-1);
% 'A' matrix 
A = diag(alph,-1)+diag(bet)+diag(gam,1); 

%Creating 'b' vector
b = zeros(n,1);
b(1) = -alpha*C0; %boundary condition
b(end) = -CN*gamma; %boundary condition

%Calculating concentration
c = A\b; 

%Plotting
plot(z_star, c)
title('Concentration Profile')
xlabel('z^*')
ylabel('Concentration')
