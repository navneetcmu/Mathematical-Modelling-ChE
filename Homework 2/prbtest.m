function prbtest
clc
clear all

for n = 1:5
A = rand(1,10^n);
t = insort(A);
hold on 
plot(n,log(t),'bo')
end

function [time] = insort(A) 
tic;
for j = 2:length(A)
    key = A(j);
    i = j-1;
    while(i>0 && A(i)>key)
        A(i+1) = A(i);
        i = i-1;
    end
    A(i+1)=key;
end
time = toc; 
end
end


        
    