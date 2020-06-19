% CS5810  -- Programming for data analysis 
%
%  Assignment 2 | Prof. Alberto Paccanaro
% 
% INSERT YOUR CODE HERE!
function ecompare(err)
valA = arrayfun(@(x) myevalueA(x),err);
valB = arrayfun(@(x) myevalueB(x),err);
plot(err,valA,err,valB);
end