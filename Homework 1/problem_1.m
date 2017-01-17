%HW1-Prb1
%Navneet Singh(nsingh1@andrew.cmu.edu) 

clc       %clear screen
clear all % clearing all stored variables
close all %close previous plots


x = (1:3:30);          % generating a vector having values 1 from 30 with increments of 3. 
n = numel(x);          %finding no of elements in x. These will correspond with number of rows in z matrix
z = zeros(n,3);        %generating a 3 column matrix 
z(:,1) = randperm(10); %filling 1st column of matrix z with random numbers ranging from 1 to 10.
z(:,2) = z(:,1).^2;    % 2nd column elements are square of 1st column elements
z(:,3) = sqrt(z(:,1)); % 3rd column elements are square root of 1st column elements. 

figure
plot(x, z(:,2))        %plotting x vs second column of z.  
xlabel('x','fontsize',15,'fontname','times new roman')
ylabel('2nd column of z','fontsize',15,'fontname','times new roman')
title('Plot of x vs second column z','fontsize',16,'fontname','times new roman') 
