% CS 5810  -- Programming for data analysis 
%
%  Assignment 3 | Prof. Alberto Paccanaro
% 
%
% 
% Insert BELOW your code 
function [U,S] = myPCA(X)
[U,S] = (eig(cov(X)));
[S,id_S]= sort(diag(S'),'descend');
U = U(:,id_S);
end
