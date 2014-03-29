function [x1 x2] = zad2k(m,qr)
%m (1..3) oznacza stopien wielomianu
%qr - (1) oznacza, ze z rozkladem qr, (x != 1) oznacza, ze bez
x = -5:5;
x=x';
y = [-5.8643; -6.7445; -5.2378; -3.2868; -2.2393; -0.5084; -1.2237; -0.7893; -4.8761; -11.0466; -20.0868];
m=m+1;
n = length(x); % liczba danych
A = zeros(m,m);
B = zeros(m,n);
p = zeros(m,1);
if m==2
for i = 1:n
A = A + [1 x(i); x(i) x(i)^2];
B(:,i) = [1; x(i)];
end
elseif m==3
for i = 1:n
A = A + [1 x(i) x(i)^2; x(i) x(i)^2 x(i)^3; x(i)^2 x(i)^3 x(i)^4];
B(:,i) = [1; x(i); x(i)^2];
end
elseif m==4
for i = 1:n
A = A + [1 x(i) x(i)^2 x(i)^3; x(i) x(i)^2 x(i)^3 x(i)^4; x(i)^2 x(i)^3 x(i)^4 x(i)^5; x(i)^3 x(i)^4 x(i)^5 x(i)^6];
B(:,i) = [1; x(i); x(i)^2; x(i)^3];
end
else
error('zly stopien wielomianu');
end
b = B*y;
if qr == 1 % liczenie a z rozkladu QR
[Q R] = QR_distribution(A);
b = Q' * b;
a = R\ b; %a = [a0; a1; a2; ...; a(m-1)];
else % liczenie a bez uzywania rozkladu QR
a = A\ b;
end
'Dla wielomianu a0 + a1*x + ... + a(m-1)*x^(m-1), wektor a = [a0, a1, ... , a(m-1)] ='
a
x2 = -5:0.1:5;

norma_residuum=norm(y - polyval(p,x))
%rysowanie wykresu
pl=plot(x2,polyval(p,x2));
hold on;
if m-1==1
  set(pl,'Color','red');
elseif m-1==2
  set(pl,'Color','green');
else
  set(pl,'Color','blue');
end
pl=plot(x,y,'m.');
