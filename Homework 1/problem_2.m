%HW1-Prb2
%Navneet Singh (nsingh1@andrew.cmu.edu)

function problem_2
clc
close all 
clear all 
function [y] = invtime(n) % writing a function to calculate inversing time. 
    z = zeros(n);         % initializing a n*n matrix
    z = rand(n);          % filling matrix z with random numbers between 0 and 1. 
    tic;                  % starting stopwatch timer
    inv(z);
    y = toc;              % stopping stopwatch timer
end

n = [10,100,1000,10000];  % defining cases for calculating inverse time. 
j = numel(n);
t = zeros(1,j);           % intializing t matrix to store time. 
for i =1:j                % running loop to calculate time for all cases. 
    t(1,i) = invtime(n(1,i)); %calling 'invtime' function to calculate time to inverse matrix. 
end
plot (n,t,'bx');          %plotting matrix size vs running time. 
xlabel('Size of the Matrix','fontsize',15,'fontname','times new roman');
ylabel('Running time in seconds','fontsize',15,'fontname','times new roman');
t = table(n',t');          %generating table for matrix size vs running time. 
t.Properties.VariableNames = {'Matrix_Size' 'Running_Time_in_seconds'}
end
