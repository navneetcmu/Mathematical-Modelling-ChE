%Midterm Problem 2
%Navneet Singh(nsingh1@andrew.cmu.edu) 
function midterm2

clc       %clear screen
clear all % clearing all stored variables
close all %close previous plots

temp = 500:1:1500; %K , temp range over which we have to calculate extent of reaction 

k01 = 2;
g1 = 3000; %J/mol
k02 = 0.9;
g2 = -1000; %J/mol
R = 8.314; %J mol^-1 K^-1


%Reaction extent, e = (mole at equilibrium - initial moles )/stoichiometric
%constant. 
%For first reation extent is e1 while for second e2. 


o2_in = 1.0/3;  %moles
co2_in = 1.0/3; %moles
n2_in = 1.0/3;  %moles

%calling fsolve function to solve equations
%set of equations described in function extent
%We will call fsolve 1001 times (dimension of temp to calculate extent at that points)

for i = 1:length(temp) 
    %defining values of K1 and K2 at different temperatures
    K1 = k01 * exp(g1/(R * temp(i))); 
    K2 = k02 * exp(g2/(R * temp(i))); 
    guess = [0.1; 0.1]; %initial guess
    options = optimset('display','off');
    [extent1, fval, exitflag,outtput] = fsolve(@extent, guess, options);
    %exitflag is used to check whether solution conereged or not.
    
    %fprintf('Equilibrium extents for part (a) are as follows:\nReaction 1, e1 = %f\nReaction 2, e2 = %f\n',extent1(1),extent1(2));
end

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

%plotting
hold on
plot(temp,extent1(1),'bx')
plot(temp,extent1(2),'rx')
legend('extent of reaction 1','extent of reaction 2')
xlabel('Temp(K)','fontsize',15,'fontname','times new roman')
ylabel('extent of reactions','fontsize',15,'fontname','times new roman')


end