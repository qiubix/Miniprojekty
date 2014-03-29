function [x1 x2 er1 er2] = rkf45(fun, fun2, x1_0, x2_0, range)
% Metoda Rungego-Kutty-Fehlberga
% dwie funkcje, dwa punkty startowe i zakres, w ktorym ma obliczac
% np. @f1, @f2, 3, 4, 0:0.05:5

% pobieram rozmiar kroku
h = range(2)-range(1); 

% deklaracja tablic z wynikami
[x1, x2, er1, er2] = deal(zeros(1,length(range))); 

% punkty startowe
x1(1) = x1_0;
x2(1) = x2_0;

% obliczaj
for i=1:(length(range)-1)   
   [a b] = iter(x1(i), x2(i), h, fun, fun2);
   x1(i+1) = a;
   x2(i+1) = b;

   % oblicz bledy
   % dla kroku 1/2h
   [a b] = iter(x1(i), x2(i), h/2, fun, fun2);
   [a b] = iter(a, b, h/2, fun, fun2);
   er1(i) = x1(i+1) - a;
   er2(i) = x2(i+1) - b;
end
iteracje = length(range)
maxe1 = max(abs(er1))
maxe1 = max(abs(er2))
end

% oblicza metoda RK
function [x1 x2] = iter (x1s, x2s, h, fun, fun2)
	a2 = 1/4; b2 = 1/4; a3 = 3/8; b3 = 3/32; c3 = 9/32; a4 = 12/13;
	b4 = 1932/2197; c4 = -7200/2197; d4 = 7296/2197; a5 = 1;
	b5 = 439/216; c5 = -8; d5 = 3680/513; e5 = -845/4104; a6 = 1/2;
	b6 = -8/27; c6 = 2; d6 = -3544/2565; e6 = 1859/4104; f6 = -11/40;
	r1 = 1/360; r3 = -128/4275; r4 = -2197/75240; r5 = 1/50;
	r6 = 2/55; n1 = 25/216; n3 = 1408/2565; n4 = 2197/4104; n5 = -1/5;
    k_11 = fun(x1s,x2s);
    k_12 = fun2(x1s,x2s);
    k_21 = fun(x1s+0.5*h*k_11,x2s+0.5*h*k_12);
    k_22 = fun2(x1s+0.5*h*k_11,x2s+0.5*h*k_12);
    k_31 = fun((x1s+0.5*h*k_21),(x2s+0.5*h*k_22));
    k_32 = fun2((x1s+0.5*h*k_21),(x2s+0.5*h*k_22));
    k_41 = fun((x1s+h*k_31),(x2s+k_32*h));
    k_42 = fun2((x1s+h*k_31),(x2s+k_32*h));

    x1 = x1s + (1/6)*(k_11+2*k_21+2*k_31+k_41)*h;
    x2 = x2s + (1/6)*(k_12+2*k_22+2*k_32+k_42)*h; 
end