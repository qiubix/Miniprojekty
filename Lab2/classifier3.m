function quality = classifier3(train,test,h1)
% Classifier using Parzen's window
% ts - training set
% test - test set
% quality - function returns calculated quality of classifier

t4 = train(train(:,1)==4,2:end);
t3 = train(train(:,1)==3,2:end);
t2 = train(train(:,1)==2,2:end);
t1 = train(train(:,1)==1,2:end);

dens = zeros(size(test,1), 4);

for i=1:size(test,1)
dens(i,4) = mean(mvnpdf(t4,test(i,2:end), h1^2 * eye(2)));
dens(i,3) = mean(mvnpdf(t3,test(i,2:end), h1^2 * eye(2)));
dens(i,2) = mean(mvnpdf(t2,test(i,2:end), h1^2 * eye(2)));
dens(i,1) = mean(mvnpdf(t1,test(i,2:end), h1^2 * eye(2)));
end;

[v labels] = max( dens, [], 2);

err = labels == test(:,1);
quality = sum(err)/size(test,1)
