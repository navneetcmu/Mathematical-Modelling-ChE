%Midterm Problem 1
%Navneet Singh(nsingh1@andrew.cmu.edu) 
function midterm1

clc       %clear screen
clear all % clearing all stored variables
close all %close previous plots

load('midterm_data.csv') %loading csv file

%extracting data
shear = midterm_data(:,1);
visc1 = midterm_data(:,2);
visc2 = midterm_data(:,2);

%taking logs
vis1 = log(visc1);
vis2 = log(visc2);
shr = log(shear);

%our problem is in form log n = lok K + nlog(gamma)
%As system is not square we will use pseudoinverse to fit data to our
%values
%we will sove a system Ax = b 

b1 = visc1;

%Initializing Matrix A1
A1 = zeros(36,2);
A1(:,1) = 1.0;          %first column of matrix A
A1(:,2) = vis1; %second column of matrix A


x1 = (inv(A1'*A1)*A1')*b1 ;
fprintf('Value of log K and n  for solution 1 are %f and %f\n', x1(1),x1(2))
%we will sove a system Ax = b 

b2 = visc2;

%Initializing Matrix A1
A2 = zeros(36,2);
A2(:,1) = 1.0;          %first column of matrix A
A2(:,2) = vis2; %second column of matrix A

x2 = (inv(A2'*A2)*A2')*b2 ;
fprintf('Value of log K and n  for solution 2 are %f and %f', x2(1),x2(2))



end