%HW2-Prb7
%Navneet Singh(nsingh1@andrew.cmu.edu) 
function Problem_7

clc       %clear screen
clear all % clearing all stored variables
close all %close previous plots

K1 = 0.1071;
K2 = 0.01493;

%Reaction extent, e = (mole at equilibrium - initial moles )/stoichiometric
%constant. 
%For first reation extent is e1 while for second e2. 

%Part A

o2_in = 1.0/3;  %moles
co2_in = 1.0/3; %moles
n2_in = 1.0/3;  %moles

%calling fsolve function to solve equations
%set of equations described in function extent
guess = [0.1; 0.1]; %initial guess
options = optimset('display','off');
[extent1,fval, exitflag,outtput] = fsolve(@extent, guess, options)
%exitflag is used to check whether solution conereged or not.
fprintf('Equilibrium extents for part (a) are as follows:\nReaction 1, e1 = %f\nReaction 2, e2 = %f\n',extent1(1),extent1(2));


%Part B 

o2_in = 1.0/3; %moles
co2_in = 2.0;  %moles
n2_in = 1.0/3; %moles

%Here also we will use fsolve to solve equations. 
%set of equations described in function extent
guess = [0.5; 0.1]; %initial guess
options = optimset('display','off');
[extent2,fval, exitflag,outtput] = fsolve(@extent,guess,options);
%exitflag is used to check whether solution conereged or not. 
fprintf('\nEquilibrium extents for part (b) are as follows:\nReaction 1, e1 = %f\nReaction 2, e2 = %f\n',extent2(1),extent2(2));

%describing non linear equations
function F = extent(e)
    %for first reaction 
    CO2 = -2*e(1) + co2_in ; %moles of CO2 at equilibrium. 
    CO = 2*e(1); %moles of CO at equilibrium.
    O2 = e(1) - e(2) + o2_in; %moles of O2 at equilibrium.
   
    %for second reaction
    N2 = -1*e(2) + n2_in; %moles of N2 at equilibrium.
    NO =  2*e(2); %moles of NO at equilibrium.
    
    tot = CO2 + CO + O2 + N2 + NO ; %total moles at equilibrium. 
    
    %First equation to be solved
    F(1) = (CO/tot)^2 * (O2/tot) - K1 * (CO2/tot)^2;
    %Second equation to be solved 
    F(2) = (NO/tot)^2 - K2 * (O2/tot) * (N2/tot); 
   
end

%convergence criteria of fsolve is that it says an equation is converged
%when value of objective function (F(1) and F(2) here becomes less than
%tolerance value

end