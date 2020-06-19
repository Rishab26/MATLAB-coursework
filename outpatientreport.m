% CS5810  -- Programming for data analysis 
%
%  Assignment 2 | Prof. Alberto Paccanaro
% 
% INSERT YOUR CODE HERE!

function [data] = outpatientreport(i)
load myhospital.mat;
Age = num2cell(Age);
isSmoker = num2cell(isSmoker);
Weight = num2cell(Weight);
data_struct = struct('LastName',LastName,'Sex',Sex,'Age',Age,'Weight',Weight,'isSmoker',isSmoker);
i_rand = randi([1 100],1,10);
fprintf('LastName Sex Age Weight isSmoker \n')
for j= 1:length(i_rand)
fprintf('%s\t %s\t %d\t %d\t %d\t\n', data_struct(i_rand(j)).LastName,...
 data_struct(i_rand(j)).Sex, data_struct(i_rand(j)).Age, data_struct(i_rand(j)).Weight ,data_struct(i_rand(j)).isSmoker);
end
data = data_struct(i);
weight = {data_struct.Weight};
smoker = {data_struct.isSmoker};
Weight_data = cell2mat(weight);
isSmoker_data = cell2mat(smoker);
boxplot(Weight_data,isSmoker_data);
grid on;
xlabel('isSmoker?');
xticklabels({'No','Yes'})
ylabel('Weight(Kg)');
end
 




