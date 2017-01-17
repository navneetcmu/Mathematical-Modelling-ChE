function problem2
%Navneet Singh( nsingh1@andrew.cmu.edu)
%HW-5 Prb2

clc       %clear screen
clear all %clearing all stored variables
close all %close previous plots

%generating 10 points between 0 and pi 
x = linspace(0, pi, 10);
y(:,:) = 5*sin(2*x) + 2;

%Resolution of 1000 points
xx = linspace(0, pi, 1000); 

%using spline fit
y_spline = spline(x, y, xx);  

%using interp1 with spline
y_interp = interp1(x,y, xx, 'spline');

%plotting
plot(x,y,'ko',xx,y_spline,'k-',xx,y_interp,'g--');
legend('Data Point', 'Spline', 'interp1')
xlabel('t')
ylabel('5sin(2t)+2')


%As it is evident from the graph below, there isn't any difference between
%two results. 
end
