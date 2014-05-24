function [M, E, Q, s1, s2, s3] = classificationOVO(A, tstv, tstl)
% funkcja klasyfikująca zbiór testowy na podstawie głosowań 45 klasyfikatorów OVO

% M -macierz pomylek
% M(:,1) - cyfry
% M(:,2) - TP 
% M(:,3) - FP
% M(:,4) - FN 
% E - macierz bledow
% Q - jakosc klasyfikacji

E = zeros(11,11);
E(1,:) = [-1 0 1 2 3 4 5 6 7 8 9];
E(:,1) = [-1 0 1 2 3 4 5 6 7 8 9]';

M = zeros(10,4);
M(:,1) = [0 1 2 3 4 5 6 7 8 9];


errors = zeros(10,1);
evasive = zeros(10,1);

for i = 1 : size(tstv,1)
	V = vote(A, tstv(i,:));
	[val id] = max(V); 	% próbka zostaje sklasyfikowana przez wybór wartości która otrzymała najwięcej głosów
	s = V;				% zapamietanie wyniku glosowania
	lab = tstl(i)+1;	% zapamietanie aktualnej etykiety
	
	% wyzerowanie najwiekszej wartosci w macierzy wynikowej glosowania, zeby sprawdzic, 
	% czy ktoras inna cyfra nie dostala takiej samej liczby glosow - decyzja wymijajaca
	V(id) = 0;
	tmp = max(V);
	
	% poprawna klasyfikacja
	if id==(lab)
		% zwiekszenie odpowiedniego pola w macierzy pomylek
		M(lab,2)=M(lab,2)+1; 			% TP +1
		
		if tmp == val
			% zwiekszenie odpowiedniego pola w macierzy pomylek 
			M(lab,4)= M(lab,4)+1;			% FN +1
			evasive(lab) = evasive(lab)+1;	% decyzja wymijajaca
		end
	
	% niepoprawna klasyfikacja
	else
		% zwiekszenie odpowiedniego pola w macierzy pomylek
		M(id,3)=M(id,3)+1;				% FP +1
		M(lab,4)=M(lab,4)+1;			% FN +1
		
		% inkrementacja licznika bledow
		errors(lab) = errors(lab)+1;
		
		% zaznaczenie, ktore cyfry zostaly pomylone
		E(lab+1,id+1) = E(lab+1,id+1)+1;
		
		if tmp == val
			% zwiekszenie odpowiedniego pola w macierzy pomylek 
			M(lab,4)= M(lab,4)+1;			% FN +1
			evasive(lab) = evasive(lab)+1;	% decyzja wymijajaca
		end
	end
end

% Zbudowanie macierzy pokazujacej jakosc klasyfikacji kazdej z cyfr
for i = 0 : 9
	er = errors(i+1)/size(tstv(tstl==i),1);
	ev = evasive(i+1)/size(tstv(tstl==i),1);
	ok = 1-er-ev;
	Q(i+1,:) = [i ok er ev];
end
	Q(11,:) = [0 sum(Q(:,[2 3 4]))/10];
	
	s2 = sum(errors);
	s3 = sum(evasive);
	s1 = size(tstl,1) - s2 - s3;