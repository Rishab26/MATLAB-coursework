% CS5810  -- Programming for data analysis 
%
%  Assignment 2 | Prof. Alberto Paccanaro
% 
% INSERT YOUR CODE HERE!
%TheTortoiseAndTheHare
function [o2,o1] = wordscount(n)
txt_file = fileread('TheTortoiseAndTheHare.txt');
txt_file = string(txt_file);
txt_file = splitlines(txt_file);
TF = (txt_file == "");
txt_file(TF) = [];
txt_file = strip(txt_file);
txt_fileWords = arrayfun(@(x) split(x),txt_file,'uni',0);
B = [txt_fileWords{:}];
txt_fileWords_l = lower(B);
[words,~,idx] = unique(txt_fileWords_l);
numOccurrences = histcounts(idx,numel(words));
[rankOfOccurrences,rankIndex] = sort(numOccurrences,'descend');
wordsByFrequency = words(rankIndex);
numOccurrences = numOccurrences(rankIndex);
numOccurrences = numOccurrences';
T = table;
T.Words = wordsByFrequency;
T.NumOccurrences = numOccurrences;
H = height(T);
o2 =sortrows(T((H-n:H),:));
o1 =T.Words(1:n,1);
%disp(o2);
disp(T);
end