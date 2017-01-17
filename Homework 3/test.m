function test

%% Problem 9
% $-u'' + \pi ^2 u = 2\pi ^2 sin(\pi x)
%
% Finite difference: Compared to $y''=p(x)y' + q(x)y + r(x)$
%
% we get $p(x)=0  \ q(x) = \pi ^2 \ r(x) = -2\pi ^2sin(\pi x)$
%
% define N = 10, then h = 1/10
%
% $d_i(1<i<N) = 2+\frac{\pi}{10}^2$
%
% $u_i = l_i =-1$
%
% $b =[\alpha, -h^2r_1, -h^2r_2, ... , -h^2r_{N-1}, \beta]^T$
%
 
N = 100;
h = 1/N;
alpha = 0;
beta = 0;
b = zeros(N-1,1);
xspan = linspace(0,1,N+1);
for i = 1:N-1
    b(i) = -h^2*(-2*pi^2)*sin(i*pi/N);
end
b = [alpha;b;beta];
A = diag((2+(pi/N)^2)*ones(1,N+1))+diag(-ones(1,N),1)+diag(-ones(1,N),-1);
A(1,1)=1;
A(N+1,N+1)=1;
A(1,2)=0;
A(N+1,N)=0;
x=A\b;
plot(xspan,x);
xlabel('x');
ylabel('u');
title('Problem 9');

% Shooting Methods:
u01 = 0;
uder01 = 0;
u02 = 0;
uder02 = 1;
u10 = [u01; uder01];
u20 = [u02; uder02];
tspan = [0; 0.25; 0.5; 0.75; 1];
[x1,u1]= ode45(@IVP1, tspan, [0 0]);
[x2,u2]= ode45(@IVP2, tspan, [0 1]);
u1(:,1)
u2(:,2)
% Neither u1(1) nor u2(1) equals to 0; we need another parameter c
c = (0-u1(5,1))/u2(5,1)
exact = sin(pi);
estim = u1(5,1)+c*u2(5,1);
error = estim - exact

% Initial Value Problem 1:
    function dudx = IVP1(x,u)
    dudx=zeros(2,1);
    dudx(1) = u(2);
    dudx(2) = pi^2*u(1)-2*pi^2*sin(pi*x);
    end
% Initial Value Problem 2:
    function dudx = IVP2(x,u)
    dudx=zeros(2,1);
    dudx(1) = u(2);
    dudx(2) = pi^2*u(1);  
    end

end