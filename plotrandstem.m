% CS 5810  -- Programming for data analysis 
%
%  Assignment 3 | Prof. Alberto Paccanaro
% 
%
% 
% Insert BELOW your code 
function plotrandstem(txtfile_name,n)
to_plot = readmatrix(txtfile_name);%check change to table
mat_to_plot = to_plot(:,[2 4]);
i_rand = randi([1 100],1,n);
stem(mat_to_plot(i_rand,1),mat_to_plot(i_rand,2));
stitle = sprintf('%d number of points',n);
title(stitle);
grid on;
xlabel('x axis')
ylabel('y axis')
xlim([0 20 40 60 80 100]);
end

