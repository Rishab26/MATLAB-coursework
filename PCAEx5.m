% CS 5810  -- Programming for data analysis 
%
%  Assignment 3 | Prof. Alberto Paccanaro
% 
%
% 
% Insert BELOW your code 

pca_s = load("pcadata.mat");
pca = cell2mat(struct2cell(pca_s));
X = load("pcafaces.mat");
X = cell2mat(struct2cell(X));
figure(1)
hold on
scatter(pca(:,1),pca(:,2),'o','b');
xlim([0 7]);
ylim([2 8]);
[Xmu,mu]= subtractMean(pca);
[Xmu_faces,mu_faces] = subtractMean(X(1:100,:));
[U,S]=myPCA(Xmu);
[U_faces,S_faces] = myPCA(Xmu_faces);
line([mu(1) mu(1)+U(1,1)],[mu(2) mu(2)+U(2,1)],'Color','r');
line([mu(1) mu(1)+U(1,2)],[mu(2) mu(2)+ U(2,2)],'Color','g');
hold off
k=1;
Z = projectData(Xmu,U,k);
Z_faces = projectData(Xmu_faces,U_faces,200);
disp(Z(1:3,:));
figure(2)
hold on
Xrec = recoverData(Z, U, k, mu);
scatter(pca(:,1),pca(:,2),'o','b');
xlim([0 7]);
ylim([2 8]);
scatter(Xrec(:,1),Xrec(:,2),'*','r');
hold off
Xrec_faces = recoverData(Z_faces, U_faces, 200, mu_faces);
figure(3)
displayData(X(1:100,:));
figure(4)
subplot(1,2,1);
displayData(X(1:100,:));
title("Original faces");
subplot(1,2,2);
displayData(Xrec_faces(1:100,:));
title("Recovered faces");

