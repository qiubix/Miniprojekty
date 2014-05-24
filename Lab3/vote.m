function votes = vote(A, sample)
% glosowanie 45 klasyfikatorow one-vs-one nad jedna probka

% A - macierz zawierajaca wspolczynniki płaszczyzn decyzyjnych 
% sample - klasyfikowana próbka
% votes - wektor głosów ( votes(i) - liczba glosow na i ) 

votes = zeros(10,1);
n=1;

% kazda kolejna cyfre porownujemy z pozostalymi
for i = 0 : 9
	for j = i+1 : 9
		if([1 sample]*A(n,:)' > 0)		% probka powyzej plaszczyzny decyzyjnej
			votes(i+1) = votes(i+1)+1;	% glos na klase i
		else							% probka ponizej plaszczyzny decyzyjnej
			votes(j+1) = votes(j+1)+1;	% glos na klase j
		end
		n=n+1;
	end
end