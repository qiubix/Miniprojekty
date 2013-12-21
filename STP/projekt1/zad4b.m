%function zad4b(A,B,C,D,T_s)
% zadanie 4b

display('Zadanie 4b');

kk = 100 * T_s;
z = 0;
K = acker(A, B,[z, 0.0001, 0.0001]);
sim model2;
max_u = max(abs(u));
max_du = abs(u(2) - u(1));
j1 = x1' * x1 + x2' * x2 + x3' * x3;
j2 = u' * u;
j1_all = j1;
j2_all = j2;
z_best = z;
j1_best = j1;
j2_best = j2;

for k = 1 : length(u) - 1
    du = abs(u(k+1) - u(k));
    if(du > max_du)
        max_du = du;
    end
end

z_max = 0.01 : 0.01 : 1;

for z = z_max;
    K = acker(A, B,[z, 0.0001, 0.0001]);
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
title('Zadanie 4b J1(z)');
figure;
semilogy(z_max, j2_all);
title('Zadanie 4b J2(z)');