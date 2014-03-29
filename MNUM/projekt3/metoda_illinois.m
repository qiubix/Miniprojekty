function wynik = metoda_illinois(a0,b0,eps)
% Funkcja implementujaca metode illinois, czyli zmodyfikowana metode regula falsi
% a0 - poczatek przedzialu izolacji
% b0 - koniec przedzialu izolacji
% eps - dokladnosc
% wynik - macierz przechowujaca nr iteracji, x, f(x)

	f = '1.4*sin(x)-exp(x)+6*x-0.5'
	
	% sprawdzenie poprawnosci danych 
	if a0 < -5 || a0 > 5,
		error('Bledne dane!');
	end
	if b0 <= a0 || b0 > 5,
		error('Bledne dane!');
	end
	
	% inicjalizacja zmiennych
	i = 0;
	a = a0;
	b = b0; 
	fi = inline(f);
	fx = feval(fi,a);
	wynik = zeros(1,3);
	
	% liczniki zmian granic przedzialow
	skoczek_a = 0;		
	skoczek_b = 0;

	% dopoki nie zostanie osiagnieta wymagana dokladnosc
	while abs(fx) > eps, 

		fa = feval(fi,a); 	% obliczenie f(a)
		fb = feval(fi,b);	% obliczenie f(b)
		
		% sprawdzenie, czy w danym przedziale liczba pierwiastkow jest nieparzysta
		if fa * fb > 0, 
		  error('W przedziale parzysta liczba pierwiastkow!');
		end
		
		% obliczenie nastepnej wartosci (cn)
		% ... gdy b nie zmieniany przez 2 kolejne iteracje
		if skoczek_b > 1 
			x = (a*fb/2 - b*fa)/(fb/2 - fa);
		% ... gdy a nie zmieniany przez 2 kolejne iteracje
		elseif skoczek_a > 1
			x = (a*fb - b*fa/2)/(fb - fa/2);
		else
			x = (a*fb - b*fa)/(fb - fa);
		end
		
		% obliczenie f(c)
		fx = feval(fi,x);

		% sprawdzenie, w ktorym przedziale jest pierwiastek
		if fa*fx <= 0,
		  b = x;
		  % niezmieniony pierwiastek ma inkrementowany licznik
		  skoczek_a = skoczek_a + 1;	
		  skoczek_b = 0;
		else
		  a = x;
		  % niezmieniony pierwiastek ma inkrementowany licznik
		  skoczek_b = skoczek_b + 1;
		  skoczek_a = 0;
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
