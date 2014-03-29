function [A]=generate(n,symmetry)
	A=rand(n,n)*10;
	if (symmetry==1)
		A=A+A';
	end
end