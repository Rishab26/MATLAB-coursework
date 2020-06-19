% CS5810  -- Programming for data analysis 
%
%  Assignment 2 | Prof. Alberto Paccanaro
% 
% INSERT YOUR CODE HERE!
function displaycarmodels()
load cardata.mat % please have the file in location
data_struct = struct('Cylinders',Cylinders,'Model',Model,'Origin',Origin,'Weight',Weight,'Horsepower',Horsepower);
C = {data_struct.Cylinders};
Car = table;
Car.Model = data_struct.Model;
Car.Origin = data_struct.Origin;
Car.Weight = data_struct.Weight;
Car.Horsepower = data_struct.Horsepower;
cyl_menu_options = num2cell(unique(data_struct.Cylinders));
cyl = menu('Choose number of cylinders:',cyl_menu_options);
index_cyl = find([C{:}] == cell2mat(cyl_menu_options(cyl)));
model_menu_options = cellstr(data_struct.Model(index_cyl,:));
model_menu = menu('Choose model:',model_menu_options);
cars_cyl = Car(index_cyl, :);
mm = model_menu_options(model_menu);
cars_cyl(strtrim(string(cars_cyl.Model)) == string(mm{1}), 2:4);
%sprintf("Horsepower : =%d",output_to_diplay);
end