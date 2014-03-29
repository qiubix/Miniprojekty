function [ y ] = odpowiedzPID(Tau, w, K, T, Ti, Td, horyzont)

    t = 20;
    y = zeros(horyzont + 1, 1);
    u = zeros(horyzont, 1);
    y_zad = [zeros(t, 1); ones(horyzont - t, 1)];
    e = zeros(horyzont, 1);
    
    for i = Tau+2:horyzont
        e(i) = y_zad(i) - y(i);
        u(i) = pid_m(u(i-1),K, Ti, Td, T, e(i-2:i));
        y(i+1) = odpowiedzModelu(w, u(i-1-Tau:i-Tau), y(i-1:i));
    end
end

