% CS5810  -- Programming for data analysis 
%
%  Assignment 2 | Prof. Alberto Paccanaro
% 
% INSERT YOUR CODE HERE!
function [avg_cal] = caloriesaverage(i)
persistent count;
persistent sum_cal;
if isempty(count)
    count= 1;
    disp(count)
else
    count = count +1;
    
end
if(i ~= 0 && count ==1)
    sum_cal = i;
    avg_cal = i;
    if(sum_cal > 2000)
        disp("You have reached/exceeded the recommended calories consumption for one day")
    end
    
elseif(i ~=0 && count~=1)
    sum_cal = sum_cal + i;
    avg_cal = sum_cal/count;
    if(sum_cal > 2000)
        disp("ALERT : You have reached/exceeded the recommended calories consumption for one day")
    end
    
elseif(i ==0)
    avg_cal = 0;
    clear count;
    
end
end
