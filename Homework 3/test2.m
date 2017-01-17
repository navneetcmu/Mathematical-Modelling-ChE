function test2
a =  0.6893; 
guess = 0.2
[r, u] = ode45(@dudt, [0 1.3], [guess 0])

function f = dudt(r, u)
     f = zeros(2,1);
     f(1) = u(2);
     if r == 0 %as equation contain 1/r it will get undefined at r=0. 
         f(2) = a*u(1);
     else
         f(2) = a*u(1) - (1/r)*u(2); 
     end
end

end
