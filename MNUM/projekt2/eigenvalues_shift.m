function [res it]=eigenvalues_shift(A)
% funkcja obliczajaca wartości własne macierzy metodą rozkładu QR z przesunięciem
	n=size(A,1);
	k=n;
	it=1;
	tolerance=0.01;
	itmax=10000;
	res=zeros(n,1);
	for k=n:-1:2
		while (it<=itmax & max(abs(A(k,1:(k-1))))>tolerance),
			smA = A([k-1 k],[k-1 k]);
			[v1 v2] = eigenvalues22(smA);
			if(abs(smA(2,2)-v1) < abs(smA(2,2)-v2))
				shift = v1;
			else
				shift = v2;
			end
			A = A-eye(k)*shift;
			it = it + 1;
			[Q,R]=QR_distribution(A);
			A=R*Q+eye(k)*shift;
		end
		res(k) = A(k,k);
		if k>2
			A=A(1:(k-1),1:(k-1));
		else
			res(1)=A(1,1);
		end
	end
end