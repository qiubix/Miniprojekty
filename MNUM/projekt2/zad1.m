function [iterations]=zad1()
	iterations=zeros(30,3);		%macierz przechowujaca liczbe iteracji
	for x=1:30
		switch (x)
			case x>20,
			n=20;
			case x>10,
			n=10;
			case x>0,
			n=5;
		end
		A=rand(n,n)*10;			% generacja losowej macierzy nxn
		A=A+A';					% ... symetrycznej
		[M1 it1] = eigenvalues(A);			% obliczenie wartosci wlasnych bez i 
		[M2 it2] = eigenvalues_shift(A);	% ... z przesunieciem
				
		B=rand(n,n)*10;			% generacja losowej macierzy niesymetrycznej
		[M3 it3] = eigenvalues_shift(B);	% obliczenie wart. wlasnych z przesunieciem
		
		iterations(x,1)=it1;	%zapisanie liczby iteracji do macierzy lacznej
		iterations(x,2)=it2;
		iterations(x,3)=it3;
		
		% co pewien czas porownanie wynikow z metoda eig MATLABa
		if (rand(1)>0.9)		
			MATLAB_eigenvalue=eig(A)
			M1
			M2
			MATLAB_eigenvalue2=eig(B)
			M3
		end
end