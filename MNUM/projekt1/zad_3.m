function x = zad_3(wer)
if (wer==0),
  A=[14, -1, -3, 5; 1, -7, -4, -1; 2, -4, -12, -1; 1, -1, 6, -16];
  b=[1;0;-10;-2];
else
  C=data_2(4,wer);					% pobranie danych z zadania 2.
  A=C(1:4,1:4);						% rozbicie na macierze A 
  b=C(:,5);							% .. i b
end

% inicjalizacja macierzy L, D i U
L=zeros(4);							% macierz dolnotrojkatna
D=zeros(4);							% macierz diagonalna
U=zeros(4);							% macierz gornotrojkatna

for i=1:4,							% zapisanie danych z macierzy A
  for j=1:4,						% w odpowiednich polach macierzy
    if i<j,
	U(i,j)=A(i,j);					% ...U
    elseif i==j,
	D(i,j)=A(i,j);					% ...D
    else
	L(i,j)=A(i,j);					% ...L
    end
  end
end

x=eye(4,1);							% utworzenie wektora x
x1=zeros(4,1);						% i x1, odpowiadajacych 
bl = zeros(1,1);					% wektor przechowujacy bledy w kolejnych iteracjach
%k=1;

x=x+1;
eps=2*zad_1;
blad = 1;

%while abs(x1-x)>eps,				
while blad > 10^(-10),				% dopoki nie zostanie osiagnieta wymagana dokladnosc
	%plot(k,b1(k));
	x1=x;
	w=U*x-b;						% zapisanie zmiennej pomocniczej
	for i=1:4,
		x(i)=-w(i);
    	for j=1:i,
			x(i)=x(i)-x(j)*L(i,j);	% policzenie x w kolejnej iteracji, korzystajac z x w poprzednej
    	end
    	x(i)=x(i)/D(i,i);
  	end
	r=b-A*x;						% obliczenie bledu rozwiazania
	blad=0;
	for i=1:(size(r)),			
		blad=blad+abs(r(i));
	end
	bl = [bl;blad];
	%k = k+1;
end

%rysowanie zaleznosci bledu rozwiazania od numeru iteracji
bl(1)=[];
k=1:(size(bl));
plot(k,bl(k));
title('Dane nr.');
xlabel('k - numer iteracji');
ylabel('b³¹d rozwi¹zania');

return
