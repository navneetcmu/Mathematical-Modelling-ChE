%HW-3 Prb-6
%Navneet Singh (nsingh1@andrew.cmu.edu)

function problem6

%The given differential equation discretized using second order finite
%difference method described in Bradie's text. We converted system to 
% Ax = b form, where x is vector solved for theta.
%relevent equations in uploaded published pdf file

clc %clearning screen
clear all %clearing previous stored variables
close all %closing previous plots

%Number of mesh points, size of A matrix
n = 100;

%distance between two mesh points
h = (1-0.8)/n;
%We have to plot theta for 3 values of beta
beta = [7.5, 8, 8.5];
%initializing theta matrix to store values of theta at different betas
theta = zeros(n+1, 3); 
%vector containingmesh points
zy = linspace(0.8, 1, n+1); 

%outer loop for 3 values of beta
for j = 1:length(beta) 
    % calculating value of p, q and r
    p = -1./zy; 
    q = -(beta(j)^2);
    r = -1; 
    
    %calculating value of d,u and l for A matrix
    d = 2 + (h^2)*q;
    u = -1 + (h/2).*p;
    l = -1 - (h/2).*p;
    
    %initializing matrix A. 
    A = zeros(n+1,n+1);
    
    %Dirichlet BC 
    
    A(n+1,n+1) = 1;
    A(n+1,n) = 0; 
    b(n+1) = 0; 
    
    %Neumann BC
    A(1,1) = d; 
    A(1,2) = -2;
    
    %initializing matrix b
    b = -h^2*r*ones(n+1,1); 
    
    % creating matrix A
    for i =1:n-1
        A(i+1, i)= l(i); 
        A(i+1, i+1) = d; 
        A(i+1, i+2) =  u(i); 
   
    end
%calculating unknown vector x = inv(A)*b. Here unknown value if theta
theta(:,j) = A\b;

end

%plotting the results
plot(zy, theta(:,1), zy, theta(:,2),  zy, theta(:,3));
legend('7.5', '8', '8.5')
title('Plot of \theta(\xi)')
xlabel('\xi')
ylabel('\theta')
 
end

