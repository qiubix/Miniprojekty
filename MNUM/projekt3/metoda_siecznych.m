function [] = metoda_siecznych(a0,b0,eps)
% Funkcja implementujaca metode siecznych
% a0 - poczatek przedzialu izolacji
% b0 - koniec przedzialu izolacji
% eps - dokladnosc
% wynik - macierz przechowujaca nr iteracji, x, f(x)

	f = '1.4*sin(x)-exp(x)+6*x-0.5';

	% sprawdzenie poprawnosci danych 
	if a0 < -5 || a0 > 5,
		error('Bledne dane!');
	end
	if b0 <= a0 || b0 > 5,
		error('Bledne dane!');
	end

	% inicjalizacja zmiennych
	i = 0;
	Xn_1 = b0;
	Xn = a0;
	x = Xn;
	fi = inline(f);
	fXn = feval(fi,Xn);

	% dopoki nie zostanie osiagnieta wymagana dokladnosc
	while( abs(fXn)>eps ),

		fXn_1 = feval(fi,Xn_1); % obliczenie f(x_n + 1)
		fXn = feval(fi,Xn);		% obliczenie f(x_n)

		if Xn < a0 || Xn > b0 || (fXn - fXn_1)==0,
			error('Metoda rozbiezna w tym przedziale.');
		end
		i = i+1
		
		% obliczenie nowego X_n i podstawienie do kolejnej iteracji
		Xn1 = Xn -(fXn * (Xn-Xn_1)) / (fXn - fXn_1); 
		Xn_1 = Xn;
		Xn = Xn1
		x = Xn;
		fXn
	end
end
