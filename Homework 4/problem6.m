function problem6
%Navneet Singh (nsingh1@andrew.cmu.edu)
%HW-4 Prb 6

clc       %clear screen
clear all %clearing all stored variables
close all %close previous plots

%Part (A)

%using matlab's syms toolbox
syms x1 x2

%given function
f=4*x1^3 - 2* x1^2 *x2 +x2^2 + 2;

%Calculating Jacobian and Hessian
J=gradient(f,[x1 x2]);
H=hessian(f,[x1 x2]);
H=matlabFunction(H);

%To solve for stationary points, we will solve jacobian for zero
[x1s,x2s]=vpasolve(J);


%Plotting contour and stationary points
x1 = linspace(-10,10,100);
x2 = linspace(-10,10,100);
[X1,X2] = meshgrid(x1,x2);

Z=4*X1.^3-2*X1.^2.*X2+X2.^2+2;
figure(1)
contour(X1,X2,Z,500)
title('Part A')
hold on 
plot(x1s,x2s,'ko')
legend('Contour','Stationary Points')
xlabel('x1')
ylabel('x2')

%Checking stationary points are maxima, minima or saddle point
[max min sadl] = chkpnts(x1s, x2s, H); 

fprintf('For Part A\n')
fprintf('Maxima points are\n')
disp(max)
fprintf('Saddle points are\n')
disp(sadl)



%Part (B)

%using matlab's syms toolbox
syms x1 x2

%given function
f = x1^2 * x2 + x2^3 - 4*x1^2 + 1;

%Calculating Jacobian and Hessian
J=gradient(f,[x1 x2]);
H=hessian(f,[x1 x2]);
H=matlabFunction(H);

%To solve for stationary points, we will solve jacobian for zero
[x1s,x2s]=vpasolve(J);


%Plotting contour and stationary points
x1 = linspace(-10,10,100);
x2 = linspace(-10,10,100);
[X1,X2] = meshgrid(x1,x2);

Z = X1.^2 * X2 + X2.^3 - 4*X1.^2 + 1;
figure(2)
contour(X1,X2,Z,250)
title('Part B')
hold on 
plot(x1s(3),x2s(3),'ko')
legend('Contour','Stationary Points')
xlabel('x1')
ylabel('x2')

%Checking stationary points are maxima, minima or saddle point
[max min sadl] = chkpnts(x1s, x2s, H); 

fprintf('Part B\n')
fprintf('Saddle points are\n')
disp(sadl)


% Following function checks whether stationary points are maxima, minima or
% saddle point. It takes stationary point and Hessian matrix as input. 
function [max min sadl] = chkpnts(x1, x2, H)
    max = []; min = []; sadl =[];
     for i = 1:length(x1)    
            s = det(H(x1(i), x2(i)));
            if(s==0) % if determinant of hessian = 0, saddle point
               sadl(length(sadl)+1,:) = [x1(i); x2(i)];
            end
            if(s<0) % if determinant of hessian <0, maxima
               max(length(max)+1,:) = [x1(i); x2(i)];
            end
            if(s>0)  % if determinant of hessian >0, minima
               min(length(min)+1,:) = [x1(i); x2(i)];
            end
     end
end
end
            
        
         
         
      




