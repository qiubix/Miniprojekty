% Projekt 1 STP

% DANE:
T_s = 0.25;
L_s = [1 8 7];
M_s = [1 11 -62 -720];

% ZADANIE 1.
[L_z M_z] = zad1(L_s, M_s, T_s);

% ZADANIE 2.
[A B C D] = zad2(L_z, M_z);

% ZADANIE 4.
%zad4a(A,B,C,D,T_s);
zad4a
zad4b
zad4c

%zad4b(A,B,C,D,T_s);