% CS5810  -- Programming for data analysis 
%
%  Assignment 2 | Prof. Alberto Paccanaro
% 
% INSERT YOUR CODE HERE!
function [n] = myevalueA(err)
% Approximates 1/e as (1-1/n)^n, and determines
% the value of n required for diff between actual and approx <error
n=1;
actual = exp(1);
approx = 1/((1 - 1/n)^n);
diff = (approx - actual);
while diff > err
    n = n + 1; 
    approx = 1/((1 - 1/n)^n);
    diff = (approx - actual);
    
end
end

