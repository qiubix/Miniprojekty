function [ w ] = wyznacz_w(dane, Tau, rzad)


u = dane(:, 1);
y = dane(:, 2);

% Jeœli nie dodajemy zer to
% u = u(1:end-Tau);
% y = y(Tau + 1: end);

if rzad == 1
    %uh = [zeros(Tau - 1, 1); u(1:end-Tau + 1)];
    uh = u(1:end-Tau+1-1);
    yh = y(Tau:end-1);
    size(uh);
    size(yh);
    M = [uh yh];
    w = M \ y(Tau+1:end);
elseif rzad == 2
    %u1 = [zeros(Tau - 1, 1); u(1:end-Tau)];
    u1 = u(2:end-Tau-1);
    %u2 = [zeros(Tau, 1); u(1:end-Tau - 1)];
    u2 = u(1:end-Tau-2);
    uh = [u1 u2];
    y1 = y(Tau+2:end-1);
    y2 = y(Tau+1:end-2);
    yh = [y1, y2];
    M = [uh yh];
    w = M \ y(Tau+3:end);
else
    w = 0;
end
%w = inv(M'*M) * M' * yh;

end

