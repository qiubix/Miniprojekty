function y=zad_1()
%funkcja liczaca dokladnosc maszynowa komputera
x=1;
while(x+1~=1)	% dzialanie dopoki komputer jest w stanie 'zauwazyc' zmienna
	y=x;		% zapamietanie ostatniej wartosci zmiennej
	x=x/2;		% dzielenie zmiennej przez 2
end
return;
