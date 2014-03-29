function [res it]=eigenvalues(A)
% funkcja obliczajaca wartosci wlasne macierzy metoda rozkladu QR bez przesuniecia
	n=size(A,1);
	it=1;
	tolerance=0.01;
	itmax=10000;
	while (it<=itmax & max(max(A-diag(diag(A))))>tolerance),
		it = it + 1;	
		[Q,R]=QR_distribution(A);
		A=R*Q;
	end
	if it>itmax
		res=zeros(n,1);
	else
		res=diag(A);
	end
end