function problem4

%Navneet Singh( nsingh1@andrew.cmu.edu)
%HW-5 Prb4 

clc       %clear screen
clear all %clearing all stored variables
close all %close previous plots
format long 

% Loading problem data
load('hmwk5_p4.csv')

% Extracting Temperature and Vapour pressure
T =  hmwk5_p4(:,1); %celcius
vp = hmwk5_p4(:,2); %bar

%Points at which we need to find vapor pressure
query_point = [150 232]; %celcius 

%Part A: linear interpolation 

%Using interp1 function to do linear interpolation
li = interp1(T,vp,query_point,'linear');

%Printing required values
fprintf('Part A : Linear Interpolation\n');
fprintf('At temperature = %1.0f C, Vapour pressure = %1.2f bar\n',query_point(1),li(1));
fprintf('At temperature = %1.0f C, Vapour pressure = %1.2f bar\n\n',query_point(2),li(2));



%Part B: Cubic spline interpolation
%Using built-in spline function (default value is cubic) 
ci = spline(T,vp,query_point);

%Printing required values
fprintf('Part B : Cubic Spline Interpolation\n');
fprintf('At temperature = %1.0f C, Vapour pressure = %1.4f bar\n',query_point(1),ci(1));
fprintf('At temperature = %1.0f C, Vapour pressure = %1.4f bar\n\n',query_point(2),ci(2));

%Part C: Non-linear fit

%using built-in nlinfit function to fit data non-linearly 
param = nlinfit(T', vp', @antn, [10, -300, 150]);

%Printing required values
fprintf('Part C : Non-linear Fit\n');
fprintf('At temperature = %1.0f C, Vapour pressure = %1.4f bar\n',query_point(1), antn(param, query_point(1)));
fprintf('At temperature = %1.0f C, Vapour pressure = %1.4f bar\n\n',query_point(2),antn(param,query_point(2)));
fprintf('Value of A = %f, B = %f C and C = %f\n',param(1),param(2),param(3));

%Defining Antione equation
function f = antn(x,T)
      f = exp(x(1) + (x(2) ./ (T + x(3)))); 
end

%Part D

% The values from spline and nonlinear fit matches upto 2 places of decimal.   
% Value from linear interpolation matches the two upto units place. 
% Since the data points given are very less, we can say that we get
% approximately same result from all three interpolation techniques. 
end
