%HW1-Prb5
%Navneet Singh(nsingh1@andrew.cmu.edu) 

%We are goint to solve this problem by discretising the given equation.
%Distance between two plates is divided into 'n' equal parts.
%After discretising, it takes the linear form, represented by Ax = b,
%where x = velocity vector, A = coefficients of velocity
%vector b = [g+Vo, g, g......g, g+Vn], where g = -
%[(distance between two nodes)^2 * pressure drop]/[viscosity*length of plate]

clc        %clear screen
clear all  %clearing all stored variables
close all  %close previous plots

dy = 0.5*(10^-3); %m , distance between the plates.
dpl = 200*(10^6); %Pa/m, pressure drop per distance of plate.
mu = 1.412;       %Pa-sec, viscosity of glycerol.
Vo = 0; %m/s, velocity of bottom plate
Vn = 0; %m/s, velocity of top plate 

n = 1000;  
b = ones(1,n); %initializing b matrix
dst = linspace(0,0.5,n); %diving distance between plates into 'n' parts

g = (((dy/n)^2)*dpl)/mu;  %calculating constant 

b = g.*b;   % forming b matrix 
b(1,1) = g+Vo;
b(1,n) = g+Vn;

% matrix A is a band matrix with elements -1,2,-1. 
v = -1*ones(1,n-1);
u =  2*ones(1,n);
A = diag(v,-1)+diag(u)+diag(v,1); %forming A matrix

vel = A\b'; %calculating velocity vector

%Now bottom plate is moving 
Vo = -10; %m/s velocity of bottom plate 
b(1,1) = g+Vo; %b vector will be changed
vel_2 = A\b'; %calculating new velocity vector

%plotting
hold on
plot(vel,dst,'r');
plot(vel_2,dst,'b');
xlabel('Velocity (m/s)','fontsize',15,'fontname','times new roman')
ylabel('Distance from bottom plate (mm)','fontsize',15,'fontname','times new roman')
title('Velocity Profile','fontsize',16,'fontname','times new roman')
legend('Both plates stationary','Bottom plate moving')




