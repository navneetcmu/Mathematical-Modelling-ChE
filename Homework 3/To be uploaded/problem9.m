%HW-3 Prb-9
%Navneet Singh (nsingh1@andrew.cmu.edu)
function problem9 

%%
% Given equation is
% $-u^" + \pi^2 u = 2\pi^2sin(\pi x)$
% 
%We are going to convert this to two IVP problems as follows:
%
% 
%%
% $$ -u^" + \pi^2 u = 2\pi^2sin(\pi x) $$
%With initial values of [0,0]
%
%Second equation is hompogenous equation
% 
%%
% $$ -u^" + \pi^2 u=0 $$
%with inital values of [0,1]


clc       %clear screen
clear all %clearing all stored variables
close all %close previous plots


%defining range of xi 
xspan = [0, 0.25, 0.50, 0.75, 1];

%To estimate u1(x) and u2(x) at xspan we can use MATLAB's ode45 function as
%it is based on RK4 method. 
  
 %Solving corresponding non-homogenous IVP problem     
[x, u1]= ode45(@dudx1, xspan, [0,0]);
fprintf('Value of u1 at [0, 0.25, 0.50, 0.75, 1] is as follows:')
u1(:,1)

%Solving corresponding hompogenous IVP problem 
[x, u2] = ode45(@dudx2, xspan, [0,1]); 
fprintf('\nValue of u2 at [0, 0.25, 0.50, 0.75, 1] is as follows:')
u2(:,1)

%Neither u1 nor u2 satisfies Dirichlet BC at x=1, so we will need c. 

% As u(1) = 0. So, u1(1) + c*u2(1) = 0.
% c = -u1(1)/u2(1) 
%calculating value of c
c = -u1(end,1)/u2(end,1); 
fprintf('Value of c that give approxmate solution = %f\n', c); 

%Calculating value of w(x). 
w = u1(:,1) + c*u2(:,1);

fprintf('\nValues of function W(x) at points in xspan is as follows\n')
w

%Calculating error at each point of xspan 
y = sin(pi.*xspan)';
fprintf('Exact error at each point is : ')
error = y -w
  
%The u(1), corresponding non-homogenous IVP 
function f = dudx1(x, u)
     f = zeros(2,1);
     f(1) = u(2);
     f(2) = -2*(pi^2)*sin(pi*x) + (pi^2)*u(1);
     
end

% The u(2), corresponding homogenous IVP is given as below
function f = dudx2(x, u)
     f = zeros(2,1);
     f(1) = u(2);
     f(2) = (pi^2)*u(1);
     
end


end

