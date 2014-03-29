%znane: wwyb, TAU, y_odpskok

%S = y_skok(1:85);
%D = size(S, 1);


[y_dmc u_dmc J1 J2] = algorytmDMC(wwyb, TAU, 1, y_odpskok, 200, 300, 100, 20, 1);

rysuj(['DMC, d = 300, n = 100, nu = 20, lambda = 1'], y_dmc, u_dmc);


yzad = 1;

%======================================================================
%podpunkt B
%======================================================================
last_d = 300;
J1ahist = zeros(last_d, 1);
J2ahist = zeros(last_d, 1);
rejected = 0;

for d = last_d:-1:20
    [y_dmc u_dmc J1 J2] = algorytmDMC(wwyb, TAU, yzad, y_odpskok, 200, d, 100, 20, 1);
    J1ahist(d) = J1;
    J2ahist(d) = J2;
    if J1ahist(last_d) >= J1
        last_d = d;
        y_dmc_d = y_dmc;
        u_dmc_d = u_dmc;
    else
        rejected = rejected + 1;
    end
end
display(['Podpunkt b, odrzuconych wartoœci d: ', num2str(rejected)]);
D = last_d;
%[y_dmc u_dmc J1 J2] = algorytmDMC(wwyb, TAU, yzad, y_odpskok, 200, D, 100, 20, 1);
display(['Wybrany horyzont dynamiki: ', num2str(D)]);
display(['J1 = ', num2str(J1ahist(D)), ' J2 = ', num2str(J2ahist(D))]);


rysuj('J1(d) - na czerwono, J2(d) - na niebiesko', J1ahist, J2ahist);
rysuj(['DMC, d = ', num2str(D)], y_dmc_d, u_dmc_d);


%======================================================================
%podpunkt C
%======================================================================
last_n = 100;
J1bhist = zeros(last_n, 1);
J2bhist = zeros(last_n, 1);
rejected = 0;

for n = last_n:-1:10
    [y_dmc u_dmc J1 J2] = algorytmDMC(wwyb, TAU, yzad, y_odpskok, 200, D, n, 20, 1);
    J1bhist(n) = J1;
    J2bhist(n) = J2;

    if J1bhist(last_n) >= J1
        last_n = n;
        y_dmc_n = y_dmc;
        u_dmc_n = u_dmc;
    else
        rejected = rejected + 1;
    end
end
display(['Podpunkt c, odrzuconych wartoœci n: ', num2str(rejected)]);
N = last_n;
%[y_dmc u_dmc J1 J2] = algorytmDMC(wwyb, TAU, yzad, y_odpskok, 200, D, 100, 20, 1);
display(['Wybrany horyzont predykcji: ', num2str(N)]);
display(['J1 = ', num2str(J1bhist(N)), ' J2 = ', num2str(J2bhist(N))]);

rysuj('J1(n) - na czerwono, J2(n) - na niebiesko', J1bhist, J2bhist);
rysuj(['DMC, d = ', num2str(D), ' n = ', num2str(N)], y_dmc_n, u_dmc_n);



%======================================================================
%podpunkt D
%======================================================================
last_nu = 20;
J1chist = zeros(last_nu, 1);
J2chist = zeros(last_nu, 1);
rejected = 0;

for nu = last_nu:-1:1
    [y_dmc u_dmc J1 J2] = algorytmDMC(wwyb, TAU, yzad, y_odpskok, 200, D, N, nu, 1);
    J1chist(nu) = J1;
    J2chist(nu) = J2;
    if J1chist(last_nu) >= J1 
        last_nu = nu;
        y_dmc_nu = y_dmc;
        u_dmc_nu = u_dmc;
    else
        rejected = rejected + 1;
    end
end
display(['Podpunkt d, odrzuconych wartoœci nu: ', num2str(rejected)]);
Nu = last_nu;

display(['Wybrany horyzont sterowania: ', num2str(Nu)]);
display(['J1 = ', num2str(J1chist(Nu)), ' J2 = ', num2str(J2chist(Nu))]);

rysuj('J1(nu) - na czerwono, J2(nu) - na niebiesko', J1chist, J2chist);
rysuj(['DMC, d = ', num2str(D), ' n = ', num2str(N), ' nu = ', num2str(Nu)], y_dmc_nu, u_dmc_nu);


%======================================================================
%podpunkt E
%======================================================================
last_lambda = 30;
J1dhist = zeros(last_lambda, 1);
J2dhist = zeros(last_lambda, 1);
rejected = 0;
best_sat = 100;
for lambda = 1:last_lambda
    [y_dmc u_dmc J1 J2] = algorytmDMC(wwyb, TAU, yzad, y_odpskok, 200, D, N, Nu, lambda);
    J1dhist(lambda) = J1;
    J2dhist(lambda) = J2;
    satisfaction = 0.1 * J1 + 0.9 * J2;
    if best_sat >= satisfaction 
        last_lambda = lambda;
        best_sat = satisfaction;
        y_dmc_lambda = y_dmc;
        u_dmc_lambda = u_dmc;
    else
        rejected = rejected + 1;
    end
end
display(['Podpunkt e, odrzuconych wartoœci lambda: ', num2str(rejected)]);
Lambda = last_lambda;
%[y_dmc u_dmc J1 J2] = algorytmDMC(wwyb, TAU, yzad, y_odpskok, 200, D, 100, 20, 1);
display(['Wybrana lambda: ', num2str(Lambda)]);
display(['J1 = ', num2str(J1dhist(Lambda)), ' J2 = ', num2str(J2dhist(Lambda))]);

rysuj('J1(lambda) - na czerwono, J2(lambda) - na niebiesko', J1dhist, J2dhist);
rysuj(['DMC, d = ', num2str(D), ' n = ', num2str(N), ' nu = ', num2str(Nu), ' lambda = ', num2str(Lambda)], y_dmc_lambda, u_dmc_lambda);
