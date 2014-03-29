%zwraca normy residuum i normy roznic miedzy wynikami dwoch metod
function [rest diff] = zad2()
% dane z zadania
A(:,1) = ones(1,11);
A(:,2) = -5:5;
b = [-5.8643; -6.7445; -5.2378; -3.2868; -2.2393; -0.5084; -1.2237; -0.7893; -4.8761; -11.0466; -20.0868];

% narysuj punkty
plot(A(:,2),b, '*')
x = -6:.1:6;
hold on

%funkcja liniowa
[x1, x2]=fit(A,b);					% dopasowanie funkcji
diff(1)=norm(x1-x2);			
y = @(x) x1(1) + x1(2)*x;			% funkcja f(x)
rest(1) = norm(b-A*x1);				% obliczenie normy residuum
plot(x,y(x),'c')					% rysowanie wykresu funkcji

%wielomian 2 stopnia
A=[A,(A(:,2)).^2];					
[x1, x2]=fit(A,b);					% dopasowanie funkcji
diff(2)=norm(x1-x2);
y = @(x) x1(1) + x1(2)*x + x1(3)*x.^2;
rest(2) = norm(b-A*x1);				% obliczenie normy residuum
plot(x,y(x),'m')

%wielomian 3 stopnia
A=[A,(A(:,2)).^3];
[x1, x2]=fit(A,b);					% dopasowanie funkcji
diff(3)=norm(x1-x2);
y = @(x) x1(1) + x1(2)*x + x1(3)*x.^2 + x1(4)*x.^3;
rest(3) = norm(b-A*x1);				% obliczenie normy residuum
plot(x,y(x),'r')

%wielomian 4 stopnia
A=[A,(A(:,2)).^4];
[x1, x2]=fit(A,b);					% dopasowanie funkcji
diff(4)=norm(x1-x2);
y = @(x) x1(1) + x1(2)*x + x1(3)*x.^2 + x1(4)*x.^3 + x1(5)*x.^4;
rest(4) = norm(b-A*x1);				% obliczenie normy residuum
plot(x,y(x),'k')

%legenda
hleg1 = legend('Punkty','liniowa', '2-go stopnia', '3-go stopnia', '4-go stopnia');
set(hleg1,'Location','SouthWest')
hold off
end