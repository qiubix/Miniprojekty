function [ y, u, J1, J2 ] = algorytmDMC( w, tau, yzad, y_skok, horyzont, D, hor_p, hor_u, lambda )


    S = y_skok(1:D);
    %lambda = 1;  
    %horyzont predykcji
    N = hor_p;
    %horyzont sterowania
    Nu = hor_u;
    u = zeros(horyzont, 1);
    y = zeros(horyzont, 1);
    J1 = 0;
    J2 = 0;
    t = 10;
    Yzad = [zeros(t, 1); ones(horyzont - t, 1) * yzad];
    %historia przyrostów 
    DUhist = zeros(horyzont, 1);
    %
    Lambda = eye(Nu) * lambda;
    MP = budujMP(S, N);
    M = budujM(S, N, Nu);
    
    K = (M' * M + Lambda)^(-1) * M';
    
    for k = tau+2:horyzont
        if k > D - 1
           DUP = DUhist(k-1:-1:k-D+1);
        else
           DUP = [DUhist(k-1:-1:1); zeros(D-k,1)]; 
        end
        
        Y0 = ones(N, 1) * y(k) + MP * DUP;
        
        if horyzont < k + N
           Yz = [Yzad(k:end); ones(N-(horyzont-k) - 1, 1) * Yzad(end)];
        else
           Yz = Yzad(k:k+N-1); 
        end
        
        DU = K*(Yz-Y0);
        %display(['Rozmiar M = ', num2str(size(M))]);
        %display(['Rozmiar MP = ', num2str(size(MP))]);
        %display(['Rozmiar Y0 = ', num2str(size(Y0))]);
        %display(['Rozmiar Yz = ', num2str(size(Yz))]);
        %display(['Rozmiar DU = ', num2str(size(DU))]);
        %display(['Rozmiar DU rêcznie = ', num2str(size(DU))]);
        %display(['Rozmiar DUP = ', num2str(size(DUP))]);
        DUhist(k) = DU(1);
        u(k) = u(k-1) + DU(1);
        y(k+1) = odpowiedzModelu(w, u(k-tau-1:k-tau), y(k-1:k));
        J1 = J1 + (Yzad(k) - y(k))^2;
        J2 = J2 + (u(k) - u(k-1))^2;
    end
end

