function quality = cls1nn(ts, test)
% 1-NN classifier
% ts - training set; first column contains samples' labels
% 

labels = zeros(size(test,1),1);

for i=1:size(test,1)
[mv mid] = min( sumsq( ts(:,2:end) - repmat(test(i,2:end),size(ts,1),1), 2) );
labels(i) = ts(mid,1);
end;

err = labels == test(:,1);
quality = sum(err)/size(test,1)

