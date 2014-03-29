%znane: wwyb, TAU, y_odpskok, D, N, Nu, Lambda

%S = y_skok(1:85);
%D = size(S, 1);

%function [ y, u, J1, J2 ] = algorytmDMC( w, tau, yzad, y_skok, horyzont, D, hor_p, hor_u, lambda )
yzad = 1;
alfa = 1.0;
dTau = 0;
w_mod = [wwyb(1)*alfa wwyb(2)*alfa wwyb(3) wwyb(4)];
tau_mod = TAU + dTau;
%[y_dmc u_dmc J1 J2] = algorytmDMC(w_mod, tau_mod, yzad, y_odpskok, 200, D, N, Nu, Lambda);

if false
    for alfa = 0.1:0.1:2.5
        w_mod = [wwyb(1)*alfa wwyb(2)*alfa wwyb(3) wwyb(4)];
        tau_mod = TAU + dTau;
        yzad = 1;
        [y_dmc u_dmc J1 J2] = algorytmDMC(w_mod, tau_mod, yzad, y_odpskok, 200, D, N, Nu, Lambda);
        rysuj(['DMC, d = ', num2str(D), ' n = ', num2str(N), ' nu = ', num2str(Nu), ' lambda = ', num2str(Lambda), ' alfa = ', num2str(alfa), ' dTau = ', num2str(dTau)],y_dmc, u_dmc);
    end
end

if true
    for dTau = -5:6
        w_mod = [wwyb(1)*alfa wwyb(2)*alfa wwyb(3) wwyb(4)];
        tau_mod = TAU + dTau;
        [y_dmc u_dmc J1 J2] = algorytmDMC(w_mod, tau_mod, yzad, y_odpskok, 200, D, N, Nu, Lambda);
		rysuj(['DMC, d = ', num2str(D), ' n = ', num2str(N), ' nu = ', num2str(Nu), ' lambda = ', num2str(Lambda), ' alfa = ', num2str(alfa), ' dTau = ', num2str(dTau)],y_dmc, u_dmc);
    end
end

alfa = 1.5;
dTau = 3;
w_mod = [wwyb(1)*alfa wwyb(2)*alfa wwyb(3) wwyb(4)];
tau_mod = TAU + dTau;
[y_dmc u_dmc J1 J2] = algorytmDMC(w_mod, tau_mod, yzad, y_odpskok, 200, D, N, Nu, Lambda);
%rysuj(['DMC, d = ', num2str(D), ' n = ', num2str(N), ' nu = ', num2str(Nu), ' lambda = ', num2str(Lambda), ' alfa = ', num2str(alfa), ' dTau = ', num2str(dTau)],y_dmc, u_dmc);
