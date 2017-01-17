function problem7
%Navneet Singh (nsingh1@andrew.cmu.edu)
%HW-4 Prb 7

clc       %clear screen
clear all %clearing all stored variables
close all %close previous plots

%Part A

ini_guess = [1,2]; % making initial guess 
options = optimoptions(@fmincon, 'Display', 'off');

%non-linear constrains are defined in function nonlin
nonlcon = @nonlin;

%using fconmin function for constrained optimization
[rad, min_vol] = fmincon(@obj_min_vol, ini_guess, [], [], [], [], [], [], @(r) nonlcon(r,30,308.2), options);

disp('Part-a')
fprintf('minimized volume of the system is %1.2d m^3\n', min_vol)
fprintf('Inner radius of the sphere  %1.2d m \n', rad(1))
fprintf('Outer radius of the sphere  %1.2d m \n\n', rad(2))


%Part B 

ini_guess = [1,2]; % making initial guess 
options = optimoptions(@fmincon, 'Display', 'off');

%non-linear constrains are defined in function nonlin
nonlcon = @nonlin;

%using fconmin function for constrained optimization
[rad, min_vol] = fmincon(@obj_min_vol, ini_guess, [], [], [], [], [], [], @(r) nonlcon(r,30,408.2), options);

disp('Part-b')
fprintf('minimized volume of the system is %1.2d m^3\n', min_vol)
fprintf('Inner radius of the sphere  %1.2d m \n', rad(1))
fprintf('Outer radius of the sphere  %1.2d m \n\n', rad(2))


%Our objective function is defined below. Here we are minimizing the outer
%volume of the sphere. 
function V = obj_min_vol(r)
V = (4 / 3) * pi * r(2)^3;
end

%Non-linear constrains are defined here
function [c, ceq] = nonlin(r,Sy,T)
ri=r(1);
ro=r(2);

N = 10000 / 29; %mol weight of air = 29 g/mol
R = 8.314; % J/Kg/K

t = ro - ri; %thickness
S = Sy * 10^3 * 6894.76; %1 kpsi = 6894.76 Kpa
V = (4 / 3) * pi * ri^3; %inner volume 
P = N*R*T/V; %pressure calculation

%inequalities are defined below
c = [P*ri /(2*t) - S / 2,-ri,-ro,ri-ro];
ceq = [];
end


end


