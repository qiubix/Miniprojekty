function [x1 x2 x3 u] = przebieg(z1, z2, z3)

T_s = 0.25;
L_s = [1 8 7];
M_s = [1 11 -62 -720];
G_s = tf(L_s, M_s);
[L_z M_z] = c2dm(L_s, M_s, T_s, 'zoh');
[A1, B1, C1, D1] = tf2ss(L_z, M_z);
A = A1';
B = C1';
C = B1';
D = D1';

K = acker(A, B,[z1, z2, z3])
sim model2;
display('x1 x2 x3 u');
[x1 x2 x3 u];