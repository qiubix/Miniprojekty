function [A,b] = data_2(n,wer)
% Funkcja generuje dane do zadania 2
% Argumenty:
% n - liczba rownan liniowych
% wer - wersja danych {1,2,3}

A=eye(n,n+1); 				% inicjalizacja macierzy A jedynkami na przekatnej
b=eye(n,1);					% inicjalizacja wektora b jedynkami

if wer==1,
	A=A*11;					% a_ii = 11
	for i=1:n,
	for j=1:n,
		if abs(i-j)==1,		% i=j-1 lub i=j+1
			A(i,j)=4;		% a_ij = 4
		end
	end
	b(i)=3.1+0.4*i;			% b_i = 3,1+0,4i
	end

elseif wer==2,
	for i=1:n,
	for j=1:n,
		A(i,j)=1.5*(i-j)+2;	% a_ij = 1,5(i-j)+2
	end
	A(i,i)=1/6;				% a_ii = 1/6
	b(i)=0.9+0.5*i;			% b_i = 0,9+0,5i
	end

elseif wer==3,
	for i=1:n,
	for j=1:n
		A(i,j)=7/(9*(i+j+1));	% a_ij = 7/[9(i+j+1)]
	end
	b(i)=1.5+2*i;			% b_i = 1,5+2i
	end
end
A(:,n+1)=b;					% A = [A|b]

return

