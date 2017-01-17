%HW1-Prb3
%Navneet Singh(nsingh1@andrew.cmu.edu) 

clc        %clear screen
clear all  %clearing all stored variables
close all  %close previous plots  
  

  alpha = -500:500; % defining range of alpha
  for i =1:length(alpha)
      b = [5;-2;7];
      A = [-3 -2 1; 2 alpha(i) 1; 3 1 -2]; %defining matrix A. 
      t(1,i) = cond(A,2); %finding condition number of the matrix. 
  end
  
  %plotting condition number
  plot(alpha,t,'o')
  xlabel('Alpha','fontsize',15,'fontname','times new roman')
  ylabel('Condition number','fontsize',15,'fontname','times new roman')
  title('Condition number vs alpha','fontsize',16,'fontname','times new roman') 

  
  %condition number of ill-conditioned system is very large. 
  %By observing plot, we can see that for one value of alpha, condition number is extremely large 
  %Now we have to find that value of alpha
  
  for i = 1:length(t) %we have stored condition number in 't' matrix
      if t(i) > 1000  %defining tolerance for error. 
          fprintf('Value of alpha for which system is ill-conditioned = %d \n',alpha(i))
      end
  end

  
  
  



 
