function y = jacknife(set)
% measures classifier's quality using method leave-one-out
% set - set of samples;

error = 0;

for i=1:size(set,1)
	x = set(i, 2:end);		% x - sample to be tested in current iteration
	ts = [set(1:i-1,:) ; set(i+1:end, :)];
	%ts = set(1:end != i, :);
	label = cls1nn(ts,x);
	if label != set(i,1)
		error = error + 1;
	end
end
	y = error / size(set,1);