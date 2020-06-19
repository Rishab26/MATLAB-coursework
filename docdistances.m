% CS 5810  -- Programming for data analysis 
%
%  Assignment 3 | Prof. Alberto Paccanaro
% 
%
% 
% Insert BELOW your code 
F = dir('*.txt');
N=length(F);
allWords = [];
mydata = cell(1, N);
tf_idf = cell(1, N);
my_data_corpus = cell(1, N);
file_name = cell(1, N);
for k = 1:N
    %file_namek] = F(k).name;
    mydata{k} = split(importdata(F(k).name));
    my_data_corpus{k}= split(lower(importdata(F(k).name)));
    mydata{k} = lower(mydata{k});
    [mydata{k},~,idx] = unique(mydata{k});
    numOccurrences = histcounts(idx,numel(mydata{k}));
    [rankOfOccurrences,rankIndex] = sort(numOccurrences,'descend');
    wordsByFrequency = mydata{k}(rankIndex);
    numOccurrences = numOccurrences(rankIndex);
    numOccurrences = numOccurrences';
    mydata{1,k} = cat(2,mydata{1,k},wordsByFrequency);
    numOccurences_t = num2cell(numOccurrences);
    mydata{1,k} = cat(2,mydata{1,k},numOccurences_t);
        
end

R = {[my_data_corpus{1}; my_data_corpus{2};my_data_corpus{3};my_data_corpus{4};my_data_corpus{5};my_data_corpus{6}]};
T_files = cell2table(mydata);
T = table;
Tf = table;
wordsByFrequency = unique(R{1,1});
T.Var1 = wordsByFrequency;
T = sortrows(T,'Var1','ascend');
T(1,:) = [];
T.Im1 = ismember(T.Var1,my_data_corpus{1},'legacy');
T.Im2 = ismember(T.Var1,my_data_corpus{2},'legacy');
T.Im3 = ismember(T.Var1,my_data_corpus{3},'legacy');
T.Im4 = ismember(T.Var1,my_data_corpus{4},'legacy');
T.Im5 = ismember(T.Var1,my_data_corpus{5},'legacy');
T.Im6 = ismember(T.Var1,my_data_corpus{6},'legacy');
T.sum = T.Im1 + T.Im2 + T.Im3 + T.Im4 +T.Im5 + T.Im6 ;
Tf.Var1 =T.Var1;
Tf.sum = T.sum;
t1=cell2table(T_files.mydata1{1}(:,2:3));
t2=cell2table(T_files.mydata2{1}(:,2:3));
t3=cell2table(T_files.mydata3{1}(:,2:3));
t4=cell2table(T_files.mydata4{1}(:,2:3));
t5=cell2table(T_files.mydata5{1}(:,2:3));
t6=cell2table(T_files.mydata6{1}(:,2:3));

T1 = outerjoin(Tf,t1,'key','Var1','Type','left','MergeKeys',true);
T1.Var2(isnan(T1.Var2)) = 0;
T1.tf_idf = T1.Var2 .* log(N./T1.sum);
T2 = outerjoin(Tf,t2,'key','Var1','Type','left','MergeKeys',true);
T2.Var2(isnan(T2.Var2)) = 0;
T2.tf_idf = T2.Var2 .* log(N./T2.sum);
T3 = outerjoin(Tf,t3,'key','Var1','Type','left','MergeKeys',true);
T3.Var2(isnan(T3.Var2)) = 0;
T3.tf_idf = T3.Var2 .* log(N./T3.sum);
T4 = outerjoin(Tf,t4,'key','Var1','Type','left','MergeKeys',true);
T4.Var2(isnan(T4.Var2)) = 0;
T4.tf_idf = T4.Var2 .* log(N./T4.sum);
T5 = outerjoin(Tf,t5,'key','Var1','Type','left','MergeKeys',true);
T5.Var2(isnan(T5.Var2)) = 0;
T5.tf_idf = T5.Var2 .* log(N./T5.sum);
T6 = outerjoin(Tf,t6,'key','Var1','Type','left','MergeKeys',true);
T6.Var2(isnan(T6.Var2)) = 0;
T6.tf_idf = T6.Var2 .* log(N./T6.sum);
Tf_idf = table;
Tf_idf.f1= T6.tf_idf;
Tf_idf.f2= T5.tf_idf;
Tf_idf.f3= T4.tf_idf;
Tf_idf.f4= T1.tf_idf;
Tf_idf.f5= T2.tf_idf;
Tf_idf.f6= T3.tf_idf;
Tf_idf_mat =table2array(Tf_idf);
cosine_dist = pdist((Tf_idf_mat)','cosine');
cosine_dist_files = squareform(cosine_dist);
imagesc(cosine_dist_files); 
colormap(gray);
colorbar;




