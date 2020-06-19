% CS5810  -- Programming for data analysis 
%
%  Assignment 2 | Prof. Alberto Paccanaro
% 
% INSERT YOUR CODE HERE!
function plotfun(vec)
n = length(vec);
if((rem(n,2)==0) && n<13)
   user_input = input("Input mathematical function",'s');
   %str = 'x^2+3';
   func = str2func(['@(x)' user_input]);
   n_points = arrayfun(@(z) linspace(1,10,z),vec,'uni',0);
   fun = cellfun(func,n_points,'uni',0);
   k =floor(n/2);
   
 end
   for i =1:n
       subplot(k,2,i)
       y=(fun{i})';
       x =(n_points{i})';
       scatter(x,y,'r','.');
       %s.Marker = '.';
       stitle = sprintf('number of points = %d',vec(i));
       title(stitle);
      
   end
end
