function [A2 B2 C2 D2] = zad2(L_z, M_z)
% zadanie 2

display('Metoda bezposrednia I:');
[A1, B1, C1, D1] = tf2ss(L_z, M_z)
display('Metoda bezposrednia II:');
A2 = A1'
B2 = C1'
C2 = B1'
D2 = D1'