
function problem3
%Navneet Singh (nsingh1@andrew.cmu.edu)
%HW-4 Prb 3

clc       %clear screen
clear all %clearing all stored variables
close all %close previous plots
format long 

%Given Data
c_bulk = [5e-5, 1e-4, 4e-4, 5e-4, 1e-3, 0.002, 0.003]; %g/L
gam_eq = [36.42, 33.72, 30.63, 27.45, 24.76, 22.30, 19.71]; %mN/m
gamma_o = 52.2; %mN/m
R = 8.314; % J/mol.k
T = 298; %k

%making intial guess 
initial = [0, 0.0001];

%Using fminunc to minimize cost function 
options = optimoptions(@fminunc, 'Display', 'off','Algorithm','quasi-newton');
[sol val] = fminunc(@func, initial,options);

fprintf('Value of Gamma_inf = %f, Value of a = %f\n', sol(1),sol(2))

%Using given function to calculate gamma_eq from our model
c = linspace(min(c_bulk), max(c_bulk)); 
fit = zeros(size(c));
length(c);
for i = 1:length(c);
    fit(i) = s_obs(c(i), sol(1), sol(2));
end

%plotting data and fit
figure
plot(c_bulk, gam_eq, 'o', c, fit,'r-')
title('Data and fit')
legend('Given data','Fit')
xlabel('C_{bulk}')
ylabel('\gamma_{eq}')

%Defining cost function to be minimized
function f = func(x)
         %Two unknowns
         l = x(1);
         a = x(2);
         
         %Langmuir isotherm equations
         sb = s_obs(c_bulk,l,a);
         err = gam_eq - sb;
         
         %cost function
         f = 0.5 * dot(err,err);         
end

%defining langmuir isotherm equation
function f = s_obs(x,l,a)
      f = gamma_o + R*T*l*log(a./(x+a)); 
end

%Part B 

% Here we will see how value of inital guess affect value of parameters. 
 r = zeros(1,10);
 solr = zeros(2,10);
 len = 1:1:10; 
 %running loop for 10 times
for i = 1:10
    a = 0;
    b = 1;
    %generating random initial guesses
    r(i) = (b-a)*rand + a;
    initial = [r(i), r(i)/1000];
    
    %Getting the value of parameters
    options = optimoptions(@fminunc, 'Display', 'off','Algorithm','quasi-newton');
    x = fminunc(@func, initial,options);
    solr(1,i) = x(1);
    solr(2,i) = x(2); 
end
%Plotting parameters at different guesses. 
figure(2)
plot(len, solr(1,:), len,solr(2,:));
title('\theta vs Random initial guess')
xlabel('Random guess number')
ylabel('Value of parameters')
legend('Gamma Inf','a')

% If you see the plot below, value of parameters depends on initial guess
% and choosing wrong initial guess will give incorrect readings. 

% Fitness of a plot can be determined by various methods. One such popular
% method is R^2 method. For part (a), value of R^2 comes close to 1, thus
% that is a good fit. We can also calculate confidence intervals using
% function 'nlinfit' which can give 95% confidence range for our
% parameters. 

end

