%HW-3 Prb-7
%Navneet Singh (nsingh1@andrew.cmu.edu)
function problem7

%The equation was converted to dimensionless form as follows : 

%%
% 
% $$\frac{d^2\theta}{d\xi^2} + (\frac{2}{\xi})\frac{d\theta}{d\xi} -
% \frac{kR^2}{D}\theta = 0$$
%
% $$\frac{d^2\theta}{d\xi^2} + (\frac{2}{\xi})\frac{d\theta}{d\xi} - \phi^2\theta = 0$$


clc %clearning screen
clear all %clearing previous stored variables
close all %closing previous plots

%Part (A)
%value of Theile modulus
theile = [0.01, 10];

%running loop to guess intial condition

for i = 1:length(theile)
    thl = theile(i);
    %we know at \xi = 1, \theta = 1. We will make different initial guesses
    %for \theta(0) and see whether \theta(\xi=1) is 1 or not. 
    %We can make use of fsolve to do this
    
    %using fsolve to guess initial conditions
    guess = 1; %guess to use fsolve
    theta1 = 1; %given BC and our shooting target
    options = optimset('display','off');
    sol(i) = fsolve(@func, guess,options);
    
    fprintf('\nFor phi^2 = %f, Initial condition is theta(0) = %f ',thl, sol(i));
    fprintf('\nGradient of concentration at outer edge of pellet = %f\n' ,u(end,2));
    %plotting
    subplot(2,1,i)
    p(i) = plot(t,u(:,1));
    title('Shooting method \theta vs \xi')
    xlabel('\xi');
    ylabel('\theta');
    l = char('\phi^2 = 0.01', '\phi^2 = 10');
    legend(l(i,:))
    
    
     
    
end

%Function giving our differential equations
function f = eqn(t, u)
         f = zeros(2,1);
         f(1) = u(2);
         if t == 0
             f(2) = thl*u(1);
         else
             f(2) = thl*u(1) - (2/t)*u(2);
         end
end
%function which checks value of theta(xi=1) 
function y = func(guess) 
         tspan = [0, 1]; %range of integration
         initial = [guess, 0];  %initial conditions for ode45
         options = odeset('RelTol',1e-5,'AbsTol',[1e-5 1e-5]);
         [t, u] = ode45(@eqn, tspan, initial, options);
         y = theta1 - u(end,1); %checking whether calculated value mathches given boundary condition. 
         
end


    
%Part (B)
 
 
%We will disctretize the given differential equation and form system      
% as Ax = b. Where x is a vector containing values of theta, 

%number of mesh 
n = 50;
%distance between two consecutive mesh points, or step size. 
h = 1/n; 

%step size is to be chosen carefully. If it too small, matrix A or B might 
%become singular. If it is too large then we will get incorrect results. 

zy = linspace(0,1,n+1);
%Initializing A and b matrix
A = zeros(n+1,n+1);
b = zeros(n+1,1); 
%Different values of Thiele modulus 
theil = [0.01, 10];

%running loop for different values of theil modulas
for j = 1:length(theil)
    
    %Values of p, q and r
    p = -2 ./ (zy);  
    q = theil; 
    r = zeros(size(p));
    
    %Dirichlet BC
    A(n+1, n+1) = 1;
    A(n+1,n) = 0;
    b(n+1) =1;
    
    %Neumann BC
    A(1,1) = 2 + (h^2)*theil(j);
    A(1,2) = -2;
    b(1) = 0;
    
    %creating matrix A and b. 
    for i = 2:n
        
        %calculating values of l,d and u
        d = 2 + (h^2)*theil(j);
        u = -1 + (h/2)*p(i);
        l = -1 - (h/2)*p(i);

        %matrix A 
        A(i, i-1)   = l;
        A(i, i) = d;
        A(i, i+1) = u;
    end
% calculating values of theta
    c(:,j) = A\b;
end

figure
subplot(2,1,1);
plot(zy, c(:,1))
title('Finite difference method: \theta vs \xi ')
xlabel('\xi')
ylabel('\theta')
legend('\phi^2 = 0.01')
subplot(2,1,2);
plot(zy, c(:,2))
xlabel('\xi')
ylabel('\theta')
legend('\phi^2 = 10')

end
