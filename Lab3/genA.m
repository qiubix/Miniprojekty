function A = genA (tvec, tlab)
% generowanie macierzy zawierajacej parametry kolejnych plaszczyzn decyzyjnych
% ktore rozdzielaja klasy cyfr 
% 45 klasyfikatorow typu one-vs-one

% tvec - zbior uczacy 
% tlab - etykiety zbioru uczacego
% A - macierz z parametrami plaszczyzn decyzyjnych. Kolejne wiersze zawieraja kolejne wektory parametrow dla klasyfikatorow

A = zeros(1,size(tvec,2)+1);
n=1;

for i = 0 : 8
	for j = i+1 : 9
		error = 1;
		for k = 1 : 5
			a = genDec(tvec(tlab == i,:), tvec(tlab == j,:));
			J1 = [ones(size(tvec(tlab==i), 1),1) tvec(tlab==i,:)]*a';
			J2 = [ones(size(tvec(tlab==j), 1),1) tvec(tlab==j,:)]*a';
			new_error = (sum(J1<0) + sum(J2>=0))/(size(tvec(tlab==i),1) + size(tvec(tlab==j),1));
			if new_error < error
				A(n,:) = a;
				error = new_error;
			end	
		end
		n=n+1;
	end
end
