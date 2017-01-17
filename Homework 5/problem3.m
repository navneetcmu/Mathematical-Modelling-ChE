function problem3
%Navneet Singh( nsingh1@andrew.cmu.edu)
%HW-5 Prb3 

clc       %clear screen
clear all %clearing all stored variables
close all %close previous plots
format long 

% loading problem data
load('hmwk5_p3.csv')

%Extracting moleculer weight and mobility
M = hmwk5_p3(:,1);  %kb
mu = hmwk5_p3(:,2); %cm^2/kV s

%Part A 

% Using cubic spline to develop a piecewise function 
pp = spline(M,mu); 
axis = linspace(min(M), max(M));
yc = ppval(pp,axis); 

%finding interpolated value
mu_cubic = ppval(pp,1.25); 
fprintf('\nUsing cubic spline, at M = 1.25kb, value of mu = %1.2f cm^2/kVs\n\n',mu_cubic) 


%Part B
% We will convert system in Ax =b form. 
% Value of x can be find using pseudoinverse. 

% initializing A matrix and b vector 
A = ones(length(M),2);
A(:,2) = 1./M;
b = 1./mu;

%using pseudoinverse to find value of unknown vector (mu0 and alpha) 
c = inv(A'*A)*A'*b;
mu0 = 1/c(1);
alpha = c(2)*mu0;

%calculating value of mu
mu_linear = (mu0 * 1.25)/(1.25+alpha); 
yl = (mu0 .* axis) ./ (axis + alpha); 
fprintf('Using linear regression, at M  = 1.25kb, value of mu = %1.4f cm^2/kVs\n',mu_linear)
fprintf('Value of alpha = %1.2f kb, Value of mu0 = %1.2f cm^2/kVs\n\n',alpha, mu0)

%Part C

%Here we are using nlinfit routine to fit data to given function.  
initial = [0.2, 0.45];
beta = nlinfit(M, mu, @func, initial);

mu_nonlin = beta(1)*1.25/(1.25+beta(2));

fprintf('Using non-linear fit, at M  = 1.25kb, value of mu = %1.4f cm^2/kVs\n',mu_nonlin)
fprintf('Value of alpha = %1.2f kb, Value of mu0 = %1.2f cm^2/kVs\n\n',beta(2), beta(1))

ynl = (beta(1) .* axis) ./ (axis+beta(2));

%defining given function 
function f  = func(b,M) 
    f = zeros(8,1);
    f = b(1) *(M./(M+b(2)));
end

%Part D
% Value of mu that we got from linear and non-linear fit matches upto two decimal places. 
% value of mu0 we got from spline interpolation is approximately the same.


%Plotting data and fit
plot(M,mu,'ko',axis,yc,axis,yl,'r-',axis,ynl,'g-')
legend('Data points','Cubic Spline','Linear','Non-linear')
title('Data point and fits')
xlabel('M(kb)')
ylabel('mobility(cm^2/kVs)')

end
