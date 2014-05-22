function quality = classifier1(ts,test)
% 
% ts - training set
% test - test set
% quality - function returns calculated quality of classifier
	
mu_spades    	= mean(ts(ts(:,1)==4,2:end));
mu_hearts     	= mean(ts(ts(:,1)==3,2:end));
mu_diamonds 	= mean(ts(ts(:,1)==2,2:end));
mu_clubs 		= mean(ts(ts(:,1)==1,2:end));
cov_spades 	= cov(ts(ts(:,1)==4,2:end));
cov_hearts		= cov(ts(ts(:,1)==3,2:end));
cov_diamonds	= cov(ts(ts(:,1)==2,2:end));
cov_clubs		= cov(ts(ts(:,1)==1,2:end));

dens = zeros(size(test,1), 4);
dens(:, 4) = mvnpdf(test(:,2:end),mu_spades,cov_spades.*eye(2));
dens(:, 3) = mvnpdf(test(:,2:end),mu_hearts,cov_hearts.*eye(2));
dens(:, 2) = mvnpdf(test(:,2:end),mu_diamonds,cov_diamonds.*eye(2));
dens(:, 1) = mvnpdf(test(:,2:end),mu_clubs,cov_clubs.*eye(2));

[v labels] = max( dens, [], 2);

err = labels == test(:,1);
quality = sum(err)/size(test,1)
