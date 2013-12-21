%function rezultat = zad4a(A,B,C,D,T_s)
% zadanie 4a

display('Zadanie 4a');

kk = 100 * T_s;				% długość symulacji
z = 0;						% biegun poczatkowy
K = acker(A, B,[z, z, z]);	% wyliczenie wektora sprzężeń zwrotnych
sim model2;					% ładowanie modelu simulinka
max_u = max(abs(u));		% maksymalne sterowanie i maksymalny skok sterowania
max_du = abs(u(2) - u(1));
j1 = x1' * x1 + x2' * x2 + x3' * x3;	% błąd regulacji
j2 = u' * u;				%wydatek energetyczny
j1_all = j1;				% wektor wartości j1 i j2
j2_all = j2;
z_best = z;					% kandydaci na najlepsze wartości
j1_best = j1;
j2_best = j2;

for k = 1 : length(u) - 1
    du = abs(u(k+1) - u(k));
    if(du > max_du)
        max_du = du;
    end
end


z_max = 0.01 : 0.01 : 1;	% zakres poszukiwania bieguna

for z = z_max;
    K = acker(A, B,[z, z, z]);
    sim model2;
    j1 = x1' * x1 + x2' * x2 + x3' * x3;
    j2 = u' * u;

    
    j1_all = [j1_all j1];
    j2_all = [j2_all j2];
    
    if (j1 < j1_best(numel(j1_best))) || (j2 < j2_best(numel(j1_best))) || (max(abs(u)) < max_u(numel(max_u)))
        z_best = [z_best z];
        j1_best = [j1_best j1];
        j2_best = [j2_best j2];
        max_u = [max_u max(abs(u))];
        
        tmp = 0;
        for k = 1 : length(u) - 1
           du = abs(u(k+1) - u(k));
           if(du > tmp)
               tmp = du;
           end
        end
        max_du = [max_du tmp];
    end
end

display('Wyniki symulacji:');
display('    Biegun    J1        J2        Max_U     Max_dU');
rezulatat = [z_best' j1_best' j2_best' max_u' max_du']

z_max = [0 z_max];
figure;
semilogy(z_max, j1_all);
title('Zadanie 4a J1(z)');
figure;
semilogy(z_max, j2_all);
title('Zadanie 4a J2(z)');