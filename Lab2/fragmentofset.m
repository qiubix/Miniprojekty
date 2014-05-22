function nset = fragmentofset(s,part)

s

s4 = s(s(:,1)==4,:)
s3 = s(s(:,1)==3,:);
s2 = s(s(:,1)==2,:);
s1 = s(s(:,1)==1,:);

s4 = s4(randperm(size(s4,1)),:)
s3 = randperm(size(s3,1));
s2 = randperm(size(s2,1));
s1 = randperm(size(s1,1));

size4 = size(s4,1);

nset = [s4(size4,:);s3(size(s3,1),:);s2(size(s2,1),:);s1(size(s1,1),:)]
