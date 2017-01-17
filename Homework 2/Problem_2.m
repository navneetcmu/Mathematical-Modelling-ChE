%HW2-Prb2
%Navneet Singh(nsingh1@andrew.cmu.edu) 

clc       %clear screen
clear all % clearing all stored variables
close all %close previous plots

%Defining A matrix
A =[3, 2, 2, 1; 2, 3, 1, 2; 2, 1, 2, 0; 1, 2, 0, 5]; 
[eigenvector, eigenvalues] = eig(A);

%Part A

%Printing eigenvalues and eigen vector. 
fprintf('eigen values=%4.3f\n',diag(eigenvalues));
for i=1:size(eigenvector,2)
 fprintf('norm %d: %d\n',i,round(norm(eigenvector(:,i)),2))

end
%Matlab uses Euclidean norm to calculate eigen vectors 

% Part B
%Symbolic eigen values and eigenvectors
[Eigenvectors,Eigenvalues] = eig(sym(A))

%Part C 
%Defining x matrix
x=[1 0 0 0]';

tolerance = 2;
i=1;
%we will calculate tolerance as difference between norms of consecutive
%vectors
while(tolerance>10^-6)
eigvctr=A*x;

eigvctr = eigvctr/max(eigvctr);
tolerance = norm(eigvctr)-norm(x);

x=eigvctr;

i=i+1;

end
fprintf('Eigenvalues using power method')
eigvctr
