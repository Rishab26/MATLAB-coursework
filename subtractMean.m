% CS 5810  -- Programming for data analysis 
%
%  Assignment 3 | Prof. Alberto Paccanaro
% 
%
% 
% Insert BELOW your code 
function [Xmu,mu] = subtractMean(X)
mu = mean(X);
Xmu = X - mu;
end

