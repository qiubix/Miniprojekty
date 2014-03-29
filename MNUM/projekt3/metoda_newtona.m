function [] = metoda_newtona(a,eps)
% Funkcja implementujaca metode Newton'a
% a - punkt startowy
% eps - dokladnosc

	f = '1.4*sin(x)-exp(x)+6*x-0.5';
	%f = 'x^4 +3*x^3 -8*x^2 +4*x+2';

	fprim = diff(f,'x');
	
	% sprawdzenie poprawnosci danych 
	if a < -5 || a > 5
		error('Bledne dane!');
	end
	
	% inicjalizacja zmiennych
	i = 0; 
	Xn = a;		% ustawienie punktu startowego
	x = Xn;
	fi = inline(f);
	fiprim = inline(fprim);
	fXn = feval(fi,Xn);				% wyliczenie f(x)
	fprimXn = feval(fiprim,Xn);		% wyliczenie f'(x)

	while abs(fXn) > eps & abs(fprimXn) > 2*eps,
		% obliczenie kolejnego x_n
		Xn = Xn - (fXn ./ fprimXn);    

		i = i + 1
		Xn
		fXn = feval(fi,Xn)
		fprimXn = feval(fiprim,Xn);
	end
	
	if abs(fXn) > eps,
		error('Metoda rozbie¿na w tym przedziale');
	end
end
