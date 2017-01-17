%HW2-Prb6
%Navneet Singh(nsingh1@andrew.cmu.edu) 

function Problem_6
clc       %clear screen
clear all %clearing all stored variables
close all %close previous plots

%Antoine equation data for Benzene and Toluene (Taken from Perry's Handbook.)
A = [6.9, 6.95];
B = [1211, 1344.8];
C = [220.7, 219.48]; 
P = 760; %mmHg, we will draw Tx-y diagram at this pressure. 

x = 0:0.025:1; %mole fraction of Benzene in liquid state.
y = 0:0.025:1; %mole fraction of Benzene in gaseous state. 
dewt = zeros(length(x));
bubt = zeros(length(y));
guess = 100; 

%Running loop for different values of x and y 
for i = 1:length(x)
    options = optimset('display','off');
    %Both dew point and bubble point equation are non-linear
    %Solved them using fzero. 
    dewt(i) = fzero(@dew, guess,options);
    bubt(i) = fzero(@bub, guess, options); 
    guess = guess - 2; 
end


%Plotting
hold on;
d = plot(x, dewt,'r-');
b = plot(y, bubt,'b-');
c = plot(0.5, dewt(21),'rx');
a = plot(0.5, bubt(21),'bx');
axis([0 1 75 120])
xlabel('xb, yb (Benzene)','fontsize',15,'fontname','times new roman')
ylabel('Temp (C)','fontsize',15,'fontname','times new roman')
v = [d(1,1) b(2,1) c a];
legend(v ,'Dew Point', 'Bubble Point','Dew point at equimolar mixture', 'Bubble point at equimolar mixture')
title('Vapour liquid diagram of Benezene-Toluene')


%Function for calculating bubble point
function f = bub(t) 
     f = x(i)* (10 ^ (A(1) - B(1)/(t + C(1)))) +  (1-x(i)) * (10 ^ (A(2) - B(2)/(t + C(2)))) - P; 
end
%Function for calculating dew point
function f2 = dew(t)

     f2= P * (y(i) / (10 ^ (A(1) - B(1)/(t + C(1)))) +  (1-y(i)) / (10 ^ (A(2) - B(2)/(t + C(2))))) - 1; 
    
end
end