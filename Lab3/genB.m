function B = genB(tvec, tlab)
% generowanie macierzy zawierajacej parametry kolejnych plaszczyzn decyzyjnych
% ktore rozdzielaja klasy cyfr 
% 9 klasyfikatorow typu one-vs-rest

% tvec - zbior uczacy 
% tlab - etykiety zbioru uczacego
% B - macierz z parametrami plaszczyzn decyzyjnych. Kolejne wiersze zawieraja kolejne wektory parametrow dla klasyfikatorow

B = zeros(1,size(tvec,2)+1);

for i = 0 : 9
		error = 1;
		for k = 1 : 5
			b = genDec(tvec(tlab == i,:), tvec(tlab ~= i,:));
			J1 = [ones(size(tvec(tlab==i), 1),1) tvec(tlab==i,:)]*b';
			J2 = [ones(size(tvec(tlab~=i), 1),1) tvec(tlab~=i,:)]*b';
			new_error = (sum(J1<0) + sum(J2>=0))/(size(tvec(tlab==i),1) + size(tvec(tlab~=i),1));
			if new_error < error
				B(i+1,:) = b;
				error = new_error;
			end
		end
	end
end
