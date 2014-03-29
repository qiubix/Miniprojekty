function [x1, x2] = fit(A, b)
% uklad rownan normalnych
% bez rozkladu
x1 = (A'*A)^(-1) * A' * b;
% z rozkladem QR
[Q, R] = QR_distribution(A);
x2 = R ^ (-1) * Q' * b;
end