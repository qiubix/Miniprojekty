function blad=zad_2(n,wer)	
% Implementacja metody eliminacji Gaussa z czesciowym wyborem elementu glownego
% n - liczba rownan do rozwiazania
% wer - wersja danych wejsciowych {0,1,2,3}
% blad - blad rozwiazania liczony jako norma wektora residuum

if wer==0,
  n=3;
  C=[4 2 6 3; 5 1 3 2; 1 1 1 5];			% dane testowe
else
  C=data_2(n,wer);							% generacja odpowiednich danych
end

A=C;										% zapisanie wygenerowanych danych w macierzy A

for i=1:n-1 								% dla każdej kolumny
	[m k] = max(abs(A(i:n,i)));				% wybor najwiekszej wartosci (co do modulu) wraz z numerem pola
	k=k+i-1;								% wybranie odpowiedniego k
	if (A(k,i)<0)
		%A(k,:) = -1*A(k,:);
		m = -1*m;							% ustawienie wlasciwego znaku, abs powyzej "usunal minus"		
	end
	if k~=i 								% wiersz z najwieksza wartoscia w zlym miejscu
		temp=A(k,:); 						% zamiana wierszy - zapisanie wiersza do zamiany
		A(k,:)=A(i,:);						% zamiana wierszy - podstawienie
		A(i,:)=temp;	 					% zamiana wierszy - wstawienie zapamietanego wiersza
	end
	temp=A(i,:);							% wstawienie 
	for j=i+1:n 							
		A(j,:) = A(j,:) - (A(j,i)/m)*temp;	% Aj = Aj - l*Ai czyli zerowanie
	end
end


x(n,1)=A(n,n+1)/A(n,n);						% wyliczenie wartości ostatniego x
for i=1:n-1 								% wypelnianie wektora x
	suma = 0;
	for j=1:i
		suma = suma + A(n-i,n+1-j)*x(n+1-j);% sumowanie w danym wierszu x-ow pomnozonych przez ich wspolczynniki
	end
	x(n-i,1)=(A(n-i,n+1)-suma)/A(n-i,n-i);	% obliczenie x dla danego wiersza: (b - suma czynnikow)/wspolczynnik
end

b=A(:,n+1);									% utworzenie wektora b
r=C(:,1:n)*x-C(:,n+1);								% obliczenie residuum
blad=0;
for x=1:(size(r)),							% obliczenie 2 normy residuum
	blad=blad+abs(r(x));
end
A = C(:,1:n);
c = cond(A)
return
