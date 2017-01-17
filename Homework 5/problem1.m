function problem1
%Navneet Singh( nsingh1@andrew.cmu.edu)
%HW-5 Prb1

clc       %clear screen
clear all %clearing all stored variables
close all %close previous plots

%Defining our dataset
xi = [1,2,3,4];
yi = xi .* sin(xi);

% 4 points for 4th order polynomial in x

%PART A
%Initializing Vandermonde matrix
x(:,1) = (xi.^0)';
x(:,2) = (xi.^1)';
x(:,3) = (xi.^2)';
x(:,4) = (xi.^3)';

%Calculating coefficients of the polynomial
a = x\yi';
fprintf('Part A: Polynomial collocation,\nCoefficients of the polynomial are -')
a
collocation = colloc(2.5);
fprintf('\nActual value of function = %1.4f, Value from collocation = %1.4f\n',2.5*sin(2.5), collocation)

%Defining polynomial function 
function f = colloc(x)
 f = a(1) + x*a(2) + x^2 * a(3) + x^3 * a(4);
end



%PART B 

%Calling lagrange function 
[lagrange_method, a1, a2, a3, a4] = lagrange(2.5);

fprintf('\nPart B: Lagrange polynomial,\nCoefficients of the polynomial are \n%f\n%f\n%f\n%f\n', a1, a2, a3, a4)
fprintf('\nActual value of function = %1.4f, Value from Lagrange method = %1.4f\n',2.5*sin(2.5), lagrange_method)

%Defining lagrange function
function [f,a0,a1,a2,a3] = lagrange(x) 
   %coefficients of lagrange polynomial 
   %a0 = (x-x1)(x-x2)/(x0-x1)(x0-x2) 
   a0 = (x-xi(2))*(x-xi(3))*(x-xi(4))/( (xi(1)-xi(2))*(xi(1)-xi(3))*(xi(1)-xi(4)));
   a1 = (x-xi(1))*(x-xi(3))*(x-xi(4))/( (xi(2)-xi(1))*(xi(2)-xi(3))*(xi(2)-xi(4)));
   a2 = (x-xi(1))*(x-xi(2))*(x-xi(4))/( (xi(3)-xi(1))*(xi(3)-xi(2))*(xi(3)-xi(4))); 
   a3 = (x-xi(1))*(x-xi(2))*(x-xi(3))/( (xi(4)-xi(2))*(xi(4)-xi(3))*(xi(4)-xi(1)));
   
   f = yi(1)*a0 + yi(2)*a1 + yi(3)*a2 + yi(4)*a3; 
end

%PART C 

[newton_method, a0, a10, a210, a3210] = newton(2.5); 

fprintf('\nPart C: Newton Divided Difference method,\nCoefficients of the polynomial are \n%f\n%f\n%f\n%f\n', a0, a10, a210, a3210)
fprintf('\nActual value of function = %1.4f, Value from Newtons method = %1.4f\n',2.5*sin(2.5), newton_method)

%Function of newton's devided difference method
function [f, a0, a10, a210, a3210] = newton(x)
    
    %coefficients of newton divided difference method
    %a(0) =fo(x0)
    a0 = yi(1); 
    
    %a1 = f1(x1) - f0(x0) / (x1-x0)
    a10 = (yi(2) - yi(1))/ (xi(2) - xi(1));
    a21 = (yi(3) - yi(2))/ (xi(3) - xi(2)); 
    a32 = (yi(4) - yi(3))/ (xi(4) - xi(3)); 
    
    a210 = (a21 - a10)/(xi(3) - xi(1));
    a321 =  (a32 - a21)/(xi(4)-xi(2)); 
    
    a3210 = (a321 - a210)/(xi(4)-xi(1));
    %polynomial 
    f = a0 + (x - xi(1))*a10 + (x-xi(1))*(x-xi(2))*a210 + (x-xi(1))*(x-xi(2))*(x-xi(3))*a3210; 
    
end

% Part D
%As we can see from the graph below, there isn't any significant
%differences for this fit. All three graphs lie on top of each other. 

%Plotting data and fit 
x = linspace(1,4);

for i = 1:length(x)
    yc(i) = colloc(x(i));
    yl(i) = lagrange(x(i));
    yn(i) = newton(x(i));
end
    
plot(xi,yi,'ro',x,yc,'k-',x,yl,'gx',x,yn,'b.');
legend('Data points','Polynomial collocation','Lagrange polynomial','Newtom divided diff')
xlabel('x')
ylabel('xsin(x)')
title('Data and fit')
end
