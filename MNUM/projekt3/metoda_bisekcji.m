function wynik = metoda_bisekcji(a0,b0,eps)
% Funkcja implementujaca metode bisekcji
% a0 - poczatek przedzialu izolacji
% b0 - koniec przedzialu izolacji
% eps - dokladnosc
% wynik - macierz przechowujaca nr iteracji, x, f(x)

	f = '1.4*sin(x)-exp(x)+6*x-0.5'

	% sprawdzenie poprawnosci danych 
	if a0 < -5 || a0 > 5,
		error('B³êdne dane!');
	end
	if b0 <= a0 || b0 > 5,
		error('B³êdne dane!');
	end
	
	% inicjalizacja zmiennych
	i = 0;
	a = a0;
	b = b0;
	fi = inline(f);
	fx = feval(fi,a);
	wynik = zeros(1,3);

	% dopoki nie zostanie osiagnieta wymagana dokladnosc
	while abs(fx) > eps, 

		fa = feval(fi,a);  % obliczenie f(a)
		fb = feval(fi,b);  % obliczenie f(b)

		% sprawdzenie, czy w danym przedziale liczba pierwiastkow jest nieparzysta
		if fa * fb > 0, 
		  error('W przedziale parzysta liczba pierwiastkow!');
		end
		
		% obliczenie nastepnej wartosci (cn)
		x = (a+b)/2;
		fx = feval(fi,x);	% obliczenie f(c)
		
		% sprawdzenie, w ktorym przedziale jest pierwiastek
		if fa*fx<=0,
		  b = x;
		else
		  a = x;
		end
		
		% inkrementacja licznika iteracji i wypisanie wynikow czastkowych
		i=i+1;
		i
		x
		fx
		wynik(i,1) = i;
		wynik(i,2) = x;
		wynik(i,3) = fx;
		wynik = [wynik; [0 0 0]];
	end
end
