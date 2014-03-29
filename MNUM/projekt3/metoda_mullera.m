function [] = metoda_mullera(a,eps)
% Funkcja implementujaca metode Muller'a
% a - punkt startowy
% eps - dokladnosc

	f = 'x^4 +3*x^3 -8*x^2 +4*x+2';
	fprim = '4*x^3 + 9*x^2 - 16*x + 4';	% pierwsza pochodna
	fbis = '12*x^2 + 18*x - 16';			% druga pochodna
	
	fi = inline(f);
	fiprim = inline(fprim);
	fibis = inline(fbis);
	
	x0 = a;		% punkt startowy
	fx = feval(fi,x0);
	
	i = 0;
	
	while abs(fx) > eps 
	
		a = feval(fibis,x0)/2;	% f''(0)
		b = feval(fiprim,x0);	% f'(0)
		c = fx;					% f(0)
		
		% wzory na z+ i z-
		zp = -2*c / (b + sqrt(b^2 - 4*a*c));
		zm = -2*c / (b - sqrt(b^2 - 4*a*c));
		
		% wybieramy z o mniejszym module. Jest to nasze przyblizenie rozwiazania
		if( abs(zm) >= abs(zp) )
			z = zp;
		else
			z = zm;
		end
		
		% obliczenie punktu startowego do nastepnej iteracji
		x0 = x0 + z;
		fx = feval(fi, x0);
		% wypisanie
		i=i+1;
		i
		x0
		fx
	end
end
	
	
	
