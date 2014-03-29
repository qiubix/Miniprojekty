function wyn=zad_2_plot(n,wer)
% funkcja rysujaca wykres zaleznosci bledu rozwiazania od liczby rownan

b=zeros(n,1);			% przygotowanie wektora bledow
for i=1:n,
  b(i,1)=zad_2(i,wer);	% policzenie bledu dla kazdej liczby rownan
end
x = 1:n;
plot(x,b(x));			% narysowanie wykresu
title('Dane nr.');
xlabel('n - liczba rownan');
ylabel('b³¹d rozwi¹zania');
return
