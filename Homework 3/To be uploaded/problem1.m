%HW-3 Prb-1
%Navneet Singh (nsingh1@andrew.cmu.edu) 
function problem1
clc       %clear screen
clear all %clearing all stored variables
close all %close previous plots

%Part(a) (Pepsin catalyzed)

%Given Variables
k_cat = 0.5; %sec^-1
Km = 0.3; %mM 
So = 1; %mM

tspan = [0 70]; %sec
po = 0; %initial concentration of product
E0 = 0.1 * So; %10% of initial substrate concentration. 

%Calling ode45 to solve the differential equation. 
[t1,p1] = ode45(@rate, tspan, po);

%calculating all concentrations 
s = So - p1;
es = E0*s ./ (Km+s);
eo = ones(length(t1)).*E0; 

%plotting
figure
plot(t1,p1, t1,s, t1,es, t1,eo);
legend('[P]', '[S]', '[ES]', '[E]')
title('Pepsein Catalyzed: Concentration vs Time')
xlabel('Time (seconds)')
ylabel('Concentration (mM)')

%Part(b) Fumarase Catalyzed 

%Given Variables
k_cat = 0.08; %sec^-1
Km = 50 * 10^-3; %mM 
So = 1; %mM
tspan = [0 200];%sec

%Calling ode45 to solve the differential equation. 
[t2,p2] = ode45(@rate, tspan, po); 

%calculating concentrations
s = So - p2;
es = E0*s ./ (Km+s);
eo = ones(length(t2)).*E0; 

%plotting
figure 
plot(t2,p2, t2,s, t2,es, t2,eo);
legend('[P]', '[S]', '[ES]', '[E]')
title('Fumarase Catalyzed: Concentration vs Time')
xlabel('Time (seconds)')
ylabel('Concentration (mM)')


%Defining ODE function to be solved
function F = rate(t, p)
    F = k_cat * E0 * ((So -p)/(Km + (So - p))); 
end

figure
plot(t1,p1, t2,p2, t2,ones(length(t2))*So,'k-')
legend('Pepsin', 'Fumarase', 'Initial substrate conc')
title('Impact of different parameters on product concentration')
xlabel('time(seconds)')
ylabel('Concentration(mM)')
end


