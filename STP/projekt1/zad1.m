function [L_z M_z] = zad1(L_s, M_s, T_s)
% zadanie 1

display('Transmitancja ciągła G(s):');
G_s = tf(L_s, M_s)

display('Transmitancja dyskretna G(z):');
[L_z M_z] = c2dm(L_s, M_s, T_s, 'zoh');
G_z = tf(L_z, M_z)

display('Zera G(s)');
x0_s = roots(L_s)

display('Zera G(z)');
x0_z = roots(L_z)

display('Bieguny G(s)');
xb_s = roots(M_s)

display('Bieguny G(z)');
xb_z = roots(M_z)

display('Wzmocnienie statyczne G(s)');
K_s = dcgain(G_s)

display('Wzmocnienie statyczne G(z)');
K_z = dcgain(G_z)